@interface PowerMonitor
+ (id)sharedMonitor;
- (BOOL)_getBatteryChargingTypeIsInductive:(int)a3;
- (BOOL)getBatteryChargingTypeIsInductive;
- (BOOL)getExternalBatteryChargingTypeIsInductive;
- (BOOL)isBatteryCharging;
- (BOOL)isExtChargerConnected;
- (BOOL)sleepNotificationsEnabled;
- (BOOL)systemIsAsleep;
- (IONotificationPort)batteryNotifyPortRef;
- (IONotificationPort)systemPowerNotifyPortRef;
- (NSLock)batteryNotificationClientsLock;
- (NSMutableArray)batteryNotificationClients;
- (NSMutableArray)clientsPreventingSleep;
- (NSMutableArray)sleepNotificationClients;
- (OS_dispatch_queue)clientsPreventingSleepLock;
- (OS_dispatch_queue)systemPowerQueue;
- (OS_dispatch_semaphore)sleepSemaphore;
- (PowerMonitor)init;
- (float)getBatteryChargingState;
- (id)createBatteryNotificationClient;
- (id)createSleepNotificationClient;
- (int)batteryCapacity;
- (int)batteryCapacityMax;
- (int)batteryCapacityOverride;
- (int)batteryChargingType;
- (int)batteryChargingTypeExternal;
- (int)getBatteryChargingState;
- (unsigned)batteryChargeLevelPercent;
- (unsigned)battery_iter;
- (unsigned)getBatteryChargeLevel;
- (unsigned)systemPowerIterator;
- (unsigned)systemPowerPort;
- (void)_checkAndSendNotificationForOldConnected:(BOOL)a3 oldIsBatteryCharging:(BOOL)a4 oldBatteryChargeLevelPercent:(int)a5 oldBatteryChargingType:(int)a6 oldBatteryChargingTypeExt:(int)a7 overrideChanged:(BOOL)a8;
- (void)clientHandledSleepNotification:(id)a3;
- (void)createBatteryNotificationClient;
- (void)createSleepNotificationClient;
- (void)dealloc;
- (void)destroyBatteryNotificationsForClient:(id)a3;
- (void)destroySleepNotificationsForClient:(id)a3;
- (void)getBatteryChargeLevel;
- (void)getBatteryChargingState;
- (void)setBatteryCapacity:(int)a3;
- (void)setBatteryCapacityMax:(int)a3;
- (void)setBatteryCapacityOverride:(int)a3;
- (void)setBatteryChargeLevelPercent:(unsigned __int8)a3;
- (void)setBatteryChargingType:(int)a3;
- (void)setBatteryChargingTypeExternal:(int)a3;
- (void)setBatteryNotificationClients:(id)a3;
- (void)setBatteryNotificationClientsLock:(id)a3;
- (void)setBatteryNotifyPortRef:(IONotificationPort *)a3;
- (void)setBattery_iter:(unsigned int)a3;
- (void)setClientsPreventingSleep:(id)a3;
- (void)setClientsPreventingSleepLock:(id)a3;
- (void)setIsBatteryCharging:(BOOL)a3;
- (void)setIsExtChargerConnected:(BOOL)a3;
- (void)setSleepNotificationClients:(id)a3;
- (void)setSleepNotificationsEnabled:(BOOL)a3;
- (void)setSleepSemaphore:(id)a3;
- (void)setSystemIsAsleep:(BOOL)a3;
- (void)setSystemPowerIterator:(unsigned int)a3;
- (void)setSystemPowerNotifyPortRef:(IONotificationPort *)a3;
- (void)setSystemPowerPort:(unsigned int)a3;
- (void)setSystemPowerQueue:(id)a3;
@end

@implementation PowerMonitor

+ (id)sharedMonitor
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__PowerMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMonitor_once_2 != -1) {
    dispatch_once(&sharedMonitor_once_2, block);
  }
  v2 = (void *)sharedMonitor_sharedInstance_2;
  return v2;
}

