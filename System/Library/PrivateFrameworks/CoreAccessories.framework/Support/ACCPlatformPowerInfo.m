@interface ACCPlatformPowerInfo
- (ACCPlatformPowerInfo)initWithEndpointUID:(id)a3 andBitmask:(unint64_t)a4 andOldBitmask:(unint64_t)a5;
- (ACCPowerManager)accessoryPowerManager;
- (ACCPowerSiphoningControl)siphoningControl;
- (BOOL)holdingApplePencilSleepAssertion;
- (BOOL)isDeviceBatteryCharging;
- (BOOL)isExternalChargerConnected;
- (BOOL)isFirstSent_AccessoryChargingCurrent;
- (BOOL)isFirstSent_AvailableCurrent;
- (BOOL)isFirstSent_BatteryChargeLevel;
- (BOOL)isFirstSent_BatteryChargingState;
- (BOOL)isFirstSent_DeviceBatteryCharging;
- (BOOL)isFirstSent_ExternalChargerConnected;
- (BOOL)isOldUpdateTypeEnabled:(int)a3;
- (BOOL)isUpdateTypeEnabled:(int)a3;
- (BOOL)powerUpdateSentDueToSleep;
- (BOOL)requestSleepUpdate;
- (BOOL)systemAsleep;
- (NSString)applePencilBatteryNotificationClientUUID;
- (NSString)batteryNotificationClientUUID;
- (NSString)connectionUID;
- (NSString)endpointUID;
- (NSString)sleepNotificationClientUUID;
- (int)batteryChargingState;
- (unint64_t)oldUpdateTypesBitmask;
- (unint64_t)updateTypesBitmask;
- (unsigned)accessoryChargingCurrent;
- (unsigned)availableCurrent;
- (unsigned)batteryChargeLevel;
- (void)dealloc;
- (void)powerInfoChangeNotificationHandler:(id)a3;
- (void)setAccessoryChargingCurrent:(unsigned __int16)a3;
- (void)setApplePencilBatteryNotificationClientUUID:(id)a3;
- (void)setBatteryNotificationClientUUID:(id)a3;
- (void)setHoldingApplePencilSleepAssertion:(BOOL)a3;
- (void)setOldUpdateTypesBitmask:(unint64_t)a3;
- (void)setPowerUpdateSentDueToSleep:(BOOL)a3;
- (void)setRequestSleepUpdate:(BOOL)a3;
- (void)setSleepNotificationClientUUID:(id)a3;
- (void)setSystemAsleep:(BOOL)a3;
- (void)setUpdateTypesBitmask:(unint64_t)a3;
- (void)startPowerUpdates;
- (void)startSiphoningControl;
- (void)stopPowerUpdates;
- (void)systemHasPoweredOnNotificationHandler:(id)a3;
- (void)systemWillSleepNotificationHandler:(id)a3;
@end

@implementation ACCPlatformPowerInfo

- (ACCPlatformPowerInfo)initWithEndpointUID:(id)a3 andBitmask:(unint64_t)a4 andOldBitmask:(unint64_t)a5
{
  id v9 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ACCPlatformPowerInfo;
  v10 = [(ACCPlatformPowerInfo *)&v20 init];
  if (v10)
  {
    EndpointWithUUID = (void ***)acc_manager_getEndpointWithUUID(v9);
    objc_storeStrong((id *)v10 + 4, a3);
    if (EndpointWithUUID && *EndpointWithUUID) {
      v12 = **EndpointWithUUID;
    }
    else {
      v12 = 0;
    }
    objc_storeStrong((id *)v10 + 5, v12);
    [v10 setUpdateTypesBitmask:a4];
    [v10 setOldUpdateTypesBitmask:a5];
    v13 = (void *)*((void *)v10 + 7);
    *((void *)v10 + 7) = 0;

    *(_WORD *)(v10 + 15) = 0;
    *(_DWORD *)(v10 + 11) = 0;
    v14 = objc_alloc_init(ACCPowerManager);
    v15 = (void *)*((void *)v10 + 6);
    *((void *)v10 + 6) = v14;

    v10[17] = 0;
    v16 = (void *)*((void *)v10 + 10);
    *((void *)v10 + 10) = 0;

    v10[18] = 0;
    v17 = (void *)*((void *)v10 + 11);
    *((void *)v10 + 11) = 0;

    v18 = (void *)*((void *)v10 + 12);
    *((void *)v10 + 12) = 0;

    v10[19] = 0;
  }

  return (ACCPlatformPowerInfo *)v10;
}

