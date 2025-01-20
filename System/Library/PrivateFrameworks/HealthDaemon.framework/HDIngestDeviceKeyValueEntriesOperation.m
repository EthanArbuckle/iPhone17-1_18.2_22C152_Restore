@interface HDIngestDeviceKeyValueEntriesOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDIngestDeviceKeyValueEntriesOperation)initWithAccessibilityAssertion:(id)a3 containerIdentifier:(id)a4;
- (HDIngestDeviceKeyValueEntriesOperation)initWithCoder:(id)a3;
- (id)transactionContext;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDIngestDeviceKeyValueEntriesOperation

- (HDIngestDeviceKeyValueEntriesOperation)initWithAccessibilityAssertion:(id)a3 containerIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDIngestDeviceKeyValueEntriesOperation;
  v9 = [(HDIngestDeviceKeyValueEntriesOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assertion, a3);
    objc_storeStrong((id *)&v10->_containerIdentifier, a4);
  }

  return v10;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v55 = a4;
  id v8 = v7;
  v9 = v8;
  v60 = self;
  v56 = v8;
  if (!self)
  {

LABEL_48:
    v50 = 0;
    BOOL v49 = 0;
    goto LABEL_49;
  }
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__36;
  v78 = __Block_byref_object_dispose__36;
  id v79 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = (uint64_t)&v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__36;
  v71 = __Block_byref_object_dispose__36;
  id v72 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v11 = [v9 cloudSyncManager];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __67__HDIngestDeviceKeyValueEntriesOperation__fetchRepositories_error___block_invoke;
  v83 = &unk_1E62F8348;
  v85 = &v67;
  v86 = &v74;
  objc_super v12 = v10;
  v84 = (HDIngestDeviceKeyValueEntriesOperation *)v12;
  [v11 cloudSyncRepositoriesForClient:0 completion:buf];

  dispatch_time_t v13 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      LODWORD(v87) = 138543362;
      *(void *)((char *)&v87 + 4) = self;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Timed out waiting to complete journable operation", (uint8_t *)&v87, 0xCu);
    }
  }
  v15 = (void *)v75[5];
  if (v15)
  {
    id v16 = v15;
    v17 = v16;
    if (a5) {
      *a5 = v16;
    }
    else {
      _HKLogDroppedError();
    }
  }
  id obj = *(id *)(v68 + 40);

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v74, 8);

  if (!obj) {
    goto LABEL_48;
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v57 = [obj countByEnumeratingWithState:&v63 objects:v81 count:16];
  if (v57)
  {
    id v18 = 0;
    uint64_t v54 = *(void *)v64;
    do
    {
      uint64_t v19 = 0;
      v61 = v18;
      do
      {
        if (*(void *)v64 != v54) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v63 + 1) + 8 * v19);
        id v62 = v61;
        id v58 = v56;
        id v21 = v20;
        id v59 = v55;
        uint64_t v74 = 0;
        v75 = &v74;
        uint64_t v76 = 0x3032000000;
        v77 = __Block_byref_object_copy__36;
        v78 = __Block_byref_object_dispose__36;
        id v79 = 0;
        id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v23 = [[HDCloudSyncCachedCloudState alloc] initWithRepository:v21 accessibilityAssertion:v60->_assertion];
        containerIdentifier = v60->_containerIdentifier;
        v25 = (id *)(v75 + 5);
        id v73 = (id)v75[5];
        v26 = [(HDCloudSyncCachedCloudState *)v23 contextSyncZoneForContainerID:containerIdentifier error:&v73];
        objc_storeStrong(v25, v73);
        if (v26)
        {
          uint64_t v27 = objc_opt_class();
          uint64_t v67 = MEMORY[0x1E4F143A8];
          uint64_t v68 = 3221225472;
          uint64_t v69 = (uint64_t)__108__HDIngestDeviceKeyValueEntriesOperation__pullDeviceKeyValueEntriesForProfile_repository_transaction_error___block_invoke;
          v70 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62F8370;
          v71 = (void (*)(uint64_t))v60;
          id v28 = v22;
          id v72 = v28;
          [v26 recordsForClass:v27 epoch:0 error:&v62 enumerationHandler:&v67];
          if ([v28 count])
          {
            v29 = (objc_class *)MEMORY[0x1E4F1CA80];
            id v30 = v26;
            id v31 = objc_alloc_init(v29);
            uint64_t v32 = objc_opt_class();
            id v80 = 0;
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __81__HDIngestDeviceKeyValueEntriesOperation__fetchRemoteCloudEntriesFromZone_error___block_invoke;
            v83 = &unk_1E62F8370;
            v84 = v60;
            v33 = (uint64_t *)v31;
            v85 = v33;
            char v34 = [v30 recordsForClass:v32 epoch:0 error:&v80 enumerationHandler:buf];

            id v35 = v80;
            v36 = v35;
            if (v34)
            {
              v37 = v33;
            }
            else
            {
              id v40 = v35;
              v41 = v40;
              if (v40) {
                id v62 = v40;
              }

              _HKInitializeLogging();
              v42 = *MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v92 = 138543618;
                v93 = v60;
                __int16 v94 = 2114;
                v95 = v41;
                _os_log_error_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Error enumerating over remote key value entries %{public}@", v92, 0x16u);
              }
              v37 = 0;
            }

            BOOL v39 = v37 != 0;
            if (v37)
            {
              v43 = [v21 cloudSyncShimProvider];
              v44 = [v43 contextSyncShim];
              *(void *)&long long v87 = MEMORY[0x1E4F143A8];
              *((void *)&v87 + 1) = 3221225472;
              v88 = __108__HDIngestDeviceKeyValueEntriesOperation__pullDeviceKeyValueEntriesForProfile_repository_transaction_error___block_invoke_281;
              v89 = &unk_1E62F8398;
              v91 = &v74;
              v90 = v60;
              [v44 updateKeyValuePairsForRemoteEntries:v37 deviceContexts:v28 completion:&v87];
            }
          }
          else
          {
            BOOL v39 = 1;
          }
        }
        else
        {
          v38 = (void *)v75[5];
          if (v38)
          {
            id v62 = v38;

            BOOL v39 = 0;
          }
          else
          {
            _HKInitializeLogging();
            v45 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              v46 = v60->_containerIdentifier;
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v60;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v46;
              _os_log_impl(&dword_1BCB7D000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: Context sync zone not present for container identifier: %{public}@", buf, 0x16u);
            }
            BOOL v39 = 1;
          }
        }

        _Block_object_dispose(&v74, 8);
        id v18 = v62;

        ++v19;
        v61 = v18;
      }
      while (v57 != v19);
      uint64_t v47 = [obj countByEnumeratingWithState:&v63 objects:v81 count:16];
      uint64_t v57 = v47;
    }
    while (v47);
    if (!v39)
    {
      id v48 = v18;
      id v18 = v48;
      if (v48)
      {
        if (a5) {
          *a5 = v48;
        }
        else {
          _HKLogDroppedError();
        }
      }

      BOOL v49 = 0;
      goto LABEL_46;
    }
  }
  else
  {
    id v18 = 0;
  }
  BOOL v49 = 1;
