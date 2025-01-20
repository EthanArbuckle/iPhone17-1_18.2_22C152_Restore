@interface CBColorModuleiOS
- (BOOL)BLRCCTRangePropertyHandler:(id)a3;
- (BOOL)BLRCCTTargetPropertyHandler:(id)a3;
- (BOOL)BLRFactorPropertyHandler:(id)a3;
- (BOOL)CAAABSensorOverridePropertyHandler:(id)a3;
- (BOOL)CAEnabledPropertyHandler:(id)a3;
- (BOOL)CAFadesEnabledHandler:(id)a3;
- (BOOL)CAFixedStrengthPropertyHandler:(id)a3;
- (BOOL)CALabShiftPropertyHandler:(id)a3;
- (BOOL)CAModeMappingHandler:(id)a3;
- (BOOL)CAStrengthPropertyHandler:(id)a3;
- (BOOL)CAStrengthRampPeriodTweakPropertyHandler:(id)a3;
- (BOOL)CAWeakestColorAdaptationModeAnimatedPropertyHandler:(id)a3;
- (BOOL)CAWeakestColorAdaptationModePropertyHandler:(id)a3;
- (BOOL)CEEnablePropertyHandler:(id)a3 key:(id)a4;
- (BOOL)CEOverridePropertyHandler:(id)a3 key:(id)a4;
- (BOOL)CoreBrightnessFeaturesDisabledPropertyHandler:(id)a3;
- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)ammolitePropertyHandler:(id)a3 key:(id)a4;
- (BOOL)applyAggregatedConfigPropertyHandler:(id)a3;
- (BOOL)applyPendingSamples;
- (BOOL)applySamples:(id)a3 withinTimeout:(float)a4;
- (BOOL)carryLogCommentHandler:(id)a3;
- (BOOL)carryLogCommitHandler:(id)a3;
- (BOOL)carryLogEnabledHandler:(id)a3;
- (BOOL)colorFilterModeHandler:(id)a3;
- (BOOL)colorRampPeriodOverrideHandler:(id)a3;
- (BOOL)convertNSData:(id)a3 toUint32:(unsigned int *)a4;
- (BOOL)displayBrightnessFactorPropertyHandler:(id)a3;
- (BOOL)displayPresetHarmonyHandler:(id)a3;
- (BOOL)handleAODStateUpdate:(unint64_t)a3 transitionTime:(float)a4 context:(id)a5;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (BOOL)ignoreALSEventsInAOD;
- (BOOL)parseAdaptationModeMappingArray:(id)a3 strengths:(float *)a4 strengthNum:(int)a5;
- (BOOL)parseAdaptationModeMappingDictionary:(id)a3 strengths:(float *)a4 strengthNum:(int)a5;
- (BOOL)preStrobeDimPeriodPropertyHandler:(id)a3;
- (BOOL)preStrobePropertyHandler:(id)a3;
- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)serializedAggregatedConfigPropertyHandler:(id)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)setPropertyInternal:(id)a3 forKey:(id)a4;
- (BOOL)start;
- (BOOL)startNewTimerWithFreq:(float)a3;
- (BOOL)ttRestrictionHandler:(id)a3;
- (BOOL)ttRestrictionReload;
- (CBColorModuleiOS)init;
- (CBColorModuleiOS)initWithBacklight:(unsigned int)a3 andModuleType:(unint64_t)a4;
- (CBColorModuleiOS)initWithBacklight:(unsigned int)a3 andModuleType:(unint64_t)a4 andBrightnessControl:(id)a5;
- (id)copyALSSamples;
- (id)copyIdentifiers;
- (id)copyLocalAggregatedConfig;
- (id)copyPreferenceForKey:(id)a3 user:(id)a4;
- (id)copyPreferencesForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyInternalForKey:(id)a3;
- (id)getRegistryIDForHIDServiceClient:(__IOHIDServiceClient *)a3;
- (id)newAdaptationModeMappingArray:(float *)a3 strengthNum:(int)a4;
- (id)newAdaptationModeMappingDictionary:(float *)a3 strengthNum:(int)a4;
- (id)newAggregatedConfigFromSerializedConfig:(id)a3;
- (id)newArrayFromDoubles:(double *)a3 size:(int)a4;
- (id)newArrayFromIntegers:(int *)a3 size:(int)a4;
- (int)getPid:(__IOHIDServiceClient *)a3;
- (int)getVid:(__IOHIDServiceClient *)a3;
- (unint64_t)moduleType;
- (void)BLRFactorUpdate:(float)a3;
- (void)BLRFactorUpdate:(float)a3 withPeriod:(float)a4 shouldForceUpdate:(BOOL)a5;
- (void)CAStrengthUpdate:(float)a3 withPeriod:(float)a4;
- (void)activateColorAdaptation;
- (void)applyAggregatedConfig:(BOOL)a3;
- (void)armFirstALSSampleTimer;
- (void)cancelFirstSampleTimeout;
- (void)colorRampRoutine:(id *)a3;
- (void)commitPowerLogReport:(ColorReport *)a3;
- (void)dealloc;
- (void)debugPrintColorSampleAsRGB:(id)a3;
- (void)displayBrightnessFactorUpdate:(float)a3;
- (void)enableMitigations:(BOOL)a3;
- (void)filterInitialize;
- (void)firstALSSampleTimeout;
- (void)handleALSEvent:(id)a3;
- (void)handleDisplayBrightnessFactorZero:(id)a3;
- (void)handleFilterNotificationForKey:(id)a3 withProperty:(id)a4;
- (void)handleHIDEventInternal:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4;
- (void)initColorStruct;
- (void)inputAmbientColorSample:(id *)a3 force:(BOOL)a4 trust:(BOOL)a5;
- (void)loadBacklightProperties;
- (void)processColorSample:(id)a3 forceUpdate:(BOOL)a4;
- (void)reportCommitWithStop:(BOOL)a3;
- (void)reportInitialize;
- (void)reportResetTimerWithStop:(BOOL)a3;
- (void)reportToCoreAnlytics:(ColorReport *)a3;
- (void)sendNotificationForKey:(id)a3 andValue:(id)a4;
- (void)setNightShiftFactorDictionary:(id)a3;
- (void)setPreference:(id)a3 forKey:(id)a4 user:(id)a5;
- (void)setPreferences:(id)a3 forKey:(id)a4;
- (void)stop;
- (void)timerRoutine:(id)a3;
- (void)updateActivity;
- (void)updateAvailability;
@end

@implementation CBColorModuleiOS

uint64_t __42__CBColorModuleiOS_startNewTimerWithFreq___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerRoutine:", *(void *)(a1 + 40), a1, a1);
}

- (void)timerRoutine:(id)a3
{
  BOOL v4 = 1;
  double Current = CFAbsoluteTimeGetCurrent();
  if (self->_colorStruct.cfx && self->_colorStruct.fadeInProgress)
  {
    self->_colorStruct.fadeInProgress = CFXUpdateColorFade((uint64_t)self->_colorStruct.cfx, Current) & 1;
    BOOL v4 = !self->_colorStruct.fadeInProgress;
  }
  if (v4)
  {
    if (a3) {
      dispatch_source_cancel((dispatch_source_t)a3);
    }
  }
}

- (id)copyPropertyInternalForKey:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v24 = self;
  SEL v23 = a2;
  id v22 = a3;
  id v21 = 0;
  if ([a3 isEqualToString:@"ColorAdaptationAvailable"])
  {
    id v21 = (id)[objc_alloc(NSNumber) initWithBool:v24->_colorStruct.harmonyAvailable];
  }
  else if ([v22 isEqualToString:@"ColorAdaptationEnabled"])
  {
    id v21 = (id)[objc_alloc(NSNumber) initWithBool:v24->_colorStruct.harmonyEnabled];
  }
  else if ([v22 isEqualToString:@"StatusInfo"])
  {
    id v20 = +[CBStatusInfoHelper copyStatusInfoFor:v24];
    if (v20) {
      id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v20, @"ColorModule", 0);
    }
  }
  else if ([v22 isEqualToString:@"CBDisplayPresetDisableHarmony"])
  {
    id v21 = (id)[objc_alloc(NSNumber) initWithBool:v24->_colorStruct.presetDisableHarmony];
  }
  else if ([v22 isEqualToString:@"CBAmmoliteEnabled"])
  {
    id v21 = (id)[objc_alloc(NSNumber) initWithBool:CFXAmmoliteEnabled((uint64_t)v24->_colorStruct.cfx)];
  }
  else if ([v22 isEqualToString:@"CBAmmoliteSupported"])
  {
    if (v24->_backlightService) {
      id v21 = (id)[objc_alloc(NSNumber) initWithBool:CFXAmmoliteSupported(v24->_backlightService)];
    }
  }
  else if ([v22 isEqualToString:@"HarmonyMagic"])
  {
    if (CFXGetMagicCoeff((uint64_t)v24->_colorStruct.cfx, (uint64_t)v27))
    {
      id v19 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:6];
      for (int i = 0; i < 6; ++i)
      {
        id v3 = objc_alloc(NSNumber);
        LODWORD(v4) = v27[i];
        objc_msgSend(v19, "addObject:", objc_msgSend(v3, "initWithFloat:", v4));
      }
      id v21 = v19;
    }
  }
  else if ([v22 isEqualToString:@"ColorAdaptationStrength"])
  {
    id v15 = objc_alloc(NSNumber);
    *(float *)&double v5 = CFXGetAdaptationStrength((uint64_t)v24->_colorStruct.cfx);
    id v21 = (id)[v15 initWithFloat:v5];
  }
  else
  {
    id v21 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](v24->_properties, "objectForKey:", v22), "copy");
  }
  if (!v21)
  {
    memset(__b, 0, sizeof(__b));
    obj = v24->_filters;
    uint64_t v14 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v26 count:16];
    if (v14)
    {
      uint64_t v10 = *(void *)__b[2];
      uint64_t v11 = 0;
      unint64_t v12 = v14;
      while (1)
      {
        uint64_t v9 = v11;
        if (*(void *)__b[2] != v10) {
          objc_enumerationMutation(obj);
        }
        id v17 = 0;
        id v17 = *(id *)(__b[1] + 8 * v11);
        id v21 = (id)[v17 copyPropertyForKey:v22];
        if (v21) {
          break;
        }
        ++v11;
        if (v9 + 1 >= v12)
        {
          uint64_t v11 = 0;
          unint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v26 count:16];
          if (!v12) {
            break;
          }
        }
      }
    }
  }
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v25, (uint64_t)v22, (uint64_t)v21);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ result=%@", v25, 0x16u);
  }
  return v21;
}

- (BOOL)setPropertyInternal:(id)a3 forKey:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v25 = self;
  SEL v24 = a2;
  id v23 = a3;
  id v22 = a4;
  char v21 = 0;
  if ([a4 isEqualToString:@"BlueLightReductionFactor"])
  {
    char v21 = [(CBColorModuleiOS *)v25 BLRFactorPropertyHandler:v23];
LABEL_85:
    if (v21) {
      [(NSMutableDictionary *)v25->_properties setObject:v23 forKey:v22];
    }
    memset(__b, 0, sizeof(__b));
    obj = v25->_filters;
    uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v28 count:16];
    if (v13)
    {
      uint64_t v9 = *(void *)__b[2];
      uint64_t v10 = 0;
      unint64_t v11 = v13;
      while (1)
      {
        uint64_t v8 = v10;
        if (*(void *)__b[2] != v9) {
          objc_enumerationMutation(obj);
        }
        id v17 = 0;
        id v17 = *(id *)(__b[1] + 8 * v10);
        [v17 setProperty:v23 forKey:v22];
        ++v10;
        if (v8 + 1 >= v11)
        {
          uint64_t v10 = 0;
          unint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v28 count:16];
          if (!v11) {
            break;
          }
        }
      }
    }
    if (v25->super._logHandle)
    {
      logHandle = v25->super._logHandle;
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
      __os_log_helper_16_2_3_8_64_8_64_4_0((uint64_t)v27, (uint64_t)v22, (uint64_t)v23, v21 & 1);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@ result=%d", v27, 0x1Cu);
    }
    char v26 = v21 & 1;
    return v26 & 1;
  }
  if ([v22 isEqualToString:@"BlueLightReductionCCTTargetKey"])
  {
    char v21 = [(CBColorModuleiOS *)v25 BLRCCTTargetPropertyHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"BlueLightReductionCCTRange"])
  {
    char v21 = [(CBColorModuleiOS *)v25 BLRCCTRangePropertyHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"LabShift"])
  {
    char v21 = [(CBColorModuleiOS *)v25 CALabShiftPropertyHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"ColorAdaptationEnabled"])
  {
    char v21 = [(CBColorModuleiOS *)v25 CAEnabledPropertyHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"ColorAdaptationStrength"])
  {
    char v21 = [(CBColorModuleiOS *)v25 CAStrengthPropertyHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"FixedColorAdaptationStrength"])
  {
    char v21 = [(CBColorModuleiOS *)v25 CAFixedStrengthPropertyHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"WeakestColorAdaptationMode"])
  {
    char v21 = [(CBColorModuleiOS *)v25 CAWeakestColorAdaptationModePropertyHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"WeakestColorAdaptationModeAnimated"])
  {
    char v21 = [(CBColorModuleiOS *)v25 CAWeakestColorAdaptationModeAnimatedPropertyHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"ColorAdaptationModeMapping"])
  {
    char v21 = [(CBColorModuleiOS *)v25 CAModeMappingHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"StrengthRampPeriodTweak"])
  {
    char v21 = [(CBColorModuleiOS *)v25 CAStrengthRampPeriodTweakPropertyHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"ColorFadesEnabled"])
  {
    char v21 = [(CBColorModuleiOS *)v25 CAFadesEnabledHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"CBDisplayPresetDisableHarmony"])
  {
    char v21 = [(CBColorModuleiOS *)v25 displayPresetHarmonyHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"CoreBrightnessFeaturesDisabled"])
  {
    char v21 = [(CBColorModuleiOS *)v25 CoreBrightnessFeaturesDisabledPropertyHandler:v23];
    goto LABEL_85;
  }
  if (([v22 isEqualToString:@"DisplayBrightnessFactor"] & 1) != 0
    || ([v22 isEqualToString:@"DisplayBrightnessFactorWithFade"] & 1) != 0)
  {
    char v21 = [(CBColorModuleiOS *)v25 displayBrightnessFactorPropertyHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"AABSensorOverride"])
  {
    char v21 = [(CBColorModuleiOS *)v25 CAAABSensorOverridePropertyHandler:v23];
    goto LABEL_85;
  }
  if (([v22 isEqualToString:@"CEOverride"] & 1) != 0
    || ([v22 isEqualToString:@"CEOverrideEnabled"] & 1) != 0)
  {
    char v21 = [(CBColorModuleiOS *)v25 CEOverridePropertyHandler:v23 key:v22];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"CEEnable"])
  {
    char v21 = [(CBColorModuleiOS *)v25 CEEnablePropertyHandler:v23 key:v22];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"PreStrobe"])
  {
    char v21 = [(CBColorModuleiOS *)v25 preStrobePropertyHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"PreStrobeDimPeriod"])
  {
    char v21 = [(CBColorModuleiOS *)v25 preStrobeDimPeriodPropertyHandler:v23];
    goto LABEL_85;
  }
  if (([v22 isEqualToString:@"CBAmmoliteEnabled"] & 1) != 0
    || ([v22 isEqualToString:@"DisplayBrightnessAuto"] & 1) != 0)
  {
    char v21 = [(CBColorModuleiOS *)v25 ammolitePropertyHandler:v23 key:v22];
    if ([v22 isEqualToString:@"DisplayBrightnessAuto"])
    {
      char v26 = v21;
      return v26 & 1;
    }
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"ColorFilterMode"])
  {
    char v21 = [(CBColorModuleiOS *)v25 colorFilterModeHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"ColorFilterSensorPolicy"])
  {
    char v21 = [(CBColorModuleiOS *)v25 colorFilterSensorPolicyHandler:v23] != 0;
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"CBSerializedAggregatedConfig"])
  {
    char v21 = [(CBColorModuleiOS *)v25 serializedAggregatedConfigPropertyHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"CBApplyAggregatedConfig"])
  {
    char v21 = [(CBColorModuleiOS *)v25 applyAggregatedConfigPropertyHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"ColorRampEnableLogging"])
  {
    os_log_t oslog = 0;
    if (v25->super._logHandle)
    {
      id v15 = v25->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v14 = init_default_corebrightness_log();
      }
      id v15 = v14;
    }
    os_log_t oslog = v15;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if ([v23 isEqual:MEMORY[0x1E4F1CC38]]) {
        double v4 = "on";
      }
      else {
        double v4 = "off";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v29, (uint64_t)v4);
      _os_log_impl(&dword_1BA438000, oslog, type, "Turning color ramp logging: %s", v29, 0xCu);
    }
    CFXColorRampEnableLogging((uint64_t)v25->_colorStruct.cfx, [v23 isEqual:MEMORY[0x1E4F1CC38]] & 1);
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"CarryLogEnabled"])
  {
    char v21 = [(CBColorModuleiOS *)v25 carryLogEnabledHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"CarryLogComment"])
  {
    char v21 = [(CBColorModuleiOS *)v25 carryLogCommentHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"CarryLogCommit"])
  {
    char v21 = [(CBColorModuleiOS *)v25 carryLogCommitHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"ColorRampPeriodOverride"])
  {
    char v21 = [(CBColorModuleiOS *)v25 colorRampPeriodOverrideHandler:v23];
    goto LABEL_85;
  }
  if ([v22 isEqualToString:@"CBTTRestriction"])
  {
    char v21 = [(CBColorModuleiOS *)v25 ttRestrictionHandler:v23];
    goto LABEL_85;
  }
  if (([v22 isEqualToString:@"TwilightParameters"] & 1) == 0) {
    goto LABEL_85;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v25->_colorStruct.nightModeSupported)
  {
    id v18 = v23;
    if ([v23 nightShiftAdaptation]) {
      CFXInitializeTwilightNightShiftAdaptation((uint64_t)v25->_colorStruct.cfx, objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "nightShiftAdaptation"), "cctTable"), "dataCopy"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "nightShiftAdaptation"), "cctTable"), "count"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "nightShiftAdaptation"), "twilightStrengthTable"), "dataCopy"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "nightShiftAdaptation"), "twilightStrengthTable"), "count"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "nightShiftAdaptation"), "cctDeltaTable"), "dataCopy"));
    }
  }
  char v26 = 1;
  return v26 & 1;
}