uint64_t __29__PowerMonitor_sharedMonitor__block_invoke(uint64_t a1)
{
  sharedMonitor_sharedInstance_2 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (PowerMonitor)init
{
  v17.receiver = self;
  v17.super_class = (Class)PowerMonitor;
  v2 = [(PowerMonitor *)&v17 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isExtChargerConnected = 0;
    v2->_batteryCapacity = 0;
    v2->_batteryCapacityMax = 100;
    v2->_batteryChargeLevelPercent = 0;
    v2->_sleepNotificationsEnabled = 0;
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    sleepSemaphore = v3->_sleepSemaphore;
    v3->_sleepSemaphore = (OS_dispatch_semaphore *)v4;

    uint64_t v6 = [MEMORY[0x263EFF980] array];
    sleepNotificationClients = v3->_sleepNotificationClients;
    v3->_sleepNotificationClients = (NSMutableArray *)v6;

    v3->_batteryNotifyPortRef = 0;
    v3->_battery_iter = 0;
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    batteryNotificationClients = v3->_batteryNotificationClients;
    v3->_batteryNotificationClients = (NSMutableArray *)v8;

    v10 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    batteryNotificationClientsLock = v3->_batteryNotificationClientsLock;
    v3->_batteryNotificationClientsLock = v10;

    *(void *)&v3->_batteryChargingType = -1;
    v3->_systemIsAsleep = 0;
    clientsPreventingSleep = v3->_clientsPreventingSleep;
    v3->_clientsPreventingSleep = 0;

    dispatch_queue_t v13 = dispatch_queue_create("clientsPreventingSleepLock", 0);
    clientsPreventingSleepLock = v3->_clientsPreventingSleepLock;
    v3->_clientsPreventingSleepLock = (OS_dispatch_queue *)v13;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__preferenceChangedNotification, @"com.apple.iapd.LoggingPreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.iapd.LoggingPreferencesChangedNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)PowerMonitor;
  [(PowerMonitor *)&v4 dealloc];
}

- (int)getBatteryChargingState
{
  unsigned int v3 = [(PowerMonitor *)self getBatteryChargeLevel];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    uint64_t v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(PowerMonitor *)v3 getBatteryChargingState];
  }

  if ([(PowerMonitor *)self isBatteryCharging]
    && ![(PowerMonitor *)self batteryCapacityOverride]
    || [(PowerMonitor *)self isExtChargerConnected] && v3 <= 0x63)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v7 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      v7 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PowerMonitor getBatteryChargingState]();
    }
    int v13 = 1;
    goto LABEL_55;
  }
  if (![(PowerMonitor *)self isExtChargerConnected])
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v7 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      v7 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_54;
    }
LABEL_53:
    -[PowerMonitor getBatteryChargingState].cold.5();
LABEL_54:
    int v13 = 0;
    goto LABEL_55;
  }
  int v8 = [(PowerMonitor *)self batteryCapacity];
  int v9 = [(PowerMonitor *)self batteryCapacityMax];
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects <= 2;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (v8 != v9)
  {
    if (v11)
    {
      v7 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      v7 = MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  if (v11)
  {
    v7 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    v7 = MEMORY[0x263EF8438];
    id v15 = MEMORY[0x263EF8438];
  }
  int v13 = 2;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PowerMonitor getBatteryChargingState]();
  }
LABEL_55:

  return v13;
}

- (unsigned)getBatteryChargeLevel
{
  int v3 = [(PowerMonitor *)self batteryChargeLevelPercent];
  if ([(PowerMonitor *)self batteryCapacityOverride] >= 1) {
    int v3 = [(PowerMonitor *)self batteryCapacityOverride];
  }
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    uint64_t v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(PowerMonitor *)self getBatteryChargeLevel];
  }

  return v3;
}

- (BOOL)_getBatteryChargingTypeIsInductive:(int)a3
{
  return (a3 - 11) < 5;
}

- (BOOL)getBatteryChargingTypeIsInductive
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v2 = [(PowerMonitor *)self _getBatteryChargingTypeIsInductive:[(PowerMonitor *)self batteryChargingType]];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v2;
    _os_log_impl(&dword_222C9E000, v5, OS_LOG_TYPE_INFO, "getBatteryChargingTypeIsInductive = %d", (uint8_t *)v7, 8u);
  }

  return v2;
}

- (BOOL)getExternalBatteryChargingTypeIsInductive
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v2 = [(PowerMonitor *)self _getBatteryChargingTypeIsInductive:[(PowerMonitor *)self batteryChargingTypeExternal]];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v2;
    _os_log_impl(&dword_222C9E000, v5, OS_LOG_TYPE_INFO, "getExternalBatteryChargingTypeIsInductive = %d", (uint8_t *)v7, 8u);
  }

  return v2;
}

