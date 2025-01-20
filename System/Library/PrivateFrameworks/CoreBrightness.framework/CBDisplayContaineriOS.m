@interface CBDisplayContaineriOS
- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)createAndAddSliderCommitTelemetryModule;
- (BOOL)findBacklight;
- (BOOL)handleCBBrtCtlDisplayContainerStart;
- (BOOL)handleCBDisplayContainerStart;
- (BOOL)handleDisplayArrival:(unsigned int)a3;
- (BOOL)handleDisplayModeUpdate:(id)a3;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (BOOL)initialiseHIDDisplay;
- (BOOL)isReady;
- (BOOL)matchDisplayWithHidService:(__IOHIDServiceClient *)a3;
- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)setPropertyNoQueue:(id)a3 forKey:(id)a4;
- (BOOL)setupInternalModules;
- (BOOL)start;
- (CBDisplayContaineriOS)initWithBacklightService:(unsigned int)a3;
- (CBDisplayContaineriOS)initWithCADisplay:(id)a3;
- (CBDisplayContaineriOS)initWithCBBrtControl:(id)a3;
- (NSString)description;
- (id)className;
- (id)copyIdentifiers;
- (id)copyPreferenceForKey:(id)a3 user:(id)a4;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyInternalForKey:(id)a3;
- (id)copyStatusInfo;
- (void)dealloc;
- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4 from:(id)a5;
- (void)handlePresetChange:(id)a3;
- (void)registerNotificationBlock:(id)a3;
- (void)sendNotificationForKey:(id)a3 andValue:(id)a4;
- (void)setColorMitigations;
- (void)setNightShiftFactorDictionary:(id)a3;
- (void)setPreference:(id)a3 forKey:(id)a4 user:(id)a5;
- (void)setupInternalBrtCtlModules;
- (void)stop;
- (void)tearDownInternalModules;
- (void)unregisterNotificationBlock;
@end

@implementation CBDisplayContaineriOS

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  v17 = self;
  SEL v16 = a2;
  v15 = a3;
  v14 = a4;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  v9 = __45__CBDisplayContaineriOS_handleHIDEvent_from___block_invoke;
  v10 = &unk_1E6219100;
  v11 = v17;
  v12 = a3;
  v13 = a4;
  dispatch_sync(queue, &block);
  return 1;
}

void __57__CBDisplayContaineriOS_sendNotificationForKey_andValue___block_invoke(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v12 = a1;
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  uint64_t block = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __57__CBDisplayContaineriOS_sendNotificationForKey_andValue___block_invoke_2;
  int v8 = &unk_1E62192B0;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  dispatch_sync(v2, &block);
}

uint64_t __45__CBDisplayContaineriOS_handleHIDEvent_from___block_invoke(void *a1)
{
  uint64_t v10 = a1;
  uint64_t v9 = a1;
  v2 = *(void **)(a1[4] + 48);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  int v6 = __45__CBDisplayContaineriOS_handleHIDEvent_from___block_invoke_2;
  int v7 = &__block_descriptor_48_e15_v32__0_8Q16_B24l;
  uint64_t v8 = a1[5];
  return objc_msgSend(v2, "enumerateObjectsUsingBlock:", MEMORY[0x1E4F143A8], 3221225472, __45__CBDisplayContaineriOS_handleHIDEvent_from___block_invoke_2, &__block_descriptor_48_e15_v32__0_8Q16_B24l, v8, a1[6], v9, v10);
}

uint64_t __45__CBDisplayContaineriOS_handleHIDEvent_from___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A9C8];
  if (result) {
    return [a2 handleHIDEvent:*(void *)(a1 + 32) from:*(void *)(a1 + 40)];
  }
  return result;
}

uint64_t __68__CBDisplayContaineriOS_handleNotificationForKey_withProperty_from___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A890];
  if (result)
  {
    uint64_t result = [a2 isEqual:a1[4]];
    if ((result & 1) == 0) {
      return [a2 handleNotificationForKey:a1[5] withProperty:a1[6]];
    }
  }
  return result;
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4 from:(id)a5
{
  v26 = self;
  SEL v25 = a2;
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  if (([(CBCAManager *)self->_displayCAManager isEqual:a5] & 1) == 0) {
    [(CBCAManager *)v26->_displayCAManager handleNotificationForKey:v24 withProperty:v23];
  }
  modules = v26->_modules;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  int v15 = -1073741824;
  int v16 = 0;
  v17 = __68__CBDisplayContaineriOS_handleNotificationForKey_withProperty_from___block_invoke;
  v18 = &unk_1E62193F0;
  id v19 = v22;
  id v20 = v24;
  id v21 = v23;
  -[NSMutableArray enumerateObjectsUsingBlock:](modules, "enumerateObjectsUsingBlock:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(CBContainerProtocol *)v26->_harmonyContainer handleNotificationForKey:v24 withProperty:v23];
  }
  if (v26->_builtIn)
  {
    char v13 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v24 isEqualToString:@"ALSServiceReady"] & 1) != 0
      && !v26->_alsServiceReady)
    {
      v26->_alsServiceReady = 1;
      char v13 = 1;
    }
    if ((v13 & 1) != 0 && [(CBDisplayContaineriOS *)v26 isReady])
    {
      os_log_t oslog = 0;
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
      os_log_t oslog = logHandle;
      os_log_type_t type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        log = oslog;
        os_log_type_t v7 = type;
        __os_log_helper_16_0_0(v10);
        _os_log_debug_impl(&dword_1BA438000, log, v7, "internal display ready", v10, 2u);
      }
      [(CBDisplayContaineriOS *)v26 sendNotificationForKey:@"CBInternalDisplayReady", MEMORY[0x1E4F1CC38], log andValue];
    }
  }
}

uint64_t __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2 && a3)
  {
    if (*(void *)(*(void *)(result + 32) + 8))
    {
      uint64_t v4 = *(NSObject **)(*(void *)(result + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      uint64_t v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, a2, a3);
      _os_log_debug_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEBUG, "Notification block key=%@, value=%@\n", v8, 0x16u);
    }
    [*(id *)(v5 + 32) handleNotificationForKey:a2 withProperty:a3 from:*(void *)(*(void *)(*(void *)(v5 + 40) + 8) + 40)];
    return [*(id *)(v5 + 32) sendNotificationForKey:a2 andValue:a3];
  }
  return result;
}

uint64_t __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2 && a3)
  {
    if (*(void *)(*(void *)(result + 32) + 8))
    {
      uint64_t v4 = *(NSObject **)(*(void *)(result + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      uint64_t v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, a2, a3);
      _os_log_debug_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEBUG, "Notification block key=%@, value=%@\n", v8, 0x16u);
    }
    [*(id *)(v5 + 32) handleNotificationForKey:a2 withProperty:a3 from:*(void *)(*(void *)(*(void *)(v5 + 40) + 8) + 40)];
    return [*(id *)(v5 + 32) sendNotificationForKey:a2 andValue:a3];
  }
  return result;
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  v18 = self;
  SEL v17 = a2;
  id v16 = a3;
  id v15 = a4;
  if (self->super._notificationQueue)
  {
    id v4 = v16;
    id v5 = v15;
    notificationQueue = v18->super._notificationQueue;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v8 = -1073741824;
    int v9 = 0;
    uint64_t v10 = __57__CBDisplayContaineriOS_sendNotificationForKey_andValue___block_invoke;
    uint64_t v11 = &unk_1E62192B0;
    uint64_t v12 = v18;
    id v13 = v16;
    id v14 = v15;
    dispatch_async(notificationQueue, &block);
  }
}

uint64_t __48__CBDisplayContaineriOS_removeHIDServiceClient___block_invoke(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
  v1 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  os_log_type_t v7 = __48__CBDisplayContaineriOS_removeHIDServiceClient___block_invoke_2;
  int v8 = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  uint64_t v9 = *(void *)(a1 + 40);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:");
}

uint64_t __48__CBDisplayContaineriOS_removeHIDServiceClient___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A9C8];
  if (result) {
    return [a2 removeHIDServiceClient:*(void *)(a1 + 32)];
  }
  return result;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  id v14 = self;
  SEL v13 = a2;
  uint64_t v12 = a3;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __48__CBDisplayContaineriOS_removeHIDServiceClient___block_invoke;
  uint64_t v9 = &unk_1E6219538;
  uint64_t v10 = v14;
  uint64_t v11 = a3;
  dispatch_sync(queue, &block);
  return 1;
}

void __57__CBDisplayContaineriOS_sendNotificationForKey_andValue___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    if ((*(unsigned char *)(*(void *)(a1 + 32) + 141) & 1) != 0
      || ([*(id *)(a1 + 40) isEqual:@"DisplayBrightnessAuto2"] & 1) != 0
      || ([*(id *)(a1 + 40) isEqual:@"DisplayBrightnessAuto2Available"] & 1) != 0
      || ([*(id *)(a1 + 40) isEqual:@"DisplayBrightness2"] & 1) != 0
      || ([*(id *)(a1 + 40) isEqual:@"CEOverride"] & 1) != 0
      || ([*(id *)(a1 + 40) isEqual:@"CEOutput"] & 1) != 0
      || ([*(id *)(a1 + 40) isEqual:@"RLuxOverride"] & 1) != 0
      || ([*(id *)(a1 + 40) isEqual:@"RLuxOutput"] & 1) != 0)
    {
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
    }
    id v2 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithPropertyKey:*(void *)(a1 + 40) andDisplay:*(void *)(*(void *)(a1 + 32) + 144)];
    if (v2)
    {
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
    }
  }
}

uint64_t __44__CBDisplayContaineriOS_setProperty_forKey___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setPropertyNoQueue:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result & 1;
  return result;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  id v24 = self;
  SEL v23 = a2;
  id v22 = a3;
  id v21 = a4;
  uint64_t v16 = 0;
  SEL v17 = &v16;
  int v18 = 0x20000000;
  int v19 = 32;
  char v20 = 0;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  uint64_t v10 = __44__CBDisplayContaineriOS_setProperty_forKey___block_invoke;
  uint64_t v11 = &unk_1E621A000;
  id v15 = &v16;
  uint64_t v12 = v24;
  id v13 = a3;
  id v14 = a4;
  dispatch_sync(queue, &block);
  char v6 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v6 & 1;
}

