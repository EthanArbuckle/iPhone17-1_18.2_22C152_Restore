@interface NSError(HealthDaemon)
- (double)hd_cloudKitRetryDelay;
- (id)hd_cloudKitErrorRequiringUserAction;
- (id)hd_errorForAnalytics;
- (id)hd_errorStrippingCloudKitPartialFailuresWithShouldIgnoreBlock:()HealthDaemon;
- (id)hd_errorSurfacingFatalCloudKitPartialFailure;
- (id)hd_errorSurfacingFatalCloudKitPartialFailureForAnalytics;
- (uint64_t)hd_errorStrippingExpectedCloudKitPartialFailures;
- (uint64_t)hd_isCorruptionError;
- (uint64_t)hd_isManateeIdentityLossError;
- (uint64_t)hd_shouldPreventCloudKitCacheUpdate;
- (void)hd_enumerateCloudKitPartialErrorsByKeyWithHandler:()HealthDaemon;
- (void)hd_enumerateCloudKitPartialErrorsWithHandler:()HealthDaemon;
@end

@implementation NSError(HealthDaemon)

- (id)hd_cloudKitErrorRequiringUserAction
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend(a1, "hk_isHealthKitError")) {
    goto LABEL_16;
  }
  if (objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 703))
  {
    id v2 = a1;
    goto LABEL_34;
  }
  if ([a1 code] != 711)
  {
    v10 = [a1 userInfo];
    uint64_t v11 = *MEMORY[0x1E4F28A50];
    v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    if (v12)
    {
      v13 = [a1 userInfo];
      v4 = [v13 objectForKeyedSubscript:v11];

      objc_msgSend(v4, "hd_cloudKitErrorRequiringUserAction");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_16:
    v14 = [a1 domain];
    int v15 = [v14 isEqualToString:*MEMORY[0x1E4F19C40]];

    if (v15)
    {
      v16 = -[NSError _hd_cloudKitErrorRequiringUserActionFromCKErrorDomain](a1);
      v4 = v16;
      if (v16)
      {
        id v9 = v16;
        goto LABEL_19;
      }
      if ([a1 code] == 2)
      {
        v17 = [a1 userInfo];
        v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

        _HKInitializeLogging();
        v19 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v37 = a1;
          __int16 v38 = 2114;
          v39 = v18;
          _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ partial error: %{public}@", buf, 0x16u);
        }
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v20 = objc_msgSend(v18, "allValues", 0);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v28;
          while (2)
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v28 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              if ([v25 code] != 22)
              {
                -[NSError _hd_cloudKitErrorRequiringUserActionFromCKErrorDomain](v25);
                id v2 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_20;
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }
      }
    }
LABEL_33:
    id v2 = 0;
    goto LABEL_34;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v3 = [a1 userInfo];
  v4 = [v3 objectForKeyedSubscript:0x1F1754600];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (!v5)
  {
LABEL_13:

    goto LABEL_33;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v32;
LABEL_7:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v32 != v7) {
      objc_enumerationMutation(v4);
    }
    objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v8), "hd_cloudKitErrorRequiringUserAction");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9) {
      break;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v6) {
        goto LABEL_7;
      }
      goto LABEL_13;
    }
  }
LABEL_19:
  id v2 = v9;
LABEL_20:

LABEL_34:

  return v2;
}

- (uint64_t)hd_isManateeIdentityLossError
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (!v3) {
    return 0;
  }
  if ([a1 code] == 112) {
    return 1;
  }
  if ([a1 code] != 2) {
    return 0;
  }
  uint64_t v5 = [a1 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v4 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v7);
        }
        v10 = objc_msgSend(v7, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        char v11 = objc_msgSend(v10, "hd_isManateeIdentityLossError");

        if (v11)
        {
          uint64_t v4 = 1;
          goto LABEL_17;
        }
      }
      uint64_t v4 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v4;
}

- (uint64_t)hd_shouldPreventCloudKitCacheUpdate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (!v3) {
    return 0;
  }
  if ([a1 code] == 111) {
    return 1;
  }
  if ([a1 code] != 2) {
    return 0;
  }
  uint64_t v5 = [a1 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v4 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v7);
        }
        v10 = objc_msgSend(v7, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        char v11 = objc_msgSend(v10, "hd_shouldPreventCloudKitCacheUpdate");

        if (v11)
        {
          uint64_t v4 = 1;
          goto LABEL_17;
        }
      }
      uint64_t v4 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v4;
}

- (uint64_t)hd_errorStrippingExpectedCloudKitPartialFailures
{
  return objc_msgSend(a1, "hd_errorStrippingCloudKitPartialFailuresWithShouldIgnoreBlock:", &__block_literal_global_181);
}

