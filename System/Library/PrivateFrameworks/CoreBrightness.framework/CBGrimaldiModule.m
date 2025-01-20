@interface CBGrimaldiModule
- (BOOL)jasperCoex;
- (BOOL)provideCoex;
- (BOOL)provideLux;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)strobeCoex;
- (CBGrimaldiModule)initWithQueue:(id)a3 andEventSource:(id)a4 andSamplingStrategy:(id)a5;
- (id)copyGainChanged;
- (id)copyJasperCoex;
- (id)copyParam:(id)a3;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (id)copyRearLux;
- (id)copyReliableLux;
- (id)copyStrobeCoex;
- (void)CBAPDSGetCoex;
- (void)clearOutput;
- (void)dealloc;
- (void)grimaldiLuxReceived:(ApplePhotonDetectorServicesLuxInfo *)a3;
- (void)registerNotificationBlock:(id)a3;
- (void)sendNotificationForKey:(id)a3 withValue:(id)a4;
- (void)setGrimaldiLux;
- (void)setProvideCoex:(BOOL)a3;
- (void)setProvideLux:(BOOL)a3;
- (void)start;
- (void)startSingleSample;
- (void)startWithFrequency:(float)a3;
- (void)startWithFrequency:(float)a3 singleSample:(BOOL)a4;
- (void)stop;
- (void)timerCallback;
- (void)unregisterNotificationBlock;
@end

@implementation CBGrimaldiModule

- (id)copyRearLux
{
  if (self->_overriding) {
    return (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_overriddenInput, "objectForKeyedSubscript:", @"lux"), "copy");
  }
  else {
    return [(CBGrimaldiModule *)self copyReliableLux];
  }
}

- (id)copyReliableLux
{
  lastLux = self->_lastLux;
  if (!self->_coexJasper && !self->_coexStrobe)
  {
    uint64_t v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentRLuxOutputDict, "objectForKeyedSubscript:", @"absolutetime"), "longValue");
    uint64_t v5 = mach_absolute_time();
    if (convertMachToNanoSeconds(v5 - v6) / 0xF4240uLL >= 0x1388) {
      v4 = 0;
    }
    else {
      v4 = (NSNumber *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentRLuxOutputDict, "objectForKeyedSubscript:", @"lux"), "copy");
    }
    lastLux = v4;

    self->_lastLux = v4;
  }
  v2 = lastLux;
  return lastLux;
}

- (id)copyGainChanged
{
  if (self->_overriding) {
    return (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_overriddenInput, "objectForKeyedSubscript:", @"GainChanged"), "copy");
  }
  else {
    return (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentRLuxOutputDict, "objectForKeyedSubscript:", @"GainChanged"), "copy");
  }
}

void __34__CBGrimaldiModule_setGrimaldiLux__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = a1;
  uint64_t v13 = a2;
  uint64_t v12 = a1;
  [*(id *)(a1 + 32) grimaldiLuxReceived:a2];
  os_log_t v11 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
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
  os_log_t v11 = v6;
  char v10 = 2;
  os_signpost_id_t v9 = 0;
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 && v9 != -1 && os_signpost_enabled(v11))
  {
    log = v11;
    os_signpost_type_t type = v10;
    os_signpost_id_t spid = v9;
    __os_log_helper_16_0_0(v8);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, log, type, spid, "Grimaldi APDSCallback", (const char *)&unk_1BA61B929, v8, 2u);
  }
}