- (void)handleHIDEventInternal:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v70 = self;
  SEL v69 = a2;
  v68 = a3;
  v67 = a4;
  if ([(CBColorModuleiOS *)self moduleType] != 2)
  {
    if ([(CBColorModuleiOS *)v70 moduleType] != 1) {
      return;
    }
    uint64_t v60 = 0;
    v61 = &v60;
    int v62 = 1375731712;
    int v63 = 48;
    v64 = __Block_byref_object_copy__10;
    v65 = __Block_byref_object_dispose__10;
    id v66 = 0;
    id v66 = +[CBHIDEvent newEvent:v68 andService:v67];
    if (v61[5])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !v70->_displayOn)
      {
        [(NSMutableDictionary *)v70->_pendingALSSamples setObject:v61[5] forKey:[(CBColorModuleiOS *)v70 getRegistryIDForHIDServiceClient:v67]];
        os_log_t oslog = 0;
        if (v70->super._logHandle)
        {
          logHandle = v70->super._logHandle;
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
          __os_log_helper_16_2_1_8_66((uint64_t)v74, v61[5]);
          _os_log_impl(&dword_1BA438000, oslog, type, "ALS event arrived when display OFF %{public}@", v74, 0xCu);
        }
LABEL_17:

        int v57 = 1;
LABEL_74:
        _Block_object_dispose(&v60, 8);
        return;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v70->_displayOn)
      {
        if (v70->_firstALSEventArrived && v70->_dropALSColorSamples)
        {
          os_log_t v56 = 0;
          if (v70->super._logHandle)
          {
            SEL v24 = v70->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v23 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v23 = init_default_corebrightness_log();
            }
            SEL v24 = v23;
          }
          os_log_t v56 = v24;
          os_log_type_t v55 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v73, v61[5]);
            _os_log_impl(&dword_1BA438000, v56, v55, "Dropping ALS event %{public}@ [Stockholm (NFC) CoEx enabled]", v73, 0xCu);
          }
          goto LABEL_17;
        }
        alsNodes = v70->_alsNodes;
        uint64_t v49 = MEMORY[0x1E4F143A8];
        int v50 = -1073741824;
        int v51 = 0;
        v52 = __48__CBColorModuleiOS_handleHIDEventInternal_from___block_invoke;
        v53 = &unk_1E6219998;
        v54 = &v60;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](alsNodes, "enumerateKeysAndObjectsUsingBlock:");
        if (!v70->_firstALSEventArrived)
        {
          v70->_firstALSEventArrived = 1;
          os_log_t v48 = 0;
          if (v70->super._logHandle)
          {
            id v22 = v70->super._logHandle;
          }
          else
          {
            uint64_t v21 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            id v22 = v21;
          }
          os_log_t v48 = v22;
          os_log_type_t v47 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v72, v61[5]);
            _os_log_impl(&dword_1BA438000, v48, v47, "First ALS event arrived %{public}@", v72, 0xCu);
          }
        }
        if (!v70->_allALSEventsArrived)
        {
          uint64_t v42 = 0;
          v43 = &v42;
          int v44 = 0x20000000;
          int v45 = 32;
          char v46 = 0;
          double v5 = v70->_alsNodes;
          uint64_t v36 = MEMORY[0x1E4F143A8];
          int v37 = -1073741824;
          int v38 = 0;
          v39 = __48__CBColorModuleiOS_handleHIDEventInternal_from___block_invoke_230;
          v40 = &unk_1E6219998;
          v41 = &v42;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:");
          v70->_allALSEventsArrived = (*((unsigned char *)v43 + 24) ^ 1) & 1;
          if (v70->_allALSEventsArrived)
          {
            v70->_forceColorUpdate = 1;
            v70->_potentiallyBustedALS = 0;
            os_log_t v35 = 0;
            if (v70->super._logHandle)
            {
              id v20 = v70->super._logHandle;
            }
            else
            {
              uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
              id v20 = v19;
            }
            os_log_t v35 = v20;
            os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              id v17 = v35;
              os_log_type_t v18 = v34;
              __os_log_helper_16_0_0(v33);
              _os_log_impl(&dword_1BA438000, v17, v18, "All ALS events arrived.", v33, 2u);
            }
          }
          _Block_object_dispose(&v42, 8);
        }
        if (v70->_allALSEventsArrived || v70->_potentiallyBustedALS || v70->_continueWithFewerALSs) {
          [(CBColorModuleiOS *)v70 cancelFirstSampleTimeout];
        }
      }
      memset(__b, 0, sizeof(__b));
      obj = v70->_filters;
      uint64_t v16 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v71 count:16];
      if (v16)
      {
        uint64_t v12 = *(void *)__b[2];
        uint64_t v13 = 0;
        unint64_t v14 = v16;
        while (1)
        {
          uint64_t v11 = v13;
          if (*(void *)__b[2] != v12) {
            objc_enumerationMutation(obj);
          }
          id v32 = 0;
          id v32 = *(id *)(__b[1] + 8 * v13);
          id v30 = 0;
          id v30 = (id)[v32 filterEvent:v61[5]];
          id v6 = v30;

          v61[5] = (uint64_t)v30;
          if (!v30) {
            break;
          }
          ++v13;
          if (v11 + 1 >= v14)
          {
            uint64_t v13 = 0;
            unint64_t v14 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v71 count:16];
            if (!v14) {
              goto LABEL_71;
            }
          }
        }
        os_log_t v29 = 0;
        if (v70->super._logHandle)
        {
          uint64_t v10 = v70->super._logHandle;
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
        os_log_t v29 = v10;
        os_log_type_t v28 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v7 = v29;
          os_log_type_t v8 = v28;
          __os_log_helper_16_0_0(v27);
          _os_log_impl(&dword_1BA438000, v7, v8, "ALS event discarded.", v27, 2u);
        }
      }
LABEL_71:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(CBColorModuleiOS *)v70 handleALSEvent:v61[5]];
      }
    }

    int v57 = 0;
    goto LABEL_74;
  }
  if (IOHIDEventGetType() == 12)
  {
    [(CBColorFilter *)v70->_colorFilter handleHIDEvent:v68 from:v67];
    [(CBColorModuleiOS *)v70 processColorSample:[(CBColorFilter *)v70->_colorFilter sample] forceUpdate:0];
  }
}

- (unint64_t)moduleType
{
  return self->_moduleType;
}

- (void)cancelFirstSampleTimeout
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_timeoutTimer)
  {
    dispatch_release((dispatch_object_t)self->_timeoutTimer);
    self->_timeoutTimer = 0;
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
      *(double *)&uint64_t v2 = CFAbsoluteTimeGetCurrent();
      __os_log_helper_16_0_1_8_0((uint64_t)v6, v2);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "ts=%f Cancelling first sample timeout", v6, 0xCu);
    }
  }
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  uint64_t v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  id v13 = a4;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  os_log_type_t v8 = __58__CBColorModuleiOS_handleNotificationForKey_withProperty___block_invoke;
  uint64_t v9 = &unk_1E62192B0;
  id v10 = a3;
  uint64_t v11 = v16;
  id v12 = a4;
  dispatch_sync(queue, &block);
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  id v17 = self;
  SEL v16 = a2;
  SEL v15 = a3;
  id v14 = a4;
  if (!a3 || !v14) {
    return 0;
  }
  CFRetain(v15);
  CFRetain(v14);
  queue = v17->super._queue;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __40__CBColorModuleiOS_handleHIDEvent_from___block_invoke;
  id v10 = &unk_1E6219100;
  uint64_t v11 = v17;
  id v12 = v14;
  id v13 = v15;
  dispatch_async(queue, &v6);
  return 1;
}

- (BOOL)CAWeakestColorAdaptationModePropertyHandler:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v32 = self;
  SEL v31 = a2;
  id v30 = a3;
  char v29 = 0;
  id v16 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = (id)[v30 objectForKey:@"ColorAdaptationModesTargetSub"];
    id v15 = v28;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v27 = [v28 count];
      if (v27)
      {
        char v26 = v10;
        id v14 = &v10[-((4 * v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
        unint64_t v25 = v27;
        for (int i = 0; i < v27; ++i)
        {
          id v23 = 0;
          id v23 = (id)[v28 objectAtIndex:i];
          id v13 = v23;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v3 = [v23 intValue];
            *(_DWORD *)&v14[4 * i] = v3;
          }
        }
        id v22 = 0;
        id v22 = (id)[v30 objectForKey:@"ColorAdaptationStrengthPeriod"];
        id v12 = v22;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          float v21 = 0.0;
          [v22 floatValue];
          float v21 = v4;
          if (v32->_colorStruct.harmonySupported
            && v32->_colorStruct.cfx
            && v32->_colorStruct.harmonyFixedStrength < 0.0)
          {
            char v29 = 1;
            uint64_t v11 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
            CFXSetWeakestAmbientAdaptationMode((uint64_t)v32->_colorStruct.cfx, (uint64_t)v14, v27, v21);
            float v20 = 0.0;
            unsigned int v19 = 0;
            unsigned int v19 = CFXGetAmbientAdaptationMode(*(uint64_t *)((char *)&v32->super.super.isa + v11[364]), &v20);
            id v18 = 0;
            id v5 = objc_alloc(NSNumber);
            id v18 = (id)[v5 initWithInt:v19];
            if (v18)
            {
              [(NSMutableDictionary *)v32->_properties setObject:v18 forKey:@"ColorAdaptationMode"];
            }
            v32->_colorStruct.harmonyStrength = v20;
            id v6 = objc_alloc(NSNumber);
            *(float *)&double v7 = v20;
            id v18 = (id)[v6 initWithFloat:v7];
            if (v18)
            {
              id v17 = 0;
              id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
              id v17 = (id)objc_msgSend(v8, "initWithObjectsAndKeys:", v18, @"ColorAdaptationStrengthSub", v22, @"ColorAdaptationStrengthPeriod", 0);

              if (v17)
              {
                [(NSMutableDictionary *)v32->_properties setObject:v17 forKey:@"ColorAdaptationStrength"];
              }
            }
          }
        }
      }
    }
  }
  return v29 & 1;
}

- (BOOL)CAWeakestColorAdaptationModeAnimatedPropertyHandler:(id)a3
{
  id v30 = self;
  SEL v29 = a2;
  id v28 = a3;
  char v27 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v25 = 0;
    SEL v24 = 0;
    id v26 = (id)[v28 objectForKey:@"ColorAdaptationModesTargetSub"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = 0;
      uint64_t v25 = [v26 count];
      if (v25 > 0)
      {
        SEL v24 = malloc_type_malloc(4 * v25, 0x100004052888210uLL);
        for (int i = 0; i < v25; ++i)
        {
          id v21 = (id)[v26 objectAtIndex:i];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v24[i] = [v21 intValue];
            ++v23;
          }
        }
      }
      if (v23 < v25)
      {
        uint64_t v25 = 0;
        if (v24) {
          free(v24);
        }
        SEL v24 = 0;
      }
    }
    if (v25 > 0)
    {
      uint64_t v20 = 0;
      unsigned int v19 = 0;
      id v26 = (id)[v28 objectForKey:@"ColorAdaptationModesInitialSub"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v18 = 0;
        uint64_t v20 = [v26 count];
        if (v20 > 0)
        {
          unsigned int v19 = malloc_type_malloc(4 * v20, 0x100004052888210uLL);
          for (int j = 0; j < v20; ++j)
          {
            id v16 = (id)[v26 objectAtIndex:j];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19[j] = [v16 intValue];
              ++v18;
            }
          }
        }
        if (v18 < v20)
        {
          uint64_t v20 = 0;
          if (v19) {
            free(v19);
          }
          unsigned int v19 = 0;
        }
      }
      float v15 = 0.0;
      float v14 = 0.0;
      id v26 = (id)[v28 objectForKey:@"ProgressRatio"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v26 floatValue];
        float v15 = v3;
      }
      id v26 = (id)[v28 objectForKey:@"ColorAdaptationStrengthPeriod"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v26 floatValue];
        float v14 = v4;
      }
      if (v30->_colorStruct.harmonySupported && v30->_colorStruct.cfx && v30->_colorStruct.harmonyFixedStrength < 0.0)
      {
        float v13 = 0.0;
        CFXAnimateAmbientAdaptationModes((uint64_t)v30->_colorStruct.cfx, (uint64_t)v19, v20, (uint64_t)v24, v25, &v13, v15, v14);
        int v12 = 0;
        id v10 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithInt:", CFXGetAmbientAdaptationMode((uint64_t)v30->_colorStruct.cfx, (float *)&v12));
        if (v10)
        {
          [(NSMutableDictionary *)v30->_properties setObject:v10 forKey:@"ColorAdaptationMode"];
        }
        v30->_colorStruct.harmonyStrength = v13;
        id v5 = objc_alloc(NSNumber);
        *(float *)&double v6 = v13;
        id v11 = (id)[v5 initWithFloat:v6];
        if (v11)
        {
          id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
          id v9 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", v11, @"ColorAdaptationStrengthSub", v26, @"ColorAdaptationStrengthPeriod", 0);
          if (v9)
          {
            [(NSMutableDictionary *)v30->_properties setObject:v9 forKey:@"ColorAdaptationStrength"];
          }
        }
      }
      if (v24) {
        free(v24);
      }
      if (v19) {
        free(v19);
      }
    }
  }
  return v27 & 1;
}

uint64_t __39__CBColorModuleiOS_setProperty_forKey___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t result = [*(id *)(a1 + 32) getKeyCategory];
    if (result == *(void *)(*(void *)(a1 + 40) + 376))
    {
      uint64_t result = [*(id *)(a1 + 32) getKeyString];
      if (result)
      {
        uint64_t result = [*(id *)(a1 + 40) setPropertyInternal:*(void *)(a1 + 48) forKey:result];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result & 1;
      }
    }
  }
  else
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      uint64_t result = [*(id *)(a1 + 40) setPropertyInternal:*(void *)(a1 + 48) forKey:*(void *)(a1 + 32)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result & 1;
    }
  }
  return result;
}

uint64_t __48__CBColorModuleiOS_handleHIDEventInternal_from___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 handleALSEvent:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  if (result) {
    *a4 = 1;
  }
  return result;
}

void __52__CBColorModuleiOS_sendNotificationForKey_andValue___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    _Block_release(*(const void **)(a1 + 48));
  }
}

uint64_t __43__CBColorModuleiOS_removeHIDServiceClient___block_invoke(uint64_t a1)
{
  uint64_t v4 = [*(id *)(a1 + 32) getRegistryIDForHIDServiceClient:*(void *)(a1 + 48)];
  if (v4) {
    [*(id *)(*(void *)(a1 + 32) + 168) removeObjectForKey:v4];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 160) containsObject:*(void *)(a1 + 48)])
  {
    [*(id *)(*(void *)(a1 + 32) + 160) removeObject:*(void *)(a1 + 48)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    return [*(id *)(a1 + 32) updateAvailability];
  }
  else
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) containsObject:*(void *)(a1 + 48)];
    if (result)
    {
      [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 48)];
      uint64_t result = [*(id *)(*(void *)(a1 + 32) + 296) removeHIDServiceClient:*(void *)(a1 + 48)];
      if (!--*(_DWORD *)(*(void *)(a1 + 32) + 320))
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 107) = 0;
        [*(id *)(a1 + 32) activateColorAdaptation];
        uint64_t v2 = MEMORY[0x1E4F1CC28];
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setObject:forKey:");
        [*(id *)(a1 + 32) sendNotificationForKey:@"ColorAdaptationAvailable" andValue:v2];
        uint64_t result = [*(id *)(a1 + 32) updateActivity];
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  id v21 = self;
  SEL v20 = a2;
  unsigned int v19 = a3;
  uint64_t v14 = 0;
  float v15 = &v14;
  int v16 = 0x20000000;
  int v17 = 32;
  char v18 = 0;
  if (a3)
  {
    queue = v21->super._queue;
    uint64_t v5 = MEMORY[0x1E4F143A8];
    int v6 = -1073741824;
    int v7 = 0;
    id v8 = __43__CBColorModuleiOS_removeHIDServiceClient___block_invoke;
    id v9 = &unk_1E62197B8;
    id v10 = v21;
    int v12 = v19;
    id v11 = &v14;
    dispatch_sync(queue, &v5);
  }
  char v22 = v15[3] & 1;
  int v13 = 1;
  _Block_object_dispose(&v14, 8);
  return v22 & 1;
}

- (id)getRegistryIDForHIDServiceClient:(__IOHIDServiceClient *)a3
{
  CFTypeRef cf = IOHIDServiceClientGetRegistryID(a3);
  uint64_t v5 = 0;
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFNumberGetTypeID()) {
      return (id)cf;
    }
  }
  return v5;
}

void __40__CBColorModuleiOS_handleHIDEvent_from___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 160) containsObject:*(void *)(a1 + 40)] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 40) containsObject:*(void *)(a1 + 40)] & 1) != 0)
  {
    [*(id *)(a1 + 32) handleHIDEventInternal:*(void *)(a1 + 48) from:*(void *)(a1 + 40)];
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)handleALSEvent:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = self;
  SEL v32 = a2;
  id v31 = a3;
  os_log_t v30 = 0;
  if (self->super._logHandle)
  {
    logHandle = v33->super._logHandle;
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
  os_log_type_t v29 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v38, [v31 orientation]);
    _os_log_debug_impl(&dword_1BA438000, v30, v29, "ALS event with orientation = %d", v38, 8u);
  }
  if ([(CBColorModuleiOS *)v33 ignoreALSEventsInAOD])
  {
    os_log_t v28 = 0;
    if (v33->super._logHandle)
    {
      int v16 = v33->super._logHandle;
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
    os_log_t v28 = v16;
    os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)v31);
      _os_log_impl(&dword_1BA438000, v28, v27, "AOD is on -> ignore this ALS event %@", v37, 0xCu);
    }
  }
  else if (v31)
  {
    ++v33->_NSamples;
    if (v33->_allALSEventsArrived || v33->_potentiallyBustedALS || v33->_continueWithFewerALSs)
    {
      char v26 = 0;
      if (v33->_forceColorUpdate)
      {
        char v26 = 1;
        v33->_forceColorUpdate = 0;
      }
      memset(__b, 0, sizeof(__b));
      obint j = v33->_filters;
      uint64_t v14 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v36 count:16];
      if (v14)
      {
        uint64_t v10 = *(void *)__b[2];
        uint64_t v11 = 0;
        unint64_t v12 = v14;
        while (1)
        {
          uint64_t v9 = v11;
          if (*(void *)__b[2] != v10) {
            objc_enumerationMutation(obj);
          }
          id v25 = 0;
          id v25 = *(id *)(__b[1] + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v23 = [v31 colorMitigationTriggered] & 1;
            [v25 filteredStrength];
            float v22 = v3;
            os_log_t oslog = 0;
            if (v33->super._logHandle)
            {
              id v8 = v33->super._logHandle;
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
            os_log_t oslog = v8;
            os_log_type_t v20 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              if (v23) {
                CFTypeID v4 = "Baseline";
              }
              else {
                CFTypeID v4 = "Shipping";
              }
              __os_log_helper_16_2_1_8_32((uint64_t)v35, (uint64_t)v4);
              _os_log_impl(&dword_1BA438000, oslog, v20, "HarmonyPolicy: Using %s", v35, 0xCu);
            }
            CFXTriggerMitigation((uint64_t)v33->_colorStruct.cfx, v23 & 1);
            CFXSetFadeDuration((uint64_t)v33->_colorStruct.cfx, v23 & 1);
            CFXSetSampleStrength((uint64_t)v33->_colorStruct.cfx, v22);
          }
          ++v11;
          if (v9 + 1 >= v12)
          {
            uint64_t v11 = 0;
            unint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v36 count:16];
            if (!v12) {
              break;
            }
          }
        }
      }
      memset(v19, 0, 0x3CuLL);
      if (v31) {
        [v31 colorSample];
      }
      else {
        memset(v19, 0, 0x3CuLL);
      }
      [(CBColorModuleiOS *)v33 inputAmbientColorSample:v19 force:v26 & 1 trust:1];
      if (v33->super._logHandle)
      {
        int v6 = v33->super._logHandle;
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
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v34, (uint64_t)v31);
        _os_log_impl(&dword_1BA438000, v6, OS_LOG_TYPE_INFO, "Set ambient color sample %{public}@", v34, 0xCu);
      }
    }
  }
}

- (void)inputAmbientColorSample:(id *)a3 force:(BOOL)a4 trust:(BOOL)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v10 = a4;
  BOOL v9 = a5;
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
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v13, COERCE__INT64(a3->var1.var0), COERCE__INT64(a3->var1.var1));
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "input ambient color sample: xy = (%f;%f)",
      v13,
      0x16u);
  }
  int v8 = v10;
  if (v9) {
    int v8 = v10 | 4;
  }
  if (self->_colorStruct.cfx)
  {
    if (self->_supportsAmmoliteWithoutColor)
    {
      float v5 = self->_trustedLux / 3.14159265;
      a3->var0[1] = v5;
    }
    CFXInputAmbientColor((uint64_t *)self->_colorStruct.cfx, a3->var0, v8);
  }
}

