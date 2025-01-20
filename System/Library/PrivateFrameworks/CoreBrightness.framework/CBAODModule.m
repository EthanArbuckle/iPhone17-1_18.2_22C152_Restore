@interface CBAODModule
- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)aodEnabled;
- (BOOL)copyAndHandleEvent;
- (BOOL)copyAndHandleEventWithTransitionLength:(float)a3;
- (BOOL)copyAndHandleEventWithTransitionLength:(float)a3 forceUpdate:(BOOL)a4;
- (BOOL)copyAndHandleEventWithTransitionParameters:(id *)a3;
- (BOOL)handleAABSensorOverridePropertyHandler:(id)a3;
- (BOOL)handleALSEvent:(id)a3 transitionParameters:(id *)a4;
- (BOOL)handleDisplayModeUpdate:(id)a3;
- (BOOL)handleDisplayModeUpdate:(int64_t)a3 transitionLength:(float)a4;
- (BOOL)handleDisplayNitsOverridePropertyHandler:(id)a3;
- (BOOL)handleFlipBookStatePropertyHandler:(id)a3;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4 transitionLength:(float)a5 forceUpdate:(BOOL)a6;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4 transitionParameters:(id *)a5;
- (BOOL)performUpdate;
- (BOOL)performUpdate:(float)a3;
- (BOOL)performUpdate:(float)a3 forceUpdate:(BOOL)a4;
- (BOOL)performUpdate:(float)a3 forceUpdate:(BOOL)a4 rampDoneCallback:(id)a5 rampCanceledCallback:(id)a6;
- (BOOL)performUpdateWithTransitionParameters:(id *)a3;
- (BOOL)performUpdateWithTransitionParameters:(id *)a3 rampDoneCallback:(id)a4 rampCanceledCallback:(id)a5;
- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)setALSServiceProperty:(void *)a3 forKey:(__CFString *)a4;
- (BOOL)setDisplayFactor:(float)a3 transitionLength:(float)a4;
- (BOOL)setModulesProperty:(id)a3 forKey:(id)a4;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)updateAODState:(unint64_t)a3 transitionParameters:(id *)a4 brightnessFactor:(float)a5 forDisplayMode:(int64_t)a6;
- (CBAODModule)initWithCBBrtControl:(id)a3 andQueue:(id)a4;
- (float)getFloatValueFrom:(id)a3 key:(id)a4;
- (float)getFloatValueFrom:(id)a3 key:(id)a4 subkey:(id)a5;
- (id)copyArrayFromPrefsForKey:(id)a3;
- (id)copyModulesExtendedIdentifiers;
- (id)copyModulesIdentifiers;
- (id)copyModulesInfo:(BOOL)a3;
- (id)copyModulesPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (id)stringForFlipbookMode:(int64_t)a3;
- (int64_t)getIntegerValueFrom:(id)a3 key:(id)a4;
- (void)addModule:(id)a3;
- (void)checkBootArgsConfiguration;
- (void)dealloc;
- (void)didCompleteTransitionToDisplayMode:(int64_t)a3;
- (void)enteringAODRoutineForDisplayMode:(int64_t)a3 transitionParameters:(id *)a4;
- (void)enteringSuppressedAODRoutineWithTransitionParameters:(id *)a3;
- (void)exitingAODRoutineForDisplayMode:(int64_t)a3 transitionParameters:(id *)a4;
- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4;
- (void)handleSystemDidWakeFromSleepPropertyHandler:(id)a3;
- (void)loadAODCurveFromDefaults;
- (void)offAODRoutineForDisplayMode:(int64_t)a3;
- (void)onAODRoutineForDisplayMode:(int64_t)a3;
- (void)onSuppresedAODRoutine;
- (void)prepareForEnterToAODRoutine;
- (void)reevaluatePThresholdsForLux:(float)a3;
- (void)releaseDisplayModeCompletionTimer;
- (void)scheduleDisplayModeCompletionTimerIn:(float)a3 forDisplayMode:(int64_t)a4;
- (void)sendNotificationForKey:(id)a3 andValue:(id)a4;
- (void)setAodEnabled:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)updateModulesAODState:(unint64_t)a3;
- (void)updateModulesAODState:(unint64_t)a3 context:(id)a4;
- (void)updateModulesAODState:(unint64_t)a3 transitionParameters:(id *)a4;
- (void)updateModulesAODState:(unint64_t)a3 transitionParameters:(id *)a4 context:(id)a5;
@end

@implementation CBAODModule

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"CPMSCurrentCap"])
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
        if ([a4 BOOLValue]) {
          v4 = "";
        }
        else {
          v4 = "not";
        }
        __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)v4);
        _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "CPMS Cap Updated: Forcing update while %s ramping", v9, 0xCu);
      }
      if ([a4 BOOLValue]) {
        [(CBAODModule *)self performUpdate];
      }
      else {
        [(CBAODModule *)self performUpdate:0.0];
      }
    }
  }
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  LODWORD(v4) = -1.0;
  return -[CBAODModule handleHIDEvent:from:transitionLength:forceUpdate:](self, "handleHIDEvent:from:transitionLength:forceUpdate:", a3, a4, 0, v4, a4, a3, a2, self);
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4 transitionLength:(float)a5 forceUpdate:(BOOL)a6
{
  v14 = self;
  SEL v13 = a2;
  v12 = a3;
  v11 = a4;
  float v10 = a5;
  BOOL v9 = a6;
  memset(__b, 0, sizeof(__b));
  LOBYTE(__b[0]) = v9;
  HIBYTE(__b[0]) = v10 >= 0.0;
  *(float *)&__b[1] = v10;
  memcpy(__dst, __b, sizeof(__dst));
  return [(CBAODModule *)v14 handleHIDEvent:v12 from:v11 transitionParameters:__dst];
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v7 = 0;
  if ([(NSMutableArray *)self->_alsServiceClients containsObject:a3])
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
      __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)a3);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Remove ALS service! %@", v10, 0xCu);
    }
    [(NSMutableArray *)self->_alsServiceClients removeObject:a3];
    char v7 = 1;
  }
  return (v7 & 1 | [(CBAODThresholdModule *)self->_thresholdModule removeHIDServiceClient:a3]) != 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v52 = self;
  SEL v51 = a2;
  id v50 = a3;
  id v49 = a4;
  char v48 = 0;
  if ([a4 isEqualToString:@"FlipBookState"])
  {
    char v48 = [(CBAODModule *)v52 handleFlipBookStatePropertyHandler:v50];
  }
  else if ([v49 isEqualToString:@"DisplayBrightness"])
  {
    os_log_t oslog = 0;
    if (v52->super._logHandle)
    {
      logHandle = v52->super._logHandle;
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
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v60, (uint64_t)v49, (uint64_t)v50);
      _os_log_debug_impl(&dword_1BA438000, oslog, type, "DisplayBrightness = %@ property = %@", v60, 0x16u);
    }
    char v48 = [(CBAODModule *)v52 performUpdate:0.0];
  }
  else if ([v49 isEqualToString:@"DisplayNitsKey"])
  {
    os_log_t v45 = 0;
    if (v52->super._logHandle)
    {
      v26 = v52->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v25 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v25 = init_default_corebrightness_log();
      }
      v26 = v25;
    }
    os_log_t v45 = v26;
    os_log_type_t v44 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v59, (uint64_t)v49, (uint64_t)v50);
      _os_log_debug_impl(&dword_1BA438000, v45, v44, "DisplayNits = %@ property = %@", v59, 0x16u);
    }
    char v48 = [(CBAODModule *)v52 performUpdate:0.0];
  }
  else if ([v49 isEqualToString:@"AODDisplayNitsOverride"])
  {
    [(CBAODModule *)v52 handleDisplayNitsOverridePropertyHandler:v50];
  }
  else if ([v49 isEqualToString:@"ForceLiveUpdates"])
  {
    os_log_t v43 = 0;
    if (v52->super._logHandle)
    {
      v24 = v52->super._logHandle;
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
    os_log_t v43 = v24;
    os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v58, (uint64_t)v49, (uint64_t)v50);
      _os_log_impl(&dword_1BA438000, v43, v42, "ForceLiveUpdates = %@ property = %@", v58, 0x16u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[CBAODTransitionController setLiveUpdatesOverride:](v52->_transitionController, "setLiveUpdatesOverride:", [v50 BOOLValue] & 1);
      -[CBAODTransitionController setLiveUpdates:](v52->_transitionController, "setLiveUpdates:", [v50 BOOLValue] & 1);
    }
  }
  else if ([v49 isEqualToString:@"EnableDCPFlipBookUpdates"])
  {
    os_log_t v41 = 0;
    if (v52->super._logHandle)
    {
      v22 = v52->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v21 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v21 = init_default_corebrightness_log();
      }
      v22 = v21;
    }
    os_log_t v41 = v22;
    os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v57, (uint64_t)v49, (uint64_t)v50);
      _os_log_impl(&dword_1BA438000, v41, v40, "EnableDCPFlipBookUpdates = %@ property = %@", v57, 0x16u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CBAODTransitionController enableDCPFlipBookUpdates:](v52->_transitionController, "enableDCPFlipBookUpdates:", [v50 BOOLValue] & 1);
    }
  }
  else if ([v49 isEqualToString:@"AABSensorOverride"])
  {
    os_log_t v39 = 0;
    if (v52->super._logHandle)
    {
      v20 = v52->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v19 = init_default_corebrightness_log();
      }
      v20 = v19;
    }
    os_log_t v39 = v20;
    os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v56, (uint64_t)v49, (uint64_t)v50);
      _os_log_impl(&dword_1BA438000, v39, v38, "AABSensorOverride = %@ property = %@", v56, 0x16u);
    }
    [(CBAODModule *)v52 handleAABSensorOverridePropertyHandler:v50];
  }
  else if ([v49 isEqualToString:@"EnableAOD"])
  {
    os_log_t v37 = 0;
    if (v52->super._logHandle)
    {
      v18 = v52->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v17 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v17 = init_default_corebrightness_log();
      }
      v18 = v17;
    }
    os_log_t v37 = v18;
    os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v55, (uint64_t)v49, (uint64_t)v50);
      _os_log_impl(&dword_1BA438000, v37, v36, "Enable AOD = %@ property = %@", v55, 0x16u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v52->_aodEnabled = [v50 BOOLValue] & 1;
    }
  }
  else if ([v49 isEqualToString:@"AODEDRRampDurationPerStop"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      transitionController = v52->_transitionController;
      [v50 floatValue];
      -[CBAODTransitionController setDurationOfEDRRamp:](transitionController, "setDurationOfEDRRamp:");
    }
  }
  else if ([v49 isEqualToString:@"AODUpdateWithCopiedEvent"])
  {
    os_log_t v35 = 0;
    if (v52->super._logHandle)
    {
      v15 = v52->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v14 = init_default_corebrightness_log();
      }
      v15 = v14;
    }
    os_log_t v35 = v15;
    os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v54, (uint64_t)v49, (uint64_t)v50);
      _os_log_impl(&dword_1BA438000, v35, v34, "%@ = %@", v54, 0x16u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v50 BOOLValue]) {
      [(CBAODModule *)v52 copyAndHandleEvent];
    }
  }
  else if ([v49 isEqualToString:@"ALSMedianHistorySize"])
  {
    os_log_t v33 = 0;
    if (v52->super._logHandle)
    {
      SEL v13 = v52->super._logHandle;
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
    os_log_t v33 = v13;
    os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v53, (uint64_t)v49, (uint64_t)v50);
      _os_log_impl(&dword_1BA438000, v33, v32, "%@ = %@", v53, 0x16u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(CBAODModule *)v52 setALSServiceProperty:v50 forKey:@"ALSMedianHistorySize"];
    }
  }
  else if ([v49 isEqualToString:@"CBSystemDidWakeFromSleep"])
  {
    [(CBAODModule *)v52 handleSystemDidWakeFromSleepPropertyHandler:v50];
  }
  else if (objc_msgSend(v49, "isEqual:", -[CBBrightnessProxy brightnessNotificationPowerOff](v52->_brtCtl, "brightnessNotificationPowerOff")))
  {
    if ([(CBAODTransitionController *)v52->_transitionController displayON])
    {
      os_log_t v31 = 0;
      if (v52->super._logHandle)
      {
        uint64_t v11 = v52->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v10 = init_default_corebrightness_log();
        }
        uint64_t v11 = v10;
      }
      os_log_t v31 = v11;
      os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v31;
        os_log_type_t v9 = v30;
        __os_log_helper_16_0_0(v29);
        _os_log_impl(&dword_1BA438000, v8, v9, "BrightnessNotificationPowerOff from CA -> canceling ongoing transitions.", v29, 2u);
      }
      [(CBAODTransitionController *)v52->_transitionController setDisplayON:0];
      [(CBAODTransitionController *)v52->_transitionController cancelTransition];
    }
  }
  else if ([v49 isEqualToString:@"DominoStateUpdate"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v52->_dominoModeEnabled = [v50 BOOLValue] & 1;
    }
  }
  BOOL v4 = [(CBAODThresholdModule *)v52->_thresholdModule setProperty:v50 forKey:v49];
  char v48 = (v48 & 1 | v4) != 0;
  v5 = +[CBAODState sharedInstance];
  BOOL v6 = [(CBAODState *)v5 setProperty:v50 forKey:v49];
  return (v48 & 1 | v6) != 0;
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4 transitionParameters:(id *)a5
{
  SEL v13 = self;
  SEL v12 = a2;
  uint64_t v11 = a3;
  uint64_t v10 = a4;
  os_log_type_t v9 = a5;
  if ([+[CBAODState sharedInstance] AODState] == 1)
  {
    id v8 = +[CBHIDEvent newEvent:v11 andService:v10];
    if (v13->_aabSensorOverrideFilter) {
      [(CBSensorOverrideFilter *)v13->_aabSensorOverrideFilter filterEvent:v8];
    }
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        memcpy(__dst, a5, sizeof(__dst));
        [(CBAODModule *)v13 handleALSEvent:v8 transitionParameters:__dst];
      }
    }
  }
  return 1;
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v7 = 0;
  if ([(__IOHIDServiceClient *)a3 conformsToUsagePage:65280 usage:4])
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
      __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)a3);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Received ALS service - save it! %@", v10, 0xCu);
    }
    if (([(NSMutableArray *)self->_alsServiceClients containsObject:a3] & 1) == 0) {
      [(NSMutableArray *)self->_alsServiceClients addObject:a3];
    }
    char v7 = 1;
  }
  return (v7 & 1 | [(CBAODThresholdModule *)self->_thresholdModule addHIDServiceClient:a3]) != 0;
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  if (self->super._notificationBlock) {
    (*((void (**)(void))self->super._notificationBlock + 2))();
  }
}

