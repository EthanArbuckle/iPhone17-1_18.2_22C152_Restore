@interface BWVariableFrameRateSelector
+ (void)initialize;
- (BOOL)_switchBackTo60AsFlickerFrequencyIsDetected:(BOOL)result;
- (BWVariableFrameRateSelector)initWithPortTypes:(id)a3 forParameters:(id)a4 frameRateSwitchBasedOnMotionDisabled:(BOOL)a5;
- (char)_getSceneStabilityFromSampleBuffer:(uint64_t)a3 currentFrameRate:(float)a4 portType:;
- (char)_updateMotionDataFromSampleBuffer:(char *)result;
- (double)_frameRateForFrameStatistics:(float *)a1 portType:(void *)a2;
- (float)getAEMaxGainForPortType:(id)a3 suggestedFrameRate:(double)a4;
- (float)suggestedFrameRate;
- (os_unfair_lock_s)_waterSceneDetected;
- (uint64_t)_loadDefaultsWithPortTypes:(void *)a3 forParameters:(char)a4 frameRateSwitchBasedOnMotionDisabled:;
- (uint64_t)_updateAEMaxGainDictionary:(uint64_t)result withAEMaxGain:(void *)a2 forPortType:(void *)a3;
- (uint64_t)_updateSmartSceneFromSampleBuffer:(uint64_t)a3 currentFrameRate:(float)a4 portType:;
- (uint64_t)_updateSuggestedFrameRateFromFrameStatistics:(uint64_t)result sampleBuffer:(void *)a2 currentFrameRate:(CMAttachmentBearerRef)target aeMaxGain:(float)a4;
- (uint64_t)_updatemotionThreshold:(uint64_t)a3 forPortType:;
- (void)addAttachmentsToSamplebuffer:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatistics:(id)a4 currentFrameRate:(float)a5 aeMaxGain:(float)a6 zoomInProgress:(BOOL)a7 mostRecentInferenceResult:(id)a8;
@end

@implementation BWVariableFrameRateSelector

+ (void)initialize
{
}

- (BWVariableFrameRateSelector)initWithPortTypes:(id)a3 forParameters:(id)a4 frameRateSwitchBasedOnMotionDisabled:(BOOL)a5
{
  v11.receiver = self;
  v11.super_class = (Class)BWVariableFrameRateSelector;
  v8 = [(BWVariableFrameRateSelector *)&v11 init];
  v9 = v8;
  if (v8) {
    -[BWVariableFrameRateSelector _loadDefaultsWithPortTypes:forParameters:frameRateSwitchBasedOnMotionDisabled:]((uint64_t)v8, a3, a4, a5);
  }
  return v9;
}

