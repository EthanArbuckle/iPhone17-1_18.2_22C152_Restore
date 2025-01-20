@interface CBIndicatorBrightnessModule
- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)allowIBUnderSDR;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (BOOL)isRampRunning;
- (BOOL)isSecureIndicatorLightEnabled;
- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)shouldPushIndicatorBrightness;
- (BOOL)shouldRampToMib;
- (CBIndicatorBrightnessModule)initWithQueue:(id)a3 min:(float)a4 andMax:(float)a5;
- (CBIndicatorBrightnessModule)initWithQueue:(id)a3 min:(float)a4 max:(float)a5 andCurrentTimeFunction:(void *)a6;
- (double)currentDigitalDimmingFactor;
- (float)currentIndicatorBrightness;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (unint64_t)currentSilState;
- (void)dealloc;
- (void)endRamp;
- (void)forceBrightnessTransaction;
- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4;
- (void)processTransaction;
- (void)rampTo:(float)a3;
- (void)rampTo:(float)a3 indicatorUpdatedOutsideOfRamp:(BOOL)a4;
- (void)setMinimumIndicatorBrightness:(float)a3;
- (void)setRampSpeed:(float)a3;
- (void)setSdrBrightness:(float)a3;
- (void)setSilEnabled:(BOOL)a3;
- (void)setSilState:(unint64_t)a3;
- (void)updateRamp;
@end

@implementation CBIndicatorBrightnessModule

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_allowIBUnderSDR)
  {
    char v16 = 0;
  }
  else if (a3 && ([(NSMutableArray *)self->_mibServices containsObject:a4] & 1) != 0)
  {
    if (IOHIDEventGetType() == 1
      && IOHIDEventGetIntegerValue() == 65280
      && IOHIDEventGetIntegerValue() == 98)
    {
      uint64_t TimeStamp = IOHIDEventGetTimeStamp();
      uint64_t DataValue = IOHIDEventGetDataValue();
      if (IOHIDEventGetIntegerValue() == 16)
      {
        if (self->_logHandle)
        {
          logHandle = self->_logHandle;
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
          __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v17, TimeStamp, COERCE__INT64((double)*(unint64_t *)DataValue / 1000000.0), COERCE__INT64(*(float *)(DataValue + 8)), COERCE__INT64(*(float *)(DataValue + 12)));
          _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "[New Event] eventTimestamp=%llu MIBData.(ts=%fs mib=%f aggregatedLux=%f)\n", v17, 0x2Au);
        }
        LODWORD(v5) = *(_DWORD *)(DataValue + 8);
        [(CBIndicatorBrightnessModule *)self setMinimumIndicatorBrightness:v5];
        char v16 = 1;
      }
      else
      {
        if (self->_logHandle)
        {
          v10 = self->_logHandle;
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
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v18, TimeStamp);
          _os_log_error_impl(&dword_1BA438000, v10, OS_LOG_TYPE_ERROR, "[New Event] eventTimestamp=%llu (unknown payload)", v18, 0xCu);
        }
        char v16 = 0;
      }
    }
    else
    {
      if (self->_logHandle)
      {
        v12 = self->_logHandle;
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
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int Type = IOHIDEventGetType();
        __os_log_helper_16_0_1_4_0((uint64_t)v19, Type);
        _os_log_error_impl(&dword_1BA438000, v12, OS_LOG_TYPE_ERROR, "[New Event] unknown event type %u", v19, 8u);
      }
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }
  return v16 & 1;
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  if ([a3 isEqualToString:@"TrustedLux"])
  {
    [(CBIndicatorAnalyticsModule *)self->_mibAnalytics handleNotificationForKey:a3 withProperty:a4];
  }
  else if (([a3 isEqualToString:@"DisplayOn"] & 1) != 0 {
         && ([a4 BOOLValue] & 1) != 0)
  }
  {
    self->_mib = self->_minSdr;
  }
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  if (([(NSMutableArray *)self->_mibServices containsObject:a3] & 1) == 0) {
    return 0;
  }
  [(NSMutableArray *)self->_mibServices removeObject:a3];
  return 1;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([a4 isEqualToString:@"MinimumIndicatorBrightnessEnforce"])
  {
    self->_enforceMIB = [a3 BOOLValue] & 1;
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
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
      __os_log_helper_16_0_1_4_0((uint64_t)v21, self->_enforceMIB);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Enforce MIB: %d", v21, 8u);
    }
    char v19 = 1;
  }
  else if ([a4 isEqualToString:@"SecureIndicatorBrightnessRampSpeed"])
  {
    [a3 floatValue];
    [(CBIndicatorBrightnessModule *)self setRampSpeed:v4];
    char v19 = 1;
  }
  else if ([a4 isEqualToString:@"SecureIndicatorLightEnabled"])
  {
    -[CBIndicatorBrightnessModule setSilEnabled:](self, "setSilEnabled:", [a3 BOOLValue] & 1);
    char v19 = 1;
  }
  else if ([a4 isEqualToString:@"SecureIndicatorActiveCount"])
  {
    -[CBIndicatorBrightnessModule setSilEnabled:](self, "setSilEnabled:", [a3 unsignedIntValue] != 0);
    char v19 = 1;
  }
  else if ([a4 isEqualToString:@"MinimumIndicatorBrightness"])
  {
    [a3 floatValue];
    [(CBIndicatorBrightnessModule *)self setMinimumIndicatorBrightness:v5];
    char v19 = 1;
  }
  else if ([a4 isEqualToString:@"AllowIBUnderSDR"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[a3 objectForKeyedSubscript:@"AllowIBUnderSDREnable"];
      v14 = (void *)[a3 objectForKeyedSubscript:@"AllowIBUnderSDRValue"];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        self->_allowIBUnderSDR = [v15 BOOLValue] & 1;
        [v14 floatValue];
        float v13 = *(float *)&v6;
        if (self->_allowIBUnderSDR) {
          [(CBIndicatorBrightnessModule *)self setMinimumIndicatorBrightness:v6];
        }
        if (self->_logHandle)
        {
          v10 = self->_logHandle;
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
          if (self->_allowIBUnderSDR) {
            v7 = "Enabling";
          }
          else {
            v7 = "Disabling";
          }
          __os_log_helper_16_2_2_8_32_8_0((uint64_t)v20, (uint64_t)v7, COERCE__INT64(v13));
          _os_log_debug_impl(&dword_1BA438000, v10, OS_LOG_TYPE_DEBUG, "%s IB < SDR (%f)", v20, 0x16u);
        }
        char v19 = 1;
      }
      else
      {
        char v19 = 0;
      }
    }
    else
    {
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
  }
  return v19 & 1;
}

