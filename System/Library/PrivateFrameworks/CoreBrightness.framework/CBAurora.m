@interface CBAurora
- (BOOL)aodIsOn;
- (BOOL)autoBrightnessIsAvailable;
- (BOOL)autoBrightnessIsEnabled;
- (BOOL)autoDimIsEnabled;
- (BOOL)displayIsOn;
- (BOOL)dominoModeIsEnabled;
- (BOOL)energyConsumptionExceeded;
- (BOOL)entryConditionsSatisfied;
- (BOOL)isActive;
- (BOOL)isBoostingBrightness;
- (BOOL)isEnabled;
- (BOOL)lowPowerModeIsEnabled;
- (BOOL)rampInProgress;
- (CBAurora)initWithQueue:(id)a3 andDisplayModule:(id)a4 andBrtCapabilities:(id)a5;
- (CBAurora)initWithQueue:(id)a3 andDisplayModule:(id)a4 andBrtCapabilities:(id)a5 andFrameStats:(id)a6;
- (float)autoDimRampLength;
- (float)calculateCurrentLuxTargetScaler;
- (float)calculateCurrentRampDownTargetForAPCE:(float)a3;
- (float)calculateCurrentRampUpTargetForAPCE:(float)a3;
- (float)calculateEnergyConsumptionCap;
- (float)calculateLuxTargetScaler:(float)a3;
- (float)calculateNumberOfStopsForCurrentScaler:(float)a3 andRequestedScaler:(float)a4;
- (float)calculateRampDownTargetForNits:(float)a3 andAPCE:(float)a4;
- (float)calculateRampTargetForNits:(float)a3 andAPCE:(float)a4 withTapPointAPCEMinimum:(float)a5 andTapPointAPCEMaximum:(float)a6;
- (float)calculateRampTargetScalerForNits:(float)a3;
- (float)calculateRampTimeForCurrentScaler:(float)a3 andRequestedScaler:(float)a4;
- (float)calculateRampUpTargetForNits:(float)a3 andAPCE:(float)a4;
- (float)clampScaler:(float)a3;
- (float)cltmCap;
- (float)convertScalerToNits:(float)a3;
- (float)currentEDRHeadroom;
- (float)currentEDRHeadroomRequest;
- (float)currentNits;
- (float)currentPreAuroraNits;
- (float)currentScaler;
- (float)lux;
- (float)luxActivationThreshold;
- (float)luxExitThreshold;
- (float)luxSaturationThreshold;
- (float)upoCap;
- (int)curveLevel;
- (void)dealloc;
- (void)enter;
- (void)evaluateEntryConditions;
- (void)exit;
- (void)initializeMembers:(id)a3;
- (void)processAPCESample;
- (void)rampTo:(float)a3;
- (void)restoreEDRHeadroom;
- (void)sendEDRHeadroomRequest:(float)a3;
- (void)setAODIsOn:(BOOL)a3;
- (void)setAuroraFactor:(float)a3 withFadePeriod:(float)a4;
- (void)setAutoBrightnessIsAvailable:(BOOL)a3;
- (void)setAutoBrightnessIsEnabled:(BOOL)a3;
- (void)setAutoDimIsEnabled:(BOOL)a3;
- (void)setAutoDimRampLength:(float)a3;
- (void)setCLTMCap:(float)a3;
- (void)setCPMSActivationThreshold:(float)a3;
- (void)setCurrentEDRHeadroom:(float)a3;
- (void)setCurrentEDRHeadroomRequest:(float)a3;
- (void)setCurrentNits:(float)a3;
- (void)setCurrentScaler:(float)a3;
- (void)setCurveLevel:(int)a3;
- (void)setDisplayIsOn:(BOOL)a3;
- (void)setDominoModeIsEnabled:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setLowPowerModeIsEnabled:(BOOL)a3;
- (void)setLux:(float)a3;
- (void)setPropertyForKey:(id)a3 withValue:(id)a4;
- (void)setRampDownTimeSecondsPerStop:(float)a3;
- (void)setRampInProgress:(BOOL)a3;
- (void)setRampUpTimeSecondsPerStop:(float)a3;
- (void)setUPOCap:(float)a3;
- (void)startMonitoring;
- (void)stop;
- (void)stopMonitoring;
@end

@implementation CBAurora

- (void)setPropertyForKey:(id)a3 withValue:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v50 = self;
  SEL v49 = a2;
  id v48 = a3;
  id v47 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v48 isEqualToString:@"AuroraEnabled"]) {
      -[CBAurora setIsEnabled:](v50, "setIsEnabled:", [v47 BOOLValue] & 1);
    }
    if ([v48 isEqualToString:@"AuroraFactor"])
    {
      [v47 floatValue];
      -[CBAurora setCurrentScaler:](v50, "setCurrentScaler:");
    }
    if ([v48 isEqualToString:@"AuroraRampInProgress"])
    {
      -[CBAurora setRampInProgress:](v50, "setRampInProgress:", [v47 BOOLValue] & 1);
    }
    else if ([v48 isEqualToString:@"EcoMode"])
    {
      -[CBAurora setLowPowerModeIsEnabled:](v50, "setLowPowerModeIsEnabled:", [v47 BOOLValue] & 1);
    }
    else if ([v48 isEqualToString:@"DominoStateUpdate"])
    {
      -[CBAurora setDominoModeIsEnabled:](v50, "setDominoModeIsEnabled:", [v47 BOOLValue] & 1);
    }
    else if ([v48 isEqualToString:@"AmbientAdaptiveDimming"])
    {
      if (v47)
      {
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID(v47))
        {
          int valuePtr = 0;
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v47, @"AmbientAdaptiveDimmingEnable");
          if (Value)
          {
            CFTypeID v30 = CFNumberGetTypeID();
            if (v30 == CFGetTypeID(Value)) {
              CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
            }
          }
          int v44 = 0;
          CFNumberRef v43 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v47, @"AmbientAdaptiveDimmingPeriod");
          if (v43)
          {
            CFTypeID v29 = CFNumberGetTypeID();
            if (v29 == CFGetTypeID(v43)) {
              CFNumberGetValue(v43, kCFNumberFloatType, &v44);
            }
          }
          LODWORD(v4) = v44;
          [(CBAurora *)v50 setAutoDimRampLength:v4];
          [(CBAurora *)v50 setAutoDimIsEnabled:valuePtr != 0];
        }
      }
    }
    else if ([v48 isEqualToString:@"CBDisplayPresetDisableAutoBrightness"])
    {
      -[CBAurora setAutoBrightnessIsAvailable:](v50, "setAutoBrightnessIsAvailable:", ([v47 BOOLValue] ^ 1) & 1);
    }
    else if ([v48 isEqualToString:@"DisplayOn"])
    {
      -[CBAurora setDisplayIsOn:](v50, "setDisplayIsOn:", [v47 BOOLValue] & 1);
      if (([v47 BOOLValue] & 1) == 0)
      {
        [(CBAurora *)v50 setAutoDimRampLength:0.0];
        [(CBAurora *)v50 setAutoDimIsEnabled:0];
      }
    }
    else if ([v48 isEqualToString:@"DisplayBrightnessAuto"])
    {
      -[CBAurora setAutoBrightnessIsEnabled:](v50, "setAutoBrightnessIsEnabled:", [v47 BOOLValue] & 1);
    }
    else if (([v48 isEqualToString:@"TrustedLux"] & 1) != 0 {
           || ([v48 isEqualToString:@"AggregatedLux"] & 1) != 0)
    }
    {
      [v47 floatValue];
      -[CBAurora setLux:](v50, "setLux:");
    }
    else if ([v48 isEqualToString:@"CPMS.CLTM.Cap"])
    {
      [v47 floatValue];
      -[CBAurora setCLTMCap:](v50, "setCLTMCap:");
    }
    else if ([v48 isEqualToString:@"CPMS.UPO.Cap"])
    {
      [v47 floatValue];
      -[CBAurora setUPOCap:](v50, "setUPOCap:");
    }
    else if ([v48 isEqualToString:@"AuroraGracePeriodDuration"])
    {
      os_log_t v42 = 0;
      if (v50->_log)
      {
        log = v50->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        log = inited;
      }
      os_log_t v42 = log;
      os_log_type_t v41 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        [v47 floatValue];
        __os_log_helper_16_0_1_8_0((uint64_t)v55, COERCE__INT64(v5));
        _os_log_impl(&dword_1BA438000, v42, v41, "Aurora Override | GracePeriod.Duration=%f", v55, 0xCu);
      }
      [v47 floatValue];
      v50->_gracePeriod.length = v6;
      [(CBAurora *)v50 evaluateEntryConditions];
    }
    else if ([v48 isEqualToString:@"AuroraEnergyBudget"])
    {
      os_log_t v40 = 0;
      if (v50->_log)
      {
        v26 = v50->_log;
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
      os_log_t v40 = v26;
      os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        [v47 floatValue];
        __os_log_helper_16_0_1_8_0((uint64_t)v54, COERCE__INT64(v7));
        _os_log_impl(&dword_1BA438000, v40, v39, "Aurora Override | EnergyBudget=%f", v54, 0xCu);
      }
      [v47 floatValue];
      v50->_maximumEnergyConsumption = v8;
    }
    else if ([v48 isEqualToString:@"AuroraRampUpTimeSecondsPerStopOverride"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        os_log_t v38 = 0;
        if (v50->_log)
        {
          v24 = v50->_log;
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
        os_log_t v38 = v24;
        os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          [v47 floatValue];
          __os_log_helper_16_0_1_8_0((uint64_t)v53, COERCE__INT64(v9));
          _os_log_impl(&dword_1BA438000, v38, v37, "Aurora Override | RampUpTimeSecondsPerStop=%f", v53, 0xCu);
        }
        [v47 floatValue];
        if (v10 >= 0.0)
        {
          [v47 floatValue];
          -[CBAurora setRampUpTimeSecondsPerStop:](v50, "setRampUpTimeSecondsPerStop:");
        }
      }
    }
    else if ([v48 isEqualToString:@"AuroraRampDownTimeSecondsPerStopOverride"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        os_log_t v36 = 0;
        if (v50->_log)
        {
          v22 = v50->_log;
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
        os_log_t v36 = v22;
        os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          [v47 floatValue];
          __os_log_helper_16_0_1_8_0((uint64_t)v52, COERCE__INT64(v11));
          _os_log_impl(&dword_1BA438000, v36, v35, "Aurora Override | RampDownTimeSecondsPerStop=%f", v52, 0xCu);
        }
        [v47 floatValue];
        if (v12 >= 0.0)
        {
          [v47 floatValue];
          -[CBAurora setRampDownTimeSecondsPerStop:](v50, "setRampDownTimeSecondsPerStop:");
        }
      }
    }
    else if ([v48 isEqualToString:@"BrightnessCurveLevel"])
    {
      if (CBU_IsWatch())
      {
        -[CBAurora setCurveLevel:](v50, "setCurveLevel:", [v47 intValue]);
      }
      else
      {
        v34 = 0;
        if (v50->_log)
        {
          v20 = v50->_log;
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
        v34 = v20;
        char v33 = 2;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v17 = v34;
          os_log_type_t v18 = v33;
          __os_log_helper_16_0_0(v32);
          _os_log_debug_impl(&dword_1BA438000, v17, v18, "Aurora Curve Level | Ignoring curve level on iOS", v32, 2u);
        }
      }
    }
    else if ([v48 isEqualToString:@"FrameInfoLoggingEnabled"])
    {
      -[CBFrameStats enableFrameInfoLogging:](v50->_frameStats, "enableFrameInfoLogging:", [v47 BOOLValue] & 1);
    }
    else if ([v48 isEqualToString:@"AuroraEDRDurationPerStop"])
    {
      if (v50->_log)
      {
        v16 = v50->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v15 = init_default_corebrightness_log();
        }
        v16 = v15;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        [v47 floatValue];
        __os_log_helper_16_0_1_8_0((uint64_t)v51, COERCE__INT64(v13));
        _os_log_impl(&dword_1BA438000, v16, OS_LOG_TYPE_DEFAULT, "Aurora Override | setting CBAuroraEDRDurationPerStop = %f", v51, 0xCu);
      }
      [v47 floatValue];
      v50->_edrDurationPerStop = v14;
    }
  }
}