- (uint64_t)_loadDefaultsWithPortTypes:(void *)a3 forParameters:(char)a4 frameRateSwitchBasedOnMotionDisabled:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v7 = result;
    *(void *)(result + 12) = 0x3C88CE7000000000;
    *(_DWORD *)(result + 24) = 1014672602;
    if (!*(void *)(result + 32)) {
      *(void *)(result + 32) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    if (!*(void *)(v7 + 400)) {
      *(void *)(v7 + 400) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    char v16 = a4;
    if (!*(void *)(v7 + 392)) {
      *(void *)(v7 + 392) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    *(_DWORD *)(v7 + 488) = 0;
    *(void *)(v7 + 48) = 0;
    if (!*(void *)(v7 + 40)) {
      *(void *)(v7 + 40) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [a2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(a2);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v13 = (void *)[a3 objectForKeyedSubscript:v12];
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          if (v13)
          {
            v15 = v14;
            if (objc_msgSend((id)objc_msgSend(v13, "portType"), "isEqualToString:", v12))
            {
              -[BWVariableFrameRateSelector _updateAEMaxGainDictionary:withAEMaxGain:forPortType:](v7, v15, (void *)[v13 aeMaxGain]);
              -[BWVariableFrameRateSelector _updatemotionThreshold:forPortType:](v7, [v13 motionThreshold], v12);
              [*(id *)(v7 + 32) setObject:v15 forKeyedSubscript:v12];
            }
          }
        }
        uint64_t v9 = [a2 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
    *(_WORD *)(v7 + 57) = 256;
    BWSmartCameraSceneInitialize(v7 + 64, 1, 1, 1, (uint64_t)"VFR MotionX Low", 0.9, 0.0, 0.5);
    BWSmartCameraSceneInitialize(v7 + 104, 1, 55, 3, (uint64_t)"VFR MotionX High", 0.9, 0.0, 0.5);
    BWSmartCameraSceneInitialize(v7 + 144, 1, 1, 1, (uint64_t)"VFR Device Motion Low", 0.001, 0.004, 0.5);
    BWSmartCameraSceneInitialize(v7 + 184, 1, 55, 1, (uint64_t)"VFR Device Motion High", 0.998, 0.004, 0.5);
    BWSmartCameraSceneInitialize(v7 + 224, 1, 8, 1, (uint64_t)"VFR AE Limits Reached", 0.9, 0.0, 0.5);
    BWSmartCameraSceneInitialize(v7 + 264, 1, 10, 1, (uint64_t)"VFR Zoom requested", 0.9, 0.0, 1.0);
    BWSmartCameraSceneInitialize(v7 + 304, 1, 25, 5, (uint64_t)"VFR Flicker detected", 0.9, 0.0, 0.5);
    result = BWSmartCameraSceneInitialize(v7 + 344, 1, 15, 600, (uint64_t)"VFR water detected", 0.45, 0.05, 0.5);
    *(unsigned char *)(v7 + 472) = 0;
    *(_DWORD *)(v7 + 536) = 0;
    *(unsigned char *)(v7 + 473) = v16 ^ 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWVariableFrameRateSelector;
  [(BWVariableFrameRateSelector *)&v3 dealloc];
}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 frameStatistics:(id)a4 currentFrameRate:(float)a5 aeMaxGain:(float)a6 zoomInProgress:(BOOL)a7 mostRecentInferenceResult:(id)a8
{
  BOOL v9 = a7;
  p_smartCameraLock = &self->_smartCameraLock;
  os_unfair_lock_lock(&self->_smartCameraLock);

  self->_mostRecentInferenceResult = (BWInferenceResult *)a8;
  os_unfair_lock_unlock(p_smartCameraLock);
  os_unfair_lock_lock(&self->_variableFrameRateInfoLock);
  BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_zoomRequest, (float)v9);
  BOOL confident = self->_zoomRequest.confident;
  self->_zoomInProgress = confident;
  if (!confident) {
    -[BWVariableFrameRateSelector _updateSuggestedFrameRateFromFrameStatistics:sampleBuffer:currentFrameRate:aeMaxGain:]((uint64_t)self, a4, a3, a5);
  }
  os_unfair_lock_unlock(&self->_variableFrameRateInfoLock);
}

- (uint64_t)_updateSuggestedFrameRateFromFrameStatistics:(uint64_t)result sampleBuffer:(void *)a2 currentFrameRate:(CMAttachmentBearerRef)target aeMaxGain:(float)a4
{
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F53070];
  BOOL v9 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v10 = (void *)[v9 objectForKeyedSubscript:*MEMORY[0x1E4F54B40]];
  objc_super v11 = (void *)CMGetAttachment(target, v8, 0);
  [a2 integrationTime];
  double v13 = v12;
  [a2 gain];
  double v15 = v13 * v14;
  unsigned __int8 v16 = -[BWVariableFrameRateSelector _getSceneStabilityFromSampleBuffer:currentFrameRate:portType:]((char *)v7, target, (uint64_t)v10, a4);
  BWSmartCameraSceneUpdateWithConfidence(v7 + 224, (float)[a2 aeLimitsReached]);
  int v17 = *(unsigned __int8 *)(v7 + 225);
  unsigned int v18 = -[BWVariableFrameRateSelector _waterSceneDetected]((os_unfair_lock_s *)v7);
  v62 = (void *)[v9 objectForKeyedSubscript:*MEMORY[0x1E4F54110]];
  double v19 = -[BWVariableFrameRateSelector _frameRateForFrameStatistics:portType:]((float *)v7, a2);
  float v20 = *(float *)&v19;
  int v21 = *(_DWORD *)(v7 + 12);
  BOOL v24 = *(float *)&v19 == 60.0 && v21 == 0 || v21 == 2;
  int v25 = [v10 isEqualToString:*MEMORY[0x1E4F52DF0]];
  *(unsigned char *)(v7 + 532) = v16;
  *(unsigned char *)(v7 + 533) = v17;
  *(unsigned char *)(v7 + 534) = v18;
  if (v24) {
    int v26 = 2;
  }
  else {
    int v26 = 1;
  }
  *(_DWORD *)(v7 + 496) = v26;
  objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DA0]), "floatValue");
  unsigned int v28 = vcvtps_s32_f32(v27) & 0x7FFFFFFE;
  *(_DWORD *)(v7 + 536) = v28;
  int v29 = 1114636288;
  if (!v24)
  {
    BOOL v32 = v20 < 60.0 && v21 == 0;
    if (v21 != 1 && !v32) {
      goto LABEL_28;
    }
    if (v17) {
      int v33 = v25;
    }
    else {
      int v33 = 1;
    }
    if (a4 == 30.0 && !v33 && v28 >= 0x19)
    {
      [a2 integrationTime];
      double v35 = v34;
      [a2 gain];
      int v30 = 0;
      float v37 = v35 * v36;
      *(float *)(v7 + 384) = v37;
      *(_DWORD *)(v7 + 492) = 6;
      *(void *)(v7 + 500) = 0x41C0000041F00000;
      int v29 = 1103101952;
LABEL_49:
      *(_DWORD *)(v7 + 8) = v29;
      goto LABEL_50;
    }
    [(id)v7 getAEMaxGainForPortType:v10 suggestedFrameRate:30.0];
    int v47 = *(_DWORD *)(v7 + 492);
    if (v47 == 6)
    {
      float v48 = v46;
      if (v15 <= (float)(flt_1A5F0C3D8[v46 > 255.0] * *(float *)(v7 + 384)))
      {
LABEL_70:
        int v30 = 0;
        *(_DWORD *)(v7 + 492) = 4;
        *(float *)(v7 + 500) = a4;
        goto LABEL_71;
      }
      [a2 integrationTime];
      double v50 = v49;
      [a2 gain];
      if (*(int *)(v7 + 536) > 29) {
        goto LABEL_28;
      }
      double v52 = v51;
      if (1.0 / v50 < 30.0 || v48 * 0.97 < v52) {
        goto LABEL_28;
      }
      int v47 = *(_DWORD *)(v7 + 492);
    }
    if (v20 == a4 && v47 == 4 && *(float *)(v7 + 8) == v20) {
      goto LABEL_28;
    }
    goto LABEL_70;
  }
  if (v18)
  {
    if (a4 != 60.0 || *(_DWORD *)(v7 + 492) != 8 || *(float *)(v7 + 8) != 60.0)
    {
      int v30 = 0;
      *(_DWORD *)(v7 + 492) = 8;
      *(float *)(v7 + 500) = a4;
LABEL_48:
      *(_DWORD *)(v7 + 504) = v29;
      goto LABEL_49;
    }
    goto LABEL_28;
  }
  char v38 = v16 ^ 1;
  if (a4 != 60.0) {
    char v38 = 1;
  }
  if ((v38 & 1) != 0 || !*(unsigned char *)(v7 + 473))
  {
    if (v17)
    {
      [a2 integrationTime];
      double v40 = v39;
      [a2 gain];
      float v42 = v40 * v41;
      *(float *)(v7 + 384) = v42;
      if (a4 != 30.0 || *(_DWORD *)(v7 + 492) != 3 || *(float *)(v7 + 8) != 30.0)
      {
        int v30 = 0;
        *(_DWORD *)(v7 + 492) = 3;
        *(float *)(v7 + 500) = a4;
        int v29 = 1106247680;
        goto LABEL_48;
      }
      goto LABEL_28;
    }
    if (a4 == 24.0)
    {
      int v30 = 0;
      *(_DWORD *)(v7 + 492) = 7;
      *(void *)(v7 + 500) = 0x41F0000041C00000;
      int v29 = 1106247680;
      goto LABEL_49;
    }
    if (a4 != 30.0 || v28 > 0x3B)
    {
      int v30 = 2 * (v28 > 0x3B);
      goto LABEL_50;
    }
    int v54 = *(_DWORD *)(v7 + 492);
    if (v54 == 1) {
      goto LABEL_85;
    }
    if (v54 == 3)
    {
      float v55 = *(float *)(v7 + 384) * 0.95;
      if (v15 > v55) {
        goto LABEL_28;
      }
    }
    [a2 integrationTime];
    if (v56 <= *(float *)(v7 + 24))
    {
LABEL_85:
      int v61 = 2;
    }
    else
    {
      BOOL v57 = -[BWVariableFrameRateSelector _switchBackTo60AsFlickerFrequencyIsDetected:](v7, v62);
      [(id)v7 getAEMaxGainForPortType:v10 suggestedFrameRate:60.0];
      if (!v57) {
        goto LABEL_28;
      }
      float v59 = v58;
      [a2 gain];
      if (v59 * 0.97 <= v60) {
        goto LABEL_28;
      }
      int v61 = 5;
    }
    if (v20 == 30.0 && *(_DWORD *)(v7 + 492) == v61 && *(float *)(v7 + 8) == 30.0)
    {
LABEL_28:
      int v30 = 0;
      goto LABEL_50;
    }
    int v30 = 0;
    *(_DWORD *)(v7 + 492) = v61;
    *(_DWORD *)(v7 + 500) = 1106247680;
LABEL_71:
    *(float *)(v7 + 504) = v20;
    *(float *)(v7 + 8) = v20;
    goto LABEL_50;
  }
  if (*(_DWORD *)(v7 + 492) != 1 || *(float *)(v7 + 8) != 60.0)
  {
    int v30 = 1;
    *(_DWORD *)(v7 + 492) = 1;
    *(void *)(v7 + 500) = 0x4270000042700000;
    int v29 = 1114636288;
    goto LABEL_49;
  }
  int v30 = 1;
