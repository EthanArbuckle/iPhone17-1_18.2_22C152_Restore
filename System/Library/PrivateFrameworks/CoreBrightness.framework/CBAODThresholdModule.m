@interface CBAODThresholdModule
- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)thresholdsCrossedForLux:(float)a3;
- (CBAODThresholdModule)initWithQueue:(id)a3;
- (float)brightenLuxThreshold;
- (float)dimLuxThreshold;
- (id)copyPdeltaThresholdsForLux:(float)a3;
- (id)copyPropertyForKey:(id)a3;
- (void)checkBootArgsConfiguration;
- (void)dealloc;
- (void)reevaluateALSThresholds;
- (void)sendNotificationForKey:(id)a3 andValue:(id)a4;
- (void)setBrightenLuxThreshold:(float)a3;
- (void)setDimLuxThreshold:(float)a3;
- (void)updateALSThresholdsWithBrightness:(float)a3 brightnessLimit:(float)a4 lux:(float)a5;
@end

@implementation CBAODThresholdModule

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v7 = 0;
  if ([(NSMutableArray *)self->_alsServiceClients containsObject:a3])
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)a3);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Remove ALS service! %@", v9, 0xCu);
    }
    [(NSMutableArray *)self->_alsServiceClients removeObject:a3];
    char v7 = 1;
  }
  return v7 & 1;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v15 = 0;
  if ([a4 isEqualToString:@"AODPerceptualBrightenThreshold"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 floatValue];
      self->_Pthreshold_brighten = fmaxf(fminf(v4, 1.0), 0.0);
      [(CBAODThresholdModule *)self reevaluateALSThresholds];
      char v15 = 1;
    }
  }
  else if ([a4 isEqualToString:@"AODPerceptualBrightenLowLuxThreshold"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 floatValue];
      self->_Pthreshold_brighten_lowLux = fmaxf(fminf(v5, 1.0), 0.0);
      [(CBAODThresholdModule *)self reevaluateALSThresholds];
      char v15 = 1;
    }
  }
  else if ([a4 isEqualToString:@"AODPerceptualDimThreshold"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 floatValue];
      self->_Pthreshold_dim = fmaxf(fminf(v6, 1.0), 0.0);
      [(CBAODThresholdModule *)self reevaluateALSThresholds];
      char v15 = 1;
    }
  }
  else if ([a4 isEqualToString:@"AODPerceptualDimLowLuxThreshold"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 floatValue];
      self->_Pthreshold_dim_lowLux = fmaxf(fminf(v7, 1.0), 0.0);
      [(CBAODThresholdModule *)self reevaluateALSThresholds];
      char v15 = 1;
    }
  }
  else if ([a4 isEqualToString:@"ALSLuxBrightenThreshold"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 floatValue];
      if (v8 >= 0.0)
      {
        [a3 floatValue];
        self->_brightenLuxThreshold = v9;
        self->_brightenLuxThresholdOverriden = 1;
        [(CBAODThresholdModule *)self reevaluateALSThresholds];
      }
      else
      {
        self->_brightenLuxThresholdOverriden = 0;
      }
      char v15 = 1;
    }
  }
  else if ([a4 isEqualToString:@"ALSLuxDimThreshold"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 floatValue];
      if (v10 >= 0.0)
      {
        [a3 floatValue];
        self->_dimLuxThreshold = v11;
        self->_dimLuxThresholdOverriden = 1;
        [(CBAODThresholdModule *)self reevaluateALSThresholds];
      }
      else
      {
        self->_dimLuxThresholdOverriden = 0;
      }
      char v15 = 1;
    }
  }
  if (v15)
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)a4, (uint64_t)a3);
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "key = %@ property = %@", v19, 0x16u);
    }
  }
  return v15 & 1;
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v7 = 0;
  if ([(__IOHIDServiceClient *)a3 conformsToUsagePage:65280 usage:4])
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
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)a3);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "Get ALS service - save it! %@", v9, 0xCu);
    }
    if (([(NSMutableArray *)self->_alsServiceClients containsObject:a3] & 1) == 0) {
      [(NSMutableArray *)self->_alsServiceClients addObject:a3];
    }
    char v7 = 1;
  }
  return v7 & 1;
}