- (CBAODModule)initWithCBBrtControl:(id)a3 andQueue:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v27 = self;
  SEL v26 = a2;
  uint64_t v25 = (CBBrightnessProxy *)a3;
  id v24 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CBAODModule;
  v27 = [(CBModule *)&v23 initWithQueue:a4];
  if (v27)
  {
    os_log_t v4 = os_log_create("com.apple.CoreBrightness.AOD.CBAODModule", "default");
    v27->super._logHandle = (OS_os_log *)v4;
    if (![+[CBAODState sharedInstance] isAODSupported])
    {
LABEL_25:

      return 0;
    }
    v27->_brtCtl = v25;
    v5 = v27->_brtCtl;
    BOOL v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v27->_modules = v6;
    char v7 = [CBAODThresholdModule alloc];
    uint64_t v8 = [(CBAODThresholdModule *)v7 initWithQueue:v24];
    v27->_thresholdModule = (CBAODThresholdModule *)v8;
    os_log_type_t v9 = [CBAODTransitionController alloc];
    uint64_t v10 = [(CBAODTransitionController *)v9 initWithCBBrtControl:v25 andThresholdModule:v27->_thresholdModule andQueue:v24];
    v27->_transitionController = (CBAODTransitionController *)v10;
    if (!v27->_transitionController)
    {
      v22 = 0;
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
      v22 = logHandle;
      char v21 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        log = v22;
        os_log_type_t type = v21;
        __os_log_helper_16_0_0(v20);
        _os_log_error_impl(&dword_1BA438000, log, type, "Failed to initialized transition controller", v20, 2u);
      }
      goto LABEL_25;
    }
    uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v27->_alsServiceClients = v11;
    v27->_ABStateBackup = 1;
    v27->_displayBrightnessBackup = 2.0;
    v27->_ABLuxFilterBackup = 0;
    v27->_aabSensorOverrideFilter = 0;
    v27->_backupState = 0;
    v27->_currentDisplayMode = 5;
    v27->_suspendFeatureUpdates = 0;
    v27->_displayModeCompletionTimer = 0;
    v27->_aodEnabled = 1;
    v27->_flipBookEnabled = 0;
    v27->_dominoModeEnabled = 0;
    [(CBAODModule *)v27 checkBootArgsConfiguration];
    if (v27->super._logHandle)
    {
      v15 = v27->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v14 = init_default_corebrightness_log();
      }
      v15 = v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v27->_aodEnabled) {
        SEL v12 = "enabled";
      }
      else {
        SEL v12 = "disabled";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v29, (uint64_t)v12);
      _os_log_impl(&dword_1BA438000, v15, OS_LOG_TYPE_DEFAULT, "Andromeda support %s.", v29, 0xCu);
    }
  }
  return v27;
}

- (void)dealloc
{
  os_log_t v4 = self;
  SEL v3 = a2;
  [(CBAODModule *)self releaseDisplayModeCompletionTimer];

  if (v4->_aabSensorOverrideFilter)
  {

    v4->_aabSensorOverrideFilter = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBAODModule;
  [(CBModule *)&v2 dealloc];
}

- (void)checkBootArgsConfiguration
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = self;
  v7[1] = (size_t)a2;
  bzero(__s1, 0x400uLL);
  v7[0] = 1024;
  if (!sysctlbyname("kern.bootargs", __s1, v7, 0, 0))
  {
    BOOL v6 = strstr(__s1, "cb_enable_aod");
    if (v6)
    {
      BOOL v2 = strtol(v6 + 14, 0, 0) != 0;
      v8->_aodEnabled = v2;
      if (v8->super._logHandle)
      {
        logHandle = v8->super._logHandle;
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
        if (v8->_aodEnabled) {
          SEL v3 = "Enable";
        }
        else {
          SEL v3 = "Disable";
        }
        __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)v3);
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Boot arg override: %s AOD.", v9, 0xCu);
      }
    }
  }
}

- (id)copyPropertyForKey:(id)a3
{
  if ([a3 isEqualToString:@"AODDisplayNits"])
  {
    id v6 = objc_alloc(NSNumber);
    [(CBAODTransitionController *)self->_transitionController currentDisplayNits];
    return (id)objc_msgSend(v6, "initWithFloat:");
  }
  else if ([a3 isEqualToString:@"AODDisplayNitsCap"])
  {
    id v5 = objc_alloc(NSNumber);
    [+[CBAODState sharedInstance] nitsCap];
    return (id)objc_msgSend(v5, "initWithFloat:");
  }
  else if ([a3 isEqualToString:@"AODDisplayNitsOverride"])
  {
    id v4 = objc_alloc(NSNumber);
    [(CBAODTransitionController *)self->_transitionController nitsOverride];
    return (id)objc_msgSend(v4, "initWithFloat:");
  }
  else
  {
    return [(CBAODThresholdModule *)self->_thresholdModule copyPropertyForKey:a3];
  }
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return -[CBAODModule copyPropertyForKey:](self, "copyPropertyForKey:", a3, a4, a3, a2, self);
}

- (void)start
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  -[CBModule registerNotificationBlock:](self->_thresholdModule, "registerNotificationBlock:");
  -[CBModule registerNotificationBlock:](self->_transitionController, "registerNotificationBlock:");
  id v7 = [(CBAODModule *)self copyModulesPropertyForKey:@"DisplayOn"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v2 = [v7 BOOLValue];
    int64_t v3 = 3;
    if ((v2 & 1) == 0) {
      int64_t v3 = 0;
    }
    self->_currentDisplayMode = v3;
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
      __os_log_helper_16_2_1_8_66((uint64_t)v11, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:self->_currentDisplayMode]);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "display mode initialised to %{public}@ based on display brightness state", v11, 0xCu);
    }
  }
  else
  {
    self->_currentDisplayMode = 0;
    id v6 = self->super._logHandle;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v10, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:self->_currentDisplayMode]);
      _os_log_fault_impl(&dword_1BA438000, v6, OS_LOG_TYPE_FAULT, "display mode initialised to %{public}@ - display state invalid", v10, 0xCu);
    }
  }
}

uint64_t __20__CBAODModule_start__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2 && a3)
  {
    if (*(void *)(*(void *)(result + 32) + 16))
    {
      id v4 = *(NSObject **)(*(void *)(result + 32) + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      id v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, a2, a3);
      _os_log_debug_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEBUG, "Notification block key=%@, value=%@\n", v8, 0x16u);
    }
    return [*(id *)(v5 + 32) sendNotificationForKey:a2 andValue:a3];
  }
  return result;
}

uint64_t __20__CBAODModule_start__block_invoke_63(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2 && a3)
  {
    if (*(void *)(*(void *)(result + 32) + 16))
    {
      id v4 = *(NSObject **)(*(void *)(result + 32) + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      id v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, a2, a3);
      _os_log_debug_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEBUG, "Notification block key=%@, value=%@\n", v8, 0x16u);
    }
    return [*(id *)(v5 + 32) sendNotificationForKey:a2 andValue:a3];
  }
  return result;
}

- (void)stop
{
}

- (id)copyModulesPropertyForKey:(id)a3
{
  v22 = self;
  SEL v21 = a2;
  id v20 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  int v15 = 1375731712;
  int v16 = 48;
  uint64_t v17 = __Block_byref_object_copy__12;
  v18 = __Block_byref_object_dispose__12;
  uint64_t v19 = 0;
  modules = self->_modules;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __41__CBAODModule_copyModulesPropertyForKey___block_invoke;
  uint64_t v10 = &unk_1E6219A10;
  uint64_t v12 = &v13;
  id v11 = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](modules, "enumerateObjectsUsingBlock:");
  uint64_t v5 = (void *)v14[5];
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __41__CBAODModule_copyModulesPropertyForKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 conformsToProtocol:&unk_1F141A890])
  {
    uint64_t result = [a2 copyPropertyForKey:*(void *)(a1 + 32)];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      *a4 = 1;
    }
  }
  else
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
  }
  return result;
}

- (BOOL)setModulesProperty:(id)a3 forKey:(id)a4
{
  uint64_t v14 = self;
  SEL v13 = a2;
  id v12 = a3;
  id v11 = a4;
  uint64_t v6 = 0;
  int v7 = &v6;
  int v8 = 0x20000000;
  int v9 = 32;
  char v10 = 0;
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_modules, "enumerateObjectsUsingBlock:");
  char v5 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v5 & 1;
}

uint64_t __41__CBAODModule_setModulesProperty_forKey___block_invoke(void *a1, void *a2)
{
  if (([a2 conformsToProtocol:&unk_1F141A890] & 1) != 0
    || (uint64_t result = [a2 conformsToProtocol:&unk_1F141D7A8], (result & 1) != 0))
  {
    uint64_t result = [a2 setProperty:a1[4] forKey:a1[5]];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (*(unsigned char *)(*(void *)(a1[6] + 8) + 24) & 1 | result & 1) != 0;
  }
  return result;
}

- (void)addModule:(id)a3
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Adding module to AOD modules %@", v10, 0xCu);
  }
  [(NSMutableArray *)self->_modules addObject:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self->_transitionController)
    {
      id v7 = (id)[a3 copyPropertyForKey:@"TwilightModule"];
      [(CBAODTransitionController *)self->_transitionController setTwilight:v7];

      id v6 = (id)[a3 copyPropertyForKey:@"AmmoliteModule"];
      [(CBAODTransitionController *)self->_transitionController setAmmolite:v6];

      id v5 = (id)[a3 copyPropertyForKey:@"IndicatorModule"];
      [(CBAODTransitionController *)self->_transitionController setIndicator:v5];
    }
  }
}

- (BOOL)handleFlipBookStatePropertyHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  char v15 = 1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [a3 integerValue];
    if (self->_currentDisplayMode == 3
      || [+[CBAODState sharedInstance] AODState] == 4
      || [+[CBAODState sharedInstance] AODState] == 3
      || [+[CBAODState sharedInstance] AODState] == 2)
    {
      logHandle = self->super._logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_FAULT))
      {
        __os_log_helper_16_2_3_8_66_8_66_8_32((uint64_t)v21, (uint64_t)+[CBDisplayStateUtilities stringForFlipbookState:](CBDisplayStateUtilities, "stringForFlipbookState:", v14), (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", self->_currentDisplayMode), (uint64_t)[+[CBAODState sharedInstance] AODStateString]);
        _os_log_fault_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_FAULT, "[Flipbook state][FAULT] Unexpected flipbook state request (%{public}@) while in display mode [%{public}@] and AOD state [%s]", v21, 0x20u);
      }
    }
    if (self->super._logHandle)
    {
      id v12 = self->super._logHandle;
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
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v20, (uint64_t)+[CBDisplayStateUtilities stringForFlipbookState:v14]);
      _os_log_impl(&dword_1BA438000, v12, OS_LOG_TYPE_DEFAULT, "[Flipbook state] %{public}@", v20, 0xCu);
    }
    if (v14)
    {
      uint64_t v4 = v14;
      char v3 = 1;
    }
    else
    {
      uint64_t v4 = 0;
      char v3 = 0;
    }
    if (v3)
    {
      char v15 = 0;
      if (self->super._logHandle)
      {
        char v10 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v9 = init_default_corebrightness_log();
        }
        char v10 = v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v19, v14);
        _os_log_error_impl(&dword_1BA438000, v10, OS_LOG_TYPE_ERROR, "invalid flipbook state change request (%ld)", v19, 0xCu);
      }
    }
    else
    {
      switch(v4)
      {
        case 0:
          self->_flipBookEnabled = 1;
          [(CBAODTransitionController *)self->_transitionController cancelTransition];
          [(CBAODTransitionController *)self->_transitionController setLiveUpdates:0];
          self->_suspendFeatureUpdates = 1;
          break;
        case 1:
          self->_suspendFeatureUpdates = 0;
          [(CBAODModule *)self copyAndHandleEvent];
          break;
        case 2:
          self->_flipBookEnabled = 0;
          [(CBAODTransitionController *)self->_transitionController cancelTransition];
          [(CBAODTransitionController *)self->_transitionController setLiveUpdates:1];
          self->_suspendFeatureUpdates = 1;
          break;
        case 3:
          self->_suspendFeatureUpdates = 0;
          if ([(CBAODTransitionController *)self->_transitionController displayON]) {
            [(CBAODTransitionController *)self->_transitionController updateAllBrightnessFeaturesForced:1];
          }
          [(CBAODModule *)self copyAndHandleEvent];
          break;
        default:
          JUMPOUT(0);
      }
    }
  }
  else
  {
    char v15 = 0;
    if (self->super._logHandle)
    {
      int v8 = self->super._logHandle;
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
      uint64_t v5 = objc_opt_class();
      __os_log_helper_16_2_1_8_66((uint64_t)v18, v5);
      _os_log_error_impl(&dword_1BA438000, v8, OS_LOG_TYPE_ERROR, "invalid flipbook state change request data format (%{public}@)", v18, 0xCu);
    }
  }
  return v15 & 1;
}

