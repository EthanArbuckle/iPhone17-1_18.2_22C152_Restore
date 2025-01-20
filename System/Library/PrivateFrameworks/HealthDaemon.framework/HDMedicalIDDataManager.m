@interface HDMedicalIDDataManager
- (BOOL)deleteMedicalIDDataWithError:(id *)a3;
- (BOOL)obliterateMedicalIDDataWithReason:(id)a3 error:(id *)a4;
- (BOOL)unitTest_persistMedicalIDData:(id)a3;
- (BOOL)updateMedicalIDWithLocalData:(id)a3 error:(id *)a4;
- (BOOL)updateMedicalIDWithSyncedData:(id)a3 provenance:(id)a4 error:(id *)a5;
- (HDMedicalIDDataManager)initWithProfile:(id)a3;
- (HDProfile)profile;
- (id)_fetchMedicalIDDataFromDiskWithError:(void *)a1;
- (id)_medicalIDURL;
- (id)_medicalIDURLWithDirectoryPath:(void *)a1;
- (id)_unarchiveMedicalIDDataWithRawData:(void *)a3 error:;
- (id)fetchMedicalIDDataIfSetUpOrCreateDefaultWithError:(id *)a3;
- (id)fetchMedicalIDIfSetUpWithError:(id *)a3;
- (id)fetchMedicalIDWithError:(id *)a3;
- (id)medicalIDClinicalContactsWithError:(id *)a3;
- (id)medicalIDEmergencyContactsWithError:(id *)a3;
- (id)unitTest_medicalIDData;
- (int64_t)medicalIDSetupStatusWithError:(id *)a3;
- (uint64_t)_migrateMedicalIDLocationIfNecessary:(void *)a1;
- (uint64_t)_persistMedicalIDData:(void *)a3 originalData:(void *)a4 provenance:(void *)a5 error:;
- (uint64_t)_persistMedicalIDDataFileToDisk:(void *)a3 error:;
- (void)_runEmergencyContactConsolidationWithCompletion:(id)a3;
- (void)_runEmergencyContactConsolidationWithSOSManager:(id)a3 WithCompletion:(id)a4;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4;
- (void)runEmergencyContactConsolidationWithCompletion:(id)a3;
- (void)setProfile:(id)a3;
@end

@implementation HDMedicalIDDataManager

- (HDMedicalIDDataManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDMedicalIDDataManager;
  v5 = [(HDMedicalIDDataManager *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    [v4 registerProfileReadyObserver:v6 queue:0];
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained daemon];
  v5 = [v4 analyticsSubmissionCoordinator];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)HDMedicalIDDataManager;
  [(HDMedicalIDDataManager *)&v6 dealloc];
}

- (id)fetchMedicalIDWithError:(id *)a3
{
  id v9 = 0;
  id v4 = -[HDMedicalIDDataManager _fetchMedicalIDDataFromDiskWithError:](self, &v9);
  id v5 = v9;
  objc_super v6 = v5;
  if (v4 || !v5)
  {
    id v7 = v4;
  }
  else if (a3)
  {
    id v7 = 0;
    *a3 = v5;
  }
  else
  {
    _HKLogDroppedError();
    id v7 = 0;
  }

  return v7;
}