- (id)createBatteryNotificationClient
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F08C38] UUID];
  id v4 = [v3 UUIDString];

  id v5 = [(PowerMonitor *)self batteryNotificationClientsLock];
  [v5 lock];

  uint64_t v6 = [(PowerMonitor *)self batteryNotificationClients];
  [v6 addObject:v4];

  if (gLogObjects && gNumLogObjects >= 3)
  {
    v7 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    v7 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(PowerMonitor *)self batteryNotificationClients];
    int v30 = 138412546;
    v31 = v4;
    __int16 v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_222C9E000, v7, OS_LOG_TYPE_DEFAULT, "createBatteryNotificationClient registered clientUUID: %@ batteryNotificationClients: %@", (uint8_t *)&v30, 0x16u);
  }
  BOOL v10 = [(PowerMonitor *)self batteryNotificationClients];
  uint64_t v11 = [v10 count];

  if (v11 == 1)
  {
    [(PowerMonitor *)self setBatteryNotifyPortRef:IONotificationPortCreate(*MEMORY[0x263F0EC90])];
    CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource([(PowerMonitor *)self batteryNotifyPortRef]);
    if (RunLoopSource)
    {
      int v13 = RunLoopSource;
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, v13, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      id v15 = [(PowerMonitor *)self batteryNotifyPortRef];
      CFDictionaryRef v16 = IOServiceMatching("IOPMPowerSource");
      uint64_t v17 = IOServiceAddMatchingNotification(v15, "IOServiceFirstMatch", v16, (IOServiceMatchingCallback)__powerBatteryMatch, &self->_batteryNotifyPortRef, &self->_battery_iter);
      if (v17)
      {
        uint64_t v18 = v17;
        if (gLogObjects && gNumLogObjects >= 3)
        {
          v19 = *(id *)(gLogObjects + 16);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            __29__SleepAssertionManager_init__block_invoke_cold_1();
          }
          v19 = MEMORY[0x263EF8438];
          id v20 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          [(PowerMonitor *)v18 createBatteryNotificationClient];
        }
      }
      else
      {
        __powerBatteryMatch(&self->_batteryNotifyPortRef, [(PowerMonitor *)self battery_iter]);
      }
    }
  }
  v27 = [(PowerMonitor *)self batteryNotificationClientsLock];
  [v27 unlock];

  v28 = dispatch_get_global_queue(0, 0);
  dispatch_async(v28, &__block_literal_global);

  return v4;
}

void __47__PowerMonitor_createBatteryNotificationClient__block_invoke()
{
  v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"ACCPlatformCableTypePlugin_IsExternalChargerConnectedKey" object:0 userInfo:0];

  v1 = [MEMORY[0x263F08A00] defaultCenter];
  [v1 postNotificationName:@"ACCPlatformCableTypePlugin_BatteryChargingStateKey" object:0 userInfo:0];

  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"ACCPlatformCableTypePlugin_BatteryChargeLevelKey" object:0 userInfo:0];
}

- (void)destroyBatteryNotificationsForClient:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PowerMonitor *)self batteryNotificationClientsLock];
  [v5 lock];

  if (v4)
  {
    uint64_t v6 = [(PowerMonitor *)self batteryNotificationClients];
    int v7 = [v6 containsObject:v4];

    if (v7)
    {
      id v8 = [(PowerMonitor *)self batteryNotificationClients];
      [v8 removeObject:v4];

      if (gLogObjects && gNumLogObjects >= 3)
      {
        int v9 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        int v9 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [(PowerMonitor *)self batteryNotificationClients];
        int v19 = 138412546;
        id v20 = v4;
        __int16 v21 = 2112;
        uint64_t v22 = v11;
        _os_log_impl(&dword_222C9E000, v9, OS_LOG_TYPE_DEFAULT, "destroyBatteryNotificationClient clientUUID: %@ remaining batteryNotificationClients: %@", (uint8_t *)&v19, 0x16u);
      }
    }
    id v12 = [(PowerMonitor *)self batteryNotificationClients];
    uint64_t v13 = [v12 count];

    if (!v13)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        id v14 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        id v14 = MEMORY[0x263EF8438];
        id v15 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_222C9E000, v14, OS_LOG_TYPE_DEFAULT, "0 clients, unregistering battery notifications", (uint8_t *)&v19, 2u);
      }

      if ([(PowerMonitor *)self batteryNotifyPortRef])
      {
        Main = CFRunLoopGetMain();
        CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource([(PowerMonitor *)self batteryNotifyPortRef]);
        CFRunLoopRemoveSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
        IONotificationPortDestroy([(PowerMonitor *)self batteryNotifyPortRef]);
        [(PowerMonitor *)self setBatteryNotifyPortRef:0];
      }
    }
  }
  uint64_t v18 = [(PowerMonitor *)self batteryNotificationClientsLock];
  [v18 unlock];
}

