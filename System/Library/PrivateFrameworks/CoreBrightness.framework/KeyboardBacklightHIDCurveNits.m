@interface KeyboardBacklightHIDCurveNits
- (KeyboardBacklightHIDCurveNits)initWithQueue:(id)a3 device:(id)a4;
- (float)brightness;
- (float)convertNitsToLevelPercentage:(float)a3;
- (float)level;
- (float)maxCapableNits;
- (float)maxLevelPercentage;
- (float)minCapableNits;
- (void)dealloc;
- (void)setBrightness:(float)a3;
- (void)setBrightness:(float)a3 withFadeSpeed:(int)a4 commit:(BOOL)a5;
@end

@implementation KeyboardBacklightHIDCurveNits

- (KeyboardBacklightHIDCurveNits)initWithQueue:(id)a3 device:(id)a4
{
  v9 = self;
  SEL v8 = a2;
  id v7 = a3;
  id v6 = a4;
  v5.receiver = self;
  v5.super_class = (Class)KeyboardBacklightHIDCurveNits;
  return [(KeyboardBacklightHIDCurve *)&v5 initWithQueue:a3 device:a4];
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)KeyboardBacklightHIDCurveNits;
  [(KeyboardBacklightHIDCurve *)&v2 dealloc];
}

- (float)level
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(KeyboardBacklight *)self suppressed] || [(KeyboardBacklight *)self saturated])
  {
    [(KeyboardBacklight *)self levelOff];
    return v2;
  }
  else
  {
    [(KeyboardBacklight *)self levelMax];
    float v12 = v3;
    [(KeyboardBacklight *)self levelPercentage];
    float v13 = v12 * v4;
    [(KeyboardBacklight *)self levelMin];
    if (v13 >= v5) {
      float v11 = v13;
    }
    else {
      float v11 = v5;
    }
    [(KeyboardBacklight *)self levelMax];
    if (v11 >= v6) {
      float v10 = v6;
    }
    else {
      float v10 = v11;
    }
    float v14 = v10;
    if (self->super.super.super._logHandle)
    {
      logHandle = self->super.super.super._logHandle;
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
      __os_log_helper_16_0_1_8_0((uint64_t)v16, COERCE__INT64(v10));
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "level = %f (Nits)", v16, 0xCu);
    }
  }
  return v14;
}

- (void)setBrightness:(float)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v30 = self;
  SEL v29 = a2;
  float v28 = a3;
  os_log_t v27 = 0;
  if (self->super.super.super._logHandle)
  {
    logHandle = v30->super.super.super._logHandle;
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
  os_log_t v27 = logHandle;
  os_log_type_t v26 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_2_8_0_4_0((uint64_t)v32, COERCE__INT64(v28), [(KeyboardBacklight *)v30 manualAdjust]);
    _os_log_debug_impl(&dword_1BA438000, v27, v26, "requested brightness %f manualAdjust %d", v32, 0x12u);
  }
  if ([(KeyboardBacklight *)v30 manualAdjust])
  {
    float v25 = 0.0;
    float v24 = 0.0;
    float v23 = v28;
    if (v28 <= 0.0) {
      float v12 = v24;
    }
    else {
      float v12 = v23;
    }
    float v22 = v12;
    float v25 = v12;
    float v21 = 1.0;
    *(void *)&double v3 = LODWORD(v12);
    if (v12 >= 1.0) {
      float v11 = v21;
    }
    else {
      float v11 = v25;
    }
    float v20 = v11;
    float v28 = v11;
    *(float *)&double v3 = v11;
    [(KeyboardBacklight *)v30 setLevelPercentage:v3];
    [(KeyboardBacklight *)v30 setSaturated:0];
    [(KeyboardBacklight *)v30 levelPercentage];
    [(KeyboardBacklight *)v30 setMuted:v4 == 0.0];
    if ([(KeyboardBacklight *)v30 autoAdjust]) {
      [(KeyboardBacklightHIDCurve *)v30 updateLuxToNitsCurve];
    }
    [(KeyboardBacklight *)v30 levelPercentage];
    +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", @"KeyboardBacklightManualBrightness");
    [(KeyboardBacklight *)v30 updateBacklightDeviceWithReason:1];
    os_log_t v19 = 0;
    if (v30->super.super.super._logHandle)
    {
      float v10 = v30->super.super.super._logHandle;
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
    os_log_t v19 = v10;
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)v30);
      _os_log_debug_impl(&dword_1BA438000, v19, v18, "%@", v31, 0xCu);
    }
  }
  else
  {
    uint64_t v17 = 0;
    if (v30->super.super.super._logHandle)
    {
      SEL v8 = v30->super.super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v7 = init_default_corebrightness_log();
      }
      SEL v8 = v7;
    }
    uint64_t v17 = v8;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      float v5 = v17;
      os_log_type_t v6 = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_impl(&dword_1BA438000, v5, v6, "Manual keyboard brightness adjustment not allowed", v15, 2u);
    }
  }
}