- (id)_fetchMedicalIDDataFromDiskWithError:(void *)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v31 = 0;
    char v4 = -[HDMedicalIDDataManager _migrateMedicalIDLocationIfNecessary:](a1, &v31);
    id v5 = v31;
    if (v4)
    {
      objc_super v6 = -[HDMedicalIDDataManager _medicalIDURL](a1);
      id v7 = [v6 path];

      objc_super v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7];
      if (v8)
      {
        id v30 = 0;
        id v9 = -[HDMedicalIDDataManager _unarchiveMedicalIDDataWithRawData:error:]((uint64_t)a1, v8, &v30);
        id v10 = v30;
        if (v9)
        {
          v11 = (void *)[v9 copy];
          if (+[HDMedicalIDDataMigrator migrateMedicalIDDataIfNeeded:v9])
          {
            _HKInitializeLogging();
            v12 = (os_log_t *)MEMORY[0x1E4F29F18];
            v13 = (void *)*MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
            {
              v14 = v13;
              uint64_t v15 = [v9 schemaVersion];
              *(_DWORD *)buf = 134217984;
              uint64_t v33 = v15;
              _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "Migrated Medical ID data to version %li", buf, 0xCu);
            }
            id v29 = 0;
            char v16 = -[HDMedicalIDDataManager _persistMedicalIDData:originalData:provenance:error:](a1, v9, v11, &unk_1F17EB040, &v29);
            id v17 = v29;
            if ((v16 & 1) == 0)
            {
              _HKInitializeLogging();
              v18 = *v12;
              if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v33 = (uint64_t)v17;
                _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "Failed to save migrated Medical ID data: %{public}@", buf, 0xCu);
              }
            }
          }
          v19 = [a1 profile];
          id v28 = 0;
          BOOL v20 = +[HDMedicalIDSyncEntity touchSyncAnchorIfNecessaryWithProfile:v19 error:&v28];
          id v21 = v28;

          if (!v20)
          {
            _HKInitializeLogging();
            v22 = *MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v33 = (uint64_t)v21;
              _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "Failed to touch Medical ID sync anchor: %{public}@", buf, 0xCu);
            }
          }
        }
        else
        {
          _HKInitializeLogging();
          v25 = *MEMORY[0x1E4F29F18];
          v26 = *MEMORY[0x1E4F29F18];
          if (v10)
          {
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v33 = (uint64_t)a1;
              __int16 v34 = 2114;
              id v35 = v10;
              _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "%{public}@ Failed to unarchive Medical ID fetched from disk, error: %{public}@", buf, 0x16u);
            }
            if (a2) {
              *a2 = v10;
            }
            else {
              _HKLogDroppedError();
            }
          }
          else if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v33 = (uint64_t)a1;
            _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_INFO, "%{public}@ Unarchived MedicalID on disk is nil even though raw data was retrieved.", buf, 0xCu);
          }
        }
      }
      else
      {
        id v9 = 0;
      }

      goto LABEL_31;
    }
    _HKInitializeLogging();
    v23 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = (uint64_t)a1;
      __int16 v34 = 2114;
      id v35 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Failed to migrate Medical ID before update, error: %{public}@", buf, 0x16u);
    }
    id v24 = v5;
    id v7 = v24;
    if (v24)
    {
      if (a2)
      {
        id v7 = v24;
        id v9 = 0;
        *a2 = v7;
LABEL_31:

        goto LABEL_32;
      }
      _HKLogDroppedError();
    }
    id v9 = 0;
    goto LABEL_31;
  }
  id v9 = 0;
LABEL_32:

  return v9;
}

- (id)fetchMedicalIDIfSetUpWithError:(id *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v4 = [(HDMedicalIDDataManager *)self fetchMedicalIDWithError:a3];
  if ([v4 isEmpty])
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = self;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Medical ID on disk is non-nil but empty, returning nil to the client in this case", (uint8_t *)&v8, 0xCu);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (id)fetchMedicalIDDataIfSetUpOrCreateDefaultWithError:(id *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v39 = 0;
  id v5 = [(HDMedicalIDDataManager *)self fetchMedicalIDIfSetUpWithError:&v39];
  id v6 = v39;
  id v7 = v6;
  if (v5 || !v6)
  {
    if (!v5)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F2B920]);
      int v8 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298B8]];
      uint64_t v9 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298B0]];
      __int16 v34 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A838]];
      v32 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A630]];
      p_profile = &self->_profile;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      v12 = [WeakRetained userCharacteristicsManager];
      id v38 = 0;
      v13 = [v12 userCharacteristicForType:v8 error:&v38];
      id v14 = v38;

      if (v13)
      {
        [v5 setGregorianBirthday:v13];
      }
      else if (v14)
      {
        _HKInitializeLogging();
        uint64_t v15 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v41 = v14;
          _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "Failed to get date of birth for Medical ID: %{public}@", buf, 0xCu);
        }
      }

      id v16 = objc_loadWeakRetained((id *)p_profile);
      id v17 = [v16 userCharacteristicsManager];
      id v37 = 0;
      uint64_t v33 = (void *)v9;
      v18 = [v17 userCharacteristicForType:v9 error:&v37];
      id v19 = v37;

      if (v18)
      {
        objc_msgSend(v5, "setBloodType:", objc_msgSend(v18, "integerValue"));
      }
      else if (v19)
      {
        _HKInitializeLogging();
        BOOL v20 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v41 = v19;
          _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Failed to get blood type for Medical ID: %{public}@", buf, 0xCu);
        }
      }

      id v21 = objc_loadWeakRetained((id *)p_profile);
      id v36 = 0;
      v22 = +[HDSampleEntity mostRecentSampleWithType:v34 profile:v21 encodingOptions:0 predicate:0 anchor:0 error:&v36];
      id v23 = v36;

      if (v22)
      {
        id v24 = [v22 quantity];
        [v5 setHeight:v24];
      }
      else if (v23)
      {
        _HKInitializeLogging();
        v25 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v41 = v23;
          _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "Failed to get height for Medical ID: %{public}@", buf, 0xCu);
        }
      }

      id v26 = objc_loadWeakRetained((id *)p_profile);
      id v35 = 0;
      v27 = +[HDSampleEntity mostRecentSampleWithType:v32 profile:v26 encodingOptions:0 predicate:0 anchor:0 error:&v35];
      id v28 = v35;

      if (v27)
      {
        id v29 = [v27 quantity];
        [v5 setWeight:v29];
      }
      else if (a3)
      {
        _HKInitializeLogging();
        id v30 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v28;
          _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "Failed to get weight for Medical ID: {public}%@", buf, 0xCu);
        }
      }
    }
  }
  else if (a3)
  {
    id v5 = 0;
    *a3 = v6;
  }
  else
  {
    _HKLogDroppedError();
    id v5 = 0;
  }

  return v5;
}

