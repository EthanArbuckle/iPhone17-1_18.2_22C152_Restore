@interface CBABModuleiOS
- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)handleAODStateUpdate:(unint64_t)a3 transitionTime:(float)a4 context:(id)a5;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)shouldMitigateHarmony:(__IOHIDServiceClient *)a3;
- (CBABModuleiOS)initWithDisplayModule:(id)a3 andQueue:(id)a4;
- (id)copyIdentifiers;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (id)copyPropertyInternalForKey:(id)a3;
- (id)newGrimaldiFactory:(int)a3;
- (void)dealloc;
- (void)sendNotificationForKey:(id)a3 withValue:(id)a4;
- (void)setupAABRear;
- (void)stop;
- (void)updateCurveStrategy:(UpdateCurveStrategy *)a3 withSettingsProvider:(id)a4;
@end

@implementation CBABModuleiOS

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  if (([(NSMutableArray *)self->_frontALSServiceClients containsObject:a4] & 1) != 0
    || ([(NSMutableArray *)self->_otherServiceClients containsObject:a4] & 1) != 0)
  {
    if (self->_AABC) {
      (*(void (**)(void *, __IOHIDServiceClient *, __IOHIDEvent *))(*(void *)self->_AABC + 48))(self->_AABC, a4, a3);
    }
  }
  else if ([(NSMutableArray *)self->_rearALSServiceClients containsObject:a4])
  {
    [self->_AABRear handleHIDEvent:a3 from:a4];
  }
  return 1;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  if (self->_AABC) {
    (*(void (**)(void *, __IOHIDServiceClient *))(*(void *)self->_AABC + 88))(self->_AABC, a3);
  }
  [self->_AABRear removeHIDServiceClient:a3];
  [(NSMutableArray *)self->_frontALSServiceClients removeObject:a3];
  [(NSMutableArray *)self->_rearALSServiceClients removeObject:a3];
  [(NSMutableArray *)self->_otherServiceClients removeObject:a3];
  return 1;
}

- (id)copyPropertyForKey:(id)a3
{
  return [(CBABModuleiOS *)self copyPropertyInternalForKey:a3];
}

- (id)copyPropertyInternalForKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  if ([a3 isEqualToString:@"StatusInfo"])
  {
    id v6 = +[CBStatusInfoHelper copyStatusInfoFor:self];
    if (v6) {
      id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"CBABModuleiOS", 0);
    }
  }
  else if ([a3 isEqualToString:@"BLControlAlsSupported"])
  {
    id v7 = (id)[objc_alloc(NSNumber) initWithBool:self->_AABC != 0];
  }
  else if (self->_AABC)
  {
    id v7 = (id)objc_msgSend((id)(*(uint64_t (**)(void *, id, void))(*(void *)self->_AABC + 112))(self->_AABC, a3, 0), "copy");
  }
  if (!v7) {
    id v7 = [(CBALSTelemetry *)self->_alsTelemetry copyPropertyForKey:a3];
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
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v10, (uint64_t)a3, (uint64_t)v7);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ result=%@", v10, 0x16u);
  }
  return v7;
}

uint64_t __29__CBABModuleiOS_setupAABRear__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3) {
      return [*(id *)(result + 32) sendNotificationForKey:a2 withValue:a3];
    }
  }
  return result;
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->super._notificationBlock) {
    (*((void (**)(void))self->super._notificationBlock + 2))();
  }
}

