@interface NSMutableDictionary(FBKSnakeCaseKeys)
- (void)replaceCamelCaseKeysWithSnakeCaseKeys;
@end

@implementation NSMutableDictionary(FBKSnakeCaseKeys)

- (void)replaceCamelCaseKeysWithSnakeCaseKeys
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFF980];
  v3 = [a1 allKeys];
  v4 = [v2 arrayWithArray:v3];

  v5 = [a1 allKeys];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = [v10 snakeCaseString];
          v12 = v11;
          if (v11 && ![v11 isEqualToString:v10])
          {
            v13 = [a1 objectForKeyedSubscript:v10];
            [a1 setObject:v13 forKeyedSubscript:v12];
          }
          else
          {
            [v4 removeObject:v10];
          }
        }
        else
        {
          [v4 removeObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  [a1 removeObjectsForKeys:v4];
}

@end