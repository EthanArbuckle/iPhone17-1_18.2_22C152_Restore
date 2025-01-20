@interface CBSliderCommitTelemetry
+ (id)sliderInfoToNSDictionary:(const CBSliderCommitInfo *)a3;
- (BOOL)getUserAABParams:(CBAABParams *)a3;
- (BOOL)getUserAABParams:(CBAABParams *)a3 alternativeAABParams:(CBAABParams *)a4;
- (BOOL)getUserAABParams:(CBAABParams *)a3 key:(id)a4;
- (BOOL)handleAODStateUpdate:(unint64_t)a3 transitionTime:(float)a4 context:(id)a5;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (CBSliderCommitInfo)addOrUpdateEntryWithTimestamp:(int64_t)a3 slider:(float)a4 apce:(float)a5 andTrackedState:(TrackedState)a6;
- (CBSliderCommitInfo)getLastFilledEntry;
- (CBSliderCommitInfo)getNextEntryAndAdvanceBufferIndex;
- (CBSliderCommitTelemetry)initWithQueue:(id)a3 andDisplayContainer:(id)a4;
- (double)timestampFromCurveDistionary:(id)a3;
- (float)getAPCE;
- (id).cxx_construct;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (void)cancelDelayedAPCETimer;
- (void)delayedAPCETimerHandler:(CBSliderCommitInfo *)a3;
- (void)fillEntry:(CBSliderCommitInfo *)a3 withTimestamp:(int64_t)a4 andAABParams:(CBAABParams *)a5 andAlternativeAABParams:(CBAABParams *)a6;
- (void)fillEntry:(CBSliderCommitInfo *)a3 withTimestamp:(int64_t)a4 andRestoreTimeTarget:(int64_t)a5 andAABParams:(CBAABParams *)a6 andAlternativeAABParams:(CBAABParams *)a7;
- (void)fillEntry:(CBSliderCommitInfo *)a3 withTimestamp:(int64_t)a4 slider:(float)a5 apce:(float)a6 andTrackedState:(TrackedState)a7;
- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4;
- (void)logAfterUserBrightnessCommitWithTimestamp:(int64_t)a3 slider:(float)a4 apce:(float)a5 andTrackedState:(TrackedState)a6;
- (void)logAllFilledEntries;
- (void)reportCommit:(CBSliderCommitInfo *)a3;
- (void)sendNotificationForKey:(id)a3 withValue:(id)a4;
- (void)start;
@end

@implementation CBSliderCommitTelemetry

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v27 = self;
  SEL v26 = a2;
  id v25 = a3;
  id v24 = a4;
  if ([a3 isEqualToString:@"DisplayOn"])
  {
    if ([v24 BOOLValue])
    {
      if (v27->_displayOffTimestamp > 0.0)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        double v16 = 0.0;
        double v16 = Current - v27->_displayOffTimestamp;
        if (v16 > v27->_longestInactivityLength)
        {
          v27->_longestInactivityLength = v16;
          v27->_inactivityStartTimestamp = v27->_displayOffTimestamp;
          os_log_t oslog = 0;
          if (v27->super._logHandle)
          {
            logHandle = v27->super._logHandle;
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
            __os_log_helper_16_0_2_8_0_8_0((uint64_t)v28, *(void *)&v27->_longestInactivityLength, *(void *)&v27->_inactivityStartTimestamp);
            _os_log_impl(&dword_1BA438000, oslog, type, "Display turns on: Longest inactivity length is %f seconds with start timestamp = %f", v28, 0x16u);
          }
        }
      }
      loggingQueue = v27->_loggingQueue;
      uint64_t v8 = MEMORY[0x1E4F143A8];
      int v9 = -1073741824;
      int v10 = 0;
      v11 = __65__CBSliderCommitTelemetry_handleNotificationForKey_withProperty___block_invoke_44;
      v12 = &unk_1E6218FE0;
      v13 = v27;
      dispatch_async(loggingQueue, &v8);
    }
    else
    {
      v27->_displayOffTimestamp = CFAbsoluteTimeGetCurrent();
      v4 = v27->_loggingQueue;
      uint64_t block = MEMORY[0x1E4F143A8];
      int v19 = -1073741824;
      int v20 = 0;
      v21 = __65__CBSliderCommitTelemetry_handleNotificationForKey_withProperty___block_invoke;
      v22 = &unk_1E6218FE0;
      v23 = v27;
      dispatch_async(v4, &block);
    }
  }
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  v40 = self;
  SEL v39 = a2;
  id v38 = a3;
  id v37 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v37 isEqualToString:@"CBFinalBrightnessCommitDelay"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40->_delayedAPCEDelay = [v38 longLongValue];
        char v41 = 1;
      }
      else
      {
        char v41 = 0;
      }
    }
    else if ([v37 isEqualToString:@"DisplayBrightness"])
    {
      if (v40->_initialFactorUpdateArrived && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v36 = (id)[v38 objectForKey:@"Commit"];
        id v35 = (id)[v38 objectForKey:@"Brightness"];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v36 BOOLValue])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t Current = (uint64_t)CFAbsoluteTimeGetCurrent();
            [v35 floatValue];
            int v14 = v4;
            [(CBSliderCommitTelemetry *)v40 getAPCE];
            LODWORD(v6) = v5;
            LODWORD(v7) = v14;
            LODWORD(v34) = v40->_state;
            [(CBSliderCommitTelemetry *)v40 logAfterUserBrightnessCommitWithTimestamp:Current slider:v34 apce:v7 andTrackedState:v6];
          }
        }
        char v41 = 1;
      }
      else
      {
        char v41 = 0;
      }
    }
    else if ([v37 isEqualToString:@"DisplayBrightnessAuto"])
    {
      BOOL v33 = [v38 BOOLValue] & 1;
      BOOL autobrightnessEnabled = 0;
      BOOL autobrightnessEnabled = v40->_state.autobrightnessEnabled;
      v40->_state.BOOL autobrightnessEnabled = v33;
      if (v40->_initialFactorUpdateArrived && v33 && autobrightnessEnabled != v33)
      {
        loggingQueue = v40->_loggingQueue;
        uint64_t block = MEMORY[0x1E4F143A8];
        int v27 = -1073741824;
        int v28 = 0;
        uint64_t v29 = __46__CBSliderCommitTelemetry_setProperty_forKey___block_invoke;
        v30 = &unk_1E6218FE0;
        v31 = v40;
        dispatch_async(loggingQueue, &block);
      }
      char v41 = 1;
    }
    else if ([v37 isEqualToString:@"EcoMode"])
    {
      v40->_state.ecoModeEnabled = [v38 BOOLValue] & 1;
      char v41 = 1;
    }
    else if ([v37 isEqualToString:@"CBUIUserStyle"])
    {
      v40->_state.darkThemeApplied = [v38 integerValue] == 2;
      char v41 = 1;
    }
    else if ([v37 isEqualToString:@"CBUIOrientation"])
    {
      BOOL v12 = 1;
      if ([v38 integerValue] != 4) {
        BOOL v12 = [v38 integerValue] == 3;
      }
      v40->_state.landscapeOrientation = v12;
      char v41 = 1;
    }
    else if ([v37 isEqualToString:@"ALSUserPreference"])
    {
      v22[0] = 0;
      v22[1] = v22;
      int v23 = 0x20000000;
      int v24 = 32;
      uint64_t v25 = 0;
      [(CBSliderCommitTelemetry *)v40 timestampFromCurveDistionary:v38];
      uint64_t v25 = v9;
      int v10 = v40->_loggingQueue;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      int v16 = -1073741824;
      int v17 = 0;
      v18 = __46__CBSliderCommitTelemetry_setProperty_forKey___block_invoke_2;
      int v19 = &unk_1E6219CA8;
      int v20 = v40;
      v21 = v22;
      dispatch_async(v10, &v15);
      char v41 = 1;
      _Block_object_dispose(v22, 8);
    }
    else if ((([v37 isEqualToString:@"DisplayBrightnessFactorWithFade"] & 1) != 0 {
            || ([v37 isEqualToString:@"DisplayBrightnessFactorWithFade"] & 1) != 0)
    }
           && v38)
    {
      v40->_initialFactorUpdateArrived = 1;
      char v41 = 1;
    }
    else
    {
      char v41 = 0;
    }
  }
  else
  {
    char v41 = 0;
  }
  return v41 & 1;
}

