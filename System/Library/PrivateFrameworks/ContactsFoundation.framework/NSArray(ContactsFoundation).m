@interface NSArray(ContactsFoundation)
+ (id)_cn_arrayWithObject:()ContactsFoundation count:;
- (BOOL)_cn_containsObject:()ContactsFoundation;
- (BOOL)_cn_isIdenticalToArray:()ContactsFoundation;
- (CNLazyArray)_cn_lazy;
- (CNPair)_cn_partition:()ContactsFoundation;
- (id)_cn_arrayByRotatingRange:()ContactsFoundation by:;
- (id)_cn_balancedSlicesWithMaximumCount:()ContactsFoundation;
- (id)_cn_compactMap:()ContactsFoundation;
- (id)_cn_concurrentMap:()ContactsFoundation;
- (id)_cn_distinctObjects;
- (id)_cn_filter:()ContactsFoundation;
- (id)_cn_firstObjectPassingTest:()ContactsFoundation;
- (id)_cn_flatMap:()ContactsFoundation;
- (id)_cn_flatten;
- (id)_cn_groupBy:()ContactsFoundation;
- (id)_cn_indexBy:()ContactsFoundation;
- (id)_cn_indicesForObjects:()ContactsFoundation;
- (id)_cn_join:()ContactsFoundation;
- (id)_cn_joinWithBlock:()ContactsFoundation;
- (id)_cn_map:()ContactsFoundation;
- (id)_cn_reduce:()ContactsFoundation;
- (id)_cn_reduce:()ContactsFoundation initialValue:;
- (id)_cn_reversed;
- (id)_cn_safeSortedArrayUsingComparator:()ContactsFoundation;
- (id)_cn_skip:()ContactsFoundation;
- (id)_cn_skipLast:()ContactsFoundation;
- (id)_cn_slicesWithMaximumCount:()ContactsFoundation;
- (id)_cn_sortedArrayUsingAuxiliarySortOrder:()ContactsFoundation transform:;
- (id)_cn_take:()ContactsFoundation;
- (id)_cn_takeLast:()ContactsFoundation;
- (id)_cn_zip:()ContactsFoundation;
- (uint64_t)_cn_all:()ContactsFoundation;
- (uint64_t)_cn_any:()ContactsFoundation;
- (uint64_t)_cn_indexOfFirstObjectPassingTest:()ContactsFoundation;
- (uint64_t)_cn_none:()ContactsFoundation;
- (uint64_t)_cn_tail;
- (void)_cn_each:()ContactsFoundation;
- (void)_cn_each:()ContactsFoundation until:;
- (void)_cn_each:()ContactsFoundation untilCancelled:;
- (void)_cn_each_reverse:()ContactsFoundation;
- (void)_cn_isNonEmpty;
- (void)_cn_zip:()ContactsFoundation withBlock:;
@end

@implementation NSArray(ContactsFoundation)

- (void)_cn_each:()ContactsFoundation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
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

