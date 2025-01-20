@interface AABRear
- (AABRear)initWithQueue:(id)a3 andGrimaldiFactory:(id)a4;
- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)checkSensorEnablementConditions:(float)a3;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (BOOL)isRearALSSupported;
- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)shouldUseRLux:(float)a3 rLux:(float)a4;
- (BOOL)shouldUseRearLuxFrontLux:(float)a3 rearLux:(float)a4 andCap:(float)a5;
- (BOOL)started;
- (float)nitsRatio;
- (id)copyParam:(id)a3;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (void)dealloc;
- (void)evaluateSamplingFrequencyWithLux:(float)a3 andCap:(float)a4;
- (void)startSampling;
- (void)stop;
- (void)stopSampling;
@end

@implementation AABRear

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  return [(CBRearALSModule *)self->_rearALSModule removeHIDServiceClient:a3];
}

- (id)copyParam:(id)a3
{
  return [(CBRearALSModule *)self->_rearALSModule copyParam:a3];
}

- (BOOL)started
{
  return self->_started;
}

- (BOOL)checkSensorEnablementConditions:(float)a3
{
  if (self->_sensorEnabled)
  {
    if (a3 < self->_frontALSThreshold && self->_activationFLux < 0.0)
    {
      [(CBRearALSModule *)self->_rearALSModule stopSampling];
      self->_sensorEnabled = 0;
      self->_lastFrequency = 0.0;
    }
  }
  else if (a3 > self->_frontALSThreshold)
  {
    self->_lastFrequency = 1.0;
    *(float *)&double v3 = self->_lastFrequency;
    [(CBRearALSModule *)self->_rearALSModule startSamplingWithFrequency:v3];
    self->_sensorEnabled = 1;
  }
  return self->_sensorEnabled;
}

- (BOOL)isRearALSSupported
{
  return [(CBRearALSModule *)self->_rearALSModule isRearALSSupported];
}

- (float)nitsRatio
{
  return self->_nitsRatioThreshold;
}

uint64_t __44__AABRear_initWithQueue_andGrimaldiFactory___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
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
  return -[CBRearALSModule setProperty:forKey:](self->_rearALSModule, "setProperty:forKey:", a3, a4, a4, a3, a2, self);
}

- (BOOL)shouldUseRearLuxFrontLux:(float)a3 rearLux:(float)a4 andCap:(float)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v24, COERCE__INT64(a3), COERCE__INT64(a4), COERCE__INT64(a5));
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "AABRear: shouldUseRearLuxFrontLux called with (fLux:%f, rLux:%f, cap: %f)", v24, 0x20u);
  }
  *(float *)&double v5 = a3;
  *(float *)&double v6 = a4;
  char v17 = [(AABRear *)self shouldUseRLux:v5 rLux:v6];
  *(float *)&double v7 = a4;
  *(float *)&double v8 = a5;
  [(AABRear *)self evaluateSamplingFrequencyWithLux:v7 andCap:v8];
  if (self->super._logHandle)
  {
    v14 = self->super._logHandle;
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
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v23, v17 & 1);
    _os_log_debug_impl(&dword_1BA438000, v14, OS_LOG_TYPE_DEBUG, "AABRear: using rear? %d", v23, 8u);
  }
  if ((v17 & 1) != self->_shouldUseRearLux)
  {
    self->_shouldUseRearLux = v17 & 1;
    if (self->super._logHandle)
    {
      v12 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v11 = init_default_corebrightness_log();
      }
      v12 = v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_shouldUseRearLux) {
        v9 = "Don't ";
      }
      else {
        v9 = "";
      }
      __os_log_helper_16_2_4_8_32_8_0_8_0_8_0((uint64_t)v22, (uint64_t)v9, COERCE__INT64(a3), COERCE__INT64(a4), COERCE__INT64(a5));
      _os_log_impl(&dword_1BA438000, v12, OS_LOG_TYPE_DEFAULT, "AABRear: %suse rear Lux (fLux:%f, rLux:%f, cap: %f)", v22, 0x2Au);
    }
  }
  return v17 & 1;
}