- (id)copyPropertyForKey:(id)a3
{
  if ([a3 isEqualToString:@"CBFinalBrightnessCommitDelay"]) {
    return (id)[objc_alloc(NSNumber) initWithLongLong:self->_delayedAPCEDelay];
  }
  if ([a3 isEqualToString:@"CBSupportsFinalCommit"]) {
    return (id)[objc_alloc(NSNumber) initWithBool:1];
  }
  return 0;
}

- (CBSliderCommitTelemetry)initWithQueue:(id)a3 andDisplayContainer:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v22 = self;
  SEL v21 = a2;
  id v20 = a3;
  int v19 = (CBDisplayContaineriOS *)a4;
  v18.receiver = self;
  v18.super_class = (Class)CBSliderCommitTelemetry;
  v22 = [(CBModule *)&v18 initWithQueue:a3];
  if (!v22) {
    return v22;
  }
  os_log_t v4 = os_log_create("com.apple.CoreBrightness.SliderCommitTelemetry", "default");
  v22->super._logHandle = (OS_os_log *)v4;
  os_log_t v5 = os_log_create("com.apple.CoreBrightness.SliderCommitTelemetry", "LiveOn");
  v22->_bufferLogHandle = (OS_os_log *)v5;
  if (!v22->super._logHandle || !v22->_bufferLogHandle)
  {
    int v17 = 0;
    BOOL v12 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    int v17 = v12;
    char v16 = 16;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      log = v17;
      os_log_type_t type = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_error_impl(&dword_1BA438000, log, type, "Failed to create log handle", v15, 2u);
    }
  }
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.CoreBrightness.SliderCommitTelemetry", 0);
  v22->_loggingQueue = (OS_dispatch_queue *)v6;
  v22->_delayedAPCETimer = 0;
  v22->_displayContainer = v19;
  v22->_bufferIndex = 0;
  v22->_bufferEntriesFilled = 0;
  v22->_displayOffTimestamp = 0.0;
  v22->_longestInactivityLength = 0.0;
  v22->_initialFactorUpdateArrived = 0;
  v22->_delayedAPCEDelay = 5;
  for (unint64_t i = 0;
        i < 0x64;
        *(void *)(std::array<CBSliderCommitInfo,100ul>::operator[][abi:ne180100]((uint64_t)&v22->_entryBuffer, i++) + 8) = -1)
  {
    *(void *)std::array<CBSliderCommitInfo,100ul>::operator[][abi:ne180100]((uint64_t)&v22->_entryBuffer, i) = -1;
  }
  int MainDisplay = IOMobileFramebufferGetMainDisplay();
  if (!MainDisplay) {
    return v22;
  }
  if (v22->super._logHandle)
  {
    logHandle = v22->super._logHandle;
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v24, MainDisplay);
    _os_log_error_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_ERROR, "SliderCommitTelemetry Initialization | Unable to obtain IOMFB display object | ErrorCode=0x%x", v24, 8u);
  }

  return 0;
}

