@interface HDCloudSyncRequestDataUploadOperation
- (void)main;
@end

@implementation HDCloudSyncRequestDataUploadOperation

- (void)main
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 primaryCKContainer];

  v6 = [(HDCloudSyncOperation *)self configuration];
  v7 = [v6 cachedCloudState];
  v8 = [v5 containerIdentifier];
  id v32 = 0;
  v9 = [v7 unifiedSyncZoneForContainerID:v8 error:&v32];
  id v10 = v32;

  if (v9 || !v10)
  {
    if (v9)
    {
      id v31 = 0;
      v12 = [v9 recordsForClass:objc_opt_class() error:&v31];
      id v13 = v31;
      v14 = v13;
      if (v12 || !v13)
      {
        if ((unint64_t)[v12 count] >= 2)
        {
          _HKInitializeLogging();
          v17 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
          {
            v28 = v17;
            v29 = [v9 zoneIdentifier];
            *(_DWORD *)buf = 138543618;
            v35 = self;
            __int16 v36 = 2114;
            id v37 = v29;
            _os_log_fault_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple data upload request records for %{public}@. This is unexpected.", buf, 0x16u);
          }
        }
        v18 = objc_msgSend(v12, "firstObject", v14);
        if (!v18)
        {
          v19 = [v9 zoneIdentifier];
          v20 = [v19 zoneIdentifier];
          v18 = +[HDCloudSyncDataUploadRequestRecord recordForZoneID:v20];
        }
        v21 = [HDCloudSyncModifyRecordsOperation alloc];
        v22 = [(HDCloudSyncOperation *)self configuration];
        v23 = [v18 record];
        v33 = v23;
        v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
        v25 = [(HDCloudSyncModifyRecordsOperation *)v21 initWithConfiguration:v22 container:v5 recordsToSave:v24 recordIDsToDelete:0];

        [(HDCloudSyncModifyRecordsOperation *)v25 setSavePolicy:2];
        [(HDCloudSyncOperation *)self delegateToOperation:v25];

        v14 = v30;
      }
      else
      {
        _HKInitializeLogging();
        v15 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          v26 = v15;
          v27 = [v9 zoneIdentifier];
          *(_DWORD *)buf = 138543874;
          v35 = self;
          __int16 v36 = 2114;
          id v37 = v27;
          __int16 v38 = 2114;
          v39 = v14;
          _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get data upload request records for %{public}@, %{public}@", buf, 0x20u);
        }
        [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v14];
      }
    }
    else
    {
      v16 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 715, @"The unified zone must already exist before requesting data upload.");
      [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v16];
    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v35 = self;
      __int16 v36 = 2114;
      id v37 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached unified zone, %{public}@", buf, 0x16u);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v10];
  }
}

@end