- (BOOL)setPropertyNoQueue:(id)a3 forKey:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v10 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a4 getKeyDisplayID] == self->_displayID)
    {
      int v9 = (void *)[a4 getKeyString];
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
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v21, (uint64_t)a4, (uint64_t)v9);
        _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ string=%@", v21, 0x16u);
      }
      if (v9)
      {
        if (([v9 isEqualToString:@"DisplayBrightnessAuto"] & 1) != 0
          || ([v9 isEqualToString:@"BrightnessWeakCap"] & 1) != 0
          || ([v9 isEqualToString:@"DisplayBrightness2"] & 1) != 0)
        {
          BOOL v11 = ([(CBContainerModuleProtocol *)self->_displayControlModule setProperty:a3 forKey:v9] & 1) != 0;
          return (v11 | [(CBContainerModuleProtocol *)self->_autoBrightnessModule setProperty:a3 forKey:v9] & 1) != 0;
        }
        else
        {
          BOOL v12 = ([(CBContainerModuleProtocol *)self->_autoBrightnessModule setProperty:a3 forKey:v9] & 1) != 0;
          return (v12 | [(CBContainerModuleProtocol *)self->_displayControlModule setProperty:a3 forKey:v9] & 1) != 0;
        }
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([a4 isEqualToString:@"kCoreBrightnessPresetStateChanged"])
      {
        [(CBDisplayContaineriOS *)self handlePresetChange:+[CBPresetsParser sharedInstance]];
      }
      else if (self->_builtIn || [(NSArray *)self->_allowlist containsObject:a4])
      {
        if (a3 && !self->_displayControlModule)
        {
          [(NSMutableArray *)self->_missedProperties addObject:a3];
          [(NSMutableArray *)self->_missedKeys addObject:a4];
          if (self->super._logHandle)
          {
            char v6 = self->super._logHandle;
          }
          else
          {
            uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            char v6 = v5;
          }
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v20, (uint64_t)a4);
            _os_log_error_impl(&dword_1BA438000, v6, OS_LOG_TYPE_ERROR, "Modules not ready: Caching %@ property", v20, 0xCu);
          }
        }
        if (([a4 isEqualToString:@"DisplayBrightnessAuto"] & 1) != 0
          || ([a4 isEqualToString:@"BrightnessWeakCap"] & 1) != 0
          || ([a4 isEqualToString:@"DisplayBrightness2"] & 1) != 0)
        {
          BOOL v13 = ([(CBContainerModuleProtocol *)self->_displayControlModule setProperty:a3 forKey:a4] & 1) != 0;
          BOOL v10 = (v13 | [(CBContainerModuleProtocol *)self->_autoBrightnessModule setProperty:a3 forKey:a4] & 1) != 0;
        }
        else
        {
          BOOL v14 = ([(CBContainerModuleProtocol *)self->_autoBrightnessModule setProperty:a3 forKey:a4] & 1) != 0;
          BOOL v10 = (v14 | [(CBContainerModuleProtocol *)self->_displayControlModule setProperty:a3 forKey:a4] & 1) != 0;
        }
      }
      BOOL v15 = (v10 | [(CBContainerProtocol *)self->_harmonyContainer setProperty:a3 forKey:a4] & 1) != 0;
      BOOL v16 = (v15 | [(CBContainerModuleProtocol *)self->_AODModule setProperty:a3 forKey:a4] & 1) != 0;
      return (v16 | [(CBContainerModuleProtocol *)self->_SliderCommitTelemetryModule setProperty:a3 forKey:a4] & 1) != 0;
    }
  }
  return v10;
}

uint64_t __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A890];
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

uint64_t __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v11 = a1;
  uint64_t result = [*(id *)(a1 + 32) copyPropertyInternalForKey:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  if (!result)
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v4 = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    int v7 = __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke_4;
    int v8 = &unk_1E6219A10;
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 40);
    return objc_msgSend(v2, "enumerateObjectsUsingBlock:");
  }
  return result;
}

- (id)copyPropertyInternalForKey:(id)a3
{
  id v7 = 0;
  if ([a3 isEqualToString:@"CBDisplayID"]) {
    return (id)[objc_alloc(NSNumber) initWithUnsignedLong:self->_displayID];
  }
  if ([a3 isEqualToString:@"CBDisplayIsBuiltIn"]) {
    return (id)[objc_alloc(NSNumber) initWithBool:self->_builtIn];
  }
  if ([a3 isEqualToString:@"CBDisplayIsExternal"]) {
    return (id)[objc_alloc(NSNumber) initWithBool:self->_isExternal];
  }
  if ([a3 isEqualToString:@"BrightnessControlCapabilities"]) {
    return (id)objc_msgSend((id)-[CBBrightnessProxy getBrightnessCapabilities](self->_brtCtl, "getBrightnessCapabilities"), "copy");
  }
  if ([a3 isEqualToString:@"CBContainerInfo"])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (id)[objc_alloc(NSNumber) initWithBool:self->_builtIn];
    if (v4) {
      [v7 setObject:v4 forKey:@"CBDisplayIsBuiltIn"];
    }

    id v5 = (id)[objc_alloc(NSNumber) initWithUnsignedLong:self->_displayID];
    if (v5) {
      [v7 setObject:v5 forKey:@"CBDisplayID"];
    }

    id v6 = (id)[(NSString *)[(NSUUID *)self->_displayContainerUUID UUIDString] copy];
    if (v6) {
      [v7 setObject:v6 forKey:@"CBDisplayContainerID"];
    }
  }
  else if ([a3 isEqualToString:@"StatusInfo"])
  {
    return [(CBDisplayContaineriOS *)self copyStatusInfo];
  }
  else if ([a3 isEqualToString:@"CBInternalDisplayReady"])
  {
    if (self->_builtIn) {
      return (id)objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[CBDisplayContaineriOS isReady](self, "isReady"));
    }
  }
  else
  {
    return (id)[(CBContainerProtocol *)self->_harmonyContainer copyPropertyForKey:a3];
  }
  return v7;
}

- (id)copyPropertyForKey:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v34 = self;
  SEL v33 = a2;
  id v32 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  int v27 = 1375731712;
  int v28 = 48;
  v29 = __Block_byref_object_copy__16;
  v30 = __Block_byref_object_dispose__16;
  uint64_t v31 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    queue = v34->super._queue;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v18 = -1073741824;
    int v19 = 0;
    char v20 = __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke;
    id v21 = &unk_1E6219300;
    id v22 = v32;
    SEL v23 = v34;
    id v24 = &v25;
    dispatch_sync(queue, &block);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v34->_builtIn || [(NSArray *)v34->_allowlist containsObject:v32]))
    {
      id v4 = v34->super._queue;
      uint64_t v9 = MEMORY[0x1E4F143A8];
      int v10 = -1073741824;
      int v11 = 0;
      uint64_t v12 = __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke_3;
      BOOL v13 = &unk_1E621A3E0;
      BOOL v16 = &v25;
      BOOL v14 = v34;
      id v15 = v32;
      dispatch_sync(v4, &v9);
    }
  }
  if (v34->super._logHandle)
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v35, (uint64_t)v32, v26[5]);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ result=%@", v35, 0x16u);
  }
  id v6 = (void *)v26[5];
  _Block_object_dispose(&v25, 8);
  return v6;
}

uint64_t __45__CBDisplayContaineriOS_addHIDServiceClient___block_invoke(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  uint64_t result = [*(id *)(a1 + 32) matchDisplayWithHidService:*(void *)(a1 + 40)];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
    id v2 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v4 = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    id v7 = __45__CBDisplayContaineriOS_addHIDServiceClient___block_invoke_2;
    int v8 = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
    uint64_t v9 = *(void *)(a1 + 40);
    objc_msgSend(v2, "enumerateObjectsUsingBlock:");
    return [*(id *)(a1 + 32) setColorMitigations];
  }
  return result;
}

- (void)setColorMitigations
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v13 = self;
  SEL v12 = a2;
  memset(__b, 0, sizeof(__b));
  obj = v13->_relevantServices;
  uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v14 count:16];
  if (v7)
  {
    uint64_t v3 = *(void *)__b[2];
    uint64_t v4 = 0;
    unint64_t v5 = v7;
    while (1)
    {
      uint64_t v2 = v4;
      if (*(void *)__b[2] != v3) {
        objc_enumerationMutation(obj);
      }
      IOHIDServiceClientRef v11 = 0;
      IOHIDServiceClientRef v11 = *(IOHIDServiceClientRef *)(__b[1] + 8 * v4);
      IOHIDServiceClientRef service = v11;
      if (v13->_builtIn
        && IOHIDServiceClientConformsTo(v11, 0xFF00u, 4u)
        && [(CBContainerModuleProtocol *)v13->_autoBrightnessModule shouldMitigateHarmony:service])
      {
        int v8 = [[CBALSNode alloc] initWithALSServiceClient:service];
        if ([(CBALSNode *)v8 isColorSupported]) {
          [(CBContainerProtocol *)v13->_harmonyContainer enableMitigations:1];
        }
      }
      ++v4;
      if (v2 + 1 >= v5)
      {
        uint64_t v4 = 0;
        unint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v14 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }
}

- (BOOL)matchDisplayWithHidService:(__IOHIDServiceClient *)a3
{
  SEL v12 = self;
  SEL v11 = a2;
  IOHIDServiceClientRef v10 = a3;
  if (!self->_displayService) {
    return 0;
  }
  id v9 = 0;
  id v8 = (id)IOHIDServiceClientCopyProperty(v10, @"kUSBContainerID");
  BOOL v7 = 0;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
    }
  }

  int valuePtr = 0;
  int v4 = 0;
  CFNumberRef number = (CFNumberRef)IOHIDServiceClientCopyProperty(v10, @"PrimaryUsagePage");
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
  }
  CFNumberRef number = (CFNumberRef)IOHIDServiceClientCopyProperty(v10, @"PrimaryUsage");
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &v4);
    CFRelease(number);
  }
  if (v12->_displayContainerUUID && IOHIDServiceClientConformsTo(v10, 0x20u, 0x41u))
  {
    BOOL v7 = 1;

    return v7;
  }
  else
  {
    BOOL v7 = !v9 && !v12->_displayContainerUUID
      || v9 && v12->_displayContainerUUID && ([v9 isEqual:v12->_displayContainerUUID] & 1) != 0;

    return v7;
  }
}