- (void)start
{
}

uint64_t __46__CBSliderCommitTelemetry_setProperty_forKey___block_invoke(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v6 = a1;
  objc_msgSend(*(id *)(a1 + 32), "getUserAABParams:alternativeAABParams:");
  uint64_t v3 = [*(id *)(a1 + 32) getNextEntryAndAdvanceBufferIndex];
  [*(id *)(a1 + 32) fillEntry:v3 withTimestamp:(uint64_t)CFAbsoluteTimeGetCurrent() andAABParams:v5 andAlternativeAABParams:v4];
  return [*(id *)(a1 + 32) reportCommit:v3];
}

void __46__CBSliderCommitTelemetry_setProperty_forKey___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copyPropertyForKey:@"DisplayBrightnessFactor"];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 23408))
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v7 BOOLValue] & 1) == 0
        && *(void *)(*(void *)(a1 + 32) + 23264))
      {
        if (*(void *)(*(void *)(a1 + 32) + 16))
        {
          os_log_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t inited = init_default_corebrightness_log();
          }
          os_log_t v4 = inited;
        }
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v8, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
          _os_log_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEFAULT, "Set ALSUserPreference: AAB reset after in-app adjustment (restore time = %f)", v8, 0xCu);
        }
        objc_msgSend(*(id *)(a1 + 32), "getUserAABParams:alternativeAABParams:", *(void *)(a1 + 32) + 23280, *(void *)(a1 + 32) + 23320, &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel, &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel);
        uint64_t v6 = [*(id *)(a1 + 32) getNextEntryAndAdvanceBufferIndex];
        [*(id *)(a1 + 32) fillEntry:v6 withTimestamp:(uint64_t)CFAbsoluteTimeGetCurrent() andRestoreTimeTarget:(uint64_t)*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) andAABParams:*(void *)(a1 + 32) + *(int *)(v1 + 1812) andAlternativeAABParams:*(void *)(a1 + 32) + *(int *)(v2 + 1816)];
        [*(id *)(a1 + 32) reportCommit:v6];
      }
    }
  }
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return -[CBSliderCommitTelemetry copyPropertyForKey:](self, "copyPropertyForKey:", a3, a4, a3, a2, self);
}

void __65__CBSliderCommitTelemetry_handleNotificationForKey_withProperty___block_invoke(uint64_t a1)
{
  uint64_t v18 = a1;
  uint64_t v17 = a1;
  if (!*(void *)(*(void *)(a1 + 32) + 23376)) {
    goto LABEL_21;
  }
  char v16 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    uint64_t v8 = inited;
  }
  char v16 = v8;
  char v15 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    log = v16;
    os_log_type_t type = v15;
    __os_log_helper_16_0_0(v14);
    _os_log_impl(&dword_1BA438000, log, type, "Canceling delayed APCE timer due to display off", v14, 2u);
  }
  [*(id *)(a1 + 32) cancelDelayedAPCETimer];
  uint64_t v13 = 0;
  uint64_t v13 = [*(id *)(a1 + 32) getLastFilledEntry];
  if (v13)
  {
    *(_DWORD *)(v13 + 48) = 2;
    [*(id *)(a1 + 32) reportCommit:v13];
LABEL_21:
    [*(id *)(a1 + 32) getUserAABParams:*(void *)(a1 + 32) + 23280 alternativeAABParams:*(void *)(a1 + 32) + 23320];
    return;
  }
  BOOL v12 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    os_log_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v3 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v3 = init_default_corebrightness_log();
    }
    os_log_t v4 = v3;
  }
  BOOL v12 = v4;
  char v11 = 16;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v1 = v12;
    os_log_type_t v2 = v11;
    __os_log_helper_16_0_0(v10);
    _os_log_error_impl(&dword_1BA438000, v1, v2, "Last entry == nil when canceling delayed APCE timer due to display off", v10, 2u);
  }
}

uint64_t __65__CBSliderCommitTelemetry_handleNotificationForKey_withProperty___block_invoke_44(uint64_t a1)
{
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  uint64_t result = [*(id *)(a1 + 32) getUserAABParams:&v12 alternativeAABParams:&v11];
  if (result)
  {
    if (aabParamsDiffer(&v12, (const CBAABParams *)(*(void *)(a1 + 32) + 23280))
      || (uint64_t result = aabParamsDiffer(&v11, (const CBAABParams *)(*(void *)(a1 + 32) + 23320)), (result & 1) != 0))
    {
      os_log_t oslog = 0;
      if (*(void *)(*(void *)(a1 + 32) + 16))
      {
        os_log_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        os_log_t v5 = inited;
      }
      os_log_t oslog = v5;
      os_log_type_t type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        log = oslog;
        os_log_type_t v3 = type;
        __os_log_helper_16_0_0(v8);
        _os_log_impl(&dword_1BA438000, log, v3, "Different AAB params on unlock detected", v8, 2u);
      }
      uint64_t v7 = [*(id *)(a1 + 32) getNextEntryAndAdvanceBufferIndex];
      [*(id *)(a1 + 32) fillEntry:v7 withTimestamp:(uint64_t)CFAbsoluteTimeGetCurrent() andAABParams:&v12 andAlternativeAABParams:&v11];
      return [*(id *)(a1 + 32) reportCommit:v7];
    }
  }
  return result;
}

- (BOOL)handleAODStateUpdate:(unint64_t)a3 transitionTime:(float)a4 context:(id)a5
{
  uint64_t v17 = self;
  SEL v16 = a2;
  unint64_t v15 = a3;
  float v14 = a4;
  id v13 = a5;
  if (a3 == 2)
  {
    loggingQueue = v17->_loggingQueue;
    uint64_t v7 = MEMORY[0x1E4F143A8];
    int v8 = -1073741824;
    int v9 = 0;
    int v10 = __71__CBSliderCommitTelemetry_handleAODStateUpdate_transitionTime_context___block_invoke;
    CBAABParams v11 = &unk_1E6218FE0;
    CBAABParams v12 = v17;
    dispatch_async(loggingQueue, &v7);
  }
  return 1;
}