- (id)copyPropertyForKey:(id)a3
{
  if ([a3 isEqualToString:@"SecureIndicatorBrightnessRampSpeed"])
  {
    id v3 = objc_alloc(NSNumber);
    *(float *)&double v4 = self->_rampSpeed;
    return (id)[v3 initWithFloat:v4];
  }
  else if ([a3 isEqualToString:@"SecureIndicatorLightEnabled"])
  {
    return (id)objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[CBIndicatorBrightnessModule isSecureIndicatorLightEnabled](self, "isSecureIndicatorLightEnabled"));
  }
  else if ([a3 isEqualToString:@"MinimumIndicatorBrightness"])
  {
    [(CBIndicatorBrightnessModule *)self processTransaction];
    id v5 = objc_alloc(NSNumber);
    *(float *)&double v6 = self->_mib;
    return (id)[v5 initWithFloat:v6];
  }
  else if ([a3 isEqualToString:@"MinimumIndicatorBrightnessEnforce"])
  {
    return (id)[objc_alloc(NSNumber) initWithBool:self->_enforceMIB];
  }
  else if ([a3 isEqualToString:@"SecureIndicatorState"])
  {
    return (id)[objc_alloc(NSNumber) initWithUnsignedInteger:self->_silState];
  }
  else
  {
    return 0;
  }
}

- (void)setSdrBrightness:(float)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 >= 0.0)
  {
    float v6 = clamp(a3, self->_minSdr, self->_maxSdr);
    if (v6 != self->_nextUpdate.sdrBrightness)
    {
      self->_nextUpdate.sdrBrightness = v6;
      self->_nextUpdate.dirty = 1;
      if (![(CBIndicatorBrightnessModule *)self isRampRunning]) {
        [(CBIndicatorBrightnessModule *)self processTransaction];
      }
    }
  }
  else
  {
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
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
      __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
      _os_log_error_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_ERROR, "Negative sdr brightness %f, ignoring", v8, 0xCu);
    }
  }
}

