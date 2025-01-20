@interface HDCloudSyncResetOperation
- (HDCloudSyncResetOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 container:(id)a5;
- (void)main;
@end

@implementation HDCloudSyncResetOperation

- (HDCloudSyncResetOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 container:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncResetOperation;
  v10 = [(HDCloudSyncOperation *)&v13 initWithConfiguration:a3 cloudState:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_container, a5);
  }

  return v11;
}

- (void)main
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    container = self->_container;
    v5 = v3;
    v6 = [(HDCloudSyncOperation *)self configuration];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = container;
    *(_WORD *)&buf[22] = 2114;
    v23 = v6;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning reset for container (%{public}@) with configuration %{public}@", buf, 0x20u);
  }
  else if (!self)
  {
    return;
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1A038]) initWithPreviousServerChangeToken:0];
  [v7 setFetchAllChanges:1];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke;
  v20[3] = &unk_1E6306E70;
  id v9 = v8;
  id v21 = v9;
  [v7 setRecordZoneWithIDChangedBlock:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke_2;
  v18[3] = &unk_1E6306E70;
  id v10 = v9;
  id v19 = v10;
  [v7 setRecordZoneWithIDWasPurgedBlock:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke_3;
  v16[3] = &unk_1E6306E70;
  id v11 = v10;
  id v17 = v11;
  [v7 setRecordZoneWithIDWasDeletedBlock:v16];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke_4;
  v23 = &unk_1E6306E98;
  v24 = self;
  id v25 = v11;
  id v12 = v11;
  [v7 setFetchDatabaseChangesCompletionBlock:buf];
  objc_super v13 = [(HDCloudSyncOperation *)self configuration];
  v14 = [v13 operationGroup];
  [v7 setGroup:v14];

  v15 = [(CKContainer *)self->_container privateCloudDatabase];
  [v15 addOperation:v7];
}

void __53__HDCloudSyncResetOperation__deleteZonesWithZoneIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete zones: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

void __53__HDCloudSyncResetOperation__deleteZonesWithZoneIDs___block_invoke_278(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = v4;
    int v7 = [v3 recordZoneIDsToDelete];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully deleted zones %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
}

uint64_t __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObject:a2];
}

uint64_t __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObject:a2];
}

void __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  _HKInitializeLogging();
  uint64_t v6 = (os_log_t *)MEMORY[0x1E4F29FA8];
  int v7 = *MEMORY[0x1E4F29FA8];
  int v8 = *MEMORY[0x1E4F29FA8];
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v26 = *(void *)(v25 + 104);
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 2114;
      v29 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch record zones in %{public}@ with error: %{public}@", buf, 0x20u);
    }
    [*(id *)(a1 + 32) finishWithSuccess:0 error:v5];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetched record zones %{public}@", buf, 0x16u);
    }
    uint64_t v11 = [MEMORY[0x1E4F1CA80] setWithArray:*(void *)(a1 + 40)];
    uint64_t v12 = [MEMORY[0x1E4F1A310] defaultRecordZone];
    objc_super v13 = [v12 zoneID];
    [v11 removeObject:v13];

    if ([v11 count])
    {
      v14 = *(void **)(a1 + 32);
      v15 = [v11 allObjects];
      v16 = v15;
      if (v14)
      {
        id v17 = v15;
        v18 = [HDCloudSyncModifyRecordZonesOperation alloc];
        id v19 = [v14 configuration];
        v20 = (void *)v14[13];
        id v21 = [v20 privateCloudDatabase];
        v22 = -[HDCloudSyncModifyRecordZonesOperation initWithConfiguration:container:scope:recordZonesToSave:recordZoneIDsToDelete:](v18, "initWithConfiguration:container:scope:recordZonesToSave:recordZoneIDsToDelete:", v19, v20, [v21 databaseScope], 0, v17);

        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __53__HDCloudSyncResetOperation__deleteZonesWithZoneIDs___block_invoke;
        v29 = &unk_1E6306E20;
        v30 = v14;
        [(HDCloudSyncOperation *)v22 setOnError:buf];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __53__HDCloudSyncResetOperation__deleteZonesWithZoneIDs___block_invoke_278;
        v27[3] = &unk_1E6306E48;
        v27[4] = v14;
        [(HDCloudSyncOperation *)v22 setOnSuccess:v27];
        [(HDCloudSyncOperation *)v22 start];
      }
    }
    else
    {
      _HKInitializeLogging();
      v23 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v24;
        _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: No record zones available to delete", buf, 0xCu);
      }
      [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
    }
  }
}

- (void).cxx_destruct
{
}

@end