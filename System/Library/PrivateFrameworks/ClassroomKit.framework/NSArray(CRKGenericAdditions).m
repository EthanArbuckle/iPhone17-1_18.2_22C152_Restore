@interface NSArray(CRKGenericAdditions)
- (BOOL)crk_isSortedByComparator:()CRKGenericAdditions;
- (id)crk_arrayByRemovingFirstObject;
- (id)crk_arrayByRemovingObject:()CRKGenericAdditions;
- (id)crk_arrayByRemovingObjectsInArray:()CRKGenericAdditions;
- (id)crk_dictionaryUsingKeyGenerator:()CRKGenericAdditions valueGenerator:;
- (id)crk_filterUsingBlock:()CRKGenericAdditions;
- (id)crk_firstMatching:()CRKGenericAdditions;
- (id)crk_flatMapUsingBlock:()CRKGenericAdditions;
- (id)crk_mapToSetUsingBlock:()CRKGenericAdditions;
- (id)crk_mapUsingBlock:()CRKGenericAdditions;
- (id)crk_optionalObjectAtIndex:()CRKGenericAdditions;
- (id)crk_partitionUsingKeyGenerator:()CRKGenericAdditions valueGenerator:;
- (id)crk_sortedArrayForRange:()CRKGenericAdditions usingComparator:;
- (id)crk_sortedSubarrayWithRange:()CRKGenericAdditions comparator:;
- (uint64_t)crk_allObjectsMatchPredicate:()CRKGenericAdditions;
- (uint64_t)crk_containsObjectMatchingPredicate:()CRKGenericAdditions;
- (uint64_t)crk_startsWith:()CRKGenericAdditions;
@end

@implementation NSArray(CRKGenericAdditions)

- (id)crk_firstMatching:()CRKGenericAdditions
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
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
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

- (id)crk_filterUsingBlock:()CRKGenericAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v5 = objc_opt_new();
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

  long long v12 = (void *)[v5 copy];

  return v12;
}

- (id)crk_mapUsingBlock:()CRKGenericAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v5 = objc_opt_new();
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
        uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v11) {
          objc_msgSend(v5, "addObject:", v11, (void)v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v12 = (void *)[v5 copy];

  return v12;
}

- (id)crk_flatMapUsingBlock:()CRKGenericAdditions
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
        v10 = v9;
        if (v9)
        {
          if (([v9 conformsToProtocol:&unk_26D82A118] & 1) == 0) {
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

- (id)crk_mapToSetUsingBlock:()CRKGenericAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = a3;
  if ([a1 count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", (unint64_t)((double)(unint64_t)objc_msgSend(a1, "count") * 1.5));
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

    uint64_t v12 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }

  return v12;
}

- (uint64_t)crk_containsObjectMatchingPredicate:()CRKGenericAdditions
{
  id v4 = a3;
  id v5 = [a1 objectEnumerator];
  uint64_t v6 = objc_msgSend(v5, "crk_containsObjectMatchingPredicate:", v4);

  return v6;
}

- (uint64_t)crk_allObjectsMatchPredicate:()CRKGenericAdditions
{
  id v4 = a3;
  id v5 = [a1 objectEnumerator];
  uint64_t v6 = objc_msgSend(v5, "crk_allObjectsMatchPredicate:", v4);

  return v6;
}

- (id)crk_arrayByRemovingFirstObject
{
  v1 = (void *)[a1 mutableCopy];
  [v1 removeObjectAtIndex:0];
  v2 = (void *)[v1 copy];

  return v2;
}

- (id)crk_arrayByRemovingObject:()CRKGenericAdditions
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)[a1 mutableCopy];
    [v5 removeObject:v4];
    uint64_t v6 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v6 = (void *)[a1 copy];
  }

  return v6;
}

- (id)crk_arrayByRemovingObjectsInArray:()CRKGenericAdditions
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 removeObjectsInArray:v4];

  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