void __71__CBSliderCommitTelemetry_handleAODStateUpdate_transitionTime_context___block_invoke(uint64_t a1)
{
  uint64_t v18 = a1;
  uint64_t v17 = a1;
  if (*(void *)(*(void *)(a1 + 32) + 23376))
  {
    SEL v16 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 16))
    {
      int v8 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      int v8 = inited;
    }
    SEL v16 = v8;
    char v15 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      log = v16;
      os_log_type_t type = v15;
      __os_log_helper_16_0_0(v14);
      _os_log_impl(&dword_1BA438000, log, type, "Canceling delayed APCE timer due to transitioning to AOD", v14, 2u);
    }
    [*(id *)(a1 + 32) cancelDelayedAPCETimer];
    uint64_t v13 = 0;
    uint64_t v13 = [*(id *)(a1 + 32) getLastFilledEntry];
    if (v13)
    {
      *(_DWORD *)(v13 + 48) = 3;
      [*(id *)(a1 + 32) reportCommit:v13];
    }
    else
    {
      CBAABParams v12 = 0;
      if (*(void *)(*(void *)(a1 + 32) + 16))
      {
        os_log_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v3 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v3 = init_default_corebrightness_log();
        }
        os_log_t v4 = v3;
      }
      CBAABParams v12 = v4;
      char v11 = 16;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v1 = v12;
        os_log_type_t v2 = v11;
        __os_log_helper_16_0_0(v10);
        _os_log_error_impl(&dword_1BA438000, v1, v2, "Last entry == nil when canceling delayed APCE timer due to transitioning to AOD", v10, 2u);
      }
    }
  }
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->super._notificationBlock) {
    (*((void (**)(void))self->super._notificationBlock + 2))();
  }
}

