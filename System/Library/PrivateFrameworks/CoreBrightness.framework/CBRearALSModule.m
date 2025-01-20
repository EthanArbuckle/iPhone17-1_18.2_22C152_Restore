@interface CBRearALSModule
- (BOOL)AABSensorOverridePropertyHandler:(id)a3;
- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)displayBrightnessFactorPropertyHandler:(id)a3;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (BOOL)isMitigationActive;
- (BOOL)isRearALSSupported;
- (BOOL)rLuxOverridePropertyHandler:(id)a3;
- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (CBRearALSModule)initWithQueue:(id)a3 andGrimaldiFactory:(id)a4;
- (id)copyParam:(id)a3;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (id)copyRearLux;
- (void)dealloc;
- (void)startSamplingWithFrequency:(float)a3;
- (void)stop;
- (void)stopSampling;
@end

@implementation CBRearALSModule

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(CBALSNode *)self->_rearALS conformsToHIDServiceClient:a3])
  {

    self->_rearALS = 0;
    self->_lastLux = 0;
    if (self->_Grimaldi) {
      self->_providerType = 2;
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
      __os_log_helper_16_2_1_8_64((uint64_t)v7, (uint64_t)self->_rearALS);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Remove rear ALS sensor %@.", v7, 0xCu);
    }
    [(CBGrimaldiModule *)self->_Grimaldi setProvideLux:1];
    [(CBGrimaldiModule *)self->_Grimaldi setProvideCoex:0];
  }
  return 0;
}

- (id)copyParam:(id)a3
{
  if ([a3 isEqualToString:@"lux"]) {
    return [(CBRearALSModule *)self copyRearLux];
  }
  if ([a3 isEqualToString:@"GainChanged"]) {
    return [(CBGrimaldiModule *)self->_Grimaldi copyGainChanged];
  }
  return [(CBGrimaldiModule *)self->_Grimaldi copyRearLux];
}

- (id)copyRearLux
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = 0;
  if (self->_providerType == 1 && self->_rearALS)
  {
    if (self->_started)
    {
      if (self->_enableIlluminanceOverride)
      {
        id v20 = (id)[objc_alloc(NSNumber) initWithDouble:self->_illuminanceOverride];
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
          __os_log_helper_16_0_1_8_0((uint64_t)v26, COERCE__INT64(self->_illuminanceOverride));
          _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "Copy overridden rear ALS Lux = %f", v26, 0xCu);
        }
      }
      else if ([(CBRearALSModule *)self isMitigationActive])
      {
        id v20 = (id)[(NSNumber *)self->_lastLux copy];
        if (self->super._logHandle)
        {
          v10 = self->super._logHandle;
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
          [(NSNumber *)self->_lastLux floatValue];
          __os_log_helper_16_0_1_8_0((uint64_t)v23, COERCE__INT64(v5));
          _os_log_impl(&dword_1BA438000, v10, OS_LOG_TYPE_INFO, "Mitigation is active -> copy last valid rear ALS Lux = %f", v23, 0xCu);
        }
      }
      else
      {
        v19 = [(CBALSNode *)self->_rearALS currentALSEvent];
        float v18 = mach_time_now_in_seconds();
        if (!v19 || ([(CBHIDEvent *)v19 timestamp], vabds_f32(v18, v2) >= 1.0))
        {

          LODWORD(v3) = 1.0;
          v19 = [(CBALSNode *)self->_rearALS copyALSEventWithinTimeout:v3];
          if (self->super._logHandle)
          {
            v15 = self->super._logHandle;
          }
          else
          {
            uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            v15 = v14;
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v25, (uint64_t)v19);
            _os_log_impl(&dword_1BA438000, v15, OS_LOG_TYPE_INFO, "Copied ALS event %@", v25, 0xCu);
          }
        }
        if (v19)
        {
          id v13 = objc_alloc(NSNumber);
          [(CBALSEvent *)v19 illuminance];
          id v20 = (id)objc_msgSend(v13, "initWithDouble:");

          self->_lastLux = (NSNumber *)[v20 copy];
          if (self->super._logHandle)
          {
            v12 = self->super._logHandle;
          }
          else
          {
            uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            v12 = v11;
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            [(CBALSEvent *)v19 illuminance];
            __os_log_helper_16_0_1_8_0((uint64_t)v24, v4);
            _os_log_impl(&dword_1BA438000, v12, OS_LOG_TYPE_INFO, "Copy rear ALS Lux = %f", v24, 0xCu);
          }
        }
      }
    }
  }
  else if (self->_providerType == 2 && self->_Grimaldi)
  {
    id v20 = [(CBGrimaldiModule *)self->_Grimaldi copyRearLux];
    if (self->super._logHandle)
    {
      uint64_t v8 = self->super._logHandle;
    }
    else
    {
      uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      uint64_t v8 = v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v22, (uint64_t)v20);
      _os_log_impl(&dword_1BA438000, v8, OS_LOG_TYPE_INFO, "Copy Grimaldi Lux = %@", v22, 0xCu);
    }
  }
  return v20;
}