LABEL_50:
  float v43 = *(float *)(v7 + 8);
  if (v43 == 0.0 && (v43 != a4 || *(_DWORD *)(v7 + 492)))
  {
    *(_DWORD *)(v7 + 492) = 0;
    *(float *)(v7 + 500) = a4;
    *(float *)(v7 + 504) = a4;
    *(float *)(v7 + 8) = a4;
  }
  if (*(unsigned char *)(v7 + 473)) {
    *(_DWORD *)(v7 + 52) = v30;
  }
  uint64_t v44 = [NSNumber numberWithInt:*(unsigned int *)(v7 + 492)];
  v45 = *(void **)(v7 + 40);
  return [v45 setObject:v44 forKeyedSubscript:0x1EFA739E0];
}

- (void)addAttachmentsToSamplebuffer:(opaqueCMSampleBuffer *)a3
{
  p_variableFrameRateInfoLock = &self->_variableFrameRateInfoLock;
  os_unfair_lock_lock(&self->_variableFrameRateInfoLock);
  v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v7 = (void *)CMGetAttachment(a3, @"VariableFrameRateInfo", 0);
  if (!v7)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    CMSetAttachment(a3, @"VariableFrameRateInfo", self->_variableFrameRateInfo, 1u);
  }
  [v7 addEntriesFromDictionary:self->_variableFrameRateInfo];
  uint64_t v8 = [NSNumber numberWithInt:self->_frameRateConversionStatus];
  [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F55D00]];
  os_unfair_lock_unlock(p_variableFrameRateInfoLock);
}