- (void)grimaldiLuxReceived:(ApplePhotonDetectorServicesLuxInfo *)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v52 = self;
  SEL v51 = a2;
  v50 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (v50->var4)
  {
    os_log_t v49 = 0;
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
    os_log_t v49 = logHandle;
    os_log_type_t v48 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      v3 = mach_error_string(v50->var4);
      __os_log_helper_16_2_1_8_32((uint64_t)v55, (uint64_t)v3);
      _os_log_error_impl(&dword_1BA438000, v49, v48, "Could not get rLuxSamples: %s", v55, 0xCu);
    }
    context = (void *)MEMORY[0x1BA9ECAE0]();
    [(NSMutableDictionary *)v52->_currentRLuxOutputDict removeAllObjects];
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", [NSNumber numberWithInt:v50->var4], @"status");
    id v47 = 0;
    id v47 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v52->_currentRLuxOutputDict];
    [(CBGrimaldiModule *)v52 sendNotificationForKey:@"RLuxOutput" withValue:v47];

    return;
  }
  if (v52->_overriding)
  {
    [(CBGrimaldiModule *)v52 sendNotificationForKey:@"RLuxOutput" withValue:v52->_overriddenInput];
    [(CBGrimaldiModule *)v52 sendNotificationForKey:@"RLuxOverride" withValue:v52->_overriddenInput];
    os_log_t v46 = 0;
    if (v52->super._logHandle)
    {
      v28 = v52->super._logHandle;
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
    os_log_t v46 = v28;
    os_log_type_t v45 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_overriddenInput, "objectForKeyedSubscript:", @"lux"), "floatValue");
      *(double *)&uint64_t v26 = v4;
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_overriddenInput, "objectForKeyedSubscript:", @"gain"), "floatValue");
      __os_log_helper_16_0_7_8_0_8_0_4_0_8_0_4_0_4_0_4_0((uint64_t)v54, v26, COERCE__INT64(v5), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_overriddenInput, "objectForKeyedSubscript:", @"numsamples"), "intValue"), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_overriddenInput, "objectForKeyedSubscript:", @"absolutetime"), "longValue"), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_overriddenInput, "objectForKeyedSubscript:",
                @"StrobeCoex"),
          "BOOLValue") & 1,
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_overriddenInput, "objectForKeyedSubscript:", @"JasperCoex"), "BOOLValue") & 1, objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_overriddenInput, "objectForKeyedSubscript:", @"GainChanged"), "BOOLValue") & 1);
      _os_log_debug_impl(&dword_1BA438000, v46, v45, "[Overriding] Rear Lux Dictionary: lux = %f, gain = %f, numSamples= %d, absoluteTime = %ld, StrobeCoex = %d, JasperCoex = %d, GainChanged = %d", v54, 0x38u);
    }
    return;
  }
  if (v50->var5)
  {
    v21 = (void *)MEMORY[0x1BA9ECAE0]();
    if (!v50->var5) {
      __assert_rtn("-[CBGrimaldiModule grimaldiLuxReceived:]", "CBGrimaldiModule.m", 717, "luxInfo->numSamples > 0");
    }
    int v41 = 0;
    int v41 = v50->var5 - 1;
    char v40 = 0;
    char v40 = v50->var3[v41];
    v52->_coexStrobe = (v40 & 1) != 0;
    v52->_coexJasper = (v40 & 2) != 0;
    BOOL v39 = 0;
    BOOL v39 = (v50->var3[v50->var5 - 1] & 4) != 0;
    while (1)
    {
      BOOL v20 = 0;
      if (v41 - 1 >= 0) {
        BOOL v20 = (v50->var3[v41] & 4) != 0;
      }
      if (!v20) {
        break;
      }
      --v41;
    }
    float v38 = 0.0;
    float v6 = v50->var0[v41] * v52->_correctionFactor;
    float v38 = v6;
    char v37 = 0;
    char v37 = v50->var3[v41];
    BOOL v36 = (v37 & 4) != 0;
    if ((v37 & 4) != 0)
    {
      id v35 = [(CBGrimaldiModule *)v52 copyReliableLux];
      if (!v35)
      {
        os_log_t v34 = 0;
        if (v52->super._logHandle)
        {
          v19 = v52->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v18 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v18 = init_default_corebrightness_log();
          }
          v19 = v18;
        }
        os_log_t v34 = v19;
        os_log_type_t v33 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v16 = v34;
          os_log_type_t v17 = v33;
          __os_log_helper_16_0_0(v32);
          _os_log_error_impl(&dword_1BA438000, v16, v17, "First sample received with gainChange=1 and no reliable lux is available", v32, 2u);
        }
        goto LABEL_59;
      }
      [v35 floatValue];
      float v38 = v7;
    }
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", [NSNumber numberWithBool:v52->_coexStrobe], @"StrobeCoex");
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", [NSNumber numberWithBool:v52->_coexJasper], @"JasperCoex");
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", [NSNumber numberWithInt:v50->var4], @"status");
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", [NSNumber numberWithUnsignedChar:v50->var5], @"numsamples");
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", [NSNumber numberWithUnsignedLongLong:v50->var2[v41]], @"absolutetime");
    *(float *)&double v8 = v38;
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", [NSNumber numberWithFloat:v8], @"lux");
    *(float *)&double v9 = v50->var1[v41];
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", [NSNumber numberWithFloat:v9], @"gain");
    -[NSMutableDictionary setValue:forKey:](v52->_currentRLuxOutputDict, "setValue:forKey:", [NSNumber numberWithBool:v39], @"GainChanged");
    -[CBGrimaldiModule sendNotificationForKey:withValue:](v52, "sendNotificationForKey:withValue:", @"RLuxOutput", (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v52->_currentRLuxOutputDict]);
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
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_currentRLuxOutputDict, "objectForKeyedSubscript:", @"lux"), "floatValue");
      *(double *)&uint64_t v13 = v11;
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_currentRLuxOutputDict, "objectForKeyedSubscript:", @"gain"), "floatValue");
      __os_log_helper_16_0_9_8_0_8_0_4_0_8_0_4_0_4_0_4_0_4_0_4_0((uint64_t)v53, v13, COERCE__INT64(v12), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_currentRLuxOutputDict, "objectForKeyedSubscript:", @"numsamples"), "intValue"), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_currentRLuxOutputDict, "objectForKeyedSubscript:", @"absolutetime"), "longValue"), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_currentRLuxOutputDict, "objectForKeyedSubscript:",
                @"StrobeCoex"),
          "BOOLValue") & 1,
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_currentRLuxOutputDict, "objectForKeyedSubscript:", @"JasperCoex"), "BOOLValue") & 1, objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v52->_currentRLuxOutputDict, "objectForKeyedSubscript:", @"GainChanged"), "BOOLValue") & 1, v41 + 1, v50->var5);
      _os_log_debug_impl(&dword_1BA438000, v15, OS_LOG_TYPE_DEBUG, "Rear Lux Dictionary: lux = %f, gain = %f, numSamples= %d, absoluteTime = %ld, StrobeCoex = %d, JasperCoex = %d, GainChanged = %d (sample %d/%d)", v53, 0x44u);
    }
    *(float *)&double v10 = v38;
    v52->_currentNumSamples = [(CBGrimaldiSamplingStrategy *)v52->_samplingStrategy getNextNumberOfSamplesFromNewLux:v52->_lastLux withLastLux:v10];