- (int64_t)medicalIDSetupStatusWithError:(id *)a3
{
  uint64_t v8 = 0;
  v3 = [(HDMedicalIDDataManager *)self fetchMedicalIDIfSetUpWithError:&v8];
  char v4 = v3;
  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v8 == 0;
  }
  int64_t v6 = v5;
  if (v3)
  {
    if ([v3 isEmpty]) {
      int64_t v6 = 1;
    }
    else {
      int64_t v6 = 2;
    }
  }

  return v6;
}

- (id)medicalIDEmergencyContactsWithError:(id *)a3
{
  v3 = [(HDMedicalIDDataManager *)self fetchMedicalIDWithError:a3];
  char v4 = [v3 emergencyContacts];

  return v4;
}

- (id)medicalIDClinicalContactsWithError:(id *)a3
{
  v3 = [(HDMedicalIDDataManager *)self fetchMedicalIDWithError:a3];
  char v4 = [v3 clinicalContacts];

  return v4;
}

- (BOOL)updateMedicalIDWithSyncedData:(id)a3 provenance:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v20 = 0;
  uint64_t v10 = -[HDMedicalIDDataManager _fetchMedicalIDDataFromDiskWithError:](self, &v20);
  id v11 = v20;
  v12 = v11;
  if (v10 || !v11)
  {
    if (v8)
    {
      if ([v8 isEqualToSyncedData:v10])
      {
        id v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = @"Attempt to save Medical ID with no updated fields.";
      }
      else
      {
        if (!self) {
          goto LABEL_17;
        }
        if (!v10) {
          goto LABEL_17;
        }
        id v17 = v10;
        v18 = [v8 dateSaved];
        id v19 = [v17 dateSaved];

        LODWORD(v17) = objc_msgSend(v18, "hk_isBeforeDate:", v19);
        if (!v17)
        {
LABEL_17:
          char v13 = -[HDMedicalIDDataManager _persistMedicalIDData:originalData:provenance:error:](self, v8, v10, v9, a5);
          goto LABEL_12;
        }
        id v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = @"Attempt to save Medical ID created before current Medical ID on disk.";
      }
    }
    else
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = @"Medical ID must not be nil";
    }
    objc_msgSend(v14, "hk_assignError:code:format:", a5, 3, v15);
    goto LABEL_11;
  }
  if (!a5)
  {
    _HKLogDroppedError();
LABEL_11:
    char v13 = 0;
    goto LABEL_12;
  }
  char v13 = 0;
  *a5 = v11;
LABEL_12:

  return v13;
}