- (void)updateRamp
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v30 = self;
  SEL v29 = a2;
  [(CBIndicatorBrightnessModule *)self processTransaction];
  if (v30->_forcedBrightnessUpdate)
  {
    v30->_forcedBrightnessUpdate = 0;
    if ([(CBIndicatorBrightnessModule *)v30 isRampRunning])
    {
      v28 = 0;
      if (v30->_logHandle)
      {
        logHandle = v30->_logHandle;
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
      v28 = logHandle;
      os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        log = v28;
        os_log_type_t type = v27;
        __os_log_helper_16_0_0(v26);
        _os_log_impl(&dword_1BA438000, log, type, "WARNING: Ramp was running while forced brightness transaction happened", v26, 2u);
      }
    }
    else
    {
      [(CBModule *)v30 sendNotificationForKey:@"ExternalRampHasFinished" withValue:@"IndicatorBrightness"];
    }
  }
  os_log_t v25 = 0;
  if (v30->_logHandle)
  {
    float v13 = v30->_logHandle;
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
  os_log_t v25 = v13;
  os_log_type_t v24 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    if ([(CBIndicatorBrightnessModule *)v30 isRampRunning]) {
      v2 = "YES";
    }
    else {
      v2 = "NO";
    }
    __os_log_helper_16_2_6_8_32_8_0_8_0_8_0_8_0_8_0((uint64_t)v32, (uint64_t)v2, v30->_silState, COERCE__INT64(v30->_sdrBrightness), COERCE__INT64(v30->_currentIndicatorBrightness), COERCE__INT64(v30->_targetIndicatorBrightness), COERCE__INT64(v30->_mib));
    _os_log_debug_impl(&dword_1BA438000, v25, v24, "updateRamp called, isRampRunning: %s, silState: %lu, currentSDR: %f, currentMIB: %f, targetMIB: %f, MIB: %f", v32, 0x3Eu);
  }
  if ([(CBIndicatorBrightnessModule *)v30 isRampRunning])
  {
    int v23 = 0;
    ramp = v30->_ramp;
    ((void (*)(void))v30->_currentTimeFunction)();
    int v23 = -[CBStopsBasedBrightnessRamp updateRampWithTimestamp:](ramp, "updateRampWithTimestamp:");
    [(CBStopsBasedBrightnessRamp *)v30->_ramp currentBrightness];
    v30->_currentIndicatorBrightness = v3;
    if (v23 == 1)
    {
      [(CBIndicatorBrightnessModule *)v30 endRamp];
      if (v30->_silState == 2)
      {
        [(CBIndicatorBrightnessModule *)v30 setSilState:3];
        [(CBIndicatorBrightnessModule *)v30 forceBrightnessTransaction];
      }
    }
  }
  else if (v30->_silState == 2 || v30->_silState == 3)
  {
    [(CBIndicatorBrightnessModule *)v30 setSilState:4];
  }
  if (!v30->_silState) {
    [(CBIndicatorBrightnessModule *)v30 setSilState:1];
  }
  os_log_t oslog = 0;
  if (v30->_logHandle)
  {
    v10 = v30->_logHandle;
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
  os_log_t oslog = v10;
  os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    if ([(CBIndicatorBrightnessModule *)v30 isRampRunning]) {
      double v4 = "YES";
    }
    else {
      double v4 = "NO";
    }
    __os_log_helper_16_2_6_8_32_8_0_8_0_8_0_8_0_8_0((uint64_t)v31, (uint64_t)v4, v30->_silState, COERCE__INT64(v30->_sdrBrightness), COERCE__INT64(v30->_currentIndicatorBrightness), COERCE__INT64(v30->_targetIndicatorBrightness), COERCE__INT64(v30->_mib));
    _os_log_debug_impl(&dword_1BA438000, oslog, v21, "updateRamp finished, isRampRunning: %s, silState: %lu, currentSDR: %f, currentMIB: %f, targetMIB: %f, MIB: %f", v31, 0x3Eu);
  }
  if ([(CBIndicatorBrightnessModule *)v30 shouldPushIndicatorBrightness]
    && v30->_sdrBrightness > v30->_currentIndicatorBrightness)
  {
    os_log_t v20 = 0;
    if (v30->_logHandle)
    {
      v8 = v30->_logHandle;
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
    os_log_t v20 = v8;
    os_log_type_t v19 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v5 = v20;
      os_log_type_t v6 = v19;
      __os_log_helper_16_0_0(v18);
      _os_log_error_impl(&dword_1BA438000, v5, v6, "SDR brightness is higher than current MIB - something is probably off", v18, 2u);
    }
  }
}

