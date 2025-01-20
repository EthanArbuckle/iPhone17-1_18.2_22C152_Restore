@interface CBABCurve
- (BOOL)setLux:(float)a3;
- (CBABCurve)init;
- (CBABCurve)initWithConfiguration:(id)a3;
- (CBABCurve)initWithUUID:(id)a3;
- (CBABCurve)initWithUUID:(id)a3 vendorID:(id)a4 andProductID:(id)a5;
- (float)getLinearBrightness;
- (float)getLux;
- (float)getScaledBL1;
- (float)getScaledBL2;
- (float)scaleFactor;
- (id)copyUserPrefState;
- (id)description;
- (unint64_t)version;
- (void)resetToDefaultState;
- (void)setLinearBrightnessMin:(float)a3 andMax:(float)a4;
- (void)setSavedPrefences:(id)a3;
- (void)setScaleFactor:(float)a3;
- (void)setScaledBL1:(float)a3;
- (void)setScaledBL2:(float)a3;
- (void)updateALSParametersForDisplayBrightness:(float)a3;
@end

@implementation CBABCurve

- (CBABCurve)init
{
  v5 = self;
  SEL v4 = a2;
  self->_logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.CBABCurve", "default");
  v3.receiver = v5;
  v3.super_class = (Class)CBABCurve;
  v5 = [(CBABCurve *)&v3 init];
  if (v5)
  {
    v5->pref.e1 = 0.0;
    v5->pref.e2 = 262.5;
    v5->pref.bl1 = 0.1;
    v5->pref.bl2 = 0.625;
    v5->pref.eThresh = 78.5;
    v5->pref.maximumBrightness = 1.0;
    v5->pref.minimumBrightness = 0.001;
    v5->currentLux = 300.0;
    v5->_scaleFactor = 1.0;
    v5->shouldClampLowLux = 0;
  }
  return v5;
}

- (CBABCurve)initWithUUID:(id)a3
{
  return -[CBABCurve initWithUUID:vendorID:andProductID:](self, "initWithUUID:vendorID:andProductID:", a3, 0);
}

- (CBABCurve)initWithUUID:(id)a3 vendorID:(id)a4 andProductID:(id)a5
{
  context = (void *)MEMORY[0x1BA9ECAE0]();
  v8 = objc_alloc_init(CBABCurveConfiguration);
  [(CBABCurveConfiguration *)v8 setVendorID:a4];
  [(CBABCurveConfiguration *)v8 setProductID:a5];
  [(CBABCurveConfiguration *)v8 setUuid:a3];
  v7 = [(CBABCurve *)self initWithConfiguration:v8];
  return v7;
}

