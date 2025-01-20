@interface NSDictionary(_AX_HA_DEPENDENT_ENUMERATION_)
- (void)enumerateKeysAndObjectsInDependentOrderUsingBlock:()_AX_HA_DEPENDENT_ENUMERATION_;
@end

@implementation NSDictionary(_AX_HA_DEPENDENT_ENUMERATION_)

- (void)enumerateKeysAndObjectsInDependentOrderUsingBlock:()_AX_HA_DEPENDENT_ENUMERATION_
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = a3;
  v5 = [a1 allKeys];
  v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_150];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
      v13 = [a1 objectForKeyedSubscript:v12];
      unsigned __int8 v14 = 0;
      v4[2](v4, v12, v13, &v14);
      LODWORD(v12) = v14;

      if (v12) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

@end