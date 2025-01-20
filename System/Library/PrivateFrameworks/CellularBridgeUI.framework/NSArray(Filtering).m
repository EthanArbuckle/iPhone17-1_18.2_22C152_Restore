@interface NSArray(Filtering)
- (BOOL)hasObjectPassingTest:()Filtering;
- (id)firstObjectPassingTest:()Filtering;
- (id)max:()Filtering;
- (id)nph_map:()Filtering;
- (id)objectsPassingTest:()Filtering;
@end

@implementation NSArray(Filtering)

- (id)max:()Filtering
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = a3;
  if ([a1 count])
  {
    v5 = [a1 objectAtIndexedSubscript:0];
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
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (v4[2](v4, v11, v5))
          {
            id v12 = v11;

            v5 = v12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasObjectPassingTest:()Filtering
{
  v1 = objc_msgSend(a1, "firstObjectPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)firstObjectPassingTest:()Filtering
{
  v1 = objc_msgSend(a1, "objectsPassingTest:");
  BOOL v2 = [v1 firstObject];

  return v2;
}

- (id)objectsPassingTest:()Filtering
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F08A98];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__NSArray_Filtering__objectsPassingTest___block_invoke;
  v10[3] = &unk_264C53C30;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 predicateWithBlock:v10];
  uint64_t v8 = [a1 filteredArrayUsingPredicate:v7];

  return v8;
}

- (id)nph_map:()Filtering
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
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
        id v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v11) {
          objc_msgSend(v5, "addObject:", v11, (void)v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = (void *)[v5 copy];
  return v12;
}

@end