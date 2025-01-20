@interface NSArray(EmailFoundationAdditions)
- (BOOL)ef_all:()EmailFoundationAdditions;
- (BOOL)ef_any:()EmailFoundationAdditions;
- (BOOL)ef_isEmpty;
- (id)ef_arrayByAddingAbsentObjectsFromArray:()EmailFoundationAdditions;
- (id)ef_compactMap:()EmailFoundationAdditions;
- (id)ef_compactMapItemsInRange:()EmailFoundationAdditions usingTransform:;
- (id)ef_compactMapSelector:()EmailFoundationAdditions;
- (id)ef_filter:()EmailFoundationAdditions;
- (id)ef_firstObjectPassingTest:()EmailFoundationAdditions;
- (id)ef_flatMap:()EmailFoundationAdditions;
- (id)ef_flatten;
- (id)ef_groupBy:()EmailFoundationAdditions;
- (id)ef_groupByObject:()EmailFoundationAdditions;
- (id)ef_groupByObject:()EmailFoundationAdditions keyOptions:valueOptions:;
- (id)ef_indicesOfStringsWithPrefix:()EmailFoundationAdditions;
- (id)ef_lastObjectPassingTest:()EmailFoundationAdditions;
- (id)ef_longestCommonPrefix;
- (id)ef_map:()EmailFoundationAdditions;
- (id)ef_mapSelector:()EmailFoundationAdditions;
- (id)ef_max;
- (id)ef_mean;
- (id)ef_median;
- (id)ef_min;
- (id)ef_mode;
- (id)ef_notEmpty;
- (id)ef_objectSameAs:()EmailFoundationAdditions usingComparator:;
- (id)ef_objectsPassingTest:()EmailFoundationAdditions;
- (id)ef_partition:()EmailFoundationAdditions;
- (id)ef_permutations;
- (id)ef_reduce:()EmailFoundationAdditions;
- (id)ef_reverse;
- (id)ef_shortDescriptionStringWithLimit:()EmailFoundationAdditions;
- (id)ef_standardDeviation;
- (id)ef_subarraysOfSize:()EmailFoundationAdditions;
- (id)ef_suffix:()EmailFoundationAdditions;
- (id)ef_sum;
- (id)ef_tail;
- (id)ef_uniquifyWithComparator:()EmailFoundationAdditions;
- (uint64_t)ef_countObjectsPassingTest:()EmailFoundationAdditions;
- (uint64_t)ef_enumerateObjectsInBatchesOfSize:()EmailFoundationAdditions block:;
- (uint64_t)ef_indexOfObject:()EmailFoundationAdditions usingComparator:;
- (uint64_t)ef_indexOfObject:()EmailFoundationAdditions usingSortFunction:context:;
- (uint64_t)ef_indexWhereObjectWouldBeInserted:()EmailFoundationAdditions usingComparator:;
- (uint64_t)ef_prefix:()EmailFoundationAdditions;
- (uint64_t)ef_shortDescriptionString;
- (void)ef_enumerateObjectsInBatchesOfSize:()EmailFoundationAdditions objectArrayBlock:;
- (void)ef_enumerateObjectsInBatchesOfSize:()EmailFoundationAdditions overlapBy:block:;
@end

@implementation NSArray(EmailFoundationAdditions)

- (id)ef_map:()EmailFoundationAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  v6 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1BA9A5240](v8);
        v14 = v5[2](v5, v12);
        v15 = v14;
        if (!v14)
        {
          v3 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v17);
          v15 = v3;
        }
        objc_msgSend(v6, "addObject:", v15, (void)v17);
        if (!v14) {

        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v9 = v8;
    }
    while (v8);
  }

  return v6;
}

- (id)ef_firstObjectPassingTest:()EmailFoundationAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
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

