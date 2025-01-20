@interface BLControl
- (BLControl)init;
- (BOOL)findBacklight;
- (BOOL)findDisplays;
- (BOOL)handleDisplayModeUpdatePropertyHandler:(id)a3;
- (BOOL)initKeyboardBacklightHIDManager;
- (BOOL)setBLControlPropertyWithKey:(id)a3 property:(id)a4;
- (BOOL)setDisplayFactor:(float)a3 transitionLength:(float)a4;
- (BOOL)setPropertyInternalWithKey:(id)a3 property:(id)a4 client:(id)a5;
- (BOOL)setPropertyWithKey:(id)a3 property:(id)a4 client:(id)a5;
- (BOOL)start;
- (BOOL)startHIDSystemClient;
- (BOOL)useSyncBrightnessTransactionForDisplay:(id)a3;
- (id)copyBLControlPropertyWithkey:(id)a3;
- (id)copyDisplayInfo;
- (id)copyDisplayList;
- (id)copyPropertyInternalWithKey:(id)a3 forClient:(id)a4;
- (id)copyPropertyWithKey:(id)a3 client:(id)a4;
- (id)copyStatusInfo;
- (id)newDevicePariMatchingDictionaryWithPage:(unsigned int)a3 andUsage:(unsigned int)a4;
- (void)addDisplayContainer:(id)a3;
- (void)cancelHIDSystemClient;
- (void)dealloc;
- (void)handleCADisplay:(id)a3;
- (void)handleCADisplayArrival:(id)a3;
- (void)handleCADisplayRemoval:(id)a3;
- (void)handleCAWindowServerDisplay:(id)a3;
- (void)handleExternalDisplayChange;
- (void)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (void)handlePresetChange;
- (void)handleUserIsActiveStateChange:(BOOL)a3;
- (void)hidServiceArrival:(__IOHIDServiceClient *)a3;
- (void)keyboardBacklightHIDDeviceArrived:(id)a3;
- (void)keyboardBacklightHIDDeviceRemoved:(id)a3;
- (void)keyboardBacklightHIDDeviceRemovedInternal:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerNotificationBlock:(id)a3;
- (void)releaseDisplayModeCompletionTimer;
- (void)removeDisplayContainer:(id)a3;
- (void)removeHIDService:(__IOHIDServiceClient *)a3;
- (void)scheduleDisplayModeCompletionTimerIn:(float)a3 forDisplayMode:(int64_t)a4;
- (void)sendNotificationFor:(id)a3 withValue:(id)a4;
- (void)sendNotificationWithKeyboardIDs;
- (void)sendSyncNotificationFor:(id)a3 withValue:(id)a4;
- (void)stop;
- (void)stopDisplayLookup;
- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4;
- (void)systemSleepMonitorDidWakeFromSleep:(id)a3;
- (void)systemSleepMonitorWillWakeFromSleep:(id)a3;
- (void)waitForALSArrival;
@end

@implementation BLControl

uint64_t __33__BLControl_handleHIDEvent_from___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A9C8];
  if (result) {
    return [a2 handleHIDEvent:*(void *)(a1 + 32) from:*(void *)(a1 + 40)];
  }
  return result;
}

uint64_t __33__BLControl_startHIDSystemClient__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleHIDEvent:from:", a5, a4, a1, a5, a4, a3, a2, a1);
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  v17 = self;
  SEL v16 = a2;
  v15 = a3;
  v14 = a4;
  if (a4 && v15)
  {
    BOOL v10 = 0;
    if (IOHIDEventGetType() == 12)
    {
      id v9 = [(BLControl *)v17 copyPropertyInternalWithKey:@"ALSIntegrationMode" forClient:0];
      if ([+[CBAODState sharedInstance] isAODActive])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || [v9 intValue] != 2 && objc_msgSend(v9, "intValue") != 1)
        {
          +[CBALSEvent replaceLuxWithFilteredLux:v15];
        }
      }

      if (!v17->_ignoreALSEvents) {
        BOOL v10 = 1;
      }
    }
    else if (IOHIDEventGetType() == 14)
    {
      BOOL v10 = 1;
    }
    else if (IOHIDEventGetType() == 11)
    {
      BOOL v10 = 1;
    }
    else if (IOHIDEventGetType() == 3)
    {
      BOOL v10 = 1;
    }
    else if (IOHIDEventGetType() == 1 && IOHIDEventGetIntegerValue() == 65280)
    {
      BOOL v10 = IOHIDEventGetIntegerValue() == 98;
    }
    if (v10)
    {
      -[NSMutableArray enumerateObjectsUsingBlock:](v17->_displayContainers, "enumerateObjectsUsingBlock:");
      if ([(NSMutableDictionary *)v17->_keyboardContainers count])
      {
        if (IOHIDEventGetType() == 12)
        {
          id v8 = [(BLControl *)v17 copyPropertyInternalWithKey:@"TrustedFrontLux" forClient:0];
          if (v8) {
            -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v17->_keyboardContainers, "enumerateKeysAndObjectsUsingBlock:");
          }
        }
      }
    }
  }
  else
  {
    v13 = 0;
    if (v17->_logHandle)
    {
      logHandle = v17->_logHandle;
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
    v13 = logHandle;
    char v12 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v13;
      os_log_type_t type = v12;
      __os_log_helper_16_0_0(v11);
      _os_log_error_impl(&dword_1BA438000, log, type, "invalid parameters", v11, 2u);
    }
  }
}

- (id)copyPropertyInternalWithKey:(id)a3 forClient:(id)a4
{
  v19 = self;
  SEL v18 = a2;
  id v17 = a3;
  SEL v16 = (__CFString *)a4;
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  int v11 = 1375731712;
  int v12 = 48;
  v13 = __Block_byref_object_copy__15;
  v14 = __Block_byref_object_dispose__15;
  id v15 = 0;
  id v15 = [(BLControl *)self copyBLControlPropertyWithkey:a3];
  if (!v10[5])
  {
    if (v19->_builtInDisplayCount > 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (([v17 isEqual:@"DisplayBrightness"] & 1) != 0
        || ([v17 isEqual:@"DisplayNitsKey"] & 1) != 0
        || ([v17 isEqual:@"BrightnessCLTMMode"] & 1) != 0
        || ([v17 isEqual:@"BrightnessCLTM"] & 1) != 0)
      {
        if (v16) {
          v7 = v16;
        }
        else {
          v7 = @"Server";
        }
        id v8 = (__CFString *)[(NSMutableDictionary *)v19->_clientDisplayMap objectForKey:v7];
        if (!v8) {
          id v8 = @"DisplayTypeIcon";
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(__CFString *)v8 isEqual:@"DisplayTypeIcon"];
          -[NSMutableArray enumerateObjectsUsingBlock:](v19->_displayContainers, "enumerateObjectsUsingBlock:");
        }
      }
    }
    else
    {
      -[NSMutableArray enumerateObjectsUsingBlock:](v19->_displayContainers, "enumerateObjectsUsingBlock:");
      if (!v10[5]) {
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v19->_keyboardContainers, "enumerateKeysAndObjectsUsingBlock:");
      }
    }
  }
  if (!v10[5])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = objc_msgSend(-[NightModeControl getPropertyForKey:](v19->_nightModeControl, "getPropertyForKey:", v17), "copy");
      v10[5] = v4;
    }
  }
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __33__BLControl_startHIDSystemClient__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) hidServiceArrival:a4];
}

- (void)hidServiceArrival:(__IOHIDServiceClient *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_0_8_66((uint64_t)v7, (uint64_t)a3, (uint64_t)a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "(%p) %{public}@", v7, 0x16u);
  }
  IOHIDServiceClientRegisterRemovalBlock();
  [(NSMutableArray *)self->_hidServiceClients addObject:a3];
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_displayContainers, "enumerateObjectsUsingBlock:");
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_keyboardContainers, "enumerateKeysAndObjectsUsingBlock:");
}

uint64_t __31__BLControl_hidServiceArrival___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) removeHIDService:a4];
}

- (void)removeHIDService:(__IOHIDServiceClient *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_0_8_66((uint64_t)v7, (uint64_t)a3, (uint64_t)a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "(%p) %{public}@", v7, 0x16u);
  }
  [(NSMutableArray *)self->_hidServiceClients removeObject:a3];
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_displayContainers, "enumerateObjectsUsingBlock:");
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_keyboardContainers, "enumerateKeysAndObjectsUsingBlock:");
}

uint64_t __30__BLControl_removeHIDService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A9C8];
  if (result) {
    return [a2 removeHIDServiceClient:*(void *)(a1 + 32)];
  }
  return result;
}

void __43__BLControl_sendNotificationFor_withValue___block_invoke(id *a1)
{
}

- (void)sendSyncNotificationFor:(id)a3 withValue:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
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
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v9, (uint64_t)a3, (uint64_t)a4);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ value=%@", v9, 0x16u);
  }
  [(BLControl *)self handleNotificationInternalForKey:a3 withValue:a4];
  if (self->_callback) {
    (*((void (**)(void))self->_callback + 2))();
  }
}

uint64_t __41__BLControl_handleCAWindowServerDisplay___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendNotificationFor:withValue:", a2, a3, a1, a3, a2, a1);
}

- (void)sendNotificationFor:(id)a3 withValue:(id)a4
{
  SEL v18 = self;
  SEL v17 = a2;
  id v16 = a3;
  id v15 = a4;
  id v4 = a3;
  id v5 = v15;
  queue = v18->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  uint64_t v10 = __43__BLControl_sendNotificationFor_withValue___block_invoke;
  int v11 = &unk_1E62192B0;
  int v12 = v18;
  id v13 = v16;
  id v14 = v15;
  dispatch_async(queue, &block);
}

- (id)copyPropertyWithKey:(id)a3 client:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v28 = self;
  SEL v27 = a2;
  id v26 = a3;
  id v25 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  int v20 = 1375731712;
  int v21 = 48;
  v22 = __Block_byref_object_copy__15;
  v23 = __Block_byref_object_dispose__15;
  uint64_t v24 = 0;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v10 = -1073741824;
  int v11 = 0;
  int v12 = __40__BLControl_copyPropertyWithKey_client___block_invoke;
  id v13 = &unk_1E621A000;
  SEL v17 = &v18;
  id v14 = v28;
  id v15 = a3;
  id v16 = a4;
  dispatch_sync(queue, &block);
  if (v28->_logHandle)
  {
    logHandle = v28->_logHandle;
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v29, (uint64_t)v26, v19[5]);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "key=%@ result=%@", v29, 0x16u);
  }
  v6 = (void *)v19[5];
  _Block_object_dispose(&v18, 8);
  return v6;
}

uint64_t __48__BLControl_setPropertyWithKey_property_client___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setPropertyInternalWithKey:*(void *)(a1 + 40) property:*(void *)(a1 + 48) client:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result & 1;
  return result;
}

- (BOOL)setPropertyInternalWithKey:(id)a3 property:(id)a4 client:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23 = self;
  SEL v22 = a2;
  id v21 = a3;
  id v20 = a4;
  v19 = (__CFString *)a5;
  uint64_t v14 = 0;
  id v15 = &v14;
  int v16 = 0x20000000;
  int v17 = 32;
  char v18 = 0;
  if (self->_logHandle)
  {
    logHandle = v23->_logHandle;
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v24, (uint64_t)v21, (uint64_t)v20);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "key=%@ property=%@", v24, 0x16u);
  }
  BOOL v10 = [(BLControl *)v23 setBLControlPropertyWithKey:v21 property:v20];
  *((unsigned char *)v15 + 24) = v10;
  if ((v15[3] & 1) == 0 && v23->_builtInDisplayCount > 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v21 isEqual:@"DisplaySelect"])
      {
        if (v19) {
          int v9 = v19;
        }
        else {
          int v9 = @"Server";
        }
        [(NSMutableDictionary *)v23->_clientDisplayMap setObject:v20 forKey:v9];
        *((unsigned char *)v15 + 24) = 1;
      }
      else if (([v21 isEqual:@"DisplayBrightness"] & 1) != 0 {
             || ([v21 isEqual:@"DisplayNitsKey"] & 1) != 0
      }
             || ([v21 isEqual:@"MaxBrightness"] & 1) != 0)
      {
        if (v19) {
          int v8 = v19;
        }
        else {
          int v8 = @"Server";
        }
        id v13 = (__CFString *)[(NSMutableDictionary *)v23->_clientDisplayMap objectForKey:v8];
        if (!v13) {
          id v13 = @"DisplayTypeIcon";
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(__CFString *)v13 isEqual:@"DisplayTypeIcon"];
          -[NSMutableArray enumerateObjectsUsingBlock:](v23->_displayContainers, "enumerateObjectsUsingBlock:");
        }
      }
    }
  }
  if ((v15[3] & 1) == 0)
  {
    -[NSMutableArray enumerateObjectsUsingBlock:](v23->_displayContainers, "enumerateObjectsUsingBlock:");
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v23->_keyboardContainers, "enumerateKeysAndObjectsUsingBlock:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v7 = [(NightModeControl *)v23->_nightModeControl setProperty:v20 forKey:v21];
      *((unsigned char *)v15 + 24) = (v15[3] & 1 | v7) != 0;
    }
  }
  char v6 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v6 & 1;
}

