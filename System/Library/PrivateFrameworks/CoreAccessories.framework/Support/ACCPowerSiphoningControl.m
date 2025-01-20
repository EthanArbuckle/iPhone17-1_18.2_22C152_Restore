@interface ACCPowerSiphoningControl
+ (BOOL)_getUSBHubOverCurrentState:(id)a3;
+ (int)_getReserveCurrentInmA:(id)a3;
+ (unsigned)_getChargerCurrentInmA:(id)a3;
+ (unsigned)_getChargerVoltageInmV:(id)a3;
+ (unsigned)_getUSBHubSiphoningCurrentActualRequirementInmA:(id)a3;
+ (unsigned)_getUSBHubSiphoningCurrentRequirementInmA:(id)a3;
+ (unsigned)_getUSBHubUnitLoadInmA:(id)a3;
+ (void)_resetUSBHubOverCurrentSiphoning:(id)a3;
+ (void)_setUSBHubOverCurrentSiphoning:(id)a3;
- (ACCPowerSiphoningControl)initWithDelegate:(id)a3;
- (ACCPowerSiphoningControlDelegate)delegate;
- (BOOL)getOverCurrentState;
- (BOOL)siphoningCurrentNeedSend;
- (BOOL)usbAccessoryDetected;
- (BOOL)usbAccessorySiphoningNotRequired;
- (NSString)connectionUID;
- (id)siphoningDebounceTimerSource;
- (int)chargerCurrentInmA;
- (int)chargerCurrentInmAOld;
- (int)chargerVoltageInmV;
- (int)chargerVoltageInmVOld;
- (int)minSiphoningCurrentInmA;
- (int)minSiphoningCurrentInmAOld;
- (int)reserveCurrentInmA;
- (int)reserveCurrentInmAOld;
- (int)siphoningCurrentInmA;
- (int)siphoningCurrentInmAOld;
- (unsigned)calculateSiphoningCurrent:(unsigned int)a3;
- (void)_cckHubChangeNotificationHandler:(id)a3;
- (void)_powerInfoChangeNotificationHandler:(id)a3;
- (void)_processPowerInfoChangeTimeout;
- (void)_sendChangedSiphoningValues;
- (void)_updateSiphoningValues;
- (void)dealloc;
- (void)resetOverCurrentSiphoning;
- (void)setOverCurrentSiphoning;
@end

@implementation ACCPowerSiphoningControl

- (ACCPowerSiphoningControl)initWithDelegate:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ACCPowerSiphoningControl;
  v6 = [(ACCPowerSiphoningControl *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    uint64_t v8 = [v5 connectionUID];
    connectionUID = v7->_connectionUID;
    v7->_connectionUID = (NSString *)v8;

    v7->_siphoningDebounceTimerTime = -1;
    uint64_t v10 = [(ACCPowerSiphoningControl *)v7 siphoningDebounceTimerSource];
    siphoningDebounceTimerSource = v7->_siphoningDebounceTimerSource;
    v7->_siphoningDebounceTimerSource = (OS_dispatch_source *)v10;

    v7->_minSiphoningCurrentInmAOld = -1;
    *(void *)&v7->_siphoningCurrentInmAOld = -1;
    *(void *)&v7->_chargerVoltageInmVOld = -1;
    v7->_siphoningCurrentNeedSend = 1;
    v12 = _getUSBCameraKitHubPluginInstance();
    v13 = [(ACCPowerSiphoningControlDelegate *)v7->_delegate endpointUID];
    [v12 initUSBCameraKitHubNotifications:v13];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v7 selector:"_powerInfoChangeNotificationHandler:" name:ACCPlatformPowerPlugin_USBCurrentLimitDidChangeNotification object:0];
    [v14 addObserver:v7 selector:"_powerInfoChangeNotificationHandler:" name:ACCPlatformPowerPlugin_PowerDidChangeNotification object:0];
    [v14 addObserver:v7 selector:"_cckHubChangeNotificationHandler:" name:@"ACCPlatformUSBCameraKitHubPlugin_HubChange" object:0];
    [(ACCPowerSiphoningControl *)v7 _powerInfoChangeNotificationHandler:0];
    [(ACCPowerSiphoningControl *)v7 _cckHubChangeNotificationHandler:0];
  }
  return v7;
}