uint64_t __45__CBDisplayContaineriOS_addHIDServiceClient___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A9C8];
  if (result) {
    return [a2 addHIDServiceClient:*(void *)(a1 + 32)];
  }
  return result;
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  BOOL v14 = self;
  SEL v13 = a2;
  SEL v12 = a3;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __45__CBDisplayContaineriOS_addHIDServiceClient___block_invoke;
  id v9 = &unk_1E6219538;
  IOHIDServiceClientRef v10 = v14;
  SEL v11 = a3;
  dispatch_sync(queue, &block);
  return 1;
}

- (CBDisplayContaineriOS)initWithBacklightService:(unsigned int)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v45 = self;
  SEL v44 = a2;
  unsigned int v43 = a3;
  if (!a3)
  {
    v42 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    v42 = inited;
    char v41 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = v42;
      os_log_type_t v25 = v41;
      __os_log_helper_16_0_0(v40);
      _os_log_error_impl(&dword_1BA438000, log, v25, "invalid backlight service", v40, 2u);
    }
LABEL_52:

    id v45 = 0;
    return 0;
  }
  v39.receiver = v45;
  v39.super_class = (Class)CBDisplayContaineriOS;
  id v45 = [(CBDisplayContaineriOS *)&v39 init];
  if (v45)
  {
    *((_DWORD *)v45 + 34) = v43;
    IOObjectRetain(*((_DWORD *)v45 + 34));
    os_log_t v3 = os_log_create("com.apple.CoreBrightness.CBDisplayContaineriOS", "default");
    *((void *)v45 + 1) = v3;
    if (IORegistryEntryGetRegistryEntryID(*((_DWORD *)v45 + 34), (uint64_t *)v45 + 19))
    {
      v38 = 0;
      if (*((void *)v45 + 1))
      {
        SEL v23 = *((void *)v45 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v22 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v22 = init_default_corebrightness_log();
        }
        SEL v23 = v22;
      }
      v38 = v23;
      char v37 = 16;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        char v20 = v38;
        os_log_type_t type = v37;
        __os_log_helper_16_0_0(v36);
        _os_log_error_impl(&dword_1BA438000, v20, type, "unable to retrieve the registryID", v36, 2u);
      }
      goto LABEL_52;
    }
    *((void *)v45 + 18) = *((void *)v45 + 19);
    int v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.CoreBrightness.CBDisplayContaineriOS", v4);
    *((void *)v45 + 2) = v5;
    if (!*((void *)v45 + 2))
    {
      v35 = 0;
      if (*((void *)v45 + 1))
      {
        int v19 = *((void *)v45 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v18 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v18 = init_default_corebrightness_log();
        }
        int v19 = v18;
      }
      v35 = v19;
      char v34 = 16;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        BOOL v16 = v35;
        os_log_type_t v17 = v34;
        __os_log_helper_16_0_0(v33);
        _os_log_error_impl(&dword_1BA438000, v16, v17, "error: failed to create internal dispatch queue", v33, 2u);
      }
      goto LABEL_52;
    }
    if (IOObjectConformsTo(*((_DWORD *)v45 + 34), "AppleARMBacklight")) {
      *((unsigned char *)v45 + 141) = 1;
    }
    else {
      *((unsigned char *)v45 + 142) = 1;
    }
    id v32 = 0;
    id v32 = (id)IORegistryEntrySearchCFProperty(*((_DWORD *)v45 + 34), "IOService", @"kUSBContainerID", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3u);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v32];
      *((void *)v45 + 8) = v6;
      os_log_t v31 = 0;
      if (*((void *)v45 + 1))
      {
        uint64_t v15 = *((void *)v45 + 1);
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
      os_log_t v31 = v15;
      os_log_type_t v30 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v47, *((void *)v45 + 8));
        _os_log_impl(&dword_1BA438000, v31, v30, "usb container ID = %{public}@", v47, 0xCu);
      }
    }
    else
    {
      v29 = 0;
      if (*((void *)v45 + 1))
      {
        SEL v13 = *((void *)v45 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v12 = init_default_corebrightness_log();
        }
        SEL v13 = v12;
      }
      v29 = v13;
      char v28 = 1;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        IOHIDServiceClientRef v10 = v29;
        os_log_type_t v11 = v28;
        __os_log_helper_16_0_0(v27);
        _os_log_impl(&dword_1BA438000, v10, v11, "no usb container ID", v27, 2u);
      }
    }

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v45 + 5) = v7;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v45 + 6) = v8;
    *((void *)v45 + 26) = 0;
    *((void *)v45 + 22) = 0;
  }
  return (CBDisplayContaineriOS *)v45;
}

- (CBDisplayContaineriOS)initWithCADisplay:(id)a3
{
  char v28 = self;
  SEL v27 = a2;
  v26 = (CADisplay *)a3;
  if (!a3)
  {
    os_log_type_t v25 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_type_t v25 = inited;
    char v24 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = v25;
      os_log_type_t type = v24;
      __os_log_helper_16_0_0(v23);
      _os_log_error_impl(&dword_1BA438000, log, type, "invalid display", v23, 2u);
    }
LABEL_21:

    char v28 = 0;
    return 0;
  }
  v22.receiver = v28;
  v22.super_class = (Class)CBDisplayContaineriOS;
  char v28 = [(CBDisplayContaineriOS *)&v22 init];
  if (v28)
  {
    v28->super._logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.CBDisplayContaineriOS", "default");
    v28->_display = v26;
    os_log_t v3 = v28->_display;
    v28->_displayID = [(CADisplay *)v28->_display displayId];
    int v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v28->super._queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreBrightness.CBDisplayContaineriOS", v4);
    if (!v28->super._queue)
    {
      id v21 = 0;
      if (v28->super._logHandle)
      {
        logHandle = v28->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v8 = init_default_corebrightness_log();
        }
        logHandle = v8;
      }
      id v21 = logHandle;
      char v20 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = v21;
        os_log_type_t v7 = v20;
        __os_log_helper_16_0_0(v19);
        _os_log_error_impl(&dword_1BA438000, v6, v7, "error: failed to create internal dispatch queue", v19, 2u);
      }
      goto LABEL_21;
    }
    v28->_relevantServices = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v28->_modules = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v28->_displayService = 0;
    v28->_isExternal = [(CADisplay *)v26 displayType] == 1;
    v28->_displayCAManager = [[CBCAManager alloc] initWithCADisplay:v26 andQueue:v28->super._queue];
    v13[0] = 0;
    v13[1] = v13;
    int v14 = 1375731712;
    int v15 = 48;
    BOOL v16 = __Block_byref_object_copy__16;
    os_log_type_t v17 = __Block_byref_object_dispose__16;
    displayCAManager = 0;
    displayCAManager = v28->_displayCAManager;
    -[CBModule registerNotificationBlock:](v28->_displayCAManager, "registerNotificationBlock:");
    v28->_brtCtl = 0;
    _Block_object_dispose(v13, 8);
  }
  return v28;
}

uint64_t __43__CBDisplayContaineriOS_initWithCADisplay___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2 && a3)
  {
    if (*(void *)(*(void *)(result + 32) + 8))
    {
      int v4 = *(NSObject **)(*(void *)(result + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      int v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, a2, a3);
      _os_log_debug_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEBUG, "Notification block key=%@, value=%@\n", v8, 0x16u);
    }
    [*(id *)(v5 + 32) handleNotificationForKey:a2 withProperty:a3 from:*(void *)(*(void *)(*(void *)(v5 + 40) + 8) + 40)];
    return [*(id *)(v5 + 32) sendNotificationForKey:a2 andValue:a3];
  }
  return result;
}

- (CBDisplayContaineriOS)initWithCBBrtControl:(id)a3
{
  v29 = self;
  SEL v28 = a2;
  SEL v27 = (CBBrightnessProxy *)a3;
  v26.receiver = self;
  v26.super_class = (Class)CBDisplayContaineriOS;
  v29 = [(CBDisplayContaineriOS *)&v26 init];
  if (!v29) {
    return v29;
  }
  v29->_brtCtl = v27;
  os_log_t v3 = v29->_brtCtl;
  v29->_display = 0;
  unsigned int v4 = [(CBBrightnessProxy *)v29->_brtCtl getDisplayId];
  v29->_displayID = v4;
  id v25 = 0;
  id v20 = [NSString alloc];
  uint64_t v19 = objc_msgSend(-[CBDisplayContaineriOS className](v29, "className"), "cStringUsingEncoding:");
  id v25 = (id)objc_msgSend(v20, "initWithFormat:", @"%s.%s.%u", "com.apple.CoreBrightness", v19, -[CBBrightnessProxy getDisplayId](v29->_brtCtl, "getDisplayId"));
  os_log_t v5 = os_log_create((const char *)[v25 cStringUsingEncoding:1], "default");
  v29->super._logHandle = (OS_os_log *)v5;
  id v21 = (const char *)[v25 cStringUsingEncoding:1];
  uint64_t v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v7 = dispatch_queue_create(v21, v6);
  v29->super._queue = (OS_dispatch_queue *)v7;
  if (v29->super._queue)
  {

    [(CBBrightnessProxy *)v29->_brtCtl setNotificationQueue:v29->super._queue];
    uint64_t v14 = [(CBBrightnessProxy *)v29->_brtCtl getDisplayType];
    BOOL v8 = v14 == [(CBBrightnessProxy *)v29->_brtCtl CBDispTypeExternal];
    v29->_isExternal = v8;
    uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v29->_relevantServices = v9;
    IOHIDServiceClientRef v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v29->_modules = v10;
    v29->_displayService = 0;
    os_log_type_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v29->_missedProperties = v11;
    uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v29->_missedKeys = v12;
    return v29;
  }
  char v24 = 0;
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
  char v24 = logHandle;
  char v23 = 16;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    log = v24;
    os_log_type_t type = v23;
    __os_log_helper_16_0_0(v22);
    _os_log_error_impl(&dword_1BA438000, log, type, "error: failed to create internal dispatch queue", v22, 2u);
  }

  v29 = 0;
  return 0;
}

