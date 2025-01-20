@interface KSiCloudDeviceListMonitor
@end

@implementation KSiCloudDeviceListMonitor

void __53___KSiCloudDeviceListMonitor_iCloudDeviceListMonitor__block_invoke()
{
  v0 = objc_alloc_init(_KSiCloudDeviceListMonitor);
  v1 = (void *)iCloudDeviceListMonitor_sharedInstance;
  iCloudDeviceListMonitor_sharedInstance = (uint64_t)v0;
}

void __70___KSiCloudDeviceListMonitor_fetchCloudKitDevicesWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = v6;
  if (!v6 || a4)
  {
    NSLog(&cfstr_CloudkitDevice.isa, a4);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = v6;
    v9 = KSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = [v8 needUpgradeDeviceNames];
      *(_DWORD *)buf = 136315394;
      v18 = "-[_KSiCloudDeviceListMonitor fetchCloudKitDevicesWithCompletionBlock:]_block_invoke";
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_22B2BC000, v9, OS_LOG_TYPE_INFO, "%s  cloudkit devices that needs upgrade: %@", buf, 0x16u);
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __70___KSiCloudDeviceListMonitor_fetchCloudKitDevicesWithCompletionBlock___block_invoke_135;
    v14[3] = &unk_264890770;
    v11 = *(void **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v15 = v8;
    id v16 = v12;
    id v13 = v8;
    [v11 fetchICloudDevicesWithCompletionBlock:v14];
  }
}

void __70___KSiCloudDeviceListMonitor_fetchCloudKitDevicesWithCompletionBlock___block_invoke_135(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v4 = [MEMORY[0x263EFF980] arrayWithArray:a2];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = objc_msgSend(*(id *)(a1 + 32), "needUpgradeDeviceNames", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = +[_KSDeviceInfo ksDeviceWithName:*(void *)(*((void *)&v13 + 1) + 8 * i) needsUpgrade:1];
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v7);
    }

    v11 = KSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[_KSiCloudDeviceListMonitor fetchCloudKitDevicesWithCompletionBlock:]_block_invoke";
      __int16 v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_22B2BC000, v11, OS_LOG_TYPE_INFO, "%s  >>> devices that need to upgraded: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v12();
  }
}

void __68___KSiCloudDeviceListMonitor_fetchICloudDevicesWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  if (v4)
  {
    uint64_t v6 = [v4 responseDictionary];
    NSLog(&cfstr_IcloudResponse.isa, v6);
    uint64_t v7 = [v6 objectForKeyedSubscript:@"devices"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = +[_KSDeviceInfo ksDecviceWithiCloudDeviceInfo:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
          [v5 addObject:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v9);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    long long v13 = KSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v19 = "-[_KSiCloudDeviceListMonitor fetchICloudDevicesWithCompletionBlock:]_block_invoke";
      _os_log_impl(&dword_22B2BC000, v13, OS_LOG_TYPE_INFO, "%s  couldn't fetch icloud device list", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __49___KSiCloudDeviceListMonitor_queryMigrationState__block_invoke()
{
  v0 = NSString;
  v1 = +[_KSTextReplacementHelper aggdPrefix];
  uint64_t v2 = [v0 stringWithFormat:@"%@.didMigrate", v1];
  v3 = (void *)queryMigrationState_kAggdKeyDidMigrate;
  queryMigrationState_kAggdKeyDidMigrate = v2;

  id v4 = NSString;
  id v7 = +[_KSTextReplacementHelper aggdPrefix];
  uint64_t v5 = [v4 stringWithFormat:@"%@.waitingMigration", v7];
  uint64_t v6 = (void *)queryMigrationState_kAggdKeyWaitingMigration;
  queryMigrationState_kAggdKeyWaitingMigration = v5;
}

void __49___KSiCloudDeviceListMonitor_queryMigrationState__block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = KSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [NSNumber numberWithBool:a2];
      int v13 = 136315394;
      long long v14 = "-[_KSiCloudDeviceListMonitor queryMigrationState]_block_invoke_2";
      __int16 v15 = 2112;
      long long v16 = v5;
      _os_log_impl(&dword_22B2BC000, v4, OS_LOG_TYPE_INFO, "%s  >>> The device migration eligibility for 30day check is: %@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v6 = &queryMigrationState_kAggdKeyWaitingMigration;
    if (a2) {
      uint64_t v6 = &queryMigrationState_kAggdKeyDidMigrate;
    }
    +[_KSAggdLogger addValue:1 forScalarKey:*v6];
    id v7 = objc_alloc(MEMORY[0x263EFFA40]);
    uint64_t v8 = +[_KSUtilities userDefaultsSuiteName];
    uint64_t v9 = (void *)[v7 initWithSuiteName:v8];

    [v9 setBool:a2 forKey:@"_KSTRCloudKitMigratable"];
    uint64_t v10 = [MEMORY[0x263EFF910] date];
    [v9 setObject:v10 forKey:@"_KSCKMigrationPreviousCheckDate"];

    if (a2)
    {
      uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
      id v12 = [NSNumber numberWithBool:1];
      [v11 postNotificationName:@"_KSCloudKitDevicesMigrationStateDidChange" object:v12];
    }
  }
}

void __87___KSiCloudDeviceListMonitor_isAccountCompatibleForCloudKitSyncingWithCompletionBlock___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(a1 + 32);
          id v12 = [*(id *)(*((void *)&v13 + 1) + 8 * i) swVersion];
          [v11 isSWVersionCloudKitSyncCompatible:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end