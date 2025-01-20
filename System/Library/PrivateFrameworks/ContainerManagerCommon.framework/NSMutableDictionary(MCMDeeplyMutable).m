@interface NSMutableDictionary(MCMDeeplyMutable)
- (id)MCM_deepCopy;
- (id)_createOrConvertToMutableDictionaryFromDictionary:()MCMDeeplyMutable;
- (id)_dictionaryAtKeyPath:()MCMDeeplyMutable;
- (id)_findKeyPathsSortedByDepthFirstOfKindOfClass:()MCMDeeplyMutable;
- (id)_mutableDictionaryAtKeyPath:()MCMDeeplyMutable;
- (void)MCM_overlayDictionary:()MCMDeeplyMutable existingValuesTakePrecedent:;
- (void)MCM_replaceDeepDictionariesWithReplaceHandler:()MCMDeeplyMutable;
- (void)_overlayValueAtKey:()MCMDeeplyMutable intoTargetDictionary:fromSourceDictionary:targetTakePrecedent:nestedDictionaryHandler:;
@end

@implementation NSMutableDictionary(MCMDeeplyMutable)

- (id)_createOrConvertToMutableDictionaryFromDictionary:()MCMDeeplyMutable
{
  id v3 = a3;
  v4 = v3;
  if (!v3 || (v5 = (void *)[v3 mutableCopy]) == 0)
  {
    v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }

  return v5;
}

- (id)_mutableDictionaryAtKeyPath:()MCMDeeplyMutable
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a1;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    v9 = v5;
    do
    {
      uint64_t v10 = 0;
      v11 = v9;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        v13 = [v11 objectForKeyedSubscript:v12];
        v9 = [v5 _createOrConvertToMutableDictionaryFromDictionary:v13];
        [v11 setObject:v9 forKeyedSubscript:v12];

        ++v10;
        v11 = v9;
      }
      while (v7 != v10);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v7);
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (id)_dictionaryAtKeyPath:()MCMDeeplyMutable
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v5;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        id v5 = [v10 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * v9)];

        ++v9;
        uint64_t v10 = v5;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)_findKeyPathsSortedByDepthFirstOfKindOfClass:()MCMDeeplyMutable
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v2 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v3 = objc_msgSend(v2, "initWithObjects:", MEMORY[0x1E4F1CBF0], 0);
  id v4 = v3;
  while ([v3 count])
  {
    id v5 = [v4 anyObject];
    [v4 removeObject:v5];
    uint64_t v6 = [a1 _dictionaryAtKeyPath:v5];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v12 = [v6 objectForKeyedSubscript:v11];
          if (objc_opt_isKindOfClass())
          {
            long long v13 = [v5 arrayByAddingObject:v11];
            [v1 addObject:v13];
            [v4 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v17 count:16];
      }
      while (v8);
    }

    id v3 = v4;
  }
  [v1 sortUsingComparator:&__block_literal_global_1221];
  long long v14 = (void *)[v1 copy];

  return v14;
}

- (void)_overlayValueAtKey:()MCMDeeplyMutable intoTargetDictionary:fromSourceDictionary:targetTakePrecedent:nestedDictionaryHandler:
{
  id v15 = a3;
  id v11 = a4;
  uint64_t v12 = a7;
  long long v13 = [a5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12[2](v12, v13);
  }
  else if (!a6 {
         || ([v11 objectForKeyedSubscript:v15],
  }
             long long v14 = objc_claimAutoreleasedReturnValue(),
             v14,
             !v14))
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, v15, v15);
  }
}

- (id)MCM_deepCopy
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [a1 _findKeyPathsSortedByDepthFirstOfKindOfClass:objc_opt_class()];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v7 = [a1 _dictionaryAtKeyPath:v6];
        uint64_t v8 = [v6 lastObject];
        uint64_t v9 = (void *)[v6 mutableCopy];
        [v9 removeLastObject];
        uint64_t v10 = (void *)[v9 copy];
        id v11 = [a1 _mutableDictionaryAtKeyPath:v10];
        uint64_t v12 = (void *)[v7 copy];
        [v11 setObject:v12 forKeyedSubscript:v8];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v16 count:16];
    }
    while (v3);
  }
  long long v13 = (void *)[a1 copy];

  return v13;
}

- (void)MCM_overlayDictionary:()MCMDeeplyMutable existingValuesTakePrecedent:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:v4 forKeyedSubscript:MEMORY[0x1E4F1CBF0]];
  while ([v5 count])
  {
    context = (void *)MEMORY[0x1D9478DF0]();
    uint64_t v6 = [v5 allKeys];
    uint64_t v7 = [v6 firstObject];

    uint64_t v8 = [v5 objectForKeyedSubscript:v7];
    [v5 removeObjectForKey:v7];
    uint64_t v9 = [a1 _mutableDictionaryAtKeyPath:v7];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = [v8 allKeys];
    uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v15 = [v7 arrayByAddingObject:v14];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __91__NSMutableDictionary_MCMDeeplyMutable__MCM_overlayDictionary_existingValuesTakePrecedent___block_invoke;
          v21[3] = &unk_1E6A7F710;
          id v22 = v5;
          id v23 = v15;
          id v16 = v15;
          [a1 _overlayValueAtKey:v14 intoTargetDictionary:v9 fromSourceDictionary:v8 targetTakePrecedent:a4 nestedDictionaryHandler:v21];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v24 count:16];
      }
      while (v11);
    }
  }
}

- (void)MCM_replaceDeepDictionariesWithReplaceHandler:()MCMDeeplyMutable
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 _findKeyPathsSortedByDepthFirstOfKindOfClass:objc_opt_class()];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v9 = [a1 _dictionaryAtKeyPath:v8];
        uint64_t v10 = v4[2](v4, v8, v9);
        if (v10 != v9)
        {
          uint64_t v11 = [v8 lastObject];
          uint64_t v12 = (void *)[v8 mutableCopy];
          [v12 removeLastObject];
          long long v13 = (void *)[v12 copy];
          uint64_t v14 = [a1 _mutableDictionaryAtKeyPath:v13];
          id v15 = v14;
          if (v10) {
            [v14 setObject:v10 forKeyedSubscript:v11];
          }
          else {
            [v14 removeObjectForKey:v11];
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v6);
  }
}

@end