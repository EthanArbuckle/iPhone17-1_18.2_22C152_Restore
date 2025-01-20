@interface KeyboardBacklightHIDCurve
- (BOOL)KBBrightnessCurvePropertyHandler:(id)a3;
- (BOOL)KBBrightnessLuxHysteresisPropertyHandler:(id)a3;
- (BOOL)isBrightnessCurveValid:(id)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (KeyboardBacklightHIDCurve)initWithQueue:(id)a3;
- (KeyboardBacklightHIDCurve)initWithQueue:(id)a3 device:(id)a4;
- (NSDictionary)brightnessCurve;
- (float)brightness;
- (float)chicletCurveCoefficient;
- (float)chicletCurvePower;
- (float)convertNitsToLevelPercentage:(float)a3;
- (float)convertPWMPercentageToNits:(float)a3;
- (float)currentLuxToAmbient;
- (float)currentLuxToNits;
- (float)level;
- (float)luxHysteresis;
- (float)maxCapableNits;
- (float)maxCurveNits;
- (float)maxLevelPercentage;
- (float)maxUserLevel;
- (float)minCapableNits;
- (float)perceptualBrightnessForLevel:(float)a3;
- (id)copyPropertyForKey:(id)a3;
- (id)defaultBrightnessCurve;
- (id)description;
- (int)color;
- (void)calculateLevelPercentageAtAmbient:(float)a3;
- (void)dealloc;
- (void)getKeyboardBacklightPreferences;
- (void)handleLuxUpdate:(float)a3;
- (void)reconfigureSettingsForColor:(int)a3;
- (void)setBacklightLevel:(float)a3;
- (void)setBrightness:(float)a3;
- (void)setBrightness:(float)a3 withFadeSpeed:(int)a4 commit:(BOOL)a5;
- (void)setColor:(int)a3;
- (void)setLuxHysteresis:(float)a3;
- (void)storeKeyboardBacklightCurveToPreferences;
- (void)storeKeyboardBacklightPreferences;
- (void)updateBrightnessCurve:(id)a3;
- (void)updateDefaultBrightnessCurve:(id)a3;
- (void)updateDefaultCurveForColor:(int)a3;
- (void)updateLuxToNitsCurve;
@end

@implementation KeyboardBacklightHIDCurve

- (KeyboardBacklightHIDCurve)initWithQueue:(id)a3
{
  return [(KeyboardBacklightHIDCurve *)self initWithQueue:a3 device:0];
}

- (KeyboardBacklightHIDCurve)initWithQueue:(id)a3 device:(id)a4
{
  v21 = self;
  SEL v20 = a2;
  id v19 = a3;
  id v18 = a4;
  int v17 = 0;
  v16.receiver = self;
  v16.super_class = (Class)KeyboardBacklightHIDCurve;
  v21 = -[KeyboardBacklight initWithQueue:device:ambientOffset:](&v16, sel_initWithQueue_device_ambientOffset_, a3, a4);
  if (v21)
  {
    if ([(KeyboardBacklight *)v21 supportsAuthentication])
    {
      v15 = 0;
      if (v21->super.super._logHandle)
      {
        logHandle = v21->super.super._logHandle;
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
      v15 = logHandle;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        log = v15;
        os_log_type_t type = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_impl(&dword_1BA438000, log, type, "SECONDARY BACKLIGHT HID Curve", v13, 2u);
      }
    }
    v21->_chicletCurveCoefficient = 0.053369;
    v21->_chicletCurvePower = 2.5271;
    v21->_color = 48;
    v21->_curveVersion = 1.0;
    v21->_luxHysteresis = 40.0;
    [(KeyboardBacklight *)v21 setHysteresisOn:1];
    if ([(KeyboardBacklight *)v21 levelUnit] == 16777441)
    {
      luxToNitsCurve = 0;
      defaultLuxToNitsCurve = 0;
      dword_1E9F73988 = 1116471296;
      dword_1E9F739A8 = 1116471296;
      dword_1E9F73990 = 1126170624;
      dword_1E9F739B0 = 1126170624;
      dword_1E9F73998 = 1133903872;
      dword_1E9F739B8 = 1133903872;
      [(KeyboardBacklight *)v21 levelMax];
      *(float *)&dword_1E9F73984 = 0.25 * v4;
      *(float *)&dword_1E9F739A4 = 0.25 * v4;
      [(KeyboardBacklight *)v21 levelMax];
      *(float *)&dword_1E9F7398C = 0.69375 * v5;
      *(float *)&dword_1E9F739AC = 0.69375 * v5;
      [(KeyboardBacklight *)v21 levelMax];
      *(float *)&dword_1E9F73994 = 0.69375 * v6;
      *(float *)&dword_1E9F739B4 = 0.69375 * v6;
      [(KeyboardBacklight *)v21 levelMax];
      *(float *)&dword_1E9F7399C = 0.01 * v7;
      *(float *)&dword_1E9F739BC = 0.01 * v7;
    }
  }
  return v21;
}

- (void)dealloc
{
  float v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)KeyboardBacklightHIDCurve;
  [(KeyboardBacklight *)&v2 dealloc];
}

- (id)description
{
  v8 = self;
  SEL v7 = a2;
  id v5 = (id)NSString;
  v6.receiver = self;
  v6.super_class = (Class)KeyboardBacklightHIDCurve;
  float v4 = [(KeyboardBacklight *)&v6 description];
  [(KeyboardBacklightHIDCurve *)v8 maxCurveNits];
  return (id)[v5 stringWithFormat:@"%@ maxCurveNits %f luxToNitsCurve [%f, %f], [%f, %f], [%f, %f], [%f, %f]", v4, v2, *(float *)&luxToNitsCurve, *(float *)&dword_1E9F73984, *(float *)&dword_1E9F73988, *(float *)&dword_1E9F7398C, *(float *)&dword_1E9F73990, *(float *)&dword_1E9F73994, *(float *)&dword_1E9F73998, *(float *)&dword_1E9F7399C];
}

- (id)copyPropertyForKey:(id)a3
{
  v9 = self;
  SEL v8 = a2;
  id v7 = a3;
  uint64_t v6 = 0;
  if ([a3 isEqualToString:@"KeyboardBacklightLuxHysteresis"])
  {
    id v4 = objc_alloc(NSNumber);
    [(KeyboardBacklightHIDCurve *)v9 luxHysteresis];
    return (id)objc_msgSend(v4, "initWithFloat:");
  }
  else if ([v7 isEqualToString:@"KeyboardBacklightCurve"])
  {
    return (id)[(NSDictionary *)[(KeyboardBacklightHIDCurve *)v9 brightnessCurve] copy];
  }
  else
  {
    v5.receiver = v9;
    v5.super_class = (Class)KeyboardBacklightHIDCurve;
    return [(KeyboardBacklight *)&v5 copyPropertyForKey:v7];
  }
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  v10 = self;
  SEL v9 = a2;
  id v8 = a3;
  id v7 = a4;
  BOOL v6 = 0;
  if ([a4 isEqualToString:@"KeyboardBacklightCurve"])
  {
    BOOL v6 = [(KeyboardBacklightHIDCurve *)v10 KBBrightnessCurvePropertyHandler:v8];
  }
  else if ([v7 isEqualToString:@"KeyboardBacklightLuxHysteresis"])
  {
    BOOL v6 = [(KeyboardBacklightHIDCurve *)v10 KBBrightnessLuxHysteresisPropertyHandler:v8];
  }
  if (!v6)
  {
    v5.receiver = v10;
    v5.super_class = (Class)KeyboardBacklightHIDCurve;
    return [(KeyboardBacklight *)&v5 setProperty:v8 forKey:v7];
  }
  return v6;
}

- (BOOL)KBBrightnessCurvePropertyHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
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
      __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)a3);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Update brightness curve to %@", v8, 0xCu);
    }
    [(KeyboardBacklightHIDCurve *)self updateDefaultBrightnessCurve:a3];
    [(KeyboardBacklightHIDCurve *)self updateBrightnessCurve:a3];
    [(KeyboardBacklightHIDCurve *)self storeKeyboardBacklightCurveToPreferences];
    [(KeyboardBacklight *)self currentLux];
    -[KeyboardBacklightHIDCurve handleLuxUpdate:](self, "handleLuxUpdate:");
  }
  return 1;
}