- (BOOL)ef_any:()EmailFoundationAdditions
{
  v1 = objc_msgSend(a1, "ef_firstObjectPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)ef_prefix:()EmailFoundationAdditions
{
  unint64_t v5 = [a1 count];
  if (v5 >= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = v5;
  }
  return objc_msgSend(a1, "subarrayWithRange:", 0, v6);
}

- (id)ef_filter:()EmailFoundationAdditions
{
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1BA9A5240]();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__NSArray_EmailFoundationAdditions__ef_filter___block_invoke;
  v10[3] = &unk_1E61224B0;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = [a1 indexesOfObjectsPassingTest:v10];

  uint64_t v8 = [a1 objectsAtIndexes:v7];

  return v8;
}

- (id)ef_mapSelector:()EmailFoundationAdditions
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__NSArray_EmailFoundationAdditions__ef_mapSelector___block_invoke;
  v5[3] = &__block_descriptor_40_e8__16__0_8l;
  v5[4] = a3;
  v3 = objc_msgSend(a1, "ef_map:", v5);
  return v3;
}

- (void)ef_enumerateObjectsInBatchesOfSize:()EmailFoundationAdditions overlapBy:block:
{
  uint64_t v9 = a5;
  uint64_t v10 = a3 - a4;
  if (a3 <= a4)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:a1 file:@"EFNSArrayAdditions.m" lineNumber:111 description:@"Overlap must be smaller than batch size"];
  }
  unint64_t v11 = [a1 count];
  if (v11)
  {
    uint64_t v12 = 0;
    BOOL v18 = 0;
    do
    {
      if (v11 >= a3) {
        unint64_t v13 = a3;
      }
      else {
        unint64_t v13 = v11;
      }
      long long v14 = objc_msgSend(a1, "subarrayWithRange:", v12, v13);
      v9[2](v9, v14, &v18);
      if (v18)
      {
        BOOL v15 = 1;
      }
      else
      {
        BOOL v15 = v11 < a3;
        BOOL v18 = v11 < a3;
      }
      if (v15) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = v10;
      }

      if (v18) {
        break;
      }
      v12 += v16;
      v11 -= v16;
    }
    while (v11);
  }
}

- (id)ef_reduce:()EmailFoundationAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [a1 firstObject];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = objc_msgSend(a1, "ef_tail", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v5;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        unint64_t v5 = v4[2](v4, v10, *(void *)(*((void *)&v12 + 1) + 8 * v9));

        ++v9;
        uint64_t v10 = v5;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)ef_tail
{
  if ((unint64_t)[a1 count] >= 2)
  {
    BOOL v2 = objc_msgSend(a1, "subarrayWithRange:", 1, objc_msgSend(a1, "count") - 1);
  }
  else
  {
    BOOL v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

- (uint64_t)ef_indexWhereObjectWouldBeInserted:()EmailFoundationAdditions usingComparator:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(a1, "count"), 1536, v7);

  return v8;
}

- (uint64_t)ef_enumerateObjectsInBatchesOfSize:()EmailFoundationAdditions block:
{
  return objc_msgSend(a1, "ef_enumerateObjectsInBatchesOfSize:overlapBy:block:", a3, 0, a4);
}

- (BOOL)ef_isEmpty
{
  return [a1 count] == 0;
}

- (id)ef_compactMapSelector:()EmailFoundationAdditions
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__NSArray_EmailFoundationAdditions__ef_compactMapSelector___block_invoke;
  v5[3] = &__block_descriptor_40_e8__16__0_8l;
  v5[4] = a3;
  v3 = objc_msgSend(a1, "ef_compactMap:", v5);
  return v3;
}

- (id)ef_compactMap:()EmailFoundationAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        long long v12 = (void *)MEMORY[0x1BA9A5240](v7);
        long long v13 = v4[2](v4, v11);
        if (v13) {
          objc_msgSend(v5, "addObject:", v13, (void)v15);
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }

  return v5;
}

- (BOOL)ef_all:()EmailFoundationAdditions
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__NSArray_EmailFoundationAdditions__ef_all___block_invoke;
  v9[3] = &unk_1E6122488;
  id v10 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "ef_firstObjectPassingTest:", v9);
  BOOL v7 = v6 == 0;

  return v7;
}

- (id)ef_flatMap:()EmailFoundationAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        long long v12 = (void *)MEMORY[0x1BA9A5240](v7);
        long long v13 = v4[2](v4, v11);
        if (v13)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v5, "addObjectsFromArray:", v13, (void)v15);
          }
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }

  return v5;
}