- (CBAODThresholdModule)initWithQueue:(id)a3
{
  float v9 = self;
  SEL v8 = a2;
  id v7 = a3;
  if (!a3) {
    __assert_rtn("-[CBAODThresholdModule initWithQueue:]", "CBAODThresholdModule.m", 51, "queue");
  }
  v6.receiver = v9;
  v6.super_class = (Class)CBAODThresholdModule;
  float v9 = [(CBModule *)&v6 initWithQueue:v7];
  if (v9)
  {
    os_log_t v3 = os_log_create("com.apple.CoreBrightness.AOD.ThresholdModule", "default");
    v9->super._logHandle = (OS_os_log *)v3;
    v9->_Pthreshold_dim = 0.25;
    v9->_Pthreshold_dim_lowLux = 0.2;
    v9->_Pthreshold_brighten = 0.1;
    v9->_Pthreshold_brighten_lowLux = 0.15;
    v9->_AP_Pthreshold_dim = 0.2;
    v9->_AP_Pthreshold_brighten = 0.1;
    v9->_minNits = 2.0;
    v9->_maxNits = 1060.0;
    v9->_currentLux = -1.0;
    v9->_currentBrightness = -1.0;
    v9->_currentBrightnessLimit = -1.0;
    v9->_brightenLuxThreshold = -1.0;
    v9->_dimLuxThreshold = -1.0;
    v9->_brightenLuxThresholdOverriden = 0;
    v9->_dimLuxThresholdOverriden = 0;
    float v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9->_alsServiceClients = v4;
    [(CBAODThresholdModule *)v9 checkBootArgsConfiguration];
  }
  return v9;
}

- (void)checkBootArgsConfiguration
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v19 = self;
  v18[1] = (size_t)a2;
  bzero(v24, 0x400uLL);
  v18[0] = 1024;
  if (!sysctlbyname("kern.bootargs", v24, v18, 0, 0))
  {
    v14 = strstr[abi:ne180100](v24, "cb_aod_threshold_dim");
    if (v14)
    {
      float v2 = strtof(v14 + 21, 0);
      v19->_Pthreshold_dim = v2;
      if (v19->super._logHandle)
      {
        logHandle = v19->super._logHandle;
      }
      else
      {
        uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        logHandle = v12;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v23, COERCE__INT64(v19->_Pthreshold_dim));
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "AOD dim threshold overrided to %f", v23, 0xCu);
      }
    }
    char v15 = strstr[abi:ne180100](v24, "cb_aod_threshold_dim_lowlux");
    if (v15)
    {
      float v3 = strtof(v15 + 28, 0);
      v19->_Pthreshold_dim_lowLux = v3;
      if (v19->super._logHandle)
      {
        float v11 = v19->super._logHandle;
      }
      else
      {
        uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        float v11 = v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v22, COERCE__INT64(v19->_Pthreshold_dim_lowLux));
        _os_log_impl(&dword_1BA438000, v11, OS_LOG_TYPE_DEFAULT, "AOD dim threshold in low lux overrided to %f", v22, 0xCu);
      }
    }
    v16 = strstr[abi:ne180100](v24, "cb_aod_threshold_brighten");
    if (v16)
    {
      float v4 = strtof(v16 + 26, 0);
      v19->_Pthreshold_brighten = v4;
      if (v19->super._logHandle)
      {
        float v9 = v19->super._logHandle;
      }
      else
      {
        uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        float v9 = v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v21, COERCE__INT64(v19->_Pthreshold_brighten));
        _os_log_impl(&dword_1BA438000, v9, OS_LOG_TYPE_DEFAULT, "AOD brighten threshold overrided to %f", v21, 0xCu);
      }
    }
    v17 = strstr[abi:ne180100](v24, "cb_aod_threshold_brighten_lowlux");
    if (v17)
    {
      float v5 = strtof(v17 + 33, 0);
      v19->_Pthreshold_brighten_lowLux = v5;
      if (v19->super._logHandle)
      {
        id v7 = v19->super._logHandle;
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
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v20, COERCE__INT64(v19->_Pthreshold_brighten_lowLux));
        _os_log_impl(&dword_1BA438000, v7, OS_LOG_TYPE_DEFAULT, "AOD brighten threshold in low lux overrided to %f", v20, 0xCu);
      }
    }
  }
}