- (BOOL)shouldMitigateHarmony:(__IOHIDServiceClient *)a3
{
  BOOL v4 = 0;
  if (self->_AABC)
  {
    BOOL v5 = AABC::getALSSensorTypeFromService((id *)self->_AABC, a3) == 8;
    return (v5 | (AABC::getALSSensorTypeFromService((id *)self->_AABC, a3) == 9)) != 0;
  }
  return v4;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  char v5 = 0;
  if (self->_AABC)
  {
    (*(void (**)(void *, id, id, void))(*(void *)self->_AABC + 120))(self->_AABC, a4, a3, 0);
    char v5 = 1;
  }
  [self->_AABRear setProperty:a3 forKey:a4];
  [(CBALSTelemetry *)self->_alsTelemetry setProperty:a3 forKey:a4];
  return v5 & 1;
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v45 = self;
  SEL v44 = a2;
  IOHIDServiceClientRef v43 = a3;
  if (IOHIDServiceClientConformsTo(a3, 0xFF00u, 4u))
  {
    v42 = [[CBALSNode alloc] initWithALSServiceClient:v43];
    if ([(CBALSNode *)v42 placement] == 2)
    {
      [(CBABModuleiOS *)v45 setupAABRear];
      [v45->_AABRear addHIDServiceClient:v43];
      [(NSMutableArray *)v45->_rearALSServiceClients addObject:v43];
    }
    else if ([(NSMutableArray *)v45->_frontALSServiceClients count] || v45->_AABC)
    {
      if (v45->_AABC) {
        (*(void (**)(void *, IOHIDServiceClientRef))(*(void *)v45->_AABC + 80))(v45->_AABC, v43);
      }
    }
    else
    {
      id RegistryID = (id)IOHIDServiceClientGetRegistryID(v43);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CFDictionaryRef v40 = IORegistryEntryIDMatching([RegistryID unsignedLongLongValue]);
        if (v40)
        {
          io_registry_entry_t MatchingService = 0;
          io_registry_entry_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E4F2EEF0], v40);
          if (MatchingService)
          {
            if (!v45->_AABC)
            {
              CFAllocatorRef v38 = 0;
              [(CBABModuleiOS *)v45 updateCurveStrategy:&v38 withSettingsProvider:v45->_settingsProvider];
              if (!v38)
              {
                v37 = 0;
                if (v45->super._logHandle)
                {
                  logHandle = v45->super._logHandle;
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
                v37 = logHandle;
                os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
                if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
                {
                  log = v37;
                  os_log_type_t type = v36;
                  __os_log_helper_16_0_0(v35);
                  _os_log_impl(&dword_1BA438000, log, type, "AABC initialisation: failed to get strategy from setting provider, use default update curve strategy.", v35, 2u);
                }
                AABC::alloc((AABC *)*MEMORY[0x1E4F1CF80], v4);
              }
              v45->_AABC = AABC::alloc((AABC *)*MEMORY[0x1E4F1CF80], v38, v3);
            }
            if (objc_opt_respondsToSelector())
            {
              settingsProvider = v45->_settingsProvider;
              uint64_t v29 = MEMORY[0x1E4F143A8];
              int v30 = -1073741824;
              int v31 = 0;
              v32 = __37__CBABModuleiOS_addHIDServiceClient___block_invoke;
              v33 = &unk_1E6218FE0;
              v34 = v45;
              -[CBAdaptiveAutoBrightnessSettingsProvider registerAutoBrightnessSettingsUpdateHandler:](settingsProvider, "registerAutoBrightnessSettingsUpdateHandler:");
            }
            if (!v45->_AABC) {
              AABC::alloc((AABC *)*MEMORY[0x1E4F1CF80], v5);
            }
            AABC::open((AABC *)v45->_AABC, MatchingService, 1, (void (*)(void *, const __CFString *, const void *))AABCCallback, v45);
            (*(void (**)(void *, __Display *))(*(void *)v45->_AABC + 64))(v45->_AABC, [(CBDisplayModuleiOS *)v45->_display displayInternal]);
            (*(void (**)(void *, OS_dispatch_queue *))(*(void *)v45->_AABC + 96))(v45->_AABC, v45->super._queue);
            (*(void (**)(void *, IOHIDServiceClientRef))(*(void *)v45->_AABC + 80))(v45->_AABC, v43);
            otherServiceClients = v45->_otherServiceClients;
            uint64_t v23 = MEMORY[0x1E4F143A8];
            int v24 = -1073741824;
            int v25 = 0;
            v26 = __37__CBABModuleiOS_addHIDServiceClient___block_invoke_12;
            v27 = &unk_1E62191C8;
            v28 = v45;
            -[NSMutableArray enumerateObjectsUsingBlock:](otherServiceClients, "enumerateObjectsUsingBlock:");
            id v22 = [[CBAPEndpoint alloc] initWithServiceName:@"cbroot-service" role:@"DCP"];
            [(CBABModuleiOS *)v45 setupAABRear];
            if (v22)
            {
              NSLog(&cfstr_CbapendpointRe.isa);
              if (v45->_AABC) {
                AABC::registerEndpoint((id *)v45->_AABC, (CBAPEndpoint *)v22);
              }
            }
            else
            {
              NSLog(&cfstr_CbapendpointIn.isa);
            }
            if (v45->_AABC)
            {
              os_log_t oslog = 0;
              if (v45->super._logHandle)
              {
                v14 = v45->super._logHandle;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t v13 = init_default_corebrightness_log();
                }
                v14 = v13;
              }
              os_log_t oslog = v14;
              os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v11 = oslog;
                os_log_type_t v12 = v20;
                __os_log_helper_16_0_0(v19);
                _os_log_debug_impl(&dword_1BA438000, v11, v12, "ALS service for internal display ready", v19, 2u);
              }
              [(CBABModuleiOS *)v45 sendNotificationForKey:@"ALSServiceReady" withValue:0];
            }
          }
        }
      }
    }
    if ([(CBALSNode *)v42 placement] != 2) {
      [(NSMutableArray *)v45->_frontALSServiceClients addObject:v43];
    }
    if ([(CBALSTelemetry *)v45->_alsTelemetry setALSService:v43]) {
      [(CBALSTelemetry *)v45->_alsTelemetry start];
    }

    if (v45->super._logHandle)
    {
      v10 = v45->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v9 = init_default_corebrightness_log();
      }
      v10 = v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v46, (uint64_t)v45->_frontALSServiceClients, (uint64_t)v45->_rearALSServiceClients);
      _os_log_impl(&dword_1BA438000, v10, OS_LOG_TYPE_DEFAULT, "Als service clients Front: %{public}@ \n Rear: %{public}@", v46, 0x16u);
    }
  }
  else
  {
    if (v45->_AABC) {
      (*(void (**)(void *, IOHIDServiceClientRef))(*(void *)v45->_AABC + 80))(v45->_AABC, v43);
    }
    [(NSMutableArray *)v45->_otherServiceClients addObject:v43];
  }
  return 1;
}