- (void)processTransaction
{
  if (self->_nextUpdate.dirty)
  {
    self->_mib = self->_nextUpdate.minimumIndicatorBrightness;
    self->_sdrBrightness = self->_nextUpdate.sdrBrightness;
    if (self->_nextUpdate.silEnabled)
    {
      unint64_t silState = self->_silState;
      if (silState > 1)
      {
        if (silState == 2)
        {
          [(CBIndicatorBrightnessModule *)self setSilState:1];
        }
        else if (silState - 3 <= 1)
        {
          [(CBIndicatorBrightnessModule *)self setSilState:0];
        }
      }
    }
    else
    {
      unint64_t v5 = self->_silState;
      if (v5)
      {
        if (v5 == 1) {
          [(CBIndicatorBrightnessModule *)self setSilState:2];
        }
      }
      else
      {
        [(CBIndicatorBrightnessModule *)self setSilState:4];
      }
    }
    self->_nextUpdate.dirty = 0;
    if (self->_silState)
    {
      unint64_t v4 = self->_silState;
      char v3 = 1;
    }
    else
    {
      unint64_t v4 = 0;
      char v3 = 0;
    }
    if ((v3 & 1) == 0)
    {
      switch(v4)
      {
        case 0uLL:
          self->_currentIndicatorBrightness = self->_sdrBrightness;
          if (self->_mib > self->_sdrBrightness || self->_allowIBUnderSDR)
          {
            *(float *)&double v2 = self->_mib;
            [(CBIndicatorBrightnessModule *)self rampTo:1 indicatorUpdatedOutsideOfRamp:v2];
          }
          else
          {
            if ([(CBIndicatorBrightnessModule *)self isRampRunning]) {
              [(CBIndicatorBrightnessModule *)self endRamp];
            }
            [(CBIndicatorBrightnessModule *)self forceBrightnessTransaction];
          }
          return;
        case 1uLL:
          if (self->_mib > self->_sdrBrightness || self->_allowIBUnderSDR)
          {
            char v7 = 0;
            if (self->_currentIndicatorBrightness < self->_sdrBrightness)
            {
              self->_currentIndicatorBrightness = self->_sdrBrightness;
              char v7 = 1;
            }
            *(float *)&double v2 = self->_mib;
            [(CBIndicatorBrightnessModule *)self rampTo:v7 & 1 indicatorUpdatedOutsideOfRamp:v2];
          }
          else if (self->_currentIndicatorBrightness <= self->_sdrBrightness)
          {
            self->_currentIndicatorBrightness = self->_sdrBrightness;
            [(CBIndicatorBrightnessModule *)self endRamp];
            [(CBIndicatorBrightnessModule *)self forceBrightnessTransaction];
          }
          else
          {
LABEL_31:
            *(float *)&double v2 = self->_sdrBrightness;
            [(CBIndicatorBrightnessModule *)self rampTo:v2];
          }
          break;
        case 2uLL:
          if (self->_currentIndicatorBrightness > self->_sdrBrightness) {
            goto LABEL_31;
          }
          [(CBIndicatorBrightnessModule *)self endRamp];
          [(CBIndicatorBrightnessModule *)self forceBrightnessTransaction];
          break;
        case 3uLL:
        case 4uLL:
          [(CBIndicatorBrightnessModule *)self endRamp];
          return;
        default:
          JUMPOUT(0);
      }
    }
  }
}

- (BOOL)isRampRunning
{
  return self->_ramp != 0;
}

- (BOOL)shouldPushIndicatorBrightness
{
  BOOL v3 = 0;
  if (self->_silState != 3) {
    return self->_silState != 4;
  }
  return v3;
}

