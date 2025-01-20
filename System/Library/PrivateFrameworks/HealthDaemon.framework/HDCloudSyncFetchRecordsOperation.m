@interface HDCloudSyncFetchRecordsOperation
- (HDCloudSyncFetchRecordsOperation)initWithConfiguration:(id)a3 container:(id)a4 recordIDs:(id)a5;
- (NSArray)recordIDs;
- (id)recordHandler;
- (void)_fetchRecordsWithIDs:(void *)a3 container:(void *)a4 database:(void *)a5 completion:;
- (void)main;
- (void)setRecordHandler:(id)a3;
- (void)setRecordIDs:(id)a3;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncFetchRecordsOperation

- (HDCloudSyncFetchRecordsOperation)initWithConfiguration:(id)a3 container:(id)a4 recordIDs:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDCloudSyncFetchRecordsOperation;
  v11 = [(HDCloudSyncOperation *)&v16 initWithConfiguration:a3 cloudState:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_container, a4);
    objc_storeStrong((id *)&v12->_recordIDs, a5);
    v12->_lock._os_unfair_lock_opaque = 0;
    v13 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v12->_taskGroup;
    v12->_taskGroup = v13;

    [(HDSynchronousTaskGroup *)v12->_taskGroup setDelegate:v12];
  }

  return v12;
}

- (void)main
{
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  recordIDs = self->_recordIDs;
  container = self->_container;
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 repository];
  v7 = [v6 profileIdentifier];
  v8 = HDDatabaseForContainer(container, v7);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__HDCloudSyncFetchRecordsOperation_main__block_invoke;
  v9[3] = &unk_1E62F3208;
  v9[4] = self;
  -[HDCloudSyncFetchRecordsOperation _fetchRecordsWithIDs:container:database:completion:]((id *)&self->super.super.isa, recordIDs, container, v8, v9);
}

uint64_t __40__HDCloudSyncFetchRecordsOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) finishTask];
}

- (void)_fetchRecordsWithIDs:(void *)a3 container:(void *)a4 database:(void *)a5 completion:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  v12 = a5;
  if (a1)
  {
    if ([v9 count])
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F1A0A8]) initWithRecordIDs:v9];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __87__HDCloudSyncFetchRecordsOperation__fetchRecordsWithIDs_container_database_completion___block_invoke;
      v25[3] = &unk_1E6303B40;
      v25[4] = a1;
      id v14 = v10;
      id v26 = v14;
      id v15 = v11;
      id v27 = v15;
      [v13 setPerRecordCompletionBlock:v25];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __87__HDCloudSyncFetchRecordsOperation__fetchRecordsWithIDs_container_database_completion___block_invoke_283;
      v21[3] = &unk_1E6303B68;
      v21[4] = a1;
      id v22 = v14;
      id v16 = v15;
      id v23 = v16;
      v24 = v12;
      [v13 setFetchRecordsCompletionBlock:v21];
      [a1[15] beginTask];
      v17 = [a1 configuration];
      v18 = [v17 cachedCloudState];
      objc_msgSend(v18, "setOperationCountForAnalytics:", objc_msgSend(v18, "operationCountForAnalytics") + 1);

      v19 = [a1 configuration];
      v20 = [v19 operationGroup];
      [v13 setGroup:v20];

      objc_msgSend(v16, "hd_addOperation:", v13);
    }
    else
    {
      v12[2](v12);
    }
  }
}

