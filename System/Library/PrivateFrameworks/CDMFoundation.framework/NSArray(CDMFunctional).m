@interface NSArray(CDMFunctional)
- (id)_cdm_filterWithBlock:()CDMFunctional;
- (id)_cdm_mapWithBlock:()CDMFunctional;
@end

@implementation NSArray(CDMFunctional)

- (id)_cdm_mapWithBlock:()CDMFunctional
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = a3;
  uint64_t v5 = [a1 count];
  if (v4 && v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a1, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = a1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
          if (v12) {
            objc_msgSend(v6, "addObject:", v12, (void)v14);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v6 = [MEMORY[0x263EFF8C0] array];
  }

  return v6;
}

- (id)_cdm_filterWithBlock:()CDMFunctional
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = a3;
  uint64_t v5 = [a1 count];
  if (v4 && v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a1, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = a1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (v4[2](v4, v12)) {
            objc_msgSend(v6, "addObject:", v12, (void)v14);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v6 = [MEMORY[0x263EFF8C0] array];
  }

  return v6;
}

@end