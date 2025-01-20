@interface CBAODTransitionController
- (BOOL)applyPendingUpdates;
- (BOOL)cancelDCPTransition;
- (BOOL)cancelTransition;
- (BOOL)commitBrightness:(float)a3 force:(BOOL)a4;
- (BOOL)currentFlipBookEntry:(id *)a3;
- (BOOL)displayON;
- (BOOL)flipBookEntryForID:(int)a3 entry:(id *)a4;
- (BOOL)initAPEndpoint;
- (BOOL)liveUpdates;
- (BOOL)liveUpdatesOverride;
- (BOOL)requestColorRampTransitionStop;
- (BOOL)requestTransitionStopForIdentifier:(id)a3;
- (BOOL)sendCurrentFlipBook;
- (BOOL)shallUpdateWhitepointFrom:(float)a3[3][3] target:(float)a4[3][3];
- (BOOL)startTransition:(id)a3 length:(float)a4 forceUpdate:(BOOL)a5 rampDoneCallback:(id)a6 rampCanceledCallback:(id)a7;
- (BOOL)startTransition:(id)a3 transitionParameters:(id *)a4 rampDoneCallback:(id)a5 rampCanceledCallback:(id)a6;
- (BOOL)updateAllBrightnessFeaturesForced:(BOOL)a3;
- (CBAODTransitionController)initWithCBBrtControl:(id)a3 andQueue:(id)a4;
- (CBAODTransitionController)initWithCBBrtControl:(id)a3 andThresholdModule:(id)a4 andQueue:(id)a5;
- (CBAmmolite)ammolite;
- (CBIndicatorBrightnessModule)indicator;
- (CBTwilight)twilight;
- (float)brightnessFactor;
- (float)brightnessLimitProgressCallback:(float)a3 rampContext:(id)a4;
- (float)calculateSigmoidProgressForLinearProgress:(float)a3;
- (float)calculateSpringProgressForLinearProgress:(float)a3;
- (float)currentAmmoliteLux;
- (float)currentDisplayNits;
- (float)currentTwilightLux;
- (float)getFloatValueFrom:(id)a3 key:(id)a4;
- (float)getFloatValueFrom:(id)a3 key:(id)a4 subkey:(id)a5;
- (float)nitsOverride;
- (float)remainingTransitionLength;
- (float)sdrBrightnessProgressCallback:(float)a3 rampContext:(id)a4;
- (float)sdrBrightnessProgressCallback:(float)a3 rampContext:(id)a4 profile:(unint64_t)a5;
- (float)sigmoidFunction:(float)a3;
- (float)transitionDurationFromCurrent:(float)a3 toTarget:(float)a4;
- (id)copyColourRampStatsWithLength:(float)a3 frequency:(float)a4 origin:(id)a5 target:(id)a6;
- (id)copyContext;
- (id)copyRampStatsWithLength:(float)a3 frequency:(float)a4 origin:(float)a5 target:(float)a6;
- (int)currentTransitionUpdateID;
- (void)activateLastUpdateSwappedTimerWithTimeout:(float)a3;
- (void)addFlipBookEntry:(id *)a3;
- (void)checkBootArgsConfiguration;
- (void)chromaticity:(id *)a3 andIlluminance:(float *)a4 fromMatrix:(float)a5[3][3];
- (void)clockUpdateHandler:(id)a3;
- (void)colorMatrix:(float)a3[3][3] fromState:(id)a4;
- (void)colorRampRoutine:(id *)a3;
- (void)dealloc;
- (void)enableDCPFlipBookUpdates:(BOOL)a3;
- (void)initColorEffects;
- (void)initialiseFlipBookWithLength:(float)a3 frequency:(int)a4 lux:(float)a5;
- (void)logTransitionParameters:(id *)a3;
- (void)processInitialColorMatrixFromState:(id)a3;
- (void)rampsDoneCallback:(id)a3;
- (void)releaseCallbacks;
- (void)releaseLastUpdateSwappedTimer;
- (void)sendNotificationForKey:(id)a3 andValue:(id)a4;
- (void)setAmmolite:(id)a3;
- (void)setBrightnessFactor:(float)a3;
- (void)setCurrentDisplayNits:(float)a3;
- (void)setCurrentWhitepointFromMatrix:(float)a3[3][3];
- (void)setDisplayON:(BOOL)a3;
- (void)setDurationOfEDRRamp:(float)a3;
- (void)setIndicator:(id)a3;
- (void)setInitialState:(id)a3;
- (void)setLiveUpdates:(BOOL)a3;
- (void)setLiveUpdatesOverride:(BOOL)a3;
- (void)setNitsOverride:(float)a3;
- (void)setRemainingTransitionLength:(float)a3;
- (void)setTargetWhitepointFromMatrix:(float)a3[3][3];
- (void)setTwilight:(id)a3;
- (void)setWhitepoint:(id *)a3 fromMatrix:(float)a4[3][3];
- (void)updateAAPFactor:(float)a3;
- (void)updateAmbient:(float)a3;
- (void)updateAmmoliteStrength:(float)a3;
- (void)updateBrightnessLimit:(float)a3;
- (void)updateColorRamp:(id)a3;
- (void)updateEDRHeadroom:(float)a3;
- (void)updateFlipBookEntryWithAAPFactor:(float)a3;
- (void)updateFlipBookEntryWithAmmoliteLux:(float)a3;
- (void)updateFlipBookEntryWithAmmoliteStrength:(float)a3;
- (void)updateFlipBookEntryWithBrightness:(float)a3;
- (void)updateFlipBookEntryWithBrightnessLimit:(float)a3;
- (void)updateFlipBookEntryWithTwilightLux:(float)a3;
- (void)updateFlipBookEntryWithTwilightStrength:(float)a3;
- (void)updateLumaBoostFactor:(float)a3;
- (void)updateSDRBrightness:(float)a3;
- (void)updateTwilightStrength:(float)a3;
- (void)updateWhitePoint:(float)a3[3][3];
@end

@implementation CBAODTransitionController

- (CBAODTransitionController)initWithCBBrtControl:(id)a3 andThresholdModule:(id)a4 andQueue:(id)a5
{
  v8 = [(CBAODTransitionController *)self initWithCBBrtControl:a3 andQueue:a5];
  if (v8)
  {
    *(void *)&v8->_currentFlipBookEntry.ammoliteLux = a4;
    id v5 = *(id *)&v8->_currentFlipBookEntry.ammoliteLux;
  }
  return v8;
}

- (CBAODTransitionController)initWithCBBrtControl:(id)a3 andQueue:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v49 = self;
  SEL v48 = a2;
  v47 = (CBBrightnessProxy *)a3;
  id v46 = a4;
  v45.receiver = self;
  v45.super_class = (Class)CBAODTransitionController;
  v49 = [(CBModule *)&v45 initWithQueue:a4];
  if (v49)
  {
    v49->_brtCtl = v47;
    v4 = v49->_brtCtl;
    unsigned int v5 = [(CBBrightnessProxy *)v49->_brtCtl getDisplayId];
    v49->_displayID = v5;
    id v44 = 0;
    id v6 = [NSString alloc];
    id v44 = (id)objc_msgSend(v6, "initWithFormat:", @"com.apple.CoreBrightness.AOD.CBAODTransitionController.%lu", v49->_displayID);
    if (v44) {
      os_log_t v7 = os_log_create((const char *)[v44 cStringUsingEncoding:1], "default");
    }
    else {
      os_log_t v7 = os_log_create("com.apple.CoreBrightness.AOD.CBAODTransitionController", "default");
    }
    v49->super._logHandle = (OS_os_log *)v7;
    if (!v49->super._logHandle)
    {
      v43 = 0;
      v21 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v43 = v21;
      char v42 = 16;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        log = v43;
        os_log_type_t type = v42;
        __os_log_helper_16_0_0(v41);
        _os_log_error_impl(&dword_1BA438000, log, type, "Failed to create log handle", v41, 2u);
      }
    }

    if ([(CBAODTransitionController *)v49 initAPEndpoint])
    {
      LOBYTE(v49->_targetWhitepoint.matrix[2][0]) = 0;
    }
    else
    {
      v40 = 0;
      if (v49->super._logHandle)
      {
        logHandle = v49->super._logHandle;
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
      v40 = logHandle;
      os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v40;
        os_log_type_t v16 = v39;
        __os_log_helper_16_0_0(v38);
        _os_log_impl(&dword_1BA438000, v15, v16, "Use live updates (CA) by default", v38, 2u);
      }
      LOBYTE(v49->_targetWhitepoint.matrix[2][0]) = 1;
    }
    v8 = objc_alloc_init(CBRampManager);
    v49->_rampManager = v8;
    [(CBRampManager *)v49->_rampManager scheduleWithDispatchQueue:v46];
    rampManager = v49->_rampManager;
    uint64_t v32 = MEMORY[0x1E4F143A8];
    int v33 = -1073741824;
    int v34 = 0;
    v35 = __59__CBAODTransitionController_initWithCBBrtControl_andQueue___block_invoke;
    v36 = &unk_1E621A1B8;
    v37 = v49;
    -[CBRampManager setClockHandler:](rampManager, "setClockHandler:");
    v10 = v49->_rampManager;
    uint64_t v26 = MEMORY[0x1E4F143A8];
    int v27 = -1073741824;
    int v28 = 0;
    v29 = __59__CBAODTransitionController_initWithCBBrtControl_andQueue___block_invoke_2;
    v30 = &unk_1E621A1B8;
    v31 = v49;
    -[CBRampManager setRampDoneCallback:](v10, "setRampDoneCallback:");
    [(CBRampManager *)v49->_rampManager activate];
    v49->_currentSDRBrightness = 0.0;
    v49->_targetSDRBrightness = 0.0;
    v49->_minNits = 0.0;
    v49->_maxNits = 0.0;
    v49->_rampDoneCallback = 0;
    v49->_edrRampDurationPerStop = 0.75;
    if (v49->_brtCtl)
    {
      id v25 = 0;
      id v25 = (id)[(CBBrightnessProxy *)v49->_brtCtl getBrightnessCapabilities];
      if (v25)
      {
        [v25 objectForKeyedSubscript:@"EDRSecondsPerStopDefault"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", @"EDRSecondsPerStopDefault"), "floatValue");
          v49->_edrRampDurationPerStop = v11;
          os_log_t v24 = 0;
          if (v49->super._logHandle)
          {
            v14 = v49->super._logHandle;
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
          os_log_t v24 = v14;
          os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_0_1_8_0((uint64_t)v50, COERCE__INT64(v49->_edrRampDurationPerStop));
            _os_log_impl(&dword_1BA438000, v24, v23, "AOD EDR transitions uses %f seconds per stop", v50, 0xCu);
          }
        }
      }
    }
    v49->_currentAAPFactor = 0.0;
    v49->_targetAAPFactor = 0.0;
    v49->_currentBrightnessLimit = 0.0;
    v49->_targetBrightnessLimit = 0.0;
    v49->_currentLumaBoostFactor = 0.0;
    v49->_targetLumaBoostFactor = 0.0;
    memset(__b, 0, sizeof(__b));
    memcpy(&v49->_currentFlipBookEntry, __b, 0x4FuLL);
    v49->_targetWhitepoint.matrix[2][1] = -1.0;
    v49->_currentFrequency = 60;
    v49->_currentTrustedLux = -1.0;
    BYTE1(v49->_targetWhitepoint.matrix[2][0]) = 1;
    *(void *)&v49->_currentFlipBookEntry.reserved[4] = 0;
    v49->_targetWhitepoint.xy.y = 0.0;
    [(CBAODTransitionController *)v49 initColorEffects];
    memcpy(&v49->_thresholdModule, &identityMatrix, 0x24uLL);
    memcpy(v49->_currentWhitepoint.matrix[2], &identityMatrix, 0x24uLL);
    [(CBAODTransitionController *)v49 chromaticity:v49->_currentWhitepoint.matrix[1] andIlluminance:&v49->_currentWhitepoint.matrix[1][2] fromMatrix:&v49->_thresholdModule];
    [(CBAODTransitionController *)v49 chromaticity:v49->_targetWhitepoint.matrix[1] andIlluminance:&v49->_targetWhitepoint.matrix[1][2] fromMatrix:v49->_currentWhitepoint.matrix[2]];
    [(CBAODTransitionController *)v49 checkBootArgsConfiguration];
  }
  return v49;
}

uint64_t __59__CBAODTransitionController_initWithCBBrtControl_andQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) clockUpdateHandler:a2];
}

uint64_t __59__CBAODTransitionController_initWithCBBrtControl_andQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) rampsDoneCallback:a2];
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;

  [(CBAODTransitionController *)v4 releaseLastUpdateSwappedTimer];
  if (v4->_rampDoneCallback)
  {
    _Block_release(v4->_rampDoneCallback);
    v4->_rampDoneCallback = 0;
  }
  if (v4->_rampCanceledCallback)
  {
    _Block_release(v4->_rampCanceledCallback);
    v4->_rampCanceledCallback = 0;
  }
  -[CBAODTransitionController setIndicator:](v4, "setIndicator:");
  [(CBAODTransitionController *)v4 setTwilight:0];
  [(CBAODTransitionController *)v4 setAmmolite:0];
  if (v4->super._logHandle) {

  }
  if (v4->super._queue)
  {
    dispatch_release((dispatch_object_t)v4->super._queue);
    v4->super._queue = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBAODTransitionController;
  [(CBModule *)&v2 dealloc];
}

- (BOOL)initAPEndpoint
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = self;
  SEL v25 = a2;
  char v24 = 1;
  self->_endpoint = [[CBAPEndpoint alloc] initWithServiceName:@"cbroot-service" role:@"DCP"];
  if (v26->_endpoint)
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
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v10 = type;
      __os_log_helper_16_0_0(v21);
      _os_log_impl(&dword_1BA438000, log, v10, "CBAPEndpoint initialization completed", v21, 2u);
    }
    bzero(v28, 0x400uLL);
    size_t v20 = 1024;
    if (!sysctlbyname("kern.bootargs", v28, &v20, 0, 0))
    {
      v19 = strstr[abi:ne180100](v28, "cb_aod_enable_dcp_updates");
      if (v19)
      {
        v19 += 25;
        BOOL v18 = strtol(v19 + 1, 0, 0) != 0;
        os_log_t v17 = 0;
        if (v26->super._logHandle)
        {
          v8 = v26->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v7 = init_default_corebrightness_log();
          }
          v8 = v7;
        }
        os_log_t v17 = v8;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v27, v18);
          _os_log_impl(&dword_1BA438000, v17, v16, "Boot arg override: enable DCP updates %d", v27, 8u);
        }
        [(CBAODTransitionController *)v26 enableDCPFlipBookUpdates:v18];
      }
    }
  }
  else
  {
    os_log_t v15 = 0;
    if (v26->super._logHandle)
    {
      id v6 = v26->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v5 = init_default_corebrightness_log();
      }
      id v6 = v5;
    }
    os_log_t v15 = v6;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      SEL v3 = v15;
      os_log_type_t v4 = v14;
      __os_log_helper_16_0_0(v13);
      _os_log_error_impl(&dword_1BA438000, v3, v4, "CBAPEndpoint init failed", v13, 2u);
    }
    char v24 = 0;
  }
  return v24 & 1;
}

- (void)checkBootArgsConfiguration
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8 = self;
  v7[1] = (size_t)a2;
  bzero(v10, 0x400uLL);
  v7[0] = 1024;
  if (!sysctlbyname("kern.bootargs", v10, v7, 0, 0))
  {
    id v6 = strstr[abi:ne180100](v10, "cb_aod_force_live_updates");
    if (v6)
    {
      BOOL v5 = strtol(v6 + 26, 0, 0) != 0;
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
        if (v5) {
          objc_super v2 = "Enable";
        }
        else {
          objc_super v2 = "Disable";
        }
        __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)v2);
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Boot arg override live updates: %s.", v9, 0xCu);
      }
      [(CBAODTransitionController *)v8 setLiveUpdatesOverride:v5];
      [(CBAODTransitionController *)v8 setLiveUpdates:v5];
    }
  }
}