- (BOOL)KBBrightnessLuxHysteresisPropertyHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 floatValue];
    -[KeyboardBacklightHIDCurve setLuxHysteresis:](self, "setLuxHysteresis:");
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
      [(KeyboardBacklightHIDCurve *)self luxHysteresis];
      __os_log_helper_16_0_1_8_0((uint64_t)v9, COERCE__INT64(v3));
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Lux hysteresis value set to %f", v9, 0xCu);
    }
  }
  return 1;
}

- (void)updateDefaultBrightnessCurve:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v15 = (void *)[a3 objectForKey:@"KeyboardCurveY1"];
    if (v15)
    {
      [v15 floatValue];
      dword_1E9F739A4 = v3;
    }
    objc_super v16 = (void *)[a3 objectForKey:@"KeyboardCurveY2"];
    if (v16)
    {
      [v16 floatValue];
      dword_1E9F739AC = v4;
    }
    int v17 = (void *)[a3 objectForKey:@"KeyboardCurveY3"];
    if (v17)
    {
      [v17 floatValue];
      dword_1E9F739B4 = v5;
    }
    id v18 = (void *)[a3 objectForKey:@"KeyboardCurveY4"];
    if (v18)
    {
      [v18 floatValue];
      dword_1E9F739BC = v6;
    }
    id v19 = (void *)[a3 objectForKey:@"KeyboardCurveX1"];
    if (v19)
    {
      [v19 floatValue];
      defaultLuxToNitsCurve = v7;
    }
    SEL v20 = (void *)[a3 objectForKey:@"KeyboardCurveX2"];
    if (v20)
    {
      [v20 floatValue];
      dword_1E9F739A8 = v8;
    }
    v21 = (void *)[a3 objectForKey:@"KeyboardCurveX3"];
    if (v21)
    {
      [v21 floatValue];
      dword_1E9F739B0 = v9;
    }
    v22 = (void *)[a3 objectForKey:@"KeyboardCurveX4"];
    if (v22)
    {
      [v22 floatValue];
      dword_1E9F739B8 = v10;
    }
    self->_float luxHysteresis = *(float *)&dword_1E9F739B8 * 0.13;
    if (self->_color == 70)
    {
      if (self->_luxHysteresis >= 5.0) {
        float luxHysteresis = self->_luxHysteresis;
      }
      else {
        float luxHysteresis = 5.0;
      }
      self->_float luxHysteresis = luxHysteresis;
    }
    else
    {
      if (self->_luxHysteresis >= 10.0) {
        float v13 = self->_luxHysteresis;
      }
      else {
        float v13 = 10.0;
      }
      self->_float luxHysteresis = v13;
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
      __os_log_helper_16_2_2_8_0_8_64((uint64_t)v25, COERCE__INT64(self->_luxHysteresis), (uint64_t)[(KeyboardBacklightHIDCurve *)self defaultBrightnessCurve]);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Hysteresis = %f Default curve = %@", v25, 0x16u);
    }
  }
}

- (void)updateBrightnessCurve:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v44 = (float *)self;
  SEL v43 = a2;
  id v42 = a3;
  if ([(KeyboardBacklightHIDCurve *)self isBrightnessCurveValid:a3])
  {
    objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", @"KeyboardCurveY1"), "floatValue");
    dword_1E9F73984 = v3;
    objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", @"KeyboardCurveY2"), "floatValue");
    dword_1E9F7398C = v4;
    objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", @"KeyboardCurveY3"), "floatValue");
    dword_1E9F73994 = v5;
    objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", @"KeyboardCurveY4"), "floatValue");
    dword_1E9F7399C = v6;
    id v41 = (id)[v42 objectForKey:@"KeyboardCurveX1"];
    if (v41)
    {
      [v41 floatValue];
      luxToNitsCurve = v7;
    }
    id v40 = (id)[v42 objectForKey:@"KeyboardCurveX2"];
    if (v40)
    {
      [v40 floatValue];
      dword_1E9F73988 = v8;
    }
    id v39 = (id)[v42 objectForKey:@"KeyboardCurveX3"];
    if (v39)
    {
      [v39 floatValue];
      dword_1E9F73990 = v9;
    }
    id v38 = (id)[v42 objectForKey:@"KeyboardCurveX4"];
    if (v38)
    {
      [v38 floatValue];
      dword_1E9F73998 = v10;
      [v38 floatValue];
      v44[88] = v11 * 0.13;
      if (*((_DWORD *)v44 + 84) == 70)
      {
        float v37 = 0.0;
        float v37 = v44[88];
        float v36 = 5.0;
        if (v37 >= 5.0) {
          float v28 = v37;
        }
        else {
          float v28 = v36;
        }
        float v35 = v28;
        v44[88] = v28;
      }
      else
      {
        float v34 = 0.0;
        float v34 = v44[88];
        float v33 = 10.0;
        if (v34 >= 10.0) {
          float v27 = v34;
        }
        else {
          float v27 = v33;
        }
        float v32 = v27;
        v44[88] = v27;
      }
    }
  }
  else
  {
    os_log_t oslog = 0;
    if (*((void *)v44 + 2))
    {
      uint64_t v26 = *((void *)v44 + 2);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      uint64_t v26 = inited;
    }
    os_log_t oslog = v26;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v24 = type;
      __os_log_helper_16_0_0(v29);
      _os_log_error_impl(&dword_1BA438000, log, v24, "Keyboard brightness curve is corrupted -> use default curve.", v29, 2u);
    }
    luxToNitsCurve = defaultLuxToNitsCurve;
    dword_1E9F73988 = dword_1E9F739A8;
    dword_1E9F73990 = dword_1E9F739B0;
    dword_1E9F73998 = dword_1E9F739B8;
    dword_1E9F73984 = dword_1E9F739A4;
    dword_1E9F7398C = dword_1E9F739AC;
    dword_1E9F73994 = dword_1E9F739B4;
    dword_1E9F7399C = dword_1E9F739BC;
  }
  if (*((void *)v44 + 2))
  {
    v22 = *((void *)v44 + 2);
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
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(double *)&uint64_t v14 = *(float *)&luxToNitsCurve;
    *(double *)&uint64_t v15 = *(float *)&dword_1E9F73984;
    *(double *)&uint64_t v16 = *(float *)&dword_1E9F73988;
    *(double *)&uint64_t v17 = *(float *)&dword_1E9F7398C;
    *(double *)&uint64_t v18 = *(float *)&dword_1E9F73990;
    *(double *)&uint64_t v19 = *(float *)&dword_1E9F73994;
    *(double *)&uint64_t v20 = *(float *)&dword_1E9F73998;
    *(double *)&uint64_t v13 = *(float *)&dword_1E9F7399C;
    [v44 luxHysteresis];
    __os_log_helper_16_0_9_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v45, v14, v15, v16, v17, v18, v19, v20, v13, COERCE__INT64(v12));
    _os_log_impl(&dword_1BA438000, v22, OS_LOG_TYPE_DEFAULT, "Updated lux to nits curve to [%f, %f], [%f, %f], [%f, %f], [%f, %f] (Hysteresis = %f)", v45, 0x5Cu);
  }
}

- (BOOL)isBrightnessCurveValid:(id)a3
{
  BOOL v21 = 1;
  float v20 = (float)((float)(*(float *)&dword_1E9F739AC - *(float *)&dword_1E9F739A4)
              / (float)(*(float *)&dword_1E9F739A8 - *(float *)&defaultLuxToNitsCurve))
      * 1.5;
  float v19 = *(float *)&luxToNitsCurve;
  float v18 = *(float *)&dword_1E9F73988;
  uint64_t v16 = (void *)[a3 objectForKey:@"KeyboardCurveX1"];
  if (v16)
  {
    [v16 floatValue];
    float v19 = v3;
  }
  uint64_t v17 = (void *)[a3 objectForKey:@"KeyboardCurveX2"];
  if (v17)
  {
    [v17 floatValue];
    float v18 = v4;
  }
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"KeyboardCurveY2"), "floatValue");
  float v15 = v5;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"KeyboardCurveY1"), "floatValue");
  *(float *)&double v6 = (float)(v15 - *(float *)&v6) / (float)(v18 - v19);
  if (*(float *)&v6 > v20) {
    return 0;
  }
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"KeyboardCurveY2", v6), "floatValue");
  float v14 = v7;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"KeyboardCurveY1"), "floatValue");
  float v8 = *(float *)&v9;
  *(float *)&double v9 = v14;
  if (v14 < v8) {
    return 0;
  }
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"KeyboardCurveY3", v9), "floatValue");
  float v13 = v10;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"KeyboardCurveY4"), "floatValue");
  if (v13 < v11) {
    return 0;
  }
  return v21;
}