- (BOOL)handleDisplayNitsOverridePropertyHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v12 = 0;
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
    __os_log_helper_16_2_1_8_64((uint64_t)v15, (uint64_t)a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "CBAODDisplayNitsOverride = %@", v15, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    transitionController = self->_transitionController;
    [a3 floatValue];
    -[CBAODTransitionController setNitsOverride:](transitionController, "setNitsOverride:");
    char v12 = [(CBAODModule *)self performUpdate:0.0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = (void *)[a3 objectForKey:@"AODDisplayNitsOverrideSubKey"];
      char v10 = (void *)[a3 objectForKey:@"AODDisplayNitsOverrideFadePeriodSubKey"];
      if (v11)
      {
        uint64_t v5 = self->_transitionController;
        [v11 floatValue];
        -[CBAODTransitionController setNitsOverride:](v5, "setNitsOverride:");
        HIDWORD(v3) = 0;
        int v9 = 0;
        if (v10)
        {
          [v10 floatValue];
          int v9 = LODWORD(v3);
        }
        LODWORD(v3) = v9;
        char v12 = [(CBAODModule *)self performUpdate:v3];
      }
    }
  }
  return v12 & 1;
}

- (BOOL)handleAABSensorOverridePropertyHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v11 = 0;
  float v10 = -1.0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 floatValue];
    float v10 = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = (void *)[a3 objectForKey:@"AABSensorOverrideValue"];
      int v8 = (void *)[a3 objectForKey:@"AABSensorOverrideOrientation"];
      if (v9)
      {
        [v9 floatValue];
        float v10 = v4;
      }
      if (v8) {
        int v11 = [v8 intValue];
      }
    }
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_2_8_0_4_0((uint64_t)v14, COERCE__INT64(v10), v11);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "override ALS samples with value = %f, with orientation = %d", v14, 0x12u);
  }
  if (self->_aabSensorOverrideFilter)
  {

    self->_aabSensorOverrideFilter = 0;
  }
  if (v10 >= 0.0) {
    self->_aabSensorOverrideFilter = [[CBSensorOverrideFilter alloc] initWithData:a3];
  }
  return 1;
}

- (void)handleSystemDidWakeFromSleepPropertyHandler:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  os_log_type_t v38 = self;
  v37[2] = (size_t)a2;
  v37[1] = (size_t)a3;
  strcpy(__s2, "aop_threshold_als");
  v37[0] = 128;
  if (!sysctlbyname("kern.wakereason", __s1, v37, 0, 0))
  {
    os_log_t v35 = 0;
    if (v38->super._logHandle)
    {
      os_log_t logHandle = (os_log_t)v38->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t logHandle = inited;
    }
    os_log_t v35 = logHandle;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = v35;
      *(_DWORD *)id v20 = type;
      buf = v40;
      __os_log_helper_16_2_1_8_32((uint64_t)v40, (uint64_t)__s1);
      _os_log_impl(&dword_1BA438000, v35, type, "AP Wake. Reason: %s", v40, 0xCu);
    }
    if (strstr(__s1, __s2))
    {
      os_log_t oslog = 0;
      if (v38->super._logHandle)
      {
        os_log_t v18 = (os_log_t)v38->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v17 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v17 = init_default_corebrightness_log();
        }
        os_log_t v18 = v17;
      }
      os_log_t oslog = v18;
      os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t v14 = oslog;
        *(_DWORD *)uint64_t v15 = v32;
        currentALSEvent = v38->_currentALSEvent;
        if (currentALSEvent) {
          [(CBALSEvent *)currentALSEvent vendorData];
        }
        else {
          memset(__b, 0, sizeof(__b));
        }
        SEL v13 = v39;
        __os_log_helper_16_0_1_8_0((uint64_t)v39, COERCE__INT64(*(float *)&__b[20]));
        _os_log_impl(&dword_1BA438000, v14, v15[0], "Wake reason aop_threshold_als: lux value = %f", v39, 0xCu);
      }
      id v30 = [(CBAODModule *)v38 copyModulesPropertyForKey:@"CBAmbientLightTelemetry"];
      id v29 = (id)[[NSString alloc] initWithUTF8String:__s1];
      id v28 = 0;
      id v11 = objc_alloc(NSNumber);
      char v12 = v38->_currentALSEvent;
      if (v12) {
        [(CBALSEvent *)v12 vendorData];
      }
      else {
        memset(v27, 0, sizeof(v27));
      }
      LODWORD(v3) = *(_DWORD *)&v27[20];
      id v28 = (id)[v11 initWithFloat:v3];
      id v26 = 0;
      unint64_t v7 = 0x1E4F28000uLL;
      id v6 = objc_alloc(NSNumber);
      int v8 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
      [(CBAODThresholdModule *)v38->_thresholdModule dimLuxThreshold];
      id v26 = (id)objc_msgSend(v6, "initWithFloat:");
      id v25 = 0;
      id v9 = objc_alloc(*(Class *)(v7 + 3792));
      [*(id *)((char *)&v38->super.super.isa + v8[397]) brightenLuxThreshold];
      id v25 = (id)objc_msgSend(v9, "initWithFloat:");
      id v24 = 0;
      id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
      float v10 = &v5;
      id v24 = (id)objc_msgSend(v4, "initWithObjectsAndKeys:", v29, @"WakeReason", v28, @"Lux", v26, @"DimThreshold", v25, @"BrightenThreshold", 0);
      if (v30) {
        [v24 setObject:v30 forKey:@"ALSSamplesBeforeWake"];
      }
      [(CBAODModule *)v38 sendNotificationForKey:@"AODWakeFromALSThreshold" andValue:v24];
    }
  }
  if ([+[CBAODState sharedInstance] AODState]) {
    [(CBAODModule *)v38 copyAndHandleEvent];
  }
}

- (BOOL)performUpdate
{
  LODWORD(v2) = -1.0;
  return -[CBAODModule performUpdate:](self, "performUpdate:", v2, a2, self);
}

- (BOOL)performUpdate:(float)a3
{
  return [(CBAODModule *)self performUpdate:0 forceUpdate:*(double *)&a3];
}

- (BOOL)performUpdate:(float)a3 forceUpdate:(BOOL)a4
{
  int v8 = self;
  SEL v7 = a2;
  float v6 = a3;
  BOOL v5 = a4;
  return -[CBAODModule performUpdate:forceUpdate:rampDoneCallback:rampCanceledCallback:](self, "performUpdate:forceUpdate:rampDoneCallback:rampCanceledCallback:", a4, *(double *)&a3, MEMORY[0x1E4F143A8], 3221225472, __41__CBAODModule_performUpdate_forceUpdate___block_invoke, &unk_1E6218FE0, self);
}

uint64_t __41__CBAODModule_performUpdate_forceUpdate___block_invoke(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v9 = a1;
  int v8 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    BOOL v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    BOOL v5 = inited;
  }
  int v8 = v5;
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v8;
    os_log_type_t type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_1BA438000, log, type, "Transition in AOD done", v6, 2u);
  }
  return [+[CBAODState sharedInstance] releasePowerAssertion];
}

- (BOOL)performUpdate:(float)a3 forceUpdate:(BOOL)a4 rampDoneCallback:(id)a5 rampCanceledCallback:(id)a6
{
  os_log_t v14 = self;
  SEL v13 = a2;
  float v12 = a3;
  BOOL v11 = a4;
  id v10 = a5;
  id v9 = a6;
  memset(__b, 0, sizeof(__b));
  LOBYTE(__b[0]) = v11;
  HIBYTE(__b[0]) = v12 >= 0.0;
  *(float *)&__b[1] = v12;
  memcpy(__dst, __b, sizeof(__dst));
  return [(CBAODModule *)v14 performUpdateWithTransitionParameters:__dst rampDoneCallback:v10 rampCanceledCallback:v9];
}

- (BOOL)performUpdateWithTransitionParameters:(id *)a3
{
  uint8_t v6[7] = self;
  v6[6] = a2;
  v6[5] = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__CBAODModule_performUpdateWithTransitionParameters___block_invoke;
  v6[3] = &unk_1E6218FE0;
  v6[4] = self;
  memcpy(__dst, a3, sizeof(__dst));
  return [(CBAODModule *)self performUpdateWithTransitionParameters:__dst rampDoneCallback:v6 rampCanceledCallback:0];
}

uint64_t __53__CBAODModule_performUpdateWithTransitionParameters___block_invoke(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v9 = a1;
  int v8 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    BOOL v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    BOOL v5 = inited;
  }
  int v8 = v5;
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v8;
    os_log_type_t type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_1BA438000, log, type, "Transition in AOD done", v6, 2u);
  }
  return [+[CBAODState sharedInstance] releasePowerAssertion];
}

- (BOOL)performUpdateWithTransitionParameters:(id *)a3 rampDoneCallback:(id)a4 rampCanceledCallback:(id)a5
{
  SEL v21 = self;
  SEL v20 = a2;
  uint64_t v19 = a3;
  id v18 = a4;
  id v17 = a5;
  char v16 = 1;
  queue = self->super._queue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  uint64_t v10 = __91__CBAODModule_performUpdateWithTransitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke;
  BOOL v11 = &unk_1E6219B30;
  float v12 = self;
  memcpy(v15, a3, sizeof(v15));
  id v13 = v18;
  id v14 = v17;
  dispatch_async(queue, &v7);
  return v16 & 1;
}

void __91__CBAODModule_performUpdateWithTransitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = a1;
  uint64_t v27 = a1;
  if ([+[CBAODState sharedInstance] AODState] == 1
    && (*(unsigned char *)(*(void *)(a1 + 32) + 136) & 1) == 0
    || (*(unsigned char *)(a1 + 56) & 1) != 0)
  {
    id v26 = 0;
    id v26 = (id)[*(id *)(a1 + 32) copyModulesInfo:0];
    os_log_t v25 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 16))
    {
      uint64_t v15 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      uint64_t v15 = inited;
    }
    os_log_t v25 = v15;
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v26);
      _os_log_impl(&dword_1BA438000, v25, v24, "CB features update for Collected modules info \n %@", v30, 0xCu);
    }
    char v23 = 0;
    BOOL v11 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    memcpy(__dst, (const void *)(a1 + 56), 0x30uLL);
    char v23 = [v11 startTransition:v26 transitionParameters:__dst rampDoneCallback:v12 rampCanceledCallback:v13] & 1;
    if (v23)
    {
      uint64_t v19 = 0;
      if (*(void *)(*(void *)(a1 + 32) + 16))
      {
        float v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v5 = init_default_corebrightness_log();
        }
        float v6 = v5;
      }
      uint64_t v19 = v6;
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        double v3 = v19;
        os_log_type_t v4 = v18;
        __os_log_helper_16_0_0(v17);
        _os_log_impl(&dword_1BA438000, v3, v4, "This change doesn't trigger transition.", v17, 2u);
      }
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 48) remainingTransitionLength];
      if (v1 <= 0.0)
      {
        if (*(void *)(a1 + 40)) {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
      }
      else
      {
        os_log_t v21 = 0;
        if (*(void *)(*(void *)(a1 + 32) + 16))
        {
          uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 16);
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
        os_log_t v21 = v10;
        os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          [*(id *)(*(void *)(a1 + 32) + 48) remainingTransitionLength];
          __os_log_helper_16_0_1_8_0((uint64_t)v29, COERCE__INT64(v2));
          _os_log_impl(&dword_1BA438000, v21, v20, "Detected unfinished transition -> force to ramp to the target in remaining time = %f.", v29, 0xCu);
        }
        uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 48);
        id v8 = v26;
        [v7 remainingTransitionLength];
        objc_msgSend(v7, "startTransition:length:forceUpdate:rampDoneCallback:rampCanceledCallback:", v8, 1, *(void *)(a1 + 40), *(void *)(a1 + 48));
      }
    }
  }
}