- (float)currentDisplayNits
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v8 = self;
  SEL v7 = a2;
  float currentSDRBrightness = 0.0;
  float currentSDRBrightness = self->_currentSDRBrightness;
  memset(__b, 0, sizeof(__b));
  if ([(CBAODTransitionController *)v8 currentFlipBookEntry:__b] && (__b[4] & 1) != 0)
  {
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
      __os_log_helper_16_0_2_4_0_8_0((uint64_t)v9, *(int *)__b, COERCE__INT64(*(float *)&__b[5]));
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Get last update applied[%d] = %f", v9, 0x12u);
    }
    return *(float *)&__b[5];
  }
  return currentSDRBrightness;
}

- (float)currentTwilightLux
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = self;
  SEL v9 = a2;
  float v8 = 0.0;
  [*(id *)&self->_liveUpdatesOverride lux];
  float v8 = v2;
  memset(__b, 0, sizeof(__b));
  if ([(CBAODTransitionController *)v10 currentFlipBookEntry:__b]
    && ((__b[4] & 1) != 0 || (__b[56] & 1) != 0))
  {
    if (v10->super._logHandle)
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      if (__b[56]) {
        SEL v3 = "set";
      }
      else {
        SEL v3 = "not set";
      }
      __os_log_helper_16_2_4_4_0_8_0_8_0_8_32((uint64_t)v11, *(int *)__b, COERCE__INT64(*(float *)&__b[61]), COERCE__INT64(*(float *)&__b[57]), (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Get last update applied[%d] Twilight Lux = %f (Twilight strength = %f (%s))", v11, 0x26u);
    }
    return *(float *)&__b[61];
  }
  return v8;
}

- (float)currentAmmoliteLux
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = self;
  SEL v9 = a2;
  float v8 = 0.0;
  [*(id *)&self->_currentDisplayNits lux];
  float v8 = v2;
  memset(__b, 0, sizeof(__b));
  if ([(CBAODTransitionController *)v10 currentFlipBookEntry:__b]
    && ((__b[4] & 1) != 0 || (__b[65] & 1) != 0))
  {
    if (v10->super._logHandle)
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      if (__b[65]) {
        SEL v3 = "set";
      }
      else {
        SEL v3 = "not set";
      }
      __os_log_helper_16_2_4_4_0_8_0_8_0_8_32((uint64_t)v11, *(int *)__b, COERCE__INT64(*(float *)&__b[70]), COERCE__INT64(*(float *)&__b[66]), (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Get last update applied[%d] Ammolite Lux = %f (Ammolite strength = %f (%s))", v11, 0x26u);
    }
    return *(float *)&__b[70];
  }
  return v8;
}

- (void)setDurationOfEDRRamp:(float)a3
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v7, COERCE__INT64(a3));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "setDurationOfEDRRamp = %f", v7, 0xCu);
  }
  self->_edrRampDurationPerStop = a3;
}

- (void)setDisplayON:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3;
  if ((BYTE1(self->_targetWhitepoint.matrix[2][0]) & 1) != a3)
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
      if (v6) {
        SEL v3 = "ON";
      }
      else {
        SEL v3 = "OFF";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Display is %s", v8, 0xCu);
    }
    BYTE1(self->_targetWhitepoint.matrix[2][0]) = v6;
  }
}

- (void)setInitialState:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "Initial state = %@", v19, 0xCu);
  }
  if (self->_currentState) {

  }
  self->_currentState = a3;
  -[CBAODTransitionController getFloatValueFrom:key:subkey:](self, "getFloatValueFrom:key:subkey:", a3);
  self->_targetEDRHeadroom = v3;
  self->_currentEDRHeadroom = v3;
  [(CBAODTransitionController *)self getFloatValueFrom:a3 key:@"DisplayBrightness" subkey:@"NitsSDR"];
  self->_float currentSDRBrightness = v4;
  self->_targetSDRBrightness = -1.0;
  [(CBAODTransitionController *)self getFloatValueFrom:a3 key:@"DisplayPanelLuminanceMin"];
  self->_minNits = v5;
  [(CBAODTransitionController *)self getFloatValueFrom:a3 key:@"DisplayPanelLuminanceMax"];
  self->_maxNits = v6;
  if (self->super._logHandle)
  {
    uint64_t v12 = self->super._logHandle;
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
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v18, COERCE__INT64(self->_minNits), COERCE__INT64(self->_maxNits));
    _os_log_impl(&dword_1BA438000, v12, OS_LOG_TYPE_DEFAULT, "Panel luminance: Nits min = %f, max = %f", v18, 0x16u);
  }
  [(CBAODTransitionController *)self processInitialColorMatrixFromState:a3];
  [(CBAODTransitionController *)self getFloatValueFrom:a3 key:@"DisplayAAPFactor"];
  self->_currentAAPFactor = v7;
  self->_targetAAPFactor = -1.0;
  [(CBAODTransitionController *)self getFloatValueFrom:a3 key:@"DisplayBrightness" subkey:@"NitsCap"];
  self->_currentBrightnessLimit = v8;
  self->_targetBrightnessLimit = -1.0;
  if (self->super._logHandle)
  {
    uint64_t v10 = self->super._logHandle;
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
    __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v17, COERCE__INT64(self->_currentSDRBrightness), COERCE__INT64(self->_currentEDRHeadroom), COERCE__INT64(self->_currentAAPFactor), COERCE__INT64(self->_currentBrightnessLimit));
    _os_log_impl(&dword_1BA438000, v10, OS_LOG_TYPE_DEFAULT, "Normal mode SDR brightness = %f; EDR headroom = %f; AAP factor = %f; nitsCap = %f",
      v17,
      0x2Au);
  }
}

- (BOOL)startTransition:(id)a3 length:(float)a4 forceUpdate:(BOOL)a5 rampDoneCallback:(id)a6 rampCanceledCallback:(id)a7
{
  os_log_type_t v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  float v13 = a4;
  BOOL v12 = a5;
  id v11 = a6;
  id v10 = a7;
  memset(__b, 0, sizeof(__b));
  LOBYTE(__b[0]) = v12;
  if (v13 >= 0.0)
  {
    HIBYTE(__b[0]) = 1;
    *(float *)&__b[1] = v13;
  }
  memcpy(__dst, __b, sizeof(__dst));
  return [(CBAODTransitionController *)v16 startTransition:v14 transitionParameters:__dst rampDoneCallback:v11 rampCanceledCallback:v10];
}

