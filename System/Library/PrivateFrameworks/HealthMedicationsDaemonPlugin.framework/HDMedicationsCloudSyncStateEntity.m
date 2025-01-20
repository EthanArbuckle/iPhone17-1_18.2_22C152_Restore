@interface HDMedicationsCloudSyncStateEntity
+ (BOOL)updateDataWithStateStorage:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (HDStateSyncEntitySchema)stateEntitySchema;
+ (__CFString)_stringFromSyncResult:(uint64_t)a1;
+ (id)_timeWindow;
+ (id)_windowUpdaterConfiguration;
+ (void)syncDidFinishWithResult:(int64_t)a3 stateStore:(id)a4 profile:(id)a5;
- (HDMedicationsCloudSyncStateEntity)init;
@end

@implementation HDMedicationsCloudSyncStateEntity

- (HDMedicationsCloudSyncStateEntity)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (HDStateSyncEntitySchema)stateEntitySchema
{
  v7[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v7[0] = 0x1F17F07E0;
  v7[1] = 0x1F17F02A0;
  v7[2] = 0x1F17F2040;
  v7[3] = @"MedicationsCloudSyncStateEntityDoseEventWindowKey";
  v7[4] = @"MedicationsCloudSyncStateEntitySampleOriginKey";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  uint64_t v4 = (void *)[v2 initWithArray:v3];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4F65C00]) initWithWithDomain:@"CloudSyncStateEntityDomainMedications" dataKeys:v4];
  return (HDStateSyncEntitySchema *)v5;
}

+ (BOOL)updateDataWithStateStorage:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_alloc_init(HDCloudSyncStateUpdaterMedicationDelegate);
  id v51 = 0;
  char v13 = [MEMORY[0x1E4F65AB8] updateDataWithStateStore:v9 delegate:v12 profile:v10 transaction:v11 error:&v51];
  id v14 = v51;
  if (v13)
  {
    v47 = a6;
    v15 = objc_alloc_init(HDCloudSyncStateUpdaterMedsListDelegate);
    id v50 = 0;
    char v16 = [MEMORY[0x1E4F65AB8] updateDataWithStateStore:v9 delegate:v15 profile:v10 transaction:v11 error:&v50];
    id v17 = v50;
    v48 = v17;
    if (v16)
    {
      v18 = objc_alloc_init(HDCloudSyncStateUpdaterMedicationScheduleDelegate);
      id v49 = 0;
      char v19 = [MEMORY[0x1E4F65AB8] updateDataWithStateStore:v9 delegate:v18 profile:v10 transaction:v11 error:&v49];
      id v20 = v49;
      v46 = v20;
      if (v19)
      {
        uint64_t v44 = +[HDMedicationsCloudSyncStateEntity _windowUpdaterConfiguration]();
        char v21 = objc_msgSend(MEMORY[0x1E4F65AA8], "updateDataWithStateStorage:configuration:profile:transaction:error:", v9);
        id v45 = 0;
        _HKInitializeLogging();
        v22 = HKLogMedication();
        v23 = v22;
        if (v21)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            uint64_t v53 = v24;
            _os_log_impl(&dword_1BD54A000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] update success", buf, 0xCu);
          }
        }
        else
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            uint64_t v43 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            uint64_t v53 = v43;
            __int16 v54 = 2114;
            uint64_t v55 = v44;
            __int16 v56 = 2114;
            id v57 = v45;
            _os_log_error_impl(&dword_1BD54A000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ error: %{public}@", buf, 0x20u);
          }

          v34 = v45;
          v23 = v34;
          if (v34)
          {
            if (v47)
            {
              v23 = v34;
              id *v47 = v23;
            }
            else
            {
              _HKLogDroppedError();
            }
          }
        }

        id v33 = (id)v44;
        goto LABEL_35;
      }
      v30 = v20;
      _HKInitializeLogging();
      v31 = HKLogMedication();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v41 = objc_opt_class();
        uint64_t v42 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v53 = v41;
        v30 = v46;
        __int16 v54 = 2114;
        uint64_t v55 = v42;
        __int16 v56 = 2114;
        id v57 = v46;
        _os_log_error_impl(&dword_1BD54A000, v31, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ error: %{public}@", buf, 0x20u);
      }

      id v32 = v30;
      id v33 = v32;
      if (v32)
      {
        if (v47)
        {
          id v33 = v32;
          char v21 = 0;
          id *v47 = v33;
LABEL_35:

          goto LABEL_36;
        }
        _HKLogDroppedError();
      }
      char v21 = 0;
      goto LABEL_35;
    }
    v27 = v17;
    _HKInitializeLogging();
    v28 = HKLogMedication();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = objc_opt_class();
      uint64_t v39 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v53 = v38;
      __int16 v54 = 2114;
      uint64_t v55 = v39;
      __int16 v56 = 2114;
      id v57 = v27;
      _os_log_error_impl(&dword_1BD54A000, v28, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ error: %{public}@", buf, 0x20u);
    }

    v29 = v27;
    v18 = v29;
    if (v29)
    {
      if (v47)
      {
        v18 = v29;
        char v21 = 0;
        id *v47 = v18;
LABEL_36:

        goto LABEL_37;
      }
      _HKLogDroppedError();
    }
    char v21 = 0;
    goto LABEL_36;
  }
  _HKInitializeLogging();
  v25 = HKLogMedication();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v35 = a6;
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    uint64_t v53 = v36;
    a6 = v35;
    __int16 v54 = 2114;
    uint64_t v55 = v37;
    __int16 v56 = 2114;
    id v57 = v14;
    _os_log_error_impl(&dword_1BD54A000, v25, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ error: %{public}@", buf, 0x20u);
  }

  v26 = (HDCloudSyncStateUpdaterMedsListDelegate *)v14;
  v15 = v26;
  if (!v26) {
    goto LABEL_23;
  }
  if (!a6)
  {
    _HKLogDroppedError();
LABEL_23:
    char v21 = 0;
    goto LABEL_37;
  }
  v15 = v26;
  char v21 = 0;
  *a6 = v15;
