@interface CBChromaticCorrection
- (BOOL)enabled;
- (BOOL)handleAODStateUpdate:(unint64_t)a3 transitionTime:(float)a4 context:(id)a5;
- (BOOL)isInActiveRange;
- (BOOL)nitsAreInActiveRange:(float)a3;
- (BOOL)rampIsRunning;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)shouldRampForIncomingLux:(float)a3;
- (BOOL)shouldRampFromStartLux:(float)a3 toTargetLux:(float)a4;
- (CBChromaticCorrection)initWithBacklightParams:(id)a3 andPolicy:(id)a4;
- (CBChromaticCorrectionParams)params;
- (float)aodRampDuration;
- (float)currentStrength;
- (float)lux;
- (float)luxAdjustedByInternalPolicies:(float)a3;
- (float)nits;
- (float)targetLux;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (void)currentTime;
- (void)dealloc;
- (void)handleLuxUpdate:(float)a3;
- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4;
- (void)handleRampResult:(int)a3;
- (void)setCurrentTime:(void *)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLux:(float)a3;
- (void)setNits:(float)a3;
- (void)updateRamp;
- (void)updateRampWithProgress:(float)a3;
@end

@implementation CBChromaticCorrection

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  if ([a3 isEqualToString:@"TrustedLux"])
  {
    [a4 floatValue];
    self->_trustedLux = v4;
    if ([(CBChromaticCorrection *)self enabled] && !self->_aodIsOn)
    {
      *(float *)&double v5 = self->_trustedLux;
      [(CBChromaticCorrection *)self handleLuxUpdate:v5];
    }
  }
}

- (float)luxAdjustedByInternalPolicies:(float)a3
{
  if ([(CBChromaticCorrection *)self enabled]) {
    return a3;
  }
  [(CBChromaticCorrectionPolicy *)self->_policy rampTargetLuxCap];
  return v3;
}

- (BOOL)enabled
{
  BOOL v3 = 0;
  if (self->_isEnabled) {
    return self->_autoBrightnessIsEnabled;
  }
  return v3;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([a4 isEqualToString:@"DisplayBrightnessAuto"])
  {
    char v10 = [a3 BOOLValue] & 1;
    if (self->_autoBrightnessIsEnabled != v10)
    {
      self->_autoBrightnessIsEnabled = v10 & 1;
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
        if (self->_autoBrightnessIsEnabled) {
          double v5 = "YES";
        }
        else {
          double v5 = "NO";
        }
        __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)v5);
        _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "AutoBrightness | Enabled=%s", v14, 0xCu);
      }
      if (self->_aodIsOn)
      {
        [(CBLuxBezierRamp *)self->_ramp lux];
        if (std::__math::isnan[abi:ne180100]())
        {
          ramp = self->_ramp;
          [(CBChromaticCorrectionPolicy *)self->_policy rampTargetLuxCap];
          -[CBLuxBezierRamp forceLux:](ramp, "forceLux:");
        }
      }
      else
      {
        *(float *)&double v4 = self->_trustedLux;
        [(CBChromaticCorrection *)self handleLuxUpdate:v4];
      }
    }
  }
  else if (objc_msgSend(a4, "isEqualToString:", -[CBChromaticCorrectionPolicy isEnabledPropertyKey](self->_policy, "isEnabledPropertyKey")))
  {
    -[CBChromaticCorrection setEnabled:](self, "setEnabled:", [a3 BOOLValue] & 1);
  }
  return 1;
}

- (BOOL)nitsAreInActiveRange:(float)a3
{
  return [(CBChromaticCorrectionPolicy *)self->_policy nitsAreInActiveRange:*(double *)&a3] & 1;
}

- (void)updateRamp
{
  ramp = self->_ramp;
  ((void (*)(void))self->_currentTime)();
  -[CBChromaticCorrection handleRampResult:](self, "handleRampResult:", -[CBLuxBezierRamp updateTimedRamp:](ramp, "updateTimedRamp:"));
}

- (void)setNits:(float)a3
{
  self->_nits = a3;
}