- (BOOL)startTransition:(id)a3 transitionParameters:(id *)a4 rampDoneCallback:(id)a5 rampCanceledCallback:(id)a6
{
  uint64_t v186 = *MEMORY[0x1E4F143B8];
  v169 = self;
  SEL v168 = a2;
  id v167 = a3;
  v166 = a4;
  aBlock = a5;
  v164 = a6;
  char v163 = 0;
  BOOL var0 = 0;
  BOOL var0 = a4->var0;
  -[CBAODTransitionController getFloatValueFrom:key:subkey:](self, "getFloatValueFrom:key:subkey:", a3);
  float v161 = v6;
  [(CBAODTransitionController *)v169 getFloatValueFrom:v167 key:@"DisplayBrightness" subkey:@"NitsSDR"];
  float v160 = v7;
  [(CBAODTransitionController *)v169 getFloatValueFrom:v167 key:@"DisplayBrightness" subkey:@"NitsCap"];
  float v159 = v8;
  [(CBAODTransitionController *)v169 getFloatValueFrom:v167 key:@"DisplayAAPFactor"];
  float v158 = v9;
  uint64_t v157 = 36;
  uint64_t v156 = 36;
  size_t __n = 36;
  memcpy(__dst, &identityMatrix, sizeof(__dst));
  [v167 objectForKey:@"ColorRamp"];
  objc_opt_class();
  char v154 = objc_opt_isKindOfClass() & 1;
  if (v154) {
    [(CBAODTransitionController *)v169 colorMatrix:__dst fromState:v167];
  }
  [+[CBAODState sharedInstance] nitsCap];
  float v153 = v10;
  if (v10 > 0.0 && v160 > v153)
  {
    os_log_t oslog = 0;
    if (v169->super._logHandle)
    {
      logHandle = v169->super._logHandle;
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
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v184, COERCE__INT64(v160), COERCE__INT64(v153));
      _os_log_impl(&dword_1BA438000, oslog, type, "Capping target SDR brightness %f -> %f", v184, 0x16u);
    }
    float v160 = v153;
  }
  if ([+[CBAODState sharedInstance] AODState] != 4)
  {
    [+[CBAODState sharedInstance] maxAODNits];
    float v159 = std::__math::fmin[abi:ne180100](v159, v11);
  }
  if (v169->_targetWhitepoint.matrix[2][1] >= 0.0) {
    float v160 = v169->_targetWhitepoint.matrix[2][1];
  }
  [(CBAODTransitionController *)v169 getFloatValueFrom:v167 key:@"TrustedLux"];
  v169->_float currentTrustedLux = v12;
  if (v161 < 1.0)
  {
    os_log_t v150 = 0;
    os_log_t v150 = (os_log_t)v169->super._logHandle;
    os_log_type_t v149 = OS_LOG_TYPE_FAULT;
    if (os_log_type_enabled(v150, OS_LOG_TYPE_FAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v183, COERCE__INT64(v161));
      _os_log_fault_impl(&dword_1BA438000, v150, v149, "Unexpected EDR Headroom target in AOD = %f < 1", v183, 0xCu);
    }
    float v161 = 1.0;
  }
  char v148 = 0;
  char v147 = 0;
  BOOL v146 = 0;
  BOOL v146 = v161 < v169->_targetEDRHeadroom;
  char v145 = 0;
  char v144 = 0;
  char v143 = 0;
  char v142 = 0;
  char v141 = 0;
  if (SLODWORD(v160) != SLODWORD(v169->_targetSDRBrightness) || var0) {
    char v148 = 1;
  }
  if (SLODWORD(v159) != SLODWORD(v169->_targetBrightnessLimit) || var0) {
    char v144 = 1;
  }
  if ((v154 & 1) != 0
    && ([(CBAODTransitionController *)v169 shallUpdateWhitepointFrom:v169->_currentWhitepoint.matrix[2] target:__dst]|| var0))
  {
    char v147 = 1;
  }
  if (COERCE_INT(v158 * 100.0) != COERCE_INT(v169->_targetAAPFactor * 100.0)) {
    char v145 = 1;
  }
  if (*(void *)&v169->_liveUpdatesOverride)
  {
    v122 = *(void **)&v169->_liveUpdatesOverride;
    [v122 targetLux];
    if (objc_msgSend(v122, "shouldRampFromStartLux:toTargetLux:"))
    {
      *(float *)&double v13 = v160;
      if (([*(id *)&v169->_liveUpdatesOverride nitsAreInActiveRange:v13] & 1) != 0
        || (*(float *)&double v14 = v169->_targetSDRBrightness,
            ([*(id *)&v169->_liveUpdatesOverride nitsAreInActiveRange:v14] & 1) != 0))
      {
        char v142 = 1;
      }
    }
  }
  if (*(void *)&v169->_currentDisplayNits)
  {
    v121 = *(void **)&v169->_currentDisplayNits;
    [v121 targetLux];
    if (objc_msgSend(v121, "shouldRampFromStartLux:toTargetLux:"))
    {
      *(float *)&double v15 = v160;
      if (([*(id *)&v169->_currentDisplayNits nitsAreInActiveRange:v15] & 1) != 0
        || (*(float *)&double v16 = v169->_targetSDRBrightness,
            ([*(id *)&v169->_currentDisplayNits nitsAreInActiveRange:v16] & 1) != 0))
      {
        char v141 = 1;
      }
    }
  }
  if ((CBU_RampLumaBoostFactorInAOD() & 1) != 0
    && ([+[CBAODState sharedInstance] AODState] == 3
     || [+[CBAODState sharedInstance] AODState] == 4))
  {
    char v143 = 1;
  }
  char v140 = 0;
  char v120 = 1;
  if ((v148 & 1) == 0)
  {
    char v120 = 1;
    if ((v145 & 1) == 0)
    {
      char v120 = 1;
      if ((v147 & 1) == 0)
      {
        char v120 = 1;
        if (!v146) {
          char v120 = v143;
        }
      }
    }
  }
  char v140 = v120;
  char v119 = 1;
  if ((v120 & 1) == 0)
  {
    char v119 = 1;
    if ((v142 & 1) == 0) {
      char v119 = v141;
    }
  }
  char v140 = v119;
  if ((v119 & 1) != 0 && (BYTE1(v169->_targetWhitepoint.matrix[2][0]) & 1) == 0)
  {
    os_log_t v139 = 0;
    if (v169->super._logHandle)
    {
      v118 = v169->super._logHandle;
    }
    else
    {
      uint64_t v117 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      v118 = v117;
    }
    os_log_t v139 = v118;
    os_log_type_t v138 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v182, (uint64_t)v167);
      _os_log_error_impl(&dword_1BA438000, v139, v138, "Display is OFF -> discard AOD update %@", v182, 0xCu);
    }
  }
  if ((v140 & 1) == 0 || (BYTE1(v169->_targetWhitepoint.matrix[2][0]) & 1) == 0) {
    goto LABEL_277;
  }
  [+[CBAODState sharedInstance] acquirePowerAssertion];
  memcpy(v137, a4, 0x30uLL);
  [(CBAODTransitionController *)v169 logTransitionParameters:v137];
  if (!*(void *)&v169->_currentFlipBookEntry.reserved[4])
  {
LABEL_82:
    [(CBAODTransitionController *)v169 cancelTransition];
    if (v169->_rampDoneCallback)
    {
      _Block_release(v169->_rampDoneCallback);
      v169->_rampDoneCallback = 0;
    }
    if (aBlock)
    {
      uint64_t v20 = _Block_copy(aBlock);
      v169->_rampDoneCallback = v20;
    }
    if (v169->_rampCanceledCallback)
    {
      _Block_release(v169->_rampCanceledCallback);
      v169->_rampCanceledCallback = 0;
    }
    if (v164)
    {
      v21 = _Block_copy(v164);
      v169->_rampCanceledCallback = v21;
    }
    if ((v148 & 1) == 0 && v169->_currentSDRBrightness != v160) {
      char v148 = 1;
    }
    if ((v144 & 1) == 0 && v169->_currentBrightnessLimit != v159) {
      char v148 = 1;
    }
    if ((v154 & 1) != 0
      && (v147 & 1) == 0
      && [(CBAODTransitionController *)v169 shallUpdateWhitepointFrom:&v169->_thresholdModule target:__dst])
    {
      char v147 = 1;
    }
    if ((v145 & 1) == 0 && COERCE_INT(v158 * 1000.0) != COERCE_INT(v169->_currentAAPFactor * 1000.0)) {
      char v145 = 1;
    }
    if ((v142 & 1) == 0)
    {
      if (*(void *)&v169->_liveUpdatesOverride)
      {
        v114 = *(void **)&v169->_liveUpdatesOverride;
        [v114 lux];
        if (objc_msgSend(v114, "shouldRampFromStartLux:toTargetLux:"))
        {
          *(float *)&double v22 = v160;
          if (([*(id *)&v169->_liveUpdatesOverride nitsAreInActiveRange:v22] & 1) != 0
            || (*(float *)&double v23 = v169->_targetSDRBrightness,
                ([*(id *)&v169->_liveUpdatesOverride nitsAreInActiveRange:v23] & 1) != 0))
          {
            char v142 = 1;
          }
        }
      }
    }
    if ((v141 & 1) == 0)
    {
      if (*(void *)&v169->_currentDisplayNits)
      {
        v113 = *(void **)&v169->_currentDisplayNits;
        [v113 lux];
        if (objc_msgSend(v113, "shouldRampFromStartLux:toTargetLux:"))
        {
          *(float *)&double v24 = v160;
          if (([*(id *)&v169->_currentDisplayNits nitsAreInActiveRange:v24] & 1) != 0
            || (*(float *)&double v25 = v169->_targetSDRBrightness,
                ([*(id *)&v169->_currentDisplayNits nitsAreInActiveRange:v25] & 1) != 0))
          {
            char v141 = 1;
          }
        }
      }
    }
    v169->_currentFrequency = 60;
    HIDWORD(v26) = 0;
    if (a4->var3)
    {
      float var4 = a4->var4;
    }
    else
    {
      *(float *)&double v26 = v169->_currentSDRBrightness;
      *(float *)&double v18 = v160;
      [(CBAODTransitionController *)v169 transitionDurationFromCurrent:v26 toTarget:v18];
      float var4 = v27;
    }
    if (a4->var5) {
      float var6 = a4->var6;
    }
    else {
      float var6 = var4;
    }
    if (a4->var7) {
      float var8 = a4->var8;
    }
    else {
      float var8 = var4;
    }
    float v135 = var8;
    if (a4->var9) {
      float var10 = a4->var10;
    }
    else {
      float var10 = var4;
    }
    if (a4->var5) {
      float var14 = a4->var14;
    }
    else {
      float var14 = var4;
    }
    float v134 = var14;
    if (a4->var11) {
      float var12 = a4->var12;
    }
    else {
      float var12 = var4;
    }
    float v133 = var12;
    if (a4->var3)
    {
      float v107 = a4->var4;
    }
    else
    {
      [*(id *)&v169->_liveUpdatesOverride aodRampDuration];
      float v107 = v28;
    }
    HIDWORD(v29) = 0;
    if (a4->var3)
    {
      float v106 = a4->var4;
    }
    else
    {
      [*(id *)&v169->_currentDisplayNits aodRampDuration];
      float v106 = *(float *)&v29;
    }
    if (v148)
    {
      *(float *)&double v29 = v160;
      *(float *)&double v18 = v159;
      *(float *)&double v19 = v169->_currentTrustedLux;
      [*(id *)&v169->_currentFlipBookEntry.ammoliteLux updateALSThresholdsWithBrightness:v29 brightnessLimit:v18 lux:v19];
      v169->_targetSDRBrightness = v160;
      if (v169->super._logHandle)
      {
        v105 = v169->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v104 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v104 = init_default_corebrightness_log();
        }
        v105 = v104;
      }
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v180, COERCE__INT64(v169->_currentSDRBrightness), COERCE__INT64(v160), COERCE__INT64(var6), COERCE__INT64(v169->_currentTrustedLux));
        _os_log_impl(&dword_1BA438000, v105, OS_LOG_TYPE_DEFAULT, "[AOD update] Update target with SDRBrightness %f -> %f, Length = %f, Lux = %f", v180, 0x2Au);
      }
      if ([+[CBAODState sharedInstance] AODState] == 3
        && v160 > v169->_currentSDRBrightness)
      {
        if (v169->super._logHandle)
        {
          v103 = v169->super._logHandle;
        }
        else
        {
          uint64_t v102 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
          v103 = v102;
        }
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_2_8_0_8_0((uint64_t)v179, COERCE__INT64(v169->_currentSDRBrightness), COERCE__INT64(v160));
          _os_log_error_impl(&dword_1BA438000, v103, OS_LOG_TYPE_ERROR, "SDR brightness is ramping up during AOD enter transition %f -> %f", v179, 0x16u);
        }
      }
      if ([+[CBAODState sharedInstance] AODState] == 4
        && v160 < v169->_currentSDRBrightness)
      {
        if (v169->super._logHandle)
        {
          v101 = v169->super._logHandle;
        }
        else
        {
          uint64_t v100 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
          v101 = v100;
        }
        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_2_8_0_8_0((uint64_t)v178, COERCE__INT64(v169->_currentSDRBrightness), COERCE__INT64(v160));
          _os_log_error_impl(&dword_1BA438000, v101, OS_LOG_TYPE_ERROR, "SDR brightness is ramping down during AOD exit transition %f -> %f", v178, 0x16u);
        }
      }
    }
    if (v147)
    {
      if (!a4->var7 && !a4->var3)
      {
        float currentTrustedLux = v169->_currentTrustedLux;
        [+[CBAODState sharedInstance] whitepointTransitionLengthLuxThreshold];
        float v30 = *(float *)&v31;
        *(float *)&double v31 = currentTrustedLux;
        if (currentTrustedLux <= v30) {
          [+[CBAODState sharedInstance] whitepointTransitionLengthLowLux];
        }
        else {
          [+[CBAODState sharedInstance] whitepointTransitionLength];
        }
        float v135 = v32;
      }
      [(CBAODTransitionController *)v169 setTargetWhitepointFromMatrix:__dst];
      if (v169->super._logHandle)
      {
        v98 = v169->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v97 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v97 = init_default_corebrightness_log();
        }
        v98 = v97;
      }
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v177, COERCE__INT64(v169->_currentWhitepoint.matrix[1][0]), COERCE__INT64(v169->_currentWhitepoint.matrix[1][1]), COERCE__INT64(v169->_targetWhitepoint.matrix[1][0]), COERCE__INT64(v169->_targetWhitepoint.matrix[1][1]), COERCE__INT64(v135));
        _os_log_impl(&dword_1BA438000, v98, OS_LOG_TYPE_DEFAULT, "[AOD update] Update target with Whitepoint (%f;%f) -> (%f;%f), Length = %f",
          v177,
          0x34u);
      }
    }
    if (v145)
    {
      if (v169->super._logHandle)
      {
        v96 = v169->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v95 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v95 = init_default_corebrightness_log();
        }
        v96 = v95;
      }
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v176, COERCE__INT64(v169->_currentAAPFactor), COERCE__INT64(v158), COERCE__INT64(var10));
        _os_log_impl(&dword_1BA438000, v96, OS_LOG_TYPE_DEFAULT, "[AOD update] Update target with AAPFactor %f -> %f, Length = %f", v176, 0x20u);
      }
      v169->_targetAAPFactor = v158;
    }
    if (v146)
    {
      if (!a4->var11)
      {
        *(float *)&double v29 = v169->_currentEDRHeadroom;
        *(float *)&double v18 = v161;
        *(float *)&double v19 = v169->_edrRampDurationPerStop;
        +[CBEDR overallRampDuration:v29 target:v18 durationPerStop:v19];
        float v133 = *(float *)&v29;
      }
      float v134 = fmaxf(v133, var14);
    }
    if (v144)
    {
      v169->_targetBrightnessLimit = v159;
      if (v169->super._logHandle)
      {
        v94 = v169->super._logHandle;
      }
      else
      {
        uint64_t v93 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v94 = v93;
      }
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v175, COERCE__INT64(v169->_currentBrightnessLimit), COERCE__INT64(v169->_targetBrightnessLimit), COERCE__INT64(v134));
        _os_log_impl(&dword_1BA438000, v94, OS_LOG_TYPE_DEFAULT, "[AOD update] Update target with brightness limit %f -> %f, Length = %f", v175, 0x20u);
      }
    }
    if (v142)
    {
      *(float *)&double v29 = v169->_currentTrustedLux;
      [*(id *)&v169->_liveUpdatesOverride handleLuxUpdate:v29];
      if (v169->super._logHandle)
      {
        v92 = v169->super._logHandle;
      }
      else
      {
        uint64_t v91 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v92 = v91;
      }
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        [*(id *)&v169->_liveUpdatesOverride lux];
        *(double *)&uint64_t v90 = v33;
        [*(id *)&v169->_liveUpdatesOverride targetLux];
        __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v174, v90, COERCE__INT64(v34), COERCE__INT64(v169->_currentSDRBrightness), COERCE__INT64(v160), COERCE__INT64(v107));
        _os_log_impl(&dword_1BA438000, v92, OS_LOG_TYPE_DEFAULT, "[AOD update] Update target with Twilight lux %f -> %f, nits %f -> %f, Length = %f", v174, 0x34u);
      }
    }
    if (v141)
    {
      *(float *)&double v29 = v169->_currentTrustedLux;
      [*(id *)&v169->_currentDisplayNits handleLuxUpdate:v29];
      if (v169->super._logHandle)
      {
        v89 = v169->super._logHandle;
      }
      else
      {
        uint64_t v88 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v89 = v88;
      }
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        [*(id *)&v169->_currentDisplayNits lux];
        *(double *)&uint64_t v87 = v35;
        [*(id *)&v169->_currentDisplayNits targetLux];
        __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v173, v87, COERCE__INT64(v36), COERCE__INT64(v169->_currentSDRBrightness), COERCE__INT64(v160), COERCE__INT64(v106));
        _os_log_impl(&dword_1BA438000, v89, OS_LOG_TYPE_DEFAULT, "[AOD update] Update target with Ammolite lux %f -> %f, nits %f -> %f, Length = %f", v173, 0x34u);
      }
    }
    if ([(CBRampManager *)v169->_rampManager liveUpdates])
    {
      *(float *)&double v37 = v169->_currentTrustedLux;
      [(CBAODTransitionController *)v169 updateAmbient:v37];
    }
    else
    {

      *(void *)&v169->_currentFlipBookEntry.ammoliteStrength_set = 0;
      *(float *)&double v38 = fmaxf(fmaxf(fmaxf(var6, v134), var10), v135);
      *(float *)&double v39 = v169->_currentTrustedLux;
      [(CBAODTransitionController *)v169 initialiseFlipBookWithLength:v169->_currentFrequency frequency:v38 lux:v39];
    }
    id v132 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v148)
    {
      *(float *)&double v40 = var6;
      *(float *)&double v41 = (float)v169->_currentFrequency;
      *(float *)&double v42 = v169->_currentSDRBrightness;
      *(float *)&double v43 = v160;
      id v131 = [(CBAODTransitionController *)v169 copyRampStatsWithLength:v40 frequency:v41 origin:v42 target:v43];
      if (v131)
      {
        [v132 setObject:v131 forKeyedSubscript:@"SDRRampStats"];
      }
      if ([+[CBAODState sharedInstance] AODState] == 3
        || [+[CBAODState sharedInstance] AODState] == 4)
      {
        uint64_t v130 = [+[CBAODState sharedInstance] AODTransitionProfile];
        if (v169->super._logHandle)
        {
          v86 = v169->super._logHandle;
        }
        else
        {
          uint64_t v85 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
          v86 = v85;
        }
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v172, v130);
          _os_log_impl(&dword_1BA438000, v86, OS_LOG_TYPE_DEFAULT, "AOD enter / exit - use specific profile (%lu) for animation", v172, 0xCu);
        }
      }
      *(float *)&double v44 = v169->_currentSDRBrightness;
      *(float *)&double v45 = v160;
      *(float *)&double v46 = var6;
      *(float *)&double v47 = (float)v169->_currentFrequency;
      -[CBRampManager insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:](v169->_rampManager, "insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:", 0, @"SDR_RAMP", v44, v45, v46, v47);
      if (a4->var2)
      {
        *(float *)&double v40 = v169->_currentSDRBrightness;
        [(CBAODTransitionController *)v169 commitBrightness:1 force:v40];
      }
    }
    if (v144)
    {
      *(float *)&double v40 = v169->_currentBrightnessLimit;
      *(float *)&double v41 = v169->_targetBrightnessLimit;
      *(float *)&double v42 = v134;
      *(float *)&double v43 = (float)v169->_currentFrequency;
      -[CBRampManager insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:](v169->_rampManager, "insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:", 0, @"BRIGHTNESS_LIMIT_RAMP", v40, v41, v42, v43);
    }
    if ((v147 & 1) != 0
      && (CFXSetTarget((uint64_t)v169->_flipbookCache, v169->_currentWhitepoint.matrix[2], 1, 1, v135, 1.0) & 1) != 0)
    {
      *(float *)&double v40 = v135;
      *(float *)&double v41 = (float)v169->_currentFrequency;
      LODWORD(v43) = HIDWORD(*(void *)&v169->_currentWhitepoint.matrix[1][0]);
      LODWORD(v42) = *(void *)&v169->_currentWhitepoint.matrix[1][0];
      LODWORD(v49) = HIDWORD(*(void *)&v169->_targetWhitepoint.matrix[1][0]);
      LODWORD(v48) = *(void *)&v169->_targetWhitepoint.matrix[1][0];
      id v129 = -[CBAODTransitionController copyColourRampStatsWithLength:frequency:origin:target:](v169, "copyColourRampStatsWithLength:frequency:origin:target:", v40, v41, v42, v43, v48, v49);
      if (v129)
      {
        [v132 setObject:v129 forKeyedSubscript:@"ColourRampStats"];
      }
      *(float *)&double v51 = v135;
      *(float *)&double v52 = (float)v169->_currentFrequency;
      LODWORD(v50) = 1.0;
      [(CBRampManager *)v169->_rampManager insertNewLinearRampOrigin:0 target:@"COLOR_RAMP" length:0.0 frequency:v50 startRamp:v51 identifier:v52];
    }
    if (v146)
    {
      *(float *)&double v40 = v133;
      *(float *)&double v42 = v169->_currentEDRHeadroom;
      *(float *)&double v43 = v161;
      LODWORD(v41) = 1123024896;
      id v128 = [(CBAODTransitionController *)v169 copyRampStatsWithLength:v40 frequency:v41 origin:v42 target:v43];
      if (v128)
      {
        [v132 setObject:v128 forKeyedSubscript:@"EDRRampStats"];
      }
      if (v169->super._logHandle)
      {
        v84 = v169->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v83 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v83 = init_default_corebrightness_log();
        }
        v84 = v83;
      }
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v171, COERCE__INT64(v169->_currentEDRHeadroom), COERCE__INT64(v161), COERCE__INT64(v133));
        _os_log_impl(&dword_1BA438000, v84, OS_LOG_TYPE_DEFAULT, "[AOD update] Update target with EDR %f -> %f, length = %f", v171, 0x20u);
      }
      v169->_targetEDRHeadroom = v161;
      *(float *)&double v53 = v169->_currentEDRHeadroom;
      *(float *)&double v54 = v161;
      *(float *)&double v55 = v133;
      LODWORD(v56) = 1123024896;
      [(CBRampManager *)v169->_rampManager insertNewRampOrigin:0 target:@"EDR_RAMP" length:&__block_literal_global_13 frequency:v53 startRamp:v54 identifier:v55 progressCallback:v56];
    }
    if (v145)
    {
      *(float *)&double v40 = var10;
      *(float *)&double v41 = (float)v169->_currentFrequency;
      *(float *)&double v42 = v169->_currentAAPFactor;
      *(float *)&double v43 = v158;
      id v127 = [(CBAODTransitionController *)v169 copyRampStatsWithLength:v40 frequency:v41 origin:v42 target:v43];
      if (v127)
      {
        [v132 setObject:v127 forKeyedSubscript:@"AAPRampStats"];
      }
      *(float *)&double v57 = v169->_currentAAPFactor;
      *(float *)&double v58 = v158;
      *(float *)&double v59 = var10;
      *(float *)&double v60 = (float)v169->_currentFrequency;
      [(CBRampManager *)v169->_rampManager insertNewLinearRampOrigin:0 target:@"AAP_RAMP" length:v57 frequency:v58 startRamp:v59 identifier:v60];
    }
    if (v143)
    {
      float v126 = 0.0;
      if ([+[CBAODState sharedInstance] AODState] == 3) {
        float v126 = 1.0;
      }
      *(float *)&double v61 = v169->_currentLumaBoostFactor;
      *(float *)&double v62 = v126;
      *(float *)&double v63 = var4;
      *(float *)&double v64 = (float)v169->_currentFrequency;
      [(CBRampManager *)v169->_rampManager insertNewLinearRampOrigin:@"LUMA_BOOST_FACTOR_RAMP" target:v61 length:v62 frequency:v63 identifier:v64];
    }
    if (v142)
    {
      rampManager = v169->_rampManager;
      [*(id *)&v169->_liveUpdatesOverride lux];
      int v82 = v65;
      [*(id *)&v169->_liveUpdatesOverride targetLux];
      LODWORD(v67) = v66;
      LODWORD(v68) = v82;
      *(float *)&double v69 = v107;
      *(float *)&double v70 = (float)v169->_currentFrequency;
      -[CBRampManager insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:](rampManager, "insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:", 0, @"TWILIGHT_RAMP", v68, v67, v69, v70);
    }
    if (v141)
    {
      v79 = v169->_rampManager;
      [*(id *)&v169->_currentDisplayNits lux];
      int v80 = v71;
      [*(id *)&v169->_currentDisplayNits targetLux];
      LODWORD(v73) = v72;
      LODWORD(v74) = v80;
      *(float *)&double v75 = v106;
      *(float *)&double v76 = (float)v169->_currentFrequency;
      -[CBRampManager insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:](v79, "insertNewRampOrigin:target:length:frequency:startRamp:identifier:progressCallback:", 0, @"AMMOLITE_RAMP", v74, v73, v75, v76);
    }
    [(CBRampManager *)v169->_rampManager startRamps];
    v169->_targetWhitepoint.xy.y = 0.0;
    if (![(CBRampManager *)v169->_rampManager liveUpdates]) {
      uint64_t v77 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v77 = MEMORY[0x1E4F1CC28];
    }
    [v132 setObject:v77 forKeyedSubscript:@"isFlipbookActive"];
    [(CBAODTransitionController *)v169 sendNotificationForKey:@"AODRampTelemetry" andValue:v132];

    char v163 = 1;