- (BOOL)setBLControlPropertyWithKey:(id)a3 property:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  v75 = self;
  SEL v74 = a2;
  id v73 = a3;
  CFNumberRef v72 = (const __CFNumber *)a4;
  char v71 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v73 isEqual:@"DisplayBrightness"])
    {
      if (v75->_ignoreBrightnessKey && !v75->_overrideIgnoreBrightness)
      {
        os_log_t v67 = 0;
        if (v75->_logHandle)
        {
          logHandle = v75->_logHandle;
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
        os_log_t v67 = logHandle;
        os_log_type_t v66 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v78, (uint64_t)"DisplayBrightness");
          _os_log_impl(&dword_1BA438000, v67, v66, "Ignoring key %s\n", v78, 0xCu);
        }
        char v71 = 1;
      }
    }
    else if ([v73 isEqual:@"DisplayBrightnessAuto"])
    {
      if (v72)
      {
        CFTypeID TypeID = CFNumberGetTypeID();
        if (TypeID == CFGetTypeID(v72))
        {
          int valuePtr = 0;
          if (CFNumberGetValue(v72, kCFNumberIntType, &valuePtr)) {
            v75->_overrideIgnoreBrightness = valuePtr == 0;
          }
        }
        else
        {
          CFTypeID v21 = CFBooleanGetTypeID();
          if (v21 == CFGetTypeID(v72))
          {
            Boolean v64 = 0;
            Boolean v64 = CFEqual(v72, (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
            v75->_overrideIgnoreBrightness = v64 == 0;
          }
        }
      }
      id v63 = [(BLControl *)v75 copyPropertyInternalWithKey:@"BLControlAlsSupported" forClient:0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ([v63 BOOLValue] & 1) == 0)
      {
        v62 = 0;
        if (v75->_logHandle)
        {
          id v20 = v75->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v19 = init_default_corebrightness_log();
          }
          id v20 = v19;
        }
        v62 = v20;
        os_log_type_t v61 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = v62;
          os_log_type_t v18 = v61;
          __os_log_helper_16_0_0(v60);
          _os_log_impl(&dword_1BA438000, v17, v18, "ALS is not supported on this device -> ignore setting of DisplayBrightnessAuto property", v60, 2u);
        }
        char v71 = 1;
      }
    }
    else if ([v73 isEqual:@"BrightnessCurveLevel"])
    {
      if (v75->_useMultiCurves)
      {
        v75->_ignoreBrightnessKey = 1;
      }
      else
      {
        v59 = 0;
        if (v75->_logHandle)
        {
          int v16 = v75->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v15 = init_default_corebrightness_log();
          }
          int v16 = v15;
        }
        v59 = v16;
        char v58 = 1;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v13 = v59;
          os_log_type_t v14 = v58;
          __os_log_helper_16_0_0(v57);
          _os_log_impl(&dword_1BA438000, v13, v14, "ignoring this key as this device does not support this feature.", v57, 2u);
        }
        char v71 = 1;
      }
    }
    else if ([v73 isEqual:@"ALSEventsIgnore"])
    {
      if (v72)
      {
        CFTypeID v12 = CFGetTypeID(v72);
        if (v12 == CFBooleanGetTypeID())
        {
          v75->_ignoreALSEvents = CFBooleanGetValue(v72) != 0;
          char v71 = 1;
        }
      }
    }
    else if ([v73 isEqual:@"ALSEventsOverride"])
    {
      if (v72)
      {
        CFTypeID v11 = CFGetTypeID(v72);
        if (v11 == CFNumberGetTypeID())
        {
          int v56 = 0;
          if (CFNumberGetValue(v72, kCFNumberFloatType, &v56))
          {
            mach_absolute_time();
            CFTypeRef AmbientLightSensorEvent = (CFTypeRef)IOHIDEventCreateAmbientLightSensorEvent();
            if (AmbientLightSensorEvent)
            {
              hidServiceClients = v75->_hidServiceClients;
              uint64_t v48 = MEMORY[0x1E4F143A8];
              int v49 = -1073741824;
              int v50 = 0;
              v51 = __50__BLControl_setBLControlPropertyWithKey_property___block_invoke;
              v52 = &unk_1E6219768;
              CFTypeRef v54 = AmbientLightSensorEvent;
              v53 = v75;
              -[NSMutableArray enumerateObjectsUsingBlock:](hidServiceClients, "enumerateObjectsUsingBlock:");
              CFRelease(AmbientLightSensorEvent);
            }
          }
        }
      }
    }
    else if ([v73 isEqual:@"DisplayMode"])
    {
      uint64_t v43 = 0;
      v44 = &v43;
      int v45 = 0x20000000;
      int v46 = 32;
      char v47 = 0;
      [(BLControl *)v75 releaseDisplayModeCompletionTimer];
      displayContainers = v75->_displayContainers;
      uint64_t v36 = MEMORY[0x1E4F143A8];
      int v37 = -1073741824;
      int v38 = 0;
      v39 = __50__BLControl_setBLControlPropertyWithKey_property___block_invoke_2;
      v40 = &unk_1E6219A10;
      v42 = &v43;
      CFNumberRef v41 = v72;
      -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:");
      if ((v44[3] & 1) == 0)
      {
        BOOL v10 = [(BLControl *)v75 handleDisplayModeUpdatePropertyHandler:v72];
        *((unsigned char *)v44 + 24) = (v44[3] & 1 | v10) != 0;
      }
      int64_t v9 = +[CBDisplayStateUtilities displayModeFromProperty:v72];
      v75->_displayMode = v9;
      if ((CBU_ImplicitUserInteractedWithUI() & 1) != 0 && v75->_displayMode == 3)
      {
        os_log_t oslog = 0;
        if (v75->_logHandle)
        {
          int v8 = v75->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v7 = init_default_corebrightness_log();
          }
          int v8 = v7;
        }
        os_log_t oslog = v8;
        os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v77, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:v75->_displayMode]);
          _os_log_impl(&dword_1BA438000, oslog, v34, "%@ -> Implicit user interacted with UI message", v77, 0xCu);
        }
        [(BLControl *)v75 setPropertyInternalWithKey:@"UserInteractedWithUI" property:MEMORY[0x1E4F1CC38] client:0];
      }
      char v71 = v44[3] & 1;
      _Block_object_dispose(&v43, 8);
    }
    else if ([v73 isEqual:@"FlipBookState"])
    {
      uint64_t v29 = 0;
      uint64_t v30 = &v29;
      int v31 = 0x20000000;
      int v32 = 32;
      char v33 = 0;
      -[NSMutableArray enumerateObjectsUsingBlock:](v75->_displayContainers, "enumerateObjectsUsingBlock:");
      char v71 = v30[3] & 1;
      _Block_object_dispose(&v29, 8);
    }
    char v76 = v71 & 1;
  }
  else
  {
    v70 = 0;
    if (v75->_logHandle)
    {
      v28 = v75->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v27 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v27 = init_default_corebrightness_log();
      }
      v28 = v27;
    }
    v70 = v28;
    char v69 = 1;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      log = v70;
      os_log_type_t type = v69;
      __os_log_helper_16_0_0(v68);
      _os_log_impl(&dword_1BA438000, log, type, "key is not string", v68, 2u);
    }
    char v76 = v71 & 1;
  }
  return v76 & 1;
}

- (id)copyBLControlPropertyWithkey:(id)a3
{
  v23 = self;
  SEL v22 = a2;
  id v21 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  int v16 = 1375731712;
  int v17 = 48;
  os_log_type_t v18 = __Block_byref_object_copy__15;
  uint64_t v19 = __Block_byref_object_dispose__15;
  uint64_t v20 = 0;
  if ([a3 isEqual:@"BLControlAlsSupported"]) {
    goto LABEL_2;
  }
  if ([v21 isEqual:@"DisplayStateControlSupported"])
  {
    uint64_t v3 = [objc_alloc(NSNumber) initWithBool:CBU_SyncDisplayStateControlSupported() & 1];
    v15[5] = v3;
    goto LABEL_21;
  }
  if ([v21 isEqual:@"DisplayBrightnessIgnored"])
  {
    if (v23->_ignoreBrightnessKey) {
      uint64_t v4 = [objc_alloc(NSNumber) initWithBool:1];
    }
    else {
      uint64_t v4 = [objc_alloc(NSNumber) initWithBool:0];
    }
    v15[5] = v4;
  }
  else
  {
    if ([v21 isEqual:@"EventTimestamps"])
    {
LABEL_2:
      -[NSMutableArray enumerateObjectsUsingBlock:](v23->_displayContainers, "enumerateObjectsUsingBlock:");
      goto LABEL_21;
    }
    if ([v21 isEqual:@"CBDisplayList"])
    {
      uint64_t v5 = [(BLControl *)v23 copyDisplayList];
      v15[5] = v5;
    }
    else if ([v21 isEqual:@"CBDisplayInfo"])
    {
      uint64_t v6 = [(BLControl *)v23 copyDisplayInfo];
      v15[5] = v6;
    }
    else if ([v21 isEqual:@"StatusInfo"])
    {
      uint64_t v7 = [(BLControl *)v23 copyStatusInfo];
      v15[5] = v7;
    }
    else if ([v21 isEqual:@"DisplayMode"])
    {
      id v13 = objc_alloc(NSNumber);
      uint64_t v8 = [v13 initWithInt:v23->_displayMode];
      v15[5] = v8;
    }
    else if ([v21 isEqual:@"KeyboardBacklightIDs"])
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1C978]);
      uint64_t v9 = objc_msgSend(v12, "initWithArray:", -[NSMutableDictionary allKeys](v23->_keyboardContainers, "allKeys"));
      v15[5] = v9;
    }
  }
LABEL_21:
  CFTypeID v11 = (void *)v15[5];
  _Block_object_dispose(&v14, 8);
  return v11;
}

uint64_t __56__BLControl_setPropertyInternalWithKey_property_client___block_invoke_2(void *a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141D7A8];
  if (result)
  {
    uint64_t result = [a2 setProperty:a1[4] forKey:a1[5]];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (*(unsigned char *)(*(void *)(a1[6] + 8) + 24) & 1 | result & 1) != 0;
  }
  return result;
}

uint64_t __42__BLControl_copyBLControlPropertyWithkey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141D7A8];
  if (result)
  {
    uint64_t result = [a2 copyPropertyForKey:*(void *)(a1 + 32)];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

uint64_t __51__BLControl_copyPropertyInternalWithKey_forClient___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141D7A8];
  if (result)
  {
    uint64_t result = [a2 copyPropertyForKey:*(void *)(a1 + 32)];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)setPropertyWithKey:(id)a3 property:(id)a4 client:(id)a5
{
  uint64_t v27 = self;
  SEL v26 = a2;
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  int v20 = 0x20000000;
  int v21 = 32;
  char v22 = 0;
  if ([a3 isEqual:@"CBAOTStateUpdate"])
  {
    char v28 = 1;
  }
  else
  {
    queue = v27->_queue;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v8 = -1073741824;
    int v9 = 0;
    BOOL v10 = __48__BLControl_setPropertyWithKey_property_client___block_invoke;
    CFTypeID v11 = &unk_1E621A0A0;
    int v16 = &v18;
    id v12 = v27;
    id v13 = v25;
    id v14 = v24;
    id v15 = v23;
    dispatch_sync(queue, &block);
    char v28 = v19[3] & 1;
  }
  int v17 = 1;
  _Block_object_dispose(&v18, 8);
  return v28 & 1;
}

uint64_t __40__BLControl_copyPropertyWithKey_client___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) copyPropertyInternalWithKey:*(void *)(a1 + 40) forClient:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  return result;
}