- (void)endRamp
{
  v10 = self;
  SEL v9 = a2;
  if (self->_ramp)
  {
    v8 = 0;
    if (v10->_logHandle)
    {
      logHandle = v10->_logHandle;
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
    v8 = logHandle;
    char v7 = 1;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      log = v8;
      os_log_type_t type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_impl(&dword_1BA438000, log, type, "Ending ramp", v6, 2u);
    }
    [(CBModule *)v10 sendNotificationForKey:@"ExternalRampHasFinished" withValue:@"IndicatorBrightness"];

    v10->_ramp = 0;
  }
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  if (!a3 || !IOHIDServiceClientConformsTo(a3, 0xFF00u, 0x62u)) {
    return 0;
  }
  [(NSMutableArray *)self->_mibServices addObject:a3];
  return 1;
}

- (CBIndicatorBrightnessModule)initWithQueue:(id)a3 min:(float)a4 andMax:(float)a5
{
  return -[CBIndicatorBrightnessModule initWithQueue:min:max:andCurrentTimeFunction:](self, "initWithQueue:min:max:andCurrentTimeFunction:", a3, mach_time_now_in_seconds, *(double *)&a4, *(double *)&a5, __PAIR64__(LODWORD(a4), LODWORD(a5)), a3, a2, self);
}

- (CBIndicatorBrightnessModule)initWithQueue:(id)a3 min:(float)a4 max:(float)a5 andCurrentTimeFunction:(void *)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  os_log_type_t v19 = self;
  SEL v18 = a2;
  id v17 = a3;
  float v16 = a4;
  float v15 = a5;
  v14 = a6;
  v13.receiver = self;
  v13.super_class = (Class)CBIndicatorBrightnessModule;
  os_log_type_t v19 = [(CBModule *)&v13 initWithQueue:a3];
  if (!v19) {
    return 0;
  }
  os_log_t v6 = os_log_create("com.apple.CoreBrightness.CBIndicatorBrightnessModule", "default");
  *((void *)v19 + 5) = v6;
  *((float *)v19 + 12) = v16;
  *((float *)v19 + 13) = v15;
  *((_DWORD *)v19 + 14) = *((_DWORD *)v19 + 12);
  *((_DWORD *)v19 + 18) = *((_DWORD *)v19 + 12);
  *((_DWORD *)v19 + 20) = *((_DWORD *)v19 + 12);
  *((_DWORD *)v19 + 19) = *((_DWORD *)v19 + 12);
  *((float *)v19 + 21) = 0.5;
  *((void *)v19 + 12) = v14;
  *((void *)v19 + 13) = 4;
  *((unsigned char *)v19 + 112) = 0;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *((void *)v19 + 15) = v7;
  *((unsigned char *)v19 + 128) = _os_feature_enabled_impl() & 1;
  if (*((void *)v19 + 5))
  {
    uint64_t v12 = *((void *)v19 + 5);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    uint64_t v12 = inited;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v21, *((unsigned char *)v19 + 128) & 1);
    _os_log_impl(&dword_1BA438000, v12, OS_LOG_TYPE_DEFAULT, "Enforce MIB: %d", v21, 8u);
  }
  *((unsigned char *)v19 + 129) = 0;
  v8 = [CBIndicatorAnalyticsModule alloc];
  uint64_t v9 = [(CBIndicatorAnalyticsModule *)v8 initWithQueue:*((void *)v19 + 3) andIndicatorModule:v19];
  *((void *)v19 + 17) = v9;
  return (CBIndicatorBrightnessModule *)v19;
}

- (void)dealloc
{
  unint64_t v4 = self;
  SEL v3 = a2;

  [(CBIndicatorBrightnessModule *)v4 endRamp];
  [(CBModule *)v4 unregisterNotificationBlock];
  v2.receiver = v4;
  v2.super_class = (Class)CBIndicatorBrightnessModule;
  [(CBModule *)&v2 dealloc];
}

- (float)currentIndicatorBrightness
{
  if (self->_enforceMIB) {
    return self->_currentIndicatorBrightness;
  }
  else {
    return self->_sdrBrightness;
  }
}