LABEL_277:
    char v170 = v163 & 1;
    return v170 & 1;
  }
  if (v169->_pendingState)
  {

    v169->_pendingState = 0;
  }
  if (var0)
  {
    [(CBAODTransitionController *)v169 releaseLastUpdateSwappedTimer];
    goto LABEL_82;
  }
  id v17 = v167;
  v169->_pendingState = v17;
  if (v169->super._logHandle)
  {
    v116 = v169->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v115 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v115 = init_default_corebrightness_log();
    }
    v116 = v115;
  }
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v181, COERCE__INT64(v160));
    _os_log_impl(&dword_1BA438000, v116, OS_LOG_TYPE_DEFAULT, "Last update was not swapped on the display -> pending update with Nits = %f", v181, 0xCu);
  }
  char v170 = 0;
  return v170 & 1;
}

uint64_t __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sdrBrightnessProgressCallback:rampContext:profile:", a2, *(void *)(a1 + 40), a3, a1, a2);
}

uint64_t __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke_2(uint64_t a1, uint64_t a2, double a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sdrBrightnessProgressCallback:rampContext:", a2, a3, a1, a2);
}

uint64_t __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke_3(uint64_t a1, uint64_t a2, double a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "brightnessLimitProgressCallback:rampContext:", a2, a3, a1, a2);
}

uint64_t __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke_146(float a1, uint64_t a2, void *a3)
{
  [a3 originalValue];
  int v9 = v3;
  [a3 targetValue];
  LODWORD(v5) = v4;
  LODWORD(v6) = v9;
  *(float *)&double v7 = a1;
  return +[CBEDR animatedHeadroomForOrigin:v6 target:v5 andProgress:v7];
}

uint64_t __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke_2_159(uint64_t a1, double a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 400) lux];
}

uint64_t __104__CBAODTransitionController_startTransition_transitionParameters_rampDoneCallback_rampCanceledCallback___block_invoke_3_163(uint64_t a1, double a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) lux];
}

- (id)copyColourRampStatsWithLength:(float)a3 frequency:(float)a4 origin:(id)a5 target:(id)a6
{
  $94F468A8D4C62B317260615823C2B210 v40 = a5;
  $94F468A8D4C62B317260615823C2B210 v39 = a6;
  double v38 = self;
  SEL v37 = a2;
  float v36 = a3;
  float v35 = a4;
  unint64_t v21 = 0x1E4F28000uLL;
  id v6 = objc_alloc(NSNumber);
  *(float *)&double v7 = v36;
  id v34 = (id)[v6 initWithFloat:v7];
  id v8 = objc_alloc(NSNumber);
  *(float *)&double v9 = v35;
  id v33 = (id)[v8 initWithFloat:v9];
  id v32 = (id)[objc_alloc(NSNumber) initWithInt:(float)(v35 * v36)];
  id v10 = objc_alloc(NSNumber);
  *(float *)&double v11 = v40.var0;
  id v31 = (id)[v10 initWithFloat:v11];
  id v12 = objc_alloc(NSNumber);
  *(float *)&double v13 = v40.var1;
  id v30 = (id)[v12 initWithFloat:v13];
  id v14 = objc_alloc(NSNumber);
  *(float *)&double v15 = v39.var0;
  id v29 = (id)[v14 initWithFloat:v15];
  id v16 = objc_alloc(NSNumber);
  *(float *)&double v17 = v39.var1;
  id v28 = (id)[v16 initWithFloat:v17];
  id v27 = 0;
  unint64_t v24 = 0x1E4F1C000uLL;
  double v22 = @"X";
  double v23 = @"Y";
  id v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v31, @"X", v30, @"Y", 0);
  id v26 = 0;
  id v18 = objc_alloc(*(Class *)(v24 + 2536));
  id v26 = (id)objc_msgSend(v18, "initWithObjectsAndKeys:", v29, v22, v28, v23, 0);
  double v25 = 0;
  id v19 = objc_alloc(*(Class *)(v24 + 2536));
  double v25 = objc_msgSend(v19, "initWithObjectsAndKeys:", v27, @"RampOrigin", v26, @"RampTarget", v34, @"RampLength", v33, @"RampFrequency", v32, @"NumberOfUpdates", 0);

  return v25;
}

- (id)copyRampStatsWithLength:(float)a3 frequency:(float)a4 origin:(float)a5 target:(float)a6
{
  id v27 = self;
  SEL v26 = a2;
  float v25 = a3;
  float v24 = a4;
  float v23 = a5;
  float v22 = a6;
  unint64_t v15 = 0x1E4F28000uLL;
  id v6 = objc_alloc(NSNumber);
  *(float *)&double v7 = v25;
  id v21 = (id)[v6 initWithFloat:v7];
  id v8 = objc_alloc(NSNumber);
  *(float *)&double v9 = v24;
  id v20 = (id)[v8 initWithFloat:v9];
  id v19 = (id)[objc_alloc(NSNumber) initWithInt:(float)(v24 * v25)];
  id v10 = objc_alloc(NSNumber);
  *(float *)&double v11 = v23;
  id v18 = (id)[v10 initWithFloat:v11];
  id v12 = objc_alloc(NSNumber);
  *(float *)&double v13 = v22;
  id v17 = (id)[v12 initWithFloat:v13];
  id v16 = 0;
  id v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v18, @"RampOrigin", v17, @"RampTarget", v21, @"RampLength", v20, @"RampFrequency", v19, @"NumberOfUpdates", 0);

  return v16;
}

- (BOOL)cancelTransition
{
  v112 = &v127;
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  BOOL v146 = self;
  SEL v145 = a2;
  BOOL v144 = 0;
  v113 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
  [(CBRampManager *)self->_rampManager remainingLength];
  v146->_targetWhitepoint.xy.y = v2;
  BOOL v3 = [(CBAODTransitionController *)v146 requestTransitionStopForIdentifier:@"SDR_RAMP"];
  int v111 = 1;
  BOOL v144 = v144 || v3;
  char v4 = [(id)v112[42] requestTransitionStopForIdentifier:@"BRIGHTNESS_LIMIT_RAMP"];
  BOOL v144 = (v144 | v4 & 1) != 0;
  char v5 = [(id)v112[42] requestTransitionStopForIdentifier:@"EDR_RAMP"];
  BOOL v144 = (v144 | v5 & 1) != 0;
  char v6 = [(id)v112[42] requestTransitionStopForIdentifier:@"AAP_RAMP"];
  BOOL v144 = (v144 | v6 & 1) != 0;
  char v7 = [(id)v112[42] requestTransitionStopForIdentifier:@"LUMA_BOOST_FACTOR_RAMP"];
  BOOL v144 = (v144 | v7 & 1) != 0;
  char v8 = [(id)v112[42] requestTransitionStopForIdentifier:@"TWILIGHT_RAMP"];
  BOOL v144 = (v144 | v8 & 1) != 0;
  char v9 = [(id)v112[42] requestTransitionStopForIdentifier:@"AMMOLITE_RAMP"];
  BOOL v144 = (v144 | v9 & 1) != 0;
  char v10 = [(id)v112[42] requestColorRampTransitionStop];
  BOOL v144 = (v144 | v10 & 1) != 0;
  if (([*(id *)(v112[42] + v113[587]) liveUpdates] & 1) == 0)
  {
    char v11 = [(id)v112[42] cancelDCPTransition];
    id v12 = v112;
    BOOL v144 = (v144 | v11 & 1) != 0;
    *((_DWORD *)v112 + 80) = 0;
    int v13 = [(id)v12[42] currentTransitionUpdateID];
    id v14 = v112;
    *((_DWORD *)v112 + 80) = v13;
    if (*((_DWORD *)v14 + 80) == -1)
    {
      if (*(void *)(v112[42] + 248))
      {
        memset(__b, 0, 0x4CuLL);
        id v110 = *(id *)(v112[42] + 248);
        if (v110) {
          [v110 origin];
        }
        else {
          memset(__b, 0, 0x4CuLL);
        }
        id v109 = *(id *)(v112[42] + 248);
        if (v109)
        {
          [v109 header];
        }
        else
        {
          id v16 = v112;
          v112[27] = 0;
          v16[28] = 0;
          uint64_t v142 = 0;
        }
        float v107 = (float)v141;
        id v108 = *(id *)(v112[42] + 248);
        if (v108)
        {
          [v108 header];
        }
        else
        {
          id v17 = v112;
          v112[24] = 0;
          v17[25] = 0;
          uint64_t v140 = 0;
        }
        id v18 = v112;
        float v104 = 1.0;
        *(float *)(v112[42] + 392) = v107 * (float)(1.0 / (float)v139);
        float v106 = (float *)__b;
        *(_DWORD *)(v18[42] + 92) = *((_DWORD *)v18 + 61);
        *(_DWORD *)(v18[42] + 124) = *((_DWORD *)v18 + 62);
        *(_DWORD *)(v18[42] + 116) = *((_DWORD *)v18 + 63);
        LODWORD(v15) = *((_DWORD *)v18 + 65);
        uint64_t v19 = v18[42];
        uint64_t v102 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
        [*(id *)(v19 + 400) setLux:v15];
        LODWORD(v20) = *((_DWORD *)v112 + 61);
        [*(id *)(v112[42] + 400) setNits:v20];
        [*(id *)(v112[42] + 400) currentStrength];
        LODWORD(v21) = *((_DWORD *)v112 + 67);
        uint64_t v22 = v112[42];
        v103 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
        [*(id *)(v22 + 408) setLux:v21];
        LODWORD(v23) = *((_DWORD *)v112 + 61);
        [*(id *)(v112[42] + 408) setNits:v23];
        uint64_t v24 = v112[42];
        v105 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
        CFXSetTarget(*(void *)(v24 + 272), v106 + 7, 1, 1, 0.0, v104);
        v112[23] = 0;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        SEL v26 = v105;
        id v27 = (double *)v112;
        *((CFAbsoluteTime *)v112 + 23) = Current;
        CFXUpdateColorFade(*(void *)(*((void *)v27 + 42) + v26[618]), v27[23]);
        memcpy((void *)(v112[42] + 280), v106 + 7, 0x30uLL);
        id v28 = v112;
        v112[22] = 0;
        if (*(void *)(v28[42] + 16))
        {
          uint64_t v101 = *(void *)(v112[42] + 16);
        }
        else
        {
          uint64_t v100 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
          uint64_t v101 = v100;
        }
        id v29 = v112;
        v112[22] = v101;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v29[22], OS_LOG_TYPE_DEFAULT))
        {
          os_log_t log = (os_log_t)v112[22];
          *(_DWORD *)v98 = type;
          double v96 = *((double *)v112 + 23);
          [*(id *)(v112[42] + 248) submissionTimestamp];
          buf = v151;
          __os_log_helper_16_0_1_8_0((uint64_t)v151, COERCE__INT64(v96 - v30));
          _os_log_impl(&dword_1BA438000, log, v98[0], "[Flipbook] No progress made on flipbook for %f sec", v151, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v95 = v137;
      memset(v137, 0, sizeof(v137));
      char v136 = 0;
      char v136 = [(id)v112[42] flipBookEntryForID:*((unsigned int *)v112 + 80) entry:v137] & 1;
      if (v136 && *(void *)(v112[42] + 248))
      {
        id v31 = v112;
        HIDWORD(v32) = 0;
        *(_DWORD *)(v112[42] + 392) = 0;
        id v94 = *(id *)(v31[42] + 248);
        if (v94)
        {
          [v94 header];
        }
        else
        {
          id v33 = v112;
          v112[9] = 0;
          v33[10] = 0;
          uint64_t v135 = 0;
        }
        BOOL v93 = 0;
        if (v134)
        {
          id v92 = *(id *)(v112[42] + 248);
          if (v92)
          {
            [v92 header];
          }
          else
          {
            id v34 = v112;
            v112[6] = 0;
            v34[7] = 0;
            uint64_t v133 = 0;
          }
          BOOL v93 = v132 != 0;
        }
        if (v93)
        {
          id v91 = *(id *)(v112[42] + 248);
          if (v91)
          {
            [v91 header];
          }
          else
          {
            float v35 = v112;
            v112[3] = 0;
            v35[4] = 0;
            uint64_t v131 = 0;
          }
          float v89 = (float)(v130 - 1 - *((_DWORD *)v112 + 80));
          id v90 = *(id *)(v112[42] + 248);
          if (v90)
          {
            [v90 header];
          }
          else
          {
            uint64_t v127 = 0;
            v112[1] = 0;
            uint64_t v129 = 0;
          }
          float v36 = v112;
          *(float *)(v112[42] + 392) = v89 * (float)(1.0 / (float)v128);
          *(float *)(v36[42] + 392) = fminf(*(float *)(v36[42] + 392), 5.0);
        }
        else
        {
          os_log_t oslog = 0;
          if (*(void *)(v112[42] + 16))
          {
            os_log_t v88 = *(os_log_t *)(v112[42] + 16);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t inited = init_default_corebrightness_log();
            }
            os_log_t v88 = inited;
          }
          os_log_t oslog = v88;
          os_log_type_t v125 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
          {
            os_log_t v84 = oslog;
            *(_DWORD *)uint64_t v85 = v125;
            id v86 = *(id *)(v112[42] + 248);
            if (v86) {
              [v86 header];
            }
            else {
              memset(&v124[16], 0, 23);
            }
            int v82 = *(unsigned __int16 *)&v124[29];
            id v83 = *(id *)(v112[42] + 248);
            if (v83)
            {
              [v83 header];
            }
            else
            {
              uint64_t v123 = 0;
              *(void *)v124 = 0;
              *(void *)&v124[7] = 0;
            }
            v81 = v150;
            __os_log_helper_16_0_2_4_0_4_0((uint64_t)v150, v82, *(int *)&v124[1]);
            _os_log_error_impl(&dword_1BA438000, v84, v85[0], "[Flipbook] Unexpected flipbook frequency = %d OR flipbook number of updates = %d", v150, 0xEu);
          }
        }
        if (v137[4]) {
          *(_DWORD *)(v112[42] + 92) = *(_DWORD *)&v137[5];
        }
        if (v137[51]) {
          *(_DWORD *)(v112[42] + 124) = *((_DWORD *)v112 + 37);
        }
        if (v137[46]) {
          *(_DWORD *)(v112[42] + 116) = *(_DWORD *)&v137[47];
        }
        LODWORD(v32) = *(_DWORD *)(v112[42] + 92);
        [*(id *)(v112[42] + 400) setNits:v32];
        if (v137[56] & 1) != 0 || (v137[4])
        {
          LODWORD(v37) = *(_DWORD *)&v137[61];
          [*(id *)(v112[42] + 400) setLux:v37];
        }
        [*(id *)(v112[42] + 400) currentStrength];
        LODWORD(v38) = *(_DWORD *)(v112[42] + 92);
        [*(id *)(v112[42] + 408) setNits:v38];
        if (v137[65] & 1) != 0 || (v137[4])
        {
          LODWORD(v39) = *(_DWORD *)&v137[70];
          [*(id *)(v112[42] + 408) setLux:v39];
        }
        uint64_t v40 = v112[42];
        v78 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
        uint64_t v41 = *(void *)(v40 + 272);
        int v80 = v137;
        int v79 = 0;
        CFXSetTarget(v41, (float *)&v137[10], 1, 1, 0.0, 1.0);
        double v122 = CFAbsoluteTimeGetCurrent();
        CFXUpdateColorFade(*(void *)(v112[42] + 272), v122);
        [(id)v112[42] setCurrentWhitepointFromMatrix:&v137[10]];
        uint64_t v121 = 0;
        int v120 = 0;
        [(id)v112[42] chromaticity:&v121 andIlluminance:&v120 fromMatrix:&v137[10]];
        os_log_t v119 = 0;
        if (*(void *)(v112[42] + 16))
        {
          os_log_t v77 = *(os_log_t *)(v112[42] + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            double v76 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            double v76 = init_default_corebrightness_log();
          }
          os_log_t v77 = v76;
        }
        os_log_t v119 = v77;
        os_log_type_t v118 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t v73 = v119;
          *(_DWORD *)double v74 = v118;
          int v42 = *((_DWORD *)v112 + 24);
          *(double *)&uint64_t v43 = *(float *)(v112[42] + 392);
          double v44 = "set";
          if (v137[4]) {
            double v45 = "set";
          }
          else {
            double v45 = "not set";
          }
          if (v137[9]) {
            double v46 = "set";
          }
          else {
            double v46 = "not set";
          }
          if (v137[46]) {
            double v47 = "set";
          }
          else {
            double v47 = "not set";
          }
          *(double *)&uint64_t v48 = *((float *)v112 + 37);
          if (v137[51]) {
            double v49 = "set";
          }
          else {
            double v49 = "not set";
          }
          if (v137[56]) {
            double v50 = "set";
          }
          else {
            double v50 = "not set";
          }
          if ((v137[65] & 1) == 0) {
            double v44 = "not set";
          }
          int v72 = &v61;
          double v75 = v149;
          __os_log_helper_16_2_17_4_0_8_0_8_0_8_32_8_0_8_0_8_32_8_0_8_32_8_0_8_32_8_0_8_32_8_0_8_0_8_32_8_0((uint64_t)v149, v42, v43, COERCE__INT64(*(float *)&v137[5]), (uint64_t)v45, COERCE__INT64(*(float *)&v121), COERCE__INT64(*((float *)&v121 + 1)), (uint64_t)v46, COERCE__INT64(*(float *)&v137[47]), (uint64_t)v47, v48, (uint64_t)v49, COERCE__INT64(*(float *)&v137[57]), (uint64_t)v50, COERCE__INT64(*(float *)&v137[61]), COERCE__INT64(*(float *)&v137[66]), (uint64_t)v44, COERCE__INT64(*(float *)&v137[70]));
          _os_log_impl(&dword_1BA438000, v73, v74[0], "[Flipbook] Last update applied[%d], remaining transition length = %f, brightness = %f (%s); WP = (%f; %f) (%"
            "s), pcc = %f (%s), brightness limit = %f (%s), twilight = %f (%s), twilightLux = %f, ammolite = %f (%s), ammoliteLux = %f",
            v75,
            0xA8u);
        }
      }
      else
      {
        os_log_t v117 = 0;
        if (*(void *)(v112[42] + 16))
        {
          os_log_t v71 = *(os_log_t *)(v112[42] + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            double v70 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            double v70 = init_default_corebrightness_log();
          }
          os_log_t v71 = v70;
        }
        os_log_t v117 = v71;
        os_log_type_t v116 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          os_log_t v67 = v117;
          *(_DWORD *)double v68 = v116;
          int v51 = *((_DWORD *)v112 + 80);
          double v69 = v148;
          __os_log_helper_16_0_1_4_0((uint64_t)v148, v51);
          _os_log_error_impl(&dword_1BA438000, v117, v116, "[Flipbook] currentID=%d (from DCP; adjusted) does not correspond to any entry",
            v148,
            8u);
        }
        *(_DWORD *)(v112[42] + 392) = 0;
      }
    }
  }
  if (*(void *)(v112[42] + 160)) {
    (*(void (**)(void))(*(void *)(v112[42] + 160) + 16))();
  }
  [(id)v112[42] releaseCallbacks];
  os_log_t v115 = 0;
  if (*(void *)(v112[42] + 16))
  {
    os_log_t v66 = *(os_log_t *)(v112[42] + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      int v65 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      int v65 = init_default_corebrightness_log();
    }
    os_log_t v66 = v65;
  }
  os_log_t v115 = v66;
  os_log_type_t v114 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v62 = v115;
    *(_DWORD *)double v63 = v114;
    char v52 = [*(id *)(v112[42] + 80) liveUpdates];
    double v53 = (float *)v112[42];
    *(double *)&uint64_t v54 = v53[23];
    *(double *)&uint64_t v55 = v53[79];
    *(double *)&uint64_t v56 = v53[80];
    *(double *)&uint64_t v57 = v53[27];
    *(double *)&uint64_t v58 = v53[29];
    *(double *)&uint64_t v59 = v53[98];
    double v64 = v147;
    __os_log_helper_16_0_7_4_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v147, v52 & 1, v54, v55, v56, v57, v58, v59);
    _os_log_impl(&dword_1BA438000, v62, v63[0], "[AOD update] Cancel transition, liveUpdates=%d. Current SDR = %f, WP = (%f;%f), _currentEDRHeadroom = %f, AAP = %f"
      ", remaining transition length = %f",
      v64,
      0x44u);
  }
  return v144;
}