uint64_t __38__CBColorModuleiOS_enableMitigations___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2 && a3)
  {
    if (*(void *)(*(void *)(result + 32) + 8))
    {
      CFTypeID v4 = *(NSObject **)(*(void *)(result + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      CFTypeID v4 = inited;
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

- (void)colorRampRoutine:(id *)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  v82 = self;
  SEL v81 = a2;
  v80 = a3;
  if (a3)
  {
    float var0 = 0.0;
    float var0 = v80->var0;
    uint64_t v78 = 0;
    int v77 = 0;
    float v3 = CFXGetWPFromMatrix((uint64_t)v82->_colorStruct.cfx, v80->var1, &v78, &v77);
    context = (void *)MEMORY[0x1BA9ECAE0](v3);
    id v54 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    unint64_t v51 = 0x1E4F28000uLL;
    LODWORD(v4) = v78;
    uint64_t v53 = [NSNumber numberWithFloat:v4];
    LODWORD(v5) = HIDWORD(v78);
    uint64_t v52 = [NSNumber numberWithFloat:v5];
    LODWORD(v6) = v77;
    id v76 = (id)objc_msgSend(v54, "initWithObjectsAndKeys:", v53, @"xWP", v52, @"yWP", objc_msgSend(NSNumber, "numberWithFloat:", v6), @"YWP", 0);
    [(CBColorModuleiOS *)v82 sendNotificationForKey:@"CBTargetWhitePoint" andValue:v76];

    uint64_t v75 = 0;
    uint64_t var5 = v80->var5;
    uint64_t v56 = var5;
    if (var5)
    {
      uint64_t v9 = var5;
      char v8 = 1;
    }
    else
    {
      uint64_t v9 = var5;
      char v8 = 0;
    }
    if (v8)
    {
      os_log_t v74 = 0;
      if (v82->super._logHandle)
      {
        os_log_t logHandle = (os_log_t)v82->super._logHandle;
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
      os_log_t v74 = logHandle;
      os_log_type_t v73 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        os_log_t log = v74;
        *(_DWORD *)os_log_type_t type = v73;
        int v10 = v80->var5;
        buf = v86;
        __os_log_helper_16_0_1_4_0((uint64_t)v86, v10);
        _os_log_error_impl(&dword_1BA438000, v74, v73, "Unknown ramp type: %d. Reporting as kCBColorRamp", v86, 8u);
      }
      uint64_t v75 = @"ColorRamp";
    }
    else
    {
      switch(v9)
      {
        case 0:
          uint64_t v75 = @"ColorRamp";
          break;
        case 1:
          uint64_t v75 = @"ColorRampBLR";
          break;
        case 2:
          uint64_t v75 = @"ColorRampHarmony";
          break;
        case 3:
          uint64_t v75 = @"ColorRampAmmolite";
          break;
        default:
          JUMPOUT(0);
      }
    }
    if (v82->_brightnessControl && ([(__CFString *)v75 isEqual:@"ColorRamp"] & 1) != 0)
    {
      int v45 = (void *)MEMORY[0x1BA9ECAE0]();
      for (int i = 0; i < 9; ++i)
      {
        *(float *)&double v11 = v80->var1[i];
        v85[i] = [NSNumber numberWithFloat:v11];
      }
      os_log_t v71 = 0;
      if (v82->super._logHandle)
      {
        os_log_t v44 = (os_log_t)v82->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          v43 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          v43 = init_default_corebrightness_log();
        }
        os_log_t v44 = v43;
      }
      os_log_t v71 = v44;
      os_log_type_t v70 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        os_log_t v40 = v71;
        *(_DWORD *)v41 = v70;
        *(double *)&uint64_t v12 = v80->var4.var0;
        *(double *)&uint64_t v13 = v80->var4.var1;
        uint64_t v42 = v84;
        __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v84, v12, v13, COERCE__INT64(var0));
        _os_log_impl(&dword_1BA438000, v71, v70, "Calling brightness control with whitepoint(%f | %f) and period: %f", v84, 0x20u);
      }
      if (![+[CBAODState sharedInstance] isAODActive])
      {
        int v38 = &v69;
        id v69 = 0;
        brightnessControl = v82->_brightnessControl;
        uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:9];
        if (([(CBBrightnessProxy *)brightnessControl setWhitePoint:v14 rampDuration:&v69 error:var0] & 1) == 0)
        {
          os_log_t oslog = 0;
          if (v82->super._logHandle)
          {
            os_log_t v37 = (os_log_t)v82->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v36 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v36 = init_default_corebrightness_log();
            }
            os_log_t v37 = v36;
          }
          os_log_t oslog = v37;
          os_log_type_t v67 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            os_log_t v33 = oslog;
            *(_DWORD *)os_log_type_t v34 = v67;
            os_log_t v35 = v83;
            __os_log_helper_16_2_1_8_64((uint64_t)v83, (uint64_t)v69);
            _os_log_error_impl(&dword_1BA438000, oslog, v67, "failed to set whitepoint(%@)", v83, 0xCu);
          }
        }
      }
    }
    id v66 = 0;
    id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v66 = (id)[v15 initWithCapacity:v80->var2];
    if (v66)
    {
      for (unsigned int j = 0; j < v80->var2; ++j)
      {
        id v64 = 0;
        id v16 = objc_alloc(NSNumber);
        *(float *)&double v17 = v80->var1[j];
        id v64 = (id)[v16 initWithFloat:v17];
        if (v64)
        {
          [v66 addObject:v64];
        }
      }
      id v63 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
      if (v63)
      {
        id v62 = 0;
        id v18 = objc_alloc(NSNumber);
        *(float *)&double v19 = v80->var4.var0;
        id v62 = (id)[v18 initWithFloat:v19];
        if (v62)
        {
          [v63 addObject:v62];
        }
        id v20 = objc_alloc(NSNumber);
        *(float *)&double v21 = v80->var4.var1;
        id v62 = (id)[v20 initWithFloat:v21];
        if (v62)
        {
          [v63 addObject:v62];
        }
        unint64_t v32 = 0x1E4F28000uLL;
        id v22 = objc_alloc(NSNumber);
        *(float *)&double v23 = var0;
        id v61 = (id)[v22 initWithFloat:v23];
        id v60 = 0;
        id v24 = objc_alloc(NSNumber);
        *(float *)&double v25 = v80->var3;
        id v60 = (id)[v24 initWithFloat:v25];
        id v59 = 0;
        id v26 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        id v59 = (id)[v26 initWithTimeIntervalSinceReferenceDate:v80->var6];
        if (v61)
        {
          if (v60)
          {
            if (v59)
            {
              id v58 = 0;
              id v27 = objc_alloc(MEMORY[0x1E4F1C9E8]);
              id v31 = v29;
              id v58 = (id)objc_msgSend(v27, "initWithObjectsAndKeys:", v66, @"ColorRampTarget", v61, @"ColorRampPeriod", v60, @"ColorScaler", v63, @"ColorRampWhitePointTarget", v59, @"ColorRampTimestamp", 0);
              if (v58)
              {
                [(CBColorModuleiOS *)v82 sendNotificationForKey:v75 andValue:v58];
                [(NSMutableDictionary *)v82->_properties setObject:v58 forKey:v75];
              }
            }
          }
        }
      }
    }
    v82->_colorStruct.fadeInProgress = 0;
  }
  else
  {
    os_log_t v30 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
    v82->_colorStruct.fadeInProgress = 1;
    double Current = CFAbsoluteTimeGetCurrent();
    if (*(Class *)((char *)&v82->super.super.isa + v30[364]))
    {
      if (v82->_colorStruct.fadeInProgress)
      {
        v29[10] = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
        v82->_colorStruct.fadeInProgress = CFXUpdateColorFade((uint64_t)v82->_colorStruct.cfx, Current) & 1;
        if (v82->_colorStruct.fadeInProgress)
        {
          LODWORD(v28) = 1114636288;
          [(CBColorModuleiOS *)v82 startNewTimerWithFreq:v28];
        }
      }
    }
  }
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v26 = self;
  SEL v25 = a2;
  id v24 = a3;
  id v23 = a4;
  os_log_t v22 = 0;
  if (self->super._logHandle)
  {
    os_log_t logHandle = v26->super._logHandle;
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
  os_log_t v22 = logHandle;
  os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v27, (uint64_t)v24, (uint64_t)v23);
    _os_log_debug_impl(&dword_1BA438000, v22, v21, "send notification for key = %@ value = %@", v27, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v24;
      id v19 = v23;
      if ([v24 isEqualToString:@"ColorAdaptationEnabled"])
      {
        id v18 = (id)[objc_alloc(MEMORY[0x1E4F4FDD8]) initWithStarting:v19];
        objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)BiomeLibrary(), "Device"), "Display"), "TrueTone"), "source"), "sendEvent:", v18);
      }
    }
  }
  if (v26->super._notificationQueue && v26->super._notificationBlock)
  {
    double v17 = 0;
    double v17 = _Block_copy(v26->super._notificationBlock);
    if (v17)
    {
      id v4 = v23;
      id v5 = v24;
      notificationQueue = v26->super._notificationQueue;
      uint64_t block = MEMORY[0x1E4F143A8];
      int v10 = -1073741824;
      int v11 = 0;
      uint64_t v12 = __52__CBColorModuleiOS_sendNotificationForKey_andValue___block_invoke;
      uint64_t v13 = &unk_1E6219A38;
      id v14 = v24;
      id v16 = v17;
      id v15 = v23;
      dispatch_async(notificationQueue, &block);
    }
  }
}

- (BOOL)startNewTimerWithFreq:(float)a3
{
  double v17 = self;
  SEL v16 = a2;
  float v15 = a3;
  char v14 = 0;
  float v13 = 1000000000.0 / a3;
  if ((float)(1000000000.0 / a3) < 16.7) {
    float v13 = 16.7;
  }
  if (v17->_rampTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v17->_rampTimer);
    dispatch_release((dispatch_object_t)v17->_rampTimer);
    v17->_rampTimer = 0;
  }
  dispatch_object_t v12 = 0;
  dispatch_object_t v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v17->super._queue);
  if (v12)
  {
    dispatch_source_set_timer(v12, 0, (unint64_t)v13, 0);
    dispatch_block_t v11 = 0;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    uint64_t v7 = __42__CBColorModuleiOS_startNewTimerWithFreq___block_invoke;
    char v8 = &unk_1E62196A0;
    uint64_t v9 = v17;
    dispatch_object_t v10 = v12;
    dispatch_block_t v11 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_USER_INITIATED, 0, &block);
    if (v11)
    {
      dispatch_source_set_event_handler(v12, v11);
      _Block_release(v11);
    }
    v17->_rampTimer = (OS_dispatch_source *)v12;
    dispatch_resume(v12);
    char v14 = 1;
  }
  return v14 & 1;
}

- (BOOL)ignoreALSEventsInAOD
{
  unint64_t v4 = [+[CBAODState sharedInstance] AODState];
  BOOL v3 = 1;
  if (v4 != 2)
  {
    BOOL v3 = 1;
    if (v4 != 3) {
      return v4 == 4;
    }
  }
  return v3;
}

uint64_t __58__CBColorModuleiOS_handleNotificationForKey_withProperty___block_invoke(id *a1)
{
  if ([a1[4] isEqual:@"DisplayBrightnessFactorZero"]) {
    return [a1[5] handleDisplayBrightnessFactorZero:a1[6]];
  }
  if ([a1[4] isEqualToString:@"TwilightStrength"])
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      [a1[6] floatValue];
      float v8 = v2;
      float v3 = CFXGetTwilightStrength(*((void *)a1[5] + 8));
      uint64_t result = float_equal(v3, v8);
      if ((result & 1) == 0)
      {
        uint64_t result = CFXSetTwilightStrength(*((void *)a1[5] + 8), v8);
        if ((*((unsigned char *)a1[5] + 75) & 1) == 0)
        {
          uint64_t v6 = *((void *)a1[5] + 8);
          double Current = CFAbsoluteTimeGetCurrent();
          return CFXUpdateColorFade(v6, Current);
        }
      }
    }
  }
  else
  {
    uint64_t result = [a1[4] isEqualToString:@"TrustedLux"];
    if (result & 1) != 0 && (*((unsigned char *)a1[5] + 368))
    {
      objc_opt_class();
      uint64_t result = objc_opt_isKindOfClass();
      if (result)
      {
        uint64_t result = [a1[6] floatValue];
        *((_DWORD *)a1[5] + 93) = v5;
      }
    }
  }
  return result;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  id v24 = self;
  SEL v23 = a2;
  id v22 = a3;
  id v21 = a4;
  uint64_t v16 = 0;
  double v17 = &v16;
  int v18 = 0x20000000;
  int v19 = 32;
  char v20 = 0;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  dispatch_object_t v10 = __39__CBColorModuleiOS_setProperty_forKey___block_invoke;
  dispatch_block_t v11 = &unk_1E6219790;
  id v12 = a4;
  float v13 = v24;
  float v15 = &v16;
  id v14 = a3;
  dispatch_sync(queue, &block);
  char v6 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v6 & 1;
}

uint64_t __39__CBColorModuleiOS_copyPropertyForKey___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t result = [*(id *)(a1 + 32) getKeyCategory];
    if (result == *(void *)(*(void *)(a1 + 40) + 376))
    {
      uint64_t result = objc_msgSend(*(id *)(a1 + 40), "copyPropertyInternalForKey:", objc_msgSend(*(id *)(a1 + 32), "getKeyString"));
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
    }
  }
  else
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      if (([*(id *)(a1 + 32) isEqualToString:@"CEOutput"] & 1) != 0
        || ([*(id *)(a1 + 32) isEqualToString:@"CEInput"] & 1) != 0)
      {
        return objc_msgSend(*(id *)(*(void *)(a1 + 40) + 360), "enumerateObjectsUsingBlock:");
      }
      else
      {
        uint64_t result = [*(id *)(a1 + 40) copyPropertyInternalForKey:*(void *)(a1 + 32)];
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
      }
    }
  }
  return result;
}

- (id)copyPropertyForKey:(id)a3
{
  SEL v23 = self;
  SEL v22 = a2;
  id v21 = a3;
  uint64_t v14 = 0;
  float v15 = &v14;
  int v16 = 1375731712;
  int v17 = 48;
  int v18 = __Block_byref_object_copy__10;
  int v19 = __Block_byref_object_dispose__10;
  uint64_t v20 = 0;
  queue = self->super._queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __39__CBColorModuleiOS_copyPropertyForKey___block_invoke;
  dispatch_object_t v10 = &unk_1E6219300;
  id v11 = a3;
  id v12 = v23;
  float v13 = &v14;
  dispatch_sync(queue, &block);
  int v5 = (void *)v15[5];
  _Block_object_dispose(&v14, 8);
  return v5;
}

uint64_t __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_251(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "addObject:", *(void *)(a1 + 40), a1, a1);
}

- (void)enableMitigations:(BOOL)a3
{
  float v15 = self;
  SEL v14 = a2;
  BOOL v13 = a3;
  if (self->_enableMitigations != a3)
  {
    if (v13)
    {
      v15->_ceModule = [[CBCEModule alloc] initWithQueue:v15->super._queue ceModelID:v15->_ceModelID];
      ceModule = v15->_ceModule;
      uint64_t v7 = MEMORY[0x1E4F143A8];
      int v8 = -1073741824;
      int v9 = 0;
      dispatch_object_t v10 = __38__CBColorModuleiOS_enableMitigations___block_invoke;
      id v11 = &unk_1E62190B8;
      id v12 = v15;
      -[CBModule registerNotificationBlock:](ceModule, "registerNotificationBlock:");
      [(NSMutableArray *)v15->_modules addObject:v15->_ceModule];
      unint64_t v4 = [CBColorPolicyFilter alloc];
      char v6 = [(CBColorPolicyFilter *)v4 initWithID:v15->_ceModelID];
      [(CBColorPolicyFilter *)v6 setModuleObject:v15->_ceModule];
      *(float *)&double v5 = v15->_ceConfidenceThreshold;
      -[CBColorPolicyFilter setProperty:forKey:](v6, "setProperty:forKey:", [NSNumber numberWithFloat:v5], @"CEConfidenceThreshold");
      [(NSMutableArray *)v15->_filters addObject:v6];

      v15->_enableMitigations = 1;
      CFXEnableMitigations((uint64_t)v15->_colorStruct.cfx, v13);
    }
    v15->_enableMitigations = v13;
  }
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  v94 = self;
  SEL v93 = a2;
  IOHIDServiceClientRef v92 = a3;
  uint64_t v87 = 0;
  v88 = &v87;
  int v89 = 0x20000000;
  int v90 = 32;
  char v91 = 0;
  if (a3)
  {
    v83 = 0;
    if (v94->super._logHandle)
    {
      os_log_t logHandle = v94->super._logHandle;
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
    v83 = logHandle;
    os_log_type_t v82 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      SEL v25 = v83;
      os_log_type_t v26 = v82;
      __os_log_helper_16_0_0(v81);
      _os_log_debug_impl(&dword_1BA438000, v25, v26, "Check if the service is ALS", v81, 2u);
    }
    if (IOHIDServiceClientConformsTo(v92, 0xFF00u, 4u))
    {
      uint64_t v74 = 0;
      uint64_t v75 = &v74;
      int v76 = 1375731712;
      int v77 = 48;
      uint64_t v78 = __Block_byref_object_copy__10;
      v79 = __Block_byref_object_dispose__10;
      v80 = 0;
      v80 = [[CBALSNode alloc] initWithALSServiceClient:v92];
      memset(__b, 0, sizeof(__b));
      obunsigned int j = v94->_filters;
      uint64_t v24 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v96 count:16];
      if (v24)
      {
        uint64_t v20 = *(void *)__b[2];
        uint64_t v21 = 0;
        unint64_t v22 = v24;
        while (1)
        {
          uint64_t v19 = v21;
          if (*(void *)__b[2] != v20) {
            objc_enumerationMutation(obj);
          }
          id v73 = 0;
          id v73 = *(id *)(__b[1] + 8 * v21);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v73, "setIsActive:", (objc_msgSend(v73, "isActive") & 1 & objc_msgSend((id)v75[5], "useProxForOcclusion") & 1) != 0);
          }
          ++v21;
          if (v19 + 1 >= v22)
          {
            uint64_t v21 = 0;
            unint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v96 count:16];
            if (!v22) {
              break;
            }
          }
        }
      }
      char v71 = 0;
      char v71 = [(id)v75[5] isColorSupported] & 1;
      BOOL v70 = 0;
      BOOL v70 = [(id)v75[5] placement] == 2;
      if (!v70 && ((v71 & 1) != 0 || v94->_supportsAmmoliteWithoutColor))
      {
        queue = v94->super._queue;
        uint64_t block = MEMORY[0x1E4F143A8];
        int v62 = -1073741824;
        int v63 = 0;
        id v64 = __40__CBColorModuleiOS_addHIDServiceClient___block_invoke;
        v65 = &unk_1E62199C0;
        id v66 = v94;
        IOHIDServiceClientRef v69 = v92;
        os_log_type_t v67 = &v74;
        v68 = &v87;
        dispatch_sync(queue, &block);
        CFTypeRef v60 = 0;
        CFTypeRef v60 = (CFTypeRef)[(id)v75[5] copyEvent];
        if (v60)
        {
          [(CBColorModuleiOS *)v94 handleHIDEvent:v60 from:v92];
          CFRelease(v60);
        }
      }

      _Block_object_dispose(&v74, 8);
    }
    else if (IOHIDServiceClientConformsTo(v92, 0xFF00u, 8u))
    {
      id v59 = 0;
      if (v94->super._logHandle)
      {
        int v18 = v94->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v17 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v17 = init_default_corebrightness_log();
        }
        int v18 = v17;
      }
      id v59 = v18;
      os_log_type_t v58 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        float v15 = v59;
        os_log_type_t v16 = v58;
        __os_log_helper_16_0_0(v57);
        _os_log_impl(&dword_1BA438000, v15, v16, "Incoming proximity sensor service", v57, 2u);
      }
      unint64_t v4 = v94->super._queue;
      uint64_t v50 = MEMORY[0x1E4F143A8];
      int v51 = -1073741824;
      int v52 = 0;
      uint64_t v53 = __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_250;
      id v54 = &unk_1E6219538;
      os_log_type_t v55 = v94;
      IOHIDServiceClientRef v56 = v92;
      dispatch_sync(v4, &v50);
    }
    else if (IOHIDServiceClientConformsTo(v92, 0xDu, 4u) || IOHIDServiceClientConformsTo(v92, 0xDu, 0xCu))
    {
      os_log_t oslog = 0;
      if (v94->super._logHandle)
      {
        SEL v14 = v94->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v13 = init_default_corebrightness_log();
        }
        SEL v14 = v13;
      }
      os_log_t oslog = v14;
      os_log_type_t v48 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v11 = oslog;
        os_log_type_t v12 = v48;
        __os_log_helper_16_0_0(v47);
        _os_log_impl(&dword_1BA438000, v11, v12, "Incoming multiple point digitizer service", v47, 2u);
      }
      double v5 = v94->super._queue;
      uint64_t v40 = MEMORY[0x1E4F143A8];
      int v41 = -1073741824;
      int v42 = 0;
      v43 = __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_251;
      os_log_t v44 = &unk_1E6219538;
      int v45 = v94;
      IOHIDServiceClientRef v46 = v92;
      dispatch_sync(v5, &v40);
    }
    else if (IOHIDServiceClientConformsTo(v92, 0x20u, 0x41u) && v94->_moduleType == 2)
    {
      char v6 = v94->super._queue;
      uint64_t v33 = MEMORY[0x1E4F143A8];
      int v34 = -1073741824;
      int v35 = 0;
      uint64_t v36 = __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_2_252;
      os_log_t v37 = &unk_1E6219538;
      IOHIDServiceClientRef v39 = v92;
      int v38 = v94;
      dispatch_sync(v6, &v33);
      *((unsigned char *)v88 + 24) = 1;
    }
    if (v94->super._logHandle)
    {
      dispatch_object_t v10 = v94->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v9 = init_default_corebrightness_log();
      }
      dispatch_object_t v10 = v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_4_8_0_4_0_8_64_8_64((uint64_t)v95, (uint64_t)v92, v88[3] & 1, (uint64_t)v94->_relevantServices, (uint64_t)v94->_alsServices);
      _os_log_debug_impl(&dword_1BA438000, v10, OS_LOG_TYPE_DEBUG, "service: %p relevant:%d services-> %@ ALS services-> %@", v95, 0x26u);
    }
  }
  else
  {
    v86 = 0;
    if (v94->super._logHandle)
    {
      unint64_t v32 = v94->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v31 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v31 = init_default_corebrightness_log();
      }
      unint64_t v32 = v31;
    }
    v86 = v32;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      os_log_t log = v86;
      os_log_type_t v30 = type;
      __os_log_helper_16_0_0(v84);
      _os_log_error_impl(&dword_1BA438000, log, v30, "HID service client pointer is NULL", v84, 2u);
    }
  }
  char v8 = *((unsigned char *)v88 + 24);
  _Block_object_dispose(&v87, 8);
  return v8 & 1;
}

- (CBColorModuleiOS)init
{
  return -[CBColorModuleiOS initWithBacklight:andModuleType:](self, "initWithBacklight:andModuleType:", 0, 2, a2, self);
}

