@interface NSDictionary(NSNull)
- (id)dictionaryDroppingNSNullValues;
@end

@implementation NSDictionary(NSNull)

- (id)dictionaryDroppingNSNullValues
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (void *)[a1 mutableCopy];
  v3 = [v2 allKeys];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v9 = [a1 objectForKeyedSubscript:v8];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v2 setObject:0 forKeyedSubscript:v8];
          goto LABEL_15;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 arrayDroppingNSNullValues];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v10 = [v9 setDroppingNSNullValues];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_15;
            }
            uint64_t v10 = [v9 dictionaryDroppingNSNullValues];
          }
        }
        v11 = (void *)v10;
        [v2 setObject:v10 forKeyedSubscript:v8];

LABEL_15:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

@end