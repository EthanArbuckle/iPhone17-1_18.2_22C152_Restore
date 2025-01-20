@interface HDCloudSyncMedicalIDFetchOperation
+ (BOOL)shouldLogAtOperationStart;
- (HDCloudSyncMedicalIDFetchOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncMedicalIDFetchOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 container:(id)a5;
- (HDCloudSyncMedicalIDRecord)medicalIDRecord;
- (_HKMedicalIDData)cloudMedicalIDData;
- (void)main;
@end

@implementation HDCloudSyncMedicalIDFetchOperation

- (HDCloudSyncMedicalIDFetchOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncMedicalIDFetchOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 container:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncMedicalIDFetchOperation;
  v10 = [(HDCloudSyncOperation *)&v13 initWithConfiguration:a3 cloudState:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_container, a5);
  }

  return v11;
}

- (void)main
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  container = self->_container;
  id v57 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v57 repository];
  v5 = [v4 profileIdentifier];
  uint64_t v6 = HDDatabaseForContainer(container, v5);
  v7 = container;
  id v8 = v6;
  id v9 = [(HDCloudSyncOperation *)self configuration];
  v10 = [v9 cachedCloudState];
  v11 = [(CKContainer *)v7 containerIdentifier];
  id v59 = 0;
  v12 = [v10 unifiedSyncZoneForContainerID:v11 error:&v59];
  objc_super v13 = (HDCloudSyncMedicalIDRecord *)v59;

  _HKInitializeLogging();
  if (v12) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v13 == 0;
  }
  if (!v14)
  {
    v28 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v61 = self;
      __int16 v62 = 2114;
      v63 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached unified zone, %{public}@", buf, 0x16u);
    }
    v30 = self;
    uint64_t v31 = 0;
    v32 = v13;
LABEL_20:
    [(HDCloudSyncOperation *)v30 finishWithSuccess:v31 error:v32];
    goto LABEL_39;
  }
  v15 = (NSObject **)MEMORY[0x1E4F29F58];
  v16 = (void *)*MEMORY[0x1E4F29F58];
  BOOL v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v17)
    {
      v33 = v16;
      [v8 databaseScope];
      CKDatabaseScopeString();
      v34 = (HDCloudSyncMedicalIDRecord *)objc_claimAutoreleasedReturnValue();
      v35 = [(CKContainer *)v7 containerIdentifier];
      *(_DWORD *)buf = 138543874;
      v61 = self;
      __int16 v62 = 2114;
      v63 = v34;
      __int16 v64 = 2114;
      v65 = v35;
      _os_log_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ No unified zone exists in cache for database %{public}@ in %{public}@", buf, 0x20u);
    }
    v30 = self;
    uint64_t v31 = 1;
    v32 = 0;
    goto LABEL_20;
  }
  if (v17)
  {
    v18 = v16;
    [v8 databaseScope];
    CKDatabaseScopeString();
    v19 = (HDCloudSyncMedicalIDRecord *)objc_claimAutoreleasedReturnValue();
    v20 = [(CKContainer *)v7 containerIdentifier];
    *(_DWORD *)buf = 138543874;
    v61 = self;
    __int16 v62 = 2114;
    v63 = v19;
    __int16 v64 = 2114;
    v65 = v20;
    _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Beginning Medical ID fetch from cache for %{public}@ in %{public}@", buf, 0x20u);

    v15 = (NSObject **)MEMORY[0x1E4F29F58];
  }
  id v58 = 0;
  v21 = [v12 recordsForClass:objc_opt_class() error:&v58];
  id v22 = v58;
  v23 = v22;
  if (v21 || !v22)
  {
    if (v21 && [v21 count])
    {
      if ((unint64_t)[v21 count] >= 2)
      {
        _HKInitializeLogging();
        v36 = (void *)*MEMORY[0x1E4F29F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_FAULT))
        {
          v47 = v36;
          objb = [v21 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138543618;
          v61 = self;
          __int16 v62 = 2114;
          v63 = objb;
          _os_log_fault_impl(&dword_1BCB7D000, v47, OS_LOG_TYPE_FAULT, "%{public}@ Fetched multiple MedicalID records from the cloud. CKRecordIDs: %{public}@ ", buf, 0x16u);
        }
      }
      v37 = [v21 firstObject];
      medicalIDRecord = self->_medicalIDRecord;
      self->_medicalIDRecord = v37;

      _HKInitializeLogging();
      v39 = *MEMORY[0x1E4F29F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT))
      {
        v40 = self->_medicalIDRecord;
        *(_DWORD *)buf = 138543618;
        v61 = self;
        __int16 v62 = 2114;
        v63 = v40;
        _os_log_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetched MedicalID record from cache %{public}@", buf, 0x16u);
      }
      v41 = [(HDCloudSyncMedicalIDRecord *)self->_medicalIDRecord medicalIDData];
      v50 = v41;
      v52 = v23;
      if (v41)
      {
        v41 = [MEMORY[0x1E4F2B920] createWithCodable:v41];
      }
      id obj = v41;
      if (self->_cloudMedicalIDData)
      {
        cloudMedicalIDData = [v41 dateSaved];
        if (cloudMedicalIDData)
        {
          v43 = [(_HKMedicalIDData *)self->_cloudMedicalIDData dateSaved];
          int v48 = objc_msgSend(v43, "hk_isBeforeDate:", cloudMedicalIDData);

          v23 = v52;
          if (v48) {
            objc_storeStrong((id *)&self->_cloudMedicalIDData, obj);
          }
        }
      }
      else
      {
        v45 = v41;
        cloudMedicalIDData = self->_cloudMedicalIDData;
        self->_cloudMedicalIDData = v45;
      }

      [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
      goto LABEL_38;
    }
    _HKInitializeLogging();
    v44 = *v15;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      objc = v44;
      [v8 databaseScope];
      CKDatabaseScopeString();
      v51 = (HDCloudSyncMedicalIDRecord *)objc_claimAutoreleasedReturnValue();
      v49 = [(CKContainer *)v7 containerIdentifier];
      *(_DWORD *)buf = 138543874;
      v61 = self;
      __int16 v62 = 2114;
      v63 = v51;
      __int16 v64 = 2114;
      v65 = v49;
      _os_log_impl(&dword_1BCB7D000, objc, OS_LOG_TYPE_DEFAULT, "%{public}@ No MedicalID record exists in the cache for %{public}@ in %{public}@", buf, 0x20u);
    }
    v25 = self;
    uint64_t v26 = 1;
    v27 = 0;
  }
  else
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      v46 = v24;
      obja = [v12 zoneIdentifier];
      *(_DWORD *)buf = 138543874;
      v61 = self;
      __int16 v62 = 2114;
      v63 = obja;
      __int16 v64 = 2114;
      v65 = v23;
      _os_log_error_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get medicalID record for %{public}@, %{public}@", buf, 0x20u);
    }
    v25 = self;
    uint64_t v26 = 0;
    v27 = v23;
  }
  [(HDCloudSyncOperation *)v25 finishWithSuccess:v26 error:v27];
LABEL_38:

LABEL_39:
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (_HKMedicalIDData)cloudMedicalIDData
{
  return self->_cloudMedicalIDData;
}

- (HDCloudSyncMedicalIDRecord)medicalIDRecord
{
  return self->_medicalIDRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDRecord, 0);
  objc_storeStrong((id *)&self->_cloudMedicalIDData, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

@end