- (uint64_t)_persistMedicalIDData:(void *)a3 originalData:(void *)a4 provenance:(void *)a5 error:
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (!a1)
  {
    uint64_t v55 = 0;
    goto LABEL_54;
  }
  id v64 = 0;
  int v12 = -[HDMedicalIDDataManager _persistMedicalIDDataFileToDisk:error:](a1, v9, &v64);
  id v13 = v64;
  _HKInitializeLogging();
  id v14 = *MEMORY[0x1E4F29F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v12;
    *(_WORD *)&buf[18] = 2114;
    *(void *)&buf[20] = v13;
    _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Persisted MedicalID changes on device with success (%id), error (%{public}@)", buf, 0x1Cu);
  }
  if (!v12)
  {
    id v18 = v13;
    if (v18)
    {
      if (a5) {
        *a5 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_52;
  }

  uint64_t v15 = [a1 profile];
  id v16 = [v15 database];
  id v63 = 0;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __78__HDMedicalIDDataManager__persistMedicalIDData_originalData_provenance_error___block_invoke;
  v61[3] = &unk_1E62F2AE0;
  v61[4] = a1;
  id v62 = v11;
  BOOL v17 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v16 error:&v63 block:v61];
  id v18 = v63;

  if (!v17)
  {
    _HKInitializeLogging();
    id v24 = *MEMORY[0x1E4F29F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Error performing write transaction to update medicalID key value parameters %{public}@", buf, 0x16u);
    }
    id v18 = v18;
    if (v18)
    {
      if (a5) {
        *a5 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    unsigned __int8 v65 = 0;
    goto LABEL_53;
  }
  notify_post((const char *)*MEMORY[0x1E4F2BED0]);
  id v19 = [v9 emergencyContacts];
  uint64_t v20 = [v10 emergencyContacts];
  id v60 = v11;
  if (v19 == (void *)v20)
  {

    goto LABEL_33;
  }
  id v21 = (void *)v20;
  v22 = [v10 emergencyContacts];
  v59 = v10;
  if (v22)
  {
    id v23 = [v9 emergencyContacts];
    id v10 = [v10 emergencyContacts];
    if ([v23 isEqual:v10])
    {

      id v10 = v59;
      goto LABEL_33;
    }
    v58 = v23;
  }
  v25 = [v9 emergencyContacts];
  if ([v25 count])
  {

    if (v22)
    {
    }
    id v10 = v59;
  }
  else
  {
    id v26 = [v59 emergencyContacts];
    uint64_t v57 = [v26 count];

    if (v22)
    {
    }
    id v10 = v59;
    if (!v57) {
      goto LABEL_33;
    }
  }
  notify_post((const char *)*MEMORY[0x1E4F2BED8]);
LABEL_33:
  v27 = objc_msgSend(a1, "profile", v57);
  uint64_t v28 = [v27 profileType];

  if (v28 == 1)
  {
    int v29 = [v9 isDisabled];
    id v30 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
    if (v29) {
      id v30 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
    }
    uint64_t v31 = *MEMORY[0x1E4F2BE28];
    CFStringRef v32 = (const __CFString *)*MEMORY[0x1E4F2BE48];
    CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x1E4F2BE28], *v30, (CFStringRef)*MEMORY[0x1E4F2BE48]);
    if (CFPreferencesAppSynchronize(v32))
    {
      uint64_t v33 = [MEMORY[0x1E4F1CAD0] setWithObject:v31];
      HKSynchronizeNanoPreferencesUserDefaults();
    }
    else
    {
      _HKInitializeLogging();
      __int16 v34 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "Could not synchronize Medical Id flag for watch", buf, 2u);
      }
    }
  }
  id v35 = v9;
  id v36 = v35;
  if (v35)
  {
    id v37 = [v35 emergencyContacts];
    uint64_t v38 = [v37 count];

    if (v38)
    {
      id v39 = [a1 profile];
      v40 = [v39 daemon];
      id v41 = [v40 behavior];
      int v42 = [v41 tinkerModeEnabled];

      if (v42)
      {
        if (([getSOSUtilitiesClass() isAllowedToMessageSOSContacts] & 1) == 0)
        {
          _HKInitializeLogging();
          v43 = *MEMORY[0x1E4F29F58];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = a1;
            _os_log_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_DEFAULT, "Set allowedToMessageSOSContacts for Medical ID on a Tinker device %{public}@", buf, 0xCu);
          }
          [getSOSUtilitiesClass() setAllowedToMessageSOSContacts:1];
        }
      }
    }
  }

  v44 = [a1 profile];
  v45 = [v44 nanoSyncManager];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __66__HDMedicalIDDataManager__triggerSyncForSuccessfulMedicalIDUpdate__block_invoke;
  *(void *)&buf[24] = &unk_1E62F2978;
  v71 = a1;
  [v45 syncHealthDataWithOptions:0 reason:@"Medical ID Update" completion:buf];

  v46 = [a1 profile];
  v47 = [v46 cloudSyncManager];
  id v66 = 0;
  int v48 = [v47 canPerformCloudSyncWithError:&v66];
  id v49 = v66;

  if (v48)
  {
    id v50 = [[HDCloudSyncContext alloc] initForPurpose:18 options:0 reason:23 xpcActivity:0];
    v51 = [a1 profile];
    v52 = [v51 cloudSyncManager];
    *(void *)v67 = MEMORY[0x1E4F143A8];
    *(void *)&v67[8] = 3221225472;
    *(void *)&v67[16] = __66__HDMedicalIDDataManager__triggerSyncForSuccessfulMedicalIDUpdate__block_invoke_314;
    v68 = &unk_1E62F2978;
    v69 = a1;
    id v53 = (id)[v52 syncMedicalIDDataWithContext:v50 completion:v67];

    id v11 = v60;
  }
  else
  {
    _HKInitializeLogging();
    v54 = *MEMORY[0x1E4F29F58];
    id v11 = v60;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v67 = 138543618;
      *(void *)&v67[4] = a1;
      *(_WORD *)&v67[12] = 2114;
      *(void *)&v67[14] = v49;
      _os_log_impl(&dword_1BCB7D000, v54, OS_LOG_TYPE_INFO, "%{public}@: Skipping cloud sync for medical ID update: %{public}@", v67, 0x16u);
    }
  }