- (NSDictionary)brightnessCurve
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v11[0] = @"KeyboardCurveX1";
  LODWORD(v2) = luxToNitsCurve;
  v12[0] = [NSNumber numberWithFloat:v2];
  v11[1] = @"KeyboardCurveX2";
  LODWORD(v3) = dword_1E9F73988;
  v12[1] = [NSNumber numberWithFloat:v3];
  v11[2] = @"KeyboardCurveX3";
  LODWORD(v4) = dword_1E9F73990;
  v12[2] = [NSNumber numberWithFloat:v4];
  v11[3] = @"KeyboardCurveX4";
  LODWORD(v5) = dword_1E9F73998;
  v12[3] = [NSNumber numberWithFloat:v5];
  v11[4] = @"KeyboardCurveY1";
  LODWORD(v6) = dword_1E9F73984;
  v12[4] = [NSNumber numberWithFloat:v6];
  v11[5] = @"KeyboardCurveY2";
  LODWORD(v7) = dword_1E9F7398C;
  v12[5] = [NSNumber numberWithFloat:v7];
  v11[6] = @"KeyboardCurveY3";
  LODWORD(v8) = dword_1E9F73994;
  v12[6] = [NSNumber numberWithFloat:v8];
  v11[7] = @"KeyboardCurveY4";
  LODWORD(v9) = dword_1E9F7399C;
  v12[7] = [NSNumber numberWithFloat:v9];
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:8];
}

- (id)defaultBrightnessCurve
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v11[0] = @"KeyboardCurveX1";
  LODWORD(v2) = defaultLuxToNitsCurve;
  v12[0] = [NSNumber numberWithFloat:v2];
  v11[1] = @"KeyboardCurveX2";
  LODWORD(v3) = dword_1E9F739A8;
  v12[1] = [NSNumber numberWithFloat:v3];
  v11[2] = @"KeyboardCurveX3";
  LODWORD(v4) = dword_1E9F739B0;
  v12[2] = [NSNumber numberWithFloat:v4];
  v11[3] = @"KeyboardCurveX4";
  LODWORD(v5) = dword_1E9F739B8;
  v12[3] = [NSNumber numberWithFloat:v5];
  v11[4] = @"KeyboardCurveY1";
  LODWORD(v6) = dword_1E9F739A4;
  v12[4] = [NSNumber numberWithFloat:v6];
  v11[5] = @"KeyboardCurveY2";
  LODWORD(v7) = dword_1E9F739AC;
  v12[5] = [NSNumber numberWithFloat:v7];
  v11[6] = @"KeyboardCurveY3";
  LODWORD(v8) = dword_1E9F739B4;
  v12[6] = [NSNumber numberWithFloat:v8];
  v11[7] = @"KeyboardCurveY4";
  LODWORD(v9) = dword_1E9F739BC;
  v12[7] = [NSNumber numberWithFloat:v9];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:8];
}

- (float)maxCurveNits
{
  [(KeyboardBacklightHIDCurve *)self maxCapableNits];
  float v5 = v2;
  [(KeyboardBacklightHIDCurve *)self maxLevelPercentage];
  return v5 * v3;
}

- (float)maxLevelPercentage
{
  [(KeyboardBacklightHIDCurve *)self chicletCurveCoefficient];
  float v5 = v2;
  [(KeyboardBacklightHIDCurve *)self chicletCurvePower];
  return v5 * expf(v3);
}

- (float)maxUserLevel
{
  [(KeyboardBacklight *)self levelMax];
  float v8 = v2;
  [(KeyboardBacklightHIDCurve *)self maxLevelPercentage];
  float v10 = v8 * v3;
  float v9 = v8 * v3;
  [(KeyboardBacklight *)self levelMin];
  float v4 = *(float *)&v5;
  *(float *)&double v5 = v9;
  if (v9 < v4)
  {
    [(KeyboardBacklight *)self levelMin];
    return v6;
  }
  return v10;
}

- (void)getKeyboardBacklightPreferences
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  float v37 = self;
  SEL v36 = a2;
  id v35 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedLongLong:", -[KeyboardBacklight keyboardID](self, "keyboardID"));
  id v34 = +[CBKeyboardPreferencesManager copyPreferenceForKey:](CBKeyboardPreferencesManager, "copyPreferenceForKey:", [v35 stringValue]);
  if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v33 = (id)[v34 objectForKey:@"KeyboardBacklightMaxUser"];
    uint64_t v32 = [v34 objectForKey:@"KeyboardBacklightAdjustedBrightnessCurve"];
    char v31 = 1;
    id v30 = (id)[v34 objectForKey:@"KeyboardCurveVersion"];
    if (v30)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v30 floatValue];
        v37->_curveVersion = v2;
      }
    }
    id v29 = (id)[v34 objectForKey:@"KeyboardColor"];
    if (v29)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v29 intValue] == 53 && v37->_curveVersion < 2.03
          || [v29 intValue] == 70 && v37->_curveVersion < 3.0
          || [v29 intValue] == 71 && v37->_curveVersion < 2.0)
        {
          char v31 = 0;
        }
        -[KeyboardBacklightHIDCurve setColor:](v37, "setColor:", [v29 intValue]);
      }
    }
    if (v31)
    {
      if (v32)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v33 floatValue];
          int v17 = (int)(float)(v3 * 1000.0);
          [(KeyboardBacklightHIDCurve *)v37 maxUserLevel];
          if (v17 == (int)(float)(v4 * 1000.0))
          {
            float v28 = 0;
            if (v37->super.super._logHandle)
            {
              logHandle = v37->super.super._logHandle;
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
            float v28 = logHandle;
            os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
            {
              log = v28;
              os_log_type_t type = v27;
              __os_log_helper_16_0_0(v26);
              _os_log_impl(&dword_1BA438000, log, type, "Pref curve present and max user level matched -> update the curve", v26, 2u);
            }
            [(KeyboardBacklightHIDCurve *)v37 updateBrightnessCurve:v32];
          }
        }
      }
    }
  }
  else
  {
    v25 = 0;
    if (v37->super.super._logHandle)
    {
      float v12 = v37->super.super._logHandle;
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
    v25 = v12;
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      float v9 = v25;
      os_log_type_t v10 = v24;
      __os_log_helper_16_0_0(v23);
      _os_log_impl(&dword_1BA438000, v9, v10, "Pref not present or max user doesn't matched", v23, 2u);
    }
  }
  os_log_t v22 = 0;
  if (v37->super.super._logHandle)
  {
    float v8 = v37->super.super._logHandle;
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
  os_log_t v22 = v8;
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v39, (uint64_t)[(KeyboardBacklightHIDCurve *)v37 defaultBrightnessCurve]);
    _os_log_impl(&dword_1BA438000, v22, v21, "Default curve = %{public}@", v39, 0xCu);
  }
  os_log_t v20 = 0;
  if (v37->super.super._logHandle)
  {
    float v6 = v37->super.super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v5 = init_default_corebrightness_log();
    }
    float v6 = v5;
  }
  os_log_t v20 = v6;
  os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v38, (uint64_t)[(KeyboardBacklightHIDCurve *)v37 brightnessCurve]);
    _os_log_impl(&dword_1BA438000, v20, v19, "Current curve = %{public}@", v38, 0xCu);
  }

  v18.receiver = v37;
  v18.super_class = (Class)KeyboardBacklightHIDCurve;
  [(KeyboardBacklight *)&v18 getKeyboardBacklightPreferences];
}

- (void)storeKeyboardBacklightPreferences
{
  float v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)KeyboardBacklightHIDCurve;
  [(KeyboardBacklight *)&v2 storeKeyboardBacklightPreferences];
  [(KeyboardBacklightHIDCurve *)v4 storeKeyboardBacklightCurveToPreferences];
}

