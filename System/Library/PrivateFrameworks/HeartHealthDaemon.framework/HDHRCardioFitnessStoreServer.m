@interface HDHRCardioFitnessStoreServer
+ (id)taskIdentifier;
- (BOOL)_insertSampleWithLocalSource:(id)a3 error:(id *)a4;
- (BOOL)_saveCardioFitnessNotificationWithValue:(id)a3 threshold:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(unint64_t)a7 error:(id *)a8;
- (HDHRCardioFitnessStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)diagnosticDescription;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_saveCardioFitnessAlertWithValue:(id)a3 threshold:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(unint64_t)a7 completion:(id)a8;
@end

@implementation HDHRCardioFitnessStoreServer

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F67E00] taskIdentifier];
}

- (HDHRCardioFitnessStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)HDHRCardioFitnessStoreServer;
  v6 = [(HDStandardTaskServer *)&v10 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v7 addObject:v6];

    v8 = v6;
  }

  return v6;
}

- (void)remote_saveCardioFitnessAlertWithValue:(id)a3 threshold:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(unint64_t)a7 completion:(id)a8
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  v16 = (void (**)(id, BOOL, id))a8;
  id v17 = a6;
  id v18 = a5;
  _HKInitializeLogging();
  v19 = (os_log_t *)MEMORY[0x1E4F29F48];
  v20 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    log = v20;
    unint64_t v21 = a7;
    v22 = objc_opt_class();
    id v30 = v22;
    v23 = [v14 description];
    HKSensitiveLogItem();
    v24 = v31 = self;
    v25 = [v15 description];
    *(_DWORD *)buf = 138544131;
    v34 = v22;
    a7 = v21;
    __int16 v35 = 2112;
    v36 = v24;
    __int16 v37 = 2049;
    unint64_t v38 = v21;
    __int16 v39 = 2112;
    v40 = v25;
    _os_log_impl(&dword_1D3AC6000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving fitness alert: %@, options:%{private}lu, threshold: %@", buf, 0x2Au);

    v19 = (os_log_t *)MEMORY[0x1E4F29F48];
    self = v31;
  }
  id v32 = 0;
  BOOL v26 = -[HDHRCardioFitnessStoreServer _saveCardioFitnessNotificationWithValue:threshold:startDate:endDate:options:error:](self, "_saveCardioFitnessNotificationWithValue:threshold:startDate:endDate:options:error:", v14, v15, v18, v17, a7, &v32, log);

  id v27 = v32;
  if (!v26)
  {
    _HKInitializeLogging();
    os_log_t v28 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR)) {
      -[HDHRCardioFitnessStoreServer remote_saveCardioFitnessAlertWithValue:threshold:startDate:endDate:options:completion:](v28, (uint64_t)self, v27);
    }
  }
  v16[2](v16, v26, v27);
}

- (BOOL)_saveCardioFitnessNotificationWithValue:(id)a3 threshold:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(unint64_t)a7 error:(id *)a8
{
  v30[3] = *MEMORY[0x1E4F143B8];
  unint64_t v13 = a7 & 1;
  id v14 = (void *)MEMORY[0x1E4F2ACB0];
  id v15 = (void *)MEMORY[0x1E4F2ACB8];
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [v15 lowCardioFitnessEventType];
  uint64_t v21 = *MEMORY[0x1E4F2A190];
  v29[0] = *MEMORY[0x1E4F2A218];
  v29[1] = v21;
  v30[0] = v19;
  v30[1] = v18;
  v29[2] = *MEMORY[0x1E4F2BBB8];
  v22 = [NSNumber numberWithBool:v13];
  v30[2] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  v24 = [v14 categorySampleWithType:v20 value:1 startDate:v17 endDate:v16 metadata:v23];

  LOBYTE(a8) = [(HDHRCardioFitnessStoreServer *)self _insertSampleWithLocalSource:v24 error:a8];
  v25 = [HDHRHealthKitSyncManager alloc];
  BOOL v26 = [(HDStandardTaskServer *)self profile];
  id v27 = [(HDHRHealthKitSyncManager *)v25 initWithProfile:v26];

  [(HDHRHealthKitSyncManager *)v27 triggerImmediateSyncWithReason:@"New Cardio Fitness Notification sample added" loggingCategory:*MEMORY[0x1E4F29F48]];
  return (char)a8;
}

- (BOOL)_insertSampleWithLocalSource:(id)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(HDStandardTaskServer *)self profile];
  v8 = [v7 sourceManager];
  v9 = [v8 localDeviceSourceWithError:a4];

  if (v9)
  {
    objc_super v10 = [v7 deviceManager];
    v11 = [v10 currentDeviceEntityWithError:a4];

    if (v11)
    {
      v12 = [v7 dataProvenanceManager];
      unint64_t v13 = [v12 localDataProvenanceForSourceEntity:v9 version:0 deviceEntity:v11];

      id v14 = [v7 dataManager];
      v29[0] = v6;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      int v16 = [v14 insertDataObjects:v15 withProvenance:v13 creationDate:0 skipInsertionFilter:a4 error:CFAbsoluteTimeGetCurrent()];

      if (v16)
      {
        _HKInitializeLogging();
        id v17 = (void *)*MEMORY[0x1E4F29F48];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
        {
          id v18 = v17;
          id v19 = objc_opt_class();
          id v20 = v19;
          uint64_t v21 = HKSensitiveLogItem();
          int v23 = 138543874;
          v24 = v19;
          __int16 v25 = 2112;
          BOOL v26 = v21;
          __int16 v27 = 2112;
          os_log_t v28 = v9;
          _os_log_impl(&dword_1D3AC6000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Inserted sample: %@, source: %@", (uint8_t *)&v23, 0x20u);
        }
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F4121748](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F4121740](self, a2);
}

- (id)diagnosticDescription
{
  return &stru_1F2B36C98;
}

- (void)remote_saveCardioFitnessAlertWithValue:(void *)a3 threshold:startDate:endDate:options:completion:.cold.1(void *a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = a1;
  v5 = objc_opt_class();
  id v6 = v5;
  v7 = [a3 description];
  int v8 = 138543618;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Didn't save alert due to error: %{public}@", (uint8_t *)&v8, 0x16u);
}

@end