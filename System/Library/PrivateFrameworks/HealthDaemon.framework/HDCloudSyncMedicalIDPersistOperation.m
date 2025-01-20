@interface HDCloudSyncMedicalIDPersistOperation
- (BOOL)performWithError:(id *)a3;
- (_HKMedicalIDData)medicalIDDataToPersist;
- (void)setMedicalIDDataToPersist:(id)a3;
@end

@implementation HDCloudSyncMedicalIDPersistOperation

- (BOOL)performWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 repository];
  v7 = [v6 medicalIDDataManager];
  id v27 = 0;
  v8 = [v7 fetchMedicalIDWithError:&v27];
  id v9 = v27;

  if (!v8 && v9)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E4F29F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v30 = self;
      __int16 v31 = 2114;
      id v32 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch local MedicalID during cloud sync with error %{public}@", buf, 0x16u);
    }
    if (a3)
    {
      char v11 = 0;
      *a3 = v9;
      goto LABEL_29;
    }
    _HKLogDroppedError();
LABEL_17:
    char v11 = 0;
    goto LABEL_29;
  }
  if (v8)
  {
    v12 = [v8 dateSaved];
    v13 = [(_HKMedicalIDData *)self->_medicalIDDataToPersist dateSaved];
    int v14 = objc_msgSend(v12, "hk_isAfterDate:", v13);

    if (v14)
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E4F29F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v30 = self;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Local MedicalID updated during cloud sync. Aborting.", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 716, @"Local Medical ID updated during cloud sync.");
      goto LABEL_17;
    }
  }
  if ([v8 isEqualToSyncedData:self->_medicalIDDataToPersist])
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E4F29F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = self;
      _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Local MedicalID is the same as the MedicalID to be persisted. Completing persist operation successfully.", buf, 0xCu);
    }
    char v11 = 1;
  }
  else
  {
    v17 = self->_medicalIDDataToPersist;
    _HKInitializeLogging();
    v18 = (os_log_t *)MEMORY[0x1E4F29F58];
    v19 = *MEMORY[0x1E4F29F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = self;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating Medical ID on disk.", buf, 0xCu);
    }
    v20 = [(HDCloudSyncOperation *)self configuration];
    v21 = [v20 repository];
    v22 = [v21 medicalIDDataManager];
    id v28 = 0;
    char v11 = [v22 updateMedicalIDWithSyncedData:v17 provenance:0 error:&v28];

    id v23 = v28;
    if ((v11 & 1) == 0)
    {
      _HKInitializeLogging();
      v24 = *v18;
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v30 = self;
        __int16 v31 = 2114;
        id v32 = v23;
        _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Failed to persist MedicalID to disk during cloud sync with error %{public}@", buf, 0x16u);
      }
      id v25 = v23;
      if (v25)
      {
        if (a3) {
          *a3 = v25;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
LABEL_29:

  return v11;
}

- (_HKMedicalIDData)medicalIDDataToPersist
{
  return self->_medicalIDDataToPersist;
}

- (void)setMedicalIDDataToPersist:(id)a3
{
}

- (void).cxx_destruct
{
}

@end