- (CBABCurve)initWithConfiguration:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  v70 = self;
  SEL v69 = a2;
  id v68 = a3;
  self->_logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.CBABCurve", "default");
  v67.receiver = v70;
  v67.super_class = (Class)CBABCurve;
  v70 = [(CBABCurve *)&v67 init];
  if (v70)
  {
    *((float *)v70 + 3) = 1.0;
    *((_DWORD *)v70 + 2) = 981668463;
    *((_DWORD *)v70 + 9) = 1133903872;
    *((float *)v70 + 14) = 1.0;
    objc_msgSend((id)objc_msgSend(v68, "minBrightness"), "floatValue");
    float v66 = v3;
    *((unsigned char *)v70 + 44) = float_equal(v3, 1.0);
    os_log_t oslog = 0;
    if (*((void *)v70 + 6))
    {
      v38 = *((void *)v70 + 6);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      v38 = inited;
    }
    os_log_t oslog = v38;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      if (*((unsigned char *)v70 + 44)) {
        SEL v4 = "YES";
      }
      else {
        SEL v4 = "NO";
      }
      __os_log_helper_16_2_2_8_0_8_32((uint64_t)v81, COERCE__INT64(v66), (uint64_t)v4);
      _os_log_impl(&dword_1BA438000, oslog, type, "Panel min brightness from curve configuration: %f; should clamp low lux: %s",
        v81,
        0x16u);
    }
    char v63 = 1;
    id v62 = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:@"DisplayPreferences"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v61 = (id)objc_msgSend(v62, "objectForKey:", objc_msgSend(v68, "uuid"));
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v60 = (id)[v61 objectForKey:@"AutoBrightnessCurve"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v59 = (id)[v60 objectForKey:@"Version"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v36 = [v59 unsignedIntValue];
            *((void *)v70 + 8) = v36;
            if (v36 == 1)
            {
              os_log_t v58 = 0;
              if (*((void *)v70 + 6))
              {
                v35 = *((void *)v70 + 6);
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t v34 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t v34 = init_default_corebrightness_log();
                }
                v35 = v34;
              }
              os_log_t v58 = v35;
              os_log_type_t v57 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                __os_log_helper_16_0_1_8_0((uint64_t)v80, *((void *)v70 + 8));
                _os_log_impl(&dword_1BA438000, v58, v57, "upgrading curve from version %lu", v80, 0xCu);
              }
              if ([v68 isBuiltin] & 1) != 0 && (objc_msgSend(v68, "isEnergySaving")) {
                char v63 = 0;
              }
              else {
                *((void *)v70 + 8) = 2;
              }
            }
            else if (v36 != 2)
            {
              os_log_t v56 = 0;
              if (*((void *)v70 + 6))
              {
                v33 = *((void *)v70 + 6);
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
              os_log_t v56 = v33;
              os_log_type_t v55 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                v30 = v56;
                os_log_type_t v31 = v55;
                __os_log_helper_16_0_0(v54);
                _os_log_error_impl(&dword_1BA438000, v30, v31, "curve version mismatch", v54, 2u);
              }
              char v63 = 0;
            }
          }
          else
          {
            char v63 = 0;
          }
          id v59 = (id)[v60 objectForKey:@"Lux1"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v59 floatValue];
            *((_DWORD *)v70 + 6) = v5;
          }
          else
          {
            char v63 = 0;
          }
          id v59 = (id)[v60 objectForKey:@"Lux2"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v59 floatValue];
            *((_DWORD *)v70 + 7) = v6;
          }
          else
          {
            char v63 = 0;
          }
          id v59 = (id)[v60 objectForKey:@"Backlight1"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v59 floatValue];
            *((_DWORD *)v70 + 4) = v7;
          }
          else
          {
            char v63 = 0;
          }
          id v59 = (id)[v60 objectForKey:@"Backlight2"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v59 floatValue];
            *((_DWORD *)v70 + 5) = v8;
          }
          else
          {
            char v63 = 0;
          }
          id v59 = (id)[v60 objectForKey:@"LuxThreshold"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v59 floatValue];
            *((_DWORD *)v70 + 8) = v9;
          }
          else
          {
            char v63 = 0;
          }
        }
        else
        {
          os_log_t v53 = 0;
          if (*((void *)v70 + 6))
          {
            v29 = *((void *)v70 + 6);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v28 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v28 = init_default_corebrightness_log();
            }
            v29 = v28;
          }
          os_log_t v53 = v29;
          os_log_type_t v52 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v79, [v68 productID]);
            _os_log_impl(&dword_1BA438000, v53, v52, "no curve preferences for the display %{public}@", v79, 0xCu);
          }
          char v63 = 0;
        }
      }
      else
      {
        os_log_t v51 = 0;
        if (*((void *)v70 + 6))
        {
          v27 = *((void *)v70 + 6);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v26 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v26 = init_default_corebrightness_log();
          }
          v27 = v26;
        }
        os_log_t v51 = v27;
        os_log_type_t v50 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_66((uint64_t)v78, [v68 productID]);
          _os_log_impl(&dword_1BA438000, v51, v50, "no preferences for the display %{public}@", v78, 0xCu);
        }
        char v63 = 0;
      }
    }
    else
    {
      os_log_t v49 = 0;
      if (*((void *)v70 + 6))
      {
        v25 = *((void *)v70 + 6);
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
      os_log_t v49 = v25;
      os_log_type_t v48 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v49;
        os_log_type_t v23 = v48;
        __os_log_helper_16_0_0(v47);
        _os_log_impl(&dword_1BA438000, v22, v23, "no display preferences", v47, 2u);
      }
      char v63 = 0;
    }

    if (v63)
    {
      int v75 = *((_DWORD *)v70 + 6);
      int v74 = *((_DWORD *)v70 + 7);
      int v73 = *((_DWORD *)v70 + 4);
      int v72 = *((_DWORD *)v70 + 5);
      int v71 = *((_DWORD *)v70 + 8);
    }
    else
    {
      *((void *)v70 + 8) = 2;
      *((_DWORD *)v70 + 6) = 0;
      *((_DWORD *)v70 + 7) = 1132675072;
      *((_DWORD *)v70 + 8) = 1117585408;
      if ([v68 isBuiltin] & 1) != 0 && (objc_msgSend(v68, "isEnergySaving"))
      {
        objc_msgSend((id)objc_msgSend(v68, "maxBrightness"), "doubleValue");
        *(double *)&uint64_t v46 = v10;
        float v11 = 0.107505 * (500.0 / v10);
        *((float *)v70 + 4) = v11;
        *(float *)&double v10 = 0.341785 * (500.0 / *(double *)&v46);
        *((_DWORD *)v70 + 5) = LODWORD(v10);
        os_log_t v45 = 0;
        if (*((void *)v70 + 6))
        {
          v21 = *((void *)v70 + 6);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v20 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v20 = init_default_corebrightness_log();
          }
          v21 = v20;
        }
        os_log_t v45 = v21;
        os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v77, v46);
          _os_log_impl(&dword_1BA438000, v45, v44, "using default curve based on max brighness %f", v77, 0xCu);
        }
      }
      else if (objc_msgSend((id)objc_msgSend(v68, "vendorID"), "unsignedIntegerValue") == 1552 {
             && (objc_msgSend((id)objc_msgSend(v68, "productID"), "unsignedIntegerValue") == 44606
      }
              || objc_msgSend((id)objc_msgSend(v68, "productID"), "unsignedIntegerValue") == 44602))
      {
        os_log_t v43 = 0;
        if (*((void *)v70 + 6))
        {
          v19 = *((void *)v70 + 6);
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
        os_log_t v43 = v19;
        os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [v68 productID];
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v76, v17, [v68 vendorID]);
          _os_log_impl(&dword_1BA438000, v43, v42, "using default curve configuration (productID=%@ | vendorID=%@)", v76, 0x16u);
        }
        *((_DWORD *)v70 + 4) = 1032174594;
        *((_DWORD *)v70 + 5) = 1057803469;
      }
      else
      {
        os_log_t v41 = 0;
        if (*((void *)v70 + 6))
        {
          v16 = *((void *)v70 + 6);
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
        os_log_t v41 = v16;
        os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v41;
          os_log_type_t v14 = v40;
          __os_log_helper_16_0_0(v39);
          _os_log_impl(&dword_1BA438000, v13, v14, "using default curve configuration", v39, 2u);
        }
        *((_DWORD *)v70 + 4) = 1036831949;
        *((float *)v70 + 5) = 0.625;
      }
    }
  }
  return (CBABCurve *)v70;
}

