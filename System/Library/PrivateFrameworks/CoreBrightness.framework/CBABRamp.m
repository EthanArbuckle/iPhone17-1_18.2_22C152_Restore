@interface CBABRamp
- (CBABRamp)initWithDisplayModule:(id)a3 andQueue:(id)a4;
- (float)getVersion;
- (void)dealloc;
- (void)setPerceptualBrightnessWithFade:(float)a3 length:(float)a4 current:(float)a5;
- (void)stopTransition;
- (void)transitionToBrightness:(float)a3 force:(BOOL)a4 periodOverride:(BOOL)a5 period:(float)a6;
@end

@implementation CBABRamp

- (CBABRamp)initWithDisplayModule:(id)a3 andQueue:(id)a4
{
  v20 = self;
  SEL v19 = a2;
  id v18 = a3;
  id v17 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CBABRamp;
  v20 = [(CBABRamp *)&v16 init];
  if (v20)
  {
    os_log_t v4 = os_log_create("com.apple.CoreBrightness.CBABRamp", "default");
    *((void *)v20 + 4) = v4;
    if (!*((void *)v20 + 4))
    {
      v15 = 0;
      v11 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v15 = v11;
      char v14 = 16;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        log = v15;
        os_log_type_t type = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_error_impl(&dword_1BA438000, log, type, "Failed to create log handle", v13, 2u);
      }
    }
    *((void *)v20 + 2) = v17;
    dispatch_retain(*((dispatch_object_t *)v20 + 2));
    os_log_t v5 = os_log_create("com.apple.CoreBrightness.ABRamp", "default");
    *((void *)v20 + 4) = v5;
    id v6 = v18;
    *((void *)v20 + 1) = v6;
    *((float *)v20 + 10) = 1.0;
    *((_DWORD *)v20 + 11) = 981668463;
    id v12 = (id)[*((id *)v20 + 1) copyPropertyForKey:@"DisplayBrightnessLinearMin"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      *((_DWORD *)v20 + 11) = v7;
    }
  }
  return (CBABRamp *)v20;
}

- (void)dealloc
{
  os_log_t v4 = self;
  SEL v3 = a2;
  if (self->_logHandle)
  {

    v4->_logHandle = 0;
  }
  dispatch_release((dispatch_object_t)v4->_queue);
  v4->_queue = 0;

  v2.receiver = v4;
  v2.super_class = (Class)CBABRamp;
  [(CBABRamp *)&v2 dealloc];
}

- (void)stopTransition
{
  v10 = self;
  SEL v9 = a2;
  if (self->_fadeTimer)
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
    char v7 = 2;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      log = v8;
      os_log_type_t type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_debug_impl(&dword_1BA438000, log, type, "Ramping module: stopping", v6, 2u);
    }
    dispatch_source_cancel((dispatch_source_t)v10->_fadeTimer);
    v10->_fadeTimer = 0;
  }
}