- (id)ef_flatten
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = objc_msgSend(v7, "ef_flatten");
          [v2 addObjectsFromArray:v8];
        }
        else
        {
          objc_msgSend(v2, "addObject:", v7, (void)v10);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return v2;
}

- (id)ef_partition:()EmailFoundationAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
          long long v12 = v5;
        }
        else {
          long long v12 = v6;
        }
        objc_msgSend(v12, "addObject:", v11, (void)v15);
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  long long v13 = +[EFPair pairWithFirst:v5 second:v6];

  return v13;
}

- (uint64_t)ef_countObjectsPassingTest:()EmailFoundationAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a1;
  uint64_t v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v6 += v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v6;
}

- (id)ef_groupBy:()EmailFoundationAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = a1;
  uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v10 = (void *)MEMORY[0x1BA9A5240]();
        long long v11 = v4[2](v4, v9);
        if (v11)
        {
          long long v12 = [v5 objectForKeyedSubscript:v11];
          if (!v12)
          {
            long long v12 = [MEMORY[0x1E4F1CA48] array];
            [v5 setObject:v12 forKeyedSubscript:v11];
          }
          [v12 addObject:v9];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v5;
}

- (id)ef_notEmpty
{
  if ([a1 count]) {
    BOOL v2 = a1;
  }
  else {
    BOOL v2 = 0;
  }
  return v2;
}

- (id)ef_suffix:()EmailFoundationAdditions
{
  if ([a1 count] <= a3)
  {
    id v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", objc_msgSend(a1, "count") - a3, a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)ef_arrayByAddingAbsentObjectsFromArray:()EmailFoundationAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "ef_addObjectIfAbsentAccordingToEquals:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)ef_indicesOfStringsWithPrefix:()EmailFoundationAdditions
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E60] indexSet];
  for (unint64_t i = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(a1, "count"), 1280, &__block_literal_global_6_0); i < objc_msgSend(a1, "count"); ++i)
  {
    uint64_t v7 = [a1 objectAtIndexedSubscript:i];
    int v8 = [v7 hasPrefix:v4];

    if (!v8) {
      break;
    }
    [v5 addIndex:i];
  }

  return v5;
}

- (void)ef_enumerateObjectsInBatchesOfSize:()EmailFoundationAdditions objectArrayBlock:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = [a1 count];
  if (v7)
  {
    int v8 = v15;
    bzero(v15, 0x400uLL);
    if (v7 >= 0x81)
    {
      if (a3 >= 0x400) {
        unint64_t v10 = 1024;
      }
      else {
        unint64_t v10 = a3;
      }
      int v8 = malloc_type_malloc(8 * v10, 0x80040B8603338uLL);
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v9 = 0;
      unint64_t v10 = 128;
    }
    uint64_t v11 = 0;
    char v14 = 0;
    while (!v14 && v7 != 0)
    {
      if (v10 >= v7) {
        unint64_t v13 = v7;
      }
      else {
        unint64_t v13 = v10;
      }
      objc_msgSend(a1, "getObjects:range:", v8, v11, v13);
      v7 -= v13;
      v6[2](v6, v8, v11, v13, &v14);
      v11 += v13;
    }
    if (v9) {
      free(v9);
    }
  }
}

- (uint64_t)ef_indexOfObject:()EmailFoundationAdditions usingComparator:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(a1, "count"), 256, v7);

  return v8;
}

- (uint64_t)ef_indexOfObject:()EmailFoundationAdditions usingSortFunction:context:
{
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __80__NSArray_EmailFoundationAdditions__ef_indexOfObject_usingSortFunction_context___block_invoke;
  unint64_t v13 = &__block_descriptor_48_e11_q24__0_8_16l;
  uint64_t v14 = a4;
  uint64_t v15 = a5;
  id v6 = a3;
  id v7 = _Block_copy(&v10);
  uint64_t v8 = objc_msgSend(a1, "ef_indexOfObject:usingComparator:", v6, v7, v10, v11, v12, v13, v14, v15);

  return v8;
}