- (void)dealloc
{
  endpointUID = self->_endpointUID;
  self->_endpointUID = 0;

  siphoningControl = self->_siphoningControl;
  self->_siphoningControl = 0;

  accessoryPowerManager = self->_accessoryPowerManager;
  self->_accessoryPowerManager = 0;

  [(ACCPlatformPowerInfo *)self setUpdateTypesBitmask:0];
  [(ACCPlatformPowerInfo *)self setOldUpdateTypesBitmask:0];
  v6.receiver = self;
  v6.super_class = (Class)ACCPlatformPowerInfo;
  [(ACCPlatformPowerInfo *)&v6 dealloc];
}

- (void)startSiphoningControl
{
  if (!self->_siphoningControl)
  {
    self->_siphoningControl = [[ACCPowerSiphoningControl alloc] initWithDelegate:self];
    _objc_release_x1();
  }
}

- (BOOL)isUpdateTypeEnabled:(int)a3
{
  return ([(ACCPlatformPowerInfo *)self updateTypesBitmask] & (1 << a3)) != 0;
}

- (BOOL)isOldUpdateTypeEnabled:(int)a3
{
  return ([(ACCPlatformPowerInfo *)self oldUpdateTypesBitmask] & (1 << a3)) != 0;
}

- (void)startPowerUpdates
{
  v4[0] = 67111424;
  v4[1] = 3;
  __int16 v5 = 1024;
  unsigned int v6 = [a1 isUpdateTypeEnabled:3];
  __int16 v7 = 1024;
  int v8 = 8;
  __int16 v9 = 1024;
  unsigned int v10 = [a1 isUpdateTypeEnabled:8];
  __int16 v11 = 1024;
  int v12 = 9;
  __int16 v13 = 1024;
  unsigned int v14 = [a1 isUpdateTypeEnabled:9];
  __int16 v15 = 1024;
  int v16 = 10;
  __int16 v17 = 1024;
  unsigned int v18 = [a1 isUpdateTypeEnabled:10];
  __int16 v19 = 1024;
  int v20 = 11;
  __int16 v21 = 1024;
  unsigned int v22 = [a1 isUpdateTypeEnabled:11];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[#Power] startSiphoningControl %d:%d %d:%d %d:%d %d:%d %d:%d", (uint8_t *)v4, 0x3Eu);
}

- (void)stopPowerUpdates
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  if ([(ACCPlatformPowerInfo *)self isUpdateTypeEnabled:7])
  {
    v4 = [(ACCPlatformPowerInfo *)self sleepNotificationClientUUID];

    if (v4)
    {
      __int16 v5 = _getIOKitPowerPluginInstance();
      unsigned int v6 = [(ACCPlatformPowerInfo *)self sleepNotificationClientUUID];
      [v5 destroySleepNotificationsForClient:v6];

      [(ACCPlatformPowerInfo *)self setSleepNotificationClientUUID:0];
    }
  }
  else if ([(ACCPlatformPowerInfo *)self isUpdateTypeEnabled:4] {
         || [(ACCPlatformPowerInfo *)self isUpdateTypeEnabled:5]
  }
         || [(ACCPlatformPowerInfo *)self isUpdateTypeEnabled:6])
  {
    __int16 v7 = _getIOKitPowerPluginInstance();
    int v8 = [(ACCPlatformPowerInfo *)self batteryNotificationClientUUID];
    [v7 destroyBatteryNotificationsForClient:v8];

    [(ACCPlatformPowerInfo *)self setBatteryNotificationClientUUID:0];
  }
}

