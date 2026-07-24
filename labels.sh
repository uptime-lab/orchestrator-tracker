#!/usr/bin/env bash
# Create/refresh labels for the tracker repo. Requires: gh (authenticated, with repo access).
# Usage: REPO=uptime-lab/orchestrator-tracker ./labels.sh
set -euo pipefail
REPO="${REPO:-uptime-lab/orchestrator-tracker}"

create() { # name color description
  gh label create "$1" --color "$2" --description "$3" --repo "$REPO" --force
}

# Type
create "bug"             "d73a4a" "Something isn't working"
create "feature-request" "a2eeef" "New feature or request"
create "enhancement"     "84b6eb" "Improvement to existing behavior"
create "question"        "d876e3" "Further information is requested"
create "documentation"   "0075ca" "Docs and guides"

# Triage / status
create "needs-triage"    "ededed" "Not yet reviewed by maintainers"
create "under-review"    "fbca04" "Being evaluated"
create "planned"         "0e8a16" "Accepted and planned"
create "in-progress"     "1d76db" "Actively being worked on"
create "shipped"         "5319e7" "Released"
create "roadmap"         "c5def5" "On the public roadmap"

# Resolution
create "duplicate"       "cfd3d7" "Already reported"
create "wontfix"         "ffffff" "Will not be worked on"
create "needs-info"      "f9d0c4" "Waiting for reporter"

echo "Labels created/updated for $REPO"