- (void)releaseCallbacks
{
  if (self->_rampDoneCallback)
  {
    _Block_release(self->_rampDoneCallback);
    self->_rampDoneCallback = 0;
  }
  if (self->_rampCanceledCallback)
  {
    _Block_release(self->_rampCanceledCallback);
    self->_rampCanceledCallback = 0;
  }
}

- (void)clockUpdateHandler:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  uint64_t v100 = self;
  SEL v99 = a2;
  id v98 = a3;
  id v97 = (id)[a3 rampForIdentifier:@"SDR_RAMP"];
  id v96 = (id)[v98 rampForIdentifier:@"COLOR_RAMP"];
  id v95 = (id)[v98 rampForIdentifier:@"EDR_RAMP"];
  id v94 = (id)[v98 rampForIdentifier:@"AAP_RAMP"];
  id v93 = (id)[v98 rampForIdentifier:@"BRIGHTNESS_LIMIT_RAMP"];
  id v92 = (id)[v98 rampForIdentifier:@"LUMA_BOOST_FACTOR_RAMP"];
  id v91 = (id)[v98 rampForIdentifier:@"TWILIGHT_RAMP"];
  id v90 = (id)[v98 rampForIdentifier:@"AMMOLITE_RAMP"];
  if ([(CBRampManager *)v100->_rampManager liveUpdates])
  {
    if (v97)
    {
      [v97 currentValue];
      [(CBAODTransitionController *)v100 updateSDRBrightness:v3];
      [v97 currentValue];
      [*(id *)&v100->_liveUpdatesOverride setNits:v4];
      [v97 currentValue];
      [*(id *)&v100->_currentDisplayNits setNits:v5];
      if (*(void *)&v100->_remainingTransitionLength)
      {
        double v60 = *(void **)&v100->_remainingTransitionLength;
        [v97 currentValue];
        [v60 setSdrBrightness:v6];
        [*(id *)&v100->_remainingTransitionLength updateRamp];
      }
    }
    if (v96) {
      [(CBAODTransitionController *)v100 updateColorRamp:v96];
    }
    if (v95)
    {
      [v95 currentValue];
      [(CBAODTransitionController *)v100 updateEDRHeadroom:v7];
    }
    if (v94)
    {
      [v94 currentValue];
      [(CBAODTransitionController *)v100 updateAAPFactor:v8];
    }
    if (v93)
    {
      [v93 currentValue];
      [(CBAODTransitionController *)v100 updateBrightnessLimit:v9];
    }
    if (v92)
    {
      [v92 currentValue];
      [(CBAODTransitionController *)v100 updateLumaBoostFactor:v10];
    }
    *(float *)&int v89 = NAN;
    if (*(void *)&v100->_liveUpdatesOverride && (v97 || v91))
    {
      [*(id *)&v100->_liveUpdatesOverride currentStrength];
      int v89 = SLODWORD(v11);
      [(CBAODTransitionController *)v100 updateTwilightStrength:v11];
    }
    *(float *)&int v88 = NAN;
    if (*(void *)&v100->_currentDisplayNits && (v97 || v90))
    {
      [*(id *)&v100->_currentDisplayNits currentStrength];
      int v88 = SLODWORD(v12);
      [(CBAODTransitionController *)v100 updateAmmoliteStrength:v12];
    }
    float v87 = NAN;
    if (*(void *)&v100->_remainingTransitionLength
      && (CBU_IsSecureIndicatorSupported() & 1) != 0
      && ([*(id *)&v100->_remainingTransitionLength shouldPushIndicatorBrightness] & 1) != 0)
    {
      [*(id *)&v100->_remainingTransitionLength currentIndicatorBrightness];
      float v87 = v13;
    }
    float v86 = 0.0;
    float v86 = fmaxf(v87, v100->_currentBrightnessLimit);
    uint64_t v85 = 0;
    char v84 = 0;
    os_log_t v83 = 0;
    if (v100->super._logHandle)
    {
      logHandle = v100->super._logHandle;
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
    os_log_t v83 = logHandle;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      if (v97)
      {
        [v97 currentValue];
        float v57 = v14;
      }
      else
      {
        float v57 = -1.0;
      }
      if (v95)
      {
        [v95 currentValue];
        float v56 = v15;
      }
      else
      {
        float v56 = -1.0;
      }
      if (v93)
      {
        [v93 currentValue];
        float v55 = v16;
      }
      else
      {
        float v55 = -1.0;
      }
      if (v94)
      {
        [v94 currentValue];
        float v54 = v17;
      }
      else
      {
        float v54 = -1.0;
      }
      if (v96) {
        float v53 = v100->_currentWhitepoint.matrix[1][0];
      }
      else {
        float v53 = -1.0;
      }
      if (v96) {
        float v52 = v100->_currentWhitepoint.matrix[1][1];
      }
      else {
        float v52 = -1.0;
      }
      if (v97 || v91) {
        float v51 = *(float *)&v89;
      }
      else {
        float v51 = -1.0;
      }
      if (v97 || v90) {
        float v50 = *(float *)&v88;
      }
      else {
        float v50 = -1.0;
      }
      __os_log_helper_16_0_11_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v103, COERCE__INT64(v57), COERCE__INT64(v56), COERCE__INT64(v55), COERCE__INT64(v54), COERCE__INT64(v53), COERCE__INT64(v52), COERCE__INT64(v51), COERCE__INT64(v50), COERCE__INT64(v87), COERCE__INT64(v86), COERCE__INT64(v100->_currentTrustedLux));
      _os_log_impl(&dword_1BA438000, v83, type, "[AOD update][CA] Pushing sdrBrightness: %f, capped _appliedHeadroom: %f, brightnessLimit: %f, PCC: %f, Whitepoint:(%f | %f), TwilightStrength: %f, AmmoliteStrength: %f, IndicatorBrightness: %f, IndicatorBrightnessLimit: %f, Ambient: %f", v103, 0x70u);
    }
    if (std::__math::isnan[abi:ne180100]())
    {
      *(float *)&double v18 = v87;
    }
    else
    {
      float v81 = 0.0;
      float v81 = std::__math::fmax[abi:ne180100](v87, v100->_currentSDRBrightness);
      *(float *)&double v18 = v81;
    }
    [(CBBrightnessProxy *)v100->_brtCtl setIndicatorBrightness:v18];
    *(float *)&double v19 = v86;
    [(CBBrightnessProxy *)v100->_brtCtl setIndicatorBrightnessLimit:v19];
    if (v97 && ([v97 isFinished] & 1) == 0
      || v96 && ([v96 isFinished] & 1) == 0
      || v95 && ([v95 isFinished] & 1) == 0
      || v94 && ([v94 isFinished] & 1) == 0
      || v93 && ([v93 isFinished] & 1) == 0)
    {
      char v84 = [(CBBrightnessProxy *)v100->_brtCtl commitBrightness:&v85] & 1;
    }
    else
    {
      os_log_t v80 = 0;
      if (v100->super._logHandle)
      {
        double v49 = v100->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v48 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v48 = init_default_corebrightness_log();
        }
        double v49 = v48;
      }
      os_log_t v80 = v49;
      os_log_type_t v79 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        [v97 currentValue];
        __os_log_helper_16_0_1_8_0((uint64_t)v102, COERCE__INT64(v20));
        _os_log_impl(&dword_1BA438000, v80, v79, "CommitBrightness: %f with swap done callback", v102, 0xCu);
      }
      v75[0] = 0;
      v75[1] = v75;
      int v76 = 0x20000000;
      int v77 = 32;
      int v78 = 0;
      [v97 currentValue];
      int v78 = v21;
      brtCtl = v100->_brtCtl;
      uint64_t v68 = MEMORY[0x1E4F143A8];
      int v69 = -1073741824;
      int v70 = 0;
      os_log_t v71 = __48__CBAODTransitionController_clockUpdateHandler___block_invoke;
      int v72 = &unk_1E621A230;
      os_log_t v73 = v100;
      double v74 = v75;
      char v84 = -[CBBrightnessProxy commitBrightness:withBlock:](brtCtl, "commitBrightness:withBlock:", &v85) & 1;
      LODWORD(v23) = 0.5;
      [(CBAODTransitionController *)v100 activateLastUpdateSwappedTimerWithTimeout:v23];
      _Block_object_dispose(v75, 8);
    }
    if ((v84 & 1) == 0 || v85)
    {
      os_log_t v67 = 0;
      if (v100->super._logHandle)
      {
        double v47 = v100->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v46 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v46 = init_default_corebrightness_log();
        }
        double v47 = v46;
      }
      os_log_t v67 = v47;
      os_log_type_t v66 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v101, v85);
        _os_log_error_impl(&dword_1BA438000, v67, v66, "failed to commit brightness update (%@)", v101, 0xCu);
      }
    }
  }
  else
  {
    memset(__b, 0, sizeof(__b));
    memcpy(&v100->_currentFlipBookEntry, __b, 0x4FuLL);
    if (v97)
    {
      double v45 = v100;
      [v97 currentValue];
      [(CBAODTransitionController *)v45 updateFlipBookEntryWithBrightness:v24];
    }
    if (v94)
    {
      double v44 = v100;
      [v94 currentValue];
      [(CBAODTransitionController *)v44 updateFlipBookEntryWithAAPFactor:v25];
    }
    if (v93)
    {
      uint64_t v43 = v100;
      [v93 currentValue];
      [(CBAODTransitionController *)v43 updateFlipBookEntryWithBrightnessLimit:v26];
    }
    if (*(void *)&v100->_liveUpdatesOverride && (v97 || v91))
    {
      int v64 = 0;
      [*(id *)&v100->_liveUpdatesOverride nits];
      int v64 = v27;
      *(float *)&double v28 = v100->_currentSDRBrightness;
      [*(id *)&v100->_liveUpdatesOverride setNits:v28];
      int v42 = v100;
      [*(id *)&v100->_liveUpdatesOverride lux];
      [(CBAODTransitionController *)v42 updateFlipBookEntryWithTwilightLux:v29];
      *(float *)&double v30 = v100->_currentSDRBrightness;
      if (([*(id *)&v100->_liveUpdatesOverride nitsAreInActiveRange:v30] & 1) != 0
        || (LODWORD(v31) = v64, ([*(id *)&v100->_liveUpdatesOverride nitsAreInActiveRange:v31] & 1) != 0))
      {
        uint64_t v41 = v100;
        [*(id *)&v100->_liveUpdatesOverride currentStrength];
        [(CBAODTransitionController *)v41 updateFlipBookEntryWithTwilightStrength:v32];
      }
    }
    if (*(void *)&v100->_currentDisplayNits && (v97 || v90))
    {
      int v63 = 0;
      [*(id *)&v100->_currentDisplayNits nits];
      int v63 = v33;
      *(float *)&double v34 = v100->_currentSDRBrightness;
      [*(id *)&v100->_currentDisplayNits setNits:v34];
      uint64_t v40 = v100;
      [*(id *)&v100->_currentDisplayNits lux];
      [(CBAODTransitionController *)v40 updateFlipBookEntryWithAmmoliteLux:v35];
      *(float *)&double v36 = v100->_currentSDRBrightness;
      if (([*(id *)&v100->_currentDisplayNits nitsAreInActiveRange:v36] & 1) != 0
        || (LODWORD(v37) = v63, ([*(id *)&v100->_currentDisplayNits nitsAreInActiveRange:v37] & 1) != 0))
      {
        double v39 = v100;
        [*(id *)&v100->_currentDisplayNits currentStrength];
        [(CBAODTransitionController *)v39 updateFlipBookEntryWithAmmoliteStrength:v38];
      }
    }
    [(CBAODTransitionController *)v100 updateColorRamp:v96];
    memcpy(__dst, &v100->_currentFlipBookEntry, sizeof(__dst));
    [(CBAODTransitionController *)v100 addFlipBookEntry:__dst];
    if (*(void *)&v100->_currentFlipBookEntry.ammoliteStrength_set
      && [*(id *)&v100->_currentFlipBookEntry.ammoliteStrength_set entryCount] == 1)
    {
      memcpy(v61, &v100->_currentFlipBookEntry, sizeof(v61));
      [(CBAODTransitionController *)v100 addFlipBookEntry:v61];
    }
  }
}

