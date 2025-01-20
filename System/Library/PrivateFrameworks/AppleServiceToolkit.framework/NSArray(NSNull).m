@interface NSArray(NSNull)
- (id)arrayDroppingNSNullValues;
@end

@implementation NSArray(NSNull)

- (id)arrayDroppingNSNullValues
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v9 = [v8 arrayDroppingNSNullValues];
LABEL_13:
            v10 = (void *)v9;
            objc_msgSend(v2, "addObject:", v9, (void)v13);

            goto LABEL_14;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v9 = [v8 setDroppingNSNullValues];
            goto LABEL_13;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v9 = [v8 dictionaryDroppingNSNullValues];
            goto LABEL_13;
          }
          objc_msgSend(v2, "addObject:", v8, (void)v13);
        }
LABEL_14:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v11 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v5 = v11;
    }
    while (v11);
  }

  return v2;
}

@end