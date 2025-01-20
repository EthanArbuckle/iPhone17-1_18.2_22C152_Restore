@interface HDMCDeviceScopedStorageManager
- (BOOL)updateLocalDeviceValuesNowWithError:(id *)a3;
- (HDMCAccountDevicesInfo)unitTest_accountDevicesInfo;
- (HDMCDeviceScopedStorageManager)initWithProfile:(id)a3 settingsManager:(id)a4;
- (id)_updateLocalDeviceValuesNowWithError:(id *)a3;
- (id)accountDevicesInfoWithError:(id *)a3;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)setUnitTest_accountDevicesInfo:(id)a3;
- (void)settingsManagerDidUpdateNotificationSettings:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDMCDeviceScopedStorageManager

- (HDMCDeviceScopedStorageManager)initWithProfile:(id)a3 settingsManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDMCDeviceScopedStorageManager;
  v8 = [(HDMCDeviceScopedStorageManager *)&v16 init];
  if (v8)
  {
    v9 = [v6 deviceKeyValueStoreManager];
    objc_storeWeak((id *)&v8->_keyValueStore, v9);

    objc_storeStrong((id *)&v8->_settingsManager, a4);
    id v10 = objc_alloc(MEMORY[0x263F0A5A8]);
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    uint64_t v13 = [v10 initWithName:v12 loggingCategory:*MEMORY[0x263F09930]];
    observers = v8->_observers;
    v8->_observers = (HKObserverSet *)v13;

    [(HKMCSettingsManager *)v8->_settingsManager addObserver:v8 queue:0];
  }

  return v8;
}

- (BOOL)updateLocalDeviceValuesNowWithError:(id *)a3
{
  v3 = [(HDMCDeviceScopedStorageManager *)self _updateLocalDeviceValuesNowWithError:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_updateLocalDeviceValuesNowWithError:(id *)a3
{
  v28[3] = *MEMORY[0x263EF8340];
  v5 = +[HDMCDeviceInfo localDeviceInfoWithSettingsManager:self->_settingsManager];
  v27[0] = @"DayStreamProcessorAlgorithmVersion";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "dayStreamProcessorAlgorithmVersion"));
  v28[0] = v6;
  v27[1] = @"MenstruationNotificationsEnabled";
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "menstruationNotificationsEnabled"));
  v28[1] = v7;
  v27[2] = @"FertileWindowNotificationsEnabled";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "fertileWindowNotificationsEnabled"));
  v28[2] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__HDMCDeviceScopedStorageManager__updateLocalDeviceValuesNowWithError___block_invoke;
  v16[3] = &unk_264750FA0;
  v16[4] = self;
  v16[5] = &v23;
  v16[6] = &v17;
  [v9 enumerateKeysAndObjectsUsingBlock:v16];
  if (*((unsigned char *)v24 + 24))
  {
    observers = self->_observers;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __71__HDMCDeviceScopedStorageManager__updateLocalDeviceValuesNowWithError___block_invoke_2;
    v15[3] = &unk_264750FC8;
    v15[4] = self;
    [(HKObserverSet *)observers notifyObservers:v15];
    id v11 = v5;
  }
  else
  {
    id v12 = (id)v18[5];
    uint64_t v13 = v12;
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v11 = 0;
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v11;
}

void __71__HDMCDeviceScopedStorageManager__updateLocalDeviceValuesNowWithError___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = (id *)(a1[4] + 8);
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  id v14 = 0;
  char v11 = [WeakRetained setNumber:v8 forKey:v9 domainName:@"MenstrualCycles" protectionCategory:1 error:&v14];

  id v12 = v14;
  id v13 = v14;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v11;

  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v12);
    *a4 = 1;
  }
}

uint64_t __71__HDMCDeviceScopedStorageManager__updateLocalDeviceValuesNowWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 deviceScopedStorageManagerDidUpdateLocalDeviceValues:*(void *)(a1 + 32)];
}

- (id)accountDevicesInfoWithError:(id *)a3
{
  id v19 = 0;
  v5 = [(HDMCDeviceScopedStorageManager *)self _updateLocalDeviceValuesNowWithError:&v19];
  id v6 = v19;
  id v7 = v6;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_keyValueStore);
    id v18 = v7;
    id v9 = [WeakRetained fetchEntriesForDomain:@"MenstrualCycles" key:0 protectionCategory:1 error:&v18];
    id v10 = v18;

    if (v9)
    {
      objc_msgSend(v9, "hk_map:", &__block_literal_global_4);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      unitTest_accountDevicesInfo = self->_unitTest_accountDevicesInfo;
      if (unitTest_accountDevicesInfo) {
        id v13 = unitTest_accountDevicesInfo;
      }
      else {
        id v13 = [[HDMCAccountDevicesInfo alloc] initWithHealthAppDevicesInfo:v11 localDeviceInfo:v5];
      }
      v15 = v13;
      goto LABEL_17;
    }
    id v16 = v10;
    id v11 = v16;
    if (v16)
    {
      if (a3)
      {
        id v11 = v16;
        v15 = 0;
        *a3 = v11;
LABEL_17:

        goto LABEL_18;
      }
      _HKLogDroppedError();
    }
    v15 = 0;
    goto LABEL_17;
  }
  id v14 = v6;
  id v9 = v14;
  if (v14)
  {
    if (a3)
    {
      id v9 = v14;
      v15 = 0;
      *a3 = v9;
      id v10 = v9;
      goto LABEL_18;
    }
    _HKLogDroppedError();
  }
  v15 = 0;
  id v10 = v9;
LABEL_18:

  return v15;
}

id __62__HDMCDeviceScopedStorageManager_accountDevicesInfoWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 deviceContext];
  unint64_t v4 = [v3 type];

  if (v4 > 3 || v4 == 1)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = +[HDMCDeviceInfo deviceInfoFromStorageGroup:v2];
  }

  return v6;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void)settingsManagerDidUpdateNotificationSettings:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  unint64_t v4 = (os_log_t *)MEMORY[0x263F09930];
  v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v7 = v13;
    _os_log_impl(&dword_225722000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification Settings update, updating device-scoped storage", buf, 0xCu);
  }
  id v11 = 0;
  BOOL v8 = [(HDMCDeviceScopedStorageManager *)self updateLocalDeviceValuesNowWithError:&v11];
  id v9 = v11;
  if (!v8)
  {
    _HKInitializeLogging();
    os_log_t v10 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
      [(HDMCDeviceScopedStorageManager *)v10 settingsManagerDidUpdateNotificationSettings:(uint64_t)v9];
    }
  }
}

- (HDMCAccountDevicesInfo)unitTest_accountDevicesInfo
{
  return self->_unitTest_accountDevicesInfo;
}

- (void)setUnitTest_accountDevicesInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_accountDevicesInfo, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_destroyWeak((id *)&self->_keyValueStore);
}

- (void)settingsManagerDidUpdateNotificationSettings:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_225722000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error updating device-scoped storage after notification settings update %{public}@", (uint8_t *)&v6, 0x16u);
}

@end