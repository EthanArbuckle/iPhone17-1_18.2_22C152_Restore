@interface HDCloudSyncDeleteRecordsOperation
+ (BOOL)shouldLogAtOperationStart;
- (HDCloudSyncDeleteRecordsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (NSArray)recordIDsToDelete;
- (void)main;
- (void)setRecordIDsToDelete:(id)a3;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncDeleteRecordsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (HDCloudSyncDeleteRecordsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HDCloudSyncDeleteRecordsOperation;
  v4 = [(HDCloudSyncOperation *)&v10 initWithConfiguration:a3 cloudState:a4];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v5->_taskGroup;
    v5->_taskGroup = v6;

    [(HDSynchronousTaskGroup *)v5->_taskGroup setDelegate:v5];
    recordIDsToDelete = v5->_recordIDsToDelete;
    v5->_recordIDsToDelete = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (NSArray)recordIDsToDelete
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_recordIDsToDelete;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setRecordIDsToDelete:(id)a3
{
  id v5 = a3;
  if ([(HDCloudSyncOperation *)self status])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDCloudSyncDeleteRecordsOperation.m", 62, @"Invalid parameter not satisfying: %@", @"self.status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  v6 = (NSArray *)[v5 copy];

  recordIDsToDelete = self->_recordIDsToDelete;
  self->_recordIDsToDelete = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)main
{
  v2 = self;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncDeleteRecordsOperation *)self recordIDsToDelete];
  if ([v3 count])
  {
    [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v4 = [(HDCloudSyncOperation *)v2 configuration];
    [v4 repository];
    id v5 = v35 = v3;
    v6 = [v5 allCKContainers];

    v3 = v35;
    id obj = v6;
    uint64_t v38 = [v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v38)
    {
      uint64_t v37 = *(void *)v44;
      *(void *)&long long v7 = 138543618;
      long long v34 = v7;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v44 != v37) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
          objc_super v10 = [(HDCloudSyncOperation *)v2 configuration];
          v11 = [v10 cachedCloudState];
          v12 = [v9 containerIdentifier];
          id v42 = 0;
          v13 = [v11 zonesForContainerID:v12 error:&v42];
          id v14 = v42;

          if (v13) {
            BOOL v15 = 1;
          }
          else {
            BOOL v15 = v14 == 0;
          }
          if (!v15)
          {
            _HKInitializeLogging();
            v16 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v34;
              v51 = v2;
              __int16 v52 = 2114;
              uint64_t v53 = (uint64_t)v14;
              _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
            }
            v17 = [(HDCloudSyncOperation *)v2 configuration];
            v18 = [v17 repository];
            v19 = [v18 primaryCKContainer];

            if (v9 == v19)
            {
              [(HDCloudSyncOperation *)v2 finishWithSuccess:0 error:v14];

              goto LABEL_25;
            }
          }
          v20 = objc_msgSend(v13, "hk_mapToSet:", &__block_literal_global_48);
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __41__HDCloudSyncDeleteRecordsOperation_main__block_invoke_2;
          v40[3] = &unk_1E62F6540;
          id v21 = v20;
          id v41 = v21;
          v22 = objc_msgSend(v3, "hk_filter:", v40);
          if ([v22 count])
          {
            id v39 = v14;
            id v23 = v22;
            id v24 = v9;
            [(HDSynchronousTaskGroup *)v2->_taskGroup beginTask];
            _HKInitializeLogging();
            v25 = (void *)*MEMORY[0x1E4F29FA8];
            v26 = v2;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              v27 = v25;
              uint64_t v28 = [v23 count];
              v29 = [v24 containerIdentifier];
              *(_DWORD *)buf = 138544130;
              v51 = v26;
              __int16 v52 = 2048;
              uint64_t v53 = v28;
              __int16 v54 = 2114;
              v55 = v29;
              __int16 v56 = 2114;
              id v57 = v23;
              _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting %ld records in %{public}@: %{public}@", buf, 0x2Au);

              v3 = v35;
            }
            v30 = [HDCloudSyncModifyRecordsOperation alloc];
            v31 = [(HDCloudSyncOperation *)v26 configuration];
            v32 = [(HDCloudSyncModifyRecordsOperation *)v30 initWithConfiguration:v31 container:v24 recordsToSave:0 recordIDsToDelete:v23];

            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = __62__HDCloudSyncDeleteRecordsOperation__deleteRecords_container___block_invoke;
            v48[3] = &unk_1E62F2950;
            v48[4] = v26;
            [(HDCloudSyncOperation *)v32 setOnError:v48];
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __62__HDCloudSyncDeleteRecordsOperation__deleteRecords_container___block_invoke_2;
            v47[3] = &unk_1E62F2928;
            v47[4] = v26;
            [(HDCloudSyncOperation *)v32 setOnSuccess:v47];
            [(HDCloudSyncOperation *)v32 start];

            v2 = v26;
            id v14 = v39;
          }

          ++v8;
        }
        while (v38 != v8);
        uint64_t v38 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
        if (v38) {
          continue;
        }
        break;
      }
    }

    [(HDSynchronousTaskGroup *)v2->_taskGroup finishTask];
  }
  else
  {
    _HKInitializeLogging();
    v33 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v51 = v2;
      _os_log_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_INFO, "%{public}@: Nothing to delete.", buf, 0xCu);
    }
    [(HDCloudSyncOperation *)v2 finishWithSuccess:1 error:0];
  }
LABEL_25:
}

id __41__HDCloudSyncDeleteRecordsOperation_main__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 zoneIdentifier];
  v3 = [v2 zoneIdentifier];

  return v3;
}

uint64_t __41__HDCloudSyncDeleteRecordsOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 zoneID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __62__HDCloudSyncDeleteRecordsOperation__deleteRecords_container___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "failTaskWithError:");
}

uint64_t __62__HDCloudSyncDeleteRecordsOperation__deleteRecords_container___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) finishTask];
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
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);

  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end