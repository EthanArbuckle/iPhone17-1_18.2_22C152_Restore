@interface CADCompoundFilter(EKPredicateEvaluating)
- (uint64_t)ekPredicateFilterMatches:()EKPredicateEvaluating;
@end

@implementation CADCompoundFilter(EKPredicateEvaluating)

- (uint64_t)ekPredicateFilterMatches:()EKPredicateEvaluating
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(a1, "filters", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) ekPredicateFilterMatches:v4];
        uint64_t v11 = [a1 operation];
        if (v10)
        {
          if (v11 == 1) {
            goto LABEL_13;
          }
        }
        else if (!v11)
        {
LABEL_13:

          goto LABEL_14;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v10 = [a1 operation] == 0;
LABEL_14:

  return v10;
}

@end