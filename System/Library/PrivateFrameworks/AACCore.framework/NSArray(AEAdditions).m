@interface NSArray(AEAdditions)
- (id)ae_adding:()AEAdditions;
- (id)ae_addingItems:()AEAdditions;
- (id)ae_filter:()AEAdditions;
- (id)ae_firstMatching:()AEAdditions;
- (id)ae_map:()AEAdditions;
- (id)ae_poppingFirstItem:()AEAdditions;
- (id)ae_split:()AEAdditions includeBlock:;
- (void)ae_forEach:()AEAdditions;
@end

@implementation NSArray(AEAdditions)

- (id)ae_map:()AEAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = a3;
  v5 = objc_opt_new();
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

- (id)ae_filter:()AEAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = a3;
  v5 = objc_opt_new();
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
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
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

- (id)ae_adding:()AEAdditions
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 addObject:v4];

  id v6 = (void *)[v5 copy];
  return v6;
}

- (id)ae_poppingFirstItem:()AEAdditions
{
  if ([a1 count])
  {
    v5 = [a1 objectAtIndexedSubscript:0];
    id v6 = (void *)[a1 mutableCopy];
    [v6 removeObjectAtIndex:0];
    id v7 = v5;
    *a3 = v7;
    id v8 = (id)[v6 copy];
  }
  else
  {
    id v8 = a1;
  }
  return v8;
}

- (id)ae_addingItems:()AEAdditions
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 addObjectsFromArray:v4];

  id v6 = (void *)[v5 copy];
  return v6;
}

- (id)ae_split:()AEAdditions includeBlock:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_opt_new();
  id v8 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = a1;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (v6[2](v6, v14)) {
          long long v15 = v8;
        }
        else {
          long long v15 = v7;
        }
        objc_msgSend(v15, "addObject:", v14, (void)v18);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  *a3 = (id)[v8 copy];
  long long v16 = (void *)[v7 copy];

  return v16;
}

- (void)ae_forEach:()AEAdditions
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
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

- (id)ae_firstMatching:()AEAdditions
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__NSArray_AEAdditions__ae_firstMatching___block_invoke;
  v9[3] = &unk_264EA3610;
  id v5 = v4;
  id v10 = v5;
  uint64_t v6 = [a1 indexOfObjectPassingTest:v9];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [a1 objectAtIndexedSubscript:v6];
  }

  return v7;
}

@end