- (BOOL)isBoostingBrightness
{
  return !float_equal(self->_currentScaler, 1.0);
}

- (void)setLux:(float)a3
{
  self->_lux = a3;
  [(CBAurora *)self evaluateEntryConditions];
}

- (void)evaluateEntryConditions
{
  if ([(CBAurora *)self entryConditionsSatisfied]) {
    [(CBAurora *)self enter];
  }
  else {
    [(CBAurora *)self exit];
  }
}

- (void)exit
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v27 = self;
  SEL v26 = a2;
  if (self->_isMonitoring)
  {
    uint64_t v25 = 0;
    if (v27->_log)
    {
      float v13 = v27->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      float v13 = inited;
    }
    uint64_t v25 = v13;
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      log = v25;
      os_log_type_t type = v24;
      __os_log_helper_16_0_0(v23);
      _os_log_impl(&dword_1BA438000, log, type, "Aurora Exit | Start", v23, 2u);
    }
    [(CBAurora *)v27 stopMonitoring];
    HIDWORD(v3) = 0;
    float autoDimRampLength = 0.0;
    if (v27->_autoBrightnessIsAvailable)
    {
      *(float *)&double v3 = v27->_currentScaler;
      LODWORD(v2) = 1.0;
      [(CBAurora *)v27 calculateRampTimeForCurrentScaler:v3 andRequestedScaler:v2];
      float v9 = v4;
    }
    else
    {
      float v9 = 0.0;
    }
    float autoDimRampLength = v9;
    if (v27->_autoDimIsEnabled) {
      float autoDimRampLength = v27->_autoDimRampLength;
    }
    if (!v27->_displayIsOn)
    {
      float autoDimRampLength = 0.0;
      v27->_edrHeadroomRestorePending = 0;
    }
    if (v27->_aodIsOn) {
      float autoDimRampLength = 0.0;
    }
    if (!v27->_autoBrightnessIsEnabled && CBU_IsWatch()) {
      float autoDimRampLength = 0.0;
    }
    -[CBAurora setAuroraFactor:withFadePeriod:](v27, "setAuroraFactor:withFadePeriod:");
    if (float_equal(v27->_currentScaler, 1.0) && v27->_edrHeadroomRestorePending) {
      [(CBAurora *)v27 restoreEDRHeadroom];
    }
    if (!v27->_ignoreSessionLimit && [(CBAurora *)v27 energyConsumptionExceeded])
    {
      os_log_t v21 = 0;
      if (v27->_log)
      {
        float v8 = v27->_log;
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
      os_log_t v21 = v8;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v28, COERCE__INT64(v27->_currentEnergyConsumption), COERCE__INT64(v27->_maximumEnergyConsumption));
        _os_log_impl(&dword_1BA438000, v21, v20, "Aurora GracePeriod | Start=YES EnergyConsumption=%.0f EnergyBudget=%.0f", v28, 0x16u);
      }
      v27->_gracePeriod.active = 1;
      v27->_gracePeriod.start = mach_time_now_in_seconds();
      dispatch_time_t v5 = dispatch_time(0, (uint64_t)(float)(v27->_gracePeriod.length * 1000000000.0));
      queue = v27->_queue;
      uint64_t block = MEMORY[0x1E4F143A8];
      int v15 = -1073741824;
      int v16 = 0;
      v17 = __16__CBAurora_exit__block_invoke;
      os_log_type_t v18 = &unk_1E6218FE0;
      uint64_t v19 = v27;
      dispatch_after(v5, queue, &block);
    }
    v27->_rtplc.rampInProgress = 0;
    v27->_currentEnergyConsumption = 0.0;
  }
}