- (float)getAEMaxGainForPortType:(id)a3 suggestedFrameRate:(double)a4
{
  v5 = (void *)[(NSMutableDictionary *)self->_vfrAEMaxGainsByPortType objectForKeyedSubscript:a3];
  v6 = (void *)[v5 objectForKeyedSubscript:objc_msgSend(NSString, "stringWithFormat:", @"%d", (int)a4)];
  [v6 floatValue];
  return result;
}

- (float)suggestedFrameRate
{
  return self->_suggestedFrameRate;
}

- (uint64_t)_updatemotionThreshold:(uint64_t)a3 forPortType:
{
  if (result)
  {
    uint64_t v5 = result;
    objc_msgSend(*(id *)(result + 392), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", a2), a3);
    uint64_t v6 = [NSNumber numberWithInt:a2];
    uint64_t v7 = *(void **)(v5 + 400);
    return [v7 setObject:v6 forKeyedSubscript:a3];
  }
  return result;
}

- (uint64_t)_updateAEMaxGainDictionary:(uint64_t)result withAEMaxGain:(void *)a2 forPortType:(void *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    float result = [&unk_1EFB03308 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(&unk_1EFB03308);
          }
          uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * v7);
          objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v8), "floatValue");
          objc_msgSend(a2, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:"), v8);
          ++v7;
        }
        while (v5 != v7);
        float result = [&unk_1EFB03308 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
  }
  return result;
}

