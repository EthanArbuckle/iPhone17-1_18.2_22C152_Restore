@interface HDCloudSyncDeleteZonesOperation
- (HDCloudSyncDeleteZonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (NSArray)zonesToDelete;
- (void)main;
- (void)setZonesToDelete:(id)a3;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncDeleteZonesOperation

- (HDCloudSyncDeleteZonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HDCloudSyncDeleteZonesOperation;
  v4 = [(HDCloudSyncOperation *)&v10 initWithConfiguration:a3 cloudState:a4];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v5->_taskGroup;
    v5->_taskGroup = v6;

    [(HDSynchronousTaskGroup *)v5->_taskGroup setDelegate:v5];
    zonesToDelete = v5->_zonesToDelete;
    v5->_zonesToDelete = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (NSArray)zonesToDelete
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_zonesToDelete;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setZonesToDelete:(id)a3
{
  id v5 = a3;
  if ([(HDCloudSyncOperation *)self status])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDCloudSyncDeleteZonesOperation.m", 57, @"Invalid parameter not satisfying: %@", @"self.status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  v6 = (NSArray *)[v5 copy];

  zonesToDelete = self->_zonesToDelete;
  self->_zonesToDelete = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)main
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v28 = [(HDCloudSyncDeleteZonesOperation *)self zonesToDelete];
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  id v5 = [v4 allCKContainers];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v27 = *(void *)v31;
    *(void *)&long long v7 = 138544130;
    long long v25 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(obj);
        }
        objc_super v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __39__HDCloudSyncDeleteZonesOperation_main__block_invoke;
        v29[3] = &unk_1E62F5FD8;
        v29[4] = v10;
        v11 = objc_msgSend(v28, "hk_filter:", v29, v25);
        if ([v11 count])
        {
          id v12 = v11;
          id v13 = v10;
          [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
          v14 = objc_msgSend(v12, "hk_map:", &__block_literal_global_28);
          _HKInitializeLogging();
          v15 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            uint64_t v17 = [v12 count];
            v18 = [v13 containerIdentifier];
            *(_DWORD *)buf = v25;
            v41 = self;
            __int16 v42 = 2048;
            uint64_t v43 = v17;
            __int16 v44 = 2114;
            v45 = v18;
            __int16 v46 = 2114;
            v47 = v14;
            _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting %ld zones in %{public}@: %{public}@", buf, 0x2Au);
          }
          v19 = [HDCloudSyncModifyRecordZonesOperation alloc];
          v20 = [(HDCloudSyncOperation *)self configuration];
          v21 = [(HDCloudSyncModifyRecordZonesOperation *)v19 initWithConfiguration:v20 container:v13 recordZonesToSave:0 recordZoneIDsToDelete:v14];

          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __58__HDCloudSyncDeleteZonesOperation__deleteZones_container___block_invoke_290;
          v37[3] = &unk_1E62F6020;
          v37[4] = self;
          id v22 = v13;
          id v38 = v22;
          [(HDCloudSyncOperation *)v21 setOnError:v37];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __58__HDCloudSyncDeleteZonesOperation__deleteZones_container___block_invoke_292;
          v34[3] = &unk_1E62F6048;
          v34[4] = self;
          id v35 = v14;
          id v23 = v22;
          id v36 = v23;
          id v24 = v14;
          [(HDCloudSyncOperation *)v21 setOnSuccess:v34];
          [(HDCloudSyncOperation *)v21 start];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v8);
  }

  [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
}

uint64_t __39__HDCloudSyncDeleteZonesOperation_main__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 containerIdentifier];
  v4 = [*(id *)(a1 + 32) containerIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __58__HDCloudSyncDeleteZonesOperation__deleteZones_container___block_invoke(uint64_t a1, void *a2)
{
  return [a2 zoneIdentifier];
}

void __58__HDCloudSyncDeleteZonesOperation__deleteZones_container___block_invoke_290(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v8 = v5;
    v9 = [v6 containerIdentifier];
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete zones in %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 112) failTaskWithError:v4];
}

uint64_t __58__HDCloudSyncDeleteZonesOperation__deleteZones_container___block_invoke_292(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    uint64_t v5 = v2;
    uint64_t v6 = [v3 count];
    uint64_t v7 = [*(id *)(a1 + 48) containerIdentifier];
    int v9 = 138543874;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    __int16 v14 = v7;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleted %ld zones in %{public}@", (uint8_t *)&v9, 0x20u);
  }
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
  objc_storeStrong((id *)&self->_zonesToDelete, 0);

  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end