+ (id)sliderInfoToNSDictionary:(const CBSliderCommitInfo *)a3
{
  v37[50] = *MEMORY[0x1E4F143B8];
  v36[0] = @"timestamp";
  v37[0] = [NSNumber numberWithLongLong:a3->timestamp];
  v36[1] = @"localTimestamp";
  v37[1] = [NSNumber numberWithLongLong:a3->localTimestamp];
  v36[2] = @"trustedLux";
  v37[2] = [NSNumber numberWithInt:a3->trustedLux];
  v36[3] = @"frontLux";
  *(float *)&double v3 = a3->frontLux;
  v37[3] = [NSNumber numberWithFloat:v3];
  v36[4] = @"rearLux";
  *(float *)&double v4 = a3->rearLux;
  v37[4] = [NSNumber numberWithFloat:v4];
  v36[5] = @"rearLuxInUse";
  v37[5] = [NSNumber numberWithBool:a3->rearLuxInUse];
  v36[6] = @"nits";
  *(float *)&double v5 = a3->nits;
  v37[6] = [NSNumber numberWithFloat:v5];
  v36[7] = @"slider";
  *(float *)&double v6 = a3->slider;
  v37[7] = [NSNumber numberWithFloat:v6];
  v36[8] = @"apce";
  *(float *)&double v7 = a3->apce;
  v37[8] = [NSNumber numberWithFloat:v7];
  v36[9] = @"delayedAPCE";
  *(float *)&double v8 = a3->delayedAPCE;
  v37[9] = [NSNumber numberWithFloat:v8];
  v36[10] = @"delayedAPCEStatus";
  v37[10] = [NSNumber numberWithInt:a3->delayedAPCEStatus];
  v36[11] = @"autobrightnessEnabled";
  v37[11] = [NSNumber numberWithBool:a3->autobrightnessEnabled];
  v36[12] = @"ecoModeEnabled";
  v37[12] = [NSNumber numberWithBool:a3->ecoModeEnabled];
  v36[13] = @"ecoModeFactor";
  *(float *)&double v9 = a3->ecoModeFactor;
  v37[13] = [NSNumber numberWithFloat:v9];
  v36[14] = @"e0a";
  *(float *)&double v10 = a3->aabParams.e0a;
  v37[14] = [NSNumber numberWithFloat:v10];
  v36[15] = @"e0b";
  *(float *)&double v11 = a3->aabParams.e0b;
  v37[15] = [NSNumber numberWithFloat:v11];
  v36[16] = @"e1";
  *(float *)&double v12 = a3->aabParams.e1;
  v37[16] = [NSNumber numberWithFloat:v12];
  v36[17] = @"e2";
  *(float *)&double v13 = a3->aabParams.e2;
  v37[17] = [NSNumber numberWithFloat:v13];
  v36[18] = @"l0a";
  *(float *)&double v14 = a3->aabParams.l0a;
  v37[18] = [NSNumber numberWithFloat:v14];
  v36[19] = @"l0b";
  *(float *)&double v15 = a3->aabParams.l0b;
  v37[19] = [NSNumber numberWithFloat:v15];
  v36[20] = @"l1";
  *(float *)&double v16 = a3->aabParams.l1;
  v37[20] = [NSNumber numberWithFloat:v16];
  v36[21] = @"l2";
  *(float *)&double v17 = a3->aabParams.l2;
  v37[21] = [NSNumber numberWithFloat:v17];
  v36[22] = @"thirdSlope";
  *(float *)&double v18 = a3->aabParams.thirdSlope;
  v37[22] = [NSNumber numberWithFloat:v18];
  v36[23] = @"curveType";
  v37[23] = [NSNumber numberWithInt:a3->aabParams.curveType];
  v36[24] = @"alternativeE0a";
  *(float *)&double v19 = a3->aabAlternativeParams.e0a;
  v37[24] = [NSNumber numberWithFloat:v19];
  v36[25] = @"alternativeE0b";
  *(float *)&double v20 = a3->aabAlternativeParams.e0b;
  v37[25] = [NSNumber numberWithFloat:v20];
  v36[26] = @"alternativeE1";
  *(float *)&double v21 = a3->aabAlternativeParams.e1;
  v37[26] = [NSNumber numberWithFloat:v21];
  v36[27] = @"alternativeE2";
  *(float *)&double v22 = a3->aabAlternativeParams.e2;
  v37[27] = [NSNumber numberWithFloat:v22];
  v36[28] = @"alternativeL0a";
  *(float *)&double v23 = a3->aabAlternativeParams.l0a;
  v37[28] = [NSNumber numberWithFloat:v23];
  v36[29] = @"alternativeL0b";
  *(float *)&double v24 = a3->aabAlternativeParams.l0b;
  v37[29] = [NSNumber numberWithFloat:v24];
  v36[30] = @"alternativeL1";
  *(float *)&double v25 = a3->aabAlternativeParams.l1;
  v37[30] = [NSNumber numberWithFloat:v25];
  v36[31] = @"alternativeL2";
  *(float *)&double v26 = a3->aabAlternativeParams.l2;
  v37[31] = [NSNumber numberWithFloat:v26];
  v36[32] = @"alternativeThirdSlope";
  *(float *)&double v27 = a3->aabAlternativeParams.thirdSlope;
  v37[32] = [NSNumber numberWithFloat:v27];
  v36[33] = @"alternativeCurveType";
  v37[33] = [NSNumber numberWithInt:a3->aabAlternativeParams.curveType];
  v36[34] = @"aabParamsUpdateOnly";
  v37[34] = [NSNumber numberWithBool:a3->aabParamsUpdateOnly];
  v36[35] = @"aabParamsUpdateReason";
  v37[35] = [NSNumber numberWithInt:a3->aabParamsUpdateReason];
  v36[36] = @"nitsDelta";
  *(float *)&double v28 = a3->nitsDelta;
  v37[36] = [NSNumber numberWithFloat:v28];
  v36[37] = @"nitsDeltaAlternative";
  *(float *)&double v29 = a3->nitsDeltaAlternative;
  v37[37] = [NSNumber numberWithFloat:v29];
  v36[38] = @"restoreTimeTarget";
  v37[38] = [NSNumber numberWithLongLong:a3->restoreTimeTarget];
  v36[39] = @"inactiveLength";
  *(float *)&double v30 = a3->inactiveLength;
  v37[39] = [NSNumber numberWithFloat:v30];
  v36[40] = @"inactiveStart";
  v37[40] = [NSNumber numberWithLongLong:a3->inactiveStart];
  v36[41] = @"cpmsMitigationLimitingBrightness";
  v37[41] = [NSNumber numberWithBool:a3->cpmsMitigationLimitingBrightness];
  v36[42] = @"touchMitigationTriggered";
  v37[42] = [NSNumber numberWithBool:a3->touchMitigationTriggered];
  v36[43] = @"proxMitigationTriggered";
  v37[43] = [NSNumber numberWithBool:a3->proxMitigationTriggered];
  v36[44] = @"auroraFactor";
  *(float *)&double v31 = a3->auroraFactor;
  v37[44] = [NSNumber numberWithFloat:v31];
  v36[45] = @"edrHeadroom";
  *(float *)&double v32 = a3->edrHeadroom;
  v37[45] = [NSNumber numberWithFloat:v32];
  v36[46] = @"colorAdaptationStrength";
  *(float *)&double v33 = a3->colorAdaptationStrength;
  v37[46] = [NSNumber numberWithFloat:v33];
  v36[47] = @"colorAdaptationMode";
  v37[47] = [NSNumber numberWithInt:a3->colorAdaptationMode];
  v36[48] = @"darkThemeApplied";
  v37[48] = [NSNumber numberWithBool:a3->darkThemeApplied];
  v36[49] = @"landscapeOrientation";
  v37[49] = [NSNumber numberWithBool:a3->landscapeOrientation];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:50];
}

- (float)getAPCE
{
  return 0.0;
}

- (BOOL)getUserAABParams:(CBAABParams *)a3
{
  return [(CBSliderCommitTelemetry *)self getUserAABParams:a3 key:@"ALSCurveInfo"];
}

- (BOOL)getUserAABParams:(CBAABParams *)a3 alternativeAABParams:(CBAABParams *)a4
{
  BOOL v5 = [(CBSliderCommitTelemetry *)self getUserAABParams:a3 key:@"ALSCurveInfo"];
  return (v5 | [(CBSliderCommitTelemetry *)self getUserAABParams:a4 key:@"ALSAlternativeCurveInfo"]) != 0;
}