uint64_t __31__BLControl_hidServiceArrival___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A9C8];
  if (result) {
    return [a2 addHIDServiceClient:*(void *)(a1 + 32)];
  }
  return result;
}

- (BLControl)init
{
  id v39 = self;
  SEL v38 = a2;
  v37.receiver = self;
  v37.super_class = (Class)BLControl;
  id v39 = [(BLControl *)&v37 init];
  if (v39)
  {
    os_log_t v2 = os_log_create("com.apple.CoreBrightness.BLControl", "default");
    *((void *)v39 + 14) = v2;
    if (!*((void *)v39 + 14))
    {
      uint64_t v36 = 0;
      id v24 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      uint64_t v36 = v24;
      char v35 = 16;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        log = v36;
        os_log_type_t type = v35;
        __os_log_helper_16_0_0(v34);
        _os_log_error_impl(&dword_1BA438000, log, type, "failed to create log handle", v34, 2u);
      }
    }
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v39 + 11) = v3;
    if (!*((void *)v39 + 11))
    {
      char v33 = 0;
      if (*((void *)v39 + 14))
      {
        int v21 = *((void *)v39 + 14);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        int v21 = inited;
      }
      char v33 = v21;
      char v32 = 16;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = v33;
        os_log_type_t v19 = v32;
        __os_log_helper_16_0_0(v31);
        _os_log_error_impl(&dword_1BA438000, v18, v19, "creation of _clientDisplayMap failed!! Not starting brightness system", v31, 2u);
      }
LABEL_39:

      id v39 = 0;
      return 0;
    }
    dispatch_workloop_t inactive = dispatch_workloop_create_inactive("BacklightControl - Primary workloop");
    *((void *)v39 + 2) = inactive;
    dispatch_workloop_set_scheduler_priority();
    dispatch_activate(*((dispatch_object_t *)v39 + 2));
    dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("BacklightControl - Primary queue", 0, *((dispatch_queue_t *)v39 + 2));
    *((void *)v39 + 3) = v5;
    if (!*((void *)v39 + 3))
    {
      uint64_t v30 = 0;
      if (*((void *)v39 + 14))
      {
        int v17 = *((void *)v39 + 14);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v16 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v16 = init_default_corebrightness_log();
        }
        int v17 = v16;
      }
      uint64_t v30 = v17;
      char v29 = 16;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v14 = v30;
        os_log_type_t v15 = v29;
        __os_log_helper_16_0_0(v28);
        _os_log_error_impl(&dword_1BA438000, v14, v15, "failed to create an internal dispatch queue", v28, 2u);
      }
      goto LABEL_39;
    }
    *((unsigned char *)v39 + 57) = 0;
    *((unsigned char *)v39 + 56) = 0;
    *((_DWORD *)v39 + 15) = -1;
    *((_DWORD *)v39 + 18) = -1;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v39 + 12) = v6;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v39 + 13) = v7;
    *((void *)v39 + 19) = 0;
    *((void *)v39 + 20) = 5;
    *((void *)v39 + 21) = 0;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v39 + 17) = v8;
    if (!*((void *)v39 + 17))
    {
      uint64_t v27 = 0;
      if (*((void *)v39 + 14))
      {
        id v13 = *((void *)v39 + 14);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v12 = init_default_corebrightness_log();
        }
        id v13 = v12;
      }
      uint64_t v27 = v13;
      char v26 = 16;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        BOOL v10 = v27;
        os_log_type_t v11 = v26;
        __os_log_helper_16_0_0(v25);
        _os_log_error_impl(&dword_1BA438000, v10, v11, "unable to create display containers dictionary", v25, 2u);
      }
      goto LABEL_39;
    }
  }
  return (BLControl *)v39;
}

- (void)dealloc
{
  uint64_t v4 = self;
  SEL v3 = a2;
  [(BLControl *)self releaseDisplayModeCompletionTimer];
  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }
  if (v4->_queue) {
    dispatch_release((dispatch_object_t)v4->_queue);
  }
  if (v4->_workloop) {
    dispatch_release((dispatch_object_t)v4->_workloop);
  }

  v2.receiver = v4;
  v2.super_class = (Class)BLControl;
  [(BLControl *)&v2 dealloc];
}

- (BOOL)start
{
  uint64_t v18 = self;
  SEL v17 = a2;
  uint64_t v12 = 0;
  id v13 = &v12;
  int v14 = 0x20000000;
  int v15 = 32;
  char v16 = 0;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __18__BLControl_start__block_invoke;
  int v9 = &unk_1E6219CA8;
  BOOL v10 = v18;
  os_log_type_t v11 = &v12;
  dispatch_sync(queue, &block);
  char v4 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v4 & 1;
}

uint64_t __18__BLControl_start__block_invoke(uint64_t a1)
{
  uint64_t v52 = a1;
  uint64_t v51 = a1;
  if (CBU_ShouldWaitForALS())
  {
    int v50 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 112))
    {
      int v21 = *(NSObject **)(*(void *)(a1 + 32) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      int v21 = inited;
    }
    int v50 = v21;
    os_log_type_t v49 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      log = v50;
      os_log_type_t type = v49;
      __os_log_helper_16_0_0(v48);
      _os_log_impl(&dword_1BA438000, log, type, "check ALS arrival", v48, 2u);
    }
    [*(id *)(a1 + 32) waitForALSArrival];
  }
  if (([*(id *)(a1 + 32) startHIDSystemClient] & 1) == 0)
  {
    char v47 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 112))
    {
      SEL v17 = *(NSObject **)(*(void *)(a1 + 32) + 112);
    }
    else
    {
      uint64_t v16 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      SEL v17 = v16;
    }
    char v47 = v17;
    char v46 = 16;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v14 = v47;
      os_log_type_t v15 = v46;
      __os_log_helper_16_0_0(v45);
      _os_log_error_impl(&dword_1BA438000, v14, v15, "no HID", v45, 2u);
    }
  }
  char v44 = 0;
  char v44 = [*(id *)(a1 + 32) findDisplays] & 1;
  if (!v44)
  {
    uint64_t v43 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 112))
    {
      id v13 = *(NSObject **)(*(void *)(a1 + 32) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v12 = init_default_corebrightness_log();
      }
      id v13 = v12;
    }
    uint64_t v43 = v13;
    char v42 = 1;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = v43;
      os_log_type_t v11 = v42;
      __os_log_helper_16_0_0(v41);
      _os_log_impl(&dword_1BA438000, v10, v11, "CA doesn't provide display list", v41, 2u);
    }
    if ([*(id *)(a1 + 32) findBacklight])
    {
      v40 = 0;
      if (*(void *)(*(void *)(a1 + 32) + 112))
      {
        int v9 = *(NSObject **)(*(void *)(a1 + 32) + 112);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v8 = init_default_corebrightness_log();
        }
        int v9 = v8;
      }
      v40 = v9;
      char v39 = 1;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v6 = v40;
        os_log_type_t v7 = v39;
        __os_log_helper_16_0_0(v38);
        _os_log_impl(&dword_1BA438000, v6, v7, "CA doesn't provide display list", v38, 2u);
      }
    }
    else
    {
      objc_super v37 = 0;
      if (*(void *)(*(void *)(a1 + 32) + 112))
      {
        dispatch_queue_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 112);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v4 = init_default_corebrightness_log();
        }
        dispatch_queue_t v5 = v4;
      }
      objc_super v37 = v5;
      char v36 = 16;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_super v2 = v37;
        os_log_type_t v3 = v36;
        __os_log_helper_16_0_0(v35);
        _os_log_error_impl(&dword_1BA438000, v2, v3, "Built in display/backlight driver has not been found.", v35, 2u);
      }
    }
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "enumerateObjectsUsingBlock:", &__block_literal_global_11, v2);
  uint64_t v29 = MEMORY[0x1E4F143A8];
  int v30 = -1073741824;
  int v31 = 0;
  char v32 = __18__BLControl_start__block_invoke_2;
  char v33 = &unk_1E6219E70;
  uint64_t v34 = *(void *)(a1 + 32);
  *(void *)(*(void *)(a1 + 32) + 64) = &v29;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  int v24 = -1073741824;
  int v25 = 0;
  char v26 = __18__BLControl_start__block_invoke_3;
  uint64_t v27 = &unk_1E6219E70;
  uint64_t v28 = *(void *)(a1 + 32);
  *(void *)(*(void *)(a1 + 32) + 80) = &v23;
  notify_register_dispatch("com.apple.system.lowpowermode", (int *)(*(void *)(a1 + 32) + 60), *(dispatch_queue_t *)(*(void *)(a1 + 32) + 24), *(notify_handler_t *)(*(void *)(a1 + 32) + 64));
  notify_register_dispatch("com.apple.powerd.lowpowermode.prefs", (int *)(*(void *)(a1 + 32) + 72), MEMORY[0x1E4F14428], *(notify_handler_t *)(*(void *)(a1 + 32) + 80));
  if (*(void *)(*(void *)(a1 + 32) + 80)) {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 80) + 16))();
  }
  if (*(void *)(*(void *)(a1 + 32) + 64)) {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 64) + 16))();
  }
  [*(id *)(a1 + 32) initKeyboardBacklightHIDManager];
  *(void *)(*(void *)(a1 + 32) + 152) = IOPMScheduleUserActiveChangedNotification();
  *(void *)(*(void *)(a1 + 32) + 176) = [objc_alloc(MEMORY[0x1E4FA99A0]) initWithIdentifier:@"com.apple.CoreBrightness.BLControl" queue:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 176) addObserver:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __18__BLControl_start__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141D7A8];
  if (result) {
    return [a2 setProperty:MEMORY[0x1E4F1CC28] forKey:@"DisplayBrightnessAuto"];
  }
  return result;
}

uint64_t __18__BLControl_start__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v7 = a1;
  int v6 = a2;
  state64[1] = a1;
  state64[0] = 0;
  notify_get_state(a2, state64);
  uint64_t v4 = *(void **)(a1 + 32);
  if (state64[0]) {
    return [v4 setPropertyInternalWithKey:@"EcoMode" property:*MEMORY[0x1E4F1CFD0] client:0];
  }
  else {
    return [v4 setPropertyInternalWithKey:@"EcoMode" property:*MEMORY[0x1E4F1CFC8] client:0];
  }
}

void __18__BLControl_start__block_invoke_3(uint64_t a1)
{
  CFPreferencesAppSynchronize(@"com.apple.powerd.lowpowermode");
  CFTypeRef cf = CFPreferencesCopyAppValue(@"backlightReduction", @"com.apple.powerd.lowpowermode");
  if (cf)
  {
    [*(id *)(a1 + 32) setPropertyInternalWithKey:@"EcoModeFactorUpdate" property:cf client:0];
    CFRelease(cf);
  }
}

uint64_t __18__BLControl_start__block_invoke_4(uint64_t a1, char a2)
{
  return [*(id *)(a1 + 32) handleUserIsActiveStateChange:a2 & 1];
}

- (void)stop
{
  BOOL v10 = self;
  SEL v9 = a2;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = __17__BLControl_stop__block_invoke;
  uint64_t v7 = &unk_1E6218FE0;
  uint64_t v8 = v10;
  dispatch_sync(queue, &block);
}

void __17__BLControl_stop__block_invoke(uint64_t a1)
{
  if (notify_is_valid_token(*(_DWORD *)(*(void *)(a1 + 32) + 60)))
  {
    notify_cancel(*(_DWORD *)(*(void *)(a1 + 32) + 60));
    *(_DWORD *)(*(void *)(a1 + 32) + 60) = -1;
  }
  if (notify_is_valid_token(*(_DWORD *)(*(void *)(a1 + 32) + 72)))
  {
    notify_cancel(*(_DWORD *)(*(void *)(a1 + 32) + 72));
    *(_DWORD *)(*(void *)(a1 + 32) + 72) = -1;
  }
  [*(id *)(a1 + 32) registerNotificationBlock:0];
  [*(id *)(a1 + 32) cancelHIDSystemClient];
  [*(id *)(a1 + 32) stopDisplayLookup];
  [*(id *)(*(void *)(a1 + 32) + 96) makeObjectsPerformSelector:0x1F7125D18uLL];
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 136), "allValues"), "makeObjectsPerformSelector:", 0x1F7125D18uLL);
  [*(id *)(*(void *)(a1 + 32) + 136) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 96) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 104) removeAllObjects];

  *(void *)(*(void *)(a1 + 32) + 128) = 0;
  if (*(void *)(*(void *)(a1 + 32) + 152))
  {
    IOPMUnregisterNotification();
    *(void *)(*(void *)(a1 + 32) + 152) = 0;
  }
  if (*(void *)(*(void *)(a1 + 32) + 176))
  {
    [*(id *)(*(void *)(a1 + 32) + 176) removeObserver:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 32) + 176) invalidate];

    *(void *)(*(void *)(a1 + 32) + 176) = 0;
  }
}

