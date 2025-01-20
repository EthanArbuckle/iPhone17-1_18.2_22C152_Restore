@interface HDCloudSyncShareParticipantManagerTaskServer
+ (BOOL)validateClient:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_fetchAllShareParticipantEmailAddressesForSharingType:(unint64_t)a3 completion:(id)a4;
- (void)remote_fetchSharingParticipantStatus:(id)a3;
- (void)remote_revokeAccessForAllShareParticipantsForSharingType:(unint64_t)a3 completion:(id)a4;
- (void)remote_tearDownHealthSharingForProfile:(id)a3 completion:(id)a4;
@end

@implementation HDCloudSyncShareParticipantManagerTaskServer

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2AD78] taskIdentifier];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  return [a3 hasRequiredArrayEntitlement:*MEMORY[0x1E4F2A558] containing:*MEMORY[0x1E4F29AF8] error:a4];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2AD78] clientInterface];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2AD78] serverInterface];
}

- (void)remote_fetchSharingParticipantStatus:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = HDTinkerProtectedKeyValueDomainWithProfile(v5);

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__124;
  v22 = __Block_byref_object_dispose__124;
  id v23 = 0;
  v7 = [(HDStandardTaskServer *)self profile];
  v8 = [v7 database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__HDCloudSyncShareParticipantManagerTaskServer_remote_fetchSharingParticipantStatus___block_invoke;
  v14[3] = &unk_1E62FA2C0;
  v16 = &v18;
  id v17 = 0;
  id v9 = v6;
  id v15 = v9;
  [v8 performHighPriorityTransactionsWithError:&v17 block:v14];
  id v10 = v17;

  v11 = (void *)v19[5];
  if (v11)
  {
    uint64_t v12 = [v11 integerValue];
  }
  else
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v25 = self;
      __int16 v26 = 2114;
      id v27 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch participant share status. Error: %{public}@", buf, 0x16u);
    }
    uint64_t v12 = 0;
  }
  v4[2](v4, v12);

  _Block_object_dispose(&v18, 8);
}

uint64_t __85__HDCloudSyncShareParticipantManagerTaskServer_remote_fetchSharingParticipantStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) numberForKey:@"HDCloudSyncSharingStatusKey" error:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

- (void)remote_fetchAllShareParticipantEmailAddressesForSharingType:(unint64_t)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = self;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }
  v11 = [(HDStandardTaskServer *)self profile];
  uint64_t v12 = [v11 cloudSyncManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __119__HDCloudSyncShareParticipantManagerTaskServer_remote_fetchAllShareParticipantEmailAddressesForSharingType_completion___block_invoke;
  v15[3] = &unk_1E62FB2D0;
  v15[4] = self;
  id v16 = v7;
  id v13 = v7;
  id v14 = (id)[v12 fetchShareParticipantsForSharingType:a3 completion:v15];
}

void __119__HDCloudSyncShareParticipantManagerTaskServer_remote_fetchAllShareParticipantEmailAddressesForSharingType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = v5;
  if (v4 || !v5)
  {
    id v32 = v5;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v11 = [v4 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v10 = 0;
      uint64_t v13 = *(void *)v35;
      unint64_t v14 = 0x1E4F1C000uLL;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v4);
          }
          id v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if ([v16 role] != 1)
          {
            if (!v10) {
              id v10 = objc_alloc_init(*(Class *)(v14 + 2688));
            }
            id v17 = [v16 userIdentity];
            uint64_t v18 = [v17 lookupInfo];
            __int16 v19 = [v18 emailAddress];

            if (v19)
            {
              uint64_t v20 = [v16 userIdentity];
              uint64_t v21 = [v20 lookupInfo];
              v22 = [v21 emailAddress];
              [v10 addObject:v22];
            }
            else
            {
              _HKInitializeLogging();
              id v23 = (void *)*MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
              {
                uint64_t v24 = *(void *)(a1 + 32);
                v25 = v23;
                __int16 v26 = [v16 userIdentity];
                id v27 = [v26 lookupInfo];
                *(_DWORD *)buf = 138543874;
                uint64_t v39 = v24;
                unint64_t v14 = 0x1E4F1C000;
                __int16 v40 = 2114;
                v41 = v16;
                __int16 v42 = 2114;
                v43 = v27;
                _os_log_fault_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_FAULT, "%{public}@ Received nil email address for fetched share participant %{public}@ with lookup info %{public}@", buf, 0x20u);
              }
            }
          }
        }
        uint64_t v12 = [v4 countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v12);
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v28 = *(void *)(a1 + 40);
    v29 = [v10 allObjects];
    (*(void (**)(uint64_t, void *, void))(v28 + 16))(v28, v29, 0);

    v6 = v32;
  }
  else
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v39 = v31;
      __int16 v40 = 2114;
      v41 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch participants from cloud zones, error: %{public}@", buf, 0x16u);
    }
    uint64_t v8 = objc_msgSend(v6, "hd_cloudKitErrorRequiringUserAction");
    uint64_t v9 = *(void *)(a1 + 40);
    if (v8)
    {
      id v10 = (id)v8;
      (*(void (**)(void, void, uint64_t))(v9 + 16))(*(void *)(a1 + 40), 0, v8);
    }
    else
    {
      v30 = objc_msgSend(v6, "hk_sanitizedError");
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v30);

      id v10 = 0;
    }
  }
}

