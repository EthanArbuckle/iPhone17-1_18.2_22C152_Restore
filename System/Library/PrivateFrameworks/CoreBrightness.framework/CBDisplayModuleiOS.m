@interface CBDisplayModuleiOS
- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)edrIsEngaged;
- (BOOL)handleAODStateUpdate:(unint64_t)a3 transitionTime:(float)a4 context:(id)a5;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (BOOL)luxHasCrossedBDMThreshold:(float)a3;
- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)shouldForceCapRamp;
- (CBBacklightNode)backlightParams;
- (CBDisplayModuleiOS)initWithBacklight:(unsigned int)a3 queue:(id)a4 brtCtl:(id)a5;
- (CBDisplayModuleiOS)initWithBacklight:(unsigned int)a3 queue:(id)a4 display:(id)a5;
- (__Display)displayInternal;
- (const)edrStateToString:(unint64_t)a3;
- (const)rtplcStateToString:(unint64_t)a3;
- (float)computeBrightnessCompensation;
- (float)computeTargetHDRBrightnessForAPCE:(float)a3 andScale:(float)a4;
- (id)className;
- (id)copyIdentifiers;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (id)copyPropertyInternalForKey:(id)a3;
- (void)apceTimerCallback;
- (void)createAPCEMonitorWithFrequency:(float)a3;
- (void)dealloc;
- (void)deleteAPCEMonitor;
- (void)handleAttachedNotification;
- (void)handleDisplayBrightnessUpdate:(id)a3;
- (void)handleEDRHeadroomRequest:(id)a3;
- (void)handleFrameInfo:(id *)a3;
- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4;
- (void)initialiseAurora;
- (void)initialiseEDR;
- (void)initialiseSDR;
- (void)sendNotificationForKey:(id)a3 withValue:(id)a4;
- (void)start;
- (void)stop;
- (void)updateBDMWithLux:(float)a3;
- (void)updateEDRStateForEvent:(unint64_t)a3 andHeadroom:(float)a4;
- (void)updatePresetState:(BOOL)a3;
- (void)updateSDRLimits:(id)a3;
@end

@implementation CBDisplayModuleiOS

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v33 = self;
  SEL v32 = a2;
  id v31 = a3;
  id v30 = a4;
  os_log_t v29 = 0;
  if (self->super.super._logHandle)
  {
    logHandle = v33->super.super._logHandle;
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
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v38, (uint64_t)v31, (uint64_t)v30);
    _os_log_debug_impl(&dword_1BA438000, v29, v28, "Handle notification for key = %@ and property = %@", v38, 0x16u);
  }
  char v27 = 0;
  char v27 = [(CBAurora *)v33->_aurora isBoostingBrightness];
  [(CBAurora *)v33->_aurora setPropertyForKey:v31 withValue:v30];
  [(CBChromaticCorrection *)v33->_twilight handleNotificationForKey:v31 withProperty:v30];
  [(CBChromaticCorrection *)v33->_ammolite handleNotificationForKey:v31 withProperty:v30];
  [(CBIndicatorBrightnessModule *)v33->_indicatorBrightnessModule handleNotificationForKey:v31 withProperty:v30];
  if ([v31 isEqualToString:@"CBTargetWhitePoint"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v26 = (id)[v30 objectForKey:@"YWP"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v26 floatValue];
        float v25 = 1.0 / v4;
        DisplaySetEDRForTargetYcompensation((uint64_t)v33->_displayInternal, 1.0 / v4);
      }
    }
  }
  else if ([v31 isEqualToString:@"BlueReductionEnabled"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33->_blrEnabled = [v30 BOOLValue] & 1;
      os_log_t v24 = 0;
      if (v33->super.super._logHandle)
      {
        v16 = v33->super.super._logHandle;
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
      os_log_t v24 = v16;
      os_log_type_t v23 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v37, (uint64_t)v30);
        _os_log_impl(&dword_1BA438000, v24, v23, "Set BLR enabled = %{public}@", v37, 0xCu);
      }
      DisplaySetBLREnabled((uint64_t)v33->_displayInternal, v33->_blrEnabled);
    }
  }
  else if ([v31 isEqualToString:@"ColorAdaptationActive"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33->_harmonyEnabled = [v30 BOOLValue] & 1;
      os_log_t v22 = 0;
      if (v33->super.super._logHandle)
      {
        v14 = v33->super.super._logHandle;
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
      os_log_t v22 = v14;
      os_log_type_t v21 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v36, (uint64_t)v30);
        _os_log_impl(&dword_1BA438000, v22, v21, "Set Harmony enabled = %{public}@", v36, 0xCu);
      }
      DisplaySetHarmonyEnabled((uint64_t)v33->_displayInternal, v33->_harmonyEnabled);
    }
  }
  else if ([v31 isEqualToString:@"TrustedLux"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v30 floatValue];
      float v20 = *(float *)&v5;
      [(CBDisplayModuleiOS *)v33 updateBDMWithLux:v5];
      v33->_trustedLux = v20;
      if (v33->_brtCtl)
      {
        if (![+[CBAODState sharedInstance] isAODActive])
        {
          *(float *)&double v6 = v33->_trustedLux;
          [(CBBrightnessProxy *)v33->_brtCtl setAmbient:v6];
          uint64_t v19 = 0;
          if (([(CBBrightnessProxy *)v33->_brtCtl commitBrightness:&v19] & 1) == 0)
          {
            if (v33->super.super._logHandle)
            {
              v12 = v33->super.super._logHandle;
            }
            else
            {
              uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
              v12 = v11;
            }
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v35, v19);
              _os_log_error_impl(&dword_1BA438000, v12, OS_LOG_TYPE_ERROR, "ERROR COMMITING LUX FROM CA!!!!!!! (%@)", v35, 0xCu);
            }
          }
          if (v33->super.super._logHandle)
          {
            v10 = v33->super.super._logHandle;
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
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_0_1_8_0((uint64_t)v34, COERCE__INT64(v33->_trustedLux));
            _os_log_impl(&dword_1BA438000, v10, OS_LOG_TYPE_INFO, "Set trusted lux = %f", v34, 0xCu);
          }
        }
      }
    }
  }
  else if ([v31 isEqualToString:@"FrameSynchronizedBrightnessTransaction"])
  {
    [(CBDisplayModuleiOS *)v33 handleDisplayBrightnessUpdate:v30];
  }
  else if (([v31 isEqualToString:@"CPMS.CLTM.Cap"] & 1) != 0 && (v27 & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v30 floatValue];
      if (*(float *)&v7 < v33->_nitsSDR)
      {
        *(float *)&double v8 = v33->_nitsSDR;
        +[CBAnalytics cltmBudgetUpdated:v7 currentSDRBrightness:v8];
      }
    }
  }
}

uint64_t __42__CBDisplayModuleiOS_handleHIDEvent_from___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A9C8];
  if (result)
  {
    uint64_t result = [a2 handleHIDEvent:a1[5] from:a1[6]];
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = (*(unsigned char *)(*(void *)(a1[4] + 8) + 24) & 1 | result & 1) != 0;
  }
  return result;
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  v14 = self;
  SEL v13 = a2;
  v12 = a3;
  uint64_t v11 = a4;
  uint64_t v6 = 0;
  double v7 = &v6;
  int v8 = 0x20000000;
  int v9 = 32;
  char v10 = 0;
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_subModules, "enumerateObjectsUsingBlock:");
  char v5 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v5 & 1;
}

uint64_t __45__CBDisplayModuleiOS_removeHIDServiceClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A9C8];
  if (result)
  {
    uint64_t result = [a2 removeHIDServiceClient:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24) & 1 | result & 1) != 0;
  }
  return result;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  v12 = self;
  SEL v11 = a2;
  char v10 = a3;
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  int v7 = 0x20000000;
  int v8 = 32;
  char v9 = 0;
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_subModules, "enumerateObjectsUsingBlock:");
  char v4 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v4 & 1;
}

void __52__CBDisplayModuleiOS_handleDisplayBrightnessUpdate___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)(a1 + 48)));
  int v7 = (void *)[*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F39E00]];
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    float v3 = mach_time_to_milliseconds([v7 unsignedLongLongValue]);
    [v8 floatValue];
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v9, v2, COERCE__INT64((float)(v3 - v1)));
    _os_log_debug_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEBUG, "SyncDBV Telemetry | Transaction.ID=%llu Latency=%.0fms", v9, 0x16u);
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "removeObjectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)(a1 + 48)));
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  v72 = self;
  SEL v71 = a2;
  id v70 = a3;
  id v69 = a4;
  BOOL v68 = 0;
  os_log_t v67 = 0;
  if (self->super.super._logHandle)
  {
    logHandle = v72->super.super._logHandle;
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
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v87, (uint64_t)v69, (uint64_t)v70);
    _os_log_debug_impl(&dword_1BA438000, v67, type, "Set property for key = %@ property = %@", v87, 0x16u);
  }
  [(CBAurora *)v72->_aurora setPropertyForKey:v69 withValue:v70];
  [(CBChromaticCorrection *)v72->_twilight setProperty:v70 forKey:v69];
  [(CBChromaticCorrection *)v72->_ammolite setProperty:v70 forKey:v69];
  [(CBIndicatorBrightnessModule *)v72->_indicatorBrightnessModule setProperty:v70 forKey:v69];
  if ([v69 isEqualToString:@"EDRHeadroomRequest"])
  {
    if (v72->_nitsSDR > 0.0
      || objc_msgSend(v70, "objectForKeyedSubscript:", -[CBBrightnessProxy brightnessNotificationPowerOff](v72->_brtCtl, "brightnessNotificationPowerOff")))
    {
      [(CBDisplayModuleiOS *)v72 handleEDRHeadroomRequest:v70];
    }
    else
    {
      os_log_t v65 = 0;
      if (v72->super.super._logHandle)
      {
        v44 = v72->super.super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v43 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v43 = init_default_corebrightness_log();
        }
        v44 = v43;
      }
      os_log_t v65 = v44;
      os_log_type_t v64 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)objc_msgSend(v70, "objectForKey:", -[CBBrightnessProxy brightnessRequestEDRHeadroom](v72->_brtCtl, "brightnessRequestEDRHeadroom")), "floatValue");
        __os_log_helper_16_0_1_8_0((uint64_t)v86, COERCE__INT64(v4));
        _os_log_impl(&dword_1BA438000, v65, v64, "EDR Headroom request received while SDR is 0: EDR: %f, caching request", v86, 0xCu);
      }
      if (!v72->_cachedProperties) {
        v72->_cachedProperties = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      if (!v72->_cachedKeys) {
        v72->_cachedKeys = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      [(NSMutableArray *)v72->_cachedProperties addObject:v70];
      [(NSMutableArray *)v72->_cachedKeys addObject:v69];
    }
    goto LABEL_162;
  }
  if (v72->_brtCtl
    && (objc_msgSend(v69, "isEqualToString:", -[CBBrightnessProxy brightnessNotificationRequestEDR](v72->_brtCtl, "brightnessNotificationRequestEDR")) & 1) != 0)
  {

    v72->_lastEDRHeadroomRequestFromCA = v70;
    goto LABEL_162;
  }
  if ([v69 isEqualToString:@"EDRSecondsPerStop"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v70 floatValue];
      int v63 = LODWORD(v5);
      [(CBEDR *)v72->_edr setSecondsPerStop:v5];
    }
    goto LABEL_162;
  }
  if (v72->_brtCtl
    && (objc_msgSend(v69, "isEqualToString:", -[CBBrightnessProxy brightnessNotificationAttached](v72->_brtCtl, "brightnessNotificationAttached")) & 1) != 0)
  {
    [(CBDisplayModuleiOS *)v72 handleAttachedNotification];
    char v73 = 1;
  }
  else if (v72->_brtCtl {
         && (objc_msgSend(v69, "isEqualToString:", -[CBBrightnessProxy brightnessNotificationPowerOff](v72->_brtCtl, "brightnessNotificationPowerOff")) & 1) != 0)
  }
  {
    if (!v72->_referenceModeIsActive)
    {
      id v6 = objc_alloc(NSNumber);
      LODWORD(v7) = 1.0;
      id v62 = (id)[v6 initWithFloat:v7];
      if (v62)
      {
        id v61 = 0;
        id v42 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        uint64_t v41 = [(CBBrightnessProxy *)v72->_brtCtl brightnessRequestEDRHeadroom];
        id v61 = (id)objc_msgSend(v42, "initWithObjectsAndKeys:", v62, v41, *MEMORY[0x1E4F1CFD0], -[CBBrightnessProxy brightnessNotificationPowerOff](v72->_brtCtl, "brightnessNotificationPowerOff"), 0);

        if (v61)
        {
          [(CBDisplayModuleiOS *)v72 setProperty:v61 forKey:@"EDRHeadroomRequest"];
        }
      }
    }
    v72->_autoDimActive = 0;
    DisplaySetProperty((uint64_t)v72->_displayInternal, @"DisplayPowerOff", *MEMORY[0x1E4F1CFD0]);
    char v73 = 1;
  }
  else if (v72->_brtCtl {
         && ((objc_msgSend(v69, "isEqualToString:", -[CBBrightnessProxy brightnessNotificationSecureIndicatorOn](v72->_brtCtl, "brightnessNotificationSecureIndicatorOn")) & 1) != 0|| (objc_msgSend(v69, "isEqualToString:", -[CBBrightnessProxy brightnessNotificationSecureIndicatorOff](v72->_brtCtl, "brightnessNotificationSecureIndicatorOff")) & 1) != 0))
  }
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_162;
    }
    uint64_t v60 = 0;
    uint64_t v60 = objc_msgSend(v70, "objectForKeyedSubscript:", -[CBBrightnessProxy brightnessSecureIndicatorActiveCount](v72->_brtCtl, "brightnessSecureIndicatorActiveCount"));
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(CBDisplayModuleiOS *)v72 setProperty:v60 forKey:@"SecureIndicatorActiveCount"];
    }
    char v73 = 1;
  }
  else
  {
    if ([v69 isEqualToString:@"SecureIndicatorState"])
    {
      [(CBDisplayModuleiOS *)v72 sendNotificationForKey:@"SecureIndicatorState" withValue:v70];
      goto LABEL_162;
    }
    if (([v69 isEqualToString:@"DisplayBrightness"] & 1) == 0 || v72->_brightnessControlEnabled)
    {
      if ([v69 isEqualToString:@"SBIMEnabled"])
      {
        if (CFBooleanGetValue((CFBooleanRef)v70)) {
          [(CBSBIM *)v72->_sbim enable];
        }
        else {
          [(CBSBIM *)v72->_sbim disable];
        }
        char v73 = 1;
      }
      else if ([v69 isEqualToString:@"FrameInfoLoggingEnabled"])
      {
        [(CBFrameStats *)v72->_frameStats enableFrameInfoLogging:CFBooleanGetValue((CFBooleanRef)v70) != 0];
        char v73 = 1;
      }
      else
      {
        if (([v69 isEqualToString:@"AuroraFactorWithFade"] & 1) == 0)
        {
          if ([v69 isEqualToString:@"TwilightStrength"])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(CBDisplayModuleiOS *)v72 sendNotificationForKey:@"TwilightStrength" withValue:v70];
            }
          }
          else
          {
            if (CFEqual(v69, @"DominoStateUpdate"))
            {
              CFTypeID TypeID = CFBooleanGetTypeID();
              if (TypeID == CFGetTypeID(v70))
              {
                Boolean Value = CFBooleanGetValue((CFBooleanRef)v70);
                if (v72->_dominoMode != Value)
                {
                  v72->_dominoMode = Value != 0;
                  if (v72->_dominoMode)
                  {
                    if ([(CBDisplayModuleiOS *)v72 edrIsEngaged])
                    {
                      context = (void *)MEMORY[0x1BA9ECAE0]();
                      os_log_t v58 = 0;
                      if (v72->super.super._logHandle)
                      {
                        v36 = v72->super.super._logHandle;
                      }
                      else
                      {
                        if (_COREBRIGHTNESS_LOG_DEFAULT) {
                          uint64_t v35 = _COREBRIGHTNESS_LOG_DEFAULT;
                        }
                        else {
                          uint64_t v35 = init_default_corebrightness_log();
                        }
                        v36 = v35;
                      }
                      os_log_t v58 = v36;
                      os_log_type_t v57 = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                      {
                        __os_log_helper_16_0_1_8_0((uint64_t)v85, 0x3FF0000000000000);
                        _os_log_error_impl(&dword_1BA438000, v58, v57, "Domino EDR | Entering Domino, reducing EDR headroom to %f", v85, 0xCu);
                      }
                      v83[0] = @"DominoHeadroomRequest";
                      v84[0] = MEMORY[0x1E4F1CC38];
                      v83[1] = [(CBBrightnessProxy *)v72->_brtCtl brightnessRequestEDRHeadroom];
                      v84[1] = &unk_1F1418410;
                      -[CBDisplayModuleiOS setProperty:forKey:](v72, "setProperty:forKey:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:2], @"EDRHeadroomRequest");
                    }
                  }
                  else if (v72->_lastEDRHeadroomRequestFromCA)
                  {
                    v34 = (void *)MEMORY[0x1BA9ECAE0]();
                    id v56 = 0;
                    id v56 = (id)[v72->_lastEDRHeadroomRequestFromCA mutableCopy];
                    [v56 setValue:MEMORY[0x1E4F1CC38] forKey:@"DominoHeadroomRequest"];
                    os_log_t oslog = 0;
                    if (v72->super.super._logHandle)
                    {
                      v33 = v72->super.super._logHandle;
                    }
                    else
                    {
                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                        uint64_t v32 = _COREBRIGHTNESS_LOG_DEFAULT;
                      }
                      else {
                        uint64_t v32 = init_default_corebrightness_log();
                      }
                      v33 = v32;
                    }
                    os_log_t oslog = v33;
                    os_log_type_t v54 = OS_LOG_TYPE_DEFAULT;
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend((id)objc_msgSend(v56, "objectForKeyedSubscript:", -[CBBrightnessProxy brightnessRequestEDRHeadroom](v72->_brtCtl, "brightnessRequestEDRHeadroom")), "floatValue");
                      __os_log_helper_16_0_1_8_0((uint64_t)v82, COERCE__INT64(v10));
                      _os_log_impl(&dword_1BA438000, oslog, v54, "Domino EDR | Domino is exiting Restoring EDR headroom after exiting to %f", v82, 0xCu);
                    }
                    [(CBDisplayModuleiOS *)v72 setProperty:v56 forKey:@"EDRHeadroomRequest"];
                  }
                  BOOL v31 = 0;
                  if (v72->_brightnessControlEnabled) {
                    BOOL v31 = !v72->_dominoMode;
                  }
                  -[CBDisplayModuleiOS sendNotificationForKey:withValue:](v72, "sendNotificationForKey:withValue:", @"CBBrightnessControlAvailable", [NSNumber numberWithBool:v31]);
                }
              }
            }
            else
            {
              if (CFEqual(v69, @"AmbientAdaptiveDimming"))
              {
                if (v70)
                {
                  CFTypeID v30 = CFDictionaryGetTypeID();
                  if (v30 == CFGetTypeID(v70))
                  {
                    int valuePtr = 0;
                    CFTypeRef cf = CFDictionaryGetValue((CFDictionaryRef)v70, @"AmbientAdaptiveDimmingEnable");
                    if (cf)
                    {
                      CFTypeID v29 = CFNumberGetTypeID();
                      if (v29 == CFGetTypeID(cf)) {
                        CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &valuePtr);
                      }
                    }
                    int v51 = 0;
                    CFNumberRef v50 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v70, @"AmbientAdaptiveDimmingPeriod");
                    if (v50)
                    {
                      CFTypeID v28 = CFNumberGetTypeID();
                      if (v28 == CFGetTypeID(v50)) {
                        CFNumberGetValue(v50, kCFNumberFloatType, &v51);
                      }
                    }
                    if (v72->_autoDimActive != valuePtr)
                    {
                      v72->_autoDimActive = valuePtr != 0;
                      if (v72->_autoDimActive)
                      {
                        if ([(CBDisplayModuleiOS *)v72 edrIsEngaged])
                        {
                          char v27 = (void *)MEMORY[0x1BA9ECAE0]();
                          if (v72->super.super._logHandle)
                          {
                            id v26 = v72->super.super._logHandle;
                          }
                          else
                          {
                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                              uint64_t v25 = _COREBRIGHTNESS_LOG_DEFAULT;
                            }
                            else {
                              uint64_t v25 = init_default_corebrightness_log();
                            }
                            id v26 = v25;
                          }
                          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                          {
                            __os_log_helper_16_0_1_8_0((uint64_t)v81, COERCE__INT64(v72->_appliedHeadroom));
                            _os_log_impl(&dword_1BA438000, v26, OS_LOG_TYPE_DEFAULT, "AutoDim EDR | Entering AutoDim, freezing EDR headroom to %f", v81, 0xCu);
                          }
                          os_log_t v24 = v72;
                          v79[0] = @"AutoDimHeadroomRequest";
                          v80[0] = MEMORY[0x1E4F1CC38];
                          v79[1] = [(CBBrightnessProxy *)v72->_brtCtl brightnessRequestEDRHeadroom];
                          *(float *)&double v11 = v72->_appliedHeadroom;
                          v80[1] = [NSNumber numberWithFloat:v11];
                          -[CBDisplayModuleiOS setProperty:forKey:](v24, "setProperty:forKey:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2], @"EDRHeadroomRequest");
                        }
                      }
                      else if (v72->_lastEDRHeadroomRequestFromCA)
                      {
                        os_log_type_t v23 = (void *)MEMORY[0x1BA9ECAE0]();
                        id v49 = (id)[v72->_lastEDRHeadroomRequestFromCA mutableCopy];
                        [v49 setValue:MEMORY[0x1E4F1CC38] forKey:@"AutoDimHeadroomRequest"];
                        if (v72->super.super._logHandle)
                        {
                          os_log_t v22 = v72->super.super._logHandle;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT) {
                            uint64_t v21 = _COREBRIGHTNESS_LOG_DEFAULT;
                          }
                          else {
                            uint64_t v21 = init_default_corebrightness_log();
                          }
                          os_log_t v22 = v21;
                        }
                        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                        {
                          objc_msgSend((id)objc_msgSend(v49, "objectForKeyedSubscript:", -[CBBrightnessProxy brightnessRequestEDRHeadroom](v72->_brtCtl, "brightnessRequestEDRHeadroom")), "floatValue");
                          __os_log_helper_16_0_1_8_0((uint64_t)v78, COERCE__INT64(v12));
                          _os_log_impl(&dword_1BA438000, v22, OS_LOG_TYPE_DEFAULT, "AutoDim EDR | AutoDim is exiting, restoring EDR headroom to %f", v78, 0xCu);
                        }
                        [(CBDisplayModuleiOS *)v72 setProperty:v49 forKey:@"EDRHeadroomRequest"];
                      }
                    }
                    BOOL v68 = DisplaySetProperty((uint64_t)v72->_displayInternal, (uint64_t)v69, (uint64_t)v70) != 0;
                  }
                }
                goto LABEL_162;
              }
              if (v72->_brtCtl)
              {
                if ([v69 isEqualToString:@"EcoMode"])
                {
                  char v48 = [v70 BOOLValue] & 1;
                  if (v72->_ecoMode != v48)
                  {
                    v72->_ecoMode = v48 != 0;
                    if (v72->_ecoMode)
                    {
                      if ([(CBDisplayModuleiOS *)v72 edrIsEngaged])
                      {
                        float v20 = (void *)MEMORY[0x1BA9ECAE0]();
                        if (v72->super.super._logHandle)
                        {
                          uint64_t v19 = v72->super.super._logHandle;
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
                        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                        {
                          __os_log_helper_16_0_1_8_0((uint64_t)v77, 0x3FF0000000000000);
                          _os_log_impl(&dword_1BA438000, v19, OS_LOG_TYPE_DEFAULT, "EcoMode EDR | Entering EcoMode Reducing EDR headroom to %f", v77, 0xCu);
                        }
                        v75[0] = @"EcoModeHeadroomRequest";
                        v76[0] = MEMORY[0x1E4F1CC38];
                        v75[1] = [(CBBrightnessProxy *)v72->_brtCtl brightnessRequestEDRHeadroom];
                        v76[1] = &unk_1F1418410;
                        -[CBDisplayModuleiOS setProperty:forKey:](v72, "setProperty:forKey:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2], @"EDRHeadroomRequest");
                      }
                    }
                    else if (v72->_lastEDRHeadroomRequestFromCA)
                    {
                      v17 = (void *)MEMORY[0x1BA9ECAE0]();
                      id v47 = (id)[v72->_lastEDRHeadroomRequestFromCA mutableCopy];
                      [v47 setValue:MEMORY[0x1E4F1CC38] forKey:@"EcoModeHeadroomRequest"];
                      if (v72->super.super._logHandle)
                      {
                        v16 = v72->super.super._logHandle;
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
                        objc_msgSend((id)objc_msgSend(v72->_lastEDRHeadroomRequestFromCA, "objectForKeyedSubscript:", -[CBBrightnessProxy brightnessRequestEDRHeadroom](v72->_brtCtl, "brightnessRequestEDRHeadroom")), "floatValue");
                        __os_log_helper_16_0_1_8_0((uint64_t)v74, COERCE__INT64(v13));
                        _os_log_impl(&dword_1BA438000, v16, OS_LOG_TYPE_DEFAULT, "EcoMode EDR | EcoMode is exiting Restoring EDR headroom after exiting to %f", v74, 0xCu);
                      }
                      [(CBDisplayModuleiOS *)v72 setProperty:v47 forKey:@"EDRHeadroomRequest"];
                    }
                  }
                }
              }
            }
            BOOL v68 = DisplaySetProperty((uint64_t)v72->_displayInternal, (uint64_t)v69, (uint64_t)v70) != 0;
          }