- (void)systemWillSleepNotificationHandler:(id)a3
{
  v4 = [a3 name];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 8;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    __int16 v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    __int16 v7 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = [(ACCPlatformPowerInfo *)self endpointUID];
    __int16 v9 = [(ACCPlatformPowerInfo *)self connectionUID];
    int v26 = 138412802;
    *(void *)v27 = v4;
    *(_WORD *)&v27[8] = 2112;
    v28 = v8;
    __int16 v29 = 2112;
    v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[#Power] Received notification: %@, endpointUUID: %@\n, connectionUUID: %@\n", (uint8_t *)&v26, 0x20u);
  }
  [(ACCPlatformPowerInfo *)self setSystemAsleep:1];
  if ([(ACCPlatformPowerInfo *)self requestSleepUpdate]) {
    platform_power_sendSleepUpdate([(ACCPlatformPowerInfo *)self endpointUID]);
  }
  unsigned int v10 = [(ACCPlatformPowerInfo *)self endpointUID];
  unsigned int v11 = platform_power_powerDuringSleepEnabled(v10);

  if (v11)
  {
    int v12 = [(ACCPlatformPowerInfo *)self endpointUID];
    BOOL isModelNumberConnected = _isModelNumberConnected(v12, @"A1603");

    if (isModelNumberConnected)
    {
      unsigned int v14 = [(ACCPlatformPowerInfo *)self accessoryChargingCurrent];
      __int16 v15 = _getPowerPluginInstance();
      int v16 = [(ACCPlatformPowerInfo *)self connectionUID];
      -[ACCPlatformPowerInfo setAccessoryChargingCurrent:](self, "setAccessoryChargingCurrent:", (unsigned __int16)[v15 sleepPowerCurrentLimitInmA:v16]);

      if (gLogObjects && gNumLogObjects >= 8)
      {
        __int16 v17 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        __int16 v17 = &_os_log_default;
        id v20 = &_os_log_default;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v21 = [(ACCPlatformPowerInfo *)self accessoryChargingCurrent];
        int v26 = 67109376;
        *(_DWORD *)v27 = v14;
        *(_WORD *)&v27[4] = 1024;
        *(_DWORD *)&v27[6] = v21;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[#Power] systemWillSleepNotificationHandler oldLimit: %d, accessoryChargingCurrent: %d\n", (uint8_t *)&v26, 0xEu);
      }

      if (v14 != [(ACCPlatformPowerInfo *)self accessoryChargingCurrent])
      {
        if (gLogObjects && gNumLogObjects >= 8)
        {
          unsigned int v22 = *(id *)(gLogObjects + 56);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          unsigned int v22 = &_os_log_default;
          id v23 = &_os_log_default;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v24 = [(ACCPlatformPowerInfo *)self accessoryChargingCurrent];
          unsigned int v25 = [(ACCPlatformPowerInfo *)self accessoryChargingCurrent];
          int v26 = 67109632;
          *(_DWORD *)v27 = 7;
          *(_WORD *)&v27[4] = 1024;
          *(_DWORD *)&v27[6] = v24;
          LOWORD(v28) = 1024;
          *(_DWORD *)((char *)&v28 + 2) = v25;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[#Power] Sending Power Update (for sleep): %d: %d->%d\n", (uint8_t *)&v26, 0x14u);
        }

        platform_power_sendPowerUpdate([(ACCPlatformPowerInfo *)self endpointUID], 7, [(ACCPlatformPowerInfo *)self accessoryChargingCurrent], 13, 0);
        [(ACCPlatformPowerInfo *)self setPowerUpdateSentDueToSleep:1];
      }
    }
    else
    {
      unsigned int v18 = _getIOKitPowerPluginInstance();
      __int16 v19 = [(ACCPlatformPowerInfo *)self sleepNotificationClientUUID];
      [v18 clientHandledSleepNotification:v19];
    }
  }
}

- (void)systemHasPoweredOnNotificationHandler:(id)a3
{
  v4 = [a3 name];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 8;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    __int16 v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    __int16 v7 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = [(ACCPlatformPowerInfo *)self endpointUID];
    __int16 v9 = [(ACCPlatformPowerInfo *)self connectionUID];
    int v23 = 138412802;
    *(void *)unsigned int v24 = v4;
    *(_WORD *)&v24[8] = 2112;
    unsigned int v25 = v8;
    __int16 v26 = 2112;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[#Power] Received notification: %@, endpointUUID: %@\n, connectionUUID: %@\n", (uint8_t *)&v23, 0x20u);
  }
  [(ACCPlatformPowerInfo *)self setSystemAsleep:0];
  if ([(ACCPlatformPowerInfo *)self requestSleepUpdate]) {
    platform_power_sendWakeUpdate([(ACCPlatformPowerInfo *)self endpointUID]);
  }
  unsigned int v10 = [(ACCPlatformPowerInfo *)self endpointUID];
  unsigned int v11 = platform_power_powerDuringSleepEnabled(v10);

  if (v11)
  {
    int v12 = [(ACCPlatformPowerInfo *)self endpointUID];
    BOOL isModelNumberConnected = _isModelNumberConnected(v12, @"A1603");

    if (isModelNumberConnected)
    {
      unsigned int v14 = [(ACCPlatformPowerInfo *)self accessoryChargingCurrent];
      __int16 v15 = _getPowerPluginInstance();
      int v16 = [(ACCPlatformPowerInfo *)self connectionUID];
      -[ACCPlatformPowerInfo setAccessoryChargingCurrent:](self, "setAccessoryChargingCurrent:", (unsigned __int16)[v15 accessoryChargingCurrentInmA:v16]);

      if (gLogObjects && gNumLogObjects >= 8)
      {
        __int16 v17 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        __int16 v17 = &_os_log_default;
        id v18 = &_os_log_default;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v19 = [(ACCPlatformPowerInfo *)self accessoryChargingCurrent];
        int v23 = 67109376;
        *(_DWORD *)unsigned int v24 = v14;
        *(_WORD *)&v24[4] = 1024;
        *(_DWORD *)&v24[6] = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[#Power] systemHasPoweredOnNotificationHandler oldLimit: %d, accessoryChargingCurrent: %d\n", (uint8_t *)&v23, 0xEu);
      }

      if (v14 != [(ACCPlatformPowerInfo *)self accessoryChargingCurrent])
      {
        if (gLogObjects && gNumLogObjects >= 8)
        {
          id v20 = *(id *)(gLogObjects + 56);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          id v20 = &_os_log_default;
          id v21 = &_os_log_default;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v22 = [(ACCPlatformPowerInfo *)self accessoryChargingCurrent];
          int v23 = 67109632;
          *(_DWORD *)unsigned int v24 = 7;
          *(_WORD *)&v24[4] = 1024;
          *(_DWORD *)&v24[6] = v14;
          LOWORD(v25) = 1024;
          *(_DWORD *)((char *)&v25 + 2) = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[#Power] Sending Power Update (for wake): %d: %d->%d\n", (uint8_t *)&v23, 0x14u);
        }

        platform_power_sendPowerUpdate([(ACCPlatformPowerInfo *)self endpointUID], 7, [(ACCPlatformPowerInfo *)self accessoryChargingCurrent], 13, 0);
      }
    }
  }
}

- (void)powerInfoChangeNotificationHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 name];
  id v6 = [v4 userInfo];

  __int16 v7 = [v6 objectForKey:ACCPlatformPowerPlugin_ConnectionUUID];
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 8;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    unsigned int v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    unsigned int v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v66 = 136315394;
    *(void *)v67 = "-[ACCPlatformPowerInfo powerInfoChangeNotificationHandler:]";
    *(_WORD *)&v67[8] = 2112;
    *(void *)v68 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[#Power] %s: Received notification: %@\n", (uint8_t *)&v66, 0x16u);
  }

  if ([v5 isEqualToString:ACCPlatformPowerPlugin_USBCurrentLimitDidChangeNotification])
  {
    p_int availableCurrent = &self->_availableCurrent;
    int availableCurrent = self->_availableCurrent;
    __int16 v13 = _getPowerPluginInstance();
    self->_int availableCurrent = (unsigned __int16)[v13 USBCurrentLimitInmA:v7];

    if (platform_systemInfo_isLightning())
    {
      if (availableCurrent == *p_availableCurrent && self->_isFirstSent_AvailableCurrent)
      {
        if (gLogObjects && gNumLogObjects >= 8)
        {
          unsigned int v14 = *(id *)(gLogObjects + 56);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          unsigned int v14 = &_os_log_default;
          id v41 = &_os_log_default;
        }
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_118;
        }
        int v42 = self->_availableCurrent;
        BOOL isFirstSent_AvailableCurrent = self->_isFirstSent_AvailableCurrent;
        int v66 = 67109888;
        *(_DWORD *)v67 = 0;
        *(_WORD *)&v67[4] = 1024;
        *(_DWORD *)&v67[6] = availableCurrent;
        *(_WORD *)v68 = 1024;
        *(_DWORD *)&v68[2] = v42;
        *(_WORD *)&v68[6] = 1024;
        *(_DWORD *)&v68[8] = isFirstSent_AvailableCurrent;
        goto LABEL_117;
      }
      self->_BOOL isFirstSent_AvailableCurrent = 1;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        __int16 v17 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        __int16 v17 = &_os_log_default;
        id v28 = &_os_log_default;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[ACCPlatformPowerInfo powerInfoChangeNotificationHandler:]();
      }
    }
    else
    {
      self->_BOOL isFirstSent_AvailableCurrent = 1;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        __int16 v17 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        __int16 v17 = &_os_log_default;
        id v21 = &_os_log_default;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v22 = *p_availableCurrent;
        int v66 = 136316162;
        *(void *)v67 = "-[ACCPlatformPowerInfo powerInfoChangeNotificationHandler:]";
        *(_WORD *)&v67[8] = 1024;
        *(_DWORD *)v68 = 1047;
        *(_WORD *)&v68[4] = 1024;
        *(_DWORD *)&v68[6] = 0;
        *(_WORD *)&v68[10] = 1024;
        int v69 = availableCurrent;
        __int16 v70 = 1024;
        int v71 = v22;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[#Power] %s:%d Sending Power Update: %d: %d->%d\n", (uint8_t *)&v66, 0x24u);
      }
    }

    __int16 v29 = [(ACCPlatformPowerInfo *)self endpointUID];
    int v30 = self->_availableCurrent;
    int v31 = 0;
    goto LABEL_106;
  }
  if ([v5 isEqualToString:ACCPlatformPowerPlugin_BatteryPackModeDidChangeNotification])
  {
    BOOL isDeviceBatteryCharging = self->_isDeviceBatteryCharging;
    int v16 = _getPowerPluginInstance();
    self->_BOOL isDeviceBatteryCharging = [v16 isBatteryPackModeEnabled:v7] ^ 1;

    if (platform_systemInfo_isLightning())
    {
      if (isDeviceBatteryCharging == self->_isDeviceBatteryCharging && self->_isFirstSent_DeviceBatteryCharging)
      {
        if (gLogObjects && gNumLogObjects >= 8)
        {
          unsigned int v14 = *(id *)(gLogObjects + 56);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          unsigned int v14 = &_os_log_default;
          id v51 = &_os_log_default;
        }
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_118;
        }
        BOOL v52 = self->_isDeviceBatteryCharging;
        BOOL isFirstSent_DeviceBatteryCharging = self->_isFirstSent_DeviceBatteryCharging;
        int v66 = 67109888;
        *(_DWORD *)v67 = 1;
        *(_WORD *)&v67[4] = 1024;
        *(_DWORD *)&v67[6] = isDeviceBatteryCharging;
        *(_WORD *)v68 = 1024;
        *(_DWORD *)&v68[2] = v52;
        *(_WORD *)&v68[6] = 1024;
        *(_DWORD *)&v68[8] = isFirstSent_DeviceBatteryCharging;
        goto LABEL_117;
      }
      self->_BOOL isFirstSent_DeviceBatteryCharging = 1;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        id v20 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v20 = &_os_log_default;
        id v39 = &_os_log_default;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[ACCPlatformPowerInfo powerInfoChangeNotificationHandler:].cold.5();
      }
    }
    else
    {
      self->_BOOL isFirstSent_DeviceBatteryCharging = 1;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        id v20 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v20 = &_os_log_default;
        id v32 = &_os_log_default;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        [(ACCPlatformPowerInfo *)isDeviceBatteryCharging powerInfoChangeNotificationHandler:v20];
      }
    }

    __int16 v29 = [(ACCPlatformPowerInfo *)self endpointUID];
    int v30 = self->_isDeviceBatteryCharging;
    int v31 = 1;