- (void)handleRampResult:(int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3 || (a3 == 3 || a3 == 2 ? (char v3 = 0) : (char v3 = 1), (v3 & 1) == 0))
  {
    if (self->_log)
    {
      log = self->_log;
    }
    else
    {
      uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      log = v13;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = +[CBLuxBezierRamp luxRampStateToString:a3];
      [(CBLuxBezierRamp *)self->_ramp lux];
      *(double *)&uint64_t v11 = v4;
      [(CBLuxBezierRamp *)self->_ramp startLux];
      *(double *)&uint64_t v12 = v5;
      [(CBLuxBezierRamp *)self->_ramp targetLux];
      __os_log_helper_16_2_4_8_64_8_0_8_0_8_0((uint64_t)v17, (uint64_t)v10, v11, v12, COERCE__INT64(v6));
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Lux | RampState=%@ Lux=%f StartLux=%f TargetLux=%f", v17, 0x2Au);
    }
  }
  if (a3 > 1)
  {
    if (a3 == 2)
    {
      [(CBModule *)self sendNotificationForKey:@"ExternalRampIsRunning" withValue:[(CBChromaticCorrectionPolicy *)self->_policy rampIdentifier]];
      if (!self->_aodIsOn)
      {
        v9 = NSNumber;
        [(CBChromaticCorrectionParams *)self->_params rampUpdateRate];
        *(float *)&double v8 = 1.0 / v7;
        -[CBModule sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", @"DisplayDisplayStartFade", [v9 numberWithFloat:v8]);
      }
    }
    else if (a3 == 3)
    {
      [(CBModule *)self sendNotificationForKey:@"ExternalRampHasFinished" withValue:[(CBChromaticCorrectionPolicy *)self->_policy rampIdentifier]];
    }
  }
}

- (float)currentStrength
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((std::__math::isnan[abi:ne180100]() & 1) != 0
    || ([(CBLuxBezierRamp *)self->_ramp lux], (std::__math::isnan[abi:ne180100]() & 1) != 0))
  {
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
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(double *)&uint64_t v13 = self->_nits;
      [(CBLuxBezierRamp *)self->_ramp lux];
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v20, v13, COERCE__INT64(v2));
      _os_log_error_impl(&dword_1BA438000, log, OS_LOG_TYPE_ERROR, "Interpolation | UnexpectedValue=YES Nits=%f Lux=%f", v20, 0x16u);
    }
    return 0.0;
  }
  else if ([(CBChromaticCorrection *)self isInActiveRange])
  {
    float nits = self->_nits;
    [(CBLuxBezierRamp *)self->_ramp lux];
    float v16 = two_dimensional_interpolation((float *)[(CBFloatArray *)[(CBChromaticCorrectionParams *)self->_params nitsTable] data], [(CBFloatArray *)[(CBChromaticCorrectionParams *)self->_params nitsTable] count], (float *)[(CBFloatArray *)[(CBChromaticCorrectionParams *)self->_params luxTable] data], [(CBFloatArray *)[(CBChromaticCorrectionParams *)self->_params luxTable] count], (uint64_t)[(CBFloatArray *)[(CBChromaticCorrectionParams *)self->_params strengthTable] data], nits, v3);
    context = (void *)MEMORY[0x1BA9ECAE0]();
    uint64_t v11 = [(CBChromaticCorrectionPolicy *)self->_policy strengthNotification];
    *(float *)&double v4 = v16;
    -[CBModule sendNotificationForKey:withValue:](self, "sendNotificationForKey:withValue:", v11, [NSNumber numberWithFloat:v4]);
    if (self->_log)
    {
      v9 = self->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v8 = init_default_corebrightness_log();
      }
      v9 = v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&uint64_t v7 = self->_nits;
      [(CBLuxBezierRamp *)self->_ramp lux];
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v19, v7, COERCE__INT64(v5), COERCE__INT64(v16));
      _os_log_debug_impl(&dword_1BA438000, v9, OS_LOG_TYPE_DEBUG, "Interpolation | Nits=%f Lux=%f Strength=%f", v19, 0x20u);
    }
    return v16;
  }
  else
  {
    return 0.0;
  }
}

