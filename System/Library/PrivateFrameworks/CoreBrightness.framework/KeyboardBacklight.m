@interface KeyboardBacklight
+ (unint64_t)getHashIDForDevice:(id)a3;
- (BOOL)KBAuthenticationHandler:(id)a3;
- (BOOL)KBAutoBrightnessEnablePropertyHandler:(id)a3;
- (BOOL)KBAutoBrightnessSuspendPropertyHandler:(id)a3;
- (BOOL)KBAvailabilityUpdateHandler:(id)a3;
- (BOOL)KBBacklightLevelPropertyHandler:(id)a3;
- (BOOL)KBBrightnessPropertyHandler:(id)a3;
- (BOOL)KBClamshellUpdateHandler:(id)a3;
- (BOOL)KBDisplayBrightnessFactorPropertyHandler:(id)a3;
- (BOOL)KBIdleDimPropertyHandler:(id)a3;
- (BOOL)KBIdleDimTimeHandler:(id)a3;
- (BOOL)KBSuspendDimmingPropertyHandler:(id)a3;
- (BOOL)KBUpdateFrequencyHandler:(id)a3;
- (BOOL)KBUserActivityUpdateHandler:(id)a3;
- (BOOL)KBUserOffsetPropertyHandler:(id)a3;
- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)autoAdjust;
- (BOOL)builtIn;
- (BOOL)clamshellClosed;
- (BOOL)dimmed;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (BOOL)hysteresisOn;
- (BOOL)keyboardAvailable;
- (BOOL)manualAdjust;
- (BOOL)muted;
- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)retrieveKeyboardBacklightElements;
- (BOOL)saturated;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)supportsAuthentication;
- (BOOL)suppressed;
- (BOOL)suspend;
- (BOOL)userActive;
- (HIDDevice)device;
- (KeyboardBacklight)initWithQueue:(id)a3;
- (KeyboardBacklight)initWithQueue:(id)a3 device:(id)a4;
- (KeyboardBacklight)initWithQueue:(id)a3 device:(id)a4 ambientOffset:(float)a5;
- (NSMutableDictionary)keyboardSpecificPreferences;
- (NSString)description;
- (double)timeToNextBacklightUpdate;
- (float)ambientHighThreshold;
- (float)ambientLowThreshold;
- (float)ambientOffset;
- (float)ambientSlope;
- (float)brightness;
- (float)currentLux;
- (float)currentLuxToAmbient;
- (float)level;
- (float)levelMax;
- (float)levelMin;
- (float)levelOff;
- (float)levelPercentage;
- (float)maxUserLevel;
- (float)previousLevel;
- (id)brightnessUpdateReasonToString:(unint64_t)a3;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (int)color;
- (int)dimTime;
- (unint64_t)keyboardID;
- (unsigned)levelUnit;
- (unsigned)unitExponent;
- (void)calculateLevelPercentageAtAmbient:(float)a3;
- (void)dealloc;
- (void)didUpdateBacklightLevel:(float)a3 brightness:(float)a4 result:(BOOL)a5 error:(id)a6;
- (void)endKeyDim;
- (void)forceBacklightUpdateRoutine;
- (void)forceLuxUpdate;
- (void)forceLuxUpdateRoutine;
- (void)getCurrentLux;
- (void)getKeyboardBacklightPreferences;
- (void)handleDeviceManagementArrival:(unsigned int)a3;
- (void)handleLuxUpdate:(float)a3;
- (void)handlePMUserActivityStateChanged:(unint64_t)a3;
- (void)rampToBrightness:(float)a3 withDuration:(unsigned int)a4;
- (void)resetKeyDimTimeout;
- (void)scheduleBacklightUpdate:(int)a3;
- (void)sendNotificationForKey:(id)a3 withValue:(id)a4;
- (void)sendSuppressedNotification;
- (void)setAmbientOffset:(float)a3;
- (void)setAutoAdjust:(BOOL)a3;
- (void)setBacklightLevel:(float)a3;
- (void)setBrightness:(float)a3;
- (void)setBrightness:(float)a3 withFadeSpeed:(int)a4 commit:(BOOL)a5;
- (void)setBuiltIn:(BOOL)a3;
- (void)setClamshellClosed:(BOOL)a3;
- (void)setColor:(int)a3;
- (void)setCurrentLux:(float)a3;
- (void)setDevice:(id)a3;
- (void)setDimTime:(int)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setHysteresisOn:(BOOL)a3;
- (void)setKBPreferenceBacklightMaxUser;
- (void)setKeyboardAvailable:(BOOL)a3;
- (void)setKeyboardID:(unint64_t)a3;
- (void)setKeyboardSpecificPreferences:(id)a3;
- (void)setLevelMax:(float)a3;
- (void)setLevelMin:(float)a3;
- (void)setLevelOff:(float)a3;
- (void)setLevelPercentage:(float)a3;
- (void)setLevelUnit:(unsigned int)a3;
- (void)setManualAdjust:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setPreviousLevel:(float)a3;
- (void)setSaturated:(BOOL)a3;
- (void)setSuspend:(BOOL)a3;
- (void)setUnitExponent:(unsigned int)a3;
- (void)setUserActive:(BOOL)a3;
- (void)start;
- (void)startKBDeviceManagementServiceLookup;
- (void)startRamp;
- (void)stop;
- (void)stopKBDeviceManagementServiceLookup;
- (void)stopRamp;
- (void)storeKeyboardBacklightPreferences;
- (void)timerRoutine:(id)a3;
- (void)toggleMute;
- (void)updateAmbientOffset;
- (void)updateAuthentication:(BOOL)a3;
- (void)updateBacklightDevice;
- (void)updateBacklightDeviceWithFadeSpeed:(int)a3 commit:(BOOL)a4 reason:(unint64_t)a5;
- (void)updateBacklightDeviceWithReason:(unint64_t)a3;
@end

@implementation KeyboardBacklight

- (KeyboardBacklight)initWithQueue:(id)a3
{
  return [(KeyboardBacklight *)self initWithQueue:a3 device:0];
}

- (KeyboardBacklight)initWithQueue:(id)a3 device:(id)a4
{
  return -[KeyboardBacklight initWithQueue:device:ambientOffset:](self, "initWithQueue:device:ambientOffset:", a3, a4);
}

- (KeyboardBacklight)initWithQueue:(id)a3 device:(id)a4 ambientOffset:(float)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v56 = self;
  SEL v55 = a2;
  id v54 = a3;
  id v53 = a4;
  float v52 = a5;
  v51.receiver = self;
  v51.super_class = (Class)KeyboardBacklight;
  id v56 = [(CBModule *)&v51 initWithQueue:a3];
  if (v56)
  {
    id v5 = v53;
    *((void *)v56 + 7) = v5;
    *((unsigned char *)v56 + 37) = 0;
    *((unsigned char *)v56 + 35) = 0;
    *((unsigned char *)v56 + 34) = 1;
    *((unsigned char *)v56 + 261) = 1;
    *((unsigned char *)v56 + 36) = 0;
    *((unsigned char *)v56 + 32) = 0;
    *((unsigned char *)v56 + 33) = 1;
    *((unsigned char *)v56 + 39) = 1;
    *((unsigned char *)v56 + 40) = 1;
    *((_DWORD *)v56 + 71) = 0;
    *((_DWORD *)v56 + 72) = 0;
    *((_DWORD *)v56 + 73) = 0;
    *((_DWORD *)v56 + 66) = 30;
    *((_DWORD *)v56 + 79) = 0;
    *((float *)v56 + 70) = 1.0;
    *((float *)v56 + 77) = 1.0;
    *((_DWORD *)v56 + 69) = 1061427347;
    *((_DWORD *)v56 + 68) = 1062534644;
    *((float *)v56 + 67) = v52;
    *((unsigned char *)v56 + 260) = 0;
    *((void *)v56 + 40) = 0;
    *((void *)v56 + 14) = 0;
    *((_DWORD *)v56 + 11) = 0;
    *((_DWORD *)v56 + 12) = 0;
    *((unsigned char *)v56 + 38) = 0;
    *((_DWORD *)v56 + 50) = 0;
    *((unsigned char *)v56 + 204) = 0;
    *((unsigned char *)v56 + 41) = 0;
    *((void *)v56 + 24) = 1;
    *((unsigned char *)v56 + 152) = 0;
    *((void *)v56 + 23) = 0;
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E08]);
    *((void *)v56 + 20) = v6;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v56 + 12) = v7;
    if (mach_timebase_info((mach_timebase_info_t)v56 + 21))
    {
      os_log_t oslog = 0;
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        inited = init_default_corebrightness_log();
      }
      os_log_t oslog = inited;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        os_log_type_t v29 = type;
        __os_log_helper_16_0_0(v48);
        _os_log_error_impl(&dword_1BA438000, log, v29, "Failed to create mach timebase info.", v48, 2u);
      }
LABEL_58:

      return 0;
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v56 + 13) = v8;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v56 + 41) = v9;
    if ([v56 supportsAuthentication]) {
      v10 = "Secondary";
    }
    else {
      v10 = "default";
    }
    os_log_t v11 = os_log_create("com.apple.CoreBrightness.KeyboardBacklight", v10);
    *((void *)v56 + 2) = v11;
    if (!*((void *)v56 + 2))
    {
      os_log_t v47 = 0;
      v27 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      os_log_t v47 = v27;
      os_log_type_t v46 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v25 = v47;
        os_log_type_t v26 = v46;
        __os_log_helper_16_0_0(v45);
        _os_log_error_impl(&dword_1BA438000, v25, v26, "Failed to create logHandle", v45, 2u);
      }
    }
    *((_DWORD *)v56 + 44) = 60;
    *((void *)v56 + 31) = 0;
    *((_DWORD *)v56 + 64) = 0;
    id v44 = 0;
    id v44 = (id)[*((id *)v56 + 7) propertyForKey:@"ProductID"];
    if (v44)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v44 intValue] == 1108 || objc_msgSend(v44, "intValue") == 1109))
      {
        *((_DWORD *)v56 + 44) = 15;
      }
    }
    id v43 = 0;
    id v43 = (id)[*((id *)v56 + 7) propertyForKey:@"VendorID"];
    if (v43)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v43 intValue] == 1133)
      {
        *((_DWORD *)v56 + 44) = 15;
        *((_DWORD *)v56 + 50) = 0;
      }
    }
    bzero(__s1, 0x400uLL);
    size_t v42 = 1024;
    if (!sysctlbyname("kern.bootargs", __s1, &v42, 0, 0))
    {
      v41 = strstr(__s1, "kb_backlight_update_hz");
      if (v41)
      {
        v41 += 22;
        int v40 = strtol(v41 + 1, 0, 0);
        if (v40 > 0) {
          *((_DWORD *)v56 + 44) = v40;
        }
      }
    }
    os_log_t v39 = 0;
    if (*((void *)v56 + 2))
    {
      v24 = *((void *)v56 + 2);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v23 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v23 = init_default_corebrightness_log();
      }
      v24 = v23;
    }
    os_log_t v39 = v24;
    os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [*((id *)v56 + 7) propertyForKey:@"VendorID"];
      uint64_t v12 = [*((id *)v56 + 7) propertyForKey:@"ProductID"];
      __os_log_helper_16_2_3_8_64_8_64_4_0((uint64_t)v58, v22, v12, *((_DWORD *)v56 + 44));
      _os_log_impl(&dword_1BA438000, v39, v38, "[VID=%@] [PID=%@] Update frequency = %d", v58, 0x1Cu);
    }
    os_log_t v37 = 0;
    if (*((void *)v56 + 2))
    {
      v21 = *((void *)v56 + 2);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v20 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v20 = init_default_corebrightness_log();
      }
      v21 = v20;
    }
    os_log_t v37 = v21;
    os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v37;
      os_log_type_t v19 = v36;
      __os_log_helper_16_0_0(v35);
      _os_log_impl(&dword_1BA438000, v18, v19, "Open HIDDevice", v35, 2u);
    }
    [*((id *)v56 + 7) open];
    if (!([v56 retrieveKeyboardBacklightElements] & 1))
    {
      os_log_t v33 = 0;
      if (*((void *)v56 + 2))
      {
        v17 = *((void *)v56 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v16 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v16 = init_default_corebrightness_log();
        }
        v17 = v16;
      }
      os_log_t v33 = v17;
      os_log_type_t v32 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v14 = v33;
        os_log_type_t v15 = v32;
        __os_log_helper_16_0_0(v31);
        _os_log_error_impl(&dword_1BA438000, v14, v15, "Initialization of KeyboardBacklight failed", v31, 2u);
      }
      goto LABEL_58;
    }
  }
  return (KeyboardBacklight *)v56;
}

- (void)dealloc
{
  os_log_t v11 = self;
  SEL v10 = a2;
  id v9 = 0;
  if (self->super._logHandle)
  {
    logHandle = v11->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  id v9 = logHandle;
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1BA438000, log, type, "Dealloc", v7, 2u);
  }

  v11->_alsServiceClients = 0;
  v6.receiver = v11;
  v6.super_class = (Class)KeyboardBacklight;
  [(CBModule *)&v6 dealloc];
}