- (CBColorModuleiOS)initWithBacklight:(unsigned int)a3 andModuleType:(unint64_t)a4
{
  return -[CBColorModuleiOS initWithBacklight:andModuleType:andBrightnessControl:](self, "initWithBacklight:andModuleType:andBrightnessControl:", a3, a4, 0, a4);
}

- (CBColorModuleiOS)initWithBacklight:(unsigned int)a3 andModuleType:(unint64_t)a4 andBrightnessControl:(id)a5
{
  IOHIDServiceClientRef v56 = self;
  SEL v55 = a2;
  unsigned int v54 = a3;
  unint64_t v53 = a4;
  id v52 = a5;
  v51.receiver = self;
  v51.super_class = (Class)CBColorModuleiOS;
  IOHIDServiceClientRef v56 = [(CBColorModuleiOS *)&v51 init];
  if (!v56) {
    return v56;
  }
  v56->_colorEffectsEnabled = 1;
  v56->_dropALSColorSamples = 0;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v56, (CFNotificationCallback)StockholmALSCoExEnableNotificationHandler, @"com.apple.stockholm.reader.cardDetected", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  char v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, v56, (CFNotificationCallback)StockholmALSCoExDisableNotificationHandler, @"com.apple.stockholm.reader.cardLost", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v56->_moduleType = v53;
  v56->_backlightService = v54;
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:");
  v56->_relevantServices = (NSMutableArray *)v7;
  uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  v56->_properties = (NSMutableDictionary *)v8;
  uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v56->_alsServices = v9;
  dispatch_object_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v56->_alsNodes = v10;
  id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v56->_pendingALSSamples = v11;
  uint64_t v50 = 0;
  uint64_t v49 = 0;
  uint64_t v33 = [(CBColorModuleiOS *)v56 moduleType];
  if (v33 == 1)
  {
    uint64_t v50 = "com.apple.CoreBrightness.CBColorModule.Primary";
    uint64_t v49 = "ColorModule - Primary";
  }
  else if (v33 == 2)
  {
    uint64_t v50 = "com.apple.CoreBrightness.CBColorModule.External";
    uint64_t v49 = "ColorModule - External";
  }
  else
  {
    uint64_t v50 = "com.apple.CoreBrightness.CBColorModule.Undefined";
    uint64_t v49 = "ColorModule - Undefined";
  }
  os_log_t v12 = os_log_create(v50, "default");
  v56->super._os_log_t logHandle = (OS_os_log *)v12;
  if (v56->super._logHandle)
  {
    dispatch_queue_t v13 = dispatch_queue_create(v49, 0);
    v56->super._queue = (OS_dispatch_queue *)v13;
    if (!v56->super._queue)
    {
      int v45 = 0;
      if (v56->super._logHandle)
      {
        os_log_t logHandle = v56->super._logHandle;
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
      int v45 = logHandle;
      char v44 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        SEL v25 = v45;
        os_log_type_t v26 = v44;
        __os_log_helper_16_0_0(v43);
        _os_log_error_impl(&dword_1BA438000, v25, v26, "failed to create dispatch queue", v43, 2u);
      }
      goto LABEL_37;
    }
    [(CBColorModuleiOS *)v56 initColorStruct];
    v56->_reportContext.periodS = 300;
    v56->_displayOn = 1;
    v56->_forceInitialFactorUpdate = 1;
    v56->_firstALSEventArrived = 0;
    v56->_allALSEventsArrived = 0;
    v56->_forceColorUpdate = 1;
    v56->_potentiallyBustedALS = 0;
    v56->_continueWithFewerALSs = 0;
    v56->_useCopyEventOnDisplayWake = 0;
    v56->_NSamples = 0;
    v56->_preStrobeDimPeriod = -1.0;
    v56->_trustedLux = 0.0;
    v56->_supportsAmmoliteWithoutColor = 0;
    v56->_firstSampleTimeoutValue = 0.25;
    if ([(CBColorModuleiOS *)v56 moduleType] == 1) {
      [(CBColorModuleiOS *)v56 reportInitialize];
    }
    [(CBColorModuleiOS *)v56 filterInitialize];
    [(CBColorModuleiOS *)v56 loadBacklightProperties];
    if (v56->_moduleType == 2)
    {
      SEL v14 = [CBColorFilter alloc];
      uint64_t v15 = [(CBColorFilter *)v14 initWithQueue:v56->super._queue];
      v56->_colorFilter = (CBColorFilter *)v15;
      [(CBColorFilter *)v56->_colorFilter setSensorPolicy:7];
      [(CBColorFilter *)v56->_colorFilter setMode:6];
    }
    if (v52)
    {
      id v16 = v52;
      v56->_brightnessControl = (CBBrightnessProxy *)v52;
    }
    if (v56->_moduleType == 1) {
      [(CBColorModuleiOS *)v56 ttRestrictionReload];
    }
    v56->_enableMitigations = 0;
    v56->_ceConfidenceThreshold = 0.1;
    uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v56->_modules = v17;
    int v18 = +[CBAnalyticsScheduler sharedInstance];
    uint64_t v37 = MEMORY[0x1E4F143A8];
    int v38 = -1073741824;
    int v39 = 0;
    uint64_t v40 = __73__CBColorModuleiOS_initWithBacklight_andModuleType_andBrightnessControl___block_invoke;
    int v41 = &unk_1E6218FE0;
    int v42 = v56;
    uint64_t v19 = -[CBAnalyticsScheduler registerHandler:](v18, "registerHandler:");
    v56->_analyticsPeriodicSender = v19;
    return v56;
  }
  os_log_type_t v48 = 0;
  if (v56->super._logHandle)
  {
    unint64_t v32 = v56->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v31 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v31 = init_default_corebrightness_log();
    }
    unint64_t v32 = v31;
  }
  os_log_type_t v48 = v32;
  char v47 = 16;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    os_log_t log = v48;
    os_log_type_t type = v47;
    __os_log_helper_16_0_0(v46);
    _os_log_error_impl(&dword_1BA438000, log, type, "Failed to create logHandle", v46, 2u);
  }
LABEL_37:
  uint64_t v36 = 0;
  if (v56->super._logHandle)
  {
    uint64_t v24 = v56->super._logHandle;
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
  uint64_t v36 = v24;
  char v35 = 16;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = v36;
    os_log_type_t v22 = v35;
    __os_log_helper_16_0_0(v34);
    _os_log_error_impl(&dword_1BA438000, v21, v22, "error creating main CBColorModule", v34, 2u);
  }
  [(CBColorModuleiOS *)v56 stop];

  IOHIDServiceClientRef v56 = 0;
  return 0;
}

void __73__CBColorModuleiOS_initWithBacklight_andModuleType_andBrightnessControl___block_invoke(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v9 = a1;
  float v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  uint64_t block = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  char v6 = __73__CBColorModuleiOS_initWithBacklight_andModuleType_andBrightnessControl___block_invoke_2;
  uint64_t v7 = &unk_1E6218FE0;
  uint64_t v8 = *(void *)(a1 + 32);
  dispatch_async(v2, &block);
}

uint64_t __73__CBColorModuleiOS_initWithBacklight_andModuleType_andBrightnessControl___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 104)) {
    return +[CBAnalytics harmonyEnabled:*(unsigned char *)(*(void *)(result + 32) + 105) & 1 byUser:0];
  }
  return result;
}

- (BOOL)start
{
  id v11 = self;
  SEL v10 = a2;
  if ((CBU_IsR2RSupported() & 1) != 0 && v11->_moduleType == 1)
  {
    queue = v11->super._queue;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    uint64_t v7 = __25__CBColorModuleiOS_start__block_invoke;
    uint64_t v8 = &unk_1E6218FE0;
    uint64_t v9 = v11;
    dispatch_async(queue, &block);
  }
  return 1;
}

uint64_t __25__CBColorModuleiOS_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAvailability];
}

- (void)stop
{
}

- (void)dealloc
{
  uint64_t v7 = self;
  SEL v6 = a2;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v7, @"com.apple.stockholm.reader.cardDetected", 0);
  float v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v3, v7, @"com.apple.stockholm.reader.cardLost", 0);
  if (v7->_rampTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v7->_rampTimer);
    dispatch_release((dispatch_object_t)v7->_rampTimer);
  }
  if (v7->_reportContext.logTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v7->_reportContext.logTimer);
    dispatch_release((dispatch_object_t)v7->_reportContext.logTimer);
  }

  if (v7->_colorStruct.cfx) {
    CFXRelease((void **)v7->_colorStruct.cfx);
  }
  if (v7->_brightnessControl)
  {
    int v4 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;

    v7->_brightnessControl = 0;
  }
  v5.receiver = v7;
  v5.super_class = (Class)CBColorModuleiOS;
  [(CBContainer *)&v5 dealloc];
}

- (void)filterInitialize
{
  self->_filters = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  float v2 = objc_alloc_init(CBBrightestALSFilter);
  [(NSMutableArray *)self->_filters addObject:v2];
}

- (void)loadBacklightProperties
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  os_log_t v12 = self;
  SEL v11 = a2;
  if (self->_backlightService)
  {
    CFTypeRef v10 = 0;
    CFTypeRef v10 = IORegistryEntrySearchCFProperty(v12->_backlightService, "IOService", @"pre-strobe-dim-period", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3u);
    unsigned int v9 = 0;
    if ([(CBColorModuleiOS *)v12 convertNSData:v10 toUint32:&v9])
    {
      v12->_preStrobeDimPeriod = (float)v9 / 1000.0;
      os_log_t v8 = 0;
      if (v12->super._logHandle)
      {
        os_log_t logHandle = v12->super._logHandle;
      }
      else
      {
        uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        os_log_t logHandle = v4;
      }
      os_log_t v8 = logHandle;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v14, COERCE__INT64(v12->_preStrobeDimPeriod));
        _os_log_impl(&dword_1BA438000, v8, v7, "PreStrobe period = %f", v14, 0xCu);
      }
    }
    if (v10) {
      CFRelease(v10);
    }
    *(_DWORD *)SEL v6 = 0;
    if (!readExactDataFromIOService(v12->_backlightService, @"aml-only-support", v6, 4)) {
      *(_DWORD *)SEL v6 = 0;
    }
    v12->_supportsAmmoliteWithoutColor = *(_DWORD *)v6 != 0;
    if (v12->super._logHandle)
    {
      float v3 = v12->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      float v3 = inited;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v13, v12->_supportsAmmoliteWithoutColor);
      _os_log_impl(&dword_1BA438000, v3, OS_LOG_TYPE_INFO, "Ammolite without Color ALS: %d", v13, 8u);
    }
  }
}

- (BOOL)displayBrightnessFactorPropertyHandler:(id)a3
{
  BOOL v5 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = (id)[a3 objectForKey:@"DisplayBrightnessFactor"];
  }
  else {
    id v4 = a3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = 1;
    [v4 floatValue];
    -[CBColorModuleiOS displayBrightnessFactorUpdate:](self, "displayBrightnessFactorUpdate:");
    [(NSMutableDictionary *)self->_properties setObject:v4 forKey:@"DisplayBrightnessFactor"];
  }
  return v5;
}

- (void)handleDisplayBrightnessFactorZero:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v6, self->_displayOn);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "FactorZero - display state = %d\n", v6, 8u);
  }
  if (!self->_displayOn && self->_colorStruct.harmonyEnabled && self->_moduleType == 1) {
    CFXResetAdaptation((uint64_t)self->_colorStruct.cfx, 0.1);
  }
}

- (void)displayBrightnessFactorUpdate:(float)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = self;
  SEL v35 = a2;
  float v34 = a3;
  os_log_t oslog = 0;
  if (self->super._logHandle)
  {
    os_log_t logHandle = v36->super._logHandle;
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
  os_log_type_t type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_2_8_0_4_0((uint64_t)v39, COERCE__INT64(v34), v36->_NSamples);
    _os_log_impl(&dword_1BA438000, oslog, type, "Brightness factor update = %f, N samples = %d", v39, 0x12u);
  }
  BOOL displayOn = 0;
  BOOL displayOn = v36->_displayOn;
  double v3 = v34;
  v36->_BOOL displayOn = v34 > 0.0;
  if (v36->_displayOn != displayOn || v36->_forceInitialFactorUpdate)
  {
    v36->_forceInitialFactorUpdate = 0;
    if (v36->_displayOn)
    {
      if ([(CBColorModuleiOS *)v36 moduleType] == 1) {
        [(CBColorModuleiOS *)v36 reportInitialize];
      }
      if (v36->_moduleType == 2)
      {
        char v30 = 0;
        char v30 = [(CBColorFilter *)v36->_colorFilter forceSampleUpdate];
        if (v30) {
          [(CBColorModuleiOS *)v36 processColorSample:[(CBColorFilter *)v36->_colorFilter sample] forceUpdate:1];
        }
      }
      else
      {
        [(CBColorModuleiOS *)v36 applyPendingSamples];
        if (!v36->_allALSEventsArrived && v36->_useCopyEventOnDisplayWake)
        {
          id v29 = [(CBColorModuleiOS *)v36 copyALSSamples];
          if ([v29 count])
          {
            LODWORD(v4) = 0.5;
            if ([(CBColorModuleiOS *)v36 applySamples:v29 withinTimeout:v4])
            {
              os_log_t v28 = 0;
              if (v36->super._logHandle)
              {
                uint64_t v21 = v36->super._logHandle;
              }
              else
              {
                uint64_t v20 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
                uint64_t v21 = v20;
              }
              os_log_t v28 = v21;
              os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                SEL v14 = v28;
                os_log_type_t v15 = v27;
                *(double *)&uint64_t v16 = v34;
                uint64_t v17 = [v29 count];
                objc_msgSend((id)objc_msgSend(v29, "objectAtIndexedSubscript:"), "illuminance");
                uint64_t v18 = v5;
                uint64_t v19 = (void *)[v29 objectAtIndexedSubscript:0];
                if (v19) {
                  [v19 colorSample];
                }
                else {
                  memset(&v26[15], 0, 0x3CuLL);
                }
                *(double *)&uint64_t v12 = v26[18];
                dispatch_queue_t v13 = (void *)[v29 objectAtIndexedSubscript:0];
                if (v13) {
                  [v13 colorSample];
                }
                else {
                  memset(v26, 0, 0x3CuLL);
                }
                __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v38, v16, v17, v18, v12, COERCE__INT64(v26[4]));
                _os_log_impl(&dword_1BA438000, v14, v15, "Display on (f=%f) -> Copied ALS samples (count = %lu) has been applied (Lux[0] = %f, x[0]=%f y[0]=%f).", v38, 0x34u);
              }
            }
          }
        }
        if (!v36->_allALSEventsArrived) {
          [(CBColorModuleiOS *)v36 armFirstALSSampleTimer];
        }
      }
    }
    else
    {
      v36->_firstALSEventArrived = 0;
      v36->_allALSEventsArrived = 0;
      v36->_forceColorUpdate = 1;
      v36->_continueWithFewerALSs = 0;
      v36->_NSamples = 0;
      [(CBColorModuleiOS *)v36 cancelFirstSampleTimeout];
      [(NSMutableDictionary *)v36->_alsNodes enumerateKeysAndObjectsUsingBlock:&__block_literal_global_7];
      memset(v24, 0, sizeof(v24));
      obunsigned int j = v36->_filters;
      uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:v24 objects:v37 count:16];
      if (v11)
      {
        uint64_t v7 = *(void *)v24[2];
        uint64_t v8 = 0;
        unint64_t v9 = v11;
        while (1)
        {
          uint64_t v6 = v8;
          if (*(void *)v24[2] != v7) {
            objc_enumerationMutation(obj);
          }
          id v25 = 0;
          id v25 = *(id *)(v24[1] + 8 * v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v25 resetFilter];
          }
          ++v8;
          if (v6 + 1 >= v9)
          {
            uint64_t v8 = 0;
            unint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:v24 objects:v37 count:16];
            if (!v9) {
              break;
            }
          }
        }
      }
      v36->_dropALSColorSamples = 0;
    }
    if (!v36->_displayOn && [(CBColorModuleiOS *)v36 moduleType] == 1) {
      [(CBColorModuleiOS *)v36 reportCommitWithStop:1];
    }
  }
}

uint64_t __50__CBColorModuleiOS_displayBrightnessFactorUpdate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setCurrentALSEvent:0];
}

- (BOOL)CoreBrightnessFeaturesDisabledPropertyHandler:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = self;
  SEL v35 = a2;
  id v34 = a3;
  os_log_t v33 = 0;
  if (self->super._logHandle)
  {
    os_log_t logHandle = v36->super._logHandle;
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
  os_log_t v33 = logHandle;
  os_log_type_t v32 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v37, (uint64_t)v34);
    _os_log_debug_impl(&dword_1BA438000, v33, v32, "CoreBrightnessFeaturesDisabled handler called with dict %@", v37, 0xCu);
  }
  char v31 = 0;
  id v30 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v30 = (id)[v34 objectForKey:@"DisableWPShift"];
  }
  else {
    id v30 = (id)MEMORY[0x1E4F1CC28];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v36->_colorEffectsEnabled = ([v30 BOOLValue] ^ 1) & 1;
    objc_msgSend((id)objc_msgSend(v34, "objectForKey:", @"ReenablementRampPeriod"), "floatValue");
    float v29 = v3;
    objc_msgSend((id)objc_msgSend(v34, "objectForKey:", @"DisablementRampPeriod"), "floatValue");
    float v28 = v4;
    if (v36->_colorStruct.harmonyActive)
    {
      if (v36->_colorEffectsEnabled)
      {
        os_log_type_t v27 = 0;
        if (v36->super._logHandle)
        {
          uint64_t v19 = v36->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v18 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v18 = init_default_corebrightness_log();
          }
          uint64_t v19 = v18;
        }
        os_log_type_t v27 = v19;
        char v26 = 2;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v16 = v27;
          os_log_type_t v17 = v26;
          __os_log_helper_16_0_0(v25);
          _os_log_debug_impl(&dword_1BA438000, v16, v17, "Suspend harmony: OFF", v25, 2u);
        }
        *(float *)&CFAbsoluteTime v5 = v29;
        CFXSuspendHarmony((uint64_t)v36->_colorStruct.cfx, 0, v5);
      }
      else
      {
        uint64_t v24 = 0;
        if (v36->super._logHandle)
        {
          os_log_type_t v15 = v36->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v14 = init_default_corebrightness_log();
          }
          os_log_type_t v15 = v14;
        }
        uint64_t v24 = v15;
        char v23 = 2;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v12 = v24;
          os_log_type_t v13 = v23;
          __os_log_helper_16_0_0(v22);
          _os_log_debug_impl(&dword_1BA438000, v12, v13, "Suspend harmony: ON", v22, 2u);
        }
        *(float *)&CFAbsoluteTime v6 = v28;
        CFXSuspendHarmony((uint64_t)v36->_colorStruct.cfx, 1, v6);
      }
    }
    if (v36->_colorStruct.nightModeSupported)
    {
      uint64_t cfx = (uint64_t)v36->_colorStruct.cfx;
      if (!v36->_colorEffectsEnabled) {
        int v7 = 0;
      }
      else {
        int v7 = -1;
      }
      float v11 = (float)v7;
      if (v36->_colorEffectsEnabled) {
        CFXSetBlueReductionFactorOverride(cfx, v11, v29);
      }
      else {
        CFXSetBlueReductionFactorOverride(cfx, v11, v28);
      }
    }
    if (v36->_ammoliteEnabledStatus)
    {
      if (v36->_colorEffectsEnabled)
      {
        if (v36->_backlightService)
        {
          CFXInitAmmolite((uint64_t)v36->_colorStruct.cfx, v36->_backlightService);
          BOOL v8 = CFXAmmoliteEnabled((uint64_t)v36->_colorStruct.cfx);
          v36->_ammoliteEnabledStatus = v8;
        }
      }
      else
      {
        v36->_ammoliteEnabledStatus = 1;
        CFXAmmoliteDisable((uint64_t)v36->_colorStruct.cfx);
      }
    }
    else
    {
      CFXAmmoliteDisable((uint64_t)v36->_colorStruct.cfx);
      v36->_ammoliteEnabledStatus = 0;
    }
    char v31 = 1;
  }
  return v31 & 1;
}

- (BOOL)preStrobePropertyHandler:(id)a3
{
  BOOL v8 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_colorStruct.cfx)
  {
    BOOL v7 = [a3 intValue] != 0;
    if (v7) {
      float v6 = 0.0;
    }
    else {
      float v6 = fmaxf(0.0, self->_preStrobeDimPeriod);
    }
    if (self->_colorStruct.harmonyActive)
    {
      if (v7) {
        float harmonyStrength = 0.0;
      }
      else {
        float harmonyStrength = self->_colorStruct.harmonyStrength;
      }
      CFXSetAmbientAdaptationStrength((uint64_t)self->_colorStruct.cfx, COERCE_CFABSOLUTETIME((unint64_t)LODWORD(harmonyStrength)), v6);
    }
    if (self->_colorStruct.nightModeSupported)
    {
      if (v7) {
        int v3 = 0;
      }
      else {
        int v3 = -1;
      }
      CFXSetBlueReductionFactorOverride((uint64_t)self->_colorStruct.cfx, (float)v3, v6);
    }
    return 1;
  }
  return v8;
}