- (void)storeKeyboardBacklightCurveToPreferences
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_log_type_t v10 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedLongLong:", -[KeyboardBacklight keyboardID](self, "keyboardID"));
  id v2 = objc_alloc(NSNumber);
  *(float *)&double v3 = self->_curveVersion;
  float v9 = (void *)[v2 initWithFloat:v3];
  id v4 = objc_alloc(NSNumber);
  *(float *)&double v5 = (float)self->_color;
  float v8 = (void *)[v4 initWithFloat:v5];
  [(NSMutableDictionary *)[(KeyboardBacklight *)self keyboardSpecificPreferences] setObject:v9 forKey:@"KeyboardCurveVersion"];
  [(NSMutableDictionary *)[(KeyboardBacklight *)self keyboardSpecificPreferences] setObject:v8 forKey:@"KeyboardColor"];

  [(NSMutableDictionary *)[(KeyboardBacklight *)self keyboardSpecificPreferences] setObject:[(KeyboardBacklightHIDCurve *)self brightnessCurve] forKey:@"KeyboardBacklightAdjustedBrightnessCurve"];
  +[CBKeyboardPreferencesManager setPreference:forKey:](CBKeyboardPreferencesManager, "setPreference:forKey:", -[KeyboardBacklight keyboardSpecificPreferences](self, "keyboardSpecificPreferences"), [v10 stringValue]);

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
    __os_log_helper_16_2_1_8_66((uint64_t)v12, (uint64_t)[(KeyboardBacklight *)self keyboardSpecificPreferences]);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Brightness curve stored to preferences: %{public}@", v12, 0xCu);
  }
}

- (void)updateLuxToNitsCurve
{
  v57 = self;
  SEL v56 = a2;
  if (![(KeyboardBacklight *)self autoAdjust])
  {
    v55 = 0;
    id v41 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v55 = v41;
    char v54 = 16;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      log = v55;
      os_log_type_t v40 = v54;
      __os_log_helper_16_0_0(v53);
      _os_log_error_impl(&dword_1BA438000, log, v40, "ASSERTION FAILED: self.autoAdjust", v53, 2u);
    }
  }
  [(KeyboardBacklight *)v57 currentLux];
  if (v2 < *(float *)&luxToNitsCurve
    || ([(KeyboardBacklight *)v57 currentLux], v3 > *(float *)&dword_1E9F73998))
  {
    v52 = 0;
    id v38 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v52 = v38;
    char v51 = 16;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      SEL v36 = v52;
      os_log_type_t type = v51;
      __os_log_helper_16_0_0(v50);
      _os_log_error_impl(&dword_1BA438000, v36, type, "ASSERTION FAILED: self.currentLux >= luxToNitsCurve[0][0] && self.currentLux <= luxToNitsCurve[3][0]", v50, 2u);
    }
  }
  [(KeyboardBacklight *)v57 levelPercentage];
  if (v4 < 0.0 || ([(KeyboardBacklight *)v57 levelPercentage], v5 > 1.0))
  {
    v49 = 0;
    id v35 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v49 = v35;
    char v48 = 16;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v33 = v49;
      os_log_type_t v34 = v48;
      __os_log_helper_16_0_0(v47);
      _os_log_error_impl(&dword_1BA438000, v33, v34, "ASSERTION FAILED: self.levelPercentage >= 0.0F && self.levelPercentage <= 1.0F", v47, 2u);
    }
  }
  float v46 = (float)(*(float *)&dword_1E9F739AC - *(float *)&dword_1E9F739A4)
      / (float)(*(float *)&dword_1E9F739A8 - *(float *)&defaultLuxToNitsCurve);
  float v45 = v46 * 1.5;
  [(KeyboardBacklight *)v57 levelPercentage];
  float v32 = v6;
  [(KeyboardBacklightHIDCurve *)v57 maxCapableNits];
  float v44 = v32 * v7;
  [(KeyboardBacklight *)v57 currentLux];
  if (v8 == *(float *)&defaultLuxToNitsCurve)
  {
    dword_1E9F73984 = LODWORD(v44);
    *(float *)&dword_1E9F7398C = v44
                               + (float)(v46 * (float)(*(float *)&dword_1E9F739A8 - *(float *)&defaultLuxToNitsCurve));
  }
  else
  {
    [(KeyboardBacklight *)v57 currentLux];
    if (v9 <= *(float *)&defaultLuxToNitsCurve
      || ([(KeyboardBacklight *)v57 currentLux], v10 > *(float *)&dword_1E9F739A8))
    {
      [(KeyboardBacklight *)v57 currentLux];
      if (v17 <= *(float *)&dword_1E9F739A8
        || ([(KeyboardBacklight *)v57 currentLux], v18 > *(float *)&dword_1E9F739B0))
      {
        [(KeyboardBacklight *)v57 currentLux];
        if (v20 > *(float *)&dword_1E9F739B0)
        {
          [(KeyboardBacklight *)v57 currentLux];
          if (v21 < *(float *)&dword_1E9F739B8)
          {
            float v27 = *(float *)&dword_1E9F739BC - v44;
            float v26 = *(float *)&dword_1E9F739B8;
            [(KeyboardBacklight *)v57 currentLux];
            *(float *)&dword_1E9F73994 = *(float *)&dword_1E9F739BC
                                       - (float)((float)(v27 / (float)(v26 - v22))
                                               * (float)(*(float *)&dword_1E9F739B8 - *(float *)&dword_1E9F739B0));
            *(float *)&dword_1E9F7398C = *(float *)&dword_1E9F739AC
                                       + (float)(*(float *)&dword_1E9F73994 - *(float *)&dword_1E9F739B4);
            float v28 = *(float *)&dword_1E9F739AC + (float)(*(float *)&dword_1E9F73994 - *(float *)&dword_1E9F739B4);
            [(KeyboardBacklightHIDCurve *)v57 maxCurveNits];
            float v23 = *(float *)&v24;
            *(float *)&double v24 = v28;
            if (v28 > v23)
            {
              [(KeyboardBacklightHIDCurve *)v57 maxCurveNits];
              dword_1E9F7398C = v25;
            }
            if ((float)((float)(*(float *)&dword_1E9F7398C - *(float *)&dword_1E9F739A4)
                       / (float)(*(float *)&dword_1E9F739A8 - *(float *)&defaultLuxToNitsCurve)) <= v45)
              *(float *)&dword_1E9F73984 = *(float *)&dword_1E9F7398C
                                         - (float)(fmaxf((float)(*(float *)&dword_1E9F7398C - *(float *)&dword_1E9F739A4)/ (float)(*(float *)&dword_1E9F739A8- *(float *)&defaultLuxToNitsCurve), v46)* (float)(*(float *)&dword_1E9F739A8 - *(float *)&defaultLuxToNitsCurve));
            else {
              *(float *)&dword_1E9F73984 = *(float *)&dword_1E9F7398C
            }
                                         - (float)(v45
                                                 * (float)(*(float *)&dword_1E9F739A8 - *(float *)&defaultLuxToNitsCurve));
          }
        }
      }
      else
      {
        [(KeyboardBacklight *)v57 currentLux];
        float v42 = v44
            - (float)(*(float *)&dword_1E9F739AC
                    + (float)((float)((float)(v19 - *(float *)&dword_1E9F739A8)
                                    / (float)(*(float *)&dword_1E9F739B0 - *(float *)&dword_1E9F739A8))
                            * (float)(*(float *)&dword_1E9F739B4 - *(float *)&dword_1E9F739AC)));
        *(float *)&dword_1E9F7398C = *(float *)&dword_1E9F739AC + v42;
        *(float *)&dword_1E9F73994 = *(float *)&dword_1E9F739B4 + v42;
        if ((float)((float)((float)(*(float *)&dword_1E9F739AC + v42) - *(float *)&dword_1E9F739A4)
                   / (float)(*(float *)&dword_1E9F739A8 - *(float *)&defaultLuxToNitsCurve)) <= v45)
          *(float *)&dword_1E9F73984 = *(float *)&dword_1E9F7398C
                                     - (float)(fmaxf((float)((float)(*(float *)&dword_1E9F739AC + v42)- *(float *)&dword_1E9F739A4)/ (float)(*(float *)&dword_1E9F739A8 - *(float *)&defaultLuxToNitsCurve), v46)* (float)(*(float *)&dword_1E9F739A8 - *(float *)&defaultLuxToNitsCurve));
        else {
          *(float *)&dword_1E9F73984 = *(float *)&dword_1E9F7398C
        }
                                     - (float)(v45
                                             * (float)(*(float *)&dword_1E9F739A8 - *(float *)&defaultLuxToNitsCurve));
      }
    }
    else
    {
      float v31 = v44 - *(float *)&dword_1E9F739A4;
      [(KeyboardBacklight *)v57 currentLux];
      float v43 = v31 / (float)(v11 - *(float *)&defaultLuxToNitsCurve);
      if (v43 <= v45)
      {
        float v30 = fmaxf(v43, v46);
        [(KeyboardBacklight *)v57 currentLux];
        *(float *)&dword_1E9F7398C = (float)(v44 - (float)(v30 * (float)(v13 - *(float *)&defaultLuxToNitsCurve)))
                                   + (float)(*(float *)&dword_1E9F739A8 * v30);
        *(float *)&dword_1E9F73984 = v44 - (float)(v30 * (float)(v13 - *(float *)&defaultLuxToNitsCurve));
      }
      else
      {
        [(KeyboardBacklight *)v57 currentLux];
        *(float *)&dword_1E9F7398C = (float)(v44 - (float)(v45 * (float)(v12 - *(float *)&defaultLuxToNitsCurve)))
                                   + (float)(*(float *)&dword_1E9F739A8 * v45);
        *(float *)&dword_1E9F73984 = v44 - (float)(v45 * (float)(v12 - *(float *)&defaultLuxToNitsCurve));
      }
      *(float *)&dword_1E9F73994 = *(float *)&dword_1E9F739B4
                                 + (float)(*(float *)&dword_1E9F7398C - *(float *)&dword_1E9F739AC);
      float v29 = *(float *)&dword_1E9F739B4 + (float)(*(float *)&dword_1E9F7398C - *(float *)&dword_1E9F739AC);
      [(KeyboardBacklightHIDCurve *)v57 maxCurveNits];
      float v14 = *(float *)&v15;
      *(float *)&double v15 = v29;
      if (v29 > v14)
      {
        [(KeyboardBacklightHIDCurve *)v57 maxCurveNits];
        dword_1E9F73994 = v16;
      }
    }
  }
  [(KeyboardBacklightHIDCurve *)v57 storeKeyboardBacklightCurveToPreferences];
}