LABEL_162:
          char v73 = v68;
          return v73 & 1;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_162;
        }
        [v70 objectForKeyedSubscript:@"AuroraFactor"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_162;
        }
        [v70 objectForKeyedSubscript:@"AuroraFadePeriod"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_162;
        }
        uint64_t displayInternal = (uint64_t)v72->_displayInternal;
        objc_msgSend((id)objc_msgSend(v70, "objectForKeyedSubscript:", @"AuroraFactor"), "floatValue");
        float v40 = v8;
        objc_msgSend((id)objc_msgSend(v70, "objectForKeyedSubscript:", @"AuroraFadePeriod"), "floatValue");
        DisplaySetAuroraFactorWithFade(displayInternal, v40, v9);
        char v73 = 1;
      }
    }
    else
    {
      char v73 = 1;
    }
  }
  return v73 & 1;
}

- (id)copyPropertyForKey:(id)a3
{
  return [(CBDisplayModuleiOS *)self copyPropertyInternalForKey:a3];
}

- (id)copyPropertyInternalForKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->super.super._logHandle)
  {
    logHandle = self->super.super._logHandle;
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
    __os_log_helper_16_2_1_8_64((uint64_t)v16, (uint64_t)a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "Copy property for key = %@", v16, 0xCu);
  }
  double v11 = 0;
  if ([a3 isEqualToString:@"StatusInfo"])
  {
    id v10 = +[CBStatusInfoHelper copyStatusInfoFor:self];
    if (v10) {
      double v11 = (CBTwilight *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v10, @"CBDisplayModuleiOS", 0);
    }

LABEL_27:
    if (self->super.super._logHandle)
    {
      double v5 = self->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v4 = init_default_corebrightness_log();
      }
      double v5 = v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)a3, (uint64_t)v11);
      _os_log_debug_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEBUG, "key=%@ result=%@", v15, 0x16u);
    }
    return v11;
  }
  if (([a3 isEqualToString:@"CBBrightnessControlAvailable"] & 1) == 0)
  {
    if ([a3 isEqualToString:@"CBBrightnessIsUnderAutoDimThreshold"]) {
      return (id)[objc_alloc(NSNumber) initWithBool:self->_brightnessIsUnderAutoDimThresholdCurrentValue];
    }
    if ([a3 isEqualToString:@"TwilightModule"])
    {
      double v11 = self->_twilight;
    }
    else if ([a3 isEqualToString:@"AmmoliteModule"])
    {
      double v11 = self->_ammolite;
    }
    else if ([a3 isEqualToString:@"IndicatorModule"])
    {
      double v11 = self->_indicatorBrightnessModule;
    }
    else
    {
      double v11 = [(CBIndicatorBrightnessModule *)self->_indicatorBrightnessModule copyPropertyForKey:a3];
      if (!v11) {
        double v11 = (CBTwilight *)DisplayCopyProperty((uint64_t)self->_displayInternal, (uint64_t)a3);
      }
    }
    goto LABEL_27;
  }
  id v6 = objc_alloc(NSNumber);
  BOOL v7 = 0;
  if (self->_brightnessControlEnabled) {
    BOOL v7 = !self->_dominoMode;
  }
  return (id)[v6 initWithBool:v7];
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  if (self->super.super._notificationBlock) {
    (*((void (**)(void))self->super.super._notificationBlock + 2))();
  }
}