- (void)setBrightness:(float)a3 withFadeSpeed:(int)a4 commit:(BOOL)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v34 = self;
  SEL v33 = a2;
  float v32 = a3;
  unsigned int v31 = a4;
  BOOL v30 = a5;
  os_log_t v29 = 0;
  if (self->super.super.super._logHandle)
  {
    logHandle = v34->super.super.super._logHandle;
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
    __os_log_helper_16_0_4_8_0_4_0_4_0_4_0((uint64_t)v36, COERCE__INT64(v32), [(KeyboardBacklight *)v34 manualAdjust], v31, v30);
    _os_log_debug_impl(&dword_1BA438000, v29, v28, "Requested keyboard brightness %f, manualAdjust %d, fade speed %d, commit %d", v36, 0x1Eu);
  }
  if ([(KeyboardBacklight *)v34 manualAdjust])
  {
    float v27 = 0.0;
    float v26 = 0.0;
    float v25 = v32;
    if (v32 <= 0.0) {
      float v14 = v26;
    }
    else {
      float v14 = v25;
    }
    float v24 = v14;
    float v27 = v14;
    float v23 = 1.0;
    *(void *)&double v5 = LODWORD(v14);
    if (v14 >= 1.0) {
      float v13 = v23;
    }
    else {
      float v13 = v27;
    }
    float v22 = v13;
    float v32 = v13;
    *(float *)&double v5 = v13;
    [(KeyboardBacklight *)v34 setLevelPercentage:v5];
    [(KeyboardBacklight *)v34 setSaturated:0];
    [(KeyboardBacklight *)v34 levelPercentage];
    [(KeyboardBacklight *)v34 setMuted:v6 == 0.0];
    if (v30)
    {
      if ([(KeyboardBacklight *)v34 autoAdjust]) {
        [(KeyboardBacklightHIDCurve *)v34 updateLuxToNitsCurve];
      }
      [(KeyboardBacklight *)v34 levelPercentage];
      +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", @"KeyboardBacklightManualBrightness");
    }
    [(KeyboardBacklight *)v34 updateBacklightDeviceWithFadeSpeed:v31 commit:v30 reason:1];
    os_log_t v21 = 0;
    if (v34->super.super.super._logHandle)
    {
      float v12 = v34->super.super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v11 = init_default_corebrightness_log();
      }
      float v12 = v11;
    }
    os_log_t v21 = v12;
    os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)v34);
      _os_log_debug_impl(&dword_1BA438000, v21, v20, "%@", v35, 0xCu);
    }
  }
  else
  {
    os_log_t oslog = 0;
    if (v34->super.super.super._logHandle)
    {
      float v10 = v34->super.super.super._logHandle;
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
    os_log_t oslog = v10;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = oslog;
      os_log_type_t v8 = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_impl(&dword_1BA438000, v7, v8, "Manual keyboard brightness adjustment not allowed", v17, 2u);
    }
  }
}

- (float)convertNitsToLevelPercentage:(float)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  float v14 = 0.0;
  [(KeyboardBacklight *)self levelMax];
  if (v3 != 0.0)
  {
    [(KeyboardBacklight *)self levelMax];
    float v14 = a3 / v4;
  }
  [(KeyboardBacklightHIDCurveNits *)self maxLevelPercentage];
  if (v14 >= v5) {
    float v13 = v5;
  }
  else {
    float v13 = v14;
  }
  if (v13 <= 0.0) {
    float v12 = 0.0;
  }
  else {
    float v12 = v13;
  }
  if (self->super.super.super._logHandle)
  {
    logHandle = self->super.super.super._logHandle;
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
    [(KeyboardBacklight *)self levelMax];
    *(double *)&uint64_t v9 = v6;
    [(KeyboardBacklight *)self levelMin];
    __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v17, COERCE__INT64(a3), COERCE__INT64(v12), v9, COERCE__INT64(v7));
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "nits = %f -> level percentage = %f, max = %f, min = %f", v17, 0x2Au);
  }
  return v12;
}

- (float)maxLevelPercentage
{
  return 1.0;
}

- (float)brightness
{
  float v4 = 0.0;
  if (![(KeyboardBacklight *)self suppressed] && ![(KeyboardBacklight *)self saturated])
  {
    [(KeyboardBacklight *)self levelPercentage];
    return v2;
  }
  return v4;
}

- (float)maxCapableNits
{
  [(KeyboardBacklight *)self levelMax];
  return result;
}

- (float)minCapableNits
{
  [(KeyboardBacklight *)self levelMin];
  if (v2 <= 0.0) {
    return 0.01;
  }
  [(KeyboardBacklight *)self levelMin];
  return v3;
}

@end