LABEL_52:
  unsigned __int8 v65 = v12;
LABEL_53:

  uint64_t v55 = v65;
LABEL_54:

  return v55;
}

- (BOOL)updateMedicalIDWithLocalData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v14 = 0;
  id v7 = -[HDMedicalIDDataManager _fetchMedicalIDDataFromDiskWithError:](self, &v14);
  id v8 = v14;
  id v9 = v8;
  if (!v7 && v8)
  {
    if (a4) {
      *a4 = v8;
    }
    else {
      _HKLogDroppedError();
    }
    goto LABEL_9;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Medical ID must not be nil");
    goto LABEL_16;
  }
  if ([v6 isEqual:v7])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Attempt to save Medical ID with no updated fields.");
LABEL_9:

    goto LABEL_16;
  }
  if (([v6 hasAnyModificationDate] & 1) == 0) {
    [v6 setModificationDatesForUpdatedFieldsWithMedicalIDData:0];
  }
  id v10 = [v6 merge:v7];

  int v11 = [v10 isEmpty];
  if (v7 || !v11)
  {
    char v12 = -[HDMedicalIDDataManager _persistMedicalIDData:originalData:provenance:error:](self, v10, v7, &unk_1F17EB040, a4);

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Attempt to save empty Medical ID for the first time.");

LABEL_16:
  char v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)deleteMedicalIDDataWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F2B920]);
  [v5 setIsDisabled:1];
  [v5 setModificationDatesToCurrentDate];
  LOBYTE(a3) = [(HDMedicalIDDataManager *)self updateMedicalIDWithLocalData:v5 error:a3];

  return (char)a3;
}

- (uint64_t)_migrateMedicalIDLocationIfNecessary:(void *)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  char v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [a1 profile];
  id v6 = [v5 medicalIDDirectoryPath];
  id v7 = [v6 stringByStandardizingPath];

  id v8 = [a1 profile];
  id v9 = [v8 directoryPath];
  id v10 = [v9 stringByStandardizingPath];

  if (([v7 isEqualToString:v10] & 1) == 0)
  {
    char v26 = 0;
    if ([v4 fileExistsAtPath:v7 isDirectory:&v26])
    {
      if (!v26)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a2, 100, @"%@ is not a directory", v7);
LABEL_10:
        uint64_t v11 = 0;
        goto LABEL_23;
      }
    }
    else if (([v4 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:a2] & 1) == 0)
    {
      goto LABEL_10;
    }
    char v12 = -[HDMedicalIDDataManager _medicalIDURL](a1);
    id v13 = [v12 path];
    char v14 = [v4 fileExistsAtPath:v13 isDirectory:0];

    if (v14)
    {
      uint64_t v11 = 1;
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v15 = -[HDMedicalIDDataManager _medicalIDURLWithDirectoryPath:](v10);
    id v25 = 0;
    int v16 = [v4 moveItemAtURL:v15 toURL:v12 error:&v25];
    id v17 = v25;
    id v18 = v17;
    if (v16)
    {
      _HKInitializeLogging();
      id v19 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = v19;
        id v21 = [v15 path];
        v22 = [v12 path];
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v21;
        __int16 v29 = 2114;
        id v30 = v22;
        _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "Migrated Medical ID from %{public}@ to %{public}@", buf, 0x16u);
      }
    }
    else if ((objc_msgSend(v17, "hk_isCocoaNoSuchFileError") & 1) == 0)
    {
      id v23 = v18;
      if (v23)
      {
        if (a2) {
          *a2 = v23;
        }
        else {
          _HKLogDroppedError();
        }
      }

      uint64_t v11 = 0;
      goto LABEL_21;
    }
    uint64_t v11 = 1;
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v11 = 1;
LABEL_23:

  return v11;
}