- (void)handleDisplayBrightnessUpdate:(id)a3
{
  v319 = v341;
  uint64_t v371 = *MEMORY[0x1E4F143B8];
  v357 = self;
  SEL v356 = a2;
  id v355 = a3;
  id v320 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v3 = v319;
    int v318 = 0;
    *((_DWORD *)v319 + 63) = 0;
    objc_msgSend((id)objc_msgSend(*((id *)v3 + 32), "objectForKey:", @"NitsPhysical"), "floatValue");
    uint64_t v4 = v319;
    int v6 = v5;
    int v7 = v318;
    *((_DWORD *)v319 + 63) = v6;
    *((_DWORD *)v4 + 62) = v7;
    objc_msgSend((id)objc_msgSend(*((id *)v4 + 32), "objectForKey:", @"EDRHeadroom"), "floatValue");
    float v8 = v319;
    int v10 = v9;
    int v11 = v318;
    *((_DWORD *)v319 + 62) = v10;
    *((_DWORD *)v8 + 61) = v11;
    objc_msgSend((id)objc_msgSend(*((id *)v8 + 32), "objectForKey:", @"NitsCap"), "floatValue");
    float v12 = v319;
    *((_DWORD *)v319 + 61) = v13;
    objc_msgSend((id)objc_msgSend(*((id *)v12 + 32), "objectForKey:", @"DynSliderCap"), "floatValue");
    v14 = v319;
    *(_DWORD *)(*((void *)v319 + 34) + 112) = v15;
    double v16 = *((float *)v14 + 63);
    if (v16 < 0.0)
    {
      os_log_t v322 = 0;
      if (*(void *)(*((void *)v319 + 34) + 16))
      {
        os_log_t v203 = *(os_log_t *)(*((void *)v319 + 34) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        os_log_t v203 = inited;
      }
      os_log_t v322 = v203;
      os_log_type_t v321 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v203, OS_LOG_TYPE_INFO))
      {
        v200[16] = (uint64_t)v322;
        *(_DWORD *)v201 = v321;
        __os_log_helper_16_0_1_8_0((uint64_t)v358, COERCE__INT64(*((float *)v319 + 63)));
        _os_log_impl(&dword_1BA438000, v322, v321, "Unexpected SDR brightness: %f, ignore", v358, 0xCu);
      }
    }
    else
    {
      uint64_t v17 = v319;
      *(_DWORD *)(*((void *)v319 + 34) + 108) = *((_DWORD *)v319 + 63);
      LODWORD(v16) = *((_DWORD *)v17 + 63);
      uint64_t v18 = *((void *)v17 + 34);
      unint64_t v317 = 0x1E9F45000uLL;
      [*(id *)(v18 + 128) setSdrBrightness:v16];
      LODWORD(v19) = *((_DWORD *)v319 + 61);
      [*(id *)(*((void *)v319 + 34) + 128) setBrightnessCap:v19];
      LODWORD(v20) = *((_DWORD *)v319 + 63);
      [*(id *)(*((void *)v319 + 34) + 136) setSdrBrightness:v20];
      if ([*(id *)(*((void *)v319 + 34) + 288) rtplc])
      {
        if (*(void *)(*((void *)v319 + 34) + 224) == 2
          || *(void *)(*((void *)v319 + 34) + 224) == 1
          || *(void *)(*((void *)v319 + 34) + 224) == 3)
        {
          os_log_t v22 = v319;
          *((_DWORD *)v319 + 60) = 0;
          *(float *)&double v21 = DisplayGetCurrentRTPLCHeadroomCap(*(void *)(*((void *)v22 + 34) + 280));
          os_log_type_t v23 = v319;
          *((_DWORD *)v319 + 60) = LODWORD(v21);
          *(float *)(*((void *)v23 + 34) + 216) = fminf(*((float *)v23 + 60), *(float *)(*((void *)v23 + 34) + 100));
        }
        *(float *)&double v21 = fminf(*(float *)(*((void *)v319 + 34) + 216), *((float *)v319 + 61));
        [*(id *)(*((void *)v319 + 34) + 128) setBrightnessCap:v21];
        os_log_t v24 = v319;
        *((void *)v319 + 29) = 0;
        if (*(void *)(*((void *)v24 + 34) + 16))
        {
          uint64_t v316 = *(void *)(*((void *)v319 + 34) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v315 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v315 = init_default_corebrightness_log();
          }
          uint64_t v316 = v315;
        }
        uint64_t v25 = v319;
        *((void *)v319 + 29) = v316;
        os_log_type_t type = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(*((os_log_t *)v25 + 29), OS_LOG_TYPE_INFO))
        {
          os_log_t log = (os_log_t)*((void *)v319 + 29);
          *(_DWORD *)v313 = type;
          uint64_t v26 = [*((id *)v319 + 34) rtplcStateToString:*(void *)(*((void *)v319 + 34) + 224)];
          *(double *)&uint64_t v27 = *(float *)(*((void *)v319 + 34) + 216);
          *(double *)&uint64_t v28 = *((float *)v319 + 61);
          *(double *)&uint64_t v29 = *(float *)(*((void *)v319 + 34) + 112);
          *(double *)&uint64_t v30 = *(float *)(*((void *)v319 + 34) + 108);
          buf = v370;
          __os_log_helper_16_2_5_8_32_8_0_8_0_8_0_8_0((uint64_t)v370, v26, v27, v28, v29, v30);
          _os_log_impl(&dword_1BA438000, log, v313[0], "HDR CAPS | RTPLC: [%s] %f, currentNitCap: %f, dynSliderCap: %f, Nits: %f", v370, 0x34u);
        }
      }
      BOOL v31 = v319;
      *((void *)v319 + 27) = 0;
      uint64_t v32 = [*(id *)(*((void *)v31 + 34) + 128) copyStatusInfo];
      v33 = v319;
      *((void *)v319 + 27) = v32;
      *((void *)v33 + 26) = 0;
      if (*(void *)(*((void *)v33 + 34) + 16))
      {
        uint64_t v311 = *(void *)(*((void *)v319 + 34) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v310 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v310 = init_default_corebrightness_log();
        }
        uint64_t v311 = v310;
      }
      v34 = v319;
      *((void *)v319 + 26) = v311;
      os_log_type_t v353 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(*((os_log_t *)v34 + 26), OS_LOG_TYPE_INFO))
      {
        os_log_t v307 = (os_log_t)*((void *)v319 + 26);
        *(_DWORD *)v308 = v353;
        uint64_t v35 = *((void *)v319 + 27);
        v309 = v369;
        __os_log_helper_16_2_1_8_64((uint64_t)v369, v35);
        _os_log_impl(&dword_1BA438000, v307, v308[0], "CBEDR statusInfo: %@", v369, 0xCu);
      }

      LODWORD(v36) = *((_DWORD *)v319 + 62);
      [*(id *)(*((void *)v319 + 34) + 128) cappedHeadroomFromUncapped:v36];
      v37 = v319;
      *(_DWORD *)(*((void *)v319 + 34) + 144) = v38;
      *((_DWORD *)v37 + 50) = 0;
      *((_DWORD *)v37 + 50) = *(_DWORD *)(*((void *)v37 + 34) + 100);
      if ([*(id *)(*((void *)v37 + 34) + 48) isBoostingBrightness]) {
        *((_DWORD *)v319 + 50) = *(_DWORD *)(*((void *)v319 + 34) + 104);
      }
      LODWORD(v39) = *((_DWORD *)v319 + 63);
      uint64_t v40 = *((void *)v319 + 34);
      unint64_t v306 = 0x1E9F45000uLL;
      [*(id *)(v40 + 48) setCurrentNits:v39];
      LODWORD(v41) = *(_DWORD *)(*((void *)v319 + 34) + 144);
      [*(id *)(*((void *)v319 + 34) + 48) setCurrentEDRHeadroom:v41];
      if (![+[CBAODState sharedInstance] isAODActive])
      {
        LODWORD(v42) = *((_DWORD *)v319 + 63);
        uint64_t v43 = *((void *)v319 + 34);
        unint64_t v304 = 0x1E9F45000uLL;
        [*(id *)(v43 + 56) setNits:v42];
        LODWORD(v44) = *((_DWORD *)v319 + 63);
        uint64_t v45 = *((void *)v319 + 34);
        unint64_t v305 = 0x1E9F45000uLL;
        [*(id *)(v45 + 64) setNits:v44];
        [*(id *)(*((void *)v319 + 34) + 56) updateRamp];
        [*(id *)(*((void *)v319 + 34) + 64) updateRamp];
      }
      if (![+[CBAODState sharedInstance] isAODActive])
      {
        uint64_t v47 = *((void *)v319 + 34);
        unint64_t v303 = 0x1E9F45000uLL;
        LODWORD(v46) = *((_DWORD *)v319 + 63);
        [*(id *)(v47 + 72) setSdrBrightness:v46];
        [*(id *)(*((void *)v319 + 34) + 72) updateRamp];
      }
      LODWORD(v46) = *(_DWORD *)(*((void *)v319 + 34) + 144);
      [*(id *)(*((void *)v319 + 34) + 136) setCurrentHeadroom:v46];
      char v48 = v319;
      *((_DWORD *)v319 + 49) = 0;
      if (*(unsigned char *)(*((void *)v48 + 34) + 152))
      {
        *((_DWORD *)v319 + 49) = *((_DWORD *)v319 + 61);
      }
      else if ([*((id *)v319 + 34) shouldForceCapRamp])
      {
        id v49 = v319;
        *(float *)(*((void *)v319 + 34) + 116) = fminf((float)(*(float *)(*((void *)v319 + 34) + 108)* *(float *)(*((void *)v319 + 34) + 144))* *(float *)(*((void *)v319 + 34) + 180), *((float *)v319 + 50));
        *((_DWORD *)v49 + 49) = *(_DWORD *)(*((void *)v49 + 34) + 116);
        DisplayClockCapRamp(*(void *)(*((void *)v49 + 34) + 280));
        *(unsigned char *)(*((void *)v319 + 34) + 120) = 1;
      }
      else if (*(unsigned char *)(*((void *)v319 + 34) + 120))
      {
        if ((float)(*(float *)(*((void *)v319 + 34) + 116) - 10.0) <= *(float *)(*((void *)v319 + 34) + 112)
          || *(void *)(*((void *)v319 + 34) + 168) == 1)
        {
          DisplayStopCapRamp(*(void *)(*((void *)v319 + 34) + 280));
          CFNumberRef v50 = v319;
          *((float *)v319 + 49) = fmaxf(*(float *)(*((void *)v319 + 34) + 112), *(float *)(*((void *)v319 + 34) + 116) - 10.0);
          *(unsigned char *)(*((void *)v50 + 34) + 120) = 0;
        }
        else
        {
          int v51 = v319;
          *((float *)v319 + 49) = *(float *)(*((void *)v319 + 34) + 116) - 10.0;
          *(float *)(*((void *)v51 + 34) + 116) = *(float *)(*((void *)v51 + 34) + 116) - 10.0;
        }
      }
      else
      {
        *((float *)v319 + 49) = fminf(*((float *)v319 + 61), fmaxf(*(float *)(*((void *)v319 + 34) + 112), fminf((float)(*(float *)(*((void *)v319 + 34) + 108)* *(float *)(*((void *)v319 + 34) + 144))* *(float *)(*((void *)v319 + 34) + 180), *((float *)v319 + 50))));
      }
      if ([*(id *)(*((void *)v319 + 34) + 288) rtplc])
      {
        v53 = v319;
        *((_DWORD *)v319 + 48) = 0;
        *((float *)v53 + 48) = (float)(*(float *)(*((void *)v53 + 34) + 108)
                                     * *(float *)(*((void *)v53 + 34) + 144))
                             * *(float *)(*((void *)v53 + 34) + 180);
        *((_DWORD *)v53 + 47) = 0;
        *((float *)v53 + 47) = *((float *)v53 + 48) / *(float *)(*((void *)v53 + 34) + 108);
        if (*(void *)(*((void *)v53 + 34) + 224) == 2)
        {
          os_log_type_t v54 = v319;
          *((void *)v319 + 22) = 0;
          if (*(void *)(*((void *)v54 + 34) + 16))
          {
            uint64_t v302 = *(void *)(*((void *)v319 + 34) + 16);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v301 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v301 = init_default_corebrightness_log();
            }
            uint64_t v302 = v301;
          }
          v55 = v319;
          *((void *)v319 + 22) = v302;
          os_log_type_t v352 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(*((os_log_t *)v55 + 22), OS_LOG_TYPE_DEBUG))
          {
            os_log_t v298 = (os_log_t)*((void *)v319 + 22);
            *(_DWORD *)v299 = v352;
            *(double *)&uint64_t v56 = *((float *)v319 + 48);
            *(double *)&uint64_t v57 = *((float *)v319 + 47);
            *(double *)&uint64_t v58 = *((float *)v319 + 62);
            *(double *)&uint64_t v59 = *(float *)(*((void *)v319 + 34) + 148);
            *(double *)&uint64_t v60 = *(float *)(*((void *)v319 + 34) + 216);
            v300 = v368;
            __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v368, v56, v57, v58, v59, v60);
            _os_log_debug_impl(&dword_1BA438000, v298, v299[0], "HDR RTPLC RECOVERY: hdrBrightness = %f, hdrHeadroom = %f, currentHeadroom = %f, _requestedHeadroom = %f, rtplcCap = %f", v368, 0x34u);
          }
          if (*((float *)v319 + 48) < *(float *)(*((void *)v319 + 34) + 100))
          {
            if (*((float *)v319 + 47) >= *(float *)(*((void *)v319 + 34) + 148)
              && *((float *)v319 + 48) < *(float *)(*((void *)v319 + 34) + 216)
              && *((float *)v319 + 62) <= *((float *)v319 + 47))
            {
              int v63 = v319;
              *((void *)v319 + 18) = 0;
              if (*(void *)(*((void *)v63 + 34) + 16))
              {
                uint64_t v292 = *(void *)(*((void *)v319 + 34) + 16);
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t v291 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t v291 = init_default_corebrightness_log();
                }
                uint64_t v292 = v291;
              }
              os_log_type_t v64 = v319;
              *((void *)v319 + 18) = v292;
              os_log_type_t v349 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(*((os_log_t *)v64 + 18), OS_LOG_TYPE_DEFAULT))
              {
                os_log_t v288 = (os_log_t)*((void *)v319 + 18);
                *(_DWORD *)v289 = v349;
                *(double *)&uint64_t v65 = *(float *)(*((void *)v319 + 34) + 216);
                *(double *)&uint64_t v66 = *(float *)(*((void *)v319 + 34) + 100);
                v290 = v367;
                __os_log_helper_16_0_2_8_0_8_0((uint64_t)v367, v65, v66);
                _os_log_impl(&dword_1BA438000, v288, v289[0], "HDR RTPLC RECOVERY COMPLETE -> EXITING RTPLC: ramp cap: %f --> %f", v367, 0x16u);
              }
              [*((id *)v319 + 34) deleteAPCEMonitor];
              os_log_t v67 = v319;
              *(void *)(*((void *)v319 + 34) + 224) = 3;
              DisplayStartRTPLCEDRCapRamp(*(void *)(*((void *)v67 + 34) + 280), 0, *(float *)(*((void *)v67 + 34) + 216), *(float *)(*((void *)v67 + 34) + 100), 4.0);
            }
          }
          else
          {
            id v61 = v319;
            *(_DWORD *)(*((void *)v319 + 34) + 216) = *(_DWORD *)(*((void *)v319 + 34) + 100);
            *(void *)(*((void *)v61 + 34) + 224) = 0;
            *((void *)v61 + 20) = 0;
            if (*(void *)(*((void *)v61 + 34) + 16))
            {
              uint64_t v297 = *(void *)(*((void *)v319 + 34) + 16);
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT) {
                uint64_t v296 = _COREBRIGHTNESS_LOG_DEFAULT;
              }
              else {
                uint64_t v296 = init_default_corebrightness_log();
              }
              uint64_t v297 = v296;
            }
            id v62 = v319;
            *((void *)v319 + 20) = v297;
            os_log_type_t v351 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(*((os_log_t *)v62 + 20), OS_LOG_TYPE_DEFAULT))
            {
              os_log_t v293 = (os_log_t)*((void *)v319 + 20);
              *(_DWORD *)v294 = v351;
              v295 = v350;
              __os_log_helper_16_0_0(v350);
              _os_log_impl(&dword_1BA438000, v293, v294[0], "HDR RTPLC RECOVERY COMPLETE!!", v350, 2u);
            }
            [*((id *)v319 + 34) deleteAPCEMonitor];
          }
        }
        else if (*(void *)(*((void *)v319 + 34) + 224) == 1)
        {
          BOOL v68 = v319;
          *((void *)v319 + 16) = 0;
          if (*(void *)(*((void *)v68 + 34) + 16))
          {
            uint64_t v287 = *(void *)(*((void *)v319 + 34) + 16);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v286 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v286 = init_default_corebrightness_log();
            }
            uint64_t v287 = v286;
          }
          id v69 = v319;
          *((void *)v319 + 16) = v287;
          os_log_type_t v348 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(*((os_log_t *)v69 + 16), OS_LOG_TYPE_DEBUG))
          {
            os_log_t v283 = (os_log_t)*((void *)v319 + 16);
            *(_DWORD *)v284 = v348;
            *(double *)&uint64_t v70 = *((float *)v319 + 48);
            *(double *)&uint64_t v71 = *(float *)(*((void *)v319 + 34) + 216);
            *(double *)&uint64_t v72 = *((float *)v319 + 47);
            *(double *)&uint64_t v73 = *((float *)v319 + 62);
            *(double *)&uint64_t v74 = *(float *)(*((void *)v319 + 34) + 148);
            v285 = v366;
            __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v366, v70, v71, v72, v73, v74);
            _os_log_debug_impl(&dword_1BA438000, v283, v284[0], "HDR RTPLC ACTION: hdrBrightness = %f, rtplcCap = %f, hdrHeadroom = %f, currentHeadroom = %f, _requestedHeadroom = %f", v366, 0x34u);
          }
          if (float_equal(*(float *)(*((void *)v319 + 34) + 148), 1.0)
            && *((float *)v319 + 48) < *(float *)(*((void *)v319 + 34) + 216))
          {
            v75 = v319;
            *(unsigned char *)(*((void *)v319 + 34) + 208) = 0;
            *((void *)v75 + 14) = 0;
            if (*(void *)(*((void *)v75 + 34) + 16))
            {
              uint64_t v282 = *(void *)(*((void *)v319 + 34) + 16);
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT) {
                uint64_t v281 = _COREBRIGHTNESS_LOG_DEFAULT;
              }
              else {
                uint64_t v281 = init_default_corebrightness_log();
              }
              uint64_t v282 = v281;
            }
            v76 = v319;
            *((void *)v319 + 14) = v282;
            os_log_type_t v347 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(*((os_log_t *)v76 + 14), OS_LOG_TYPE_DEFAULT))
            {
              os_log_t v278 = (os_log_t)*((void *)v319 + 14);
              *(_DWORD *)v279 = v347;
              *(double *)&uint64_t v77 = *(float *)(*((void *)v319 + 34) + 216);
              *(double *)&uint64_t v78 = *(float *)(*((void *)v319 + 34) + 100);
              v280 = v365;
              __os_log_helper_16_0_2_8_0_8_0((uint64_t)v365, v77, v78);
              _os_log_impl(&dword_1BA438000, v278, v279[0], "HDR RTPLC RELEASED AND RECOVERY COMPLETE -> EXITING RTPLC: ramp cap: %f --> %f", v365, 0x16u);
            }
            [*((id *)v319 + 34) deleteAPCEMonitor];
            v79 = v319;
            *(void *)(*((void *)v319 + 34) + 224) = 3;
            DisplayStartRTPLCEDRCapRamp(*(void *)(*((void *)v79 + 34) + 280), 0, *(float *)(*((void *)v79 + 34) + 216), *(float *)(*((void *)v79 + 34) + 100), 4.0);
          }
        }
        else if (*(void *)(*((void *)v319 + 34) + 224) == 3)
        {
          v80 = v319;
          *((void *)v319 + 12) = 0;
          if (*(void *)(*((void *)v80 + 34) + 16))
          {
            uint64_t v277 = *(void *)(*((void *)v319 + 34) + 16);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v276 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v276 = init_default_corebrightness_log();
            }
            uint64_t v277 = v276;
          }
          v81 = v319;
          *((void *)v319 + 12) = v277;
          os_log_type_t v346 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(*((os_log_t *)v81 + 12), OS_LOG_TYPE_DEBUG))
          {
            os_log_t v273 = (os_log_t)*((void *)v319 + 12);
            *(_DWORD *)v274 = v346;
            *(double *)&uint64_t v82 = *(float *)(*((void *)v319 + 34) + 216);
            *(double *)&uint64_t v83 = *(float *)(*((void *)v319 + 34) + 100);
            v275 = v364;
            __os_log_helper_16_0_2_8_0_8_0((uint64_t)v364, v82, v83);
            _os_log_debug_impl(&dword_1BA438000, v273, v274[0], "HDR RTPLC EXIT: _rtplcCap = %f (_maxNitsEDR = %f)", v364, 0x16u);
          }
          if (float_equal(*(float *)(*((void *)v319 + 34) + 216), *(float *)(*((void *)v319 + 34) + 100)))
          {
            v84 = v319;
            *((void *)v319 + 10) = 0;
            if (*(void *)(*((void *)v84 + 34) + 16))
            {
              uint64_t v272 = *(void *)(*((void *)v319 + 34) + 16);
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT) {
                uint64_t v271 = _COREBRIGHTNESS_LOG_DEFAULT;
              }
              else {
                uint64_t v271 = init_default_corebrightness_log();
              }
              uint64_t v272 = v271;
            }
            v85 = v319;
            *((void *)v319 + 10) = v272;
            os_log_type_t v345 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(*((os_log_t *)v85 + 10), OS_LOG_TYPE_DEFAULT))
            {
              os_log_t v268 = (os_log_t)*((void *)v319 + 10);
              *(_DWORD *)v269 = v345;
              v270 = v344;
              __os_log_helper_16_0_0(v344);
              _os_log_impl(&dword_1BA438000, v268, v269[0], "RTPLC EXIT COMPLETE!!", v344, 2u);
            }
            *(void *)(*((void *)v319 + 34) + 224) = 0;
          }
        }
        if (float_equal(*(float *)(*((void *)v319 + 34) + 144), 1.0))
        {
          v86 = v319;
          *(_DWORD *)(*((void *)v319 + 34) + 216) = *(_DWORD *)(*((void *)v319 + 34) + 100);
          *(void *)(*((void *)v86 + 34) + 224) = 0;
        }
      }
      LODWORD(v52) = *((_DWORD *)v319 + 62);
      [*((id *)v319 + 34) updateEDRStateForEvent:4 andHeadroom:v52];
      if (![+[CBAODState sharedInstance] isAODActive])
      {
        v87 = v319;
        *((void *)v319 + 8) = 0;
        if (*(void *)(*((void *)v87 + 34) + 16))
        {
          uint64_t v267 = *(void *)(*((void *)v319 + 34) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v266 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v266 = init_default_corebrightness_log();
          }
          uint64_t v267 = v266;
        }
        uint64_t v88 = v319;
        *((void *)v319 + 8) = v267;
        os_log_type_t v343 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(*((os_log_t *)v88 + 8), OS_LOG_TYPE_DEFAULT))
        {
          os_log_t v263 = (os_log_t)*((void *)v319 + 8);
          *(_DWORD *)v264 = v343;
          *(double *)&uint64_t v257 = *((float *)v319 + 63);
          uint64_t v89 = *((void *)v319 + 34);
          unint64_t v256 = 0x1E9F45000uLL;
          *(double *)&uint64_t v258 = *(float *)(v89 + 144);
          *(double *)&uint64_t v259 = *((float *)v319 + 49);
          [*(id *)(*((void *)v319 + 34) + 128) maxHeadroom];
          *(double *)&uint64_t v260 = v90;
          *(double *)&uint64_t v261 = *(float *)(*((void *)v319 + 34) + 32);
          *(double *)&uint64_t v262 = (float)(*((float *)v319 + 63) * *(float *)(*((void *)v319 + 34) + 144));
          uint64_t v91 = [*((id *)v319 + 34) rtplcStateToString:*(void *)(*((void *)v319 + 34) + 224)];
          *(double *)v200 = *(float *)(*((void *)v319 + 34) + 216);
          v265 = v363;
          __os_log_helper_16_2_8_8_0_8_0_8_0_8_0_8_0_8_0_8_32_8_0((uint64_t)v363, v257, v258, v259, v260, v261, v262, v91, v200[0]);
          _os_log_impl(&dword_1BA438000, v263, v264[0], "Pushing sdrBrightness: %f, capped _appliedHeadroom: %f, brightnessLimit: %f, potentialHeadroom: %f, Ambient: %f to CA, HDRBrightness: %f, [%s] rtplcCap: %f", v363, 0x52u);
        }
        v92 = v319;
        *((void *)v319 + 6) = 0;
        v93 = (void *)(*((void *)v92 + 34) + 232);
        uint64_t v94 = (*v93)++;
        *((void *)v92 + 6) = v94;
        *((_DWORD *)v92 + 11) = 0;
        *((_DWORD *)v92 + 11) = 2143289344;
        uint64_t v255 = [*((id *)v92 + 32) objectForKey:@"ContrastEnhancerStrength"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend((id)objc_msgSend(*((id *)v319 + 32), "objectForKey:", @"ContrastEnhancerStrength"), "floatValue");
          *((_DWORD *)v319 + 11) = v95;
        }
        v96 = v319;
        *((_DWORD *)v319 + 10) = 0;
        *((_DWORD *)v96 + 10) = 2143289344;
        if (*(void *)(*((void *)v96 + 34) + 56))
        {
          [*(id *)(*((void *)v319 + 34) + 56) currentStrength];
          *((_DWORD *)v319 + 10) = v97;
        }
        v98 = v319;
        *((_DWORD *)v319 + 9) = 0;
        *((_DWORD *)v98 + 9) = 2143289344;
        if (*(void *)(*((void *)v98 + 34) + 64))
        {
          [*(id *)(*((void *)v319 + 34) + 64) currentStrength];
          *((_DWORD *)v319 + 9) = v99;
        }
        v100 = v319;
        *((_DWORD *)v319 + 8) = 0;
        *((_DWORD *)v100 + 8) = 2143289344;
        if (*(void *)(*((void *)v100 + 34) + 72)
          && (CBU_IsSecureIndicatorSupported() & 1) != 0
          && ([*(id *)(*((void *)v319 + 34) + 72) shouldPushIndicatorBrightness] & 1) != 0)
        {
          [*(id *)(*((void *)v319 + 34) + 72) currentIndicatorBrightness];
          *((_DWORD *)v319 + 8) = v101;
        }
        v102 = v319;
        *((_DWORD *)v319 + 7) = 0;
        *((float *)v102 + 7) = fmaxf(*((float *)v102 + 8), *((float *)v102 + 49));
        *((void *)v102 + 2) = 0;
        if (*(void *)(*((void *)v102 + 34) + 16))
        {
          uint64_t v254 = *(void *)(*((void *)v319 + 34) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v253 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v253 = init_default_corebrightness_log();
          }
          uint64_t v254 = v253;
        }
        v103 = v319;
        *((void *)v319 + 2) = v254;
        os_log_type_t v342 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(*((os_log_t *)v103 + 2), OS_LOG_TYPE_DEFAULT))
        {
          os_log_t v250 = (os_log_t)*((void *)v319 + 2);
          *(_DWORD *)v251 = v342;
          uint64_t v242 = *((void *)v319 + 6);
          *(double *)&uint64_t v243 = *((float *)v319 + 63);
          uint64_t v105 = *((void *)v319 + 34);
          float v106 = *(float *)(v105 + 108);
          unint64_t v229 = 0x1E9F45000uLL;
          *(double *)&uint64_t v244 = (float)(v106 * *(float *)(v105 + 144));
          uint64_t v245 = [*((id *)v319 + 34) edrStateToString:*(void *)(*((void *)v319 + 34) + 168)];
          *(double *)&uint64_t v246 = *((float *)v319 + 49);
          *(double *)&uint64_t v247 = *((float *)v319 + 8);
          *(double *)&uint64_t v248 = *((float *)v319 + 7);
          *(double *)&uint64_t v233 = *(float *)(*((void *)v319 + 34) + 144);
          [*(id *)(*((void *)v319 + 34) + 128) maxHeadroom];
          *(double *)&uint64_t v234 = v107;
          *(double *)&uint64_t v235 = *(float *)(*((void *)v319 + 34) + 180);
          uint64_t v108 = *((void *)v319 + 34);
          unint64_t v230 = 0x1E9F45000uLL;
          [*(id *)(v108 + 48) currentScaler];
          *(double *)&uint64_t v236 = v109;
          char v110 = [*(id *)(*((void *)v319 + 34) + 48) rampInProgress];
          v231 = "NO";
          v111 = "YES";
          v232 = "YES";
          if ((v110 & 1) == 0) {
            v111 = "NO";
          }
          v237 = v111;
          *(double *)&uint64_t v238 = *(float *)(*((void *)v319 + 34) + 32);
          uint64_t v112 = [*((id *)v319 + 34) rtplcStateToString:*(void *)(*((void *)v319 + 34) + 224)];
          uint64_t v113 = (uint64_t)v232;
          uint64_t v239 = v112;
          *(double *)&uint64_t v240 = *(float *)(*((void *)v319 + 34) + 216);
          if ((*(unsigned char *)(*((void *)v319 + 34) + 208) & 1) == 0) {
            uint64_t v113 = (uint64_t)v231;
          }
          uint64_t v241 = v113;
          [*(id *)(*((void *)v319 + 34) + 248) getPeakAPCE];
          *(double *)&uint64_t v114 = *((float *)v319 + 61);
          *(double *)&uint64_t v115 = *(float *)(*((void *)v319 + 34) + 112);
          *(double *)&uint64_t v116 = *((float *)v319 + 10);
          *(double *)&uint64_t v117 = *((float *)v319 + 9);
          *(double *)&uint64_t v118 = *((float *)v319 + 11);
          v249 = v200;
          v252 = v362;
          __os_log_helper_16_2_22_8_0_8_0_8_0_8_32_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_32_8_0_8_32_8_0_8_32_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v362, v242, v243, v244, v245, v246, v247, v248, v233, v234, v235, v236, (uint64_t)v237, v238, v239, v240, v241, COERCE__INT64(v119), v114,
            v115,
            v116,
            v117,
            v118);
          _os_log_impl(&dword_1BA438000, v250, v251[0], "SyncDBV Transaction | ID=%llu SDR.Nits=%.0f HDR.Nits=%.0f HDR.State=%s BrightnessLimit=%f IndicatorBrightness.Nits=%.0f IndicatorBrightness.Cap=%.0f Headroom.Current=%f Headroom.Maximum=%f AppliedCompensations=%f Aurora.Factor=%f Aurora.RampInProgress=%s Lux=%.0f RTPLC.State=%s RTPLC.Cap=%.0f RTPLC.CapApplied=%s PeakAPCE.Cap=%f Nits.Cap=%f DynamicSlider.Cap=%f Twilight.Strength=%f Ammolite.Strength=%f ContrastEnhancer.Strength=%f", v252, 0xDEu);
        }
        uint64_t v120 = *((void *)v319 + 34);
        unint64_t v228 = 0x1E9F45000uLL;
        LODWORD(v104) = *((_DWORD *)v319 + 63);
        [*(id *)(v120 + 40) setSDRBrightness:v104];
        id v227 = *(id *)(*((void *)v319 + 34) + *(int *)(v228 + 3960));
        [*(id *)(*((void *)v319 + 34) + 128) maxHeadroom];
        objc_msgSend(v227, "setPotentialHeadroom:");
        LODWORD(v121) = *(_DWORD *)(*((void *)v319 + 34) + 144);
        [*(id *)(*((void *)v319 + 34) + *(int *)(v228 + 3960)) setHeadroom:v121];
        LODWORD(v122) = *(_DWORD *)(*((void *)v319 + 34) + 32);
        [*(id *)(*((void *)v319 + 34) + *(int *)(v228 + 3960)) setAmbient:v122];
        LODWORD(v123) = *((_DWORD *)v319 + 49);
        [*(id *)(*((void *)v319 + 34) + *(int *)(v228 + 3960)) setBrightnessLimit:v123];
        if ((std::__math::isnan[abi:ne180100]() & 1) == 0)
        {
          LODWORD(v124) = *((_DWORD *)v319 + 11);
          [*(id *)(*((void *)v319 + 34) + 40) setContrastEnhancer:v124];
        }
        if ((std::__math::isnan[abi:ne180100]() & 1) == 0)
        {
          LODWORD(v125) = *((_DWORD *)v319 + 10);
          [*(id *)(*((void *)v319 + 34) + 40) setLowAmbientAdaptation:v125];
        }
        if ((std::__math::isnan[abi:ne180100]() & 1) == 0)
        {
          LODWORD(v126) = *((_DWORD *)v319 + 9);
          [*(id *)(*((void *)v319 + 34) + 40) setHighAmbientAdaptation:v126];
        }
        if (std::__math::isnan[abi:ne180100]())
        {
          LODWORD(v127) = *((_DWORD *)v319 + 8);
          [*(id *)(*((void *)v319 + 34) + 40) setIndicatorBrightness:v127];
        }
        else
        {
          v128 = v319;
          *((_DWORD *)v319 + 2) = 0;
          *((_DWORD *)v128 + 2) = *((_DWORD *)v128 + 8);
          if (([*(id *)(*((void *)v128 + 34) + 72) allowIBUnderSDR] & 1) == 0)
          {
            *(float *)&double v129 = std::__math::fmax[abi:ne180100](*((float *)v319 + 2), *((float *)v319 + 63));
            *((_DWORD *)v319 + 2) = LODWORD(v129);
          }
          LODWORD(v129) = *((_DWORD *)v319 + 2);
          [*(id *)(*((void *)v319 + 34) + 40) setIndicatorBrightness:v129];
        }
        uint64_t v131 = *((void *)v319 + 34);
        unint64_t v217 = 0x1E9F45000uLL;
        LODWORD(v130) = *((_DWORD *)v319 + 7);
        uint64_t v132 = [*(id *)(v131 + 40) setIndicatorBrightnessLimit:v130];
        v133 = v319;
        v218 = v341;
        *(void *)v319 = 0;
        *(void *)v133 = 0;
        context = (void *)MEMORY[0x1BA9ECAE0](v132);
        id v215 = *(id *)(*((void *)v319 + 34) + 240);
        unint64_t v220 = 0x1E4F28000uLL;
        id v213 = (id)NSNumber;
        *(float *)&double v134 = mach_time_now_in_milliseconds();
        uint64_t v214 = [v213 numberWithFloat:v134];
        uint64_t v135 = [*(id *)(v220 + 3792) numberWithUnsignedLongLong:*((void *)v319 + 6)];
        [v215 setObject:v214 forKey:v135];
        char v340 = 0;
        v136 = *(void **)(*((void *)v319 + 34) + *(int *)(v217 + 3960));
        uint64_t v333 = MEMORY[0x1E4F143A8];
        int v334 = -1073741824;
        int v335 = 0;
        v336 = __52__CBDisplayModuleiOS_handleDisplayBrightnessUpdate___block_invoke;
        v337 = &unk_1E62191A0;
        uint64_t v338 = *((void *)v319 + 34);
        uint64_t v339 = *((void *)v319 + 6);
        char v137 = objc_msgSend(v136, "commitBrightness:withBlock:", v218);
        int v226 = 1;
        char v340 = v137 & 1;
        v138 = (void *)MEMORY[0x1BA9ECAE0]();
        unint64_t v139 = v220;
        v140 = v319;
        v225 = v138;
        uint64_t v332 = 0;
        v223 = &v360;
        *((void *)v319 + 39) = @"SDR.Nits";
        LODWORD(v141) = *((_DWORD *)v140 + 63);
        uint64_t v142 = [*(id *)(v139 + 3792) numberWithFloat:v141];
        unint64_t v143 = v220;
        v144 = v319;
        v222 = &v361;
        *((void *)v319 + 51) = v142;
        *((void *)v144 + 40) = @"HDR.Nits";
        v145 = *(void **)(v143 + 3792);
        float v146 = *(float *)(*((void *)v144 + 34) + 108);
        uint64_t v147 = *((void *)v144 + 34);
        unint64_t v219 = 0x1E9F45000uLL;
        *(float *)&double v148 = v146 * *(float *)(v147 + 144);
        uint64_t v149 = [v145 numberWithFloat:v148];
        unint64_t v150 = v219;
        unint64_t v151 = v220;
        v152 = v319;
        *((void *)v319 + 52) = v149;
        *((void *)v152 + 41) = @"HDR.Headroom";
        LODWORD(v153) = *(_DWORD *)(*((void *)v152 + 34) + *(int *)(v150 + 4032));
        uint64_t v154 = [*(id *)(v151 + 3792) numberWithFloat:v153];
        unint64_t v155 = v220;
        v156 = v319;
        *((void *)v319 + 53) = v154;
        *((void *)v156 + 42) = @"BrightnessLimit";
        LODWORD(v157) = *((_DWORD *)v156 + 49);
        uint64_t v158 = [*(id *)(v155 + 3792) numberWithFloat:v157];
        unint64_t v159 = v220;
        v160 = v319;
        *((void *)v319 + 54) = v158;
        *((void *)v160 + 43) = @"Lux";
        LODWORD(v161) = *(_DWORD *)(*((void *)v160 + 34) + 32);
        uint64_t v162 = [*(id *)(v159 + 3792) numberWithFloat:v161];
        unint64_t v163 = v220;
        v164 = v319;
        *((void *)v319 + 55) = v162;
        *((void *)v164 + 44) = @"Twilight.Strength";
        LODWORD(v165) = *((_DWORD *)v164 + 10);
        uint64_t v166 = [*(id *)(v163 + 3792) numberWithFloat:v165];
        unint64_t v167 = v220;
        v168 = v319;
        *((void *)v319 + 56) = v166;
        *((void *)v168 + 45) = @"Ammolite.Strength";
        LODWORD(v169) = *((_DWORD *)v168 + 9);
        uint64_t v170 = [*(id *)(v167 + 3792) numberWithFloat:v169];
        unint64_t v171 = v220;
        v172 = v319;
        *((void *)v319 + 57) = v170;
        *((void *)v172 + 46) = @"IndicatorBrightness.Nits";
        LODWORD(v173) = *((_DWORD *)v172 + 8);
        uint64_t v174 = [*(id *)(v171 + 3792) numberWithFloat:v173];
        unint64_t v175 = v220;
        v176 = v319;
        *((void *)v319 + 58) = v174;
        *((void *)v176 + 47) = @"IndicatorBrightness.Cap";
        LODWORD(v177) = *((_DWORD *)v176 + 7);
        uint64_t v178 = [*(id *)(v175 + 3792) numberWithFloat:v177];
        unint64_t v179 = v220;
        v180 = v319;
        *((void *)v319 + 59) = v178;
        *((void *)v180 + 48) = @"ContrastEnhancer.Strength";
        LODWORD(v181) = *((_DWORD *)v180 + 11);
        uint64_t v182 = [*(id *)(v179 + 3792) numberWithFloat:v181];
        unint64_t v183 = v220;
        v184 = v319;
        *((void *)v319 + 60) = v182;
        *((void *)v184 + 49) = @"Aurora.Factor";
        id v221 = *(id *)(v183 + 3792);
        [*(id *)(*((void *)v184 + 34) + 48) currentScaler];
        uint64_t v185 = objc_msgSend(v221, "numberWithFloat:");
        v186 = v222;
        v187 = v223;
        v188 = v319;
        *((void *)v319 + 61) = v185;
        *((void *)v188 + 50) = @"Result";
        v189 = @"Success";
        if ((v340 & 1) == 0) {
          v189 = @"Error";
        }
        *((void *)v188 + 62) = v189;
        uint64_t v332 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v186 forKeys:v187 count:12];
        uint64_t v190 = *(void *)(*((void *)v319 + 34) + 280);
        v224 = @"BrightnessTransaction";
        _DisplaySetInternalDictionaryProperty(v190, @"BrightnessTransaction", v332);
        [*((id *)v319 + 34) sendNotificationForKey:v224 withValue:v332];
        char v331 = 0;
        char v331 = (*((float *)v319 + 63) < 100.0) & v226;
        if ((*(unsigned char *)(*((void *)v319 + 34) + 272) & 1) != (v331 & 1))
        {
          v191 = v319;
          *(unsigned char *)(*((void *)v319 + 34) + 272) = v331 & 1;
          id v212 = (id)*((void *)v191 + 34);
          uint64_t v192 = [NSNumber numberWithBool:*(unsigned char *)(*((void *)v191 + 34) + 272) & 1];
          [v212 sendNotificationForKey:@"CBBrightnessIsUnderAutoDimThreshold" withValue:v192];
        }
        if (v340)
        {
          [*((id *)v319 + 34) sendNotificationForKey:@"CBCACommit" withValue:*((void *)v319 + 32)];
        }
        else
        {
          os_log_t oslog = 0;
          if (*(void *)(*((void *)v319 + 34) + 16))
          {
            os_log_t v211 = *(os_log_t *)(*((void *)v319 + 34) + 16);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              v210 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              v210 = init_default_corebrightness_log();
            }
            os_log_t v211 = v210;
          }
          os_log_t oslog = v211;
          os_log_type_t v329 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v211, OS_LOG_TYPE_ERROR))
          {
            os_log_t v207 = oslog;
            *(_DWORD *)v208 = v329;
            uint64_t v193 = *(void *)v319;
            v209 = v359;
            __os_log_helper_16_2_1_8_64((uint64_t)v359, v193);
            _os_log_error_impl(&dword_1BA438000, v207, v208[0], "ERROR COMMITING BRIGHTNESS FROM CA!!!!!!! (%@)", v209, 0xCu);
          }
        }
      }
      if (*(float *)(*((void *)v319 + 34) + 108) > 0.0)
      {
        uint64_t v194 = *((void *)v319 + 34);
        v204 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
        v195 = *(void **)(v194 + 264);
        uint64_t v323 = MEMORY[0x1E4F143A8];
        int v324 = -1073741824;
        int v325 = 0;
        v326 = __52__CBDisplayModuleiOS_handleDisplayBrightnessUpdate___block_invoke_290;
        v327 = &unk_1E62191C8;
        uint64_t v328 = *((void *)v319 + 34);
        objc_msgSend(v195, "enumerateObjectsUsingBlock:");

        v196 = v319;
        uint64_t v197 = *((void *)v319 + 34);
        uint64_t v198 = v204[1];
        uint64_t v206 = 0;
        *(void *)(v197 + v198) = 0;
        uint64_t v199 = *((void *)v196 + 34);
        v205 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;

        *(void *)(*((void *)v319 + 34) + v205[2]) = v206;
      }
    }
  }
}

