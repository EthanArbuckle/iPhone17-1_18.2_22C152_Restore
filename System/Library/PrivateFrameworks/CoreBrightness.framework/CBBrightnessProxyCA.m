@interface CBBrightnessProxyCA
- (BOOL)allowUpdates;
- (BOOL)commitBrightness:(id *)a3;
- (BOOL)commitBrightness:(id *)a3 withBlock:(id)a4;
- (BOOL)forceCommitBrightness:(id *)a3 withBlock:(id)a4;
- (BOOL)isBrightnessAvailable;
- (BOOL)isWhitePointAvailable;
- (BOOL)isWhitePointD50XYZ;
- (BOOL)setWhitePoint:(id)a3 rampDuration:(double)a4 error:(id *)a5;
- (CBBrightnessProxyCA)initWithCABrightnessControl:(id)a3;
- (NSString)brightnessRequestEDRHeadroom;
- (NSString)brightnessRequestRampDuration;
- (NSString)brightnessSecureIndicatorActiveCount;
- (NSString)brightnessSecureIndicatorType;
- (id)brightnessNotificationAttached;
- (id)brightnessNotificationPowerOff;
- (id)brightnessNotificationPowerOn;
- (id)brightnessNotificationRequestEDR;
- (id)brightnessNotificationSecureIndicatorOff;
- (id)brightnessNotificationSecureIndicatorOn;
- (id)getBrightnessCapabilities;
- (id)getUUID;
- (unint64_t)CBDispTypeDFR;
- (unint64_t)CBDispTypeExternal;
- (unint64_t)CBDispTypeIntegrated;
- (unint64_t)CBDispTypeVirtual;
- (unint64_t)CBDispTypeWireless;
- (unint64_t)getDisplayType;
- (unint64_t)getProductId;
- (unint64_t)getVendorId;
- (unsigned)getDisplayId;
- (void)dealloc;
- (void)registerForNotifications:(id)a3 withBlock:(id)a4;
- (void)setAllowUpdates:(BOOL)a3;
- (void)setAmbient:(float)a3;
- (void)setBrightnessControlDisabled:(BOOL)a3;
- (void)setBrightnessLimit:(float)a3;
- (void)setContrastEnhancer:(float)a3;
- (void)setHeadroom:(float)a3;
- (void)setHighAmbientAdaptation:(float)a3;
- (void)setIndicatorBrightness:(float)a3;
- (void)setIndicatorBrightnessLimit:(float)a3;
- (void)setLowAmbientAdaptation:(float)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setPotentialHeadroom:(float)a3;
- (void)setSDRBrightness:(float)a3;
- (void)unregisterNotificationBlocks;
@end

@implementation CBBrightnessProxyCA

- (void)setBrightnessLimit:(float)a3
{
  if ([(CBBrightnessProxyCA *)self allowUpdates])
  {
    *(float *)&double v3 = a3;
    [(CABrightnessControl *)self->_brightnessControl setBrightnessLimit:v3];
  }
}

- (void)setSDRBrightness:(float)a3
{
  if ([(CBBrightnessProxyCA *)self allowUpdates])
  {
    *(float *)&double v3 = a3;
    [(CABrightnessControl *)self->_brightnessControl setSDRBrightness:v3];
  }
}

- (void)setHeadroom:(float)a3
{
  if ([(CBBrightnessProxyCA *)self allowUpdates])
  {
    *(float *)&double v3 = a3;
    [(CABrightnessControl *)self->_brightnessControl setHeadroom:v3];
  }
}

- (void)setPotentialHeadroom:(float)a3
{
  if ([(CBBrightnessProxyCA *)self allowUpdates])
  {
    *(float *)&double v3 = a3;
    [(CABrightnessControl *)self->_brightnessControl setPotentialHeadroom:v3];
  }
}