uint64_t __33__BLControl_handleHIDEvent_from___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 conformsToProtocol:&unk_1F141D7A8];
  if (result) {
    return [a3 setProperty:*(void *)(a1 + 32) forKey:@"TrustedFrontLux"];
  }
  return result;
}

- (BOOL)findBacklight
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v34 = self;
  SEL v33 = a2;
  char v32 = 0;
  keys[0] = @"backlight-control";
  values = 0;
  values = (void *)*MEMORY[0x1E4F1CFD0];
  CFDictionaryRef v31 = 0;
  SEL v9 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  keyCallBacks = (CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  valueCallBacks = (CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  CFDictionaryRef v31 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  char v36 = @"IOPropertyMatch";
  char v35 = v31;
  CFDictionaryRef v30 = 0;
  CFDictionaryRef v30 = CFDictionaryCreate(*v9, (const void **)&v36, (const void **)&v35, 1, keyCallBacks, valueCallBacks);
  CFRelease(v31);
  io_iterator_t existing = 0;
  io_object_t v28 = 0;
  if (!IOServiceGetMatchingServices(*MEMORY[0x1E4F2EEF0], v30, &existing) && existing)
  {
    while (1)
    {
      io_object_t v28 = IOIteratorNext(existing);
      if (!v28) {
        break;
      }
      uint64_t v27 = 0;
      objc_super v2 = [CBDisplayContaineriOS alloc];
      uint64_t v27 = [(CBDisplayContaineriOS *)v2 initWithBacklightService:v28];
      if (v27)
      {
        [(CBContainer *)v27 scheduleWithDispatchQueue:v34->_queue];
        uint64_t v21 = MEMORY[0x1E4F143A8];
        int v22 = -1073741824;
        int v23 = 0;
        int v24 = __26__BLControl_findBacklight__block_invoke;
        int v25 = &unk_1E62190B8;
        char v26 = v34;
        -[CBDisplayContaineriOS registerNotificationBlock:](v27, "registerNotificationBlock:");
        char v32 = [(CBDisplayContaineriOS *)v27 start];
        if (!v32)
        {

          break;
        }
        [(BLControl *)v34 addDisplayContainer:v27];
        ++v34->_builtInDisplayCount;
        if ([(CBDisplayContaineriOS *)v27 conformsToProtocol:&unk_1F141A9C8])
        {
          hidServiceClients = v34->_hidServiceClients;
          uint64_t v15 = MEMORY[0x1E4F143A8];
          int v16 = -1073741824;
          int v17 = 0;
          uint64_t v18 = __26__BLControl_findBacklight__block_invoke_2;
          os_log_type_t v19 = &unk_1E62191C8;
          int v20 = v27;
          -[NSMutableArray enumerateObjectsUsingBlock:](hidServiceClients, "enumerateObjectsUsingBlock:");
        }
      }
      else
      {
        os_log_t oslog = 0;
        if (v34->_logHandle)
        {
          logHandle = v34->_logHandle;
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
        os_log_t oslog = logHandle;
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          os_log_type_t v6 = type;
          __os_log_helper_16_0_0(v12);
          _os_log_error_impl(&dword_1BA438000, log, v6, "error: failed to create display container for service", v12, 2u);
        }
      }
      char v32 = 1;
    }
    IOObjectRelease(existing);
  }
  return v32 & 1;
}

uint64_t __26__BLControl_findBacklight__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendNotificationFor:withValue:", a2, a3, a1, a3, a2, a1);
}

uint64_t __26__BLControl_findBacklight__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addHIDServiceClient:a2];
}

- (BOOL)findDisplays
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  SEL v38 = self;
  SEL v37 = a2;
  char v36 = 0;
  id v35 = (id)[MEMORY[0x1E4F39D28] serverIfRunning];
  if (v35)
  {
    id v31 = (id)[v35 displays];
    os_log_t v30 = 0;
    if (v38->_logHandle)
    {
      logHandle = v38->_logHandle;
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
    os_log_t v30 = logHandle;
    os_log_type_t v29 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v42, (uint64_t)v31);
      _os_log_impl(&dword_1BA438000, v30, v29, "displays: %{public}@", v42, 0xCu);
    }
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    memset(__b, 0, sizeof(__b));
    id obj = v31;
    uint64_t v15 = [v31 countByEnumeratingWithState:__b objects:v41 count:16];
    if (v15)
    {
      uint64_t v11 = *(void *)__b[2];
      uint64_t v12 = 0;
      unint64_t v13 = v15;
      while (1)
      {
        uint64_t v10 = v12;
        if (*(void *)__b[2] != v11) {
          objc_enumerationMutation(obj);
        }
        id v27 = 0;
        id v27 = *(id *)(__b[1] + 8 * v12);
        unsigned int v25 = [v27 displayId];
        if ([(BLControl *)v38 useSyncBrightnessTransactionForDisplay:v27])
        {
          [(BLControl *)v38 handleCAWindowServerDisplay:v27];
          char v36 = 1;
          objc_msgSend(v28, "setObject:forKey:", @"WSDisplay", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v25));
        }
        else
        {
          objc_msgSend(v28, "setObject:forKey:", @"CADisplay", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v25));
        }
        ++v12;
        if (v10 + 1 >= v13)
        {
          uint64_t v12 = 0;
          unint64_t v13 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
          if (!v13) {
            break;
          }
        }
      }
    }
    objc_super v2 = (void *)[MEMORY[0x1E4F39B60] mainDisplay];
    [v2 addObserver:v38 forKeyPath:@"currentPreset" options:0 context:0];
    [(BLControl *)v38 handlePresetChange];
    memset(v23, 0, sizeof(v23));
    id v8 = (id)[MEMORY[0x1E4F39B60] displays];
    uint64_t v9 = [v8 countByEnumeratingWithState:v23 objects:v40 count:16];
    if (v9)
    {
      uint64_t v5 = *(void *)v23[2];
      uint64_t v6 = 0;
      unint64_t v7 = v9;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)v23[2] != v5) {
          objc_enumerationMutation(v8);
        }
        id v24 = 0;
        id v24 = *(id *)(v23[1] + 8 * v6);
        unsigned int v22 = [v24 displayId];
        if (objc_msgSend((id)objc_msgSend(v28, "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v22)), "isEqualToString:", @"CADisplay"))
        {
          [(BLControl *)v38 handleCADisplay:v24];
          [v24 addObserver:v38 forKeyPath:@"currentMode" options:0 context:0];
          char v36 = 1;
        }
        ++v6;
        if (v4 + 1 >= v7)
        {
          uint64_t v6 = 0;
          unint64_t v7 = [v8 countByEnumeratingWithState:v23 objects:v40 count:16];
          if (!v7) {
            break;
          }
        }
      }
    }

    char v39 = v36 & 1;
  }
  else
  {
    os_log_t oslog = 0;
    if (v38->_logHandle)
    {
      uint64_t v21 = v38->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v20 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v20 = init_default_corebrightness_log();
      }
      uint64_t v21 = v20;
    }
    os_log_t oslog = v21;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v19 = type;
      __os_log_helper_16_0_0(v32);
      _os_log_error_impl(&dword_1BA438000, log, v19, "CAWindowServer is not running", v32, 2u);
    }
    char v39 = v36 & 1;
  }
  return v39 & 1;
}

- (void)stopDisplayLookup
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v17 = self;
  SEL v16 = a2;
  uint64_t v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F39D28], "serverIfRunning"), "displays");
  os_log_t oslog = 0;
  if (v17->_logHandle)
  {
    logHandle = v17->_logHandle;
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
  os_log_t oslog = logHandle;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v19, v15);
    _os_log_impl(&dword_1BA438000, oslog, type, "displays: %{public}@", v19, 0xCu);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F39B60], "mainDisplay"), "removeObserver:forKeyPath:context:", v17, @"currentPreset", 0);
  memset(__b, 0, sizeof(__b));
  id obj = (id)[MEMORY[0x1E4F39B60] displays];
  uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    uint64_t v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v12 = 0;
      id v12 = *(id *)(__b[1] + 8 * v5);
      objc_msgSend(v12, "removeObserver:forKeyPath:context:", v17, @"currentMode", 0, v6);
      ++v5;
      uint64_t v6 = v2;
      if (v3 + 1 >= v2)
      {
        uint64_t v5 = 0;
        uint64_t v6 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }
}

- (void)handleCADisplay:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3 && isDisplayAvailable((CADisplay *)a3))
  {
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v10, [a3 deviceName]);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "%{public}@ is available", v10, 0xCu);
    }
    [(BLControl *)self handleCADisplayArrival:a3];
  }
  else
  {
    if (self->_logHandle)
    {
      uint64_t v4 = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v3 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v3 = init_default_corebrightness_log();
      }
      uint64_t v4 = v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v9, [a3 deviceName]);
      _os_log_impl(&dword_1BA438000, v4, OS_LOG_TYPE_INFO, "%{public}@ is not available", v9, 0xCu);
    }
    [(BLControl *)self handleCADisplayRemoval:a3];
  }
}

- (void)handleCAWindowServerDisplay:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  char v32 = self;
  SEL v31 = a2;
  id v30 = a3;
  id v29 = a3;
  id v28 = [[CBBrightnessProxyCA alloc] initWithCABrightnessControl:a3];
  if (v28)
  {
    id v27 = [[CBDisplayContaineriOS alloc] initWithCBBrtControl:v28];
    if (v27)
    {
      [(CBContainer *)v27 scheduleWithDispatchQueue:v32->_queue];
      uint64_t v21 = MEMORY[0x1E4F143A8];
      int v22 = -1073741824;
      int v23 = 0;
      id v24 = __41__BLControl_handleCAWindowServerDisplay___block_invoke;
      unsigned int v25 = &unk_1E62190B8;
      char v26 = v32;
      -[CBDisplayContaineriOS registerNotificationBlock:](v27, "registerNotificationBlock:");
      char v20 = [(CBDisplayContaineriOS *)v27 start];
      uint64_t v15 = [(CBBrightnessProxyCA *)v28 getDisplayType];
      if (v15 != [(CBBrightnessProxyCA *)v28 CBDispTypeIntegrated] || (v20 & 1) != 0)
      {
        uint64_t v10 = [(CBBrightnessProxyCA *)v28 getDisplayType];
        if (v10 == [(CBBrightnessProxyCA *)v28 CBDispTypeIntegrated]) {
          ++v32->_builtInDisplayCount;
        }
        uint64_t v9 = [(CBBrightnessProxyCA *)v28 getDisplayType];
        if (v9 == [(CBBrightnessProxyCA *)v28 CBDispTypeIntegrated] && v32->_displayMode == 5)
        {
          id v16 = [(CBDisplayContaineriOS *)v27 copyPropertyForKey:@"DisplayOn"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v3 = [v16 BOOLValue];
            uint64_t v4 = 3;
            if ((v3 & 1) == 0) {
              uint64_t v4 = 0;
            }
            v32->_displayMode = v4;
            if (v32->_logHandle)
            {
              logHandle = v32->_logHandle;
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
              __os_log_helper_16_2_1_8_66((uint64_t)v34, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:v32->_displayMode]);
              _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "display mode initialised from invalid to %{public}@", v34, 0xCu);
            }
          }
        }
        [(BLControl *)v32 addDisplayContainer:v27];
        if ([(CBDisplayContaineriOS *)v27 conformsToProtocol:&unk_1F141A9C8]) {
          -[NSMutableArray enumerateObjectsUsingBlock:](v32->_hidServiceClients, "enumerateObjectsUsingBlock:");
        }
      }
      else
      {
        os_log_type_t v19 = 0;
        if (v32->_logHandle)
        {
          int v14 = v32->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v13 = init_default_corebrightness_log();
          }
          int v14 = v13;
        }
        os_log_type_t v19 = v14;
        char v18 = 16;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          log = v19;
          os_log_type_t type = v18;
          __os_log_helper_16_0_0(v17);
          _os_log_error_impl(&dword_1BA438000, log, type, "BLControl, ERROR creating container....return! ", v17, 2u);
        }
      }
    }
    else
    {
      if (v32->_logHandle)
      {
        uint64_t v6 = v32->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v5 = init_default_corebrightness_log();
        }
        uint64_t v6 = v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v33, (uint64_t)v30);
        _os_log_error_impl(&dword_1BA438000, v6, OS_LOG_TYPE_ERROR, "error: failed to create display container for service %{public}@", v33, 0xCu);
      }
    }
  }
}