- (const)rtplcStateToString:(unint64_t)a3
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
    return "Unknown";
  }
  switch(v4)
  {
    case 0uLL:
      int v6 = "None";
      break;
    case 1uLL:
      int v6 = "Action";
      break;
    case 2uLL:
      int v6 = "Recovery";
      break;
    case 3uLL:
      int v6 = "Exit";
      break;
    default:
      JUMPOUT(0);
  }
  return v6;
}

- (void)updateEDRStateForEvent:(unint64_t)a3 andHeadroom:(float)a4
{
  if (a3)
  {
    unint64_t v5 = a3;
    char v4 = 1;
  }
  else
  {
    unint64_t v5 = 0;
    char v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    switch(v5)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        self->_edrState = 1;
        break;
      case 3uLL:
        if (self->_edrState == 1 || self->_edrState == 2) {
          self->_edrState = 3;
        }
        break;
      case 4uLL:
        if (self->_edrState == 1 && float_equal(a4, self->_requestedHeadroom))
        {
          self->_edrState = 2;
        }
        else if (self->_edrState == 3 && float_equal(a4, self->_requestedHeadroom))
        {
          self->_edrState = 0;
        }
        break;
      default:
        JUMPOUT(0);
    }
  }
}

- (const)edrStateToString:(unint64_t)a3
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
    return "Unknown";
  }
  switch(v4)
  {
    case 0uLL:
      int v6 = "Off";
      break;
    case 1uLL:
      int v6 = "Entering";
      break;
    case 2uLL:
      int v6 = "Engaged";
      break;
    case 3uLL:
      int v6 = "Exiting";
      break;
    default:
      JUMPOUT(0);
  }
  return v6;
}

