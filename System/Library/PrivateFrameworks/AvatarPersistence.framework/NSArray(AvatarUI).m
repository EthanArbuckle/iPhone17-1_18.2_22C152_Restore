@interface NSArray(AvatarUI)
- (id)avt_description;
- (id)avt_firstObjectPassingTest:()AvatarUI;
- (id)avt_map:()AvatarUI;
@end

@implementation NSArray(AvatarUI)

- (id)avt_description
{
  v1 = [a1 description];
  v2 = [v1 stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];

  return v2;
}

- (id)avt_map:()AvatarUI
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    uint64_t v10 = *MEMORY[0x263EFF498];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v13 = v4[2](v4, v12);
        if (!v13) {
          [MEMORY[0x263EFF940] raise:v10, @"Got nil transformed object for %@", v12 format];
        }
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];

  return v14;
}

- (id)avt_firstObjectPassingTest:()AvatarUI
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a1;
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

@end