uint64_t __41__BLControl_handleCAWindowServerDisplay___block_invoke_132(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addHIDServiceClient:a2];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v21 = self;
  SEL v20 = a2;
  id v19 = a3;
  id v18 = a4;
  id v17 = a5;
  id v16 = a6;
  queue = self->_queue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  uint64_t v10 = __60__BLControl_observeValueForKeyPath_ofObject_change_context___block_invoke;
  uint64_t v11 = &unk_1E6219630;
  id v12 = a4;
  uint64_t v13 = v21;
  id v14 = a3;
  id v15 = a5;
  dispatch_sync(queue, &v7);
}

void __60__BLControl_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = *(void **)(a1 + 32);
    if (*(void *)(*(void *)(a1 + 40) + 112))
    {
      uint64_t v6 = *(NSObject **)(*(void *)(a1 + 40) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      uint64_t v6 = inited;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_4_8_66_8_66_8_66_8_66((uint64_t)v13, [v10 name], *(void *)(a1 + 48), objc_msgSend(v10, "valueForKeyPath:", *(void *)(a1 + 48)), *(void *)(a1 + 56));
      _os_log_impl(&dword_1BA438000, v6, OS_LOG_TYPE_DEFAULT, "observed %{public}@ changing %{public}@; is now %{public}@; change dict: %{public}@",
        v13,
        0x2Au);
    }
    if (*(void *)(*(void *)(a1 + 40) + 112))
    {
      uint64_t v4 = *(NSObject **)(*(void *)(a1 + 40) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v3 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v3 = init_default_corebrightness_log();
      }
      uint64_t v4 = v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_4_0_8_66((uint64_t)v12, [v10 displayId], objc_msgSend(v10, "uniqueId"));
      _os_log_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEFAULT, "display ID %u; unique ID %{public}@;", v12, 0x12u);
    }
    if (([v10 isExternal] & 1) != 0
      || ([*(id *)(a1 + 48) isEqual:@"currentMode"] & 1) == 0)
    {
      if ([*(id *)(a1 + 48) isEqual:@"currentPreset"]) {
        [*(id *)(a1 + 40) handlePresetChange];
      }
      else {
        [*(id *)(a1 + 40) handleCADisplay:v10];
      }
    }
    else
    {
      if (*(void *)(*(void *)(a1 + 40) + 112))
      {
        unint64_t v2 = *(NSObject **)(*(void *)(a1 + 40) + 112);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v1 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v1 = init_default_corebrightness_log();
        }
        unint64_t v2 = v1;
      }
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v11, [v10 displayId]);
        _os_log_impl(&dword_1BA438000, v2, OS_LOG_TYPE_DEFAULT, "%u Internal display's mode (resolution) changed, doing nothing", v11, 8u);
      }
    }
  }
  else
  {
    if (*(void *)(*(void *)(a1 + 40) + 112))
    {
      int v8 = *(NSObject **)(*(void *)(a1 + 40) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v7 = init_default_corebrightness_log();
      }
      int v8 = v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v14, *(void *)(a1 + 32));
      _os_log_error_impl(&dword_1BA438000, v8, OS_LOG_TYPE_ERROR, "Unexpected object observed %@", v14, 0xCu);
    }
  }
}

- (void)handleCADisplayArrival:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(BLControl *)self handleCADisplayRemoval:a3];
  uint64_t v11 = [[CBDisplayContaineriOS alloc] initWithCADisplay:a3];
  if (v11)
  {
    [(CBContainer *)v11 scheduleWithDispatchQueue:self->_queue];
    -[CBDisplayContaineriOS registerNotificationBlock:](v11, "registerNotificationBlock:");
    char v10 = [(CBDisplayContaineriOS *)v11 start];
    if ([a3 isExternal] & 1) != 0 || (v10)
    {
      if (([a3 isExternal] & 1) == 0) {
        ++self->_builtInDisplayCount;
      }
      if (([a3 isExternal] & 1) == 0 && self->_displayMode == 5)
      {
        id v9 = [(CBDisplayContaineriOS *)v11 copyPropertyForKey:@"DisplayOn"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v3 = [v9 BOOLValue];
          int64_t v4 = 3;
          if ((v3 & 1) == 0) {
            int64_t v4 = 0;
          }
          self->_displayMode = v4;
          if (self->_logHandle)
          {
            logHandle = self->_logHandle;
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
            __os_log_helper_16_2_1_8_66((uint64_t)v15, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:self->_displayMode]);
            _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "display mode initialised from invalid to %{public}@", v15, 0xCu);
          }
        }
      }
      [(BLControl *)self addDisplayContainer:v11];
      if ([(CBDisplayContaineriOS *)v11 conformsToProtocol:&unk_1F141A9C8]) {
        -[NSMutableArray enumerateObjectsUsingBlock:](self->_hidServiceClients, "enumerateObjectsUsingBlock:");
      }

      [(BLControl *)self handleExternalDisplayChange];
    }
    else
    {
    }
  }
  else
  {
    if (self->_logHandle)
    {
      uint64_t v6 = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v5 = init_default_corebrightness_log();
      }
      uint64_t v6 = v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v14, (uint64_t)a3);
      _os_log_error_impl(&dword_1BA438000, v6, OS_LOG_TYPE_ERROR, "error: failed to create display container for service %{public}@", v14, 0xCu);
    }
  }
}

uint64_t __36__BLControl_handleCADisplayArrival___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendNotificationFor:withValue:", a2, a3, a1, a3, a2, a1);
}

uint64_t __36__BLControl_handleCADisplayArrival___block_invoke_133(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addHIDServiceClient:a2];
}

- (void)handleCADisplayRemoval:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v17 = self;
  SEL v16 = a2;
  id v15 = a3;
  if (a3)
  {
    uint64_t v14 = 0;
    uint64_t v14 = [v15 displayId];
    uint64_t v7 = 0;
    int v8 = &v7;
    int v9 = 1375731712;
    int v10 = 48;
    uint64_t v11 = __Block_byref_object_copy__15;
    id v12 = __Block_byref_object_dispose__15;
    uint64_t v13 = 0;
    -[NSMutableArray enumerateObjectsUsingBlock:](v17->_displayContainers, "enumerateObjectsUsingBlock:");
    if (v8[5])
    {
      if (([v15 isExternal] & 1) == 0) {
        --v17->_builtInDisplayCount;
      }
      if (v17->_logHandle)
      {
        logHandle = v17->_logHandle;
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
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v19, v8[5]);
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "removing %{public}@", v19, 0xCu);
      }
      [(id)v8[5] stop];
      [(id)v8[5] unregisterNotificationBlock];
      [(id)v8[5] unscheduleWithDispatchQueue:v17->_queue];
      [(BLControl *)v17 removeDisplayContainer:v8[5]];
      [(BLControl *)v17 handleExternalDisplayChange];
    }
    else
    {
      if (v17->_logHandle)
      {
        int64_t v4 = v17->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v3 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v3 = init_default_corebrightness_log();
        }
        int64_t v4 = v3;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v18, v14);
        _os_log_impl(&dword_1BA438000, v4, OS_LOG_TYPE_INFO, "no matching container to registry ID 0x%llX", v18, 0xCu);
      }
    }
    _Block_object_dispose(&v7, 8);
  }
}

void __36__BLControl_handleCADisplayRemoval___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([a2 conformsToProtocol:&unk_1F141D7A8])
  {
    id v8 = (id)[a2 copyPropertyForKey:@"CBDisplayID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v8 unsignedLongValue];
      if (v6 == [*(id *)(a1 + 32) displayId])
      {
        if (*(void *)(*(void *)(a1 + 40) + 112))
        {
          uint64_t v5 = *(NSObject **)(*(void *)(a1 + 40) + 112);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t inited = init_default_corebrightness_log();
          }
          uint64_t v5 = inited;
        }
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_2_8_0_8_64((uint64_t)v11, *(void *)(a1 + 56), (uint64_t)a2);
          _os_log_debug_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEBUG, "found container matching to to registry ID 0x%llX (%@)", v11, 0x16u);
        }
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a2;
        *a4 = 1;
      }
    }
  }
}

- (id)newDevicePariMatchingDictionaryWithPage:(unsigned int)a3 andUsage:(unsigned int)a4
{
  SEL v16 = self;
  SEL v15 = a2;
  unsigned int v14 = a3;
  unsigned int v13 = a4;
  uint64_t v12 = 0;
  id v11 = 0;
  unint64_t v7 = 0x1E4F28000uLL;
  id v10 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:a3];
  id v9 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:v13];
  if (v10 && v9)
  {
    id v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v10, @"DeviceUsagePage", v9, @"DeviceUsage", 0);
    if (v11)
    {
      id v8 = 0;
      id v4 = objc_alloc(MEMORY[0x1E4F1C978]);
      id v8 = (id)objc_msgSend(v4, "initWithObjects:", v11, 0);
      if (v8)
      {
        id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
        uint64_t v12 = objc_msgSend(v5, "initWithObjectsAndKeys:", v8, @"DeviceUsagePairs", 0);
      }
    }
  }

  return v12;
}

uint64_t __31__BLControl_hidServiceArrival___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 conformsToProtocol:&unk_1F141A9C8];
  if (result) {
    return [a3 addHIDServiceClient:*(void *)(a1 + 32)];
  }
  return result;
}

uint64_t __30__BLControl_removeHIDService___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 conformsToProtocol:&unk_1F141A9C8];
  if (result) {
    return [a3 removeHIDServiceClient:*(void *)(a1 + 32)];
  }
  return result;
}

- (BOOL)startHIDSystemClient
{
  SEL v33 = self;
  SEL v32 = a2;
  char v31 = 0;
  self->_hidSystemClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  if (v33->_hidSystemClient)
  {
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v30)
    {
      id v29 = [(BLControl *)v33 newDevicePariMatchingDictionaryWithPage:65280 andUsage:4];
      if (v29)
      {
        [v30 addObject:v29];
      }
      id v29 = [(BLControl *)v33 newDevicePariMatchingDictionaryWithPage:32 andUsage:65];
      if (v29)
      {
        [v30 addObject:v29];
      }
      if (!v33->_monitorALSOnly)
      {
        id v29 = [(BLControl *)v33 newDevicePariMatchingDictionaryWithPage:65280 andUsage:8];
        if (v29)
        {
          [v30 addObject:v29];
        }
        id v29 = [(BLControl *)v33 newDevicePariMatchingDictionaryWithPage:13 andUsage:12];
        if (v29)
        {
          [v29 setObject:MEMORY[0x1E4F1CC38] forKey:@"Built-In"];
          [v30 addObject:v29];
        }
        id v29 = [(BLControl *)v33 newDevicePariMatchingDictionaryWithPage:13 andUsage:4];
        if (v29)
        {
          [v29 setObject:MEMORY[0x1E4F1CC38] forKey:@"Built-In"];
          [v30 addObject:v29];
        }
        id v29 = [(BLControl *)v33 newDevicePariMatchingDictionaryWithPage:11 andUsage:1];
        if (v29)
        {
          [v30 addObject:v29];
        }
        id v29 = [(BLControl *)v33 newDevicePariMatchingDictionaryWithPage:65280 andUsage:98];
        if (v29)
        {
          [v30 addObject:v29];
        }
      }
      IOHIDEventSystemClientSetMatchingMultiple();

      uint64_t v23 = MEMORY[0x1E4F143A8];
      int v24 = -1073741824;
      int v25 = 0;
      char v26 = __33__BLControl_startHIDSystemClient__block_invoke;
      id v27 = &unk_1E6219F60;
      id v28 = v33;
      IOHIDEventSystemClientRegisterEventBlock();
      uint64_t v17 = MEMORY[0x1E4F143A8];
      int v18 = -1073741824;
      int v19 = 0;
      uint64_t v20 = __33__BLControl_startHIDSystemClient__block_invoke_2;
      uint64_t v21 = &unk_1E6219F18;
      int v22 = v33;
      IOHIDEventSystemClientRegisterDeviceMatchingBlock();
      IOHIDEventSystemClientScheduleWithDispatchQueue();
      id v16 = 0;
      id v16 = IOHIDEventSystemClientCopyServices(v33->_hidSystemClient);
      uint64_t v10 = MEMORY[0x1E4F143A8];
      int v11 = -1073741824;
      int v12 = 0;
      unsigned int v13 = __33__BLControl_startHIDSystemClient__block_invoke_3;
      unsigned int v14 = &unk_1E62191C8;
      SEL v15 = v33;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:");

      char v31 = 1;
    }
  }
  else
  {
    os_log_t oslog = 0;
    if (v33->_logHandle)
    {
      logHandle = v33->_logHandle;
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
    os_log_t oslog = logHandle;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v4 = type;
      __os_log_helper_16_0_0(v7);
      _os_log_error_impl(&dword_1BA438000, log, v4, "failed to initialise IOHIDSystemClient", v7, 2u);
    }
  }
  return v31 & 1;
}