- (BOOL)entryConditionsSatisfied
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  BOOL isEnabled = self->_isEnabled;
  BOOL displayIsOn = self->_displayIsOn;
  float lux = self->_lux;
  [(CBAurora *)self luxActivationThreshold];
  BOOL v33 = lux >= v2;
  BOOL autoBrightnessIsEnabled = 0;
  if (self->_autoBrightnessIsAvailable) {
    BOOL autoBrightnessIsEnabled = self->_autoBrightnessIsEnabled;
  }
  BOOL v32 = !self->_lowPowerModeIsEnabled;
  BOOL v31 = !self->_dominoModeIsEnabled;
  BOOL v30 = !self->_autoDimIsEnabled;
  BOOL v24 = 1;
  if (self->_gracePeriod.active) {
    BOOL v24 = (float)(mach_time_now_in_seconds() - self->_gracePeriod.start) > self->_gracePeriod.length;
  }
  BOOL v29 = !self->_aodIsOn;
  BOOL v28 = self->_cpms.cltmCap > (float)(self->_cpms.activationThreshold * self->_cpms.entryDelta);
  BOOL v27 = self->_cpms.upoCap > (float)(self->_cpms.activationThreshold * self->_cpms.entryDelta);
  if ([(CBAurora *)self isActive])
  {
    BOOL v28 = self->_cpms.cltmCap > self->_cpms.activationThreshold;
    BOOL v27 = self->_cpms.upoCap > self->_cpms.activationThreshold;
    float v23 = self->_lux;
    [(CBAurora *)self luxExitThreshold];
    BOOL v33 = v23 >= v3;
  }
  BOOL v22 = 0;
  if (isEnabled)
  {
    BOOL v22 = 0;
    if (displayIsOn)
    {
      BOOL v22 = 0;
      if (v33)
      {
        BOOL v22 = 0;
        if (autoBrightnessIsEnabled)
        {
          BOOL v22 = 0;
          if (v32)
          {
            BOOL v22 = 0;
            if (v31)
            {
              BOOL v22 = 0;
              if (v30)
              {
                BOOL v22 = 0;
                if (v24)
                {
                  BOOL v22 = 0;
                  if (v29)
                  {
                    BOOL v22 = 0;
                    if (v28) {
                      BOOL v22 = v27;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  BOOL v21 = 1;
  if (isEnabled == self->_entryConditions.auroraStateSatisfied)
  {
    BOOL v21 = 1;
    if (displayIsOn == self->_entryConditions.displayStateSatisfied)
    {
      BOOL v21 = 1;
      if (v33 == self->_entryConditions.luxSatisfied)
      {
        BOOL v21 = 1;
        if (autoBrightnessIsEnabled == self->_entryConditions.autoBrightnessSatisfied)
        {
          BOOL v21 = 1;
          if (v32 == self->_entryConditions.lowPowerModeSatisfied)
          {
            BOOL v21 = 1;
            if (v31 == self->_entryConditions.dominoModeSatisfied)
            {
              BOOL v21 = 1;
              if (v30 == self->_entryConditions.autoDimSatisfied)
              {
                BOOL v21 = 1;
                if (v24 == self->_entryConditions.gracePeriodSatisfied)
                {
                  BOOL v21 = 1;
                  if (v29 == self->_entryConditions.aodStateSatisfied)
                  {
                    BOOL v21 = 1;
                    if (v28 == self->_entryConditions.cltmSatisfied) {
                      BOOL v21 = v27 != self->_entryConditions.upoSatisfied;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (self->_entryConditions.firstEvaluation || v21)
  {
    if (self->_log)
    {
      log = self->_log;
    }
    else
    {
      uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      log = v19;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      float v4 = "YES";
      if (isEnabled) {
        dispatch_time_t v5 = "YES";
      }
      else {
        dispatch_time_t v5 = "NO";
      }
      if (displayIsOn) {
        float v6 = "YES";
      }
      else {
        float v6 = "NO";
      }
      if (v33) {
        uint64_t v7 = "YES";
      }
      else {
        uint64_t v7 = "NO";
      }
      if (autoBrightnessIsEnabled) {
        float v8 = "YES";
      }
      else {
        float v8 = "NO";
      }
      if (v32) {
        float v9 = "YES";
      }
      else {
        float v9 = "NO";
      }
      if (v31) {
        float v10 = "YES";
      }
      else {
        float v10 = "NO";
      }
      if (v30) {
        float v11 = "YES";
      }
      else {
        float v11 = "NO";
      }
      if (v24) {
        float v12 = "YES";
      }
      else {
        float v12 = "NO";
      }
      if (v29) {
        float v13 = "YES";
      }
      else {
        float v13 = "NO";
      }
      if (v28) {
        float v14 = "YES";
      }
      else {
        float v14 = "NO";
      }
      if (!v27) {
        float v4 = "NO";
      }
      __os_log_helper_16_2_11_8_32_8_32_8_32_8_32_8_32_8_32_8_32_8_32_8_32_8_32_8_32((uint64_t)v37, (uint64_t)v5, (uint64_t)v6, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14, (uint64_t)v4);
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Aurora Conditions\n{\n\tAuroraEnabled=%s\n\tDisplayOn=%s\n\tLuxOverThreshold=%s\n\tAutoBrightnessOn=%s\n\tLowPowerModeOff=%s\n\tDominoModeOff=%s\n\tAutoDimOff=%s\n\tGracePeriodInactive=%s\n\tAODOff=%s\n\tCLTMCapOverThreshold=%s\n\tUPOCapOverThreshold=%s\n}", v37, 0x70u);
    }
  }
  if (self->_entryConditions.cltmSatisfied && !v28 && [(CBAurora *)self isBoostingBrightness])
  {
    [(CBAurora *)self currentPreAuroraNits];
    *(float *)&double v16 = fminf(v15, self->_cpms.cltmCap);
    *(float *)&double v17 = self->_currentNits;
    +[CBAnalytics cltmBudgetUpdated:v16 currentSDRBrightness:v17];
  }
  self->_entryConditions.auroraStateSatisfied = isEnabled;
  self->_entryConditions.displayStateSatisfied = displayIsOn;
  self->_entryConditions.luxSatisfied = v33;
  self->_entryConditions.autoBrightnessSatisfied = autoBrightnessIsEnabled;
  self->_entryConditions.lowPowerModeSatisfied = v32;
  self->_entryConditions.dominoModeSatisfied = v31;
  self->_entryConditions.autoDimSatisfied = v30;
  self->_entryConditions.gracePeriodSatisfied = v24;
  self->_entryConditions.aodStateSatisfied = v29;
  self->_entryConditions.cltmSatisfied = v28;
  self->_entryConditions.upoSatisfied = v27;
  self->_entryConditions.firstEvaluation = 0;
  return v22;
}

- (float)luxActivationThreshold
{
  return *(float *)std::array<float,3ul>::operator[][abi:ne180100]((uint64_t)&self->_luxActivationThreshold, self->_curveLevel);
}

- (BOOL)isActive
{
  return self->_isMonitoring;
}

- (float)currentScaler
{
  return self->_currentScaler;
}

- (void)setCurrentNits:(float)a3
{
  self->_currentNits = a3;
}

- (void)setCurrentEDRHeadroom:(float)a3
{
  self->_currentEDRHeadroom = a3;
}

- (BOOL)rampInProgress
{
  return self->_rampInProgress;
}

- (void)initializeMembers:(id)a3
{
  BOOL v32 = self;
  SEL v31 = a2;
  BOOL v30 = (NSDictionary *)a3;
  self->_frameStats = 0;
  v32->_apceTimer = 0;
  v32->_float lux = 0.0;
  v32->_BOOL isEnabled = 1;
  v32->_BOOL displayIsOn = 1;
  v32->_BOOL autoBrightnessIsEnabled = 1;
  v32->_lowPowerModeIsEnabled = 0;
  v32->_dominoModeIsEnabled = 0;
  v32->_autoDimIsEnabled = 0;
  v32->_autoBrightnessIsAvailable = 1;
  v32->_aodIsOn = 0;
  v32->_currentNits = 0.0;
  v32->_currentScaler = 1.0;
  v32->_float autoDimRampLength = 0.0;
  v32->_isMonitoring = 0;
  v32->_lastFrameInfoReceivedTimestamp = 0.0;
  v32->_currentEDRHeadroom = 1.0;
  v32->_currentEDRHeadroomRequest = 1.0;
  v32->_edrHeadroomRestorePending = 0;
  v32->_rampInProgress = 0;
  v32->_lastRampTargetScaler = 1.0;
  v32->_minimumReactionNitsDelta = 65.0;
  v32->_curveLevel = 1;
  CBAuroraParams::CBAuroraParams((CBAuroraParams *)v6);
  CBAuroraParams::loadFromCapabilities((CBAuroraParams *)v6, v30);
  float v3 = v32;
  *(void *)v32->_luxActivationThreshold.__elems_ = v7;
  v3->_luxActivationThreshold.__elems_[2] = v8;
  float v4 = v32;
  *(void *)v32->_luxExitThreshold.__elems_ = v9;
  v4->_luxExitThreshold.__elems_[2] = v10;
  dispatch_time_t v5 = v32;
  *(void *)v32->_luxSaturationThreshold.__elems_ = v11;
  v5->_luxSaturationThreshold.__elems_[2] = v12;
  v32->_nitsMinimum = v14;
  v32->_nitsMaximum = v13;
  v32->_minimumScaler = 1.0;
  v32->_maximumScaler = v32->_nitsMaximum / v32->_nitsMinimum;
  v32->_apceSamplingRate = 1.0;
  v32->_averageAPCESamplingRate = v15;
  v32->_ignorePeakAPCE = v16 & 1;
  v32->_rampUpTimeSecondsPerStop = v17;
  v32->_rampDownTimeSecondsPerStop = v18;
  v32->_rampUpTapPointAPCEMinimum = v20;
  v32->_rampUpTapPointAPCEMaximum = v21;
  v32->_rampDownTapPointAPCEMinimum = v22;
  v32->_rampDownTapPointAPCEMaximum = v23;
  v32->_maximumEnergyConsumption = v26 * v32->_nitsMaximum;
  v32->_currentEnergyConsumption = 0.0;
  v32->_ignoreSessionLimit = v27 & 1;
  v32->_ignoreAPCE = v28 & 1;
  v32->_allowEDR = v29 & 1;
  v32->_edrDurationPerStop = v19;
  v32->_gracePeriod.active = 0;
  v32->_gracePeriod.start = 0.0;
  v32->_gracePeriod.length = 0.0;
  v32->_rtplc.targetMargin = 1.0;
  v32->_rtplc.rampInProgress = 0;
  v32->_rtplc.targetScaler = 1.0;
  v32->_rtplc.tripMaxBrightness = 0.0;
  *(_WORD *)&v32->_entryConditions.firstEvaluation = 1;
  v32->_entryConditions.displayStateSatisfied = 0;
  v32->_entryConditions.luxSatisfied = 0;
  v32->_entryConditions.autoBrightnessSatisfied = 0;
  v32->_entryConditions.lowPowerModeSatisfied = 0;
  v32->_entryConditions.dominoModeSatisfied = 0;
  v32->_entryConditions.autoDimSatisfied = 0;
  v32->_entryConditions.gracePeriodSatisfied = 0;
  v32->_entryConditions.aodStateSatisfied = 0;
  v32->_entryConditions.cltmSatisfied = 0;
  v32->_entryConditions.upoSatisfied = 0;
  v32->_cpms.cltmCap = v32->_nitsMaximum;
  v32->_cltmCap = v32->_nitsMaximum;
  v32->_cpms.upoCap = v32->_nitsMaximum;
  v32->_upoCap = v32->_nitsMaximum;
  v32->_cpms.activationThreshold = v24;
  v32->_cpms.entryDelta = v25;
}

- (CBAurora)initWithQueue:(id)a3 andDisplayModule:(id)a4 andBrtCapabilities:(id)a5
{
  float v6 = [[CBFrameStats alloc] initWithQueue:a3];
  uint64_t v11 = [(CBAurora *)self initWithQueue:a3 andDisplayModule:a4 andBrtCapabilities:a5 andFrameStats:v6];

  return v11;
}

- (CBAurora)initWithQueue:(id)a3 andDisplayModule:(id)a4 andBrtCapabilities:(id)a5 andFrameStats:(id)a6
{
  id v25 = self;
  SEL v24 = a2;
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v20 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CBAurora;
  id v25 = [(CBAurora *)&v19 init];
  if (v25)
  {
    os_log_t v6 = os_log_create("com.apple.CoreBrightness.Aurora", "default");
    *((void *)v25 + 1) = v6;
    os_log_t oslog = 0;
    if (*((void *)v25 + 1))
    {
      float v15 = *((void *)v25 + 1);
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
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v13 = type;
      __os_log_helper_16_0_0(v16);
      _os_log_impl(&dword_1BA438000, log, v13, "Aurora Initialization | Start", v16, 2u);
    }
    *((void *)v25 + 2) = v22;
    *((void *)v25 + 3) = v23;
    dispatch_retain(*((dispatch_object_t *)v25 + 3));
    [v25 initializeMembers:v21];
    id v7 = v20;
    *((void *)v25 + 4) = v7;
    [*((id *)v25 + 4) setMovingAverageDuration:(float)(1.0 / *((float *)v25 + 30))];
    LODWORD(v8) = *((_DWORD *)v25 + 55);
    [v25 setCPMSActivationThreshold:v8];
    LODWORD(v9) = *((_DWORD *)v25 + 33);
    [v25 setRampUpTimeSecondsPerStop:v9];
    LODWORD(v10) = *((_DWORD *)v25 + 34);
    [v25 setRampDownTimeSecondsPerStop:v10];
  }
  return (CBAurora *)v25;
}

- (void)dealloc
{
  float v4 = self;
  SEL v3 = a2;

  if (v4->_queue)
  {
    dispatch_release((dispatch_object_t)v4->_queue);
    v4->_queue = 0;
  }
  if (v4->_log)
  {

    v4->_log = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBAurora;
  [(CBAurora *)&v2 dealloc];
}

- (void)enter
{
  objc_super v19 = self;
  SEL v18 = a2;
  if (!self->_isMonitoring)
  {
    float v17 = 0;
    if (v19->_log)
    {
      uint64_t v11 = v19->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      uint64_t v11 = inited;
    }
    float v17 = v11;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      log = v17;
      os_log_type_t type = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_impl(&dword_1BA438000, log, type, "Aurora Entry | Start", v15, 2u);
    }
    if (!float_equal(v19->_currentEDRHeadroomRequest, 1.0))
    {
      float v14 = 0;
      if (v19->_log)
      {
        id v7 = v19->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v6 = init_default_corebrightness_log();
        }
        id v7 = v6;
      }
      float v14 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        float v4 = v14;
        os_log_type_t v5 = v13;
        __os_log_helper_16_0_0(v12);
        _os_log_impl(&dword_1BA438000, v4, v5, "Aurora Entry | Ramping the EDR headroom to 1.0 before entering Aurora", v12, 2u);
      }
      LODWORD(v2) = 1.0;
      [(CBAurora *)v19 sendEDRHeadroomRequest:v2];
    }
    BOOL v3 = float_equal(v19->_currentEDRHeadroomRequest, 1.0);
    v19->_edrHeadroomRestorePending = !v3;
    [(CBAurora *)v19 startMonitoring];
  }
}

uint64_t __16__CBAurora_exit__block_invoke(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  double v9 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    os_log_type_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
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
  double v9 = v5;
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_impl(&dword_1BA438000, log, type, "Aurora GracePeriod | End", v7, 2u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 172) = 0;
  return [*(id *)(a1 + 32) evaluateEntryConditions];
}

- (void)startMonitoring
{
  BOOL v33 = self;
  SEL v32 = a2;
  SEL v31 = 0;
  if (self->_log)
  {
    os_log_type_t v8 = v33->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_type_t v8 = inited;
  }
  SEL v31 = v8;
  os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    log = v31;
    os_log_type_t type = v30;
    __os_log_helper_16_0_0(v29);
    _os_log_impl(&dword_1BA438000, log, type, "Aurora Sampling | Start", v29, 2u);
  }
  if (!v33->_isMonitoring)
  {
    frameStats = v33->_frameStats;
    uint64_t v23 = MEMORY[0x1E4F143A8];
    int v24 = -1073741824;
    int v25 = 0;
    float v26 = __27__CBAurora_startMonitoring__block_invoke;
    char v27 = &unk_1E621ACF0;
    char v28 = v33;
    -[CBFrameStats startMonitoring:](frameStats, "startMonitoring:");
    v33->_isMonitoring = 1;
  }
  if (!v33->_apceTimer)
  {
    dispatch_source_t v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v33->_queue);
    v33->_apceTimer = (OS_dispatch_source *)v3;
    if (v33->_apceTimer)
    {
      apceTimer = 0;
      apceTimer = v33->_apceTimer;
      dispatch_source_set_timer((dispatch_source_t)v33->_apceTimer, 0, (unint64_t)(float)((float)(1.0 / v33->_averageAPCESamplingRate) * 1000000000.0), 0);
      dispatch_block_t v21 = 0;
      uint64_t block = MEMORY[0x1E4F143A8];
      int v16 = -1073741824;
      int v17 = 0;
      SEL v18 = __27__CBAurora_startMonitoring__block_invoke_9;
      objc_super v19 = &unk_1E6218FE0;
      id v20 = v33;
      dispatch_block_t v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &block);
      float v4 = v33->_apceTimer;
      uint64_t handler = MEMORY[0x1E4F143A8];
      int v10 = -1073741824;
      int v11 = 0;
      float v12 = __27__CBAurora_startMonitoring__block_invoke_2_10;
      os_log_type_t v13 = &unk_1E6218FE0;
      float v14 = apceTimer;
      dispatch_source_set_cancel_handler(v4, &handler);
      if (v21)
      {
        dispatch_source_set_event_handler((dispatch_source_t)v33->_apceTimer, v21);
        _Block_release(v21);
      }
      dispatch_resume((dispatch_object_t)v33->_apceTimer);
    }
  }
}

void __27__CBAurora_startMonitoring__block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v14 = a1;
  os_log_type_t v13 = a2;
  uint64_t v12 = a1;
  *(float *)(*(void *)(a1 + 32) + 52) = mach_time_now_in_milliseconds();
  memcpy(__dst, v13, sizeof(__dst));
  queue = *(NSObject **)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __27__CBAurora_startMonitoring__block_invoke_2;
  os_log_type_t v8 = &unk_1E621ACC8;
  memcpy(v10, __dst, sizeof(v10));
  uint64_t v9 = *(void *)(a1 + 32);
  dispatch_async(queue, &v4);
}

uint64_t __27__CBAurora_startMonitoring__block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = a1;
  uint64_t v35 = a1;
  if (*(unsigned char *)(a1 + 86) & 1) == 0 && (*(unsigned char *)(*(void *)(a1 + 32) + 188))
  {
    os_log_t v34 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 8))
    {
      uint64_t v23 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      uint64_t v23 = inited;
    }
    os_log_t v34 = v23;
    os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(double *)&uint64_t v1 = *(float *)(*(void *)(a1 + 32) + 240);
      uint64_t v21 = v1;
      LODWORD(v1) = *(_DWORD *)(*(void *)(a1 + 32) + 192);
      [*(id *)(a1 + 32) convertScalerToNits:*(double *)&v1];
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v39, v21, COERCE__INT64(v2), COERCE__INT64(*(float *)(a1 + 92)));
      _os_log_impl(&dword_1BA438000, v34, v33, "Aurora RTPLC | CapReleased=YES CurrentNits=%f TargetNits=%f ScaleFactor=%f", v39, 0x20u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 188) = 0;
  }
  if (*(unsigned char *)(a1 + 86))
  {
    os_log_t v32 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 8))
    {
      id v20 = *(NSObject **)(*(void *)(a1 + 32) + 8);
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
    os_log_t v32 = v20;
    os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 85)) {
        uint64_t v4 = "YES";
      }
      else {
        uint64_t v4 = "NO";
      }
      if (*(unsigned char *)(a1 + 86)) {
        int v5 = "YES";
      }
      else {
        int v5 = "NO";
      }
      __os_log_helper_16_2_5_8_32_8_32_8_0_8_0_8_0((uint64_t)v38, (uint64_t)v4, (uint64_t)v5, COERCE__INT64(*(float *)(a1 + 88)), COERCE__INT64(*(float *)(*(void *)(a1 + 32) + 240)), COERCE__INT64(*(float *)(a1 + 92)));
      _os_log_impl(&dword_1BA438000, v32, v31, "Aurora RTPLC | Triggered=%s CapApplied=%s ReducedNits=%f CurrentNits=%f ScaleFactor=%f", v38, 0x34u);
    }
    *(float *)&double v3 = *(float *)(a1 + 88) - *(float *)(*(void *)(a1 + 32) + 184);
    [*(id *)(a1 + 32) calculateRampTargetScalerForNits:v3];
    *(_DWORD *)(*(void *)(a1 + 32) + 192) = v7;
    if ((*(unsigned char *)(*(void *)(a1 + 32) + 188) & 1) == 0
      || !float_equal(*(float *)(*(void *)(a1 + 32) + 56), *(float *)(*(void *)(a1 + 32) + 192)))
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 188) = 1;
      float v30 = 0.0;
      LODWORD(v6) = *(_DWORD *)(*(void *)(a1 + 32) + 192);
      [*(id *)(a1 + 32) calculateRampTimeForCurrentScaler:COERCE_DOUBLE((unint64_t)*(_DWORD *)(*(void *)(a1 + 32) + 244)) andRequestedScaler:v6];
      float v30 = v8;
      LODWORD(v9) = *(_DWORD *)(*(void *)(a1 + 32) + 192);
      *(float *)&double v10 = v30;
      [*(id *)(a1 + 32) setAuroraFactor:v9 withFadePeriod:v10];
      *(_DWORD *)(*(void *)(a1 + 32) + 56) = *(_DWORD *)(*(void *)(a1 + 32) + 192);
      os_log_t v29 = 0;
      if (*(void *)(*(void *)(a1 + 32) + 8))
      {
        SEL v18 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      }
      else
      {
        uint64_t v17 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        SEL v18 = v17;
      }
      os_log_t v29 = v18;
      os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v37, COERCE__INT64(*(float *)(*(void *)(a1 + 32) + 244)), COERCE__INT64(*(float *)(*(void *)(a1 + 32) + 192)), COERCE__INT64(v30));
        _os_log_impl(&dword_1BA438000, v29, v28, "Aurora RTPLC | CatchUpRamp=YES CurrentScaler=%f TargetScaler=%f RampTime=%f", v37, 0x20u);
      }
    }
  }
  char v27 = 0;
  char v16 = 1;
  if ((*(unsigned char *)(a1 + 85) & 1) == 0) {
    char v16 = *(unsigned char *)(a1 + 86);
  }
  char v27 = v16 & 1;
  if ([*(id *)(*(void *)(a1 + 32) + 32) tripLength] && (v27 & 1) == 0)
  {
    float v26 = 0.0;
    float v14 = mach_time_now_in_seconds();
    [*(id *)(*(void *)(a1 + 32) + 32) currentTripStartTime];
    float v26 = v14 - v11;
    uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 32) tripLength];
    [*(id *)(*(void *)(a1 + 32) + 32) tripMaxAPCE];
    +[CBAnalytics rtplcTriggeredWithLength:maxAPCE:durationInSeconds:sdrBrightness:referenceModeEnabled:](CBAnalytics, "rtplcTriggeredWithLength:maxAPCE:durationInSeconds:sdrBrightness:referenceModeEnabled:", v15, 0);
    *(_DWORD *)(*(void *)(a1 + 32) + 196) = 0;
  }
  if (![*(id *)(*(void *)(a1 + 32) + 32) tripLength] && (v27 & 1) != 0) {
    *(_DWORD *)(*(void *)(a1 + 32) + 196) = *(_DWORD *)(*(void *)(a1 + 32) + 240);
  }
  if (v27) {
    *(float *)(*(void *)(a1 + 32) + 196) = fmaxf(*(float *)(*(void *)(a1 + 32) + 240), *(float *)(*(void *)(a1 + 32) + 196));
  }
  os_log_type_t v13 = *(void **)(*(void *)(a1 + 32) + 32);
  memcpy(__dst, (const void *)(a1 + 40), sizeof(__dst));
  return [v13 processFrameInfo:__dst];
}

