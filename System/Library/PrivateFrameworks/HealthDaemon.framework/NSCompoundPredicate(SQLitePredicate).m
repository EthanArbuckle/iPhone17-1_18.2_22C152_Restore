@interface NSCompoundPredicate(SQLitePredicate)
- (id)hd_sqlPredicateForSelect;
@end

@implementation NSCompoundPredicate(SQLitePredicate)

- (id)hd_sqlPredicateForSelect
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [a1 subpredicates];
  v3 = (void *)[v2 count];

  if (v3)
  {
    uint64_t v4 = [a1 compoundPredicateType];
    if (!v4)
    {
      v14 = (void *)MEMORY[0x1E4F65D08];
      v15 = [a1 subpredicates];
      v16 = [v15 objectAtIndexedSubscript:0];
      v3 = [v14 negatedPredicate:v16];

      goto LABEL_19;
    }
    uint64_t v5 = v4;
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v7 = objc_msgSend(a1, "subpredicates", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "hd_sqlPredicateForSelect");
          if (v12) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    if (v5 == 2)
    {
      uint64_t v13 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v6];
      goto LABEL_17;
    }
    if (v5 == 1)
    {
      uint64_t v13 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v6];
LABEL_17:
      v3 = (void *)v13;

      goto LABEL_19;
    }

    v3 = 0;
  }
LABEL_19:

  return v3;
}

@end