- (BOOL)findBacklight
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v12 = self;
  SEL v11 = a2;
  char v10 = 0;
  keys[0] = @"backlight-control";
  values = 0;
  values = (void *)*MEMORY[0x1E4F1CFD0];
  CFDictionaryRef v9 = 0;
  os_log_t v3 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  keyCallBacks = (CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  valueCallBacks = (CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  CFDictionaryRef v9 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  uint64_t v14 = @"IOPropertyMatch";
  SEL v13 = v9;
  CFDictionaryRef matching = 0;
  CFDictionaryRef matching = CFDictionaryCreate(*v3, (const void **)&v14, (const void **)&v13, 1, keyCallBacks, valueCallBacks);
  CFRelease(v9);
  io_iterator_t existing = 0;
  if (!IOServiceGetMatchingServices(*MEMORY[0x1E4F2EEF0], matching, &existing) && existing)
  {
    while (1)
    {
      io_object_t object = IOIteratorNext(existing);
      if (!object) {
        break;
      }
      if (v12->_brtCtl && IOObjectConformsTo(object, "AppleARMBacklight"))
      {
        v12->_builtIn = 1;
        v12->_armBacklightDisplayService = object;
        v12->_displayService = object;
        IOObjectRetain(v12->_displayService);
        IOObjectRetain(v12->_armBacklightDisplayService);
      }
      else
      {
        [(CBDisplayContaineriOS *)v12 handleDisplayArrival:object];
      }
      char v10 = 1;
    }
    IOObjectRelease(existing);
  }
  return v10 & 1;
}

- (BOOL)initialiseHIDDisplay
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v9 = 0;
  self->_displayArrivalNotificationPort = IONotificationPortCreate(*MEMORY[0x1E4F2EEF0]);
  if (self->_displayArrivalNotificationPort)
  {
    IONotificationPortSetDispatchQueue(self->_displayArrivalNotificationPort, (dispatch_queue_t)self->super._queue);
    CFMutableDictionaryRef v8 = IOServiceMatching("IOHIDDevice");
    if (v8)
    {
      dispatch_queue_t v7 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:128];
      uint64_t v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:1];
      if (v7 && v6)
      {
        [(__CFDictionary *)v8 setObject:v7 forKey:@"DeviceUsagePage"];
        [(__CFDictionary *)v8 setObject:v6 forKey:@"DeviceUsage"];
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
        __os_log_helper_16_2_1_8_66((uint64_t)v11, (uint64_t)v8);
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "matching: %{public}@", v11, 0xCu);
      }
      IOServiceAddMatchingNotification(self->_displayArrivalNotificationPort, "IOServiceFirstMatch", v8, (IOServiceMatchingCallback)displayArrivalCallback, self, &self->_displayArrivalIterator);
      if (self->_displayArrivalIterator)
      {
        while (1)
        {
          io_object_t v5 = IOIteratorNext(self->_displayArrivalIterator);
          if (!v5) {
            break;
          }
          char v9 = [(CBDisplayContaineriOS *)self handleDisplayArrival:v5];
        }
      }
    }
  }
  return v9 & 1;
}

- (BOOL)handleDisplayArrival:(unsigned int)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v32 = self;
  SEL v31 = a2;
  unsigned int v30 = a3;
  char v29 = 1;
  self->_displayService = a3;
  IOObjectRetain(v32->_displayService);
  id v28 = 0;
  if (IORegistryEntryGetRegistryEntryID(v30, &v32->_registryID))
  {
    os_log_t v22 = 0;
    if (v32->super._logHandle)
    {
      logHandle = v32->super._logHandle;
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
    os_log_t v22 = logHandle;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v34, v30);
      _os_log_error_impl(&dword_1BA438000, v22, v21, "failed to retrieve registry ID for display service %u", v34, 8u);
    }
    char v29 = 0;
  }
  else
  {
    SEL v27 = (__CFString *)IOObjectCopyClass(v30);
    if (v27)
    {
      os_log_t v26 = 0;
      if (v32->super._logHandle)
      {
        int v15 = v32->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v14 = init_default_corebrightness_log();
        }
        int v15 = v14;
      }
      os_log_t v26 = v15;
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_3_4_0_8_0_8_66((uint64_t)v36, v30, v32->_registryID, (uint64_t)v27);
        _os_log_impl(&dword_1BA438000, v26, v25, "display service %u | registry ID 0x%llX | class %{public}@", v36, 0x1Cu);
      }

      if (v32->_brtCtl && v32->_displayService && IOObjectConformsTo(v32->_displayService, "AppleARMBacklight"))
      {
        char v29 = 0;
      }
      else
      {
        if (v32->_displayService && IOObjectConformsTo(v32->_displayService, "AppleARMBacklight")) {
          v32->_builtIn = 1;
        }
        id v28 = (id)IORegistryEntrySearchCFProperty(v32->_displayService, "IOService", @"kUSBContainerID", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3u);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v32->_displayContainerUUID = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v28];
          os_log_t v20 = 0;
          if (v32->super._logHandle)
          {
            char v9 = v32->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v8 = init_default_corebrightness_log();
            }
            char v9 = v8;
          }
          os_log_t v20 = v9;
          os_log_type_t v19 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v33, (uint64_t)v32->_displayContainerUUID);
            _os_log_impl(&dword_1BA438000, v20, v19, "usb container ID = %{public}@", v33, 0xCu);
          }
        }
        else
        {
          uint64_t v18 = 0;
          if (v32->super._logHandle)
          {
            dispatch_queue_t v7 = v32->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v6 = init_default_corebrightness_log();
            }
            dispatch_queue_t v7 = v6;
          }
          uint64_t v18 = v7;
          char v17 = 1;
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            unsigned int v4 = v18;
            os_log_type_t v5 = v17;
            __os_log_helper_16_0_0(v16);
            _os_log_impl(&dword_1BA438000, v4, v5, "no usb container ID", v16, 2u);
          }
        }
        char v29 = [(CBDisplayContaineriOS *)v32 setupInternalModules];
      }
    }
    else
    {
      os_log_t v24 = 0;
      if (v32->super._logHandle)
      {
        SEL v13 = v32->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v12 = init_default_corebrightness_log();
        }
        SEL v13 = v12;
      }
      os_log_t v24 = v13;
      os_log_type_t v23 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v35, v30);
        _os_log_error_impl(&dword_1BA438000, v24, v23, "failed to retrieve class for display service %u", v35, 8u);
      }
      char v29 = 0;
    }
  }

  return v29 & 1;
}

- (void)dealloc
{
  os_log_type_t v5 = self;
  SEL v4 = a2;

  [(CBBrightnessProxy *)v5->_brtCtl unregisterNotificationBlocks];
  if (v5->super._queue)
  {
    dispatch_release((dispatch_object_t)v5->super._queue);
    v5->super._queue = 0;
  }
  if (v5->_displayService)
  {
    IOObjectRelease(v5->_displayService);
    v5->_displayService = 0;
  }
  if (v5->_armBacklightDisplayService)
  {
    IOObjectRelease(v5->_armBacklightDisplayService);
    v5->_armBacklightDisplayService = 0;
  }
  if (v5->super._logHandle)
  {
    uint64_t v2 = &OBJC_IVAR___CBContainer__logHandle;

    v5->super._logHandle = 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)CBDisplayContaineriOS;
  [(CBContainer *)&v3 dealloc];
}

- (NSString)description
{
  os_log_type_t v5 = self;
  SEL v4 = a2;
  if (!self->_description)
  {
    uint64_t v2 = [[NSString alloc] initWithFormat:@"CBDisplayContaineriOS<%p>: ID=%lu built-in=%d service=%u containerID=%@", v5, v5->_displayID, v5->_builtIn, v5->_displayService, v5->_displayContainerUUID, 0];
    v5->_description = (NSString *)v2;
  }
  return v5->_description;
}

uint64_t __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v11 = a1;
  uint64_t result = [*(id *)(a1 + 32) getKeyDisplayID];
  if (result == *(void *)(*(void *)(a1 + 40) + 144))
  {
    uint64_t result = [*(id *)(a1 + 32) getKeyString];
    if (result)
    {
      uint64_t result = objc_msgSend(*(id *)(a1 + 40), "copyPropertyInternalForKey:", objc_msgSend(*(id *)(a1 + 32), "getKeyString"));
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
      if (!result)
      {
        uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 48);
        uint64_t v4 = MEMORY[0x1E4F143A8];
        int v5 = -1073741824;
        int v6 = 0;
        dispatch_queue_t v7 = __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke_2;
        uint64_t v8 = &unk_1E6219A10;
        uint64_t v10 = *(void *)(a1 + 48);
        uint64_t v9 = *(void *)(a1 + 32);
        return objc_msgSend(v2, "enumerateObjectsUsingBlock:");
      }
    }
  }
  return result;
}

uint64_t __44__CBDisplayContaineriOS_copyPropertyForKey___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A890];
  if (result)
  {
    uint64_t result = objc_msgSend(a2, "copyPropertyForKey:", objc_msgSend(*(id *)(a1 + 32), "getKeyString"));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)start
{
  if (self->_brtCtl
    && (uint64_t v3 = [(CBBrightnessProxy *)self->_brtCtl getDisplayType],
        v3 == [(CBBrightnessProxy *)self->_brtCtl CBDispTypeIntegrated]))
  {
    return [(CBDisplayContaineriOS *)self handleCBBrtCtlDisplayContainerStart];
  }
  else
  {
    return [(CBDisplayContaineriOS *)self handleCBDisplayContainerStart];
  }
}