- (double)currentDigitalDimmingFactor
{
  return (float)(self->_currentIndicatorBrightness / self->_sdrBrightness);
}

- (BOOL)allowIBUnderSDR
{
  return self->_allowIBUnderSDR;
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (BOOL)isSecureIndicatorLightEnabled
{
  BOOL v3 = 1;
  if (self->_silState) {
    return self->_silState == 1;
  }
  return v3;
}

- (void)setMinimumIndicatorBrightness:(float)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 > 0.0)
  {
    float v6 = clamp(a3, self->_minSdr, self->_maxSdr);
    if (v6 != self->_nextUpdate.minimumIndicatorBrightness)
    {
      self->_nextUpdate.minimumIndicatorBrightness = v6;
      self->_nextUpdate.dirty = 1;
      if (![(CBIndicatorBrightnessModule *)self isRampRunning]) {
        [(CBIndicatorBrightnessModule *)self processTransaction];
      }
    }
  }
  else
  {
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
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
      __os_log_helper_16_0_1_8_0((uint64_t)v8, COERCE__INT64(a3));
      _os_log_error_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_ERROR, "Negative MIB %f, ignoring", v8, 0xCu);
    }
  }
}

- (void)setRampSpeed:(float)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14 = self;
  SEL v13 = a2;
  float v12 = a3;
  if (a3 >= 0.0)
  {
    if (v12 == 0.0)
    {
      uint64_t v11 = 0;
      if (v14->_logHandle)
      {
        logHandle = v14->_logHandle;
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
      uint64_t v11 = logHandle;
      char v10 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        log = v11;
        os_log_type_t type = v10;
        __os_log_helper_16_0_0(v9);
        _os_log_error_impl(&dword_1BA438000, log, type, "MIB ramp speed can't be 0 seconds/stop, using default ramp speed", v9, 2u);
      }
      v14->_rampSpeed = 0.5;
    }
    else
    {
      v14->_rampSpeed = v12;
    }
  }
  else
  {
    v14->_rampSpeed = 0.5;
  }
  if (v14->_logHandle)
  {
    unint64_t v4 = v14->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v3 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v3 = init_default_corebrightness_log();
    }
    unint64_t v4 = v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v15, COERCE__INT64(v14->_rampSpeed));
    _os_log_impl(&dword_1BA438000, v4, OS_LOG_TYPE_DEFAULT, "MIB ramp speed overriden to %f seconds/stop", v15, 0xCu);
  }
}

- (void)setSilEnabled:(BOOL)a3
{
  if (a3 != self->_nextUpdate.silEnabled)
  {
    self->_nextUpdate.silEnabled = a3;
    self->_nextUpdate.dirty = 1;
    -[NSMutableArray enumerateObjectsUsingBlock:](self->_mibServices, "enumerateObjectsUsingBlock:");
    if (![(CBIndicatorBrightnessModule *)self isRampRunning]) {
      [(CBIndicatorBrightnessModule *)self processTransaction];
    }
  }
}

