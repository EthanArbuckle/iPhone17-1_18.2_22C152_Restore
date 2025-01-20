@interface HDCloudSyncMarkAllOwnersDisabledOperation
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncMarkAllOwnersDisabledOperation

- (void)main
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  v3 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
  taskGroup = self->_taskGroup;
  self->_taskGroup = v3;

  [(HDSynchronousTaskGroup *)self->_taskGroup setDelegate:self];
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 cachedCloudState];
  id v79 = 0;
  v7 = [v6 zonesByIdentifierWithError:&v79];
  id v8 = v79;

  if (!v7 && v8)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zone identifiers, %{public}@", buf, 0x16u);
    }
    v10 = self;
    uint64_t v11 = 0;
    id v12 = v8;
LABEL_47:
    [(HDCloudSyncOperation *)v10 finishWithSuccess:v11 error:v12];
    goto LABEL_48;
  }
  if (!v7)
  {
    _HKInitializeLogging();
    v55 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = self;
      _os_log_debug_impl(&dword_1BCB7D000, v55, OS_LOG_TYPE_DEBUG, "%{public}@ No cached zones found.", buf, 0xCu);
    }
    v10 = self;
    uint64_t v11 = 1;
    id v12 = 0;
    goto LABEL_47;
  }
  id v58 = v8;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obuint64_t j = [v7 allValues];
  uint64_t v14 = [obj countByEnumeratingWithState:&v75 objects:v82 count:16];
  v59 = v7;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v62 = *(void *)v76;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v76 != v62) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        uint64_t v18 = objc_opt_class();
        id v74 = 0;
        v19 = [v17 recordsForClass:v18 error:&v74];
        id v20 = v74;
        v21 = v20;
        if (v19) {
          BOOL v22 = 1;
        }
        else {
          BOOL v22 = v20 == 0;
        }
        if (!v22)
        {
          _HKInitializeLogging();
          v53 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            v56 = v53;
            v57 = [v17 zoneIdentifier];
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v57;
            *(_WORD *)&buf[22] = 2114;
            v84 = v21;
            _os_log_error_impl(&dword_1BCB7D000, v56, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);
          }
          [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v21];

          goto LABEL_43;
        }
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v23 = v19;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v70 objects:v81 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v71;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v71 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = [*(id *)(*((void *)&v70 + 1) + 8 * j) ownerIdentifier];
              [v13 addObject:v28];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v70 objects:v81 count:16];
          }
          while (v25);
        }

        v7 = v59;
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v75 objects:v82 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v29 = [(HDCloudSyncOperation *)self configuration];
  v30 = [v29 repository];
  v31 = [v30 allCKContainers];

  id obja = v31;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v66 objects:v80 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v63 = *(void *)v67;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v67 != v63) {
          objc_enumerationMutation(obja);
        }
        v35 = *(void **)(*((void *)&v66 + 1) + 8 * k);
        v36 = [(HDCloudSyncOperation *)self configuration];
        v37 = [v36 repository];
        v38 = [v37 profileIdentifier];
        v39 = HDDatabaseForContainer(v35, v38);

        if ([v39 databaseScope] == 2)
        {
          v40 = [v7 allValues];
          id v41 = v35;
          id v42 = v13;
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __104__HDCloudSyncMarkAllOwnersDisabledOperation__updatedRecordsForContainer_zones_disabledOwnerIdentifiers___block_invoke;
          v84 = &unk_1E630E138;
          id v43 = v41;
          *(void *)&long long v85 = v43;
          *((void *)&v85 + 1) = self;
          id v44 = v42;
          id v86 = v44;
          v45 = objc_msgSend(v40, "hk_map:", buf);

          if ([v45 count])
          {
            [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
            _HKInitializeLogging();
            v46 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              v47 = v46;
              uint64_t v48 = [v45 count];
              v49 = [v43 containerIdentifier];
              *(_DWORD *)buf = 138544130;
              *(void *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v48;
              *(_WORD *)&buf[22] = 2114;
              v84 = v49;
              LOWORD(v85) = 2114;
              *(void *)((char *)&v85 + 2) = v45;
              _os_log_impl(&dword_1BCB7D000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving %ld records in %{public}@: %{public}@", buf, 0x2Au);
            }
            v50 = [HDCloudSyncModifyRecordsOperation alloc];
            v51 = [(HDCloudSyncOperation *)self configuration];
            v52 = [(HDCloudSyncModifyRecordsOperation *)v50 initWithConfiguration:v51 container:v43 recordsToSave:v45 recordIDsToDelete:0];

            v65[0] = MEMORY[0x1E4F143A8];
            v65[1] = 3221225472;
            v65[2] = __49__HDCloudSyncMarkAllOwnersDisabledOperation_main__block_invoke;
            v65[3] = &unk_1E62F6020;
            v65[4] = self;
            v65[5] = v43;
            [(HDCloudSyncOperation *)v52 setOnError:v65];
            v64[0] = MEMORY[0x1E4F143A8];
            v64[1] = 3221225472;
            v64[2] = __49__HDCloudSyncMarkAllOwnersDisabledOperation_main__block_invoke_281;
            v64[3] = &unk_1E62F46F8;
            v64[4] = self;
            v64[5] = v43;
            [(HDCloudSyncOperation *)v52 setOnSuccess:v64];
            [(HDCloudSyncOperation *)v52 start];

            v7 = v59;
          }
        }
      }
      uint64_t v33 = [obja countByEnumeratingWithState:&v66 objects:v80 count:16];
    }
    while (v33);
  }

  [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
LABEL_43:
  id v8 = v58;

LABEL_48:
}