void __52__CBDisplayModuleiOS_handleDisplayBrightnessUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = a1;
  id v15 = a2;
  uint64_t v14 = a1;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  id v2 = v15;
  char v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  uint64_t block = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __52__CBDisplayModuleiOS_handleDisplayBrightnessUpdate___block_invoke_2;
  int v10 = &unk_1E6219178;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  id v12 = v15;
  dispatch_async(v3, &block);
}

- (void)updateBDMWithLux:(float)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_displayRequiresBDM
    && !self->_referenceModeIsActive
    && [(CBDisplayModuleiOS *)self luxHasCrossedBDMThreshold:*(double *)&a3])
  {
    DisplaySetCurrentEDRHeadroom((uint64_t)self->_displayInternal, self->_appliedHeadroom);
    [(CBEDR *)self->_edr secondsPerStop];
    int v11 = v3;
    *(float *)&double v4 = self->_appliedHeadroom;
    *(float *)&double v5 = self->_requestedHeadroom;
    LODWORD(v6) = v11;
    +[CBEDR overallRampDuration:v4 target:v5 durationPerStop:v6];
    float v10 = v7;
    if (self->super.super._logHandle)
    {
      logHandle = self->super.super._logHandle;
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
      __os_log_helper_16_0_1_8_0((uint64_t)v13, COERCE__INT64(v10));
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "Starting SBD (BDM) EDR ramp over %f seconds", v13, 0xCu);
    }
    DisplayStartFastEDRRamp((uint64_t)self->_displayInternal, self->_requestedHeadroom, v10);
  }
}

- (BOOL)luxHasCrossedBDMThreshold:(float)a3
{
  BOOL v8 = 0;
  if (self->_bdmLux1 <= a3) {
    BOOL v8 = a3 <= self->_bdmLux2;
  }
  BOOL v7 = 0;
  if (self->_lastBDMLux > self->_bdmLux1) {
    BOOL v7 = a3 < self->_bdmLux1;
  }
  BOOL v6 = 0;
  if (self->_lastBDMLux < self->_bdmLux2) {
    BOOL v6 = a3 > self->_bdmLux2;
  }
  char v5 = 0;
  if (a3 != self->_lastBDMLux)
  {
    char v4 = 1;
    if (!v8)
    {
      char v4 = 1;
      if (!v7) {
        char v4 = v6;
      }
    }
    char v5 = v4;
  }
  self->_lastBDMLux = a3;
  return v5 & 1;
}

- (BOOL)shouldForceCapRamp
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  float v8 = -(float)(self->_dynSliderCap - (float)((float)(self->_nitsSDR * self->_appliedHeadroom) * self->_appliedComp));
  BOOL v7 = 0;
  if (self->_appliedComp > 1.0)
  {
    BOOL v7 = 0;
    if (self->_edrState == 3)
    {
      BOOL v7 = 0;
      if (float_equal(self->_appliedHeadroom, self->_requestedHeadroom))
      {
        BOOL v6 = 1;
        if (!float_equal(self->_dynSliderCap, self->_nitsSDR)) {
          BOOL v6 = v8 >= 30.0;
        }
        BOOL v7 = v6;
      }
    }
  }
  if (self->super.super._logHandle)
  {
    logHandle = self->super.super._logHandle;
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
      id v2 = "YES";
    }
    else {
      id v2 = "NO";
    }
    __os_log_helper_16_2_2_8_0_8_32((uint64_t)v10, self->_edrState, (uint64_t)v2);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "HDR | _edrState: %lu, forceRamp: %s", v10, 0x16u);
  }
  return v7;
}

uint64_t __42__CBDisplayModuleiOS_addHIDServiceClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToProtocol:&unk_1F141A9C8];
  if (result)
  {
    uint64_t result = [a2 addHIDServiceClient:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24) & 1 | result & 1) != 0;
  }
  return result;
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  id v12 = self;
  SEL v11 = a2;
  float v10 = a3;
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  int v7 = 0x20000000;
  int v8 = 32;
  char v9 = 0;
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_subModules, "enumerateObjectsUsingBlock:");
  char v4 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v4 & 1;
}

- (CBDisplayModuleiOS)initWithBacklight:(unsigned int)a3 queue:(id)a4 display:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v55 = self;
  SEL v54 = a2;
  unsigned int v53 = a3;
  id v52 = a4;
  id v51 = a5;
  if (!a4 || !v53)
  {
    CFNumberRef v50 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    CFNumberRef v50 = inited;
    char v49 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = v50;
      os_log_type_t v31 = v49;
      __os_log_helper_16_0_0(v48);
      _os_log_error_impl(&dword_1BA438000, v30, v31, "invalid arguments", v48, 2u);
    }
LABEL_60:

    id v55 = 0;
    return 0;
  }
  v47.receiver = v55;
  v47.super_class = (Class)CBDisplayModuleiOS;
  id v55 = [(CBModule *)&v47 initWithQueue:v52];
  if (v55)
  {
    *((unsigned char *)v55 + 272) = 0;
    *((unsigned char *)v55 + 176) = 1;
    *((unsigned char *)v55 + 186) = 0;
    *((unsigned char *)v55 + 185) = 0;
    if (v51)
    {
      context = (void *)MEMORY[0x1BA9ECAE0]();
      os_log_t v5 = os_log_create("com.apple.CoreBrightness.ARMDisplay", (const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v51, "displayId")), "UTF8String"));
      *((void *)v55 + 2) = v5;
    }
    else
    {
      os_log_t v6 = os_log_create("com.apple.CoreBrightness.ARMDisplay", "default");
      *((void *)v55 + 2) = v6;
    }
    if (!*((void *)v55 + 2))
    {
      double v46 = 0;
      uint64_t v28 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      double v46 = v28;
      char v45 = 16;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        os_log_t log = v46;
        os_log_type_t type = v45;
        __os_log_helper_16_0_0(v44);
        _os_log_error_impl(&dword_1BA438000, log, type, "failed to create log handle", v44, 2u);
      }
    }
    if (v51)
    {
      os_log_t v43 = 0;
      if (*((void *)v55 + 2))
      {
        uint64_t v25 = *((void *)v55 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v24 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v24 = init_default_corebrightness_log();
        }
        uint64_t v25 = v24;
      }
      os_log_t v43 = v25;
      os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v57, [v51 displayId]);
        _os_log_impl(&dword_1BA438000, v43, v42, "create display with display ID (%u)", v57, 8u);
      }
      uint64_t v23 = *MEMORY[0x1E4F1CF80];
      unsigned int v22 = v53;
      [v51 displayId];
      CFTypeRef v7 = DisplayCreateWithID(v23, v22, 0);
      *((void *)v55 + 35) = v7;
    }
    else
    {
      double v41 = 0;
      if (*((void *)v55 + 2))
      {
        double v21 = *((void *)v55 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v20 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v20 = init_default_corebrightness_log();
        }
        double v21 = v20;
      }
      double v41 = v21;
      os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = v41;
        os_log_type_t v19 = v40;
        __os_log_helper_16_0_0(v39);
        _os_log_impl(&dword_1BA438000, v18, v19, "create display without display ID", v39, 2u);
      }
      CFTypeRef v8 = DisplayCreate(*MEMORY[0x1E4F1CF80], v53, 0);
      *((void *)v55 + 35) = v8;
    }
    if (!*((void *)v55 + 35))
    {
      int v38 = 0;
      if (*((void *)v55 + 2))
      {
        uint64_t v17 = *((void *)v55 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v16 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v16 = init_default_corebrightness_log();
        }
        uint64_t v17 = v16;
      }
      int v38 = v17;
      char v37 = 16;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = v38;
        os_log_type_t v15 = v37;
        __os_log_helper_16_0_0(v36);
        _os_log_error_impl(&dword_1BA438000, v14, v15, "failed to create DisplayRef", v36, 2u);
      }
      goto LABEL_60;
    }
    if (!DisplayOpen(*((char **)v55 + 35), (uint64_t)DisplayRefPropertyChangedCallback, (uint64_t)v55))
    {
      uint64_t v35 = 0;
      if (*((void *)v55 + 2))
      {
        uint64_t v13 = *((void *)v55 + 2);
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
      uint64_t v35 = v13;
      char v34 = 16;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        float v10 = v35;
        os_log_type_t v11 = v34;
        __os_log_helper_16_0_0(v33);
        _os_log_error_impl(&dword_1BA438000, v10, v11, "failed to open the DisplayRef", v33, 2u);
      }
      goto LABEL_60;
    }
    DisplaySetProperty(*((void *)v55 + 35), @"DisplayBrightnessAuto", *MEMORY[0x1E4F1CFC8]);
    *((void *)v55 + 5) = 0;
  }
  return (CBDisplayModuleiOS *)v55;
}

- (CBDisplayModuleiOS)initWithBacklight:(unsigned int)a3 queue:(id)a4 brtCtl:(id)a5
{
  id v82 = self;
  SEL v81 = a2;
  unsigned int v80 = a3;
  id v79 = a4;
  id v78 = a5;
  if (!a4 || !v80)
  {
    uint64_t v77 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    uint64_t v77 = inited;
    char v76 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      os_log_t log = v77;
      os_log_type_t type = v76;
      __os_log_helper_16_0_0(v75);
      _os_log_error_impl(&dword_1BA438000, log, type, "invalid arguments", v75, 2u);
    }
LABEL_48:

    id v82 = 0;
    return 0;
  }
  v74.receiver = v82;
  v74.super_class = (Class)CBDisplayModuleiOS;
  id v82 = [(CBModule *)&v74 initWithQueue:v79];
  if (v82)
  {
    *((unsigned char *)v82 + 272) = 0;
    *((unsigned char *)v82 + 176) = 1;
    *((unsigned char *)v82 + 186) = 0;
    *((unsigned char *)v82 + 185) = 0;
    id v5 = v78;
    *((void *)v82 + 5) = v5;
    *((void *)v82 + 29) = 0;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v82 + 30) = v6;
    id v73 = 0;
    id v38 = [NSString alloc];
    uint64_t v37 = objc_msgSend((id)objc_msgSend(v82, "className"), "cStringUsingEncoding:");
    id v73 = (id)objc_msgSend(v38, "initWithFormat:", @"%s.%s.%u", "com.apple.CoreBrightness", v37, objc_msgSend(*((id *)v82 + 5), "getDisplayId"));
    os_log_t v7 = os_log_create((const char *)[v73 cStringUsingEncoding:1], "default");
    *((void *)v82 + 2) = v7;
    if (!*((void *)v82 + 2))
    {
      uint64_t v72 = 0;
      double v36 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      uint64_t v72 = v36;
      char v71 = 16;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        char v34 = v72;
        os_log_type_t v35 = v71;
        __os_log_helper_16_0_0(v70);
        _os_log_error_impl(&dword_1BA438000, v34, v35, "failed to create log handle", v70, 2u);
      }
    }

    CFTypeRef v8 = DisplayCreate(*MEMORY[0x1E4F1CF80], v80, 0);
    *((void *)v82 + 35) = v8;
    if (!*((void *)v82 + 35))
    {
      id v69 = 0;
      if (*((void *)v82 + 2))
      {
        v33 = *((void *)v82 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v32 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v32 = init_default_corebrightness_log();
        }
        v33 = v32;
      }
      id v69 = v33;
      char v68 = 16;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = v69;
        os_log_type_t v31 = v68;
        __os_log_helper_16_0_0(v67);
        _os_log_error_impl(&dword_1BA438000, v30, v31, "failed to create DisplayRef", v67, 2u);
      }
      goto LABEL_48;
    }
    char v9 = [CBBacklightNode alloc];
    uint64_t v10 = [(CBBacklightNode *)v9 initWithService:v80];
    *((void *)v82 + 36) = v10;
    [v82 initialiseSDR];
    [v82 initialiseEDR];
    [v82 initialiseAurora];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v82 + 10) = v11;
    uint64_t v29 = [CBTwilight alloc];
    uint64_t v12 = -[CBTwilight initWithParams:](v29, "initWithParams:", [*((id *)v82 + 36) twilight]);
    *((void *)v82 + 7) = v12;
    if (*((void *)v82 + 7))
    {
      uint64_t v13 = (void *)*((void *)v82 + 7);
      uint64_t v61 = MEMORY[0x1E4F143A8];
      int v62 = -1073741824;
      int v63 = 0;
      os_log_type_t v64 = __53__CBDisplayModuleiOS_initWithBacklight_queue_brtCtl___block_invoke;
      uint64_t v65 = &unk_1E62190B8;
      id v66 = v82;
      objc_msgSend(v13, "registerNotificationBlock:");
      [*((id *)v82 + 10) addObject:*((void *)v82 + 7)];
    }
    uint64_t v28 = [CBAmmolite alloc];
    uint64_t v14 = -[CBAmmolite initWithParams:](v28, "initWithParams:", [*((id *)v82 + 36) ammolite]);
    *((void *)v82 + 8) = v14;
    if (*((void *)v82 + 8))
    {
      os_log_type_t v15 = (void *)*((void *)v82 + 8);
      uint64_t v55 = MEMORY[0x1E4F143A8];
      int v56 = -1073741824;
      int v57 = 0;
      uint64_t v58 = __53__CBDisplayModuleiOS_initWithBacklight_queue_brtCtl___block_invoke_2;
      uint64_t v59 = &unk_1E62190B8;
      id v60 = v82;
      objc_msgSend(v15, "registerNotificationBlock:");
      [*((id *)v82 + 10) addObject:*((void *)v82 + 8)];
    }
    int v54 = 0;
    int v54 = *((_DWORD *)v82 + 22);
    int v53 = 0;
    int v53 = *((_DWORD *)v82 + 24);
    id v52 = 0;
    id v52 = (id)DisplayCopyProperty(*((void *)v82 + 35), @"DisplayProductLuminanceMin");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v52 floatValue];
      int v54 = v16;
    }

    id v51 = 0;
    id v51 = (id)DisplayCopyProperty(*((void *)v82 + 35), @"DisplayProductLuminanceMax");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v51 floatValue];
      int v53 = v17;
    }

    uint64_t v18 = [CBIndicatorBrightnessModule alloc];
    LODWORD(v19) = v54;
    LODWORD(v20) = v53;
    uint64_t v21 = [(CBIndicatorBrightnessModule *)v18 initWithQueue:*((void *)v82 + 3) min:v19 andMax:v20];
    *((void *)v82 + 9) = v21;
    if (*((void *)v82 + 9))
    {
      unsigned int v22 = (void *)*((void *)v82 + 9);
      uint64_t v45 = MEMORY[0x1E4F143A8];
      int v46 = -1073741824;
      int v47 = 0;
      char v48 = __53__CBDisplayModuleiOS_initWithBacklight_queue_brtCtl___block_invoke_3;
      char v49 = &unk_1E62190B8;
      id v50 = v82;
      objc_msgSend(v22, "registerNotificationBlock:");
      [*((id *)v82 + 10) addObject:*((void *)v82 + 9)];
    }
    if (!DisplayOpen(*((char **)v82 + 35), (uint64_t)DisplayRefPropertyChangedCallback, (uint64_t)v82))
    {
      os_log_t oslog = 0;
      if (*((void *)v82 + 2))
      {
        uint64_t v27 = *((void *)v82 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v26 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v26 = init_default_corebrightness_log();
        }
        uint64_t v27 = v26;
      }
      os_log_t oslog = v27;
      os_log_type_t v43 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = oslog;
        os_log_type_t v25 = v43;
        __os_log_helper_16_0_0(v42);
        _os_log_error_impl(&dword_1BA438000, v24, v25, "failed to open the DisplayRef", v42, 2u);
      }
      goto LABEL_48;
    }
    DisplaySetProperty(*((void *)v82 + 35), @"DisplayBrightnessAuto", *MEMORY[0x1E4F1CFC8]);
    DisplaySetProperty(*((void *)v82 + 35), @"DisplaySyncBrightnessTransactions", *MEMORY[0x1E4F1CFD0]);
  }
  return (CBDisplayModuleiOS *)v82;
}