- (char)_updateMotionDataFromSampleBuffer:(char *)result
{
  if (result)
  {
    v2 = result;
    float result = (char *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53F90]);
    if (result)
    {
      objc_super v3 = result;
      uint64_t v4 = [result bytes];
      float result = (char *)[v3 length];
      uint64_t v5 = *(int *)(v4 + 4);
      if (result == (char *)(40 * (int)v5 + 8))
      {
        if ((int)v5 >= 1)
        {
          uint64_t v6 = 0;
          _Q1 = *(float64x2_t *)(v2 + 408);
          float64x2_t v7 = *(float64x2_t *)(v2 + 424);
          long long v9 = (void *)(v4 + 28);
          float64x2_t v10 = (float64x2_t)vdupq_n_s64(0x3E10000000000000uLL);
          do
          {
            _Q3 = _Q1;
            _Q2 = v7;
            uint64_t v13 = *(v9 - 1);
            v14.i64[0] = (int)*v9;
            v14.i64[1] = (int)HIDWORD(*v9);
            float64x2_t v7 = vmulq_f64(vcvtq_f64_s64(v14), v10);
            v14.i64[0] = (int)v13;
            v14.i64[1] = SHIDWORD(v13);
            _Q1 = vmulq_f64(vcvtq_f64_s64(v14), v10);
            v6 += 2;
            v9 += 10;
          }
          while (v6 < v5);
          float64_t v15 = -_Q3.f64[1];
          _D6 = _Q1.f64[1];
          _D7 = v7.f64[1];
          __asm
          {
            FMLA            D16, D6, V2.D[1]
            FMLS            D16, D7, V3.D[1]
            FMLS            D16, D1, V2.D[0]
            FMLS            D17, D6, V2.D[0]
            FMLS            D17, D1, V2.D[1]
          }
          *((void *)v2 + 57) = _D16;
          *((void *)v2 + 58) = _D17;
          float64x2_t v27 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&_Q2.f64[0], 0);
          v27.f64[0] = -_Q2.f64[1];
          float64x2_t v28 = vmlaq_laneq_f64(vmulq_n_f64(v27, v7.f64[0]), _Q3, _Q1, 1);
          float64x2_t v29 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&_Q3.f64[0], 0);
          v29.f64[0] = v15;
          int8x16_t v30 = (int8x16_t)vmlaq_n_f64(vmlaq_laneq_f64(v28, _Q2, v7, 1), v29, _Q1.f64[0]);
          *(float64x2_t *)(v2 + 424) = v7;
          *(int8x16_t *)(v2 + 440) = vextq_s8(v30, v30, 8uLL);
          *(float64x2_t *)(v2 + 408) = _Q1;
        }
      }
      else
      {
        fig_log_get_emitter();
        return (char *)FigDebugAssert3();
      }
    }
  }
  return result;
}

