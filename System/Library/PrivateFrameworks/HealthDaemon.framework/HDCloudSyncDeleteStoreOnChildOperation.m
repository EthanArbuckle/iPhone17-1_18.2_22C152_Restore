@interface HDCloudSyncDeleteStoreOnChildOperation
- (void)main;
@end

@implementation HDCloudSyncDeleteStoreOnChildOperation

- (void)main
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 computedState];
  v5 = [v4 pushTargets];

  if (v5
    && ([(HDCloudSyncOperation *)self profile],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 cloudSyncManager],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isChild],
        v7,
        v6,
        (v8 & 1) != 0))
  {
    if ((unint64_t)[v5 count] >= 2)
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v23 = self;
        _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Watch has more than 1 push target", buf, 0xCu);
      }
    }
    v10 = [(HDCloudSyncOperation *)self configuration];
    v11 = [v10 computedState];
    v12 = [v11 pushTargets];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __46__HDCloudSyncDeleteStoreOnChildOperation_main__block_invoke;
    v21[3] = &unk_1E63036F0;
    v21[4] = self;
    v13 = objc_msgSend(v12, "hk_map:", v21);

    if ([v13 count])
    {
      v14 = [HDCloudSyncDeleteStoresOperation alloc];
      v15 = [(HDCloudSyncOperation *)self configuration];
      v16 = [(HDCloudSyncOperation *)self cloudState];
      v17 = [(HDCloudSyncDeleteStoresOperation *)v14 initWithConfiguration:v15 cloudState:v16 storeRecordsToDelete:v13];

      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __46__HDCloudSyncDeleteStoreOnChildOperation_main__block_invoke_2;
      v19[3] = &unk_1E62F46F8;
      v19[4] = self;
      id v20 = v13;
      [(HDCloudSyncOperation *)v17 setOnSuccess:v19];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __46__HDCloudSyncDeleteStoreOnChildOperation_main__block_invoke_280;
      v18[3] = &unk_1E62F2950;
      v18[4] = self;
      [(HDCloudSyncOperation *)v17 setOnError:v18];
      [(HDCloudSyncOperation *)v17 start];
    }
    else
    {
      [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
    }
  }
  else
  {
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
  }
}

id __46__HDCloudSyncDeleteStoreOnChildOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [v3 storeRecord];
  if (!v4) {
    goto LABEL_4;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  v7 = [v5 record];
  char v8 = [v7 creationDate];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  v11 = [v5 sequenceRecord];
  uint64_t v12 = [v11 childRecordCount];

  if (v12 > 500 || Current - v10 > 1814400.0)
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      uint64_t v16 = [v5 description];
      v17 = (void *)v16;
      v18 = @" max active duration passed";
      int v20 = 138543874;
      uint64_t v21 = v4;
      __int16 v22 = 2114;
      if (v12 > 500) {
        v18 = @"record limit crossed";
      }
      uint64_t v23 = v16;
      __int16 v24 = 2114;
      v25 = v18;
      _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting deletion of watch store: %{public}@ due to %{public}@", (uint8_t *)&v20, 0x20u);
    }
    v13 = [v3 storeRecord];
  }
  else
  {
LABEL_4:

    v13 = 0;
  }

  return v13;
}

uint64_t __46__HDCloudSyncDeleteStoreOnChildOperation_main__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    id v5 = v2;
    LODWORD(v3) = [v3 count];
    v6 = [MEMORY[0x1E4F1C9C8] date];
    int v8 = 138543874;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = (int)v3;
    __int16 v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully deleted %d watch stores, deletionDate: %{public}@", (uint8_t *)&v8, 0x1Cu);
  }
  return [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
}

void __46__HDCloudSyncDeleteStoreOnChildOperation_main__block_invoke_280(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete watch stores: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

@end