- (id)ef_objectSameAs:()EmailFoundationAdditions usingComparator:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(a1, "ef_indexOfObject:usingComparator:", v6, v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [a1 objectAtIndex:v8];
  }

  return v9;
}

- (id)ef_objectsPassingTest:()EmailFoundationAdditions
{
  BOOL v2 = objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  id v3 = [a1 objectsAtIndexes:v2];

  return v3;
}

- (id)ef_lastObjectPassingTest:()EmailFoundationAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__1;
  uint64_t v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__NSArray_EmailFoundationAdditions__ef_lastObjectPassingTest___block_invoke;
  v8[3] = &unk_1E61224D8;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v5 = v4;
  [a1 enumerateObjectsWithOptions:2 usingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)ef_uniquifyWithComparator:()EmailFoundationAdditions
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a1;
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          uint64_t v10 = objc_msgSend(v9, "ef_flatten");
          uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v17;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v17 != v12) {
                  objc_enumerationMutation(v10);
                }
                objc_msgSend(v5, "ef_insertObject:usingComparator:allowDuplicates:", *(void *)(*((void *)&v16 + 1) + 8 * j), v4, 0);
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
            }
            while (v11);
          }
        }
        else
        {
          objc_msgSend(v5, "ef_insertObject:usingComparator:allowDuplicates:", v9, v4, 0);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  return v5;
}

- (id)ef_compactMapItemsInRange:()EmailFoundationAdditions usingTransform:
{
  uint64_t v8 = a5;
  for (uint64_t i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  {
    uint64_t v10 = (void *)MEMORY[0x1BA9A5240]();
    uint64_t v11 = [a1 objectAtIndexedSubscript:a3];
    uint64_t v12 = v8[2](v8, v11);
    objc_msgSend(i, "ef_addOptionalObject:", v12);

    ++a3;
  }

  return i;
}

- (id)ef_groupByObject:()EmailFoundationAdditions
{
  id v3 = objc_msgSend(a1, "ef_groupByObject:keyOptions:valueOptions:", a3, 0, 0);
  return v3;
}

- (id)ef_groupByObject:()EmailFoundationAdditions keyOptions:valueOptions:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a3;
  id v9 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:a4 valueOptions:a5];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = a1;
  uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = (void *)MEMORY[0x1BA9A5240]();
        uint64_t v15 = v8[2](v8, v13);
        if (v15)
        {
          long long v16 = [v9 objectForKey:v15];
          if (!v16)
          {
            long long v16 = [MEMORY[0x1E4F1CA48] array];
            [v9 setObject:v16 forKey:v15];
          }
          [v16 addObject:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v9;
}

- (id)ef_subarraysOfSize:()EmailFoundationAdditions
{
  if (a3)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count") / a3 + 1);
    unint64_t v6 = [a1 count];
    if (v6)
    {
      uint64_t v7 = 0;
      do
      {
        if (v6 >= a3) {
          unint64_t v8 = a3;
        }
        else {
          unint64_t v8 = v6;
        }
        id v9 = objc_msgSend(a1, "subarrayWithRange:", v7, v8);
        [v5 addObject:v9];
        v7 += v8;
        v6 -= v8;
      }
      while (v6);
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)ef_permutations
{
  v29[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [a1 count];
  unint64_t v3 = v2 - 1;
  if (v2 > 1)
  {
    if (v2 == 2)
    {
      v28[0] = a1;
      long long v17 = objc_msgSend(a1, "objectAtIndexedSubscript:", 1, v3);
      v27[0] = v17;
      id v5 = [a1 objectAtIndexedSubscript:0];
      v27[1] = v5;
      unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      v28[1] = v6;
      id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    }
    else
    {
      unint64_t v20 = v2;
      long long v18 = objc_msgSend(a1, "subarrayWithRange:", 1, v3);
      long long v19 = objc_msgSend(v18, "ef_permutations");
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      for (uint64_t i = 0; i != v20; ++i)
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id obj = v19;
        uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v23 != v9) {
                objc_enumerationMutation(obj);
              }
              uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              uint64_t v13 = objc_msgSend(v11, "subarrayWithRange:", 0, i);
              [v12 addObjectsFromArray:v13];

              uint64_t v14 = [a1 firstObject];
              [v12 addObject:v14];

              uint64_t v15 = objc_msgSend(v11, "subarrayWithRange:", i, v20 + ~i);
              [v12 addObjectsFromArray:v15];

              [v4 addObject:v12];
            }
            uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v8);
        }
      }
    }
  }
  else
  {
    v29[0] = a1;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  }
  return v4;
}