- (void)stop
{
  uint64_t v16 = self;
  SEL v15 = a2;
  v14 = 0;
  if (self->super._logHandle)
  {
    logHandle = v16->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  v14 = logHandle;
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    os_log_type_t type = v13;
    __os_log_helper_16_0_0(v12);
    _os_log_impl(&dword_1BA438000, log, type, "Stop", v12, 2u);
  }
  [(KeyboardBacklight *)v16 stopKBDeviceManagementServiceLookup];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v16, @"com.apple.springboard.deviceWillShutDown", 0);
  id v3 = [NSString alloc];
  os_log_t v11 = (__CFString *)[v3 initWithUTF8String:*MEMORY[0x1E4F64CE0]];
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, v16, v11, 0);

  if (v16->_forceLuxUpdateTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v16->_forceLuxUpdateTimer);
    dispatch_release((dispatch_object_t)v16->_forceLuxUpdateTimer);
    v16->_forceLuxUpdateTimer = 0;
  }
  if (v16->_backlightUpdateTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v16->_backlightUpdateTimer);
    dispatch_release((dispatch_object_t)v16->_backlightUpdateTimer);
    v16->_backlightUpdateTimer = 0;
  }
  v16->_numOfBacklightUpdateRetries = 0;
  if (v16->_rampTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v16->_rampTimer);
    dispatch_release((dispatch_object_t)v16->_rampTimer);
    v16->_rampTimer = 0;
  }
  if (v16->_activityNotificationHandle)
  {
    objc_super v6 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
    IOPMUnregisterNotification();
    v16->_activityNotificationHandle = 0;
  }
  [(HIDDevice *)v16->_device close];
  id v5 = (void *)[MEMORY[0x1E4F28C40] defaultCenter];
  [v5 removeObserver:v16 name:@"com.apple.AmbientLightSensorHID.PreferencesChanged" object:0];
}

- (void)start
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  os_log_type_t v46 = self;
  SEL v45 = a2;
  id v44 = 0;
  if (self->super._logHandle)
  {
    logHandle = v46->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  id v44 = logHandle;
  char v43 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v44;
    os_log_type_t type = v43;
    __os_log_helper_16_0_0(v42);
    _os_log_debug_impl(&dword_1BA438000, log, type, "Get properties for Keyboard Backlight", v42, 2u);
  }
  v46->_properties = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  id v41 = 0;
  id v41 = (id)[(HIDDevice *)v46->_device propertyForKey:@"KeyboardUniqueID"];
  if (v41)
  {
    -[KeyboardBacklight setKeyboardID:](v46, "setKeyboardID:", [v41 unsignedIntegerValue]);
    os_log_t v40 = 0;
    if (v46->super._logHandle)
    {
      uint64_t v22 = v46->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v21 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v21 = init_default_corebrightness_log();
      }
      uint64_t v22 = v21;
    }
    os_log_t v40 = v22;
    os_log_type_t v39 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v50, (uint64_t)v41);
      _os_log_impl(&dword_1BA438000, v40, v39, "KeyboardID = %{public}@", v50, 0xCu);
    }
  }
  else
  {
    v46->_keyboardID = +[KeyboardBacklight getHashIDForDevice:v46->_device];
    os_log_t v38 = 0;
    if (v46->super._logHandle)
    {
      uint64_t v20 = v46->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v19 = init_default_corebrightness_log();
      }
      uint64_t v20 = v19;
    }
    os_log_t v38 = v20;
    os_log_type_t v37 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v49, v46->_keyboardID);
      _os_log_debug_impl(&dword_1BA438000, v38, v37, "Keyboard ID = %lu", v49, 0xCu);
    }
  }
  id v36 = 0;
  id v36 = (id)[(HIDDevice *)v46->_device propertyForKey:@"Built-In"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v46->_builtIn = [v36 BOOLValue] & 1;
    os_log_t v35 = 0;
    if (v46->super._logHandle)
    {
      v18 = v46->super._logHandle;
    }
    else
    {
      uint64_t v17 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      v18 = v17;
    }
    os_log_t v35 = v18;
    os_log_type_t v34 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v48, (uint64_t)v36);
      _os_log_impl(&dword_1BA438000, v35, v34, "builtIn = %{public}@", v48, 0xCu);
    }
  }
  [(KeyboardBacklight *)v46 getKeyboardBacklightPreferences];
  [(KeyboardBacklight *)v46 storeKeyboardBacklightPreferences];
  [(KeyboardBacklight *)v46 resetKeyDimTimeout];
  os_log_t v33 = 0;
  if (v46->super._logHandle)
  {
    uint64_t v16 = v46->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v15 = init_default_corebrightness_log();
    }
    uint64_t v16 = v15;
  }
  os_log_t v33 = v16;
  char v32 = 2;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    os_log_type_t v13 = v33;
    os_log_type_t v14 = v32;
    __os_log_helper_16_0_0(v31);
    _os_log_debug_impl(&dword_1BA438000, v13, v14, "Registering for device shutdown notification", v31, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v46, (CFNotificationCallback)handleShutdownNotification, @"com.apple.springboard.deviceWillShutDown", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v30 = 0;
  if (v46->super._logHandle)
  {
    uint64_t v12 = v46->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v11 = init_default_corebrightness_log();
    }
    uint64_t v12 = v11;
  }
  v30 = v12;
  char v29 = 2;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v9 = v30;
    os_log_type_t v10 = v29;
    __os_log_helper_16_0_0(v28);
    _os_log_debug_impl(&dword_1BA438000, v9, v10, "Registering for keyboard availability notification", v28, 2u);
  }
  id v3 = [NSString alloc];
  id v7 = (void *)MEMORY[0x1E4F64CE0];
  v27 = (void *)[v3 initWithUTF8String:*MEMORY[0x1E4F64CE0]];
  center = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(center, v46, (CFNotificationCallback)handleAvailabilityNotification, (CFStringRef)[NSString stringWithUTF8String:*v7], 0, (CFNotificationSuspensionBehavior)0);

  if (v46->super._logHandle)
  {
    objc_super v6 = v46->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v5 = init_default_corebrightness_log();
    }
    objc_super v6 = v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    os_log_t v4 = v6;
    __os_log_helper_16_2_1_8_64((uint64_t)v47, (uint64_t)v46);
    _os_log_debug_impl(&dword_1BA438000, v6, OS_LOG_TYPE_DEBUG, "%@", v47, 0xCu);
  }
  [(KeyboardBacklight *)v46 startKBDeviceManagementServiceLookup];
}

- (void)startKBDeviceManagementServiceLookup
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA9ECAE0]();
  self->_deviceManagementArrivalNotificationPort = IONotificationPortCreate(*MEMORY[0x1E4F2EEF0]);
  IONotificationPortSetDispatchQueue(self->_deviceManagementArrivalNotificationPort, (dispatch_queue_t)self->super._queue);
  deviceManagementArrivalNotificationPort = self->_deviceManagementArrivalNotificationPort;
  CFDictionaryRef v2 = IOServiceMatching("AppleDeviceManagementHIDEventService");
  if (!IOServiceAddMatchingNotification(deviceManagementArrivalNotificationPort, "IOServiceFirstMatch", v2, (IOServiceMatchingCallback)deviceManagementArrivalCallback, self, &self->_deviceManagementArrivalIterator)&& self->_deviceManagementArrivalIterator)
  {
    while (1)
    {
      io_object_t v7 = IOIteratorNext(self->_deviceManagementArrivalIterator);
      if (!v7) {
        break;
      }
      if (self->super._logHandle)
      {
        logHandle = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        logHandle = inited;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v9, v7);
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Found device management service (%u)", v9, 8u);
      }
      [(KeyboardBacklight *)self handleDeviceManagementArrival:v7];
    }
  }
}

- (void)stopKBDeviceManagementServiceLookup
{
  if (self->_deviceManagementArrivalNotificationPort)
  {
    IONotificationPortDestroy(self->_deviceManagementArrivalNotificationPort);
    self->_deviceManagementArrivalNotificationPort = 0;
  }
  if (self->_deviceManagementArrivalIterator)
  {
    IOObjectRelease(self->_deviceManagementArrivalIterator);
    self->_deviceManagementArrivalIterator = 0;
  }
}

- (void)handleDeviceManagementArrival:(unsigned int)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  os_log_type_t v26 = self;
  SEL v25 = a2;
  io_registry_entry_t v24 = a3;
  if (a3)
  {
    CFNumberRef CFProperty = 0;
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v24, @"ColorID", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    if (CFProperty && (CFTypeID v13 = CFGetTypeID(CFProperty), v13 == CFNumberGetTypeID()))
    {
      unsigned int valuePtr = 0;
      CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
      os_log_t v21 = 0;
      if (v26->super._logHandle)
      {
        logHandle = v26->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        logHandle = inited;
      }
      os_log_t v21 = logHandle;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v27, valuePtr);
        _os_log_impl(&dword_1BA438000, v21, v20, "Found device colorID = %d", v27, 8u);
      }
      [(KeyboardBacklight *)v26 setColor:valuePtr];
    }
    else
    {
      uint64_t v19 = 0;
      if (v26->super._logHandle)
      {
        uint64_t v10 = v26->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v9 = init_default_corebrightness_log();
        }
        uint64_t v10 = v9;
      }
      uint64_t v19 = v10;
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        io_object_t v7 = v19;
        os_log_type_t v8 = v18;
        __os_log_helper_16_0_0(v17);
        _os_log_impl(&dword_1BA438000, v7, v8, "Device color is not present", v17, 2u);
      }
    }
    if (CFProperty) {
      CFRelease(CFProperty);
    }
  }
  else
  {
    uint64_t v16 = 0;
    if (v26->super._logHandle)
    {
      objc_super v6 = v26->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v5 = init_default_corebrightness_log();
      }
      objc_super v6 = v5;
    }
    uint64_t v16 = v6;
    char v15 = 16;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v3 = v16;
      os_log_type_t v4 = v15;
      __os_log_helper_16_0_0(v14);
      _os_log_error_impl(&dword_1BA438000, v3, v4, "No service", v14, 2u);
    }
  }
}

