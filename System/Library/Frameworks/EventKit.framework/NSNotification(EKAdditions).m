@interface NSNotification(EKAdditions)
- (uint64_t)cal_changeMayAffectAnyObjectOfType:()EKAdditions;
- (uint64_t)cal_changeMayAffectCalendarsOrSources;
@end

@implementation NSNotification(EKAdditions)

- (uint64_t)cal_changeMayAffectAnyObjectOfType:()EKAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = [a1 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"EKEventStoreChangedObjectIDsUserInfoKey"];

  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "entityType", (void)v13) == a3)
          {
            uint64_t v11 = 1;
            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    uint64_t v11 = 0;
LABEL_12:
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

- (uint64_t)cal_changeMayAffectCalendarsOrSources
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"EKEventStoreChangedObjectIDsUserInfoKey"];

  if (v2)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "entityType", (void)v12);
          if (v8 == 1 || v8 == 6)
          {
            uint64_t v10 = 1;
            goto LABEL_17;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        uint64_t v10 = 0;
        if (v5) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
LABEL_17:
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

@end