uint64_t __53__CBDisplayModuleiOS_initWithBacklight_queue_brtCtl___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", a3, a2, a1, a3, a2, a1);
}

uint64_t __53__CBDisplayModuleiOS_initWithBacklight_queue_brtCtl___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", a3, a2, a1, a3, a2, a1);
}

uint64_t __53__CBDisplayModuleiOS_initWithBacklight_queue_brtCtl___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", a3, a2, a1, a3, a2, a1);
}

- (void)updateSDRLimits:(id)a3
{
  if (a3)
  {
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"MinNits"), "floatValue");
    self->_minNits = v3;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"MaxNits"), "floatValue");
    self->_maxNits = v4;
  }
  else
  {
    self->_dynSliderCap = 600.0;
    self->_maxNits = 600.0;
    self->_minNits = 2.0;
  }
}

- (void)initialiseSDR
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(CBDisplayModuleiOS *)self updateSDRLimits:[(CBBrightnessProxy *)self->_brtCtl getBrightnessCapabilities]];
  self->_nitsSDR = self->_minNits;
  if (self->super.super._logHandle)
  {
    logHandle = self->super.super._logHandle;
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
    __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v5, COERCE__INT64(self->_maxNits), COERCE__INT64(self->_minNits), COERCE__INT64(self->_nitsSDR));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "SDR: max=%f nits | min=%f nits | curent=%f nits", v5, 0x20u);
  }
}

- (void)initialiseEDR
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  os_log_type_t v40 = self;
  SEL v39 = a2;
  id v38 = 0;
  id v38 = (NSDictionary *)[(CBBrightnessProxy *)self->_brtCtl getBrightnessCapabilities];
  float v37 = 0.0;
  float v36 = 0.0;
  float v35 = 0.5;
  float v34 = 0.75;
  if (v38)
  {
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", @"EDRPotentialHeadroom"), "floatValue");
    float v37 = v2;
    float v36 = v2;
    if ([(NSDictionary *)v38 objectForKeyedSubscript:@"EDRReferenceHeadroom"])
    {
      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", @"EDRReferenceHeadroom"), "floatValue");
      float v36 = v3;
    }
    if ([(NSDictionary *)v38 objectForKeyedSubscript:@"EDRSecondsPerStopDefault"])
    {
      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", @"EDRSecondsPerStopDefault"), "floatValue");
      float v35 = v4;
    }
    if ([(NSDictionary *)v38 objectForKeyedSubscript:@"EDRExitSecondsPerStop"])
    {
      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", @"EDRExitSecondsPerStop"), "floatValue");
      float v34 = v5;
    }
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", @"MaxNitsEDR"), "floatValue");
    v40->_maxNitsEDR = v6;
  }
  else
  {
    float v37 = 16.0;
    float v36 = 10.0;
    v40->_maxNitsEDR = 1600.0;
  }
  v40->_capToCAIsRamping = 0;
  v40->_currentCapToCA = v40->_maxNitsEDR;
  v40->_edrState = 0;
  v40->_appliedHeadroom = 1.0;
  v40->_requestedHeadroom = 1.0;
  v40->_appliedComp = 1.0;
  v40->_trustedLux = 300.0;
  v40->_lastEDRHeadroomRequestFromCA = 0;
  v40->_lastBDMLux = 300.0;
  v40->_bdmLux2 = 0.0;
  v40->_bdmLux1 = 0.0;
  v40->_displayRequiresBDM = DisplayRequiresBDM((uint64_t)v40->_displayInternal) & 1;
  if (v40->_displayRequiresBDM)
  {
    id v33 = 0;
    id v33 = (id)DisplayCopyProperty((uint64_t)v40->_displayInternal, @"BrightDotsMitigationParameters");
    if (v33)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend((id)objc_msgSend(v33, "objectForKey:", @"brightDotsMitigationLux1"), "floatValue");
        v40->_bdmLux1 = v7;
        objc_msgSend((id)objc_msgSend(v33, "objectForKey:", @"brightDotsMitigationLux2"), "floatValue");
        v40->_bdmLux2 = v8;
      }
    }
  }
  char v9 = [CBEDR alloc];
  *(float *)&double v10 = v37;
  *(float *)&double v11 = v36;
  v40->_edr = [(CBEDR *)v9 initWithRampPolicy:0 potentialHeadroom:v10 andReferenceHeadroom:v11];
  v40->_sbim = [[CBSBIM alloc] initWithQueue:v40->super.super._queue andDisplayModule:v40 andEDRModule:v40->_edr];
  if (v40->_edr)
  {
    *(float *)&double v12 = v40->_maxNitsEDR;
    [(CBEDR *)v40->_edr setPanelMax:v12];
    *(float *)&double v13 = v40->_maxNitsEDR;
    [(CBEDR *)v40->_edr setBrightnessCap:v13];
    *(float *)&double v14 = v40->_nitsSDR;
    [(CBEDR *)v40->_edr setSdrBrightness:v14];
    *(float *)&double v15 = v35;
    [(CBEDR *)v40->_edr setSecondsPerStop:v15];
    *(float *)&double v16 = v34;
    context = (void *)MEMORY[0x1BA9ECAE0]([(CBEDR *)v40->_edr setSecondsPerStopExit:v16]);
    id v32 = +[CBPreferencesHandler copyPreferenceForAllUsersMultiple:&unk_1F1418218];
    if (v32)
    {
      [v32 objectForKeyedSubscript:@"EDRModulatorNitsConfig"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v32 objectForKeyedSubscript:@"EDRModulatorHeadroomConfig"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          os_log_type_t v31 = objc_alloc_init(CBEDRModulator);
          -[CBEDRModulator setNitsDataPointsConfig:](v31, "setNitsDataPointsConfig:", [v32 objectForKeyedSubscript:@"EDRModulatorNitsConfig"]);
          -[CBEDRModulator setHeadroomDataPointsConfig:](v31, "setHeadroomDataPointsConfig:", [v32 objectForKeyedSubscript:@"EDRModulatorHeadroomConfig"]);
          [(CBEDRModulator *)v31 setEnabled:v40->_brightnessControlEnabled];
          [(CBEDR *)v40->_edr setHeadroomModulator:v31];
          os_log_t v30 = 0;
          if (v40->super.super._logHandle)
          {
            logHandle = v40->super.super._logHandle;
          }
          else
          {
            uint64_t v23 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            logHandle = v23;
          }
          os_log_t v30 = logHandle;
          os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v31);
            _os_log_impl(&dword_1BA438000, v30, v29, "EDR modulator initialised: %@", v41, 0xCu);
          }
        }
      }
    }
  }
  if (!isBrightnessAdjustmentPossible(v38))
  {
    uint64_t v28 = 0;
    if (v40->super.super._logHandle)
    {
      unsigned int v22 = v40->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      unsigned int v22 = inited;
    }
    uint64_t v28 = v22;
    char v27 = 1;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      double v19 = v28;
      os_log_type_t v20 = v27;
      __os_log_helper_16_0_0(v26);
      _os_log_impl(&dword_1BA438000, v19, v20, "Presets: staring up already enabled", v26, 2u);
    }
    -[CBDisplayModuleiOS updatePresetState:](v40, "updatePresetState:", 1, v19);
  }
  v40->_apceTimer = 0;
  v40->_rtplcState = 0;
  v40->_rtplcCapApplied = 0;
  v40->_currentRTPLCTarget = v40->_maxNitsEDR;
  v40->_rtplcCap = v40->_maxNitsEDR;
  v40->_frameStats = 0;
  if ([(CBBacklightNode *)v40->_backlightParams rtplc])
  {
    int v17 = [CBFrameStats alloc];
    uint64_t v18 = [(CBFrameStats *)v17 initWithQueue:v40->super.super._queue];
    v40->_frameStats = (CBFrameStats *)v18;
    [(CBFrameStats *)v40->_frameStats setMovingAverageDuration:1.0];
    DisplayInitializeRTPLCEDRRamp((uint64_t)v40->_displayInternal);
  }
  DisplayInitializeFastEDR((uint64_t)v40->_displayInternal);
}

- (void)initialiseAurora
{
  double v14 = self;
  SEL v13 = a2;
  char v12 = 0;
  id v11 = 0;
  id v11 = (id)DisplayCopyProperty((uint64_t)self->_displayInternal, @"AuroraSupported");
  if (v11)
  {
    char v12 = [v11 BOOLValue] & 1;
  }
  if (v12)
  {
    float v7 = (void *)[(CBBrightnessProxy *)v14->_brtCtl getBrightnessCapabilities];
    if (v7)
    {
      objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"MaxNitsPanel"), "floatValue");
      v14->_maxNitsPanel = *(float *)&v2;
    }
    else
    {
      v14->_maxNitsPanel = 2175.0;
    }
    if (v14->_edr)
    {
      *(float *)&double v2 = v14->_maxNitsPanel;
      [(CBEDR *)v14->_edr setPanelMax:v2];
    }
    v14->_aurora = [[CBAurora alloc] initWithQueue:v14->super.super._queue andDisplayModule:v14 andBrtCapabilities:v7];
  }
  else
  {
    double v10 = 0;
    if (v14->super.super._logHandle)
    {
      logHandle = v14->super.super._logHandle;
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
    double v10 = logHandle;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = v10;
      os_log_type_t type = v9;
      __os_log_helper_16_0_0(v8);
      _os_log_impl(&dword_1BA438000, log, type, "Aurora not supported", v8, 2u);
    }
  }
}

- (void)dealloc
{
  float v4 = self;
  SEL v3 = a2;
  if (self->_displayInternal)
  {
    DisplayClose((uint64_t)v4->_displayInternal);
    CFRelease(v4->_displayInternal);
    v4->_uint64_t displayInternal = 0;
  }

  if (v4->super.super._logHandle)
  {

    v4->super.super._logHandle = 0;
  }
  if (v4->_apceTimer)
  {
    dispatch_source_cancel((dispatch_source_t)v4->_apceTimer);
    dispatch_release((dispatch_object_t)v4->_apceTimer);
    v4->_apceTimer = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBDisplayModuleiOS;
  [(CBModule *)&v2 dealloc];
}

- (void)start
{
}

uint64_t __27__CBDisplayModuleiOS_start__block_invoke(uint64_t a1, void *a2)
{
  return [a2 start];
}

- (void)stop
{
  if (self->_aurora) {
    [(CBAurora *)self->_aurora stop];
  }
}

uint64_t __26__CBDisplayModuleiOS_stop__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stop];
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (void)updatePresetState:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v15 = a3;
  double v14 = (void *)MEMORY[0x1BA9ECAE0]();
  if (self->super.super._logHandle)
  {
    logHandle = self->super.super._logHandle;
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
    __os_log_helper_16_0_1_4_0((uint64_t)v18, v15);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Presets: setting status of pro mode to: %d", v18, 8u);
  }
  self->_brightnessControlEnabled = !v15;
  self->_referenceModeIsActive = v15;
  if (self->_brightnessControlEnabled)
  {
    uint64_t v11 = 0;
  }
  else
  {
    *(float *)&double v3 = self->_minNits;
    uint64_t v11 = [NSNumber numberWithFloat:v3];
  }
  [(CBDisplayModuleiOS *)self setProperty:v11 forKey:@"kCoreBrightnessDisplayPresetNitsOverride"];
  BOOL v10 = 0;
  if (self->_brightnessControlEnabled) {
    BOOL v10 = !self->_dominoMode;
  }
  -[CBDisplayModuleiOS sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", @"CBBrightnessControlAvailable", [NSNumber numberWithBool:v10]);
  if (v15)
  {
    [(CBSBIM *)self->_sbim disable];
  }
  else
  {
    *(float *)&double v4 = self->_trustedLux;
    [(CBDisplayModuleiOS *)self updateBDMWithLux:v4];
    [(CBSBIM *)self->_sbim enable];
  }
  if (self->_edr && [(CBEDR *)self->_edr headroomModulator])
  {
    [(CBEDRModulator *)[(CBEDR *)self->_edr headroomModulator] setEnabled:self->_brightnessControlEnabled];
    if (self->super.super._logHandle)
    {
      os_log_type_t v9 = self->super.super._logHandle;
    }
    else
    {
      uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      os_log_type_t v9 = v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_brightnessControlEnabled) {
        float v5 = "enabled";
      }
      else {
        float v5 = "disabled";
      }
      if (self->_brightnessControlEnabled) {
        float v6 = "enabled";
      }
      else {
        float v6 = "disabled";
      }
      __os_log_helper_16_2_2_8_32_8_32((uint64_t)v17, (uint64_t)v5, (uint64_t)v6);
      _os_log_impl(&dword_1BA438000, v9, OS_LOG_TYPE_DEFAULT, "Presets: Brightness updates are %s; EDR modulator is %s",
        v17,
        0x16u);
    }
  }
  float v7 = 0.0;
  if (!v15) {
    float v7 = -1.0;
  }
  DisplaySetCabalFactorOverride((uint64_t)self->_displayInternal, v7);
  [(CBChromaticCorrection *)self->_twilight setEnabled:!v15];
  [(CBChromaticCorrection *)self->_ammolite setEnabled:!v15];
}

- (void)handleAttachedNotification
{
  context = (void *)MEMORY[0x1BA9ECAE0]();
  float v6 = (NSDictionary *)[(CBBrightnessProxy *)self->_brtCtl getBrightnessCapabilities];
  if (v6)
  {
    BOOL v5 = isBrightnessAdjustmentPossible(v6);
    [(CBDisplayModuleiOS *)self updateSDRLimits:v6];
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"MaxNitsEDR"), "floatValue");
    self->_maxNitsEDR = v2;
    *(float *)&double v3 = self->_maxNitsEDR;
    [(CBEDR *)self->_edr setBrightnessCap:v3];
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"EDRPotentialHeadroom"), "floatValue");
    -[CBEDR setMaxHeadroom:](self->_edr, "setMaxHeadroom:");
    if (self->_brightnessControlEnabled != v5) {
      [(CBDisplayModuleiOS *)self updatePresetState:!v5];
    }
  }
}