- (void)dealloc
{
  siphoningDebounceTimerSource = self->_siphoningDebounceTimerSource;
  if (siphoningDebounceTimerSource)
  {
    dispatch_source_cancel(siphoningDebounceTimerSource);
    v4 = self->_siphoningDebounceTimerSource;
    self->_siphoningDebounceTimerSource = 0;

    self->_siphoningDebounceTimerTime = -1;
  }
  v5.receiver = self;
  v5.super_class = (Class)ACCPowerSiphoningControl;
  [(ACCPowerSiphoningControl *)&v5 dealloc];
}

- (id)siphoningDebounceTimerSource
{
  siphoningDebounceTimerSource = self->_siphoningDebounceTimerSource;
  if (!siphoningDebounceTimerSource)
  {
    v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    objc_super v5 = self->_siphoningDebounceTimerSource;
    self->_siphoningDebounceTimerSource = v4;

    v6 = self->_siphoningDebounceTimerSource;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __56__ACCPowerSiphoningControl_siphoningDebounceTimerSource__block_invoke;
    handler[3] = &unk_1002158C8;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    self->_siphoningDebounceTimerTime = -1;
    dispatch_source_set_timer((dispatch_source_t)self->_siphoningDebounceTimerSource, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_siphoningDebounceTimerSource);
    siphoningDebounceTimerSource = self->_siphoningDebounceTimerSource;
  }

  return siphoningDebounceTimerSource;
}

id __56__ACCPowerSiphoningControl_siphoningDebounceTimerSource__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processPowerInfoChangeTimeout];
}

- (unsigned)calculateSiphoningCurrent:(unsigned int)a3
{
  unsigned int v5 = self->_chargerVoltageInmV * self->_chargerCurrentInmA / 0x1388u;
  if (platform_systemInfo_isIPad() && self->_chargerCurrentInmA > 1999
    || ((platform_systemInfo_isIPod() & 1) != 0 || platform_systemInfo_isIPhone())
    && self->_chargerCurrentInmA >= 1000)
  {
    if (v5 <= a3 || self->_chargerVoltageInmV <= 0) {
      unsigned int v7 = 0;
    }
    else {
      unsigned int v7 = a3;
    }
  }
  else
  {
    unsigned int v7 = 0;
  }
  if (self->_usbAccessoryDetected && self->_usbAccessorySiphoningNotRequired)
  {
    if (gLogObjects && gNumLogObjects >= 37)
    {
      uint64_t v8 = *(id *)(gLogObjects + 288);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v8 = &_os_log_default;
      id v9 = &_os_log_default;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL usbAccessoryDetected = self->_usbAccessoryDetected;
      BOOL usbAccessorySiphoningNotRequired = self->_usbAccessorySiphoningNotRequired;
      int v17 = 67109376;
      unsigned int v18 = usbAccessoryDetected;
      __int16 v19 = 1024;
      int v20 = usbAccessorySiphoningNotRequired;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Don't need siphoning Device working fine without, _usbAccessoryDetected=%d _usbAccessorySiphoningNotRequired=%d", (uint8_t *)&v17, 0xEu);
    }

    unsigned int v7 = 0;
  }
  if (gLogObjects && gNumLogObjects >= 37)
  {
    v12 = *(id *)(gLogObjects + 288);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v12 = &_os_log_default;
    id v13 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int chargerCurrentInmA = self->_chargerCurrentInmA;
    int chargerVoltageInmV = self->_chargerVoltageInmV;
    int v17 = 67110144;
    unsigned int v18 = a3;
    __int16 v19 = 1024;
    int v20 = chargerVoltageInmV;
    __int16 v21 = 1024;
    int v22 = chargerCurrentInmA;
    __int16 v23 = 1024;
    unsigned int v24 = v5;
    __int16 v25 = 1024;
    unsigned int v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "usbDeviceRequestedCurrent=%d _chargerVoltageInmV=%d _chargerCurrentInmA=%d available5VCurrent=%d, result=%d", (uint8_t *)&v17, 0x20u);
  }

  return v7;
}

