@interface NSArray(CATAdditions)
+ (id)cat_arrayFromIndexSet:()CATAdditions;
- (id)cat_flatMapUsingBlock:()CATAdditions;
- (id)cat_map:()CATAdditions;
- (void)cat_forEach:()CATAdditions;
@end

@implementation NSArray(CATAdditions)

- (id)cat_map:()CATAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v11) {
          objc_msgSend(v5, "addObject:", v11, (void)v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];

  return v12;
}

- (void)cat_forEach:()CATAdditions
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)cat_flatMapUsingBlock:()CATAdditions
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v5 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = a1;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = v4[2](v4, *(void *)(*((void *)&v24 + 1) + 8 * i));
        long long v10 = v9;
        if (v9)
        {
          if (([v9 conformsToProtocol:&unk_26C4C17F0] & 1) == 0) {
            [v5 addObject:v10];
          }
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v21 != v14) {
                  objc_enumerationMutation(v11);
                }
                [v5 addObject:*(void *)(*((void *)&v20 + 1) + 8 * j)];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v13);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  long long v16 = (void *)[v5 copy];

  return v16;
}

+ (id)cat_arrayFromIndexSet:()CATAdditions
{
  v3 = (objc_class *)MEMORY[0x263EFF980];
  id v4 = a3;
  id v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__NSArray_CATAdditions__cat_arrayFromIndexSet___block_invoke;
  v9[3] = &unk_2641DC6B0;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateIndexesUsingBlock:v9];

  uint64_t v7 = (void *)[v6 copy];

  return v7;
}

@end