- (BOOL)getUserAABParams:(CBAABParams *)a3 key:(id)a4
{
  double v27 = self;
  SEL v26 = a2;
  double v25 = a3;
  id v24 = a4;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  id v23 = 0;
  id v23 = [(CBDisplayContaineriOS *)v27->_displayContainer copyPropertyForKey:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", @"E0a"), "floatValue");
    v25->e0a = v4;
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", @"E0b"), "floatValue");
    v25->e0b = v5;
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", @"E1"), "floatValue");
    v25->e1 = v6;
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", @"E2"), "floatValue");
    v25->e2 = v7;
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", @"L0a"), "floatValue");
    v25->l0a = v8;
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", @"L0b"), "floatValue");
    v25->l0b = v9;
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", @"L1"), "floatValue");
    v25->l1 = v10;
    objc_msgSend((id)objc_msgSend(v23, "objectForKey:", @"L2"), "floatValue");
    v25->l2 = v11;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "objectForKey:"), "objectForKey:", @"thirdSlope"), "floatValue");
    v25->thirdSlope = v12;
    v25->curveType = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "objectForKey:", @"Prefs"), "objectForKey:", @"curveType"), "intValue");
    int v19 = 0;
  }
  else
  {
    double v22 = 0;
    if (v27->super._logHandle)
    {
      logHandle = v27->super._logHandle;
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
    double v22 = logHandle;
    char v21 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v22;
      os_log_type_t type = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_error_impl(&dword_1BA438000, log, type, "Failed to obtain ALS Curve info", v20, 2u);
    }
    char v28 = 0;
    int v19 = 1;
  }
  if (!v19) {
    char v28 = 1;
  }
  return v28 & 1;
}

- (CBSliderCommitInfo)getNextEntryAndAdvanceBufferIndex
{
  float v7 = self;
  SEL v6 = a2;
  float v5 = 0;
  float v5 = (CBSliderCommitInfo *)std::array<CBSliderCommitInfo,100ul>::operator[][abi:ne180100]((uint64_t)&self->_entryBuffer, self->_bufferIndex);
  v7->_bufferIndex = nextBufferIndex(v7->_bufferIndex, 1);
  uint64_t v4 = v7->_bufferEntriesFilled + 1;
  os_log_type_t v2 = std::min[abi:ne180100]<unsigned long>(&v4, &kCBSliderCommitTelemetryEntryBufferSize);
  v7->_bufferEntriesFilled = *v2;
  return v5;
}

- (CBSliderCommitInfo)getLastFilledEntry
{
  if (!self->_bufferEntriesFilled) {
    return 0;
  }
  unint64_t v2 = previousBufferIndex(self->_bufferIndex);
  return (CBSliderCommitInfo *)std::array<CBSliderCommitInfo,100ul>::operator[][abi:ne180100]((uint64_t)&self->_entryBuffer, v2);
}

- (void)logAllFilledEntries
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v25 = self;
  SEL v24 = a2;
  id v23 = 0;
  if (self->_bufferLogHandle)
  {
    bufferLogHandle = v25->_bufferLogHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    bufferLogHandle = inited;
  }
  id v23 = bufferLogHandle;
  char v22 = 1;
  if (os_log_type_enabled(bufferLogHandle, OS_LOG_TYPE_INFO))
  {
    log = v23;
    os_log_type_t type = v22;
    __os_log_helper_16_0_0(v21);
    _os_log_impl(&dword_1BA438000, log, type, "======================= Brightness commit =======================", v21, 2u);
  }
  unint64_t i = 0;
  for (unint64_t i = 100 - v25->_bufferEntriesFilled; i < 0x64; ++i)
  {
    uint64_t v19 = 0;
    uint64_t p_entryBuffer = (uint64_t)&v25->_entryBuffer;
    unint64_t BufferIndex = nextBufferIndex(v25->_bufferIndex, i);
    uint64_t v19 = std::array<CBSliderCommitInfo,100ul>::operator[][abi:ne180100](p_entryBuffer, BufferIndex);
    os_log_t v18 = 0;
    if (v25->_bufferLogHandle)
    {
      float v8 = v25->_bufferLogHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v7 = init_default_corebrightness_log();
      }
      float v8 = v7;
    }
    os_log_t v18 = v8;
    os_log_type_t v17 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_0_8_64((uint64_t)v26, *(void *)(v19 + 8), (uint64_t)+[CBSliderCommitTelemetry sliderInfoToNSDictionary:v19]);
      _os_log_impl(&dword_1BA438000, v18, v17, "%lld: %@", v26, 0x16u);
    }
  }
  double v16 = 0;
  if (v25->_bufferLogHandle)
  {
    SEL v6 = v25->_bufferLogHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v5 = init_default_corebrightness_log();
    }
    SEL v6 = v5;
  }
  double v16 = v6;
  char v15 = 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v3 = v16;
    os_log_type_t v4 = v15;
    __os_log_helper_16_0_0(v14);
    _os_log_impl(&dword_1BA438000, v3, v4, "=================================================================", v14, 2u);
  }
}

- (void)cancelDelayedAPCETimer
{
  self->_delayedAPCETimer = 0;
}

- (void)reportCommit:(CBSliderCommitInfo *)a3
{
  self->_longestInactivityLength = 0.0;
  [(CBSliderCommitTelemetry *)self logAllFilledEntries];
  +[CBAnalytics userSliderCommit:a3];
  [(CBSliderCommitTelemetry *)self sendNotificationForKey:@"CBFinalBrightnessCommit" withValue:+[CBSliderCommitTelemetry sliderInfoToNSDictionary:a3]];
}

- (void)delayedAPCETimerHandler:(CBSliderCommitInfo *)a3
{
  [(CBSliderCommitTelemetry *)self getAPCE];
  a3->delayedAPCE = v3;
  a3->delayedAPCEStatus = 0;
  [(CBSliderCommitTelemetry *)self cancelDelayedAPCETimer];
  [(CBSliderCommitTelemetry *)self reportCommit:a3];
}