- (BOOL)getOverCurrentState
{
  return +[ACCPowerSiphoningControl _getUSBHubOverCurrentState:self->_connectionUID];
}

- (void)resetOverCurrentSiphoning
{
}

- (void)setOverCurrentSiphoning
{
}

- (void)_powerInfoChangeNotificationHandler:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 name];
  v6 = [v4 userInfo];

  unsigned int v7 = [v6 objectForKey:ACCPlatformPowerPlugin_ConnectionUUID];
  if (gLogObjects && gNumLogObjects >= 37)
  {
    uint64_t v8 = *(id *)(gLogObjects + 288);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v8 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received notification: %@, userInfo=%@\n", (uint8_t *)&v10, 0x16u);
  }

  if (!v7 || [v7 isEqualToString:self->_connectionUID])
  {
    [(ACCPowerSiphoningControl *)self _updateSiphoningValues];
    [(ACCPowerSiphoningControl *)self _sendChangedSiphoningValues];
  }
}

- (void)_cckHubChangeNotificationHandler:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 name];
  v6 = [v4 userInfo];

  unsigned int v7 = [v6 objectForKey:@"ACCPlatformUSBCameraKitHubPlugin_ConnectionUUID"];
  if (gLogObjects && gNumLogObjects >= 37)
  {
    uint64_t v8 = *(id *)(gLogObjects + 288);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v8 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    unint64_t v22 = (unint64_t)v5;
    __int16 v23 = 2112;
    unint64_t v24 = (unint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received notification: %@, userInfo=%@", (uint8_t *)&v21, 0x16u);
  }

  if ([v5 isEqualToString:@"ACCPlatformUSBCameraKitHubPlugin_HubChange"]
    && (!v7 || [v7 isEqualToString:self->_connectionUID]))
  {
    dispatch_time_t v10 = dispatch_time(0, 200000000);
    unint64_t v11 = v10;
    unint64_t siphoningDebounceTimerTime = self->_siphoningDebounceTimerTime;
    if (gLogObjects) {
      BOOL v13 = gNumLogObjects <= 36;
    }
    else {
      BOOL v13 = 1;
    }
    int v14 = !v13;
    if (siphoningDebounceTimerTime == -1 || v10 > siphoningDebounceTimerTime)
    {
      if (v14)
      {
        objc_super v16 = *(id *)(gLogObjects + 288);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        objc_super v16 = &_os_log_default;
        id v17 = &_os_log_default;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        unint64_t v18 = self->_siphoningDebounceTimerTime;
        int v21 = 134218240;
        unint64_t v22 = v18;
        __int16 v23 = 2048;
        unint64_t v24 = v11;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "set new timeout %lld -> %lld", (uint8_t *)&v21, 0x16u);
      }

      self->_unint64_t siphoningDebounceTimerTime = v11;
      v15 = [(ACCPowerSiphoningControl *)self siphoningDebounceTimerSource];
      dispatch_source_set_timer(v15, self->_siphoningDebounceTimerTime, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
    else
    {
      if (v14)
      {
        v15 = *(id *)(gLogObjects + 288);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v15 = &_os_log_default;
        id v19 = &_os_log_default;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        unint64_t v20 = self->_siphoningDebounceTimerTime;
        int v21 = 134218240;
        unint64_t v22 = v20;
        __int16 v23 = 2048;
        unint64_t v24 = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "ignore timeout=%lld >= %lld", (uint8_t *)&v21, 0x16u);
      }
    }
  }
}

