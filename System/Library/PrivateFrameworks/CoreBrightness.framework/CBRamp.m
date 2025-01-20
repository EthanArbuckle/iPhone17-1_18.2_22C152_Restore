@interface CBRamp
+ (id)className;
+ (id)newLinearRampWithWithOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 identifier:(id)a7;
- (BOOL)isFinished;
- (CBRamp)init;
- (CBRamp)initWithOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 identifier:(id)a7;
- (CBRamp)initWithOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 identifier:(id)a7 properties:(id)a8;
- (NSDictionary)properties;
- (NSString)identifier;
- (double)currentAbsoluteTimestamp;
- (double)currentTimestamp;
- (double)startAbsoluteTime;
- (double)startTime;
- (float)currentValue;
- (float)frequency;
- (float)length;
- (float)originalValue;
- (float)targetValue;
- (id)description;
- (id)rampProgressCallback;
- (void)clockRamp;
- (void)clockRamp:(double)a3;
- (void)dealloc;
- (void)setRampProgressCallback:(id)a3;
- (void)updateTargetValue:(float)a3;
@end

@implementation CBRamp

+ (id)newLinearRampWithWithOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 identifier:(id)a7
{
  v7 = [CBRamp alloc];
  *(float *)&double v8 = a3;
  *(float *)&double v9 = a4;
  *(float *)&double v10 = a5;
  *(float *)&double v11 = a6;
  v13 = [(CBRamp *)v7 initWithOrigin:a7 target:v8 length:v9 frequency:v10 identifier:v11];
  [(CBRamp *)v13 setRampProgressCallback:&__block_literal_global_8];
  return v13;
}

float __73__CBRamp_newLinearRampWithWithOrigin_target_length_frequency_identifier___block_invoke(float a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3[2])
  {
    v23 = a3[2];
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    v23 = inited;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = [a3 identifier];
    [a3 originalValue];
    *(double *)&uint64_t v21 = v3;
    [a3 targetValue];
    __os_log_helper_16_2_4_8_64_8_0_8_0_8_0((uint64_t)v27, v20, v21, COERCE__INT64(v4), COERCE__INT64((float)(a1 * 100.0)));
    _os_log_debug_impl(&dword_1BA438000, v23, OS_LOG_TYPE_DEBUG, "%@ ramp clocked: %f -> %f - %f %%", v27, 0x2Au);
  }
  [a3 targetValue];
  float v19 = v5;
  [a3 originalValue];
  float v6 = *(float *)&v7;
  *(float *)&double v7 = v19;
  if (v19 >= v6)
  {
    objc_msgSend(a3, "originalValue", v7);
    float v15 = v11;
    [a3 targetValue];
    float v16 = v12;
    [a3 originalValue];
    return v15 + (float)((float)(v16 - v13) * a1);
  }
  else
  {
    objc_msgSend(a3, "originalValue", v7);
    float v17 = v8;
    [a3 originalValue];
    float v18 = v9;
    [a3 targetValue];
    return v17 - (float)((float)(v18 - v10) * a1);
  }
}

+ (id)className
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (CBRamp)init
{
  return 0;
}

- (CBRamp)initWithOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 identifier:(id)a7
{
  return [(CBRamp *)self initWithOrigin:a7 target:0 length:*(double *)&a3 frequency:*(double *)&a4 identifier:*(double *)&a5 properties:*(double *)&a6];
}

- (CBRamp)initWithOrigin:(float)a3 target:(float)a4 length:(float)a5 frequency:(float)a6 identifier:(id)a7 properties:(id)a8
{
  v26 = self;
  SEL v25 = a2;
  float v24 = a3;
  float v23 = a4;
  float v22 = a5;
  float v21 = a6;
  id v20 = a7;
  id v19 = a8;
  v18.receiver = self;
  v18.super_class = (Class)CBRamp;
  v26 = [(CBRamp *)&v18 init];
  if (v26)
  {
    uint64_t v8 = [v20 copy];
    v26->_identifier = (NSString *)v8;
    v26->_originalValue = v24;
    v26->_targetValue = v23;
    v26->_length = v22;
    v26->_frequency = v21;
    uint64_t v9 = [v19 copy];
    v26->_properties = (NSDictionary *)v9;
    id v17 = 0;
    id v15 = [NSString alloc];
    uint64_t v14 = objc_msgSend(+[CBRamp className](CBRamp, "className"), "cStringUsingEncoding:");
    id v17 = (id)objc_msgSend(v15, "initWithFormat:", @"%s.%s.%s", "com.apple.CoreBrightness", v14, -[NSString cStringUsingEncoding:](v26->_identifier, "cStringUsingEncoding:", 1));
    os_log_t v10 = os_log_create((const char *)[v17 cStringUsingEncoding:1], "default");
    v26->_logHandle = (OS_os_log *)v10;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v12) = info.denom;
    LODWORD(v11) = info.numer;
    v26->_sMachTimebaseFactor = (double)v11 / (double)v12 * 0.000000001;
    v26->_startTime = (double)mach_absolute_time() * v26->_sMachTimebaseFactor;
    v26->_currentTimestamp = v26->_startTime;
    v26->_startAbsoluteTime = CFAbsoluteTimeGetCurrent();
    v26->_currentAbsoluteTimestamp = v26->_startAbsoluteTime;
  }
  return v26;
}