- (id)_medicalIDURL
{
  if (a1)
  {
    v1 = [a1 profile];
    v2 = [v1 medicalIDDirectoryPath];
    v3 = -[HDMedicalIDDataManager _medicalIDURLWithDirectoryPath:](v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_unarchiveMedicalIDDataWithRawData:(void *)a3 error:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    char v4 = (void *)MEMORY[0x1E4F28DC0];
    id v5 = a2;
    id v15 = 0;
    id v6 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v15];

    id v7 = v15;
    if (v6)
    {
LABEL_16:
      id v13 = v6;
      goto LABEL_17;
    }
    _HKInitializeLogging();
    id v8 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "Failed to decode Medical ID data: %{public}@", buf, 0xCu);
      if (v7) {
        goto LABEL_5;
      }
    }
    else if (v7)
    {
LABEL_5:
      id v9 = [v7 domain];
      id v10 = v9;
      if (v9 == (void *)*MEMORY[0x1E4F281F8])
      {
        uint64_t v11 = [v7 code];

        if (v11 == 4865)
        {
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
      }
      id v12 = v7;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unknown failure occurred when unarchiving medical ID");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_15:

      goto LABEL_16;
    }
LABEL_11:
    if (a3) {
      *a3 = v12;
    }
    else {
      _HKLogDroppedError();
    }

    if (v7) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  id v6 = 0;
LABEL_18:

  return v6;
}

- (uint64_t)_persistMedicalIDDataFileToDisk:(void *)a3 error:
{
  v28[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v5 = a2;
  id v6 = -[HDMedicalIDDataManager _medicalIDURL](a1);
  id v7 = [v6 path];

  id v22 = 0;
  id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v22];

  id v9 = v22;
  if (v8)
  {
    uint64_t v10 = *MEMORY[0x1E4F28378];
    uint64_t v11 = *MEMORY[0x1E4F28330];
    v27[0] = *MEMORY[0x1E4F28370];
    v27[1] = v11;
    v28[0] = v10;
    v28[1] = &unk_1F17EB058;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
    id v21 = v9;
    uint64_t v13 = [v8 writeToFile:v7 options:1 error:&v21];
    id v14 = v21;

    if (v13)
    {
      id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v15 setAttributes:v12 ofItemAtPath:v7 error:0];
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v18 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v24 = v7;
        __int16 v25 = 2114;
        id v26 = v14;
        _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "Error writing Medical ID data file at %@, %{public}@", buf, 0x16u);
      }
      id v19 = v14;
      id v15 = v19;
      if (v19)
      {
        if (a3)
        {
          id v15 = v19;
          *a3 = v15;
        }
        else
        {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    int v16 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "Server failed to archive Medical ID data: %{public}@", buf, 0xCu);
    }
    id v17 = v9;
    id v12 = v17;
    if (v17)
    {
      if (a3)
      {
        id v12 = v17;
        uint64_t v13 = 0;
        *a3 = v12;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v13 = 0;
      }
      id v14 = v12;
    }
    else
    {
      id v14 = 0;
      uint64_t v13 = 0;
    }
  }

  return v13;
}

uint64_t __78__HDMedicalIDDataManager__persistMedicalIDData_originalData_provenance_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v17 = 0;
  BOOL v6 = +[HDMedicalIDSyncEntity incrementSyncAnchorWithProfile:WeakRetained error:&v17];
  id v7 = v17;

  if (!v6)
  {
    _HKInitializeLogging();
    uint64_t v11 = *MEMORY[0x1E4F29F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      id v21 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Error saving sync anchor for medicalID %{public}@", buf, 0x16u);
    }
    id v7 = v7;
    if (!v7) {
      goto LABEL_15;
    }
    if (!a3)
    {
LABEL_14:
      _HKLogDroppedError();
      goto LABEL_15;
    }
LABEL_9:
    id v7 = v7;
    *a3 = v7;
LABEL_15:

    uint64_t v10 = 0;
    goto LABEL_16;
  }
  if (*(void *)(a1 + 40))
  {

    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) profile];
    id v16 = 0;
    LOBYTE(v8) = +[HDMedicalIDSyncEntity setSyncProvenance:v8 profile:v9 error:&v16];
    id v7 = v16;

    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      id v12 = *MEMORY[0x1E4F29F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v15;
        __int16 v20 = 2114;
        id v21 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to save sync provenance during medicalID update, error: %{public}@", buf, 0x16u);
      }
      id v7 = v7;
      if (!v7) {
        goto LABEL_15;
      }
      if (!a3) {
        goto LABEL_14;
      }
      goto LABEL_9;
    }
  }
  uint64_t v10 = 1;
LABEL_16:

  return v10;
}

