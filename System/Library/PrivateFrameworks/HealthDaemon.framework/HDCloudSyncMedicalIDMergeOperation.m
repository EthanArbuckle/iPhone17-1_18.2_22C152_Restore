@interface HDCloudSyncMedicalIDMergeOperation
- (BOOL)performWithError:(id *)a3;
- (_HKMedicalIDData)cloudMedicalIDData;
- (_HKMedicalIDData)localMedicalIDData;
- (_HKMedicalIDData)mergedMedicalIDData;
- (void)setCloudMedicalIDData:(id)a3;
- (void)setLocalMedicalIDData:(id)a3;
@end

@implementation HDCloudSyncMedicalIDMergeOperation

- (BOOL)performWithError:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  localMedicalIDData = self->_localMedicalIDData;
  cloudMedicalIDData = self->_cloudMedicalIDData;
  if (localMedicalIDData)
  {
    if (!cloudMedicalIDData)
    {
      objc_storeStrong((id *)&self->_mergedMedicalIDData, localMedicalIDData);
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E4F29F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 138543362;
        v38 = self;
        v9 = "%{public}@ Returning the local MedicalID since cloud MedicalID is nil";
        goto LABEL_12;
      }
      return 1;
    }
    if (([(_HKMedicalIDData *)self->_localMedicalIDData hasAnyModificationDate] & 1) != 0
      || ([(_HKMedicalIDData *)self->_cloudMedicalIDData hasAnyModificationDate] & 1) != 0)
    {
      v6 = [(_HKMedicalIDData *)self->_cloudMedicalIDData merge:self->_localMedicalIDData];
      mergedMedicalIDData = self->_mergedMedicalIDData;
      self->_mergedMedicalIDData = v6;

      _HKInitializeLogging();
      v8 = *MEMORY[0x1E4F29F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 138543362;
        v38 = self;
        v9 = "%{public}@ Merged MedicalID contains the most recently updated fields from the local and cloud MedicalID";
LABEL_12:
        _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v37, 0xCu);
        return 1;
      }
      return 1;
    }
    v13 = self->_localMedicalIDData;
    v14 = self->_cloudMedicalIDData;
    v15 = v13;
    v16 = [(_HKMedicalIDData *)self->_cloudMedicalIDData dateSaved];
    if (v16)
    {
    }
    else
    {
      v17 = [(_HKMedicalIDData *)self->_localMedicalIDData dateSaved];

      if (!v17)
      {
        _HKInitializeLogging();
        v23 = *MEMORY[0x1E4F29F58];
        BOOL v34 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT);
        v25 = v14;
        if (v34)
        {
          int v37 = 138543362;
          v38 = self;
          v26 = "%{public}@ dateSaved property nil for cloud MedicalID and local MedicalID, returning cloud MedicalID";
          goto LABEL_33;
        }
        goto LABEL_37;
      }
    }
    v18 = [(_HKMedicalIDData *)self->_cloudMedicalIDData dateSaved];

    if (v18)
    {
      v19 = [(_HKMedicalIDData *)self->_localMedicalIDData dateSaved];

      if (!v19)
      {
        _HKInitializeLogging();
        v23 = *MEMORY[0x1E4F29F58];
        BOOL v29 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT);
        v25 = v14;
        if (v29)
        {
          int v37 = 138543362;
          v38 = self;
          v26 = "%{public}@ dateSaved property nil for local MedicalID, returning cloud MedicalID";
          goto LABEL_33;
        }
LABEL_37:
        v35 = v25;

        v36 = self->_mergedMedicalIDData;
        self->_mergedMedicalIDData = v35;

        return 1;
      }
      v20 = [(_HKMedicalIDData *)v14 dateSaved];
      v21 = [(_HKMedicalIDData *)v15 dateSaved];
      int v22 = [v20 isEqualToDate:v21];

      if (v22)
      {
        _HKInitializeLogging();
        v23 = *MEMORY[0x1E4F29F58];
        BOOL v24 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT);
        v25 = v14;
        if (v24)
        {
          int v37 = 138543362;
          v38 = self;
          v26 = "%{public}@ Returning the cloud MedicalID since dateSaved is equal";
LABEL_33:
          _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v37, 0xCu);
          v25 = v14;
          goto LABEL_37;
        }
        goto LABEL_37;
      }
      v30 = [(_HKMedicalIDData *)v14 dateSaved];
      v31 = [(_HKMedicalIDData *)v15 dateSaved];
      int v32 = objc_msgSend(v30, "hk_isAfterDate:", v31);

      _HKInitializeLogging();
      v23 = *MEMORY[0x1E4F29F58];
      BOOL v33 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT);
      if (v32)
      {
        v25 = v14;
        if (v33)
        {
          int v37 = 138543362;
          v38 = self;
          v26 = "%{public}@ Returning the cloud MedicalID since dateSaved is more recent";
          goto LABEL_33;
        }
        goto LABEL_37;
      }
      v25 = v15;
      if (!v33) {
        goto LABEL_37;
      }
      int v37 = 138543362;
      v38 = self;
      v28 = "%{public}@ Returning the local MedicalID since dateSaved is more recent";
    }
    else
    {
      _HKInitializeLogging();
      v23 = *MEMORY[0x1E4F29F58];
      BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT);
      v25 = v15;
      if (!v27) {
        goto LABEL_37;
      }
      int v37 = 138543362;
      v38 = self;
      v28 = "%{public}@ dateSaved property nil for cloud MedicalID, returning local MedicalID";
    }
    _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v37, 0xCu);
    v25 = v15;
    goto LABEL_37;
  }
  if (cloudMedicalIDData)
  {
    objc_storeStrong((id *)&self->_mergedMedicalIDData, cloudMedicalIDData);
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E4F29F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 138543362;
      v38 = self;
      v9 = "%{public}@ Returning the cloud MedicalID since local MedicalID is nil";
      goto LABEL_12;
    }
    return 1;
  }
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E4F29F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_ERROR))
  {
    int v37 = 138543362;
    v38 = self;
    _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Reached invalid state. Local and cloud MedicalID should not be nil.", (uint8_t *)&v37, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Local and cloud MedicalID should not be nil.");
  return 0;
}

- (_HKMedicalIDData)localMedicalIDData
{
  return self->_localMedicalIDData;
}

- (void)setLocalMedicalIDData:(id)a3
{
}

- (_HKMedicalIDData)cloudMedicalIDData
{
  return self->_cloudMedicalIDData;
}

- (void)setCloudMedicalIDData:(id)a3
{
}

- (_HKMedicalIDData)mergedMedicalIDData
{
  return self->_mergedMedicalIDData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergedMedicalIDData, 0);
  objc_storeStrong((id *)&self->_cloudMedicalIDData, 0);

  objc_storeStrong((id *)&self->_localMedicalIDData, 0);
}

@end