- (BOOL)retrieveKeyboardBacklightElements
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  v96 = self;
  SEL v95 = a2;
  char v94 = 0;
  v93 = &unk_1F1418530;
  id v92 = 0;
  id v92 = (id)[(HIDDevice *)self->_device elementsMatching:&unk_1F1418530];
  if (![v92 count])
  {
    os_log_t oslog = 0;
    if (v96->super._logHandle)
    {
      logHandle = v96->super._logHandle;
    }
    else
    {
      uint64_t v64 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      logHandle = v64;
    }
    os_log_t oslog = logHandle;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v63 = type;
      __os_log_helper_16_0_0(v89);
      _os_log_error_impl(&dword_1BA438000, log, v63, "HID elements not found.", v89, 2u);
    }
  }
  memset(__b, 0, sizeof(__b));
  id obj = v92;
  uint64_t v61 = [v92 countByEnumeratingWithState:__b objects:v100 count:16];
  if (v61)
  {
    uint64_t v57 = *(void *)__b[2];
    uint64_t v58 = 0;
    unint64_t v59 = v61;
    while (1)
    {
      uint64_t v56 = v58;
      if (*(void *)__b[2] != v57) {
        objc_enumerationMutation(obj);
      }
      id v88 = 0;
      id v88 = *(id *)(__b[1] + 8 * v58);
      if ([v88 type] == 257)
      {
        os_log_t v86 = 0;
        if (v96->super._logHandle)
        {
          SEL v55 = v96->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t inited = init_default_corebrightness_log();
          }
          SEL v55 = inited;
        }
        os_log_t v86 = v55;
        os_log_type_t v85 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          float v52 = v86;
          os_log_type_t v53 = v85;
          uint64_t v46 = [v88 usage];
          uint64_t v47 = [v88 usagePage];
          uint64_t v48 = [v88 reportID];
          uint64_t v49 = [v88 unit];
          uint64_t v50 = [v88 reportSize];
          uint64_t v51 = [v88 logicalMax];
          __os_log_helper_16_0_7_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v99, v46, v47, v48, v49, v50, v51, [v88 logicalMin]);
          _os_log_debug_impl(&dword_1BA438000, v52, v53, "usage = 0x%lx, usage page = 0x%lx, reportID = %ld, unit = 0x%lx, reportSize = %ld, max logical = %ld, min logical = %ld", v99, 0x48u);
        }
        unint64_t v2 = [v88 usage];
        if (v2 <= 1)
        {
          unint64_t v4 = v2 - 1;
          char v3 = 0;
        }
        else
        {
          unint64_t v4 = v2 - 1;
          char v3 = 1;
        }
        if (v3)
        {
          os_log_t v70 = 0;
          if (v96->super._logHandle)
          {
            uint64_t v22 = v96->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v21 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v21 = init_default_corebrightness_log();
            }
            uint64_t v22 = v21;
          }
          os_log_t v70 = v22;
          os_log_type_t v69 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_0_1_8_0((uint64_t)v97, [v88 usage]);
            _os_log_debug_impl(&dword_1BA438000, v70, v69, "Unknown element with usage = %ld", v97, 0xCu);
          }
        }
        else
        {
          switch(v4)
          {
            case 0uLL:
              uint64_t v5 = (HIDElement *)v88;
              v96->_levelElement = v5;
              double v6 = scaleForExponent([v88 unitExponent]);
              [(KeyboardBacklight *)v96 setUnitExponent:v6];
              float v44 = (float)[v88 logicalMin];
              *(float *)&double v7 = v44 / (float)[(KeyboardBacklight *)v96 unitExponent];
              [(KeyboardBacklight *)v96 setLevelMin:v7];
              float v45 = (float)[v88 logicalMax];
              *(float *)&double v8 = v45 / (float)[(KeyboardBacklight *)v96 unitExponent];
              [(KeyboardBacklight *)v96 setLevelMax:v8];
              [(KeyboardBacklight *)v96 setLevelOff:0.0];
              uint64_t v9 = [v88 unit];
              [(KeyboardBacklight *)v96 setLevelUnit:v9];
              os_log_t v84 = 0;
              if (v96->super._logHandle)
              {
                char v43 = v96->super._logHandle;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t v42 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t v42 = init_default_corebrightness_log();
                }
                char v43 = v42;
              }
              os_log_t v84 = v43;
              os_log_type_t v83 = OS_LOG_TYPE_DEBUG;
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                os_log_t v40 = v84;
                os_log_type_t v41 = v83;
                [(KeyboardBacklight *)v96 levelMin];
                *(double *)&uint64_t v39 = v10;
                [(KeyboardBacklight *)v96 levelMax];
                __os_log_helper_16_0_3_8_0_8_0_4_0((uint64_t)v98, v39, COERCE__INT64(v11), [(KeyboardBacklight *)v96 unitExponent]);
                _os_log_debug_impl(&dword_1BA438000, v40, v41, "found Level element with min = %f, max = %f, exponent = %d", v98, 0x1Cu);
              }
              break;
            case 1uLL:
              uint64_t v12 = (HIDElement *)v88;
              v96->_levelFadeSpeedElement = v12;
              os_log_t v82 = 0;
              if (v96->super._logHandle)
              {
                os_log_t v38 = v96->super._logHandle;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t v37 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t v37 = init_default_corebrightness_log();
                }
                os_log_t v38 = v37;
              }
              os_log_t v82 = v38;
              os_log_type_t v81 = OS_LOG_TYPE_DEBUG;
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                os_log_t v35 = v82;
                os_log_type_t v36 = v81;
                __os_log_helper_16_0_0(v80);
                _os_log_debug_impl(&dword_1BA438000, v35, v36, "found level fade speed element", v80, 2u);
              }
              break;
            case 2uLL:
              CFTypeID v13 = (HIDElement *)v88;
              v96->_enableElement = v13;
              os_log_t v79 = 0;
              if (v96->super._logHandle)
              {
                os_log_type_t v34 = v96->super._logHandle;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t v33 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t v33 = init_default_corebrightness_log();
                }
                os_log_type_t v34 = v33;
              }
              os_log_t v79 = v34;
              os_log_type_t v78 = OS_LOG_TYPE_DEBUG;
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                v31 = v79;
                os_log_type_t v32 = v78;
                __os_log_helper_16_0_0(v77);
                _os_log_debug_impl(&dword_1BA438000, v31, v32, "found Enable element", v77, 2u);
              }
              break;
            case 3uLL:
              os_log_type_t v14 = (HIDElement *)v88;
              v96->_enableFadeSpeedElement = v14;
              os_log_t v76 = 0;
              if (v96->super._logHandle)
              {
                v30 = v96->super._logHandle;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t v29 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t v29 = init_default_corebrightness_log();
                }
                v30 = v29;
              }
              os_log_t v76 = v30;
              os_log_type_t v75 = OS_LOG_TYPE_DEBUG;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                v27 = v76;
                os_log_type_t v28 = v75;
                __os_log_helper_16_0_0(v74);
                _os_log_debug_impl(&dword_1BA438000, v27, v28, "found enable fade speed element", v74, 2u);
              }
              break;
            case 4uLL:
              char v15 = (HIDElement *)v88;
              v96->_enableAuthenticationElement = v15;
              os_log_t v73 = 0;
              if (v96->super._logHandle)
              {
                os_log_type_t v26 = v96->super._logHandle;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t v25 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t v25 = init_default_corebrightness_log();
                }
                os_log_type_t v26 = v25;
              }
              os_log_t v73 = v26;
              os_log_type_t v72 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v23 = v73;
                os_log_type_t v24 = v72;
                __os_log_helper_16_0_0(v71);
                _os_log_impl(&dword_1BA438000, v23, v24, "found auth element", v71, 2u);
              }
              break;
            default:
              JUMPOUT(0);
          }
        }
      }
      ++v58;
      if (v56 + 1 >= v59)
      {
        uint64_t v58 = 0;
        unint64_t v59 = [obj countByEnumeratingWithState:__b objects:v100 count:16];
        if (!v59) {
          break;
        }
      }
    }
  }

  if (v96->_levelElement && v96->_levelFadeSpeedElement)
  {
    char v94 = 1;
  }
  else
  {
    os_log_t v68 = 0;
    if (v96->super._logHandle)
    {
      os_log_type_t v20 = v96->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v19 = init_default_corebrightness_log();
      }
      os_log_type_t v20 = v19;
    }
    os_log_t v68 = v20;
    os_log_type_t v67 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = v68;
      os_log_type_t v18 = v67;
      __os_log_helper_16_0_0(v66);
      _os_log_error_impl(&dword_1BA438000, v17, v18, "Elements to set keyboard backlight level are not available", v66, 2u);
    }
  }
  return v94 & 1;
}

- (NSString)description
{
  os_log_type_t v28 = NSString;
  [(KeyboardBacklight *)self currentLux];
  double v13 = v2;
  [(KeyboardBacklight *)self brightness];
  double v14 = v3;
  [(KeyboardBacklight *)self levelPercentage];
  double v15 = v4;
  BOOL v16 = [(KeyboardBacklight *)self saturated];
  BOOL v17 = [(KeyboardBacklight *)self manualAdjust];
  BOOL v18 = [(KeyboardBacklight *)self autoAdjust];
  BOOL v19 = [(KeyboardBacklight *)self suppressed];
  BOOL v20 = [(KeyboardBacklight *)self dimmed];
  BOOL v21 = [(KeyboardBacklight *)self muted];
  [(KeyboardBacklight *)self levelMin];
  double v22 = v5;
  [(KeyboardBacklight *)self levelMax];
  double v23 = v6;
  [(KeyboardBacklight *)self levelOff];
  double v24 = v7;
  [(KeyboardBacklight *)self ambientOffset];
  double v25 = v8;
  [(KeyboardBacklight *)self ambientSlope];
  double v26 = v9;
  [(KeyboardBacklight *)self ambientLowThreshold];
  double v27 = v10;
  [(KeyboardBacklight *)self ambientHighThreshold];
  return (NSString *)objc_msgSend(v28, "stringWithFormat:", @"currentLux %f brightness %f levelPercentage %f saturated %d manualAdjust %d autoAdjust %d suppressed %d dimmed %d muted %d levelMin %f levelMax %f levelOff %f ambientOffset %f ambientSlope %f ambientLowThreshold %f ambientHighThreshold %f suspend %d userActive %d HW available %d", *(void *)&v13, *(void *)&v14, *(void *)&v15, v16, v17, v18, v19, v20, v21, *(void *)&v22, *(void *)&v23, *(void *)&v24, *(void *)&v25, *(void *)&v26, *(void *)&v27, v11,
                       [(KeyboardBacklight *)self suspend],
                       [(KeyboardBacklight *)self userActive],
                       [(KeyboardBacklight *)self keyboardAvailable]);
}

- (BOOL)suppressed
{
  BOOL v3 = 1;
  if (![(KeyboardBacklight *)self dimmed])
  {
    BOOL v3 = 1;
    if (![(KeyboardBacklight *)self muted])
    {
      BOOL v3 = 1;
      if ([(KeyboardBacklight *)self userActive])
      {
        BOOL v3 = 1;
        if ([(KeyboardBacklight *)self keyboardAvailable]) {
          return [(KeyboardBacklight *)self clamshellClosed];
        }
      }
    }
  }
  return v3;
}

- (BOOL)dimmed
{
  BOOL v3 = 0;
  if (self->_dimmed) {
    return !self->_suspendDimming;
  }
  return v3;
}

- (void)setDimmed:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3;
  if (a3 != self->_dimmed)
  {
    char v5 = [(KeyboardBacklight *)self suppressed];
    self->_dimmed = v6;
    if (v5 != [(KeyboardBacklight *)self suppressed]) {
      [(KeyboardBacklight *)self sendSuppressedNotification];
    }
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v8, self->_dimmed);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "keyboard backlight dimmed %d", v8, 8u);
    }
  }
}

- (BOOL)suspend
{
  return self->_suspend;
}

- (void)setSuspend:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 != self->_suspend)
  {
    self->_suspend = a3;
    if (self->_suspend) {
      [(KeyboardBacklight *)self stopRamp];
    }
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v6, self->_suspend);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Suspend auto-brightness = %d", v6, 8u);
    }
  }
}

- (BOOL)userActive
{
  return self->_userActive;
}

- (void)setUserActive:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3;
  if (a3 != self->_userActive)
  {
    char v5 = [(KeyboardBacklight *)self suppressed];
    self->_userActive = v6;
    if (v5 != [(KeyboardBacklight *)self suppressed]) {
      [(KeyboardBacklight *)self sendSuppressedNotification];
    }
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v8, self->_userActive);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "User activity %d", v8, 8u);
    }
  }
}

- (BOOL)keyboardAvailable
{
  return self->_keyboardAvailable;
}

- (void)setKeyboardAvailable:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3;
  if (a3 != self->_keyboardAvailable)
  {
    char v5 = [(KeyboardBacklight *)self suppressed];
    self->_keyboardAvailable = v6;
    if (v5 != [(KeyboardBacklight *)self suppressed]) {
      [(KeyboardBacklight *)self sendSuppressedNotification];
    }
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v8, self->_keyboardAvailable);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "HW keyboard availability %d", v8, 8u);
    }
  }
}

- (BOOL)clamshellClosed
{
  return self->_clamshellClosed;
}

- (void)setClamshellClosed:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v7 = a3;
  if (a3 != self->_clamshellClosed)
  {
    char v6 = [(KeyboardBacklight *)self suppressed];
    self->_clamshellClosed = v7;
    if (v6 != [(KeyboardBacklight *)self suppressed]) {
      [(KeyboardBacklight *)self sendSuppressedNotification];
    }
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      if (v7) {
        BOOL v3 = "closed";
      }
      else {
        BOOL v3 = "opened";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Clamshell is %s.", v9, 0xCu);
    }
  }
}

- (void)sendSuppressedNotification
{
  id v2 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[KeyboardBacklight suppressed](self, "suppressed"));
  [(KeyboardBacklight *)self sendNotificationForKey:@"KeyboardBacklightSuppressed" withValue:v2];
}

- (void)updateBacklightDevice
{
}

- (void)updateBacklightDeviceWithReason:(unint64_t)a3
{
  [(KeyboardBacklight *)self level];
  float v8 = v3;
  [(KeyboardBacklight *)self levelOff];
  float v4 = *(float *)&v5;
  *(float *)&double v5 = v8;
  if (v8 == v4) {
    uint64_t v6 = 350;
  }
  else {
    uint64_t v6 = 500;
  }
  -[KeyboardBacklight updateBacklightDeviceWithFadeSpeed:commit:reason:](self, "updateBacklightDeviceWithFadeSpeed:commit:reason:", v6, 1, a3, v5);
}