- (BOOL)setWhitePoint:(id)a3 rampDuration:(double)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v18 = self;
  SEL v17 = a2;
  id v16 = a3;
  double v15 = a4;
  v14 = a5;
  char v13 = 0;
  memset(__b, 0, sizeof(__b));
  for (int i = 0; i < (unint64_t)[v16 count]; ++i)
  {
    objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", i), "floatValue");
    __b[i] = v5;
  }
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
  if (os_signpost_enabled(logHandle))
  {
    __os_log_helper_16_0_9_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v20, COERCE__INT64(__b[0]), COERCE__INT64(__b[1]), COERCE__INT64(__b[2]), COERCE__INT64(__b[3]), COERCE__INT64(__b[4]), COERCE__INT64(__b[5]), COERCE__INT64(__b[6]), COERCE__INT64(__b[7]), COERCE__INT64(__b[8]));
    _os_signpost_emit_with_name_impl(&dword_1BA438000, logHandle, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "setWhitePoint", "[(%f;%f;%f),(%f;%f;%f),(%f;%f;%f)]",
      v20,
      0x5Cu);
  }
  if ([(CBBrightnessProxyCA *)v18 allowUpdates]) {
    char v13 = [(CABrightnessControl *)v18->_brightnessControl setWhitePoint:__b rampDuration:v14 error:v15] & 1;
  }
  if (v18->_logHandle)
  {
    v8 = v18->_logHandle;
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
  if (os_signpost_enabled(v8))
  {
    __os_log_helper_16_0_9_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v19, COERCE__INT64(__b[0]), COERCE__INT64(__b[1]), COERCE__INT64(__b[2]), COERCE__INT64(__b[3]), COERCE__INT64(__b[4]), COERCE__INT64(__b[5]), COERCE__INT64(__b[6]), COERCE__INT64(__b[7]), COERCE__INT64(__b[8]));
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "setWhitePoint", "[(%f;%f;%f),(%f;%f;%f),(%f;%f;%f)]",
      v19,
      0x5Cu);
  }
  return v13 & 1;
}

- (BOOL)allowUpdates
{
  return self->_allowUpdates;
}

- (void)setContrastEnhancer:(float)a3
{
}

- (void)setLowAmbientAdaptation:(float)a3
{
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v3 = a3;
    [(CABrightnessControl *)self->_brightnessControl setLowAmbientAdaptation:v3];
  }
}

- (void)setIndicatorBrightnessLimit:(float)a3
{
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v3 = a3;
    [(CABrightnessControl *)self->_brightnessControl setIndicatorBrightnessLimit:v3];
  }
}

- (void)setIndicatorBrightness:(float)a3
{
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v3 = a3;
    [(CABrightnessControl *)self->_brightnessControl setIndicatorBrightness:v3];
  }
}

- (void)setHighAmbientAdaptation:(float)a3
{
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v3 = a3;
    [(CABrightnessControl *)self->_brightnessControl setHighAmbientAdaptation:v3];
  }
}

- (id)brightnessNotificationPowerOff
{
  return self->_brightnessNotificationPowerOff;
}

- (id)brightnessNotificationSecureIndicatorOn
{
  return self->_brightnessNotificationSecureIndicatorOn;
}

- (id)brightnessNotificationSecureIndicatorOff
{
  return self->_brightnessNotificationSecureIndicatorOff;
}

- (id)brightnessNotificationRequestEDR
{
  return self->_brightnessNotificationRequestEDR;
}

- (id)brightnessNotificationAttached
{
  return (id)*MEMORY[0x1E4F39DB0];
}

- (unint64_t)getDisplayType
{
  return [(CABrightnessControl *)self->_brightnessControl displayType];
}

- (unint64_t)CBDispTypeIntegrated
{
  return self->_CBDispTypeIntegrated;
}

- (BOOL)commitBrightness:(id *)a3
{
  v25 = self;
  SEL v24 = a2;
  v23 = a3;
  v22 = 0;
  if (self->_logHandle)
  {
    logHandle = v25->_logHandle;
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
  v22 = logHandle;
  char v21 = 1;
  unint64_t v20 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(logHandle))
  {
    log = v22;
    os_signpost_type_t type = v21;
    os_signpost_id_t spid = v20;
    __os_log_helper_16_0_0(v19);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, log, type, spid, "commitBrightness", (const char *)&unk_1BA61B929, v19, 2u);
  }
  char v18 = 0;
  if ([(CBBrightnessProxyCA *)v25 allowUpdates]) {
    char v18 = [(CABrightnessControl *)v25->_brightnessControl commitBrightness:v23] & 1;
  }
  SEL v17 = 0;
  if (v25->_logHandle)
  {
    v8 = v25->_logHandle;
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
  SEL v17 = v8;
  char v16 = 2;
  unint64_t v15 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v8))
  {
    v4 = v17;
    os_signpost_type_t v5 = v16;
    os_signpost_id_t v6 = v15;
    __os_log_helper_16_0_0(v14);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v4, v5, v6, "commitBrightness", (const char *)&unk_1BA61B929, v14, 2u);
  }
  return v18 & 1;
}

