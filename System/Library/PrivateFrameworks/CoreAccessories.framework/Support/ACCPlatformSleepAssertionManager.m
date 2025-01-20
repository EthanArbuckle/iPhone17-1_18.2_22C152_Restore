@interface ACCPlatformSleepAssertionManager
+ (id)sharedManager;
- (ACCPlatformSleepAssertionManager)init;
- (BOOL)chargingTypeExternalIsInductive;
- (BOOL)isOnAC;
- (NSMutableDictionary)sleepAssertionTimersForUUIDs;
- (NSMutableSet)sleepAssertionUUIDs;
- (NSString)batteryNotificationClientUUID;
- (OS_dispatch_queue)sleepAssertionUUIDsLock;
- (void)_addSleepAssertionForUUID:(id)a3;
- (void)_removeSleepAssertionForUUID:(id)a3 expiredOnly:(BOOL)a4;
- (void)addSleepAssertionForUUID:(id)a3;
- (void)dealloc;
- (void)powerInfoChangeNotificationHandler:(id)a3;
- (void)removeExpiredSleepAssertionForUUID:(id)a3;
- (void)removeSleepAssertionForUUID:(id)a3;
- (void)setBatteryNotificationClientUUID:(id)a3;
- (void)setChargingTypeExternalIsInductive:(BOOL)a3;
- (void)setIsOnAC:(BOOL)a3;
- (void)setSleepAssertionTimersForUUIDs:(id)a3;
- (void)setSleepAssertionUUIDs:(id)a3;
- (void)setSleepAssertionUUIDsLock:(id)a3;
- (void)updateAssertions;
@end

@implementation ACCPlatformSleepAssertionManager

- (ACCPlatformSleepAssertionManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)ACCPlatformSleepAssertionManager;
  v2 = [(ACCPlatformSleepAssertionManager *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.accessoryd.sleepAssertionUUIDsLock", 0);
    sleepAssertionUUIDsLock = v2->_sleepAssertionUUIDsLock;
    v2->_sleepAssertionUUIDsLock = (OS_dispatch_queue *)v3;

    sleepAssertionUUIDs = v2->_sleepAssertionUUIDs;
    v2->_sleepAssertionUUIDs = 0;

    sleepAssertionTimersForUUIDs = v2->_sleepAssertionTimersForUUIDs;
    v2->_sleepAssertionTimersForUUIDs = 0;

    batteryNotificationClientUUID = v2->_batteryNotificationClientUUID;
    v2->_batteryNotificationClientUUID = 0;

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"powerInfoChangeNotificationHandler:" name:ACCPlatformIOKitPowerPlugin_BatteryChargingTypeChanged object:0];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:ACCPlatformIOKitPowerPlugin_IsExternalChargerConnected object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:ACCPlatformIOKitPowerPlugin_BatteryChargingTypeChanged object:0];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(ACCPlatformSleepAssertionManager *)self sleepAssertionUUIDs];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v9);
        v11 = [(ACCPlatformSleepAssertionManager *)self sleepAssertionUUIDsLock];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __43__ACCPlatformSleepAssertionManager_dealloc__block_invoke;
        block[3] = &unk_1002158C8;
        block[4] = v10;
        dispatch_sync(v11, block);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v12 = [(ACCPlatformSleepAssertionManager *)self sleepAssertionTimersForUUIDs];
  [v12 removeAllObjects];

  [(ACCPlatformSleepAssertionManager *)self setSleepAssertionTimersForUUIDs:0];
  v13 = [(ACCPlatformSleepAssertionManager *)self sleepAssertionUUIDs];
  [v13 removeAllObjects];

  [(ACCPlatformSleepAssertionManager *)self setSleepAssertionUUIDs:0];
  v14.receiver = self;
  v14.super_class = (Class)ACCPlatformSleepAssertionManager;
  [(ACCPlatformSleepAssertionManager *)&v14 dealloc];
}