- (id)description
{
  SEL v4 = self;
  SEL v3 = a2;
  return (id)[NSString stringWithFormat:@"\nCurrent Lux: %f\nPreferences\ne1: %f, e2: %f \nbl1: %f, bl2: %f\nminBrightness: %f\nmaxBrightness: %f scaler: %f", self->currentLux, self->pref.e1, self->pref.e2, self->pref.bl1, self->pref.bl2, self->pref.minimumBrightness, self->pref.maximumBrightness, self->_scaleFactor, a2, self];
}

- (void)setLinearBrightnessMin:(float)a3 andMax:(float)a4
{
  self->pref.maximumBrightness = a4;
  self->pref.minimumBrightness = a3;
}

- (BOOL)setLux:(float)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  float v18 = a3;
  if (a3 >= 0.0)
  {
    if (a3 <= 5000.0)
    {
      if (self->shouldClampLowLux && a3 < 1.0)
      {
        float v18 = 1.0;
        if (self->_logHandle)
        {
          logHandle = self->_logHandle;
        }
        else
        {
          uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
          logHandle = v12;
        }
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v22, 0x3FF0000000000000);
          _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Cap lux on %f (lower bound)\n", v22, 0xCu);
        }
      }
    }
    else
    {
      float v18 = 5000.0;
      if (self->_logHandle)
      {
        uint64_t v15 = self->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        uint64_t v15 = inited;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v23, 5000);
        _os_log_debug_impl(&dword_1BA438000, v15, OS_LOG_TYPE_DEBUG, "Cap lux on %d\n", v23, 8u);
      }
    }
    self->float currentLux = v18;
    [(CBABCurve *)self getScaledBL2];
    float v9 = v3;
    [(CBABCurve *)self getScaledBL1];
    float v11 = (float)(v9 - v4) / (float)(self->pref.e2 - self->pref.e1);
    float currentLux = self->currentLux;
    [(CBABCurve *)self getScaledBL1];
    self->mappedBrightness = v5 + (float)(v11 * currentLux);
    self->mappedBrightness = fmaxf(self->mappedBrightness, self->pref.minimumBrightness);
    self->mappedBrightness = fminf(self->mappedBrightness, self->pref.maximumBrightness);
    if (self->_logHandle)
    {
      int v8 = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v7 = init_default_corebrightness_log();
      }
      int v8 = v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v21, COERCE__INT64(self->currentLux), COERCE__INT64(self->mappedBrightness), COERCE__INT64(self->_scaleFactor));
      _os_log_debug_impl(&dword_1BA438000, v8, OS_LOG_TYPE_DEBUG, "setLux=%f, mappedBrightness=%f, scaler=%f", v21, 0x20u);
    }
    char v20 = 1;
  }
  else
  {
    if (self->_logHandle)
    {
      uint64_t v17 = self->_logHandle;
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
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v24, COERCE__INT64(v18));
      _os_log_error_impl(&dword_1BA438000, v17, OS_LOG_TYPE_ERROR, "lux value (%f) is < 0", v24, 0xCu);
    }
    char v20 = 0;
  }
  return v20 & 1;
}

