@interface HDAuthorizationStoreReadServer
+ (BOOL)validateClient:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_fetchAuthorizationContextForPromptSession:(id)a3 completion:(id)a4;
- (void)remote_fetchAuthorizationRecordsForSourceBundleIdentifier:(id)a3 completion:(id)a4;
- (void)remote_fetchAuthorizationRecordsForType:(id)a3 completion:(id)a4;
- (void)remote_fetchAuthorizationStatusesForDocumentType:(id)a3 sourceBundleIdentifier:(id)a4 completion:(id)a5;
- (void)remote_fetchAuthorizationStatusesForSampleUUID:(id)a3 completion:(id)a4;
- (void)remote_fetchSourcesRequestingAuthorizationForTypes:(id)a3 completion:(id)a4;
- (void)remote_validateRecalibrateEstimatesRequestRecord:(id)a3 completion:(id)a4;
@end

@implementation HDAuthorizationStoreReadServer

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F29748];
  if ([v5 hasRequiredEntitlement:*MEMORY[0x1E4F29748] error:a4])
  {
    v7 = [v5 valueForEntitlement:v6];
    objc_opt_class();
    int v8 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  char v9 = v8 | [v5 hasRequiredArrayEntitlement:v6 containing:*MEMORY[0x1E4F29B18] error:a4];

  return v9 & 1;
}

- (void)remote_fetchAuthorizationRecordsForSourceBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  v7 = (void (**)(id, void *, id))a4;
  id v8 = a3;
  char v9 = [v6 set];
  v10 = [(HDStandardTaskServer *)self profile];
  id v13 = 0;
  v11 = +[HDAuthorizationEntity authorizationRecordsByTypeForBundleIdentifier:v8 types:v9 profile:v10 error:&v13];

  id v12 = v13;
  v7[2](v7, v11, v12);
}

- (void)remote_fetchAuthorizationRecordsForType:(id)a3 completion:(id)a4
{
  id v7 = a3;
  if (v7)
  {
    id v8 = (void (**)(id, void *, id))a4;
    char v9 = [(HDStandardTaskServer *)self profile];
    id v14 = 0;
    v10 = +[HDAuthorizationEntity authorizationRecordsBySourceForType:v7 profile:v9 error:&v14];
    id v11 = v14;

    v8[2](v8, v10, v11);
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    id v13 = a4;
    v10 = objc_msgSend(v12, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"type may not be nil"");
    (*((void (**)(id, void, void *))a4 + 2))(v13, 0, v10);
  }
}

- (void)remote_fetchAuthorizationContextForPromptSession:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  id v8 = [(HDStandardTaskServer *)self profile];
  char v9 = [v8 authorizationManager];
  id v12 = 0;
  v10 = [v9 fetchAuthorizationContextForPromptSession:v7 error:&v12];

  id v11 = v12;
  v6[2](v6, v10, v11);
}

- (void)remote_fetchSourcesRequestingAuthorizationForTypes:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  id v8 = [(HDStandardTaskServer *)self profile];
  id v11 = 0;
  char v9 = +[HDAuthorizationEntity allSourcesRequestingTypes:v7 profile:v8 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)remote_fetchAuthorizationStatusesForDocumentType:(id)a3 sourceBundleIdentifier:(id)a4 completion:(id)a5
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, id))a5;
  if (v10)
  {
    id v12 = [(HDStandardTaskServer *)self profile];
    id v13 = [v12 sourceManager];
    id v44 = 0;
    id v14 = [v13 localSourceForBundleIdentifier:v10 error:&v44];
    id v15 = v44;

    if (v14)
    {
      id v43 = v15;
      v16 = +[HDObjectAuthorizationEntity authorizationStatusForSamplesOfType:v9 sourceEntity:v14 profile:v12 error:&v43];
      id v17 = v43;

      if (v16)
      {
        v33 = v14;
        id v34 = v10;
        v31 = v11;
        id v35 = v9;
        id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v46 = 0x1F17639A0;
        v47[0] = MEMORY[0x1E4F1CC38];
        v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        v32 = v16;
        id v18 = v16;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v45 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v40;
          while (2)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v40 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              if (objc_msgSend(v23, "status", v31))
              {
                v24 = [v23 objectUUID];
                id v38 = v17;
                v25 = v12;
                v26 = +[HDDataEntity objectWithUUID:v24 encodingOptions:v37 profile:v12 error:&v38];
                id v27 = v38;

                if (!v26)
                {
                  id v11 = v31;
                  v31[2](v31, 0, v27);

                  id v17 = v27;
                  id v12 = v25;
                  v29 = v36;
                  goto LABEL_19;
                }
                v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v23, "status"));
                [v36 setObject:v28 forKeyedSubscript:v26];

                id v17 = v27;
                id v12 = v25;
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v45 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }

        id v11 = v31;
        v29 = v36;
        ((void (**)(id, id, id))v31)[2](v31, v36, 0);
LABEL_19:

        id v10 = v34;
        id v9 = v35;
        v16 = v32;
        id v14 = v33;
      }
      else
      {
        v11[2](v11, 0, v17);
      }

      id v15 = v17;
    }
    else
    {
      v11[2](v11, 0, v15);
    }
  }
  else
  {
    v30 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"sourceBundleIdentifier may not be nil"");
    v11[2](v11, 0, v30);
  }
}

- (void)remote_fetchAuthorizationStatusesForSampleUUID:(id)a3 completion:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a4;
  if (v7)
  {
    id v9 = [(HDStandardTaskServer *)self profile];
    id v37 = 0;
    id v10 = +[HDObjectAuthorizationEntity authorizationRecordsBySourceForSampleWithUUID:v7 profile:v9 error:&v37];
    id v11 = v37;

    if (v10)
    {
      id v28 = v11;
      v30 = v8;
      id v31 = v7;
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v13 = [(HDStandardTaskServer *)self profile];
      id v14 = [v13 sourceManager];

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v29 = v10;
      id v15 = v10;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v34 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            id v32 = 0;
            uint64_t v21 = objc_msgSend(v14, "clientSourceForUUID:error:", v20, &v32, v28);
            id v22 = v32;
            if (v21)
            {
              v23 = NSNumber;
              v24 = [v15 objectForKeyedSubscript:v20];
              v25 = objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v24, "status"));
              [v12 setObject:v25 forKeyedSubscript:v21];
            }
            else
            {
              _HKInitializeLogging();
              v26 = *MEMORY[0x1E4F29EF8];
              id v27 = *MEMORY[0x1E4F29EF8];
              if (v22)
              {
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543618;
                  uint64_t v39 = v20;
                  __int16 v40 = 2114;
                  id v41 = v22;
                  _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_INFO, "Failed to retrieve source for UUID %{public}@: %{public}@", buf, 0x16u);
                }
                id v8 = v30;
                v30[2](v30, 0, v22);

                goto LABEL_21;
              }
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v39 = v20;
                _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "Found an authorization record for a source that does not exist (%{public}@); ignoring this record.",
                  buf,
                  0xCu);
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      id v8 = v30;
      ((void (**)(id, id, id))v30)[2](v30, v12, 0);
LABEL_21:
      id v7 = v31;
      id v11 = v28;
      id v10 = v29;
    }
    else
    {
      v8[2](v8, 0, v11);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"sampleUUID may not be nil"");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v11);
  }
}

- (void)remote_validateRecalibrateEstimatesRequestRecord:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(HDStandardTaskServer *)self profile];
  id v8 = [v9 authorizationManager];
  [v8 validateRecalibrateEstimatesRequestRecord:v7 completion:v6];
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7AD0](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7AC8](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2AC68] readTaskIdentifier];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end