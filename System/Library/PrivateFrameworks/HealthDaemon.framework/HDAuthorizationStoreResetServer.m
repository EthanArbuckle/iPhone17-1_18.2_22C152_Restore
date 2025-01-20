@interface HDAuthorizationStoreResetServer
+ (BOOL)validateClient:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_recalibrateEstimatesForSampleType:(id)a3 effectiveDate:(id)a4 completion:(id)a5;
- (void)remote_resetAuthorizationStatusForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)remote_resetAuthorizationStatusesForObjects:(id)a3 completion:(id)a4;
- (void)remote_resetObjectAuthorizationStatusForBundleIdentifier:(id)a3 objectType:(id)a4 completion:(id)a5;
@end

@implementation HDAuthorizationStoreResetServer

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
  char v9 = v8 | [v5 hasRequiredArrayEntitlement:v6 containing:*MEMORY[0x1E4F29B20] error:a4];

  return v9 & 1;
}

- (void)remote_resetObjectAuthorizationStatusForBundleIdentifier:(id)a3 objectType:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = (void (**)(id, BOOL, id))a5;
  char v9 = [(HDStandardTaskServer *)self profile];
  v10 = [v9 sourceManager];
  id v18 = 0;
  v11 = [v10 localSourceForBundleIdentifier:v7 error:&v18];
  id v12 = v18;

  if (v11)
  {
    v13 = [(HDStandardTaskServer *)self profile];
    id v17 = v12;
    BOOL v14 = +[HDObjectAuthorizationEntity resetObjectAuthorizationRecordsForSource:v11 profile:v13 error:&v17];
    id v15 = v17;

    v8[2](v8, v14, v15);
    id v12 = v15;
  }
  else
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v7;
      __int16 v21 = 2114;
      id v22 = v12;
      _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_INFO, "Failed to look up source for bundle identifier '%@' when reseting object authorization: %{public}@", buf, 0x16u);
    }
    v8[2](v8, 0, v12);
  }
}

- (void)remote_resetAuthorizationStatusesForObjects:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, BOOL, id))a4;
  int v8 = [(HDStandardTaskServer *)self profile];
  char v9 = [v8 database];
  id v17 = self;
  id v18 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __90__HDAuthorizationStoreResetServer_remote_resetAuthorizationStatusesForObjects_completion___block_invoke;
  v14[3] = &unk_1E62F5A88;
  id v15 = v6;
  id v16 = v8;
  id v10 = v8;
  id v11 = v6;
  BOOL v12 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v9 error:&v18 block:v14];
  id v13 = v18;

  v7[2](v7, v12, v13);
}

BOOL __90__HDAuthorizationStoreResetServer_remote_resetAuthorizationStatusesForObjects_completion___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a1[4], "hk_map:", &__block_literal_global_24);
  if (+[HDObjectAuthorizationEntity resetAuthorizationForObjects:v5 profile:a1[5] error:a3])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v26 = [a1[5] sourceManager];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = a1[4];
    uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v25 = *(void *)v28;
      uint64_t v23 = v5;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "sourceRevision", v23);
          BOOL v12 = [v11 source];
          id v13 = [v12 bundleIdentifier];

          BOOL v14 = [v26 localSourceForBundleIdentifier:v13 error:a3];
          id v15 = v14;
          if (!v14
            || ([v14 sourceUUIDWithProfile:a1[5] error:a3],
                (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
          {

            BOOL v21 = 0;
            id v5 = v23;
            id v20 = obj;
            goto LABEL_14;
          }
          id v17 = (void *)v16;
          id v18 = objc_alloc_init(MEMORY[0x1E4F2B2B8]);
          v19 = [v10 UUID];
          [v18 setObjectUUID:v19];

          [v18 setSourceUUID:v17];
          [v18 setModificationDate:CFAbsoluteTimeGetCurrent()];
          [v18 setStatus:0];
          [v6 addObject:v18];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        id v5 = v23;
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v20 = [a1[6] profile];
    BOOL v21 = +[HDObjectAuthorizationEntity setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:](HDObjectAuthorizationEntity, "setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:", v6, 0, [v20 currentSyncIdentityPersistentID], a1[5], a3);
LABEL_14:
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

uint64_t __90__HDAuthorizationStoreResetServer_remote_resetAuthorizationStatusesForObjects_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (void)remote_resetAuthorizationStatusForBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, BOOL, id))a4;
  if (v7)
  {
    char v9 = [(HDStandardTaskServer *)self profile];
    id v24 = 0;
    BOOL v10 = +[HDAuthorizationEntity resetAuthorizationStatusesForBundleIdentifier:v7 profile:v9 error:&v24];
    id v11 = v24;

    if (v10)
    {
      BOOL v12 = [(HDStandardTaskServer *)self profile];
      id v13 = [v12 sourceManager];
      id v23 = v11;
      BOOL v14 = [v13 localSourceForBundleIdentifier:v7 error:&v23];
      id v15 = v23;

      if (v14)
      {
        uint64_t v16 = [(HDStandardTaskServer *)self profile];
        id v22 = v15;
        BOOL v17 = +[HDObjectAuthorizationEntity resetObjectAuthorizationRecordsForSource:v14 profile:v16 error:&v22];
        id v11 = v22;

        if (!v17)
        {
          _HKInitializeLogging();
          id v18 = *MEMORY[0x1E4F29EF8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v26 = v7;
            __int16 v27 = 2114;
            id v28 = v11;
            _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "Failed to reset status for %{public}@ (object authorization records failure: %{public}@)", buf, 0x16u);
          }
        }
        v8[2](v8, v17, v11);
      }
      else
      {
        _HKInitializeLogging();
        BOOL v21 = *MEMORY[0x1E4F29EF8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v26 = v7;
          __int16 v27 = 2114;
          id v28 = v15;
          _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "Failed to reset status for %{public}@ (local source failure: %{public}@)", buf, 0x16u);
        }
        v8[2](v8, 0, v15);
        id v11 = v15;
      }
    }
    else
    {
      _HKInitializeLogging();
      id v20 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v26 = v7;
        __int16 v27 = 2114;
        id v28 = v11;
        _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "Failed to reset status for %{public}@ (authorization entity failure: %{public}@)", buf, 0x16u);
      }
      v8[2](v8, 0, v11);
    }
  }
  else
  {
    v19 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"bundleIdentifier may not be nil"");
    v8[2](v8, 0, v19);
  }
}

- (void)remote_recalibrateEstimatesForSampleType:(id)a3 effectiveDate:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  char v9 = (void (**)(id, void, void *))a5;
  BOOL v10 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v11 = [v8 compare:v10];

  if (v11 == 1)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Effective date (%@) cannot be in the future.", v8);
    BOOL v14 = LABEL_6:;
    v9[2](v9, 0, v14);

    goto LABEL_7;
  }
  if ([v7 code] != 183)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Estimate recalibration is not supported for %@.", v7);
    goto LABEL_6;
  }
  id v15 = 0;
  uint64_t v12 = [MEMORY[0x1E4F22270] resetPredictedWalkDistanceOnDate:v8 error:&v15];
  id v13 = v15;
  v9[2](v9, v12, v13);

LABEL_7:
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7AD8](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7AC8](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2AC68] resetTaskIdentifier];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end