LABEL_46:

  v50 = obj;
LABEL_49:

  return v49;
}

void __67__HDIngestDeviceKeyValueEntriesOperation__fetchRepositories_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __108__HDIngestDeviceKeyValueEntriesOperation__pullDeviceKeyValueEntriesForProfile_repository_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v11 = 0;
  v4 = [v3 deviceContext:&v11];
  id v5 = v11;
  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v4];
  }
  else
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = v6;
      dispatch_semaphore_t v10 = [v3 recordID];
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Error creating device context from record(%{public}@) %{public}@", buf, 0x20u);
    }
  }

  return 1;
}

void __108__HDIngestDeviceKeyValueEntriesOperation__pullDeviceKeyValueEntriesForProfile_repository_transaction_error___block_invoke_281(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = v4;
    uint64_t v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;

    _HKInitializeLogging();
    uint64_t v9 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update device key value pairs: %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
}

uint64_t __81__HDIngestDeviceKeyValueEntriesOperation__fetchRemoteCloudEntriesFromZone_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v16 = 0;
  id v7 = [v6 deviceKeyValueEntry:&v16];
  id v8 = v16;
  uint64_t v9 = v8;
  if (v7)
  {
    [*(id *)(a1 + 40) addObject:v7];
  }
  else
  {
    id v10 = v8;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    uint64_t v11 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      __int16 v14 = v11;
      uint64_t v15 = [v6 recordID];
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      v20 = v15;
      __int16 v21 = 2114;
      id v22 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching key value entry for remote record(%{public}@) during deleting local entries %{public}@", buf, 0x20u);
    }
  }

  return 1;
}

- (id)transactionContext
{
  id v3 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
  id v4 = [v3 contextWithAccessibilityAssertion:self->_assertion];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDIngestDeviceKeyValueEntriesOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContainerIdentifier"];

  id v6 = [(HDIngestDeviceKeyValueEntriesOperation *)self initWithAccessibilityAssertion:0 containerIdentifier:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);

  objc_storeStrong((id *)&self->_assertion, 0);
}

@end