- (CBABModuleiOS)initWithDisplayModule:(id)a3 andQueue:(id)a4
{
  os_log_type_t v36 = self;
  SEL v35 = a2;
  id v34 = a3;
  id v33 = a4;
  if (!a3 || !v33)
  {
    v32 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    v32 = inited;
    char v31 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = v32;
      os_log_type_t type = v31;
      __os_log_helper_16_0_0(v30);
      _os_log_error_impl(&dword_1BA438000, log, type, "invalid arguments", v30, 2u);
    }
    return 0;
  }
  v29.receiver = v36;
  v29.super_class = (Class)CBABModuleiOS;
  os_log_type_t v36 = [(CBModule *)&v29 initWithQueue:v33];
  if (!v36) {
    return v36;
  }
  os_log_t v4 = os_log_create("com.apple.CoreBrightness.CBABModuleiOS", "default");
  v36->super._logHandle = (OS_os_log *)v4;
  if (!v36->super._logHandle)
  {
    v28 = 0;
    v19 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v28 = v19;
    char v27 = 16;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v17 = v28;
      os_log_type_t v18 = v27;
      __os_log_helper_16_0_0(v26);
      _os_log_error_impl(&dword_1BA438000, v17, v18, "failed to create log handle", v26, 2u);
    }
  }
  CFAllocatorRef v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v36->_frontALSServiceClients = v5;
  id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v36->_rearALSServiceClients = v6;
  id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v36->_otherServiceClients = v7;
  if (v36->_frontALSServiceClients && v36->_rearALSServiceClients && v36->_otherServiceClients)
  {
    v8 = (CBDisplayModuleiOS *)v34;
    v36->_display = v8;
    uint64_t v9 = [CBALSTelemetry alloc];
    uint64_t v10 = [(CBALSTelemetry *)v9 initWithQueue:v33];
    v36->_alsTelemetry = (CBALSTelemetry *)v10;
    -[CBModule registerNotificationBlock:](v36->_alsTelemetry, "registerNotificationBlock:");
    uint64_t v11 = +[CBAgregateSettingsProvider sharedInstance];
    v36->_settingsProvider = (CBAdaptiveAutoBrightnessSettingsProvider *)v11;
    return v36;
  }
  int v25 = 0;
  if (v36->super._logHandle)
  {
    logHandle = v36->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v15 = init_default_corebrightness_log();
    }
    logHandle = v15;
  }
  int v25 = logHandle;
  char v24 = 16;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = v25;
    os_log_type_t v14 = v24;
    __os_log_helper_16_0_0(v23);
    _os_log_error_impl(&dword_1BA438000, v13, v14, "failed to instantiate service containers", v23, 2u);
  }

  os_log_type_t v36 = 0;
  return 0;
}