- (void)handleEDRHeadroomRequest:(id)a3
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  uint64_t v112 = self;
  SEL v111 = a2;
  id v110 = a3;
  char v109 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v108 = 0.0;
    objc_msgSend((id)objc_msgSend(v110, "objectForKey:", -[CBBrightnessProxy brightnessRequestEDRHeadroom](v112->_brtCtl, "brightnessRequestEDRHeadroom")), "floatValue");
    float v108 = *(float *)&v3;
    [(CBEDR *)v112->_edr clampHeadroom:v3];
    float v108 = *(float *)&v4;
    [(CBSBIM *)v112->_sbim setCurrentHeadroomRequest:v4];
    if (v112->_sbim)
    {
      [(CBSBIM *)v112->_sbim cap];
      if (v108 > v5)
      {
        os_log_t v107 = 0;
        if (v112->super.super._logHandle)
        {
          logHandle = v112->super.super._logHandle;
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
        os_log_t v107 = logHandle;
        os_log_type_t v106 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
        {
          [(CBSBIM *)v112->_sbim cap];
          __os_log_helper_16_0_2_8_0_8_0((uint64_t)v118, COERCE__INT64(v108), COERCE__INT64(v6));
          _os_log_impl(&dword_1BA438000, v107, v106, "EDR headroom is being capped by SBIM: request=%f cap=%f", v118, 0x16u);
        }
        [(CBSBIM *)v112->_sbim cap];
        float v108 = v7;
      }
    }
    uint64_t v62 = [v110 objectForKeyedSubscript:@"AuroraEDRHeadroomRequest"];
    if (v62 != *MEMORY[0x1E4F1CFD0]
      && ((*(float *)&double v8 = v108,
           [(CBAurora *)v112->_aurora setCurrentEDRHeadroomRequest:v8],
           [(CBAurora *)v112->_aurora isActive])
       || [(CBAurora *)v112->_aurora isBoostingBrightness]))
    {
      uint64_t v105 = 0;
      if (v112->super.super._logHandle)
      {
        uint64_t v61 = v112->super.super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v60 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v60 = init_default_corebrightness_log();
        }
        uint64_t v61 = v60;
      }
      uint64_t v105 = v61;
      os_log_type_t v104 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v58 = v105;
        os_log_type_t v59 = v104;
        __os_log_helper_16_0_0(v103);
        _os_log_impl(&dword_1BA438000, v58, v59, "Discarding EDR headroom request, Aurora is active", v103, 2u);
      }
    }
    else
    {
      char v102 = 0;
      [v110 objectForKeyedSubscript:@"AODEDRHeadroomRequest"];
      objc_opt_class();
      char v57 = 0;
      if (objc_opt_isKindOfClass()) {
        char v57 = objc_msgSend((id)objc_msgSend(v110, "objectForKeyedSubscript:", @"AODEDRHeadroomRequest"), "BOOLValue");
      }
      char v102 = v57 & 1;
      if (![+[CBAODState sharedInstance] isAODActive]|| (v102 & 1) != 0)
      {
        BOOL v98 = float_equal(v108, 1.0);
        char v97 = 0;
        [v110 objectForKeyedSubscript:@"EcoModeHeadroomRequest"];
        objc_opt_class();
        char v52 = 0;
        if (objc_opt_isKindOfClass()) {
          char v52 = objc_msgSend((id)objc_msgSend(v110, "objectForKeyedSubscript:", @"EcoModeHeadroomRequest"), "BOOLValue");
        }
        char v97 = v52 & 1;
        if (!v112->_ecoMode || v112->_referenceModeIsActive || (v97 & 1) != 0 || v98)
        {
          char v93 = 0;
          [v110 objectForKeyedSubscript:@"DominoHeadroomRequest"];
          objc_opt_class();
          char v47 = 0;
          if (objc_opt_isKindOfClass()) {
            char v47 = objc_msgSend((id)objc_msgSend(v110, "objectForKeyedSubscript:", @"DominoHeadroomRequest"), "BOOLValue");
          }
          char v93 = v47 & 1;
          if (!v112->_dominoMode || (v93 & 1) != 0)
          {
            char v89 = 0;
            [v110 objectForKeyedSubscript:@"AutoDimHeadroomRequest"];
            objc_opt_class();
            char v42 = 0;
            if (objc_opt_isKindOfClass()) {
              char v42 = objc_msgSend((id)objc_msgSend(v110, "objectForKeyedSubscript:", @"AutoDimHeadroomRequest"), "BOOLValue");
            }
            char v89 = v42 & 1;
            if (!v112->_autoDimActive || (v89 & 1) != 0 || v98)
            {
              if (v112->_requestedHeadroom == 1.0 && v108 > 1.0)
              {
                if (v112->_referenceModeIsActive)
                {
                  LODWORD(v9) = 1.0;
                  [(CBEDR *)v112->_edr setAppliedCompensation:v9];
                  v112->_appliedComp = 1.0;
                }
                else
                {
                  [(CBDisplayModuleiOS *)v112 computeBrightnessCompensation];
                  v112->_appliedComp = v10;
                  *(float *)&double v11 = v112->_appliedComp;
                  [(CBEDR *)v112->_edr setAppliedCompensation:v11];
                }
                if ([(CBBacklightNode *)v112->_backlightParams rtplc])
                {
                  v80[0] = 0;
                  v80[1] = v80;
                  int v81 = 1375731712;
                  int v82 = 48;
                  uint64_t v83 = __Block_byref_object_copy_;
                  v84 = __Block_byref_object_dispose_;
                  v85 = v112;
                  uint64_t v72 = MEMORY[0x1E4F143A8];
                  int v73 = -1073741824;
                  int v74 = 0;
                  v75 = __47__CBDisplayModuleiOS_handleEDRHeadroomRequest___block_invoke;
                  char v76 = &unk_1E6219150;
                  id v78 = v80;
                  uint64_t v77 = v112;
                  id v79 = &v72;
                  [(CBFrameStats *)v112->_frameStats startMonitoring:&v72];
                  if (v112->_rtplcState == 2 || v112->_rtplcState == 1)
                  {
                    LODWORD(v12) = 0.5;
                    [(CBDisplayModuleiOS *)v112 createAPCEMonitorWithFrequency:v12];
                  }
                  _Block_object_dispose(v80, 8);
                }
                [(CBSBIM *)v112->_sbim enterEDR];
                *(float *)&double v13 = v108;
                [(CBDisplayModuleiOS *)v112 updateEDRStateForEvent:2 andHeadroom:v13];
              }
              if (v98)
              {
                if ([(CBBacklightNode *)v112->_backlightParams rtplc])
                {
                  [(CBFrameStats *)v112->_frameStats stopMonitoring];
                  [(CBDisplayModuleiOS *)v112 deleteAPCEMonitor];
                }
                [(CBSBIM *)v112->_sbim exitEDR];
                *(float *)&double v14 = v108;
                [(CBDisplayModuleiOS *)v112 updateEDRStateForEvent:3 andHeadroom:v14];
              }
              char v71 = [(CBDisplayModuleiOS *)v112 edrIsEngaged];
              uint64_t displayInternal = (uint64_t)v112->_displayInternal;
              if (v71) {
                DisplaySetProperty(displayInternal, @"DisplayFasterEDREngaged", *MEMORY[0x1E4F1CFD0]);
              }
              else {
                DisplaySetProperty(displayInternal, @"DisplayFasterEDREngaged", *MEMORY[0x1E4F1CFC8]);
              }
              v112->_float requestedHeadroom = v108;
              float v70 = 1.0;
              double v69 = 0.0;
              [v110 objectForKeyedSubscript:@"EDRSecondsPerStop"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_msgSend((id)objc_msgSend(v110, "objectForKeyedSubscript:", @"EDRSecondsPerStop"), "floatValue");
                float v67 = v15;
                if (v112->super.super._logHandle)
                {
                  float v36 = v112->super.super._logHandle;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT) {
                    uint64_t v35 = _COREBRIGHTNESS_LOG_DEFAULT;
                  }
                  else {
                    uint64_t v35 = init_default_corebrightness_log();
                  }
                  float v36 = v35;
                }
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  __os_log_helper_16_0_1_8_0((uint64_t)v117, COERCE__INT64(v67));
                  _os_log_impl(&dword_1BA438000, v36, OS_LOG_TYPE_DEFAULT, "HDR | Transition is using the seconds per stop specified in request = %f", v117, 0xCu);
                }
                *(float *)&double v16 = v112->_requestedHeadroom;
                *(float *)&double v17 = v67;
                char v68 = [(CBEDR *)v112->_edr shouldUpdateEDRForRequestedHeadroom:&v70 targetHeadroom:&v69 rampTime:v16 durationPerStop:v17];
              }
              else if (v98)
              {
                if (v112->super.super._logHandle)
                {
                  float v34 = v112->super.super._logHandle;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT) {
                    uint64_t v33 = _COREBRIGHTNESS_LOG_DEFAULT;
                  }
                  else {
                    uint64_t v33 = init_default_corebrightness_log();
                  }
                  float v34 = v33;
                }
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  [(CBEDR *)v112->_edr secondsPerStopExit];
                  __os_log_helper_16_0_1_8_0((uint64_t)v116, COERCE__INT64(v18));
                  _os_log_impl(&dword_1BA438000, v34, OS_LOG_TYPE_DEFAULT, "HDR | Exit transition is using the exit duration per stop = %f", v116, 0xCu);
                }
                edr = v112->_edr;
                float requestedHeadroom = v112->_requestedHeadroom;
                [(CBEDR *)edr secondsPerStopExit];
                LODWORD(v20) = v19;
                *(float *)&double v21 = requestedHeadroom;
                char v68 = [(CBEDR *)edr shouldUpdateEDRForRequestedHeadroom:&v70 targetHeadroom:&v69 rampTime:v21 durationPerStop:v20];
              }
              else
              {
                if (v112->super.super._logHandle)
                {
                  os_log_t v30 = v112->super.super._logHandle;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT) {
                    uint64_t v29 = _COREBRIGHTNESS_LOG_DEFAULT;
                  }
                  else {
                    uint64_t v29 = init_default_corebrightness_log();
                  }
                  os_log_t v30 = v29;
                }
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  [(CBEDR *)v112->_edr secondsPerStop];
                  __os_log_helper_16_0_1_8_0((uint64_t)v115, COERCE__INT64(v23));
                  _os_log_impl(&dword_1BA438000, v30, OS_LOG_TYPE_DEFAULT, "HDR | Transition is using the default duration per stop = %f", v115, 0xCu);
                }
                *(float *)&double v22 = v112->_requestedHeadroom;
                char v68 = [(CBEDR *)v112->_edr shouldUpdateEDRForRequestedHeadroom:&v70 targetHeadroom:&v69 rampTime:v22];
              }
              if (objc_msgSend(v110, "objectForKeyedSubscript:", -[CBBrightnessProxy brightnessNotificationPowerOff](v112->_brtCtl, "brightnessNotificationPowerOff")))
              {
                char v68 = 1;
                [(CBEDR *)v112->_edr resetRequestedHeadroom];
              }
              id v66 = objc_msgSend(v110, "objectForKey:", -[CBBrightnessProxy brightnessRequestRampDuration](v112->_brtCtl, "brightnessRequestRampDuration"));
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v66 floatValue];
                float v65 = v24;
                if (v112->super.super._logHandle)
                {
                  uint64_t v28 = v112->super.super._logHandle;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT) {
                    uint64_t v27 = _COREBRIGHTNESS_LOG_DEFAULT;
                  }
                  else {
                    uint64_t v27 = init_default_corebrightness_log();
                  }
                  uint64_t v28 = v27;
                }
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v114, COERCE__INT64(v112->_requestedHeadroom), COERCE__INT64(v112->_appliedHeadroom), COERCE__INT64(v65));
                  _os_log_impl(&dword_1BA438000, v28, OS_LOG_TYPE_DEFAULT, "HDR | CA request for headroom: %f, currrent headroom: %f, transitionTime: %f", v114, 0x20u);
                }
                DisplayStartFastEDRRamp((uint64_t)v112->_displayInternal, v112->_requestedHeadroom, v65);
              }
              else if (v68)
              {
                if (v112->super.super._logHandle)
                {
                  uint64_t v26 = v112->super.super._logHandle;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT) {
                    uint64_t v25 = _COREBRIGHTNESS_LOG_DEFAULT;
                  }
                  else {
                    uint64_t v25 = init_default_corebrightness_log();
                  }
                  uint64_t v26 = v25;
                }
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v113, COERCE__INT64(v112->_requestedHeadroom), *(uint64_t *)&v69, COERCE__INT64(v70));
                  _os_log_impl(&dword_1BA438000, v26, OS_LOG_TYPE_DEFAULT, "HDR | Received EDRHeadroomRequest: %f, evaluated ramp time: %f, targetHeadroom: %f", v113, 0x20u);
                }
                DisplayStartFastEDRRamp((uint64_t)v112->_displayInternal, v70, v69);
              }
            }
            else
            {
              uint64_t v88 = 0;
              if (v112->super.super._logHandle)
              {
                double v41 = v112->super.super._logHandle;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t v40 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t v40 = init_default_corebrightness_log();
                }
                double v41 = v40;
              }
              uint64_t v88 = v41;
              os_log_type_t v87 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                id v38 = v88;
                os_log_type_t v39 = v87;
                __os_log_helper_16_0_0(v86);
                _os_log_impl(&dword_1BA438000, v38, v39, "AutoDim EDR | Discarding AutoDim EDR headroom request, AutoDim is on", v86, 2u);
              }
            }
          }
          else
          {
            v92 = 0;
            if (v112->super.super._logHandle)
            {
              int v46 = v112->super.super._logHandle;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT) {
                uint64_t v45 = _COREBRIGHTNESS_LOG_DEFAULT;
              }
              else {
                uint64_t v45 = init_default_corebrightness_log();
              }
              int v46 = v45;
            }
            v92 = v46;
            os_log_type_t v91 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              os_log_type_t v43 = v92;
              os_log_type_t v44 = v91;
              __os_log_helper_16_0_0(v90);
              _os_log_impl(&dword_1BA438000, v43, v44, "Domino EDR | Discarding Domino EDR headroom request, Domino is on", v90, 2u);
            }
          }
        }
        else
        {
          v96 = 0;
          if (v112->super.super._logHandle)
          {
            id v51 = v112->super.super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v50 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v50 = init_default_corebrightness_log();
            }
            id v51 = v50;
          }
          v96 = v51;
          os_log_type_t v95 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            char v48 = v96;
            os_log_type_t v49 = v95;
            __os_log_helper_16_0_0(v94);
            _os_log_impl(&dword_1BA438000, v48, v49, "EcoMode EDR | Discarding EDR headroom request, EcoMode is on", v94, 2u);
          }
        }
      }
      else
      {
        int v101 = 0;
        if (v112->super.super._logHandle)
        {
          int v56 = v112->super.super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v55 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v55 = init_default_corebrightness_log();
          }
          int v56 = v55;
        }
        int v101 = v56;
        os_log_type_t v100 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          int v53 = v101;
          os_log_type_t v54 = v100;
          __os_log_helper_16_0_0(v99);
          _os_log_impl(&dword_1BA438000, v53, v54, "AOD EDR | Discarding EDR headroom request, AOD is on", v99, 2u);
        }
      }
    }
  }
}

void __47__CBDisplayModuleiOS_handleEDRHeadroomRequest___block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v15 = a1;
  double v14 = a2;
  uint64_t v13 = a1;
  memcpy(__dst, a2, sizeof(__dst));
  queue = *(NSObject **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 24);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  float v7 = __47__CBDisplayModuleiOS_handleEDRHeadroomRequest___block_invoke_2;
  double v8 = &unk_1E6219128;
  uint64_t v10 = *(void *)(a1 + 40);
  memcpy(v11, __dst, sizeof(v11));
  uint64_t v9 = *(void *)(a1 + 32);
  dispatch_async(queue, &v4);
}

uint64_t __47__CBDisplayModuleiOS_handleEDRHeadroomRequest___block_invoke_2(void *a1)
{
  double v8 = a1;
  float v7 = a1;
  float v2 = *(void **)(*(void *)(a1[5] + 8) + 40);
  memcpy(__dst, a1 + 6, sizeof(__dst));
  [v2 handleFrameInfo:__dst];
  uint64_t v4 = *(void **)(a1[4] + 248);
  memcpy(v5, a1 + 6, sizeof(v5));
  return [v4 processFrameInfo:v5];
}

void __52__CBDisplayModuleiOS_handleDisplayBrightnessUpdate___block_invoke_290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 256) objectAtIndex:a3];
  [*(id *)(a1 + 32) setProperty:v6 forKey:a2];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v8, v6);
    _os_log_impl(&dword_1BA438000, v4, OS_LOG_TYPE_INFO, "Restoring cached %@ property", v8, 0xCu);
  }
}

- (float)computeBrightnessCompensation
{
  if (self->_blrEnabled)
  {
    float v5 = 1.8;
  }
  else if (self->_harmonyEnabled)
  {
    float v5 = 1.3;
  }
  else
  {
    float v5 = 1.0;
  }
  float nitsSDR = self->_nitsSDR;
  if ([(CBAurora *)self->_aurora isBoostingBrightness])
  {
    [(CBAurora *)self->_aurora currentPreAuroraNits];
    float nitsSDR = v2;
  }
  return clamp(self->_dynSliderCap / nitsSDR, 1.0, v5);
}

- (void)handleFrameInfo:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v35 = self;
  SEL v34 = a2;
  uint64_t v33 = a3;
  float v32 = 1.0;
  float v31 = 0.0;
  float v31 = a3->var10 - 1.0;
  BOOL v30 = 0;
  BOOL var9 = 0;
  if (!self->_rtplcCapApplied) {
    BOOL var9 = a3->var9;
  }
  BOOL v30 = var9;
  BOOL v29 = 0;
  BOOL v15 = 0;
  if (v35->_rtplcCapApplied)
  {
    BOOL v15 = 0;
    if (a3->var9) {
      BOOL v15 = v31 != v35->_currentRTPLCTarget;
    }
  }
  BOOL v29 = v15;
  BOOL v28 = 0;
  BOOL v14 = 0;
  if (v35->_rtplcCapApplied) {
    BOOL v14 = !a3->var9;
  }
  BOOL v28 = v14;
  BOOL v27 = 0;
  BOOL v13 = 1;
  if (!a3->var8) {
    BOOL v13 = a3->var9;
  }
  BOOL v27 = v13;
  v35->_rtplcCapApplied = a3->var9;
  if (v30 || v29)
  {
    [(CBDisplayModuleiOS *)v35 deleteAPCEMonitor];
    v35->_rtplcState = 1;
    v35->_float currentRTPLCTarget = v31;
    float v26 = 0.0;
    float v26 = v35->_currentRTPLCTarget / v35->_nitsSDR;
    os_log_t v25 = 0;
    if (v35->super.super._logHandle)
    {
      logHandle = v35->super.super._logHandle;
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
    os_log_t v25 = logHandle;
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v37, COERCE__INT64(v35->_currentRTPLCTarget), COERCE__INT64(v26), COERCE__INT64(v35->_appliedHeadroom), COERCE__INT64(v35->_nitsSDR), COERCE__INT64(v35->_currentCapToCA));
      _os_log_impl(&dword_1BA438000, v25, v24, "RTPLC TRIGGER!! RTPLCBrightness: %f, reducedHeadroom: %f, current(_applied): %f, _nitsSDR: %f, _currentCapToCA = %f", v37, 0x34u);
    }
    float v23 = 0.0;
    float v23 = (float)(v35->_nitsSDR * v35->_appliedHeadroom) * v35->_appliedComp;
    float currentRTPLCTarget = 0.0;
    float currentRTPLCTarget = v35->_currentRTPLCTarget;
    os_log_t v21 = 0;
    if (v35->super.super._logHandle)
    {
      uint64_t v10 = v35->super.super._logHandle;
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
    os_log_type_t v20 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v36, COERCE__INT64(v23), COERCE__INT64(currentRTPLCTarget));
      _os_log_impl(&dword_1BA438000, v21, v20, "RTPLC ACTION: StartRTPLCRamp, ramp Cap: %f--->%f", v36, 0x16u);
    }
    DisplayStartRTPLCEDRCapRamp((uint64_t)v35->_displayInternal, 0, v23, currentRTPLCTarget, 4.0);
  }
  else if (v28)
  {
    int v19 = 0;
    if (v35->super.super._logHandle)
    {
      double v8 = v35->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v7 = init_default_corebrightness_log();
      }
      double v8 = v7;
    }
    int v19 = v8;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      float v5 = v19;
      os_log_type_t v6 = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_impl(&dword_1BA438000, v5, v6, "RTPLC RELEASED!", v17, 2u);
    }
    LODWORD(v3) = 0.5;
    [(CBDisplayModuleiOS *)v35 createAPCEMonitorWithFrequency:v3];
  }
  if ([(CBFrameStats *)v35->_frameStats tripLength] && !v27)
  {
    mach_time_now_in_seconds();
    [(CBFrameStats *)v35->_frameStats currentTripStartTime];
    uint64_t v4 = [(CBFrameStats *)v35->_frameStats tripLength];
    [(CBFrameStats *)v35->_frameStats tripMaxAPCE];
    +[CBAnalytics rtplcTriggeredWithLength:maxAPCE:durationInSeconds:sdrBrightness:referenceModeEnabled:](CBAnalytics, "rtplcTriggeredWithLength:maxAPCE:durationInSeconds:sdrBrightness:referenceModeEnabled:", v4, v35->_referenceModeIsActive);
    v35->_rtplcTripMaxBrightness = 0.0;
  }
  if (![(CBFrameStats *)v35->_frameStats tripLength] && v27) {
    v35->_rtplcTripMaxBrightness = v35->_nitsSDR;
  }
  if (v27) {
    v35->_rtplcTripMaxBrightness = fmaxf(v35->_nitsSDR, v35->_rtplcTripMaxBrightness);
  }
}

