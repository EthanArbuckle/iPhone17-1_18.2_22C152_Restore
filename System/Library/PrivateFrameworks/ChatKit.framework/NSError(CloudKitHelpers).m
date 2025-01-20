@interface NSError(CloudKitHelpers)
- (id)underlyingCKError;
- (id)updatedServerChangedShare;
@end

@implementation NSError(CloudKitHelpers)

- (id)updatedServerChangedShare
{
  v1 = [a1 underlyingCKError];
  v2 = [v1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v3 && [v1 code] == 14)
  {
    v4 = [v1 userInfo];
    v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F19D10]];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)underlyingCKError
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [a1 domain];
  uint64_t v3 = *MEMORY[0x1E4F19C40];
  char v4 = [v2 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v4)
  {
LABEL_15:
    id v11 = a1;
    goto LABEL_18;
  }
  v5 = [a1 userInfo];
  v6 = [v5 objectForKey:*MEMORY[0x1E4F28A50]];

  v7 = [a1 userInfo];
  v8 = [v7 objectForKey:*MEMORY[0x1E4F28750]];

  v9 = [v6 domain];
  int v10 = [v9 isEqual:v3];

  if (!v10)
  {
    if (v8)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v21 = v8;
      id v12 = v8;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            v18 = [v17 domain];
            char v19 = [v18 isEqualToString:v3];

            if (v19)
            {
              id v11 = v17;

              v8 = v21;
              goto LABEL_17;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      v8 = v21;
    }

    goto LABEL_15;
  }
  id v11 = v6;
LABEL_17:

LABEL_18:

  return v11;
}

@end