- (void)dealloc
{
  float v4 = self;
  SEL v3 = a2;

  v4->_alsServiceClients = 0;
  v2.receiver = v4;
  v2.super_class = (Class)CBAODThresholdModule;
  [(CBModule *)&v2 dealloc];
}

- (id)copyPropertyForKey:(id)a3
{
  if ([a3 isEqualToString:@"ALSLuxBrightenThreshold"])
  {
    id v3 = objc_alloc(NSNumber);
    *(float *)&double v4 = self->_brightenLuxThreshold;
    return (id)[v3 initWithFloat:v4];
  }
  else if ([a3 isEqualToString:@"ALSLuxDimThreshold"])
  {
    id v5 = objc_alloc(NSNumber);
    *(float *)&double v6 = self->_dimLuxThreshold;
    return (id)[v5 initWithFloat:v6];
  }
  else
  {
    return 0;
  }
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  if (self->super._notificationBlock) {
    (*((void (**)(void))self->super._notificationBlock + 2))();
  }
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  return 0;
}

- (void)reevaluateALSThresholds
{
  if (self->_currentLux >= 0.0 && self->_currentBrightness >= 0.0
    || self->_brightenLuxThresholdOverriden
    || self->_dimLuxThresholdOverriden)
  {
    *(float *)&double v2 = self->_currentBrightness;
    *(float *)&double v3 = self->_currentBrightnessLimit;
    *(float *)&double v4 = self->_currentLux;
    [(CBAODThresholdModule *)self updateALSThresholdsWithBrightness:v2 brightnessLimit:v3 lux:v4];
  }
}

