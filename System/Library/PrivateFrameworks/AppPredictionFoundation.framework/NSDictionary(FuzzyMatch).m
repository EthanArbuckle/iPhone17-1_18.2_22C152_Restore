@interface NSDictionary(FuzzyMatch)
- (uint64_t)atx_isFuzzyMatch:()FuzzyMatch;
@end

@implementation NSDictionary(FuzzyMatch)

- (uint64_t)atx_isFuzzyMatch:()FuzzyMatch
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (a1 == v5)
    {
      uint64_t v16 = 1;
    }
    else
    {
      uint64_t v6 = [a1 count];
      if (v6 == [v5 count])
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v7 = a1;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v19;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              v13 = objc_msgSend(v7, "objectForKey:", v12, (void)v18);
              v14 = [v5 objectForKey:v12];
              int v15 = objc_msgSend(v13, "atx_isFuzzyMatch:", v14);

              if (!v15)
              {
                uint64_t v16 = 0;
                goto LABEL_17;
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
        uint64_t v16 = 1;
LABEL_17:
      }
      else
      {
        uint64_t v16 = 0;
      }
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

@end