- (BOOL)isInActiveRange
{
  policy = self->_policy;
  [(CBLuxBezierRamp *)self->_ramp lux];
  BOOL v5 = 0;
  if (-[CBChromaticCorrectionPolicy luxIsInActiveRange:](policy, "luxIsInActiveRange:"))
  {
    *(float *)&double v2 = self->_nits;
    return [(CBChromaticCorrection *)self nitsAreInActiveRange:v2];
  }
  return v5;
}

- (void)handleLuxUpdate:(float)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((std::__math::isnan[abi:ne180100]() & 1) == 0)
  {
    *(float *)&double v3 = a3;
    [(CBChromaticCorrection *)self luxAdjustedByInternalPolicies:v3];
    int v24 = v4;
    [(CBLuxBezierRamp *)self->_ramp lux];
    if (std::__math::isnan[abi:ne180100]())
    {
      ramp = self->_ramp;
      [(CBChromaticCorrectionPolicy *)self->_policy rampTargetLuxCap];
      -[CBLuxBezierRamp forceLux:](ramp, "forceLux:");
    }
    LODWORD(v5) = v24;
    if ([(CBChromaticCorrection *)self shouldRampForIncomingLux:v5])
    {
      uint64_t v6 = [(CBLuxBezierRamp *)self->_ramp lux];
      int v22 = v7;
      float v21 = ((float (*)(uint64_t))self->_currentTime)(v6);
      LODWORD(v9) = v22;
      LODWORD(v10) = v24;
      if (self->_aodIsOn)
      {
        [(CBChromaticCorrection *)self handleRampResult:[(CBLuxBezierRamp *)self->_ramp rampFromLux:v9 toLux:v10]];
      }
      else
      {
        *(float *)&double v8 = v21;
        [(CBChromaticCorrection *)self handleRampResult:[(CBLuxBezierRamp *)self->_ramp rampTimedFromLux:v9 toLux:v10 atTime:v8]];
      }
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
        [(CBLuxBezierRamp *)self->_ramp startTime];
        *(double *)&uint64_t v15 = v11;
        [(CBLuxBezierRamp *)self->_ramp duration];
        *(double *)&uint64_t v16 = v12;
        [(CBLuxBezierRamp *)self->_ramp startLux];
        *(double *)&uint64_t v17 = v13;
        [(CBLuxBezierRamp *)self->_ramp targetLux];
        __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v26, v15, v16, v17, COERCE__INT64(v14));
        _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Lux | Ramp=YES StartTime=%f Duration=%f StartLux=%f TargetLux=%f", v26, 0x2Au);
      }
    }
  }
}

- (BOOL)shouldRampForIncomingLux:(float)a3
{
  return -[CBChromaticCorrection shouldRampFromStartLux:toTargetLux:](self, "shouldRampFromStartLux:toTargetLux:");
}

- (BOOL)shouldRampFromStartLux:(float)a3 toTargetLux:(float)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v25 = self;
  SEL v24 = a2;
  float v23 = a3;
  *(float *)&double v4 = a4;
  [(CBChromaticCorrection *)self luxAdjustedByInternalPolicies:v4];
  float v22 = v5;
  *(float *)&double v6 = v23;
  if (([(CBChromaticCorrectionPolicy *)v25->_policy luxIsInActiveRange:v6] & 1) != 0
    || (*(float *)&double v7 = v22,
        ([(CBChromaticCorrectionPolicy *)v25->_policy luxIsInActiveRange:v7] & 1) != 0))
  {
    char v21 = 0;
    *(float *)&double v7 = v23;
    *(float *)&double v8 = v22;
    char v21 = [(CBLuxBezierRamp *)v25->_ramp shouldRampFromStartLux:v7 toTargetLux:v8];
    if (v25->_aodIsOn && v25->_aodRampHandoffPending)
    {
      v20 = 0;
      if (v25->_log)
      {
        uint64_t v17 = v25->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        uint64_t v17 = inited;
      }
      v20 = v17;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        log = v20;
        os_log_type_t type = v19;
        __os_log_helper_16_0_0(v18);
        _os_log_impl(&dword_1BA438000, log, type, "Lux | AOD.RampHandoffPending=YES", v18, 2u);
      }
      char v21 = 1;
      v25->_aodRampHandoffPending = 0;
    }
    if (v25->_log)
    {
      float v13 = v25->_log;
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
      if ([(CBChromaticCorrection *)v25 rampIsRunning]) {
        double v9 = "YES";
      }
      else {
        double v9 = "NO";
      }
      if (v21) {
        double v10 = "YES";
      }
      else {
        double v10 = "NO";
      }
      __os_log_helper_16_2_4_8_32_8_0_8_0_8_32((uint64_t)v27, (uint64_t)v9, COERCE__INT64(v23), COERCE__INT64(v22), (uint64_t)v10);
      _os_log_impl(&dword_1BA438000, v13, OS_LOG_TYPE_DEFAULT, "Lux | RampIsRunning=%s StartLux=%.2f TargetLux=%.2f ShouldRamp=%s", v27, 0x2Au);
    }
    char v26 = v21 & 1;
  }
  else
  {
    char v26 = 0;
  }
  return v26 & 1;
}

