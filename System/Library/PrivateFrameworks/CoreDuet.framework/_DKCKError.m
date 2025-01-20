@interface _DKCKError
+ (id)_allPartialErrorsFromError:(uint64_t)a1;
+ (id)errorMinusUnrecoverableDecryptionErrorsFromPartialError:(uint64_t)a1;
+ (id)zoneIDsWithUnrecoverableDecryptionError:(uint64_t)a1;
+ (uint64_t)isChangeTokenExpiredError:(uint64_t)a1;
+ (uint64_t)isIgnorableError:(uint64_t)a1;
+ (uint64_t)isOperationCancelledError:(uint64_t)a1;
+ (uint64_t)isPartialError:(uint64_t)a1;
+ (uint64_t)isShouldDeferError:(uint64_t)a1;
+ (uint64_t)isUnrecoverableDecryptionError:(uint64_t)a1;
+ (void)_populateZoneIDs:(void *)a3 fromUnrecoverableDecryptionError:(void *)a4 itemID:;
@end

@implementation _DKCKError

+ (id)errorMinusUnrecoverableDecryptionErrorsFromPartialError:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  if (+[_DKCKError isPartialError:](v3, v2))
  {
    v4 = [v2 userInfo];
    uint64_t v20 = *MEMORY[0x1E4F19CD8];
    v5 = objc_msgSend(v4, "objectForKeyedSubscript:");
    v6 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v13 = [v7 objectForKeyedSubscript:v12];
          if ((+[_DKCKError isUnrecoverableDecryptionError:](v3, v13) & 1) == 0) {
            [v6 setObject:v13 forKeyedSubscript:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    if ([v6 count])
    {
      v14 = (void *)[v4 mutableCopy];
      v15 = (void *)[v6 copy];
      [v14 setObject:v15 forKeyedSubscript:v20];

      v16 = (void *)MEMORY[0x1E4F28C58];
      v17 = [v2 domain];
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, objc_msgSend(v2, "code"), v14);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = v2;
  }

  return v18;
}

+ (uint64_t)isIgnorableError:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  if (!+[_DKCKError isOperationCancelledError:](v3, v2)) {
    goto LABEL_9;
  }
  v4 = [v2 userInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  v6 = [v5 domain];
  if ([v6 isEqualToString:*MEMORY[0x1E4F19C40]])
  {
    uint64_t v7 = [v5 code];

    if (v7 == 130 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      +[_DKCKError isIgnorableError:]();
    }
  }
  else
  {
  }
  char v8 = +[_DKCKError isShouldDeferError:](v3, v2);

  if (v8) {
    uint64_t v9 = 1;
  }
  else {
LABEL_9:
  }
    uint64_t v9 = 0;

  return v9;
}

+ (uint64_t)isOperationCancelledError:(uint64_t)a1
{
  id v2 = a2;
  self;
  if ([v2 code] == 20)
  {
    uint64_t v3 = [v2 domain];
    uint64_t v4 = [v3 isEqualToString:*MEMORY[0x1E4F19C40]];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (uint64_t)isShouldDeferError:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  uint64_t v4 = [v2 code];
  if (+[_DKCKError isOperationCancelledError:](v3, v2))
  {
    v5 = [v2 userInfo];
    v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    if ([v6 code] == 131)
    {
      uint64_t v7 = [v6 domain];
      uint64_t v8 = [v7 isEqualToString:*MEMORY[0x1E4F19C40]];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    if (v4 != 131)
    {
      uint64_t v8 = 0;
      goto LABEL_9;
    }
    v6 = [v2 domain];
    uint64_t v8 = [v6 isEqualToString:*MEMORY[0x1E4F19C40]];
  }

LABEL_9:
  return v8;
}

+ (uint64_t)isChangeTokenExpiredError:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  if (+[_DKCKError isPartialError:](v3, v2))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = +[_DKCKError _allPartialErrorsFromError:](v3, v2);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          if (+[_DKCKError isChangeTokenExpiredError:](v3, *(void *)(*((void *)&v11 + 1) + 8 * v8)))
          {
            uint64_t v9 = 1;
            goto LABEL_15;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  if (objc_msgSend(v2, "code", (void)v11) == 21)
  {
    uint64_t v4 = [v2 domain];
    uint64_t v9 = [v4 isEqualToString:*MEMORY[0x1E4F19C40]];
LABEL_15:
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (uint64_t)isPartialError:(uint64_t)a1
{
  id v2 = a2;
  self;
  if ([v2 code] == 2)
  {
    uint64_t v3 = [v2 domain];
    uint64_t v4 = [v3 isEqualToString:*MEMORY[0x1E4F19C40]];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)_allPartialErrorsFromError:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [v2 userInfo];

  uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F19CD8]];
  uint64_t v5 = [v4 allValues];

  return v5;
}

+ (uint64_t)isUnrecoverableDecryptionError:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  uint64_t v4 = [v2 code];
  if (+[_DKCKError isPartialError:](v3, v2))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = +[_DKCKError _allPartialErrorsFromError:](v3, v2);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          if (+[_DKCKError isUnrecoverableDecryptionError:](v3, *(void *)(*((void *)&v14 + 1) + 8 * v9)))
          {

            goto LABEL_15;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  else if (v4 == 112)
  {
    uint64_t v10 = [v2 domain];
    char v11 = [v10 isEqualToString:*MEMORY[0x1E4F19C40]];

    if (v11)
    {
LABEL_15:
      uint64_t v12 = 1;
      goto LABEL_16;
    }
  }
  uint64_t v12 = 0;
LABEL_16:

  return v12;
}

+ (id)zoneIDsWithUnrecoverableDecryptionError:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  uint64_t v4 = objc_opt_new();
  +[_DKCKError _populateZoneIDs:fromUnrecoverableDecryptionError:itemID:](v3, v4, v2, 0);

  return v4;
}

+ (void)_populateZoneIDs:(void *)a3 fromUnrecoverableDecryptionError:(void *)a4 itemID:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  if (+[_DKCKError isPartialError:](v9, v7))
  {
    id v24 = v8;
    uint64_t v10 = [v7 userInfo];
    char v11 = [v10 objectForKey:*MEMORY[0x1E4F19CD8]];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          long long v17 = [v11 objectForKeyedSubscript:v16];
          +[_DKCKError _populateZoneIDs:fromUnrecoverableDecryptionError:itemID:](v9, v6, v17, v16);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v13);
    }

    id v8 = v24;
  }
  else if ([v7 code] == 112)
  {
    id v18 = [v7 domain];
    int v19 = [v18 isEqualToString:*MEMORY[0x1E4F19C40]];

    if (v19)
    {
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = [v8 zoneID];
          [v6 addObject:v20];

          goto LABEL_22;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v6 addObject:v8];
          goto LABEL_22;
        }
        long long v21 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          +[_DKCKError _populateZoneIDs:fromUnrecoverableDecryptionError:itemID:](v9, v7, v21);
        }
      }
      else
      {
        long long v21 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          long long v22 = [(id)objc_opt_class() description];
          long long v23 = [v7 domain];
          *(_DWORD *)buf = 138544130;
          v30 = v22;
          __int16 v31 = 2114;
          v32 = v23;
          __int16 v33 = 2048;
          uint64_t v34 = [v7 code];
          __int16 v35 = 2112;
          id v36 = v7;
          _os_log_impl(&dword_18ECEB000, v21, OS_LOG_TYPE_INFO, "%{public}@: Missing zone id for Manatee identity failure: %{public}@:%lld (%@)", buf, 0x2Au);
        }
      }
    }
  }
LABEL_22:
}

+ (void)isIgnorableError:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unexpected xpc_activity state.", v0, 2u);
}

+ (void)_populateZoneIDs:(uint64_t)a1 fromUnrecoverableDecryptionError:(void *)a2 itemID:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(id)objc_opt_class() description];
  id v6 = [a2 domain];
  int v7 = 138544130;
  id v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  __int16 v11 = 2048;
  uint64_t v12 = [a2 code];
  __int16 v13 = 2112;
  uint64_t v14 = a2;
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Unexpected error itemID key: %{public}@:%lld (%@)", (uint8_t *)&v7, 0x2Au);
}

@end