- (float)level
{
  if ([(KeyboardBacklight *)self suppressed] || [(KeyboardBacklight *)self saturated])
  {
    [(KeyboardBacklight *)self levelOff];
    return v2;
  }
  else
  {
    [(KeyboardBacklight *)self levelMax];
    float v10 = v3;
    [(KeyboardBacklight *)self levelPercentage];
    float v11 = (float)(int)rintf(v10 * v4);
    [(KeyboardBacklight *)self levelMin];
    if (v11 >= v5) {
      float v9 = v11;
    }
    else {
      float v9 = v5;
    }
    [(KeyboardBacklight *)self levelMax];
    if (v9 >= v6) {
      return v6;
    }
    else {
      return v9;
    }
  }
}

- (float)brightness
{
  float v10 = 0.0;
  if (![(KeyboardBacklight *)self suppressed] && ![(KeyboardBacklight *)self saturated])
  {
    [(KeyboardBacklight *)self levelPercentage];
    if (v2 == 0.0) {
      return 0.0;
    }
    [(KeyboardBacklight *)self levelPercentage];
    float v7 = v3;
    [(KeyboardBacklightHIDCurve *)self chicletCurveCoefficient];
    float v8 = logf(v7 / v4);
    [(KeyboardBacklightHIDCurve *)self chicletCurvePower];
    return v8 / v5;
  }
  return v10;
}

- (void)setBrightness:(float)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_2_8_0_4_0((uint64_t)v23, COERCE__INT64(a3), [(KeyboardBacklight *)self manualAdjust]);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "requested brightness %f manualAdjust %d", v23, 0x12u);
  }
  if ([(KeyboardBacklight *)self manualAdjust])
  {
    if (a3 <= 0.0) {
      float v16 = 0.0;
    }
    else {
      float v16 = a3;
    }
    *(void *)&double v3 = LODWORD(v16);
    if (v16 >= 1.0) {
      float v15 = 1.0;
    }
    else {
      float v15 = v16;
    }
    *(float *)&double v3 = v15;
    if (v15 == 0.0)
    {
      HIDWORD(v4) = 0;
      float v14 = 0.0;
    }
    else
    {
      [(KeyboardBacklightHIDCurve *)self chicletCurveCoefficient];
      float v13 = v5;
      [(KeyboardBacklightHIDCurve *)self chicletCurvePower];
      float v14 = v13 * expf(v6 * v15);
    }
    *(float *)&double v4 = v14;
    [(KeyboardBacklight *)self setLevelPercentage:v4];
    [(KeyboardBacklight *)self setSaturated:0];
    [(KeyboardBacklight *)self levelPercentage];
    [(KeyboardBacklight *)self setMuted:v7 == 0.0];
    if ([(KeyboardBacklight *)self autoAdjust]) {
      [(KeyboardBacklightHIDCurve *)self updateLuxToNitsCurve];
    }
    [(KeyboardBacklight *)self levelPercentage];
    +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", @"KeyboardBacklightManualBrightness");
    [(KeyboardBacklight *)self updateBacklightDeviceWithReason:1];
    if (self->super.super._logHandle)
    {
      float v12 = self->super.super._logHandle;
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
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v22, (uint64_t)self);
      _os_log_debug_impl(&dword_1BA438000, v12, OS_LOG_TYPE_DEBUG, "%@", v22, 0xCu);
    }
  }
  else
  {
    if (self->super.super._logHandle)
    {
      float v10 = self->super.super._logHandle;
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
      [(KeyboardBacklight *)self currentLux];
      __os_log_helper_16_0_1_8_0((uint64_t)v21, COERCE__INT64(v8));
      _os_log_impl(&dword_1BA438000, v10, OS_LOG_TYPE_DEFAULT, "Manual keyboard brightness adjustment not allowed (Lux=%f)", v21, 0xCu);
    }
  }
}

- (void)setBrightness:(float)a3 withFadeSpeed:(int)a4 commit:(BOOL)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v39 = self;
  SEL v38 = a2;
  float v37 = a3;
  unsigned int v36 = a4;
  BOOL v35 = a5;
  os_log_t v34 = 0;
  if (self->super.super._logHandle)
  {
    logHandle = v39->super.super._logHandle;
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
  os_log_t v34 = logHandle;
  os_log_type_t v33 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_4_8_0_4_0_4_0_4_0((uint64_t)v41, COERCE__INT64(v37), [(KeyboardBacklight *)v39 manualAdjust], v36, v35);
    _os_log_debug_impl(&dword_1BA438000, v34, v33, "Requested keyboard brightness %f, manualAdjust %d, fade speed %d, commit %d", v41, 0x1Eu);
  }
  if ([(KeyboardBacklight *)v39 manualAdjust])
  {
    float v32 = 0.0;
    float v31 = 0.0;
    float v30 = v37;
    if (v37 <= 0.0) {
      float v19 = v31;
    }
    else {
      float v19 = v30;
    }
    float v29 = v19;
    float v32 = v19;
    float v28 = 1.0;
    *(void *)&double v5 = LODWORD(v19);
    if (v19 >= 1.0) {
      float v18 = v28;
    }
    else {
      float v18 = v32;
    }
    float v27 = v18;
    float v37 = v18;
    *(float *)&double v5 = v18;
    if (v18 == 0.0)
    {
      HIDWORD(v6) = 0;
      float v17 = 0.0;
    }
    else
    {
      [(KeyboardBacklightHIDCurve *)v39 chicletCurveCoefficient];
      float v16 = v7;
      [(KeyboardBacklightHIDCurve *)v39 chicletCurvePower];
      float v17 = v16 * expf(v8 * v37);
    }
    *(float *)&double v6 = v17;
    [(KeyboardBacklight *)v39 setLevelPercentage:v6];
    [(KeyboardBacklight *)v39 setSaturated:0];
    [(KeyboardBacklight *)v39 levelPercentage];
    [(KeyboardBacklight *)v39 setMuted:v9 == 0.0];
    if ([(KeyboardBacklight *)v39 autoAdjust]) {
      [(KeyboardBacklightHIDCurve *)v39 updateLuxToNitsCurve];
    }
    [(KeyboardBacklight *)v39 levelPercentage];
    +[CBKeyboardPreferencesManager setFloatPreference:forKey:](CBKeyboardPreferencesManager, "setFloatPreference:forKey:", @"KeyboardBacklightManualBrightness");
    [(KeyboardBacklight *)v39 updateBacklightDeviceWithFadeSpeed:v36 commit:v35 reason:1];
    os_log_t v26 = 0;
    if (v39->super.super._logHandle)
    {
      float v15 = v39->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v14 = init_default_corebrightness_log();
      }
      float v15 = v14;
    }
    os_log_t v26 = v15;
    os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v39);
      _os_log_debug_impl(&dword_1BA438000, v26, v25, "%@", v40, 0xCu);
    }
  }
  else
  {
    os_log_t oslog = 0;
    if (v39->super.super._logHandle)
    {
      float v13 = v39->super.super._logHandle;
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
    os_log_t oslog = v13;
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      float v10 = oslog;
      os_log_type_t v11 = v23;
      __os_log_helper_16_0_0(v22);
      _os_log_impl(&dword_1BA438000, v10, v11, "Manual keyboard brightness adjustment not allowed", v22, 2u);
    }
  }
}