- (void)handlePresetChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "Presets: refershing presets state based on %@", v8, 0xCu);
  }
  if (a3)
  {
    context = (void *)MEMORY[0x1BA9ECAE0]();
    -[CBContainerProtocol setProperty:forKey:](self->_harmonyContainer, "setProperty:forKey:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "trueToneDisabled") & 1), @"CBDisplayPresetDisableHarmony");
    -[CBContainerModuleProtocol setProperty:forKey:](self->_autoBrightnessModule, "setProperty:forKey:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "autoBrightnessDisabledForDisplay:", self->_displayID) & 1));
    -[CBContainerModuleProtocol setProperty:forKey:](self->_displayControlModule, "setProperty:forKey:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "autoBrightnessDisabledForDisplay:", self->_displayID) & 1), @"CBDisplayPresetDisableAutoBrightness");
    -[CBContainerModuleProtocol setProperty:forKey:](self->_displayControlModule, "setProperty:forKey:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "brightnessDisabledForDisplay:", self->_displayID) & 1), @"CBDisplayPresetLockBrightnessUpdates");
  }
}

- (BOOL)handleCBDisplayContainerStart
{
  os_log_t v22 = self;
  SEL v21 = a2;
  uint64_t v16 = 0;
  char v17 = &v16;
  int v18 = 0x20000000;
  int v19 = 32;
  char v20 = 1;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v10 = -1073741824;
  int v11 = 0;
  uint64_t v12 = __54__CBDisplayContaineriOS_handleCBDisplayContainerStart__block_invoke;
  SEL v13 = &unk_1E6219CA8;
  uint64_t v14 = v22;
  int v15 = &v16;
  dispatch_sync(queue, &block);
  id v8 = objc_alloc(MEMORY[0x1E4F1C978]);
  int v6 = &v4;
  uint64_t v7 = objc_msgSend(v8, "initWithObjects:", @"DisplayBrightnessFactorWithFade", @"DisplayBrightnessFactor", @"CBContainerInfo", @"CBDisplayIsBuiltIn", @"CBDisplayIsExternal", @"CBDisplayID", @"DisplayBrightness2Available", @"DisplayBrightness2", @"DisplayBrightnessAuto2Available", @"DisplayBrightnessAuto2", @"StatusInfo", @"DISABLE_HID_INTERFACE", 0);
  v22->_allowlist = (NSArray *)v7;
  int v5 = *((unsigned __int8 *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v5 & 1;
}

void __54__CBDisplayContaineriOS_handleCBDisplayContainerStart__block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v48 = a1;
  uint64_t v47 = a1;
  char v46 = 0;
  char v45 = 1;
  if ([*(id *)(*(void *)(a1 + 32) + 168) isExternal])
  {
    SEL v44 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 8))
    {
      int v18 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      int v18 = inited;
    }
    SEL v44 = v18;
    char v43 = 1;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      log = v44;
      os_log_type_t type = v43;
      __os_log_helper_16_0_0(v42);
      _os_log_impl(&dword_1BA438000, log, type, "External display -> find HID display service.", v42, 2u);
    }

    *(void *)(*(void *)(a1 + 32) + 8) = os_log_create("com.apple.CoreBrightness.CBDisplayContaineriOS", "External");
    if (([*(id *)(a1 + 32) initialiseHIDDisplay] & 1) == 0)
    {
      char v41 = 0;
      if (*(void *)(*(void *)(a1 + 32) + 8))
      {
        uint64_t v14 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      }
      else
      {
        uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        uint64_t v14 = v13;
      }
      char v41 = v14;
      char v40 = 1;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v11 = v41;
        os_log_type_t v12 = v40;
        __os_log_helper_16_0_0(v39);
        _os_log_impl(&dword_1BA438000, v11, v12, "no display service found - waiting for display arrival", v39, 2u);
      }
    }
    char v46 = 1;
    id v38 = 0;
    id v38 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "currentMode"), "colorMode");
    char v45 = ([v38 localizedCaseInsensitiveContainsString:@"YCbCr"] ^ 1) & 1;
    os_log_t v37 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 8))
    {
      int v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v9 = init_default_corebrightness_log();
      }
      int v10 = v9;
    }
    os_log_t v37 = v10;
    os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (v45) {
        v1 = "yes";
      }
      else {
        v1 = "no";
      }
      __os_log_helper_16_2_2_8_66_8_32((uint64_t)v49, (uint64_t)v38, (uint64_t)v1);
      _os_log_impl(&dword_1BA438000, v37, v36, "ColorMode %{public}@ - initialize Color Module=%s", v49, 0x16u);
    }
  }
  else if (*(void *)(*(void *)(a1 + 32) + 168) && ([*(id *)(a1 + 32) findBacklight] & 1) != 0 {
         || ([*(id *)(a1 + 32) handleDisplayArrival:*(unsigned int *)(*(void *)(a1 + 32) + 136)] & 1) != 0)
  }
  {

    *(void *)(*(void *)(a1 + 32) + 8) = os_log_create("com.apple.CoreBrightness.CBDisplayContaineriOS", "BuiltIn");
    char v46 = 1;
  }
  if (v45)
  {
    id v8 = [CBColorModuleiOS alloc];
    uint64_t v2 = (*(unsigned char *)(*(void *)(a1 + 32) + 141) & 1) != 0 ? 1 : 2;
    *(void *)(*(void *)(a1 + 32) + 104) = [(CBColorModuleiOS *)v8 initWithBacklight:*(unsigned int *)(*(void *)(a1 + 32) + 136) andModuleType:v2];
    if (*(void *)(*(void *)(a1 + 32) + 104))
    {
      [*(id *)(*(void *)(a1 + 32) + 104) scheduleWithDispatchQueue:*(void *)(*(void *)(a1 + 32) + 16)];
      [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(*(void *)(a1 + 32) + 104)];
      [*(id *)(*(void *)(a1 + 32) + 104) start];
    }
  }
  v30[0] = 0;
  v30[1] = v30;
  int v31 = 1375731712;
  int v32 = 48;
  SEL v33 = __Block_byref_object_copy__16;
  char v34 = __Block_byref_object_dispose__16;
  uint64_t v35 = 0;
  uint64_t v35 = *(void *)(*(void *)(a1 + 32) + 104);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 104);
  uint64_t v23 = MEMORY[0x1E4F143A8];
  int v24 = -1073741824;
  int v25 = 0;
  os_log_t v26 = __54__CBDisplayContaineriOS_handleCBDisplayContainerStart__block_invoke_150;
  SEL v27 = &unk_1E621A3A8;
  uint64_t v28 = *(void *)(a1 + 32);
  char v29 = v30;
  objc_msgSend(v3, "registerNotificationBlock:");
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 141) & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 104) setProperty:MEMORY[0x1E4F1CC38] forKey:@"ColorFadesEnabled"];
  }
  if ((v46 & 1) == 0)
  {
    os_log_t v22 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 8))
    {
      uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v6 = init_default_corebrightness_log();
      }
      uint64_t v7 = v6;
    }
    os_log_t v22 = v7;
    os_log_type_t v21 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = v22;
      os_log_type_t v5 = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_impl(&dword_1BA438000, v4, v5, "no backlight found", v20, 2u);
    }
    DisplayNotify(1u);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  _Block_object_dispose(v30, 8);
}

uint64_t __54__CBDisplayContaineriOS_handleCBDisplayContainerStart__block_invoke_150(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2 && a3)
  {
    if (*(void *)(*(void *)(result + 32) + 8))
    {
      uint64_t v4 = *(NSObject **)(*(void *)(result + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      uint64_t v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, a2, a3);
      _os_log_debug_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEBUG, "Notification block key=%@, value=%@\n", v8, 0x16u);
    }
    [*(id *)(v5 + 32) handleNotificationForKey:a2 withProperty:a3 from:*(void *)(*(void *)(*(void *)(v5 + 40) + 8) + 40)];
    return [*(id *)(v5 + 32) sendNotificationForKey:a2 andValue:a3];
  }
  return result;
}

- (BOOL)handleCBBrtCtlDisplayContainerStart
{
  os_log_type_t v12 = self;
  SEL v11 = a2;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __60__CBDisplayContaineriOS_handleCBBrtCtlDisplayContainerStart__block_invoke;
  uint64_t v9 = &unk_1E6218FE0;
  int v10 = v12;
  dispatch_sync(queue, &block);
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"DisplayBrightnessFactorWithFade", @"DisplayBrightnessFactor", @"CBContainerInfo", @"CBDisplayIsBuiltIn", @"CBDisplayID", @"DisplayBrightness2Available", @"DisplayBrightness2", @"DisplayBrightnessAuto2Available", @"DisplayBrightnessAuto2", @"StatusInfo", @"DISABLE_HID_INTERFACE", 0);
  v12->_allowlist = (NSArray *)v3;
  return 1;
}

uint64_t __60__CBDisplayContaineriOS_handleCBBrtCtlDisplayContainerStart__block_invoke(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v22 = a1;
  uint64_t v21 = a1;
  [*(id *)(a1 + 32) findBacklight];
  uint64_t v1 = *(void *)(v12 + 32);
  uint64_t v5 = &OBJC_IVAR___CBContainer__logHandle;

  *(void *)(*(void *)(v12 + 32) + 8) = os_log_create("com.apple.CoreBrightness.CBDisplayContaineriOS", "BuiltIn");
  id v20 = 0;
  id v11 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v2 = *(void *)(v12 + 32);
  uint64_t v13 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
  uint64_t v10 = [*(id *)(v2 + 176) brightnessNotificationRequestEDR];
  uint64_t v6 = [*(id *)(*(void *)(v12 + 32) + 176) brightnessNotificationAttached];
  uint64_t v7 = [*(id *)(*(void *)(v12 + 32) + 176) brightnessNotificationPowerOn];
  uint64_t v8 = [*(id *)(*(void *)(v12 + 32) + 176) brightnessNotificationPowerOff];
  uint64_t v9 = [*(id *)(*(void *)(v12 + 32) + 176) brightnessNotificationSecureIndicatorOn];
  id v20 = (id)objc_msgSend(v11, "initWithObjects:", v10, v6, v7, v8, v9, objc_msgSend(*(id *)(*(void *)(v12 + 32) + 176), "brightnessNotificationSecureIndicatorOff"), 0);
  uint64_t v3 = *(void **)(*(void *)(v12 + 32) + v13[712]);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  int v15 = -1073741824;
  int v16 = 0;
  char v17 = __60__CBDisplayContaineriOS_handleCBBrtCtlDisplayContainerStart__block_invoke_2;
  int v18 = &unk_1E621A408;
  uint64_t v19 = *(void *)(v12 + 32);
  objc_msgSend(v3, "registerForNotifications:withBlock:", v20);

  uint64_t result = [*(id *)(*(void *)(v12 + 32) + v13[712]) getBrightnessCapabilities];
  if (result) {
    return [*(id *)(v12 + 32) setupInternalBrtCtlModules];
  }
  return result;
}