- (BOOL)handleDisplayModeUpdate:(id)a3
{
  BOOL v9 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = (void *)[a3 objectForKey:@"Value"];
    uint64_t v7 = (void *)[a3 objectForKey:@"TransitionLength"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (int)[v8 intValue];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 floatValue];
        float v5 = *(float *)&v3;
      }
      else
      {
        float v5 = -1.0;
      }
      *(float *)&double v3 = v5;
      return [(CBAODModule *)self handleDisplayModeUpdate:v6 transitionLength:v3];
    }
  }
  return v9;
}

- (BOOL)handleDisplayModeUpdate:(int64_t)a3 transitionLength:(float)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v62 = self;
  SEL v61 = a2;
  int64_t v60 = a3;
  float v59 = a4;
  char v58 = 0;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  if (v62->_aodEnabled)
  {
    memset(__b, 0, sizeof(__b));
    LOBYTE(__b[0]) = 1;
    HIBYTE(__b[0]) = 1;
    *(float *)&__b[1] = v59;
    os_log_t v56 = 0;
    if (v62->super._logHandle)
    {
      os_log_t logHandle = v62->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t logHandle = inited;
    }
    os_log_t v56 = logHandle;
    os_log_type_t v55 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_3_8_66_8_66_8_0((uint64_t)v65, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:](CBDisplayStateUtilities, "stringForDisplayMode:", v62->_currentDisplayMode), (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:v60], COERCE__INT64(v59));
      _os_log_impl(&dword_1BA438000, v56, v55, "[Display Mode] %{public}@ -> %{public}@ in %f seconds", v65, 0x20u);
    }
    [(CBAODTransitionController *)v62->_transitionController cancelTransition];
    [(CBAODModule *)v62 releaseDisplayModeCompletionTimer];
    if (v60)
    {
      int64_t v6 = v60;
      char v5 = 1;
    }
    else
    {
      int64_t v6 = 0;
      char v5 = 0;
    }
    if (v5)
    {
      id v26 = v62->super._logHandle;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        __os_log_helper_16_2_2_8_66_4_0((uint64_t)v63, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:v62->_currentDisplayMode], v60);
        _os_log_fault_impl(&dword_1BA438000, v26, OS_LOG_TYPE_FAULT, "[Display Mode] Transition to unknown display mode: %{public}@ -> display mode %d", v63, 0x12u);
      }
      char v58 = 0;
    }
    else
    {
      switch(v6)
      {
        case 0:
          if (v62->_currentDisplayMode != 1 && v62->_currentDisplayMode != 2) {
            goto LABEL_41;
          }
          memcpy(v35, __b, sizeof(v35));
          -[CBAODModule updateAODState:transitionParameters:brightnessFactor:forDisplayMode:](v62, "updateAODState:transitionParameters:brightnessFactor:forDisplayMode:", 0, v35, 0.0);
          char v58 = 1;
          break;
        case 1:
          [(CBAODTransitionController *)v62->_transitionController setDisplayON:1];
          if (v62->_currentDisplayMode == 3)
          {
            memcpy(v52, __b, sizeof(v52));
            LODWORD(v10) = -1.0;
            -[CBAODModule updateAODState:transitionParameters:brightnessFactor:forDisplayMode:](v62, "updateAODState:transitionParameters:brightnessFactor:forDisplayMode:", 1, v52, v10);
            char v58 = 1;
          }
          else if (v62->_currentDisplayMode)
          {
            if (v62->_currentDisplayMode == 4)
            {
              memcpy(v50, __b, sizeof(v50));
              LODWORD(v12) = 1.0;
              -[CBAODModule updateAODState:transitionParameters:brightnessFactor:forDisplayMode:](v62, "updateAODState:transitionParameters:brightnessFactor:forDisplayMode:", 1, v50, v12);
              char v58 = 1;
            }
            else if (v62->_currentDisplayMode == 2)
            {
              if (!v62->_flipBookEnabled) {
                BYTE2(__b[0]) = 1;
              }
              LODWORD(v9) = 1.0;
              -[CBAODModule setDisplayFactor:transitionLength:](v62, "setDisplayFactor:transitionLength:", v9);
              LOBYTE(__b[4]) = 1;
              __b[5] = 0;
              memcpy(v49, __b, sizeof(v49));
              [(CBAODModule *)v62 copyAndHandleEventWithTransitionParameters:v49];
              double v13 = v59 + 0.05;
              *(float *)&double v13 = v13;
              [(CBAODModule *)v62 scheduleDisplayModeCompletionTimerIn:1 forDisplayMode:v13];
              char v58 = 1;
            }
          }
          else
          {
            if (!v62->_flipBookEnabled) {
              BYTE2(__b[0]) = 1;
            }
            LOBYTE(__b[4]) = 1;
            __b[5] = 0;
            memcpy(v51, __b, sizeof(v51));
            LODWORD(v11) = 1.0;
            -[CBAODModule updateAODState:transitionParameters:brightnessFactor:forDisplayMode:](v62, "updateAODState:transitionParameters:brightnessFactor:forDisplayMode:", 1, v51, v11);
            char v58 = 1;
          }
          break;
        case 2:
          if (v62->_currentDisplayMode == 3 || v62->_currentDisplayMode == 4 || !v62->_currentDisplayMode)
          {
            memcpy(v48, __b, sizeof(v48));
            [(CBAODModule *)v62 updateAODState:5 transitionParameters:v48 brightnessFactor:2 forDisplayMode:0.0];
            char v58 = 1;
          }
          else if (v62->_currentDisplayMode == 1)
          {
            LODWORD(v4) = 0;
            -[CBAODModule setDisplayFactor:transitionLength:](v62, "setDisplayFactor:transitionLength:", v4);
            *(float *)&double v14 = v59;
            uint64_t v42 = MEMORY[0x1E4F143A8];
            int v43 = -1073741824;
            int v44 = 0;
            os_log_t v45 = __56__CBAODModule_handleDisplayModeUpdate_transitionLength___block_invoke;
            v46 = &unk_1E6218FE0;
            v47 = v62;
            uint64_t v36 = MEMORY[0x1E4F143A8];
            int v37 = -1073741824;
            int v38 = 0;
            os_log_t v39 = __56__CBAODModule_handleDisplayModeUpdate_transitionLength___block_invoke_188;
            os_log_type_t v40 = &unk_1E6218FE0;
            os_log_t v41 = v62;
            -[CBAODModule performUpdate:forceUpdate:rampDoneCallback:rampCanceledCallback:](v62, "performUpdate:forceUpdate:rampDoneCallback:rampCanceledCallback:", 1, v14);
            double v15 = v59 + 0.05;
            *(float *)&double v15 = v15;
            [(CBAODModule *)v62 scheduleDisplayModeCompletionTimerIn:2 forDisplayMode:v15];
            char v58 = 1;
          }
          else
          {
LABEL_41:
            [(CBAODTransitionController *)v62->_transitionController setDisplayON:0];
          }
          break;
        case 3:
          [(CBAODTransitionController *)v62->_transitionController setDisplayON:1];
          if (v62->_currentDisplayMode == 2)
          {
            if (!v62->_flipBookEnabled) {
              BYTE2(__b[0]) = 1;
            }
            LOBYTE(__b[4]) = 1;
            __b[5] = 0;
            memcpy(__dst, __b, 0x30uLL);
            LODWORD(v7) = 1.0;
            [(CBAODModule *)v62 updateAODState:0 transitionParameters:__dst brightnessFactor:3 forDisplayMode:v7];
            char v58 = 1;
          }
          else if (v62->_currentDisplayMode == 1)
          {
            memcpy(v53, __b, sizeof(v53));
            LODWORD(v8) = -1.0;
            [(CBAODModule *)v62 updateAODState:0 transitionParameters:v53 brightnessFactor:3 forDisplayMode:v8];
            char v58 = 1;
          }
          break;
        case 4:
          [(CBAODTransitionController *)v62->_transitionController setDisplayON:1];
          if (v62->_currentDisplayMode == 1 || v62->_currentDisplayMode == 2)
          {
            memcpy(v34, __b, sizeof(v34));
            LODWORD(v16) = 1028443341;
            [(CBAODModule *)v62 updateAODState:0 transitionParameters:v34 brightnessFactor:4 forDisplayMode:v16];
            int64_t currentDisplayMode = v62->_currentDisplayMode;
            if (currentDisplayMode == 1)
            {
              os_log_t oslog = 0;
              os_log_t oslog = (os_log_t)v62->super._logHandle;
              os_log_type_t v32 = OS_LOG_TYPE_FAULT;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
              {
                os_log_type_t v20 = oslog;
                os_log_type_t v21 = v32;
                __os_log_helper_16_0_0(v31);
                _os_log_fault_impl(&dword_1BA438000, v20, v21, "[Display Mode] Unexpected display mode transition: Always On -> Active Dimmed", v31, 2u);
              }
            }
            else if (currentDisplayMode == 2)
            {
              os_log_t v30 = 0;
              os_log_t v30 = (os_log_t)v62->super._logHandle;
              os_log_type_t v29 = OS_LOG_TYPE_FAULT;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
              {
                os_log_type_t v18 = v30;
                os_log_type_t v19 = v29;
                __os_log_helper_16_0_0(v28);
                _os_log_fault_impl(&dword_1BA438000, v18, v19, "[Display Mode] Unexpected display mode transition: Always On Suppressed -> Active Dimmed", v28, 2u);
              }
            }
            else
            {
              uint64_t v27 = v62->super._logHandle;
              if (os_log_type_enabled((os_log_t)v62->super._logHandle, OS_LOG_TYPE_FAULT))
              {
                __os_log_helper_16_2_1_8_66((uint64_t)v64, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:v62->_currentDisplayMode]);
                _os_log_fault_impl(&dword_1BA438000, v27, OS_LOG_TYPE_FAULT, "[Display Mode] Unexpected display mode transition: %{public}@ -> Active Dimmed", v64, 0xCu);
              }
            }
            char v58 = 1;
          }
          break;
        default:
          JUMPOUT(0);
      }
    }
  }
  v62->_int64_t currentDisplayMode = v60;
  return v58 & 1;
}

uint64_t __56__CBAODModule_handleDisplayModeUpdate_transitionLength___block_invoke(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  double v9 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    char v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    char v5 = inited;
  }
  double v9 = v5;
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v9;
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1BA438000, log, type, "Transition in AOD done", v7, 2u);
  }
  [*(id *)(*(void *)(a1 + 32) + 48) setDisplayON:0];
  return [+[CBAODState sharedInstance] releasePowerAssertion];
}

uint64_t __56__CBAODModule_handleDisplayModeUpdate_transitionLength___block_invoke_188(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  double v9 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    char v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    char v5 = inited;
  }
  double v9 = v5;
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v9;
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1BA438000, log, type, "Transition in AOD canceled", v7, 2u);
  }
  [*(id *)(*(void *)(a1 + 32) + 48) setDisplayON:0];
  return [+[CBAODState sharedInstance] releasePowerAssertion];
}

- (BOOL)setDisplayFactor:(float)a3 transitionLength:(float)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_log_type_t v19 = self;
  SEL v18 = a2;
  float v17 = a3;
  float v16 = a4;
  char v15 = 0;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  os_log_t v14 = 0;
  if (v19->super._logHandle)
  {
    os_log_t logHandle = v19->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_t logHandle = inited;
  }
  os_log_t v14 = logHandle;
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v20, COERCE__INT64(v17), COERCE__INT64(v16));
    _os_log_impl(&dword_1BA438000, v14, v13, "Set brightness factor = %f fade = %f", v20, 0x16u);
  }
  *(float *)&double v4 = v16;
  -[CBAODModule setModulesProperty:forKey:](v19, "setModulesProperty:forKey:", [NSNumber numberWithFloat:v4], @"DisplayBrightnessFadePeriod");
  *(float *)&double v5 = v17;
  char v15 = -[CBAODModule setModulesProperty:forKey:](v19, "setModulesProperty:forKey:", [NSNumber numberWithFloat:v5], @"DisplayBrightnessFactorWithFade");
  *(float *)&double v6 = v17;
  if (v17 >= 1.0)
  {
    memset(__b, 0, sizeof(__b));
    __b[1] = 1;
    memcpy(__dst, __b, sizeof(__dst));
    [(CBAODModule *)v19 copyAndHandleEventWithTransitionParameters:__dst];
  }
  [(CBAODModule *)v19 setModulesProperty:&unk_1F1417D20, @"ForceModuleUpdate", v6 forKey];
  return v15 & 1;
}