- (id)createSleepNotificationClient
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F08C38] UUID];
  id v4 = [v3 UUIDString];

  id v5 = [(PowerMonitor *)self sleepNotificationClients];
  [v5 addObject:v4];

  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 3;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    id v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    id v8 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(PowerMonitor *)self sleepNotificationClients];
    int v19 = 138412546;
    id v20 = v4;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    _os_log_impl(&dword_222C9E000, v8, OS_LOG_TYPE_DEFAULT, "createSleepNotificationClient registered clientUUID: %@ sleepNotificationClients: %@", (uint8_t *)&v19, 0x16u);
  }
  id v10 = [(PowerMonitor *)self sleepNotificationClients];
  uint64_t v11 = [v10 count];

  if (v11 == 1)
  {
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.accessoryd.powerMonitor.systemPower.queue", 0);
    [(PowerMonitor *)self setSystemPowerQueue:v12];

    [(PowerMonitor *)self setSystemPowerPort:0];
    [(PowerMonitor *)self setSystemPowerNotifyPortRef:0];
    [(PowerMonitor *)self setSystemPowerIterator:0];
    [(PowerMonitor *)self setSystemPowerPort:IORegisterForSystemPower(self, &self->_systemPowerNotifyPortRef, (IOServiceInterestCallback)__SystemPowerCallback, &self->_systemPowerIterator)];
    if ([(PowerMonitor *)self systemPowerPort])
    {
      uint64_t v13 = [(PowerMonitor *)self systemPowerNotifyPortRef];
      id v14 = [(PowerMonitor *)self systemPowerQueue];
      IONotificationPortSetDispatchQueue(v13, v14);

      [(PowerMonitor *)self setSleepNotificationsEnabled:1];
      if (gLogObjects && gNumLogObjects >= 3)
      {
        id v15 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        id v15 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_222C9E000, v15, OS_LOG_TYPE_DEFAULT, "createSleepNotificationClient successfully registered for sleep notifications", (uint8_t *)&v19, 2u);
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        id v15 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        id v15 = MEMORY[0x263EF8438];
        id v17 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[PowerMonitor createSleepNotificationClient]();
      }
    }
  }
  return v4;
}

- (void)destroySleepNotificationsForClient:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PowerMonitor *)self sleepNotificationClients];
    int v6 = [v5 containsObject:v4];

    if (v6)
    {
      id v7 = [(PowerMonitor *)self sleepNotificationClients];
      [v7 removeObject:v4];

      if (gLogObjects && gNumLogObjects >= 3)
      {
        id v8 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        id v8 = MEMORY[0x263EF8438];
        id v9 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [(PowerMonitor *)self sleepNotificationClients];
        int v15 = 138412546;
        id v16 = v4;
        __int16 v17 = 2112;
        uint64_t v18 = v10;
        _os_log_impl(&dword_222C9E000, v8, OS_LOG_TYPE_DEFAULT, "destroySleepNotificationsForClient clientUUID: %@ sleepNotificationClients: %@", (uint8_t *)&v15, 0x16u);
      }
    }
    uint64_t v11 = [(PowerMonitor *)self sleepNotificationClients];
    uint64_t v12 = [v11 count];

    if (!v12)
    {
      if ([(PowerMonitor *)self systemPowerIterator]) {
        IODeregisterForSystemPower(&self->_systemPowerIterator);
      }
      if ([(PowerMonitor *)self systemPowerNotifyPortRef]) {
        IONotificationPortDestroy([(PowerMonitor *)self systemPowerNotifyPortRef]);
      }
      if ([(PowerMonitor *)self systemPowerPort]) {
        IOServiceClose([(PowerMonitor *)self systemPowerPort]);
      }
      [(PowerMonitor *)self setSystemPowerQueue:0];
      [(PowerMonitor *)self setSleepNotificationsEnabled:0];
      if (gLogObjects && gNumLogObjects >= 3)
      {
        uint64_t v13 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        uint64_t v13 = MEMORY[0x263EF8438];
        id v14 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_222C9E000, v13, OS_LOG_TYPE_DEFAULT, "0 clients, unregistering sleep notifications", (uint8_t *)&v15, 2u);
      }
    }
  }
}