- (void)setBacklightLevel:(float)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_0_1_8_0((uint64_t)v9, COERCE__INT64(a3));
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Set backlight level = %f", v9, 0xCu);
  }
  [(KeyboardBacklightHIDCurve *)self convertNitsToLevelPercentage:COERCE_DOUBLE((unint64_t)LODWORD(a3))];
  if (v3 >= 0.0) {
    *((float *)&v4 + 1) = v3;
  }
  else {
    HIDWORD(v4) = 0;
  }
  if (*((float *)&v4 + 1) >= 1.0) {
    LODWORD(v4) = 1.0;
  }
  else {
    LODWORD(v4) = HIDWORD(v4);
  }
  -[KeyboardBacklightHIDCurve setBrightness:](self, "setBrightness:", COERCE_DOUBLE((unint64_t)v4), v4);
}

- (float)currentLuxToNits
{
  os_log_t v34 = self;
  SEL v33 = a2;
  int v32 = 4;
  float v31 = 0.0;
  [(KeyboardBacklight *)self currentLux];
  if (v2 >= *(float *)luxToNitsCurve)
  {
    [(KeyboardBacklight *)v34 currentLux];
    if (v3 < *(float *)&dword_1E9F73998)
    {
      for (int i = 0; i < 3; ++i)
      {
        [(KeyboardBacklight *)v34 currentLux];
        if (v4 >= *(float *)&luxToNitsCurve[2 * i])
        {
          [(KeyboardBacklight *)v34 currentLux];
          if (v5 < *(float *)&luxToNitsCurve[2 * i + 2])
          {
            float v29 = 0.0;
            float v6 = fabs((float)(*(float *)&luxToNitsCurve[2 * i + 2] - *(float *)&luxToNitsCurve[2 * i]));
            float v29 = v6;
            float v28 = 0.0;
            [(KeyboardBacklight *)v34 currentLux];
            float v8 = fabs((float)(v7 - *(float *)&luxToNitsCurve[2 * i]));
            float v28 = v8;
            if (v29 <= 0.0)
            {
              float v27 = 0;
              float v19 = (_COREBRIGHTNESS_LOG_DEFAULT
                               ? _COREBRIGHTNESS_LOG_DEFAULT
                               : init_default_corebrightness_log());
              float v27 = v19;
              char v26 = 16;
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                log = v27;
                os_log_type_t type = v26;
                __os_log_helper_16_0_0(v25);
                _os_log_error_impl(&dword_1BA438000, log, type, "ASSERTION FAILED: deltaLuxCurve > 0.0F", v25, 2u);
              }
            }
            if (v28 < 0.0)
            {
              uint64_t v24 = 0;
              float v16 = (_COREBRIGHTNESS_LOG_DEFAULT
                               ? _COREBRIGHTNESS_LOG_DEFAULT
                               : init_default_corebrightness_log());
              uint64_t v24 = v16;
              char v23 = 16;
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                uint64_t v14 = v24;
                os_log_type_t v15 = v23;
                __os_log_helper_16_0_0(v22);
                _os_log_error_impl(&dword_1BA438000, v14, v15, "ASSERTION FAILED: deltaLuxALS >= 0.0F", v22, 2u);
              }
            }
            float v21 = 0.0;
            if (v29 != 0.0) {
              float v21 = v28 / v29;
            }
            float v31 = *(float *)&luxToNitsCurve[2 * i + 1]
                + (float)(v21 * (float)(*(float *)&luxToNitsCurve[2 * i + 3] - *(float *)&luxToNitsCurve[2 * i + 1]));
            break;
          }
        }
      }
    }
    else
    {
      float v31 = *(float *)&dword_1E9F7399C;
    }
  }
  else
  {
    float v31 = *(float *)&dword_1E9F73984;
  }
  float v20 = v31;
  [(KeyboardBacklightHIDCurve *)v34 maxCurveNits];
  if (v20 >= v9) {
    float v13 = v9;
  }
  else {
    float v13 = v20;
  }
  [(KeyboardBacklightHIDCurve *)v34 minCapableNits];
  if (v13 >= v10) {
    return v13;
  }
  else {
    return v10;
  }
}

- (float)convertNitsToLevelPercentage:(float)a3
{
  float v30 = self;
  SEL v29 = a2;
  float v28 = a3;
  float v27 = 0.0;
  int v26 = 17;
  if (a3 >= 0.0)
  {
    if (v28 < 30.0)
    {
      for (int i = 0; i < 16; ++i)
      {
        if (v28 >= *(float *)&nitsToPWMPercentage[2 * i] && v28 < *(float *)&nitsToPWMPercentage[2 * i + 2])
        {
          float v24 = 0.0;
          float v3 = fabs((float)(*(float *)&nitsToPWMPercentage[2 * i + 2] - *(float *)&nitsToPWMPercentage[2 * i]));
          float v24 = v3;
          float v23 = 0.0;
          float v4 = fabs((float)(v28 - *(float *)&nitsToPWMPercentage[2 * i]));
          float v23 = v4;
          if (v3 <= 0.0)
          {
            float v22 = 0;
            uint64_t v14 = (_COREBRIGHTNESS_LOG_DEFAULT
                             ? _COREBRIGHTNESS_LOG_DEFAULT
                             : init_default_corebrightness_log());
            float v22 = v14;
            char v21 = 16;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              log = v22;
              os_log_type_t type = v21;
              __os_log_helper_16_0_0(v20);
              _os_log_error_impl(&dword_1BA438000, log, type, "ASSERTION FAILED: deltaPWMCurve > 0.0F", v20, 2u);
            }
          }
          if (v23 < 0.0)
          {
            float v19 = 0;
            os_log_type_t v11 = (_COREBRIGHTNESS_LOG_DEFAULT
                             ? _COREBRIGHTNESS_LOG_DEFAULT
                             : init_default_corebrightness_log());
            float v19 = v11;
            char v18 = 16;
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              float v9 = v19;
              os_log_type_t v10 = v18;
              __os_log_helper_16_0_0(v17);
              _os_log_error_impl(&dword_1BA438000, v9, v10, "ASSERTION FAILED: deltaPWMALS >= 0.0F", v17, 2u);
            }
          }
          float v16 = 0.0;
          if (v24 != 0.0) {
            float v16 = v23 / v24;
          }
          float v27 = *(float *)&nitsToPWMPercentage[2 * i + 1]
              + (float)(v16
                      * (float)(*(float *)&nitsToPWMPercentage[2 * i + 3] - *(float *)&nitsToPWMPercentage[2 * i + 1]));
          break;
        }
      }
    }
    else
    {
      float v27 = 1.0;
    }
  }
  else
  {
    float v27 = 0.0;
  }
  float v15 = v27;
  [(KeyboardBacklightHIDCurve *)v30 maxLevelPercentage];
  if (v15 >= v5) {
    float v8 = v5;
  }
  else {
    float v8 = v15;
  }
  if (v8 <= 0.0) {
    return 0.0;
  }
  else {
    return v8;
  }
}