- (void)updateBacklightDeviceWithFadeSpeed:(int)a3 commit:(BOOL)a4 reason:(unint64_t)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  v74 = self;
  SEL v73 = a2;
  int v72 = a3;
  BOOL v71 = a4;
  unint64_t v70 = a5;
  os_log_t v69 = 0;
  if (self->super._logHandle)
  {
    logHandle = v74->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  os_log_t v69 = logHandle;
  os_log_type_t v68 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    [(KeyboardBacklight *)v74 levelPercentage];
    *(double *)&uint64_t v46 = v5;
    [(KeyboardBacklight *)v74 level];
    *(double *)&uint64_t v47 = v6;
    [(KeyboardBacklight *)v74 currentLux];
    __os_log_helper_16_2_4_8_0_8_0_8_0_8_66((uint64_t)v79, v46, v47, COERCE__INT64(v7), (uint64_t)[(KeyboardBacklight *)v74 brightnessUpdateReasonToString:v70]);
    _os_log_impl(&dword_1BA438000, v69, v68, "levelPercentage %f, level = %f (nits/pwm), lux = %f (reason = %{public}@)", v79, 0x2Au);
  }
  id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v66 = v72;
  if (v74->_backlightUpdateFrequency > 0 && (float)v72 <= (float)(1000.0 / (float)v74->_backlightUpdateFrequency)) {
    int v66 = (int)(float)(1000.0 / (float)v74->_backlightUpdateFrequency);
  }
  if (v66 > 0) {
    int v45 = v66;
  }
  else {
    int v45 = 10;
  }
  int v66 = v45;
  [(KeyboardBacklight *)v74 level];
  float v44 = v8;
  [(KeyboardBacklight *)v74 levelOff];
  float v9 = *(float *)&v10;
  *(float *)&double v10 = v44;
  if (v44 == v9)
  {
    if (v74->_enableElement && v74->_enableFadeSpeedElement)
    {
      -[HIDElement setIntegerValue:](v74->_enableElement, "setIntegerValue:", 0, v10);
      [(HIDElement *)v74->_enableFadeSpeedElement setIntegerValue:v66];
      [v67 addObject:v74->_enableElement];
      [v67 addObject:v74->_enableFadeSpeedElement];
      v65 = 0;
      if (v74->super._logHandle)
      {
        char v43 = v74->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v42 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v42 = init_default_corebrightness_log();
        }
        char v43 = v42;
      }
      v65 = v43;
      char v64 = 1;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        os_log_t v40 = v65;
        os_log_type_t v41 = v64;
        __os_log_helper_16_0_0(v63);
        _os_log_impl(&dword_1BA438000, v40, v41, "Turn off keyboard backlight", v63, 2u);
      }
    }
    else if (v74->_levelElement && v74->_levelFadeSpeedElement)
    {
      [(KeyboardBacklight *)v74 levelOff];
      [(HIDElement *)v74->_levelElement setIntegerValue:(uint64_t)v11];
      [(HIDElement *)v74->_levelFadeSpeedElement setIntegerValue:v66];
      [v67 addObject:v74->_levelElement];
      [v67 addObject:v74->_levelFadeSpeedElement];
      os_log_t v62 = 0;
      if (v74->super._logHandle)
      {
        uint64_t v39 = v74->super._logHandle;
      }
      else
      {
        uint64_t v38 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        uint64_t v39 = v38;
      }
      os_log_t v62 = v39;
      os_log_type_t v61 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        [(KeyboardBacklight *)v74 levelOff];
        __os_log_helper_16_0_1_8_0((uint64_t)v78, COERCE__INT64(v12));
        _os_log_impl(&dword_1BA438000, v62, v61, "Turn off keyboard backlight with level %f", v78, 0xCu);
      }
    }
  }
  else if (v74->_levelElement && v74->_levelFadeSpeedElement)
  {
    [(KeyboardBacklight *)v74 level];
    [(HIDElement *)v74->_levelElement setIntegerValue:(uint64_t)(float)(v13 * (float)[(KeyboardBacklight *)v74 unitExponent])];
    [(HIDElement *)v74->_levelFadeSpeedElement setIntegerValue:v66];
    [v67 addObject:v74->_levelElement];
    [v67 addObject:v74->_levelFadeSpeedElement];
    if (v74->_enableElement
      && v74->_enableFadeSpeedElement
      && [(HIDElement *)v74->_enableElement integerValue] != 1)
    {
      [(HIDElement *)v74->_enableElement setIntegerValue:1];
      [(HIDElement *)v74->_enableFadeSpeedElement setIntegerValue:v66];
      [v67 addObject:v74->_enableElement];
      [v67 addObject:v74->_enableFadeSpeedElement];
    }
    os_log_t oslog = 0;
    if (v74->super._logHandle)
    {
      uint64_t v37 = v74->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v36 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v36 = init_default_corebrightness_log();
      }
      uint64_t v37 = v36;
    }
    os_log_t oslog = v37;
    os_log_type_t v59 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      [(KeyboardBacklight *)v74 level];
      __os_log_helper_16_0_3_8_0_4_0_8_0((uint64_t)v77, COERCE__INT64(v14), v66, v70);
      _os_log_impl(&dword_1BA438000, oslog, v59, "Set keyboard backlight with level %f (nits/pwm), fade speed %d (ms), reason %lu", v77, 0x1Cu);
    }
  }
  if (objc_msgSend(v67, "count", v10))
  {
    if (v74->_backlightUpdateType != 1 || v70 == 4)
    {
      os_log_t v56 = 0;
      if (v74->super._logHandle)
      {
        os_log_type_t v32 = v74->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v31 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v31 = init_default_corebrightness_log();
        }
        os_log_type_t v32 = v31;
      }
      os_log_t v56 = v32;
      os_log_type_t v55 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v75, (uint64_t)v67);
        _os_log_impl(&dword_1BA438000, v56, v55, "Commit elements %@", v75, 0xCu);
      }
      uint64_t v54 = 0;
      char v53 = 0;
      char v53 = [(HIDDevice *)v74->_device commitElements:v67 direction:1 error:&v54] & 1;
      uint64_t v29 = v74;
      [(KeyboardBacklight *)v74 level];
      int v30 = v19;
      [(KeyboardBacklight *)v74 brightness];
      LODWORD(v21) = v20;
      LODWORD(v22) = v30;
      [(KeyboardBacklight *)v29 didUpdateBacklightLevel:v53 & 1 brightness:v54 result:v22 error:v21];
    }
    else
    {
      [(NSLock *)v74->_backlightUpdateLock lock];

      id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v16 = [v15 initWithArray:v67];
      v74->_elements = (NSMutableArray *)v16;
      if (v74->_backlightUpdateInProgress)
      {
        os_log_t v58 = 0;
        if (v74->super._logHandle)
        {
          os_log_type_t v34 = v74->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v33 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v33 = init_default_corebrightness_log();
          }
          os_log_type_t v34 = v33;
        }
        os_log_t v58 = v34;
        os_log_type_t v57 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          [(KeyboardBacklight *)v74 timeToNextBacklightUpdate];
          __os_log_helper_16_0_1_8_0((uint64_t)v76, v18);
          _os_log_debug_impl(&dword_1BA438000, v58, v57, "Backlight update is scheduled already (in %f ms)", v76, 0xCu);
        }
      }
      else
      {
        v74->_backlightUpdateInProgress = 1;
        os_log_t v35 = v74;
        [(KeyboardBacklight *)v74 timeToNextBacklightUpdate];
        [(KeyboardBacklight *)v35 scheduleBacklightUpdate:(int)v17];
      }
      [(NSLock *)v74->_backlightUpdateLock unlock];
    }
    if (v70 == 3 || v70 == 1 && v71)
    {
      os_log_type_t v28 = v74;
      [(KeyboardBacklight *)v74 brightness];
      -[KeyboardBacklight rampToBrightness:withDuration:](v28, "rampToBrightness:withDuration:", v72);
    }
    else if (v70 != 2)
    {
      [(KeyboardBacklight *)v74 brightness];
      v74->_ramp.current = v23;
    }
  }
  else
  {
    os_log_t v52 = 0;
    if (v74->super._logHandle)
    {
      double v27 = v74->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v26 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v26 = init_default_corebrightness_log();
      }
      double v27 = v26;
    }
    os_log_t v52 = v27;
    os_log_type_t v51 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      double v24 = v52;
      os_log_type_t v25 = v51;
      __os_log_helper_16_0_0(v50);
      _os_log_error_impl(&dword_1BA438000, v24, v25, "No elements", v50, 2u);
    }
  }
}

- (void)updateAuthentication:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  if ([(KeyboardBacklight *)self supportsAuthentication] && v16->_enableAuthenticationElement)
  {
    os_log_t v13 = 0;
    if (v16->super._logHandle)
    {
      logHandle = v16->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    os_log_t v13 = logHandle;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      if (v14) {
        float v3 = "Start";
      }
      else {
        float v3 = "Stop";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v19, (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, v13, v12, "%s authentication", v19, 0xCu);
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = 0;
    [(HIDElement *)v16->_enableAuthenticationElement setIntegerValue:v14];
    [v11 addObject:v16->_enableAuthenticationElement];
    if ([(HIDDevice *)v16->_device commitElements:v11 direction:1 error:&v10])
    {
      if (v16->super._logHandle)
      {
        float v5 = v16->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v4 = init_default_corebrightness_log();
        }
        float v5 = v4;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v17, v14);
        _os_log_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEFAULT, "Authentication updated successfully = %d", v17, 8u);
      }
    }
    else
    {
      if (v16->super._logHandle)
      {
        float v7 = v16->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v6 = init_default_corebrightness_log();
        }
        float v7 = v6;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v18, v10);
        _os_log_error_impl(&dword_1BA438000, v7, OS_LOG_TYPE_ERROR, "Failed to set authentication %{public}@", v18, 0xCu);
      }
    }
  }
}

- (void)didUpdateBacklightLevel:(float)a3 brightness:(float)a4 result:(BOOL)a5 error:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    self->_previousLevel = a3;
    self->_numOfBacklightUpdateRetries = 0;
    if (self->_previousLevelPercentage != a4)
    {
      self->_previousLevelPercentage = a4;
      id v6 = objc_alloc(NSNumber);
      *(float *)&double v7 = a4;
      id v15 = (id)[v6 initWithFloat:v7];
      id v8 = objc_alloc(NSNumber);
      *(float *)&double v9 = a3;
      id v14 = (id)[v8 initWithFloat:v9];
      [(KeyboardBacklight *)self sendNotificationForKey:@"KeyboardBacklightBrightness" withValue:v15];
      [(KeyboardBacklight *)self sendNotificationForKey:@"KeyboardBacklightLevel" withValue:v14];
    }
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v20, COERCE__INT64(a3), COERCE__INT64(a4));
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Backlight updated successfully - level = %f, brightness = %f", v20, 0x16u);
    }
  }
  else
  {
    if (self->super._logHandle)
    {
      os_log_t v13 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v12 = init_default_corebrightness_log();
      }
      os_log_t v13 = v12;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v21, (uint64_t)a6);
      _os_log_error_impl(&dword_1BA438000, v13, OS_LOG_TYPE_ERROR, "%@", v21, 0xCu);
    }
    if (self->_numOfBacklightUpdateRetries < 12)
    {
      ++self->_numOfBacklightUpdateRetries;
      [(KeyboardBacklight *)self scheduleBacklightUpdate:250];
    }
  }
}

- (void)toggleMute
{
  if ([(KeyboardBacklight *)self manualAdjust]) {
    [(KeyboardBacklight *)self setSaturated:0];
  }
  [(KeyboardBacklight *)self updateBacklightDevice];
}

- (BOOL)muted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  BOOL v4 = a3;
  if (self->_muted != a3)
  {
    char v3 = [(KeyboardBacklight *)self suppressed];
    self->_muted = v4;
    if (v3 != [(KeyboardBacklight *)self suppressed]) {
      [(KeyboardBacklight *)self sendSuppressedNotification];
    }
    +[CBKeyboardPreferencesManager setBoolPreference:self->_muted forKey:@"KeyboardBacklightMuted"];
  }
}

- (BOOL)manualAdjust
{
  return self->_manualAdjust;
}

- (void)setManualAdjust:(BOOL)a3
{
  LOBYTE(v3) = 1;
  if (!a3) {
    int v3 = ![(KeyboardBacklight *)self autoAdjust];
  }
  self->_manualAdjust = v3 & 1;
}

- (BOOL)saturated
{
  return self->_saturated;
}

- (void)setSaturated:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL saturated = self->_saturated;
  BOOL v7 = 0;
  if (a3) {
    BOOL v7 = [(KeyboardBacklight *)self autoAdjust];
  }
  self->_BOOL saturated = v7;
  if (saturated != self->_saturated)
  {
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v4 = self->_saturated;
      [(KeyboardBacklight *)self currentLux];
      __os_log_helper_16_0_2_4_0_8_0((uint64_t)v11, v4, COERCE__INT64(v3));
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "keyboard backlight saturated %d (Lux=%f)", v11, 0x12u);
    }
    id v8 = (id)[objc_alloc(NSNumber) initWithBool:self->_saturated];
    [(KeyboardBacklight *)self sendNotificationForKey:@"KeyboardBacklightSaturated" withValue:v8];
  }
}

- (float)brightness
{
  if ([(KeyboardBacklight *)self suppressed] || [(KeyboardBacklight *)self saturated])
  {
    [(KeyboardBacklight *)self levelOff];
    return v2;
  }
  else
  {
    [(KeyboardBacklight *)self levelPercentage];
    return v3;
  }
}

- (void)setBrightness:(float)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v30 = self;
  SEL v29 = a2;
  float v28 = a3;
  os_log_t v27 = 0;
  if (self->super._logHandle)
  {
    logHandle = v30->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  os_log_t v27 = logHandle;
  os_log_type_t v26 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_2_8_0_4_0((uint64_t)v32, COERCE__INT64(v28), [(KeyboardBacklight *)v30 manualAdjust]);
    _os_log_debug_impl(&dword_1BA438000, v27, v26, "Requested keyboard brightness %f, manualAdjust %d", v32, 0x12u);
  }
  if ([(KeyboardBacklight *)v30 manualAdjust])
  {
    float v25 = 0.0;
    float v24 = 0.0;
    float v23 = v28;
    if (v28 <= 0.0) {
      float v12 = v24;
    }
    else {
      float v12 = v23;
    }
    float v22 = v12;
    float v25 = v12;
    float v21 = 1.0;
    *(void *)&double v3 = LODWORD(v12);
    if (v12 >= 1.0) {
      float v11 = v21;
    }
    else {
      float v11 = v25;
    }
    float v20 = v11;
    *(float *)&double v3 = v11;
    [(KeyboardBacklight *)v30 setLevelPercentage:v3];
    [(KeyboardBacklight *)v30 setSaturated:0];
    [(KeyboardBacklight *)v30 levelPercentage];
    [(KeyboardBacklight *)v30 setMuted:v4 == 0.0];
    [(KeyboardBacklight *)v30 levelPercentage];
    +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", @"KeyboardBacklightManualBrightness");
    [(KeyboardBacklight *)v30 updateAmbientOffset];
    [(KeyboardBacklight *)v30 updateBacklightDeviceWithReason:1];
    os_log_t v19 = 0;
    if (v30->super._logHandle)
    {
      uint64_t v10 = v30->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v9 = init_default_corebrightness_log();
      }
      uint64_t v10 = v9;
    }
    os_log_t v19 = v10;
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)v30);
      _os_log_debug_impl(&dword_1BA438000, v19, v18, "%@", v31, 0xCu);
    }
  }
  else
  {
    double v17 = 0;
    if (v30->super._logHandle)
    {
      id v8 = v30->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v7 = init_default_corebrightness_log();
      }
      id v8 = v7;
    }
    double v17 = v8;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      float v5 = v17;
      os_log_type_t v6 = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_impl(&dword_1BA438000, v5, v6, "Manual keyboard brightness adjustment not allowed", v15, 2u);
    }
  }
}

