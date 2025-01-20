@interface HDCloudSyncDeleteSequenceOperation
- (HDCloudSyncDeleteSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncDeleteSequenceOperation)initWithConfiguration:(id)a3 targetsBySequence:(id)a4;
- (void)main;
@end

@implementation HDCloudSyncDeleteSequenceOperation

- (HDCloudSyncDeleteSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncDeleteSequenceOperation)initWithConfiguration:(id)a3 targetsBySequence:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncDeleteSequenceOperation;
  v8 = [(HDCloudSyncOperation *)&v11 initWithConfiguration:a3 cloudState:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_targetsBySequence, a4);
  }

  return v9;
}

- (void)main
{
  v3 = [(NSDictionary *)self->_targetsBySequence allKeys];
  v4 = objc_msgSend(v3, "hk_map:", &__block_literal_global_127);

  v5 = [HDCloudSyncModifyRecordsOperation alloc];
  uint64_t v6 = [(HDCloudSyncOperation *)self configuration];
  id v7 = [(NSDictionary *)self->_targetsBySequence allValues];
  v8 = [v7 firstObject];
  v9 = [v8 container];
  v10 = [(HDCloudSyncModifyRecordsOperation *)v5 initWithConfiguration:v6 container:v9 recordsToSave:0 recordIDsToDelete:v4];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__HDCloudSyncDeleteSequenceOperation_main__block_invoke_2;
  v19[3] = &unk_1E62F6020;
  v19[4] = self;
  id v11 = v4;
  id v20 = v11;
  [(HDCloudSyncOperation *)v10 setOnError:v19];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __42__HDCloudSyncDeleteSequenceOperation_main__block_invoke_283;
  v16 = &unk_1E6302F00;
  v17 = self;
  id v18 = v11;
  id v12 = v11;
  [(HDCloudSyncOperation *)v10 setOnSuccess:&v13];
  [(HDCloudSyncOperation *)v10 start];
}

uint64_t __42__HDCloudSyncDeleteSequenceOperation_main__block_invoke(uint64_t a1, void *a2)
{
  return [a2 recordID];
}

void __42__HDCloudSyncDeleteSequenceOperation_main__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete recordIDs %{public}@, %{public}@", (uint8_t *)&v8, 0x20u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

void __42__HDCloudSyncDeleteSequenceOperation_main__block_invoke_283(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v36 = v5;
    __int16 v37 = 2114;
    uint64_t v38 = v6;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully deleted recordIDs %{public}@", buf, 0x16u);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v26 = v3;
  id obj = [v3 deletedRecordIDs];
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v31;
    *(void *)&long long v8 = 138543362;
    long long v25 = v8;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * v11);
        id v13 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "allKeys", v25);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __42__HDCloudSyncDeleteSequenceOperation_main__block_invoke_284;
        v29[3] = &unk_1E62FADA8;
        v29[4] = v12;
        uint64_t v14 = objc_msgSend(v13, "hk_firstObjectPassingTest:", v29);

        if (!v14)
        {
          _HKInitializeLogging();
          v21 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            v24 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            id v36 = v24;
            __int16 v37 = 2114;
            uint64_t v38 = v12;
            _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Sequence record surprisingly not found for record ID %{public}@", buf, 0x16u);
          }
          v22 = *(void **)(a1 + 32);
          v23 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 725, @"Sequence record surprisingly not found");
          [v22 finishWithSuccess:0 error:v23];

          goto LABEL_18;
        }
        v15 = [*(id *)(*(void *)(a1 + 32) + 104) objectForKeyedSubscript:v14];
        uint64_t v16 = [v15 store];
        v17 = objc_msgSend((id)v16, "syncStoreForEpoch:", objc_msgSend(v14, "baselineEpoch"));

        id v28 = 0;
        LOBYTE(v16) = [v17 clearAllSyncAnchorsWithError:&v28];
        id v18 = v28;
        if ((v16 & 1) == 0)
        {
          _HKInitializeLogging();
          v19 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            id v36 = v18;
            _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "Failed to remove old sync anchors after finalizing new baseline: %{public}@", buf, 0xCu);
          }
        }
        id v20 = [v15 storeRecord];
        [v20 removeSequenceHeaderRecord:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
LABEL_18:
}

uint64_t __42__HDCloudSyncDeleteSequenceOperation_main__block_invoke_284(uint64_t a1, void *a2)
{
  id v3 = [a2 recordID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void).cxx_destruct
{
}

@end