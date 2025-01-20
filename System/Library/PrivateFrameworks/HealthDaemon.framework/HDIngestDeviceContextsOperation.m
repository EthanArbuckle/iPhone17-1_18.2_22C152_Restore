@interface HDIngestDeviceContextsOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDIngestDeviceContextsOperation)initWithAccessibilityAssertion:(id)a3 containerIdentifier:(id)a4;
- (HDIngestDeviceContextsOperation)initWithCoder:(id)a3;
- (id)transactionContext;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDIngestDeviceContextsOperation

- (HDIngestDeviceContextsOperation)initWithAccessibilityAssertion:(id)a3 containerIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDIngestDeviceContextsOperation;
  v9 = [(HDIngestDeviceContextsOperation *)&v12 init];
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
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v47 = a4;
  id v8 = v7;
  v9 = v8;
  v54 = self;
  v49 = v8;
  if (!self)
  {

LABEL_45:
    v45 = 0;
    BOOL v44 = 0;
    goto LABEL_46;
  }
  uint64_t v66 = 0;
  uint64_t v67 = (uint64_t)&v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__167;
  v70 = __Block_byref_object_dispose__167;
  id v71 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v76 = __Block_byref_object_copy__167;
  v77 = __Block_byref_object_dispose__167;
  id v78 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v11 = [v9 cloudSyncManager];
  uint64_t v59 = MEMORY[0x1E4F143A8];
  uint64_t v60 = 3221225472;
  v61 = __60__HDIngestDeviceContextsOperation__fetchRepositories_error___block_invoke;
  v62 = &unk_1E62F8348;
  v64 = buf;
  v65 = &v66;
  objc_super v12 = v10;
  v63 = (HDIngestDeviceContextsOperation *)v12;
  [v11 cloudSyncRepositoriesForClient:0 completion:&v59];

  dispatch_time_t v13 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v74 = 138543362;
      *(void *)&v74[4] = self;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Timed out waiting to complete journable operation", v74, 0xCu);
    }
  }
  v15 = *(void **)(v67 + 40);
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
  id obj = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v66, 8);

  if (!obj) {
    goto LABEL_45;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v53 = [obj countByEnumeratingWithState:&v55 objects:v73 count:16];
  if (v53)
  {
    id v18 = 0;
    uint64_t v52 = *(void *)v56;
    do
    {
      uint64_t v19 = 0;
      v20 = v18;
      do
      {
        if (*(void *)v56 != v52) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(id *)(*((void *)&v55 + 1) + 8 * v19);
        v22 = [[HDCloudSyncCachedCloudState alloc] initWithRepository:v21 accessibilityAssertion:v54->_assertion];
        containerIdentifier = v54->_containerIdentifier;
        *(void *)v74 = 0;
        v24 = [(HDCloudSyncCachedCloudState *)v22 contextSyncZoneForContainerID:containerIdentifier error:v74];
        id v25 = *(id *)v74;
        v26 = v25;
        if (v24) {
          BOOL v27 = 1;
        }
        else {
          BOOL v27 = v25 == 0;
        }
        if (v27)
        {
          if (v24)
          {
            uint64_t v28 = objc_opt_class();
            id v72 = v26;
            v29 = [v24 recordsForClass:v28 error:&v72];
            id v30 = v72;

            BOOL v51 = v29 != 0;
            if (v29)
            {
              _HKInitializeLogging();
              v31 = (void *)*MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
              {
                v32 = v31;
                uint64_t v33 = [v29 count];
                v34 = v54->_containerIdentifier;
                *(_DWORD *)buf = 134218242;
                *(void *)&buf[4] = v33;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v34;
                _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "Fetched %lu context records from the cache from %{public}@", buf, 0x16u);
              }
              uint64_t v59 = MEMORY[0x1E4F143A8];
              uint64_t v60 = 3221225472;
              v61 = __94__HDIngestDeviceContextsOperation__pullDeviceContextsForProfile_repository_transaction_error___block_invoke;
              v62 = &unk_1E63099B8;
              v63 = v54;
              v35 = objc_msgSend(v29, "hk_map:", &v59);
              v36 = [v21 cloudSyncShimProvider];
              v37 = [v36 contextSyncShim];
              uint64_t v66 = MEMORY[0x1E4F143A8];
              uint64_t v67 = 3221225472;
              uint64_t v68 = (uint64_t)__94__HDIngestDeviceContextsOperation__pullDeviceContextsForProfile_repository_transaction_error___block_invoke_280;
              v69 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62F2978;
              v70 = (void (*)(uint64_t))v54;
              [v37 ingestRemoteDeviceContexts:v35 completion:&v66];

              id v38 = v20;
            }
            else
            {
              id v41 = v30;
              v42 = v41;
              id v38 = v20;
              if (v41) {
                id v38 = v41;
              }
            }
            v26 = v30;
          }
          else
          {
            _HKInitializeLogging();
            v39 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              v40 = v54->_containerIdentifier;
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v54;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v40;
              _os_log_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: Context sync zone not present for container identifier: %{public}@", buf, 0x16u);
            }
            BOOL v51 = 1;
            id v38 = v20;
          }
        }
        else
        {
          id v38 = v25;
          BOOL v51 = 0;
          v26 = v38;
        }

        id v18 = v38;
        ++v19;
        v20 = v18;
      }
      while (v53 != v19);
      uint64_t v53 = [obj countByEnumeratingWithState:&v55 objects:v73 count:16];
    }
    while (v53);
    if (!v51)
    {
      id v43 = v18;
      id v18 = v43;
      if (v43)
      {
        if (a5) {
          *a5 = v43;
        }
        else {
          _HKLogDroppedError();
        }
      }

      BOOL v44 = 0;
      goto LABEL_43;
    }
  }
  else
  {
    id v18 = 0;
  }
  BOOL v44 = 1;
LABEL_43:

  v45 = obj;
LABEL_46:

  return v44;
}

void __60__HDIngestDeviceContextsOperation__fetchRepositories_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

id __94__HDIngestDeviceContextsOperation__pullDeviceContextsForProfile_repository_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v10 = 0;
  v4 = [v3 deviceContextWithError:&v10];
  id v5 = v10;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      id v14 = v3;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch context from record %{public}@, error: %{public}@", buf, 0x20u);
    }
  }

  return v4;
}

void __94__HDIngestDeviceContextsOperation__pullDeviceContextsForProfile_repository_transaction_error___block_invoke_280(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to ingest remote device context records, error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (id)transactionContext
{
  id v3 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
  v4 = [v3 contextWithAccessibilityAssertion:self->_assertion];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDIngestDeviceContextsOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContainerIdentifier"];

  id v6 = [(HDIngestDeviceContextsOperation *)self initWithAccessibilityAssertion:0 containerIdentifier:v5];
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