- (BOOL)isRearALSSupported
{
  BOOL v3 = 1;
  if (!self->_Grimaldi) {
    return self->_rearALS != 0;
  }
  return v3;
}

uint64_t __52__CBRearALSModule_initWithQueue_andGrimaldiFactory___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3) {
      return [*(id *)(*(void *)(*(void *)(result + 32) + 8) + 40) sendNotificationForKey:a2 withValue:a3];
    }
  }
  return result;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  char v5 = 0;
  if (([a4 isEqualToString:@"DisplayBrightnessFactor"] & 1) != 0
    || ([a4 isEqualToString:@"DisplayBrightnessFactorWithFade"] & 1) != 0)
  {
    char v5 = [(CBRearALSModule *)self displayBrightnessFactorPropertyHandler:a3];
  }
  else if ([a4 isEqualToString:@"AABSensorOverride"])
  {
    char v5 = [(CBRearALSModule *)self AABSensorOverridePropertyHandler:a3];
  }
  else if ([a4 isEqualToString:@"RLuxOverride"])
  {
    char v5 = [(CBRearALSModule *)self rLuxOverridePropertyHandler:a3];
  }
  else if ([a4 isEqualToString:@"RLuxOverrideEnabled"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_enableIlluminanceOverride = [a3 BOOLValue] & 1;
      char v5 = 1;
    }
  }
  return (v5 & 1 | [(CBGrimaldiModule *)self->_Grimaldi setProperty:a3 forKey:a4]) != 0;
}

- (CBRearALSModule)initWithQueue:(id)a3 andGrimaldiFactory:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v26 = self;
  SEL v25 = a2;
  id v24 = a3;
  id v23 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CBRearALSModule;
  id v26 = [(CBModule *)&v22 initWithQueue:a3];
  if (!v26) {
    return (CBRearALSModule *)v26;
  }
  *((void *)v26 + 2) = os_log_create("com.apple.CoreBrightness.AABRear.CBRearALSModule", "default");
  if (*((void *)v26 + 2))
  {
    *((void *)v26 + 6) = 0;
    float v18 = objc_alloc_init(GrimaldiAPDSEventSource);
    [v23 setQueue:v24];
    [v23 setEventSource:v18];

    *((void *)v26 + 4) = [v23 newInstance];
    os_log_t v17 = 0;
    if (*((void *)v26 + 2))
    {
      v6 = *((void *)v26 + 2);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      v6 = inited;
    }
    os_log_t v17 = v6;
    os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v28, (uint64_t)v26, *((void *)v26 + 4));
      _os_log_debug_impl(&dword_1BA438000, v17, v16, "RearALS: obj (%@) initialized with ALS: %@", v28, 0x16u);
    }
    if (*((void *)v26 + 4))
    {
      *((void *)v26 + 6) = 2;
      v10[0] = 0;
      v10[1] = v10;
      int v11 = 1375731712;
      int v12 = 48;
      id v13 = __Block_byref_object_copy__4;
      uint64_t v14 = __Block_byref_object_dispose__4;
      id v15 = v26;
      objc_msgSend(*((id *)v26 + 4), "registerNotificationBlock:");
      _Block_object_dispose(v10, 8);
    }
    *((void *)v26 + 5) = 0;
    *((unsigned char *)v26 + 56) = 0;
    *((unsigned char *)v26 + 57) = 1;
    *((unsigned char *)v26 + 58) = 0;
    *((unsigned char *)v26 + 59) = 0;
    *((unsigned char *)v26 + 72) = 0;
    *((float *)v26 + 19) = -1.0;
    *((void *)v26 + 8) = 0;
    return (CBRearALSModule *)v26;
  }
  v21 = 0;
  if (_COREBRIGHTNESS_LOG_DEFAULT) {
    uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
  }
  else {
    uint64_t v9 = init_default_corebrightness_log();
  }
  v21 = v9;
  char v20 = 16;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    log = v21;
    os_log_type_t type = v20;
    __os_log_helper_16_0_0(v19);
    _os_log_error_impl(&dword_1BA438000, log, type, "failed to create log handle", v19, 2u);
  }

  return 0;
}

- (void)dealloc
{
  uint64_t v4 = self;
  SEL v3 = a2;
  [(CBGrimaldiModule *)self->_Grimaldi unregisterNotificationBlock];

  v4->_lastLux = 0;
  if (v4->super._logHandle)
  {

    v4->super._logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBRearALSModule;
  [(CBModule *)&v2 dealloc];
}

- (void)startSamplingWithFrequency:(float)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_started)
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
      __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Start rear ALS with freq %f.", v8, 0xCu);
    }
    *(float *)&double v3 = a3;
    [(CBGrimaldiModule *)self->_Grimaldi startWithFrequency:v3];
    self->_started = 1;
  }
}