- (BOOL)rampIsRunning
{
  return [(CBLuxBezierRamp *)self->_ramp rampIsRunning];
}

- (CBChromaticCorrection)initWithBacklightParams:(id)a3 andPolicy:(id)a4
{
  v35 = self;
  SEL v34 = a2;
  id v33 = a3;
  id v32 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CBChromaticCorrection;
  v35 = [(CBChromaticCorrection *)&v31 init];
  if (v35)
  {
    if (v32) {
      os_log_t v4 = os_log_create("com.apple.CoreBrightness.ChromaticCorrection", (const char *)[v32 name]);
    }
    else {
      os_log_t v4 = os_log_create("com.apple.CoreBrightness.ChromaticCorrection", "default");
    }
    v35->_log = (OS_os_log *)v4;
    if (!v33)
    {
      v30 = 0;
      if (v35->_log)
      {
        char v21 = v35->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        char v21 = inited;
      }
      v30 = v21;
      char v29 = 16;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        log = v30;
        os_log_type_t type = v29;
        __os_log_helper_16_0_0(v28);
        _os_log_error_impl(&dword_1BA438000, log, type, "Initialization | Error=YES Params=nil", v28, 2u);
      }
LABEL_34:

      v35 = 0;
      return 0;
    }
    if (!v32)
    {
      uint64_t v27 = 0;
      if (v35->_log)
      {
        uint64_t v17 = v35->_log;
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
      uint64_t v27 = v17;
      char v26 = 16;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        float v14 = v27;
        os_log_type_t v15 = v26;
        __os_log_helper_16_0_0(v25);
        _os_log_error_impl(&dword_1BA438000, v14, v15, "Initialization | Error=YES Policy=nil", v25, 2u);
      }
      goto LABEL_34;
    }
    v35->_isEnabled = 1;
    v35->_autoBrightnessIsEnabled = 1;
    float v5 = (CBChromaticCorrectionParams *)v33;
    v35->_params = v5;
    double v6 = (CBChromaticCorrectionPolicy *)v32;
    v35->_policy = v6;
    [(CBChromaticCorrectionPolicy *)v35->_policy setParams:v33];
    double v7 = [CBLuxBezierRamp alloc];
    uint64_t v8 = [(CBLuxBezierRamp *)v7 initWithParams:v35->_params andPolicy:v35->_policy];
    v35->_ramp = (CBLuxBezierRamp *)v8;
    v35->_float nits = NAN;
    v35->_trustedLux = NAN;
    v35->_currentTime = mach_time_now_in_seconds;
    v35->_aodIsOn = 0;
    v35->_aodRampHandoffPending = 0;
    SEL v24 = 0;
    if (v35->_log)
    {
      float v13 = v35->_log;
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
    SEL v24 = v13;
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = v24;
      os_log_type_t v11 = v23;
      __os_log_helper_16_0_0(v22);
      _os_log_impl(&dword_1BA438000, v10, v11, "Initialization | Start", v22, 2u);
    }
  }
  return v35;
}

- (void)dealloc
{
  os_log_t v4 = self;
  SEL v3 = a2;

  v4->_params = 0;
  v4->_policy = 0;

  v4->_ramp = 0;
  v2.receiver = v4;
  v2.super_class = (Class)CBChromaticCorrection;
  [(CBModule *)&v2 dealloc];
}