- (void)clientHandledSleepNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PowerMonitor *)self clientsPreventingSleepLock];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47__PowerMonitor_clientHandledSleepNotification___block_invoke;
    v6[3] = &unk_264668310;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

void __47__PowerMonitor_clientHandledSleepNotification___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) clientsPreventingSleep];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) clientsPreventingSleep];
    [v4 removeObject:*(void *)(a1 + 40)];

    if (gLogObjects && gNumLogObjects >= 3)
    {
      id v5 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __29__SleepAssertionManager_init__block_invoke_cold_1();
      }
      id v5 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = [*(id *)(a1 + 32) clientsPreventingSleep];
      int v13 = 138412546;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl(&dword_222C9E000, v5, OS_LOG_TYPE_DEFAULT, "clientHandledSleepNotification removed client: %@: clientsPreventingSleep: %@", (uint8_t *)&v13, 0x16u);
    }
    id v9 = [*(id *)(a1 + 32) clientsPreventingSleep];
    if (![v9 count])
    {
      int v10 = [*(id *)(a1 + 32) systemIsAsleep];

      if (!v10) {
        return;
      }
      if (gLogObjects && gNumLogObjects >= 3)
      {
        uint64_t v11 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        uint64_t v11 = MEMORY[0x263EF8438];
        id v12 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_222C9E000, v11, OS_LOG_TYPE_DEFAULT, "No longer waiting on clients, signaling semaphore", (uint8_t *)&v13, 2u);
      }

      id v9 = [*(id *)(a1 + 32) sleepSemaphore];
      dispatch_semaphore_signal(v9);
    }
  }
}

- (void)_checkAndSendNotificationForOldConnected:(BOOL)a3 oldIsBatteryCharging:(BOOL)a4 oldBatteryChargeLevelPercent:(int)a5 oldBatteryChargingType:(int)a6 oldBatteryChargingTypeExt:(int)a7 overrideChanged:(BOOL)a8
{
  int v23 = a4;
  BOOL v24 = a8;
  BOOL v11 = a3;
  uint64_t v49 = *MEMORY[0x263EF8340];
  BOOL v13 = [(PowerMonitor *)self isBatteryCharging];
  int v14 = [(PowerMonitor *)self batteryChargeLevelPercent];
  if ([(PowerMonitor *)self batteryCapacityOverride] >= 1)
  {
    int v14 = [(PowerMonitor *)self batteryCapacityOverride];
    if (v14 == 100) {
      BOOL v13 = 0;
    }
  }
  int v22 = v13;
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects < 3;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __29__SleepAssertionManager_init__block_invoke_cold_1();
    }
    uint64_t v17 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v17 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67111936;
    BOOL v26 = v24;
    __int16 v27 = 1024;
    BOOL v28 = v11;
    __int16 v29 = 1024;
    BOOL v30 = [(PowerMonitor *)self isExtChargerConnected];
    __int16 v31 = 1024;
    int v32 = v23;
    __int16 v33 = 1024;
    BOOL v34 = v13;
    __int16 v35 = 1024;
    int v36 = [(PowerMonitor *)self batteryCapacityOverride];
    __int16 v37 = 1024;
    int v38 = a5;
    __int16 v39 = 1024;
    int v40 = v14;
    __int16 v41 = 1024;
    int v42 = a6;
    __int16 v43 = 1024;
    int v44 = [(PowerMonitor *)self batteryChargingType];
    __int16 v45 = 1024;
    int v46 = a7;
    __int16 v47 = 1024;
    int v48 = [(PowerMonitor *)self batteryChargingTypeExternal];
    _os_log_impl(&dword_222C9E000, v17, OS_LOG_TYPE_INFO, "_checkAndSendNotificationForOldConnected: overrideChanged %d, isExtChargerConnected %d -> %d, isBatteryCharging %d -> %d, batteryChargeLevelPercent(%d) %d -> %d, batteryChargingType %d -> %d, batteryChargingTypeExternal %d -> %d", buf, 0x4Au);
  }

  if ([(PowerMonitor *)self isExtChargerConnected] != v11)
  {
    uint64_t v18 = dispatch_get_global_queue(0, 0);
    dispatch_async(v18, &__block_literal_global_12);
  }
  if (v22 != v23)
  {
    uint64_t v19 = dispatch_get_global_queue(0, 0);
    dispatch_async(v19, &__block_literal_global_14);
  }
  if (v24 || v14 != a5)
  {
    id v20 = dispatch_get_global_queue(0, 0);
    dispatch_async(v20, &__block_literal_global_16);
  }
  if ([(PowerMonitor *)self batteryChargingType] != a6
    || [(PowerMonitor *)self batteryChargingTypeExternal] != a7)
  {
    __int16 v21 = dispatch_get_global_queue(0, 0);
    dispatch_async(v21, &__block_literal_global_18);
  }
}