void __43__ACCPlatformSleepAssertionManager_dealloc__block_invoke(uint64_t a1)
{
  _getSleepAssertionPluginInstance();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 destroySleepAssertionForUUID:*(void *)(a1 + 32)];
}

- (void)_addSleepAssertionForUUID:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 7;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v50 = (uint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[#SleepAssertions] _addSleepAssertionForUUID: uuid %@", buf, 0xCu);
  }

  if (v4)
  {
    uint64_t v8 = [(ACCPlatformSleepAssertionManager *)self sleepAssertionUUIDs];

    if (!v8)
    {
      id v9 = objc_alloc_init((Class)NSMutableSet);
      [(ACCPlatformSleepAssertionManager *)self setSleepAssertionUUIDs:v9];
    }
    uint64_t v10 = [(ACCPlatformSleepAssertionManager *)self sleepAssertionTimersForUUIDs];

    if (!v10)
    {
      v11 = +[NSMutableDictionary dictionary];
      [(ACCPlatformSleepAssertionManager *)self setSleepAssertionTimersForUUIDs:v11];
    }
    ConnectionWithUUID = acc_manager_getConnectionWithUUID(v4);
    if (ConnectionWithUUID)
    {
      int Type = acc_connection_getType((uint64_t)ConnectionWithUUID);
      BOOL v13 = Type == 4;
    }
    else
    {
      BOOL v13 = 0;
      int Type = 11;
    }
    objc_super v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    dispatch_source_set_timer(v14, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __62__ACCPlatformSleepAssertionManager__addSleepAssertionForUUID___block_invoke;
    handler[3] = &unk_100215968;
    handler[4] = self;
    id v15 = v4;
    id v48 = v15;
    dispatch_source_set_event_handler(v14, handler);
    dispatch_activate(v14);
    long long v16 = [(ACCPlatformSleepAssertionManager *)self sleepAssertionTimersForUUIDs];
    [v16 setObject:v14 forKey:v15];

    long long v17 = [(ACCPlatformSleepAssertionManager *)self sleepAssertionUUIDs];
    [v17 addObject:v15];

    long long v18 = [(ACCPlatformSleepAssertionManager *)self sleepAssertionUUIDs];
    id v19 = [v18 count];

    if (v19 == (id)1)
    {
      v20 = +[NSNotificationCenter defaultCenter];
      [v20 addObserver:self selector:"powerInfoChangeNotificationHandler:" name:ACCPlatformIOKitPowerPlugin_IsExternalChargerConnected object:0];

      v21 = _getACPowerPluginInstance();
      v22 = [v21 createBatteryNotificationClient];
      [(ACCPlatformSleepAssertionManager *)self setBatteryNotificationClientUUID:v22];

      v23 = _getACPowerPluginInstance();
      -[ACCPlatformSleepAssertionManager setIsOnAC:](self, "setIsOnAC:", [v23 isExternalChargerConnected]);

      v24 = _getACPowerPluginInstance();
      -[ACCPlatformSleepAssertionManager setChargingTypeExternalIsInductive:](self, "setChargingTypeExternalIsInductive:", [v24 getExternalBatteryChargingTypeIsInductive]);
    }
    if ([(ACCPlatformSleepAssertionManager *)self isOnAC]) {
      unsigned int v25 = acc_userDefaults_BOOLForKey(@"IgnoreIsOnAC") ^ 1;
    }
    else {
      unsigned int v25 = 0;
    }
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v26 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v26 = &_os_log_default;
      id v27 = &_os_log_default;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v28 = [(ACCPlatformSleepAssertionManager *)self isOnAC];
      unsigned int v29 = [(ACCPlatformSleepAssertionManager *)self chargingTypeExternalIsInductive];
      *(_DWORD *)buf = 138413314;
      uint64_t v50 = (uint64_t)v15;
      __int16 v51 = 1024;
      unsigned int v52 = v28;
      __int16 v53 = 1024;
      unsigned int v54 = v25;
      __int16 v55 = 1024;
      unsigned int v56 = v29;
      __int16 v57 = 1024;
      BOOL v58 = v13;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[#SleepAssertions] Addded sleep assertion timer for uuid %@, isOnAC %d -> %d, chargingTypeExternalIsInductive %d, bIsInductiveConnection %d", buf, 0x24u);
    }

    if (v25
      && ![(ACCPlatformSleepAssertionManager *)self chargingTypeExternalIsInductive])
    {
      v43 = _getSleepAssertionPluginInstance();
      [v43 createSleepAssertionForUUID:v15];

      if ((v13 | platform_systemInfo_isWatch()) != 1)
      {
LABEL_44:
        if (gLogObjects && gNumLogObjects >= 7)
        {
          v40 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          v40 = &_os_log_default;
          id v41 = &_os_log_default;
        }
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v42 = [(ACCPlatformSleepAssertionManager *)self sleepAssertionUUIDs];
          *(_DWORD *)buf = 138412290;
          uint64_t v50 = (uint64_t)v42;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "[#SleepAssertions] sleepAssertionUUIDs: %@", buf, 0xCu);
        }
        goto LABEL_53;
      }
      if (gLogObjects && gNumLogObjects >= 7)
      {
        v31 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v31 = &_os_log_default;
        id v44 = &_os_log_default;
      }
      int64_t v33 = 300000000000;
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
LABEL_43:

        v37 = [(ACCPlatformSleepAssertionManager *)self sleepAssertionTimersForUUIDs];
        v38 = [v37 objectForKey:v15];
        dispatch_time_t v39 = dispatch_time(0, v33);
        dispatch_source_set_timer(v38, v39, 0xFFFFFFFFFFFFFFFFLL, 0);

        goto LABEL_44;
      }
      unsigned int v45 = [(ACCPlatformSleepAssertionManager *)self chargingTypeExternalIsInductive];
      *(_DWORD *)buf = 134218496;
      uint64_t v50 = 300;
      __int16 v51 = 1024;
      unsigned int v52 = Type;
      __int16 v53 = 1024;
      unsigned int v54 = v45;
      v34 = "[#SleepAssertions] Holding sleep assertion for [%lld] secs on connectionType:%{coreacc:ACCConnection_Type_t}"
            "d, externalIsInductive %d";
      v35 = v31;
      uint32_t v36 = 24;
    }
    else
    {
      v30 = _getSleepAssertionPluginInstance();
      [v30 createSleepAssertionForUUID:v15];

      if (gLogObjects && gNumLogObjects >= 7)
      {
        v31 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v31 = &_os_log_default;
        id v32 = &_os_log_default;
      }
      int64_t v33 = 5000000000;
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 134218240;
      uint64_t v50 = 5;
      __int16 v51 = 1024;
      unsigned int v52 = Type;
      v34 = "[#SleepAssertions] Holding temporary sleep assertion for [%lld] secs on connectionType:%{coreacc:ACCConnection_Type_t}d";
      v35 = v31;
      uint32_t v36 = 18;
    }
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
    goto LABEL_43;
  }