void __60__CBDisplayContaineriOS_handleCBBrtCtlDisplayContainerStart__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = a1;
  uint64_t v19 = a2;
  uint64_t v18 = a3;
  uint64_t v17 = a1;
  os_log_t v16 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
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
  os_log_t v16 = v5;
  os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v21, v19, v18);
    _os_log_impl(&dword_1BA438000, v16, v15, "Notification %@ received from CA with payload %@", v21, 0x16u);
  }
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  uint64_t block = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  uint64_t v10 = __60__CBDisplayContaineriOS_handleCBBrtCtlDisplayContainerStart__block_invoke_173;
  id v11 = &unk_1E62192B0;
  uint64_t v12 = v19;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = v18;
  dispatch_async(v3, &block);
}

uint64_t __60__CBDisplayContaineriOS_handleCBBrtCtlDisplayContainerStart__block_invoke_173(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 176), "brightnessNotificationAttached")))
  {
    [*(id *)(a1 + 40) setupInternalBrtCtlModules];
    uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 88);
    [*(id *)(*(void *)(a1 + 40) + 176) brightnessNotificationAttached];
    objc_msgSend(v2, "setProperty:forKey:");
    return objc_msgSend(*(id *)(*(void *)(a1 + 40) + 96), "setProperty:forKey:", 0, objc_msgSend(*(id *)(*(void *)(a1 + 40) + 176), "brightnessNotificationAttached"));
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 176), "brightnessNotificationRequestEDR")))objc_msgSend(*(id *)(*(void *)(a1 + 40) + 88), "setProperty:forKey:", *(void *)(a1 + 48), @"EDRHeadroomRequest"); {
    return objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "enumerateObjectsUsingBlock:");
    }
  }
}

uint64_t __60__CBDisplayContaineriOS_handleCBBrtCtlDisplayContainerStart__block_invoke_2_177(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A890];
  if (result) {
    return [a2 setProperty:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)stop
{
  uint64_t v10 = self;
  SEL v9 = a2;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  uint64_t v6 = __29__CBDisplayContaineriOS_stop__block_invoke;
  uint64_t v7 = &unk_1E6218FE0;
  int v8 = v10;
  dispatch_sync(queue, &block);
}

uint64_t __29__CBDisplayContaineriOS_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tearDownInternalModules", a1, a1);
}

- (BOOL)setupInternalModules
{
  v108 = self;
  SEL v107 = a2;
  v106 = 0;
  if (self->super._logHandle)
  {
    logHandle = v108->super._logHandle;
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
  v106 = logHandle;
  char v105 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v106;
    os_log_type_t type = v105;
    __os_log_helper_16_0_0(v104);
    _os_log_debug_impl(&dword_1BA438000, log, type, (const char *)&unk_1BA61B929, v104, 2u);
  }
  if (IOObjectConformsTo(v108->_displayService, "AppleARMBacklight"))
  {
    if (v108->_display || CBU_IsAccessory())
    {
      uint64_t v2 = [CBDisplayModuleiOS alloc];
      uint64_t v3 = [(CBDisplayModuleiOS *)v2 initWithBacklight:v108->_displayService queue:v108->super._queue display:v108->_display];
      v108->_displayControlModule = (CBContainerModuleProtocol *)v3;
    }
    if (v108->_displayControlModule)
    {
      int v4 = [CBABModuleiOS alloc];
      uint64_t v5 = [(CBABModuleiOS *)v4 initWithDisplayModule:v108->_displayControlModule andQueue:v108->super._queue];
      v108->_autoBrightnessModule = (CBContainerModuleProtocol *)v5;
      if (v108->_autoBrightnessModule)
      {
        [(NSMutableArray *)v108->_modules addObject:v108->_autoBrightnessModule];
        v103 = 0;
        if (v108->super._logHandle)
        {
          v59 = v108->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v58 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v58 = init_default_corebrightness_log();
          }
          v59 = v58;
        }
        v103 = v59;
        char v102 = 2;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          v56 = v103;
          os_log_type_t v57 = v102;
          __os_log_helper_16_0_0(v101);
          _os_log_debug_impl(&dword_1BA438000, v56, v57, "auto brightness module for internal display added", v101, 2u);
        }
        v108->_running = 1;
        [(CBDisplayContaineriOS *)v108 createAndAddSliderCommitTelemetryModule];
      }
      else
      {
        v100 = 0;
        if (v108->super._logHandle)
        {
          v55 = v108->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v54 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v54 = init_default_corebrightness_log();
          }
          v55 = v54;
        }
        v100 = v55;
        char v99 = 16;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          v52 = v100;
          os_log_type_t v53 = v99;
          __os_log_helper_16_0_0(v98);
          _os_log_error_impl(&dword_1BA438000, v52, v53, "error: failed to create auto-brighntess module", v98, 2u);
        }
      }
      [(NSMutableArray *)v108->_modules addObject:v108->_displayControlModule];
      v97 = 0;
      if (v108->super._logHandle)
      {
        v51 = v108->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v50 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v50 = init_default_corebrightness_log();
        }
        v51 = v50;
      }
      v97 = v51;
      char v96 = 2;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v48 = v97;
        os_log_type_t v49 = v96;
        __os_log_helper_16_0_0(v95);
        _os_log_debug_impl(&dword_1BA438000, v48, v49, "control module for internal display added", v95, 2u);
      }
    }
    else
    {
      v94 = 0;
      if (v108->super._logHandle)
      {
        uint64_t v47 = v108->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v46 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v46 = init_default_corebrightness_log();
        }
        uint64_t v47 = v46;
      }
      v94 = v47;
      char v93 = 16;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        SEL v44 = v94;
        os_log_type_t v45 = v93;
        __os_log_helper_16_0_0(v92);
        _os_log_error_impl(&dword_1BA438000, v44, v45, "error: failed to create a display module", v92, 2u);
      }
    }
  }
  else if (IOObjectConformsTo(v108->_displayService, "IOHIDDevice"))
  {
    v91 = 0;
    uint64_t v6 = [CBDisplayModuleHIDiOS alloc];
    v91 = [(CBDisplayModuleHIDiOS *)v6 initWithDevice:v108->_displayService andQueue:v108->super._queue];
    if (v91)
    {
      if ([(CBDisplayModuleHIDiOS *)v91 VID] == 1452 && [(CBDisplayModuleHIDiOS *)v91 PID] == 37415)
      {
        v90 = 0;
        if (v108->super._logHandle)
        {
          char v43 = v108->super._logHandle;
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
        v90 = v43;
        os_log_type_t v89 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          char v40 = v90;
          os_log_type_t v41 = v89;
          __os_log_helper_16_0_0(v88);
          _os_log_impl(&dword_1BA438000, v40, v41, "Thunderbolt display doesn't have brightness support.", v88, 2u);
        }
        v108->_running = 0;
      }
      else
      {
        v108->_displayControlModule = (CBContainerModuleProtocol *)v91;
        [(NSMutableArray *)v108->_modules addObject:v108->_displayControlModule];
        v87 = 0;
        if (v108->super._logHandle)
        {
          objc_super v39 = v108->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v38 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v38 = init_default_corebrightness_log();
          }
          objc_super v39 = v38;
        }
        v87 = v39;
        char v86 = 2;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          os_log_type_t v36 = v87;
          os_log_type_t v37 = v86;
          __os_log_helper_16_0_0(v85);
          _os_log_debug_impl(&dword_1BA438000, v36, v37, "display module for external display added", v85, 2u);
        }
        v108->_running = 1;
        if (v108->_brtCtl)
        {
          context = (void *)MEMORY[0x1BA9ECAE0]();
          -[CBContainerModuleProtocol setProperty:forKey:](v108->_displayControlModule, "setProperty:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CBBrightnessProxy getVendorId](v108->_brtCtl, "getVendorId")), @"CBDisplayVendorID");
          -[CBContainerModuleProtocol setProperty:forKey:](v108->_displayControlModule, "setProperty:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CBBrightnessProxy getProductId](v108->_brtCtl, "getProductId")), @"CBDisplayProductID");
        }
        if ([(CBDisplayModuleHIDiOS *)v91 VID] == 1452 && [(CBDisplayModuleHIDiOS *)v91 PID] == 37443)
        {
          v84 = 0;
          if (v108->super._logHandle)
          {
            char v34 = v108->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v33 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v33 = init_default_corebrightness_log();
            }
            char v34 = v33;
          }
          v84 = v34;
          os_log_type_t v83 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            int v31 = v84;
            os_log_type_t v32 = v83;
            __os_log_helper_16_0_0(v82);
            _os_log_impl(&dword_1BA438000, v31, v32, "VID/PID match Initialise EDR module", v82, 2u);
          }
          uint64_t v7 = [CBEDRModule alloc];
          uint64_t v8 = [(CBEDRModule *)v7 initWithQueue:v108->super._queue display:v108->_display colorModule:v108->_harmonyContainer andDisplayModule:v108->_displayControlModule];
          v108->_edrControlModule = (CBContainerModuleProtocol *)v8;
          if (v108->_edrControlModule) {
            [(NSMutableArray *)v108->_modules addObject:v108->_edrControlModule];
          }
        }
        [(CBDisplayContaineriOS *)v108 sendNotificationForKey:@"DisplayBrightness2Available" andValue:MEMORY[0x1E4F1CC38]];
        SEL v9 = [CBABModuleExternal alloc];
        uint64_t v10 = [(CBABModuleExternal *)v9 initWithDisplayModule:v108->_displayControlModule andQueue:v108->super._queue];
        v108->_autoBrightnessModule = (CBContainerModuleProtocol *)v10;
        if (v108->_autoBrightnessModule)
        {
          [(NSMutableArray *)v108->_modules addObject:v108->_autoBrightnessModule];
          v81 = 0;
          if (v108->super._logHandle)
          {
            unsigned int v30 = v108->super._logHandle;
          }
          else
          {
            uint64_t v29 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            unsigned int v30 = v29;
          }
          v81 = v30;
          char v80 = 2;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            SEL v27 = v81;
            os_log_type_t v28 = v80;
            __os_log_helper_16_0_0(v79);
            _os_log_debug_impl(&dword_1BA438000, v27, v28, "auto brightness module for external display added", v79, 2u);
          }
        }
      }
    }
    else
    {
      v78 = 0;
      if (v108->super._logHandle)
      {
        os_log_t v26 = v108->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v25 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v25 = init_default_corebrightness_log();
        }
        os_log_t v26 = v25;
      }
      v78 = v26;
      char v77 = 16;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = v78;
        os_log_type_t v24 = v77;
        __os_log_helper_16_0_0(v76);
        _os_log_error_impl(&dword_1BA438000, v23, v24, "error: failed to create a display module", v76, 2u);
      }
    }
  }
  else
  {
    v75 = 0;
    if (v108->super._logHandle)
    {
      uint64_t v22 = v108->super._logHandle;
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
    v75 = v22;
    char v74 = 16;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = v75;
      os_log_type_t v20 = v74;
      __os_log_helper_16_0_0(v73);
      _os_log_error_impl(&dword_1BA438000, v19, v20, "unsupported service", v73, 2u);
    }
  }
  if (v108->_brtCtl)
  {
    id v11 = [CBAODModule alloc];
    uint64_t v12 = [(CBAODModule *)v11 initWithCBBrtControl:v108->_brtCtl andQueue:v108->super._queue];
    v108->_AODModule = (CBContainerModuleProtocol *)v12;
    if (v108->_AODModule)
    {
      modules = v108->_modules;
      uint64_t v67 = MEMORY[0x1E4F143A8];
      int v68 = -1073741824;
      int v69 = 0;
      v70 = __45__CBDisplayContaineriOS_setupInternalModules__block_invoke;
      v71 = &unk_1E62191C8;
      v72 = v108;
      -[NSMutableArray enumerateObjectsUsingBlock:](modules, "enumerateObjectsUsingBlock:");
      [(NSMutableArray *)v108->_modules addObject:v108->_AODModule];
    }
    else
    {
      os_log_t oslog = 0;
      if (v108->super._logHandle)
      {
        uint64_t v18 = v108->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v17 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v17 = init_default_corebrightness_log();
        }
        uint64_t v18 = v17;
      }
      os_log_t oslog = v18;
      os_log_type_t v65 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        os_log_type_t v15 = oslog;
        os_log_type_t v16 = v65;
        __os_log_helper_16_0_0(v64);
        _os_log_error_impl(&dword_1BA438000, v15, v16, "Failed to initialize AOD module", v64, 2u);
      }
    }
  }
  -[NSMutableArray enumerateObjectsUsingBlock:](v108->_modules, "enumerateObjectsUsingBlock:");
  -[NSMutableArray enumerateObjectsUsingBlock:](v108->_relevantServices, "enumerateObjectsUsingBlock:");
  [(NSMutableArray *)v108->_modules makeObjectsPerformSelector:sel_start];
  return v108->_running;
}

