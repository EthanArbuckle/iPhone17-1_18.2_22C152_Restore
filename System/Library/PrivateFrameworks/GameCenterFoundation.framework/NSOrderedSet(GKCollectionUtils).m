@interface NSOrderedSet(GKCollectionUtils)
- (id)_gkDistinctValuesForKeyPath:()GKCollectionUtils;
- (id)_gkMapDictionaryWithKeyPath:()GKCollectionUtils valueKeyPath:;
- (id)_gkValuesForKeyPath:()GKCollectionUtils;
- (uint64_t)_gkMapDictionaryWithKeyPath:()GKCollectionUtils;
@end

@implementation NSOrderedSet(GKCollectionUtils)

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

- (id)_gkValuesForKeyPath:()GKCollectionUtils
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
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
  v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(a1, "count"));
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

@end