void __66__HDMedicalIDDataManager__triggerSyncForSuccessfulMedicalIDUpdate__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    BOOL v6 = *MEMORY[0x1E4F29F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, " %{public}@ Nano-sync triggered for a MedicalID update failed, error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __66__HDMedicalIDDataManager__triggerSyncForSuccessfulMedicalIDUpdate__block_invoke_314(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    BOOL v6 = *MEMORY[0x1E4F29F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, " %{public}@ Cloudsync triggered for a MedicalID update failed, error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)obliterateMedicalIDDataWithReason:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "Obliterating Medical ID with reason: %{public}@", buf, 0xCu);
  }
  int v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v9 = -[HDMedicalIDDataManager _medicalIDURL](self);
  id v15 = 0;
  char v10 = [v8 removeItemAtURL:v9 error:&v15];
  id v11 = v15;

  if (v10 & 1) != 0 || (objc_msgSend(v11, "hk_isCocoaNoSuchFileError"))
  {
    BOOL v12 = 1;
  }
  else
  {
    id v13 = v11;
    if (v13)
    {
      if (a4) {
        *a4 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v12 = 0;
  }

  return v12;
}

- (id)_medicalIDURLWithDirectoryPath:(void *)a1
{
  v1 = (objc_class *)MEMORY[0x1E4F1CB10];
  id v2 = a1;
  id v3 = [v1 alloc];
  char v4 = [v2 stringByAppendingPathComponent:@"MedicalIDData.archive"];

  id v5 = (void *)[v3 initFileURLWithPath:v4];

  return v5;
}

- (void)runEmergencyContactConsolidationWithCompletion:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

uint64_t __73__HDMedicalIDDataManager_runEmergencyContactConsolidationWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runEmergencyContactConsolidationWithCompletion:*(void *)(a1 + 40)];
}

- (id)unitTest_medicalIDData
{
  id v3 = (void *)MEMORY[0x1E4F1C9B8];
  id v4 = -[HDMedicalIDDataManager _medicalIDURL](self);
  id v5 = [v3 dataWithContentsOfURL:v4];

  id v6 = -[HDMedicalIDDataManager _unarchiveMedicalIDDataWithRawData:error:]((uint64_t)self, v5, 0);

  return v6;
}

- (BOOL)unitTest_persistMedicalIDData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v11 = 0;
  char v5 = -[HDMedicalIDDataManager _migrateMedicalIDLocationIfNecessary:](self, &v11);
  id v6 = v11;
  if (v5)
  {
    uint64_t v10 = 0;
    char v7 = -[HDMedicalIDDataManager _persistMedicalIDDataFileToDisk:error:](self, v4, &v10);
  }
  else
  {
    _HKInitializeLogging();
    int v8 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "Failed to migrate Medical ID before update: %{public}@", buf, 0xCu);
    }
    char v7 = 0;
  }

  return v7;
}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained daemon];
  char v5 = [v4 analyticsSubmissionCoordinator];
  [v5 addObserver:self queue:0];
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (HKImproveHealthAndActivityAnalyticsAllowed())
  {
    id v18 = 0;
    id v6 = [(HDMedicalIDDataManager *)self fetchMedicalIDWithError:&v18];
    id v7 = v18;
    int v8 = (os_log_t *)MEMORY[0x1E4F29F58];
    if (v7)
    {
      _HKInitializeLogging();
      uint64_t v9 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch MedicalID for daily analytics with error %{public}@", buf, 0xCu);
        if (v6) {
          goto LABEL_5;
        }
      }
      else if (v6)
      {
        goto LABEL_5;
      }
      if (!v5)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v17 = 1;
LABEL_14:
      (*((void (**)(id, void, uint64_t, void))v5 + 2))(v5, 0, v17, 0);
      goto LABEL_15;
    }
LABEL_5:
    uint64_t v10 = [getSOSUtilitiesClass() isAllowedToMessageSOSContacts];
    p_profile = &self->_profile;
    id WeakRetained = objc_loadWeakRetained((id *)p_profile);
    id v13 = [WeakRetained daemon];
    uint64_t v14 = [v13 analyticsSubmissionCoordinator];
    id v15 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v14, "medicalID_dailyReport:sosContactStatus:profileType:", v6, v10, objc_msgSend(v15, "profileType"));

    _HKInitializeLogging();
    id v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_INFO, "Submitted daily medical id analytic event", buf, 2u);
    }
    if (!v5) {
      goto LABEL_15;
    }
    uint64_t v17 = 0;
    goto LABEL_14;
  }
  if (v5) {
    (*((void (**)(id, void, uint64_t, void))v5 + 2))(v5, 0, 1, 0);
  }
LABEL_16:
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_runEmergencyContactConsolidationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HDSOSManager);
  [(HDMedicalIDDataManager *)self _runEmergencyContactConsolidationWithSOSManager:v5 WithCompletion:v4];
}

