#!/bin/bash

# Check if the input file is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

# Initialize variables to keep track of the current Elf's Calories and the maximum Calories
current_elf_calories=0
max_calories=0

# Read the input file line by line
while IFS= read -r line; do
    # Check if the line is empty, indicating a new Elf's inventory
    if [ -z "$line" ]; then
        # Compare the current Elf's Calories to the maximum Calories
        if [ "$current_elf_calories" -gt "$max_calories" ]; then
            max_calories="$current_elf_calories"
        fi
        current_elf_calories=0
    else
        # Add the Calories from the current line to the current Elf's total Calories
        current_elf_calories=$((current_elf_calories + line))
    fi
done < "$1"

# Check the last Elf's Calories (there's no empty line after the last entry)
if [ "$current_elf_calories" -gt "$max_calories" ]; then
    max_calories="$current_elf_calories"
fi

# Print the maximum Calories carried by an Elf
echo "The Elf carrying the most Calories is carrying $max_calories Calories."