- (void)setBrightness:(float)a3 withFadeSpeed:(int)a4 commit:(BOOL)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  os_log_type_t v34 = self;
  SEL v33 = a2;
  float v32 = a3;
  unsigned int v31 = a4;
  BOOL v30 = a5;
  os_log_t v29 = 0;
  if (self->super._logHandle)
  {
    logHandle = v34->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  os_log_t v29 = logHandle;
  os_log_type_t v28 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_4_8_0_4_0_4_0_4_0((uint64_t)v36, COERCE__INT64(v32), [(KeyboardBacklight *)v34 manualAdjust], v31, v30);
    _os_log_debug_impl(&dword_1BA438000, v29, v28, "Requested keyboard brightness %f, manualAdjust %d, fade speed %d, commit %d", v36, 0x1Eu);
  }
  if ([(KeyboardBacklight *)v34 manualAdjust])
  {
    float v27 = 0.0;
    float v26 = 0.0;
    float v25 = v32;
    if (v32 <= 0.0) {
      float v14 = v26;
    }
    else {
      float v14 = v25;
    }
    float v24 = v14;
    float v27 = v14;
    float v23 = 1.0;
    *(void *)&double v5 = LODWORD(v14);
    if (v14 >= 1.0) {
      float v13 = v23;
    }
    else {
      float v13 = v27;
    }
    float v22 = v13;
    *(float *)&double v5 = v13;
    [(KeyboardBacklight *)v34 setLevelPercentage:v5];
    [(KeyboardBacklight *)v34 setSaturated:0];
    [(KeyboardBacklight *)v34 levelPercentage];
    [(KeyboardBacklight *)v34 setMuted:v6 == 0.0];
    [(KeyboardBacklight *)v34 levelPercentage];
    +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", @"KeyboardBacklightManualBrightness");
    [(KeyboardBacklight *)v34 updateAmbientOffset];
    [(KeyboardBacklight *)v34 updateBacklightDeviceWithFadeSpeed:v31 commit:v30 reason:1];
    os_log_t v21 = 0;
    if (v34->super._logHandle)
    {
      float v12 = v34->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v11 = init_default_corebrightness_log();
      }
      float v12 = v11;
    }
    os_log_t v21 = v12;
    os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)v34);
      _os_log_debug_impl(&dword_1BA438000, v21, v20, "%@", v35, 0xCu);
    }
  }
  else
  {
    os_log_t oslog = 0;
    if (v34->super._logHandle)
    {
      uint64_t v10 = v34->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v9 = init_default_corebrightness_log();
      }
      uint64_t v10 = v9;
    }
    os_log_t oslog = v10;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = oslog;
      os_log_type_t v8 = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_impl(&dword_1BA438000, v7, v8, "Manual keyboard brightness adjustment not allowed", v17, 2u);
    }
  }
}

- (void)setBacklightLevel:(float)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v14, COERCE__INT64(a3));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Set backlight level = %f", v14, 0xCu);
  }
  [(KeyboardBacklight *)self levelMin];
  float v9 = a3 - v3;
  [(KeyboardBacklight *)self levelMax];
  float v8 = v4;
  [(KeyboardBacklight *)self levelMin];
  if ((float)(v9 / (float)(v8 - v5)) >= 0.0) {
    float v7 = v9 / (float)(v8 - v5);
  }
  else {
    float v7 = 0.0;
  }
  if (v7 >= 1.0) {
    float v6 = 1.0;
  }
  else {
    float v6 = v7;
  }
  [(KeyboardBacklight *)self setBrightness:COERCE_DOUBLE((unint64_t)LODWORD(v6))];
}

- (void)updateAmbientOffset
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v48 = self;
  SEL v47 = a2;
  [(KeyboardBacklight *)self levelPercentage];
  if (v2 < 0.0)
  {
    uint64_t v46 = 0;
    float v32 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    uint64_t v46 = v32;
    char v45 = 16;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      log = v46;
      os_log_type_t type = v45;
      __os_log_helper_16_0_0(v44);
      _os_log_error_impl(&dword_1BA438000, log, type, "ASSERTION FAILED: self.levelPercentage >= 0.0", v44, 2u);
    }
  }
  [(KeyboardBacklight *)v48 levelPercentage];
  if (v3 > 1.0)
  {
    char v43 = 0;
    os_log_t v29 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    char v43 = v29;
    char v42 = 16;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      float v27 = v43;
      os_log_type_t v28 = v42;
      __os_log_helper_16_0_0(v41);
      _os_log_error_impl(&dword_1BA438000, v27, v28, "ASSERTION FAILED: self.levelPercentage <= 1.0", v41, 2u);
    }
  }
  [(KeyboardBacklight *)v48 levelPercentage];
  if (v4 >= 0.0)
  {
    [(KeyboardBacklight *)v48 levelPercentage];
    if (v5 <= 1.0
      && ![(KeyboardBacklight *)v48 saturated]
      && [(KeyboardBacklight *)v48 autoAdjust])
    {
      [(KeyboardBacklight *)v48 currentLuxToAmbient];
      float v40 = v6;
      if (v6 < 0.0)
      {
        uint64_t v39 = 0;
        float v26 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
        uint64_t v39 = v26;
        char v38 = 16;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          float v24 = v39;
          os_log_type_t v25 = v38;
          __os_log_helper_16_0_0(v37);
          _os_log_error_impl(&dword_1BA438000, v24, v25, "ASSERTION FAILED: ambient >= 0.0F", v37, 2u);
        }
      }
      if (v40 > 1.0)
      {
        uint64_t v36 = 0;
        float v23 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
        uint64_t v36 = v23;
        char v35 = 16;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          os_log_t v21 = v36;
          os_log_type_t v22 = v35;
          __os_log_helper_16_0_0(v34);
          _os_log_error_impl(&dword_1BA438000, v21, v22, "ASSERTION FAILED: ambient <= 1.0F", v34, 2u);
        }
      }
      if (v40 >= 0.0 && v40 <= 1.0)
      {
        [(KeyboardBacklight *)v48 levelPercentage];
        float v20 = v7;
        [(KeyboardBacklight *)v48 ambientSlope];
        float v33 = v20 - (float)(v8 * v40);
        if (v48->super._logHandle)
        {
          logHandle = v48->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t inited = init_default_corebrightness_log();
          }
          logHandle = inited;
        }
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
        {
          *(double *)&uint64_t v16 = v40;
          [(KeyboardBacklight *)v48 levelPercentage];
          *(double *)&uint64_t v17 = v9;
          [(KeyboardBacklight *)v48 ambientOffset];
          __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v50, v16, v17, COERCE__INT64(v10), COERCE__INT64(v33));
          _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "keyboard offset changed: ambient = %1.5f, pwmPercentage = %1.5f, ambientOffset %1.5f, newOffset %1.5f", v50, 0x2Au);
        }
        [(KeyboardBacklight *)v48 ambientOffset];
        double v12 = fabs((float)(v11 - v33));
        if (v12 > 0.001)
        {
          *(float *)&double v12 = v33;
          [(KeyboardBacklight *)v48 setAmbientOffset:v12];
          if (v48->super._logHandle)
          {
            uint64_t v15 = v48->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v14 = init_default_corebrightness_log();
            }
            uint64_t v15 = v14;
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            [(KeyboardBacklight *)v48 ambientOffset];
            __os_log_helper_16_0_1_8_0((uint64_t)v49, COERCE__INT64(v13));
            _os_log_debug_impl(&dword_1BA438000, v15, OS_LOG_TYPE_DEBUG, "New ambientOffset %f", v49, 0xCu);
          }
          [(KeyboardBacklight *)v48 ambientOffset];
          +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", @"KeyboardBacklightUserOffset");
        }
      }
    }
  }
}

- (float)level
{
  if ([(KeyboardBacklight *)self suppressed] || [(KeyboardBacklight *)self saturated])
  {
    [(KeyboardBacklight *)self levelOff];
    return v2;
  }
  else
  {
    [(KeyboardBacklight *)self levelMax];
    float v12 = v3;
    [(KeyboardBacklight *)self levelMin];
    float v14 = v12 - v4;
    [(KeyboardBacklight *)self levelPercentage];
    float v13 = v5;
    [(KeyboardBacklight *)self levelMin];
    float v15 = (float)(int)rintf(v6 + (float)(v14 * v13));
    [(KeyboardBacklight *)self levelMin];
    if (v15 >= v7) {
      float v11 = v15;
    }
    else {
      float v11 = v7;
    }
    [(KeyboardBacklight *)self levelMax];
    if (v11 >= v8) {
      return v8;
    }
    else {
      return v11;
    }
  }
}

- (BOOL)supportsAuthentication
{
  return self->_enableAuthenticationElement != 0;
}

- (void)getCurrentLux
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  float v6 = 0;
  if ([(NSMutableArray *)self->_alsServiceClients count])
  {
    [(NSMutableArray *)self->_alsServiceClients objectAtIndex:0];
    float v6 = (const void *)IOHIDServiceClientCopyEvent();
  }
  if (v6)
  {
    IOHIDEventGetFloatValue();
    *(float *)&double v2 = v2;
    [(KeyboardBacklight *)self setCurrentLux:v2];
    CFRelease(v6);
  }
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    [(KeyboardBacklight *)self currentLux];
    __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(v3));
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "currentLux %f", v8, 0xCu);
  }
}

- (float)maxUserLevel
{
  [(KeyboardBacklight *)self levelMax];
  return result;
}

- (void)handleLuxUpdate:(float)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  os_log_t v29 = self;
  SEL v28 = a2;
  float v27 = a3;
  if (a3 < 0.0)
  {
    float v26 = 0;
    os_log_t v21 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    float v26 = v21;
    char v25 = 16;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      log = v26;
      os_log_type_t type = v25;
      __os_log_helper_16_0_0(v24);
      _os_log_error_impl(&dword_1BA438000, log, type, "ASSERTION FAILED: lux >= 0.0F", v24, 2u);
    }
  }
  if (v29->super._logHandle)
  {
    logHandle = v29->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v31, COERCE__INT64(v27));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Lux=%f", v31, 0xCu);
  }
  *(float *)&double v3 = v27;
  [(KeyboardBacklight *)v29 setCurrentLux:v3];
  if (![(KeyboardBacklight *)v29 suspend])
  {
    char v23 = 1;
    [(KeyboardBacklight *)v29 currentLuxToAmbient];
    float v22 = v4;
    float v16 = v4;
    [(KeyboardBacklight *)v29 ambientHighThreshold];
    float v6 = v5;
    *(float *)&double v7 = v16;
    -[KeyboardBacklight setManualAdjust:](v29, "setManualAdjust:", v16 <= v6, v7);
    if ([(KeyboardBacklight *)v29 saturated]
      && ([(KeyboardBacklight *)v29 ambientLowThreshold],
          float v8 = *(float *)&v9,
          *(float *)&double v9 = v22,
          v22 < v8))
    {
      -[KeyboardBacklight setSaturated:](v29, "setSaturated:", 0, v9);
    }
    else if ([(KeyboardBacklight *)v29 saturated] {
           || ([(KeyboardBacklight *)v29 ambientHighThreshold],
    }
               float v10 = *(float *)&v11,
               *(float *)&double v11 = v22,
               v22 <= v10))
    {
      if ([(KeyboardBacklight *)v29 suppressed] || [(KeyboardBacklight *)v29 saturated]) {
        char v23 = 0;
      }
    }
    else
    {
      -[KeyboardBacklight setSaturated:](v29, "setSaturated:", 1, v11);
    }
    [(KeyboardBacklight *)v29 levelPercentage];
    if (v12 > 0.0
      && [(KeyboardBacklight *)v29 autoAdjust]
      && ![(KeyboardBacklight *)v29 suspend]
      && (v23 & 1) != 0)
    {
      *(float *)&double v13 = v22;
      [(KeyboardBacklight *)v29 calculateLevelPercentageAtAmbient:v13];
      [(KeyboardBacklight *)v29 updateBacklightDeviceWithReason:3];
    }
    if (v29->super._logHandle)
    {
      float v15 = v29->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v14 = init_default_corebrightness_log();
      }
      float v15 = v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v29);
      _os_log_debug_impl(&dword_1BA438000, v15, OS_LOG_TYPE_DEBUG, "%@", v30, 0xCu);
    }
  }
}

- (float)currentLuxToAmbient
{
  float v14 = 1.0;
  [(KeyboardBacklight *)self currentLux];
  if (v2 > 0.0)
  {
    [(KeyboardBacklight *)self currentLux];
    if (v3 < 300.0)
    {
      for (unsigned int i = 0; i < 9; ++i)
      {
        [(KeyboardBacklight *)self currentLux];
        if (v4 <= *((float *)&currentLuxToAmbient_luxTransferCurve + 2 * (int)i))
        {
          float v12 = *((float *)&currentLuxToAmbient_luxTransferCurve + 2 * (int)(i - 1));
          float v11 = *((float *)&currentLuxToAmbient_luxTransferCurve + 2 * (int)i);
          float v10 = *((float *)&currentLuxToAmbient_luxTransferCurve + 2 * (int)(i - 1) + 1);
          float v9 = *((float *)&currentLuxToAmbient_luxTransferCurve + 2 * (int)i + 1);
          [(KeyboardBacklight *)self currentLux];
          float v14 = v10 + (float)((float)((float)(v5 - v12) / (float)(v11 - v12)) * (float)(v9 - v10));
          break;
        }
      }
    }
    else
    {
      float v14 = 1.0;
    }
  }
  else
  {
    float v14 = 0.0;
  }
  if (v14 >= 1.0) {
    float v8 = 1.0;
  }
  else {
    float v8 = v14;
  }
  if (v8 <= 0.0) {
    return 0.0;
  }
  else {
    return v8;
  }
}