- (void)_processPowerInfoChangeTimeout
{
  self->_unint64_t siphoningDebounceTimerTime = -1;
  uint64_t v3 = +[ACCPowerSiphoningControl _getUSBHubSiphoningCurrentRequirementInmA:self->_connectionUID];
  unsigned int v4 = +[ACCPowerSiphoningControl _getUSBHubSiphoningCurrentActualRequirementInmA:self->_connectionUID];
  unsigned int v5 = +[ACCPowerSiphoningControl _getUSBHubUnitLoadInmA:self->_connectionUID];
  int usbAccessoryDetected = self->_usbAccessoryDetected;
  BOOL usbAccessorySiphoningNotRequired = self->_usbAccessorySiphoningNotRequired;
  if (gLogObjects && gNumLogObjects >= 7)
  {
    uint64_t v8 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v8 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = 67109888;
    unsigned int v40 = v4;
    __int16 v41 = 1024;
    unsigned int v42 = v5;
    __int16 v43 = 1024;
    int v44 = usbAccessoryDetected;
    __int16 v45 = 1024;
    *(_DWORD *)v46 = usbAccessorySiphoningNotRequired;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "realRequiredCurrent=%d unitLoad=%d old_usbAccessoryDetected=%d old_usbAccessorySiphoningNotRequired=%d", (uint8_t *)&v39, 0x1Au);
  }

  if (!v4)
  {
    int v10 = 0;
    self->_int usbAccessoryDetected = 0;
    BOOL v11 = 1;
    goto LABEL_13;
  }
  int v10 = 1;
  self->_int usbAccessoryDetected = 1;
  if (v4 > v5)
  {
    BOOL v11 = 0;
LABEL_13:
    self->_BOOL usbAccessorySiphoningNotRequired = v11;
  }
  if (usbAccessoryDetected != v10 || usbAccessorySiphoningNotRequired != self->_usbAccessorySiphoningNotRequired)
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      __int16 v12 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      __int16 v12 = &_os_log_default;
      id v13 = &_os_log_default;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      BOOL v29 = self->_usbAccessoryDetected;
      BOOL v30 = self->_usbAccessorySiphoningNotRequired;
      int v39 = 67110400;
      unsigned int v40 = v4;
      __int16 v41 = 1024;
      unsigned int v42 = v5;
      __int16 v43 = 1024;
      int v44 = usbAccessoryDetected;
      __int16 v45 = 1024;
      *(_DWORD *)v46 = v29;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = usbAccessorySiphoningNotRequired;
      LOWORD(v47) = 1024;
      *(_DWORD *)((char *)&v47 + 2) = v30;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "realRequiredCurrent=%d unitLoad=%d _usbAccessoryDetected=%d->%d _usbAccessorySiphoningNotRequired=%d->%d", (uint8_t *)&v39, 0x26u);
    }
  }
  int v14 = [(ACCPowerSiphoningControl *)self calculateSiphoningCurrent:v3];
  self->_int siphoningCurrentInmA = v14;
  if (self->_siphoningCurrentNeedSend) {
    goto LABEL_26;
  }
  int siphoningCurrentInmAOld = self->_siphoningCurrentInmAOld;
  if (siphoningCurrentInmAOld == -1 || v14 != siphoningCurrentInmAOld)
  {
    if (siphoningCurrentInmAOld != -1 && v14 <= siphoningCurrentInmAOld)
    {
      dispatch_time_t v24 = dispatch_time(0, 5000000000);
      unint64_t v25 = v24;
      unint64_t siphoningDebounceTimerTime = self->_siphoningDebounceTimerTime;
      if (siphoningDebounceTimerTime != -1 && v24 <= siphoningDebounceTimerTime) {
        goto LABEL_41;
      }
      if (gLogObjects && gNumLogObjects >= 7)
      {
        v27 = *(id *)(gLogObjects + 48);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v27 = &_os_log_default;
        id v31 = &_os_log_default;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        int v32 = self->_siphoningCurrentInmAOld;
        int siphoningCurrentInmA = self->_siphoningCurrentInmA;
        unint64_t v34 = self->_siphoningDebounceTimerTime;
        BOOL siphoningCurrentNeedSend = self->_siphoningCurrentNeedSend;
        int v39 = 67110656;
        unsigned int v40 = v3;
        __int16 v41 = 1024;
        unsigned int v42 = v32;
        __int16 v43 = 1024;
        int v44 = siphoningCurrentInmA;
        __int16 v45 = 2048;
        *(void *)v46 = v34;
        *(_WORD *)&v46[8] = 2048;
        unint64_t v47 = v25;
        __int16 v48 = 1024;
        BOOL v49 = siphoningCurrentNeedSend;
        __int16 v50 = 1024;
        int v51 = 1;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "siphoningCurrentRequirement going down, debounce some more, usbRequiredCurrent=%d _siphoningCurrent=%d->%d, timeout %lld -> %lld, _siphoningCurrentNeedSend %d -> %d", (uint8_t *)&v39, 0x34u);
      }

      self->_unint64_t siphoningDebounceTimerTime = v25;
      unint64_t v22 = [(ACCPowerSiphoningControl *)self siphoningDebounceTimerSource];
      dispatch_source_set_timer(v22, self->_siphoningDebounceTimerTime, 0xFFFFFFFFFFFFFFFFLL, 0);
      BOOL v23 = 1;
LABEL_40:

      self->_BOOL siphoningCurrentNeedSend = v23;
LABEL_41:
      self->_int siphoningCurrentInmAOld = self->_siphoningCurrentInmA;
      return;
    }