LABEL_106:
    platform_power_sendPowerUpdate(v29, v31, v30, 13, 0);
    goto LABEL_119;
  }
  if ([v5 isEqualToString:ACCPlatformIOKitPowerPlugin_IsExternalChargerConnected])
  {
    BOOL isExternalChargerConnected = self->_isExternalChargerConnected;
    unsigned int v19 = _getIOKitPowerPluginInstance();
    self->_BOOL isExternalChargerConnected = [v19 isExternalChargerConnected];

    if (isExternalChargerConnected != self->_isExternalChargerConnected || !self->_isFirstSent_ExternalChargerConnected)
    {
      self->_BOOL isFirstSent_ExternalChargerConnected = 1;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v27 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v27 = &_os_log_default;
        id v40 = &_os_log_default;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[ACCPlatformPowerInfo powerInfoChangeNotificationHandler:]0();
      }

      __int16 v29 = [(ACCPlatformPowerInfo *)self endpointUID];
      int v30 = self->_isExternalChargerConnected;
      int v31 = 4;
      goto LABEL_106;
    }
    if (gLogObjects && gNumLogObjects >= 8)
    {
      unsigned int v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      unsigned int v14 = &_os_log_default;
      id v54 = &_os_log_default;
    }
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_118;
    }
    BOOL v55 = self->_isExternalChargerConnected;
    BOOL isFirstSent_ExternalChargerConnected = self->_isFirstSent_ExternalChargerConnected;
    int v66 = 67109888;
    *(_DWORD *)v67 = 4;
    *(_WORD *)&v67[4] = 1024;
    *(_DWORD *)&v67[6] = isExternalChargerConnected;
    *(_WORD *)v68 = 1024;
    *(_DWORD *)&v68[2] = v55;
    *(_WORD *)&v68[6] = 1024;
    *(_DWORD *)&v68[8] = isFirstSent_ExternalChargerConnected;