uint64_t __48__CBABModuleiOS_initWithDisplayModule_andQueue___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3) {
      return [*(id *)(result + 32) sendNotificationForKey:a2 withValue:a3];
    }
  }
  return result;
}

- (void)dealloc
{
  CFAllocatorRef v5 = self;
  SEL v4 = a2;
  if (self->_AABC)
  {
    (*(void (**)(void *, OS_dispatch_queue *))(*(void *)v5->_AABC + 104))(v5->_AABC, v5->super._queue);
    (*(void (**)(void *, __Display *))(*(void *)v5->_AABC + 72))(v5->_AABC, [(CBDisplayModuleiOS *)v5->_display displayInternal]);
    (*(void (**)(void *, void))(*(void *)v5->_AABC + 56))(v5->_AABC, 0);
    AABC = v5->_AABC;
    if (AABC) {
      (*(void (**)(void *))(*(void *)AABC + 40))(AABC);
    }
    v5->_AABC = 0;
  }
  if (v5->_AABRear) {

  }
  v5->_frontALSServiceClients = 0;
  v5->_rearALSServiceClients = 0;

  v5->_otherServiceClients = 0;
  [(CBALSTelemetry *)v5->_alsTelemetry stop];

  v5->_alsTelemetry = 0;
  v5->_boltsProvider = 0;
  v3.receiver = v5;
  v3.super_class = (Class)CBABModuleiOS;
  [(CBModule *)&v3 dealloc];
}

void __37__CBABModuleiOS_addHIDServiceClient___block_invoke(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v9 = a1;
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  uint64_t block = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __37__CBABModuleiOS_addHIDServiceClient___block_invoke_2;
  id v7 = &unk_1E6218FE0;
  uint64_t v8 = *(void *)(a1 + 32);
  dispatch_sync(v2, &block);
}

void __37__CBABModuleiOS_addHIDServiceClient___block_invoke_2(uint64_t a1)
{
  v9[2] = a1;
  v9[1] = a1;
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    v9[0] = 0;
    [*(id *)(a1 + 32) updateCurveStrategy:v9 withSettingsProvider:*(void *)(*(void *)(a1 + 32) + 88)];
    if (!v9[0]) {
      operator new();
    }
    (*(void (**)(void, void))(**(void **)(*(void *)(a1 + 32) + 32) + 24))(*(void *)(*(void *)(a1 + 32) + 32), v9[0]);
  }
  else
  {
    uint64_t v8 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 16))
    {
      int v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
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
    uint64_t v8 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v1 = v8;
      os_log_type_t v2 = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_impl(&dword_1BA438000, v1, v2, "[Update curve strategy] failed to update curve strategy. AABC has not been initialized yet.", v6, 2u);
    }
  }
}

uint64_t __37__CBABModuleiOS_addHIDServiceClient___block_invoke_12(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 80))(*(void *)(*(void *)(a1 + 32) + 32), a2);
}