LABEL_59:
    return;
  }
  os_log_t oslog = 0;
  if (v52->super._logHandle)
  {
    v25 = v52->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v24 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v24 = init_default_corebrightness_log();
    }
    v25 = v24;
  }
  os_log_t oslog = v25;
  os_log_type_t v43 = OS_LOG_TYPE_FAULT;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    v22 = oslog;
    os_log_type_t v23 = v43;
    __os_log_helper_16_0_0(v42);
    _os_log_fault_impl(&dword_1BA438000, v22, v23, "APDS framework didn't provide the requested sample", v42, 2u);
  }
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"RLuxOutput"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && a4 != self->_lastRLuxOutputDict)
    {

      self->_lastRLuxOutputDict = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:a4];
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
        __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)a4);
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "RearLuxOutput %@", v8, 0xCu);
      }
    }
  }
  if (self->super._notificationBlock) {
    (*((void (**)(void))self->super._notificationBlock + 2))();
  }
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v50 = self;
  SEL v49 = a2;
  id v48 = a3;
  id v47 = a4;
  if ([a4 isEqualToString:@"RLuxOverride"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v50->_overriding = 1;
      context = (void *)MEMORY[0x1BA9ECAE0]();
      objc_msgSend((id)objc_msgSend(v48, "objectForKeyedSubscript:", @"lux"), "floatValue");
      float v46 = v4;
      objc_msgSend((id)objc_msgSend(v48, "objectForKeyedSubscript:", @"gain"), "floatValue");
      float v45 = v5;
      unsigned __int8 v44 = objc_msgSend((id)objc_msgSend(v48, "objectForKeyedSubscript:", @"numsamples"), "integerValue");
      uint64_t v43 = objc_msgSend((id)objc_msgSend(v48, "objectForKeyedSubscript:", @"absolutetime"), "longValue");
      char v42 = objc_msgSend((id)objc_msgSend(v48, "objectForKeyedSubscript:", @"coexflags"), "integerValue");
      BOOL v41 = (v42 & 1) != 0;
      BOOL v40 = (v42 & 2) != 0;
      BOOL v39 = (v42 & 4) != 0;
      os_log_t v38 = 0;
      if (v50->super._logHandle)
      {
        logHandle = v50->super._logHandle;
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
      os_log_t v38 = logHandle;
      os_log_type_t v37 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_7_8_0_8_0_4_0_8_0_4_0_4_0_4_0((uint64_t)v54, COERCE__INT64(v46), COERCE__INT64(v45), v44, v43, v41, v40, v39);
        _os_log_debug_impl(&dword_1BA438000, v38, v37, "rLux: %f, gain: %f, numSamples: %d, rLuxAbsoluteTime: %llu, StrobeOn? %d JasperOn? %d GainChange? %d", v54, 0x38u);
      }

      v50->_overriddenInput = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *(float *)&double v6 = v46;
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", [NSNumber numberWithFloat:v6], @"lux");
      *(float *)&double v7 = v45;
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", [NSNumber numberWithFloat:v7], @"gain");
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", [NSNumber numberWithInteger:v44], @"numsamples");
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", [NSNumber numberWithLong:v43], @"absolutetime");
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", [NSNumber numberWithBool:v41], @"StrobeCoex");
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", [NSNumber numberWithBool:v40], @"JasperCoex");
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", [NSNumber numberWithBool:v39], @"GainChanged");
      -[NSMutableDictionary setValue:forKey:](v50->_overriddenInput, "setValue:forKey:", [NSNumber numberWithInt:0], @"status");
      os_log_t v36 = 0;
      if (v50->super._logHandle)
      {
        v19 = v50->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v18 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v18 = init_default_corebrightness_log();
        }
        v19 = v18;
      }
      os_log_t v36 = v19;
      os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v53, (uint64_t)v50->_overriddenInput);
        _os_log_impl(&dword_1BA438000, v36, v35, "Overridden input dict: %@", v53, 0xCu);
      }
    }
  }
  else if ([v47 isEqualToString:@"RLuxOverrideEnabled"])
  {
    v50->_overriding = [v48 BOOLValue] & 1;
    os_log_t v34 = 0;
    if (v50->super._logHandle)
    {
      os_log_type_t v17 = v50->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v16 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v16 = init_default_corebrightness_log();
      }
      os_log_type_t v17 = v16;
    }
    os_log_t v34 = v17;
    os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v52, v50->_overriding);
      _os_log_impl(&dword_1BA438000, v34, v33, "Setting rLuxOverride to %d", v52, 8u);
    }
  }
  else if ([v47 isEqualToString:@"RLuxSampleWithMaxAge"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v48 floatValue];
      float v32 = v8;
      os_log_t v31 = 0;
      if (v50->super._logHandle)
      {
        v15 = v50->super._logHandle;
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
      os_log_t v31 = v15;
      os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v51, COERCE__INT64(v32));
        _os_log_impl(&dword_1BA438000, v31, v30, "Requesting Sample with age < %f", v51, 0xCu);
      }
      BOOL v29 = 0;
      if ([(NSDictionary *)v50->_lastRLuxOutputDict objectForKeyedSubscript:@"absolutetime"])
      {
        uint64_t v28 = 0;
        uint64_t v28 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v50->_lastRLuxOutputDict, "objectForKeyedSubscript:", @"absolutetime"), "longValue");
        uint64_t v27 = mach_absolute_time();
        unint64_t v26 = convertMachToNanoSeconds(v27 - v28) / 0xF4240uLL;
        BOOL v29 = (float)v26 < (float)(v32 * 1000.0);
      }
      if (v29)
      {
        [(CBGrimaldiModule *)v50 sendNotificationForKey:@"RLuxOutput" withValue:v50->_lastRLuxOutputDict];
      }
      else
      {
        os_log_t oslog = 0;
        if (v50->super._logHandle)
        {
          uint64_t v13 = v50->super._logHandle;
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
        os_log_t oslog = v13;
        os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          double v10 = oslog;
          os_log_type_t v11 = v24;
          __os_log_helper_16_0_0(v23);
          _os_log_impl(&dword_1BA438000, v10, v11, "Grimaldi: no sample. Sarting single sampling", v23, 2u);
        }
        [(CBGrimaldiModule *)v50 startSingleSample];
      }
    }
  }
  return 0;
}