- (void)remote_revokeAccessForAllShareParticipantsForSharingType:(unint64_t)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void, void *))a4;
  _HKInitializeLogging();
  uint64_t v8 = (os_log_t *)MEMORY[0x1E4F29FA8];
  uint64_t v9 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    uint64_t v11 = NSStringFromSelector(a2);
    int v20 = 138543618;
    uint64_t v21 = self;
    __int16 v22 = 2114;
    id v23 = v11;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", (uint8_t *)&v20, 0x16u);
  }
  uint64_t v12 = [(HDStandardTaskServer *)self profile];
  uint64_t v13 = [v12 profileType];

  if (v13 == 1)
  {
    unint64_t v14 = [(HDStandardTaskServer *)self profile];
    id v15 = [v14 cloudSyncManager];
    id v16 = (id)[v15 removeAllParticipantsForSharingType:a3 completion:v7];
  }
  else
  {
    _HKInitializeLogging();
    os_log_t v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = v17;
      __int16 v19 = NSStringFromSelector(a2);
      int v20 = 138543618;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      id v23 = v19;
      _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ Called on non-primary profile. Abort.", (uint8_t *)&v20, 0x16u);
    }
    unint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:class:selector:format:", 127, objc_opt_class(), a2, @"Revoke access for all share participants called on non-primary profile.");
    v7[2](v7, 0, v14);
  }
}

- (void)remote_tearDownHealthSharingForProfile:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  _HKInitializeLogging();
  uint64_t v9 = (os_log_t *)MEMORY[0x1E4F29FA8];
  id v10 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    uint64_t v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    long long v35 = self;
    __int16 v36 = 2114;
    long long v37 = v12;
    __int16 v38 = 2114;
    id v39 = v7;
    _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ called for profile %{public}@", buf, 0x20u);
  }
  uint64_t v13 = [(HDStandardTaskServer *)self profile];
  uint64_t v14 = [v13 profileType];

  if (v14 == 1)
  {
    id v15 = [(HDStandardTaskServer *)self profile];
    id v16 = [v15 daemon];
    os_log_t v17 = [v16 profileManager];

    uint64_t v18 = [v17 profileForIdentifier:v7];
    __int16 v19 = v18;
    if (v18)
    {
      if ([v18 profileType] != 1)
      {
        uint64_t v24 = [v19 cloudSyncManager];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __98__HDCloudSyncShareParticipantManagerTaskServer_remote_tearDownHealthSharingForProfile_completion___block_invoke;
        v30[3] = &unk_1E62F2A18;
        id v31 = v17;
        id v32 = v7;
        id v33 = v8;
        id v25 = (id)[v24 leaveSharesWithCompletion:v30];

        id v23 = v31;
        goto LABEL_15;
      }
      _HKInitializeLogging();
      os_log_t v20 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = v20;
        v29 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543618;
        long long v35 = self;
        __int16 v36 = 2114;
        long long v37 = v29;
        _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ Called for primary profile. Abort.", buf, 0x16u);
      }
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:class:selector:format:", 127, objc_opt_class(), a2, @"Tear down health sharing called for primary profile.");
    }
    else
    {
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"No profile for identifier %@."", v7);
    }
    id v23 = (void *)v21;
    (*((void (**)(id, void, uint64_t))v8 + 2))(v8, 0, v21);
LABEL_15:

    goto LABEL_16;
  }
  _HKInitializeLogging();
  os_log_t v22 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    __int16 v26 = v22;
    id v27 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    long long v35 = self;
    __int16 v36 = 2114;
    long long v37 = v27;
    _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ Must be called on primary profile participant manager. Abort.", buf, 0x16u);
  }
  os_log_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:class:selector:format:", 127, objc_opt_class(), a2, @"Tear down health sharing not called on primary profile participant manager.");
  (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v17);
LABEL_16:
}

void __98__HDCloudSyncShareParticipantManagerTaskServer_remote_tearDownHealthSharingForProfile_completion___block_invoke(void *a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2)
  {
    id v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    id v13 = 0;
    [v7 deleteProfile:v8 error:&v13];
    id v9 = v13;
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v10 = objc_msgSend(v5, "hd_cloudKitErrorRequiringUserAction");
    uint64_t v11 = a1[6];
    if (v10)
    {
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v10);
    }
    else
    {
      uint64_t v12 = objc_msgSend(v6, "hk_sanitizedError");
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
    }
  }
}

@end