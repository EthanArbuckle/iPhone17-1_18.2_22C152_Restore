@interface NSArray(ImageCaptureCoreAdditions)
- (uint64_t)copyGroupIntoDictionary:()ImageCaptureCoreAdditions;
@end

@implementation NSArray(ImageCaptureCoreAdditions)

- (uint64_t)copyGroupIntoDictionary:()ImageCaptureCoreAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"ICUtilities.m", 457, @"Invalid parameter not satisfying: %@", @"keyFromObjectCallback" object file lineNumber description];
  }
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = a1;
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
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v13 = v5[2](v5, v12);
        if (v13)
        {
          v14 = [v6 objectForKeyedSubscript:v13];
          if (!v14)
          {
            v14 = [MEMORY[0x1E4F1CA48] array];
            [v6 setObject:v14 forKeyedSubscript:v13];
          }
          [v14 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  uint64_t v15 = [v6 copy];
  return v15;
}

@end