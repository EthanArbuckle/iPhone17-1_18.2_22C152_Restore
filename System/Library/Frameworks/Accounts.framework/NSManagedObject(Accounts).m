@interface NSManagedObject(Accounts)
- (id)_obsoleteAttributes;
- (id)_removeObsoleteKeysFromDictionary:()Accounts;
- (uint64_t)validateRequiredAttributesForObject:()Accounts error:;
- (void)encodeWithCoder:()Accounts;
- (void)setValuesWithObject:()Accounts;
@end

@implementation NSManagedObject(Accounts)

- (void)encodeWithCoder:()Accounts
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 entity];
  v6 = [v5 attributesByName];
  v7 = [v6 allKeys];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v14 = objc_msgSend(a1, "valueForKey:", v13, (void)v15);
        [v4 encodeObject:v14 forKey:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (id)_obsoleteAttributes
{
  if (_obsoleteAttributes_onceToken != -1) {
    dispatch_once(&_obsoleteAttributes_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)__sACDObsoleteAttributes;

  return v0;
}

- (id)_removeObsoleteKeysFromDictionary:()Accounts
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [v4 allKeys];
  v7 = [v5 setWithArray:v6];

  id v8 = [a1 _obsoleteAttributes];
  if ([v8 intersectsSet:v7])
  {
    id v9 = (id)[v4 mutableCopy];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(v9, "removeObjectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (void)setValuesWithObject:()Accounts
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 entity];
  v6 = [v5 attributesByName];
  v7 = [v6 allKeys];

  id v8 = [a1 entity];
  id v9 = [v8 relationshipsByName];
  id v10 = [v9 allKeys];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [v4 dirtyProperties];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v7 containsObject:v16])
          {
            long long v17 = [v4 valueForKey:v16];
            [a1 setValue:v17 forKey:v16];
          }
          else if (([v10 containsObject:v16] & 1) == 0 {
                 && ([v16 isEqualToString:@"credential"] & 1) == 0
          }
                 && ([v16 isEqualToString:@"accountProperties"] & 1) == 0
                 && ([v16 isEqualToString:@"parent"] & 1) == 0)
          {
            NSLog((NSString *)@"Dirty property name '%@' not part of managed object.", v16);
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
  else
  {
    uint64_t v11 = [v4 dictionaryWithValuesForKeys:v7];
    long long v18 = [a1 _removeObsoleteKeysFromDictionary:v11];
    [a1 setValuesForKeysWithDictionary:v18];
  }
}

- (uint64_t)validateRequiredAttributesForObject:()Accounts error:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 entity];
  id v8 = [v7 attributesByName];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = [v8 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        long long v15 = [v8 objectForKey:v14];
        char v16 = [v15 isOptional];

        if ((v16 & 1) == 0)
        {
          long long v17 = [v6 valueForKey:v14];

          if (!v17)
          {
            long long v19 = [NSString stringWithFormat:@"object is missing required property '%@'", v14];
            if (a4)
            {
              long long v20 = (void *)MEMORY[0x1E4F28C58];
              long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v19 forKey:*MEMORY[0x1E4F28568]];
              *a4 = [v20 errorWithDomain:@"com.apple.accounts" code:2 userInfo:v21];
            }
            uint64_t v18 = 0;
            goto LABEL_14;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  uint64_t v18 = 1;
LABEL_14:

  return v18;
}

@end