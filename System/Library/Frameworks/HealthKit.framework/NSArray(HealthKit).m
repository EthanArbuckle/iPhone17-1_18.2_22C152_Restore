@interface NSArray(HealthKit)
+ (id)hk_arrayWithCount:()HealthKit generator:;
+ (uint64_t)_permutationHelperForArray:()HealthKit number:permutationHandler:;
- (BOOL)hk_allElementsUnique;
- (BOOL)hk_containsObjectPassingTest:()HealthKit;
- (double)hk_sumUsingEvaluationBlock:()HealthKit;
- (id)hk_averageUsingEvaluationBlock:()HealthKit;
- (id)hk_filter:()HealthKit;
- (id)hk_firstObjectPassingTest:()HealthKit;
- (id)hk_firstObjectWithMaximumValueUsingEvaluationBlock:()HealthKit;
- (id)hk_firstObjectWithMinimumValueUsingEvaluationBlock:()HealthKit;
- (id)hk_firstSortedObjectWithComparison:()HealthKit;
- (id)hk_foldRightFrom:()HealthKit with:;
- (id)hk_map:()HealthKit;
- (id)hk_map:()HealthKit error:;
- (id)hk_mapToDictionary:()HealthKit;
- (id)hk_mapToSet:()HealthKit;
- (id)hk_mutableSubarrayWithRange:()HealthKit;
- (id)hk_orPredicateWithPredicateBlock:()HealthKit;
- (id)hk_reversed;
- (id)hk_shuffled;
- (id)hk_splitWithBucketCount:()HealthKit;
- (uint64_t)_permutationsWithCount:()HealthKit permutation:depth:block:;
- (uint64_t)hk_allElementsEqual;
- (uint64_t)hk_allObjectsPassTest:()HealthKit;
- (uint64_t)hk_containsObjectsInArray:()HealthKit;
- (void)hk_enumeratePermutationsOfSubsetsOfLength:()HealthKit block:;
- (void)hk_enumeratePermutationsWithBlock:()HealthKit;
- (void)hk_partitionArrayWithPartitionSetupBlock:()HealthKit partitionMembershipCheckBlock:partitionExtendBlock:partitionFinalizeBlock:;
@end

@implementation NSArray(HealthKit)

- (id)hk_map:()HealthKit
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
    [v14 handleFailureInMethod:a2, a1, @"NSArray+HealthKit.m", 40, @"Invalid parameter not satisfying: %@", @"filter" object file lineNumber description];

    id v6 = (id)[a1 copy];
  }

  return v6;
}

- (id)hk_filter:()HealthKit
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F28F60];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__NSArray_HealthKit__hk_filter___block_invoke;
  v10[3] = &unk_1E58C34B0;
  id v11 = v4;
  id v6 = v4;
  id v7 = [v5 predicateWithBlock:v10];
  uint64_t v8 = [a1 filteredArrayUsingPredicate:v7];

  return v8;
}

- (id)hk_firstObjectPassingTest:()HealthKit
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"NSArray+HealthKit.m", 90, @"Invalid parameter not satisfying: %@", @"testHandler" object file lineNumber description];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a1;
  id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v5[2](v5, v10))
        {
          id v7 = v10;
          goto LABEL_13;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

+ (id)hk_arrayWithCount:()HealthKit generator:
{
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    if (a3 >= 1)
    {
      do
      {
        uint64_t v9 = (void *)MEMORY[0x19F395970]();
        uint64_t v10 = v7[2](v7);
        if (v10) {
          [v8 addObject:v10];
        }

        --a3;
      }
      while (a3);
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"NSArray+HealthKit.m", 21, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)hk_map:()HealthKit error:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = a1;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v22 = a4;
      id v12 = 0;
      uint64_t v13 = *(void *)v25;
      while (2)
      {
        uint64_t v14 = 0;
        long long v15 = v12;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * v14);
          id v23 = v15;
          long long v17 = v7[2](v7, v16, &v23);
          id v12 = v23;

          if (!v17)
          {
            id v18 = v12;
            id v12 = v18;
            if (v18)
            {
              if (v22) {
                void *v22 = v18;
              }
              else {
                _HKLogDroppedError(v18);
              }
            }

            id v19 = 0;
            goto LABEL_18;
          }
          [v8 addObject:v17];

          ++v14;
          long long v15 = v12;
        }
        while (v11 != v14);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v12 = 0;
    }

    id v19 = v8;
LABEL_18:
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"NSArray+HealthKit.m", 56, @"Invalid parameter not satisfying: %@", @"filter" object file lineNumber description];

    id v19 = (id)[a1 copy];
  }

  return v19;
}

