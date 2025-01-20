@interface NSDictionary(AFCollectionUtilities)
- (id)_af_lenient:()AFCollectionUtilities map:;
- (uint64_t)af_lenientMappedDictionary:()AFCollectionUtilities;
- (uint64_t)af_mappedDictionary:()AFCollectionUtilities;
@end

@implementation NSDictionary(AFCollectionUtilities)

- (id)_af_lenient:()AFCollectionUtilities map:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v13 = objc_msgSend(v7, "objectForKeyedSubscript:", v12, (void)v17);
        v14 = v5[2](v5, v12, v13);

        if (v14) {
          [v6 setObject:v14 forKey:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v15 = (void *)[v6 copy];
  return v15;
}

- (uint64_t)af_lenientMappedDictionary:()AFCollectionUtilities
{
  return objc_msgSend(a1, "_af_lenient:map:", 1, a3);
}

- (uint64_t)af_mappedDictionary:()AFCollectionUtilities
{
  return objc_msgSend(a1, "_af_lenient:map:", 0, a3);
}

@end