- (BOOL)preStrobeDimPeriodPropertyHandler:(id)a3
{
  BOOL v5 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 floatValue];
    self->_preStrobeDimPeriod = v3;
    return 1;
  }
  return v5;
}

- (BOOL)BLRFactorPropertyHandler:(id)a3
{
  BOOL v9 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 floatValue];
    -[CBColorModuleiOS BLRFactorUpdate:](self, "BLRFactorUpdate:");
    return 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v8 = 0;
      BOOL v7 = (void *)[a3 objectForKey:@"BlueLightReductionFactorValue"];
      float v6 = (void *)[a3 objectForKey:@"BlueLightReductionFactorFadePeriod"];
      BOOL v5 = (void *)[a3 objectForKey:@"ForceUpdate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        BOOL v8 = ([v5 BOOLValue] & 1) != 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v6 floatValue];
        }
        objc_msgSend(v7, "floatValue", self);
        objc_msgSend(v4, "BLRFactorUpdate:withPeriod:shouldForceUpdate:", v8);
        return 1;
      }
    }
  }
  return v9;
}

- (void)BLRFactorUpdate:(float)a3
{
  LODWORD(v3) = -1.0;
  [(CBColorModuleiOS *)self BLRFactorUpdate:0 withPeriod:*(double *)&a3 shouldForceUpdate:v3];
}

- (void)BLRFactorUpdate:(float)a3 withPeriod:(float)a4 shouldForceUpdate:(BOOL)a5
{
  BOOL v7 = a5;
  double v5 = a3;
  self->_colorStruct.blueReductionEnabled = a3 > 0.0;
  *(float *)&double v5 = a3;
  self->_colorStruct.blueReductionFactor = a3 != 0.0;
  if (self->_colorStruct.enforceSlowRamps)
  {
    LODWORD(v5) = -1.0;
    a4 = -1.0;
    self->_colorStruct.enforceSlowRamps = 0;
  }
  if (self->_colorStruct.blueReductionEnabled) {
    uint64_t v6 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CC28];
  }
  [(CBColorModuleiOS *)self sendNotificationForKey:@"BlueReductionEnabled", v6, v5 andValue];
  if (!self->_aggregatedConfigApplied) {
    CFXEnableBlueLightReduction((uint64_t)self->_colorStruct.cfx, v7, a3, a4);
  }
}

- (BOOL)BLRCCTTargetPropertyHandler:(id)a3
{
  BOOL v13 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = (void *)[a3 objectForKey:@"BlueLightReductionCCTTargetValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      float v11 = v3;
      float v10 = -1.0;
      BOOL v7 = (void *)[a3 objectForKey:@"BlueLightReductionCCTTargetPeriod"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 floatValue];
        float v10 = v4;
      }
      BOOL v8 = (void *)[a3 objectForKey:@"BlueLightReductionCCTTargetCommit"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned __int8 v9 = [v8 BOOLValue] & 1;
        double v5 = v10;
        if (v10 == -1.0)
        {
          LODWORD(v5) = -1.0;
          if ((v9 & 1) == 0) {
            *(float *)&double v5 = 0.0;
          }
          float v10 = *(float *)&v5;
        }
        if (!self->_aggregatedConfigApplied) {
          CFXSetBlueLightReductionTargetCCT((uint64_t)self->_colorStruct.cfx, 0, v11, v10, (float)((v9 ^ 1) & 1));
        }
        BOOL v13 = 1;
        if (v9) {
          [(CBColorModuleiOS *)self setPreferences:v12, @"CBBlueLightReductionCCTTargetRaw", v5 forKey];
        }
      }
    }
  }
  return v13;
}

- (BOOL)BLRCCTRangePropertyHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v7 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 count] == 3)
  {
    unint64_t v10 = 0xBF800000BF800000;
    float v11 = -1.0;
    for (int i = 0; i < 3; ++i)
    {
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", i), "floatValue");
      *((_DWORD *)&v10 + i) = v3;
    }
    if (*(float *)&v10 != -1.0 && *((float *)&v10 + 1) != -1.0 && v11 != -1.0)
    {
      *(float *)&double v4 = CFXOverrideBlueLightReductionCCTRange((uint64_t)self->_colorStruct.cfx, v11, *(float *)&v10, *((float *)&v10 + 1));
      [(CBColorModuleiOS *)self setPreferences:a3, @"CBBlueLightReductionCCTRange", v4 forKey];
      return 1;
    }
  }
  return v7;
}

- (BOOL)CALabShiftPropertyHandler:(id)a3
{
  uint64_t v12 = self;
  SEL v11 = a2;
  id v10 = a3;
  BOOL v9 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = 0;
    BOOL v7 = (void *)[v10 objectForKey:@"a"];
    uint64_t v6 = (void *)[v10 objectForKey:@"b"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 floatValue];
        LODWORD(v8) = v3;
        [v6 floatValue];
        HIDWORD(v8) = v4;
        CFXSetABShift((uint64_t)v12->_colorStruct.cfx, &v8);
        return 1;
      }
    }
  }
  return v9;
}

- (BOOL)CAEnabledPropertyHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v10 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v9 = [a3 BOOLValue] & 1;
    if (self->_colorStruct.harmonySupported)
    {
      if (self->_colorStruct.cfx)
      {
        self->_colorStruct.harmonyEnabled = v9 & 1;
        char v10 = 1;
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
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
        {
          if (self->_colorStruct.harmonyEnabled) {
            int v3 = "ON";
          }
          else {
            int v3 = "OFF";
          }
          __os_log_helper_16_2_1_8_32((uint64_t)v13, (uint64_t)v3);
          _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "harmony turned %s", v13, 0xCu);
        }
        [(CBColorModuleiOS *)self updateActivity];
        id v8 = (id)[objc_alloc(NSNumber) initWithInt:v9 & 1];
        if (v8)
        {
          [(CBColorModuleiOS *)self setPreferences:v8 forKey:@"CBColorAdaptationEnabled"];
        }
        +[CBAnalytics harmonyEnabled:self->_colorStruct.harmonyEnabled byUser:1];
        if (self->_colorStruct.harmonyEnabled) {
          uint64_t v4 = MEMORY[0x1E4F1CC38];
        }
        else {
          uint64_t v4 = MEMORY[0x1E4F1CC28];
        }
        [(CBColorModuleiOS *)self sendNotificationForKey:@"ColorAdaptationEnabled" andValue:v4];
      }
    }
  }
  return v10 & 1;
}

- (BOOL)CAStrengthPropertyHandler:(id)a3
{
  BOOL v11 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v9 = (void *)[a3 objectForKey:@"ColorAdaptationStrengthSub"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      float v8 = fminf(fmaxf(v3, 0.0), 1.0);
      int v7 = 0;
      char v10 = (void *)[a3 objectForKey:@"ColorAdaptationStrengthPeriod"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v10 floatValue];
        int v7 = LODWORD(v4);
      }
      *(float *)&double v4 = v8;
      LODWORD(v5) = v7;
      -[CBColorModuleiOS CAStrengthUpdate:withPeriod:](self, "CAStrengthUpdate:withPeriod:", v4, v5, v10);
      return 1;
    }
  }
  return v11;
}

- (BOOL)CAFixedStrengthPropertyHandler:(id)a3
{
  BOOL v7 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 floatValue];
    float v6 = v3;
    if (v3 >= 0.0) {
      float v6 = fminf(fmaxf(v3, 0.0), 1.0);
    }
    [(CBColorModuleiOS *)self setPreferences:a3 forKey:@"CBFixedAdaptationStrength"];
    self->_colorStruct.harmonyFixedStrength = v6;
    if (self->_colorStruct.harmonyFixedStrength < 0.0) {
      *(float *)&CFAbsoluteTime v4 = self->_colorStruct.harmonyStrength;
    }
    else {
      *(float *)&CFAbsoluteTime v4 = self->_colorStruct.harmonyFixedStrength;
    }
    CFXSetAmbientAdaptationStrength((uint64_t)self->_colorStruct.cfx, v4, 0.0);
    return 1;
  }
  return v7;
}

- (BOOL)CAStrengthRampPeriodTweakPropertyHandler:(id)a3
{
  BOOL v6 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 floatValue];
    if (self->_colorStruct.harmonySupported && self->_colorStruct.cfx && v3 >= 0.0)
    {
      *(float *)&double v4 = CFXSetStrengthRampTweakFactor((uint64_t)self->_colorStruct.cfx, v3);
      [(CBColorModuleiOS *)self setPreferences:a3, @"CBStrengthRampPeriodTweak", v4 forKey];
      return 1;
    }
  }
  return v6;
}

- (void)CAStrengthUpdate:(float)a3 withPeriod:(float)a4
{
  if (self->_colorStruct.harmonySupported && self->_colorStruct.cfx && self->_colorStruct.harmonyFixedStrength < 0.0)
  {
    self->_colorStruct.float harmonyStrength = a3;
    *(float *)&CFAbsoluteTime v4 = self->_colorStruct.harmonyStrength;
    CFXSetAmbientAdaptationStrength((uint64_t)self->_colorStruct.cfx, v4, a4);
  }
}

- (BOOL)CAModeMappingHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(CBColorModuleiOS *)self parseAdaptationModeMappingDictionary:a3 strengths:v8 strengthNum:6])
  {
    CFXSetAdaptationModesMapping((uint64_t)self->_colorStruct.cfx, (uint64_t)v8, 6);
    id v5 = [(CBColorModuleiOS *)self newAdaptationModeMappingDictionary:v8 strengthNum:6];
    if (v5)
    {
      [(NSMutableDictionary *)self->_properties setObject:v5 forKey:@"ColorAdaptationModeMapping"];
    }
    id v4 = [(CBColorModuleiOS *)self newAdaptationModeMappingArray:v8 strengthNum:6];
    if (v4)
    {
      [(CBColorModuleiOS *)self setPreferences:v4 forKey:@"CBAdaptationModeMapping2"];
    }
  }
  return 0;
}

- (BOOL)CAFadesEnabledHandler:(id)a3
{
  BOOL v4 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFXEnableFades((uint64_t)self->_colorStruct.cfx, [a3 BOOLValue] & 1);
    return 1;
  }
  return v4;
}

- (BOOL)CAAABSensorOverridePropertyHandler:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  float v29 = self;
  SEL v28 = a2;
  id v27 = a3;
  char v26 = 1;
  int v25 = 0;
  float v24 = -1.0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v27 floatValue];
    float v24 = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = (id)[v27 objectForKey:@"AABSensorOverrideValue"];
      id v22 = (id)[v27 objectForKey:@"AABSensorOverrideOrientation"];
      if (v23)
      {
        [v23 floatValue];
        float v24 = v4;
      }
      if (v22) {
        int v25 = [v22 intValue];
      }
    }
  }
  os_log_t v21 = 0;
  if (v29->super._logHandle)
  {
    os_log_t logHandle = v29->super._logHandle;
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
  os_log_type_t v20 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_2_8_0_4_0((uint64_t)v31, COERCE__INT64(v24), v25);
    _os_log_impl(&dword_1BA438000, v21, v20, "override ALS samples with value = %f, with orientation = %d", v31, 0x12u);
  }
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  memset(__b, 0, sizeof(__b));
  obunsigned int j = v29->_filters;
  uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v30 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v18 = 0;
      id v18 = *(id *)(__b[1] + 8 * v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!v25
          || (int v5 = [v18 orientation], v5 == v25)
          || ![v18 orientation])
        {
          [v19 addObject:v18];
        }
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v30 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }
  [(NSMutableArray *)v29->_filters removeObjectsInArray:v19];

  if (v24 >= 0.0)
  {
    BOOL v6 = [CBSensorOverrideFilter alloc];
    uint64_t v16 = [(CBSensorOverrideFilter *)v6 initWithData:v27];
    [(NSMutableArray *)v29->_filters insertObject:v16 atIndex:0];
  }
  return v26 & 1;
}

- (BOOL)CEOverridePropertyHandler:(id)a3 key:(id)a4
{
  return 1;
}

- (BOOL)CEEnablePropertyHandler:(id)a3 key:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_log_type_t v17 = self;
  SEL v16 = a2;
  id v15 = a3;
  id v14 = a4;
  char v13 = 0;
  memset(__b, 0, sizeof(__b));
  obunsigned int j = v17->_filters;
  uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v18 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    unint64_t v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v12 = 0;
      id v12 = *(id *)(__b[1] + 8 * v7);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 setProperty:v15 forKey:v14];
        char v13 = 1;
      }
      ++v7;
      if (v5 + 1 >= v8)
      {
        uint64_t v7 = 0;
        unint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v18 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }
  return v13 & 1;
}

- (BOOL)carryLogEnabledHandler:(id)a3
{
  uint64_t v9 = self;
  SEL v8 = a2;
  CFTypeRef cf = a3;
  BOOL v6 = 0;
  if (a3)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(cf))
    {
      int valuePtr = 0;
      CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &valuePtr);
      CFXEnableLog((uint64_t)v9->_colorStruct.cfx, valuePtr != 0);
      if (CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E4F1D3D8])) {
        CFPreferencesSetAppValue(@"CBCarryLogEnabled", cf, (CFStringRef)*MEMORY[0x1E4F1D3D8]);
      }
      return 1;
    }
  }
  return v6;
}

- (BOOL)carryLogCommentHandler:(id)a3
{
  BOOL v5 = 0;
  if (a3)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(a3))
    {
      CFXStoreComment((uint64_t)self->_colorStruct.cfx, (const __CFString *)a3);
      return 1;
    }
  }
  return v5;
}

- (BOOL)carryLogCommitHandler:(id)a3
{
  return 1;
}

- (BOOL)colorRampPeriodOverrideHandler:(id)a3
{
  BOOL v5 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 floatValue];
    CFXOverrideRampPeriod((uint64_t)self->_colorStruct.cfx, v3);
    return 1;
  }
  return v5;
}

- (BOOL)ammolitePropertyHandler:(id)a3 key:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  float v29 = self;
  SEL v28 = a2;
  id v27 = a3;
  id v26 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v27;
    if ([v27 BOOLValue])
    {
      id v22 = 0;
      if (v29->super._logHandle)
      {
        os_log_t logHandle = v29->super._logHandle;
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
      id v22 = logHandle;
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v11 = v22;
        os_log_type_t v12 = v21;
        __os_log_helper_16_0_0(v20);
        _os_log_impl(&dword_1BA438000, v11, v12, "Enabling/restarting Ammolite", v20, 2u);
      }
      if (v29->_colorEffectsEnabled && v29->_backlightService)
      {
        CFXInitAmmolite((uint64_t)v29->_colorStruct.cfx, v29->_backlightService);
        BOOL v5 = CFXAmmoliteEnabled((uint64_t)v29->_colorStruct.cfx);
        v29->_ammoliteEnabledStatus = v5;
      }
      else
      {
        v29->_ammoliteEnabledStatus = 1;
      }
    }
    else
    {
      uint64_t v19 = 0;
      if (v29->super._logHandle)
      {
        uint64_t v10 = v29->super._logHandle;
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
        uint64_t v7 = v19;
        os_log_type_t v8 = v18;
        __os_log_helper_16_0_0(v17);
        _os_log_impl(&dword_1BA438000, v7, v8, "Disabling Ammolite", v17, 2u);
      }
      CFXAmmoliteDisable((uint64_t)v29->_colorStruct.cfx);
      v29->_ammoliteEnabledStatus = 0;
    }
    char v30 = 1;
  }
  else
  {
    os_log_t v25 = 0;
    if (v29->super._logHandle)
    {
      SEL v16 = v29->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v15 = init_default_corebrightness_log();
      }
      SEL v16 = v15;
    }
    os_log_t v25 = v16;
    os_log_type_t v24 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = objc_opt_class();
      __os_log_helper_16_2_3_8_66_8_66_8_64((uint64_t)v31, (uint64_t)v26, v4, (uint64_t)v27);
      _os_log_error_impl(&dword_1BA438000, v25, v24, "Wrong value for key %{public}@: (%{public}@) %@", v31, 0x20u);
    }
    char v30 = 0;
  }
  return v30 & 1;
}

- (BOOL)colorFilterModeHandler:(id)a3
{
  id v14 = self;
  SEL v13 = a2;
  id v12 = a3;
  char v11 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v11 = 1;
    -[CBColorFilter setMode:](v14->_colorFilter, "setMode:", [v12 unsignedIntegerValue]);
    [(CBColorModuleiOS *)v14 processColorSample:[(CBColorFilter *)v14->_colorFilter sample] forceUpdate:0];
  }
  else
  {
    uint64_t v10 = 0;
    if (v14->super._logHandle)
    {
      os_log_t logHandle = v14->super._logHandle;
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
    char v9 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      os_log_t log = v10;
      os_log_type_t type = v9;
      __os_log_helper_16_0_0(v8);
      _os_log_error_impl(&dword_1BA438000, log, type, "unsupported data format", v8, 2u);
    }
  }
  return v11 & 1;
}

- (void)processColorSample:(id)a3 forceUpdate:(BOOL)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v23 = self;
  SEL v22 = a2;
  id v21 = a3;
  BOOL v20 = a4;
  if (a3)
  {
    memset(__b, 0, sizeof(__b));
    [v21 XYZ];
    *(float *)&double v4 = v4;
    __b[0] = *(float *)&v4;
    [v21 XYZ];
    float v6 = v5;
    __b[1] = v6;
    [v21 XYZ];
    float v8 = v7;
    __b[2] = v8;
    [v21 CCT];
    *(float *)&double v9 = v9;
    __b[5] = *(float *)&v9;
    if (__b[0] == 0.0 || __b[1] == 0.0)
    {
      __b[4] = 0.0;
      __b[3] = 0.0;
    }
    else
    {
      CFXTristimulus2Chromaticity(__b, &__b[3]);
    }
    if (v23->super._logHandle)
    {
      os_log_t logHandle = v23->super._logHandle;
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_4_0((uint64_t)v24, (uint64_t)v21, v20);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "process color sample = %@, force = %d", v24, 0x12u);
    }
    [(CBColorModuleiOS *)v23 inputAmbientColorSample:__b force:v20 trust:1];
  }
  else
  {
    uint64_t v19 = 0;
    if (v23->super._logHandle)
    {
      uint64_t v15 = v23->super._logHandle;
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
    uint64_t v19 = v15;
    char v18 = 16;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      os_log_t log = v19;
      os_log_type_t type = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_error_impl(&dword_1BA438000, log, type, "ERROR: invalid sample", v17, 2u);
    }
  }
}

- (void)debugPrintColorSampleAsRGB:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [a3 XYZ];
  double v14 = v3;
  [a3 XYZ];
  double v15 = -(0.158 * v4 - 0.418 * v14);
  [a3 XYZ];
  double v22 = v15 + -0.082 * v5;
  [a3 XYZ];
  double v16 = v6;
  [a3 XYZ];
  double v17 = 0.252 * v7 + -0.091 * v16;
  [a3 XYZ];
  double v21 = v17 + 0.015 * v8;
  [a3 XYZ];
  double v18 = v9;
  [a3 XYZ];
  double v19 = -(0.002 * v10 - 0.00092 * v18);
  [a3 XYZ];
  double v20 = v19 + 0.178 * v11;
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v25, *(uint64_t *)&v22, *(uint64_t *)&v21, *(uint64_t *)&v20);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "RGB: color sample with r=%f, g=%f, b=%f", v25, 0x20u);
  }
}

- (BOOL)displayPresetHarmonyHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v6 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_colorStruct.presetDisableHarmony = [a3 BOOLValue] & 1;
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
      __os_log_helper_16_0_1_4_0((uint64_t)v9, self->_colorStruct.presetDisableHarmony);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Harmony preset state changed to %d", v9, 8u);
    }
    if (self->_colorStruct.harmonySupported && self->_colorStruct.cfx) {
      [(CBColorModuleiOS *)self updateAvailability];
    }
    [(CBColorModuleiOS *)self sendNotificationForKey:@"CBDisplayPresetDisableHarmony" andValue:a3];
    char v6 = 1;
  }
  return v6 & 1;
}

uint64_t __48__CBColorModuleiOS_handleHIDEventInternal_from___block_invoke_230(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 currentALSEvent];
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (int)getVid:(__IOHIDServiceClient *)a3
{
  double v8 = self;
  SEL v7 = a2;
  IOHIDServiceClientRef service = a3;
  int valuePtr = 0;
  CFNumberRef number = (const __CFNumber *)IOHIDServiceClientCopyProperty(a3, @"VendorID");
  if (number)
  {
    CFNumberGetValue(number, kCFNumberIntType, &valuePtr);
    CFRelease(number);
  }
  return valuePtr;
}