uint64_t __45__CBIndicatorBrightnessModule_setSilEnabled___block_invoke(uint64_t a1, __IOHIDServiceClient *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return IOHIDServiceClientSetProperty(a2, @"EXBrightSILEnabled", (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
  }
  else {
    return IOHIDServiceClientSetProperty(a2, @"EXBrightSILEnabled", (CFTypeRef)*MEMORY[0x1E4F1CFC8]);
  }
}

- (unint64_t)currentSilState
{
  return self->_silState;
}

- (void)setSilState:(unint64_t)a3
{
  if (a3 != self->_silState)
  {
    self->_unint64_t silState = a3;
    -[CBIndicatorAnalyticsModule setProperty:forKey:](self->_mibAnalytics, "setProperty:forKey:", [NSNumber numberWithUnsignedInteger:self->_silState]);
    -[CBModule sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", @"SecureIndicatorState", [NSNumber numberWithUnsignedInteger:self->_silState]);
  }
}

- (void)forceBrightnessTransaction
{
  os_log_t v20 = self;
  SEL v19 = a2;
  if (!self->_forcedBrightnessUpdate)
  {
    v20->_forcedBrightnessUpdate = 1;
    [(CBModule *)v20 sendNotificationForKey:@"ExternalRampIsRunning" withValue:@"IndicatorBrightness"];
    id v2 = objc_alloc(NSNumber);
    LODWORD(v3) = 1015580809;
    id v18 = (id)[v2 initWithFloat:v3];
    if (!v18)
    {
      id v17 = 0;
      if (v20->_logHandle)
      {
        logHandle = v20->_logHandle;
      }
      else
      {
        uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        logHandle = v10;
      }
      id v17 = logHandle;
      char v16 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        log = v17;
        os_log_type_t type = v16;
        __os_log_helper_16_0_0(v15);
        _os_log_error_impl(&dword_1BA438000, log, type, "Failed to create frequency NSNumber, display might not ramp", v15, 2u);
      }
    }
    [(CBModule *)v20 sendNotificationForKey:@"DisplayDisplayStartFade" withValue:v18];

    v14 = 0;
    if (v20->_logHandle)
    {
      id v7 = v20->_logHandle;
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
    v14 = v7;
    char v13 = 2;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v4 = v14;
      os_log_type_t v5 = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_debug_impl(&dword_1BA438000, v4, v5, "Forced brightness transaction", v12, 2u);
    }
  }
}

- (void)rampTo:(float)a3
{
}

- (void)rampTo:(float)a3 indicatorUpdatedOutsideOfRamp:(BOOL)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v53 = self;
  SEL v52 = a2;
  float v51 = a3;
  BOOL v50 = a4;
  if (self->_silState == 4)
  {
    os_log_t v49 = 0;
    if (v53->_logHandle)
    {
      logHandle = v53->_logHandle;
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
      __os_log_helper_16_0_1_8_0((uint64_t)v60, COERCE__INT64(v51));
      _os_log_error_impl(&dword_1BA438000, v49, v48, "Can't ramp MIB target %f when SIL is off", v60, 0xCu);
    }
  }
  else if (v53->_silState != 2 || v51 == v53->_sdrBrightness)
  {
    if ([(CBIndicatorBrightnessModule *)v53 isRampRunning] || v53->_currentIndicatorBrightness != v51)
    {
      if ([(CBIndicatorBrightnessModule *)v53 isRampRunning]
        && v53->_targetIndicatorBrightness == v51
        && !v50)
      {
        os_log_t oslog = 0;
        if (v53->_logHandle)
        {
          int v23 = v53->_logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v22 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v22 = init_default_corebrightness_log();
          }
          int v23 = v22;
        }
        os_log_t oslog = v23;
        os_log_type_t v42 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v57, COERCE__INT64(v51));
          _os_log_debug_impl(&dword_1BA438000, oslog, v42, "Already running ramp with the same target %f", v57, 0xCu);
        }
      }
      else
      {
        v53->_targetIndicatorBrightness = v51;
        char v41 = [(CBIndicatorBrightnessModule *)v53 isRampRunning];
        float v40 = 0.0;
        float v40 = ((float (*)(void))v53->_currentTimeFunction)();
        if (v41)
        {
          [(CBStopsBasedBrightnessRamp *)v53->_ramp timeOfLastUpdate];
          float v40 = v4;
        }

        v53->_ramp = 0;
        if (v53->_currentIndicatorBrightness == v51)
        {
          [(CBModule *)v53 sendNotificationForKey:@"ExternalRampHasFinished" withValue:@"IndicatorBrightness"];
        }
        else
        {
          os_log_type_t v5 = [CBStopsBasedBrightnessRamp alloc];
          *(float *)&double v6 = v53->_currentIndicatorBrightness;
          *(float *)&double v7 = v51;
          *(float *)&double v8 = v53->_rampSpeed;
          *(float *)&double v9 = v40;
          v53->_ramp = [(CBStopsBasedBrightnessRamp *)v5 initWithStartingBrightness:v6 targetBrightness:v7 rampSpeed:v8 andCurrentTime:v9];
          if (v53->_ramp)
          {
            if (v41)
            {
              os_log_t v37 = 0;
              if (v53->_logHandle)
              {
                SEL v19 = v53->_logHandle;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t v18 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t v18 = init_default_corebrightness_log();
                }
                SEL v19 = v18;
              }
              os_log_t v37 = v19;
              os_log_type_t v36 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v55, COERCE__INT64(v53->_currentIndicatorBrightness), COERCE__INT64(v51), COERCE__INT64(v53->_rampSpeed));
                _os_log_impl(&dword_1BA438000, v37, v36, "Updated ramp %f -> %f @ %f", v55, 0x20u);
              }
            }
            else
            {
              os_log_t v35 = 0;
              if (v53->_logHandle)
              {
                id v17 = v53->_logHandle;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t v16 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t v16 = init_default_corebrightness_log();
                }
                id v17 = v16;
              }
              os_log_t v35 = v17;
              os_log_type_t v34 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v54, COERCE__INT64(v53->_currentIndicatorBrightness), COERCE__INT64(v51), COERCE__INT64(v53->_rampSpeed));
                _os_log_impl(&dword_1BA438000, v35, v34, "Created ramp %f -> %f @ %f", v54, 0x20u);
              }
              if (v53->_forcedBrightnessUpdate) {
                v53->_forcedBrightnessUpdate = 0;
              }
              [(CBModule *)v53 sendNotificationForKey:@"ExternalRampIsRunning" withValue:@"IndicatorBrightness"];
              id v10 = objc_alloc(NSNumber);
              LODWORD(v11) = 1015580809;
              id v33 = (id)[v10 initWithFloat:v11];
              if (!v33)
              {
                os_log_t v32 = 0;
                if (v53->_logHandle)
                {
                  float v15 = v53->_logHandle;
                }
                else
                {
                  uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
                  float v15 = v14;
                }
                os_log_t v32 = v15;
                os_log_type_t v31 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  float v12 = v32;
                  os_log_type_t v13 = v31;
                  __os_log_helper_16_0_0(v30);
                  _os_log_error_impl(&dword_1BA438000, v12, v13, "Failed to create frequency NSNumber, display might not ramp", v30, 2u);
                }
              }
              [(CBModule *)v53 sendNotificationForKey:@"DisplayDisplayStartFade", v33, v12 withValue];
            }
          }
          else
          {
            os_log_t v39 = 0;
            if (v53->_logHandle)
            {
              os_log_type_t v21 = v53->_logHandle;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT) {
                uint64_t v20 = _COREBRIGHTNESS_LOG_DEFAULT;
              }
              else {
                uint64_t v20 = init_default_corebrightness_log();
              }
              os_log_type_t v21 = v20;
            }
            os_log_t v39 = v21;
            os_log_type_t v38 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v56, COERCE__INT64(v53->_currentIndicatorBrightness), COERCE__INT64(v51), COERCE__INT64(v53->_rampSpeed));
              _os_log_error_impl(&dword_1BA438000, v39, v38, "Failed to create ramp %f -> %f @ %f", v56, 0x20u);
            }
            if (v41) {
              [(CBModule *)v53 sendNotificationForKey:@"ExternalRampHasFinished" withValue:@"IndicatorBrightness"];
            }
          }
        }
      }
    }
    else
    {
      os_log_t v45 = 0;
      if (v53->_logHandle)
      {
        os_log_t v25 = v53->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v24 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v24 = init_default_corebrightness_log();
        }
        os_log_t v25 = v24;
      }
      os_log_t v45 = v25;
      os_log_type_t v44 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v58, COERCE__INT64(v51));
        _os_log_debug_impl(&dword_1BA438000, v45, v44, "Already at correct brightness %f with ramp not running", v58, 0xCu);
      }
    }
  }
  else
  {
    os_log_t v47 = 0;
    if (v53->_logHandle)
    {
      os_log_type_t v27 = v53->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v26 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v26 = init_default_corebrightness_log();
      }
      os_log_type_t v27 = v26;
    }
    os_log_t v47 = v27;
    os_log_type_t v46 = OS_LOG_TYPE_FAULT;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v59, COERCE__INT64(v51));
      _os_log_fault_impl(&dword_1BA438000, v47, v46, "Ignoring MIB target (%f) that is different than current sdr", v59, 0xCu);
    }
  }
}

- (BOOL)shouldRampToMib
{
  if (!self->_silState) {
    return self->_mib >= self->_sdrBrightness;
  }
  BOOL v3 = 0;
  if (self->_silState == 1) {
    return self->_mib >= self->_sdrBrightness;
  }
  return v3;
}

@end