- (BOOL)shouldUseRLux:(float)a3 rLux:(float)a4
{
  BOOL v6 = 0;
  if (a3 >= self->_frontALSThreshold) {
    BOOL v6 = a4 >= self->_rearALSThreshold;
  }
  if (self->_activationFLux <= 0.0 || a3 >= a4 || a4 <= self->_frontALSThreshold)
  {
    BOOL v5 = 0;
    if (v6) {
      BOOL v5 = a4 >= (float)(self->_luxRatioThreshold * a3);
    }
    BOOL v7 = v5;
    if (v5) {
      self->_activationFLux = a3;
    }
  }
  else
  {
    BOOL v7 = 1;
  }
  if (!v7) {
    self->_activationFLux = -1.0;
  }
  return v7;
}

- (void)evaluateSamplingFrequencyWithLux:(float)a3 andCap:(float)a4
{
  if (self->_sensorEnabled)
  {
    if (a3 < a4)
    {
      if (self->_lastFrequency < 1.0)
      {
        self->_lastFrequency = 1.0;
        [(CBRearALSModule *)self->_rearALSModule stopSampling];
        *(float *)&double v5 = self->_lastFrequency;
        [(CBRearALSModule *)self->_rearALSModule startSamplingWithFrequency:v5];
      }
    }
    else if (self->_lastFrequency > 1.0)
    {
      self->_lastFrequency = 1.0;
      [(CBRearALSModule *)self->_rearALSModule stopSampling];
      *(float *)&double v4 = self->_lastFrequency;
      [(CBRearALSModule *)self->_rearALSModule startSamplingWithFrequency:v4];
    }
  }
}