LABEL_26:
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v15 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v15 = &_os_log_default;
      id v18 = &_os_log_default;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v19 = self->_siphoningCurrentInmAOld;
      int v20 = self->_siphoningCurrentInmA;
      BOOL v21 = self->_siphoningCurrentNeedSend;
      int v39 = 67109888;
      unsigned int v40 = v3;
      __int16 v41 = 1024;
      unsigned int v42 = v19;
      __int16 v43 = 1024;
      int v44 = v20;
      __int16 v45 = 1024;
      *(_DWORD *)v46 = v21;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "sendPowerUpdate usbRequiredCurrent=%d _siphoningCurrent=%d->%d _siphoningCurrentNeedSend=%d", (uint8_t *)&v39, 0x1Au);
    }

    unint64_t v22 = [(ACCPowerSiphoningControlDelegate *)self->_delegate endpointUID];
    platform_power_sendPowerUpdate(v22, 3, self->_siphoningCurrentInmA, 13, 0);
    BOOL v23 = 0;
    goto LABEL_40;
  }
  if (gLogObjects && gNumLogObjects >= 7)
  {
    id v17 = *(id *)(gLogObjects + 48);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v17 = &_os_log_default;
    id v28 = &_os_log_default;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    BOOL v36 = self->_siphoningCurrentNeedSend;
    int v37 = self->_siphoningCurrentInmAOld;
    int v38 = self->_siphoningCurrentInmA;
    int v39 = 67110144;
    unsigned int v40 = v3;
    __int16 v41 = 1024;
    unsigned int v42 = v36;
    __int16 v43 = 1024;
    int v44 = v37;
    __int16 v45 = 1024;
    *(_DWORD *)v46 = v38;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v37;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Skip check/send siphoning current, usbRequiredCurrent=%d _siphoningCurrentNeedSend=%d _siphoningCurrentInmAOld=%d _siphoningCurrentInmA=%d _siphoningCurrentInmAOld=%d", (uint8_t *)&v39, 0x20u);
  }
}