uint64_t __33__BLControl_startHIDSystemClient__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hidServiceArrival:a2];
}

- (void)cancelHIDSystemClient
{
  if (self->_hidSystemClient)
  {
    MEMORY[0x1BA9EBFF0](self->_hidSystemClient, self->_queue);
    IOHIDEventSystemClientUnregisterEventBlock();
    CFRelease(self->_hidSystemClient);
    self->_hidSystemClient = 0;
  }
}

void __42__BLControl_copyBLControlPropertyWithkey___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v10 = (void *)[a2 copyPropertyForKey:@"CBDisplayIsBuiltIn"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v10 BOOLValue])
  {
    id v9 = (id)[a2 copyPropertyForKey:@"EventTimestampFirstALSSample"];
    id v8 = (id)[a2 copyPropertyForKey:@"EventTimestampDisplayOn"];
    id v7 = (id)[a2 copyPropertyForKey:@"EventTimestampDisplayOff"];
    id v6 = (id)[a2 copyPropertyForKey:@"EventTimestampFirstALSSampleTimeout"];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    if (v9) {
      [v5 setObject:v9 forKey:@"EventTimestampFirstALSSample"];
    }
    if (v8) {
      [v5 setObject:v8 forKey:@"EventTimestampDisplayOn"];
    }
    if (v7) {
      [v5 setObject:v7 forKey:@"EventTimestampDisplayOff"];
    }
    if (v6) {
      [v5 setObject:v6 forKey:@"EventTimestampFirstALSSampleTimeout"];
    }

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = v5;
    *a4 = 1;
  }
}

void __51__BLControl_copyPropertyInternalWithKey_forClient___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = (id)[a2 copyPropertyForKey:@"DisplayTypeA"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 intValue] == *(_DWORD *)(a1 + 48))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copyPropertyForKey:*(void *)(a1 + 32)];
    *a4 = 1;
  }
}

uint64_t __51__BLControl_copyPropertyInternalWithKey_forClient___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v4 = [a3 copyPropertyForKey:*(void *)(a1 + 32)];
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v4;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
  return result;
}

- (void)handlePresetChange
{
  unint64_t v2 = +[CBPresetsParser sharedInstance];
  [(CBPresetsParser *)v2 refreshPresetState];
  -[NightModeControl setProperty:forKey:](self->_nightModeControl, "setProperty:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[CBPresetsParser nightShiftDisabled](v2, "nightShiftDisabled")), @"CBDisplayPresetDisableNightShift");
  -[BLControl setPropertyInternalWithKey:property:client:](self, "setPropertyInternalWithKey:property:client:", @"kCoreBrightnessPresetStateChanged", 0);
}

- (void)handleExternalDisplayChange
{
  SEL v15 = self;
  SEL v14 = a2;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  char v13 = 0;
  displayContainers = self->_displayContainers;
  uint64_t v3 = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __40__BLControl_handleExternalDisplayChange__block_invoke;
  id v7 = &unk_1E621A028;
  id v8 = &v9;
  -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:");
  -[BLControl setPropertyInternalWithKey:property:client:](v15, "setPropertyInternalWithKey:property:client:", @"CBHasExternalDisplay", [NSNumber numberWithBool:v10[3] & 1], 0);
  _Block_object_dispose(&v9, 8);
}

void __40__BLControl_handleExternalDisplayChange__block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (id)[a2 copyPropertyForKey:@"CBDisplayIsExternal"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24) & 1 | [v3 BOOLValue] & 1) != 0;
  }
}

uint64_t __50__BLControl_setBLControlPropertyWithKey_property___block_invoke(uint64_t a1, __IOHIDServiceClient *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = IOHIDServiceClientConformsTo(a2, 0xFF00u, 4u);
  if (result)
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t result = [*(id *)(a1 + 32) handleHIDEvent:*(void *)(a1 + 40) from:a2];
      *a4 = 1;
    }
  }
  return result;
}

uint64_t __50__BLControl_setBLControlPropertyWithKey_property___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F14213F8];
  if (result)
  {
    uint64_t result = [a2 handleDisplayModeUpdate:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                           + 24) & 1 | result & 1) != 0;
  }
  return result;
}

uint64_t __50__BLControl_setBLControlPropertyWithKey_property___block_invoke_251(void *a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141D7A8];
  if (result)
  {
    uint64_t result = [a2 setProperty:a1[4] forKey:a1[5]];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (*(unsigned char *)(*(void *)(a1[6] + 8) + 24) & 1 | result & 1) != 0;
  }
  return result;
}

void __56__BLControl_setPropertyInternalWithKey_property_client___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = (id)[a2 copyPropertyForKey:@"DisplayTypeA"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 intValue] == *(_DWORD *)(a1 + 56))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [a2 setProperty:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)] & 1;
    *a4 = 1;
  }
}

void *__56__BLControl_setPropertyInternalWithKey_property_client___block_invoke_3(void *a1, uint64_t a2, void *a3)
{
  char v3 = [a3 setProperty:a1[4] forKey:a1[5]];
  uint64_t result = a1;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (*(unsigned char *)(*(void *)(a1[6] + 8) + 24) & 1 | v3 & 1) != 0;
  return result;
}

- (BOOL)handleDisplayModeUpdatePropertyHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v19 = 0;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v18 = (void *)[a3 objectForKey:@"Value"];
    uint64_t v17 = (void *)[a3 objectForKey:@"TransitionLength"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = [v18 integerValue];
        [v17 floatValue];
        float v15 = v3;
        float v14 = 0.02;
        if (self->_logHandle)
        {
          logHandle = self->_logHandle;
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
          __os_log_helper_16_2_3_8_66_4_0_8_0((uint64_t)v23, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:v16], v16, COERCE__INT64(v15));
          _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "[Display Mode] Update handler - new mode: %{public}@ (%d), transition length: %f", v23, 0x1Cu);
        }
        if (v16)
        {
          uint64_t v7 = v16;
          char v6 = 1;
        }
        else
        {
          uint64_t v7 = 0;
          char v6 = 0;
        }
        if (v6)
        {
          char v13 = self->_logHandle;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            __os_log_helper_16_0_1_4_0((uint64_t)v22, v16);
            _os_log_fault_impl(&dword_1BA438000, v13, OS_LOG_TYPE_FAULT, "[Display Mode] Failed to handle unexpected display mode = %d", v22, 8u);
          }
          char v19 = 0;
        }
        else
        {
          switch(v7)
          {
            case 0:
              *(float *)&double v5 = v15;
              [(BLControl *)self setDisplayFactor:0.0 transitionLength:v5];
              float v14 = 0.03;
              char v19 = 1;
              break;
            case 1:
            case 3:
              *(float *)&double v5 = v15;
              LODWORD(v4) = 1.0;
              [(BLControl *)self setDisplayFactor:v4 transitionLength:v5];
              char v19 = 1;
              break;
            case 2:
              *(float *)&double v5 = v15;
              [(BLControl *)self setDisplayFactor:0.0 transitionLength:v5];
              char v19 = 1;
              break;
            case 4:
              *(float *)&double v5 = v15;
              LODWORD(v4) = 1028443341;
              [(BLControl *)self setDisplayFactor:v4 transitionLength:v5];
              char v19 = 1;
              break;
            default:
              JUMPOUT(0);
          }
        }
        *(float *)&double v8 = v15 + v14;
        [(BLControl *)self scheduleDisplayModeCompletionTimerIn:v16 forDisplayMode:v8];
      }
    }
  }
  return v19 & 1;
}

- (BOOL)setDisplayFactor:(float)a3 transitionLength:(float)a4
{
  context = (void *)MEMORY[0x1BA9ECAE0]();
  *(float *)&double v4 = a4;
  -[BLControl setPropertyInternalWithKey:property:client:](self, "setPropertyInternalWithKey:property:client:", @"DisplayBrightnessFadePeriod", [NSNumber numberWithFloat:v4]);
  *(float *)&double v5 = a3;
  char v8 = -[BLControl setPropertyInternalWithKey:property:client:](self, "setPropertyInternalWithKey:property:client:", @"DisplayBrightnessFactorWithFade", [NSNumber numberWithFloat:v5], 0);
  return v8 & 1;
}

- (void)waitForALSArrival
{
  v53 = self;
  SEL v52 = a2;
  uint64_t v51 = dispatch_queue_create("com.apple.CoreBrightness.initQueue", 0);
  if (v51)
  {
    CFTypeRef v50 = (CFTypeRef)IOHIDEventSystemClientCreate();
    if (v50)
    {
      id v49 = [(BLControl *)v53 newDevicePariMatchingDictionaryWithPage:65280 andUsage:4];
      if (v49)
      {
        IOHIDEventSystemClientSetMatching();
        CFRelease(v49);
      }
      uint64_t v42 = 0;
      uint64_t v43 = &v42;
      int v44 = 1375731712;
      int v45 = 48;
      char v46 = __Block_byref_object_copy__15;
      char v47 = __Block_byref_object_dispose__15;
      uint64_t v48 = 0;
      uint64_t block = MEMORY[0x1E4F143A8];
      int v34 = -1073741824;
      int v35 = 0;
      char v36 = __30__BLControl_waitForALSArrival__block_invoke;
      SEL v37 = &unk_1E621A0F0;
      CFTypeRef v41 = v50;
      SEL v38 = v53;
      v40 = &v42;
      char v39 = v51;
      dispatch_sync(v51, &block);
      if (v43[5])
      {
        dsema = v43[5];
        dispatch_time_t v2 = dispatch_time(0, 5000000000);
        if (dispatch_semaphore_wait(dsema, v2))
        {
          SEL v32 = 0;
          if (v53->_logHandle)
          {
            logHandle = v53->_logHandle;
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
          SEL v32 = logHandle;
          char v31 = 16;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
          {
            log = v32;
            os_log_type_t type = v31;
            __os_log_helper_16_0_0(v30);
            _os_log_error_impl(&dword_1BA438000, log, type, "(CBU_ShouldWaitForALS) error: timeout waiting for ALS arrival", v30, 2u);
          }
        }
        else
        {
          id v29 = 0;
          if (v53->_logHandle)
          {
            uint64_t v10 = v53->_logHandle;
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
          id v29 = v10;
          os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v7 = v29;
            os_log_type_t v8 = v28;
            __os_log_helper_16_0_0(v27);
            _os_log_impl(&dword_1BA438000, v7, v8, "(CBU_ShouldWaitForALS) service arrived in time", v27, 2u);
          }
        }
        uint64_t v19 = MEMORY[0x1E4F143A8];
        int v20 = -1073741824;
        int v21 = 0;
        int v22 = __30__BLControl_waitForALSArrival__block_invoke_276;
        uint64_t v23 = &unk_1E6219808;
        int v25 = &v42;
        CFTypeRef v26 = v50;
        uint64_t v24 = v51;
        dispatch_sync(v51, &v19);
      }
      else
      {
        os_log_t oslog = 0;
        if (v53->_logHandle)
        {
          char v6 = v53->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v5 = init_default_corebrightness_log();
          }
          char v6 = v5;
        }
        os_log_t oslog = v6;
        os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          float v3 = oslog;
          os_log_type_t v4 = v17;
          __os_log_helper_16_0_0(v16);
          _os_log_impl(&dword_1BA438000, v3, v4, "(CBU_ShouldWaitForALS) found service right away, skip waiting", v16, 2u);
        }
      }
      CFRelease(v50);
      _Block_object_dispose(&v42, 8);
    }
    CFRelease(v51);
  }
}

