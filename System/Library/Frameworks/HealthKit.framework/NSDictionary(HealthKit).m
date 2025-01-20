@interface NSDictionary(HealthKit)
- (id)hk_allValuesBySortedKeys;
- (id)hk_dictionaryByAddingEntriesFromDictionary:()HealthKit;
- (id)hk_filter:()HealthKit;
- (id)hk_filterKeysWithBlock:()HealthKit;
- (id)hk_filteredDictionaryForKeys:()HealthKit;
- (id)hk_map:()HealthKit;
- (id)hk_replaceKeysFromSharedStringCache;
- (id)hk_sortedKeys;
- (uint64_t)hk_containsValuePassingTest:()HealthKit;
@end

@implementation NSDictionary(HealthKit)

- (id)hk_dictionaryByAddingEntriesFromDictionary:()HealthKit
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 addEntriesFromDictionary:v4];

  v6 = (void *)[v5 copy];

  return v6;
}

- (id)hk_sortedKeys
{
  v1 = [a1 allKeys];
  v2 = [v1 sortedArrayUsingSelector:sel_compare_];

  return v2;
}

- (id)hk_allValuesBySortedKeys
{
  v2 = objc_msgSend(a1, "hk_sortedKeys");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__NSDictionary_HealthKit__hk_allValuesBySortedKeys__block_invoke;
  v5[3] = &unk_1E58C09A0;
  v5[4] = a1;
  v3 = objc_msgSend(v2, "hk_map:", v5);

  return v3;
}

- (id)hk_filterKeysWithBlock:()HealthKit
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
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
        v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v15);
        int v13 = v4[2](v4, v12);

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)hk_filteredDictionaryForKeys:()HealthKit
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __56__NSDictionary_HealthKit__hk_filteredDictionaryForKeys___block_invoke;
  int v13 = &unk_1E58C09C8;
  id v14 = v4;
  id v15 = v5;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  uint64_t v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)hk_filter:()HealthKit
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __37__NSDictionary_HealthKit__hk_filter___block_invoke;
  int v13 = &unk_1E58C09F0;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  uint64_t v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)hk_map:()HealthKit
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSDictionary+HealthKit.m", 67, @"Invalid parameter not satisfying: %@", @"map" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__NSDictionary_HealthKit__hk_map___block_invoke;
  v12[3] = &unk_1E58C09F0;
  id v13 = v6;
  id v14 = v5;
  id v7 = v6;
  id v8 = v5;
  [a1 enumerateKeysAndObjectsUsingBlock:v12];
  uint64_t v9 = (void *)[v7 copy];

  return v9;
}

- (uint64_t)hk_containsValuePassingTest:()HealthKit
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"NSDictionary+HealthKit.m", 82, @"Invalid parameter not satisfying: %@", @"testHandler" object file lineNumber description];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        char v11 = v5[2](v5, v10);

        if (v11)
        {
          uint64_t v7 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

- (id)hk_replaceKeysFromSharedStringCache
{
  v2 = +[HKStringCache sharedCache];
  v3 = [v2 dictionaryReplacingKeysFromDictionary:a1];

  return v3;
}

@end