- (int)getPid:(__IOHIDServiceClient *)a3
{
  double v8 = self;
  SEL v7 = a2;
  IOHIDServiceClientRef service = a3;
  int valuePtr = 0;
  CFNumberRef number = (const __CFNumber *)IOHIDServiceClientCopyProperty(a3, @"ProductID");
  if (number)
  {
    CFNumberGetValue(number, kCFNumberIntType, &valuePtr);
    CFRelease(number);
  }
  return valuePtr;
}

uint64_t __40__CBColorModuleiOS_addHIDServiceClient___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  valuePtr[2] = a1;
  valuePtr[1] = a1;
  [*(id *)(*(void *)(a1 + 32) + 160) addObject:*(void *)(a1 + 56)];
  valuePtr[0] = 0;
  CFNumberRef RegistryID = 0;
  CFNumberRef RegistryID = (CFNumberRef)IOHIDServiceClientGetRegistryID(*(IOHIDServiceClientRef *)(a1 + 56));
  if (RegistryID) {
    CFNumberGetValue(RegistryID, kCFNumberSInt64Type, valuePtr);
  }
  if (valuePtr[0])
  {
    io_registry_entry_t MatchingService = 0;
    mach_port_t mainPort = *MEMORY[0x1E4F2EEF0];
    CFDictionaryRef matching = IORegistryEntryIDMatching(valuePtr[0]);
    io_registry_entry_t MatchingService = IOServiceGetMatchingService(mainPort, matching);
    if (MatchingService)
    {
      CFDataRef v26 = 0;
      CFDataRef v26 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"ce-model", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3u);
      if (v26)
      {
        valuePtr[8] = 0;
        valuePtr[7] = 4;
        valuePtr[9] = 0;
        valuePtr[10] = 4;
        uint64_t v24 = 0;
        uint64_t v25 = 4;
        v33.location = 0;
        v33.length = 4;
        CFDataGetBytes(v26, v33, (UInt8 *)(*(void *)(a1 + 32) + 312));
        os_log_t v23 = 0;
        if (*(void *)(*(void *)(a1 + 32) + 8))
        {
          double v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t inited = init_default_corebrightness_log();
          }
          double v5 = inited;
        }
        os_log_t v23 = v5;
        os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v31, *(_DWORD *)(*(void *)(a1 + 32) + 312));
          _os_log_impl(&dword_1BA438000, v23, v22, "CE Model being used:%d", v31, 8u);
        }
        CFRelease(v26);
        CFDataRef v26 = 0;
      }
      CFDataRef v26 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"ce-threshold", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3u);
      if (v26)
      {
        *(_DWORD *)buffer = 0;
        valuePtr[4] = 0;
        valuePtr[3] = 4;
        valuePtr[5] = 0;
        valuePtr[6] = 4;
        uint64_t v19 = 0;
        uint64_t v20 = 4;
        v34.location = 0;
        v34.length = 4;
        CFDataGetBytes(v26, v34, buffer);
        *(float *)(*(void *)(a1 + 32) + 316) = (float)*(int *)buffer / 65536.0;
        os_log_t v18 = 0;
        if (*(void *)(*(void *)(a1 + 32) + 8))
        {
          double v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v2 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v2 = init_default_corebrightness_log();
          }
          double v3 = v2;
        }
        os_log_t v18 = v3;
        os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v30, COERCE__INT64(*(float *)(*(void *)(a1 + 32) + 316)));
          _os_log_impl(&dword_1BA438000, v18, v17, "CE Confidence threshold:%f", v30, 0xCu);
        }
        CFRelease(v26);
        CFDataRef v26 = 0;
      }
    }
  }
  uint64_t v16 = 0;
  uint64_t v16 = [*(id *)(a1 + 32) getRegistryIDForHIDServiceClient:*(void *)(a1 + 56)];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) && v16)
  {
    [*(id *)(*(void *)(a1 + 32) + 168) setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:v16];
    *(unsigned char *)(*(void *)(a1 + 32) + 220) = (*(unsigned char *)(*(void *)(a1 + 32) + 220) & 1 | ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) sensorType] == 8)) != 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 220) = (*(unsigned char *)(*(void *)(a1 + 32) + 220) & 1 | ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) sensorType] == 9)) != 0;
    double v15 = 0;
    double v15 = [[CBDigitizerFilter alloc] initWithALSNode:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) andLogCategory:"color"];
    [(CBFilter *)v15 scheduleWithDispatchQueue:*(void *)(*(void *)(a1 + 32) + 16)];
    v9[0] = 0;
    v9[1] = v9;
    int v10 = 1375731712;
    int v11 = 48;
    id v12 = __Block_byref_object_copy__10;
    SEL v13 = __Block_byref_object_dispose__10;
    uint64_t v14 = 0;
    uint64_t v14 = *(void *)(a1 + 32);
    -[CBFilter registerNotificationBlock:](v15, "registerNotificationBlock:");
    [*(id *)(*(void *)(a1 + 32) + 176) insertObject:v15 atIndex:0];
    _Block_object_dispose(v9, 8);
  }
  [*(id *)(a1 + 32) activateColorAdaptation];
  uint64_t result = [*(id *)(a1 + 32) updateAvailability];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

uint64_t __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_249(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2 && a3)
  {
    if (*(void *)(*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) + 8))
    {
      double v4 = *(NSObject **)(*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      double v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, a2, a3);
      _os_log_debug_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEBUG, "Notification block key=%@, value=%@\n", v8, 0x16u);
    }
    return [*(id *)(*(void *)(*(void *)(v5 + 32) + 8) + 40) handleFilterNotificationForKey:a2 withProperty:a3];
  }
  return result;
}

void __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_250(uint64_t a1)
{
  uint64_t v23 = a1;
  uint64_t v22 = a1;
  [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  double v21 = 0;
  double v21 = objc_alloc_init(CBProxFilter);
  [(CBFilter *)v21 scheduleWithDispatchQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  v1 = *(void **)(*(void *)(a1 + 32) + 168);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  int v16 = -1073741824;
  int v17 = 0;
  os_log_t v18 = __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_2;
  uint64_t v19 = &unk_1E62199E8;
  uint64_t v20 = v21;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:");
  v9[0] = 0;
  v9[1] = v9;
  int v10 = 1375731712;
  int v11 = 48;
  id v12 = __Block_byref_object_copy__10;
  SEL v13 = __Block_byref_object_dispose__10;
  uint64_t v14 = 0;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  char v6 = __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_3;
  SEL v7 = &unk_1E6219740;
  double v8 = v9;
  -[CBFilter registerNotificationBlock:](v21, "registerNotificationBlock:");
  [*(id *)(*(void *)(a1 + 32) + 176) insertObject:v21 atIndex:0];
  _Block_object_dispose(v9, 8);
}

uint64_t __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result) {
    return objc_msgSend(*(id *)(a1 + 32), "setIsActive:", (objc_msgSend(*(id *)(a1 + 32), "isActive") & 1 & objc_msgSend(a3, "useProxForOcclusion") & 1) != 0);
  }
  return result;
}

uint64_t __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2 && a3)
  {
    if (*(void *)(*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) + 8))
    {
      int v4 = *(NSObject **)(*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) + 8);
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
    return [*(id *)(*(void *)(*(void *)(v5 + 32) + 8) + 40) handleFilterNotificationForKey:a2 withProperty:a3];
  }
  return result;
}

void __40__CBColorModuleiOS_addHIDServiceClient___block_invoke_2_252(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v11 = a1;
  id v10 = 0;
  id v10 = (id)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(a1 + 40), @"ColorSupport");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v10 BOOLValue] & 1) == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
    ++*(_DWORD *)(*(void *)(a1 + 32) + 320);
    [*(id *)(*(void *)(a1 + 32) + 296) addHIDServiceClient:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) activateColorAdaptation];
    *(unsigned char *)(*(void *)(a1 + 32) + 107) = 1;
    uint64_t v5 = MEMORY[0x1E4F1CC38];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setObject:forKey:");
    [*(id *)(a1 + 32) sendNotificationForKey:@"ColorAdaptationAvailable" andValue:v5];
    [*(id *)(a1 + 32) updateActivity];
    uint64_t v9 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 8))
    {
      int v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
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
    uint64_t v9 = v4;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = v9;
      os_log_type_t type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_impl(&dword_1BA438000, log, type, "Found a Color ALS", v7, 2u);
    }
  }
}

- (void)setNightShiftFactorDictionary:(id)a3
{
}

- (id)copyPreferenceForKey:(id)a3 user:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "Copy preference for key = %@", v8, 0xCu);
  }
  return 0;
}

- (void)setPreference:(id)a3 forKey:(id)a4 user:(id)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)a4);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "Set preference for key = %@", v8, 0xCu);
  }
}

uint64_t __39__CBColorModuleiOS_copyPropertyForKey___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
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

- (void)updateAvailability
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL harmonyAvailable = self->_colorStruct.harmonyAvailable;
  if ((CBU_IsR2RSupported() & 1) != 0 && self->_moduleType == 1) {
    self->_colorStruct.BOOL harmonyAvailable = 1;
  }
  else {
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_alsNodes, "enumerateKeysAndObjectsUsingBlock:");
  }
  if (self->_colorStruct.presetDisableHarmony)
  {
    self->_colorStruct.BOOL harmonyAvailable = 0;
    if (self->super._logHandle)
    {
      os_log_t logHandle = self->super._logHandle;
    }
    else
    {
      uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      os_log_t logHandle = v5;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v11, self->_colorStruct.harmonyAvailable);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "harmony available: %d preset overrides availability)", v11, 8u);
    }
  }
  if (self->super._logHandle)
  {
    int v4 = self->super._logHandle;
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v10, self->_colorStruct.harmonyAvailable);
    _os_log_impl(&dword_1BA438000, v4, OS_LOG_TYPE_INFO, "harmony available: %d", v10, 8u);
  }
  if (self->_colorStruct.harmonyAvailable) {
    uint64_t v2 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v2 = MEMORY[0x1E4F1CC28];
  }
  [(NSMutableDictionary *)self->_properties setObject:v2 forKey:@"ColorAdaptationAvailable"];
  if (harmonyAvailable != self->_colorStruct.harmonyAvailable)
  {
    id v7 = (id)[objc_alloc(NSNumber) initWithBool:self->_colorStruct.harmonyAvailable];
    if (v7) {
      [(CBColorModuleiOS *)self sendNotificationForKey:@"ColorAdaptationAvailable" andValue:v7];
    }
  }
  [(CBColorModuleiOS *)self updateActivity];
}

uint64_t __38__CBColorModuleiOS_updateAvailability__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = [a3 isColorSupported];
    if (result)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 107) = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (void)updateActivity
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  SEL v28 = self;
  SEL v27 = a2;
  BOOL harmonyActive = 0;
  BOOL harmonyActive = self->_colorStruct.harmonyActive;
  BOOL harmonyAvailable = 0;
  if (self->_colorStruct.harmonyEnabled) {
    BOOL harmonyAvailable = v28->_colorStruct.harmonyAvailable;
  }
  v28->_colorStruct.BOOL harmonyActive = harmonyAvailable;
  if (harmonyActive != v28->_colorStruct.harmonyActive)
  {
    os_log_t v25 = 0;
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
    os_log_t v25 = logHandle;
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_3_4_0_4_0_4_0((uint64_t)v29, v28->_colorStruct.harmonyActive, v28->_colorStruct.harmonyEnabled, v28->_colorStruct.harmonyAvailable);
      _os_log_impl(&dword_1BA438000, v25, v24, "harmony active: %d (enabled=%d available=%d)", v29, 0x14u);
    }
    if (v28->_colorStruct.harmonyActive)
    {
      alsNodes = v28->_alsNodes;
      uint64_t v18 = MEMORY[0x1E4F143A8];
      int v19 = -1073741824;
      int v20 = 0;
      double v21 = __34__CBColorModuleiOS_updateActivity__block_invoke;
      uint64_t v22 = &unk_1E62199E8;
      uint64_t v23 = v28;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](alsNodes, "enumerateKeysAndObjectsUsingBlock:");
      if (v28->_moduleType == 2)
      {
        char v17 = 0;
        char v17 = [(CBColorFilter *)v28->_colorFilter forceSampleUpdate];
        if (v17)
        {
          [(CBColorModuleiOS *)v28 processColorSample:[(CBColorFilter *)v28->_colorFilter sample] forceUpdate:1];
        }
        else
        {
          int v16 = 0;
          if (v28->super._logHandle)
          {
            id v10 = v28->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v9 = init_default_corebrightness_log();
            }
            id v10 = v9;
          }
          int v16 = v10;
          char v15 = 16;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            id v7 = v16;
            os_log_type_t v8 = v15;
            __os_log_helper_16_0_0(v14);
            _os_log_error_impl(&dword_1BA438000, v7, v8, "EXTERNAL: failed to retrieve event", v14, 2u);
          }
        }
      }
    }
    if (!v28->_aggregatedConfigApplied) {
      CFXEnableAmbientAdaptation((uint64_t)v28->_colorStruct.cfx, v28->_colorStruct.harmonyActive);
    }
    uint64_t v5 = MEMORY[0x1E4F1CC28];
    uint64_t v6 = MEMORY[0x1E4F1CC38];
    if (v28->_colorStruct.harmonyActive) {
      uint64_t v3 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v3 = MEMORY[0x1E4F1CC28];
    }
    -[NSMutableDictionary setObject:forKey:](v28->_properties, "setObject:forKey:", v3);
    if (v28->_colorStruct.harmonyActive) {
      uint64_t v4 = v6;
    }
    else {
      uint64_t v4 = v5;
    }
    [(CBColorModuleiOS *)v28 sendNotificationForKey:@"ColorAdaptationActive" andValue:v4];
  }
}

void __34__CBColorModuleiOS_updateActivity__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v17 = a1;
  uint64_t v16 = a2;
  id v15 = a3;
  uint64_t v14 = a4;
  uint64_t v13 = a1;
  CFTypeRef v12 = (CFTypeRef)[a3 copyEvent];
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "handleHIDEventInternal:from:", v12, objc_msgSend(v15, "alsService"));
    CFRelease(v12);
  }
  else
  {
    uint64_t v11 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 8))
    {
      id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      id v7 = inited;
    }
    uint64_t v11 = v7;
    char v10 = 16;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      os_log_t log = v11;
      os_log_type_t type = v10;
      __os_log_helper_16_0_0(v9);
      _os_log_error_impl(&dword_1BA438000, log, type, "failed to retrieve event", v9, 2u);
    }
  }
}

- (void)handleFilterNotificationForKey:(id)a3 withProperty:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = self;
  SEL v36 = a2;
  id v35 = a3;
  id v34 = a4;
  if ([a3 isEqualToString:@"TouchStateChanged"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v33 = [v34 objectForKey:@"TouchOrientation"];
      id v32 = (id)[v34 objectForKey:@"TouchIsObstucted"];
      os_log_t v31 = 0;
      if (v37->super._logHandle)
      {
        os_log_t logHandle = v37->super._logHandle;
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
      os_log_t v31 = logHandle;
      os_log_type_t v30 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v39, (uint64_t)v32, v33);
        _os_log_impl(&dword_1BA438000, v31, v30, "Touch state changed = %{public}@, orientation = %{public}@", v39, 0x16u);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && ([v32 BOOLValue])
      {
        char v29 = 1;
        memset(__b, 0, sizeof(__b));
        obunsigned int j = v37->_filters;
        uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v38 count:16];
        if (v17)
        {
          uint64_t v13 = *(void *)__b[2];
          uint64_t v14 = 0;
          unint64_t v15 = v17;
          while (1)
          {
            uint64_t v12 = v14;
            if (*(void *)__b[2] != v13) {
              objc_enumerationMutation(obj);
            }
            id v28 = 0;
            id v28 = *(id *)(__b[1] + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && ([v28 isObstructed] & 1) == 0) {
              break;
            }
            ++v14;
            if (v12 + 1 >= v15)
            {
              uint64_t v14 = 0;
              unint64_t v15 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v38 count:16];
              if (!v15) {
                goto LABEL_22;
              }
            }
          }
          char v29 = 0;
        }
LABEL_22:
        if (v29)
        {
          CFXCancelColorFade((uint64_t)v37->_colorStruct.cfx);
          os_log_t oslog = 0;
          if (v37->super._logHandle)
          {
            uint64_t v11 = v37->super._logHandle;
          }
          else
          {
            uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            uint64_t v11 = v10;
          }
          os_log_t oslog = v11;
          os_log_type_t v25 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            os_log_type_t v8 = oslog;
            os_log_type_t v9 = v25;
            __os_log_helper_16_0_0(v24);
            _os_log_impl(&dword_1BA438000, v8, v9, "MITIGATION: Cancel color ramp on touch mitigation", v24, 2u);
          }
        }
      }
    }
  }
  if ([v35 isEqualToString:@"ProxStateChanged"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v34 BOOLValue] & 1)
      {
        CFXCancelColorFade((uint64_t)v37->_colorStruct.cfx);
        os_log_t v22 = 0;
        if (v37->super._logHandle)
        {
          id v7 = v37->super._logHandle;
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
        os_log_t v22 = v7;
        os_log_type_t v21 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          uint64_t v4 = v22;
          os_log_type_t v5 = v21;
          __os_log_helper_16_0_0(v20);
          _os_log_impl(&dword_1BA438000, v4, v5, "MITIGATION: Cancel color ramp on prox mitigation", v20, 2u);
        }
      }
    }
  }
}

- (void)initColorStruct
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v50 = self;
  SEL v49 = a2;
  self->_colorStruct.harmonyFixedStrength = -1.0;
  v50->_colorStruct.enforceSlowRamps = 1;
  v50->_colorStruct.harmonySupported = 0;
  v50->_colorStruct.enablementTs = 0.0;
  v50->_colorStruct.forceSnapping = 0;
  v50->_colorStruct.whitePointEnabled = 0;
  v50->_colorStruct.nightModeSupported = CBU_IsNightShiftSupported() & 1;
  v50->_colorStruct.presetDisableHarmony = 0;
  id v48 = 0;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CA60]);
  if (v50->_colorStruct.nightModeSupported) {
    uint64_t v3 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v3 = MEMORY[0x1E4F1CC28];
  }
  id v48 = (id)objc_msgSend(v2, "initWithObjectsAndKeys:", @"SupportsAmbientColorAdaptation", v3, @"SupportsNightMode", 0);
  if (v48)
  {
    [(NSMutableDictionary *)v50->_properties setObject:v48 forKey:@"SupportedColorFX"];
  }
  v50->_colorStruct.uint64_t cfx = (ColorEffects *)CFXCreate();
  if (v50->_colorStruct.cfx)
  {
    CFXInstallCallback((uint64_t)v50->_colorStruct.cfx, (uint64_t)ColorRampCallback, (uint64_t)v50);
    if (v50->_backlightService)
    {
      char v47 = 0;
      if (v50->super._logHandle)
      {
        os_log_t logHandle = v50->super._logHandle;
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
      char v47 = logHandle;
      os_log_type_t v46 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t log = v47;
        os_log_type_t type = v46;
        __os_log_helper_16_0_0(v45);
        _os_log_impl(&dword_1BA438000, log, type, "Set whitepoint from the device tree\n", v45, 2u);
      }
      CFTypeRef v44 = 0;
      CFTypeRef v44 = IORegistryEntrySearchCFProperty(v50->_backlightService, "IOService", @"default-whitepoint-type", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3u);
      int v43 = 0;
      if ([(CBColorModuleiOS *)v50 convertNSData:v44 toUint32:&v43]) {
        CFXSetWhitePointType(v50->_colorStruct.cfx, v43);
      }
      if (v44) {
        CFRelease(v44);
      }
    }
    if (v50->_colorStruct.nightModeSupported)
    {
      char v42 = 0;
      char v42 = CFXInitializeBlueLightReduction((uint64_t)v50->_colorStruct.cfx) & 1;
      if (v42)
      {
        float v41 = 0.0;
        float v40 = 0.0;
        float v39 = 0.0;
        float v38 = 0.0;
        CFXGetBlueLightReductionCCTRange((uint64_t)v50->_colorStruct.cfx, &v39, &v41, &v40);
        float v38 = v40;
        if (v50->_backlightService)
        {
          CBU_GetNightShiftCCTRange(v50->_backlightService, &v41, &v40, &v39, &v38);
          id v4 = objc_alloc(NSNumber);
          *(float *)&double v5 = v38;
          id v37 = (id)[v4 initWithFloat:v5];
          if (v37)
          {
            [(NSMutableDictionary *)v50->_properties setObject:v37 forKey:@"BlueLightReductionCCTWarningKey"];
          }
        }
        id v36 = [(CBColorModuleiOS *)v50 copyPreferencesForKey:@"CBBlueLightReductionCCTRange"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v36 count] == 3)
        {
          unint64_t v56 = 0xBF800000BF800000;
          float v57 = -1.0;
          for (int i = 0; i < 3; ++i)
          {
            [v36 objectAtIndexedSubscript:i];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", i), "floatValue");
              *((_DWORD *)&v56 + i) = v6;
            }
          }
          if (*(float *)&v56 != -1.0 && *((float *)&v56 + 1) != -1.0 && v57 != -1.0)
          {
            float v40 = *((float *)&v56 + 1);
            LODWORD(v41) = v56;
            float v39 = v57;
          }
        }

        CFXOverrideBlueLightReductionCCTRange((uint64_t)v50->_colorStruct.cfx, v39, v41, v40);
        id v7 = objc_alloc(NSNumber);
        *(float *)&double v8 = v41;
        id v53 = (id)[v7 initWithFloat:v8];
        id v9 = objc_alloc(NSNumber);
        *(float *)&double v10 = v40;
        id v54 = (id)[v9 initWithFloat:v10];
        id v11 = objc_alloc(NSNumber);
        *(float *)&double v12 = v39;
        id v55 = (id)[v11 initWithFloat:v12];
        if (v53)
        {
          if (v54)
          {
            if (v55)
            {
              id v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v53, v54, v55, 0);
              if (v34)
              {
                [(NSMutableDictionary *)v50->_properties setObject:v34 forKey:@"BlueLightReductionCCTRange"];
              }
            }
          }
        }

        id v33 = [(CBColorModuleiOS *)v50 copyPreferencesForKey:@"CBBlueLightReductionCCTTargetRaw"];
        float v32 = 0.0;
        float v32 = CFXGetBlueLightReductionTargetCCT((uint64_t)v50->_colorStruct.cfx);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v33 floatValue];
          float v32 = fminf(fmaxf(v13, v41), v39);
          CFXSetBlueLightReductionTargetCCT((uint64_t)v50->_colorStruct.cfx, 0, v32, 0.0, 0.0);
        }

        uint64_t v52 = 0x1F13F43B0;
        id v14 = objc_alloc(NSNumber);
        *(float *)&double v15 = v32;
        id v51 = (id)[v14 initWithFloat:v15];
        if (v51)
        {
          id v31 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:&v51 forKeys:&v52 count:1];
          if (v31)
          {
            [(NSMutableDictionary *)v50->_properties setObject:v31 forKey:@"BlueLightReductionCCTTargetKey"];
          }
        }
      }
    }
  }
  else
  {
    os_log_t oslog = 0;
    if (v50->super._logHandle)
    {
      int v20 = v50->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v19 = init_default_corebrightness_log();
      }
      int v20 = v19;
    }
    os_log_t oslog = v20;
    os_log_type_t v29 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = oslog;
      os_log_type_t v18 = v29;
      __os_log_helper_16_0_0(v28);
      _os_log_impl(&dword_1BA438000, v17, v18, "Failed to create _colorStruct.cfx", v28, 2u);
    }
  }
  if (CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E4F1D3D8]))
  {
    CFTypeRef cf = 0;
    CFTypeRef cf = CFPreferencesCopyAppValue(@"CBCarryLogEnabled", (CFStringRef)*MEMORY[0x1E4F1D3D8]);
    int valuePtr = 0;
    if (!cf) {
      CFTypeRef cf = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
    }
    if (cf)
    {
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(cf))
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &valuePtr);
        CFXEnableLog((uint64_t)v50->_colorStruct.cfx, valuePtr != 0);
        [(NSMutableDictionary *)v50->_properties setObject:cf forKey:@"CarryLogEnabled"];
      }
      CFRelease(cf);
    }
  }
}