void __30__BLControl_waitForALSArrival__block_invoke(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  CFArrayRef v9 = 0;
  CFArrayRef v9 = IOHIDEventSystemClientCopyServices(*(IOHIDEventSystemClientRef *)(a1 + 56));
  if (!v9 || !CFArrayGetCount(v9))
  {
    os_log_type_t v8 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 112))
    {
      os_log_type_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_type_t v4 = inited;
    }
    os_log_type_t v8 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      log = v8;
      os_log_type_t type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_impl(&dword_1BA438000, log, type, "(CBU_ShouldWaitForALS) service not found, wait for ALS arrival", v6, 2u);
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = dispatch_semaphore_create(0);
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      IOHIDEventSystemClientScheduleWithDispatchQueue();
      IOHIDEventSystemClientRegisterDeviceMatchingBlock();
    }
  }
  if (v9) {
    CFRelease(v9);
  }
}

intptr_t __30__BLControl_waitForALSArrival__block_invoke_275(intptr_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40)) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(result + 32) + 8) + 40));
  }
  return result;
}

uint64_t __30__BLControl_waitForALSArrival__block_invoke_276(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = 0;
  IOHIDEventSystemClientUnregisterDeviceMatchingBlock();
  return MEMORY[0x1BA9EBFF0](a1[6], a1[4]);
}

- (void)registerNotificationBlock:(id)a3
{
  char v13 = self;
  SEL v12 = a2;
  id v11 = a3;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  os_log_type_t v7 = __39__BLControl_registerNotificationBlock___block_invoke;
  os_log_type_t v8 = &unk_1E621A118;
  CFArrayRef v9 = v13;
  id v10 = a3;
  dispatch_sync(queue, &block);
}

void __39__BLControl_registerNotificationBlock___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    _Block_release(*(const void **)(*(void *)(a1 + 32) + 40));
    *(void *)(*(void *)(a1 + 32) + 40) = 0;
  }
  if (*(void *)(a1 + 40)) {
    *(void *)(*(void *)(a1 + 32) + 40) = _Block_copy(*(const void **)(a1 + 40));
  }
}

- (id)copyStatusInfo
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v4)
  {
    -[NSMutableArray enumerateObjectsUsingBlock:](self->_displayContainers, "enumerateObjectsUsingBlock:");
    [v5 setObject:v4 forKey:@"CBDisplays"];
  }

  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v3)
  {
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_keyboardContainers, "enumerateKeysAndObjectsUsingBlock:");
    [v5 setObject:v3 forKey:@"CBKeyboards"];
  }

  return v5;
}

void __27__BLControl_copyStatusInfo__block_invoke(uint64_t a1, void *a2)
{
  id v4 = (id)[a2 copyPropertyForKey:@"StatusInfo"];
  id v3 = (id)[a2 copyPropertyForKey:@"CBDisplayID"];
  if (v4 && v3) {
    [*(id *)(a1 + 32) setObject:v4 forKey:v3];
  }
}

void __27__BLControl_copyStatusInfo__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)[a3 copyPropertyForKey:@"StatusInfo"];
  if (v4)
  {
    [*(id *)(a1 + 32) setObject:v4 forKey:a2];
  }
}

- (id)copyDisplayList
{
  char v13 = self;
  SEL v12 = a2;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  displayContainers = v13->_displayContainers;
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  os_log_type_t v7 = __28__BLControl_copyDisplayList__block_invoke;
  os_log_type_t v8 = &unk_1E621A140;
  id v9 = v10;
  -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:");
  [v11 setObject:v10 forKey:@"CBDisplayDeviceIDs"];

  return v11;
}

void __28__BLControl_copyDisplayList__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id)[a2 copyPropertyForKey:@"CBDisplayID"];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)copyDisplayInfo
{
  SEL v12 = self;
  SEL v11 = a2;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  displayContainers = v12->_displayContainers;
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  os_log_type_t v7 = __28__BLControl_copyDisplayInfo__block_invoke;
  os_log_type_t v8 = &unk_1E621A140;
  id v9 = v10;
  -[NSMutableArray enumerateObjectsUsingBlock:](displayContainers, "enumerateObjectsUsingBlock:");
  return v10;
}

void __28__BLControl_copyDisplayInfo__block_invoke(uint64_t a1, void *a2)
{
  id v4 = (id)[a2 copyPropertyForKey:@"CBDisplayID"];
  if (v4)
  {
    id v3 = (id)[a2 copyPropertyForKey:@"CBContainerInfo"];
    if (v3)
    {
      [*(id *)(a1 + 32) setObject:v3 forKey:v4];
    }
  }
}

- (BOOL)useSyncBrightnessTransactionForDisplay:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v6 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![a3 displayType]) {
    BOOL v6 = (CBU_IsSyncBrightnessTransactionsSupported() & 1) != 0 || ([a3 brightnessAvailable] & 1) != 0;
  }
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
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
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v9, [a3 displayId], v6);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Display ID: %d, UseSyncBrightnessTransactionForDisplay: %d", v9, 0xEu);
  }
  return v6;
}

- (void)addDisplayContainer:(id)a3
{
  context = (void *)MEMORY[0x1BA9ECAE0]();
  [(NSMutableArray *)self->_displayContainers addObject:a3];
  if (self->_nightModeControl) {
    [(NightModeControl *)self->_nightModeControl addSupportObject:a3];
  }
  else {
    self->_nightModeControl = -[NightModeControl initWithSupportObject:queue:callback:]([NightModeControl alloc], "initWithSupportObject:queue:callback:", a3, self->_queue);
  }
  -[CBPresetsParser setDisplayList:](+[CBPresetsParser sharedInstance](CBPresetsParser, "sharedInstance"), "setDisplayList:", objc_msgSend(-[BLControl copyDisplayList](self, "copyDisplayList"), "objectForKeyedSubscript:", @"CBDisplayDeviceIDs"));
}

uint64_t __33__BLControl_addDisplayContainer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendNotificationFor:withValue:", a2, a3, a1, a3, a2, a1);
}

- (void)removeDisplayContainer:(id)a3
{
  context = (void *)MEMORY[0x1BA9ECAE0]();
  [(NSMutableArray *)self->_displayContainers removeObject:a3];
  if (self->_nightModeControl && ([a3 conformsToProtocol:&unk_1F1420540] & 1) != 0) {
    [(NightModeControl *)self->_nightModeControl removeSupportObject:a3];
  }
  -[CBPresetsParser setDisplayList:](+[CBPresetsParser sharedInstance](CBPresetsParser, "sharedInstance"), "setDisplayList:", objc_msgSend(-[BLControl copyDisplayList](self, "copyDisplayList"), "objectForKeyedSubscript:", @"CBDisplayDeviceIDs"));
}

- (BOOL)initKeyboardBacklightHIDManager
{
  uint64_t v19 = self;
  SEL v18 = a2;
  self->_keyboardBacklightHIDManager = (HIDManager *)objc_alloc_init(MEMORY[0x1E4F64D00]);
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  context = (void *)MEMORY[0x1BA9ECAE0]();
  [v17 addObject:&unk_1F14184B8];
  [v17 addObject:&unk_1F1418508];
  [v19->_keyboardBacklightHIDManager setDeviceMatching:v17];

  v11[0] = 0;
  v11[1] = v11;
  int v12 = 1375731712;
  int v13 = 48;
  float v14 = __Block_byref_object_copy__15;
  float v15 = __Block_byref_object_dispose__15;
  uint64_t v16 = v19;
  keyboardBacklightHIDManager = v19->_keyboardBacklightHIDManager;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  os_log_type_t v8 = __44__BLControl_initKeyboardBacklightHIDManager__block_invoke;
  id v9 = &unk_1E621A168;
  uint64_t v10 = v11;
  -[HIDManager setDeviceNotificationHandler:](keyboardBacklightHIDManager, "setDeviceNotificationHandler:");
  [v19->_keyboardBacklightHIDManager setDispatchQueue:v19->_queue];
  [v19->_keyboardBacklightHIDManager activate];
  _Block_object_dispose(v11, 8);
  return 1;
}

uint64_t __44__BLControl_initKeyboardBacklightHIDManager__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) keyboardBacklightHIDDeviceArrived:a2];
  }
  else {
    return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) keyboardBacklightHIDDeviceRemoved:a2];
  }
}

- (void)keyboardBacklightHIDDeviceArrived:(id)a3
{
  float v14 = self;
  SEL v13 = a2;
  id v12 = a3;
  id v3 = a3;
  queue = v14->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  os_log_type_t v8 = __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke;
  id v9 = &unk_1E62196A0;
  id v10 = v12;
  SEL v11 = v14;
  dispatch_async(queue, &block);
}

void __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke(uint64_t a1)
{
  kern_return_t v23;
  uint8_t v24[15];
  os_log_type_t v25;
  os_log_t v26;
  io_registry_entry_t entry;
  os_log_type_t v28;
  os_log_t oslog;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void *v34;
  CBKeyboardBacklightContainer *v35;
  uint64_t v36;
  int v37;
  int v38;
  void (*v39)(uint64_t, void *, uint64_t, unsigned char *);
  void *v40;
  CBKeyboardBacklightContainer *v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t (*v45)(uint64_t, uint64_t, uint64_t);
  void *v46;
  uint64_t v47;
  CBKeyboardBacklightContainer *v48;
  id v49;
  os_log_type_t v50;
  os_log_t v51;
  os_log_type_t v52;
  os_log_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t v58[16];
  uint8_t v59[32];
  uint8_t v60[24];
  uint64_t v61;

  os_log_type_t v61 = *MEMORY[0x1E4F143B8];
  v57 = a1;
  int v56 = a1;
  v55 = 0;
  v55 = (void *)[*(id *)(a1 + 32) propertyForKey:@"KeyboardUniqueID"];
  CFTypeRef v54 = 0;
  if (v55)
  {
    CFTypeRef v54 = v55;
  }
  else
  {
    CFTypeRef v54 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", +[KeyboardBacklight getHashIDForDevice:](KeyboardBacklight, "getHashIDForDevice:", *(void *)(a1 + 32)));
    v53 = 0;
    if (*(void *)(*(void *)(a1 + 40) + 112))
    {
      SEL v18 = *(NSObject **)(*(void *)(a1 + 40) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      SEL v18 = inited;
    }
    v53 = v18;
    SEL v52 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v60, (uint64_t)v54);
      _os_log_debug_impl(&dword_1BA438000, v53, v52, "Keyboard ID Hash = %@", v60, 0xCu);
    }
  }
  uint64_t v51 = 0;
  if (*(void *)(*(void *)(a1 + 40) + 112))
  {
    uint64_t v16 = *(NSObject **)(*(void *)(a1 + 40) + 112);
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
  uint64_t v51 = v16;
  CFTypeRef v50 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_66_8_66((uint64_t)v59, (uint64_t)v54, *(void *)(a1 + 32));
    _os_log_impl(&dword_1BA438000, v51, v50, "Keyboard backlight HID device (ID=%{public}@) arrived = %{public}@", v59, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v49 = 0;
    id v49 = (id)[*(id *)(*(void *)(a1 + 40) + 136) objectForKey:v54];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(*(id *)(a1 + 40), "keyboardBacklightHIDDeviceRemovedInternal:", objc_msgSend(v49, "device"));
    }
    uint64_t v48 = 0;
    uint64_t v48 = [[CBKeyboardBacklightContainer alloc] initWithDevice:*(void *)(a1 + 32)];
    [(CBContainer *)v48 scheduleWithDispatchQueue:*(void *)(*(void *)(a1 + 40) + 24)];
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = -1073741824;
    int v44 = 0;
    int v45 = __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke_327;
    char v46 = &unk_1E62190B8;
    char v47 = *(void *)(a1 + 40);
    -[CBContainer registerNotificationBlock:](v48, "registerNotificationBlock:");
    uint64_t v1 = *(void **)(*(void *)(a1 + 40) + 96);
    char v36 = MEMORY[0x1E4F143A8];
    SEL v37 = -1073741824;
    SEL v38 = 0;
    char v39 = __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke_2;
    v40 = &unk_1E62191C8;
    CFTypeRef v41 = v48;
    objc_msgSend(v1, "enumerateObjectsUsingBlock:");
    if ([(CBKeyboardBacklightContainer *)v48 start])
    {
      [*(id *)(*(void *)(a1 + 40) + 136) setObject:v48 forKey:v54];
      dispatch_time_t v2 = *(void **)(*(void *)(a1 + 40) + 104);
      id v30 = MEMORY[0x1E4F143A8];
      char v31 = -1073741824;
      SEL v32 = 0;
      SEL v33 = __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke_3;
      int v34 = &unk_1E62191C8;
      int v35 = v48;
      objc_msgSend(v2, "enumerateObjectsUsingBlock:");
    }

    os_log_t oslog = 0;
    if (*(void *)(*(void *)(a1 + 40) + 112))
    {
      float v14 = *(NSObject **)(*(void *)(a1 + 40) + 112);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v13 = init_default_corebrightness_log();
      }
      float v14 = v13;
    }
    os_log_t oslog = v14;
    os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v58, *(void *)(*(void *)(a1 + 40) + 136));
      _os_log_impl(&dword_1BA438000, oslog, v28, "Keyboard added to dictionary = %{public}@", v58, 0xCu);
    }
    entry = 0;
    mach_port_t mainPort = *MEMORY[0x1E4F2EEF0];
    CFDictionaryRef v3 = IOServiceMatching("IOResources");
    entry = IOServiceGetMatchingService(mainPort, v3);
    if (entry)
    {
      uint64_t v23 = 0;
      uint64_t v23 = IORegistryEntrySetCFProperty(entry, @"KeyboardBacklight", (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
      if (v23)
      {
        os_log_t v22 = 0;
        if (*(void *)(*(void *)(a1 + 40) + 112))
        {
          int v7 = *(NSObject **)(*(void *)(a1 + 40) + 112);
        }
        else
        {
          uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
          int v7 = v6;
        }
        os_log_t v22 = v7;
        os_log_type_t v21 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          id v4 = v22;
          os_log_type_t v5 = v21;
          __os_log_helper_16_0_0(v20);
          _os_log_error_impl(&dword_1BA438000, v4, v5, "failed to set KeyboardBacklight property to IOResources", v20, 2u);
        }
      }
      IOObjectRelease(entry);
    }
    else
    {
      CFTypeRef v26 = 0;
      if (*(void *)(*(void *)(a1 + 40) + 112))
      {
        SEL v11 = *(NSObject **)(*(void *)(a1 + 40) + 112);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v10 = init_default_corebrightness_log();
        }
        SEL v11 = v10;
      }
      CFTypeRef v26 = v11;
      int v25 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        os_log_type_t v8 = v26;
        os_log_type_t v9 = v25;
        __os_log_helper_16_0_0(v24);
        _os_log_error_impl(&dword_1BA438000, v8, v9, "failed to get IOResources entry", v24, 2u);
      }
    }
    [*(id *)(a1 + 40) sendNotificationWithKeyboardIDs];
  }
  if (!v55) {
}
  }