LABEL_117:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[#Power] Skip Sending Power Update: %d: %d = %d, isFirst=%d", (uint8_t *)&v66, 0x1Au);
    goto LABEL_118;
  }
  if ([v5 isEqualToString:ACCPlatformIOKitPowerPlugin_BatteryChargingState])
  {
    int batteryChargingState = self->_batteryChargingState;
    unsigned int v24 = _getIOKitPowerPluginInstance();
    self->_int batteryChargingState = [v24 getBatteryChargingState];

    if (batteryChargingState != self->_batteryChargingState || !self->_isFirstSent_BatteryChargingState)
    {
      self->_BOOL isFirstSent_BatteryChargingState = 1;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v38 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v38 = &_os_log_default;
        id v50 = &_os_log_default;
      }
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        -[ACCPlatformPowerInfo powerInfoChangeNotificationHandler:]3();
      }

      __int16 v29 = [(ACCPlatformPowerInfo *)self endpointUID];
      int v30 = self->_batteryChargingState;
      int v31 = 5;
      goto LABEL_106;
    }
    unsigned int v14 = logObjectForModule_16();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_118:

      goto LABEL_119;
    }
    int v25 = self->_batteryChargingState;
    BOOL isFirstSent_BatteryChargingState = self->_isFirstSent_BatteryChargingState;
    int v66 = 67109888;
    *(_DWORD *)v67 = 5;
    *(_WORD *)&v67[4] = 1024;
    *(_DWORD *)&v67[6] = batteryChargingState;
    *(_WORD *)v68 = 1024;
    *(_DWORD *)&v68[2] = v25;
    *(_WORD *)&v68[6] = 1024;
    *(_DWORD *)&v68[8] = isFirstSent_BatteryChargingState;
    goto LABEL_117;
  }
  if ([v5 isEqualToString:ACCPlatformIOKitPowerPlugin_BatteryChargeLevel])
  {
    int batteryChargeLevel = self->_batteryChargeLevel;
    v34 = _getIOKitPowerPluginInstance();
    self->_int batteryChargeLevel = [v34 getBatteryChargeLevel];

    if (batteryChargeLevel == self->_batteryChargeLevel && self->_isFirstSent_BatteryChargeLevel)
    {
      v35 = logObjectForModule_16();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = self->_batteryChargeLevel;
        BOOL isFirstSent_BatteryChargeLevel = self->_isFirstSent_BatteryChargeLevel;
        int v66 = 67109888;
        *(_DWORD *)v67 = 6;
        *(_WORD *)&v67[4] = 1024;
        *(_DWORD *)&v67[6] = batteryChargeLevel;
        *(_WORD *)v68 = 1024;
        *(_DWORD *)&v68[2] = v36;
        *(_WORD *)&v68[6] = 1024;
        *(_DWORD *)&v68[8] = isFirstSent_BatteryChargeLevel;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[#Power] Skip Sending Power Update: %d: %d = %d, isFirst=%d", (uint8_t *)&v66, 0x1Au);
      }
    }
    else
    {
      self->_BOOL isFirstSent_BatteryChargeLevel = 1;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v49 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v49 = &_os_log_default;
        id v57 = &_os_log_default;
      }
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        -[ACCPlatformPowerInfo powerInfoChangeNotificationHandler:]5();
      }

      platform_power_sendPowerUpdate([(ACCPlatformPowerInfo *)self endpointUID], 6, self->_batteryChargeLevel, 13, 0);
    }
    unsigned int v14 = [(ACCPlatformPowerInfo *)self endpointUID];
    if (!_isModelNumberConnected(v14, @"A1603")
      || !platform_systemInfo_isApplePencilSupported()
      || self->_batteryChargeLevel > 0xAu)
    {
      goto LABEL_118;
    }
    unsigned int v58 = [(ACCPlatformPowerInfo *)self holdingApplePencilSleepAssertion];

    if (v58)
    {
      platform_sleepAssertion_destroyForApplePencil();
      [(ACCPlatformPowerInfo *)self setHoldingApplePencilSleepAssertion:0];
    }
    goto LABEL_119;
  }
  if (![v5 isEqualToString:ACCPlatformPowerPlugin_PowerDidChangeNotification])
  {
    v44 = logObjectForModule_16();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      int v66 = 138412290;
      *(void *)v67 = v5;
      v45 = "[#Power] PowerInfoChangeNotifications: Unknown notification received: %@\n";
      v46 = v44;
      os_log_type_t v47 = OS_LOG_TYPE_DEFAULT;
      uint32_t v48 = 12;
      goto LABEL_122;
    }
