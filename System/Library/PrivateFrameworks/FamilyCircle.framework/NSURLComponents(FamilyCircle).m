@interface NSURLComponents(FamilyCircle)
- (id)fa_queryItemsDictionary;
- (id)fa_valueForQueryItem:()FamilyCircle;
@end

@implementation NSURLComponents(FamilyCircle)

- (id)fa_valueForQueryItem:()FamilyCircle
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 queryItems];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "name", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          v6 = [v9 value];
          goto LABEL_11;
        }
      }
      v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)fa_queryItemsDictionary
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v1 = [a1 queryItems];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "name", (void)v16);
        if (v9)
        {
          v10 = (void *)v9;
          char v11 = [v8 value];

          if (v11)
          {
            v12 = [v8 value];
            long long v13 = [v8 name];
            [v2 setObject:v12 forKeyedSubscript:v13];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  long long v14 = (void *)[v2 copy];
  return v14;
}

@end