- (id)hd_errorStrippingCloudKitPartialFailuresWithShouldIgnoreBlock:()HealthDaemon
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  uint64_t v5 = [a1 domain];
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F19C40]];

  if ((v6 & 1) == 0)
  {
LABEL_20:
    id v22 = a1;
    goto LABEL_25;
  }
  if ([a1 code] != 2)
  {
    if (v4[2](v4, a1))
    {
      id v22 = 0;
      goto LABEL_25;
    }
    goto LABEL_20;
  }
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = [a1 userInfo];
  uint64_t v8 = *MEMORY[0x1E4F19CD8];
  id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    char v11 = v10;
    *(_DWORD *)buf = 134217984;
    uint64_t v37 = [v9 count];
    _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%ld partial errors", buf, 0xCu);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v12 = [v9 allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (!v13)
  {
    id v22 = 0;
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v14 = v13;
  id obj = v12;
  uint64_t v27 = v8;
  long long v28 = a1;
  uint64_t v15 = 0;
  uint64_t v16 = *(void *)v33;
  char v29 = 1;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v33 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * i);
      v19 = v9;
      v20 = objc_msgSend(v9, "objectForKeyedSubscript:", v18, v27);
      _HKInitializeLogging();
      uint64_t v21 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v37 = v15 + i + 1;
        __int16 v38 = 2114;
        v39 = v20;
        __int16 v40 = 2114;
        uint64_t v41 = v18;
        _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "     %2ld: Partial error: %{public}@, ID: %{public}@", buf, 0x20u);
      }
      if ((v4[2](v4, v20) & 1) == 0)
      {
        [v30 setObject:v20 forKeyedSubscript:v18];
        char v29 = 0;
      }

      id v9 = v19;
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    v15 += i;
  }
  while (v14);

  if ((v29 & 1) == 0)
  {
    uint64_t v23 = [v28 userInfo];
    v12 = (void *)[v23 mutableCopy];

    [v12 setObject:v30 forKeyedSubscript:v27];
    id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
    v25 = [v28 domain];
    id v22 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, objc_msgSend(v28, "code"), v12);

    goto LABEL_23;
  }
  id v22 = 0;
LABEL_24:

LABEL_25:

  return v22;
}

- (uint64_t)hd_isCorruptionError
{
  id v1 = a1;
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = *MEMORY[0x1E4F28A50];
  while ((objc_msgSend(v2, "hk_isHealthKitErrorWithCode:", 106) & 1) == 0
       && (objc_msgSend(v2, "hd_isDatabaseCorruptionError") & 1) == 0
       && (objc_msgSend(v2, "hd_isNotADatabaseError") & 1) == 0)
  {
    uint64_t v4 = [v2 userInfo];
    uint64_t v5 = [v4 objectForKeyedSubscript:v3];

    id v2 = (void *)v5;
    if (!v5)
    {
      uint64_t v6 = 0;
      goto LABEL_9;
    }
  }
  uint64_t v6 = 1;
LABEL_9:

  return v6;
}