- (void)transitionToBrightness:(float)a3 force:(BOOL)a4 periodOverride:(BOOL)a5 period:(float)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v34 = self;
  SEL v33 = a2;
  float v32 = a3;
  BOOL v31 = a4;
  BOOL v30 = a5;
  float v29 = a6;
  float v28 = 0.0;
  id v27 = 0;
  float v26 = 0.0;
  int v25 = 0;
  float v24 = 0.0;
  float v23 = 0.0;
  float v22 = 0.0;
  int v21 = 0;
  id v27 = [(CBDisplayModule *)self->_displayModule copyPropertyForKey:@"DisplayBrightnessLinear"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v27 floatValue];
    float v28 = v6;
    if (v31 || v28 == 0.0 || (float)(vabds_f32(v32, v28) / v28) >= 0.1)
    {
      float v23 = linearBrightnessToPerceptualBrightness(v28);
      float v22 = linearBrightnessToPerceptualBrightness(v32);
      if (v30)
      {
        float v24 = v29;
      }
      else
      {
        float v26 = v22 - v23;
        int v25 = 11;
        if ((float)(v22 - v23) > -1.0)
        {
          if (v26 < *(float *)&AnimationRateTable[2 * v25 - 2])
          {
            while (v26 > *(float *)&AnimationRateTable[2 * v21])
              ++v21;
            float v24 = timeLengthAtFromPointToPoint(v26, *(float *)&AnimationRateTable[2 * v21 - 2], *(float *)&AnimationRateTable[2 * v21 - 1], *(float *)&AnimationRateTable[2 * v21], *(float *)&AnimationRateTable[2 * v21 + 1]);
          }
          else
          {
            float v24 = *(float *)&AnimationRateTable[2 * v25 - 1];
          }
        }
        else
        {
          float v24 = 60.0;
        }
      }
      if (v34->_logHandle)
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
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_6_8_0_8_0_8_0_8_0_4_0_8_0((uint64_t)v35, COERCE__INT64(v22), COERCE__INT64(v32), COERCE__INT64(v23), COERCE__INT64(v28), v31, COERCE__INT64(v24));
        _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "targetPerceptual=%f (targetLinear=%f) currentPerceptual=%f (currentLinear=%f) forced=%d period=%f", v35, 0x3Au);
      }
      *(float *)&double v7 = v22;
      *(float *)&double v8 = v24;
      *(float *)&double v9 = v23;
      [(CBABRamp *)v34 setPerceptualBrightnessWithFade:v7 length:v8 current:v9];
    }
    else
    {
      if (v34->_logHandle)
      {
        v13 = v34->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v12 = init_default_corebrightness_log();
        }
        v13 = v12;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v36, COERCE__INT64((float)(vabds_f32(v32, v28) / v28)));
        _os_log_debug_impl(&dword_1BA438000, v13, OS_LOG_TYPE_DEBUG, "ALS.changeBrightness NOT CHANGING percent change is %f", v36, 0xCu);
      }
      [(CBABRamp *)v34 stopTransition];
    }
  }
  else
  {
    os_log_t oslog = 0;
    if (v34->_logHandle)
    {
      id v17 = v34->_logHandle;
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
    os_log_t oslog = v17;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v15 = type;
      __os_log_helper_16_0_0(v18);
      _os_log_error_impl(&dword_1BA438000, log, v15, "Get brightness failed", v18, 2u);
    }
  }
}

- (void)setPerceptualBrightnessWithFade:(float)a3 length:(float)a4 current:(float)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v55 = self;
  SEL v54 = a2;
  float v53 = a3;
  float v52 = a4;
  float v51 = a5;
  float v50 = 0.0;
  float v49 = 0.0;
  float v48 = 0.0;
  float v47 = 0.0;
  uint64_t v42 = 0;
  v43 = (float *)&v42;
  int v44 = 0x20000000;
  int v45 = 32;
  int v46 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  int v39 = 0x20000000;
  int v40 = 32;
  int v41 = 0;
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  int v32 = 1375731712;
  int v33 = 48;
  v34 = __Block_byref_object_copy__18;
  v35 = __Block_byref_object_dispose__18;
  uint64_t v36 = 0;
  [(CBABRamp *)self stopTransition];
  float v50 = v53 - v51;
  float v5 = fabsf(v53 - v51) / 0.000978473581;
  *((_DWORD *)v38 + 6) = vcvtms_s32_f32(v5);
  float v47 = 0.00097847;
  float v49 = v52 / (float)*((int *)v38 + 6);
  float v48 = 0.01;
  if (v49 < 0.01)
  {
    float v49 = v48;
    *((_DWORD *)v38 + 6) = vcvtms_s32_f32(v52 / v48);
    float v6 = fabs(v50) / (double)*((int *)v38 + 6);
    float v47 = v6;
  }
  os_log_t oslog = 0;
  if (v55->_logHandle)
  {
    logHandle = v55->_logHandle;
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
  os_log_type_t type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_4_8_0_8_0_8_0_4_0((uint64_t)v56, COERCE__INT64(v51), COERCE__INT64(v53), COERCE__INT64(v52), *((_DWORD *)v38 + 6));
    _os_log_impl(&dword_1BA438000, oslog, type, "Ramping from %f to %f (perceptual) over %f seconds with %d steps", v56, 0x26u);
  }
  dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v55->_queue);
  v55->_fadeTimer = (OS_dispatch_source *)v7;
  if (v55->_fadeTimer)
  {
    v31[5] = (uint64_t)v55->_fadeTimer;
    v43[6] = v51;
    dispatch_source_set_timer((dispatch_source_t)v55->_fadeTimer, 0, (unint64_t)(float)(v49 * 1000000000.0), 0);
    fadeTimer = v55->_fadeTimer;
    uint64_t handler = MEMORY[0x1E4F143A8];
    int v19 = -1073741824;
    int v20 = 0;
    int v21 = __59__CBABRamp_setPerceptualBrightnessWithFade_length_current___block_invoke;
    float v22 = &unk_1E621AC78;
    float v24 = &v37;
    float v26 = v53;
    float v23 = v55;
    int v25 = &v42;
    float v27 = v47;
    dispatch_source_set_event_handler(fadeTimer, &handler);
    double v9 = v55->_fadeTimer;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    int v13 = -1073741824;
    int v14 = 0;
    os_log_type_t v15 = __59__CBABRamp_setPerceptualBrightnessWithFade_length_current___block_invoke_10;
    uint64_t v16 = &unk_1E6219058;
    id v17 = &v30;
    dispatch_source_set_cancel_handler(v9, &v12);
    dispatch_resume((dispatch_object_t)v55->_fadeTimer);
  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v42, 8);
}