- (BOOL)commitBrightness:(id *)a3 withBlock:(id)a4
{
  v27 = self;
  SEL v26 = a2;
  v25 = a3;
  id v24 = a4;
  v23 = 0;
  if (self->_logHandle)
  {
    logHandle = v27->_logHandle;
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
  v23 = logHandle;
  char v22 = 1;
  unint64_t v21 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(logHandle))
  {
    log = v23;
    os_signpost_type_t type = v22;
    os_signpost_id_t spid = v21;
    __os_log_helper_16_0_0(v20);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, log, type, spid, "commitBrightness withBlock", (const char *)&unk_1BA61B929, v20, 2u);
  }
  char v19 = 0;
  if ([(CBBrightnessProxyCA *)v27 allowUpdates]) {
    char v19 = [(CABrightnessControl *)v27->_brightnessControl commitBrightness:v25 withBlock:v24] & 1;
  }
  char v18 = 0;
  if (v27->_logHandle)
  {
    v9 = v27->_logHandle;
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
  char v18 = v9;
  char v17 = 2;
  unint64_t v16 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v9))
  {
    os_signpost_type_t v5 = v18;
    os_signpost_type_t v6 = v17;
    os_signpost_id_t v7 = v16;
    __os_log_helper_16_0_0(v15);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v5, v6, v7, "commitBrightness withBlock", (const char *)&unk_1BA61B929, v15, 2u);
  }
  return v19 & 1;
}

- (void)setAmbient:(float)a3
{
  if ([(CBBrightnessProxyCA *)self allowUpdates])
  {
    *(float *)&double v3 = a3;
    [(CABrightnessControl *)self->_brightnessControl setAmbient:v3];
  }
}

- (CBBrightnessProxyCA)initWithCABrightnessControl:(id)a3
{
  v9 = self;
  SEL v8 = a2;
  id v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CBBrightnessProxyCA;
  v9 = [(CBBrightnessProxyCA *)&v6 init];
  if (v9)
  {
    v9->_brightnessNotificationRequestEDR = (id)*MEMORY[0x1E4F39DC8];
    v9->_brightnessRequestEDRHeadroom = (NSString *)*MEMORY[0x1E4F39DF0];
    v9->_brightnessRequestRampDuration = (NSString *)*MEMORY[0x1E4F39DF8];
    v9->_brightnessSecureIndicatorType = (NSString *)*MEMORY[0x1E4F39DE8];
    v9->_brightnessSecureIndicatorActiveCount = (NSString *)*MEMORY[0x1E4F39DD0];
    v9->_brightnessNotificationSecureIndicatorOn = (id)*MEMORY[0x1E4F39DE0];
    v9->_brightnessNotificationSecureIndicatorOff = (id)*MEMORY[0x1E4F39DD8];
    v9->_brightnessNotificationPowerOn = (id)*MEMORY[0x1E4F39DC0];
    v9->_brightnessNotificationPowerOff = (id)*MEMORY[0x1E4F39DB8];
    v9->_CBDispTypeIntegrated = 0;
    v9->_CBDispTypeExternal = 1;
    v9->_CBDispTypeWireless = 2;
    v9->_CBDispTypeVirtual = 3;
    v9->_CBDispTypeDFR = 4;
    os_log_t v3 = os_log_create("com.apple.CoreBrightness.CBBrightnessProxyCA", "default");
    v9->_logHandle = (OS_os_log *)v3;
    v4 = (CABrightnessControl *)v7;
    v9->_brightnessControl = v4;
    v9->_allowUpdates = 1;
  }
  return v9;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  if (self->_logHandle) {

  }
  v2.receiver = v4;
  v2.super_class = (Class)CBBrightnessProxyCA;
  [(CBBrightnessProxyCA *)&v2 dealloc];
}

- (void)registerForNotifications:(id)a3 withBlock:(id)a4
{
}

- (void)unregisterNotificationBlocks
{
}

- (void)setNotificationQueue:(id)a3
{
}

- (BOOL)isBrightnessAvailable
{
  return [(CABrightnessControl *)self->_brightnessControl brightnessAvailable] & 1;
}

- (BOOL)isWhitePointAvailable
{
  return [(CABrightnessControl *)self->_brightnessControl whitePointAvailable] & 1;
}

