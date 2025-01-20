@interface CADPropertySearchPredicate(EKPredicateEvaluating)
- (uint64_t)ekPredicateEvaluateWithObject:()EKPredicateEvaluating;
@end

@implementation CADPropertySearchPredicate(EKPredicateEvaluating)

- (uint64_t)ekPredicateEvaluateWithObject:()EKPredicateEvaluating
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [a1 entityType];
  if (v5 != 101 && v5 != 3 && v5 != 2 || !objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_24;
  }
  v6 = [a1 calendarIDs];

  if (v6)
  {
    v7 = [v4 valueForKeyPath:@"calendar"];
    v8 = [v7 CADObjectID];

    v9 = [a1 calendarIDs];
    uint64_t v10 = [v9 containsObject:v8];
  }
  else
  {
    uint64_t v10 = 1;
  }
  v11 = [a1 sourceID];

  if (v11)
  {
    v12 = [v4 valueForKeyPath:@"calendar.source"];
    v13 = [v12 CADObjectID];
    v14 = [a1 sourceID];
    char v15 = [v13 isEqual:v14];

    if ((v15 & 1) == 0)
    {
LABEL_24:
      uint64_t v10 = 0;
      goto LABEL_25;
    }
  }
  else if (!v10)
  {
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v4 isMasterOrDetachedOccurrence]) {
    goto LABEL_24;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v16 = objc_msgSend(a1, "filters", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    while (2)
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        if (![*(id *)(*((void *)&v22 + 1) + 8 * v20) ekPredicateFilterMatches:v4])
        {
          uint64_t v10 = 0;
          goto LABEL_27;
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_27:

LABEL_25:
  return v10;
}

@end