uint64_t __27__CBAurora_startMonitoring__block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processAPCESample", a1, a1);
}

void __27__CBAurora_startMonitoring__block_invoke_2_10(uint64_t a1)
{
}

- (void)stopMonitoring
{
  double v10 = self;
  SEL v9 = a2;
  float v8 = 0;
  if (self->_log)
  {
    int v5 = v10->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    int v5 = inited;
  }
  float v8 = v5;
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    os_log_type_t type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_1BA438000, log, type, "Aurora Sampling | Stop", v6, 2u);
  }
  if (v10->_apceTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v10->_apceTimer);
    v10->_apceTimer = 0;
  }
  [(CBFrameStats *)v10->_frameStats stopMonitoring];
  v10->_isMonitoring = 0;
  v10->_lastFrameInfoReceivedTimestamp = 0.0;
}

- (void)rampTo:(float)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(float *)&double v3 = a3;
  [(CBAurora *)self calculateRampTimeForCurrentScaler:COERCE_DOUBLE((unint64_t)LODWORD(self->_currentScaler)) andRequestedScaler:v3];
  float v9 = v4;
  if (!float_equal(self->_currentScaler, a3)
    && (!self->_rampInProgress || !float_equal(self->_lastRampTargetScaler, a3)))
  {
    *(float *)&double v5 = a3;
    *(float *)&double v6 = v9;
    [(CBAurora *)self setAuroraFactor:v5 withFadePeriod:v6];
    if (self->_log)
    {
      log = self->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      log = inited;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v12, COERCE__INT64(self->_currentScaler), COERCE__INT64(a3), COERCE__INT64(v9));
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Aurora Ramp | CurrentScaler=%f TargetScaler=%f RampTime=%f", v12, 0x20u);
    }
  }
  self->_lastRampTargetScaler = a3;
}