- (id)ef_reverse
{
  v1 = [a1 reverseObjectEnumerator];
  unint64_t v2 = [v1 allObjects];

  return v2;
}

- (id)ef_longestCommonPrefix
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char v6 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__NSArray_EmailFoundationAdditions__ef_longestCommonPrefix__block_invoke;
  v4[3] = &unk_1E6122520;
  v4[4] = v5;
  v1 = objc_msgSend(a1, "ef_reduce:", v4);
  if ([v1 length]) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  _Block_object_dispose(v5, 8);
  return v2;
}

- (uint64_t)ef_shortDescriptionString
{
  return objc_msgSend(a1, "ef_shortDescriptionStringWithLimit:", 4);
}

- (id)ef_shortDescriptionStringWithLimit:()EmailFoundationAdditions
{
  unint64_t v5 = [a1 count];
  if (a3 > 0x7FFFFFFFFFFFFFFELL || a3 < 2 || (unint64_t v6 = v5 - a3, v5 <= a3))
  {
    uint64_t v10 = [a1 description];
  }
  else
  {
    unint64_t v7 = a3 - (a3 >> 1);
    uint64_t v8 = objc_msgSend(a1, "ef_prefix:", a3 >> 1);
    uint64_t v9 = objc_msgSend(a1, "ef_suffix:", v7);
    uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"%@, ...<%lu additional items>..., %@", v8, v6, v9];
  }
  return v10;
}

- (id)ef_sum
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C68];
  id v2 = [MEMORY[0x1E4F28C68] expressionForConstantValue:a1];
  v7[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = [v1 expressionForFunction:@"sum:" arguments:v3];
  unint64_t v5 = [v4 expressionValueWithObject:0 context:0];

  return v5;
}

- (id)ef_min
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C68];
  id v2 = [MEMORY[0x1E4F28C68] expressionForConstantValue:a1];
  v7[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = [v1 expressionForFunction:@"min:" arguments:v3];
  unint64_t v5 = [v4 expressionValueWithObject:0 context:0];

  return v5;
}

- (id)ef_max
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C68];
  id v2 = [MEMORY[0x1E4F28C68] expressionForConstantValue:a1];
  v7[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = [v1 expressionForFunction:@"max:" arguments:v3];
  unint64_t v5 = [v4 expressionValueWithObject:0 context:0];

  return v5;
}

- (id)ef_mean
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C68];
  id v2 = [MEMORY[0x1E4F28C68] expressionForConstantValue:a1];
  v7[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = [v1 expressionForFunction:@"average:" arguments:v3];
  unint64_t v5 = [v4 expressionValueWithObject:0 context:0];

  return v5;
}

- (id)ef_median
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C68];
  id v2 = [MEMORY[0x1E4F28C68] expressionForConstantValue:a1];
  v7[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = [v1 expressionForFunction:@"median:" arguments:v3];
  unint64_t v5 = [v4 expressionValueWithObject:0 context:0];

  return v5;
}

- (id)ef_mode
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C68];
  id v2 = [MEMORY[0x1E4F28C68] expressionForConstantValue:a1];
  v7[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = [v1 expressionForFunction:@"mode:" arguments:v3];
  unint64_t v5 = [v4 expressionValueWithObject:0 context:0];

  return v5;
}

- (id)ef_standardDeviation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C68];
  id v2 = [MEMORY[0x1E4F28C68] expressionForConstantValue:a1];
  v7[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = [v1 expressionForFunction:@"stddev:" arguments:v3];
  unint64_t v5 = [v4 expressionValueWithObject:0 context:0];

  return v5;
}

@end