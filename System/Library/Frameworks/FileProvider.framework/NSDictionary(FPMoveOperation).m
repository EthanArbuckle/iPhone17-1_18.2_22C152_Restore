@interface NSDictionary(FPMoveOperation)
- (id)fp_copyItemKeysAndValuesUnwrappedAndKeyMap:()FPMoveOperation;
- (id)fp_copyItemKeysUnwrappedAndKeyMap:()FPMoveOperation;
@end

@implementation NSDictionary(FPMoveOperation)

- (id)fp_copyItemKeysUnwrappedAndKeyMap:()FPMoveOperation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "underlyingObject", (void)v17);
        if (v4)
        {
          v13 = [v4 objectForKeyedSubscript:v12];

          if (v13)
          {
            uint64_t v14 = [v4 objectForKeyedSubscript:v12];

            v12 = (void *)v14;
          }
        }
        v15 = [v6 objectForKeyedSubscript:v11];
        [v5 setObject:v15 forKeyedSubscript:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)fp_copyItemKeysAndValuesUnwrappedAndKeyMap:()FPMoveOperation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "underlyingObject", (void)v18);
        if (v4)
        {
          v13 = [v4 objectForKeyedSubscript:v12];

          if (v13)
          {
            uint64_t v14 = [v4 objectForKeyedSubscript:v12];

            v12 = (void *)v14;
          }
        }
        v15 = [v6 objectForKeyedSubscript:v11];
        v16 = [v15 underlyingObject];
        [v5 setObject:v16 forKeyedSubscript:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

@end