LABEL_123:

    goto LABEL_119;
  }
  if (self->_systemAsleep)
  {
    v44 = logObjectForModule_16();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      LOWORD(v66) = 0;
      v45 = "[#Power] ignoring PowerDidChangeNotification because we're asleep";
      v46 = v44;
      os_log_type_t v47 = OS_LOG_TYPE_INFO;
      uint32_t v48 = 2;
LABEL_122:
      _os_log_impl((void *)&_mh_execute_header, v46, v47, v45, (uint8_t *)&v66, v48);
      goto LABEL_123;
    }
    goto LABEL_123;
  }
  int accessoryChargingCurrent = self->_accessoryChargingCurrent;
  v60 = _getPowerPluginInstance();
  self->_int accessoryChargingCurrent = (unsigned __int16)[v60 accessoryChargingCurrentInmA:v7];

  if (accessoryChargingCurrent != self->_accessoryChargingCurrent || !self->_isFirstSent_AccessoryChargingCurrent)
  {
    self->_BOOL isFirstSent_AccessoryChargingCurrent = 1;
    v64 = logObjectForModule_16();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      int v65 = self->_accessoryChargingCurrent;
      int v66 = 67109632;
      *(_DWORD *)v67 = 7;
      *(_WORD *)&v67[4] = 1024;
      *(_DWORD *)&v67[6] = accessoryChargingCurrent;
      *(_WORD *)v68 = 1024;
      *(_DWORD *)&v68[2] = v65;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "[#Power] Sending Power Update: %d: %d->%d\n", (uint8_t *)&v66, 0x14u);
    }

    __int16 v29 = [(ACCPlatformPowerInfo *)self endpointUID];
    int v30 = self->_accessoryChargingCurrent;
    int v31 = 7;
    goto LABEL_106;
  }
  v61 = logObjectForModule_16();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    int v62 = self->_accessoryChargingCurrent;
    BOOL isFirstSent_AccessoryChargingCurrent = self->_isFirstSent_AccessoryChargingCurrent;
    int v66 = 67109888;
    *(_DWORD *)v67 = 7;
    *(_WORD *)&v67[4] = 1024;
    *(_DWORD *)&v67[6] = accessoryChargingCurrent;
    *(_WORD *)v68 = 1024;
    *(_DWORD *)&v68[2] = v62;
    *(_WORD *)&v68[6] = 1024;
    *(_DWORD *)&v68[8] = isFirstSent_AccessoryChargingCurrent;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "[#Power] Skip Sending Power Update: %d: %d = %d, isFirst=%d", (uint8_t *)&v66, 0x1Au);
  }

