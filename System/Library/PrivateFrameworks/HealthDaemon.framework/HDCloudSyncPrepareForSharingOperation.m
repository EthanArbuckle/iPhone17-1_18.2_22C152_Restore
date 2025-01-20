@interface HDCloudSyncPrepareForSharingOperation
- (void)main;
@end

@implementation HDCloudSyncPrepareForSharingOperation

- (void)main
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 primaryCKContainer];

  v6 = [(HDCloudSyncOperation *)self configuration];
  v7 = [v6 cachedCloudState];
  id v43 = 0;
  v8 = [v7 zonesByIdentifierWithError:&v43];
  id v9 = v43;

  if (v8 || !v9)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v11 = objc_msgSend(v8, "allKeys", v9, v8);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v40 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v17 = [v16 containerIdentifier];
          v18 = [v5 containerIdentifier];
          int v19 = [v17 isEqualToString:v18];

          if (v19)
          {
            _HKInitializeLogging();
            v32 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              v33 = v32;
              v34 = [v5 containerIdentifier];
              *(_DWORD *)buf = 138543874;
              v46 = self;
              __int16 v47 = 2114;
              id v48 = v16;
              __int16 v49 = 2114;
              v50 = v34;
              _os_log_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Found existing zone %{public}@ in primary container %{public}@; ready for sharing.",
                buf,
                0x20u);
            }
            [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
            goto LABEL_20;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v51 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = [v5 containerIdentifier];
      *(_DWORD *)buf = 138543618;
      v46 = self;
      __int16 v47 = 2114;
      id v48 = v22;
      _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: No existing zones found in primary contaienr %{public}@; creating master zone.",
        buf,
        0x16u);
    }
    id v23 = objc_alloc(MEMORY[0x1E4F1A310]);
    v24 = (void *)MEMORY[0x1E4F1A320];
    v25 = [(HDCloudSyncOperation *)self configuration];
    v26 = [v25 syncContainerPrefix];
    v27 = objc_msgSend(v24, "hd_masterZoneIDForSyncCircleIdentifier:", v26);
    v11 = (void *)[v23 initWithZoneID:v27];

    v28 = [HDCloudSyncModifyRecordZonesOperation alloc];
    v29 = [(HDCloudSyncOperation *)self configuration];
    v44 = v11;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
    v31 = [(HDCloudSyncModifyRecordZonesOperation *)v28 initWithConfiguration:v29 container:v5 recordZonesToSave:v30 recordZoneIDsToDelete:0];

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __45__HDCloudSyncPrepareForSharingOperation_main__block_invoke;
    v38[3] = &unk_1E62F2950;
    v38[4] = self;
    [(HDCloudSyncOperation *)v31 setOnError:v38];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __45__HDCloudSyncPrepareForSharingOperation_main__block_invoke_281;
    v37[3] = &unk_1E62F2928;
    v37[4] = self;
    [(HDCloudSyncOperation *)v31 setOnSuccess:v37];
    [(HDCloudSyncOperation *)v31 start];

LABEL_20:
    id v9 = v35;
    v8 = v36;
  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v46 = self;
      __int16 v47 = 2114;
      id v48 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v9];
  }
}

void __45__HDCloudSyncPrepareForSharingOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create master zone for sharing preparation: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

uint64_t __45__HDCloudSyncPrepareForSharingOperation_main__block_invoke_281(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully created master zone for sharing preparation.", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
}

@end