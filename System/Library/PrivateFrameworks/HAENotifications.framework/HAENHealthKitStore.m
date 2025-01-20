@interface HAENHealthKitStore
+ (id)createHKCategorySampleForEvent:(id)a3;
+ (id)sharedInstance;
- (HAENHealthKitStore)init;
- (id)saveNotificationEventToHealthKit:(id)a3;
- (id)saveNotificationEventToHealthKit:(id)a3 withDelegate:(id)a4;
@end

@implementation HAENHealthKitStore

+ (id)sharedInstance
{
  if (sharedInstance_once_1 != -1) {
    dispatch_once(&sharedInstance_once_1, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_instance_1;
  return v2;
}

uint64_t __36__HAENHealthKitStore_sharedInstance__block_invoke()
{
  sharedInstance_instance_1 = objc_alloc_init(HAENHealthKitStore);
  return MEMORY[0x270F9A758]();
}

- (HAENHealthKitStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)HAENHealthKitStore;
  v2 = [(HAENHealthKitStore *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.coreaudio.hae.notifications.hkq", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    healthStore = v2->_healthStore;
    v2->_healthStore = 0;
  }
  return v2;
}

+ (id)createHKCategorySampleForEvent:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 eventType] != 2003133803)
  {
    v4 = HAENotificationsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[HAENHealthKitStore createHKCategorySampleForEvent:]((uint64_t)v3, v4);
    }
    v21 = 0;
    goto LABEL_13;
  }
  if (objc_opt_class())
  {
    v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v5 = [v3 metadata];
    v6 = [v5 objectForKey:@"_HAENMetadataIdentifierWeeklyExposureDuration"];

    if (v6)
    {
      objc_super v7 = (void *)MEMORY[0x263F0A628];
      v8 = [MEMORY[0x263F0A828] secondUnit];
      [v6 doubleValue];
      v9 = objc_msgSend(v7, "quantityWithUnit:doubleValue:", v8);
      [v4 setObject:v9 forKey:*MEMORY[0x263F09A20]];
    }
    v10 = [v3 metadata];
    v11 = [v10 objectForKey:@"_HAENMetadataIdentifierWeeklyIncludesPrunableData"];

    if (v11) {
      [v4 setObject:v11 forKey:@"_HKPrivateMetadataKeyNotificationIncludesPrunableData"];
    }
    v12 = (void *)MEMORY[0x263F0A628];
    v13 = [MEMORY[0x263F0A828] decibelAWeightedSoundPressureLevelUnit];
    [v3 level];
    v14 = objc_msgSend(v12, "quantityWithUnit:doubleValue:", v13);
    [v4 setObject:v14 forKey:*MEMORY[0x263F09A30]];

    v15 = (void *)MEMORY[0x263F0A148];
    v16 = [MEMORY[0x263F0A590] categoryTypeForIdentifier:*MEMORY[0x263F09308]];
    v17 = [v3 dateInterval];
    v18 = [v17 startDate];
    v19 = [v3 dateInterval];
    v20 = [v19 endDate];
    v21 = [v15 categorySampleWithType:v16 value:1 startDate:v18 endDate:v20 device:0 metadata:v4];

    v22 = HAENotificationsLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [v3 uuid];
      int v25 = 138412546;
      v26 = v21;
      __int16 v27 = 2112;
      v28 = v23;
      _os_log_impl(&dword_21FABA000, v22, OS_LOG_TYPE_DEFAULT, "created HKCategorySample [ %@ ] for event [ %@ ]", (uint8_t *)&v25, 0x16u);
    }
LABEL_13:

    goto LABEL_14;
  }
  v21 = 0;
LABEL_14:

  return v21;
}

- (id)saveNotificationEventToHealthKit:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HAENotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 uuid];
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_21FABA000, v5, OS_LOG_TYPE_DEFAULT, "saving notification event [ %@ ] to HealthKit", buf, 0xCu);
  }
  objc_super v7 = +[HAENHealthKitStore createHKCategorySampleForEvent:v4];
  v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__HAENHealthKitStore_saveNotificationEventToHealthKit___block_invoke;
    v12[3] = &unk_264527518;
    id v13 = v7;
    v14 = self;
    dispatch_async(queue, v12);

    v10 = 0;
  }
  else
  {
    v10 = [MEMORY[0x263F087E8] errorWithDomain:@"HAENotficiationsError" code:*(void *)"skh!" userInfo:0];
  }

  return v10;
}

void __55__HAENHealthKitStore_saveNotificationEventToHealthKit___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = HAENotificationsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) UUID];
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_21FABA000, v2, OS_LOG_TYPE_DEFAULT, "saving HKCategorySample [ %@ ] to healthkit", buf, 0xCu);
  }
  if (!*(void *)(*(void *)(a1 + 40) + 16) && objc_opt_class())
  {
    id v4 = objc_alloc_init(MEMORY[0x263F0A418]);
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;
  }
  objc_super v7 = *(void **)(a1 + 32);
  v8 = *(void **)(*(void *)(a1 + 40) + 16);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__HAENHealthKitStore_saveNotificationEventToHealthKit___block_invoke_289;
  v9[3] = &unk_264527568;
  id v10 = v7;
  [v8 saveObject:v10 withCompletion:v9];
}

void __55__HAENHealthKitStore_saveNotificationEventToHealthKit___block_invoke_289(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = HAENotificationsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __55__HAENHealthKitStore_saveNotificationEventToHealthKit___block_invoke_289_cold_1(a1, (uint64_t)v5, v6);
    }
  }
}

- (id)saveNotificationEventToHealthKit:(id)a3 withDelegate:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = HAENotificationsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 uuid];
    *(_DWORD *)buf = 138412546;
    v19 = v9;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_21FABA000, v8, OS_LOG_TYPE_DEFAULT, "saving notification event [ %@ ] to HealthKit using delegate: %@", buf, 0x16u);
  }
  if (v7)
  {
    id v10 = +[HAENHealthKitStore createHKCategorySampleForEvent:v6];
    v11 = v10;
    if (v10)
    {
      queue = self->_queue;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __68__HAENHealthKitStore_saveNotificationEventToHealthKit_withDelegate___block_invoke;
      v15[3] = &unk_264527518;
      id v16 = v10;
      id v17 = v7;
      dispatch_async(queue, v15);

      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"HAENotficiationsError" code:*(void *)"skh!" userInfo:0];
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"HAENotficiationsError" code:*(void *)"gld!" userInfo:0];
  }

  return v13;
}

uint64_t __68__HAENHealthKitStore_saveNotificationEventToHealthKit_withDelegate___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = HAENotificationsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) UUID];
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_21FABA000, v2, OS_LOG_TYPE_DEFAULT, "saving HKCategorySample [ %@ ] to HealthKit through HAENotificationCenterUserDelegate", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 40) saveHAENotificationEventAsHKCategorySample:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)createHKCategorySampleForEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FABA000, a2, OS_LOG_TYPE_ERROR, "unknown event type %@", (uint8_t *)&v2, 0xCu);
}

void __55__HAENHealthKitStore_saveNotificationEventToHealthKit___block_invoke_289_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = [*(id *)(a1 + 32) UUID];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_21FABA000, a3, OS_LOG_TYPE_ERROR, "failed to write healthkit sample [ %@ ], error: %@", (uint8_t *)&v6, 0x16u);
}

@end