LABEL_53:
}

void __62__ACCPlatformSleepAssertionManager__addSleepAssertionForUUID___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 7;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[#SleepAssertions] Sleep assertion timer fired!!  Cleaning up held sleep assertion.", v7, 2u);
  }

  BOOL v5 = [*(id *)(a1 + 32) sleepAssertionTimersForUUIDs];
  id v6 = [v5 objectForKey:*(void *)(a1 + 40)];

  if (v6) {
    dispatch_source_set_timer(v6, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  [*(id *)(a1 + 32) removeExpiredSleepAssertionForUUID:*(void *)(a1 + 40)];
}

- (void)addSleepAssertionForUUID:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 7;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[#SleepAssertions] addSleepAssertionForUUID: uuid %@", buf, 0xCu);
  }

  if (v4)
  {
    uint64_t v8 = [(ACCPlatformSleepAssertionManager *)self sleepAssertionUUIDsLock];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __61__ACCPlatformSleepAssertionManager_addSleepAssertionForUUID___block_invoke;
    v9[3] = &unk_100215968;
    v9[4] = self;
    id v10 = v4;
    dispatch_sync(v8, v9);
  }
}

id __61__ACCPlatformSleepAssertionManager_addSleepAssertionForUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addSleepAssertionForUUID:*(void *)(a1 + 40)];
}