- (void)_updateSiphoningValues
{
  if (gLogObjects && gNumLogObjects >= 37)
  {
    uint64_t v3 = *(id *)(gLogObjects + 288);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v3 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int chargerCurrentInmA = self->_chargerCurrentInmA;
    int chargerVoltageInmV = self->_chargerVoltageInmV;
    int reserveCurrentInmA = self->_reserveCurrentInmA;
    int v13 = 67109632;
    int v14 = chargerCurrentInmA;
    __int16 v15 = 1024;
    int v16 = chargerVoltageInmV;
    __int16 v17 = 1024;
    int v18 = reserveCurrentInmA;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "old: _chargerCurrentInmA=%d _chargerVoltageInmV=%d _reserveCurrentInmA=%d", (uint8_t *)&v13, 0x14u);
  }

  self->_int chargerCurrentInmA = +[ACCPowerSiphoningControl _getChargerCurrentInmA:self->_connectionUID];
  self->_int chargerVoltageInmV = +[ACCPowerSiphoningControl _getChargerVoltageInmV:self->_connectionUID];
  self->_int reserveCurrentInmA = +[ACCPowerSiphoningControl _getReserveCurrentInmA:self->_connectionUID];
  if (gLogObjects && gNumLogObjects >= 37)
  {
    uint64_t v8 = *(id *)(gLogObjects + 288);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v8 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = self->_chargerCurrentInmA;
    int v11 = self->_chargerVoltageInmV;
    int v12 = self->_reserveCurrentInmA;
    int v13 = 67109632;
    int v14 = v10;
    __int16 v15 = 1024;
    int v16 = v11;
    __int16 v17 = 1024;
    int v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "new: _chargerCurrentInmA=%d _chargerVoltageInmV=%d _reserveCurrentInmA=%d", (uint8_t *)&v13, 0x14u);
  }
}

- (void)_sendChangedSiphoningValues
{
  int chargerCurrentInmAOld = self->_chargerCurrentInmAOld;
  if (chargerCurrentInmAOld == -1
    || self->_chargerCurrentInmA != chargerCurrentInmAOld
    || (int v4 = self->_chargerVoltageInmVOld, v4 == -1)
    || self->_chargerVoltageInmV != v4)
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 7;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v8 = &_os_log_default;
      id v7 = &_os_log_default;
    }
    else
    {
      uint64_t v8 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = self->_chargerCurrentInmAOld;
      int chargerVoltageInmVOld = self->_chargerVoltageInmVOld;
      int chargerCurrentInmA = self->_chargerCurrentInmA;
      int chargerVoltageInmV = self->_chargerVoltageInmV;
      int v30 = 67109888;
      int v31 = v9;
      __int16 v32 = 1024;
      int v33 = chargerCurrentInmA;
      __int16 v34 = 1024;
      int v35 = chargerVoltageInmVOld;
      __int16 v36 = 1024;
      int v37 = chargerVoltageInmV;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "sendPowerUpdate chargerCurrent=%d->%d chargerVoltage=%d->%d", (uint8_t *)&v30, 0x1Au);
    }

    int v13 = [(ACCPowerSiphoningControlDelegate *)self->_delegate endpointUID];
    platform_power_sendPowerUpdate(v13, 9, self->_chargerVoltageInmV, 8, self->_chargerCurrentInmA);

    *(void *)&self->_int chargerCurrentInmAOld = *(void *)&self->_chargerCurrentInmA;
    int v5 = 1;
  }
  else
  {
    int v5 = 0;
  }
  int reserveCurrentInmAOld = self->_reserveCurrentInmAOld;
  if (reserveCurrentInmAOld == -1 || self->_reserveCurrentInmA != reserveCurrentInmAOld)
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      __int16 v15 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      __int16 v15 = &_os_log_default;
      id v16 = &_os_log_default;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v17 = self->_reserveCurrentInmAOld;
      int reserveCurrentInmA = self->_reserveCurrentInmA;
      int v30 = 67109376;
      int v31 = v17;
      __int16 v32 = 1024;
      int v33 = reserveCurrentInmA;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "sendPowerUpdate reserveCurrent=%d->%d", (uint8_t *)&v30, 0xEu);
    }

    int v19 = [(ACCPowerSiphoningControlDelegate *)self->_delegate endpointUID];
    platform_power_sendPowerUpdate(v19, 10, self->_reserveCurrentInmA, 13, 0);

    self->_int reserveCurrentInmAOld = self->_reserveCurrentInmA;
  }
  int minSiphoningCurrentInmAOld = self->_minSiphoningCurrentInmAOld;
  if (minSiphoningCurrentInmAOld == -1 || self->_minSiphoningCurrentInmA != minSiphoningCurrentInmAOld)
  {
    if (gLogObjects && gNumLogObjects >= 7)
    {
      BOOL v21 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v21 = &_os_log_default;
      id v22 = &_os_log_default;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v23 = self->_minSiphoningCurrentInmAOld;
      int minSiphoningCurrentInmA = self->_minSiphoningCurrentInmA;
      int v30 = 67109376;
      int v31 = v23;
      __int16 v32 = 1024;
      int v33 = minSiphoningCurrentInmA;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "sendPowerUpdate minSiphoningCurrent=%d->%d", (uint8_t *)&v30, 0xEu);
    }

    unint64_t v25 = [(ACCPowerSiphoningControlDelegate *)self->_delegate endpointUID];
    platform_power_sendPowerUpdate(v25, 11, self->_minSiphoningCurrentInmA, 13, 0);

    self->_int minSiphoningCurrentInmAOld = self->_minSiphoningCurrentInmA;
  }
  if (v5)
  {
    if (self->_chargerCurrentInmA)
    {
      int v26 = 0xFFFF;
      if (self->_chargerVoltageInmV)
      {
        if (self->_siphoningCurrentInmA) {
          int v26 = 0xFFFF;
        }
        else {
          int v26 = 20;
        }
      }
    }
    else
    {
      int v26 = 0xFFFF;
    }
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v27 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v27 = &_os_log_default;
      id v28 = &_os_log_default;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v30 = 67109120;
      int v31 = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "sendPowerUpdate maxNonSiphoningCurrent=%d", (uint8_t *)&v30, 8u);
    }

    BOOL v29 = [(ACCPowerSiphoningControlDelegate *)self->_delegate endpointUID];
    platform_power_sendPowerUpdate(v29, 12, v26, 13, 0);
  }
}