- (void)_runEmergencyContactConsolidationWithSOSManager:(id)a3 WithCompletion:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __120__HDMedicalIDDataManager_EmergencyContactConsolidation___runEmergencyContactConsolidationWithSOSManager_WithCompletion___block_invoke;
  aBlock[3] = &unk_1E62F29A0;
  id v40 = v8;
  uint64_t v9 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  int v10 = [v7 isAllowedToMessageSOSContacts];
  id v11 = (os_log_t *)MEMORY[0x1E4F29F58];
  if (!v10)
  {
    [v7 setIsAllowedToMessageSOSContacts];
    _HKInitializeLogging();
    id v13 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "HDMedicalIDDataManager._runEmergencyContactConsolidationWithCompletion - setting isAllowedToMessageSOSContacts to true.", buf, 2u);
    }
    uint64_t v14 = [v7 sosContactManager];
    id v15 = [v14 legacyContactsManager];
    char v16 = [v15 SOSLegacyContactsExist];

    if ((v16 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v21 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "HDMedicalIDDataManager._runEmergencyContactConsolidationWithCompletion - no contacts to consolidate.", buf, 2u);
      }
      v9[2](v9, 1, 0);
      goto LABEL_39;
    }
    id v38 = 0;
    id v17 = [(HDMedicalIDDataManager *)self fetchMedicalIDWithError:&v38];
    id v18 = v38;
    if (v18)
    {
      uint64_t v19 = v18;
      _HKInitializeLogging();
      os_log_t v20 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = v20;
        CFStringRef v32 = [v19 description];
        *(_DWORD *)buf = 138412290;
        int v42 = v32;
        _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "HDMedicalIDDataManager._runEmergencyContactConsolidationWithCompletion failed to fetch medical id data with error: %@.", buf, 0xCu);
      }
      ((void (**)(void *, uint64_t, void *))v9)[2](v9, 0, v19);
      goto LABEL_38;
    }
    if (!v17) {
      id v17 = objc_alloc_init(MEMORY[0x1E4F2B920]);
    }
    uint64_t v22 = [v17 consolidatedSOSContactsWithSOSContactsManager:v14];
    uint64_t v23 = [v17 emergencyContacts];
    id v24 = v22;
    if (v22 == (void *)v23) {
      goto LABEL_21;
    }
    __int16 v25 = (void *)v23;
    id v26 = [v17 emergencyContacts];
    if (v26)
    {
      id v4 = [v17 emergencyContacts];
      if ([v22 isEqual:v4])
      {

        id v24 = v25;
LABEL_21:

        goto LABEL_22;
      }
      if ([v22 count])
      {

        goto LABEL_29;
      }
    }
    else if ([v22 count])
    {
LABEL_29:

LABEL_33:
      [v17 setEmergencyContacts:v22];
      uint64_t v28 = [MEMORY[0x1E4F1C9C8] date];
      [v17 setEmergencyContactsModifiedDate:v28];

      id v37 = 0;
      [(HDMedicalIDDataManager *)self updateMedicalIDWithLocalData:v17 error:&v37];
      id v29 = v37;
      if (v29)
      {
        uint64_t v19 = v29;
        _HKInitializeLogging();
        os_log_t v30 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = v30;
          __int16 v34 = [v19 description];
          *(_DWORD *)buf = 138412290;
          int v42 = v34;
          _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "HDMedicalIDDataManager._runEmergencyContactConsolidationWithCompletion failed to save medical id data with error: %@.", buf, 0xCu);
        }
        ((void (**)(void *, uint64_t, void *))v9)[2](v9, 0, v19);
        goto LABEL_37;
      }
LABEL_22:
      _HKInitializeLogging();
      v27 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "HDMedicalIDDataManager._runEmergencyContactConsolidationWithCompletion - successfully consolidated contacts", buf, 2u);
      }
      v9[2](v9, 1, 0);
      uint64_t v19 = 0;
LABEL_37:

LABEL_38:
LABEL_39:

      goto LABEL_40;
    }
    id v35 = [v17 emergencyContacts];
    uint64_t v36 = [v35 count];

    if (v26)
    {
    }
    if (!v36) {
      goto LABEL_22;
    }
    goto LABEL_33;
  }
  _HKInitializeLogging();
  BOOL v12 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "HDMedicalIDDataManager._runEmergencyContactConsolidationWithCompletion - isAllowedToMessageSOSContacts - true, no need to consolidate", buf, 2u);
  }
  v9[2](v9, 1, 0);
LABEL_40:
}

uint64_t __120__HDMedicalIDDataManager_EmergencyContactConsolidation___runEmergencyContactConsolidationWithSOSManager_WithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end