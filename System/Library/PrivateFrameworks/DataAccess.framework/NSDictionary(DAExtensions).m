@interface NSDictionary(DAExtensions)
- (id)DAMergeOverrideDictionary:()DAExtensions;
- (id)DAObjectForKeyCaseInsensitive:()DAExtensions;
@end

@implementation NSDictionary(DAExtensions)

- (id)DAObjectForKeyCaseInsensitive:()DAExtensions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(a1, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (![v4 caseInsensitiveCompare:v10])
        {
          v11 = [a1 objectForKeyedSubscript:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)DAMergeOverrideDictionary:()DAExtensions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [v4 allKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v11 = [a1 objectForKeyedSubscript:v10];
        id v12 = [v4 objectForKeyedSubscript:v10];
        objc_opt_class();
        long long v13 = v12;
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          long long v13 = v12;
          if (objc_opt_isKindOfClass())
          {
            long long v13 = [v11 DAMergeOverrideDictionary:v12];
          }
        }
        [v5 setObject:v13 forKeyedSubscript:v10];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v5;
}

@end