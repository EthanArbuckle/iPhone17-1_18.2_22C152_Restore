@interface NSDictionary(CalClassAdditions)
- (id)CalDictionaryWithEmptyObjectsRemoved;
- (id)filteredDictionaryPassingTest:()CalClassAdditions;
- (uint64_t)CalHasKeyIn:()CalClassAdditions;
- (void)CalMutableRecursiveCopy;
- (void)mutableCopyWithElementsCopy;
@end

@implementation NSDictionary(CalClassAdditions)

- (void)mutableCopyWithElementsCopy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[a1 mutableCopy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(a1, "allKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v9 = [v2 objectForKey:v8];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = [v9 copy];

          [v2 setObject:v10 forKey:v8];
          v9 = (void *)v10;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

- (void)CalMutableRecursiveCopy
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [a1 allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = [a1 objectForKey:v7];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v9 = [v8 CalMutableRecursiveCopy];
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0 {
               && [v8 conformsToProtocol:&unk_1EE0DA0E0])
        }
        {
          uint64_t v9 = [v8 mutableCopy];
        }
        else
        {
          uint64_t v9 = [v8 copy];
        }
        uint64_t v10 = (void *)v9;
        [v2 setValue:v9 forKey:v7];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  return v2;
}

- (id)filteredDictionaryPassingTest:()CalClassAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [a1 keysOfEntriesPassingTest:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
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
        long long v12 = [a1 objectForKey:v11];
        if (v12) {
          [v5 setObject:v12 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v5];

  return v13;
}

- (uint64_t)CalHasKeyIn:()CalClassAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(a1, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v8), (void)v12);

        if (v9)
        {
          uint64_t v10 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

- (id)CalDictionaryWithEmptyObjectsRemoved
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [a1 keysOfEntriesPassingTest:&__block_literal_global_7];
  if ([v2 count])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a1];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v3, "removeObjectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v3];
  }
  else
  {
    id v9 = a1;
  }

  return v9;
}

@end