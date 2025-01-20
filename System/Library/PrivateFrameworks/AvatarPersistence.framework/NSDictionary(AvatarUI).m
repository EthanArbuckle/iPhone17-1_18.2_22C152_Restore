@interface NSDictionary(AvatarUI)
+ (id)_avtui_dictionaryByIndexingObjectsInArray:()AvatarUI by:;
- (id)_avtui_deepCopy;
@end

@implementation NSDictionary(AvatarUI)

- (id)_avtui_deepCopy
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__NSDictionary_AvatarUI___avtui_deepCopy__block_invoke;
  v6[3] = &unk_2647C3718;
  id v7 = v2;
  id v3 = v2;
  [a1 enumerateKeysAndObjectsUsingBlock:v6];
  v4 = (void *)[v3 copy];

  return v4;
}

+ (id)_avtui_dictionaryByIndexingObjectsInArray:()AvatarUI by:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = a4;
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    uint64_t v11 = *MEMORY[0x263EFF498];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v14 = v6[2](v6, v13);
        if (!v14) {
          [MEMORY[0x263EFF940] raise:v11, @"Nil key provided for %@", v13 format];
        }
        v15 = [v7 objectForKeyedSubscript:v14];

        if (v15) {
          [MEMORY[0x263EFF940] raise:v11, @"Already have an object for %@", v14 format];
        }
        [v7 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  v16 = (void *)[v7 copy];

  return v16;
}

@end