- (BOOL)updateAODState:(unint64_t)a3 transitionParameters:(id *)a4 brightnessFactor:(float)a5 forDisplayMode:(int64_t)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  os_log_t v33 = self;
  SEL v32 = a2;
  unint64_t v31 = a3;
  os_log_t v30 = a4;
  float v29 = a5;
  int64_t v28 = a6;
  char v27 = 0;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  if (v33->_aodEnabled)
  {
    if ([+[CBAODState sharedInstance] AODStateExternal] != v31)
    {
      [+[CBAODState sharedInstance] setAODStateExternal:v31];
      os_log_t v26 = 0;
      if (v33->super._logHandle)
      {
        os_log_t logHandle = v33->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        os_log_t logHandle = inited;
      }
      os_log_t v26 = logHandle;
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        if (v31) {
          double v6 = "Entering AOD";
        }
        else {
          double v6 = "Exiting AOD";
        }
        __os_log_helper_16_2_4_8_0_8_32_8_0_8_0((uint64_t)v34, v31, (uint64_t)v6, COERCE__INT64(a4->var4), COERCE__INT64(v29));
        _os_log_impl(&dword_1BA438000, v26, v25, "AOD State update (%lu), %s, transitionTime: %f, factor = %f", v34, 0x2Au);
      }
      if ([+[CBAODState sharedInstance] AODStateExternal] == 1)
      {
        [(CBAODModule *)v33 prepareForEnterToAODRoutine];
        if (v29 >= 0.0)
        {
          *(float *)&double v7 = v29;
          [(CBAODModule *)v33 setDisplayFactor:v7 transitionLength:0.0];
        }
        memcpy(__dst, a4, 0x30uLL);
        [(CBAODModule *)v33 enteringAODRoutineForDisplayMode:v28 transitionParameters:__dst];
      }
      else if ([+[CBAODState sharedInstance] AODStateExternal])
      {
        if ([+[CBAODState sharedInstance] AODStateExternal] == 5)
        {
          [(CBAODModule *)v33 prepareForEnterToAODRoutine];
          if (v29 >= 0.0)
          {
            *(float *)&double v9 = v29;
            [(CBAODModule *)v33 setDisplayFactor:v9 transitionLength:0.0];
          }
          memcpy(v22, a4, sizeof(v22));
          [(CBAODModule *)v33 enteringSuppressedAODRoutineWithTransitionParameters:v22];
        }
      }
      else
      {
        if (v29 >= 0.0)
        {
          *(float *)&double v8 = v29;
          [(CBAODModule *)v33 setDisplayFactor:v8 transitionLength:0.0];
        }
        memcpy(v23, a4, sizeof(v23));
        [(CBAODModule *)v33 exitingAODRoutineForDisplayMode:v28 transitionParameters:v23];
      }
      char v27 = 1;
    }
  }
  else
  {
    os_log_t oslog = 0;
    if (v33->super._logHandle)
    {
      os_log_t v14 = v33->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v13 = init_default_corebrightness_log();
      }
      os_log_t v14 = v13;
    }
    os_log_t oslog = v14;
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = oslog;
      os_log_type_t v12 = v20;
      __os_log_helper_16_0_0(v19);
      _os_log_error_impl(&dword_1BA438000, v11, v12, "CB AOD support is disabled.", v19, 2u);
    }
  }
  return v27 & 1;
}

- (void)prepareForEnterToAODRoutine
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int64_t v28 = self;
  SEL v27 = a2;
  uint64_t v21 = (void *)MEMORY[0x1BA9ECAE0]();
  os_log_t v26 = 0;
  if (v28->super._logHandle)
  {
    os_log_t logHandle = v28->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_t logHandle = inited;
  }
  os_log_t v26 = logHandle;
  os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v26;
    os_log_type_t type = v25;
    __os_log_helper_16_0_0(v24);
    _os_log_impl(&dword_1BA438000, log, type, "[AOD routine]: prepare to enter AOD", v24, 2u);
  }
  [+[CBAODState sharedInstance] acquirePowerAssertion];
  [(CBAODModule *)v28 setALSServiceProperty:*MEMORY[0x1E4F1CFD0] forKey:@"AODALSMode"];
  [(CBAODModule *)v28 loadAODCurveFromDefaults];
  [(CBAODModule *)v28 updateModulesAODState:2];
  [(CBAODModule *)v28 setModulesProperty:&unk_1F1417D38 forKey:@"DisplayBrightnessFadePeriodOverride"];
  id v23 = [(CBAODModule *)v28 copyModulesInfo:1];
  if (v28->super._logHandle)
  {
    float v16 = v28->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v15 = init_default_corebrightness_log();
    }
    float v16 = v15;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v32, (uint64_t)v23);
    _os_log_impl(&dword_1BA438000, v16, OS_LOG_TYPE_DEFAULT, "Current modules info: \n %@", v32, 0xCu);
  }
  uint64_t v2 = [(CBAODModule *)v28 getIntegerValueFrom:v23 key:@"AutoBrightnessLuxFilter"];
  v28->_ABLuxFilterBackup = v2;
  if (v28->super._logHandle)
  {
    os_log_t v14 = v28->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v13 = init_default_corebrightness_log();
    }
    os_log_t v14 = v13;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v31, v28->_ABLuxFilterBackup);
    _os_log_impl(&dword_1BA438000, v14, OS_LOG_TYPE_DEFAULT, "ALS lux filter backup %ld", v31, 0xCu);
  }
  [(CBAODModule *)v28 getFloatValueFrom:v23 key:@"PendingDisplayNits"];
  v28->_displayBrightnessBackup = v3;
  if (v28->super._logHandle)
  {
    os_log_type_t v12 = v28->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v11 = init_default_corebrightness_log();
    }
    os_log_type_t v12 = v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v30, COERCE__INT64(v28->_displayBrightnessBackup));
    _os_log_impl(&dword_1BA438000, v12, OS_LOG_TYPE_DEFAULT, "Display brightness backup %f Nits", v30, 0xCu);
  }
  [(CBAODModule *)v28 setModulesProperty:MEMORY[0x1E4F1CC28] forKey:@"CEEnable"];
  [v23 objectForKey:@"DisplayBrightnessAuto"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v4 = objc_msgSend((id)objc_msgSend(v23, "objectForKey:", @"DisplayBrightnessAuto"), "BOOLValue");
    v28->_ABStateBackup = v4 & 1;
    if (!v28->_ABStateBackup)
    {
      [(CBAODModule *)v28 getFloatValueFrom:v23 key:@"PendingDisplayNits"];
      float v22 = v5;
      if (v28->super._logHandle)
      {
        uint64_t v10 = v28->super._logHandle;
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
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v29, COERCE__INT64(v22));
        _os_log_impl(&dword_1BA438000, v10, OS_LOG_TYPE_DEFAULT, "AB is off -> backup AB state and set Nits cap to %f", v29, 0xCu);
      }
      double v6 = +[CBAODState sharedInstance];
      *(float *)&double v7 = v22;
      [(CBAODState *)v6 setNitsCap:v7];
    }
  }
  if (v28->_backupState)
  {

    v28->_backupState = 0;
  }
  double v8 = (NSDictionary *)v23;
  v28->_backupState = v8;
  -[CBAODState setProperty:forKey:](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "setProperty:forKey:", objc_msgSend(v23, "objectForKey:"), @"AOTCurve");
  [(CBAODTransitionController *)v28->_transitionController setInitialState:v23];
}

- (void)enteringAODRoutineForDisplayMode:(int64_t)a3 transitionParameters:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v52 = self;
  SEL v51 = a2;
  int64_t v50 = a3;
  id v49 = a4;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  char v48 = 0;
  if (v52->super._logHandle)
  {
    os_log_t logHandle = v52->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_t logHandle = inited;
  }
  char v48 = logHandle;
  os_log_type_t v47 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v48;
    os_log_type_t type = v47;
    __os_log_helper_16_0_0(v46);
    _os_log_impl(&dword_1BA438000, log, type, "[AOD routine]: entering AOD", v46, 2u);
  }
  [(CBAODModule *)v52 setModulesProperty:&unk_1F1417D38 forKey:@"DynamicSliderEnable"];
  id v45 = 0;
  id v45 = [(CBAODTransitionController *)v52->_transitionController copyContext];
  memcpy(__dst, a4, sizeof(__dst));
  [(CBAODModule *)v52 updateModulesAODState:3 transitionParameters:__dst context:v45];

  if (!v52->_ABStateBackup)
  {
    int v43 = 0;
    if (v52->super._logHandle)
    {
      float v17 = v52->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v16 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v16 = init_default_corebrightness_log();
      }
      float v17 = v16;
    }
    int v43 = v17;
    os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v14 = v43;
      os_log_type_t v15 = v42;
      __os_log_helper_16_0_0(v41);
      _os_log_impl(&dword_1BA438000, v14, v15, "Override AB to ON in AOD.", v41, 2u);
    }
    [(CBAODModule *)v52 setModulesProperty:MEMORY[0x1E4F1CC38] forKey:@"DisplayBrightnessAuto"];
  }
  [(CBAODModule *)v52 setModulesProperty:&unk_1F1417D20 forKey:@"ForceModuleUpdate"];
  id v40 = -[CBAODModule copyModulesPropertyForKey:](v52, "copyModulesPropertyForKey:");
  [+[CBAODState sharedInstance] setProperty:v40 forKey:@"AODDarkerCurve"];

  id v39 = [(CBAODModule *)v52 copyModulesInfo:0];
  os_log_t v38 = 0;
  if (v52->super._logHandle)
  {
    uint64_t v13 = v52->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v12 = init_default_corebrightness_log();
    }
    uint64_t v13 = v12;
  }
  os_log_t v38 = v13;
  os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v53, (uint64_t)v39);
    _os_log_impl(&dword_1BA438000, v38, v37, "ENTERING AOD - Target modules info: \n %@", v53, 0xCu);
  }
  [v39 objectForKey:@"TrustedLux"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = v52;
    objc_msgSend((id)objc_msgSend(v39, "objectForKey:", @"TrustedLux"), "floatValue");
    -[CBAODModule reevaluatePThresholdsForLux:](v11, "reevaluatePThresholdsForLux:");
  }
  [(CBAODModule *)v52 setModulesProperty:&unk_1F1417D38 forKey:@"Aggressivity"];
  uint64_t v9 = v52;
  double v8 = NSNumber;
  [+[CBAODState sharedInstance] thresholdPCCLuxDelta];
  -[CBAODModule setModulesProperty:forKey:](v9, "setModulesProperty:forKey:", objc_msgSend(v8, "numberWithFloat:"), @"AAPLuxDelta");
  char v36 = 0;
  transitionController = v52->_transitionController;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __69__CBAODModule_enteringAODRoutineForDisplayMode_transitionParameters___block_invoke;
  v35[3] = &unk_1E6219538;
  v35[4] = v52;
  v35[5] = v50;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  int v29 = -1073741824;
  int v30 = 0;
  unint64_t v31 = __69__CBAODModule_enteringAODRoutineForDisplayMode_transitionParameters___block_invoke_239;
  SEL v32 = &unk_1E6219538;
  uint64_t v33 = v52;
  int64_t v34 = v50;
  memcpy(v27, a4, sizeof(v27));
  char v36 = [(CBAODTransitionController *)transitionController startTransition:v39 transitionParameters:v27 rampDoneCallback:v35 rampCanceledCallback:&v28];
  if (!v36)
  {
    os_log_t oslog = 0;
    if (v52->super._logHandle)
    {
      double v7 = v52->super._logHandle;
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
    os_log_t oslog = v7;
    os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      char v4 = oslog;
      os_log_type_t v5 = v25;
      __os_log_helper_16_0_0(v24);
      _os_log_impl(&dword_1BA438000, v4, v5, "This change doesn't trigger transition -> start AOD ON routine", v24, 2u);
    }
    -[CBAODModule onAODRoutineForDisplayMode:](v52, "onAODRoutineForDisplayMode:", v50, v4);
  }
}

uint64_t __69__CBAODModule_enteringAODRoutineForDisplayMode_transitionParameters___block_invoke(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  uint64_t v9 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    os_log_type_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_type_t v5 = inited;
  }
  uint64_t v9 = v5;
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v9;
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1BA438000, log, type, "AOD enter transition is done -> start AOD ON routine", v7, 2u);
  }
  return [*(id *)(a1 + 32) onAODRoutineForDisplayMode:*(void *)(a1 + 40)];
}

uint64_t __69__CBAODModule_enteringAODRoutineForDisplayMode_transitionParameters___block_invoke_239(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  uint64_t v9 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    os_log_type_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_type_t v5 = inited;
  }
  uint64_t v9 = v5;
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v9;
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1BA438000, log, type, "AOD enter transition was canceled -> start AOD ON routine", v7, 2u);
  }
  return [*(id *)(a1 + 32) onAODRoutineForDisplayMode:*(void *)(a1 + 40)];
}