void __172__PowerMonitor__checkAndSendNotificationForOldConnected_oldIsBatteryCharging_oldBatteryChargeLevelPercent_oldBatteryChargingType_oldBatteryChargingTypeExt_overrideChanged___block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"ACCPlatformCableTypePlugin_IsExternalChargerConnectedKey" object:0 userInfo:0];
}

void __172__PowerMonitor__checkAndSendNotificationForOldConnected_oldIsBatteryCharging_oldBatteryChargeLevelPercent_oldBatteryChargingType_oldBatteryChargingTypeExt_overrideChanged___block_invoke_2()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"ACCPlatformCableTypePlugin_BatteryChargingStateKey" object:0 userInfo:0];
}

void __172__PowerMonitor__checkAndSendNotificationForOldConnected_oldIsBatteryCharging_oldBatteryChargeLevelPercent_oldBatteryChargingType_oldBatteryChargingTypeExt_overrideChanged___block_invoke_3()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"ACCPlatformCableTypePlugin_BatteryChargeLevelKey" object:0 userInfo:0];
}

void __172__PowerMonitor__checkAndSendNotificationForOldConnected_oldIsBatteryCharging_oldBatteryChargeLevelPercent_oldBatteryChargingType_oldBatteryChargingTypeExt_overrideChanged___block_invoke_4()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"ACCPlatformCableTypePlugin_BatteryChargingTypeChanged" object:0 userInfo:0];
}

- (OS_dispatch_queue)systemPowerQueue
{
  return self->_systemPowerQueue;
}

- (void)setSystemPowerQueue:(id)a3
{
}

- (unsigned)systemPowerPort
{
  return self->_systemPowerPort;
}

- (void)setSystemPowerPort:(unsigned int)a3
{
  self->_systemPowerPort = a3;
}

- (IONotificationPort)systemPowerNotifyPortRef
{
  return self->_systemPowerNotifyPortRef;
}

- (void)setSystemPowerNotifyPortRef:(IONotificationPort *)a3
{
  self->_systemPowerNotifyPortRef = a3;
}

- (unsigned)systemPowerIterator
{
  return self->_systemPowerIterator;
}

- (void)setSystemPowerIterator:(unsigned int)a3
{
  self->_systemPowerIterator = a3;
}

- (BOOL)sleepNotificationsEnabled
{
  return self->_sleepNotificationsEnabled;
}

- (void)setSleepNotificationsEnabled:(BOOL)a3
{
  self->_sleepNotificationsEnabled = a3;
}

- (NSMutableArray)sleepNotificationClients
{
  return self->_sleepNotificationClients;
}

- (void)setSleepNotificationClients:(id)a3
{
}

- (NSMutableArray)clientsPreventingSleep
{
  return self->_clientsPreventingSleep;
}

- (void)setClientsPreventingSleep:(id)a3
{
}

- (OS_dispatch_semaphore)sleepSemaphore
{
  return self->_sleepSemaphore;
}

- (void)setSleepSemaphore:(id)a3
{
}

- (BOOL)systemIsAsleep
{
  return self->_systemIsAsleep;
}

- (void)setSystemIsAsleep:(BOOL)a3
{
  self->_systemIsAsleep = a3;
}

- (OS_dispatch_queue)clientsPreventingSleepLock
{
  return self->_clientsPreventingSleepLock;
}

- (void)setClientsPreventingSleepLock:(id)a3
{
}