- (void)startSingleSample
{
  LODWORD(v2) = 1.0;
  -[CBGrimaldiModule startWithFrequency:singleSample:](self, "startWithFrequency:singleSample:", 1, v2, a2, self);
}

- (void)startWithFrequency:(float)a3 singleSample:(BOOL)a4
{
  float v4 = a3;
  if (a4) {
    self->_sampleOnce = 1;
  }
  else {
    self->_sampleMultiple = 1;
  }
  if (!self->_started)
  {
    if (a3 <= 0.0) {
      float v4 = 1.0;
    }
    self->_samplingTime = (unint64_t)(float)(1000000000.0 / v4);
    self->_started = 1;
    [(CBGrimaldiModule *)self timerCallback];
  }
}

- (void)timerCallback
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15 = self;
  SEL v14 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (v15->_provideLux) {
    [(CBGrimaldiModule *)v15 setGrimaldiLux];
  }
  if (!v15->_provideLux && v15->_provideCoex) {
    [(CBGrimaldiModule *)v15 CBAPDSGetCoex];
  }
  if (v15->_sampleOnce) {
    v15->_sampleOnce = 0;
  }
  if (v15->_sampleMultiple)
  {
    if (v15->_started)
    {
      if (v15->_samplingTime == -1)
      {
        os_log_t v13 = 0;
        if (v15->super._logHandle)
        {
          logHandle = v15->super._logHandle;
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
        os_log_type_t v12 = OS_LOG_TYPE_FAULT;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_FAULT))
        {
          __os_log_helper_16_0_2_4_0_4_0((uint64_t)v16, v15->_sampleOnce, v15->_sampleMultiple);
          _os_log_fault_impl(&dword_1BA438000, v13, v12, "Timer callback fired after Grimaldi stopped. sampleOnce: %d, sampleMultiple: %d", v16, 0xEu);
        }
      }
      else
      {
        dispatch_time_t v2 = dispatch_time(0, v15->_samplingTime);
        queue = v15->super._queue;
        uint64_t block = MEMORY[0x1E4F143A8];
        int v7 = -1073741824;
        int v8 = 0;
        uint64_t v9 = __33__CBGrimaldiModule_timerCallback__block_invoke;
        double v10 = &unk_1E6218FE0;
        os_log_type_t v11 = v15;
        dispatch_after(v2, queue, &block);
      }
    }
    else
    {
      [(CBGrimaldiModule *)v15 clearOutput];
    }
  }
  else
  {
    [(CBGrimaldiModule *)v15 stop];
  }
}