- (BOOL)_switchBackTo60AsFlickerFrequencyIsDetected:(BOOL)result
{
  if (result)
  {
    uint64_t v3 = result;
    float v4 = 0.0;
    if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F544D8]), "intValue")
       - 1 <= 1)
    {
      uint64_t v5 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F544D0]];
      if ([v5 count])
      {
        uint64_t v6 = (void *)[v5 objectAtIndexedSubscript:0];
        objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F544C8]), "floatValue");
        float v8 = v7;
        objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F544C0]), "floatValue");
        if (v9 >= 39321.0)
        {
          BOOL v10 = v8 > 60.0;
          if (v8 >= 65.0) {
            BOOL v10 = 0;
          }
          float v4 = (float)v10;
        }
      }
    }
    BWSmartCameraSceneUpdateWithConfidence(v3 + 304, v4);
    return *(unsigned char *)(v3 + 305) != 0;
  }
  return result;
}

- (double)_frameRateForFrameStatistics:(float *)a1 portType:(void *)a2
{
  if (!a1) {
    return 0.0;
  }
  objc_msgSend(a1, "getAEMaxGainForPortType:suggestedFrameRate:", 60.0);
  float v5 = v4;
  [a2 integrationTime];
  if (v6 <= a1[4] * 0.97 || ([a2 integrationTime], v7 >= a1[4] * 1.03))
  {
    [a2 integrationTime];
    double v10 = result;
    LODWORD(result) = 30.0;
    if (v10 <= a1[4]) {
      LODWORD(result) = 1114636288;
    }
  }
  else
  {
    [a2 gain];
    BOOL v8 = *(float *)&result < v5;
    LODWORD(result) = 1114636288;
    if (!v8) {
      *(float *)&double result = 30.0;
    }
  }
  return result;
}