+ (int)_getReserveCurrentInmA:(id)a3
{
  id v3 = a3;
  int v4 = +[ACCPlatformPluginManager sharedManager];
  int v5 = [v4 pluginInstanceWithProtocol:&OBJC_PROTOCOL___ACCPlatformPowerPluginProtocol fallbackToTransportPlugins:1];

  LODWORD(v4) = [v5 USBCurrentLimitOffsetInmA:v3];
  return -(int)v4;
}

+ (unsigned)_getChargerCurrentInmA:(id)a3
{
  id v3 = a3;
  int v4 = +[ACCPlatformPluginManager sharedManager];
  int v5 = [v4 pluginInstanceWithProtocol:&OBJC_PROTOCOL___ACCPlatformPowerPluginProtocol fallbackToTransportPlugins:1];

  if (v5) {
    unsigned int v6 = [v5 USBCurrentLimitBaseInmA:v3];
  }
  else {
    unsigned int v6 = 0;
  }

  return v6;
}

+ (unsigned)_getChargerVoltageInmV:(id)a3
{
  id v3 = a3;
  int v4 = +[ACCPlatformPluginManager sharedManager];
  int v5 = [v4 pluginInstanceWithProtocol:&OBJC_PROTOCOL___ACCPlatformPowerPluginProtocol fallbackToTransportPlugins:1];

  if (v5) {
    unsigned int v6 = [v5 USBChargingVoltageInmV:v3];
  }
  else {
    unsigned int v6 = 0;
  }

  return v6;
}

+ (unsigned)_getUSBHubUnitLoadInmA:(id)a3
{
  id v3 = a3;
  int v4 = +[ACCPlatformPluginManager sharedManager];
  int v5 = [v4 pluginInstanceWithProtocol:&OBJC_PROTOCOL___ACCPlatformUSBCameraKitHubPluginProtocol fallbackToTransportPlugins:1];

  if (v5) {
    unsigned int v6 = [v5 getUSBHubUnitLoadInmA:v3];
  }
  else {
    unsigned int v6 = 0;
  }

  return v6;
}