- (void)stop
{
  if (!self->_sampleOnce) {
    self->_started = 0;
  }
  self->_sampleMultiple = 0;
  self->_samplingTime = -1;
}

- (void)setGrimaldiLux
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  os_log_type_t v23 = self;
  SEL v22 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  int v21 = 0;
  os_signpost_id_t v20 = 0;
  os_signpost_id_t v20 = os_signpost_id_generate((os_log_t)v23->super._logHandle);
  os_log_t v19 = 0;
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
  os_log_t v19 = logHandle;
  char v18 = 1;
  os_signpost_id_t v17 = v20;
  if (v20 && v17 != -1 && os_signpost_enabled(v19))
  {
    log = v19;
    os_signpost_type_t type = v18;
    os_signpost_id_t spid = v17;
    __os_log_helper_16_0_0(v16);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, log, type, spid, "Grimaldi APDSCallback", (const char *)&unk_1BA61B929, v16, 2u);
  }
  v15 = 0;
  if (v23->super._logHandle)
  {
    int v7 = v23->super._logHandle;
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
  v15 = v7;
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    float v4 = v15;
    os_log_type_t v5 = v14;
    __os_log_helper_16_0_0(v13);
    _os_log_impl(&dword_1BA438000, v4, v5, "Requesting lux from APDS", v13, 2u);
  }
  int v21 = -[CBGrimaldiEventSource requestEventOn:withNsamples:withCallback:](v23->_eventSource, "requestEventOn:withNsamples:withCallback:", v23->super._queue, v23->_currentNumSamples);
  if (v21)
  {
    if (v23->super._logHandle)
    {
      v3 = v23->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v2 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v2 = init_default_corebrightness_log();
      }
      v3 = v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v24, v21);
      _os_log_error_impl(&dword_1BA438000, v3, OS_LOG_TYPE_ERROR, "eventSource::requestEventOn returned %d", v24, 8u);
    }
  }
}

