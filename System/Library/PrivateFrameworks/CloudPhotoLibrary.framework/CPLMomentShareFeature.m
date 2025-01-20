@interface CPLMomentShareFeature
- (BOOL)disableFeatureInStore:(id)a3 error:(id *)a4;
- (BOOL)enableFeatureInStore:(id)a3 error:(id *)a4;
- (BOOL)handleScopeWhenFeatureIsDisabled:(id)a3 scopeType:(int64_t)a4 store:(id)a5 error:(id *)a6;
@end

@implementation CPLMomentShareFeature

- (BOOL)handleScopeWhenFeatureIsDisabled:(id)a3 scopeType:(int64_t)a4 store:(id)a5 error:(id *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    context = (void *)MEMORY[0x1BA993DF0]();
    if (!_CPLSilentLogging)
    {
      v11 = __CPLFeaturesOSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [v9 scopeIdentifier];
        v13 = +[CPLScopeChange descriptionForScopeType:a4];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v12;
        __int16 v37 = 2112;
        uint64_t v38 = (uint64_t)v13;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Automatically disabling %@ because feature for %@ is disabled", buf, 0x16u);
      }
    }
    v14 = [v10 scopes];
    v15 = [v10 downloadQueue];
    v16 = [MEMORY[0x1E4F1C9C8] date];
    v17 = [v14 flagsForScope:v9];
    [v17 setValue:1 forFlag:262152];
    id v35 = 0;
    int v18 = [v14 updateFlags:v17 forScope:v9 error:&v35];
    id v19 = v35;
    id v20 = v19;
    if (v18)
    {
      id v34 = v19;
      LODWORD(v21) = [v14 setDisabledDate:v16 forScope:v9 error:&v34];
      id v22 = v34;

      if (v21)
      {
        v31 = a6;
        uint64_t v23 = 0;
        id v20 = v22;
        do
        {
          v24 = v20;
          uint64_t v25 = v23;
          *(void *)buf = 0;
          uint64_t v26 = [v9 localIndex];
          id v33 = v20;
          LODWORD(v21) = [v15 deleteRecordsForScopeIndex:v26 maxCount:100 deletedCount:buf error:&v33];
          id v20 = v33;

          if (!v21) {
            break;
          }
          uint64_t v23 = *(void *)buf + v25;
        }
        while (*(uint64_t *)buf > 0);
        if (v25 > 0) {
          int v27 = v21;
        }
        else {
          int v27 = 0;
        }
        if (v27 == 1)
        {
          a6 = v31;
          if (!_CPLSilentLogging)
          {
            uint64_t v21 = __CPLFeaturesOSLogDomain();
            if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v28 = [v9 scopeIdentifier];
              *(_DWORD *)buf = 134218242;
              *(void *)&buf[4] = v25;
              __int16 v37 = 2112;
              uint64_t v38 = v28;
              v29 = (void *)v28;
              _os_log_impl(&dword_1B4CAC000, (os_log_t)v21, OS_LOG_TYPE_DEFAULT, "Removed %ld background downloads from queue for %@", buf, 0x16u);
            }
            LOBYTE(v21) = 1;
          }
        }
        else
        {
          a6 = v31;
        }
      }
      else
      {
        id v20 = v22;
      }
    }
    else
    {
      LOBYTE(v21) = 0;
    }

    if (a6 && (v21 & 1) == 0)
    {
      id v20 = v20;
      LOBYTE(v21) = 0;
      *a6 = v20;
    }
  }
  else
  {
    id v20 = 0;
    LOBYTE(v21) = 1;
  }

  return v21;
}

