@interface NSArray(GKCollectionUtils)
- (BOOL)_gkContainsObjectPassingTest:()GKCollectionUtils;
- (id)_gkDistinctValuesForKeyPath:()GKCollectionUtils;
- (id)_gkFilterWithBlock:()GKCollectionUtils;
- (id)_gkFirstObjectPassingTest:()GKCollectionUtils;
- (id)_gkFoldWithInitialValue:()GKCollectionUtils block:;
- (id)_gkMapConcurrentlyWithBlock:()GKCollectionUtils;
- (id)_gkMapDictionaryWithKeyPath:()GKCollectionUtils valueKeyPath:;
- (id)_gkMapWithBlock:()GKCollectionUtils;
- (id)_gkSubarraysByKeyWithBlock:()GKCollectionUtils;
- (id)_gkValuesForKeyPath:()GKCollectionUtils;
- (uint64_t)_gkIndexOfObjectPassingTest:()GKCollectionUtils;
- (uint64_t)_gkMapDictionaryWithKeyPath:()GKCollectionUtils;
@end

@implementation NSArray(GKCollectionUtils)

- (uint64_t)_gkMapDictionaryWithKeyPath:()GKCollectionUtils
{
  return [a1 _gkMapDictionaryWithKeyPath:a3 valueKeyPath:0];
}

- (id)_gkMapDictionaryWithKeyPath:()GKCollectionUtils valueKeyPath:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a1;
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "valueForKeyPath:", v6, v21);
        if (v7)
        {
          id v14 = [v12 valueForKeyPath:v7];
        }
        else
        {
          id v14 = v12;
        }
        v15 = v14;
        if (v13)
        {
          v16 = [MEMORY[0x1E4F1CA98] null];
          v17 = v16;
          if (v13 == v16 || v15 == 0)
          {
          }
          else
          {
            v19 = [MEMORY[0x1E4F1CA98] null];

            if (v15 != v19) {
              [v21 setObject:v15 forKey:v13];
            }
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  return v21;
}

- (id)_gkMapConcurrentlyWithBlock:()GKCollectionUtils
{
  id v4 = a3;
  size_t v5 = [a1 count];
  id v6 = (void **)malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __58__NSArray_GKCollectionUtils___gkMapConcurrentlyWithBlock___block_invoke;
  v15 = &unk_1E646CA18;
  v17 = v6;
  id v7 = v4;
  id v16 = v7;
  [a1 enumerateObjectsWithOptions:1 usingBlock:&v12];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v6, v5, v12, v13, v14, v15);
  if (v5)
  {
    uint64_t v9 = v6;
    do
    {
      uint64_t v10 = *v9;
      *v9++ = 0;

      --v5;
    }
    while (v5);
  }
  free(v6);

  return v8;
}

- (id)_gkMapWithBlock:()GKCollectionUtils
{
  id v4 = a3;
  size_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__NSArray_GKCollectionUtils___gkMapWithBlock___block_invoke;
  v11[3] = &unk_1E646CA40;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  uint64_t v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)_gkFilterWithBlock:()GKCollectionUtils
{
  id v4 = a3;
  size_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__NSArray_GKCollectionUtils___gkFilterWithBlock___block_invoke;
  v11[3] = &unk_1E646CA40;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  uint64_t v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)_gkSubarraysByKeyWithBlock:()GKCollectionUtils
{
  id v4 = a3;
  size_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v6 = [a1 count];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__NSArray_GKCollectionUtils___gkSubarraysByKeyWithBlock___block_invoke;
  v12[3] = &unk_1E646CA68;
  id v14 = v4;
  id v7 = v5;
  id v13 = v7;
  uint64_t v15 = v6;
  id v8 = v4;
  [a1 enumerateObjectsUsingBlock:v12];
  id v9 = v13;
  id v10 = v7;

  return v10;
}

- (id)_gkValuesForKeyPath:()GKCollectionUtils
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  size_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
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
        v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "valueForKeyPath:", v4, (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_gkDistinctValuesForKeyPath:()GKCollectionUtils
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  size_t v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(a1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
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
        v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "valueForKeyPath:", v4, (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_gkFirstObjectPassingTest:()GKCollectionUtils
{
  uint64_t v2 = objc_msgSend(a1, "_gkIndexOfObjectPassingTest:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = [a1 objectAtIndexedSubscript:v2];
  }

  return v3;
}

- (id)_gkFoldWithInitialValue:()GKCollectionUtils block:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v8 = v6;
  id v20 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__NSArray_GKCollectionUtils___gkFoldWithInitialValue_block___block_invoke;
  v12[3] = &unk_1E646CA90;
  long long v14 = &v15;
  id v9 = v7;
  id v13 = v9;
  [a1 enumerateObjectsUsingBlock:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

- (BOOL)_gkContainsObjectPassingTest:()GKCollectionUtils
{
  return objc_msgSend(a1, "_gkIndexOfObjectPassingTest:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)_gkIndexOfObjectPassingTest:()GKCollectionUtils
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__NSArray_GKCollectionUtils___gkIndexOfObjectPassingTest___block_invoke;
  v8[3] = &unk_1E646CAB8;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [a1 indexOfObjectPassingTest:v8];

  return v6;
}

@end