- (BOOL)parseAdaptationModeMappingDictionary:(id)a3 strengths:(float *)a4 strengthNum:(int)a5
{
  uint64_t v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  float v13 = a4;
  int v12 = a5;
  uint64_t v7 = 0;
  double v8 = &v7;
  int v9 = 0x20000000;
  int v10 = 32;
  char v11 = 0;
  if (a4 && v12 >= 6)
  {
    CFXGetAdaptationModesMapping((uint64_t)v16->_colorStruct.cfx, (uint64_t)v13, 6);
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:");
  }
  char v6 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v6 & 1;
}

float __79__CBColorModuleiOS_parseAdaptationModeMappingDictionary_strengths_strengthNum___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [a2 integerValue];
      if (v5 <= 5)
      {
        [a3 floatValue];
        if (result >= 0.0 && result <= 1.0)
        {
          *(float *)(*(void *)(a1 + 40) + 4 * v5) = result;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        }
      }
    }
  }
  return result;
}

- (BOOL)parseAdaptationModeMappingArray:(id)a3 strengths:(float *)a4 strengthNum:(int)a5
{
  uint64_t v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  float v13 = a4;
  int v12 = a5;
  uint64_t v7 = 0;
  double v8 = &v7;
  int v9 = 0x20000000;
  int v10 = 32;
  char v11 = 0;
  if (a4 && v12 >= 6 && [v14 count] && (unint64_t)objc_msgSend(v14, "count") <= 6)
  {
    CFXGetAdaptationModesMapping((uint64_t)v16->_colorStruct.cfx, (uint64_t)v13, 6);
    objc_msgSend(v14, "enumerateObjectsUsingBlock:");
  }
  char v6 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v6 & 1;
}

float __74__CBColorModuleiOS_parseAdaptationModeMappingArray_strengths_strengthNum___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a2 floatValue];
    if (result >= 0.0 && result <= 1.0)
    {
      *(float *)(*(void *)(a1 + 40) + 4 * a3) = result;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  return result;
}

- (id)newAdaptationModeMappingArray:(float *)a3 strengthNum:(int)a4
{
  id v9 = 0;
  if (a3 && a4 == 6)
  {
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:6];
    for (int i = 0; i < 6; ++i)
    {
      id v4 = objc_alloc(NSNumber);
      *(float *)&double v5 = a3[i];
      id v7 = (id)[v4 initWithFloat:v5];
      if (!v7)
      {

        return 0;
      }
      [v9 addObject:v7];
    }
  }
  return v9;
}

- (id)newAdaptationModeMappingDictionary:(float *)a3 strengthNum:(int)a4
{
  id v10 = 0;
  if (a3 && a4 == 6)
  {
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
    for (int i = 0; i < 6; ++i)
    {
      id v8 = (id)[objc_alloc(NSNumber) initWithInt:i];
      id v4 = objc_alloc(NSNumber);
      *(float *)&double v5 = a3[i];
      id v7 = (id)[v4 initWithFloat:v5];
      if (!v8 || !v7)
      {

        return 0;
      }
      [v10 setObject:v7 forKey:v8];
    }
  }
  return v10;
}

- (BOOL)convertNSData:(id)a3 toUint32:(unsigned int *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v7 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 length] == 4)
  {
    [a3 getBytes:a4 length:4];
    char v7 = 1;
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_4_0((uint64_t)v11, (uint64_t)a3, *a4);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "convert data %@ to int %u", v11, 0x12u);
    }
  }
  return v7 & 1;
}

- (void)activateColorAdaptation
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v74 = self;
  SEL v73 = a2;
  if (self->_colorStruct.cfx)
  {
    v72 = 0;
    if (v74->super._logHandle)
    {
      os_log_t logHandle = v74->super._logHandle;
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
    v72 = logHandle;
    char v71 = 1;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      os_log_t log = v72;
      os_log_type_t type = v71;
      __os_log_helper_16_0_0(v70);
      _os_log_impl(&dword_1BA438000, log, type, "CFX exists", v70, 2u);
    }
    if (!v74->_colorStruct.harmonySupported)
    {
      char v2 = CFXInitializeAmbientAdaptation((uint64_t)v74->_colorStruct.cfx);
      v74->_colorStruct.harmonySupported = v2 & 1;
      os_log_t v69 = 0;
      if (v74->super._logHandle)
      {
        id v33 = v74->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v32 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v32 = init_default_corebrightness_log();
        }
        id v33 = v32;
      }
      os_log_t v69 = v33;
      os_log_type_t v68 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v82, v74->_colorStruct.harmonySupported);
        _os_log_impl(&dword_1BA438000, v69, v68, "Harmony supported?? %d", v82, 8u);
      }
      if (v74->_colorStruct.harmonySupported)
      {
        if (v74->_colorEffectsEnabled && v74->_backlightService)
        {
          CFXInitAmmolite((uint64_t)v74->_colorStruct.cfx, v74->_backlightService);
          BOOL v3 = CFXAmmoliteEnabled((uint64_t)v74->_colorStruct.cfx);
          v74->_ammoliteEnabledStatus = v3;
        }
        else
        {
          v74->_ammoliteEnabledStatus = 1;
        }
        if (v74->_backlightService)
        {
          uint64_t v67 = 0;
          CFTypeRef v66 = 0;
          id v31 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
          CFTypeRef v66 = IORegistryEntrySearchCFProperty(v74->_backlightService, "IOService", @"truetone-shift-b", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3u);
          CFTypeRef v65 = 0;
          CFTypeRef v65 = IORegistryEntrySearchCFProperty(v74->_backlightService, "IOService", @"truetone-shift-a", *v31, 3u);
          int v64 = 0;
          int v63 = 0;
          char v62 = [(CBColorModuleiOS *)v74 convertNSData:v65 toUint32:&v64];
          char v61 = [(CBColorModuleiOS *)v74 convertNSData:v66 toUint32:&v63];
          if (v65) {
            CFRelease(v65);
          }
          if (v66) {
            CFRelease(v66);
          }
          if (v62 & 1) != 0 && (v61)
          {
            float v4 = (float)v64 / 65536.0;
            *(float *)&uint64_t v67 = v4;
            float v5 = (float)v63 / 65536.0;
            *((float *)&v67 + 1) = v5;
            os_log_t v60 = 0;
            if (v74->super._logHandle)
            {
              os_log_type_t v30 = v74->super._logHandle;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT) {
                uint64_t v29 = _COREBRIGHTNESS_LOG_DEFAULT;
              }
              else {
                uint64_t v29 = init_default_corebrightness_log();
              }
              os_log_type_t v30 = v29;
            }
            os_log_t v60 = v30;
            os_log_type_t v59 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              __os_log_helper_16_0_2_8_0_8_0((uint64_t)v81, COERCE__INT64(*(float *)&v67), COERCE__INT64(*((float *)&v67 + 1)));
              _os_log_impl(&dword_1BA438000, v60, v59, "TrueTone: shift-a = %f, shift-b = %f", v81, 0x16u);
            }
            CFXSetABShift((uint64_t)v74->_colorStruct.cfx, &v67);
          }
        }
        id v58 = 0;
        id v58 = (id)[(NSMutableDictionary *)v74->_properties objectForKey:@"SupportedColorFX"];
        if (v58) {
          [v58 setObject:MEMORY[0x1E4F1CC38] forKey:@"SupportsAmbientColorAdaptation"];
        }
        v74->_colorStruct.harmonyEnabled = 1;
        char v57 = 0;
        CFXGetAdaptationModesMapping((uint64_t)v74->_colorStruct.cfx, (uint64_t)v80, 6);
        if (v74->_backlightService)
        {
          CFTypeRef cf = 0;
          CFTypeRef cf = IORegistryEntrySearchCFProperty(v74->_backlightService, "IOService", @"truetone-strength", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3u);
          if (cf)
          {
            CFTypeID TypeID = CFDataGetTypeID();
            if (TypeID == CFGetTypeID(cf))
            {
              CFDataRef theData = (CFDataRef)cf;
              if ((unint64_t)CFDataGetLength((CFDataRef)cf) >= 0xC)
              {
                uint64_t v76 = 0;
                uint64_t v75 = 12;
                uint64_t v77 = 0;
                uint64_t v78 = 12;
                range.location = 0;
                range.length = 12;
                v84.location = 0;
                v84.length = 12;
                CFDataGetBytes(theData, v84, (UInt8 *)buffer);
                for (int i = 0; i < 6; ++i)
                {
                  float v6 = (float)(unsigned __int16)buffer[i] / 1000.0;
                  v80[i] = v6;
                }
                char v57 = 1;
              }
            }
            CFRelease(cf);
          }
        }
        id v52 = [(CBColorModuleiOS *)v74 copyPreferencesForKey:@"CBAdaptationModeMapping2"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [(CBColorModuleiOS *)v74 parseAdaptationModeMappingArray:v52 strengths:v80 strengthNum:6])
        {
          char v57 = 1;
        }

        if (v57) {
          CFXSetAdaptationModesMapping((uint64_t)v74->_colorStruct.cfx, (uint64_t)v80, 6);
        }
        id v51 = [(CBColorModuleiOS *)v74 newAdaptationModeMappingDictionary:v80 strengthNum:6];
        if (v51)
        {
          [(NSMutableDictionary *)v74->_properties setValue:v51 forKey:@"ColorAdaptationModeMapping"];
        }
        unsigned int v50 = 1;
        CFXSetWeakestAmbientAdaptationMode((uint64_t)v74->_colorStruct.cfx, (uint64_t)&v50, 1, 0.0);
        unsigned int v50 = CFXGetAmbientAdaptationMode((uint64_t)v74->_colorStruct.cfx, &v74->_colorStruct.harmonyStrength);
        id v49 = 0;
        id v7 = objc_alloc(NSNumber);
        *(float *)&double v8 = v74->_colorStruct.harmonyStrength;
        id v49 = (id)[v7 initWithFloat:v8];
        if (v49)
        {
          id v48 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v49, @"ColorAdaptationStrengthSub", 0);
          if (v48)
          {
            [(NSMutableDictionary *)v74->_properties setValue:v48 forKey:@"ColorAdaptationStrength"];
          }
        }
        id v9 = objc_alloc(NSNumber);
        id v49 = (id)[v9 initWithInt:v50];
        if (v49)
        {
          [(NSMutableDictionary *)v74->_properties setValue:v49 forKey:@"ColorAdaptationMode"];
        }
        id v52 = [(CBColorModuleiOS *)v74 copyPreferencesForKey:@"CBFixedAdaptationStrength"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v52 floatValue];
          float v47 = v10;
          v74->_colorStruct.harmonyFixedStrength = v10;
          [(NSMutableDictionary *)v74->_properties setValue:v52 forKey:@"FixedColorAdaptationStrength"];
        }

        char v46 = 0;
        id v45 = 0;
        uint64_t v44 = 0;
        CFXGetABShift((uint64_t)v74->_colorStruct.cfx, &v44);
        id v11 = objc_alloc(NSNumber);
        LODWORD(v12) = v44;
        id v43 = (id)[v11 initWithFloat:v12];
        id v13 = objc_alloc(NSNumber);
        LODWORD(v14) = HIDWORD(v44);
        id v42 = (id)[v13 initWithFloat:v14];
        if (v43 && v42) {
          id v45 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v43, @"a", v42, @"b", 0);
        }

        if (v46) {
          [(NSMutableDictionary *)v74->_properties setValue:v45 forKey:@"LabShift"];
        }

        if (v74->_colorStruct.harmonyFixedStrength >= 0.0)
        {
          *(float *)&CFAbsoluteTime v15 = v74->_colorStruct.harmonyFixedStrength;
          CFXSetAmbientAdaptationStrength((uint64_t)v74->_colorStruct.cfx, v15, 0.0);
        }
        id v52 = [(CBColorModuleiOS *)v74 copyPreferencesForKey:@"CBColorAdaptationEnabled"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v16 = [v52 BOOLValue];
          v74->_colorStruct.harmonyEnabled = v16 & 1;
        }

        uint64_t v26 = MEMORY[0x1E4F1CC28];
        uint64_t v27 = MEMORY[0x1E4F1CC38];
        if (v74->_colorStruct.harmonyEnabled) {
          uint64_t v17 = MEMORY[0x1E4F1CC38];
        }
        else {
          uint64_t v17 = MEMORY[0x1E4F1CC28];
        }
        -[NSMutableDictionary setValue:forKey:](v74->_properties, "setValue:forKey:", v17);
        [(CBColorModuleiOS *)v74 updateActivity];
        +[CBAnalytics harmonyEnabled:v74->_colorStruct.harmonyEnabled byUser:0];
        if (v74->_colorStruct.harmonyEnabled) {
          uint64_t v18 = v27;
        }
        else {
          uint64_t v18 = v26;
        }
        [(CBColorModuleiOS *)v74 sendNotificationForKey:@"ColorAdaptationEnabled" andValue:v18];
        float v41 = 0.0;
        float v41 = CFXGetStrengthRampTweakFactor((uint64_t)v74->_colorStruct.cfx);
        id v52 = [(CBColorModuleiOS *)v74 copyPreferencesForKey:@"CBStrengthRampPeriodTweak"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v52 floatValue];
          float v41 = v19;
        }

        if (v41 < 0.0) {
          float v41 = 0.0;
        }
        CFXSetStrengthRampTweakFactor((uint64_t)v74->_colorStruct.cfx, v41);
        id v20 = objc_alloc(NSNumber);
        *(float *)&double v21 = v41;
        id v49 = (id)[v20 initWithFloat:v21];
        if (v49)
        {
          [(NSMutableDictionary *)v74->_properties setValue:v49 forKey:@"StrengthRampPeriodTweak"];
        }
        if (v74->_moduleType == 1) {
          [(CBColorModuleiOS *)v74 ttRestrictionReload];
        }
      }
    }
  }
  else
  {
    os_log_t oslog = 0;
    if (v74->super._logHandle)
    {
      os_log_type_t v25 = v74->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v24 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v24 = init_default_corebrightness_log();
      }
      os_log_type_t v25 = v24;
    }
    os_log_t oslog = v25;
    os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v22 = oslog;
      os_log_type_t v23 = v39;
      __os_log_helper_16_0_0(v38);
      _os_log_impl(&dword_1BA438000, v22, v23, "CFX was not initialized", v38, 2u);
    }
  }
}

- (void)reportResetTimerWithStop:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  if (a3)
  {
    if (v13->_reportContext.logTimer)
    {
      dispatch_source_cancel((dispatch_source_t)v13->_reportContext.logTimer);
      dispatch_release((dispatch_object_t)v13->_reportContext.logTimer);
      v13->_reportContext.logTimer = 0;
    }
  }
  else if (!v13->_reportContext.logTimer)
  {
    v13->_reportContext.logTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v13->super._queue);
    if (v13->_reportContext.logTimer)
    {
      uint64_t v10 = 0;
      uint64_t v10 = 1000000000 * v13->_reportContext.periodS;
      dispatch_source_set_timer((dispatch_source_t)v13->_reportContext.logTimer, 0, v10, 0);
      logTimer = v13->_reportContext.logTimer;
      uint64_t handler = MEMORY[0x1E4F143A8];
      int v5 = -1073741824;
      int v6 = 0;
      id v7 = __45__CBColorModuleiOS_reportResetTimerWithStop___block_invoke;
      double v8 = &unk_1E6218FE0;
      id v9 = v13;
      dispatch_source_set_event_handler(logTimer, &handler);
      dispatch_resume((dispatch_object_t)v13->_reportContext.logTimer);
      v13->_reportContext.firstTimerFire = 1;
    }
  }
}

uint64_t __45__CBColorModuleiOS_reportResetTimerWithStop___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(*(void *)(result + 32) + 128))
  {
    *(unsigned char *)(*(void *)(result + 32) + 128) = 0;
  }
  else
  {
    float result = [*(id *)(result + 32) moduleType];
    if (result == 1) {
      return [*(id *)(v1 + 32) reportCommitWithStop:0];
    }
  }
  return result;
}

- (void)reportInitialize
{
  if (self->_colorStruct.nightModeSupported || self->_colorStruct.harmonySupported)
  {
    if (self->_colorStruct.cfx) {
      CFXClearReport((uint64_t)self->_colorStruct.cfx);
    }
    [(CBColorModuleiOS *)self reportResetTimerWithStop:0];
  }
}

- (void)reportCommitWithStop:(BOOL)a3
{
  id v7 = (uint64_t *)self;
  SEL v6 = a2;
  BOOL v5 = a3;
  if (self->_colorStruct.nightModeSupported || (v7[13] & 1) != 0)
  {
    if (v5) {
      [v7 reportResetTimerWithStop:1];
    }
    if (v7[8])
    {
      bzero(v4, 0x200uLL);
      double v3 = CFXGetReport(v7[8], (uint64_t)v4);
      objc_msgSend(v7, "reportToCoreAnlytics:", v4, v3);
      [v7 commitPowerLogReport:v4];
    }
  }
}