- (uint64_t)_updateSmartSceneFromSampleBuffer:(uint64_t)a3 currentFrameRate:(float)a4 portType:
{
  if (result)
  {
    uint64_t v6 = result;
    *(_DWORD *)(result + 388) = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F540D0]), "intValue");
    uint64_t v7 = 400;
    if (a4 > 24.0) {
      uint64_t v7 = 392;
    }
    if (*(_DWORD *)(v6 + 388) >= (int)objc_msgSend((id)objc_msgSend(*(id *)(v6 + v7), "objectForKeyedSubscript:", a3), "intValue"))float v8 = 0.0; {
    else
    }
      float v8 = 1.0;
    double v9 = *(double *)(v6 + 440);
    double v10 = *(double *)(v6 + 448);
    double v11 = *(double *)(v6 + 456);
    double v12 = *(double *)(v6 + 464);
    double v14 = atan2(v11 * v12 + v9 * v10 + v11 * v12 + v9 * v10, (v11 * v11 + v10 * v10) * -2.0 + 1.0);
    *(double *)v15.i64 = v9 * v11 - v12 * v10 + v9 * v11 - v12 * v10;
    if (fabs(*(double *)v15.i64) >= 1.0)
    {
      v13.i64[0] = 0x3FF921FB54442D18;
      v17.f64[0] = NAN;
      v17.f64[1] = NAN;
      *(void *)&double v16 = vbslq_s8((int8x16_t)vnegq_f64(v17), v13, v15).u64[0];
    }
    else
    {
      double v16 = asin(*(long double *)v15.i64);
    }
    double v29 = v16;
    double v18 = atan2(v10 * v11 + v9 * v12 + v10 * v11 + v9 * v12, (v12 * v12 + v11 * v11) * -2.0 + 1.0);
    BWSmartCameraSceneUpdateWithConfidence(v6 + 64, v8);
    BWSmartCameraSceneUpdateWithConfidence(v6 + 104, v8);
    uint64_t v19 = v6 + 144;
    double v20 = fabs(v14);
    double v21 = fabs(v29);
    double v22 = fabs(v18);
    if (v20 <= v21)
    {
      if (v21 <= v22) {
        double v25 = v22;
      }
      else {
        double v25 = v21;
      }
      float v26 = 1.0 - v25;
      BWSmartCameraSceneUpdateWithConfidence(v19, v26);
      double v20 = v21;
      if (v21 > v22)
      {
LABEL_21:
        float v27 = 1.0 - v20;
        double result = BWSmartCameraSceneUpdateWithConfidence(v6 + 184, v27);
        if (a4 > 24.0)
        {
          if (*(unsigned char *)(v6 + 58))
          {
            if (*(unsigned char *)(v6 + 185) || !*(unsigned char *)(v6 + 57))
            {
              uint64_t v28 = 105;
LABEL_34:
              *(unsigned char *)(v6 + 56) = *(unsigned char *)(v6 + v28);
              return result;
            }
          }
          else if (!*(unsigned char *)(v6 + 57))
          {
            return result;
          }
          uint64_t v28 = 185;
          goto LABEL_34;
        }
        if (*(unsigned char *)(v6 + 58))
        {
          if (*(unsigned char *)(v6 + 145) || !*(unsigned char *)(v6 + 57))
          {
            uint64_t v28 = 65;
            goto LABEL_34;
          }
        }
        else if (!*(unsigned char *)(v6 + 57))
        {
          return result;
        }
        uint64_t v28 = 145;
        goto LABEL_34;
      }
    }
    else
    {
      if (v20 <= v22) {
        double v23 = v22;
      }
      else {
        double v23 = v20;
      }
      float v24 = 1.0 - v23;
      BWSmartCameraSceneUpdateWithConfidence(v19, v24);
      if (v20 > v22) {
        goto LABEL_21;
      }
    }
    double v20 = v22;
    goto LABEL_21;
  }
  return result;
}

- (char)_getSceneStabilityFromSampleBuffer:(uint64_t)a3 currentFrameRate:(float)a4 portType:
{
  if (result)
  {
    uint64_t v7 = (uint64_t)result;
    -[BWVariableFrameRateSelector _updateMotionDataFromSampleBuffer:](result, a2);
    -[BWVariableFrameRateSelector _updateSmartSceneFromSampleBuffer:currentFrameRate:portType:](v7, a2, a3, a4);
    return (char *)(*(unsigned char *)(v7 + 56) != 0);
  }
  return result;
}

- (os_unfair_lock_s)_waterSceneDetected
{
  if (result)
  {
    v1 = result;
    v2 = result + 122;
    os_unfair_lock_lock(result + 122);
    id v3 = *(id *)&v1[120]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
    double result = (os_unfair_lock_s *)[v3 isValid];
    if (result)
    {
      float v4 = (void *)[v3 inferences];
      objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F54D98]), "floatValue");
      BWSmartCameraSceneUpdateWithConfidence((uint64_t)&v1[86], v5);
      return (os_unfair_lock_s *)(BYTE1(v1[86]._os_unfair_lock_opaque) != 0);
    }
  }
  return result;
}

@end