- (id)_cn_indicesForObjects:()ContactsFoundation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E60] indexSet];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(a1, "indexOfObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
          [v5 addIndex:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_cn_flatten
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__NSArray_ContactsFoundation___cn_flatten__block_invoke;
  v5[3] = &unk_1E569F730;
  id v3 = v2;
  id v6 = v3;
  [a1 enumerateObjectsUsingBlock:v5];

  return v3;
}

- (id)_cn_indexBy:()ContactsFoundation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
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
        long long v12 = v4[2](v4, v11);
        objc_msgSend(v5, "setObject:forKey:", v11, v12, (void)v14);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_cn_arrayByRotatingRange:()ContactsFoundation by:
{
  uint64_t v8 = (void *)[a1 mutableCopy];
  objc_msgSend(v8, "_cn_rotateRange:by:", a3, a4, a5);

  return v8;
}

- (id)_cn_compactMap:()ContactsFoundation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (a1 && [a1 count])
  {
    if ((unint64_t)[a1 count] > 0x80)
    {
      id v5 = a1;
      id v6 = (void (**)(id, void))v4;
      id v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = v5;
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
            long long v12 = v6[2](v6, *(void *)(*((void *)&v16 + 1) + 8 * i));
            long long v13 = ((void (*)(uint64_t, void *))off_1EE025F60)((uint64_t)&__block_literal_global_4_4, v12);

            if (v13) {
              [v15 addObject:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }
    }
    else
    {
      CNArrayCompactMapFastPath(a1, v4);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v15 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (id)_cn_map:()ContactsFoundation
{
  id v4 = a3;
  if (a1 && [a1 count])
  {
    if ((unint64_t)[a1 count] > 0x80)
    {
      id v6 = v4;
      id v7 = (objc_class *)MEMORY[0x1E4F1CA48];
      id v8 = a1;
      uint64_t v9 = objc_msgSend([v7 alloc], "initWithCapacity:", objc_msgSend(v8, "count"));
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __CNArrayMapSlowPath_block_invoke;
      v14[3] = &unk_1E569F818;
      id v16 = v6;
      id v10 = v9;
      id v15 = v10;
      id v11 = v6;
      [v8 enumerateObjectsUsingBlock:v14];

      long long v12 = v15;
      id v5 = v10;
    }
    else
    {
      CNArrayMapFastPath(a1, v4);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (uint64_t)_cn_indexOfFirstObjectPassingTest:()ContactsFoundation
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__NSArray_ContactsFoundation___cn_indexOfFirstObjectPassingTest___block_invoke;
  v9[3] = &unk_1E569F6B8;
  id v10 = v4;
  id v5 = v4;
  id v6 = [a1 indexesOfObjectsPassingTest:v9];
  uint64_t v7 = [v6 firstIndex];

  return v7;
}

- (id)_cn_filter:()ContactsFoundation
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__NSArray_ContactsFoundation___cn_filter___block_invoke;
  v9[3] = &unk_1E569F6B8;
  id v10 = v4;
  id v5 = v4;
  id v6 = [a1 indexesOfObjectsPassingTest:v9];
  uint64_t v7 = [a1 objectsAtIndexes:v6];

  return v7;
}

- (uint64_t)_cn_any:()ContactsFoundation
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

- (uint64_t)_cn_tail
{
  return objc_msgSend(a1, "_cn_skip:", 1);
}

- (id)_cn_skip:()ContactsFoundation
{
  if ([a1 count] >= a3)
  {
    id v5 = objc_msgSend(a1, "subarrayWithRange:", a3, objc_msgSend(a1, "count") - a3);
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

+ (id)_cn_arrayWithObject:()ContactsFoundation count:
{
  id v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  uint64_t v7 = [v5 arrayWithCapacity:a4];
  objc_msgSend(v7, "_cn_addObject:count:", v6, a4);

  return v7;
}

- (id)_cn_take:()ContactsFoundation
{
  if ([a1 count] >= a3)
  {
    objc_msgSend(a1, "subarrayWithRange:", 0, a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = a1;
  }

  return v5;
}

- (id)_cn_flatMap:()ContactsFoundation
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__NSArray_ContactsFoundation___cn_flatMap___block_invoke;
  v11[3] = &unk_1E569F758;
  id v6 = v5;
  id v12 = v6;
  id v13 = v4;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)_cn_join:()ContactsFoundation
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__NSArray_ContactsFoundation___cn_join___block_invoke;
    v8[3] = &unk_1E569F360;
    id v9 = v4;
    objc_msgSend(a1, "_cn_joinWithBlock:", v8);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

- (id)_cn_joinWithBlock:()ContactsFoundation
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__NSArray_ContactsFoundation___cn_joinWithBlock___block_invoke;
    v9[3] = &unk_1E569F688;
    id v10 = v4;
    id v6 = [MEMORY[0x1E4F1CA48] array];
    objc_msgSend(a1, "_cn_reduce:initialValue:", v9, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = a1;
  }

  return v7;
}

- (id)_cn_reduce:()ContactsFoundation initialValue:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = a1;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  id v10 = v7;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v17;
    id v10 = v7;
    do
    {
      uint64_t v13 = 0;
      long long v14 = v10;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v8);
        }
        id v10 = v6[2](v6, v14, *(void *)(*((void *)&v16 + 1) + 8 * v13));

        ++v13;
        long long v14 = v10;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v10;
}

- (BOOL)_cn_isIdenticalToArray:()ContactsFoundation
{
  id v4 = a3;
  id v5 = v4;
  if (v4 == a1)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (uint64_t v6 = [v4 count], v6 == objc_msgSend(a1, "count")))
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__NSArray_ContactsFoundation___cn_isIdenticalToArray___block_invoke;
    v9[3] = &unk_1E569F7A8;
    id v10 = v5;
    uint64_t v11 = &v12;
    [a1 enumerateObjectsUsingBlock:v9];
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (CNPair)_cn_partition:()ContactsFoundation
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__NSArray_ContactsFoundation___cn_partition___block_invoke;
  v12[3] = &unk_1E569F6E0;
  id v14 = v6;
  id v15 = v4;
  id v13 = v5;
  id v7 = v6;
  id v8 = v5;
  id v9 = v4;
  [a1 enumerateObjectsUsingBlock:v12];
  id v10 = [[CNPair alloc] initWithFirst:v8 second:v7];

  return v10;
}

- (BOOL)_cn_containsObject:()ContactsFoundation
{
  return objc_msgSend(a1, "indexOfObject:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_cn_firstObjectPassingTest:()ContactsFoundation
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
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
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

- (void)_cn_each:()ContactsFoundation until:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = a1;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * v12);
      if (v7[2](v7)) {
        break;
      }
      v6[2](v6, v13);
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_cn_each:()ContactsFoundation untilCancelled:
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__NSArray_ContactsFoundation___cn_each_untilCancelled___block_invoke;
  v8[3] = &unk_1E569F630;
  id v9 = v6;
  id v7 = v6;
  objc_msgSend(a1, "_cn_each:until:", a3, v8);
}

- (void)_cn_each_reverse:()ContactsFoundation
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__NSArray_ContactsFoundation___cn_each_reverse___block_invoke;
  v6[3] = &unk_1E569F658;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsWithOptions:2 usingBlock:v6];
}

- (id)_cn_concurrentMap:()ContactsFoundation
{
  id v4 = a3;
  if ([a1 count])
  {
    id v5 = a1;
    id v6 = v4;
    size_t v7 = [v5 count];
    id v8 = (void **)malloc_type_calloc(v7, 8uLL, 0x80040B8603338uLL);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    long long v17 = __CNArrayConcurrentMapSlowPath_block_invoke;
    long long v18 = &unk_1E569F840;
    id v9 = v6;
    id v19 = v9;
    v20 = v8;
    [v5 enumerateObjectsWithOptions:1 usingBlock:&v15];
    id v10 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v11 = objc_msgSend(v10, "initWithObjects:count:", v8, v7, v15, v16, v17, v18);
    if (v7)
    {
      uint64_t v12 = v8;
      do
      {
        uint64_t v13 = *v12;
        *v12++ = 0;

        --v7;
      }
      while (v7);
    }
    free(v8);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (id)_cn_slicesWithMaximumCount:()ContactsFoundation
{
  id v4 = CNRangeDividedIntoStridesOfLength(0, [a1 count], a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__NSArray_ContactsFoundation___cn_slicesWithMaximumCount___block_invoke;
  v7[3] = &unk_1E569F708;
  v7[4] = a1;
  id v5 = objc_msgSend(v4, "_cn_map:", v7);

  return v5;
}

- (id)_cn_balancedSlicesWithMaximumCount:()ContactsFoundation
{
  id v4 = CNRangeDividedIntoBalancedStridesOfLength(0, [a1 count], a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__NSArray_ContactsFoundation___cn_balancedSlicesWithMaximumCount___block_invoke;
  v7[3] = &unk_1E569F708;
  v7[4] = a1;
  id v5 = objc_msgSend(v4, "_cn_map:", v7);

  return v5;
}

- (uint64_t)_cn_all:()ContactsFoundation
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

- (uint64_t)_cn_none:()ContactsFoundation
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
        if (v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v9)))
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

- (id)_cn_distinctObjects
{
  v1 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:a1];
  v2 = [v1 array];

  return v2;
}

- (id)_cn_reduce:()ContactsFoundation
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_cn_tail");
  uint64_t v6 = [a1 firstObject];
  uint64_t v7 = objc_msgSend(v5, "_cn_reduce:initialValue:", v4, v6);

  return v7;
}

- (id)_cn_skipLast:()ContactsFoundation
{
  if ([a1 count] >= a3)
  {
    id v5 = objc_msgSend(a1, "_cn_take:", objc_msgSend(a1, "count") - a3);
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)_cn_sortedArrayUsingAuxiliarySortOrder:()ContactsFoundation transform:
{
  v2 = +[_CNSortsByPositionInAuxiliaryArray comparatorForSortingAccordingToAuxiliaryValues:transform:](_CNSortsByPositionInAuxiliaryArray, "comparatorForSortingAccordingToAuxiliaryValues:transform:");
  id v3 = [a1 sortedArrayUsingComparator:v2];

  return v3;
}

- (id)_cn_takeLast:()ContactsFoundation
{
  if ([a1 count] >= a3)
  {
    objc_msgSend(a1, "subarrayWithRange:", objc_msgSend(a1, "count") - a3, a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = a1;
  }

  return v5;
}

- (id)_cn_groupBy:()ContactsFoundation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v12 = v4[2](v4, v11);
        objc_msgSend(v5, "objectForKey:", v12, (void)v15);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v5 setObject:v13 forKey:v12];
        }
        [v13 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_cn_zip:()ContactsFoundation
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__NSArray_ContactsFoundation___cn_zip___block_invoke;
  v9[3] = &unk_1E569F780;
  id v7 = v6;
  id v10 = v7;
  objc_msgSend(a1, "_cn_zip:withBlock:", v5, v9);

  return v7;
}

- (void)_cn_zip:()ContactsFoundation withBlock:
{
  id v13 = a3;
  id v6 = a4;
  unint64_t v7 = [a1 count];
  unint64_t v8 = [v13 count];
  if (v7 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v7;
  }
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      uint64_t v11 = [a1 objectAtIndexedSubscript:i];
      long long v12 = [v13 objectAtIndexedSubscript:i];
      v6[2](v6, v11, v12);
    }
  }
}

- (id)_cn_reversed
{
  if ((unint64_t)[a1 count] > 1)
  {
    id v3 = [a1 reverseObjectEnumerator];
    id v2 = [v3 allObjects];
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

- (id)_cn_safeSortedArrayUsingComparator:()ContactsFoundation
{
  if (a3)
  {
    objc_msgSend(a1, "sortedArrayUsingComparator:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = a1;
  }

  return v3;
}

- (void)_cn_isNonEmpty
{
  if (result) {
    return (void *)([result count] != 0);
  }
  return result;
}

- (CNLazyArray)_cn_lazy
{
  v1 = [[CNLazyArray alloc] initWithArray:a1];

  return v1;
}

@end