- (void)onAODRoutineForDisplayMode:(int64_t)a3
{
  uint64_t v13 = self;
  SEL v12 = a2;
  int64_t v11 = a3;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v10 = 0;
  if (v13->super._logHandle)
  {
    os_log_t logHandle = v13->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_t logHandle = inited;
  }
  uint64_t v10 = logHandle;
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v10;
    os_log_type_t type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_impl(&dword_1BA438000, log, type, "[AOD routine]: AOD is ON", v8, 2u);
  }
  [(CBAODModule *)v13 setModulesProperty:&unk_1F1417D38 forKey:@"AutoBrightnessLuxFilter"];
  [(CBAODModule *)v13 updateModulesAODState:1];
  [(CBAODModule *)v13 didCompleteTransitionToDisplayMode:v11];
  [(CBAODModule *)v13 copyAndHandleEvent];
  [+[CBAODState sharedInstance] releasePowerAssertion];
}

- (void)enteringSuppressedAODRoutineWithTransitionParameters:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  os_log_type_t v47 = self;
  SEL v46 = a2;
  id v45 = a3;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  int v44 = 0;
  if (v47->super._logHandle)
  {
    os_log_t logHandle = v47->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_t logHandle = inited;
  }
  int v44 = logHandle;
  os_log_type_t v43 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v44;
    os_log_type_t type = v43;
    __os_log_helper_16_0_0(v42);
    _os_log_impl(&dword_1BA438000, log, type, "[AOD routine]: entering Suppressed AOD", v42, 2u);
  }
  [(CBAODModule *)v47 setModulesProperty:&unk_1F1417D38 forKey:@"DynamicSliderEnable"];
  memcpy(__dst, a3, sizeof(__dst));
  [(CBAODModule *)v47 updateModulesAODState:3 transitionParameters:__dst];
  if (!v47->_ABStateBackup)
  {
    id v40 = 0;
    if (v47->super._logHandle)
    {
      uint64_t v16 = v47->super._logHandle;
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
    id v40 = v16;
    os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v40;
      os_log_type_t v14 = v39;
      __os_log_helper_16_0_0(v38);
      _os_log_impl(&dword_1BA438000, v13, v14, "Override AB to ON in AOD.", v38, 2u);
    }
    [(CBAODModule *)v47 setModulesProperty:MEMORY[0x1E4F1CC38] forKey:@"DisplayBrightnessAuto"];
  }
  [(CBAODModule *)v47 setModulesProperty:&unk_1F1417D20 forKey:@"ForceModuleUpdate"];
  id v37 = [(CBAODModule *)v47 copyModulesInfo:0];
  os_log_t v36 = 0;
  if (v47->super._logHandle)
  {
    SEL v12 = v47->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v11 = init_default_corebrightness_log();
    }
    SEL v12 = v11;
  }
  os_log_t v36 = v12;
  os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v48, (uint64_t)v37);
    _os_log_impl(&dword_1BA438000, v36, v35, "ENTERING Suppressed AOD - Target modules info: \n %@", v48, 0xCu);
  }
  [v37 objectForKey:@"TrustedLux"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = v47;
    objc_msgSend((id)objc_msgSend(v37, "objectForKey:", @"TrustedLux"), "floatValue");
    -[CBAODModule reevaluatePThresholdsForLux:](v10, "reevaluatePThresholdsForLux:");
  }
  [(CBAODModule *)v47 setModulesProperty:&unk_1F1417D38 forKey:@"Aggressivity"];
  os_log_type_t v8 = v47;
  double v7 = NSNumber;
  [+[CBAODState sharedInstance] thresholdPCCLuxDelta];
  -[CBAODModule setModulesProperty:forKey:](v8, "setModulesProperty:forKey:", objc_msgSend(v7, "numberWithFloat:"), @"AAPLuxDelta");
  char v34 = 0;
  transitionController = v47->_transitionController;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __68__CBAODModule_enteringSuppressedAODRoutineWithTransitionParameters___block_invoke;
  v33[3] = &unk_1E6218FE0;
  v33[4] = v47;
  uint64_t v27 = MEMORY[0x1E4F143A8];
  int v28 = -1073741824;
  int v29 = 0;
  int v30 = __68__CBAODModule_enteringSuppressedAODRoutineWithTransitionParameters___block_invoke_240;
  unint64_t v31 = &unk_1E6218FE0;
  SEL v32 = v47;
  memcpy(v26, a3, sizeof(v26));
  char v34 = [(CBAODTransitionController *)transitionController startTransition:v37 transitionParameters:v26 rampDoneCallback:v33 rampCanceledCallback:&v27];
  if (!v34)
  {
    os_log_t oslog = 0;
    if (v47->super._logHandle)
    {
      uint64_t v6 = v47->super._logHandle;
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
    os_log_t oslog = v6;
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      float v3 = oslog;
      os_log_type_t v4 = v24;
      __os_log_helper_16_0_0(v23);
      _os_log_impl(&dword_1BA438000, v3, v4, "This change doesn't trigger transition -> start AOD ON + suppressed routine", v23, 2u);
    }
    [(CBAODModule *)v47 onSuppresedAODRoutine];
  }
}

uint64_t __68__CBAODModule_enteringSuppressedAODRoutineWithTransitionParameters___block_invoke(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  os_log_type_t v9 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
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
  os_log_type_t v9 = v5;
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v9;
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1BA438000, log, type, "AOD suppressed enter transition is done -> start AOD ON + suppressed routine", v7, 2u);
  }
  return [*(id *)(a1 + 32) onSuppresedAODRoutine];
}

uint64_t __68__CBAODModule_enteringSuppressedAODRoutineWithTransitionParameters___block_invoke_240(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  os_log_type_t v9 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
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
  os_log_type_t v9 = v5;
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v9;
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1BA438000, log, type, "AOD suppressed enter transition was canceled -> start AOD ON + suppressed routine", v7, 2u);
  }
  return [*(id *)(a1 + 32) onSuppresedAODRoutine];
}

- (void)onSuppresedAODRoutine
{
  SEL v12 = self;
  SEL v11 = a2;
  double v7 = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v10 = 0;
  if (v12->super._logHandle)
  {
    os_log_t logHandle = v12->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_t logHandle = inited;
  }
  uint64_t v10 = logHandle;
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v10;
    os_log_type_t type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_impl(&dword_1BA438000, log, type, "[AOD routine]: AOD suppressed is ON", v8, 2u);
  }
  [(CBAODModule *)v12 setModulesProperty:&unk_1F1417D38 forKey:@"AutoBrightnessLuxFilter"];
  [(CBAODModule *)v12 updateModulesAODState:1];
  [(CBAODTransitionController *)v12->_transitionController setDisplayON:0];
  if (v12->_flipBookEnabled)
  {
    [(CBAODModule *)v12 didCompleteTransitionToDisplayMode:2];
  }
  else
  {
    LODWORD(v2) = 1028443341;
    [(CBAODModule *)v12 scheduleDisplayModeCompletionTimerIn:2 forDisplayMode:v2];
  }
  [+[CBAODState sharedInstance] releasePowerAssertion];
}

- (void)exitingAODRoutineForDisplayMode:(int64_t)a3 transitionParameters:(id *)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v67 = self;
  SEL v66 = a2;
  int64_t v65 = a3;
  v64 = a4;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  v63 = 0;
  if (v67->super._logHandle)
  {
    os_log_t logHandle = v67->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_t logHandle = inited;
  }
  v63 = logHandle;
  os_log_type_t v62 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v63;
    os_log_type_t type = v62;
    __os_log_helper_16_0_0(v61);
    _os_log_impl(&dword_1BA438000, log, type, "[AOD routine]: exiting AOD", v61, 2u);
  }
  [(CBAODModule *)v67 setModulesProperty:&unk_1F1417D20 forKey:@"DynamicSliderEnable"];
  id v60 = 0;
  id v60 = [(CBAODTransitionController *)v67->_transitionController copyContext];
  memcpy(__dst, a4, sizeof(__dst));
  [(CBAODModule *)v67 updateModulesAODState:4 transitionParameters:__dst context:v60];

  if (!v67->_ABStateBackup)
  {
    char v58 = 0;
    if (v67->super._logHandle)
    {
      os_log_type_t v24 = v67->super._logHandle;
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
    char v58 = v24;
    os_log_type_t v57 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = v58;
      os_log_type_t v22 = v57;
      __os_log_helper_16_0_0(v56);
      _os_log_impl(&dword_1BA438000, v21, v22, "Set AB to OFF", v56, 2u);
    }
    [(CBAODModule *)v67 setModulesProperty:MEMORY[0x1E4F1CC28] forKey:@"DisplayBrightnessAuto"];
    if (!v67->_dominoModeEnabled)
    {
      *(float *)&double v4 = v67->_displayBrightnessBackup;
      -[CBAODModule setModulesProperty:forKey:](v67, "setModulesProperty:forKey:", [NSNumber numberWithFloat:v4], @"DisplayNitsKey");
    }
  }
  if (v67->_backupState)
  {
    os_log_t v55 = 0;
    if (v67->super._logHandle)
    {
      os_log_type_t v20 = v67->super._logHandle;
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
    os_log_t v55 = v20;
    os_log_type_t v54 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(NSDictionary *)v67->_backupState objectForKey:@"ALSBrightenPdeltaFast"];
      uint64_t v18 = [(NSDictionary *)v67->_backupState objectForKey:@"ALSBrightenPdeltaSlow"];
      __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v69, v17, v18, (uint64_t)[(NSDictionary *)v67->_backupState objectForKey:@"ALSDimPdeltaSlow"]);
      _os_log_impl(&dword_1BA438000, v55, v54, "AP thresholds: Recover P thresholds from backup: BrightenPdeltaFast = %@, BrightenPdeltaSlow = %@, DimPdeltaSlow = %@", v69, 0x20u);
    }
    id v53 = 0;
    id v16 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v15 = -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:");
    uint64_t v14 = -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:");
    id v53 = (id)objc_msgSend(v16, "initWithObjectsAndKeys:", v15, @"ALSBrightenPdeltaFast", v14, @"ALSBrightenPdeltaSlow", -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:"), @"ALSDimPdeltaSlow", 0);
    [(CBAODModule *)v67 setModulesProperty:v53 forKey:@"ALSInternalSettings"];
    [(NSDictionary *)v67->_backupState objectForKey:@"Aggressivity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CBAODModule setModulesProperty:forKey:](v67, "setModulesProperty:forKey:", -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:"), @"Aggressivity");
    }
    [(NSDictionary *)v67->_backupState objectForKey:@"AAPLuxDelta"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CBAODModule setModulesProperty:forKey:](v67, "setModulesProperty:forKey:", -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:"), @"AAPLuxDelta");
    }
    [(NSDictionary *)v67->_backupState objectForKey:@"CEEnable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CBAODModule setModulesProperty:forKey:](v67, "setModulesProperty:forKey:", -[NSDictionary objectForKey:](v67->_backupState, "objectForKey:"), @"CEEnable");
    }
  }
  uint64_t v5 = +[CBAODState sharedInstance];
  LODWORD(v6) = -1.0;
  [(CBAODState *)v5 setNitsCap:v6];
  id v52 = [(CBAODModule *)v67 copyModulesInfo:0];
  os_log_t v51 = 0;
  if (v67->super._logHandle)
  {
    uint64_t v13 = v67->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v12 = init_default_corebrightness_log();
    }
    uint64_t v13 = v12;
  }
  os_log_t v51 = v13;
  os_log_type_t v50 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v68, (uint64_t)v52);
    _os_log_impl(&dword_1BA438000, v51, v50, "EXITING AOD - Target modules info: \n %@", v68, 0xCu);
  }
  char v49 = 0;
  transitionController = v67->_transitionController;
  uint64_t v42 = MEMORY[0x1E4F143A8];
  int v43 = -1073741824;
  int v44 = 0;
  id v45 = __68__CBAODModule_exitingAODRoutineForDisplayMode_transitionParameters___block_invoke;
  SEL v46 = &unk_1E6219538;
  os_log_type_t v47 = v67;
  int64_t v48 = v65;
  uint64_t v35 = MEMORY[0x1E4F143A8];
  int v36 = -1073741824;
  int v37 = 0;
  os_log_t v38 = __68__CBAODModule_exitingAODRoutineForDisplayMode_transitionParameters___block_invoke_253;
  os_log_type_t v39 = &unk_1E6219538;
  id v40 = v67;
  int64_t v41 = v65;
  memcpy(v34, a4, sizeof(v34));
  char v49 = [(CBAODTransitionController *)transitionController startTransition:v52 transitionParameters:v34 rampDoneCallback:&v42 rampCanceledCallback:&v35];
  if (!v49)
  {
    os_log_t oslog = 0;
    if (v67->super._logHandle)
    {
      uint64_t v10 = v67->super._logHandle;
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
    os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = oslog;
      os_log_type_t v8 = v32;
      __os_log_helper_16_0_0(v31);
      _os_log_impl(&dword_1BA438000, v7, v8, "This change doesn't trigger transition -> start AOD OFF routine", v31, 2u);
    }
    [(CBAODModule *)v67 offAODRoutineForDisplayMode:v65];
  }
}