LABEL_119:
}

- (NSString)endpointUID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)connectionUID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (ACCPowerManager)accessoryPowerManager
{
  return self->_accessoryPowerManager;
}

- (ACCPowerSiphoningControl)siphoningControl
{
  return self->_siphoningControl;
}

- (unint64_t)updateTypesBitmask
{
  return self->_updateTypesBitmask;
}

- (void)setUpdateTypesBitmask:(unint64_t)a3
{
  self->_updateTypesBitmask = a3;
}

- (unint64_t)oldUpdateTypesBitmask
{
  return self->_oldUpdateTypesBitmask;
}

- (void)setOldUpdateTypesBitmask:(unint64_t)a3
{
  self->_oldUpdateTypesBitmask = a3;
}

- (unsigned)availableCurrent
{
  return self->_availableCurrent;
}

- (BOOL)isDeviceBatteryCharging
{
  return self->_isDeviceBatteryCharging;
}

- (BOOL)isExternalChargerConnected
{
  return self->_isExternalChargerConnected;
}

- (int)batteryChargingState
{
  return self->_batteryChargingState;
}

- (unsigned)batteryChargeLevel
{
  return self->_batteryChargeLevel;
}

- (unsigned)accessoryChargingCurrent
{
  return self->_accessoryChargingCurrent;
}