LABEL_37:

  return v21;
}

+ (id)_windowUpdaterConfiguration
{
  self;
  id v0 = objc_alloc(MEMORY[0x1E4F65AB0]);
  v1 = [MEMORY[0x1E4F2B1F8] medicationDoseEventType];
  uint64_t v2 = [MEMORY[0x1E4F65B00] medicationDoseEventSyncEntityClass];
  v3 = +[HDMedicationsCloudSyncStateEntity _timeWindow]();
  uint64_t v4 = HKLogMedication();
  v5 = (void *)[v0 initWithDomain:@"CloudSyncStateEntityDomainMedications" key:@"MedicationsCloudSyncStateEntityDoseEventWindowKey" sampleOriginKey:@"MedicationsCloudSyncStateEntitySampleOriginKey" sampleType:v1 syncEntityClass:v2 timeWindow:v3 loggingCategory:v4 sampleUUIDsFunction:MEMORY[0x1E4F659C8]];

  return v5;
}

+ (void)syncDidFinishWithResult:(int64_t)a3 stateStore:(id)a4 profile:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  _HKInitializeLogging();
  v8 = HKLogMedication();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = +[HDMedicationsCloudSyncStateEntity _stringFromSyncResult:]((uint64_t)a1, a3);
    id v11 = [v7 profileIdentifier];
    int v12 = 138543874;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_impl(&dword_1BD54A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] state sync result '%{public}@' for %{public}@", (uint8_t *)&v12, 0x20u);
  }
}

+ (__CFString)_stringFromSyncResult:(uint64_t)a1
{
  self;
  if (a2 == 1)
  {
    v3 = @"Failure";
  }
  else if (a2)
  {
    v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown (%ld)", a2);
  }
  else
  {
    v3 = @"Success";
  }
  return v3;
}

+ (id)_timeWindow
{
  self;
  id v0 = [MEMORY[0x1E4F1C9C8] date];
  v1 = [v0 dateByAddingTimeInterval:-172800.0];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v1 duration:172800.0];

  return v2;
}

@end