uint64_t __68__CBAODModule_exitingAODRoutineForDisplayMode_transitionParameters___block_invoke(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  uint64_t v9 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
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
  uint64_t v9 = v5;
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v9;
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1BA438000, log, type, "Exit transition done -> start AOD OFF routine", v7, 2u);
  }
  return [*(id *)(a1 + 32) offAODRoutineForDisplayMode:*(void *)(a1 + 40)];
}

uint64_t __68__CBAODModule_exitingAODRoutineForDisplayMode_transitionParameters___block_invoke_253(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  uint64_t v9 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
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
  uint64_t v9 = v5;
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v9;
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1BA438000, log, type, "AOD exit transition was canceled -> start AOD OFF routine", v7, 2u);
  }
  return [*(id *)(a1 + 32) offAODRoutineForDisplayMode:*(void *)(a1 + 40)];
}

- (void)offAODRoutineForDisplayMode:(int64_t)a3
{
  uint64_t v15 = self;
  SEL v14 = a2;
  int64_t v13 = a3;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v12 = 0;
  if (v15->super._logHandle)
  {
    os_log_t logHandle = v15->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_t logHandle = inited;
  }
  uint64_t v12 = logHandle;
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v12;
    os_log_type_t type = v11;
    __os_log_helper_16_0_0(v10);
    _os_log_impl(&dword_1BA438000, log, type, "[AOD routine]: AOD is OFF", v10, 2u);
  }
  [(CBAODModule *)v15 setModulesProperty:&unk_1F1418490 forKey:@"ALSInternalSettings"];
  -[CBAODModule setModulesProperty:forKey:](v15, "setModulesProperty:forKey:", [NSNumber numberWithInteger:v15->_ABLuxFilterBackup], @"AutoBrightnessLuxFilter");
  id v9 = [(CBAODTransitionController *)v15->_transitionController copyContext];
  [(CBAODModule *)v15 updateModulesAODState:0 context:v9];

  [(CBAODModule *)v15 setModulesProperty:&unk_1F1417D50 forKey:@"DisplayBrightnessFadePeriodOverride"];
  [(CBAODModule *)v15 setALSServiceProperty:*MEMORY[0x1E4F1CFC8] forKey:@"AODALSMode"];
  if (!v13 || v13 == 2) {
    [(CBAODTransitionController *)v15->_transitionController setDisplayON:0];
  }
  if (v15->_flipBookEnabled || v13)
  {
    [(CBAODModule *)v15 didCompleteTransitionToDisplayMode:v13];
  }
  else
  {
    LODWORD(v3) = 1028443341;
    [(CBAODModule *)v15 scheduleDisplayModeCompletionTimerIn:0 forDisplayMode:v3];
  }
  [+[CBAODState sharedInstance] releasePowerAssertion];
}

- (void)didCompleteTransitionToDisplayMode:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = self;
  SEL v17 = a2;
  int64_t v16 = a3;
  id v15 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  [(CBAODModule *)v18 sendNotificationForKey:@"DisplayModeChangeComplete" andValue:v15];

  os_log_t v14 = 0;
  if (v18->super._logHandle)
  {
    os_log_t logHandle = v18->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_t logHandle = inited;
  }
  os_log_t v14 = logHandle;
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:v16]);
    _os_log_impl(&dword_1BA438000, v14, v13, "[Display Mode] didCompleteTransitionToDisplayMode %@", v19, 0xCu);
  }
  if (v16 == 2)
  {
    [(CBAODModule *)v18 setALSServiceProperty:&unk_1F1417D68 forKey:@"ALSMedianHistorySize"];
  }
  else if (v16 == 1)
  {
    [(CBAODModule *)v18 setALSServiceProperty:&unk_1F1417D80 forKey:@"ALSMedianHistorySize"];
  }
  else if (v16 == 3 && v18->_flipBookEnabled)
  {
    uint64_t v12 = 0;
    if (v18->super._logHandle)
    {
      double v7 = v18->super._logHandle;
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
    uint64_t v12 = v7;
    char v11 = 16;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      double v4 = v12;
      os_log_type_t v5 = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_error_impl(&dword_1BA438000, v4, v5, "Warning: Flipbook enabled in Active On mode.", v10, 2u);
    }
    [(CBAODModule *)v18 setProperty:&unk_1F1417D98 forKey:@"FlipBookState"];
    [(CBAODModule *)v18 setProperty:&unk_1F1417DB0 forKey:v3];
  }
}

- (id)copyModulesInfo:(BOOL)a3
{
  BOOL v6 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v6) {
    id v4 = [(CBAODModule *)self copyModulesExtendedIdentifiers];
  }
  else {
    id v4 = [(CBAODModule *)self copyModulesIdentifiers];
  }
  objc_msgSend(v4, "enumerateObjectsUsingBlock:");

  return v5;
}

void __31__CBAODModule_copyModulesInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (id)[*(id *)(a1 + 32) copyModulesPropertyForKey:a2];
    if (v3)
    {
      [*(id *)(a1 + 40) setObject:v3 forKey:a2];
    }
  }
}

- (id)copyModulesIdentifiers
{
  id v4 = self;
  SEL v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"DisplayBrightness", @"DisplayAAPFactor", @"TrustedLux", @"ColorRamp", 0);
}

- (id)copyModulesExtendedIdentifiers
{
  id v4 = self;
  SEL v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"DisplayBrightness", @"PendingDisplayNits", @"DisplayPanelLuminanceMin", @"DisplayPanelLuminanceMax", @"DisplayBrightnessAuto", @"DisplayAAPFactor", @"TrustedLux", @"DynamicSliderEnable", @"ALSInternalSettings", @"AOTCurve", @"ALSBrightenPdeltaSlow", @"ALSBrightenPdeltaFast", @"ALSDimPdeltaSlow", @"Aggressivity", @"AAPLuxDelta", @"AutoBrightnessLuxFilter", @"ColorRamp",
               @"CEEnable",
               0);
}

- (void)updateModulesAODState:(unint64_t)a3
{
  double v7 = self;
  SEL v6 = a2;
  unint64_t v5 = a3;
  memset(__b, 0, sizeof(__b));
  memcpy(__dst, __b, sizeof(__dst));
  [(CBAODModule *)v7 updateModulesAODState:v5 transitionParameters:__dst];
}

- (void)updateModulesAODState:(unint64_t)a3 context:(id)a4
{
  id v9 = self;
  SEL v8 = a2;
  unint64_t v7 = a3;
  id v6 = a4;
  memset(__b, 0, sizeof(__b));
  memcpy(__dst, __b, sizeof(__dst));
  [(CBAODModule *)v9 updateModulesAODState:v7 transitionParameters:__dst context:v6];
}

- (void)updateModulesAODState:(unint64_t)a3 transitionParameters:(id *)a4
{
  uint64_t v10 = self;
  SEL v9 = a2;
  unint64_t v8 = a3;
  unint64_t v7 = a4;
  memcpy(__dst, a4, sizeof(__dst));
  [(CBAODModule *)self updateModulesAODState:a3 transitionParameters:__dst context:0];
}

- (void)updateModulesAODState:(unint64_t)a3 transitionParameters:(id *)a4 context:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  os_log_type_t v22 = self;
  SEL v21 = a2;
  unint64_t v20 = a3;
  uint64_t v19 = a4;
  id v18 = a5;
  if ([+[CBAODState sharedInstance] AODState] != a3)
  {
    [+[CBAODState sharedInstance] setAODState:v20];
    os_log_t v17 = 0;
    if (v22->super._logHandle)
    {
      os_log_t logHandle = v22->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t logHandle = inited;
    }
    os_log_t v17 = logHandle;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_0((uint64_t)v23, (uint64_t)[+[CBAODState sharedInstance](CBAODState, "sharedInstance") AODStateString], [+[CBAODState sharedInstance] AODState]);
      _os_log_impl(&dword_1BA438000, v17, v16, "AOD %s (State update = %lu)", v23, 0x16u);
    }
    modules = v22->_modules;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    int v10 = -1073741824;
    int v11 = 0;
    uint64_t v12 = __66__CBAODModule_updateModulesAODState_transitionParameters_context___block_invoke;
    os_log_type_t v13 = &unk_1E6219B58;
    memcpy(v15, a4, sizeof(v15));
    id v14 = v18;
    [(NSMutableArray *)modules enumerateObjectsUsingBlock:&v9];
  }
}

uint64_t __66__CBAODModule_updateModulesAODState_transitionParameters_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141AA58];
  if (result)
  {
    unint64_t v3 = [+[CBAODState sharedInstance] AODState];
    LODWORD(v4) = *(_DWORD *)(a1 + 44);
    return [a2 handleAODStateUpdate:v3 transitionTime:*(void *)(a1 + 32) context:v4];
  }
  return result;
}

- (BOOL)handleALSEvent:(id)a3 transitionParameters:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  SEL v21 = self;
  SEL v20 = a2;
  id v19 = a3;
  id v18 = a4;
  BOOL v17 = 0;
  if (a3
    && (-[NSMutableArray containsObject:](v21->_alsServiceClients, "containsObject:", [v19 service]) & 1) != 0)
  {
    os_log_t v16 = 0;
    if (v21->super._logHandle)
    {
      os_log_t logHandle = v21->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t logHandle = inited;
    }
    os_log_t v16 = logHandle;
    os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v23, (uint64_t)v19);
      _os_log_debug_impl(&dword_1BA438000, v16, v15, "Incoming event %@", v23, 0xCu);
    }
    char v14 = 0;
    if (v21->_currentALSEvent)
    {
      char v14 = 1;

      v21->_currentALSEvent = (CBALSEvent *)v19;
    }
    else
    {
      v21->_currentALSEvent = (CBALSEvent *)v19;
      char v14 = 1;
    }
    [(CBALSEvent *)v21->_currentALSEvent illuminance];
    *(float *)&double v4 = v4;
    [(CBAODModule *)v21 reevaluatePThresholdsForLux:v4];
    if (!a4->var1 && ((v14 & 1) != 0 || a4->var0))
    {
      os_log_t v13 = 0;
      if (v21->super._logHandle)
      {
        unint64_t v7 = v21->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v6 = init_default_corebrightness_log();
        }
        unint64_t v7 = v6;
      }
      os_log_t v13 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v22, (uint64_t)v21->_currentALSEvent);
        _os_log_impl(&dword_1BA438000, v13, v12, "Check modules update for ALS: %@", v22, 0xCu);
      }
      memcpy(__dst, a4, 0x30uLL);
      [(CBAODModule *)v21 performUpdateWithTransitionParameters:__dst];
    }
    return 1;
  }
  return v17;
}

- (BOOL)copyAndHandleEvent
{
  LODWORD(v2) = -1.0;
  return -[CBAODModule copyAndHandleEventWithTransitionLength:](self, "copyAndHandleEventWithTransitionLength:", v2, a2, self);
}

- (BOOL)copyAndHandleEventWithTransitionLength:(float)a3
{
  return [(CBAODModule *)self copyAndHandleEventWithTransitionLength:0 forceUpdate:*(double *)&a3];
}

- (BOOL)copyAndHandleEventWithTransitionLength:(float)a3 forceUpdate:(BOOL)a4
{
  int v10 = self;
  SEL v9 = a2;
  float v8 = a3;
  BOOL v7 = a4;
  memset(__b, 0, sizeof(__b));
  LOBYTE(__b[0]) = v7;
  HIBYTE(__b[0]) = v8 >= 0.0;
  *(float *)&__b[1] = v8;
  memcpy(__dst, __b, sizeof(__dst));
  return [(CBAODModule *)v10 copyAndHandleEventWithTransitionParameters:__dst];
}

- (BOOL)copyAndHandleEventWithTransitionParameters:(id *)a3
{
  id v40 = self;
  SEL v39 = a2;
  os_log_t v38 = a3;
  int v37 = 0;
  if (self->super._logHandle)
  {
    os_log_t logHandle = v40->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_t logHandle = inited;
  }
  int v37 = logHandle;
  char v36 = 1;
  unint64_t v35 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(logHandle))
  {
    os_log_t log = v37;
    os_signpost_type_t type = v36;
    os_signpost_id_t spid = v35;
    __os_log_helper_16_0_0(v34);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, log, type, spid, "copyAndHandleEvent", (const char *)&unk_1BA61B929, v34, 2u);
  }
  uint64_t v29 = 0;
  int v30 = &v29;
  int v31 = 0x20000000;
  int v32 = 32;
  char v33 = 0;
  alsServiceClients = v40->_alsServiceClients;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  int v22 = -1073741824;
  int v23 = 0;
  uint64_t v24 = __58__CBAODModule_copyAndHandleEventWithTransitionParameters___block_invoke;
  os_log_type_t v25 = &unk_1E6219B80;
  os_log_t v26 = v40;
  memcpy(v28, a3, sizeof(v28));
  uint64_t v27 = &v29;
  [(NSMutableArray *)alsServiceClients enumerateObjectsUsingBlock:&v21];
  os_log_t v20 = 0;
  if (v40->super._logHandle)
  {
    SEL v9 = v40->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v8 = init_default_corebrightness_log();
    }
    SEL v9 = v8;
  }
  os_log_t v20 = v9;
  char v19 = 2;
  unint64_t v18 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v9))
  {
    unint64_t v5 = v20;
    os_signpost_type_t v6 = v19;
    os_signpost_id_t v7 = v18;
    __os_log_helper_16_0_0(v17);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v5, v6, v7, "copyAndHandleEvent", (const char *)&unk_1BA61B929, v17, 2u);
  }
  char v4 = *((unsigned char *)v30 + 24);
  _Block_object_dispose(&v29, 8);
  return v4 & 1;
}