- (BOOL)enableFeatureInStore:(id)a3 error:(id *)a4
{
  uint64_t v23 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  v4 = [v24 scopes];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [v4 enumeratorForScopesIncludeInactive:0];
  uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v30;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v30 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
      v11 = (void *)MEMORY[0x1BA993DF0]();
      uint64_t v12 = [v10 scopeType];
      if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v13 = [v4 flagsForScope:v10];
        if ([v13 valueForFlag:0x40000])
        {
          if (!_CPLSilentLogging)
          {
            v14 = __CPLFeaturesOSLogDomain();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v15 = [v10 scopeIdentifier];
              *(_DWORD *)buf = 138412290;
              id v34 = v15;
              _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "Enabling %@", buf, 0xCu);
            }
          }
          objc_msgSend(v13, "setValue:forFlag:", 0, 262152, v23);
          id v28 = v7;
          char v16 = [v4 updateFlags:v13 forScope:v10 error:&v28];
          id v17 = v28;

          if ((v16 & 1) == 0)
          {

            id v7 = v17;
LABEL_28:

            BOOL v21 = 0;
            goto LABEL_29;
          }
          id v27 = v17;
          char v18 = [v4 setDisabledDate:0 forScope:v10 error:&v27];
          id v7 = v27;

          if ((v18 & 1) == 0) {
            goto LABEL_28;
          }
          goto LABEL_20;
        }
      }
      else if (!v12)
      {
        id v26 = v7;
        char v19 = [v4 setScopeNeedsUpdateFromTransport:v10 error:&v26];
        id v20 = v26;

        id v7 = v20;
        if ((v19 & 1) == 0) {
          goto LABEL_28;
        }
        goto LABEL_20;
      }
LABEL_20:
      if (v6 == ++v9)
      {
        uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_24;
      }
    }
  }
  id v7 = 0;
LABEL_24:

  if (v23)
  {
    id v7 = v7;
    *uint64_t v23 = v7;
  }
  BOOL v21 = 1;
LABEL_29:

  return v21;
}

- (BOOL)disableFeatureInStore:(id)a3 error:(id *)a4
{
  long long v31 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 scopes];
  long long v32 = v4;
  uint64_t v6 = [v4 downloadQueue];
  id v35 = [MEMORY[0x1E4F1C9C8] date];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [v5 enumeratorForScopesIncludeInactive:0];
  uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v41;
    id v33 = v5;
LABEL_3:
    uint64_t v11 = 0;
    uint64_t v34 = v8;
    while (1)
    {
      if (*(void *)v41 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1BA993DF0]();
      if (([v12 scopeType] & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        if (!_CPLSilentLogging)
        {
          v14 = __CPLFeaturesOSLogDomain();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = [v12 scopeIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v15;
            _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "Disabling %@", buf, 0xCu);
          }
        }
        char v16 = objc_msgSend(v5, "flagsForScope:", v12, v31);
        [v16 setValue:1 forFlag:262152];
        id v39 = v9;
        int v17 = [v5 updateFlags:v16 forScope:v12 error:&v39];
        id v18 = v39;

        if (!v17)
        {
          id v9 = v18;
LABEL_34:

LABEL_35:

          BOOL v29 = 0;
          goto LABEL_36;
        }
        id v38 = v18;
        int v19 = [v5 setDisabledDate:v35 forScope:v12 error:&v38];
        id v9 = v38;

        if (!v19) {
          goto LABEL_34;
        }
        uint64_t v20 = v10;
        uint64_t v21 = 0;
        do
        {
          id v22 = v9;
          uint64_t v23 = v21;
          *(void *)buf = 0;
          uint64_t v24 = [v12 localIndex];
          id v37 = v9;
          int v25 = [v6 deleteRecordsForScopeIndex:v24 maxCount:100 deletedCount:buf error:&v37];
          id v9 = v37;

          if (!v25) {
            break;
          }
          uint64_t v21 = *(void *)buf + v23;
        }
        while (*(uint64_t *)buf > 0);
        if (v23 > 0) {
          int v26 = v25;
        }
        else {
          int v26 = 0;
        }
        if (v26 != 1 || _CPLSilentLogging)
        {

          uint64_t v10 = v20;
          uint64_t v5 = v33;
          uint64_t v8 = v34;
          if ((v25 & 1) == 0) {
            goto LABEL_35;
          }
          goto LABEL_26;
        }
        id v27 = __CPLFeaturesOSLogDomain();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          id v28 = [v12 scopeIdentifier];
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = v23;
          __int16 v45 = 2112;
          v46 = v28;
          _os_log_impl(&dword_1B4CAC000, v27, OS_LOG_TYPE_DEFAULT, "Removed %ld background downloads from queue for %@", buf, 0x16u);
        }
        uint64_t v10 = v20;
        uint64_t v5 = v33;
        uint64_t v8 = v34;
      }
LABEL_26:
      if (++v11 == v8)
      {
        uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_30;
      }
    }
  }
  id v9 = 0;
LABEL_30:

  if (v31)
  {
    id v9 = v9;
    id *v31 = v9;
  }
  BOOL v29 = 1;
LABEL_36:

  return v29;
}

@end