- (AABRear)initWithQueue:(id)a3 andGrimaldiFactory:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v50 = self;
  SEL v49 = a2;
  id v48 = a3;
  id v47 = a4;
  v46.receiver = self;
  v46.super_class = (Class)AABRear;
  v50 = [(CBModule *)&v46 initWithQueue:a3];
  if (v50)
  {
    v50->super._logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.AABRear", "default");
    if (!v50->super._logHandle)
    {
      v45 = 0;
      v23 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v45 = v23;
      char v44 = 16;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        log = v45;
        os_log_type_t type = v44;
        __os_log_helper_16_0_0(v43);
        _os_log_error_impl(&dword_1BA438000, log, type, "AABRear: failed to create log handle", v43, 2u);
      }
    }
    long long v55 = xmmword_1BA60D678;
    int v56 = 713503427;
    long long v53 = xmmword_1BA60D68C;
    int v54 = -1632750650;
    if (MGIsDeviceOneOfType())
    {
      int valuePtr = 0;
      CFTypeRef v41 = 0;
      CFTypeRef v41 = CFPreferencesCopyValue(@"AllowGrimaldi", @"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
      if (v41)
      {
        CFTypeID v20 = CFGetTypeID(v41);
        if (v20 == CFNumberGetTypeID()) {
          CFNumberGetValue((CFNumberRef)v41, kCFNumberIntType, &valuePtr);
        }
        CFRelease(v41);
      }
      if (!valuePtr)
      {
        v40 = 0;
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
        v40 = logHandle;
        char v39 = 2;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
        {
          v16 = v40;
          os_log_type_t v17 = v39;
          __os_log_helper_16_0_0(v38);
          _os_log_debug_impl(&dword_1BA438000, v16, v17, "Skipping Grimaldi check", v38, 2u);
        }
LABEL_54:

        v50 = 0;
        return 0;
      }
    }
    v50->_rearALSModule = -[CBRearALSModule initWithQueue:andGrimaldiFactory:]([CBRearALSModule alloc], "initWithQueue:andGrimaldiFactory:", v48, v47, &v53, 0);
    if (!v50->_rearALSModule)
    {
      v37 = 0;
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
      v37 = v15;
      char v36 = 16;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v12 = v37;
        os_log_type_t v13 = v36;
        __os_log_helper_16_0_0(v35);
        _os_log_error_impl(&dword_1BA438000, v12, v13, "Failed to initialize CBRearALSModule.", v35, 2u);
      }
      goto LABEL_54;
    }
    v29[0] = 0;
    v29[1] = v29;
    int v30 = 1375731712;
    int v31 = 48;
    v32 = __Block_byref_object_copy__6;
    v33 = __Block_byref_object_dispose__6;
    v34 = v50;
    -[CBModule registerNotificationBlock:](v50->_rearALSModule, "registerNotificationBlock:");
    v50->_sensorEnabled = 0;
    v50->_started = 0;
    v50->_frontALSThreshold = 100.0;
    v50->_rearALSThreshold = 1000.0;
    v50->_luxRatioThreshold = 2.0;
    v50->_nitsRatioThreshold = 3.0;
    cf = (void *)CFPreferencesCopyValue(@"GrimaldiAABConfig", @"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    if (cf)
    {
      CFTypeID v11 = CFGetTypeID(cf);
      if (v11 == CFDictionaryGetTypeID())
      {
        v24 = (void *)[cf objectForKey:@"frontALSThreshold"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v24 floatValue];
          v50->_frontALSThreshold = v4;
        }
        uint64_t v25 = (void *)[cf objectForKey:@"rearALSThreshold"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v25 floatValue];
          v50->_rearALSThreshold = v5;
        }
        v26 = (void *)[cf objectForKey:@"luxRatioThreshold"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v26 floatValue];
          v50->_luxRatioThreshold = v6;
        }
        v27 = (void *)[cf objectForKey:@"nitsRatioThreshold"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v27 floatValue];
          v50->_nitsRatioThreshold = v7;
        }
      }
      CFRelease(cf);
    }
    if (v50->super._logHandle)
    {
      v10 = v50->super._logHandle;
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
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v52, COERCE__INT64(v50->_frontALSThreshold), COERCE__INT64(v50->_rearALSThreshold), COERCE__INT64(v50->_luxRatioThreshold), COERCE__INT64(v50->_nitsRatioThreshold));
      _os_log_debug_impl(&dword_1BA438000, v10, OS_LOG_TYPE_DEBUG, "AABRear: frontALSThreshold = %f, rearALSThreshold = %f, luxRatioThreshold = %f, nitsRatioThreshold = %f", v52, 0x2Au);
    }
    _Block_object_dispose(v29, 8);
  }
  return v50;
}

- (void)dealloc
{
  float v5 = self;
  SEL v4 = a2;
  [(CBModule *)self->_rearALSModule unregisterNotificationBlock];

  if (v5->super._logHandle)
  {
    v2 = &OBJC_IVAR___CBModule__logHandle;

    v5->super._logHandle = 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)AABRear;
  [(CBModule *)&v3 dealloc];
}

- (void)startSampling
{
  self->_started = 1;
}

- (void)stopSampling
{
  if (self->_sensorEnabled)
  {
    [(CBRearALSModule *)self->_rearALSModule stopSampling];
    self->_sensorEnabled = 0;
  }
  self->_started = 0;
  self->_activationFLux = -1.0;
}

- (id)copyPropertyForKey:(id)a3
{
  return [(CBRearALSModule *)self->_rearALSModule copyPropertyForKey:a3];
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return -[CBRearALSModule copyPropertyForKey:withParameter:](self->_rearALSModule, "copyPropertyForKey:withParameter:", a3, a4, a4, a3, a2, self);
}

- (void)stop
{
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  return [(CBRearALSModule *)self->_rearALSModule addHIDServiceClient:a3];
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  return -[CBRearALSModule handleHIDEvent:from:](self->_rearALSModule, "handleHIDEvent:from:", a3, a4, a4, a3, a2, self);
}

@end