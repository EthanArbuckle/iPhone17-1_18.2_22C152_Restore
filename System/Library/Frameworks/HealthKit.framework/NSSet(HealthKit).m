@interface NSSet(HealthKit)
+ (id)hk_setByUnioningSet:()HealthKit otherSet:;
+ (uint64_t)hk_typesForArrayOf:()HealthKit;
+ (uint64_t)hk_typesForDictionaryMapping:()HealthKit to:;
+ (uint64_t)hk_typesForSetOf:()HealthKit;
- (id)hk_anyObjectPassingTest:()HealthKit;
- (id)hk_filter:()HealthKit;
- (id)hk_firstSortedObjectWithComparison:()HealthKit;
- (id)hk_intersection:()HealthKit;
- (id)hk_map:()HealthKit;
- (id)hk_mapToDictionary:()HealthKit;
- (id)hk_minus:()HealthKit;
- (id)hk_symmetricDifference:()HealthKit;
- (uint64_t)hk_allObjectsPassTestWithError:()HealthKit test:;
- (uint64_t)hk_containsObjectPassingTest:()HealthKit;
@end

@implementation NSSet(HealthKit)

+ (id)hk_setByUnioningSet:()HealthKit otherSet:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v8 = v7;
  if (v5) {
    [v7 unionSet:v5];
  }
  if (v6) {
    [v8 unionSet:v6];
  }
  v9 = (void *)[v8 copy];

  return v9;
}

- (id)hk_map:()HealthKit
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
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
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"NSSet+HealthKit.m", 31, @"Invalid parameter not satisfying: %@", @"filter" object file lineNumber description];

    id v6 = (id)[a1 copy];
  }

  return v6;
}

- (id)hk_filter:()HealthKit
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28F60];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __30__NSSet_HealthKit__hk_filter___block_invoke;
  v10[3] = &unk_1E58C34B0;
  id v11 = v4;
  id v6 = v4;
  id v7 = [v5 predicateWithBlock:v10];
  uint64_t v8 = [a1 filteredSetUsingPredicate:v7];

  return v8;
}

- (id)hk_minus:()HealthKit
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 minusSet:v4];

  return v5;
}

- (id)hk_intersection:()HealthKit
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 intersectSet:v4];

  return v5;
}

- (id)hk_symmetricDifference:()HealthKit
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 unionSet:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__NSSet_HealthKit__hk_symmetricDifference___block_invoke;
  v9[3] = &unk_1E58C6838;
  v9[4] = a1;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "hk_filter:", v9);

  return v7;
}

- (id)hk_firstSortedObjectWithComparison:()HealthKit
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v8)
        {
          if (v4[2](v4, v8, *(void *)(*((void *)&v14 + 1) + 8 * i)) == 1)
          {
            id v12 = v11;

            id v8 = v12;
          }
        }
        else
        {
          id v8 = v11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)hk_anyObjectPassingTest:()HealthKit
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
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

- (id)hk_mapToDictionary:()HealthKit
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = a1;
    uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __39__NSSet_HealthKit__hk_mapToDictionary___block_invoke;
          v15[3] = &unk_1E58BEC28;
          id v16 = v6;
          v5[2](v5, v11, v15);
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }
  else
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"NSSet+HealthKit.m", 102, @"Invalid parameter not satisfying: %@", @"map" object file lineNumber description];

    id v6 = (id)MEMORY[0x1E4F1CC08];
  }

  return v6;
}

- (uint64_t)hk_containsObjectPassingTest:()HealthKit
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * i)))
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (uint64_t)hk_allObjectsPassTestWithError:()HealthKit test:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      uint64_t v12 = 0;
      long long v13 = v10;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
        id v19 = v13;
        uint64_t v15 = v6[2](v6, v14, &v19);
        id v10 = v19;

        if ((v15 & 1) == 0)
        {
          id v16 = v10;
          long long v17 = v16;
          if (v16)
          {
            if (a3) {
              *a3 = v16;
            }
            else {
              _HKLogDroppedError(v16);
            }
          }

          goto LABEL_16;
        }
        ++v12;
        long long v13 = v10;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
LABEL_16:
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

+ (uint64_t)hk_typesForArrayOf:()HealthKit
{
  return objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), a3, 0);
}

+ (uint64_t)hk_typesForSetOf:()HealthKit
{
  return objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), a3, 0);
}

+ (uint64_t)hk_typesForDictionaryMapping:()HealthKit to:
{
  return objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), a3, a4, 0);
}

@end