- (float)luxExitThreshold
{
  return *(float *)std::array<float,3ul>::operator[][abi:ne180100]((uint64_t)&self->_luxExitThreshold, self->_curveLevel);
}

- (float)luxSaturationThreshold
{
  return *(float *)std::array<float,3ul>::operator[][abi:ne180100]((uint64_t)&self->_luxSaturationThreshold, self->_curveLevel);
}

- (void)setAuroraFactor:(float)a3 withFadePeriod:(float)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA9ECAE0]();
  v10[0] = @"AuroraFactor";
  *(float *)&double v4 = a3;
  v11[0] = [NSNumber numberWithFloat:v4];
  v10[1] = @"AuroraFadePeriod";
  *(float *)&double v5 = a4;
  v11[1] = [NSNumber numberWithFloat:v5];
  -[CBDisplayModule setProperty:forKey:](self->_displayModule, "setProperty:forKey:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2], @"AuroraFactorWithFade");
}

- (BOOL)energyConsumptionExceeded
{
  return self->_currentEnergyConsumption >= self->_maximumEnergyConsumption;
}

- (float)calculateEnergyConsumptionCap
{
  if ([(CBAurora *)self energyConsumptionExceeded]) {
    return self->_nitsMinimum;
  }
  else {
    return self->_nitsMaximum;
  }
}