- (void)commitPowerLogReport:(ColorReport *)a3
{
  if (a3)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v13)
    {
      id v10 = (id)[objc_alloc(NSNumber) initWithDouble:a3->var3.var0];
      if (v10)
      {
        [v13 setObject:v10 forKey:@"BlueLightReductionOnTime"];
      }
      id v11 = (id)[objc_alloc(NSNumber) initWithDouble:a3->var3.var1];
      if (v11)
      {
        [v13 setObject:v11 forKey:@"BlueLightReductionOffTime"];
      }
      id v4 = [(CBColorModuleiOS *)self newArrayFromDoubles:a3 size:17];
      if (v4)
      {
        [v13 setObject:v4 forKey:@"AmbientColorBins"];
      }
      id v5 = [(CBColorModuleiOS *)self newArrayFromDoubles:&a3->var4 size:10];
      if (v5)
      {
        [v13 setObject:v5 forKey:@"AdaptationStrengthBins"];
      }
      id v6 = [(CBColorModuleiOS *)self newArrayFromIntegers:a3->var0.var1 size:17];
      if (v6)
      {
        [v13 setObject:v6 forKey:@"AmbientColorTransitionBins"];
      }
      id v7 = [(CBColorModuleiOS *)self newArrayFromIntegers:a3->var1.var1 size:17];
      if (v7)
      {
        [v13 setObject:v7 forKey:@"DisplayColorTransitionBins"];
      }
      id v12 = (id)[objc_alloc(NSNumber) initWithInt:a3->var6];
      if (v12)
      {
        [v13 setObject:v12 forKey:@"DisplayColorNumberOfUpdates"];
      }
      id v8 = [(CBColorModuleiOS *)self newArrayFromDoubles:&a3->var2 size:46];
      if (v8)
      {
        [v13 setObject:v8 forKey:@"AmbientColorBinsAnsi"];
      }
      id v9 = [(CBColorModuleiOS *)self newArrayFromDoubles:&a3->var1 size:17];
      if (v9)
      {
        [v13 setObject:v9 forKey:@"DisplayColorBins"];
      }
      [(NSMutableDictionary *)self->_properties setObject:v13 forKey:@"PowerLogReport"];
      [(CBColorModuleiOS *)self sendNotificationForKey:v3 andValue:v13];
    }
  }
}

- (void)reportToCoreAnlytics:(ColorReport *)a3
{
  if (a3)
  {
    if (self->_colorStruct.harmonySupported) {
      +[CBAnalytics harmonyColor:a3];
    }
    +[CBAnalytics nightShiftCCT:(uint64_t)a3->var3.var4];
  }
}

- (void)setPreferences:(id)a3 forKey:(id)a4
{
  id v4 = (CFStringRef *)MEMORY[0x1E4F1D3F0];
  id v5 = (CFStringRef *)MEMORY[0x1E4F1D3E0];
  CFPreferencesSetValue((CFStringRef)a4, a3, @"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  CFPreferencesSynchronize(@"com.apple.CoreBrightness", *v4, *v5);
}

- (id)copyPreferencesForKey:(id)a3
{
  id v4 = (CFStringRef *)MEMORY[0x1E4F1D3F0];
  id v5 = (CFStringRef *)MEMORY[0x1E4F1D3E0];
  CFPreferencesSynchronize(@"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  return (id)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.CoreBrightness", *v4, *v5);
}

- (id)newArrayFromDoubles:(double *)a3 size:(int)a4
{
  id v7 = 0;
  if (a3 && a4 > 0)
  {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    for (int i = 0; i < a4; ++i)
    {
      id v5 = (id)[objc_alloc(NSNumber) initWithDouble:a3[i]];
      if (!v5)
      {

        return 0;
      }
      [v7 addObject:v5];
    }
  }
  return v7;
}

- (id)newArrayFromIntegers:(int *)a3 size:(int)a4
{
  id v7 = 0;
  if (a3 && a4 > 0)
  {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    for (int i = 0; i < a4; ++i)
    {
      id v5 = (id)[objc_alloc(NSNumber) initWithInt:a3[i]];
      if (!v5)
      {

        return 0;
      }
      [v7 addObject:v5];
    }
  }
  return v7;
}

- (id)copyIdentifiers
{
  id v4 = self;
  SEL v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"ColorAdaptationAvailable", @"ColorAdaptationEnabled", @"ColorAdaptationActive", @"ColorAdaptationMode", @"ColorAdaptationStrength", @"ColorAdaptationModeMapping", @"ColorFadesEnabled", @"BlueLightReductionCCTTargetKey", @"ColorRamp", @"ColorRampBLR", @"ColorRampHarmony", @"ColorRampAmmolite", @"SupportedColorFX", @"BlueLightReductionCCTWarningKey", @"BlueLightReductionCCTRange", @"LabShift", @"PowerLogReport",
               @"CBAmmoliteEnabled",
               0);
}

- (BOOL)applyPendingSamples
{
  if ([(NSMutableDictionary *)self->_pendingALSSamples count])
  {
    uint64_t v2 = [(NSMutableDictionary *)self->_pendingALSSamples allValues];
    LODWORD(v3) = 1045220557;
    [(CBColorModuleiOS *)self applySamples:v2 withinTimeout:v3];
    [(NSMutableDictionary *)self->_pendingALSSamples removeAllObjects];
  }
  return 0;
}

- (id)copyALSSamples
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v14 = self;
  SEL v13 = a2;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  memset(__b, 0, sizeof(__b));
  obunsigned int j = (id)[(NSMutableDictionary *)v14->_alsNodes allValues];
  uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    unint64_t v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v11 = 0;
      id v11 = *(id *)(__b[1] + 8 * v5);
      id v9 = (id)[v11 copyALSEvent];
      if (v9)
      {
        [v12 addObject:v9];
      }
      ++v5;
      if (v3 + 1 >= v6)
      {
        uint64_t v5 = 0;
        unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }
  return v12;
}

- (BOOL)applySamples:(id)a3 withinTimeout:(float)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = self;
  SEL v23 = a2;
  id v22 = a3;
  float v21 = a4;
  char v20 = 0;
  if ([a3 count])
  {
    float v19 = mach_time_now_in_seconds();
    memset(__b, 0, sizeof(__b));
    obunsigned int j = v22;
    uint64_t v16 = [v22 countByEnumeratingWithState:__b objects:v26 count:16];
    if (v16)
    {
      uint64_t v12 = *(void *)__b[2];
      uint64_t v13 = 0;
      unint64_t v14 = v16;
      while (1)
      {
        uint64_t v11 = v13;
        if (*(void *)__b[2] != v12) {
          objc_enumerationMutation(obj);
        }
        id v18 = 0;
        id v18 = *(id *)(__b[1] + 8 * v13);
        float v10 = v19;
        [v18 timestamp];
        if (vabds_f32(v10, v4) < v21)
        {
          if (v24->super._logHandle)
          {
            os_log_t logHandle = v24->super._logHandle;
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
            __os_log_helper_16_2_1_8_66((uint64_t)v25, (uint64_t)v18);
            _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Apply pending/copied ALS sample %{public}@", v25, 0xCu);
          }
          id v7 = v24;
          uint64_t v6 = [v18 event];
          -[CBColorModuleiOS handleHIDEventInternal:from:](v7, "handleHIDEventInternal:from:", v6, [v18 service]);
          char v20 = 1;
        }
        ++v13;
        if (v11 + 1 >= v14)
        {
          uint64_t v13 = 0;
          unint64_t v14 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
          if (!v14) {
            break;
          }
        }
      }
    }
  }
  return v20 & 1;
}

- (void)armFirstALSSampleTimer
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = self;
  SEL v16 = a2;
  os_log_t v15 = 0;
  if (self->super._logHandle)
  {
    os_log_t logHandle = v17->super._logHandle;
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
  os_log_t v15 = logHandle;
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(double *)&uint64_t v2 = CFAbsoluteTimeGetCurrent();
    __os_log_helper_16_0_1_8_0((uint64_t)v18, v2);
    _os_log_impl(&dword_1BA438000, v15, v14, "ts=%f Arming first sample timeout", v18, 0xCu);
  }
  v17->_timeoutTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v17->super._queue);
  if (v17->_timeoutTimer)
  {
    source = v17->_timeoutTimer;
    dispatch_time_t v3 = dispatch_time(0, (uint64_t)(float)(v17->_firstSampleTimeoutValue * 1000000000.0));
    dispatch_source_set_timer(source, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
    timeoutTimer = v17->_timeoutTimer;
    uint64_t handler = MEMORY[0x1E4F143A8];
    int v9 = -1073741824;
    int v10 = 0;
    uint64_t v11 = __42__CBColorModuleiOS_armFirstALSSampleTimer__block_invoke;
    uint64_t v12 = &unk_1E6218FE0;
    uint64_t v13 = v17;
    dispatch_source_set_event_handler(timeoutTimer, &handler);
    dispatch_resume((dispatch_object_t)v17->_timeoutTimer);
  }
}

uint64_t __42__CBColorModuleiOS_armFirstALSSampleTimer__block_invoke(uint64_t a1)
{
  obunsigned int j = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) firstALSSampleTimeout];
  return objc_sync_exit(obj);
}

- (void)firstALSSampleTimeout
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  os_log_t v15 = self;
  SEL v14 = a2;
  if (self->_firstALSEventArrived) {
    v15->_potentiallyBustedALS = 1;
  }
  v15->_continueWithFewerALSs = 1;
  os_log_t v13 = 0;
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
  os_log_t v13 = logHandle;
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v16, v15->_potentiallyBustedALS);
    _os_log_impl(&dword_1BA438000, v13, v12, "First ALS sample TIMEOUT! Busted ALS = %i", v16, 8u);
  }
  if (v15->_timeoutTimer)
  {
    if (!v15->_NSamples && v15->_colorStruct.harmonyEnabled && v15->_moduleType == 1)
    {
      memset(__b, 0, 0x3CuLL);
      [(CBColorModuleiOS *)v15 inputAmbientColorSample:__b force:0 trust:1];
    }
    dispatch_release((dispatch_object_t)v15->_timeoutTimer);
    v15->_timeoutTimer = 0;
  }
  else
  {
    int v10 = 0;
    if (v15->super._logHandle)
    {
      uint64_t v5 = v15->super._logHandle;
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
    int v10 = v5;
    char v9 = 16;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v2 = v10;
      os_log_type_t v3 = v9;
      __os_log_helper_16_0_0(v8);
      _os_log_error_impl(&dword_1BA438000, v2, v3, "Timer is invalid", v8, 2u);
    }
  }
}

- (id)newAggregatedConfigFromSerializedConfig:(id)a3
{
  v6[3] = self;
  v6[2] = a2;
  v6[1] = a3;
  v6[0] = 0;
  uint64_t v5 = 0;
  id v4 = (id)[MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:v6 error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v4;
  }
  return v5;
}

- (BOOL)serializedAggregatedConfigPropertyHandler:(id)a3
{
  BOOL v5 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(CBColorModuleiOS *)self newAggregatedConfigFromSerializedConfig:a3];
    if (v4)
    {
      [(NSMutableDictionary *)self->_properties setObject:v4 forKey:@"CBAggregatedConfig"];
    }
    if (self->_aggregatedConfigApplied) {
      [(CBColorModuleiOS *)self applyAggregatedConfig:1];
    }
    return 1;
  }
  return v5;
}

- (BOOL)applyAggregatedConfigPropertyHandler:(id)a3
{
  BOOL v4 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[CBColorModuleiOS applyAggregatedConfig:](self, "applyAggregatedConfig:", [a3 BOOLValue] & 1);
    return 1;
  }
  return v4;
}

- (id)copyLocalAggregatedConfig
{
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  if (v6)
  {
    os_log_type_t v3 = (void *)[(NSMutableDictionary *)self->_properties objectForKey:@"BlueLightReductionCCTTargetKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      os_log_type_t v3 = (void *)[v3 objectForKey:@"BlueLightReductionCCTTargetValue"];
    }
    if (v3) {
      [v6 setObject:v3 forKey:@"BlueLightReductionCCTTargetKey"];
    }
    uint64_t v4 = [(NSMutableDictionary *)self->_properties objectForKey:@"ColorAdaptationActive"];
    if (v4) {
      [v6 setObject:v4 forKey:@"ColorAdaptationActive"];
    }
    BOOL v5 = (void *)[(NSMutableDictionary *)self->_properties objectForKey:@"BlueLightReductionFactor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = (void *)[v5 objectForKey:@"BlueLightReductionFactorValue"];
    }
    if (v5) {
      [v6 setObject:v5 forKey:@"BlueLightReductionFactor"];
    }
  }
  return v6;
}

- (void)applyAggregatedConfig:(BOOL)a3
{
  BOOL v18 = a3;
  uint64_t v17 = 0;
  SEL v16 = 0;
  os_log_t v15 = 0;
  self->_aggregatedConfigApplied = 0;
  if (a3)
  {
    id v14 = (id)[(NSMutableDictionary *)self->_properties objectForKey:@"CBAggregatedConfig"];
    id v3 = v14;
  }
  else
  {
    id v14 = [(CBColorModuleiOS *)self copyLocalAggregatedConfig];
    self->_aggregatedConfigApplied = 0;
  }
  if (v14)
  {
    uint64_t v11 = [v14 objectForKey:@"BlueLightReductionFactor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v17 = (void *)v11;
    }
    uint64_t v12 = [v14 objectForKey:@"BlueLightReductionCCTTargetKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      SEL v16 = (void *)v12;
    }
    uint64_t v13 = [v14 objectForKey:@"ColorAdaptationActive"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      os_log_t v15 = (void *)v13;
    }
  }
  if (v16)
  {
    uint64_t cfx = self->_colorStruct.cfx;
    [v16 floatValue];
    CFXSetBlueLightReductionTargetCCT((uint64_t)cfx, 0, v5, -1.0, 0.0);
  }
  if (v17)
  {
    [v17 floatValue];
    int v9 = LODWORD(v6);
  }
  else
  {
    HIDWORD(v6) = 0;
    int v9 = 0;
  }
  LODWORD(v6) = v9;
  LODWORD(v4) = -1.0;
  [(CBColorModuleiOS *)self BLRFactorUpdate:1 withPeriod:v6 shouldForceUpdate:v4];
  uint64_t v8 = self->_colorStruct.cfx;
  if (v15) {
    int v7 = [v15 BOOLValue] & 1;
  }
  else {
    int v7 = 0;
  }
  CFXEnableAmbientAdaptation((uint64_t)v8, v7 != 0);

  self->_aggregatedConfigApplied = v18;
}

- (BOOL)ttRestrictionReload
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v58 = self;
  SEL v57 = a2;
  BOOL v56 = 0;
  id v55 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreBrightness"];
  if (v55)
  {
    [v55 synchronize];
    id v54 = (id)[v55 objectForKey:@"TTRestrictionEnable"];
    if (v54)
    {
      BOOL v56 = [v54 intValue] != 0;
      os_log_t oslog = 0;
      if (v58->super._logHandle)
      {
        os_log_t logHandle = v58->super._logHandle;
      }
      else
      {
        uint64_t v32 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        os_log_t logHandle = v32;
      }
      os_log_t oslog = logHandle;
      os_log_type_t type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v63, v56);
        _os_log_debug_impl(&dword_1BA438000, oslog, type, "Enable TT restriction = %d\n", v63, 8u);
      }
    }
    if (v56)
    {
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      id v49 = (id)[v55 objectForKey:@"TTRestriction_th_E"];
      id v48 = (id)[v55 objectForKey:@"TTRestriction_th_L"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v31 = [v49 count];
          if (v31 == [v48 count])
          {
            if ([v49 count])
            {
              os_log_t v47 = 0;
              if (v58->super._logHandle)
              {
                os_log_type_t v30 = v58->super._logHandle;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t inited = init_default_corebrightness_log();
                }
                os_log_type_t v30 = inited;
              }
              os_log_t v47 = v30;
              os_log_type_t v46 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                __os_log_helper_16_0_1_8_0((uint64_t)v62, [v49 count]);
                _os_log_impl(&dword_1BA438000, v47, v46, "TT restriction: th_E and th_L sizes = %ld\n", v62, 0xCu);
              }
              LOBYTE(v50) = 1;
              id v45 = 0;
              id v45 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v49, @"TTRestriction_th_E", v48, @"TTRestriction_th_E", 0);
              memset(__b, 0, sizeof(__b));
              obunsigned int j = v58->_filters;
              uint64_t v28 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v61 count:16];
              if (v28)
              {
                uint64_t v24 = *(void *)__b[2];
                uint64_t v25 = 0;
                unint64_t v26 = v28;
                while (1)
                {
                  uint64_t v23 = v25;
                  if (*(void *)__b[2] != v24) {
                    objc_enumerationMutation(obj);
                  }
                  id v44 = 0;
                  id v44 = *(id *)(__b[1] + 8 * v25);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v44 setProperty:v45 forKey:@"MitigationBoundaryOverride"];
                  }
                  ++v25;
                  if (v23 + 1 >= v26)
                  {
                    uint64_t v25 = 0;
                    unint64_t v26 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v61 count:16];
                    if (!v26) {
                      break;
                    }
                  }
                }
              }
            }
          }
        }
      }
      id v42 = (id)[v55 objectForKey:@"TTRestriction_fade_periods"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v42 count] == 3)
      {
        os_log_t v41 = 0;
        if (v58->super._logHandle)
        {
          id v22 = v58->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v21 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v21 = init_default_corebrightness_log();
          }
          id v22 = v21;
        }
        os_log_t v41 = v22;
        os_log_type_t v40 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_msgSend(v42, "objectAtIndexedSubscript:", 0), "floatValue");
          *(double *)&uint64_t v19 = v2;
          objc_msgSend((id)objc_msgSend(v42, "objectAtIndexedSubscript:", 1), "floatValue");
          *(double *)&uint64_t v20 = v3;
          objc_msgSend((id)objc_msgSend(v42, "objectAtIndexedSubscript:", 2), "floatValue");
          __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v60, v19, v20, COERCE__INT64(v4));
          _os_log_debug_impl(&dword_1BA438000, v41, v40, "TT restriction: fade periods = %f %f %f\n", v60, 0x20u);
        }
        objc_msgSend((id)objc_msgSend(v42, "objectAtIndexedSubscript:", 0), "floatValue");
        HIDWORD(v50) = v5;
        objc_msgSend((id)objc_msgSend(v42, "objectAtIndexedSubscript:", 1), "floatValue");
        LODWORD(v51) = v6;
        objc_msgSend((id)objc_msgSend(v42, "objectAtIndexedSubscript:", 2), "floatValue");
        HIDWORD(v51) = v7;
        BYTE1(v50) = 1;
      }
      CFXEnableOverrides((uint64_t)v58->_colorStruct.cfx, (uint64_t)&v50);
    }
    else if (v54)
    {
      os_log_t v39 = 0;
      if (v58->super._logHandle)
      {
        BOOL v18 = v58->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v17 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v17 = init_default_corebrightness_log();
        }
        BOOL v18 = v17;
      }
      os_log_t v39 = v18;
      os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t v15 = v39;
        os_log_type_t v16 = v38;
        __os_log_helper_16_0_0(v37);
        _os_log_impl(&dword_1BA438000, v15, v16, "TT restriction: Resetting defaults\n", v37, 2u);
      }
      uint64_t v36 = 0;
      memset(v34, 0, sizeof(v34));
      filters = v58->_filters;
      uint64_t v14 = [(NSMutableArray *)filters countByEnumeratingWithState:v34 objects:v59 count:16];
      if (v14)
      {
        uint64_t v10 = *(void *)v34[2];
        uint64_t v11 = 0;
        unint64_t v12 = v14;
        while (1)
        {
          uint64_t v9 = v11;
          if (*(void *)v34[2] != v10) {
            objc_enumerationMutation(filters);
          }
          id v35 = 0;
          id v35 = *(id *)(v34[1] + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v35 setProperty:v36 forKey:@"MitigationBoundaryOverride"];
          }
          ++v11;
          if (v9 + 1 >= v12)
          {
            uint64_t v11 = 0;
            unint64_t v12 = [(NSMutableArray *)filters countByEnumeratingWithState:v34 objects:v59 count:16];
            if (!v12) {
              break;
            }
          }
        }
      }
      CFXEnableOverrides((uint64_t)v58->_colorStruct.cfx, 0);
    }
  }
  return 1;
}

- (BOOL)ttRestrictionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = [a3 intValue] != 0;
    if (self->super._logHandle)
    {
      os_log_t logHandle = self->super._logHandle;
    }
    else
    {
      uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      os_log_t logHandle = v4;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v10, v7);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Setting TT restriction = %d\n", v10, 8u);
    }
  }
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreBrightness"];
  if (v6)
  {
    [v6 setObject:a3 forKey:@"TTRestrictionEnable"];
    [v6 synchronize];
  }
  return [(CBColorModuleiOS *)self ttRestrictionReload];
}

- (BOOL)handleAODStateUpdate:(unint64_t)a3 transitionTime:(float)a4 context:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v12, a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "AOD state update = %d", v12, 8u);
  }
  if (a3)
  {
    unint64_t v6 = a3;
    char v5 = 1;
  }
  else
  {
    unint64_t v6 = 0;
    char v5 = 0;
  }
  if ((v5 & 1) == 0)
  {
    switch(v6)
    {
      case 0uLL:
        CFXOverrideRampPeriod((uint64_t)self->_colorStruct.cfx, -1.0);
        break;
      case 1uLL:
      case 3uLL:
      case 4uLL:
        return 1;
      case 2uLL:
        CFXCancelColorFade((uint64_t)self->_colorStruct.cfx);
        CFXOverrideRampPeriod((uint64_t)self->_colorStruct.cfx, 0.0);
        break;
      default:
        JUMPOUT(0);
    }
  }
  return 1;
}

@end