- (void)calculateLevelPercentageAtAmbient:(float)a3
{
  float v27 = self;
  SEL v26 = a2;
  float v25 = a3;
  if (a3 < 0.0)
  {
    float v24 = 0;
    os_log_type_t v18 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    float v24 = v18;
    char v23 = 16;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      log = v24;
      os_log_type_t type = v23;
      __os_log_helper_16_0_0(v22);
      _os_log_error_impl(&dword_1BA438000, log, type, "ASSERTION FAILED: ambient >= 0.0", v22, 2u);
    }
  }
  if (v25 > 1.0)
  {
    os_log_t v21 = 0;
    float v15 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    os_log_t v21 = v15;
    char v20 = 16;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      double v13 = v21;
      os_log_type_t v14 = v20;
      __os_log_helper_16_0_0(v19);
      _os_log_error_impl(&dword_1BA438000, v13, v14, "ASSERTION FAILED: ambient <= 1.0", v19, 2u);
    }
  }
  [(KeyboardBacklight *)v27 setLevelPercentage:COERCE_DOUBLE(981668463)];
  if (v25 >= 0.0 && v25 <= 1.0)
  {
    double v3 = v25;
    if (v25 == 0.0)
    {
      float v12 = 0.001;
    }
    else
    {
      [(KeyboardBacklight *)v27 ambientSlope];
      float v12 = *(float *)&v3 * v25;
    }
    *(float *)&double v3 = v12;
    [(KeyboardBacklight *)v27 setLevelPercentage:v3];
    float v11 = v27;
    [(KeyboardBacklight *)v27 ambientOffset];
    float v10 = v4;
    [(KeyboardBacklight *)v11 levelPercentage];
    *(float *)&double v6 = v5 + v10;
    [(KeyboardBacklight *)v11 setLevelPercentage:v6];
    [(KeyboardBacklight *)v27 levelPercentage];
    if (*(float *)&v7 <= 1.0) {
      float v9 = *(float *)&v7;
    }
    else {
      float v9 = 1.0;
    }
    if (v9 <= 0.001) {
      int v8 = 981668463;
    }
    else {
      int v8 = LODWORD(v9);
    }
    LODWORD(v7) = v8;
    [(KeyboardBacklight *)v27 setLevelPercentage:v7];
  }
}

- (void)resetKeyDimTimeout
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  os_log_t v29 = self;
  SEL v28 = a2;
  if ([(KeyboardBacklight *)self dimTime] <= 0)
  {
    if (v29->_activityNotificationHandle)
    {
      IOPMUnregisterNotification();
      v29->_activityNotificationHandle = 0;
    }
    os_log_type_t v14 = 0;
    if (v29->super._logHandle)
    {
      logHandle = v29->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    os_log_type_t v14 = logHandle;
    char v13 = 1;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      float v2 = v14;
      os_log_type_t v3 = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_impl(&dword_1BA438000, v2, v3, "Idle dim time for keyboard backlight has been turned off", v12, 2u);
    }
  }
  else if (v29->_activityNotificationHandle)
  {
    [(KeyboardBacklight *)v29 dimTime];
    if (IOPMSetUserActivityIdleTimeout())
    {
      os_log_t v26 = 0;
      if (v29->super._logHandle)
      {
        float v11 = v29->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v10 = init_default_corebrightness_log();
        }
        float v11 = v10;
      }
      os_log_t v26 = v11;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v32, [(KeyboardBacklight *)v29 dimTime]);
        _os_log_error_impl(&dword_1BA438000, v26, v25, "Failed to set idle dim time to %d sec", v32, 8u);
      }
    }
    else
    {
      os_log_t v24 = 0;
      if (v29->super._logHandle)
      {
        float v9 = v29->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v8 = init_default_corebrightness_log();
        }
        float v9 = v8;
      }
      os_log_t v24 = v9;
      os_log_type_t v23 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v31, [(KeyboardBacklight *)v29 dimTime]);
        _os_log_impl(&dword_1BA438000, v24, v23, "Idle dim time for keyboard backlight has been changed to %d sec", v31, 8u);
      }
    }
  }
  else
  {
    [(KeyboardBacklight *)v29 dimTime];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    int v18 = -1073741824;
    int v19 = 0;
    char v20 = __39__KeyboardBacklight_resetKeyDimTimeout__block_invoke;
    os_log_t v21 = &unk_1E621A190;
    float v22 = v29;
    v29->_activityNotificationHandle = IOPMScheduleUserActivityLevelNotificationWithTimeout();
    os_log_t v16 = 0;
    if (v29->super._logHandle)
    {
      double v7 = v29->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v6 = init_default_corebrightness_log();
      }
      double v7 = v6;
    }
    os_log_t v16 = v7;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v30, [(KeyboardBacklight *)v29 dimTime]);
      _os_log_impl(&dword_1BA438000, v16, v15, "Idle dim time for keyboard backlight has been set to %d sec", v30, 8u);
    }
  }
}

uint64_t __39__KeyboardBacklight_resetKeyDimTimeout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePMUserActivityStateChanged:", a2, a1, a3, a2, a1);
}

- (void)handlePMUserActivityStateChanged:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v8 = (a3 & 1) != 0;
  if (a3)
  {
    [(KeyboardBacklight *)self endKeyDim];
  }
  else
  {
    [(KeyboardBacklight *)self setDimmed:1];
    id v7 = (id)[objc_alloc(NSNumber) initWithBool:1];
    [(KeyboardBacklight *)self sendNotificationForKey:@"KeyboardBacklightIdleDimActive" withValue:v7];

    [(KeyboardBacklight *)self updateBacklightDeviceWithReason:2];
  }
  id v6 = (id)IOPMCopyUserActivityLevelDescription();
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      os_log_type_t v3 = "";
    }
    else {
      os_log_type_t v3 = "in";
    }
    __os_log_helper_16_2_3_8_32_8_66_8_0((uint64_t)v11, (uint64_t)v3, (uint64_t)v6, a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "User became %sactive (%{public}@ | Activity level = %llu)", v11, 0x20u);
  }
}

- (void)endKeyDim
{
  float v11 = self;
  SEL v10 = a2;
  if (self->_dimmed && ![(KeyboardBacklight *)v11 suspend])
  {
    float v9 = 0;
    if (v11->super._logHandle)
    {
      logHandle = v11->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    float v9 = logHandle;
    char v8 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log = v9;
      os_log_type_t type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_debug_impl(&dword_1BA438000, log, type, "End keyboard backlight dimming", v7, 2u);
    }
    id v6 = (void *)[objc_alloc(NSNumber) initWithBool:0];
    [(KeyboardBacklight *)v11 sendNotificationForKey:@"KeyboardBacklightIdleDimActive" withValue:v6];

    [(KeyboardBacklight *)v11 setDimmed:0];
    if ([(KeyboardBacklight *)v11 manualAdjust]) {
      [(KeyboardBacklight *)v11 setSaturated:0];
    }
    if ([(KeyboardBacklight *)v11 autoAdjust]) {
      [(KeyboardBacklight *)v11 forceLuxUpdate];
    }
    else {
      [(KeyboardBacklight *)v11 updateBacklightDeviceWithReason:2];
    }
  }
}

- (void)forceLuxUpdate
{
  os_log_t v24 = self;
  SEL v23 = a2;
  float v22 = 0;
  if (self->super._logHandle)
  {
    logHandle = v24->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  float v22 = logHandle;
  char v21 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v22;
    os_log_type_t type = v21;
    __os_log_helper_16_0_0(v20);
    _os_log_debug_impl(&dword_1BA438000, log, type, "ForceLuxUpdate", v20, 2u);
  }
  uint64_t v19 = 25;
  uint64_t v18 = 200;
  if (v24->_forceLuxUpdateTimer)
  {
    source = v24->_forceLuxUpdateTimer;
    dispatch_time_t v2 = dispatch_time(0, 25000000);
    dispatch_source_set_timer(source, v2, 0xFFFFFFFFFFFFFFFFLL, 0xC8uLL);
  }
  else
  {
    dispatch_source_t v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v24->super._queue);
    v24->_forceLuxUpdateTimer = (OS_dispatch_source *)v3;
    if (v24->_forceLuxUpdateTimer)
    {
      forceLuxUpdateTimer = v24->_forceLuxUpdateTimer;
      uint64_t handler = MEMORY[0x1E4F143A8];
      int v13 = -1073741824;
      int v14 = 0;
      os_log_type_t v15 = __35__KeyboardBacklight_forceLuxUpdate__block_invoke;
      os_log_t v16 = &unk_1E6218FE0;
      uint64_t v17 = v24;
      dispatch_source_set_event_handler(forceLuxUpdateTimer, &handler);
      id v6 = v24->_forceLuxUpdateTimer;
      dispatch_time_t v5 = dispatch_time(0, 25000000);
      dispatch_source_set_timer(v6, v5, 0xFFFFFFFFFFFFFFFFLL, 0xC8uLL);
      dispatch_resume((dispatch_object_t)v24->_forceLuxUpdateTimer);
    }
  }
}

uint64_t __35__KeyboardBacklight_forceLuxUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forceLuxUpdateRoutine", a1, a1);
}

- (void)forceLuxUpdateRoutine
{
  self->_forceLuxUpdateTimer = 0;
}

- (void)scheduleBacklightUpdate:(int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v21 = self;
  SEL v20 = a2;
  int turnOnBacklightDelayMS = a3;
  uint64_t v18 = 200;
  if (self->_forceDelayToTurnOnBacklight && turnOnBacklightDelayMS < v21->_turnOnBacklightDelayMS) {
    int turnOnBacklightDelayMS = v21->_turnOnBacklightDelayMS;
  }
  os_log_t v17 = 0;
  if (v21->super._logHandle)
  {
    logHandle = v21->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  os_log_t v17 = logHandle;
  os_log_type_t v16 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v22, turnOnBacklightDelayMS);
    _os_log_impl(&dword_1BA438000, v17, v16, "Schedule keyboard backlight update in %d ms", v22, 8u);
  }
  if (v21->_backlightUpdateTimer)
  {
    source = v21->_backlightUpdateTimer;
    dispatch_time_t v3 = dispatch_time(0, 1000000 * turnOnBacklightDelayMS);
    dispatch_source_set_timer(source, v3, 0xFFFFFFFFFFFFFFFFLL, 0xC8uLL);
  }
  else
  {
    v21->_backlightUpdateTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v21->super._queue);
    if (v21->_backlightUpdateTimer)
    {
      backlightUpdateTimer = v21->_backlightUpdateTimer;
      uint64_t handler = MEMORY[0x1E4F143A8];
      int v11 = -1073741824;
      int v12 = 0;
      int v13 = __45__KeyboardBacklight_scheduleBacklightUpdate___block_invoke;
      int v14 = &unk_1E6218FE0;
      os_log_type_t v15 = v21;
      dispatch_source_set_event_handler(backlightUpdateTimer, &handler);
      id v6 = v21->_backlightUpdateTimer;
      dispatch_time_t v5 = dispatch_time(0, 1000000 * turnOnBacklightDelayMS);
      dispatch_source_set_timer(v6, v5, 0xFFFFFFFFFFFFFFFFLL, 0xC8uLL);
      dispatch_resume((dispatch_object_t)v21->_backlightUpdateTimer);
    }
  }
  v21->_forceDelayToTurnOnBacklight = 0;
}

uint64_t __45__KeyboardBacklight_scheduleBacklightUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forceBacklightUpdateRoutine", a1, a1);
}

- (void)forceBacklightUpdateRoutine
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_log_t v17 = self;
  SEL v16 = a2;
  [(NSLock *)self->_backlightUpdateLock lock];
  id v15 = 0;
  id v15 = (id)[(NSMutableArray *)v17->_elements copy];
  v17->_backlightUpdateInProgress = 0;
  dispatch_source_cancel((dispatch_source_t)v17->_backlightUpdateTimer);
  dispatch_release((dispatch_object_t)v17->_backlightUpdateTimer);
  v17->_backlightUpdateTimer = 0;
  v17->_lastBacklightUpdate = mach_absolute_time();
  [(KeyboardBacklight *)v17 brightness];
  int v14 = v2;
  [(KeyboardBacklight *)v17 level];
  int v13 = v3;
  [(NSLock *)v17->_backlightUpdateLock unlock];
  if ([v15 count])
  {
    os_log_t v12 = 0;
    if (v17->super._logHandle)
    {
      logHandle = v17->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    os_log_t v12 = logHandle;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      os_log_t log = v12;
      __os_log_helper_16_2_1_8_64((uint64_t)v18, (uint64_t)v15);
      _os_log_impl(&dword_1BA438000, v12, v11, "Commit elements %@", v18, 0xCu);
    }
    uint64_t v10 = 0;
    char v4 = -[HIDDevice commitElements:direction:error:](v17->_device, "commitElements:direction:error:", v15, 1, &v10, log);
    LODWORD(v5) = v13;
    LODWORD(v6) = v14;
    [(KeyboardBacklight *)v17 didUpdateBacklightLevel:v4 & 1 brightness:v10 result:v5 error:v6];
  }
}