- (BOOL)isWhitePointD50XYZ
{
  return [(CABrightnessControl *)self->_brightnessControl whitePointD50XYZ] & 1;
}

- (id)getBrightnessCapabilities
{
  return (id)[(CABrightnessControl *)self->_brightnessControl brightnessCapabilities];
}

- (unsigned)getDisplayId
{
  return [(CABrightnessControl *)self->_brightnessControl displayId];
}

- (unint64_t)getVendorId
{
  return [(CABrightnessControl *)self->_brightnessControl vendorId];
}

- (unint64_t)getProductId
{
  return [(CABrightnessControl *)self->_brightnessControl productId];
}

- (id)getUUID
{
  return (id)[(CABrightnessControl *)self->_brightnessControl uuid];
}

- (BOOL)forceCommitBrightness:(id *)a3 withBlock:(id)a4
{
  v34 = self;
  SEL v33 = a2;
  v32 = a3;
  id v31 = a4;
  v30 = 0;
  if (self->_logHandle)
  {
    logHandle = v34->_logHandle;
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
  v30 = logHandle;
  char v29 = 1;
  unint64_t v28 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(logHandle))
  {
    log = v30;
    os_signpost_type_t type = v29;
    os_signpost_id_t spid = v28;
    __os_log_helper_16_0_0(v27);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, log, type, spid, "forceCommitBrightness", (const char *)&unk_1BA61B929, v27, 2u);
  }
  char v26 = 0;
  if ([(CBBrightnessProxyCA *)v34 allowUpdates])
  {
    if (objc_opt_respondsToSelector())
    {
      char v26 = [(CABrightnessControl *)v34->_brightnessControl forceCommitBrightness:v32 withBlock:v31] & 1;
    }
    else
    {
      v25 = 0;
      if (v34->_logHandle)
      {
        char v13 = v34->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v12 = init_default_corebrightness_log();
        }
        char v13 = v12;
      }
      v25 = v13;
      char v24 = 16;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v10 = v25;
        os_log_type_t v11 = v24;
        __os_log_helper_16_0_0(v23);
        _os_log_error_impl(&dword_1BA438000, v10, v11, "CABrightnessControl forceCommitBrightness SPI does not exist -> use normal commitBrightness.", v23, 2u);
      }
      char v26 = [(CABrightnessControl *)v34->_brightnessControl commitBrightness:v32 withBlock:v31] & 1;
    }
  }
  char v22 = 0;
  if (v34->_logHandle)
  {
    v9 = v34->_logHandle;
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
  char v22 = v9;
  char v21 = 2;
  unint64_t v20 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v9))
  {
    os_signpost_type_t v5 = v22;
    os_signpost_type_t v6 = v21;
    os_signpost_id_t v7 = v20;
    __os_log_helper_16_0_0(v19);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v5, v6, v7, "forceCommitBrightness", (const char *)&unk_1BA61B929, v19, 2u);
  }
  return v26 & 1;
}

- (void)setBrightnessControlDisabled:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a3;
  [(CABrightnessControl *)self->_brightnessControl setBrightnessControlDisabled:a3];
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
    if (v6) {
      SEL v3 = "Disabled";
    }
    else {
      SEL v3 = "Enabled";
    }
    __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "%s brightness control updates.", v8, 0xCu);
  }
}

- (id)brightnessNotificationPowerOn
{
  return self->_brightnessNotificationPowerOn;
}

- (NSString)brightnessSecureIndicatorType
{
  return self->_brightnessSecureIndicatorType;
}

- (NSString)brightnessSecureIndicatorActiveCount
{
  return self->_brightnessSecureIndicatorActiveCount;
}

- (NSString)brightnessRequestEDRHeadroom
{
  return self->_brightnessRequestEDRHeadroom;
}

- (NSString)brightnessRequestRampDuration
{
  return self->_brightnessRequestRampDuration;
}

- (unint64_t)CBDispTypeExternal
{
  return self->_CBDispTypeExternal;
}

- (unint64_t)CBDispTypeWireless
{
  return self->_CBDispTypeWireless;
}

- (unint64_t)CBDispTypeVirtual
{
  return self->_CBDispTypeVirtual;
}

- (unint64_t)CBDispTypeDFR
{
  return self->_CBDispTypeDFR;
}

- (void)setAllowUpdates:(BOOL)a3
{
  self->_allowUpdates = a3;
}

@end