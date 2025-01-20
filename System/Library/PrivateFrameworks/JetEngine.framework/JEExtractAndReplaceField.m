@interface JEExtractAndReplaceField
+ (id)metricsAfterExtractAndReplaceSubFieldWithConfig:(id)a3 metrics:(id)a4;
@end

@implementation JEExtractAndReplaceField

+ (id)metricsAfterExtractAndReplaceSubFieldWithConfig:(id)a3 metrics:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKey:@"extractFromLists"];
  v26 = [v5 objectForKey:@"replacementField"];
  v8 = [v5 objectForKey:@"subFieldToExtract"];
  v27 = v5;
  v35 = [v5 objectForKey:@"replacementIndexSubField"];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  v30 = v6;
  id v31 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v7;
  uint64_t v32 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v32)
  {
    uint64_t v29 = *(void *)v41;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = *(void *)(*((void *)&v40 + 1) + 8 * v10);
        uint64_t v34 = v10;
        v11 = objc_msgSend(v30, "objectForKey:");
        v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v37 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              v19 = [v18 objectForKey:v8];
              if (v19)
              {
                v20 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v18];
                if ([v9 containsObject:v19])
                {
                  v21 = (void *)MEMORY[0x1E4F28ED0];
                  uint64_t v22 = [v9 indexOfObject:v19];
                }
                else
                {
                  [v9 addObject:v19];
                  v21 = (void *)MEMORY[0x1E4F28ED0];
                  uint64_t v22 = [v9 count] - 1;
                }
                v23 = [v21 numberWithInteger:v22];
                [v20 setObject:v23 forKey:v35];

                [v20 removeObjectForKey:v8];
                [v12 addObject:v20];
              }
              else
              {
                [v12 addObject:v18];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v15);
        }

        [v31 setObject:v12 forKey:v33];
        uint64_t v10 = v34 + 1;
      }
      while (v34 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v32);
  }

  if ([v9 count])
  {
    v24 = [v9 array];
    [v31 setObject:v24 forKey:v26];
  }
  return v31;
}

@end