- (void)_removeSleepAssertionForUUID:(id)a3 expiredOnly:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [(ACCPlatformSleepAssertionManager *)self sleepAssertionUUIDsLock];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __77__ACCPlatformSleepAssertionManager__removeSleepAssertionForUUID_expiredOnly___block_invoke;
    block[3] = &unk_100215990;
    id v9 = v6;
    id v10 = self;
    BOOL v11 = a4;
    dispatch_sync(v7, block);
  }
}

void __77__ACCPlatformSleepAssertionManager__removeSleepAssertionForUUID_expiredOnly___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 7;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = *(void **)(a1 + 32);
    int v17 = 138412290;
    long long v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[#SleepAssertions] Remove sleep assertion timer for uuid %@", (uint8_t *)&v17, 0xCu);
  }

  id v6 = [*(id *)(a1 + 40) sleepAssertionTimersForUUIDs];
  [v6 removeObjectForKey:*(void *)(a1 + 32)];

  if (!*(unsigned char *)(a1 + 48))
  {
    id v7 = [*(id *)(a1 + 40) sleepAssertionUUIDs];
    [v7 removeObject:*(void *)(a1 + 32)];
  }
  uint64_t v8 = [*(id *)(a1 + 40) sleepAssertionUUIDs];
  id v9 = [v8 count];

  if (!v9)
  {
    id v10 = _getACPowerPluginInstance();
    BOOL v11 = [*(id *)(a1 + 40) batteryNotificationClientUUID];
    [v10 destroyBatteryNotificationsForClient:v11];

    [*(id *)(a1 + 40) setBatteryNotificationClientUUID:0];
    id v12 = +[NSNotificationCenter defaultCenter];
    [v12 removeObserver:*(void *)(a1 + 40) name:ACCPlatformIOKitPowerPlugin_IsExternalChargerConnected object:0];
  }
  BOOL v13 = _getSleepAssertionPluginInstance();
  [v13 destroySleepAssertionForUUID:*(void *)(a1 + 32)];

  if (gLogObjects && gNumLogObjects >= 7)
  {
    objc_super v14 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    objc_super v14 = &_os_log_default;
    id v15 = &_os_log_default;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    long long v16 = [*(id *)(a1 + 40) sleepAssertionUUIDs];
    int v17 = 138412290;
    long long v18 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[#SleepAssertions] sleepAssertionUUIDs: %@", (uint8_t *)&v17, 0xCu);
  }
}

- (void)removeExpiredSleepAssertionForUUID:(id)a3
{
}

- (void)removeSleepAssertionForUUID:(id)a3
{
}