- (void)dealloc
{
  float v4 = self;
  SEL v3 = a2;
  if (self->_logHandle) {

  }
  if (v4->_rampProgressCallback) {
    _Block_release(v4->_rampProgressCallback);
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBRamp;
  [(CBRamp *)&v2 dealloc];
}

- (id)description
{
  float v4 = self;
  SEL v3 = a2;
  return (id)[NSString stringWithFormat:@"CBRamp: %@ | %f -> %f (%f) | %f sec | %f Hz", self->_identifier, self->_originalValue, self->_targetValue, self->_currentValue, self->_length, self->_frequency, a2, self];
}

- (void)clockRamp
{
}

- (void)clockRamp:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v18 = self;
  SEL v17 = a2;
  double v16 = a3;
  if (self->_isFinished) {
    __assert_rtn("-[CBRamp clockRamp:]", "CBRamp.m", 97, "!_isFinished");
  }
  if (!v18->_rampProgressCallback) {
    __assert_rtn("-[CBRamp clockRamp:]", "CBRamp.m", 98, "_rampProgressCallback");
  }
  v18->_currentTimestamp = v16;
  double v15 = 0.0;
  double v15 = (v18->_currentTimestamp - v18->_startTime) / v18->_length;
  v18->_currentAbsoluteTimestamp = v18->_startAbsoluteTime + v18->_currentTimestamp - v18->_startTime;
  double v15 = fmin(v15, 1.0);
  os_log_t oslog = 0;
  if (v18->_logHandle)
  {
    logHandle = v18->_logHandle;
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
    __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v19, *(uint64_t *)&v15, *(void *)&v18->_startTime, *(void *)&v18->_currentTimestamp, COERCE__INT64(v18->_currentTimestamp - v18->_startTime), COERCE__INT64(v18->_length));
    _os_log_debug_impl(&dword_1BA438000, oslog, type, "progress: %f, start = %f, current = %f, diff = %f, length = %f", v19, 0x34u);
  }
  if (v15 < 0.0) {
    __assert_rtn("-[CBRamp clockRamp:]", "CBRamp.m", 111, "progress >= MIN_RAMP_PROGRESS");
  }
  if (v15 > 1.0) {
    __assert_rtn("-[CBRamp clockRamp:]", "CBRamp.m", 112, "progress <= MAX_RAMP_PROGRESS");
  }
  float v3 = v15;
  v18->_currentValue = (*((float (**)(float))v18->_rampProgressCallback + 2))(v3);
  if (v15 >= 1.0)
  {
    v18->_isFinished = 1;
    os_log_t v12 = 0;
    if (v18->_logHandle)
    {
      double v7 = v18->_logHandle;
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
    os_log_t v12 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      float v4 = v12;
      os_log_type_t v5 = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_impl(&dword_1BA438000, v4, v5, "Ramp has been finished", v10, 2u);
    }
  }
}

- (void)updateTargetValue:(float)a3
{
  self->_targetValue = a3;
}

- (id)rampProgressCallback
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setRampProgressCallback:(id)a3
{
}

- (float)length
{
  return self->_length;
}

- (float)frequency
{
  return self->_frequency;
}

- (float)targetValue
{
  return self->_targetValue;
}

- (float)originalValue
{
  return self->_originalValue;
}

- (float)currentValue
{
  return self->_currentValue;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)currentTimestamp
{
  return self->_currentTimestamp;
}

- (double)startAbsoluteTime
{
  return self->_startAbsoluteTime;
}

- (double)currentAbsoluteTimestamp
{
  return self->_currentAbsoluteTimestamp;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)properties
{
  return self->_properties;
}

@end