@interface HDMedicationsDeviceScopedStorageManager
- (BOOL)updateLocalDeviceValuesNowWithError:(id *)a3;
- (HDMedicationsDeviceScopedStorageManager)initWithProfile:(id)a3;
- (HKMedicationsAccountDevicesInfo)unitTest_accountDevicesInfo;
- (id)_updateLocalDeviceValuesNowWithError:(uint64_t)a1;
- (id)accountDevicesInfoTriggeringUpdate:(BOOL)a3 error:(id *)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)setUnitTest_accountDevicesInfo:(id)a3;
@end

@implementation HDMedicationsDeviceScopedStorageManager

- (HDMedicationsDeviceScopedStorageManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDMedicationsDeviceScopedStorageManager;
  v5 = [(HDMedicationsDeviceScopedStorageManager *)&v10 init];
  if (v5)
  {
    v6 = [v4 deviceKeyValueStoreManager];
    objc_storeWeak((id *)&v5->_keyValueStore, v6);

    uint64_t v7 = [v4 syncIdentityManager];
    syncIdentityManager = v5->_syncIdentityManager;
    v5->_syncIdentityManager = (HDSyncIdentityManager *)v7;

    [v4 registerProfileReadyObserver:v5 queue:0];
  }

  return v5;
}

- (void)profileDidBecomeReady:(id)a3
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__HDMedicationsDeviceScopedStorageManager_profileDidBecomeReady___block_invoke;
  v13[3] = &unk_1E63374A0;
  v13[4] = self;
  id v4 = a3;
  v5 = (void *)MEMORY[0x1C187D5B0](v13);
  v6 = (void *)MEMORY[0x1E4F65B40];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__HDMedicationsDeviceScopedStorageManager_profileDidBecomeReady___block_invoke_299;
  v11[3] = &unk_1E6338778;
  v11[4] = self;
  id v12 = v5;
  id v7 = v5;
  v8 = [v6 maintenanceOperationWithName:@"HDMedicationsDeviceScopedStorageManger" asynchronousBlock:v11];
  v9 = [v4 daemon];

  objc_super v10 = [v9 maintenanceWorkCoordinator];
  [v10 enqueueMaintenanceOperation:v8];
}

void __65__HDMedicationsDeviceScopedStorageManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v5 = 0;
  char v2 = [v1 updateLocalDeviceValuesNowWithError:&v5];
  id v3 = v5;
  if ((v2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v4 = HKLogMedication();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__HDMedicationsDeviceScopedStorageManager_profileDidBecomeReady___block_invoke_cold_1();
    }
  }
}

void __65__HDMedicationsDeviceScopedStorageManager_profileDidBecomeReady___block_invoke_299(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void (**)(uint64_t))(v2 + 16);
  id v4 = a2;
  v3(v2);
  _HKInitializeLogging();
  id v5 = HKLogMedication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v6 = v8;
    _os_log_impl(&dword_1BD54A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Finished local device update as maintenance operation", (uint8_t *)&v7, 0xCu);
  }
  v4[2](v4);
}

- (BOOL)updateLocalDeviceValuesNowWithError:(id *)a3
{
  id v3 = -[HDMedicationsDeviceScopedStorageManager _updateLocalDeviceValuesNowWithError:]((uint64_t)self, a3);
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_updateLocalDeviceValuesNowWithError:(uint64_t)a1
{
  v29[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    BOOL v4 = [MEMORY[0x1E4F66BA8] localDeviceInfo];
    v28[0] = @"_Name";
    id v5 = [v4 name];
    v29[0] = v5;
    v28[1] = @"_Model";
    id v6 = [v4 model];
    v29[1] = v6;
    v28[2] = @"_OperatingSystemVersion";
    if (v4)
    {
      [v4 operatingSystemVersion];
    }
    else
    {
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
    }
    int v7 = HKNSOperatingSystemVersionString();
    v29[2] = v7;
    v28[3] = @"_ScheduleCompatibilityVersion";
    id v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v4, "scheduleCompatibilityVersion"));
    v29[3] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];

    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__13;
    v19 = __Block_byref_object_dispose__13;
    id v20 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __80__HDMedicationsDeviceScopedStorageManager__updateLocalDeviceValuesNowWithError___block_invoke;
    v14[3] = &unk_1E63387A0;
    v14[4] = a1;
    v14[5] = &v21;
    v14[6] = &v15;
    [v9 enumerateKeysAndObjectsUsingBlock:v14];
    if (*((unsigned char *)v22 + 24))
    {
      id v10 = v4;
    }
    else
    {
      id v11 = (id)v16[5];
      id v12 = v11;
      if (v11)
      {
        if (a2) {
          *a2 = v11;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v10 = 0;
    }
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

void __80__HDMedicationsDeviceScopedStorageManager__updateLocalDeviceValuesNowWithError___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
    v16 = 0;
    char v10 = [WeakRetained setNumber:v8 forKey:v7 domainName:@"Medications" protectionCategory:1 error:&v16];
    id v11 = v16;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = 0;
      goto LABEL_8;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
    uint64_t v15 = 0;
    char v10 = [WeakRetained setString:v8 forKey:v7 domainName:@"Medications" protectionCategory:1 error:&v15];
    id v11 = v15;
  }
  id v12 = v11;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v10;

  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v13 = *(void *)(a1[6] + 8);
    id v12 = v12;
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a4 = 1;
  }