void __49__HDCloudSyncMarkAllOwnersDisabledOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    id v8 = v5;
    v9 = [v6 containerIdentifier];
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed updating records in %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 104) failTaskWithError:v4];
}

uint64_t __49__HDCloudSyncMarkAllOwnersDisabledOperation_main__block_invoke_281(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    v6 = [v3 containerIdentifier];
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished saving updated records in %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 104) finishTask];
}

id __104__HDCloudSyncMarkAllOwnersDisabledOperation__updatedRecordsForContainer_zones_disabledOwnerIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 zoneIdentifier];
  v5 = [v4 containerIdentifier];
  v6 = [*(id *)(a1 + 32) containerIdentifier];
  int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    goto LABEL_10;
  }
  int v8 = [v3 zoneIdentifier];
  uint64_t v9 = [v8 type];

  if (v9 == 2)
  {
    id v20 = *(void **)(a1 + 32);
    uint64_t v11 = *(void **)(a1 + 40);
    v21 = *(void **)(a1 + 48);
    id v13 = v3;
    id v22 = v20;
    id v23 = v21;
    if (v11)
    {
      id v60 = 0;
      uint64_t v24 = [v13 recordsForClass:objc_opt_class() error:&v60];
      id v25 = v60;
      uint64_t v26 = v25;
      if (v24 || !v25)
      {
        if ((unint64_t)[v24 count] >= 2)
        {
          _HKInitializeLogging();
          uint64_t v33 = (void *)*MEMORY[0x1E4F29F58];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_FAULT))
          {
            v53 = v33;
            [v13 zoneIdentifier];
            v55 = id v54 = v23;
            *(_DWORD *)buf = 138543874;
            uint64_t v62 = v11;
            __int16 v63 = 2114;
            id v64 = v22;
            __int16 v65 = 2114;
            long long v66 = v55;
            _os_log_fault_impl(&dword_1BCB7D000, v53, OS_LOG_TYPE_FAULT, "%{public}@ Fetched multiple Registry records from the cached container %{public}@, zone %{public}@. This is unexpected", buf, 0x20u);

            id v23 = v54;
          }
        }
        id v34 = [v24 firstObject];
        if (!v34)
        {
          v57 = [HDCloudSyncRegistryRecord alloc];
          id v58 = [v13 zoneIdentifier];
          [v58 zoneIdentifier];
          v56 = id v59 = v22;
          v35 = [v11 configuration];
          v36 = [v35 repository];
          [v36 profile];
          v38 = id v37 = v23;
          v39 = [v38 profileIdentifier];
          id v34 = [(HDCloudSyncRegistryRecord *)v57 initInZone:v56 ownerProfileIdentifier:v39];

          id v23 = v37;
          id v22 = v59;
        }
        v40 = [v34 disabledOwnerIdentifiers];
        id v41 = [v40 setByAddingObjectsFromSet:v23];
        [v34 setDisabledOwnerIdentifiers:v41];

        uint64_t v11 = [v34 record];
      }
      else
      {
        _HKInitializeLogging();
        v27 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          uint64_t v48 = v27;
          [v13 zoneIdentifier];
          v50 = id v49 = v23;
          *(_DWORD *)buf = 138543874;
          uint64_t v62 = v11;
          __int16 v63 = 2114;
          id v64 = v50;
          __int16 v65 = 2114;
          long long v66 = v26;
          _os_log_error_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get Registry records for %{public}@, %{public}@", buf, 0x20u);

          id v23 = v49;
        }
        [v11 finishWithSuccess:0 error:v26];
        uint64_t v11 = 0;
      }
    }
    goto LABEL_34;
  }
  if (v9)
  {
LABEL_10:
    uint64_t v11 = 0;
    goto LABEL_35;
  }
  __int16 v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v12 = *(void **)(a1 + 48);
  id v13 = v3;
  id v14 = v10;
  id v15 = v12;
  if (v11)
  {
    id v60 = 0;
    uint64_t v16 = [v13 recordsForClass:objc_opt_class() error:&v60];
    id v17 = v60;
    uint64_t v18 = v17;
    if (v16 || !v17)
    {
      if ((unint64_t)[v16 count] >= 2)
      {
        _HKInitializeLogging();
        v28 = (void *)*MEMORY[0x1E4F29F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_FAULT))
        {
          v51 = v28;
          v52 = [v13 zoneIdentifier];
          *(_DWORD *)buf = 138543874;
          uint64_t v62 = v11;
          __int16 v63 = 2114;
          id v64 = v14;
          __int16 v65 = 2114;
          long long v66 = v52;
          _os_log_fault_impl(&dword_1BCB7D000, v51, OS_LOG_TYPE_FAULT, "%{public}@ Fetched multiple Master records from the cached container %{public}@, zone %{public}@. This is unexpected", buf, 0x20u);
        }
      }
      v29 = [v16 firstObject];
      if (v29)
      {
        id v30 = v29;
        v31 = [v29 disabledOwnerIdentifiers];
        uint64_t v32 = [v31 setByAddingObjectsFromSet:v15];
        [v30 setDisabledOwnerIdentifiers:v32];
      }
      else
      {
        id v42 = [HDCloudSyncMasterRecord alloc];
        id v43 = [v13 zoneIdentifier];
        id v44 = [v43 zoneIdentifier];
        id v30 = [(HDCloudSyncMasterRecord *)v42 initInZone:v44 disabledOwnerIdentifiers:v15];
      }
      uint64_t v11 = [v30 record];
    }
    else
    {
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v46 = v19;
        v47 = [v13 zoneIdentifier];
        *(_DWORD *)buf = 138543874;
        uint64_t v62 = v11;
        __int16 v63 = 2114;
        id v64 = v47;
        __int16 v65 = 2114;
        long long v66 = v18;
        _os_log_error_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get Master records for %{public}@, %{public}@", buf, 0x20u);
      }
      [v11 finishWithSuccess:0 error:v18];
      uint64_t v11 = 0;
    }
  }
LABEL_34:

LABEL_35:

  return v11;
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (void).cxx_destruct
{
}

@end