- (void)powerInfoChangeNotificationHandler:(id)a3
{
  id v4 = [a3 name];
  if (([v4 isEqualToString:ACCPlatformIOKitPowerPlugin_IsExternalChargerConnected] & 1) != 0
    || [v4 isEqualToString:ACCPlatformIOKitPowerPlugin_BatteryChargingTypeChanged])
  {
    unsigned int v5 = [(ACCPlatformSleepAssertionManager *)self isOnAC];
    unsigned int v6 = [(ACCPlatformSleepAssertionManager *)self chargingTypeExternalIsInductive];
    id v7 = _getACPowerPluginInstance();
    -[ACCPlatformSleepAssertionManager setIsOnAC:](self, "setIsOnAC:", [v7 isExternalChargerConnected]);

    uint64_t v8 = _getACPowerPluginInstance();
    -[ACCPlatformSleepAssertionManager setChargingTypeExternalIsInductive:](self, "setChargingTypeExternalIsInductive:", [v8 getExternalBatteryChargingTypeIsInductive]);

    if (gLogObjects && gNumLogObjects >= 7)
    {
      id v9 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v9 = &_os_log_default;
      id v10 = &_os_log_default;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138413314;
      id v12 = v4;
      __int16 v13 = 1024;
      unsigned int v14 = [(ACCPlatformSleepAssertionManager *)self isOnAC];
      __int16 v15 = 1024;
      unsigned int v16 = v5;
      __int16 v17 = 1024;
      unsigned int v18 = [(ACCPlatformSleepAssertionManager *)self chargingTypeExternalIsInductive];
      __int16 v19 = 1024;
      unsigned int v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[#SleepAssertions] Received notification: %@, isOnAC: %d, oldVal: %d, chargingTypeExternalIsInductive: %d, oldExtInductive: %d\n", (uint8_t *)&v11, 0x24u);
    }

    if (v5 != [(ACCPlatformSleepAssertionManager *)self isOnAC]
      || v6 != [(ACCPlatformSleepAssertionManager *)self chargingTypeExternalIsInductive])
    {
      [(ACCPlatformSleepAssertionManager *)self updateAssertions];
    }
  }
}

- (void)updateAssertions
{
  id v3 = [(ACCPlatformSleepAssertionManager *)self sleepAssertionUUIDsLock];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __52__ACCPlatformSleepAssertionManager_updateAssertions__block_invoke;
  block[3] = &unk_1002158C8;
  void block[4] = self;
  dispatch_sync(v3, block);
}

void __52__ACCPlatformSleepAssertionManager_updateAssertions__block_invoke(uint64_t a1)
{
  v42 = _getSleepAssertionPluginInstance();
  if ([*(id *)(a1 + 32) isOnAC]) {
    unsigned int v2 = acc_userDefaults_BOOLForKey(@"IgnoreIsOnAC") ^ 1;
  }
  else {
    unsigned int v2 = 0;
  }
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 7;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    unsigned int v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    unsigned int v5 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [*(id *)(a1 + 32) isOnAC];
    unsigned int v7 = [*(id *)(a1 + 32) chargingTypeExternalIsInductive];
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)id v48 = v6;
    *(_WORD *)&v48[4] = 1024;
    *(_DWORD *)&v48[6] = v2;
    LOWORD(v49) = 1024;
    *(_DWORD *)((char *)&v49 + 2) = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[#SleepAssertions] updateAssertions: isOnAC %d -> %d, chargingTypeExternalIsInductive %d", buf, 0x14u);
  }

  id v8 = objc_alloc((Class)NSSet);
  id v9 = [*(id *)(a1 + 32) sleepAssertionUUIDs];
  id v10 = [v8 initWithSet:v9 copyItems:0];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v44;
    *(void *)&long long v12 = 134218240;
    long long v40 = v12;
    do
    {
      __int16 v15 = 0;
      do
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8 * (void)v15);
        __int16 v17 = objc_msgSend(*(id *)(a1 + 32), "sleepAssertionTimersForUUIDs", v40);
        unsigned int v18 = [v17 objectForKey:v16];

        if (v18
          || ([*(id *)(a1 + 32) _addSleepAssertionForUUID:v16],
              [*(id *)(a1 + 32) sleepAssertionTimersForUUIDs],
              __int16 v19 = objc_claimAutoreleasedReturnValue(),
              [v19 objectForKey:v16],
              unsigned int v18 = objc_claimAutoreleasedReturnValue(),
              v19,
              v18))
        {
          if (!v2 || ([*(id *)(a1 + 32) chargingTypeExternalIsInductive] & 1) != 0)
          {
            [v42 destroySleepAssertionForUUID:v16];
            uint64_t v20 = gLogObjects;
            int v21 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 7)
            {
              v22 = *(id *)(gLogObjects + 48);
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v40;
                *(void *)id v48 = v20;
                *(_WORD *)&v48[8] = 1024;
                LODWORD(v49) = v21;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              id v23 = &_os_log_default;
              v22 = &_os_log_default;
            }
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)id v48 = v16;
              v24 = v22;
              unsigned int v25 = "[#SleepAssertions] Disable sleep assertion for uuid %@";
              goto LABEL_31;
            }
            goto LABEL_32;
          }
          [v42 createSleepAssertionForUUID:v16];
          unsigned int v28 = platform_systemInfo_isWatch();
          uint64_t v29 = gLogObjects;
          int v30 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v31 = gNumLogObjects <= 6;
          }
          else {
            BOOL v31 = 1;
          }
          int v32 = !v31;
          if (v28)
          {
            if (v32)
            {
              int64_t v33 = *(id *)(gLogObjects + 48);
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v40;
                *(void *)id v48 = v29;
                *(_WORD *)&v48[8] = 1024;
                LODWORD(v49) = v30;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              id v37 = &_os_log_default;
              int64_t v33 = &_os_log_default;
            }
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              *(void *)id v48 = 300;
              *(_WORD *)&v48[8] = 2112;
              uint64_t v49 = v16;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[#SleepAssertions] Holding sleep assertion for [%lld] secs for uuid %@", buf, 0x16u);
            }

            dispatch_time_t v27 = dispatch_time(0, 300000000000);
            v26 = v18;
          }
          else
          {
            if (v32)
            {
              v22 = *(id *)(gLogObjects + 48);
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v40;
                *(void *)id v48 = v29;
                *(_WORD *)&v48[8] = 1024;
                LODWORD(v49) = v30;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              id v38 = &_os_log_default;
              v22 = &_os_log_default;
            }
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)id v48 = v16;
              v24 = v22;
              unsigned int v25 = "[#SleepAssertions] Holding sleep assertion (no timeout) for uuid %@";