- (id)hd_errorSurfacingFatalCloudKitPartialFailure
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F19C40];
  if (objc_msgSend(a1, "hk_isErrorInDomain:code:", *MEMORY[0x1E4F19C40], 2))
  {
    uint64_t v3 = [a1 userInfo];
    uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = objc_msgSend(v4, "allValues", 0);
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v9 code] != 11 && objc_msgSend(v9, "code") != 22)
          {
            id v6 = v9;
            goto LABEL_17;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  else if (objc_msgSend(a1, "hk_isInternalFailureError") {
         && (objc_msgSend(a1, "hk_underlyingErrorWithDomain:", v2),
  }
             (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v11 = v10;
    objc_msgSend(v10, "hd_errorSurfacingFatalCloudKitPartialFailure");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

- (id)hd_errorSurfacingFatalCloudKitPartialFailureForAnalytics
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F19C40];
  if (objc_msgSend(a1, "hk_isErrorInDomain:code:", *MEMORY[0x1E4F19C40], 2))
  {
    uint64_t v3 = [a1 userInfo];
    uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = objc_msgSend(v4, "allValues", 0);
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v9 code] != 22)
          {
            id v6 = v9;
            goto LABEL_16;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else if (objc_msgSend(a1, "hk_isInternalFailureError") {
         && (objc_msgSend(a1, "hk_underlyingErrorWithDomain:", v2),
  }
             (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v11 = v10;
    objc_msgSend(v10, "hd_errorSurfacingFatalCloudKitPartialFailureForAnalytics");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

- (id)hd_errorForAnalytics
{
  v35[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F29B68]];

  uint64_t v4 = [a1 userInfo];
  uint64_t v5 = v4;
  if (v3)
  {
    id v6 = objc_msgSend(v4, "hk_filter:", &__block_literal_global_296_0);

    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v8 = [a1 domain];
    id v9 = objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, objc_msgSend(a1, "code"), v6);
    v10 = objc_msgSend(v9, "hd_errorForAnalytics");

    char v11 = NSString;
    v12 = [v10 localizedDescription];
    long long v13 = [v11 stringWithFormat:@"%@: %@", v3, v12];

    uint64_t v34 = *MEMORY[0x1E4F28568];
    v35[0] = v13;
    long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    objc_msgSend(v10, "hk_errorByAddingEntriesToUserInfo:", v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_25;
  }
  uint64_t v16 = *MEMORY[0x1E4F28A50];
  v17 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (!v17)
  {
    id v15 = a1;
    goto LABEL_25;
  }
  if (objc_msgSend(a1, "hk_isInternalFailureError")) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = a1;
  }
  id v19 = v18;
  v20 = [v19 userInfo];
  uint64_t v21 = [v20 objectForKeyedSubscript:v16];

  if (!v21)
  {
    id v23 = v19;
LABEL_23:
    id v15 = v23;
    goto LABEL_24;
  }
  id v22 = [v19 domain];
  if ([v22 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    if ([v19 code] == 256)
    {

LABEL_20:
      id v23 = v21;
      goto LABEL_23;
    }
    uint64_t v32 = [v19 code];

    if (v32 == 512) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v24 = [v19 domain];
  int v25 = [v24 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v25)
  {
    objc_msgSend(v19, "hd_errorSurfacingFatalCloudKitPartialFailure");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v26 = [a1 domain];
  if (![v26 isEqualToString:*MEMORY[0x1E4F65CA8]])
  {

    goto LABEL_22;
  }
  uint64_t v27 = [a1 code];

  if (v27 != 2)
  {
LABEL_22:
    id v23 = a1;
    goto LABEL_23;
  }
  int v28 = objc_msgSend(a1, "hd_sqliteExtendedErrorCode");
  char v29 = (void *)MEMORY[0x1E4F28C58];
  id v30 = [v21 domain];
  long long v31 = [v21 userInfo];
  id v15 = [v29 errorWithDomain:v30 code:v28 userInfo:v31];

LABEL_24:
LABEL_25:

  return v15;
}

- (void)hd_enumerateCloudKitPartialErrorsWithHandler:()HealthDaemon
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  uint64_t v5 = [a1 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v6)
  {
    if ([a1 code] == 2)
    {
      id v7 = [a1 userInfo];
      uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v9 = objc_msgSend(v8, "allValues", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v16;
LABEL_5:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * v13);
          char v19 = 0;
          v4[2](v4, v14, &v19);
          if (v19) {
            break;
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
            if (v11) {
              goto LABEL_5;
            }
            break;
          }
        }
      }
    }
    else
    {
      char v19 = 0;
      v4[2](v4, (uint64_t)a1, &v19);
    }
  }
}

- (void)hd_enumerateCloudKitPartialErrorsByKeyWithHandler:()HealthDaemon
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  uint64_t v5 = [a1 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v6)
  {
    if ([a1 code] == 2)
    {
      id v7 = [a1 userInfo];
      uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v9 = objc_msgSend(v8, "allKeys", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
LABEL_5:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * v13);
          char v20 = 0;
          long long v15 = [v8 objectForKeyedSubscript:v14];
          v4[2](v4, v14, v15, &v20);

          if (v20) {
            break;
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
            if (v11) {
              goto LABEL_5;
            }
            break;
          }
        }
      }
    }
    else
    {
      char v20 = 0;
      v4[2](v4, 0, a1, &v20);
    }
  }
}

- (double)hd_cloudKitRetryDelay
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 domain];
  uint64_t v3 = *MEMORY[0x1E4F19C40];
  int v4 = [v2 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v4
    && ([a1 userInfo],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:*MEMORY[0x1E4F19C60]],
        int v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    [v6 doubleValue];
    double v8 = v7;
  }
  else
  {
    int v9 = objc_msgSend(a1, "hk_isErrorInDomain:code:", v3, 2);
    uint64_t v10 = [a1 userInfo];
    uint64_t v11 = v10;
    if (v9)
    {
      uint64_t v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v13 = objc_msgSend(v12, "allValues", 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v23;
        double v8 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if ([v18 code] != 11 && objc_msgSend(v18, "code") != 22)
            {
              objc_msgSend(v18, "hd_cloudKitRetryDelay");
              if (v8 < v19) {
                double v8 = v19;
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v15);
      }
      else
      {
        double v8 = 0.0;
      }
    }
    else
    {
      uint64_t v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      if (v12)
      {
        objc_msgSend(v12, "hd_cloudKitRetryDelay");
        double v8 = v20;
      }
      else
      {
        double v8 = 0.0;
      }
    }
  }
  return v8;
}

@end