- (id)hk_foldRightFrom:()HealthKit with:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__24;
  id v18 = __Block_byref_object_dispose__24;
  id v19 = (id)[v6 copy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__NSArray_HealthKit__hk_foldRightFrom_with___block_invoke;
  v11[3] = &unk_1E58C34D8;
  uint64_t v13 = &v14;
  id v8 = v7;
  id v12 = v8;
  [a1 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

- (BOOL)hk_containsObjectPassingTest:()HealthKit
{
  v1 = objc_msgSend(a1, "hk_firstObjectPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)hk_allObjectsPassTest:()HealthKit
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v9)))
        {
          uint64_t v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_11:

  return v10;
}

- (id)hk_averageUsingEvaluationBlock:()HealthKit
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = a1;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      double v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          double v9 = v9 + v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      double v9 = 0.0;
    }

    uint64_t v11 = objc_msgSend(NSNumber, "numberWithDouble:", v9 / (double)(unint64_t)objc_msgSend(v5, "count", (void)v13));
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (double)hk_sumUsingEvaluationBlock:()HealthKit
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v9 = v9 + v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * i));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (id)hk_firstObjectWithMaximumValueUsingEvaluationBlock:()HealthKit
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
    double v10 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v13 = v4[2](v4, v12);
        if (v13 > v10)
        {
          double v14 = v13;
          id v15 = v12;

          uint64_t v8 = v15;
          double v10 = v14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)hk_firstObjectWithMinimumValueUsingEvaluationBlock:()HealthKit
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
    double v10 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v13 = v4[2](v4, v12);
        if (v13 < v10)
        {
          double v14 = v13;
          id v15 = v12;

          uint64_t v8 = v15;
          double v10 = v14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
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
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
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

- (uint64_t)hk_containsObjectsInArray:()HealthKit
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithArray:v5];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:a1];
  uint64_t v8 = [v6 isSubsetOfSet:v7];

  return v8;
}

- (BOOL)hk_allElementsUnique
{
  BOOL v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:a1];
  uint64_t v3 = [v2 count];
  BOOL v4 = v3 == [a1 count];

  return v4;
}

- (uint64_t)hk_allElementsEqual
{
  if (![a1 count]) {
    return 1;
  }
  BOOL v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:a1];
  BOOL v3 = [v2 count] == 1;

  return v3;
}

- (void)hk_partitionArrayWithPartitionSetupBlock:()HealthKit partitionMembershipCheckBlock:partitionExtendBlock:partitionFinalizeBlock:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([a1 count])
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    char v22 = 1;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __137__NSArray_HealthKit__hk_partitionArrayWithPartitionSetupBlock_partitionMembershipCheckBlock_partitionExtendBlock_partitionFinalizeBlock___block_invoke;
    v15[3] = &unk_1E58C3500;
    long long v20 = v21;
    id v16 = v10;
    id v17 = v11;
    long long v14 = (void (**)(void))v13;
    id v18 = v14;
    id v19 = v12;
    [a1 enumerateObjectsUsingBlock:v15];
    v14[2](v14);

    _Block_object_dispose(v21, 8);
  }
}

- (id)hk_orPredicateWithPredicateBlock:()HealthKit
{
  v1 = (void *)MEMORY[0x1E4F28BA0];
  BOOL v2 = objc_msgSend(a1, "hk_map:");
  BOOL v3 = [v1 orPredicateWithSubpredicates:v2];

  return v3;
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
          v15[2] = __41__NSArray_HealthKit__hk_mapToDictionary___block_invoke;
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
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"NSArray+HealthKit.m", 228, @"Invalid parameter not satisfying: %@", @"map" object file lineNumber description];

    id v6 = (id)objc_opt_new();
  }

  return v6;
}

- (id)hk_mapToSet:()HealthKit
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
          id v12 = v5[2](v5, *(void *)(*((void *)&v15 + 1) + 8 * i));
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
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"NSArray+HealthKit.m", 245, @"Invalid parameter not satisfying: %@", @"filter" object file lineNumber description];

    id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:a1];
  }

  return v6;
}