- (void)setAccessoryChargingCurrent:(unsigned __int16)a3
{
  self->_int accessoryChargingCurrent = a3;
}

- (BOOL)isFirstSent_AvailableCurrent
{
  return self->_isFirstSent_AvailableCurrent;
}

- (BOOL)isFirstSent_DeviceBatteryCharging
{
  return self->_isFirstSent_DeviceBatteryCharging;
}

- (BOOL)isFirstSent_ExternalChargerConnected
{
  return self->_isFirstSent_ExternalChargerConnected;
}

- (BOOL)isFirstSent_BatteryChargingState
{
  return self->_isFirstSent_BatteryChargingState;
}

- (BOOL)isFirstSent_BatteryChargeLevel
{
  return self->_isFirstSent_BatteryChargeLevel;
}

- (BOOL)isFirstSent_AccessoryChargingCurrent
{
  return self->_isFirstSent_AccessoryChargingCurrent;
}

- (BOOL)systemAsleep
{
  return self->_systemAsleep;
}

- (void)setSystemAsleep:(BOOL)a3
{
  self->_systemAsleep = a3;
}

- (NSString)sleepNotificationClientUUID
{
  return self->_sleepNotificationClientUUID;
}

- (void)setSleepNotificationClientUUID:(id)a3
{
}

- (BOOL)holdingApplePencilSleepAssertion
{
  return self->_holdingApplePencilSleepAssertion;
}

- (void)setHoldingApplePencilSleepAssertion:(BOOL)a3
{
  self->_holdingApplePencilSleepAssertion = a3;
}

- (NSString)batteryNotificationClientUUID
{
  return self->_batteryNotificationClientUUID;
}

- (void)setBatteryNotificationClientUUID:(id)a3
{
}

- (NSString)applePencilBatteryNotificationClientUUID
{
  return self->_applePencilBatteryNotificationClientUUID;
}

- (void)setApplePencilBatteryNotificationClientUUID:(id)a3
{
}

- (BOOL)powerUpdateSentDueToSleep
{
  return self->_powerUpdateSentDueToSleep;
}

- (void)setPowerUpdateSentDueToSleep:(BOOL)a3
{
  self->_powerUpdateSentDueToSleep = a3;
}

- (BOOL)requestSleepUpdate
{
  return self->_requestSleepUpdate;
}

- (void)setRequestSleepUpdate:(BOOL)a3
{
  self->_requestSleepUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applePencilBatteryNotificationClientUUID, 0);
  objc_storeStrong((id *)&self->_batteryNotificationClientUUID, 0);
  objc_storeStrong((id *)&self->_sleepNotificationClientUUID, 0);
  objc_storeStrong((id *)&self->_siphoningControl, 0);
  objc_storeStrong((id *)&self->_accessoryPowerManager, 0);
  objc_storeStrong((id *)&self->_connectionUID, 0);

  objc_storeStrong((id *)&self->_endpointUID, 0);
}

- (void)powerInfoChangeNotificationHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "[#Power] Sending Power Update: %d: %d->%d\n", 67109632, v2, v3);
}

- (void)powerInfoChangeNotificationHandler:.cold.5()
{
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "[#Power] Sending Power Update: %d: %d->%d\n", 67109632, v2, v3);
}

- (void)powerInfoChangeNotificationHandler:(NSObject *)a3 .cold.8(unsigned __int8 a1, unsigned __int8 *a2, NSObject *a3)
{
  LOWORD(v3) = 1024;
  HIWORD(v3) = a1;
  OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, (uint64_t)a2, a3, "[#Power] Sending Power Update: %d: %d->%d\n", 67109632, v3, *a2);
}

- (void)powerInfoChangeNotificationHandler:.cold.10()
{
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "[#Power] Sending Power Update: %d: %d->%d\n", 67109632, v2, v3);
}

- (void)powerInfoChangeNotificationHandler:.cold.13()
{
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "[#Power] Sending Power Update: %d: %d->%d\n", 67109632, v2, v3);
}

- (void)powerInfoChangeNotificationHandler:.cold.15()
{
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "[#Power] Sending Power Update: %d: %d->%d\n", 67109632, v2, v3);
}

@end