LABEL_31:
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
            }
LABEL_32:

            v26 = v18;
            dispatch_time_t v27 = -1;
          }
          dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0);
          goto LABEL_34;
        }
        uint64_t v34 = gLogObjects;
        int v35 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 7)
        {
          unsigned int v18 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v40;
            *(void *)id v48 = v34;
            *(_WORD *)&v48[8] = 1024;
            LODWORD(v49) = v35;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v36 = &_os_log_default;
          unsigned int v18 = &_os_log_default;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)id v48 = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[#SleepAssertions] Failed to get sleep assertion for uuid %@ !!", buf, 0xCu);
        }
LABEL_34:

        __int16 v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v39 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
      id v13 = v39;
    }
    while (v39);
  }
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__ACCPlatformSleepAssertionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, block);
  }
  unsigned int v2 = (void *)sharedManager_sharedInstance;

  return v2;
}

uint64_t __49__ACCPlatformSleepAssertionManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

- (NSMutableSet)sleepAssertionUUIDs
{
  return self->_sleepAssertionUUIDs;
}

- (void)setSleepAssertionUUIDs:(id)a3
{
}

- (NSMutableDictionary)sleepAssertionTimersForUUIDs
{
  return self->_sleepAssertionTimersForUUIDs;
}

- (void)setSleepAssertionTimersForUUIDs:(id)a3
{
}

- (OS_dispatch_queue)sleepAssertionUUIDsLock
{
  return self->_sleepAssertionUUIDsLock;
}

- (void)setSleepAssertionUUIDsLock:(id)a3
{
}

- (BOOL)isOnAC
{
  return self->_isOnAC;
}

- (void)setIsOnAC:(BOOL)a3
{
  self->_isOnAC = a3;
}

- (BOOL)chargingTypeExternalIsInductive
{
  return self->_chargingTypeExternalIsInductive;
}

- (void)setChargingTypeExternalIsInductive:(BOOL)a3
{
  self->_chargingTypeExternalIsInductive = a3;
}

- (NSString)batteryNotificationClientUUID
{
  return self->_batteryNotificationClientUUID;
}

- (void)setBatteryNotificationClientUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryNotificationClientUUID, 0);
  objc_storeStrong((id *)&self->_sleepAssertionUUIDsLock, 0);
  objc_storeStrong((id *)&self->_sleepAssertionTimersForUUIDs, 0);

  objc_storeStrong((id *)&self->_sleepAssertionUUIDs, 0);
}

@end