- (void)processAPCESample
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  v91 = self;
  SEL v90 = a2;
  if (!self->_ignoreSessionLimit && v91->_currentNits > v91->_nitsMinimum) {
    v91->_currentEnergyConsumption = v91->_currentEnergyConsumption
  }
                                   + (float)(v91->_currentNits / v91->_averageAPCESamplingRate);
  if (v91->_allowEDR || float_equal(v91->_currentEDRHeadroom, 1.0))
  {
    if (v91->_rtplc.rampInProgress)
    {
      os_log_t v86 = 0;
      if (v91->_log)
      {
        os_log_t v64 = (os_log_t)v91->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        os_log_t v64 = inited;
      }
      os_log_t v86 = v64;
      os_log_type_t v85 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t v60 = v86;
        *(_DWORD *)v61 = v85;
        *(double *)&uint64_t v2 = v91->_currentScaler;
        *(double *)&uint64_t v3 = v91->_rtplc.targetScaler;
        v62 = v93;
        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v93, v2, v3);
        _os_log_impl(&dword_1BA438000, v86, v85, "Aurora Sampling | RTPLC catch-up in progress, not processing the APCE sample | CurrentScaler=%f TargetScaler=%f", v93, 0x16u);
      }
    }
    else
    {
      float v84 = 0.0;
      if (v91->_ignoreAPCE)
      {
        float v59 = 0.0;
      }
      else
      {
        [(CBFrameStats *)v91->_frameStats getMovingAverage];
        int v58 = 1120403456;
        float v59 = std::__math::round[abi:ne180100](v4 * 100.0) / 100.0;
      }
      float v84 = v59;
      int v56 = 0;
      float v83 = 0.0;
      float v83 = v91->_nitsMinimum * v91->_currentScaler;
      [(CBAurora *)v91 calculateCurrentRampUpTargetForAPCE:COERCE_DOUBLE((unint64_t)LODWORD(v59))];
      float v82 = *(float *)&v5;
      [(CBAurora *)v91 calculateRampTargetScalerForNits:v5];
      float v81 = v6;
      *(float *)&double v7 = v59;
      [(CBAurora *)v91 calculateCurrentRampDownTargetForAPCE:v7];
      float v80 = *(float *)&v8;
      [(CBAurora *)v91 calculateRampTargetScalerForNits:v8];
      float v79 = v9;
      BOOL v78 = 0;
      BOOL v57 = 0;
      if (v82 > v83)
      {
        BOOL v57 = 0;
        if (v80 > v83)
        {
          BOOL v10 = abs[abi:ne180100](v82 - v83) > v91->_minimumReactionNitsDelta;
          BOOL v55 = 1;
          if (!v10)
          {
            float v54 = v81;
            [(CBAurora *)v91 calculateCurrentLuxTargetScaler];
            BOOL v55 = float_equal(v81, v11);
          }
          BOOL v57 = v55;
        }
      }
      BOOL v78 = v57;
      BOOL v77 = 0;
      BOOL v53 = 0;
      if (v82 < v83)
      {
        BOOL v53 = 0;
        if (v80 < v83) {
          BOOL v53 = abs[abi:ne180100](v80 - v83) > v91->_minimumReactionNitsDelta;
        }
      }
      BOOL v77 = v53;
      int v51 = 0;
      float v76 = 0.0;
      [(CBFrameStats *)v91->_frameStats getPeakAPCECap];
      float v76 = *(float *)&v12;
      [(CBAurora *)v91 calculateRampTargetScalerForNits:v12];
      float v75 = v13;
      v52 = v91;
      [(CBAurora *)v91 calculateEnergyConsumptionCap];
      -[CBAurora calculateRampTargetScalerForNits:](v91, "calculateRampTargetScalerForNits:");
      float v74 = v14;
      os_log_t v73 = 0;
      if (v91->_log)
      {
        os_log_t v50 = (os_log_t)v91->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          SEL v49 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          SEL v49 = init_default_corebrightness_log();
        }
        os_log_t v50 = v49;
      }
      os_log_t v73 = v50;
      os_log_type_t v72 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t v46 = v73;
        *(_DWORD *)id v47 = v72;
        *(double *)&uint64_t v38 = v91->_currentNits;
        [(CBAurora *)v91 currentPreAuroraNits];
        *(double *)&uint64_t v39 = v15;
        *(double *)&uint64_t v40 = v91->_currentScaler;
        *(double *)&uint64_t v41 = v91->_lux;
        *(double *)&uint64_t v42 = v84;
        *(double *)&uint64_t v43 = v82;
        *(double *)&uint64_t v44 = v80;
        char v16 = "YES";
        if (v78) {
          uint64_t v17 = "YES";
        }
        else {
          uint64_t v17 = "NO";
        }
        char v27 = v17;
        if (!v77) {
          char v16 = "NO";
        }
        os_log_type_t v28 = v16;
        [(CBFrameStats *)v91->_frameStats getPeakAPCE];
        *(double *)&uint64_t v29 = v18;
        double v30 = v76;
        *(double *)&uint64_t v31 = v91->_currentEnergyConsumption;
        *(double *)&uint64_t v32 = v91->_maximumEnergyConsumption;
        [(CBAurora *)v91 calculateEnergyConsumptionCap];
        *(double *)&uint64_t v33 = v19;
        double v34 = v81;
        double v35 = v79;
        double v36 = v75;
        double v37 = v74;
        float v20 = mach_time_now_in_milliseconds();
        *(double *)&uint64_t v21 = v91->_lastFrameInfoReceivedTimestamp;
        v45 = &v24;
        id v48 = v92;
        __os_log_helper_16_2_20_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_32_8_32_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v92, v38, v39, v40, v41, v42, v43, v44, (uint64_t)v27, (uint64_t)v28, v29, COERCE__INT64(v76), v31, v32, v33, COERCE__INT64(v81), COERCE__INT64(v79), COERCE__INT64(v75), COERCE__INT64(v74),
          COERCE__INT64(v20),
          v21);
        _os_log_impl(&dword_1BA438000, v46, v47[0], "Aurora Sampling\n{\n\tNits=%.0f\n\tPre=%.0f\n\tCurrentScaler=%f\n\tLux=%.0f\n\tAPCE=%.2f\n\tRampUp.Target=%.0f\n\tRampDown.Target=%.0f\n\tRampUp=%s\n\tRampDown=%s\n\tPeakAPCE=%.2f\n\tPeakAPCE.Cap=%.0f\n\tEnergyConsumption=%.0f\n\tEnergyConsumptionBudget=%.0f\n\tEnergyConsumption.Cap=%.0f\n"
          "\tRampUp.TargetScaler=%f\n"
          "\tRampDown.TargetScaler=%f\n"
          "\tPeakAPCE.TargetScaler=%f\n"
          "\tEnergyConsumption.TargetScaler=%f\n"
          "\tNow=%.0f\n"
          "\tLastFrameInfoReceivedTimestamp=%.0f\n"
          "}",
          v48,
          0xCAu);
      }
      float nitsMaximum = 0.0;
      float nitsMaximum = v91->_nitsMaximum;
      if (!v91->_ignorePeakAPCE) {
        float nitsMaximum = *std::min[abi:ne180100]<float>(&nitsMaximum, &v75);
      }
      float nitsMaximum = *std::min[abi:ne180100]<float>(&nitsMaximum, &v74);
      if (v78 || v77)
      {
        float v70 = 0.0;
        if (v78) {
          float v26 = v81;
        }
        else {
          float v26 = v79;
        }
        float v70 = v26;
        int v25 = v91;
        *(float *)&double v23 = *std::min[abi:ne180100]<float>(&nitsMaximum, &v70);
        [(CBAurora *)v25 rampTo:v23];
      }
      else if (v91->_currentScaler > nitsMaximum)
      {
        *(float *)&double v22 = nitsMaximum;
        [(CBAurora *)v91 rampTo:v22];
      }
    }
  }
  else
  {
    os_log_t oslog = 0;
    if (v91->_log)
    {
      os_log_t v69 = (os_log_t)v91->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        v68 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        v68 = init_default_corebrightness_log();
      }
      os_log_t v69 = v68;
    }
    os_log_t oslog = v69;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog;
      *(_DWORD *)v66 = type;
      buf = v87;
      __os_log_helper_16_0_0(v87);
      _os_log_impl(&dword_1BA438000, log, v66[0], "Aurora Sampling | We're still in EDR, not processing the APCE sample", v87, 2u);
    }
  }
}