void __87__HDCloudSyncFetchRecordsOperation__fetchRecordsWithIDs_container_database_completion___block_invoke(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (!a2 && objc_msgSend(v6, "hk_isErrorInDomain:code:", *MEMORY[0x1E4F19C40], 26))
  {
    v8 = [a1[4] configuration];
    id v9 = [v8 cachedCloudState];
    id v10 = [a1[5] containerIdentifier];
    uint64_t v11 = [a1[6] databaseScope];
    id v26 = 0;
    int v12 = [v9 resetServerChangeTokenForContainerIdentifier:v10 databaseScope:v11 error:&v26];
    id v13 = v26;

    _HKInitializeLogging();
    id v14 = *MEMORY[0x1E4F29FA8];
    id v15 = *MEMORY[0x1E4F29FA8];
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = a1[4];
        *(_DWORD *)buf = 138543618;
        id v28 = v16;
        __int16 v29 = 2114;
        v30 = v7;
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Reset cache server change token after encountering unexpected zone-not-found error during record fetch (%{public}@)", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v25 = a1[4];
      *(_DWORD *)buf = 138543874;
      id v28 = v25;
      __int16 v29 = 2114;
      v30 = v7;
      __int16 v31 = 2114;
      id v32 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: FAILED attempting reset of cache server change token after encountering unexpected zone-not-found error during record fetch (%{public}@): %{public}@", buf, 0x20u);
    }
    v17 = [a1[4] configuration];
    v18 = [v17 repository];
    v19 = [v18 profile];
    v20 = [v19 daemon];
    v21 = [v20 analyticsSubmissionCoordinator];
    id v22 = a1[4];
    id v23 = [a1[5] containerIdentifier];
    v24 = HDCKDatabaseScopeToString([a1[6] databaseScope]);
    objc_msgSend(v21, "cloudCache_reportCacheDiscrepancyForOperation:reason:containerIdentifier:databaseScope:error:", v22, @"Zone Not Found", v23, v24, v7);
  }
}