uint64_t __45__CBDisplayContaineriOS_setupInternalModules__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141AA58];
  if (result) {
    return [*(id *)(*(void *)(a1 + 32) + 120) addModule:a2];
  }
  return result;
}

void __45__CBDisplayContaineriOS_setupInternalModules__block_invoke_215(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = a1;
  id v13 = a2;
  uint64_t v12 = a3;
  uint64_t v11 = a4;
  uint64_t v10 = a1;
  if ([a2 conformsToProtocol:&unk_1F141A890])
  {
    v4[0] = 0;
    v4[1] = v4;
    int v5 = 1375731712;
    int v6 = 48;
    uint64_t v7 = __Block_byref_object_copy__16;
    uint64_t v8 = __Block_byref_object_dispose__16;
    id v9 = v13;
    objc_msgSend(v13, "registerNotificationBlock:");
    _Block_object_dispose(v4, 8);
  }
}

uint64_t __45__CBDisplayContaineriOS_setupInternalModules__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2 && a3)
  {
    if (*(void *)(*(void *)(result + 32) + 8))
    {
      int v4 = *(NSObject **)(*(void *)(result + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      int v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, a2, a3);
      _os_log_debug_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEBUG, "Notification block key=%@, value=%@\n", v8, 0x16u);
    }
    [*(id *)(v5 + 32) handleNotificationForKey:a2 withProperty:a3 from:*(void *)(*(void *)(*(void *)(v5 + 40) + 8) + 40)];
    return [*(id *)(v5 + 32) sendNotificationForKey:a2 andValue:a3];
  }
  return result;
}

uint64_t __45__CBDisplayContaineriOS_setupInternalModules__block_invoke_216(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  uint64_t v7 = a3;
  uint64_t v6 = a4;
  uint64_t v5 = a1;
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "enumerateObjectsUsingBlock:", MEMORY[0x1E4F143A8], 3221225472, __45__CBDisplayContaineriOS_setupInternalModules__block_invoke_2_217, &unk_1E62191C8, a2, a1, a4, a3, a2, a1);
}

uint64_t __45__CBDisplayContaineriOS_setupInternalModules__block_invoke_2_217(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A9C8];
  if (result) {
    return [a2 addHIDServiceClient:*(void *)(a1 + 32)];
  }
  return result;
}

- (void)setupInternalBrtCtlModules
{
  os_log_type_t v65 = self;
  SEL v64 = a2;
  if (!self->_displayControlModule)
  {
    v65->_displayControlModule = (CBContainerModuleProtocol *)[[CBDisplayModuleiOS alloc] initWithBacklight:v65->_armBacklightDisplayService queue:v65->super._queue brtCtl:v65->_brtCtl];
    if (v65->_displayControlModule)
    {
      v65->_autoBrightnessModule = (CBContainerModuleProtocol *)[[CBABModuleiOS alloc] initWithDisplayModule:v65->_displayControlModule andQueue:v65->super._queue];
      if (v65->_autoBrightnessModule)
      {
        [(NSMutableArray *)v65->_modules addObject:v65->_autoBrightnessModule];
        v63 = 0;
        if (v65->super._logHandle)
        {
          logHandle = v65->super._logHandle;
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
        v63 = logHandle;
        char v62 = 2;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
        {
          log = v63;
          os_log_type_t type = v62;
          __os_log_helper_16_0_0(v61);
          _os_log_debug_impl(&dword_1BA438000, log, type, "auto brightness module for internal display added", v61, 2u);
        }
        [(CBDisplayContaineriOS *)v65 createAndAddSliderCommitTelemetryModule];
      }
      else
      {
        v60 = 0;
        if (v65->super._logHandle)
        {
          os_log_type_t v24 = v65->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v23 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v23 = init_default_corebrightness_log();
          }
          os_log_type_t v24 = v23;
        }
        v60 = v24;
        char v59 = 16;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = v60;
          os_log_type_t v22 = v59;
          __os_log_helper_16_0_0(v58);
          _os_log_error_impl(&dword_1BA438000, v21, v22, "error: failed to create auto-brighntess module", v58, 2u);
        }
      }
      [(NSMutableArray *)v65->_modules addObject:v65->_displayControlModule];
      os_log_type_t v57 = 0;
      if (v65->super._logHandle)
      {
        os_log_type_t v20 = v65->super._logHandle;
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
      os_log_type_t v57 = v20;
      char v56 = 2;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = v57;
        os_log_type_t v18 = v56;
        __os_log_helper_16_0_0(v55);
        _os_log_debug_impl(&dword_1BA438000, v17, v18, "control module for internal display added", v55, 2u);
      }
    }
    else
    {
      uint64_t v54 = 0;
      if (v65->super._logHandle)
      {
        os_log_type_t v16 = v65->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v15 = init_default_corebrightness_log();
        }
        os_log_type_t v16 = v15;
      }
      uint64_t v54 = v16;
      char v53 = 16;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v13 = v54;
        os_log_type_t v14 = v53;
        __os_log_helper_16_0_0(v52);
        _os_log_error_impl(&dword_1BA438000, v13, v14, "error: failed to create a display module", v52, 2u);
      }
    }
    uint64_t v2 = [CBColorModuleiOS alloc];
    if (v65->_builtIn) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    uint64_t v4 = [(CBColorModuleiOS *)v2 initWithBacklight:v65->_armBacklightDisplayService andModuleType:v3 andBrightnessControl:v65->_brtCtl];
    v65->_harmonyContainer = (CBContainerProtocol *)v4;
    if (v65->_harmonyContainer)
    {
      [(CBContainerProtocol *)v65->_harmonyContainer scheduleWithDispatchQueue:v65->super._queue];
      [(NSMutableArray *)v65->_modules addObject:v65->_harmonyContainer];
      id v51 = 0;
      id v51 = (id)[(CBContainerModuleProtocol *)v65->_displayControlModule copyPropertyForKey:@"TwilightModule"];
      if (v51)
      {
        -[CBContainerProtocol setProperty:forKey:](v65->_harmonyContainer, "setProperty:forKey:", [v51 params], @"TwilightParameters");
      }
    }
    v45[0] = 0;
    v45[1] = v45;
    int v46 = 1375731712;
    int v47 = 48;
    uint64_t v48 = __Block_byref_object_copy__16;
    os_log_type_t v49 = __Block_byref_object_dispose__16;
    harmonyContainer = 0;
    harmonyContainer = v65->_harmonyContainer;
    uint64_t v5 = v65->_harmonyContainer;
    uint64_t v38 = MEMORY[0x1E4F143A8];
    int v39 = -1073741824;
    int v40 = 0;
    os_log_type_t v41 = __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke;
    uint64_t v42 = &unk_1E621A3A8;
    char v43 = v65;
    SEL v44 = v45;
    -[CBContainerProtocol registerNotificationBlock:](v5, "registerNotificationBlock:");
    if (!v65->_builtIn) {
      [(CBContainerProtocol *)v65->_harmonyContainer setProperty:MEMORY[0x1E4F1CC38] forKey:@"ColorFadesEnabled"];
    }
    if (v65->_brtCtl)
    {
      uint64_t v12 = [CBAODModule alloc];
      uint64_t v11 = [(CBAODModule *)v12 initWithCBBrtControl:v65->_brtCtl andQueue:v65->super._queue];
      v65->_AODModule = (CBContainerModuleProtocol *)v11;
      if (v65->_AODModule)
      {
        modules = v65->_modules;
        uint64_t v32 = MEMORY[0x1E4F143A8];
        int v33 = -1073741824;
        int v34 = 0;
        uint64_t v35 = __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_231;
        os_log_type_t v36 = &unk_1E62191C8;
        os_log_type_t v37 = v65;
        -[NSMutableArray enumerateObjectsUsingBlock:](modules, "enumerateObjectsUsingBlock:");
        [(NSMutableArray *)v65->_modules addObject:v65->_AODModule];
      }
      else
      {
        os_log_t oslog = 0;
        if (v65->super._logHandle)
        {
          uint64_t v10 = v65->super._logHandle;
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
        os_log_type_t v30 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v7 = oslog;
          os_log_type_t v8 = v30;
          __os_log_helper_16_0_0(v29);
          _os_log_error_impl(&dword_1BA438000, v7, v8, "Failed to initialize AOD module", v29, 2u);
        }
      }
    }
    -[NSMutableArray enumerateObjectsUsingBlock:](v65->_modules, "enumerateObjectsUsingBlock:");
    -[NSMutableArray enumerateObjectsUsingBlock:](v65->_relevantServices, "enumerateObjectsUsingBlock:");
    [(CBDisplayContaineriOS *)v65 setColorMitigations];
    [(NSMutableArray *)v65->_modules makeObjectsPerformSelector:sel_start];
    -[NSMutableArray enumerateObjectsUsingBlock:](v65->_missedKeys, "enumerateObjectsUsingBlock:");

    v65->_missedKeys = 0;
    v65->_missedProperties = 0;
    [(CBDisplayContaineriOS *)v65 handlePresetChange:+[CBPresetsParser sharedInstance]];
    _Block_object_dispose(v45, 8);
  }
}