- (void)restoreEDRHeadroom
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_edrHeadroomRestorePending)
  {
    if (self->_log)
    {
      os_log_t log = self->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t log = inited;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v6, COERCE__INT64(self->_currentEDRHeadroomRequest));
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Aurora Exit | Restoring EDR headroom to %f", v6, 0xCu);
    }
    *(float *)&double v2 = self->_currentEDRHeadroomRequest;
    [(CBAurora *)self sendEDRHeadroomRequest:v2];
    self->_edrHeadroomRestorePending = 0;
  }
}

- (void)setCurrentScaler:(float)a3
{
  self->_currentScaler = a3;
  if (![(CBAurora *)self isActive]
    && float_equal(self->_currentScaler, 1.0)
    && self->_edrHeadroomRestorePending)
  {
    [(CBAurora *)self restoreEDRHeadroom];
  }
}

- (void)setCurrentEDRHeadroomRequest:(float)a3
{
  self->_currentEDRHeadroomRequest = a3;
  if ([(CBAurora *)self isActive]
    || (LOBYTE(v3) = 0, [(CBAurora *)self isBoostingBrightness]))
  {
    BOOL v3 = !float_equal(self->_currentEDRHeadroomRequest, 1.0);
  }
  self->_edrHeadroomRestorePending = v3;
}

- (void)setIsEnabled:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3;
  if (self->_isEnabled != a3)
  {
    if (self->_log)
    {
      os_log_t log = self->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t log = inited;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        BOOL v3 = "YES";
      }
      else {
        BOOL v3 = "NO";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Aurora State | Enabled=%s", v8, 0xCu);
    }
    self->_BOOL isEnabled = v6;
    [(CBAurora *)self evaluateEntryConditions];
  }
}

- (void)setDisplayIsOn:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3;
  if (self->_displayIsOn != a3)
  {
    if (self->_log)
    {
      os_log_t log = self->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t log = inited;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        BOOL v3 = "YES";
      }
      else {
        BOOL v3 = "NO";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Aurora Display | On=%s", v8, 0xCu);
    }
    self->_BOOL displayIsOn = v6;
    [(CBAurora *)self evaluateEntryConditions];
  }
}

- (void)setAODIsOn:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3;
  if (self->_aodIsOn != a3)
  {
    if (self->_log)
    {
      os_log_t log = self->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t log = inited;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        BOOL v3 = "YES";
      }
      else {
        BOOL v3 = "NO";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Aurora AOD | On=%s", v8, 0xCu);
    }
    self->_aodIsOn = v6;
    [(CBAurora *)self evaluateEntryConditions];
  }
}

- (void)setAutoBrightnessIsEnabled:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3;
  if (self->_autoBrightnessIsEnabled != a3)
  {
    if (self->_log)
    {
      os_log_t log = self->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t log = inited;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        BOOL v3 = "YES";
      }
      else {
        BOOL v3 = "NO";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Aurora AutoBrightness | Enabled=%s", v8, 0xCu);
    }
    self->_BOOL autoBrightnessIsEnabled = v6;
    [(CBAurora *)self evaluateEntryConditions];
  }
}

- (void)setCurveLevel:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  float v15 = self;
  SEL v14 = a2;
  int v13 = a3;
  int v12 = 1;
  if (a3 > 2)
  {
    float v11 = 0;
    if (v15->_log)
    {
      double v8 = v15->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      double v8 = inited;
    }
    float v11 = v8;
    char v10 = 16;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      os_log_t log = v11;
      os_log_type_t type = v10;
      __os_log_helper_16_0_0(v9);
      _os_log_error_impl(&dword_1BA438000, log, type, "Aurora Curve Level | Invalid curve level - using default.", v9, 2u);
    }
    int v12 = 1;
  }
  else
  {
    int v12 = v13;
  }
  if (v12 != v15->_curveLevel)
  {
    v15->_curveLevel = v12;
    if (v15->_log)
    {
      float v4 = v15->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v3 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v3 = init_default_corebrightness_log();
      }
      float v4 = v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v16, v15->_curveLevel);
      _os_log_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEFAULT, "Aurora Curve Level | Curve level set to %d", v16, 8u);
    }
    [(CBAurora *)v15 evaluateEntryConditions];
  }
}

- (void)setLowPowerModeIsEnabled:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3;
  if (self->_lowPowerModeIsEnabled != a3)
  {
    if (self->_log)
    {
      os_log_t log = self->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t log = inited;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        uint64_t v3 = "YES";
      }
      else {
        uint64_t v3 = "NO";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Aurora LowPowerMode | Enabled=%s", v8, 0xCu);
    }
    self->_lowPowerModeIsEnabled = v6;
    [(CBAurora *)self evaluateEntryConditions];
  }
}

- (void)setDominoModeIsEnabled:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3;
  if (self->_dominoModeIsEnabled != a3)
  {
    if (self->_log)
    {
      os_log_t log = self->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t log = inited;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        uint64_t v3 = "YES";
      }
      else {
        uint64_t v3 = "NO";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Aurora DominoMode | Enabled=%s", v8, 0xCu);
    }
    self->_dominoModeIsEnabled = v6;
    [(CBAurora *)self evaluateEntryConditions];
  }
}

- (void)setAutoDimIsEnabled:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3;
  if (self->_autoDimIsEnabled != a3)
  {
    if (self->_log)
    {
      os_log_t log = self->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t log = inited;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        uint64_t v3 = "YES";
      }
      else {
        uint64_t v3 = "NO";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Aurora AutoDim | Enabled=%s", v8, 0xCu);
    }
    self->_autoDimIsEnabled = v6;
    [(CBAurora *)self evaluateEntryConditions];
  }
}

- (void)setAutoBrightnessIsAvailable:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3;
  if (self->_autoBrightnessIsAvailable != a3)
  {
    if (self->_log)
    {
      os_log_t log = self->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t log = inited;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        uint64_t v3 = "YES";
      }
      else {
        uint64_t v3 = "NO";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Aurora AutoBrightnessAvailable | Available=%s", v8, 0xCu);
    }
    self->_autoBrightnessIsAvailable = v6;
    [(CBAurora *)self evaluateEntryConditions];
  }
}

- (void)setCLTMCap:(float)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!float_equal(self->_cpms.cltmCap, a3))
  {
    if (self->_log)
    {
      os_log_t log = self->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t log = inited;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v7, COERCE__INT64(a3));
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Aurora CPMS | CLTM.Cap=%f", v7, 0xCu);
    }
    self->_cpms.cltmCap = a3;
    self->_cltmCap = a3;
    [(CBAurora *)self evaluateEntryConditions];
  }
}

- (void)setUPOCap:(float)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!float_equal(self->_cpms.upoCap, a3))
  {
    if (self->_log)
    {
      os_log_t log = self->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_t log = inited;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v7, COERCE__INT64(a3));
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Aurora CPMS | UPO.Cap=%f", v7, 0xCu);
    }
    self->_cpms.upoCap = a3;
    self->_upoCap = a3;
    [(CBAurora *)self evaluateEntryConditions];
  }
}

