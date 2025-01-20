@interface NSSet(CRKAdditions)
+ (id)crk_setByCopyingObjectsFromArray:()CRKAdditions;
- (id)crk_filterUsingBlock:()CRKAdditions;
- (id)crk_flatMapUsingBlock:()CRKAdditions;
- (id)crk_mapUsingBlock:()CRKAdditions;
- (id)crk_naturallySortedArray;
- (id)crk_setByRemovingObject:()CRKAdditions;
- (id)crk_stableDescription;
- (id)setByCombiningWithSet:()CRKAdditions operation:;
- (uint64_t)crk_allObjectsMatchPredicate:()CRKAdditions;
- (uint64_t)crk_containsObjectMatchingPredicate:()CRKAdditions;
- (uint64_t)crk_setByAddingSet:()CRKAdditions;
- (uint64_t)crk_setByIntersectingSet:()CRKAdditions;
- (uint64_t)crk_setBySubtractingSet:()CRKAdditions;
@end

@implementation NSSet(CRKAdditions)

- (id)crk_stableDescription
{
  v1 = [a1 allObjects];
  v2 = [v1 valueForKey:@"description"];

  v3 = [v2 sortedArrayUsingSelector:sel_compare_];
  v4 = NSString;
  v5 = [v3 componentsJoinedByString:@", "];
  v6 = [v4 stringWithFormat:@"{ %@ }", v5];

  return v6;
}

- (id)crk_naturallySortedArray
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"self" ascending:1];
  v6[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  v4 = [a1 sortedArrayUsingDescriptors:v3];

  return v4;
}

- (uint64_t)crk_setBySubtractingSet:()CRKAdditions
{
  return [a1 setByCombiningWithSet:a3 operation:sel_minusSet_];
}

- (uint64_t)crk_setByAddingSet:()CRKAdditions
{
  return [a1 setByCombiningWithSet:a3 operation:sel_unionSet_];
}

- (uint64_t)crk_setByIntersectingSet:()CRKAdditions
{
  return [a1 setByCombiningWithSet:a3 operation:sel_intersectSet_];
}

- (id)crk_setByRemovingObject:()CRKAdditions
{
  id v4 = a3;
  if (v4 && ([a1 containsObject:v4] & 1) != 0)
  {
    v5 = [MEMORY[0x263EFFA08] setWithObject:v4];
    v6 = objc_msgSend(a1, "crk_setBySubtractingSet:", v5);
  }
  else
  {
    v6 = (void *)[a1 copy];
  }

  return v6;
}

- (id)crk_mapUsingBlock:()CRKAdditions
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v5 = a3;
  if (!v5)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"NSSet+CRKAdditions.m", 48, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v6 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = v5[2](v5, *(void *)(*((void *)&v16 + 1) + 8 * i));
        if (v12) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  v13 = (void *)[v6 copy];

  return v13;
}

- (id)crk_flatMapUsingBlock:()CRKAdditions
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
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
        uint64_t v10 = v9;
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

- (id)crk_filterUsingBlock:()CRKAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__NSSet_CRKAdditions__crk_filterUsingBlock___block_invoke;
  v8[3] = &unk_2646F45A8;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = objc_msgSend(a1, "crk_mapUsingBlock:", v8);

  return v6;
}

- (uint64_t)crk_containsObjectMatchingPredicate:()CRKAdditions
{
  id v4 = a3;
  id v5 = [a1 objectEnumerator];
  uint64_t v6 = objc_msgSend(v5, "crk_containsObjectMatchingPredicate:", v4);

  return v6;
}

- (uint64_t)crk_allObjectsMatchPredicate:()CRKAdditions
{
  id v4 = a3;
  id v5 = [a1 objectEnumerator];
  uint64_t v6 = objc_msgSend(v5, "crk_allObjectsMatchPredicate:", v4);

  return v6;
}

+ (id)crk_setByCopyingObjectsFromArray:()CRKAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v11 = (void *)[v10 copy];
          [v4 addObject:v11];
        }
        else
        {
          objc_msgSend(v4, "addObject:", v10, (void)v14);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v12 = (void *)[v4 copy];

  return v12;
}

- (id)setByCombiningWithSet:()CRKAdditions operation:
{
  id v6 = a3;
  uint64_t v7 = (void *)[a1 mutableCopy];
  ((void (*)(void *, uint64_t, id))[v7 methodForSelector:a4])(v7, a4, v6);

  uint64_t v8 = [(id)objc_opt_class() setWithSet:v7];

  return v8;
}

@end