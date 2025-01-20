@interface NSArray(BLTNSNullRemoval)
- (id)objectWithNSNulls:()BLTNSNullRemoval;
- (id)objectWithNoNSNulls:()BLTNSNullRemoval;
- (uint64_t)objectSentinelNull;
@end

@implementation NSArray(BLTNSNullRemoval)

- (id)objectWithNoNSNulls:()BLTNSNullRemoval
{
  if (a3)
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    *a3 = v5;
  }
  else
  {
    id v5 = 0;
  }
  v6 = [MEMORY[0x263EFF980] array];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __49__NSArray_BLTNSNullRemoval__objectWithNoNSNulls___block_invoke;
  v16 = &unk_2646858A8;
  id v7 = v6;
  id v17 = v7;
  id v8 = v5;
  id v18 = v8;
  [a1 enumerateObjectsUsingBlock:&v13];
  uint64_t v9 = objc_msgSend(v8, "count", v13, v14, v15, v16);
  if (a3 && !v9) {
    *a3 = 0;
  }
  v10 = v18;
  id v11 = v7;

  return v11;
}

- (id)objectWithNSNulls:()BLTNSNullRemoval
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = a1;
  if ([v4 count])
  {
    id v6 = (id)[v5 mutableCopy];

    id v7 = [v4 allKeys];
    id v8 = [MEMORY[0x263EFF980] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(obj);
          }
          objc_msgSend(v8, "insertObject:atIndex:", *(void *)(*((void *)&v31 + 1) + 8 * i), objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", *(void *)(*((void *)&v31 + 1) + 8 * i), 0, objc_msgSend(v8, "count"), 1024, &__block_literal_global_18));
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v10);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v25 = v8;
    uint64_t v13 = [v25 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v25);
          }
          id v17 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          id v18 = [v4 objectForKeyedSubscript:v17];
          uint64_t v19 = [v17 integerValue];
          v20 = [v18 objectSentinelNull];
          if (v20)
          {
            [v6 insertObject:v20 atIndex:v19];
          }
          else
          {
            [v6 objectAtIndexedSubscript:v19];
            v22 = id v21 = v4;
            v23 = [v22 objectWithNSNulls:v18];
            [v6 setObject:v23 atIndexedSubscript:v19];

            id v4 = v21;
          }
        }
        uint64_t v14 = [v25 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

- (uint64_t)objectSentinelNull
{
  return 0;
}

@end