- (id)copyPropertyForKey:(id)a3
{
  id v8 = 0;
  if ([a3 isEqualToString:@"KeyboardBacklightBrightness"])
  {
    id v7 = objc_alloc(NSNumber);
    [(KeyboardBacklight *)self brightness];
    id v8 = (id)objc_msgSend(v7, "initWithFloat:");
  }
  else if ([a3 isEqualToString:@"KeyboardBacklightLevel"])
  {
    id v6 = objc_alloc(NSNumber);
    [(KeyboardBacklight *)self previousLevel];
    id v8 = (id)objc_msgSend(v6, "initWithFloat:");
  }
  else if ([a3 isEqualToString:@"KeyboardBacklightSaturated"])
  {
    id v8 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[KeyboardBacklight saturated](self, "saturated"));
  }
  else if ([a3 isEqualToString:@"KeyboardBacklightSuppressed"])
  {
    id v8 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[KeyboardBacklight suppressed](self, "suppressed"));
  }
  else if ([a3 isEqualToString:@"KeyboardBacklightABSuspend"])
  {
    id v8 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[KeyboardBacklight suspend](self, "suspend"));
  }
  else if ([a3 isEqualToString:@"KeyboardBacklightABEnabled"])
  {
    id v8 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[KeyboardBacklight autoAdjust](self, "autoAdjust"));
  }
  else if ([a3 isEqualToString:@"KeyboardBacklightIdleDimTime"])
  {
    id v5 = objc_alloc(NSNumber);
    *(float *)&double v3 = (float)[(KeyboardBacklight *)self dimTime];
    id v8 = (id)[v5 initWithFloat:v3];
  }
  else if ([a3 isEqualToString:@"KeyboardBacklightIdleDimActive"])
  {
    id v8 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[KeyboardBacklight dimmed](self, "dimmed"));
  }
  else if ([a3 isEqualToString:@"KeyboardBacklightSuspendDimming"])
  {
    id v8 = (id)[objc_alloc(NSNumber) initWithBool:self->_suspendDimming];
  }
  else if ([a3 isEqualToString:@"KeyboardBacklightBuiltIn"])
  {
    id v8 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[KeyboardBacklight builtIn](self, "builtIn"));
  }
  else if ([a3 isEqualToString:@"KeyboardBacklightUpdateFrequency"])
  {
    id v8 = (id)[objc_alloc(NSNumber) initWithInt:self->_backlightUpdateFrequency];
  }
  else if ([a3 isEqualToString:@"CBUserAuthentication"])
  {
    if ([(KeyboardBacklight *)self supportsAuthentication]
      && self->_enableAuthenticationElement)
    {
      id v8 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[HIDElement integerValue](self->_enableAuthenticationElement, "integerValue") != 0);
    }
  }
  else
  {
    id v8 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", a3), "copy");
  }
  if (!v8) {
    id v8 = +[CBKeyboardPreferencesManager copyPreferenceForKey:a3];
  }
  if (!v8) {
    return +[CBKeyboardPreferencesManager copyPreferenceForKey:a3 keyboardID:[(KeyboardBacklight *)self keyboardID]];
  }
  return v8;
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v8 = 0;
  if ([a4 isEqualToString:@"KeyboardBacklightBrightness"])
  {
    char v8 = [(KeyboardBacklight *)self KBBrightnessPropertyHandler:a3];
  }
  else if ([a4 isEqualToString:@"KeyboardBacklightLevel"])
  {
    char v8 = [(KeyboardBacklight *)self KBBacklightLevelPropertyHandler:a3];
  }
  else if ([a4 isEqualToString:@"KeyboardBacklightABSuspend"])
  {
    char v8 = [(KeyboardBacklight *)self KBAutoBrightnessSuspendPropertyHandler:a3];
  }
  else if ([a4 isEqualToString:@"KeyboardBacklightABEnabled"])
  {
    char v8 = [(KeyboardBacklight *)self KBAutoBrightnessEnablePropertyHandler:a3];
  }
  else if ([a4 isEqualToString:@"KeyboardBacklightIdleDimActive"])
  {
    char v8 = [(KeyboardBacklight *)self KBIdleDimPropertyHandler:a3];
  }
  else if ([a4 isEqualToString:@"KeyboardBacklightIdleDimTime"])
  {
    char v8 = [(KeyboardBacklight *)self KBIdleDimTimeHandler:a3];
  }
  else if ([a4 isEqualToString:@"KeyboardBacklightSuspendDimming"])
  {
    char v8 = [(KeyboardBacklight *)self KBSuspendDimmingPropertyHandler:a3];
  }
  else if ([a4 isEqualToString:@"CBUserActivityUpdate"])
  {
    char v8 = [(KeyboardBacklight *)self KBUserActivityUpdateHandler:a3];
  }
  else if (([a4 isEqual:@"DisplayBrightnessFactor"] & 1) != 0 {
         || ([a4 isEqual:@"DisplayBrightnessFactorWithFade"] & 1) != 0)
  }
  {
    char v8 = [(KeyboardBacklight *)self KBDisplayBrightnessFactorPropertyHandler:a3];
  }
  else if ([a4 isEqualToString:@"KeyboardBacklightUserOffset"])
  {
    char v8 = [(KeyboardBacklight *)self KBUserOffsetPropertyHandler:a3];
  }
  else if ([a4 isEqualToString:@"KeyboardBacklightUpdateFrequency"])
  {
    char v8 = [(KeyboardBacklight *)self KBUpdateFrequencyHandler:a3];
  }
  else if ([a4 isEqualToString:@"TrustedFrontLux"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->super._logHandle)
      {
        logHandle = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        logHandle = inited;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        [a3 floatValue];
        __os_log_helper_16_0_1_8_0((uint64_t)v12, COERCE__INT64(v4));
        _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "TrustedFrontLux from AABC = %f", v12, 0xCu);
      }
      [a3 floatValue];
      -[KeyboardBacklight handleLuxUpdate:](self, "handleLuxUpdate:");
      char v8 = 1;
    }
  }
  else if ([a4 isEqualToString:@"ClamshellUpdate"])
  {
    char v8 = [(KeyboardBacklight *)self KBClamshellUpdateHandler:a3];
  }
  else if ([a4 isEqualToString:@"CBUserAuthentication"])
  {
    char v8 = [(KeyboardBacklight *)self KBAuthenticationHandler:a3];
  }
  return v8 & 1;
}

- (BOOL)KBDisplayBrightnessFactorPropertyHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v12 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = (id)[a3 objectForKey:@"DisplayBrightnessFactor"];
  }
  else {
    id v11 = a3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v12 = 1;
    [v11 floatValue];
    float v10 = v3;
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v15, COERCE__INT64(v10));
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "KB: Brightness factor update = %f", v15, 0xCu);
    }
    BOOL displayOn = self->_displayOn;
    double v4 = v10;
    self->_BOOL displayOn = v10 > 0.0;
    if (self->_displayOn != displayOn)
    {
      if (self->_displayOn) {
        self->_forceDelayToTurnOnBacklight = 1;
      }
      id v8 = (id)[objc_alloc(NSNumber) initWithBool:self->_displayOn];
      [(KeyboardBacklight *)self KBUserActivityUpdateHandler:v8];
    }
    [(NSMutableDictionary *)self->_properties setObject:v11, @"DisplayBrightnessFactor", v4 forKey];
  }
  return v12 & 1;
}

- (BOOL)KBAutoBrightnessSuspendPropertyHandler:(id)a3
{
  BOOL v4 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[KeyboardBacklight setSuspend:](self, "setSuspend:", [a3 BOOLValue] & 1);
    return 1;
  }
  return v4;
}

- (BOOL)KBAutoBrightnessEnablePropertyHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v7 = 0;
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v10, (uint64_t)a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Set Keyboard Auto Brightness = %{public}@", v10, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[CBKeyboardPreferencesManager setBoolPreference:forKey:](CBKeyboardPreferencesManager, "setBoolPreference:forKey:", [a3 BOOLValue] & 1, @"KeyboardBacklightABEnabled");
    int v4 = [(KeyboardBacklight *)self autoAdjust];
    if (v4 != ([a3 BOOLValue] & 1))
    {
      -[KeyboardBacklight setAutoAdjust:](self, "setAutoAdjust:", [a3 BOOLValue] & 1);
      if ([(KeyboardBacklight *)self autoAdjust])
      {
        [(KeyboardBacklight *)self updateAmbientOffset];
        [(KeyboardBacklight *)self forceLuxUpdate];
      }
      else
      {
        [(KeyboardBacklight *)self levelPercentage];
        +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", @"KeyboardBacklightManualBrightness");
        [(KeyboardBacklight *)self setSaturated:0];
        [(KeyboardBacklight *)self setManualAdjust:1];
      }
      [(KeyboardBacklight *)self sendNotificationForKey:@"KeyboardBacklightABEnabled" withValue:a3];
      [(KeyboardBacklight *)self updateBacklightDeviceWithReason:3];
    }
    char v7 = 1;
  }
  return v7 & 1;
}

- (BOOL)KBBrightnessPropertyHandler:(id)a3
{
  BOOL v12 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 floatValue];
    -[KeyboardBacklight setBrightness:](self, "setBrightness:");
    return 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = (void *)[a3 objectForKey:@"Brightness"];
      float v10 = (void *)[a3 objectForKey:@"FadeSpeed"];
      float v9 = (void *)[a3 objectForKey:@"Commit"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (([v9 BOOLValue] & 1) == 0 && !-[KeyboardBacklight suspend](self, "suspend")) {
              [(KeyboardBacklight *)self setSuspend:1];
            }
            [v11 floatValue];
            int v7 = v3;
            unsigned int v8 = [v10 intValue];
            char v4 = [v9 BOOLValue];
            LODWORD(v5) = v7;
            [(KeyboardBacklight *)self setBrightness:v8 withFadeSpeed:v4 & 1 commit:v5];
            if (([v9 BOOLValue] & 1) != 0 && -[KeyboardBacklight suspend](self, "suspend")) {
              [(KeyboardBacklight *)self setSuspend:0];
            }
          }
        }
      }
    }
  }
  return v12;
}

- (BOOL)KBBacklightLevelPropertyHandler:(id)a3
{
  BOOL v4 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 floatValue];
    -[KeyboardBacklight setBacklightLevel:](self, "setBacklightLevel:");
    return 1;
  }
  return v4;
}

- (BOOL)KBIdleDimPropertyHandler:(id)a3
{
  BOOL v4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([a3 BOOLValue] & 1) == 0)
  {
    [(KeyboardBacklight *)self endKeyDim];
    return 1;
  }
  return v4;
}

- (BOOL)KBIdleDimTimeHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v8 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = [(KeyboardBacklight *)self dimTime];
    if (v6 != [a3 intValue])
    {
      +[CBKeyboardPreferencesManager setIntPreference:forKey:](CBKeyboardPreferencesManager, "setIntPreference:forKey:", [a3 intValue], @"KeyboardBacklightIdleDimTime");
      -[KeyboardBacklight setDimTime:](self, "setDimTime:", [a3 intValue]);
      if (self->_dimmed && ![(KeyboardBacklight *)self dimTime]) {
        [(KeyboardBacklight *)self setDimmed:0];
      }
      [(KeyboardBacklight *)self resetKeyDimTimeout];
      int v7 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", -[KeyboardBacklight dimTime](self, "dimTime"));
      [(KeyboardBacklight *)self sendNotificationForKey:@"KeyboardBacklightIdleDimTime" withValue:v7];

      if (self->super._logHandle)
      {
        logHandle = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        logHandle = inited;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v11, [(KeyboardBacklight *)self dimTime]);
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Dim time changed to %d sec", v11, 8u);
      }
      [(KeyboardBacklight *)self updateBacklightDeviceWithReason:2];
    }
    char v8 = 1;
  }
  return v8 & 1;
}

- (BOOL)KBSuspendDimmingPropertyHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v8, [a3 BOOLValue] & 1);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Suspend dimming = %d", v8, 8u);
    }
    self->_suspendDimming = [a3 BOOLValue] & 1;
    [(KeyboardBacklight *)self updateBacklightDeviceWithReason:8];
  }
  return 0;
}

- (BOOL)KBUserActivityUpdateHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v6 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[KeyboardBacklight setUserActive:](self, "setUserActive:", [a3 BOOLValue] & 1);
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v9, [(KeyboardBacklight *)self userActive]);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "user active = %d", v9, 8u);
    }
    if ([(KeyboardBacklight *)self userActive] && [(KeyboardBacklight *)self autoAdjust]) {
      [(KeyboardBacklight *)self forceLuxUpdate];
    }
    else {
      [(KeyboardBacklight *)self updateBacklightDeviceWithReason:2];
    }
    char v6 = 1;
  }
  return v6 & 1;
}

- (BOOL)KBAvailabilityUpdateHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v6 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[KeyboardBacklight setKeyboardAvailable:](self, "setKeyboardAvailable:", [a3 BOOLValue] & 1);
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v9, [(KeyboardBacklight *)self keyboardAvailable]);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "HW keyboard availability = %d", v9, 8u);
    }
    if ([(KeyboardBacklight *)self keyboardAvailable]
      && [(KeyboardBacklight *)self autoAdjust])
    {
      [(KeyboardBacklight *)self forceLuxUpdate];
    }
    else
    {
      [(KeyboardBacklight *)self updateBacklightDeviceWithReason:5];
    }
    char v6 = 1;
  }
  return v6 & 1;
}

- (BOOL)KBUserOffsetPropertyHandler:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 floatValue];
    self->_ambientOffset = v3;
    [(KeyboardBacklight *)self ambientOffset];
    +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", @"KeyboardBacklightUserOffset");
    [(KeyboardBacklight *)self forceLuxUpdate];
  }
  return 0;
}

- (BOOL)KBUpdateFrequencyHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v6 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_backlightUpdateFrequency = [a3 intValue];
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v9, [a3 intValue]);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Backlight update frequency = %d", v9, 8u);
    }
    char v6 = 1;
  }
  return v6 & 1;
}

- (BOOL)KBClamshellUpdateHandler:(id)a3
{
  BOOL v4 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[KeyboardBacklight setClamshellClosed:](self, "setClamshellClosed:", [a3 BOOLValue] & 1);
    [(KeyboardBacklight *)self updateBacklightDeviceWithReason:7];
    return 1;
  }
  return v4;
}

- (BOOL)KBAuthenticationHandler:(id)a3
{
  BOOL v4 = 0;
  if ([(KeyboardBacklight *)self supportsAuthentication])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[KeyboardBacklight updateAuthentication:](self, "updateAuthentication:", [a3 BOOLValue] & 1);
      return 1;
    }
  }
  return v4;
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->super._notificationBlock) {
    (*((void (**)(void))self->super._notificationBlock + 2))();
  }
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  BOOL v4 = 0;
  if (a3)
  {
    [(NSMutableArray *)self->_alsServiceClients addObject:a3];
    if ([(KeyboardBacklight *)self autoAdjust]) {
      [(KeyboardBacklight *)self forceLuxUpdate];
    }
    else {
      [(KeyboardBacklight *)self updateBacklightDevice];
    }
    return 1;
  }
  return v4;
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  BOOL v6 = 0;
  if (IOHIDEventGetType() == 12
    && ([(NSMutableArray *)self->_alsServiceClients containsObject:a4] & 1) != 0)
  {
    IOHIDEventGetFloatValue();
    *(float *)&double v4 = v4;
    [(KeyboardBacklight *)self handleLuxUpdate:v4];
    return 1;
  }
  return v6;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v15 = self;
  SEL v14 = a2;
  uint64_t v13 = a3;
  char v12 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = v15->_alsServiceClients;
  uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = 0;
      uint64_t v11 = *(__IOHIDServiceClient **)(__b[1] + 8 * v6);
      if (v11 == v13) {
        char v12 = 1;
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }
  if (v12) {
    [(NSMutableArray *)v15->_alsServiceClients removeObject:v13];
  }
  return v12 & 1;
}