- (float)getLux
{
  return self->currentLux;
}

- (float)getLinearBrightness
{
  return self->mappedBrightness;
}

- (float)getScaledBL1
{
  return self->pref.bl1 * self->_scaleFactor;
}

- (float)getScaledBL2
{
  return self->pref.bl2 * self->_scaleFactor;
}

- (void)setScaledBL1:(float)a3
{
  self->pref.bl1 = a3 / self->_scaleFactor;
}

- (void)setScaledBL2:(float)a3
{
  self->pref.bl2 = a3 / self->_scaleFactor;
}

- (void)updateALSParametersForDisplayBrightness:(float)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (self->currentLux <= 5000.0)
  {
    if (self->shouldClampLowLux && self->currentLux < 1.0)
    {
      self->float currentLux = 1.0;
      if (self->_logHandle)
      {
        logHandle = self->_logHandle;
      }
      else
      {
        uint64_t v27 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        logHandle = v27;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v44, 0x3FF0000000000000);
        _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Cap lux on %f (lower bound)\n", v44, 0xCu);
      }
    }
  }
  else
  {
    self->float currentLux = 5000.0;
    if (self->_logHandle)
    {
      v30 = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      v30 = inited;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v45, 5000);
      _os_log_debug_impl(&dword_1BA438000, v30, OS_LOG_TYPE_DEBUG, "Cap lux on %d\n", v45, 8u);
    }
  }
  if (self->currentLux == 0.0)
  {
    float v3 = self->currentLux + 0.01;
    self->float currentLux = v3;
  }
  float v4 = (float)(a3 * 500.0) * 72.0 / (500.0 - (self->currentLux - 72.0 * self->currentLux));
  float v32 = v4;
  float v5 = (float)(a3 * 500.0) * 3.0 / (500.0 - (self->currentLux - 3.0 * self->currentLux));
  float v31 = v5;
  float v6 = (float)(a3 * 500.0) / (500.0 - (self->currentLux - 3.0 * self->currentLux));
  float v7 = (float)(a3 * 500.0) / (500.0 - (self->currentLux - 72.0 * self->currentLux));
  float v35 = (float)(v32 - v7) / 500.0;
  float v33 = (float)(v31 - v6) / 500.0;
  if (self->_logHandle)
  {
    uint64_t v26 = self->_logHandle;
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
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v43, COERCE__INT64(v35), COERCE__INT64(v33), 0x3F6A16D3F97A4B02, 0x3F3730BC6BFAED56);
    _os_log_debug_impl(&dword_1BA438000, v26, OS_LOG_TYPE_DEBUG, "slope_min: %f slope_max: %f definemax: %f definemin: %f\n", v43, 0x2Au);
  }
  float v34 = fmaxf(v33, 0.00035386);
  float v36 = fmaxf(v35, 0.0031847);
  if (self->currentLux <= self->pref.eThresh)
  {
    [(CBABCurve *)self getScaledBL2];
    float v38 = fmaxf(fminf((float)(v13 - a3) / (float)(self->pref.e2 - self->currentLux), v36), v34);
    *(float *)&double v14 = a3 + (float)(v38 * (float)(self->pref.e1 - self->currentLux));
    [(CBABCurve *)self setScaledBL1:v14];
    *(float *)&double v15 = a3 + (float)(v38 * (float)(self->pref.e2 - self->currentLux));
    [(CBABCurve *)self setScaledBL2:v15];
    if (self->_logHandle)
    {
      char v20 = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v19 = init_default_corebrightness_log();
      }
      char v20 = v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      [(CBABCurve *)self getScaledBL1];
      *(double *)&uint64_t v18 = v16;
      [(CBABCurve *)self getScaledBL2];
      __os_log_helper_16_0_6_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v41, v18, COERCE__INT64(v17), COERCE__INT64(self->_scaleFactor), COERCE__INT64(v38), COERCE__INT64(a3), COERCE__INT64(self->currentLux));
      _os_log_impl(&dword_1BA438000, v20, OS_LOG_TYPE_INFO, "BELOW Bl1: %f BL2: %f (scaler=%f) slope: %f linBT: %f lux: %f\n", v41, 0x3Eu);
    }
  }
  else
  {
    [(CBABCurve *)self getScaledBL1];
    float v37 = fmaxf(fminf((float)(a3 - *(float *)&v8) / (float)(self->currentLux - self->pref.e1), v36), v34);
    if (self->currentLux < 150.0)
    {
      self->pref.e2 = 150.0;
      *(float *)&double v8 = a3 + (float)(v37 * (float)(self->pref.e2 - self->currentLux));
    }
    else
    {
      self->pref.e2 = self->currentLux;
      *(float *)&double v8 = a3;
    }
    [(CBABCurve *)self setScaledBL2:v8];
    float v24 = self->pref.e1 - self->pref.e2;
    [(CBABCurve *)self getScaledBL2];
    *(float *)&double v10 = v9 + (float)(v37 * v24);
    [(CBABCurve *)self setScaledBL1:v10];
    if (self->_logHandle)
    {
      os_log_type_t v23 = self->_logHandle;
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
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      [(CBABCurve *)self getScaledBL1];
      *(double *)&uint64_t v21 = v11;
      [(CBABCurve *)self getScaledBL2];
      __os_log_helper_16_0_5_8_0_8_0_8_0_8_0_8_0((uint64_t)v42, v21, COERCE__INT64(v12), COERCE__INT64(v37), COERCE__INT64(a3), COERCE__INT64(self->currentLux));
      _os_log_debug_impl(&dword_1BA438000, v23, OS_LOG_TYPE_DEBUG, "ABOVE Bl1: %f BL2: %f slope: %f linBT: %f lux: %f\n", v42, 0x34u);
    }
  }
}