- (void)updateCurveStrategy:(UpdateCurveStrategy *)a3 withSettingsProvider:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21 = self;
  SEL v20 = a2;
  v19 = a3;
  id v18 = a4;
  if (a4)
  {
    uint64_t v17 = [v18 aabUpdateStrategyType];
    os_log_t v16 = 0;
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
    os_log_t v16 = logHandle;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      updated = aabUpdateStrategyTypeToString(v17);
      __os_log_helper_16_2_1_8_66((uint64_t)v22, (uint64_t)updated);
      _os_log_impl(&dword_1BA438000, v16, v15, "Use CBAABUpdateStrategyType = %{public}@", v22, 0xCu);
    }
    if (!v17) {
      operator new();
    }
    if (!v21->_boltsProvider) {
      v21->_boltsProvider = [[CBBOLTSProvider alloc] initWithQueue:v21->super._queue];
    }
    uint64_t v14 = 0;
    uint64_t v14 = [(CBBOLTSProvider *)v21->_boltsProvider newBOLTSModule];
    if (v14)
    {
      switch(v17)
      {
        case 1:
          NSObject *v19 = (UpdateCurveStrategy *)v14;
          break;
        case 2:
          operator new();
        case 3:
          operator new();
        default:
          NSObject *v19 = 0;
          break;
      }
    }
    else
    {
      uint64_t v13 = 0;
      if (v21->super._logHandle)
      {
        uint64_t v8 = v21->super._logHandle;
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
      uint64_t v13 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = v13;
        os_log_type_t v6 = v12;
        __os_log_helper_16_0_0(v11);
        _os_log_impl(&dword_1BA438000, v5, v6, "BOLTS initialisation failed.", v11, 2u);
      }
    }
  }
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (void)stop
{
}

- (id)newGrimaldiFactory:(int)a3
{
  int v5 = objc_alloc_init(CBGrimaldiFactory);
  if (a3 == 1) {
    int v4 = objc_alloc_init(CBGrimaldiSamplingStrategySingleSample);
  }
  else {
    int v4 = objc_alloc_init(CBGrimaldiSamplingStrategyLegacy);
  }
  [(CBGrimaldiFactory *)v5 setSamplingStrategy:v4];

  return v5;
}

- (void)setupAABRear
{
  char v24 = self;
  SEL v23 = a2;
  if (!self->_AABRear)
  {
    id v22 = 0;
    id v22 = [(CBABModuleiOS *)v24 newGrimaldiFactory:[(CBBacklightNode *)[(CBDisplayModuleiOS *)v24->_display backlightParams] grimaldiSamplingStrategy]];
    v24->_AABRear = [[AABRear alloc] initWithQueue:v24->super._queue andGrimaldiFactory:v22];

    if (v24->_AABRear)
    {
      v21 = 0;
      if (v24->super._logHandle)
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
      v21 = logHandle;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        log = v21;
        os_log_type_t type = v20;
        __os_log_helper_16_0_0(v19);
        _os_log_impl(&dword_1BA438000, log, type, "Rear AAB has been initialized.", v19, 2u);
      }
      AABRear = v24->_AABRear;
      uint64_t v13 = MEMORY[0x1E4F143A8];
      int v14 = -1073741824;
      int v15 = 0;
      os_log_t v16 = __29__CBABModuleiOS_setupAABRear__block_invoke;
      uint64_t v17 = &unk_1E62190B8;
      id v18 = v24;
      [(CBModule *)AABRear registerNotificationBlock:log];
    }
  }
  if (v24->_AABRear && v24->_AABC)
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    int v8 = -1073741824;
    int v9 = 0;
    uint64_t v10 = __29__CBABModuleiOS_setupAABRear__block_invoke_2;
    uint64_t v11 = &unk_1E6218FE0;
    os_log_type_t v12 = v24;
    v26 = &-[CBABModuleiOS setupAABRear]::onceToken;
    int v25 = &v7;
    if (-[CBABModuleiOS setupAABRear]::onceToken != -1) {
      dispatch_once(v26, v25);
    }
  }
}

uint64_t __29__CBABModuleiOS_setupAABRear__block_invoke_2(uint64_t a1)
{
  return AABC::initAABRear(*(AABC **)(*(void *)(a1 + 32) + 32), *(AABRear **)(*(void *)(a1 + 32) + 48));
}

- (id)copyIdentifiers
{
  int v4 = self;
  SEL v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"TrustedLux", @"Lux", @"BLControlAlsSupported", @"ALSUserPreference", @"EcoMode", @"ALSCurveInfo", @"EventTimestampFirstALSSample", @"SemanticAmbientLightLevel", 0);
}

- (BOOL)handleAODStateUpdate:(unint64_t)a3 transitionTime:(float)a4 context:(id)a5
{
  if (self->_AABC) {
    AABC::handleAODStateUpdate((uint64_t)self->_AABC, a3, a5, a4);
  }
  return 1;
}

@end