void __87__HDCloudSyncFetchRecordsOperation__fetchRecordsWithIDs_container_database_completion___block_invoke_283(uint64_t a1, void *a2, void *a3)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v61 = a2;
  id v56 = a3;
  if (v56)
  {
    _HKInitializeLogging();
    v5 = (os_log_t *)MEMORY[0x1E4F29FA8];
    id v6 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v52 = *(void *)(a1 + 32);
      uint64_t v51 = *(void *)(a1 + 40);
      v53 = *(void **)(a1 + 48);
      v54 = v6;
      [v53 databaseScope];
      v55 = CKDatabaseScopeString();
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v52;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v51;
      *(_WORD *)&buf[22] = 2114;
      v76 = v55;
      LOWORD(v77) = 2114;
      *(void *)((char *)&v77 + 2) = v56;
      _os_log_error_impl(&dword_1BCB7D000, v54, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch records in container %{public}@ database %{public}@ with error %{public}@", buf, 0x2Au);
    }
    if (objc_msgSend(v56, "hk_isErrorInDomain:code:", *MEMORY[0x1E4F19C40], 27))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(void **)(v7 + 128);
      id v9 = *(void **)(v7 + 104);
      uint64_t v11 = *(void **)(a1 + 48);
      id v10 = *(void **)(a1 + 56);
      id v59 = v56;
      id v12 = v8;
      id v13 = v9;
      id v14 = v11;
      id v15 = v10;
      _HKInitializeLogging();
      os_log_t v16 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        uint64_t v18 = [v12 count];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v7;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Limit exceeded fectching %ld records. Splitting record request in half and re-fetching.", buf, 0x16u);
      }
      if ((unint64_t)[v12 count] < 2)
      {
        [*(id *)(v7 + 120) failTaskWithError:v59];
      }
      else
      {
        unint64_t v19 = (unint64_t)[v12 count] >> 1;
        v20 = objc_msgSend(v12, "subarrayWithRange:", 0, v19);
        v21 = objc_msgSend(v12, "subarrayWithRange:", v19, objc_msgSend(v12, "count") - v19);
        v71[0] = 0;
        v71[1] = v71;
        v71[2] = 0x2020000000;
        v71[3] = 2;
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __117__HDCloudSyncFetchRecordsOperation__receivedLimitExceededError_fetchingRecordsWithIDs_container_database_completion___block_invoke;
        v76 = &unk_1E6303B90;
        *(void *)&long long v77 = v7;
        v78 = v71;
        id v22 = v15;
        *((void *)&v77 + 1) = v22;
        -[HDCloudSyncFetchRecordsOperation _fetchRecordsWithIDs:container:database:completion:](v7, v20, v13, v14, buf);
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = __117__HDCloudSyncFetchRecordsOperation__receivedLimitExceededError_fetchingRecordsWithIDs_container_database_completion___block_invoke_2;
        v68[3] = &unk_1E6303B90;
        v68[4] = v7;
        v70 = v71;
        id v69 = v22;
        -[HDCloudSyncFetchRecordsOperation _fetchRecordsWithIDs:container:database:completion:](v7, v21, v13, v14, v68);
        [*(id *)(v7 + 120) finishTask];

        _Block_object_dispose(v71, 8);
      }

      goto LABEL_35;
    }
    id v23 = objc_msgSend(v56, "hd_errorSurfacingFatalCloudKitPartialFailure");
    if (v23)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      [*(id *)(*(void *)(a1 + 32) + 120) failTaskWithError:v23];

      goto LABEL_35;
    }
  }
  id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = [v61 allKeys];
  uint64_t v24 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (v24)
  {
    uint64_t v60 = *(void *)v65;
    while (2)
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v65 != v60) {
          objc_enumerationMutation(obj);
        }
        id v26 = *(void **)(*((void *)&v64 + 1) + 8 * v25);
        id v27 = [HDCloudSyncZoneIdentifier alloc];
        id v28 = [v26 zoneID];
        __int16 v29 = [*(id *)(*(void *)(a1 + 32) + 104) containerIdentifier];
        id v30 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v27, "initForZone:container:scope:", v28, v29, [*(id *)(a1 + 48) databaseScope]);

        __int16 v31 = [HDCloudSyncCachedZone alloc];
        id v32 = [*(id *)(a1 + 32) configuration];
        uint64_t v33 = [v32 repository];
        v34 = [*(id *)(a1 + 32) configuration];
        v35 = [v34 accessibilityAssertion];
        id v36 = [(HDCloudSyncCachedZone *)v31 initForZoneIdentifier:v30 repository:v33 accessibilityAssertion:v35];

        v37 = [v61 objectForKeyedSubscript:v26];
        id v63 = 0;
        LODWORD(v34) = [v36 addRecord:v37 error:&v63];
        id v38 = v63;

        if (!v34)
        {
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          [*(id *)(*(void *)(a1 + 32) + 120) failTaskWithError:v38];

          goto LABEL_34;
        }
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
        uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 136);
        if (v39)
        {
          v40 = [v61 objectForKeyedSubscript:v26];
          id v62 = v38;
          char v41 = (*(uint64_t (**)(uint64_t, void *, id *))(v39 + 16))(v39, v40, &v62);
          id v42 = v62;

          if ((v41 & 1) == 0) {
            [v57 addObject:v42];
          }
        }
        else
        {
          id v42 = v38;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));

        ++v25;
      }
      while (v24 != v25);
      uint64_t v24 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }

  if ([v57 count])
  {
    uint64_t v43 = [v57 count];
    v44 = (id *)MEMORY[0x1E4F28A50];
    if (v43 != 1) {
      v44 = (id *)MEMORY[0x1E4F28750];
    }
    id v45 = *v44;
    if ([v57 count] == 1)
    {
      id v46 = [v57 firstObject];
    }
    else
    {
      id v46 = v57;
    }
    v47 = v46;
    v72[0] = *MEMORY[0x1E4F28568];
    v72[1] = v45;
    v73[0] = @"Error processing fetched records";
    v73[1] = v46;
    v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    v49 = *(void **)(*(void *)(a1 + 32) + 120);
    v50 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:userInfo:", 100, v48);
    [v49 failTaskWithError:v50];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(*(void *)(a1 + 32) + 120) finishTask];
  }
LABEL_34:

LABEL_35:
}

void __117__HDCloudSyncFetchRecordsOperation__receivedLimitExceededError_fetchingRecordsWithIDs_container_database_completion___block_invoke(void *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 112));
  uint64_t v2 = --*(void *)(*(void *)(a1[6] + 8) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 112));
  if (!v2)
  {
    v3 = *(void (**)(void))(a1[5] + 16);
    v3();
  }
}

void __117__HDCloudSyncFetchRecordsOperation__receivedLimitExceededError_fetchingRecordsWithIDs_container_database_completion___block_invoke_2(void *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 112));
  uint64_t v2 = --*(void *)(*(void *)(a1[6] + 8) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 112));
  if (!v2)
  {
    v3 = *(void (**)(void))(a1[5] + 16);
    v3();
  }
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
}

- (id)recordHandler
{
  return self->_recordHandler;
}

- (void)setRecordHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recordHandler, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

@end