- (CBGrimaldiModule)initWithQueue:(id)a3 andEventSource:(id)a4 andSamplingStrategy:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v56 = self;
  SEL v55 = a2;
  id v54 = a3;
  id v53 = a4;
  id v52 = a5;
  v51.receiver = self;
  v51.super_class = (Class)CBGrimaldiModule;
  id v56 = [(CBModule *)&v51 initWithQueue:a3];
  if (v56)
  {
    os_log_t v5 = os_log_create((const char *)CBGrimaldiModuleName, "default");
    *((void *)v56 + 2) = v5;
    if (!*((void *)v56 + 2))
    {
      v50 = 0;
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      v50 = inited;
      char v49 = 16;
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
      {
        log = v50;
        os_log_type_t type = v49;
        __os_log_helper_16_0_0(v48);
        _os_log_error_impl(&dword_1BA438000, log, type, "failed to create log handle", v48, 2u);
      }
      goto LABEL_50;
    }
    if ((CBU_DeviceHasGrimaldi() & 1) == 0)
    {
LABEL_50:

      return 0;
    }
    dispatch_queue_t v6 = dispatch_queue_create((const char *)CBGrimaldiModuleName, 0);
    *((void *)v56 + 15) = v6;
    if (!*((void *)v56 + 15))
    {
      id v47 = 0;
      if (*((void *)v56 + 2))
      {
        uint64_t v27 = *((void *)v56 + 2);
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
      id v47 = v27;
      char v46 = 16;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        os_log_type_t v24 = v47;
        os_log_type_t v25 = v46;
        __os_log_helper_16_0_0(v45);
        _os_log_error_impl(&dword_1BA438000, v24, v25, "Failed to create dispatch queue", v45, 2u);
      }
      goto LABEL_50;
    }
    *((double *)v56 + 10) = 1.0;
    if (!v53)
    {
      unsigned __int8 v44 = 0;
      if (*((void *)v56 + 2))
      {
        os_log_type_t v23 = *((void *)v56 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v22 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v22 = init_default_corebrightness_log();
        }
        os_log_type_t v23 = v22;
      }
      unsigned __int8 v44 = v23;
      os_log_type_t v43 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        os_signpost_id_t v20 = v44;
        os_log_type_t v21 = v43;
        __os_log_helper_16_0_0(v42);
        _os_log_impl(&dword_1BA438000, v20, v21, "Event Source is nil", v42, 2u);
      }
      goto LABEL_50;
    }
    id v7 = v53;
    *((void *)v56 + 13) = v7;
    if (!v52)
    {
      BOOL v41 = 0;
      if (*((void *)v56 + 2))
      {
        os_log_t v19 = *((void *)v56 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v18 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v18 = init_default_corebrightness_log();
        }
        os_log_t v19 = v18;
      }
      BOOL v41 = v19;
      os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = v41;
        os_log_type_t v17 = v40;
        __os_log_helper_16_0_0(v39);
        _os_log_impl(&dword_1BA438000, v16, v17, "Sampling Strategy is nil", v39, 2u);
      }
      goto LABEL_50;
    }
    id v8 = v52;
    *((void *)v56 + 14) = v8;
    os_log_t v38 = 0;
    if (*((void *)v56 + 2))
    {
      v15 = *((void *)v56 + 2);
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
    os_log_t v38 = v15;
    os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v58, *((void *)v56 + 14), *((void *)v56 + 13));
      _os_log_impl(&dword_1BA438000, v38, v37, "Grimaldi init: %@, %@", v58, 0x16u);
    }
    uint64_t v9 = *((void *)v56 + 15);
    uint64_t block = MEMORY[0x1E4F143A8];
    int v32 = -1073741824;
    int v33 = 0;
    os_log_t v34 = __69__CBGrimaldiModule_initWithQueue_andEventSource_andSamplingStrategy___block_invoke;
    os_log_type_t v35 = &unk_1E6218FE0;
    id v36 = v56;
    dispatch_async(v9, &block);
    *((void *)v56 + 11) = -1;
    *((unsigned char *)v56 + 128) = 1;
    *((unsigned char *)v56 + 129) = 0;
    char v10 = [v52 getInitialNumberOfSamples];
    *((unsigned char *)v56 + 96) = v10;
    *((unsigned char *)v56 + 100) = 0;
    *((unsigned char *)v56 + 101) = 0;
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v56 + 4) = v11;
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"lux", @"gain", @"absoluteTime", @"numSamples", @"StrobeCoex", @"JasperCoex", 0);
    *((void *)v56 + 8) = v12;
  }
  return (CBGrimaldiModule *)v56;
}

void __69__CBGrimaldiModule_initWithQueue_andEventSource_andSamplingStrategy___block_invoke(uint64_t a1)
{
  v12[2] = a1;
  v12[1] = a1;
  v12[0] = 0;
  int v11 = 0;
  int v11 = [*(id *)(*(void *)(a1 + 32) + 104) getGlobalCorrectionFactor:v12];
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  uint64_t block = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  dispatch_queue_t v6 = __69__CBGrimaldiModule_initWithQueue_andEventSource_andSamplingStrategy___block_invoke_2;
  id v7 = &unk_1E6219BA8;
  int v10 = v11;
  uint64_t v9 = v12[0];
  uint64_t v8 = *(void *)(a1 + 32);
  dispatch_sync(v1, &block);
}

void __69__CBGrimaldiModule_initWithQueue_andEventSource_andSamplingStrategy___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (!*(_DWORD *)(a1 + 48) && *(double *)(a1 + 40) > 0.5) {
    *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(a1 + 40);
  }
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    uint64_t v2 = inited;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_2_8_0_8_0((uint64_t)v4, *(void *)(*(void *)(a1 + 32) + 80), *(void *)(a1 + 40));
    _os_log_impl(&dword_1BA438000, v2, OS_LOG_TYPE_DEFAULT, "Grimaldi init: correction factor = %f (found %f)", v4, 0x16u);
  }
}

