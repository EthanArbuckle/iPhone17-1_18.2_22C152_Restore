@interface HDCloudSyncRepairRegistryRecordsOperation
+ (BOOL)shouldLogAtOperationStart;
- (HDCloudSyncRepairRegistryRecordsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncRepairRegistryRecordsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (HDCloudSyncRepairRegistryRecordsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncRepairRegistryRecordsOperation;
  v4 = [(HDCloudSyncOperation *)&v8 initWithConfiguration:a3 cloudState:a4];
  if (v4)
  {
    v5 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v4->_taskGroup;
    v4->_taskGroup = v5;

    [(HDSynchronousTaskGroup *)v4->_taskGroup setDelegate:v4];
  }
  return v4;
}

- (void)main
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 allCKContainers];

  id obj = v5;
  uint64_t v45 = [v5 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v45)
  {
    uint64_t v44 = *(void *)v47;
    *(void *)&long long v6 = 138543618;
    long long v42 = v6;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v47 != v44) {
          objc_enumerationMutation(obj);
        }
        objc_super v8 = *(void **)(*((void *)&v46 + 1) + 8 * v7);
        [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
        id v9 = v8;
        v10 = [(HDCloudSyncOperation *)self configuration];
        v11 = [v10 cachedCloudState];
        v12 = [v9 containerIdentifier];

        v51[0] = 0;
        v13 = [v11 unifiedSyncZoneForContainerID:v12 error:v51];
        id v14 = v51[0];

        if (v13)
        {
          uint64_t v15 = objc_opt_class();
          id v50 = v14;
          v16 = [v13 recordsForClass:v15 error:&v50];
          id v17 = v50;

          if (v16)
          {
            if ((unint64_t)[v16 count] >= 2)
            {
              _HKInitializeLogging();
              v18 = (void *)*MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
              {
                v38 = v18;
                v39 = [v13 zoneIdentifier];
                *(_DWORD *)buf = 138543874;
                *(void *)&buf[4] = self;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v39;
                *(_WORD *)&buf[22] = 2114;
                v55 = v17;
                _os_log_fault_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple registry records for %{public}@, %{public}@", buf, 0x20u);
              }
            }
            if ([v16 count] == 1)
            {
              v19 = [v16 firstObject];
              id v20 = 0;
LABEL_23:

              goto LABEL_28;
            }
LABEL_21:
            id v20 = 0;
          }
          else
          {
            if (!v17) {
              goto LABEL_21;
            }
            _HKInitializeLogging();
            v23 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              v40 = v23;
              v41 = [v13 zoneIdentifier];
              *(_DWORD *)buf = 138543874;
              *(void *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v41;
              *(_WORD *)&buf[22] = 2114;
              v55 = v17;
              _os_log_error_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get registry records for %{public}@, %{public}@", buf, 0x20u);
            }
            id v20 = v17;
          }
          v19 = 0;
          goto LABEL_23;
        }
        _HKInitializeLogging();
        v21 = *MEMORY[0x1E4F29FA8];
        v22 = *MEMORY[0x1E4F29FA8];
        if (v14)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v42;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v14;
            _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get unified zone %{public}@", buf, 0x16u);
          }
          id v20 = v14;
        }
        else
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = self;
            _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Unified zone does not exist.", buf, 0xCu);
          }
          id v20 = 0;
        }
        v19 = 0;
LABEL_28:

        id v24 = v20;
        if (!v19)
        {
          taskGroup = self->_taskGroup;
          if (v24)
          {
            [(HDSynchronousTaskGroup *)taskGroup failTaskWithError:v24];
            goto LABEL_35;
          }
          goto LABEL_33;
        }
        v25 = [v19 sharedProfileIdentifier];
        uint64_t v26 = [v25 type];

        if (v26 == 3)
        {
          taskGroup = self->_taskGroup;
LABEL_33:
          [(HDSynchronousTaskGroup *)taskGroup finishTask];
          goto LABEL_35;
        }
        v28 = (void *)MEMORY[0x1E4F2B358];
        v29 = [MEMORY[0x1E4F29128] UUID];
        v30 = [v28 _profileWithUUID:v29 type:3];
        [v19 setSharedProfileIdentifier:v30];

        v31 = [v19 record];
        v52 = v31;
        v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
        id v33 = v9;
        id v34 = v32;
        v35 = [HDCloudSyncModifyRecordsOperation alloc];
        v36 = [(HDCloudSyncOperation *)self configuration];
        v37 = [(HDCloudSyncModifyRecordsOperation *)v35 initWithConfiguration:v36 container:v33 recordsToSave:v34 recordIDsToDelete:0];

        [(HDCloudSyncModifyRecordsOperation *)v37 setTreatAnyErrorAsFatal:1];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __79__HDCloudSyncRepairRegistryRecordsOperation__modifyRecordsAndFinish_container___block_invoke;
        v55 = &unk_1E62F2950;
        v56 = self;
        [(HDCloudSyncOperation *)v37 setOnError:buf];
        v51[0] = (id)MEMORY[0x1E4F143A8];
        v51[1] = (id)3221225472;
        v51[2] = __79__HDCloudSyncRepairRegistryRecordsOperation__modifyRecordsAndFinish_container___block_invoke_283;
        v51[3] = &unk_1E62F2928;
        v51[4] = self;
        [(HDCloudSyncOperation *)v37 setOnSuccess:v51];
        [(HDCloudSyncOperation *)v37 start];

LABEL_35:
        ++v7;
      }
      while (v45 != v7);
      uint64_t v45 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v45);
  }

  [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
}

void __79__HDCloudSyncRepairRegistryRecordsOperation__modifyRecordsAndFinish_container___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update registry records: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 32) + 104) failTaskWithError:v4];
}

uint64_t __79__HDCloudSyncRepairRegistryRecordsOperation__modifyRecordsAndFinish_container___block_invoke_283(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully updated registry records", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(*(void *)(a1 + 32) + 104) finishTask];
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