- (void)fillEntry:(CBSliderCommitInfo *)a3 withTimestamp:(int64_t)a4 slider:(float)a5 apce:(float)a6 andTrackedState:(TrackedState)a7
{
  context = (void *)MEMORY[0x1BA9ECAE0]();
  a3->timestamp = a4;
  a3->localTimestamp = localizeTimestamp(a4);
  a3->trustedLux = objc_msgSend(-[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", @"TrustedLux"), "intValue");
  id v24 = [(CBDisplayContaineriOS *)self->_displayContainer copyPropertyForKey:@"RLuxStats"];
  objc_msgSend((id)objc_msgSend(v24, "objectForKey:", @"frontLux"), "floatValue");
  a3->frontLux = v7;
  objc_msgSend((id)objc_msgSend(v24, "objectForKey:", @"rearLux"), "floatValue");
  a3->rearLux = v8;
  a3->rearLuxInUse = objc_msgSend((id)objc_msgSend(v24, "objectForKey:", @"rearLuxInUse"), "BOOLValue") & 1;
  id v23 = [(CBDisplayContaineriOS *)self->_displayContainer copyPropertyForKey:@"DisplayBrightness"];
  objc_msgSend((id)objc_msgSend(v23, "objectForKey:", @"NitsPhysical"), "floatValue");
  a3->nits = v9;
  a3->slider = a5;
  objc_msgSend((id)objc_msgSend(v23, "objectForKey:", @"AuroraFactor"), "floatValue");
  a3->auroraFactor = v10;
  objc_msgSend((id)objc_msgSend(v23, "objectForKey:", @"EDRHeadroom"), "floatValue");
  a3->edrHeadroom = v11;
  objc_msgSend(-[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", @"ColorAdaptationStrength"), "floatValue");
  a3->colorAdaptationStrength = v12;
  a3->colorAdaptationMode = objc_msgSend(-[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", @"ColorAdaptationMode"), "intValue");
  a3->cpmsMitigationLimitingBrightness = objc_msgSend(-[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", @"ThermalMitigationLimitingBrightness"), "BOOLValue") & 1;
  objc_msgSend(-[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", @"EcoModeFactor"), "floatValue");
  a3->ecoModeFactor = v13;
  a3->touchMitigationTriggered = objc_msgSend(-[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", @"TouchMitigationTriggered"), "BOOLValue") & 1;
  a3->proxMitigationTriggered = objc_msgSend(-[CBDisplayContaineriOS copyPropertyForKey:](self->_displayContainer, "copyPropertyForKey:", @"ProxMitigationTriggered"), "BOOLValue") & 1;
  [(CBSliderCommitTelemetry *)self getUserAABParams:&a3->aabParams alternativeAABParams:&a3->aabAlternativeParams];
  a3->aabParamsUpdateOnly = 0;
  a3->aabParamsUpdateReason = -1;
  id v22 = [(CBDisplayContaineriOS *)self->_displayContainer copyPropertyForKey:@"AABCurveUpdateReason"];
  if (v22) {
    a3->aabParamsUpdateReason = [v22 intValue];
  }
  id v21 = [(CBDisplayContaineriOS *)self->_displayContainer copyPropertyForKey:@"AABCurveUpdateNitsDelta", &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel];
  id v20 = (id)[*(id *)((char *)&self->super.super.isa + *(int *)(v17 + 1772)) copyPropertyForKey:@"AABCurveUpdateNitsDeltaAlternative"];
  if (v21)
  {
    [v21 floatValue];
    a3->nitsDelta = a3->nitsDelta + v14;
  }
  if (v20)
  {
    [v20 floatValue];
    a3->nitsDeltaAlternative = a3->nitsDeltaAlternative + v15;
  }
  a3->apce = a6;
  a3->delayedAPCE = -1.0;
  a3->delayedAPCEStatus = 1;
  a3->BOOL autobrightnessEnabled = a7.autobrightnessEnabled;
  a3->ecoModeEnabled = a7.ecoModeEnabled;
  a3->darkThemeApplied = a7.darkThemeApplied;
  a3->landscapeOrientation = a7.landscapeOrientation;

  id v19 = [+[CBTrialSettingsProvider sharedInstance] copyExperimentIdentifiers];
  if (v19)
  {
    a3->trialExperimentId = (NSString *)(id)[v19 experimentId];
    a3->trialDeploymentId = [v19 deploymentId];
    a3->trialTreatmentId = (NSString *)(id)[v19 treatmentId];
  }
  else
  {
    a3->trialExperimentId = 0;
    a3->trialDeploymentId = 0;
    a3->trialTreatmentId = 0;
  }
  float v16 = round(self->_longestInactivityLength * 10.0 / 3600.0) / 10.0;
  a3->inactiveLength = v16;
  a3->inactiveStart = (uint64_t)self->_inactivityStartTimestamp;
}

- (void)fillEntry:(CBSliderCommitInfo *)a3 withTimestamp:(int64_t)a4 andAABParams:(CBAABParams *)a5 andAlternativeAABParams:(CBAABParams *)a6
{
}

- (void)fillEntry:(CBSliderCommitInfo *)a3 withTimestamp:(int64_t)a4 andRestoreTimeTarget:(int64_t)a5 andAABParams:(CBAABParams *)a6 andAlternativeAABParams:(CBAABParams *)a7
{
  a3->timestamp = a4;
  a3->localTimestamp = localizeTimestamp(a4);
  memcpy(&a3->aabParams, a6, sizeof(a3->aabParams));
  memcpy(&a3->aabAlternativeParams, a7, sizeof(a3->aabAlternativeParams));
  a3->aabParamsUpdateOnly = 1;
  a3->BOOL autobrightnessEnabled = self->_state.autobrightnessEnabled;
  a3->aabParamsUpdateReason = -1;
  id v9 = [(CBDisplayContaineriOS *)self->_displayContainer copyPropertyForKey:@"AABCurveUpdateReason"];
  if (v9) {
    a3->aabParamsUpdateReason = [v9 intValue];
  }
  a3->restoreTimeTarget = a5;
  id v8 = [+[CBTrialSettingsProvider sharedInstance] copyExperimentIdentifiers];

  if (v8)
  {
    a3->trialExperimentId = (NSString *)(id)[v8 experimentId];
    a3->trialDeploymentId = [v8 deploymentId];
    a3->trialTreatmentId = (NSString *)(id)[v8 treatmentId];
  }
  else
  {
    a3->trialExperimentId = 0;
    a3->trialDeploymentId = 0;
    a3->trialTreatmentId = 0;
  }
  float v7 = round(self->_longestInactivityLength * 10.0 / 3600.0) / 10.0;
  a3->inactiveLength = v7;
  a3->inactiveStart = (uint64_t)self->_inactivityStartTimestamp;
}

- (CBSliderCommitInfo)addOrUpdateEntryWithTimestamp:(int64_t)a3 slider:(float)a4 apce:(float)a5 andTrackedState:(TrackedState)a6
{
  uint64_t v42 = *(void *)&a6.darkThemeApplied;
  TrackedState v43 = a6;
  char v41 = (dispatch_queue_t *)self;
  SEL v40 = a2;
  int64_t v39 = a3;
  float v38 = a4;
  float v37 = a5;
  id v36 = 0;
  if (self->_delayedAPCETimer)
  {
    id v36 = (CBSliderCommitInfo *)[(dispatch_queue_t *)v41 getLastFilledEntry];
    if (!v36)
    {
      id v35 = 0;
      if (v41[2])
      {
        id v20 = v41[2];
      }
      else
      {
        uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        id v20 = v19;
      }
      id v35 = v20;
      char v34 = 16;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        log = v35;
        os_log_type_t type = v34;
        __os_log_helper_16_0_0(v33);
        _os_log_error_impl(&dword_1BA438000, log, type, "Failed to get last filled entry while delay APCE timer is active!", v33, 2u);
      }
    }
    [(dispatch_queue_t *)v41 cancelDelayedAPCETimer];
  }
  if (!v36) {
    id v36 = (CBSliderCommitInfo *)[(dispatch_queue_t *)v41 getNextEntryAndAdvanceBufferIndex];
  }
  *(float *)&double v6 = v38;
  *(float *)&double v7 = v37;
  TrackedState v32 = v43;
  LODWORD(v31) = v43;
  [(dispatch_queue_t *)v41 fillEntry:v36 withTimestamp:v39 slider:v31 apce:v6 andTrackedState:v7];
  dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v41[6]);
  v41[2922] = v8;
  if (v41[2922])
  {
    id v9 = v41[2922];
    uint64_t handler = MEMORY[0x1E4F143A8];
    int v25 = -1073741824;
    int v26 = 0;
    uint64_t v27 = __85__CBSliderCommitTelemetry_addOrUpdateEntryWithTimestamp_slider_apce_andTrackedState___block_invoke;
    char v28 = &unk_1E6219538;
    double v29 = v41;
    double v30 = v36;
    dispatch_source_set_event_handler(v9, &handler);
    source = v41[2922];
    dispatch_time_t v10 = dispatch_time(0, 1000000000 * (void)v41[2909]);
    dispatch_source_set_timer(source, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(v41[2922]);
  }
  else
  {
    os_log_t oslog = 0;
    if (v41[2])
    {
      float v15 = v41[2];
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      float v15 = inited;
    }
    os_log_t oslog = v15;
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      float v12 = oslog;
      os_log_type_t v13 = v22;
      __os_log_helper_16_0_0(v21);
      _os_log_error_impl(&dword_1BA438000, v12, v13, "Failed to create timer, reporting immediately", v21, 2u);
    }
    v36->delayedAPCEStatus = -1;
    -[dispatch_queue_t reportCommit:](v41, "reportCommit:", v36, v12);
  }
  return v36;
}

uint64_t __85__CBSliderCommitTelemetry_addOrUpdateEntryWithTimestamp_slider_apce_andTrackedState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "delayedAPCETimerHandler:", *(void *)(a1 + 40), a1, a1);
}

- (void)logAfterUserBrightnessCommitWithTimestamp:(int64_t)a3 slider:(float)a4 apce:(float)a5 andTrackedState:(TrackedState)a6
{
  uint64_t v22 = *(void *)&a6.darkThemeApplied;
  TrackedState v23 = a6;
  id v21 = self;
  SEL v20 = a2;
  int64_t v19 = a3;
  float v18 = a4;
  float v17 = a5;
  loggingQueue = self->_loggingQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  dispatch_time_t v10 = __97__CBSliderCommitTelemetry_logAfterUserBrightnessCommitWithTimestamp_slider_apce_andTrackedState___block_invoke;
  float v11 = &unk_1E6219CD0;
  float v12 = v21;
  int64_t v13 = a3;
  float v14 = a4;
  float v15 = a5;
  TrackedState v16 = a6;
  dispatch_async(loggingQueue, &v7);
}

uint64_t __97__CBSliderCommitTelemetry_logAfterUserBrightnessCommitWithTimestamp_slider_apce_andTrackedState___block_invoke(uint64_t a1, double a2, double a3)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  LODWORD(v4) = *(_DWORD *)(a1 + 56);
  return objc_msgSend(*(id *)(a1 + 32), "addOrUpdateEntryWithTimestamp:slider:apce:andTrackedState:", *(void *)(a1 + 40), v4, a2, a3, v4);
}

- (double)timestampFromCurveDistionary:(id)a3
{
  double v7 = 0.0;
  double v6 = (void *)[a3 objectForKey:@"Prefs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (void *)[v6 objectForKey:@"timestamp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 doubleValue];
      return v3;
    }
  }
  return v7;
}

- (id).cxx_construct
{
  return self;
}

@end