- (BOOL)crk_isSortedByComparator:()CRKGenericAdditions
{
  id v4 = a3;
  if ((unint64_t)[a1 count] >= 2 && (unint64_t)objc_msgSend(a1, "count") >= 2)
  {
    unint64_t v7 = 1;
    do
    {
      uint64_t v8 = [a1 objectAtIndexedSubscript:v7 - 1];
      uint64_t v9 = [a1 objectAtIndexedSubscript:v7];
      uint64_t v10 = v4[2](v4, v8, v9);

      BOOL v5 = v10 != 1;
      if (v10 == 1) {
        break;
      }
      ++v7;
    }
    while (v7 < [a1 count]);
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)crk_sortedArrayForRange:()CRKGenericAdditions usingComparator:
{
  id v9 = a5;
  if (a3 + a4 > (unint64_t)[a1 count])
  {
    long long v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"NSArray+CRKAdditions.m" lineNumber:133 description:@"Cannot sort subarray that extends beyond the size of the original array"];
  }
  uint64_t v10 = objc_msgSend(a1, "crk_sortedSubarrayWithRange:comparator:", a3, a4, v9);
  id v11 = (void *)[a1 mutableCopy];
  objc_msgSend(v11, "replaceObjectsInRange:withObjectsFromArray:", a3, a4, v10);
  uint64_t v12 = (void *)[v11 copy];

  return v12;
}

- (id)crk_dictionaryUsingKeyGenerator:()CRKGenericAdditions valueGenerator:
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v6 = a3;
  unint64_t v7 = a4;
  uint64_t v8 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = a1;
  uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v6)
        {
          v6[2](v6, *(void *)(*((void *)&v21 + 1) + 8 * i));
          id v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v14 = v13;
        }
        long long v15 = v14;
        if (v7)
        {
          v7[2](v7, v13);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v16 = v13;
        }
        long long v17 = v16;
        [v8 setObject:v16 forKeyedSubscript:v15];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  v18 = (void *)[v8 copy];

  return v18;
}

- (id)crk_sortedSubarrayWithRange:()CRKGenericAdditions comparator:
{
  unint64_t v9 = a3 + a4;
  id v10 = a5;
  if (v9 > [a1 count])
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"NSArray+CRKAdditions.m" lineNumber:159 description:@"Cannot sort subarray that extends beyond the size of the original array"];
  }
  uint64_t v11 = [MEMORY[0x263EFF980] arrayWithCapacity:a4];
  objc_msgSend(v11, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, a1, a3, a4);
  [v11 sortUsingComparator:v10];

  uint64_t v12 = (void *)[v11 copy];

  return v12;
}

- (id)crk_partitionUsingKeyGenerator:()CRKGenericAdditions valueGenerator:
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (a3) {
    BOOL v5 = a3;
  }
  else {
    BOOL v5 = &__block_literal_global_22;
  }
  id v6 = a4;
  v29 = (void (**)(void, void))MEMORY[0x22A620AF0](v5);
  if (v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = &__block_literal_global_10;
  }
  uint64_t v8 = (void (**)(void, void))MEMORY[0x22A620AF0](v7);

  unint64_t v9 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = a1;
  uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        long long v15 = v29[2](v29, v14);
        id v16 = v8[2](v8, v14);
        long long v17 = [v9 objectForKeyedSubscript:v15];
        if (!v17)
        {
          long long v17 = objc_opt_new();
          [v9 setObject:v17 forKeyedSubscript:v15];
        }
        [v17 addObject:v16];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v11);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v18 = [v9 allKeys];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * j);
        long long v24 = [v9 objectForKeyedSubscript:v23];
        long long v25 = (void *)[v24 copy];
        [v9 setObject:v25 forKeyedSubscript:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v20);
  }

  uint64_t v26 = (void *)[v9 copy];

  return v26;
}

- (uint64_t)crk_startsWith:()CRKGenericAdditions
{
  id v4 = a3;
  unint64_t v5 = [v4 count];
  if (v5 <= [a1 count])
  {
    if ([v4 count])
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [a1 objectAtIndexedSubscript:v7];
        unint64_t v9 = [v4 objectAtIndexedSubscript:v7];
        uint64_t v6 = [v8 isEqual:v9];

        if ((v6 & 1) == 0) {
          break;
        }
        ++v7;
      }
      while (v7 < [v4 count]);
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)crk_optionalObjectAtIndex:()CRKGenericAdditions
{
  if ([a1 count] <= a3)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [a1 objectAtIndexedSubscript:a3];
  }

  return v5;
}

@end