- (void)resetToDefaultState
{
  double v10 = self;
  SEL v9 = a2;
  double v8 = 0;
  if (self->_logHandle)
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
  double v8 = logHandle;
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    os_log_type_t type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_1BA438000, log, type, (const char *)&unk_1BA61B929, v6, 2u);
  }
  v10->pref.e1 = 0.0;
  v10->pref.e2 = 262.5;
  v10->pref.bl1 = 0.1;
  v10->pref.bl2 = 0.625;
  v10->pref.eThresh = 78.5;
}

- (id)copyUserPrefState
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *(float *)&double v2 = self->pref.bl1;
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v2), @"Backlight1");
  *(float *)&double v3 = self->pref.bl2;
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v3), @"Backlight2");
  *(float *)&double v4 = self->pref.e1;
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v4), @"Lux1");
  *(float *)&double v5 = self->pref.e2;
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v5), @"Lux2");
  *(float *)&double v6 = self->pref.eThresh;
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v6), @"LuxThreshold");
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_version), @"Version");
  return v8;
}

- (void)setSavedPrefences:(id)a3
{
  if (a3)
  {
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"Lux1"), "floatValue");
    self->pref.e1 = v3;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"Lux2"), "floatValue");
    self->pref.e2 = v4;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"Backlight1"), "floatValue");
    self->pref.bl1 = v5;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"Backlight2"), "floatValue");
    self->pref.bl2 = v6;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"LuxThreshold"), "floatValue");
    self->pref.eThresh = v7;
  }
}

- (unint64_t)version
{
  return self->_version;
}

- (float)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(float)a3
{
  self->_scaleFactor = a3;
}

@end