- (void)stopSampling
{
  v10 = self;
  SEL v9 = a2;
  if (self->_started)
  {
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
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      log = v8;
      os_log_type_t type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_impl(&dword_1BA438000, log, type, "Stop sampling.", v6, 2u);
    }
    [(CBGrimaldiModule *)v10->_Grimaldi stop];
    v10->_started = 0;

    v10->_lastLux = 0;
  }
}

- (BOOL)isMitigationActive
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v6 = [(CBGrimaldiModule *)self->_Grimaldi strobeCoex];
  if (v6 != self->_strobeCoex)
  {
    self->_strobeCoex = v6 & 1;
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
        objc_super v2 = "activated";
      }
      else {
        objc_super v2 = "deactivated";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v2);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Strobe mitigation %s.", v8, 0xCu);
    }
  }
  return self->_strobeCoex;
}

- (id)copyPropertyForKey:(id)a3
{
  return [(CBGrimaldiModule *)self->_Grimaldi copyPropertyForKey:a3];
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return -[CBGrimaldiModule copyPropertyForKey:withParameter:](self->_Grimaldi, "copyPropertyForKey:withParameter:", a3, a4, a4, a3, a2, self);
}

- (void)stop
{
}

- (BOOL)displayBrightnessFactorPropertyHandler:(id)a3
{
  BOOL v6 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = (id)[a3 objectForKey:@"DisplayBrightnessFactor"];
  }
  else {
    id v5 = a3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 floatValue];
    if (v3 <= 0.0)
    {
      self->_displayOn = 0;
      if (self->_rearALS) {
        [(CBALSNode *)self->_rearALS setReportInterval:0];
      }

      self->_lastLux = 0;
    }
    else
    {
      self->_displayOn = 1;
      if (self->_rearALS && [(CBALSNode *)self->_rearALS slowIntegrationTime] > 0) {
        [(CBALSNode *)self->_rearALS setReportInterval:[(CBALSNode *)self->_rearALS slowIntegrationTime]];
      }
    }
    return 1;
  }
  return v6;
}

- (BOOL)rLuxOverridePropertyHandler:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_enableIlluminanceOverride = 1;
    [a3 objectForKey:@"lux"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"lux"), "floatValue");
      self->_illuminanceOverride = v3;
    }
  }
  return 1;
}

- (BOOL)AABSensorOverridePropertyHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v12 = 0;
  float v11 = -1.0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 floatValue];
    float v11 = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[a3 objectForKey:@"AABSensorOverrideValue"];
      uint64_t v9 = (void *)[a3 objectForKey:@"AABSensorOverrideOrientation"];
      if (v10)
      {
        [v10 floatValue];
        float v11 = v4;
      }
      if (v9) {
        int v12 = [v9 intValue];
      }
    }
  }
  if (!v12 || [(CBALSNode *)self->_rearALS orientation] == v12)
  {
    self->_illuminanceOverride = v11;
    self->_enableIlluminanceOverride = v11 >= 0.0;
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
    }
    else
    {
      uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      logHandle = v7;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_enableIlluminanceOverride) {
        id v5 = "enabled";
      }
      else {
        id v5 = "disabled";
      }
      __os_log_helper_16_2_2_8_0_8_32((uint64_t)v15, COERCE__INT64(v11), (uint64_t)v5);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Override rear ALS samples with value = %f %s.", v15, 0x16u);
    }
  }
  return 1;
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v7 = 0;
  if (IOHIDServiceClientConformsTo(a3, 0xFF00u, 4u))
  {
    BOOL v6 = [[CBALSNode alloc] initWithALSServiceClient:a3];
    if ([(CBALSNode *)v6 placement] == 2)
    {
      self->_rearALS = v6;
      char v7 = 1;
      self->_providerType = 1;
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
        __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)self->_rearALS);
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Found rear ALS sensor %@.", v10, 0xCu);
      }
      [(CBGrimaldiModule *)self->_Grimaldi setProvideLux:0];
      [(CBGrimaldiModule *)self->_Grimaldi setProvideCoex:1];
      if (self->_displayOn && [(CBALSNode *)self->_rearALS slowIntegrationTime] > 0) {
        [(CBALSNode *)self->_rearALS setReportInterval:[(CBALSNode *)self->_rearALS slowIntegrationTime]];
      }
    }
  }
  return v7 & 1;
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(CBALSNode *)self->_rearALS conformsToHIDServiceClient:a4])
  {
    char v7 = [[CBALSEvent alloc] initWithHIDEvent:a3 andNode:self->_rearALS];
    [(CBALSNode *)self->_rearALS handleALSEvent:v7];
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
      __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v7);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Handle rear ALS hid event %@.", v10, 0xCu);
    }
  }
  return 0;
}

@end