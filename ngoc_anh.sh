#!/bin/bash

# Initialize a new Git repository (if needed)
# Uncomment the following lines if you are starting fresh
# mkdir commit-dates-repo
# cd commit-dates-repo
# git init

# Ensure there's a file to commit
if [ ! -f "dummy.txt" ]; then
    echo "Initial content" > dummy.txt
    git add dummy.txt
    git commit -m "Initial commit"
fi

# List of dates (as provided)
dates=(
"2024-01-08" "2024-01-15" "2024-01-22" "2024-01-29" "2024-02-05"  # Chữ T
    "2024-01-23" "2024-01-24" "2024-01-25" "2024-01-26" "2024-01-27" 

    "2024-02-19" "2024-02-26" "2024-03-04" "2024-03-12" "2024-03-13"  # Chữ R
    "2024-02-20" "2024-02-21" "2024-02-22" "2024-02-23" "2024-02-24"
    "2024-03-15" "2024-03-16" "2024-02-29" "2024-03-07"

    "2024-03-25" "2024-03-26" "2024-03-27" "2024-03-28" "2024-03-29"  # Chữ U
    "2024-04-06" "2024-04-13"
    "2024-04-15" "2024-04-16" "2024-04-17" "2024-04-18" "2024-04-19" 

    "2024-05-06" "2024-05-13" "2024-05-11" "2024-05-18"  # Chữ O
    "2024-04-30" "2024-05-01" "2024-05-02" "2024-05-03"
    "2024-05-21" "2024-05-22" "2024-05-23" "2024-05-24"

    "2024-06-03" "2024-06-04" "2024-06-05" "2024-06-06" "2024-06-07" "2024-06-08" # Chữ N
    "2024-06-24" "2024-06-25" "2024-06-26" "2024-06-27" "2024-06-28" "2024-06-29"
    "2024-06-11" "2024-06-19"
    
    "2024-07-09" "2024-07-10" "2024-07-11" "2024-07-12"  # Chữ G
    "2024-07-30" "2024-08-01" "2024-08-02" "2024-07-25"
    "2024-07-15" "2024-07-22" "2024-07-20" "2024-07-27"
)

# Sort dates to ensure chronological order
sorted_dates=($(for date in "${dates[@]}"; do echo "$date"; done | sort))

# Counter for unique commit messages
counter=1

# Loop through each date and create a commit
for date in "${sorted_dates[@]}"; do
    # Append some content to the file (to make a change for the commit)
    echo "Change on $date (commit $counter)" >> dummy.txt

    # Stage the file
    git add dummy.txt

    # Set the author and committer dates for the commit
    export GIT_AUTHOR_DATE="$date 12:00:00"
    export GIT_COMMITTER_DATE="$date 12:00:00"

    # Create the commit
    git commit -m "Commit on $date (change $counter)"

    # Increment the counter
    ((counter++))
done

# Unset the environment variables
unset GIT_AUTHOR_DATE
unset GIT_COMMITTER_DATE

# Optional: Push to a remote repository (uncomment if needed)
# git remote add origin <your-repo-url>
# git push origin main

echo "Commits created successfully!"