LABEL_8:
}

- (id)accountDevicesInfoTriggeringUpdate:(BOOL)a3 error:(id *)a4
{
  if (a3)
  {
    id v23 = 0;
    id v6 = -[HDMedicationsDeviceScopedStorageManager _updateLocalDeviceValuesNowWithError:]((uint64_t)self, &v23);
    id v7 = v23;
    id v8 = v7;
    if (!v6)
    {
      id v9 = v7;
      if (v9)
      {
        if (a4) {
          *a4 = v9;
        }
        else {
          _HKLogDroppedError();
        }
      }

      _HKInitializeLogging();
      id v6 = HKLogMedication();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationsDeviceScopedStorageManager accountDevicesInfoTriggeringUpdate:error:]();
      }
      v19 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F66BA8] localDeviceInfo];
    id v8 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyValueStore);
  id v22 = v8;
  id v11 = [WeakRetained fetchEntriesForDomain:@"Medications" key:0 protectionCategory:1 error:&v22];
  id v9 = v22;

  if (v11)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __84__HDMedicationsDeviceScopedStorageManager_accountDevicesInfoTriggeringUpdate_error___block_invoke;
    v21[3] = &unk_1E63387C8;
    v21[4] = self;
    id v12 = objc_msgSend(v11, "hk_map:", v21);
    uint64_t v13 = [(HDSyncIdentityManager *)self->_syncIdentityManager currentSyncIdentity];
    v14 = [v13 identity];
    uint64_t v15 = [v14 hardwareIdentifier];
    [v6 _setHardwareIdentifier:v15];

    unitTest_accountDevicesInfo = self->_unitTest_accountDevicesInfo;
    if (unitTest_accountDevicesInfo) {
      uint64_t v17 = unitTest_accountDevicesInfo;
    }
    else {
      uint64_t v17 = (HKMedicationsAccountDevicesInfo *)[objc_alloc(MEMORY[0x1E4F66B90]) initWithMedicationFeatureDevicesInfo:v12 localDeviceInfo:v6];
    }
    v19 = v17;
  }
  else
  {
    id v18 = v9;
    if (v18)
    {
      if (a4) {
        *a4 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v19 = 0;
  }

LABEL_18:
  return v19;
}

id __84__HDMedicationsDeviceScopedStorageManager_accountDevicesInfoTriggeringUpdate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 deviceContext];
  unint64_t v5 = [v4 type];

  if (v5 > 3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F66BA8] deviceInfoFromStorageGroup:v3 syncIdentityManager:*(void *)(*(void *)(a1 + 32) + 16)];
  }

  return v6;
}

- (HKMedicationsAccountDevicesInfo)unitTest_accountDevicesInfo
{
  return self->_unitTest_accountDevicesInfo;
}

- (void)setUnitTest_accountDevicesInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_accountDevicesInfo, 0);
  objc_storeStrong((id *)&self->_syncIdentityManager, 0);
  objc_destroyWeak((id *)&self->_keyValueStore);
}

void __65__HDMedicationsDeviceScopedStorageManager_profileDidBecomeReady___block_invoke_cold_1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_1_1(&dword_1BD54A000, v2, v3, "[%{public}@]: Error updating local device values: %{public}@", v4, v5, v6, v7, v8);
}

- (void)accountDevicesInfoTriggeringUpdate:error:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_1_1(&dword_1BD54A000, v2, v3, "[%{public}@]: Error updating local device values: %{public}@", v4, v5, v6, v7, v8);
}

@end