- (void)dealloc
{
  int v4 = self;
  SEL v3 = a2;

  if (v4->super._logHandle)
  {

    v4->super._logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBGrimaldiModule;
  [(CBModule *)&v2 dealloc];
}

- (void)start
{
  LODWORD(v2) = 1.0;
  -[CBGrimaldiModule startWithFrequency:](self, "startWithFrequency:", v2, a2, self);
}

- (void)startWithFrequency:(float)a3
{
}

- (void)clearOutput
{
  int v10 = self;
  SEL v9 = a2;
  [(NSMutableDictionary *)self->_currentRLuxOutputDict removeAllObjects];
  uint64_t v8 = 0;
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
  uint64_t v8 = logHandle;
  char v7 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v8;
    os_log_type_t type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_debug_impl(&dword_1BA438000, log, type, "Grimaldi: cleared output", v6, 2u);
  }

  v10->_lastLux = 0;
}

- (id)copyPropertyForKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_2_1_8_64((uint64_t)v15, (uint64_t)a3);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "copyPropertyForKey called with key: %@", v15, 0xCu);
  }
  int v10 = 0;
  if ([a3 isEqualToString:@"RLuxOutput"])
  {
    if (self->super._logHandle)
    {
      char v7 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v6 = init_default_corebrightness_log();
      }
      char v7 = v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v14, (uint64_t)self->_currentRLuxOutputDict);
      _os_log_debug_impl(&dword_1BA438000, v7, OS_LOG_TYPE_DEBUG, "copyPropertyForKey returning value: %@", v14, 0xCu);
    }
    return (id)[(NSMutableDictionary *)self->_currentRLuxOutputDict copy];
  }
  else if (([a3 isEqualToString:@"RLuxOverride"] & 1) != 0 && self->_overriding)
  {
    int v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_overriddenInput copyItems:1];
    if (self->super._logHandle)
    {
      uint64_t v5 = self->super._logHandle;
    }
    else
    {
      uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      uint64_t v5 = v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v13, (uint64_t)self->_overriddenInput);
      _os_log_debug_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEBUG, "copyPropertyForKey returning value: %@", v13, 0xCu);
    }
  }
  return v10;
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (void)registerNotificationBlock:(id)a3
{
  if (a3) {
    self->super._notificationBlock = _Block_copy(a3);
  }
}

- (void)unregisterNotificationBlock
{
  if (self->super._notificationBlock)
  {
    _Block_release(self->super._notificationBlock);
    self->super._notificationBlock = 0;
  }
}

uint64_t __33__CBGrimaldiModule_timerCallback__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerCallback", a1, a1);
}