- (void)hk_enumeratePermutationsWithBlock:()HealthKit
{
  id v5 = a3;
  if (v5)
  {
    if ([a1 count])
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v7 = objc_opt_class();
      uint64_t v8 = (void *)[a1 mutableCopy];
      uint64_t v9 = [a1 count];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __56__NSArray_HealthKit__hk_enumeratePermutationsWithBlock___block_invoke;
      v12[3] = &unk_1E58C3528;
      id v13 = v6;
      id v14 = v5;
      id v10 = v6;
      [v7 _permutationHelperForArray:v8 number:v9 permutationHandler:v12];
    }
    else
    {
      char v15 = 0;
      (*((void (**)(id, void *, char *))v5 + 2))(v5, a1, &v15);
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSArray+HealthKit.m", 260, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
}

- (id)hk_reversed
{
  v1 = [a1 reverseObjectEnumerator];
  BOOL v2 = [v1 allObjects];

  return v2;
}

- (id)hk_shuffled
{
  v1 = (void *)[a1 mutableCopy];
  objc_msgSend(v1, "hk_shuffle");
  BOOL v2 = (void *)[v1 copy];

  return v2;
}

+ (uint64_t)_permutationHelperForArray:()HealthKit number:permutationHandler:
{
  id v8 = a3;
  uint64_t v9 = a5;
  if (a4 == 1)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v8];
    uint64_t v11 = v9[2](v9, v10);
  }
  else if (a4 < 2)
  {
LABEL_10:
    uint64_t v11 = [a1 _permutationHelperForArray:v8 number:a4 - 1 permutationHandler:v9];
  }
  else
  {
    uint64_t v12 = 0;
    while ([a1 _permutationHelperForArray:v8 number:a4 - 1 permutationHandler:v9])
    {
      if (a4) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v12;
      }
      [v8 exchangeObjectAtIndex:v13 withObjectAtIndex:a4 - 1];
      if (a4 - 1 == ++v12) {
        goto LABEL_10;
      }
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)hk_enumeratePermutationsOfSubsetsOfLength:()HealthKit block:
{
  id v7 = a4;
  if (v7)
  {
    if ([a1 count] < a3)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, a1, @"NSArray+HealthKit.m", 320, @"Invalid parameter not satisfying: %@", @"count <= self.count" object file lineNumber description];
    }
    if ([a1 count] >= a3)
    {
      if ([a1 count])
      {
        if (a3)
        {
          id v8 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:a3];
          [a1 _permutationsWithCount:a3 permutation:v8 depth:0 block:v7];
        }
        else
        {
          char v11 = 0;
          v7[2](v7, MEMORY[0x1E4F1CBF0], &v11);
        }
      }
      else
      {
        char v12 = 0;
        ((void (**)(id, void *, char *))v7)[2](v7, a1, &v12);
      }
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"NSArray+HealthKit.m", 315, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
}

- (uint64_t)_permutationsWithCount:()HealthKit permutation:depth:block:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  char v11 = a6;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = a1;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    uint64_t v16 = a5 + 1;
    while (2)
    {
      uint64_t v17 = 0;
      uint64_t v29 = v14;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * v17);
        if (([v10 containsObject:v18] & 1) == 0)
        {
          [v10 setObject:v18 atIndexedSubscript:a5];
          if (v16 >= a3)
          {
            char v30 = 0;
            id v19 = objc_alloc(MEMORY[0x1E4F1C978]);
            [v10 array];
            uint64_t v20 = v15;
            uint64_t v21 = a5;
            uint64_t v22 = v16;
            id v23 = v12;
            v25 = uint64_t v24 = a3;
            long long v26 = (void *)[v19 initWithArray:v25];
            v11[2](v11, v26, &v30);

            a3 = v24;
            id v12 = v23;
            uint64_t v16 = v22;
            a5 = v21;
            uint64_t v15 = v20;
            uint64_t v14 = v29;
            if (v30)
            {
LABEL_15:
              uint64_t v27 = 0;
              goto LABEL_16;
            }
          }
          else if (![v12 _permutationsWithCount:a3 permutation:v10 depth:v16 block:v11])
          {
            goto LABEL_15;
          }
          [v10 removeObjectAtIndex:a5];
        }
        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  uint64_t v27 = 1;
LABEL_16:

  return v27;
}

- (id)hk_mutableSubarrayWithRange:()HealthKit
{
  uint64_t v4 = a4;
  for (uint64_t i = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4]; v4; --v4)
  {
    id v8 = [a1 objectAtIndexedSubscript:a3];
    [i addObject:v8];

    ++a3;
  }

  return i;
}

- (id)hk_splitWithBucketCount:()HealthKit
{
  uint64_t v3 = a3;
  if (a3 <= 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"NSArray+HealthKit.m", 380, @"Invalid parameter not satisfying: %@", @"count > 0" object file lineNumber description];
  }
  unint64_t v5 = [a1 count];
  unint64_t v6 = [a1 count];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
  if (v3 >= 1)
  {
    unint64_t v8 = 0;
    uint64_t v9 = v6 % v3;
    uint64_t v10 = MEMORY[0x1E4F1CBF0];
    unint64_t v11 = v5 / v3;
    do
    {
      if (v9 <= 0) {
        unint64_t v12 = v11;
      }
      else {
        unint64_t v12 = v11 + 1;
      }
      if (v8 < [a1 count] && v12)
      {
        uint64_t v13 = objc_msgSend(a1, "subarrayWithRange:", v8, v12);
        [v7 addObject:v13];
      }
      else
      {
        [v7 addObject:v10];
      }
      v9 -= v9 > 0;
      v8 += v12;
      --v3;
    }
    while (v3);
  }

  return v7;
}

@end