- (void)createAPCEMonitorWithFrequency:(float)a3
{
  BOOL v14 = self;
  SEL v13 = a2;
  float v12 = a3;
  uint64_t v11 = (unint64_t)(float)((float)(1.0 / a3) * 1000000000.0);
  if (self->_apceTimer)
  {
    dispatch_source_set_timer((dispatch_source_t)v14->_apceTimer, 0, v11, 0);
  }
  else
  {
    dispatch_object_t v10 = 0;
    dispatch_object_t v10 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v14->super.super._queue);
    if (v10)
    {
      dispatch_source_set_timer(v10, 0, v11, 0);
      dispatch_block_t handler = 0;
      uint64_t block = MEMORY[0x1E4F143A8];
      int v4 = -1073741824;
      int v5 = 0;
      os_log_type_t v6 = __53__CBDisplayModuleiOS_createAPCEMonitorWithFrequency___block_invoke;
      uint64_t v7 = &unk_1E6218FE0;
      double v8 = v14;
      dispatch_block_t handler = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_USER_INITIATED, 0, &block);
      if (handler)
      {
        dispatch_source_set_event_handler(v10, handler);
        _Block_release(handler);
      }
      v14->_apceTimer = (OS_dispatch_source *)v10;
      dispatch_activate(v10);
    }
  }
}

uint64_t __53__CBDisplayModuleiOS_createAPCEMonitorWithFrequency___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "apceTimerCallback", a1, a1);
}

- (void)deleteAPCEMonitor
{
  if (self->_apceTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_apceTimer);
    dispatch_release((dispatch_object_t)self->_apceTimer);
    self->_apceTimer = 0;
  }
}

- (void)apceTimerCallback
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(CBFrameStats *)self->_frameStats getMovingAverage];
  float v14 = v2;
  [(CBFrameStats *)self->_frameStats getPeakAPCECap];
  float v13 = v3;
  [(CBFrameStats *)self->_frameStats scaleFactor];
  float v15 = v4;
  *(float *)&double v5 = v14;
  *(float *)&double v6 = v15;
  [(CBDisplayModuleiOS *)self computeTargetHDRBrightnessForAPCE:v5 andScale:v6];
  float v16 = v7;
  if (self->super.super._logHandle)
  {
    logHandle = self->super.super._logHandle;
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
    __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v20, COERCE__INT64(v16), COERCE__INT64(v14), COERCE__INT64(self->_currentRTPLCTarget), COERCE__INT64(v15), COERCE__INT64(v13));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "RTPLC RECOVERY: target HDR Brightness= %f for APCE = %f, current RTPLC target: %f, scaleFactor: %f, peakAPCECap: %f", v20, 0x34u);
  }
  float v17 = fminf(v16, v13);
  if (v17 > self->_currentRTPLCTarget)
  {
    self->_rtplcState = 2;
    float rtplcCap = self->_rtplcCap;
    if (self->super.super._logHandle)
    {
      uint64_t v9 = self->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v8 = init_default_corebrightness_log();
      }
      uint64_t v9 = v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v19, COERCE__INT64(rtplcCap), COERCE__INT64(v17), COERCE__INT64(self->_currentCapToCA));
      _os_log_impl(&dword_1BA438000, v9, OS_LOG_TYPE_DEFAULT, "RTPLC RECOVERY RAMP! ramp Cap: %f ---> %f (currentCapToCA = %f)", v19, 0x20u);
    }
    DisplayStartRTPLCEDRCapRamp((uint64_t)self->_displayInternal, 0, rtplcCap, v17, 16.0);
  }
}

- (float)computeTargetHDRBrightnessForAPCE:(float)a3 andScale:(float)a4
{
  float v31 = self;
  SEL v30 = a2;
  float v29 = a3;
  float v28 = a4;
  if ([(CBFloatArray *)[(CBRTPLCRecoveryCurveParams *)[(CBRTPLCParams *)[(CBBacklightNode *)self->_backlightParams rtplc] recoveryCurve] nits] count])
  {
    [(CBFloatArray *)[(CBRTPLCRecoveryCurveParams *)[(CBRTPLCParams *)[(CBBacklightNode *)v31->_backlightParams rtplc] recoveryCurve] nits] get:0];
    float v24 = v4;
    for (int i = 0;
          i < [(CBFloatArray *)[(CBRTPLCRecoveryCurveParams *)[(CBRTPLCParams *)[(CBBacklightNode *)v31->_backlightParams rtplc] recoveryCurve] apce] count];
          ++i)
    {
      if (i + 1 >= [(CBFloatArray *)[(CBRTPLCRecoveryCurveParams *)[(CBRTPLCParams *)[(CBBacklightNode *)v31->_backlightParams rtplc] recoveryCurve] apce] count])
      {
        [(CBFloatArray *)[(CBRTPLCRecoveryCurveParams *)[(CBRTPLCParams *)[(CBBacklightNode *)v31->_backlightParams rtplc] recoveryCurve] nits] get:i];
        float v24 = v14;
        return v24 / v28;
      }
      [(CBFloatArray *)[(CBRTPLCRecoveryCurveParams *)[(CBRTPLCParams *)[(CBBacklightNode *)v31->_backlightParams rtplc] recoveryCurve] apce] get:i];
      if (v29 > v5)
      {
        [(CBFloatArray *)[(CBRTPLCRecoveryCurveParams *)[(CBRTPLCParams *)[(CBBacklightNode *)v31->_backlightParams rtplc] recoveryCurve] apce] get:i + 1];
        if (v29 < v6)
        {
          [(CBFloatArray *)[(CBRTPLCRecoveryCurveParams *)[(CBRTPLCParams *)[(CBBacklightNode *)v31->_backlightParams rtplc] recoveryCurve] apce] get:i];
          float v22 = v7;
          [(CBFloatArray *)[(CBRTPLCRecoveryCurveParams *)[(CBRTPLCParams *)[(CBBacklightNode *)v31->_backlightParams rtplc] recoveryCurve] apce] get:i + 1];
          float v21 = v8;
          [(CBFloatArray *)[(CBRTPLCRecoveryCurveParams *)[(CBRTPLCParams *)[(CBBacklightNode *)v31->_backlightParams rtplc] recoveryCurve] nits] get:i];
          float v20 = v9;
          [(CBFloatArray *)[(CBRTPLCRecoveryCurveParams *)[(CBRTPLCParams *)[(CBBacklightNode *)v31->_backlightParams rtplc] recoveryCurve] nits] get:i + 1];
          float v24 = linear_interpolation(v29, v22, v20, v21, v10);
          return v24 / v28;
        }
      }
      [(CBFloatArray *)[(CBRTPLCRecoveryCurveParams *)[(CBRTPLCParams *)[(CBBacklightNode *)v31->_backlightParams rtplc] recoveryCurve] apce] get:i];
      float v11 = *(float *)&v12;
      *(float *)&double v12 = v29;
      if (v29 <= v11)
      {
        [(CBFloatArray *)[(CBRTPLCRecoveryCurveParams *)[(CBRTPLCParams *)[(CBBacklightNode *)v31->_backlightParams rtplc] recoveryCurve] nits] get:i];
        float v24 = v13;
        return v24 / v28;
      }
    }
    return v24 / v28;
  }
  else
  {
    BOOL v27 = 0;
    if (v31->super.super._logHandle)
    {
      logHandle = v31->super.super._logHandle;
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
    BOOL v27 = logHandle;
    char v26 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      os_log_t log = v27;
      os_log_type_t type = v26;
      __os_log_helper_16_0_0(v25);
      _os_log_error_impl(&dword_1BA438000, log, type, "RTPLC | Empty Table", v25, 2u);
    }
    return v31->_maxNitsEDR;
  }
}

- (BOOL)edrIsEngaged
{
  BOOL v3 = 1;
  if (self->_edrState != 1) {
    return self->_edrState == 2;
  }
  return v3;
}

- (id)copyIdentifiers
{
  float v4 = self;
  SEL v3 = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"DisplayBrightnessAuto", @"DisplayBrightnessFactor", @"DisplayBrightnessFactorWithFade", @"PreStrobeBrightnessRatio", @"EventTimestampDisplayOn", @"EventTimestampDisplayOff", @"DisplayBrightness", @"BrightnessGlobalScalar", @"DisplayPanelLuminanceMin", @"DisplayPanelLuminanceMid", @"DisplayPanelLuminanceMax", @"DisplayProductLuminanceMin", @"DisplayProductLuminanceMid", @"DisplayProductLuminanceMax", @"BrightnessRestrictions", @"DisplayBackLightArchitecture", @"FreezeBrightness",
               @"UserInteractedWithUI",
               @"EcoModeFactorUpdate",
               @"DominoStateUpdate",
               @"AmbientAdaptiveDimming",
               @"DisplayBrightnessFadePeriod",
               @"DisplayBrightnessFadePeriodOverride",
               @"MaxBrightness",
               @"BrightnessWeakCap",
               @"BrightnessMinPhysicalWithFade",
               @"DisplayBrightnessFactorRamp",
               @"PreStrobeConfig",
               @"PreStrobe",
               @"CoreBrightnessFeaturesDisabled",
               @"DisableWPShift",
               @"ReenablementRampPeriod",
               @"DisablementRampPeriod",
               @"AABConstraints",
               @"AABCurveCap",
               @"PreStrobeDimPeriod",
               @"BrightDotsMitigationParameters",
               @"VirtualBrightnessLimits",
               @"CPMSCurrentPower",
               @"CPMSPowerAccumulatorValue",
               0);
}

- (id)className
{
  float v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)handleAODStateUpdate:(unint64_t)a3 transitionTime:(float)a4 context:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  int v46 = self;
  SEL v45 = a2;
  unint64_t v44 = a3;
  float v43 = a4;
  id v42 = a5;
  [(CBChromaticCorrection *)self->_twilight handleAODStateUpdate:a3 transitionTime:a5 context:*(double *)&a4];
  *(float *)&double v5 = v43;
  float v29 = (void *)MEMORY[0x1BA9ECAE0]([(CBChromaticCorrection *)v46->_ammolite handleAODStateUpdate:v44 transitionTime:v42 context:v5]);
  if (v44)
  {
    if (v44 == 3)
    {
      if (v46->_aurora)
      {
        double v41 = 0;
        if (v46->super.super._logHandle)
        {
          logHandle = v46->super.super._logHandle;
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
        double v41 = logHandle;
        os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t log = v41;
          os_log_type_t type = v40;
          __os_log_helper_16_0_0(v39);
          _os_log_impl(&dword_1BA438000, log, type, "Let Aurora know about AOD state = ON", v39, 2u);
        }
        [(CBAurora *)v46->_aurora setAODIsOn:1];
      }
      if ([(CBDisplayModuleiOS *)v46 edrIsEngaged])
      {
        context = (void *)MEMORY[0x1BA9ECAE0]();
        os_log_t oslog = 0;
        if (v46->super.super._logHandle)
        {
          float v23 = v46->super.super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v22 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v22 = init_default_corebrightness_log();
          }
          float v23 = v22;
        }
        os_log_t oslog = v23;
        os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v54, 0x3FF0000000000000);
          _os_log_impl(&dword_1BA438000, oslog, v37, "AOD EDR | Entering AOD, reducing EDR headroom to %f", v54, 0xCu);
        }
        float v21 = v46;
        v52[0] = @"AODEDRHeadroomRequest";
        v53[0] = MEMORY[0x1E4F1CC38];
        v52[1] = [(CBBrightnessProxy *)v46->_brtCtl brightnessRequestEDRHeadroom];
        v53[1] = &unk_1F1418410;
        v52[2] = [(CBBrightnessProxy *)v46->_brtCtl brightnessRequestRampDuration];
        v53[2] = &unk_1F1418420;
        -[CBDisplayModuleiOS setProperty:forKey:](v21, "setProperty:forKey:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3], @"EDRHeadroomRequest");
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v42 objectForKey:@"EDRHeadroom"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        float v20 = (void *)MEMORY[0x1BA9ECAE0]();
        os_log_t v36 = 0;
        if (v46->super.super._logHandle)
        {
          int v19 = v46->super.super._logHandle;
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
        os_log_t v36 = v19;
        os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend((id)objc_msgSend(v42, "objectForKey:", @"EDRHeadroom"), "floatValue");
          __os_log_helper_16_0_1_8_0((uint64_t)v51, COERCE__INT64(v6));
          _os_log_impl(&dword_1BA438000, v36, v35, "AOD EDR | AOD is exiting, instantaneously restoring EDR headroom to %f", v51, 0xCu);
        }
        v49[0] = @"AODEDRHeadroomRequest";
        v50[0] = MEMORY[0x1E4F1CC38];
        v49[1] = [(CBBrightnessProxy *)v46->_brtCtl brightnessRequestEDRHeadroom];
        v50[1] = [v42 objectForKey:@"EDRHeadroom"];
        v49[2] = [(CBBrightnessProxy *)v46->_brtCtl brightnessRequestRampDuration];
        v50[2] = &unk_1F1418420;
        -[CBDisplayModuleiOS setProperty:forKey:](v46, "setProperty:forKey:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:3], @"EDRHeadroomRequest");
      }
    }
    if (v46->_aurora)
    {
      os_log_t v34 = 0;
      if (v46->super.super._logHandle)
      {
        float v17 = v46->super.super._logHandle;
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
      os_log_t v34 = v17;
      os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        float v14 = v34;
        os_log_type_t v15 = v33;
        __os_log_helper_16_0_0(v32);
        _os_log_impl(&dword_1BA438000, v14, v15, "Let Aurora know about AOD state = OFF", v32, 2u);
      }
      [(CBAurora *)v46->_aurora setAODIsOn:0];
    }
    id v31 = [(CBDisplayModuleiOS *)v46 copyPropertyForKey:@"TrustedLux"];
    if (v46->super.super._logHandle)
    {
      float v13 = v46->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v12 = init_default_corebrightness_log();
      }
      float v13 = v12;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v48, (uint64_t)v31);
      _os_log_impl(&dword_1BA438000, v13, OS_LOG_TYPE_DEFAULT, "Kick in Aurora with trusted lux %@", v48, 0xCu);
    }
    [(CBDisplayModuleiOS *)v46 handleNotificationForKey:@"TrustedLux" withProperty:v31];

    if (v46->_lastEDRHeadroomRequestFromCA)
    {
      float v11 = (void *)MEMORY[0x1BA9ECAE0]();
      id v30 = (id)[v46->_lastEDRHeadroomRequestFromCA mutableCopy];
      [v30 setValue:MEMORY[0x1E4F1CC38] forKey:@"AODEDRHeadroomRequest"];
      if (v46->super.super._logHandle)
      {
        float v10 = v46->super.super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v9 = init_default_corebrightness_log();
        }
        float v10 = v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)objc_msgSend(v30, "objectForKeyedSubscript:", -[CBBrightnessProxy brightnessRequestEDRHeadroom](v46->_brtCtl, "brightnessRequestEDRHeadroom")), "floatValue");
        __os_log_helper_16_0_1_8_0((uint64_t)v47, COERCE__INT64(v7));
        _os_log_impl(&dword_1BA438000, v10, OS_LOG_TYPE_DEFAULT, "AOD EDR | Restoring EDR headroom after AOD exit to %f", v47, 0xCu);
      }
      [(CBDisplayModuleiOS *)v46 setProperty:v30 forKey:@"EDRHeadroomRequest"];
    }
  }
  return 1;
}

- (__Display)displayInternal
{
  return self->_displayInternal;
}

- (CBBacklightNode)backlightParams
{
  return self->_backlightParams;
}

@end