- (void)updateALSThresholdsWithBrightness:(float)a3 brightnessLimit:(float)a4 lux:(float)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v70 = self;
  SEL v69 = a2;
  float v68 = a3;
  float v67 = a4;
  float v66 = a5;
  self->_currentLux = a5;
  v70->_currentBrightness = v68;
  v70->_currentBrightnessLimit = v67;
  float v65 = 0.0;
  float maxNits = v70->_maxNits;
  [+[CBAODState sharedInstance] maxAODNits];
  float v65 = fminf(maxNits, v5);
  float v64 = 0.0;
  float minNits = v70->_minNits;
  [+[CBAODState sharedInstance] minAODNits];
  float v64 = fmaxf(minNits, *(float *)&v6);
  float v63 = v65;
  *(float *)&double v6 = v67;
  if (v67 > 0.0)
  {
    *(float *)&double v6 = fminf(v63, v67);
    float v63 = *(float *)&v6;
  }
  [+[CBAODState sharedInstance] nitsCap];
  if (v7 > 0.0)
  {
    [+[CBAODState sharedInstance] nitsCap];
    float v63 = fminf(v63, v8);
  }
  float v63 = fmaxf(v63, v64);
  float v62 = BULuminanceToPerceptual(v68, v64, v65);
  float Pthreshold_brighten = 0.0;
  float Pthreshold_brighten = v70->_Pthreshold_brighten;
  float Pthreshold_dim = 0.0;
  float Pthreshold_dim = v70->_Pthreshold_dim;
  uint64_t v36 = [(NSMutableArray *)[+[CBAODState sharedInstance] thresholdsLuxBuckets] count];
  if (v36 == [(NSMutableArray *)[+[CBAODState sharedInstance](CBAODState, "sharedInstance") thresholdsDeltaPBrightenBuckets] count]&& (uint64_t v35 = [(NSMutableArray *)[+[CBAODState sharedInstance](CBAODState, "sharedInstance") thresholdsDeltaPBrightenBuckets] count], v35 == [(NSMutableArray *)[+[CBAODState sharedInstance] thresholdsDeltaPDimBuckets] count]))
  {
    objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsLuxBuckets"), "lastObject"), "floatValue");
    float v9 = *(float *)&v10;
    *(float *)&double v10 = v66;
    if (v66 <= v9)
    {
      for (int i = 0;
            i < (unint64_t)([(NSMutableArray *)[+[CBAODState sharedInstance] thresholdsLuxBuckets] count]- 1);
            ++i)
      {
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsLuxBuckets"), "objectAtIndexedSubscript:", i), "floatValue");
        float v14 = *(float *)&v10;
        *(float *)&double v10 = v66;
        if (v66 >= v14)
        {
          objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsLuxBuckets"), "objectAtIndexedSubscript:", i + 1), "floatValue");
          float v15 = *(float *)&v10;
          *(float *)&double v10 = v66;
          if (v66 < v15)
          {
            objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsDeltaPBrightenBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance", v10), "thresholdsDeltaPBrightenBuckets"), "objectAtIndexedSubscript:", i), "floatValue");
            float Pthreshold_brighten = v16;
            objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsDeltaPDimBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsDeltaPDimBuckets"), "objectAtIndexedSubscript:", i), "floatValue");
            float Pthreshold_dim = v17;
            os_log_t v56 = 0;
            if (v70->super._logHandle)
            {
              logHandle = v70->super._logHandle;
            }
            else
            {
              uint64_t v31 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
              logHandle = v31;
            }
            os_log_t v56 = logHandle;
            os_log_type_t v55 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
            {
              __os_log_helper_16_0_4_8_0_4_0_8_0_8_0((uint64_t)v74, COERCE__INT64(v66), i, COERCE__INT64(Pthreshold_brighten), COERCE__INT64(Pthreshold_dim));
              _os_log_impl(&dword_1BA438000, v56, v55, "AOP thresholds: lux %f - bucket[%d] => AOP P delta thresholds: Brighten = %f; Dim = %f",
                v74,
                0x26u);
            }
          }
        }
      }
    }
    else
    {
      objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsDeltaPBrightenBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance", v10), "thresholdsDeltaPBrightenBuckets"), "lastObject"), "floatValue");
      float Pthreshold_brighten = v11;
      objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsDeltaPDimBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsDeltaPDimBuckets"), "lastObject"), "floatValue");
      float Pthreshold_dim = v12;
      os_log_t oslog = 0;
      if (v70->super._logHandle)
      {
        v34 = v70->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        v34 = inited;
      }
      os_log_t oslog = v34;
      os_log_type_t type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsLuxBuckets"), "lastObject"), "floatValue");
        __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v75, COERCE__INT64(v66), COERCE__INT64(v13), COERCE__INT64(Pthreshold_brighten), COERCE__INT64(Pthreshold_dim));
        _os_log_impl(&dword_1BA438000, oslog, type, "AOP thresholds: lux %f > %f => AOP P delta thresholds: Brighten = %f; Dim = %f",
          v75,
          0x2Au);
      }
    }
  }
  else
  {
    os_log_t v54 = 0;
    if (v70->super._logHandle)
    {
      v30 = v70->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v29 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v29 = init_default_corebrightness_log();
      }
      v30 = v29;
    }
    os_log_t v54 = v30;
    os_log_type_t v53 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v73, COERCE__INT64(Pthreshold_brighten), COERCE__INT64(Pthreshold_dim));
      _os_log_error_impl(&dword_1BA438000, v54, v53, "AOP thresholds: buckets have different sizes -> use defaults delta P thresholds: Brighten = %f; Dim = %f.",
        v73,
        0x16u);
    }
  }
  float v52 = fminf(1.0, v62 + Pthreshold_brighten);
  float v51 = fmaxf(0.0, v62 - Pthreshold_dim);
  float v50 = BUPerceptualToLuminance(v52, v64, v65);
  float v49 = BUPerceptualToLuminance(v51, v64, v65);
  float v50 = fminf(v50, v63);
  float v48 = 0.0;
  v28 = +[CBAODState sharedInstance];
  if (v28) {
    [(CBAODState *)v28 darkerCurve];
  }
  else {
    memset(__b, 0, sizeof(__b));
  }
  float v48 = BULuminanceToIlluminance(__b, v50);
  float v46 = 0.0;
  float v26 = v49;
  v27 = +[CBAODState sharedInstance];
  if (v27) {
    [(CBAODState *)v27 darkerCurve];
  }
  else {
    memset(v45, 0, sizeof(v45));
  }
  float v46 = BULuminanceToIlluminance(v45, v26);
  if (v50 >= v63) {
    float v48 = 150000.0;
  }
  if (v49 <= v64) {
    float v46 = 0.0;
  }
  float v44 = v66 * 1.15;
  float v43 = v66 * 0.85;
  float v48 = fminf(150000.0, fmaxf(v48, v66 * 1.15));
  float v46 = fmaxf(0.0, fminf(v46, v66 * 0.85));
  if (!v70->_brightenLuxThresholdOverriden) {
    v70->_brightenLuxThreshold = v48;
  }
  if (!v70->_dimLuxThresholdOverriden) {
    v70->_dimLuxThreshold = v46;
  }
  os_log_t v42 = 0;
  if (v70->super._logHandle)
  {
    uint64_t v25 = v70->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v24 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v24 = init_default_corebrightness_log();
    }
    uint64_t v25 = v24;
  }
  os_log_t v42 = v25;
  os_log_type_t v41 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_8_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v72, COERCE__INT64(v70->_brightenLuxThreshold), COERCE__INT64(v70->_dimLuxThreshold), COERCE__INT64(v50), COERCE__INT64(v49), COERCE__INT64(v66), COERCE__INT64(v68), COERCE__INT64(v63), COERCE__INT64(v67));
    _os_log_impl(&dword_1BA438000, v42, v41, "AOP thresholds: lux brighten = %f, dim = %f; nits brighten = %f, dim = %f; Current lux = %f, current nits = %f; Ni"
      "ts cap = %f, brt limit = %f",
      v72,
      0x52u);
  }
  memset(v39, 0, sizeof(v39));
  obj = v70->_alsServiceClients;
  uint64_t v23 = [(NSMutableArray *)obj countByEnumeratingWithState:v39 objects:v71 count:16];
  if (v23)
  {
    uint64_t v19 = *(void *)v39[2];
    uint64_t v20 = 0;
    unint64_t v21 = v23;
    while (1)
    {
      uint64_t v18 = v20;
      if (*(void *)v39[2] != v19) {
        objc_enumerationMutation(obj);
      }
      id v40 = 0;
      id v40 = *(id *)(v39[1] + 8 * v20);
      objc_msgSend(v40, "setProperty:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)(v70->_brightenLuxThreshold * 4294967300.0)), @"ALSLuxBrightenThreshold");
      objc_msgSend(v40, "setProperty:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)(v70->_dimLuxThreshold * 4294967300.0)), @"ALSLuxDimThreshold");
      ++v20;
      if (v18 + 1 >= v21)
      {
        uint64_t v20 = 0;
        unint64_t v21 = [(NSMutableArray *)obj countByEnumeratingWithState:v39 objects:v71 count:16];
        if (!v21) {
          break;
        }
      }
    }
  }
}

- (id)copyPdeltaThresholdsForLux:(float)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  self->_currentLux = a3;
  AP_float Pthreshold_brighten = self->_AP_Pthreshold_brighten;
  AP_float Pthreshold_dim = self->_AP_Pthreshold_dim;
  uint64_t v24 = [(NSMutableArray *)[+[CBAODState sharedInstance] thresholdsAPLuxBuckets] count];
  if (v24 == [(NSMutableArray *)[+[CBAODState sharedInstance](CBAODState, "sharedInstance") thresholdsAPDeltaPBrightenBuckets] count]&& (uint64_t v23 = [(NSMutableArray *)[+[CBAODState sharedInstance](CBAODState, "sharedInstance") thresholdsAPDeltaPBrightenBuckets] count], v23 == [(NSMutableArray *)[+[CBAODState sharedInstance] thresholdsAPDeltaPDimBuckets] count]))
  {
    objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsAPLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPLuxBuckets"), "lastObject"), "floatValue");
    float v3 = *(float *)&v4;
    *(float *)&double v4 = a3;
    if (a3 <= v3)
    {
      for (int i = 0;
            i < (unint64_t)([(NSMutableArray *)[+[CBAODState sharedInstance] thresholdsAPLuxBuckets] count]- 1);
            ++i)
      {
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsAPLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPLuxBuckets"), "objectAtIndexedSubscript:", i), "floatValue");
        float v8 = *(float *)&v4;
        *(float *)&double v4 = a3;
        if (a3 >= v8)
        {
          objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsAPLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPLuxBuckets"), "objectAtIndexedSubscript:", i + 1), "floatValue");
          float v9 = *(float *)&v4;
          *(float *)&double v4 = a3;
          if (a3 < v9)
          {
            objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsAPDeltaPBrightenBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance", v4), "thresholdsAPDeltaPBrightenBuckets"), "objectAtIndexedSubscript:", i), "floatValue");
            AP_float Pthreshold_brighten = v10;
            objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](-[CBAODState thresholdsAPDeltaPDimBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPDeltaPDimBuckets"), "objectAtIndexedSubscript:", i), "floatValue");
            AP_float Pthreshold_dim = v11;
            if (self->super._logHandle)
            {
              logHandle = self->super._logHandle;
            }
            else
            {
              uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
              logHandle = v19;
            }
            if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
            {
              __os_log_helper_16_0_4_8_0_4_0_8_0_8_0((uint64_t)v34, COERCE__INT64(a3), i, COERCE__INT64(AP_Pthreshold_brighten), COERCE__INT64(AP_Pthreshold_dim));
              _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "AP thresholds: lux %f - bucket[%d] => CoreBrightness-AP side P delta thresholds: Brighten = %f; Dim = %f",
                v34,
                0x26u);
            }
          }
        }
      }
    }
    else
    {
      objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsAPDeltaPBrightenBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance", v4), "thresholdsAPDeltaPBrightenBuckets"), "lastObject"), "floatValue");
      AP_float Pthreshold_brighten = v5;
      objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsAPDeltaPDimBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPDeltaPDimBuckets"), "lastObject"), "floatValue");
      AP_float Pthreshold_dim = v6;
      if (self->super._logHandle)
      {
        v22 = self->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        v22 = inited;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)-[NSMutableArray lastObject](-[CBAODState thresholdsAPLuxBuckets](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "thresholdsAPLuxBuckets"), "lastObject"), "floatValue");
        __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v35, COERCE__INT64(a3), COERCE__INT64(v7), COERCE__INT64(AP_Pthreshold_brighten), COERCE__INT64(AP_Pthreshold_dim));
        _os_log_impl(&dword_1BA438000, v22, OS_LOG_TYPE_DEFAULT, "AP thresholds: lux %f > %f => CoreBrightness-AP side P delta thresholds: Brighten = %f; Dim = %f",
          v35,
          0x2Au);
      }
    }
  }
  else
  {
    if (self->super._logHandle)
    {
      uint64_t v18 = self->super._logHandle;
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
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v33, COERCE__INT64(AP_Pthreshold_brighten), COERCE__INT64(AP_Pthreshold_dim));
      _os_log_error_impl(&dword_1BA438000, v18, OS_LOG_TYPE_ERROR, "AP thresholds: buckets have different sizes -> use defaults delta P thresholds: Brighten = %f; Dim = %f.",
        v33,
        0x16u);
    }
  }
  id v12 = objc_alloc(NSNumber);
  *(float *)&double v13 = AP_Pthreshold_brighten;
  v27 = (void *)[v12 initWithFloat:v13];
  id v14 = objc_alloc(NSNumber);
  *(float *)&double v15 = AP_Pthreshold_dim;
  float v26 = (void *)[v14 initWithFloat:v15];
  uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v27, @"ALSBrightenPdeltaSlow", v26, @"ALSDimPdeltaSlow", 0);

  return v25;
}

- (BOOL)thresholdsCrossedForLux:(float)a3
{
  if (self->_dimLuxThreshold < 0.0 || self->_brightenLuxThreshold < 0.0) {
    return 1;
  }
  BOOL v4 = a3 <= self->_dimLuxThreshold;
  if (a3 >= self->_brightenLuxThreshold) {
    return 1;
  }
  return v4;
}

- (float)brightenLuxThreshold
{
  return self->_brightenLuxThreshold;
}

- (void)setBrightenLuxThreshold:(float)a3
{
  self->_brightenLuxThreshold = a3;
}

- (float)dimLuxThreshold
{
  return self->_dimLuxThreshold;
}

- (void)setDimLuxThreshold:(float)a3
{
  self->_dimLuxThreshold = a3;
}

@end