- (float)convertPWMPercentageToNits:(float)a3
{
  float v31 = self;
  SEL v30 = a2;
  float v29 = a3;
  float v28 = 0.0;
  int v27 = 17;
  if (a3 >= 0.0)
  {
    if (v29 < 1.0)
    {
      for (int i = 0; i < 16; ++i)
      {
        if (v29 >= *(float *)&nitsToPWMPercentage[2 * i + 1] && v29 < *(float *)&nitsToPWMPercentage[2 * i + 3])
        {
          float v25 = 0.0;
          float v24 = 0.0;
          float v3 = fabs((float)(*(float *)&nitsToPWMPercentage[2 * i + 3] - *(float *)&nitsToPWMPercentage[2 * i + 1]));
          float v24 = v3;
          float v23 = 0.0;
          float v4 = fabs((float)(v29 - *(float *)&nitsToPWMPercentage[2 * i + 1]));
          float v23 = v4;
          if (v3 <= 0.0)
          {
            float v22 = 0;
            float v15 = (_COREBRIGHTNESS_LOG_DEFAULT
                             ? _COREBRIGHTNESS_LOG_DEFAULT
                             : init_default_corebrightness_log());
            float v22 = v15;
            char v21 = 16;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              log = v22;
              os_log_type_t type = v21;
              __os_log_helper_16_0_0(v20);
              _os_log_error_impl(&dword_1BA438000, log, type, "ASSERTION FAILED: deltaCurve > 0.0F", v20, 2u);
            }
          }
          if (v23 < 0.0)
          {
            float v19 = 0;
            uint64_t v12 = (_COREBRIGHTNESS_LOG_DEFAULT
                             ? _COREBRIGHTNESS_LOG_DEFAULT
                             : init_default_corebrightness_log());
            float v19 = v12;
            char v18 = 16;
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              os_log_type_t v10 = v19;
              os_log_type_t v11 = v18;
              __os_log_helper_16_0_0(v17);
              _os_log_error_impl(&dword_1BA438000, v10, v11, "ASSERTION FAILED: deltaPWM >= 0.0F", v17, 2u);
            }
          }
          if (v24 != 0.0) {
            float v25 = v23 / v24;
          }
          float v28 = *(float *)&nitsToPWMPercentage[2 * i]
              + (float)(v25 * (float)(*(float *)&nitsToPWMPercentage[2 * i + 2] - *(float *)&nitsToPWMPercentage[2 * i]));
          break;
        }
      }
    }
    else
    {
      float v28 = 30.0;
    }
  }
  else
  {
    float v28 = 0.0;
  }
  if (v28 > 0.0)
  {
    float v16 = v28;
    [(KeyboardBacklightHIDCurve *)v31 maxCurveNits];
    if (v16 >= v5) {
      float v9 = v5;
    }
    else {
      float v9 = v16;
    }
    [(KeyboardBacklightHIDCurve *)v31 minCapableNits];
    if (v9 >= v6) {
      return v9;
    }
    else {
      return v6;
    }
  }
  return v28;
}

- (float)currentLuxToAmbient
{
  [(KeyboardBacklightHIDCurve *)self currentLuxToNits];
  -[KeyboardBacklightHIDCurve convertNitsToLevelPercentage:](self, "convertNitsToLevelPercentage:");
  return result;
}

- (void)handleLuxUpdate:(float)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  float v44 = self;
  SEL v43 = a2;
  float v42 = a3;
  if (a3 < 0.0)
  {
    id v41 = 0;
    os_log_t v34 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    id v41 = v34;
    char v40 = 16;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      log = v41;
      os_log_type_t type = v40;
      __os_log_helper_16_0_0(v39);
      _os_log_error_impl(&dword_1BA438000, log, type, "ASSERTION FAILED: lux >= 0.0F", v39, 2u);
    }
  }
  *(float *)&double v3 = v42;
  [(KeyboardBacklight *)v44 setCurrentLux:v3];
  if ([(KeyboardBacklight *)v44 hysteresisOn])
  {
    float v31 = v42;
    float v30 = *(float *)&dword_1E9F73998;
    [(KeyboardBacklightHIDCurve *)v44 luxHysteresis];
    float v5 = v4;
    *(float *)&double v6 = v31;
    -[KeyboardBacklight setHysteresisOn:](v44, "setHysteresisOn:", v31 < (float)(v30 + v5), v6);
  }
  if (![(KeyboardBacklight *)v44 suspend])
  {
    *(float *)&double v7 = v42;
    -[KeyboardBacklight setManualAdjust:](v44, "setManualAdjust:", v42 <= *(float *)&dword_1E9F73998, v7);
    char v38 = 1;
    if (v44->_color == 70
      && ![(KeyboardBacklight *)v44 hysteresisOn]
      && [(KeyboardBacklight *)v44 saturated])
    {
      *(float *)&double v8 = v42;
      if (v42 < *(float *)&dword_1E9F73998)
      {
        -[KeyboardBacklight setSaturated:](v44, "setSaturated:", 0, v8);
        [(KeyboardBacklight *)v44 setHysteresisOn:1];
      }
    }
    else if ([(KeyboardBacklight *)v44 saturated] {
           && (float v29 = v42,
    }
               float v28 = *(float *)&dword_1E9F73998,
               [(KeyboardBacklightHIDCurve *)v44 luxHysteresis],
               float v9 = *(float *)&v10,
               *(float *)&double v10 = v29,
               v29 < (float)(v28 - v9)))
    {
      -[KeyboardBacklight setSaturated:](v44, "setSaturated:", 0, v10);
    }
    else if ([(KeyboardBacklight *)v44 saturated] {
           || (*(float *)&double v11 = v42, v42 <= *(float *)&dword_1E9F73998))
    }
    {
      if ([(KeyboardBacklight *)v44 suppressed] || [(KeyboardBacklight *)v44 saturated]) {
        char v38 = 0;
      }
    }
    else
    {
      -[KeyboardBacklight setSaturated:](v44, "setSaturated:", 1, v11);
    }
    [(KeyboardBacklight *)v44 levelPercentage];
    if (v12 > 0.0
      && [(KeyboardBacklight *)v44 autoAdjust]
      && ![(KeyboardBacklight *)v44 suspend]
      && (v38 & 1) != 0)
    {
      float v25 = v44;
      [(KeyboardBacklight *)v44 previousLevel];
      -[KeyboardBacklightHIDCurve perceptualBrightnessForLevel:](v25, "perceptualBrightnessForLevel:");
      float v37 = v13;
      [(KeyboardBacklight *)v44 levelPercentage];
      int v36 = v14;
      int v26 = v44;
      [(KeyboardBacklightHIDCurve *)v44 currentLuxToAmbient];
      -[KeyboardBacklightHIDCurve calculateLevelPercentageAtAmbient:](v26, "calculateLevelPercentageAtAmbient:");
      int v27 = v44;
      [(KeyboardBacklightHIDCurve *)v44 level];
      -[KeyboardBacklightHIDCurve perceptualBrightnessForLevel:](v27, "perceptualBrightnessForLevel:");
      float v35 = v15;
      if (v44->super.super._logHandle)
      {
        logHandle = v44->super.super._logHandle;
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
        *(double *)&uint64_t v21 = v42;
        [(KeyboardBacklight *)v44 previousLevel];
        *(double *)&uint64_t v22 = v16;
        [(KeyboardBacklightHIDCurve *)v44 level];
        __os_log_helper_16_0_6_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v46, v21, COERCE__INT64(v37), COERCE__INT64(v35), COERCE__INT64(fabs((float)(v35 - v37))), v22, COERCE__INT64(v17));
        _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Lux = %f, prevPerceptualLevel = %f, currentPerceptualLevel = %f, diff = %f, prevLevel = %f, level = %f", v46, 0x3Eu);
      }
      if (fabs((float)(v35 - v37)) >= 0.00999999978 || [(KeyboardBacklight *)v44 saturated])
      {
        [(KeyboardBacklight *)v44 updateBacklightDeviceWithReason:3];
      }
      else
      {
        LODWORD(v18) = v36;
        [(KeyboardBacklight *)v44 setLevelPercentage:v18];
      }
    }
    if (v44->super.super._logHandle)
    {
      float v20 = v44->super.super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v19 = init_default_corebrightness_log();
      }
      float v20 = v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v45, (uint64_t)v44);
      _os_log_debug_impl(&dword_1BA438000, v20, OS_LOG_TYPE_DEBUG, "%@", v45, 0xCu);
    }
  }
}

- (void)calculateLevelPercentageAtAmbient:(float)a3
{
  int v26 = self;
  SEL v25 = a2;
  float v24 = a3;
  if (a3 < 0.0)
  {
    float v23 = 0;
    float v15 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    float v23 = v15;
    char v22 = 16;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      log = v23;
      os_log_type_t type = v22;
      __os_log_helper_16_0_0(v21);
      _os_log_error_impl(&dword_1BA438000, log, type, "ASSERTION FAILED: ambient >= 0.0", v21, 2u);
    }
  }
  if (v24 > 1.0)
  {
    float v20 = 0;
    float v12 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    float v20 = v12;
    char v19 = 16;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      double v10 = v20;
      os_log_type_t v11 = v19;
      __os_log_helper_16_0_0(v18);
      _os_log_error_impl(&dword_1BA438000, v10, v11, "ASSERTION FAILED: ambient <= 1.0", v18, 2u);
    }
  }
  float v17 = 0.001;
  [(KeyboardBacklight *)v26 levelMin];
  if (v3 == 0.0) {
    float v17 = 0.015;
  }
  if (v24 >= 0.0 && v24 <= 1.0)
  {
    double v4 = v24;
    if (v24 == 0.0)
    {
      float v9 = v17;
    }
    else
    {
      [(KeyboardBacklight *)v26 ambientSlope];
      float v9 = *(float *)&v4 * v24;
    }
    *(float *)&double v4 = v9;
    [(KeyboardBacklight *)v26 setLevelPercentage:v4];
    [(KeyboardBacklight *)v26 levelPercentage];
    float v16 = v5;
    [(KeyboardBacklightHIDCurve *)v26 maxLevelPercentage];
    if (v16 >= *(float *)&v6) {
      float v8 = *(float *)&v6;
    }
    else {
      float v8 = v16;
    }
    if (v17 >= v8) {
      float v7 = v17;
    }
    else {
      float v7 = v8;
    }
    *(float *)&double v6 = v7;
    [(KeyboardBacklight *)v26 setLevelPercentage:v6];
  }
}