- (void)CBAPDSGetCoex
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  os_log_type_t v43 = self;
  SEL v42 = a2;
  int v41 = 0;
  os_signpost_id_t v40 = 0;
  os_signpost_id_t v40 = os_signpost_id_generate((os_log_t)self->super._logHandle);
  os_log_t v39 = 0;
  if (v43->super._logHandle)
  {
    logHandle = v43->super._logHandle;
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
  os_log_t v39 = logHandle;
  char v38 = 1;
  os_signpost_id_t v37 = v40;
  if (v40 && v37 != -1 && os_signpost_enabled(v39))
  {
    log = v39;
    os_signpost_type_t type = v38;
    os_signpost_id_t spid = v37;
    __os_log_helper_16_0_0(v36);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, log, type, spid, "Grimaldi GetCoexFlags", (const char *)&unk_1BA61B929, v36, 2u);
  }
  int v35 = 0;
  int v35 = [(CBGrimaldiEventSource *)v43->_eventSource getCoexFlags:&v41];
  os_log_t v34 = 0;
  if (v43->super._logHandle)
  {
    uint64_t v18 = v43->super._logHandle;
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
  os_log_t v34 = v18;
  char v33 = 2;
  os_signpost_id_t v32 = v40;
  if (v40 && v32 != -1 && os_signpost_enabled(v34))
  {
    uint64_t v14 = v34;
    os_signpost_type_t v15 = v33;
    os_signpost_id_t v16 = v32;
    __os_log_helper_16_0_0(v31);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v14, v15, v16, "Grimaldi GetCoexFlags", (const char *)&unk_1BA61B929, v31, 2u);
  }
  if (v35)
  {
    uint64_t v26 = 0;
    if (v43->super._logHandle)
    {
      SEL v9 = v43->super._logHandle;
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
    uint64_t v26 = v9;
    char v25 = 16;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = v26;
      os_log_type_t v7 = v25;
      __os_log_helper_16_0_0(v24);
      _os_log_error_impl(&dword_1BA438000, v6, v7, "Failed to get coex flags using APDSGetCoexFunction.", v24, 2u);
    }
  }
  else
  {
    if (v43->_coexStrobe != (v41 & 1))
    {
      v43->_coexStrobe = (v41 & 1) != 0;
      os_log_t v30 = 0;
      if (v43->super._logHandle)
      {
        os_log_t v13 = v43->super._logHandle;
      }
      else
      {
        uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        os_log_t v13 = v12;
      }
      os_log_t v30 = v13;
      os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (v41) {
          double v2 = "ON";
        }
        else {
          double v2 = "OFF";
        }
        if ((v41 & 2) != 0) {
          SEL v3 = "ON";
        }
        else {
          SEL v3 = "OFF";
        }
        __os_log_helper_16_2_2_8_32_8_32((uint64_t)v45, (uint64_t)v2, (uint64_t)v3);
        _os_log_impl(&dword_1BA438000, v30, v29, "APDSGetCoex: Strobe %s, Lidar %s", v45, 0x16u);
      }
    }
    if (v43->_coexJasper != (v41 & 2))
    {
      v43->_coexJasper = (v41 & 2) != 0;
      os_log_t v28 = 0;
      if (v43->super._logHandle)
      {
        int v11 = v43->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v10 = init_default_corebrightness_log();
        }
        int v11 = v10;
      }
      os_log_t v28 = v11;
      os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        if (v41) {
          uint64_t v4 = "ON";
        }
        else {
          uint64_t v4 = "OFF";
        }
        if ((v41 & 2) != 0) {
          uint64_t v5 = "ON";
        }
        else {
          uint64_t v5 = "OFF";
        }
        __os_log_helper_16_2_2_8_32_8_32((uint64_t)v44, (uint64_t)v4, (uint64_t)v5);
        _os_log_impl(&dword_1BA438000, v28, v27, "APDSGetCoex: Strobe %s, Lidar %s", v44, 0x16u);
      }
    }
  }
}

- (id)copyParam:(id)a3
{
  os_log_t v13 = self;
  SEL v12 = a2;
  id v11 = a3;
  if ([a3 isEqualToString:@"lux"]) {
    return [(CBGrimaldiModule *)v13 copyRearLux];
  }
  if ([v11 isEqualToString:@"GainChanged"]) {
    return [(CBGrimaldiModule *)v13 copyGainChanged];
  }
  if ([v11 isEqualToString:@"StrobeCoex"]) {
    return [(CBGrimaldiModule *)v13 copyStrobeCoex];
  }
  if ([v11 isEqualToString:@"JasperCoex"]) {
    return [(CBGrimaldiModule *)v13 copyJasperCoex];
  }
  uint64_t v10 = 0;
  if (v13->super._logHandle)
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
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v10;
    os_log_type_t type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_impl(&dword_1BA438000, log, type, "Unsupported key! Exiting...", v8, 2u);
  }
  return 0;
}

- (id)copyStrobeCoex
{
  if (self->_overriding) {
    return (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_overriddenInput, "objectForKeyedSubscript:", @"StrobeCoex"), "copy");
  }
  else {
    return (id)[objc_alloc(NSNumber) initWithBool:self->_coexStrobe];
  }
}

- (id)copyJasperCoex
{
  if (self->_overriding) {
    return (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_overriddenInput, "objectForKeyedSubscript:", @"JasperCoex"), "copy");
  }
  else {
    return (id)[objc_alloc(NSNumber) initWithBool:self->_coexJasper];
  }
}

- (BOOL)strobeCoex
{
  if (self->_overriding) {
    int coexStrobe = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_overriddenInput, "objectForKeyedSubscript:", @"StrobeCoex"), "BOOLValue") & 1;
  }
  else {
    int coexStrobe = self->_coexStrobe;
  }
  return coexStrobe != 0;
}

- (BOOL)jasperCoex
{
  if (self->_overriding) {
    int coexJasper = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_overriddenInput, "objectForKeyedSubscript:", @"JasperCoex"), "BOOLValue") & 1;
  }
  else {
    int coexJasper = self->_coexJasper;
  }
  return coexJasper != 0;
}

- (BOOL)provideLux
{
  return self->_provideLux;
}

- (void)setProvideLux:(BOOL)a3
{
  self->_provideLux = a3;
}

- (BOOL)provideCoex
{
  return self->_provideCoex;
}

- (void)setProvideCoex:(BOOL)a3
{
  self->_provideCoex = a3;
}

@end