void __48__CBAODTransitionController_clockUpdateHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = a1;
  uint64_t v12 = a2;
  uint64_t v11 = a1;
  double v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  uint64_t block = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  double v7 = __48__CBAODTransitionController_clockUpdateHandler___block_invoke_2;
  double v8 = &unk_1E6219CA8;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  dispatch_async(v3, &block);
}

void __48__CBAODTransitionController_clockUpdateHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) releaseLastUpdateSwappedTimer];
  [*(id *)(a1 + 32) applyPendingUpdates];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    float v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    float v2 = inited;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v4, COERCE__INT64(*(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)));
    _os_log_impl(&dword_1BA438000, v2, OS_LOG_TYPE_DEFAULT, "CommitBrightness: Last update with brightness (%f) has been swapped on the display", v4, 0xCu);
  }
}

- (void)rampsDoneCallback:(id)a3
{
  uint64_t v12 = self;
  SEL v11 = a2;
  id v10 = a3;
  uint64_t v9 = 0;
  if (self->super._logHandle)
  {
    logHandle = v12->super._logHandle;
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
    os_log_t log = v9;
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1BA438000, log, type, "Call ramps done callback", v7, 2u);
  }
  if (![(CBRampManager *)v12->_rampManager liveUpdates]) {
    [(CBAODTransitionController *)v12 sendCurrentFlipBook];
  }
  if (v12->_rampDoneCallback) {
    (*((void (**)(void))v12->_rampDoneCallback + 2))();
  }
  [(CBAODTransitionController *)v12 releaseCallbacks];
}

- (void)releaseLastUpdateSwappedTimer
{
  if (*(void *)&self->_currentFlipBookEntry.reserved[4])
  {
    dispatch_source_cancel(*(dispatch_source_t *)&self->_currentFlipBookEntry.reserved[4]);
    dispatch_release(*(dispatch_object_t *)&self->_currentFlipBookEntry.reserved[4]);
    *(void *)&self->_currentFlipBookEntry.reserved[4] = 0;
  }
}

- (void)activateLastUpdateSwappedTimerWithTimeout:(float)a3
{
  double v18 = self;
  SEL v17 = a2;
  float v16 = a3;
  int64_t v15 = (unint64_t)(float)(a3 * 1000000000.0);
  if (*(void *)&self->_currentFlipBookEntry.reserved[4])
  {
    source = *(NSObject **)&v18->_currentFlipBookEntry.reserved[4];
    dispatch_time_t v3 = dispatch_time(0, v15);
    dispatch_source_set_timer(source, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    *(void *)&v18->_currentFlipBookEntry.reserved[4] = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v18->super._queue);
    if (*(void *)&v18->_currentFlipBookEntry.reserved[4])
    {
      double v4 = *(NSObject **)&v18->_currentFlipBookEntry.reserved[4];
      uint64_t handler = MEMORY[0x1E4F143A8];
      int v9 = -1073741824;
      int v10 = 0;
      SEL v11 = __71__CBAODTransitionController_activateLastUpdateSwappedTimerWithTimeout___block_invoke;
      uint64_t v12 = &unk_1E621A258;
      uint64_t v13 = v18;
      float v14 = v16;
      dispatch_source_set_event_handler(v4, &handler);
      int v6 = *(NSObject **)&v18->_currentFlipBookEntry.reserved[4];
      dispatch_time_t v5 = dispatch_time(0, v15);
      dispatch_source_set_timer(v6, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
  dispatch_activate(*(dispatch_object_t *)&v18->_currentFlipBookEntry.reserved[4]);
}

uint64_t __71__CBAODTransitionController_activateLastUpdateSwappedTimerWithTimeout___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    dispatch_time_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    dispatch_time_t v3 = inited;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v5, COERCE__INT64(*(float *)(a1 + 40)));
    _os_log_error_impl(&dword_1BA438000, v3, OS_LOG_TYPE_ERROR, "Last update has not been swapped on display in timeout %f.", v5, 0xCu);
  }
  [*(id *)(a1 + 32) releaseLastUpdateSwappedTimer];
  return [*(id *)(a1 + 32) applyPendingUpdates];
}

- (BOOL)applyPendingUpdates
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_pendingState
    && [+[CBAODState sharedInstance] AODState] == 1)
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
      __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)self->_pendingState);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Apply pending update. %@", v7, 0xCu);
    }
    LODWORD(v2) = -1.0;
    [(CBAODTransitionController *)self startTransition:self->_pendingState length:0 forceUpdate:&__block_literal_global_194 rampDoneCallback:0 rampCanceledCallback:v2];
    if (self->_pendingState)
    {

      self->_pendingState = 0;
    }
  }
  return 0;
}

- (BOOL)commitBrightness:(float)a3 force:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v19 = self;
  SEL v18 = a2;
  float v17 = a3;
  BOOL v16 = a4;
  os_log_t v15 = 0;
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
  os_log_t v15 = logHandle;
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    if (v16) {
      dispatch_time_t v5 = "force ";
    }
    else {
      dispatch_time_t v5 = "";
    }
    __os_log_helper_16_2_2_8_32_8_0((uint64_t)v21, (uint64_t)v5, COERCE__INT64(v17));
    _os_log_impl(&dword_1BA438000, v15, v14, "Update and %scommit CA SDR brightness %f", v21, 0x16u);
  }
  *(float *)&double v4 = v17;
  [(CBBrightnessProxy *)v19->_brtCtl setSDRBrightness:v4];
  uint64_t v13 = 0;
  if (v16) {
    char v12 = [(CBBrightnessProxy *)v19->_brtCtl forceCommitBrightness:&v13 withBlock:0] & 1;
  }
  else {
    char v12 = [(CBBrightnessProxy *)v19->_brtCtl commitBrightness:&v13] & 1;
  }
  if ((v12 & 1) == 0)
  {
    if (v19->super._logHandle)
    {
      int v9 = v19->super._logHandle;
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
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (v16) {
        uint64_t v6 = "FORCE ";
      }
      else {
        uint64_t v6 = "";
      }
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v20, (uint64_t)v6, v13);
      _os_log_error_impl(&dword_1BA438000, v9, OS_LOG_TYPE_ERROR, "ERROR %sCOMMITING SDR BRIGHTNESS FROM CA! (%@)", v20, 0x16u);
    }
  }
  return v12 & 1;
}

- (BOOL)updateAllBrightnessFeaturesForced:(BOOL)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v21 = self;
  SEL v20 = a2;
  BOOL v19 = a3;
  *(float *)&double v3 = self->_currentSDRBrightness;
  [(CBAODTransitionController *)self updateSDRBrightness:v3];
  *(float *)&double v4 = v21->_currentBrightnessLimit;
  [(CBAODTransitionController *)v21 updateBrightnessLimit:v4];
  *(float *)&double v5 = v21->_currentAAPFactor;
  [(CBAODTransitionController *)v21 updateAAPFactor:v5];
  [(CBAODTransitionController *)v21 updateWhitePoint:&v21->_thresholdModule];
  *(float *)&double v6 = v21->_currentTrustedLux;
  [(CBAODTransitionController *)v21 updateAmbient:v6];
  float v18 = 0.0;
  if (*(void *)&v21->_liveUpdatesOverride)
  {
    [*(id *)&v21->_liveUpdatesOverride currentStrength];
    float v18 = *(float *)&v7;
    [(CBAODTransitionController *)v21 updateTwilightStrength:v7];
  }
  float v17 = 0.0;
  if (*(void *)&v21->_currentDisplayNits)
  {
    [*(id *)&v21->_currentDisplayNits currentStrength];
    float v17 = *(float *)&v8;
    [(CBAODTransitionController *)v21 updateAmmoliteStrength:v8];
  }
  uint64_t v16 = 0;
  if (v19) {
    char v15 = [(CBBrightnessProxy *)v21->_brtCtl forceCommitBrightness:&v16 withBlock:0] & 1;
  }
  else {
    char v15 = [(CBBrightnessProxy *)v21->_brtCtl commitBrightness:&v16] & 1;
  }
  if ((v15 & 1) == 0)
  {
    if (v21->super._logHandle)
    {
      logHandle = v21->super._logHandle;
    }
    else
    {
      uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      logHandle = v13;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v23, v16);
      _os_log_error_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_ERROR, "ERROR: Force commiting CB features to CA failed! (%@)", v23, 0xCu);
    }
  }
  if (v21->super._logHandle)
  {
    char v12 = v21->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    char v12 = inited;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v19) {
      int v9 = "Force ";
    }
    else {
      int v9 = "";
    }
    __os_log_helper_16_2_8_8_32_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v22, (uint64_t)v9, COERCE__INT64(v21->_currentSDRBrightness), COERCE__INT64(v21->_currentWhitepoint.matrix[1][0]), COERCE__INT64(v21->_currentWhitepoint.matrix[1][1]), COERCE__INT64(v21->_currentAAPFactor), COERCE__INT64(v21->_currentBrightnessLimit), COERCE__INT64(v18), COERCE__INT64(v17));
    _os_log_impl(&dword_1BA438000, v12, OS_LOG_TYPE_DEFAULT, "[AOD update][CA] Pushing: %scommit all features: brightness = %f; WP = (%f; %f), pcc = %f, brightness limit = %f, "
      "twilight = %f, ammolite = %f",
      v22,
      0x52u);
  }
  return v15 & 1;
}

- (void)updateWhitePoint:(float)a3[3][3]
{
  v14[9] = *MEMORY[0x1E4F143B8];
  char v12 = self;
  SEL v11 = a2;
  int v10 = a3;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  for (int i = 0; i < 3; ++i)
  {
    for (int j = 0; j < 3; ++j)
    {
      *(float *)&double v3 = v10[i][j];
      v14[3 * i + j] = [NSNumber numberWithFloat:v3];
    }
  }
  id v7 = 0;
  if ((-[CBBrightnessProxy setWhitePoint:rampDuration:error:](v12->_brtCtl, "setWhitePoint:rampDuration:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:9], &v7, 0.0) & 1) == 0)
  {
    if (v12->super._logHandle)
    {
      logHandle = v12->super._logHandle;
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
      __os_log_helper_16_2_1_8_64((uint64_t)v13, (uint64_t)v7);
      _os_log_error_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_ERROR, "failed to set whitepoint(%@)", v13, 0xCu);
    }
  }
}

- (void)updateSDRBrightness:(float)a3
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
    __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "CA SDR brightness update %f", v8, 0xCu);
  }
  self->_float currentSDRBrightness = a3;
  *(float *)&double v3 = a3;
  [(CBBrightnessProxy *)self->_brtCtl setSDRBrightness:v3];
}

- (void)updateBrightnessLimit:(float)a3
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
    __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "Brightness limit update %f", v8, 0xCu);
  }
  self->_currentBrightnessLimit = a3;
  *(float *)&double v3 = a3;
  [(CBBrightnessProxy *)self->_brtCtl setBrightnessLimit:v3];
}

- (void)updateAAPFactor:(float)a3
{
  self->_currentAAPFactor = a3;
  [(CBBrightnessProxy *)self->_brtCtl setContrastEnhancer:*(double *)&a3];
}

- (void)updateLumaBoostFactor:(float)a3
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
    __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "CA luma boost factor update %f", v8, 0xCu);
  }
  self->_currentLumaBoostFactor = a3;
  *(float *)&double v3 = a3;
  [(CBBrightnessProxy *)self->_brtCtl setLowAmbientAdaptation:v3];
}

- (void)updateTwilightStrength:(float)a3
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
    __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "CA low ambient adaptation strength update %f", v8, 0xCu);
  }
  *(float *)&double v3 = a3;
  [(CBBrightnessProxy *)self->_brtCtl setLowAmbientAdaptation:v3];
}

- (void)updateAmmoliteStrength:(float)a3
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
    __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "CA high ambient adaptation strength update %f", v8, 0xCu);
  }
  *(float *)&double v3 = a3;
  [(CBBrightnessProxy *)self->_brtCtl setHighAmbientAdaptation:v3];
}

- (void)updateAmbient:(float)a3
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
    __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "CA ambient update %f lux", v8, 0xCu);
  }
  *(float *)&double v3 = a3;
  [(CBBrightnessProxy *)self->_brtCtl setAmbient:v3];
}

- (float)sdrBrightnessProgressCallback:(float)a3 rampContext:(id)a4
{
  -[CBAODTransitionController sdrBrightnessProgressCallback:rampContext:profile:](self, "sdrBrightnessProgressCallback:rampContext:profile:", a4, 0, *(double *)&a3, a4);
  return result;
}

- (float)sdrBrightnessProgressCallback:(float)a3 rampContext:(id)a4 profile:(unint64_t)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  float v29 = a3;
  if (a3 < 1.0)
  {
    if (a5 == 2)
    {
      [(CBAODTransitionController *)self calculateSpringProgressForLinearProgress:*(double *)&a3];
      float v30 = v9;
      LODWORD(v10) = 1.0;
      [(CBAODTransitionController *)self calculateSpringProgressForLinearProgress:v10];
      float v29 = v30 / v11;
    }
    else if (a5 == 1)
    {
      [(CBAODTransitionController *)self calculateSigmoidProgressForLinearProgress:*(double *)&a3];
      float v29 = v12;
    }
    float v31 = clamp(v29, 0.0, 1.0);
    [a4 originalValue];
    float v27 = BULuminanceToPerceptual(v13, self->_minNits, self->_maxNits);
    [a4 targetValue];
    float v26 = v27 - (float)((float)(v27 - BULuminanceToPerceptual(v14, self->_minNits, self->_maxNits)) * v31);
    float v25 = BUPerceptualToLuminance(v26, self->_minNits, self->_maxNits);
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
      [a4 originalValue];
      *(double *)&uint64_t v18 = v15;
      [a4 targetValue];
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v34, v18, COERCE__INT64(v16), COERCE__INT64((float)(v31 * 100.0)), COERCE__INT64(v25));
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "SDR - perceptual ramp clocked: %f -> %f - %f%% (%f Nits)", v34, 0x2Au);
    }
    return v25;
  }
  else
  {
    if (self->super._logHandle)
    {
      uint64_t v24 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v23 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v23 = init_default_corebrightness_log();
      }
      uint64_t v24 = v23;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      [a4 originalValue];
      *(double *)&uint64_t v21 = v5;
      [a4 targetValue];
      *(double *)&uint64_t v22 = v6;
      [a4 targetValue];
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v35, v21, v22, COERCE__INT64((float)(v29 * 100.0)), COERCE__INT64(v7));
      _os_log_impl(&dword_1BA438000, v24, OS_LOG_TYPE_DEFAULT, "Ramp ended - SDR - perceptual ramp clocked: %f -> %f - %f%% (%f Nits)", v35, 0x2Au);
    }
    [a4 targetValue];
    return v8;
  }
}