+ (unint64_t)getHashIDForDevice:(id)a3
{
  unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F13F35B0];
  uint64_t v4 = [a3 propertyForKey:@"SerialNumber"];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 appendString:v4];
    }
  }
  uint64_t v5 = (void *)[a3 propertyForKey:@"VendorID"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v7, "appendString:", objc_msgSend(v5, "stringValue"));
    }
  }
  uint64_t v6 = (void *)[a3 propertyForKey:@"ProductID"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v7, "appendString:", objc_msgSend(v6, "stringValue"));
    }
  }
  unint64_t v8 = [v7 hash];

  return v8;
}

- (void)setKBPreferenceBacklightMaxUser
{
  uint64_t v4 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedLongLong:", -[KeyboardBacklight keyboardID](self, "keyboardID"));
  id v2 = objc_alloc(NSNumber);
  [(KeyboardBacklight *)self maxUserLevel];
  float v3 = objc_msgSend(v2, "initWithFloat:");
  [(NSMutableDictionary *)self->_keyboardSpecificPreferences setObject:v3 forKey:@"KeyboardBacklightMaxUser"];
  +[CBKeyboardPreferencesManager setPreference:forKey:](CBKeyboardPreferencesManager, "setPreference:forKey:", self->_keyboardSpecificPreferences, [v4 stringValue]);
}

- (void)getKeyboardBacklightPreferences
{
  uint64_t v19 = self;
  SEL v18 = a2;
  uint64_t v17 = 0;
  if (self->super._logHandle)
  {
    logHandle = v19->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  uint64_t v17 = logHandle;
  char v16 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    os_log_t log = v17;
    os_log_type_t type = v16;
    __os_log_helper_16_0_0(v15);
    _os_log_debug_impl(&dword_1BA438000, log, type, "Get keyboard backlight prefereneces", v15, 2u);
  }
  id v14 = +[CBKeyboardPreferencesManager copyAllPreferences];
  if (v14 && [v14 count])
  {
    float v13 = -1.0;
    if (+[CBKeyboardPreferencesManager getFloatPreference:&v13 forKey:@"KeyboardBacklightPrefVersion"]&& v13 == 1.0)
    {
      +[CBKeyboardPreferencesManager getBoolPreference:&v19->_muted, @"KeyboardBacklightMuted", v13 forKey];
      +[CBKeyboardPreferencesManager getFloatPreference:&v19->_levelPercentage forKey:@"KeyboardBacklightManualBrightness"];
      if ([(KeyboardBacklight *)v19 muted]) {
        [(KeyboardBacklight *)v19 setLevelPercentage:0.0];
      }
      +[CBKeyboardPreferencesManager getBoolPreference:&v19->_autoAdjust forKey:@"KeyboardBacklightABEnabled"];
      +[CBKeyboardPreferencesManager getIntPreference:&v19->_dimTime forKey:@"KeyboardBacklightIdleDimTime"];
      +[CBKeyboardPreferencesManager getFloatPreference:&v19->_ambientOffset forKey:@"KeyboardBacklightUserOffset"];
    }
  }
  else
  {
    char v12 = 0;
    if (v19->super._logHandle)
    {
      uint64_t v5 = v19->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v4 = init_default_corebrightness_log();
      }
      uint64_t v5 = v4;
    }
    char v12 = v5;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v2 = v12;
      os_log_type_t v3 = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_impl(&dword_1BA438000, v2, v3, "Keyboard backlight preferences not present in defaults", v10, 2u);
    }
  }
}

- (void)storeKeyboardBacklightPreferences
{
  +[CBKeyboardPreferencesManager setBoolPreference:[(KeyboardBacklight *)self muted] forKey:@"KeyboardBacklightMuted"];
  [(KeyboardBacklight *)self levelPercentage];
  +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", @"KeyboardBacklightManualBrightness");
  +[CBKeyboardPreferencesManager setBoolPreference:[(KeyboardBacklight *)self autoAdjust] forKey:@"KeyboardBacklightABEnabled"];
  +[CBKeyboardPreferencesManager setIntPreference:[(KeyboardBacklight *)self dimTime] forKey:@"KeyboardBacklightIdleDimTime"];
  [(KeyboardBacklight *)self ambientOffset];
  +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", @"KeyboardBacklightUserOffset");
  LODWORD(v2) = 1.0;
  +[CBKeyboardPreferencesManager setFloatPreference:@"KeyboardBacklightPrefVersion" forKey:v2];
  [(KeyboardBacklight *)self setKBPreferenceBacklightMaxUser];
}

- (void)rampToBrightness:(float)a3 withDuration:(unsigned int)a4
{
  self->_ramp.start = self->_ramp.current;
  self->_ramp.target = a3;
  self->_ramp.duration = (float)a4 / 1000.0;
  self->_ramp.startTime = CFAbsoluteTimeGetCurrent();
  [(KeyboardBacklight *)self startRamp];
}

- (void)startRamp
{
  char v16 = self;
  SEL v15 = a2;
  if (self->_rampTimer || v16->_ramp.current == v16->_ramp.target || v16->_ramp.duration <= 0.0)
  {
    id v14 = 0;
    id v2 = objc_alloc(NSNumber);
    *(float *)&double v3 = v16->_ramp.target;
    id v14 = (id)[v2 initWithFloat:v3];
    [(KeyboardBacklight *)v16 sendNotificationForKey:@"KeyboardBacklightBrightnessSlider" withValue:v14];
  }
  else
  {
    float v13 = 16667000.0;
    dispatch_object_t v12 = 0;
    dispatch_object_t v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v16->super._queue);
    if (v12)
    {
      dispatch_source_set_timer(v12, 0, (unint64_t)v13, 0);
      dispatch_block_t v11 = 0;
      uint64_t block = MEMORY[0x1E4F143A8];
      int v5 = -1073741824;
      int v6 = 0;
      unint64_t v7 = __30__KeyboardBacklight_startRamp__block_invoke;
      unint64_t v8 = &unk_1E62196A0;
      uint64_t v9 = v16;
      dispatch_object_t v10 = v12;
      dispatch_block_t v11 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_USER_INITIATED, 0, &block);
      if (v11)
      {
        dispatch_source_set_event_handler(v12, v11);
        _Block_release(v11);
      }
      v16->_rampTimer = (OS_dispatch_source *)v12;
      dispatch_resume(v12);
    }
  }
}

uint64_t __30__KeyboardBacklight_startRamp__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerRoutine:", *(void *)(a1 + 40), a1, a1);
}

- (void)timerRoutine:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = self;
  SEL v22 = a2;
  id v21 = a3;
  int v20 = 1017370378;
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current >= v23->_ramp.startTime + v23->_ramp.duration + 0.0199999996 || v23->_ramp.current == v23->_ramp.target)
  {
    if (v23->_rampTimer)
    {
      [(KeyboardBacklight *)v23 stopRamp];
      v23->_ramp.current = v23->_ramp.target;
    }
    else
    {
      SEL v18 = 0;
      if (v23->super._logHandle)
      {
        logHandle = v23->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        logHandle = inited;
      }
      SEL v18 = logHandle;
      char v17 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        os_log_t log = v18;
        os_log_type_t type = v17;
        __os_log_helper_16_0_0(v16);
        _os_log_error_impl(&dword_1BA438000, log, type, "Ramp timer null and the ramp is running. This shouldn't happen", v16, 2u);
      }
    }
  }
  else
  {
    float v3 = Current - v23->_ramp.startTime;
    float v4 = (float)((float)(v23->_ramp.target - v23->_ramp.start) * v3) / v23->_ramp.duration + v23->_ramp.start;
    v23->_ramp.current = v4;
    if (v23->_ramp.current <= 0.0) {
      float v10 = 0.0;
    }
    else {
      float v10 = v23->_ramp.current;
    }
    if (v10 >= 1.0) {
      float v9 = 1.0;
    }
    else {
      float v9 = v10;
    }
    v23->_ramp.current = v9;
    if (v23->super._logHandle)
    {
      unint64_t v8 = v23->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v7 = init_default_corebrightness_log();
      }
      unint64_t v8 = v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v24, COERCE__INT64(v23->_ramp.current));
      _os_log_debug_impl(&dword_1BA438000, v8, OS_LOG_TYPE_DEBUG, "Keyboard backlight virtual ramp - current = %f", v24, 0xCu);
    }
    id v5 = objc_alloc(NSNumber);
    *(float *)&double v6 = v23->_ramp.current;
    id v15 = (id)[v5 initWithFloat:v6];
    [(KeyboardBacklight *)v23 sendNotificationForKey:@"KeyboardBacklightBrightnessSlider" withValue:v15];
  }
}

- (void)stopRamp
{
  if (self->_rampTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_rampTimer);
    dispatch_release((dispatch_object_t)self->_rampTimer);
    self->_rampTimer = 0;
  }
}

- (double)timeToNextBacklightUpdate
{
  uint64_t v8 = mach_absolute_time();
  LODWORD(v2) = self->_clockInfo.numer;
  double v4 = (double)v2;
  double v3 = (double)(v8 - self->_lastBacklightUpdate) * v4;
  LODWORD(v4) = self->_clockInfo.denom;
  double v7 = (float)(1000.0 / (float)self->_backlightUpdateFrequency);
  if (v7 > v3 / (double)*(unint64_t *)&v4 / 1000000.0) {
    return v7 - v3 / (double)*(unint64_t *)&v4 / 1000000.0;
  }
  else {
    return 0.0;
  }
}

- (id)brightnessUpdateReasonToString:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v4 = a3;
    char v3 = 1;
  }
  else
  {
    unint64_t v4 = 0;
    char v3 = 0;
  }
  if (v3) {
    return @"Not Specified";
  }
  switch(v4)
  {
    case 0uLL:
      double v6 = @"Unknown";
      break;
    case 1uLL:
      double v6 = @"Set Brightness";
      break;
    case 2uLL:
      double v6 = @"Idle Dim";
      break;
    case 3uLL:
      double v6 = @"ALS Update";
      break;
    case 4uLL:
      double v6 = @"Tear Down";
      break;
    case 5uLL:
      double v6 = @"HW Availability";
      break;
    case 6uLL:
      double v6 = @"Initial Update";
      break;
    case 7uLL:
      double v6 = @"Clamshell Update";
      break;
    case 8uLL:
      double v6 = @"Suspend Dimming";
      break;
    default:
      JUMPOUT(0);
  }
  return v6;
}

- (BOOL)builtIn
{
  return self->_builtIn;
}

- (void)setBuiltIn:(BOOL)a3
{
  self->_builtIn = a3;
}

- (unint64_t)keyboardID
{
  return self->_keyboardID;
}

- (void)setKeyboardID:(unint64_t)a3
{
  self->_keyboardID = a3;
}

- (int)dimTime
{
  return self->_dimTime;
}

- (void)setDimTime:(int)a3
{
  self->_dimTime = a3;
}

- (float)ambientOffset
{
  return self->_ambientOffset;
}

- (void)setAmbientOffset:(float)a3
{
  self->_ambientOffset = a3;
}

- (float)ambientHighThreshold
{
  return self->_ambientHighThreshold;
}

- (float)ambientLowThreshold
{
  return self->_ambientLowThreshold;
}

- (HIDDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  self->_device = (HIDDevice *)a3;
}

- (BOOL)autoAdjust
{
  return self->_autoAdjust;
}

- (void)setAutoAdjust:(BOOL)a3
{
  self->_autoAdjust = a3;
}

- (float)levelPercentage
{
  return self->_levelPercentage;
}

- (void)setLevelPercentage:(float)a3
{
  self->_levelPercentage = a3;
}

- (float)levelMin
{
  return self->_levelMin;
}

- (void)setLevelMin:(float)a3
{
  self->_levelMin = a3;
}

- (float)levelMax
{
  return self->_levelMax;
}

- (void)setLevelMax:(float)a3
{
  self->_levelMax = a3;
}

- (float)levelOff
{
  return self->_levelOff;
}

- (void)setLevelOff:(float)a3
{
  self->_levelOff = a3;
}

- (int)color
{
  return self->_color;
}

- (void)setColor:(int)a3
{
  self->_color = a3;
}

- (unsigned)levelUnit
{
  return self->_levelUnit;
}

- (void)setLevelUnit:(unsigned int)a3
{
  self->_levelUnit = a3;
}

- (unsigned)unitExponent
{
  return self->_unitExponent;
}

- (void)setUnitExponent:(unsigned int)a3
{
  self->_unitExponent = a3;
}

- (float)ambientSlope
{
  return self->_ambientSlope;
}

- (float)currentLux
{
  return self->_currentLux;
}

- (void)setCurrentLux:(float)a3
{
  self->_currentLux = a3;
}

- (BOOL)hysteresisOn
{
  return self->_hysteresisOn;
}

- (void)setHysteresisOn:(BOOL)a3
{
  self->_hysteresisOn = a3;
}

- (NSMutableDictionary)keyboardSpecificPreferences
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 328, 1);
}

- (void)setKeyboardSpecificPreferences:(id)a3
{
}

- (float)previousLevel
{
  return self->_previousLevel;
}

- (void)setPreviousLevel:(float)a3
{
  self->_previousLevel = a3;
}

@end