uint64_t __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_231(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141AA58];
  if (result) {
    return [*(id *)(*(void *)(a1 + 32) + 120) addModule:a2];
  }
  return result;
}

void __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_232(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = a1;
  id v13 = a2;
  uint64_t v12 = a3;
  uint64_t v11 = a4;
  uint64_t v10 = a1;
  if ([a2 conformsToProtocol:&unk_1F141A890])
  {
    v4[0] = 0;
    v4[1] = v4;
    int v5 = 1375731712;
    int v6 = 48;
    uint64_t v7 = __Block_byref_object_copy__16;
    os_log_type_t v8 = __Block_byref_object_dispose__16;
    id v9 = v13;
    objc_msgSend(v13, "registerNotificationBlock:");
    _Block_object_dispose(v4, 8);
  }
}

uint64_t __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_233(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  uint64_t v7 = a3;
  uint64_t v6 = a4;
  uint64_t v5 = a1;
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "enumerateObjectsUsingBlock:", MEMORY[0x1E4F143A8], 3221225472, __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_2_234, &unk_1E62191C8, a2, a1, a4, a3, a2, a1);
}

uint64_t __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_2_234(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A9C8];
  if (result) {
    return [a2 addHIDServiceClient:*(void *)(a1 + 32)];
  }
  return result;
}

void __51__CBDisplayContaineriOS_setupInternalBrtCtlModules__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "setPropertyNoQueue:forKey:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "objectAtIndex:", a3), a2);
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    uint64_t v4 = inited;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v7, a2);
    _os_log_debug_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEBUG, "Restored %@ property", v7, 0xCu);
  }
}

- (void)tearDownInternalModules
{
  uint64_t v10 = self;
  SEL v9 = a2;
  uint64_t v8 = 0;
  if (self->super._logHandle)
  {
    logHandle = v10->super._logHandle;
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
    os_log_type_t v3 = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_1BA438000, log, v3, (const char *)&unk_1BA61B929, v6, 2u);
  }
  [(NSMutableArray *)v10->_modules makeObjectsPerformSelector:sel_stop];
  [(NSMutableArray *)v10->_modules makeObjectsPerformSelector:sel_unregisterNotificationBlock];
  [(NSMutableArray *)v10->_modules removeAllObjects];
  [(CBModule *)v10->_displayCAManager unregisterNotificationBlock];

  [(CBContainerProtocol *)v10->_harmonyContainer stop];
  [(CBContainerProtocol *)v10->_harmonyContainer unscheduleWithDispatchQueue:v10->super._queue];

  v10->_harmonyContainer = 0;
  if (v10->_displayArrivalNotificationPort)
  {
    IONotificationPortSetDispatchQueue(v10->_displayArrivalNotificationPort, 0);
    IONotificationPortDestroy(v10->_displayArrivalNotificationPort);
    v10->_displayArrivalNotificationPort = 0;
  }
  if (v10->_displayArrivalIterator)
  {
    IOObjectRelease(v10->_displayArrivalIterator);
    v10->_displayArrivalIterator = 0;
  }
}

- (void)registerNotificationBlock:(id)a3
{
  id v13 = self;
  SEL v12 = a2;
  id v11 = a3;
  uint64_t v10 = 0;
  if (self->super._logHandle)
  {
    logHandle = v13->super._logHandle;
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
  uint64_t v10 = logHandle;
  char v9 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v10;
    os_log_type_t type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_debug_impl(&dword_1BA438000, log, type, "Register notification block", v8, 2u);
  }
  v7.receiver = v13;
  v7.super_class = (Class)CBDisplayContaineriOS;
  [(CBContainer *)&v7 registerNotificationBlock:v11];
}

- (void)unregisterNotificationBlock
{
  uint64_t v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CBDisplayContaineriOS;
  [(CBContainer *)&v2 unregisterNotificationBlock];
}

- (id)copyPreferenceForKey:(id)a3 user:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "NightShift copyPreferencesForKey %@", v10, 0xCu);
  }
  return (id)[(CBContainerProtocol *)self->_harmonyContainer copyPreferenceForKey:a3 user:a4];
}

- (void)setNightShiftFactorDictionary:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "NightShift setNightShiftFactorDictionary %@", v7, 0xCu);
  }
  [(CBContainerProtocol *)self->_harmonyContainer setNightShiftFactorDictionary:a3];
}

- (void)setPreference:(id)a3 forKey:(id)a4 user:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v11, (uint64_t)a3, (uint64_t)a4);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "NightShift setPreference %@ for key %@", v11, 0x16u);
  }
  [(CBContainerProtocol *)self->_harmonyContainer setPreference:a3 forKey:a4 user:a5];
}

- (id)copyStatusInfo
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = +[CBStatusInfoHelper copyStatusInfoFor:self];
  if (v4) {
    [v5 setObject:v4 forKey:@"DisplayContainer"];
  }

  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_modules, "enumerateObjectsUsingBlock:");
  [v5 setObject:v3 forKey:@"ModulesInfo"];

  return v5;
}

void __39__CBDisplayContaineriOS_copyStatusInfo__block_invoke(uint64_t a1, void *a2)
{
  if (([a2 conformsToProtocol:&unk_1F141A890] & 1) != 0
    || ([a2 conformsToProtocol:&unk_1F141D7A8] & 1) != 0)
  {
    id v3 = (id)[a2 copyPropertyForKey:@"StatusInfo"];
    if (v3) {
      [*(id *)(a1 + 32) addObject:v3];
    }
  }
}

- (id)copyIdentifiers
{
  id v4 = self;
  SEL v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"CBContainerInfo", @"BrightnessControlCapabilities", 0);
}

- (id)className
{
  objc_super v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)isReady
{
  return self->_alsServiceReady;
}

- (BOOL)handleDisplayModeUpdate:(id)a3
{
  uint64_t v21 = self;
  SEL v20 = a2;
  id v19 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  int v16 = 0x20000000;
  int v17 = 32;
  char v18 = 0;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  char v9 = __49__CBDisplayContaineriOS_handleDisplayModeUpdate___block_invoke;
  uint64_t v10 = &unk_1E6219830;
  uint64_t v11 = v21;
  id v13 = &v14;
  id v12 = a3;
  dispatch_sync(queue, &block);
  char v5 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v5 & 1;
}

uint64_t __49__CBDisplayContaineriOS_handleDisplayModeUpdate___block_invoke(void *a1)
{
  uint64_t v10 = a1;
  char v9 = a1;
  objc_super v2 = *(void **)(a1[4] + 48);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __49__CBDisplayContaineriOS_handleDisplayModeUpdate___block_invoke_2;
  int v7 = &unk_1E6219A10;
  uint64_t v8 = a1[6];
  return objc_msgSend(v2, "enumerateObjectsUsingBlock:", MEMORY[0x1E4F143A8], 3221225472, __49__CBDisplayContaineriOS_handleDisplayModeUpdate___block_invoke_2, &unk_1E6219A10, a1[5], v8, v9, v10);
}

uint64_t __49__CBDisplayContaineriOS_handleDisplayModeUpdate___block_invoke_2(uint64_t a1, void *a2)
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

- (BOOL)createAndAddSliderCommitTelemetryModule
{
  char v18 = self;
  SEL v17 = a2;
  if ((CBU_IsSliderCommitTelemetrySupported() & 1) == 0) {
    return 0;
  }
  v18->_SliderCommitTelemetryModule = (CBContainerModuleProtocol *)[[CBSliderCommitTelemetry alloc] initWithQueue:v18->super._queue andDisplayContainer:v18];
  if (v18->_SliderCommitTelemetryModule)
  {
    [(NSMutableArray *)v18->_modules addObject:v18->_SliderCommitTelemetryModule];
    id v13 = 0;
    if (v18->super._logHandle)
    {
      logHandle = v18->super._logHandle;
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
    id v13 = logHandle;
    char v12 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      SEL v3 = v13;
      os_log_type_t v4 = v12;
      __os_log_helper_16_0_0(v11);
      _os_log_debug_impl(&dword_1BA438000, v3, v4, "SliderCommitTelemetry module added", v11, 2u);
    }
    return 1;
  }
  else
  {
    int v16 = 0;
    if (v18->super._logHandle)
    {
      uint64_t v10 = v18->super._logHandle;
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
    int v16 = v10;
    char v15 = 16;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      log = v16;
      os_log_type_t type = v15;
      __os_log_helper_16_0_0(v14);
      _os_log_error_impl(&dword_1BA438000, log, type, "SliderCommitTelemetry module failed to init", v14, 2u);
    }
    return 0;
  }
}

@end