- (BOOL)isExtChargerConnected
{
  return self->_isExtChargerConnected;
}

- (void)setIsExtChargerConnected:(BOOL)a3
{
  self->_isExtChargerConnected = a3;
}

- (int)batteryCapacity
{
  return self->_batteryCapacity;
}

- (void)setBatteryCapacity:(int)a3
{
  self->_batteryCapacity = a3;
}

- (int)batteryCapacityOverride
{
  return self->_batteryCapacityOverride;
}

- (void)setBatteryCapacityOverride:(int)a3
{
  self->_batteryCapacityOverride = a3;
}

- (int)batteryCapacityMax
{
  return self->_batteryCapacityMax;
}

- (void)setBatteryCapacityMax:(int)a3
{
  self->_batteryCapacityMax = a3;
}

- (BOOL)isBatteryCharging
{
  return self->_isBatteryCharging;
}

- (void)setIsBatteryCharging:(BOOL)a3
{
  self->_isBatteryCharging = a3;
}

- (unsigned)batteryChargeLevelPercent
{
  return self->_batteryChargeLevelPercent;
}

- (void)setBatteryChargeLevelPercent:(unsigned __int8)a3
{
  self->_batteryChargeLevelPercent = a3;
}

- (IONotificationPort)batteryNotifyPortRef
{
  return self->_batteryNotifyPortRef;
}

- (void)setBatteryNotifyPortRef:(IONotificationPort *)a3
{
  self->_batteryNotifyPortRef = a3;
}

- (unsigned)battery_iter
{
  return self->_battery_iter;
}

- (void)setBattery_iter:(unsigned int)a3
{
  self->_battery_iter = a3;
}

- (NSMutableArray)batteryNotificationClients
{
  return self->_batteryNotificationClients;
}

- (void)setBatteryNotificationClients:(id)a3
{
}

- (NSLock)batteryNotificationClientsLock
{
  return self->_batteryNotificationClientsLock;
}

- (void)setBatteryNotificationClientsLock:(id)a3
{
}

- (int)batteryChargingType
{
  return self->_batteryChargingType;
}

- (void)setBatteryChargingType:(int)a3
{
  self->_batteryChargingType = a3;
}

- (int)batteryChargingTypeExternal
{
  return self->_batteryChargingTypeExternal;
}

- (void)setBatteryChargingTypeExternal:(int)a3
{
  self->_batteryChargingTypeExternal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryNotificationClientsLock, 0);
  objc_storeStrong((id *)&self->_batteryNotificationClients, 0);
  objc_storeStrong((id *)&self->_clientsPreventingSleepLock, 0);
  objc_storeStrong((id *)&self->_sleepSemaphore, 0);
  objc_storeStrong((id *)&self->_clientsPreventingSleep, 0);
  objc_storeStrong((id *)&self->_sleepNotificationClients, 0);
  objc_storeStrong((id *)&self->_systemPowerQueue, 0);
}

- (void)getBatteryChargingState
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_222C9E000, v0, v1, "getBatteryChargingState: Disabled", v2, v3, v4, v5, v6);
}

- (float)getBatteryChargingState
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v5 = a1;
  v7[0] = 67109888;
  v7[1] = [a2 isBatteryCharging];
  __int16 v8 = 1024;
  int v9 = [a2 batteryCapacityOverride];
  __int16 v10 = 1024;
  int v11 = [a2 isExtChargerConnected];
  __int16 v12 = 1024;
  int v13 = v5;
  _os_log_debug_impl(&dword_222C9E000, a3, OS_LOG_TYPE_DEBUG, "getBatteryChargeLevel: isBatteryCharging %d, batteryCapacityOverride %d, isExtChargerConnected %d, batteryChargeLevelPercent %d", (uint8_t *)v7, 0x1Au);
  return result;
}

- (void)getBatteryChargeLevel
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 67109376;
  v5[1] = [a1 batteryChargeLevelPercent];
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_debug_impl(&dword_222C9E000, a3, OS_LOG_TYPE_DEBUG, "getBatteryChargeLevel: batteryChargeLevelPercent: %d -> %d", (uint8_t *)v5, 0xEu);
}

- (void)createBatteryNotificationClient
{
}

- (void)createSleepNotificationClient
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_222C9E000, v0, OS_LOG_TYPE_ERROR, "IORegisterForSystemPower failed!!  No system power notifications", v1, 2u);
}

@end