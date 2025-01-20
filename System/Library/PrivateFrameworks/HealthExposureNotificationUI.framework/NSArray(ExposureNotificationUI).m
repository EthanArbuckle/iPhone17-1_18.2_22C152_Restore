@interface NSArray(ExposureNotificationUI)
- (id)enui_filter:()ExposureNotificationUI;
- (id)enui_map:()ExposureNotificationUI;
@end

@implementation NSArray(ExposureNotificationUI)

- (id)enui_map:()ExposureNotificationUI
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = a3;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = a1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = v5[2](v5, *(void *)(*((void *)&v15 + 1) + 8 * i));
          if (v12) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"NSArray+ExposureNotificationUI.m", 14, @"Invalid parameter not satisfying: %@", @"filter" object file lineNumber description];

    id v6 = (id)[a1 copy];
  }

  return v6;
}

- (id)enui_filter:()ExposureNotificationUI
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F08A98];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__NSArray_ExposureNotificationUI__enui_filter___block_invoke;
  v10[3] = &unk_264864B48;
  id v11 = v4;
  id v6 = v4;
  id v7 = [v5 predicateWithBlock:v10];
  uint64_t v8 = [a1 filteredArrayUsingPredicate:v7];

  return v8;
}

@end