uint64_t __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke_327(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendNotificationFor:withValue:", a2, a3, a1, a3, a2, a1);
}

void __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 conformsToProtocol:&unk_1F141D7A8])
  {
    id v6 = (id)[a2 copyPropertyForKey:@"CBDisplayIsBuiltIn"];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 BOOLValue])
    {
      id v5 = (id)[a2 copyPropertyForKey:@"DisplayBrightnessFactor"];
      if (v5)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [*(id *)(a1 + 32) setProperty:v5 forKey:@"CBUserActivityUpdate"];
        }
      }

      *a4 = 1;
    }
  }
}

uint64_t __47__BLControl_keyboardBacklightHIDDeviceArrived___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addHIDServiceClient:a2];
}

- (void)keyboardBacklightHIDDeviceRemovedInternal:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = [a3 propertyForKey:@"KeyboardUniqueID"];
  if (v15)
  {
    float v14 = (void *)v15;
  }
  else
  {
    float v14 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", +[KeyboardBacklight getHashIDForDevice:](KeyboardBacklight, "getHashIDForDevice:", a3));
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
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
      __os_log_helper_16_2_1_8_64((uint64_t)v21, (uint64_t)v14);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Keyboard ID Hash to remove = %@", v21, 0xCu);
    }
  }
  char v13 = 1;
  if (self->_logHandle)
  {
    os_log_type_t v9 = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v8 = init_default_corebrightness_log();
    }
    os_log_type_t v9 = v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v20, (uint64_t)v14);
    _os_log_impl(&dword_1BA438000, v9, OS_LOG_TYPE_DEFAULT, "KeyboardID = %{public}@", v20, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = (void *)[(NSMutableDictionary *)self->_keyboardContainers objectForKey:v14];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((id)[v12 device] == a3)
      {
        [v12 stop];
        [v12 unregisterNotificationBlock];
        [v12 unscheduleWithDispatchQueue:self->_queue];
      }
      else
      {
        char v13 = 0;
        if (self->_logHandle)
        {
          int v7 = self->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v6 = init_default_corebrightness_log();
          }
          int v7 = v6;
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_66((uint64_t)v19, (uint64_t)a3);
          _os_log_impl(&dword_1BA438000, v7, OS_LOG_TYPE_DEFAULT, "Keyboard HID device was not present already = %{public}@", v19, 0xCu);
        }
      }
    }
    if (v13)
    {
      [(NSMutableDictionary *)self->_keyboardContainers removeObjectForKey:v14];
      if (self->_logHandle)
      {
        id v5 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v4 = init_default_corebrightness_log();
        }
        id v5 = v4;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t v3 = v5;
        __os_log_helper_16_2_1_8_66((uint64_t)v18, (uint64_t)a3);
        _os_log_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEFAULT, "Keyboard HID device has been removed = %{public}@", v18, 0xCu);
      }
    }
    [(BLControl *)self sendNotificationWithKeyboardIDs];
  }
  if (!v15) {
}
  }

- (void)keyboardBacklightHIDDeviceRemoved:(id)a3
{
  float v14 = self;
  SEL v13 = a2;
  id v12 = a3;
  id v3 = a3;
  queue = v14->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  uint64_t v8 = __47__BLControl_keyboardBacklightHIDDeviceRemoved___block_invoke;
  os_log_type_t v9 = &unk_1E62196A0;
  uint64_t v10 = v14;
  id v11 = v12;
  dispatch_async(queue, &block);
}

void __47__BLControl_keyboardBacklightHIDDeviceRemoved___block_invoke(uint64_t a1)
{
}

- (void)sendNotificationWithKeyboardIDs
{
  dispatch_time_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithPropertyKey:@"KeyboardBacklightIDs" keyboardID:1];
  [(BLControl *)self sendNotificationFor:v2 withValue:[(NSMutableDictionary *)self->_keyboardContainers allKeys]];
}

- (void)handleUserIsActiveStateChange:(BOOL)a3
{
}

- (void)releaseDisplayModeCompletionTimer
{
  uint64_t v10 = self;
  SEL v9 = a2;
  if (self->_displayModeCompletionTimer)
  {
    uint64_t v8 = 0;
    if (v10->_logHandle)
    {
      logHandle = v10->_logHandle;
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
    uint64_t v8 = logHandle;
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      log = v8;
      os_log_type_t type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_impl(&dword_1BA438000, log, type, "[Display Mode] Release scheduled display mode completion timer", v6, 2u);
    }
    dispatch_source_cancel((dispatch_source_t)v10->_displayModeCompletionTimer);
    dispatch_release((dispatch_object_t)v10->_displayModeCompletionTimer);
    v10->_displayModeCompletionTimer = 0;
  }
}

- (void)scheduleDisplayModeCompletionTimerIn:(float)a3 forDisplayMode:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v30 = (dispatch_queue_t *)self;
  SEL v29 = a2;
  float v28 = a3;
  int64_t v27 = a4;
  if (self->_displayModeCompletionTimer) {
    [(dispatch_queue_t *)v30 releaseDisplayModeCompletionTimer];
  }
  os_log_t v26 = 0;
  if (v30[14])
  {
    id v11 = v30[14];
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    id v11 = inited;
  }
  os_log_t v26 = v11;
  os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_0_8_66_4_0((uint64_t)v31, COERCE__INT64(v28), (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:v27], v27);
    _os_log_impl(&dword_1BA438000, v26, v25, "[Display Mode] Schedule display mode completion timer in %f sec for %{public}@ (%d) mode", v31, 0x1Cu);
  }
  int64_t v24 = (unint64_t)(float)(v28 * 1000000000.0);
  v30[21] = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v30[3]);
  if (v30[21])
  {
    dispatch_block_t v23 = 0;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v16 = -1073741824;
    int v17 = 0;
    SEL v18 = __65__BLControl_scheduleDisplayModeCompletionTimerIn_forDisplayMode___block_invoke;
    uint64_t v19 = &unk_1E6219BA8;
    int v20 = v30;
    int64_t v21 = v27;
    float v22 = v28;
    dispatch_block_t v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &block);
    if (v23)
    {
      dispatch_source_set_event_handler(v30[21], v23);
      _Block_release(v23);
      source = v30[21];
      dispatch_time_t v4 = dispatch_time(0, v24);
      dispatch_source_set_timer(source, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_activate(v30[21]);
    }
    else
    {
      os_log_t oslog = 0;
      if (v30[14])
      {
        uint64_t v8 = v30[14];
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v7 = init_default_corebrightness_log();
        }
        uint64_t v8 = v7;
      }
      os_log_t oslog = v8;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v5 = oslog;
        os_log_type_t v6 = v13;
        __os_log_helper_16_0_0(v12);
        _os_log_error_impl(&dword_1BA438000, v5, v6, "[Display Mode] Failed to create display mode completion timer", v12, 2u);
      }
    }
  }
}

void __65__BLControl_scheduleDisplayModeCompletionTimerIn_forDisplayMode___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = a1;
  uint64_t v25 = a1;
  os_log_t v24 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 112))
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 32) + 112);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    id v12 = inited;
  }
  os_log_t v24 = v12;
  os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_66_4_0_8_0((uint64_t)v27, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:*(void *)(a1 + 40)], *(void *)(a1 + 40), COERCE__INT64(*(float *)(a1 + 48)));
    _os_log_impl(&dword_1BA438000, v24, v23, "[Display Mode] didCompleteTransitionToDisplayMode %{public}@ (%d in %f seconds)", v27, 0x1Cu);
  }
  float v22 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 112))
  {
    uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 112);
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
  float v22 = v10;
  char v21 = 1;
  unint64_t v20 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v10))
  {
    os_log_type_t v6 = v22;
    os_signpost_type_t v7 = v21;
    os_signpost_id_t spid = v20;
    __os_log_helper_16_0_0(v19);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v6, v7, spid, "DisplayModeSendNotification", (const char *)&unk_1BA61B929, v19, 2u);
  }
  id v18 = 0;
  id v18 = (id)[objc_alloc(NSNumber) initWithInteger:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) sendSyncNotificationFor:@"DisplayModeChangeComplete" withValue:v18];
  int v17 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 112))
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 112);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v4 = init_default_corebrightness_log();
    }
    id v5 = v4;
  }
  int v17 = v5;
  char v16 = 2;
  unint64_t v15 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v5))
  {
    uint64_t v1 = v17;
    os_signpost_type_t v2 = v16;
    os_signpost_id_t v3 = v15;
    __os_log_helper_16_0_0(v14);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v1, v2, v3, "DisplayModeSendNotification", (const char *)&unk_1BA61B929, v14, 2u);
  }
}

- (void)systemSleepMonitorWillWakeFromSleep:(id)a3
{
  id v12 = self;
  SEL v11 = a2;
  id v10 = a3;
  uint64_t v9 = 0;
  if (self->_logHandle)
  {
    logHandle = v12->_logHandle;
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
  uint64_t v9 = logHandle;
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1BA438000, log, type, "System WILL wake from sleep", v7, 2u);
  }
  [(BLControl *)v12 setPropertyInternalWithKey:@"CBSystemWillWakeFromSleep" property:v10 client:0];
}

- (void)systemSleepMonitorDidWakeFromSleep:(id)a3
{
  id v12 = self;
  SEL v11 = a2;
  id v10 = a3;
  uint64_t v9 = 0;
  if (self->_logHandle)
  {
    logHandle = v12->_logHandle;
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
  uint64_t v9 = logHandle;
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1BA438000, log, type, "System DID wake from sleep", v7, 2u);
  }
  [(BLControl *)v12 setPropertyInternalWithKey:@"CBSystemDidWakeFromSleep" property:v10 client:0];
}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  float v14 = self;
  SEL v13 = a2;
  id v12 = a3;
  SEL v11 = (void (**)(void))a4;
  id v10 = 0;
  if (self->_logHandle)
  {
    logHandle = v14->_logHandle;
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
  id v10 = logHandle;
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v10;
    os_log_type_t type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_impl(&dword_1BA438000, log, type, "System is preparing for sleep", v8, 2u);
  }
  [(BLControl *)v14 setPropertyInternalWithKey:@"CBSystemPrepareForSleep" property:v12 client:0];
  v11[2]();
}

@end