+ (unsigned)_getUSBHubSiphoningCurrentRequirementInmA:(id)a3
{
  id v3 = a3;
  int v4 = +[ACCPlatformPluginManager sharedManager];
  int v5 = [v4 pluginInstanceWithProtocol:&OBJC_PROTOCOL___ACCPlatformUSBCameraKitHubPluginProtocol fallbackToTransportPlugins:1];

  if (v5) {
    unsigned int v6 = [v5 getUSBHubSiphoningCurrentRequirementInmA:v3];
  }
  else {
    unsigned int v6 = 0;
  }

  return v6;
}

+ (unsigned)_getUSBHubSiphoningCurrentActualRequirementInmA:(id)a3
{
  id v3 = a3;
  int v4 = +[ACCPlatformPluginManager sharedManager];
  int v5 = [v4 pluginInstanceWithProtocol:&OBJC_PROTOCOL___ACCPlatformUSBCameraKitHubPluginProtocol fallbackToTransportPlugins:1];

  if (v5) {
    unsigned int v6 = [v5 getUSBHubSiphoningCurrentActualRequirementInmA:v3];
  }
  else {
    unsigned int v6 = 0;
  }

  return v6;
}

+ (BOOL)_getUSBHubOverCurrentState:(id)a3
{
  id v3 = a3;
  int v4 = +[ACCPlatformPluginManager sharedManager];
  int v5 = [v4 pluginInstanceWithProtocol:&OBJC_PROTOCOL___ACCPlatformUSBCameraKitHubPluginProtocol fallbackToTransportPlugins:1];

  if (v5) {
    unsigned __int8 v6 = [v5 getUSBHubOverCurrentState:v3];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (void)_resetUSBHubOverCurrentSiphoning:(id)a3
{
  id v5 = a3;
  id v3 = +[ACCPlatformPluginManager sharedManager];
  int v4 = [v3 pluginInstanceWithProtocol:&OBJC_PROTOCOL___ACCPlatformUSBCameraKitHubPluginProtocol fallbackToTransportPlugins:1];

  if (v4) {
    [v4 resetUSBHubOverCurrentSiphoning:v5];
  }
}

+ (void)_setUSBHubOverCurrentSiphoning:(id)a3
{
  id v5 = a3;
  id v3 = +[ACCPlatformPluginManager sharedManager];
  int v4 = [v3 pluginInstanceWithProtocol:&OBJC_PROTOCOL___ACCPlatformUSBCameraKitHubPluginProtocol fallbackToTransportPlugins:1];

  if (v4) {
    [v4 setUSBHubOverCurrentSiphoning:v5];
  }
}

- (NSString)connectionUID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (ACCPowerSiphoningControlDelegate)delegate
{
  return self->_delegate;
}

- (int)siphoningCurrentInmA
{
  return self->_siphoningCurrentInmA;
}

- (int)chargerCurrentInmA
{
  return self->_chargerCurrentInmA;
}

- (int)chargerVoltageInmV
{
  return self->_chargerVoltageInmV;
}

- (int)reserveCurrentInmA
{
  return self->_reserveCurrentInmA;
}

- (int)minSiphoningCurrentInmA
{
  return self->_minSiphoningCurrentInmA;
}

- (int)siphoningCurrentInmAOld
{
  return self->_siphoningCurrentInmAOld;
}

- (int)chargerCurrentInmAOld
{
  return self->_chargerCurrentInmAOld;
}

- (int)chargerVoltageInmVOld
{
  return self->_chargerVoltageInmVOld;
}

- (int)reserveCurrentInmAOld
{
  return self->_reserveCurrentInmAOld;
}

- (int)minSiphoningCurrentInmAOld
{
  return self->_minSiphoningCurrentInmAOld;
}

- (BOOL)siphoningCurrentNeedSend
{
  return self->_siphoningCurrentNeedSend;
}

- (BOOL)usbAccessoryDetected
{
  return self->_usbAccessoryDetected;
}

- (BOOL)usbAccessorySiphoningNotRequired
{
  return self->_usbAccessorySiphoningNotRequired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_connectionUID, 0);

  objc_storeStrong((id *)&self->_siphoningDebounceTimerSource, 0);
}

@end