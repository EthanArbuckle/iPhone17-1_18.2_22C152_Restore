@interface HDCloudSyncMedicalIDPushOperation
- (HDCloudSyncMedicalIDRecord)medicalIDRecord;
- (_HKMedicalIDData)cloudMedicalIDData;
- (_HKMedicalIDData)medicalIDDataToPush;
- (void)main;
- (void)setCloudMedicalIDData:(id)a3;
- (void)setMedicalIDDataToPush:(id)a3;
- (void)setMedicalIDRecord:(id)a3;
@end

@implementation HDCloudSyncMedicalIDPushOperation

- (void)main
{
  v63[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 primaryCKContainer];

  v6 = [(HDCloudSyncOperation *)self configuration];
  v7 = [v6 repository];
  v8 = [v7 profileIdentifier];
  v9 = HDDatabaseForContainer(v5, v8);

  if ([(_HKMedicalIDData *)self->_cloudMedicalIDData isEqualToSyncedData:self->_medicalIDDataToPush])
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E4F29F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = self;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Cloud MedicalID is the same as the MedicalID to be pushed. Completing push operation successfully", buf, 0xCu);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
    goto LABEL_23;
  }
  if (!self->_medicalIDRecord)
  {
    v25 = [(HDCloudSyncOperation *)self configuration];
    v26 = [v25 cachedCloudState];
    v27 = [v5 containerIdentifier];
    id v57 = 0;
    v28 = [v26 unifiedSyncZoneForContainerID:v27 error:&v57];
    id v29 = v57;

    if (v28 || !v29)
    {
      if (v28)
      {
        v47 = [v28 zoneIdentifier];
        v48 = [v47 zoneIdentifier];

        v49 = [[HDCloudSyncMedicalIDRecord alloc] initInZone:v48];
        medicalIDRecord = self->_medicalIDRecord;
        self->_medicalIDRecord = v49;

        goto LABEL_6;
      }
      v51 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 715, @"The unified zone must already exist before pushing MedicalID");
      [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v51];
    }
    else
    {
      _HKInitializeLogging();
      v30 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v29;
        _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached unified zone, %{public}@", buf, 0x16u);
      }
      [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v29];
    }

    goto LABEL_23;
  }
LABEL_6:
  v55 = v5;
  v56 = v9;
  v11 = [(_HKMedicalIDData *)self->_medicalIDDataToPush codableRepresentationForSync];
  [(HDCloudSyncMedicalIDRecord *)self->_medicalIDRecord setMedicalIDData:v11];

  v12 = self->_medicalIDRecord;
  v13 = [(HDCloudSyncOperation *)self configuration];
  v14 = [v13 repository];
  v15 = [v14 behavior];

  v16 = NSString;
  v53 = [(HDCloudSyncOperation *)self configuration];
  v52 = [v53 repository];
  v17 = [v52 profileIdentifier];
  v18 = [v15 currentDeviceProductType];
  v19 = [v15 currentOSBuild];
  v20 = [v15 currentDeviceDisplayName];
  v21 = [(HDCloudSyncOperation *)self configuration];
  v22 = [v21 repository];
  uint64_t v23 = [v22 deviceMode];
  v54 = v12;
  if (v23 == 1)
  {
    v24 = @"Basic";
  }
  else if (v23 == 2)
  {
    v24 = @"Satellite";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v23);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v31 = [v16 stringWithFormat:@"ProfileIdentifier: %@,ProductType: %@,SystemBuildVersion: %@,DeviceName: %@,DeviceMode: %@,", v17, v18, v19, v20, v24];

  [(HDCloudSyncMedicalIDRecord *)v54 addMedicalIDEvent:v31];
  v5 = v55;
  id v32 = v55;
  id v33 = v56;
  _HKInitializeLogging();
  v34 = (void *)*MEMORY[0x1E4F29F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT))
  {
    v35 = v34;
    [v33 databaseScope];
    v36 = CKDatabaseScopeString();
    v37 = [v32 containerIdentifier];
    v38 = self->_medicalIDRecord;
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v36;
    *(_WORD *)&buf[22] = 2114;
    v60 = v37;
    LOWORD(v61) = 2114;
    *(void *)((char *)&v61 + 2) = v38;
    _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ Beginning MedicalID record push to cloud for %{public}@ in %{public}@. %{public}@", buf, 0x2Au);
  }
  v39 = [HDCloudSyncModifyRecordsOperation alloc];
  v40 = [(HDCloudSyncOperation *)self configuration];
  v41 = [(HDCloudSyncRecord *)self->_medicalIDRecord record];
  v42 = (void *)[v41 copy];
  v63[0] = v42;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
  v44 = [(HDCloudSyncModifyRecordsOperation *)v39 initWithConfiguration:v40 container:v32 recordsToSave:v43 recordIDsToDelete:0];

  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __86__HDCloudSyncMedicalIDPushOperation__pushMedicalIDRecordToCloudForContainer_database___block_invoke;
  v60 = &unk_1E6301A18;
  *(void *)&long long v61 = self;
  id v45 = v32;
  *((void *)&v61 + 1) = v45;
  id v46 = v33;
  id v62 = v46;
  [(HDCloudSyncOperation *)v44 setOnError:buf];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __86__HDCloudSyncMedicalIDPushOperation__pushMedicalIDRecordToCloudForContainer_database___block_invoke_284;
  v58[3] = &unk_1E62F2928;
  v58[4] = self;
  [(HDCloudSyncOperation *)v44 setOnSuccess:v58];
  [(HDCloudSyncOperation *)v44 start];

  v9 = v56;
LABEL_23:
}

void __86__HDCloudSyncMedicalIDPushOperation__pushMedicalIDRecordToCloudForContainer_database___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E4F29F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = v5;
    v9 = [v6 containerIdentifier];
    [*(id *)(a1 + 48) databaseScope];
    v10 = CKDatabaseScopeString();
    int v11 = 138544130;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2114;
    v16 = v10;
    __int16 v17 = 2114;
    id v18 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: Failed to push MedicalID to database %{public}@ with error %{public}@", (uint8_t *)&v11, 0x2Au);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

uint64_t __86__HDCloudSyncMedicalIDPushOperation__pushMedicalIDRecordToCloudForContainer_database___block_invoke_284(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully pushed MedicalID.", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
}

- (_HKMedicalIDData)cloudMedicalIDData
{
  return self->_cloudMedicalIDData;
}

- (void)setCloudMedicalIDData:(id)a3
{
}

- (_HKMedicalIDData)medicalIDDataToPush
{
  return self->_medicalIDDataToPush;
}

- (void)setMedicalIDDataToPush:(id)a3
{
}

- (HDCloudSyncMedicalIDRecord)medicalIDRecord
{
  return self->_medicalIDRecord;
}

- (void)setMedicalIDRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDRecord, 0);
  objc_storeStrong((id *)&self->_medicalIDDataToPush, 0);

  objc_storeStrong((id *)&self->_cloudMedicalIDData, 0);
}

@end