- (void)setCPMSActivationThreshold:(float)a3
{
  self->_cpms.activationThreshold = a3;
  id v3 = objc_alloc(NSNumber);
  *(float *)&double v4 = self->_cpms.activationThreshold;
  id v5 = (id)[v3 initWithFloat:v4];
  [(CBDisplayModule *)self->_displayModule setProperty:v5 forKey:@"AuroraCLTMActivationThreshold"];
}

- (void)setRampUpTimeSecondsPerStop:(float)a3
{
  self->_rampUpTimeSecondsPerStop = a3;
  id v3 = objc_alloc(NSNumber);
  *(float *)&double v4 = self->_rampUpTimeSecondsPerStop;
  id v5 = (id)[v3 initWithFloat:v4];
  [(CBDisplayModule *)self->_displayModule setProperty:v5 forKey:@"AuroraRampUpTimeSecondsPerStop"];
}

- (void)setRampDownTimeSecondsPerStop:(float)a3
{
  self->_rampDownTimeSecondsPerStop = a3;
  id v3 = objc_alloc(NSNumber);
  *(float *)&double v4 = self->_rampDownTimeSecondsPerStop;
  id v5 = (id)[v3 initWithFloat:v4];
  [(CBDisplayModule *)self->_displayModule setProperty:v5 forKey:@"AuroraRampDownTimeSecondsPerStop"];
}

- (float)currentPreAuroraNits
{
  return self->_currentNits / self->_currentScaler;
}

- (float)calculateNumberOfStopsForCurrentScaler:(float)a3 andRequestedScaler:(float)a4
{
  return fabsf(log2f(a4 / a3));
}

- (float)calculateRampTimeForCurrentScaler:(float)a3 andRequestedScaler:(float)a4
{
  if (a4 <= a3) {
    float rampDownTimeSecondsPerStop = self->_rampDownTimeSecondsPerStop;
  }
  else {
    float rampDownTimeSecondsPerStop = self->_rampUpTimeSecondsPerStop;
  }
  [(CBAurora *)self calculateNumberOfStopsForCurrentScaler:COERCE_DOUBLE((unint64_t)LODWORD(a3)) andRequestedScaler:*(double *)&a4];
  return v4 * rampDownTimeSecondsPerStop;
}

- (float)clampScaler:(float)a3
{
  return clamp(a3, self->_minimumScaler, self->_maximumScaler);
}

- (float)calculateLuxTargetScaler:(float)a3
{
  [(CBAurora *)self luxActivationThreshold];
  float v7 = v3;
  float minimumScaler = self->_minimumScaler;
  [(CBAurora *)self luxSaturationThreshold];
  *(float *)&double v5 = linear_interpolation(a3, v7, minimumScaler, v4, self->_maximumScaler);
  [(CBAurora *)self clampScaler:v5];
  return result;
}

- (float)calculateCurrentLuxTargetScaler
{
  *(float *)&double v2 = self->_lux;
  -[CBAurora calculateLuxTargetScaler:](self, "calculateLuxTargetScaler:", v2, a2, self);
  return result;
}

- (float)calculateRampTargetScalerForNits:(float)a3
{
  *(float *)&double v3 = a3 / self->_nitsMinimum;
  [(CBAurora *)self clampScaler:v3];
  return result;
}

- (float)calculateRampTargetForNits:(float)a3 andAPCE:(float)a4 withTapPointAPCEMinimum:(float)a5 andTapPointAPCEMaximum:(float)a6
{
  int v13 = self;
  SEL v12 = a2;
  float v11 = a3;
  float v10 = a4;
  float v9 = a5;
  float v8 = a6;
  if (a4 < a5) {
    return v11;
  }
  if (v10 > v8) {
    return v13->_nitsMinimum;
  }
  float v7 = linear_interpolation(v10, v8, v13->_nitsMinimum, v9, v13->_nitsMaximum);
  return *std::min[abi:ne180100]<float>(&v11, &v7);
}

- (float)calculateRampUpTargetForNits:(float)a3 andAPCE:(float)a4
{
  *(float *)&double v4 = self->_rampUpTapPointAPCEMinimum;
  *(float *)&double v5 = self->_rampUpTapPointAPCEMaximum;
  [(CBAurora *)self calculateRampTargetForNits:*(double *)&a3 andAPCE:*(double *)&a4 withTapPointAPCEMinimum:v4 andTapPointAPCEMaximum:v5];
  return result;
}

- (float)calculateCurrentRampUpTargetForAPCE:(float)a3
{
  [(CBAurora *)self calculateCurrentLuxTargetScaler];
  -[CBAurora convertScalerToNits:](self, "convertScalerToNits:");
  -[CBAurora calculateRampUpTargetForNits:andAPCE:](self, "calculateRampUpTargetForNits:andAPCE:");
  return result;
}

- (float)calculateRampDownTargetForNits:(float)a3 andAPCE:(float)a4
{
  *(float *)&double v4 = self->_rampDownTapPointAPCEMinimum;
  *(float *)&double v5 = self->_rampDownTapPointAPCEMaximum;
  [(CBAurora *)self calculateRampTargetForNits:*(double *)&a3 andAPCE:*(double *)&a4 withTapPointAPCEMinimum:v4 andTapPointAPCEMaximum:v5];
  return result;
}

- (float)calculateCurrentRampDownTargetForAPCE:(float)a3
{
  [(CBAurora *)self calculateCurrentLuxTargetScaler];
  -[CBAurora convertScalerToNits:](self, "convertScalerToNits:");
  -[CBAurora calculateRampDownTargetForNits:andAPCE:](self, "calculateRampDownTargetForNits:andAPCE:");
  return result;
}

- (float)convertScalerToNits:(float)a3
{
  return a3 * self->_nitsMinimum;
}

- (void)sendEDRHeadroomRequest:(float)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_log)
  {
    os_log_t log = self->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    os_log_t log = inited;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v13, COERCE__INT64(a3), COERCE__INT64(self->_edrDurationPerStop));
    _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Aurora EDR | Sending headroom request with headroom=%f and duration per stop = %f", v13, 0x16u);
  }
  id v3 = objc_alloc(NSNumber);
  *(float *)&double v4 = a3;
  float v10 = (void *)[v3 initWithFloat:v4];
  if (v10)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    *(float *)&double v5 = self->_edrDurationPerStop;
    float v9 = objc_msgSend(v6, "initWithObjectsAndKeys:", v10, *MEMORY[0x1E4F39DF0], *MEMORY[0x1E4F1CFD0], @"AuroraEDRHeadroomRequest", objc_msgSend(NSNumber, "numberWithFloat:", v5), @"EDRSecondsPerStop", 0);

    if (v9)
    {
      [(CBDisplayModule *)self->_displayModule setProperty:v9 forKey:@"EDRHeadroomRequest"];
    }
  }
}

- (void)stop
{
  if (self->_isMonitoring) {
    [(CBAurora *)self stopMonitoring];
  }
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)displayIsOn
{
  return self->_displayIsOn;
}

- (BOOL)aodIsOn
{
  return self->_aodIsOn;
}

- (BOOL)autoBrightnessIsEnabled
{
  return self->_autoBrightnessIsEnabled;
}

- (int)curveLevel
{
  return self->_curveLevel;
}

- (BOOL)lowPowerModeIsEnabled
{
  return self->_lowPowerModeIsEnabled;
}

- (BOOL)dominoModeIsEnabled
{
  return self->_dominoModeIsEnabled;
}

- (BOOL)autoDimIsEnabled
{
  return self->_autoDimIsEnabled;
}

- (BOOL)autoBrightnessIsAvailable
{
  return self->_autoBrightnessIsAvailable;
}

- (void)setRampInProgress:(BOOL)a3
{
  self->_rampInProgress = a3;
}

- (float)currentNits
{
  return self->_currentNits;
}

- (float)currentEDRHeadroom
{
  return self->_currentEDRHeadroom;
}

- (float)currentEDRHeadroomRequest
{
  return self->_currentEDRHeadroomRequest;
}

- (float)cltmCap
{
  return self->_cltmCap;
}

- (float)upoCap
{
  return self->_upoCap;
}

- (float)lux
{
  return self->_lux;
}

- (float)autoDimRampLength
{
  return self->_autoDimRampLength;
}

- (void)setAutoDimRampLength:(float)a3
{
  self->_float autoDimRampLength = a3;
}

@end