- (float)aodRampDuration
{
  [(CBChromaticCorrectionParams *)self->_params aodRampDuration];
  return result;
}

- (float)lux
{
  [(CBLuxBezierRamp *)self->_ramp lux];
  return result;
}

- (float)targetLux
{
  [(CBLuxBezierRamp *)self->_ramp targetLux];
  return result;
}

- (void)setLux:(float)a3
{
}

- (void)updateRampWithProgress:(float)a3
{
}

- (BOOL)handleAODStateUpdate:(unint64_t)a3 transitionTime:(float)a4 context:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  char v33 = 0;
  if (a3)
  {
    if (a3 == 3)
    {
      self->_aodIsOn = 1;
      if ([(CBLuxBezierRamp *)self->_ramp rampIsRunning])
      {
        ramp = self->_ramp;
        [(CBLuxBezierRamp *)ramp lux];
        int v32 = v5;
        [(CBLuxBezierRamp *)self->_ramp targetLux];
        LODWORD(v7) = v6;
        LODWORD(v8) = v32;
        [(CBChromaticCorrection *)self handleRampResult:[(CBLuxBezierRamp *)ramp rampFromLux:1 toLux:v8 forceRamp:v7]];
        self->_aodRampHandoffPending = 1;
        char v33 = 1;
      }
    }
  }
  else
  {
    self->_aodIsOn = 0;
    if ([(CBLuxBezierRamp *)self->_ramp rampIsRunning])
    {
      uint64_t v28 = self->_ramp;
      [(CBLuxBezierRamp *)v28 lux];
      int v30 = v9;
      uint64_t v10 = [(CBLuxBezierRamp *)self->_ramp targetLux];
      int v29 = v11;
      double v12 = ((double (*)(uint64_t))self->_currentTime)(v10);
      LODWORD(v13) = v29;
      LODWORD(v14) = LODWORD(v12);
      LODWORD(v12) = v30;
      [(CBChromaticCorrection *)self handleRampResult:[(CBLuxBezierRamp *)v28 rampTimedFromLux:1 toLux:v12 atTime:v13 forceRamp:v14]];
      char v33 = 1;
    }
  }
  if (v33)
  {
    if (self->_log)
    {
      log = self->_log;
    }
    else
    {
      uint64_t v26 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      log = v26;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v15 = "YES";
      if (!self->_aodIsOn) {
        os_log_type_t v15 = "NO";
      }
      uint64_t v22 = (uint64_t)v15;
      [(CBLuxBezierRamp *)self->_ramp startTime];
      *(double *)&uint64_t v23 = v16;
      [*(id *)((char *)&self->super.super.isa + *(int *)(v21 + 1312)) duration];
      *(double *)&uint64_t v24 = v17;
      [*(id *)((char *)&self->super.super.isa + *(int *)(v21 + 1312)) startLux];
      *(double *)&uint64_t v25 = v18;
      [*(id *)((char *)&self->super.super.isa + *(int *)(v21 + 1312)) targetLux];
      __os_log_helper_16_2_5_8_32_8_0_8_0_8_0_8_0((uint64_t)v35, v22, v23, v24, v25, COERCE__INT64(v19));
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "Lux | RampHandoff=YES AOD.IsOn=%s StartTime=%f Duration=%f StartLux=%f TargetLux=%f", v35, 0x34u);
    }
  }
  return 1;
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_isEnabled != a3)
  {
    self->_isEnabled = a3;
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
      if (self->_isEnabled) {
        os_log_t v4 = "YES";
      }
      else {
        os_log_t v4 = "NO";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v4);
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "State | Enabled=%s", v8, 0xCu);
    }
    if (!self->_aodIsOn)
    {
      *(float *)&double v3 = self->_trustedLux;
      [(CBChromaticCorrection *)self handleLuxUpdate:v3];
    }
  }
}

- (id)copyPropertyForKey:(id)a3
{
  return 0;
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (CBChromaticCorrectionParams)params
{
  return self->_params;
}

- (float)nits
{
  return self->_nits;
}

- (void)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(void *)a3
{
  self->_currentTime = a3;
}

@end