void __58__CBAODModule_copyAndHandleEventWithTransitionParameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = a1;
  uint64_t v32 = a2;
  uint64_t v31 = a3;
  uint64_t v30 = a4;
  uint64_t v29 = a1;
  memset(&v34[15], 0, 0xA9uLL);
  mach_absolute_time();
  CFTypeRef VendorDefinedEvent = (CFTypeRef)IOHIDEventCreateVendorDefinedEvent();
  if (VendorDefinedEvent)
  {
    CFTypeRef cf = (CFTypeRef)IOHIDServiceClientCopyEvent();
    CFRelease(VendorDefinedEvent);
    if (cf)
    {
      id v26 = 0;
      id v26 = (id)[*(id *)(a1 + 32) copyModulesPropertyForKey:@"ALSIntegrationMode"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || [v26 intValue] != 2 && objc_msgSend(v26, "intValue") != 1)
      {
        +[CBALSEvent replaceLuxWithFilteredLux:cf];
      }

      os_log_t oslog = 0;
      if (*(void *)(*(void *)(a1 + 32) + 16))
      {
        int v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        int v11 = inited;
      }
      os_log_t oslog = v11;
      os_log_type_t type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)cf);
        _os_log_impl(&dword_1BA438000, oslog, type, "Copied event %@", v34, 0xCu);
      }
      char v4 = *(void **)(*(void *)(a1 + 32) + 32);
      uint64_t v17 = MEMORY[0x1E4F143A8];
      int v18 = -1073741824;
      int v19 = 0;
      os_log_t v20 = __58__CBAODModule_copyAndHandleEventWithTransitionParameters___block_invoke_293;
      uint64_t v21 = &unk_1E6219768;
      CFTypeRef v23 = cf;
      uint64_t v22 = v32;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:");
      SEL v9 = *(void **)(a1 + 32);
      memcpy(__dst, (const void *)(a1 + 48), sizeof(__dst));
      [v9 handleHIDEvent:cf from:v32 transitionParameters:__dst];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      CFRelease(cf);
    }
    else
    {
      os_log_t v15 = 0;
      if (*(void *)(*(void *)(a1 + 32) + 16))
      {
        uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 16);
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
      os_log_t v15 = v8;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unint64_t v5 = v15;
        os_log_type_t v6 = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_error_impl(&dword_1BA438000, v5, v6, "Failed to copy kIOHIDEventTypeAmbientLightSensor event", v13, 2u);
      }
    }
  }
}

uint64_t __58__CBAODModule_copyAndHandleEventWithTransitionParameters___block_invoke_293(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A9C8];
  if (result) {
    return [a2 handleHIDEvent:*(void *)(a1 + 40) from:*(void *)(a1 + 32)];
  }
  return result;
}

- (float)getFloatValueFrom:(id)a3 key:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  float v8 = 0.0;
  uint64_t v7 = (void *)[a3 objectForKey:a4];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v7 floatValue];
    return v4;
  }
  else
  {
    os_log_t oslog = self->super._logHandle;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v11, (uint64_t)a4);
      _os_log_fault_impl(&dword_1BA438000, oslog, OS_LOG_TYPE_FAULT, "getFloatValueFrom error - invalid value for key %@", v11, 0xCu);
    }
  }
  return v8;
}

- (float)getFloatValueFrom:(id)a3 key:(id)a4 subkey:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  float v11 = 0.0;
  int v10 = (void *)[a3 objectForKey:a4];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    SEL v9 = (void *)[v10 objectForKey:a5];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v9 floatValue];
      return v5;
    }
    else
    {
      os_log_t oslog = self->super._logHandle;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v16, (uint64_t)a4);
        _os_log_fault_impl(&dword_1BA438000, oslog, OS_LOG_TYPE_FAULT, "getFloatValueFrom (subkey) error - invalid value for sub-key %@", v16, 0xCu);
      }
    }
  }
  else
  {
    os_log_t logHandle = self->super._logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_FAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v15, (uint64_t)a4);
      _os_log_fault_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_FAULT, "getFloatValueFrom (subkey)error - invalid value for key %@", v15, 0xCu);
    }
  }
  return v11;
}

- (int64_t)getIntegerValueFrom:(id)a3 key:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int64_t v7 = 0;
  os_log_type_t v6 = (void *)[a3 objectForKey:a4];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return [v6 integerValue];
    }
  }
  os_log_t oslog = self->super._logHandle;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)a4);
    _os_log_fault_impl(&dword_1BA438000, oslog, OS_LOG_TYPE_FAULT, "getIntValueFrom error - invalid value for %@", v10, 0xCu);
  }
  return v7;
}

- (BOOL)setALSServiceProperty:(void *)a3 forKey:(__CFString *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = self;
  SEL v21 = a2;
  CFTypeRef v20 = a3;
  int v19 = a4;
  os_log_t oslog = 0;
  if (self->super._logHandle)
  {
    os_log_t logHandle = v22->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_t logHandle = inited;
  }
  os_log_t oslog = logHandle;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v24, (uint64_t)v19, (uint64_t)v20);
    _os_log_impl(&dword_1BA438000, oslog, type, "[ALS service] Set ALS service property %@ = %@", v24, 0x16u);
  }
  BOOL v16 = 0;
  memset(__b, 0, sizeof(__b));
  obj = v22->_alsServiceClients;
  uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v23 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    unint64_t v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      IOHIDServiceClientRef service = 0;
      IOHIDServiceClientRef service = *(IOHIDServiceClientRef *)(__b[1] + 8 * v8);
      Boolean v4 = IOHIDServiceClientSetProperty(service, v19, v20);
      BOOL v16 = (v16 | v4) != 0;
      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v23 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }
  return v16;
}

- (void)loadAODCurveFromDefaults
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA9ECAE0]();
  id v18 = [(CBAODModule *)self copyArrayFromPrefsForKey:@"AOTCurve"];
  if (v18)
  {
    if ([v18 count] % 2uLL)
    {
      if (self->super._logHandle)
      {
        os_log_t logHandle = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        os_log_t logHandle = inited;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v20, [v18 count]);
        _os_log_error_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_ERROR, "AOD curve stored in defaults has unexpected number of coordinates (%lu).", v20, 0xCu);
      }
    }
    else
    {
      int v17 = (int)[v18 count] / 2;
      if (self->super._logHandle)
      {
        uint64_t v8 = self->super._logHandle;
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
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v18);
        _os_log_impl(&dword_1BA438000, v8, OS_LOG_TYPE_DEFAULT, "Use AOD curve from defauls %@", v26, 0xCu);
      }
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      int v14 = 0;
      for (int i = 0; i < v17; ++i)
      {
        ++v14;
        objc_msgSend(v16, "addObject:", objc_msgSend(v18, "objectAtIndexedSubscript:"));
      }
      for (int j = 0; j < v17; ++j)
      {
        ++v14;
        objc_msgSend(v15, "addObject:", objc_msgSend(v18, "objectAtIndexedSubscript:"));
      }
      v24[0] = @"lux";
      v25[0] = v16;
      v24[1] = @"nits";
      v25[1] = v15;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
      v22[0] = @"CurveLevelLow";
      v23[0] = v11;
      v22[1] = @"CurveLevelMed";
      v23[1] = v11;
      v22[2] = @"CurveLevelHigh";
      v23[2] = v11;
      id v10 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
      id v2 = v10;
      if (self->super._logHandle)
      {
        uint64_t v6 = self->super._logHandle;
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
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v21, (uint64_t)v10);
        _os_log_impl(&dword_1BA438000, v6, OS_LOG_TYPE_DEFAULT, "AOTCurve: %@", v21, 0xCu);
      }
      [(CBAODModule *)self setModulesProperty:v10 forKey:@"AOTCurve"];
    }
  }
}

- (id)copyArrayFromPrefsForKey:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreBrightness"];
  if (v7)
  {
    [v7 synchronize];
    uint64_t v6 = [v7 objectForKey:a3];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v6];
      }
    }
  }
  if (self->super._logHandle)
  {
    os_log_t logHandle = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_t logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v11, (uint64_t)"-[CBAODModule copyArrayFromPrefsForKey:]", (uint64_t)a3, (uint64_t)v8);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "%s: %@ = %@ \n", v11, 0x20u);
  }
  return v8;
}

- (void)releaseDisplayModeCompletionTimer
{
  id v10 = self;
  SEL v9 = a2;
  uint64_t v8 = 0;
  if (self->super._logHandle)
  {
    os_log_t logHandle = v10->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_t logHandle = inited;
  }
  uint64_t v8 = logHandle;
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v8;
    os_log_type_t type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_1BA438000, log, type, "Release scheduled display mode completion timer", v6, 2u);
  }
  if (v10->_displayModeCompletionTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v10->_displayModeCompletionTimer);
    dispatch_release((dispatch_object_t)v10->_displayModeCompletionTimer);
    v10->_displayModeCompletionTimer = 0;
  }
}

- (void)scheduleDisplayModeCompletionTimerIn:(float)a3 forDisplayMode:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = self;
  SEL v24 = a2;
  float v23 = a3;
  int64_t v22 = a4;
  os_log_t v21 = 0;
  if (self->super._logHandle)
  {
    os_log_t logHandle = v25->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_t logHandle = inited;
  }
  os_log_t v21 = logHandle;
  os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v26, COERCE__INT64(v23), (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:v22]);
    _os_log_impl(&dword_1BA438000, v21, v20, "Schedule display mode completion timer in %f sec for %@ mode", v26, 0x16u);
  }
  int64_t v19 = (unint64_t)(float)(v23 * 1000000000.0);
  if (v25->_displayModeCompletionTimer)
  {
    source = v25->_displayModeCompletionTimer;
    dispatch_time_t v4 = dispatch_time(0, v19);
    dispatch_source_set_timer(source, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    v25->_displayModeCompletionTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v25->super._queue);
    if (v25->_displayModeCompletionTimer)
    {
      displayModeCompletionTimer = v25->_displayModeCompletionTimer;
      uint64_t handler = MEMORY[0x1E4F143A8];
      int v12 = -1073741824;
      int v13 = 0;
      int v14 = __67__CBAODModule_scheduleDisplayModeCompletionTimerIn_forDisplayMode___block_invoke;
      id v15 = &unk_1E6219BA8;
      id v16 = v25;
      int64_t v17 = v22;
      float v18 = v23;
      dispatch_source_set_event_handler(displayModeCompletionTimer, &handler);
      os_log_type_t v7 = v25->_displayModeCompletionTimer;
      dispatch_time_t v6 = dispatch_time(0, v19);
      dispatch_source_set_timer(v7, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
  dispatch_activate((dispatch_object_t)v25->_displayModeCompletionTimer);
}

uint64_t __67__CBAODModule_scheduleDisplayModeCompletionTimerIn_forDisplayMode___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    unint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    unint64_t v3 = inited;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_0((uint64_t)v5, (uint64_t)+[CBDisplayStateUtilities stringForDisplayMode:*(void *)(a1 + 40)], COERCE__INT64(*(float *)(a1 + 48)));
    _os_log_impl(&dword_1BA438000, v3, OS_LOG_TYPE_DEFAULT, "Call %@ mode completion after %f seconds.", v5, 0x16u);
  }
  return [*(id *)(a1 + 32) didCompleteTransitionToDisplayMode:*(void *)(a1 + 40)];
}

- (void)reevaluatePThresholdsForLux:(float)a3
{
  id v3 = [(CBAODThresholdModule *)self->_thresholdModule copyPdeltaThresholdsForLux:*(double *)&a3];
  [(CBAODModule *)self setModulesProperty:v3 forKey:@"ALSInternalSettings"];
}

- (id)stringForFlipbookMode:(int64_t)a3
{
  uint64_t v6 = @"Unknown";
  if (a3)
  {
    int64_t v4 = a3;
    char v3 = 1;
  }
  else
  {
    int64_t v4 = 0;
    char v3 = 0;
  }
  if ((v3 & 1) == 0)
  {
    switch(v4)
    {
      case 0:
        uint64_t v6 = @"Will Turn ON";
        break;
      case 1:
        uint64_t v6 = @"Did Turn ON";
        break;
      case 2:
        uint64_t v6 = @"Will Turn OFF";
        break;
      case 3:
        uint64_t v6 = @"Did Turn OFF";
        break;
      default:
        JUMPOUT(0);
    }
  }
  return v6;
}

- (BOOL)aodEnabled
{
  return self->_aodEnabled;
}

- (void)setAodEnabled:(BOOL)a3
{
  self->_aodEnabled = a3;
}

@end