- (float)maxCapableNits
{
  return 30.0;
}

- (float)minCapableNits
{
  return 1.875;
}

- (float)perceptualBrightnessForLevel:(float)a3
{
  float v9 = 0.0;
  if (a3 > 0.0)
  {
    [(KeyboardBacklightHIDCurve *)self maxCapableNits];
    float v7 = v3;
    [(KeyboardBacklightHIDCurve *)self minCapableNits];
    float v8 = logf(v7 / v4);
    if (v8 != 0.0)
    {
      [(KeyboardBacklightHIDCurve *)self maxCapableNits];
      return (float)(logf(a3 / v5) / v8) + 1.0;
    }
  }
  return v9;
}

- (int)color
{
  return self->_color;
}

- (void)setColor:(int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 != self->_color)
  {
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
      __os_log_helper_16_0_1_4_0((uint64_t)v7, a3);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Set color to %d", v7, 8u);
    }
    self->_color = a3;
    [(KeyboardBacklightHIDCurve *)self reconfigureSettingsForColor:a3];
  }
}

- (void)reconfigureSettingsForColor:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((a3 == 53 || a3 == 70 || a3 == 71) && [(KeyboardBacklight *)self levelUnit] == 16777441)
  {
    id v11 = +[CBKeyboardPreferencesManager copyPreferenceForKey:@"KeyboardCurveVersion" keyboardID:[(KeyboardBacklight *)self keyboardID]];
    if (v11
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (a3 == 53 && ([v11 floatValue], v3 >= 2.03)
       || a3 == 70 && ([v11 floatValue], v4 >= 3.0)
       || a3 == 71 && ([v11 floatValue], v5 >= 2.0)))
    {
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
        [v11 floatValue];
        __os_log_helper_16_0_1_8_0((uint64_t)v15, COERCE__INT64(v6));
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Found up to date curve version %f in preferences.", v15, 0xCu);
      }
      [(KeyboardBacklightHIDCurve *)self updateDefaultCurveForColor:a3];
    }
    else
    {
      if (self->super.super._logHandle)
      {
        uint64_t v8 = self->super.super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v7 = init_default_corebrightness_log();
        }
        uint64_t v8 = v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v14, a3);
        _os_log_impl(&dword_1BA438000, v8, OS_LOG_TYPE_DEFAULT, "Update curve and version for color %d", v14, 8u);
      }
      [(KeyboardBacklightHIDCurve *)self updateDefaultCurveForColor:a3];
      luxToNitsCurve[0] = defaultLuxToNitsCurve;
      dword_1E9F73988 = dword_1E9F739A8;
      dword_1E9F73990 = dword_1E9F739B0;
      dword_1E9F73998 = dword_1E9F739B8;
      dword_1E9F73984 = dword_1E9F739A4;
      dword_1E9F7398C = dword_1E9F739AC;
      dword_1E9F73994 = dword_1E9F739B4;
      dword_1E9F7399C = dword_1E9F739BC;
      switch(a3)
      {
        case '5':
          self->_curveVersion = 2.03;
          break;
        case 'F':
          self->_curveVersion = 3.0;
          break;
        case 'G':
          self->_curveVersion = 2.0;
          break;
        default:
          self->_curveVersion = 1.0;
          break;
      }
      [(KeyboardBacklightHIDCurve *)self storeKeyboardBacklightCurveToPreferences];
      [(KeyboardBacklight *)self currentLux];
      -[KeyboardBacklightHIDCurve handleLuxUpdate:](self, "handleLuxUpdate:");
    }
  }
}

- (void)updateDefaultCurveForColor:(int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case '5':
      int v14 = (void *)[(HIDDevice *)[(KeyboardBacklight *)self device] propertyForKey:@"ProductID"];
      int v13 = -1;
      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v13 = [v14 intValue];
        }
      }
      defaultLuxToNitsCurve = 0;
      dword_1E9F739A8 = 5.0;
      dword_1E9F739B0 = 20.0;
      dword_1E9F739B8 = 21.0;
      dword_1E9F739A4 = 1114636288;
      dword_1E9F739AC = 1124204544;
      dword_1E9F739B4 = 1124204544;
      [(KeyboardBacklight *)self levelMax];
      *(float *)&dword_1E9F739BC = 0.01 * v3;
      self->_float luxHysteresis = *(float *)&dword_1E9F739B8 * 0.13;
      if (self->_luxHysteresis >= 10.0) {
        float luxHysteresis = self->_luxHysteresis;
      }
      else {
        float luxHysteresis = 10.0;
      }
      self->_float luxHysteresis = luxHysteresis;
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
        __os_log_helper_16_2_4_8_0_4_0_4_0_8_66((uint64_t)v18, COERCE__INT64(self->_luxHysteresis), [(KeyboardBacklightHIDCurve *)self color], v13, (uint64_t)[(KeyboardBacklightHIDCurve *)self defaultBrightnessCurve]);
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "Hysteresis = %f Color = %d PID = %d Default curve = %{public}@", v18, 0x22u);
      }
      break;
    case 'F':
      defaultLuxToNitsCurve = 0;
      dword_1E9F739A8 = 5.0;
      dword_1E9F739B0 = 1097754214;
      dword_1E9F739B8 = 1097848586;
      dword_1E9F739A4 = 3.25;
      dword_1E9F739AC = 7.0;
      dword_1E9F739B4 = 7.0;
      dword_1E9F739BC = 0;
      self->_float luxHysteresis = 14.99 * 0.13;
      if (self->_luxHysteresis >= 5.0) {
        float v9 = self->_luxHysteresis;
      }
      else {
        float v9 = 5.0;
      }
      self->_float luxHysteresis = v9;
      if (self->super.super._logHandle)
      {
        uint64_t v8 = self->super.super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v7 = init_default_corebrightness_log();
        }
        uint64_t v8 = v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_3_8_0_4_0_8_66((uint64_t)v17, COERCE__INT64(self->_luxHysteresis), [(KeyboardBacklightHIDCurve *)self color], (uint64_t)[(KeyboardBacklightHIDCurve *)self defaultBrightnessCurve]);
        _os_log_impl(&dword_1BA438000, v8, OS_LOG_TYPE_DEFAULT, "Hysteresis = %f Color = %d Default curve = %{public}@", v17, 0x1Cu);
      }
      break;
    case 'G':
      defaultLuxToNitsCurve = 0;
      dword_1E9F739A8 = 1116471296;
      dword_1E9F739B0 = 1126170624;
      dword_1E9F739B8 = 1133903872;
      dword_1E9F739A4 = 3.25;
      dword_1E9F739AC = 9.0;
      dword_1E9F739B4 = 9.0;
      dword_1E9F739BC = 0;
      self->_float luxHysteresis = 300.0 * 0.13;
      float v6 = self->_luxHysteresis >= 10.0 ? self->_luxHysteresis : 10.0;
      self->_float luxHysteresis = v6;
      if (self->super.super._logHandle)
      {
        float v5 = self->super.super._logHandle;
      }
      else
      {
        uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        float v5 = v4;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_3_8_0_4_0_8_66((uint64_t)v16, COERCE__INT64(self->_luxHysteresis), [(KeyboardBacklightHIDCurve *)self color], (uint64_t)[(KeyboardBacklightHIDCurve *)self defaultBrightnessCurve]);
        _os_log_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEFAULT, "Hysteresis = %f Color = %d Default curve = %{public}@", v16, 0x1Cu);
      }
      break;
  }
}

- (float)chicletCurveCoefficient
{
  return self->_chicletCurveCoefficient;
}

- (float)chicletCurvePower
{
  return self->_chicletCurvePower;
}

- (float)luxHysteresis
{
  return self->_luxHysteresis;
}

- (void)setLuxHysteresis:(float)a3
{
  self->_float luxHysteresis = a3;
}

@end