- (float)brightnessLimitProgressCallback:(float)a3 rampContext:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a3 < 1.0)
  {
    [a4 originalValue];
    float v22 = BULuminanceToPerceptual(v8, self->_minNits, self->_maxNits);
    [a4 targetValue];
    float v21 = v22 - (float)((float)(v22 - BULuminanceToPerceptual(v9, self->_minNits, self->_maxNits)) * a3);
    float v20 = BUPerceptualToLuminance(v21, self->_minNits, self->_maxNits);
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
      [a4 originalValue];
      *(double *)&uint64_t v13 = v10;
      [a4 targetValue];
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v27, v13, COERCE__INT64(v11), COERCE__INT64((float)(a3 * 100.0)), COERCE__INT64(v20));
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "Brightness limit - perceptual ramp clocked: %f -> %f - %f%% (%f Nits)", v27, 0x2Au);
    }
    return v20;
  }
  else
  {
    if (self->super._logHandle)
    {
      BOOL v19 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v18 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v18 = init_default_corebrightness_log();
      }
      BOOL v19 = v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      [a4 originalValue];
      *(double *)&uint64_t v16 = v4;
      [a4 targetValue];
      *(double *)&uint64_t v17 = v5;
      [a4 targetValue];
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v28, v16, v17, COERCE__INT64((float)(a3 * 100.0)), COERCE__INT64(v6));
      _os_log_impl(&dword_1BA438000, v19, OS_LOG_TYPE_INFO, "Ramp ended - Brightness limit - perceptual ramp clocked: %f -> %f - %f%% (%f Nits)", v28, 0x2Au);
    }
    [a4 targetValue];
    return v7;
  }
}

- (BOOL)requestTransitionStopForIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(CBRampManager *)self->_rampManager hasRampRunningForIdentifier:a3])
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
      __os_log_helper_16_2_1_8_66((uint64_t)v8, (uint64_t)a3);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "%{public}@ transition request - stop", v8, 0xCu);
    }
    [(CBRampManager *)self->_rampManager removeRampWithIdentifier:a3];
  }
  return 1;
}

- (void)initColorEffects
{
  uint64_t v17 = self;
  SEL v16 = a2;
  self->_flipbookCache = (CBAODFlipBookWrapper *)CFXCreate();
  if (v17->_flipbookCache)
  {
    float v15 = 0;
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
    float v15 = logHandle;
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = v15;
      os_log_type_t type = v14;
      __os_log_helper_16_0_0(v13);
      _os_log_impl(&dword_1BA438000, log, type, "Init ColorEffects for AOD", v13, 2u);
    }
    CFXInstallCallback((uint64_t)v17->_flipbookCache, (uint64_t)ColorRampCallback, (uint64_t)v17);
    CFXEnableFades((uint64_t)v17->_flipbookCache, 1);
    CFXSetMagicCoeff((uint64_t)v17->_flipbookCache, 0);
    CFXSetWhitePointType(v17->_flipbookCache, 1);
  }
  else
  {
    float v12 = 0;
    if (v17->super._logHandle)
    {
      float v5 = v17->super._logHandle;
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
    float v12 = v5;
    char v11 = 16;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      double v2 = v12;
      os_log_type_t v3 = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_error_impl(&dword_1BA438000, v2, v3, "Failed to create ColorEffects for AOD", v10, 2u);
    }
  }
}

- (void)colorRampRoutine:(id *)a3
{
  v19[9] = *MEMORY[0x1E4F143B8];
  SEL v16 = self;
  SEL v15 = a2;
  os_log_type_t v14 = a3;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  if (v14)
  {
    float var0 = 0.0;
    float var0 = v14->var0;
    memcpy(&v16->_thresholdModule, v14->var1, 0x24uLL);
    [(CBAODTransitionController *)v16 chromaticity:v16->_currentWhitepoint.matrix[1] andIlluminance:&v16->_currentWhitepoint.matrix[1][2] fromMatrix:&v16->_thresholdModule];
    if ([(CBRampManager *)v16->_rampManager liveUpdates])
    {
      for (int i = 0; i < 9; ++i)
      {
        *(float *)&double v3 = v14->var1[i];
        v19[i] = [NSNumber numberWithFloat:v3];
      }
      id v11 = 0;
      brtCtl = v16->_brtCtl;
      uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:9];
      if (([(CBBrightnessProxy *)brtCtl setWhitePoint:v4 rampDuration:&v11 error:var0] & 1) == 0)
      {
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
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v18, (uint64_t)v11);
          _os_log_error_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_ERROR, "failed to set whitepoint(%@)", v18, 0xCu);
        }
      }
    }
    else
    {
      memcpy((char *)&v16->_currentFlipBookEntry.brightness + 2, v14->var1, 0x24uLL);
      BYTE1(v16->_currentFlipBookEntry.brightness) = 1;
    }
    if (v16->super._logHandle)
    {
      float v6 = v16->super._logHandle;
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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v17, COERCE__INT64(v14->var4.var0), COERCE__INT64(v14->var4.var1), COERCE__INT64(var0));
      _os_log_impl(&dword_1BA438000, v6, OS_LOG_TYPE_DEFAULT, "AOD Whitepoint update(%f | %f) and period: %f", v17, 0x20u);
    }
  }
}

- (void)updateColorRamp:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (![(CBRampManager *)self->_rampManager liveUpdates])
    {
      if ([a3 isFinished]) {
        memcpy(&self->_thresholdModule, self->_currentWhitepoint.matrix[2], 0x30uLL);
      }
      memcpy((char *)&self->_currentFlipBookEntry.brightness + 2, &self->_thresholdModule, 0x24uLL);
      BYTE1(self->_currentFlipBookEntry.brightness) = 0;
    }
    if ([a3 isFinished])
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
        [a3 originalValue];
        *(double *)&uint64_t v15 = v3;
        [a3 targetValue];
        *(double *)&uint64_t v16 = v4;
        [a3 currentValue];
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v22, v15, v16, COERCE__INT64(v5));
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Ramp ended - ColorRamp - perceptual ramp clocked: %f -> %f - %f", v22, 0x20u);
      }
      CFXSetTarget((uint64_t)self->_flipbookCache, self->_currentWhitepoint.matrix[2], 1, 1, 0.0, 1.0);
      [a3 currentAbsoluteTimestamp];
      CFXUpdateColorFade((uint64_t)self->_flipbookCache, v6);
    }
    else
    {
      if (self->super._logHandle)
      {
        os_log_type_t v14 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v13 = init_default_corebrightness_log();
        }
        os_log_type_t v14 = v13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        [a3 originalValue];
        *(double *)&uint64_t v11 = v7;
        [a3 targetValue];
        *(double *)&uint64_t v12 = v8;
        [a3 currentValue];
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v21, v11, v12, COERCE__INT64(v9));
        _os_log_impl(&dword_1BA438000, v14, OS_LOG_TYPE_INFO, "Ramp clocked - ColorRamp - perceptual ramp clocked: %f -> %f - %f", v21, 0x20u);
      }
      [a3 currentAbsoluteTimestamp];
      CFXUpdateColorFade((uint64_t)self->_flipbookCache, v10);
    }
  }
  else
  {
    memcpy((char *)&self->_currentFlipBookEntry.brightness + 2, &self->_thresholdModule, 0x24uLL);
    BYTE1(self->_currentFlipBookEntry.brightness) = 0;
  }
}

- (BOOL)requestColorRampTransitionStop
{
  uint64_t v11 = self;
  SEL v10 = a2;
  if ([(CBRampManager *)self->_rampManager hasRampRunningForIdentifier:@"COLOR_RAMP"])
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
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = v9;
      os_log_type_t type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_impl(&dword_1BA438000, log, type, "ColorRamp transition request - stop", v7, 2u);
    }
    [(CBRampManager *)v11->_rampManager removeRampWithIdentifier:@"COLOR_RAMP"];
    CFXCancelColorFade((uint64_t)v11->_flipbookCache);
  }
  return 1;
}

- (void)processInitialColorMatrixFromState:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a3 objectForKey:@"ColorRamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    memcpy(__dst, &identityMatrix, sizeof(__dst));
    [(CBAODTransitionController *)self colorMatrix:__dst fromState:a3];
    [(CBAODTransitionController *)self setCurrentWhitepointFromMatrix:__dst];
    [(CBAODTransitionController *)self setTargetWhitepointFromMatrix:__dst];
    CFXSetTarget((uint64_t)self->_flipbookCache, self->_currentWhitepoint.matrix[2], 1, 1, 0.0, 1.0);
    double Current = CFAbsoluteTimeGetCurrent();
    CFXUpdateColorFade((uint64_t)self->_flipbookCache, Current);
  }
}

- (void)colorMatrix:(float)a3[3][3] fromState:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  SEL v10 = (void *)[a4 objectForKey:@"ColorRamp"];
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
      __os_log_helper_16_2_1_8_64((uint64_t)v13, (uint64_t)v10);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "WP matrix from state = %@", v13, 0xCu);
    }
    float v9 = (void *)[v10 objectForKey:@"ColorRampTarget"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (int)[v9 count] >= 9)
    {
      for (int i = 0; i < 3; ++i)
      {
        for (int j = 0; j < 3; ++j)
        {
          objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 3 * i + j), "floatValue");
          (*a3)[3 * i + j] = v4;
        }
      }
    }
  }
}

- (void)chromaticity:(id *)a3 andIlluminance:(float *)a4 fromMatrix:(float)a5[3][3]
{
}

- (void)setTargetWhitepointFromMatrix:(float)a3[3][3]
{
}

- (void)setCurrentWhitepointFromMatrix:(float)a3[3][3]
{
}

- (void)setWhitepoint:(id *)a3 fromMatrix:(float)a4[3][3]
{
}

- (BOOL)shallUpdateWhitepointFrom:(float)a3[3][3] target:(float)a4[3][3]
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v19 = self;
  SEL v18 = a2;
  uint64_t v17 = (float *)a3;
  uint64_t v16 = (float *)a4;
  char v15 = 0;
  [+[CBAODState sharedInstance] whitepointDeltaThreshold];
  float v14 = v4;
  float v11 = 0.0;
  float v10 = 0.0;
  int v9 = 0;
  CFXGetWPFromMatrix((uint64_t)v19->_flipbookCache, v17, &v13, &v9);
  CFXChromaticity2uv((float *)&v13, &v21);
  float v11 = CFXChromaticity2CCT((float *)&v13);
  CFXGetWPFromMatrix((uint64_t)v19->_flipbookCache, v16, &v12, &v9);
  CFXChromaticity2uv((float *)&v12, &v23);
  float v10 = CFXChromaticity2CCT((float *)&v12);
  float v8 = std::__math::sqrt[abi:ne180100]((float)((float)(v24 - v22) * (float)(v24 - v22)) + (float)((float)(v23 - v21)
                                                                                                * (float)(v23 - v21)));
  if (v8 >= v14) {
    char v15 = 1;
  }
  if (v19->super._logHandle)
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_8_4_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v20, v15 & 1, COERCE__INT64(v8), COERCE__INT64(*(float *)&v13), COERCE__INT64(*((float *)&v13 + 1)), COERCE__INT64(v11), COERCE__INT64(*(float *)&v12), COERCE__INT64(*((float *)&v12 + 1)), COERCE__INT64(v10));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "WP update = %d    delta uv = %f   current (%f;%f) CCT = %f -> target (%f;%f) CCT = %f",
      v20,
      0x4Eu);
  }
  return v15 & 1;
}

- (void)updateEDRHeadroom:(float)a3
{
  self->_currentEDRHeadroom = a3;
  *(float *)&double v3 = self->_currentEDRHeadroom;
  [(CBBrightnessProxy *)self->_brtCtl setHeadroom:v3];
}

- (void)initialiseFlipBookWithLength:(float)a3 frequency:(int)a4 lux:(float)a5
{
  SEL v18 = self;
  SEL v17 = a2;
  float v16 = a3;
  int v15 = a4;
  float v14 = a5;
  *(void *)&v13[8] = 0;
  v13[0] = 2;
  *(_DWORD *)&v13[5] = 79;
  *(_DWORD *)&v13[1] = 23;
  *(void *)&uint8_t v13[15] = __PAIR64__(LODWORD(a5), LODWORD(a3));
  *(_WORD *)&v13[13] = a4;
  memset(__b, 0, sizeof(__b));
  __b[0] = LODWORD(v18->_currentSDRBrightness);
  __b[1] = LODWORD(v18->_currentBrightnessLimit);
  __b[2] = LODWORD(v18->_currentAAPFactor);
  [*(id *)&v18->_liveUpdatesOverride currentStrength];
  __b[3] = v5;
  [*(id *)&v18->_liveUpdatesOverride lux];
  __b[4] = v6;
  [*(id *)&v18->_currentDisplayNits currentStrength];
  __b[5] = v7;
  [*(id *)&v18->_currentDisplayNits lux];
  __b[6] = v8;
  memcpy(&__b[7], &v18->_thresholdModule, 0x30uLL);
  int v9 = [CBAODFlipBookWrapper alloc];
  *(_OWORD *)float v11 = *(_OWORD *)v13;
  *(void *)&v11[15] = *(void *)&v13[15];
  memcpy(__dst, __b, sizeof(__dst));
  *(void *)&v18->_currentFlipBookEntry.ammoliteStrength_set = [(CBAODFlipBookWrapper *)v9 initWithHeader:v11 andOrigin:__dst];
}

- (void)updateFlipBookEntryWithBrightness:(float)a3
{
  self->_float currentSDRBrightness = a3;
  *(float *)(&self->_currentFlipBookEntry.brightness_set + 1) = a3;
  self->_currentFlipBookEntry.brightness_set = 1;
}

- (void)updateFlipBookEntryWithBrightnessLimit:(float)a3
{
  self->_currentBrightnessLimit = a3;
  *(float *)&self->_currentFlipBookEntry.pccfactor_set = a3;
  HIBYTE(self->_currentFlipBookEntry.whitepoint[2][2]) = 1;
}

- (void)updateFlipBookEntryWithAAPFactor:(float)a3
{
  self->_currentAAPFactor = a3;
  *(float *)((char *)&self->_currentFlipBookEntry.whitepoint[2][1] + 3) = a3;
  BYTE2(self->_currentFlipBookEntry.whitepoint[2][1]) = 1;
}

- (void)updateFlipBookEntryWithTwilightLux:(float)a3
{
  *(float *)(&self->_currentFlipBookEntry.brightnessLimit_set + 1) = a3;
}

- (void)updateFlipBookEntryWithTwilightStrength:(float)a3
{
  *(float *)((char *)&self->_currentFlipBookEntry.pccfactor + 1) = a3;
  LOBYTE(self->_currentFlipBookEntry.pccfactor) = 1;
}

- (void)updateFlipBookEntryWithAmmoliteLux:(float)a3
{
  *(float *)(&self->_currentFlipBookEntry.lowAmbientAdaptationStrength_set + 2) = a3;
}

- (void)updateFlipBookEntryWithAmmoliteStrength:(float)a3
{
  *(float *)((char *)&self->_currentFlipBookEntry.brightnessLimit + 2) = a3;
  BYTE1(self->_currentFlipBookEntry.brightnessLimit) = 1;
}