void __59__CBABRamp_setPerceptualBrightnessWithFade_length_current___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = a1;
  uint64_t v19 = a1;
  float v18 = 0.0;
  char v17 = 1;
  if (*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 0)
  {
    if (*(float *)(a1 + 56) >= *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 48) + 8)
    }
                                                                            + 24)
                                                                 + *(float *)(a1 + 60);
    else {
      *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 48) + 8)
    }
                                                                            + 24)
                                                                 - *(float *)(a1 + 60);
    float v18 = fminf(fmaxf(perceptualBrightnessToLinearBrightness(*(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)), *(float *)(*(void *)(a1 + 32) + 44)), *(float *)(*(void *)(a1 + 32) + 40));
    dispatch_source_t v7 = (void *)MEMORY[0x1BA9ECAE0]();
    *(float *)&double v2 = v18;
    char v17 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setProperty:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v2), @"DisplayBrightnessLinear") & 1;
    if (v17)
    {
      --*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    else
    {
      int v14 = 0;
      if (*(void *)(*(void *)(a1 + 32) + 32))
      {
        float v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        float v6 = inited;
      }
      int v14 = v6;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        SEL v3 = v14;
        os_log_type_t v4 = v13;
        __os_log_helper_16_0_0(v12);
        _os_log_impl(&dword_1BA438000, v3, v4, "Unable to send update", v12, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "stopTransition", v3);
    }
  }
  else
  {
    float v18 = fminf(fmaxf(perceptualBrightnessToLinearBrightness(*(float *)(a1 + 56)), *(float *)(*(void *)(a1 + 32) + 44)), *(float *)(*(void *)(a1 + 32) + 40));
    context = (void *)MEMORY[0x1BA9ECAE0]();
    *(float *)&double v1 = v18;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setProperty:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v1), @"DisplayBrightnessLinear");
    os_log_t v16 = 0;
    if (*(void *)(*(void *)(a1 + 32) + 32))
    {
      double v9 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v8 = init_default_corebrightness_log();
      }
      double v9 = v8;
    }
    os_log_t v16 = v9;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v21, COERCE__INT64(v18));
      _os_log_impl(&dword_1BA438000, v16, v15, "Ramp completed: last set = %f", v21, 0xCu);
    }
    [*(id *)(a1 + 32) stopTransition];
  }
}

void __59__CBABRamp_setPerceptualBrightnessWithFade_length_current___block_invoke_10(uint64_t a1)
{
}

- (float)getVersion
{
  return 1.0;
}

@end