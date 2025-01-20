@interface NSArray(DEDEnumerable)
- (id)ded_findWithBlock:()DEDEnumerable;
- (id)ded_mapWithBlock:()DEDEnumerable;
- (id)ded_rejectItemsPassingTest:()DEDEnumerable;
- (id)ded_selectItemsPassingTest:()DEDEnumerable;
@end

@implementation NSArray(DEDEnumerable)

- (id)ded_mapWithBlock:()DEDEnumerable
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __43__NSArray_DEDEnumerable__ded_mapWithBlock___block_invoke;
  v13 = &unk_26453B500;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v6, v10, v11, v12, v13);

  return v8;
}

- (id)ded_selectItemsPassingTest:()DEDEnumerable
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
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

  v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];

  return v12;
}

- (id)ded_rejectItemsPassingTest:()DEDEnumerable
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
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
        if ((v4[2](v4, v11) & 1) == 0) {
          objc_msgSend(v5, "addObject:", v11, (void)v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];

  return v12;
}

- (id)ded_findWithBlock:()DEDEnumerable
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__NSArray_DEDEnumerable__ded_findWithBlock___block_invoke;
  v9[3] = &unk_26453B528;
  id v5 = v4;
  id v10 = v5;
  uint64_t v6 = [a1 indexOfObjectPassingTest:v9];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [a1 objectAtIndex:v6];
  }

  return v7;
}

@end