- (void)addFlipBookEntry:(id *)a3
{
  double v28 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  p_isa = (id *)&self->super.super.isa;
  v35[2] = a2;
  v35[1] = a3;
  if (*(void *)&self->_currentFlipBookEntry.ammoliteStrength_set)
  {
    [p_isa[31] appendFlipBookEntry:v28];
    v35[0] = 0;
    int v34 = 0;
    [p_isa chromaticity:v35 andIlluminance:&v34 fromMatrix:(char *)&v28->var2 + 2];
    os_log_t oslog = 0;
    if (p_isa[2])
    {
      os_log_t v27 = (os_log_t)p_isa[2];
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t v27 = inited;
    }
    os_log_t oslog = v27;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog;
      *(_DWORD *)float v24 = type;
      int var0 = v28->var0;
      *(double *)&uint64_t v4 = *(float *)(&v28->var1 + 1);
      int v5 = "set";
      if (v28->var1) {
        int v6 = "set";
      }
      else {
        int v6 = "not set";
      }
      if (BYTE1(v28->var2)) {
        int v7 = "set";
      }
      else {
        int v7 = "not set";
      }
      *(double *)&uint64_t v8 = *(float *)((char *)&v28->var4[2][1] + 3);
      if (BYTE2(v28->var4[2][1])) {
        int v9 = "set";
      }
      else {
        int v9 = "not set";
      }
      *(double *)&uint64_t v10 = *(float *)&v28->var5;
      if (HIBYTE(v28->var4[2][2])) {
        float v11 = "set";
      }
      else {
        float v11 = "not set";
      }
      *(double *)&uint64_t v12 = *(float *)((char *)&v28->var6 + 1);
      if (LOBYTE(v28->var6)) {
        uint64_t v13 = "set";
      }
      else {
        uint64_t v13 = "not set";
      }
      *(double *)&uint64_t v14 = *(float *)(&v28->var7 + 1);
      *(double *)&uint64_t v15 = *(float *)((char *)&v28->var8 + 2);
      if ((BYTE1(v28->var8) & 1) == 0) {
        int v5 = "not set";
      }
      *(double *)&uint64_t v16 = *(float *)(&v28->var9 + 2);
      float v22 = &v17;
      buf = v37;
      __os_log_helper_16_2_16_4_0_8_0_8_32_8_0_8_0_8_32_8_0_8_32_8_0_8_32_8_0_8_32_8_0_8_0_8_32_8_0((uint64_t)v37, var0, v4, (uint64_t)v6, COERCE__INT64(*(float *)v35), COERCE__INT64(*((float *)v35 + 1)), (uint64_t)v7, v8, (uint64_t)v9, v10, (uint64_t)v11, v12, (uint64_t)v13, v14, v15, (uint64_t)v5, v16);
      _os_log_impl(&dword_1BA438000, log, v24[0], "[AOD update][DCP] Pushing FB entry[%d], brightness = %f (%s); WP = (%f; %f) (%s), pcc = %f (%s), brightness limi"
        "t = %f (%s), twilight = %f (%s), twilightLux = %f, ammolite = %f (%s), ammoliteLux = %f",
        buf,
        0x9Eu);
    }
  }
  else
  {
    os_log_t v31 = 0;
    if (p_isa[2])
    {
      os_log_t v21 = (os_log_t)p_isa[2];
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        float v20 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        float v20 = init_default_corebrightness_log();
      }
      os_log_t v21 = v20;
    }
    os_log_t v31 = v21;
    os_log_type_t v30 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      os_log_t v18 = v31;
      v19[0] = v30;
      __os_log_helper_16_0_0(v29);
      _os_log_error_impl(&dword_1BA438000, v18, v19[0], "[AOD update][DCP] Flipbook cache doesn't exists. failed to add Flipbook entry.", v29, 2u);
    }
  }
}

- (BOOL)sendCurrentFlipBook
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  float v22 = self;
  SEL v21 = a2;
  char v20 = 0;
  if (*(void *)&self->_currentFlipBookEntry.ammoliteStrength_set)
  {
    id v19 = 0;
    id v19 = (id)[*(id *)&v22->_currentFlipBookEntry.ammoliteStrength_set newFlipBookData];
    os_log_t v18 = 0;
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
    os_log_t v18 = logHandle;
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v19 length];
      int v9 = *(void **)&v22->_currentFlipBookEntry.ammoliteStrength_set;
      if (v9) {
        [v9 header];
      }
      else {
        memset(&v16[16], 0, 23);
      }
      int v7 = *(void **)&v22->_currentFlipBookEntry.ammoliteStrength_set;
      if (v7)
      {
        [v7 header];
      }
      else
      {
        uint64_t v15 = 0;
        *(void *)uint64_t v16 = 0;
        *(void *)&v16[7] = 0;
      }
      __os_log_helper_16_0_3_8_0_4_0_8_0((uint64_t)v23, v8, *(int *)&v16[25], COERCE__INT64(*(float *)&v16[7]));
      _os_log_impl(&dword_1BA438000, v18, v17, "[AOD update][DCP] Sending FlipBook to DCP (size = %lu), number of updates = %d, transition length = %f", v23, 0x1Cu);
    }
    -[CBAPEndpoint sendOOBCommand:inputBuffer:inputBufferSize:](v22->_endpoint, "sendOOBCommand:inputBuffer:inputBufferSize:", 236, [v19 bytes], objc_msgSend(v19, "length"));
    [*(id *)&v22->_currentFlipBookEntry.ammoliteStrength_set setSubmissionTimestamp:CFAbsoluteTimeGetCurrent()];
  }
  else
  {
    os_log_t oslog = 0;
    if (v22->super._logHandle)
    {
      int v6 = v22->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v5 = init_default_corebrightness_log();
      }
      int v6 = v5;
    }
    os_log_t oslog = v6;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      double v3 = oslog;
      os_log_type_t v4 = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_error_impl(&dword_1BA438000, v3, v4, "[AOD update][DCP] Flipbook cache doesn't exists. failed to send Flipbook data to DCP.", v12, 2u);
    }
  }
  return v20 & 1;
}

- (BOOL)flipBookEntryForID:(int)a3 entry:(id *)a4
{
  BOOL v5 = 0;
  if (*(void *)&self->_currentFlipBookEntry.ammoliteStrength_set) {
    return [*(id *)&self->_currentFlipBookEntry.ammoliteStrength_set getEntry:a4 forID:a3] & 1;
  }
  return v5;
}

- (BOOL)currentFlipBookEntry:(id *)a3
{
  BOOL v4 = 0;
  if (![(CBRampManager *)self->_rampManager liveUpdates]) {
    return [(CBAODTransitionController *)self flipBookEntryForID:[(CBAODTransitionController *)self currentTransitionUpdateID] entry:a3];
  }
  return v4;
}

- (BOOL)liveUpdates
{
  return [(CBRampManager *)self->_rampManager liveUpdates];
}

- (void)setLiveUpdates:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v8 = a3;
  if (LOBYTE(self->_targetWhitepoint.matrix[2][0]))
  {
    BOOL v8 = 1;
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
      __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)"enabled");
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Live updates overrided to %s", v11, 0xCu);
    }
  }
  else
  {
    if (self->super._logHandle)
    {
      BOOL v5 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v4 = init_default_corebrightness_log();
      }
      BOOL v5 = v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v8) {
        double v3 = "enabled";
      }
      else {
        double v3 = "disabled";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v10, (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEFAULT, "Live updates %s", v10, 0xCu);
    }
  }
  if (v8 != [(CBRampManager *)self->_rampManager liveUpdates])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(CBBrightnessProxy *)self->_brtCtl setAllowUpdates:v8];
    }
    [(CBRampManager *)self->_rampManager setLiveUpdates:v8];

    *(void *)&self->_currentFlipBookEntry.ammoliteStrength_set = 0;
    [(CBBrightnessProxy *)self->_brtCtl setBrightnessControlDisabled:!v8];
  }
}

- (BOOL)cancelDCPTransition
{
  uint64_t v12 = self;
  SEL v11 = a2;
  uint64_t v10 = 0;
  if (self->super._logHandle)
  {
    logHandle = v12->super._logHandle;
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
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v10;
    os_log_type_t type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_impl(&dword_1BA438000, log, type, "Cancel DCP transition", v8, 2u);
  }
  char v7 = 1;
  [(CBAPEndpoint *)v12->_endpoint sendCommand:230 inputBuffer:&v7 inputBufferSize:1];
  return v7 & 1;
}

- (void)enableDCPFlipBookUpdates:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  if (self->super._logHandle)
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
    if (v6) {
      double v3 = "Enable";
    }
    else {
      double v3 = "Disable";
    }
    __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)v3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "%s DCP Flipbook updates", v9, 0xCu);
  }
  [(CBAPEndpoint *)v8->_endpoint sendCommand:237 inputBuffer:&v6 inputBufferSize:1];
}

- (int)currentTransitionUpdateID
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v9 = -1;
  id v8 = [(CBAPEndpoint *)self->_endpoint copyProperty:@"CurrentFlipBookUpdateID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v9 = [v8 intValue];
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
      __os_log_helper_16_0_1_4_0((uint64_t)v12, v9);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Current update ID of DCP transition is %d", v12, 8u);
    }
  }
  else
  {
    if (self->super._logHandle)
    {
      BOOL v5 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v4 = init_default_corebrightness_log();
      }
      BOOL v5 = v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      __os_log_helper_16_2_1_8_32((uint64_t)v11, v2);
      _os_log_error_impl(&dword_1BA438000, v5, OS_LOG_TYPE_ERROR, "Returned property is not an NSNumber!, class: %s", v11, 0xCu);
    }
  }

  return v9;
}

- (float)transitionDurationFromCurrent:(float)a3 toTarget:(float)a4
{
  float v8 = 0.0;
  float v7 = BULuminanceToPerceptual(a3, self->_minNits, self->_maxNits);
  float v6 = BULuminanceToPerceptual(a4, self->_minNits, self->_maxNits) - v7;
  for (int i = 0; i < 13; ++i)
  {
    if (v6 <= _timeContantTable[2 * i])
    {
      if (i) {
        return _timeContantTable[2 * i - 1]
      }
             + (float)((float)((float)(v6 - _timeContantTable[2 * i - 2])
                             / (float)(_timeContantTable[2 * i] - _timeContantTable[2 * i - 2]))
                     * (float)(_timeContantTable[2 * i + 1] - _timeContantTable[2 * i - 1]));
      else {
        return 5.0;
      }
    }
  }
  return v8;
}

- (id)copyContext
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
  *(float *)&double v2 = self->_currentSDRBrightness;
  uint64_t v7 = [NSNumber numberWithFloat:v2];
  *(float *)&double v3 = self->_currentEDRHeadroom;
  int v9 = objc_msgSend(v8, "initWithObjectsAndKeys:", v7, @"NitsPhysical", objc_msgSend(NSNumber, "numberWithFloat:", v3), @"EDRHeadroom", 0);
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
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v11, COERCE__INT64(self->_currentSDRBrightness), COERCE__INT64(self->_currentEDRHeadroom));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Captured context, current Nits = %f, _currentEDRHeadroom = %f", v11, 0x16u);
  }
  return v9;
}

- (float)getFloatValueFrom:(id)a3 key:(id)a4
{
  float v7 = 0.0;
  float v6 = (void *)[a3 objectForKey:a4];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      return v4;
    }
  }
  return v7;
}

- (float)getFloatValueFrom:(id)a3 key:(id)a4 subkey:(id)a5
{
  float v9 = 0.0;
  id v8 = (void *)[a3 objectForKey:a4];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v7 = (void *)[v8 objectForKey:a5];
      if (v7)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v7 floatValue];
          return v5;
        }
      }
    }
  }
  return v9;
}

- (void)logTransitionParameters:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
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
    BOOL var0 = a3->var0;
    if (a3->var3) {
      float var4 = a3->var4;
    }
    else {
      float var4 = -1.0;
    }
    if (a3->var5) {
      float var6 = a3->var6;
    }
    else {
      float var6 = -1.0;
    }
    if (a3->var7) {
      float var8 = a3->var8;
    }
    else {
      float var8 = -1.0;
    }
    if (a3->var9) {
      float var10 = a3->var10;
    }
    else {
      float var10 = -1.0;
    }
    if (a3->var11) {
      float var12 = a3->var12;
    }
    else {
      float var12 = -1.0;
    }
    if (*(void *)&self->_liveUpdatesOverride)
    {
      [*(id *)&self->_liveUpdatesOverride aodRampDuration];
      float v7 = v3;
    }
    else
    {
      float v7 = NAN;
    }
    if (*(void *)&self->_currentDisplayNits)
    {
      [*(id *)&self->_currentDisplayNits aodRampDuration];
      float v6 = v4;
    }
    else
    {
      float v6 = NAN;
    }
    if (a3->var13) {
      float var14 = a3->var14;
    }
    else {
      float var14 = -1.0;
    }
    __os_log_helper_16_0_9_4_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v18, var0, COERCE__INT64(var4), COERCE__INT64(var6), COERCE__INT64(var8), COERCE__INT64(var10), COERCE__INT64(var12), COERCE__INT64(v7), COERCE__INT64(v6), COERCE__INT64(var14));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "[Transition Parameters] force update = %d, transition lengths: general = %f, brightness = %f, whitepoint = %f, pcc = %f, EDR = %f, Twilight = %f, Ammolite = %f, brightness limit = %f", v18, 0x58u);
  }
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  if (self->super._notificationBlock) {
    (*((void (**)(void))self->super._notificationBlock + 2))();
  }
}

- (float)calculateSpringProgressForLinearProgress:(float)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [+[CBAODState sharedInstance] AODTransitionProfileSpring_mass];
  float v18 = v3;
  [+[CBAODState sharedInstance] AODTransitionProfileSpring_stiffness];
  float v17 = v4;
  [+[CBAODState sharedInstance] AODTransitionProfileSpring_velocity];
  float v16 = v5;
  [+[CBAODState sharedInstance] AODTransitionProfileSpring_damping];
  float v15 = v6;
  float v13 = std::__math::sqrt[abi:ne180100](v17 / v18);
  float v14 = v15 / (float)(2.0 * std::__math::sqrt[abi:ne180100](v17 * v18));
  if (v14 >= 1.0)
  {
    float v19 = (float)((float)((float)(v13 - v16) * a3) + 1.0) * std::__math::exp[abi:ne180100](-(float)(a3 * v13));
  }
  else
  {
    float v12 = v13 * std::__math::sqrt[abi:ne180100](1.0 - (float)(v14 * v14));
    float v11 = std::__math::exp[abi:ne180100]((float)-(float)(a3 * v14) * v13);
    float v10 = std::__math::cos[abi:ne180100](v12 * a3);
    float v19 = v11
        * (float)((float)((float)((float)-(float)(v16 - (float)(v14 * v13)) / v12)
                        * std::__math::sin[abi:ne180100](v12 * a3))
                + (float)(1.0 * v10));
  }
  float v20 = 1.0 - v19;
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
    __os_log_helper_16_0_6_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v23, COERCE__INT64(v18), COERCE__INT64(v17), COERCE__INT64(v16), COERCE__INT64(v15), COERCE__INT64(v20), COERCE__INT64(a3));
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "spring (mass=%f | stiff=%f | vel=%f | damp=%f) = %f for input = %f", v23, 0x3Eu);
  }
  return v20;
}

- (float)calculateSigmoidProgressForLinearProgress:(float)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [+[CBAODState sharedInstance] AODTransitionProfileEaseInOut_K];
  float v14 = *(float *)&v3;
  [(CBAODTransitionController *)self sigmoidFunction:v3];
  float v5 = 0.5 / v4;
  float v12 = v5;
  *(float *)&double v6 = -(float)(v14 * (float)((float)(2.0 * a3) + -1.0));
  [(CBAODTransitionController *)self sigmoidFunction:v6];
  float v8 = 1.0 - ((float)(v12 * v7) + 0.5);
  float v13 = v8;
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
    __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v17, COERCE__INT64(v14), COERCE__INT64(v13), COERCE__INT64(a3));
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "sigmoid (K=%f) = %f for input = %f", v17, 0x20u);
  }
  return v13;
}

- (float)sigmoidFunction:(float)a3
{
  return (float)(1.0 / (float)(std::__math::exp[abi:ne180100](-a3) + 1.0)) - 0.5;
}

- (BOOL)liveUpdatesOverride
{
  return LOBYTE(self->_targetWhitepoint.matrix[2][0]) & 1;
}

- (void)setLiveUpdatesOverride:(BOOL)a3
{
  LOBYTE(self->_targetWhitepoint.matrix[2][0]) = a3;
}

- (float)nitsOverride
{
  return self->_targetWhitepoint.matrix[2][1];
}

- (void)setNitsOverride:(float)a3
{
  self->_targetWhitepoint.matrix[2][1] = a3;
}

- (void)setCurrentDisplayNits:(float)a3
{
  self->_targetWhitepoint.matrix[2][2] = a3;
}

- (float)brightnessFactor
{
  return self->_targetWhitepoint.xy.x;
}

- (void)setBrightnessFactor:(float)a3
{
  self->_targetWhitepoint.xy.x = a3;
}

- (BOOL)displayON
{
  return BYTE1(self->_targetWhitepoint.matrix[2][0]) & 1;
}

- (float)remainingTransitionLength
{
  return self->_targetWhitepoint.xy.y;
}

- (void)setRemainingTransitionLength:(float)a3
{
  self->_targetWhitepoint.xy.y = a3;
}

- (CBTwilight)twilight
{
  return (CBTwilight *)objc_getProperty(self, a2, 400, 1);
}

- (void)setTwilight:(id)a3
{
}

- (CBAmmolite)ammolite
{
  return (CBAmmolite *)objc_getProperty(self, a2, 408, 1);
}

- (void)setAmmolite:(id)a3
{
}

- (CBIndicatorBrightnessModule)indicator
{
  return (CBIndicatorBrightnessModule *)objc_getProperty(self, a2, 416, 1);
}

- (void)setIndicator:(id)a3
{
}

@end