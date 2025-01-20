@interface NSObject(DeepMutable)
- (id)deepMutableObject;
@end

@implementation NSObject(DeepMutable)

- (id)deepMutableObject
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v3 = a1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = [*(id *)(*((void *)&v21 + 1) + 8 * i) deepMutableObject];
          [v2 addObject:v8];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v5);
    }
LABEL_18:

    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v3 = a1;
    uint64_t v9 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v3);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * j);
          v14 = objc_msgSend(v3, "objectForKey:", v13, (void)v17);
          v15 = [v14 deepMutableObject];
          [v2 setObject:v15 forKey:v13];
        }
        uint64_t v10 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v10);
    }
    goto LABEL_18;
  }
  id v2 = a1;
LABEL_20:

  return v2;
}

@end