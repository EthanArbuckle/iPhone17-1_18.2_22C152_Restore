@interface FigIrisAutoTrimmer
+ (void)initialize;
- ($2ACC23B9A21F50F5CC728381CA870116)vitalityScoringSmartCameraPipelineVersion;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)beginTrimmingForStillImageHostPTS:(SEL)a3 minimumPTS:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxHoldDuration;
- (BOOL)_isUnstable:(void *)a3 withLookback:;
- (BOOL)_shouldCut:(void *)a3 withLookahead:(void *)a4 withLookback:;
- (BOOL)_shouldCutSVM:(BOOL)result;
- (BOOL)_shouldCutUnstable:(void *)a3 withLookahead:;
- (BOOL)intermediateLoggingEnabled;
- (BOOL)trimmingActive;
- (BOOL)vitalityScoringEnabled;
- (FigIrisAutoTrimmer)init;
- (Float64)_getHostTime;
- (double)_timeoutThreshold;
- (double)_updateStorageStats;
- (double)bufferHistorySeconds;
- (double)videoFrameRate;
- (float)_computeVitalityFrom:(uint64_t)a3 to:;
- (float)computeVitalityScoreForStillImageHostPTS:(id *)a3 movieRange:(id *)a4;
- (id)exportMotionSamples;
- (int)emissionStatusForHostPTS:(id *)a3;
- (uint64_t)_checkSamplesContainHostTime:(uint64_t)result;
- (uint64_t)_directionalWeightForSample:(uint64_t)result;
- (uint64_t)_findClosestIndexToHostTime:(uint64_t)a3 fromIndex:(uint64_t)a4 limitIndex:;
- (uint64_t)_findClosestIndexToOffset:(uint64_t)a3 atLeastOneFromIndex:(double)a4 limitIndex:;
- (uint64_t)_findClosestIndexToTimestamp:(uint64_t)a3 fromIndex:(double)a4 limitIndex:;
- (unsigned)vitalityScoringVersion;
- (void)_initSVM:(uint64_t)a1 fromFile:(void *)a2;
- (void)_processMotionSample:(uint64_t)a3 gravity:(long long *)a4 motionTimestamp:(void *)a5 frameTimestamp:(double)a6 metadata:;
- (void)dealloc;
- (void)processCountOfVisibleVitalityObjects:(int)a3 forHostTime:(id *)a4;
- (void)processISPMotionData:(id)a3 forHostTime:(id *)a4;
- (void)processInferences:(id)a3 forHostTime:(id *)a4;
- (void)setBufferHistorySeconds:(double)a3;
- (void)setIntermediateLoggingEnabled:(BOOL)a3;
- (void)setMaxHoldDuration:(id *)a3;
- (void)setVideoFrameRate:(double)a3;
- (void)setVitalityScoringEnabled:(BOOL)a3;
- (void)setVitalityScoringSmartCameraPipelineVersion:(id)a3;
- (void)startMotionProcessing;
- (void)stopMotionProcessing;
@end

@implementation FigIrisAutoTrimmer

- (void)processISPMotionData:(id)a3 forHostTime:(id *)a4
{
  uint64_t v4 = MEMORY[0x1F4188790](self, a2, a3, a4);
  v24[1] = *MEMORY[0x1E4F143B8];
  if (!v5)
  {
    fig_log_get_emitter();
LABEL_16:
    FigDebugAssert3();
    return;
  }
  v7 = v6;
  uint64_t v8 = v4;
  uint64_t v9 = *MEMORY[0x1E4F53F90];
  uint64_t v23 = *MEMORY[0x1E4F53F90];
  v24[0] = v5;
  CFDictionaryRef v10 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  bzero(v22, 0x14A0uLL);
  float32x2_t v20 = 0;
  uint64_t v21 = 0;
  if (FigMotionGetMotionDataFromISP(v10, v22, 0, 110, (int *)&v21 + 1, &v20, 0, 0, 0))
  {
    fig_log_get_emitter();
    goto LABEL_16;
  }
  if (SHIDWORD(v21) < 1)
  {
    ++processISPMotionData_forHostTime__missingFrames;
    [(__CFDictionary *)v10 objectForKeyedSubscript:v9];
    FigMotionHardwareAvailable();
  }
  else
  {
    processISPMotionData_forHostTime__missingFrames = 0;
    CMTime time = *v7;
    double Seconds = CMTimeGetSeconds(&time);
    if (SHIDWORD(v21) >= 1)
    {
      uint64_t v12 = 0;
      v13 = &v22[0].f64[1];
      int v14 = -1;
      double v15 = INFINITY;
      do
      {
        double v16 = vabdd_f64(*v13, Seconds);
        if (v16 >= v15)
        {
          if (v15 < 0.005) {
            break;
          }
        }
        else
        {
          double v15 = v16;
          int v14 = v12;
        }
        ++v12;
        v13 += 6;
      }
      while (HIDWORD(v21) != v12);
      if (v14 != -1)
      {
        v17 = &v22[3 * v14];
        double v18 = v17->f64[1];
        CMTime time = *v7;
        -[FigIrisAutoTrimmer _processMotionSample:gravity:motionTimestamp:frameTimestamp:metadata:](v8, (uint64_t)&v17[1], (uint64_t)&v20, (long long *)&time.value, v10, v18);
      }
    }
  }
}

- (void)_processMotionSample:(uint64_t)a3 gravity:(long long *)a4 motionTimestamp:(void *)a5 frameTimestamp:(double)a6 metadata:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v12 = *(void *)(a1 + 256) - 1;
    if ([*(id *)(a1 + 184) count] > v12) {
      objc_msgSend(*(id *)(a1 + 184), "removeObjectsInRange:", 0, objc_msgSend(*(id *)(a1 + 184), "count") - v12);
    }
    if ([*(id *)(a1 + 184) count]) {
      uint64_t v13 = objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", -[FigIrisAutoTrimmer _findClosestIndexToTimestamp:fromIndex:limitIndex:](a1, objc_msgSend(*(id *)(a1 + 184), "count") - 1, 0, a6 + -0.0666666667));
    }
    else {
      uint64_t v13 = 0;
    }
    int v14 = [FigIrisAutoTrimmerMotionSample alloc];
    long long v28 = *a4;
    uint64_t v29 = *((void *)a4 + 2);
    double v15 = [(FigIrisAutoTrimmerMotionSample *)v14 initWithAttitude:a2 gravity:a3 motionTimestamp:&v28 frameTimestamp:v13 previousSample:a6];
    double v16 = v15;
    if (*(void *)(a1 + 160))
    {
      [(FigIrisAutoTrimmerMotionSample *)v15 prepareIntermediates:*(void *)(a1 + 192)];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v17 = *(void **)(a1 + 160);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v25 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            uint64_t v23 = [a5 objectForKeyedSubscript:v22];
            if (v23) {
              [(NSMutableDictionary *)[(FigIrisAutoTrimmerMotionSample *)v16 intermediateCalculations] setObject:v23 forKeyedSubscript:v22];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v30 count:16];
        }
        while (v19);
      }
    }
    [*(id *)(a1 + 184) addObject:v16];
  }
}

- (uint64_t)_findClosestIndexToTimestamp:(uint64_t)a3 fromIndex:(double)a4 limitIndex:
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = a2;
  if (a2 < a3) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", a2), "timestamp");
  if (v8 + v5 < 0) {
    return v5;
  }
  double v10 = vabdd_f64(v9, a4);
  uint64_t v11 = v8 - a3;
  uint64_t v12 = v5;
  do
  {
    if (v8 + v5 >= (unint64_t)[*(id *)(a1 + 184) count]) {
      break;
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v8 + v5), "timestamp");
    double v14 = vabdd_f64(v13, a4);
    if (v14 <= v10) {
      uint64_t v12 = v8 + v5;
    }
    if (!(v11 + v5)) {
      break;
    }
    if (v14 > v10) {
      break;
    }
    uint64_t v15 = 2 * v8 + v5;
    v5 += v8;
    double v10 = v14;
  }
  while ((v15 & 0x8000000000000000) == 0);
  return v12;
}

- (void)startMotionProcessing
{
  self->_motionAvailable = 1;
}

- (void)setVitalityScoringSmartCameraPipelineVersion:(id)a3
{
  self->_vitalityScoringSmartCameraPipelineVersion = ($1D54FF943ED39CD641379A9C294BD6F7)a3;
  if (a3.var0 >= 4u)
  {
    if (a3.var0 == 4)
    {
      unsigned int v3 = 2;
      float v4 = 0.86;
    }
    else if (a3.var0 == 5 && (*(_DWORD *)&a3.var0 & 0xFFFF0000) == 0)
    {
      unsigned int v3 = 3;
      float v4 = 0.728;
    }
    else
    {
      unsigned int v3 = 4;
      float v4 = 0.468;
    }
  }
  else
  {
    unsigned int v3 = 1;
    float v4 = 0.629;
  }
  self->_vitalityScoringVersion = v3;
  self->_vitalityDocumentThreshold = v4;
}

- (void)setVitalityScoringEnabled:(BOOL)a3
{
  self->_vitalityScoringEnabled = a3;
}

- (void)setVideoFrameRate:(double)a3
{
  self->_motionSampleRate = a3;
  -[FigIrisAutoTrimmer _updateStorageStats]((uint64_t)self);
}

- (void)setMaxHoldDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_maxHoldDuration.flags = a3->var3;
  *(_OWORD *)(&self->_intermediateLoggingEnabled + 4) = v3;
  -[FigIrisAutoTrimmer _updateStorageStats]((uint64_t)self);
}

- (double)_updateStorageStats
{
  if (a1)
  {
    double v2 = *(double *)(a1 + 248);
    CMTime v4 = *(CMTime *)(a1 + 204);
    *(void *)(a1 + 232) = vcvtmd_s64_f64(v2 * CMTimeGetSeconds(&v4));
    double result = *(double *)(a1 + 248) * (*(double *)(a1 + 240) + 0.266666667);
    *(void *)(a1 + 256) = vcvtpd_u64_f64(result);
  }
  return result;
}

- (void)setBufferHistorySeconds:(double)a3
{
  self->_bufferHistorydouble Seconds = a3;
  -[FigIrisAutoTrimmer _updateStorageStats]((uint64_t)self);
}

- (FigIrisAutoTrimmer)init
{
  v9.receiver = self;
  v9.super_class = (Class)FigIrisAutoTrimmer;
  double v2 = [(FigIrisAutoTrimmer *)&v9 init];
  uint64_t v3 = (uint64_t)v2;
  if (v2)
  {
    v2[56] = 0;
    uint64_t v4 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v2 + 204) = *MEMORY[0x1E4F1F9F8];
    *(void *)(v2 + 220) = *(void *)(v4 + 16);
    *((_OWORD *)v2 + 15) = xmmword_1A5F0D040;
    *((void *)v2 + 32) = 68;
    *((void *)v2 + 29) = 68;
    *((_DWORD *)v2 + 34) = 4;
    *((void *)v2 + 23) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((void *)v2 + 32)];
    *(_DWORD *)(v3 + 268) = -1082130432;
    CFPropertyListRef v5 = CFPreferencesCopyAppValue(@"iris_autotrim_svm", @"com.apple.coremedia");
    if (v5)
    {
      v6 = v5;
      v7 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v5];
      if (v7) {
        -[FigIrisAutoTrimmer _initSVM:fromFile:](v3, v7);
      }
      CFRelease(v6);
    }
  }
  return (FigIrisAutoTrimmer *)v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigGetCFPreferenceDoubleWithDefault();
    sMotionThreshold = v2;
    FigGetCFPreferenceDoubleWithDefault();
    sBadAccelThreshold = v3;
    sEnableAllLoggingNoTrim = FigGetCFPreferenceNumberWithDefault();
  }
}

- (void)_initSVM:(uint64_t)a1 fromFile:(void *)a2
{
  if (a1)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"nVectors", @"nParams", @"Rho", @"ParamNames", @"Normalization", @"Vectors", 0);
    if (objc_msgSend((id)objc_msgSend(a2, "allKeys"), "isEqualToArray:", &unk_1EFB044C0))
    {
      *(void *)(a1 + 160) = (id)[a2 objectForKeyedSubscript:@"ParamNames"];
      return;
    }
    if ([a2 objectForKeyedSubscript:@"KernelType"])
    {
      if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"KernelType"), "isEqualToString:", @"Linear"))
      {
        *(_DWORD *)(a1 + 140) = 0;
      }
      else
      {
        if (!objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"KernelType"), "isEqualToString:", @"RBF"))return; {
        *(_DWORD *)(a1 + 140) = 1;
        }
        [v4 addObject:@"Gamma"];
      }
      objc_msgSend(v4, "minusSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a2, "allKeys")));
      if (![v4 count])
      {
        *(_DWORD *)(a1 + 144) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"nVectors"), "intValue");
        *(_DWORD *)(a1 + 148) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"nParams"), "intValue");
        objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"Rho"), "floatValue");
        *(_DWORD *)(a1 + 152) = v5;
        if (*(_DWORD *)(a1 + 140) == 1)
        {
          objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"Gamma"), "floatValue");
          *(_DWORD *)(a1 + 156) = v6;
        }
        *(void *)(a1 + 160) = (id)[a2 objectForKeyedSubscript:@"ParamNames"];
        *(void *)(a1 + 168) = (id)[a2 objectForKeyedSubscript:@"Normalization"];
        *(void *)(a1 + 176) = (id)[a2 objectForKeyedSubscript:@"Vectors"];
        uint64_t v7 = *(int *)(a1 + 148);
        int v8 = *(_DWORD *)(a1 + 144) * v7;
        uint64_t v9 = [*(id *)(a1 + 160) count];
        uint64_t v10 = *(int *)(a1 + 148);
        uint64_t v11 = [*(id *)(a1 + 168) length];
        uint64_t v12 = [*(id *)(a1 + 176) length];
        double v13 = *(void **)(a1 + 160);
        if (v12 == 4 * v8 && v11 == 8 * v7 && v9 == v10 - 1)
        {
          *(void *)(a1 + 192) = [v13 count];
        }
        else
        {
          if (v13)
          {
            CFRelease(v13);
            *(void *)(a1 + 160) = 0;
          }
          double v14 = *(const void **)(a1 + 168);
          if (v14)
          {
            CFRelease(v14);
            *(void *)(a1 + 168) = 0;
          }
          uint64_t v15 = *(const void **)(a1 + 176);
          if (v15)
          {
            CFRelease(v15);
            *(void *)(a1 + 176) = 0;
          }
        }
      }
    }
  }
}

- (void)dealloc
{
  motionSamples = self->_motionSamples;
  if (motionSamples)
  {
    CFRelease(motionSamples);
    self->_motionSamples = 0;
  }
  svmKeys = self->_svmKeys;
  if (svmKeys)
  {
    CFRelease(svmKeys);
    self->_svmKeys = 0;
  }
  svmNormalization = self->_svmNormalization;
  if (svmNormalization)
  {
    CFRelease(svmNormalization);
    self->_svmNormalization = 0;
  }
  svmVectors = self->_svmVectors;
  if (svmVectors)
  {
    CFRelease(svmVectors);
    self->_svmVectors = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)FigIrisAutoTrimmer;
  [(FigIrisAutoTrimmer *)&v7 dealloc];
}

- (void)stopMotionProcessing
{
  self->_motionAvailable = 0;
}

- (void)processInferences:(id)a3 forHostTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a4;
  if (-[FigIrisAutoTrimmer _checkSamplesContainHostTime:]((uint64_t)self, (CMTime *)&v15))
  {
    uint64_t v7 = [(NSMutableArray *)self->_motionSamples count];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a4;
    uint64_t v8 = -[FigIrisAutoTrimmer _findClosestIndexToHostTime:fromIndex:limitIndex:]((uint64_t)self, (CMTime *)&v15, v7 - 1, 0);
    objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v8), "setInferences:", a3);
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = v9;
      uint64_t v11 = v8 + v9;
      uint64_t v12 = v8 + v9 - 1;
      if (v8 + v9 < 2) {
        break;
      }
      uint64_t v13 = objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v8 + v9 - 1), "inferences");
      uint64_t v9 = v10 - 1;
    }
    while (!v13);
    if (v11 < v8)
    {
      do
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v8 + v10), "setInferences:", objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v12), "inferences"));
      while (!__CFADD__(v10++, 1));
    }
  }
}

- (uint64_t)_checkSamplesContainHostTime:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  double result = [*(id *)(result + 184) count];
  if (!result) {
    return result;
  }
  uint64_t v4 = (void *)[*(id *)(v3 + 184) firstObject];
  if (v4) {
    [v4 originatingFrameTime];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  CMTime time1 = *a2;
  int32_t v5 = CMTimeCompare(&time1, &time2);
  int v6 = *(void **)(v3 + 184);
  if (v5 < 0)
  {
    uint64_t v8 = (void *)[v6 firstObject];
    if (v8) {
      [v8 originatingFrameTime];
    }
    else {
      memset(&rhs, 0, sizeof(rhs));
    }
    CMTime time1 = *a2;
    uint64_t v11 = &v22;
    uint64_t v12 = &v22;
    p_CMTime rhs = &rhs;
  }
  else
  {
    uint64_t v7 = (void *)[v6 lastObject];
    if (v7) {
      [v7 originatingFrameTime];
    }
    else {
      memset(&v20, 0, sizeof(v20));
    }
    CMTime time1 = *a2;
    if (CMTimeCompare(&time1, &v20) < 1)
    {
      double Seconds = 0.0;
      goto LABEL_21;
    }
    uint64_t v9 = (void *)[*(id *)(v3 + 184) lastObject];
    if (v9) {
      [v9 originatingFrameTime];
    }
    else {
      memset(v18, 0, sizeof(v18));
    }
    CMTime time1 = *a2;
    uint64_t v11 = (CMTime *)v19;
    uint64_t v12 = (CMTime *)v19;
    p_CMTime rhs = (CMTime *)v18;
  }
  CMTimeSubtract(v12, &time1, p_rhs);
  double Seconds = CMTimeGetSeconds(v11);
LABEL_21:
  if (fabs(Seconds) <= 0.5 / *(double *)(v3 + 248)) {
    return 1;
  }
  CMTime time1 = *a2;
  double v14 = objc_msgSend(*(id *)(v3 + 184), "firstObject", CMTimeGetSeconds(&time1));
  if (v14) {
    [v14 originatingFrameTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = objc_msgSend(*(id *)(v3 + 184), "lastObject", CMTimeGetSeconds(&time));
  if (v15) {
    [v15 originatingFrameTime];
  }
  else {
    memset(&v16, 0, sizeof(v16));
  }
  CMTimeGetSeconds(&v16);
  return 0;
}

- (uint64_t)_findClosestIndexToHostTime:(uint64_t)a3 fromIndex:(uint64_t)a4 limitIndex:
{
  if (result)
  {
    uint64_t v5 = a3;
    uint64_t v7 = result;
    if (a3 < a4) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = -1;
    }
    memset(&v19, 0, sizeof(v19));
    uint64_t v9 = objc_msgSend(*(id *)(result + 184), "objectAtIndexedSubscript:");
    if (v9) {
      [v9 originatingFrameTime];
    }
    else {
      memset(&lhs, 0, sizeof(lhs));
    }
    CMTime rhs = *a2;
    CMTimeSubtract(&time, &lhs, &rhs);
    CMTimeAbsoluteValue(&v19, &time);
    if (v8 + v5 >= 0)
    {
      while (v8 + v5 < (unint64_t)[*(id *)(v7 + 184) count])
      {
        memset(&rhs, 0, sizeof(rhs));
        uint64_t v10 = (void *)[*(id *)(v7 + 184) objectAtIndexedSubscript:v8 + v5];
        if (v10) {
          [v10 originatingFrameTime];
        }
        else {
          memset(&v14, 0, sizeof(v14));
        }
        CMTime time1 = *a2;
        CMTimeSubtract(&v15, &v14, &time1);
        CMTimeAbsoluteValue(&rhs, &v15);
        CMTime time1 = rhs;
        CMTime v12 = v19;
        if (CMTimeCompare(&time1, &v12) >= 1) {
          break;
        }
        CMTime v19 = rhs;
        double result = v5 + v8;
        if (v8 - a4 + v5)
        {
          uint64_t v11 = 2 * v8 + v5;
          v5 += v8;
          if ((v11 & 0x8000000000000000) == 0) {
            continue;
          }
        }
        return result;
      }
    }
    return v5;
  }
  return result;
}

- (void)processCountOfVisibleVitalityObjects:(int)a3 forHostTime:(id *)a4
{
  if (a3 >= 1 && (a4->var2 & 1) != 0)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
    if (-[FigIrisAutoTrimmer _checkSamplesContainHostTime:]((uint64_t)self, (CMTime *)&v10))
    {
      uint64_t v7 = [(NSMutableArray *)self->_motionSamples count];
      $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
      uint64_t v8 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", -[FigIrisAutoTrimmer _findClosestIndexToHostTime:fromIndex:limitIndex:]((uint64_t)self, (CMTime *)&v10, v7 - 1, 0));
      uint64_t v9 = [v8 vitalityObjectCount] + a3;
      [v8 setVitalityObjectCount:v9];
    }
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)beginTrimmingForStillImageHostPTS:(SEL)a3 minimumPTS:(id *)a4
{
  self->_haveCaptureMotionDelta = 0;
  *retstr = *a4;
  uint64_t v9 = (void *)[(NSMutableArray *)self->_motionSamples lastObject];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = v9;
  if (!v9 || ([v9 cmTimestamp], CMTime time2 = (CMTime)*a4, CMTimeCompare(&time1, &time2) < 0))
  {
    [v10 timestamp];
    if (v31 >= -[FigIrisAutoTrimmer _timeoutThreshold]((uint64_t)self))
    {
LABEL_19:
      uint64_t v33 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
      int64_t var3 = *(void *)(v33 + 16);
      goto LABEL_20;
    }
LABEL_18:
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
LABEL_20:
    retstr->int64_t var3 = var3;
    goto LABEL_21;
  }
  double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(NSMutableArray *)self->_motionSamples count];
  CMTime v12 = (char *)&result[-1].var3 + 7;
  if ((uint64_t)result < 1) {
    goto LABEL_18;
  }
  uint64_t v13 = result;
  while (1)
  {
    uint64_t v13 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)v13 - 1);
    CMTime v14 = (void *)[(NSMutableArray *)self->_motionSamples objectAtIndexedSubscript:v13];
    CMTime v15 = v14;
    memset(&time2, 0, sizeof(time2));
    if (v14) {
      [v14 cmTimestamp];
    }
    CMTime v35 = time2;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v34 = *a5;
    double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&v35, (CMTime *)&v34);
    if ((result & 0x80000000) != 0) {
      break;
    }
    if (self->_haveCaptureMotionDelta)
    {
      CMTime v35 = time2;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v34 = *a4;
      double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&v35, (CMTime *)&v34);
      if ((result & 0x80000000) != 0)
      {
        uint64_t v16 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, (unint64_t)v13, 0, 0.266666667);
        uint64_t v17 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, (unint64_t)v13, (uint64_t)v12, 0.133333333);
        double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[FigIrisAutoTrimmer _shouldCut:withLookahead:withLookback:]((uint64_t)self, v15, (void *)[(NSMutableArray *)self->_motionSamples objectAtIndexedSubscript:v16], (void *)[(NSMutableArray *)self->_motionSamples objectAtIndexedSubscript:v17]);
        if (result) {
          break;
        }
        *(CMTime *)retstr = time2;
      }
    }
    else
    {
      CMTime v35 = time2;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v34 = *a4;
      double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&v35, (CMTime *)&v34);
      if ((int)result <= 0)
      {
        objc_msgSend((id)-[NSMutableArray lastObject](self->_motionSamples, "lastObject"), "timestamp");
        double v19 = v18;
        double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[v15 timestamp];
        if (v19 - v20 < 0.0333333333) {
          goto LABEL_19;
        }
        uint64_t v21 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, (unint64_t)v13, 0, 0.0666666667);
        uint64_t v22 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, (unint64_t)v13, (uint64_t)v12, 0.0333333333);
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v22), "attitudeRelativeTo:", -[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v21));
        self->_captureMotionDelta.w = v23;
        self->_captureMotionDelta.x = v24;
        self->_captureMotionDelta.y = v25;
        self->_captureMotionDelta.z = v26;
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v22), "timestamp");
        double v28 = v27;
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v21), "timestamp");
        self->_captureMotionDeltaPeriod = v28 - v29;
        self->_haveCaptureMotionDelta = 1;
        *(CMTime *)retstr = time2;
        double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[v15 timestamp];
        self->_lastCheckedTimestamp = v30;
        self->_lastStatus = 4;
      }
    }
    if ((uint64_t)v13 <= 0) {
      goto LABEL_18;
    }
  }
LABEL_21:
  if ((retstr->var2 & 1) != 0 && !self->_haveCaptureMotionDelta)
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a5->var0;
    retstr->int64_t var3 = a5->var3;
  }
  return result;
}

- (double)_timeoutThreshold
{
  if (!a1) {
    return 0.0;
  }
  if ((*(unsigned char *)(a1 + 216) & 1) == 0) {
    return -INFINITY;
  }
  double Host = -[FigIrisAutoTrimmer _getHostTime](a1);
  CMTime v4 = *(CMTime *)(a1 + 204);
  return Host - CMTimeGetSeconds(&v4);
}

- (uint64_t)_findClosestIndexToOffset:(uint64_t)a3 atLeastOneFromIndex:(double)a4 limitIndex:
{
  if (!a1) {
    return 0;
  }
  unint64_t v4 = a2;
  if ((a2 & 0x8000000000000000) != 0) {
    return v4;
  }
  unint64_t v8 = [*(id *)(a1 + 184) count];
  if (v4 == a3 || v8 <= v4) {
    return v4;
  }
  if ((uint64_t)v4 < a3) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 + v4;
  if ((uint64_t)(v9 + v4) < 0) {
    return -1;
  }
  unint64_t v11 = [*(id *)(a1 + 184) count];
  if (v10 == a3 || v10 >= v11)
  {
    v4 += v9;
    return v4;
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v4), "timestamp");
  double v13 = v12 + a4 * (double)v9;
  return -[FigIrisAutoTrimmer _findClosestIndexToTimestamp:fromIndex:limitIndex:](a1, v9 + v4, a3, v13);
}

- (BOOL)_shouldCut:(void *)a3 withLookahead:(void *)a4 withLookback:
{
  if (!a1) {
    return 0;
  }
  if (sEnableAllLoggingNoTrim || *(void *)(a1 + 176) || *(unsigned char *)(a1 + 200))
  {
    [a2 prepareIntermediates:*(void *)(a1 + 192)];
    -[FigIrisAutoTrimmer _isUnstable:withLookback:](a1, a2, a4);
    -[FigIrisAutoTrimmer _shouldCutUnstable:withLookahead:](a1, a2, a3);
    *(void *)(a1 + 192) = objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "count");
    if (sEnableAllLoggingNoTrim) {
      return 0;
    }
  }
  if (*(void *)(a1 + 176))
  {
    return -[FigIrisAutoTrimmer _shouldCutSVM:](a1, a2);
  }
  else
  {
    if (!-[FigIrisAutoTrimmer _isUnstable:withLookback:](a1, a2, a4)) {
      return 0;
    }
    return -[FigIrisAutoTrimmer _shouldCutUnstable:withLookahead:](a1, a2, a3);
  }
}

- (BOOL)trimmingActive
{
  return self->_haveCaptureMotionDelta;
}

- (int)emissionStatusForHostPTS:(id *)a3
{
  CMTime v33 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  if (!self->_haveCaptureMotionDelta) {
    return 4;
  }
  uint64_t v5 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, [(NSMutableArray *)self->_motionSamples count] - 1, [(NSMutableArray *)self->_motionSamples count] + ~self->_maxHoldFrames, 0.333333333);
  uint64_t v6 = v5;
  do
  {
    if (v6-- < 1)
    {
      int64_t v10 = 0;
      goto LABEL_11;
    }
    objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v6), "timestamp");
  }
  while (v8 > self->_lastCheckedTimestamp);
  uint64_t v9 = (void *)[(NSMutableArray *)self->_motionSamples objectAtIndexedSubscript:v6];
  int64_t v10 = v6 + 1;
  if (v9) {
    [v9 cmTimestamp];
  }
  else {
    memset(&rhs, 0, sizeof(rhs));
  }
  CMTime lhs = (CMTime)*a3;
  CMTimeSubtract(&time, &lhs, &rhs);
  CMTimeAbsoluteValue(&v33, &time);
LABEL_11:
  if (v10 >= v5)
  {
LABEL_26:
    uint64_t v21 = (void *)[(NSMutableArray *)self->_motionSamples lastObject];
    if (v21
      && ([v21 timestamp], v22 >= -[FigIrisAutoTrimmer _timeoutThreshold]((uint64_t)self))
      && self->_motionAvailable)
    {
      return 5;
    }
    else
    {
      int lastStatus = 4;
      self->_int lastStatus = 4;
    }
  }
  else
  {
    while (1)
    {
      double v12 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v10, v24.value, *(void *)&v24.timescale, v24.epoch);
      double v13 = v12;
      memset(&lhs, 0, sizeof(lhs));
      if (v12) {
        [v12 cmTimestamp];
      }
      else {
        memset(&v28, 0, sizeof(v28));
      }
      CMTime time1 = (CMTime)*a3;
      CMTimeSubtract(&v29, &time1, &v28);
      CMTimeAbsoluteValue(&lhs, &v29);
      CMTime time1 = lhs;
      CMTime time2 = v33;
      if (CMTimeCompare(&time1, &time2) > 0) {
        break;
      }
      CMTime v33 = lhs;
      [v13 timestamp];
      self->_lastCheckedTimestamp = v14;
      unint64_t v15 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, v10, [(NSMutableArray *)self->_motionSamples count] - 1, 0.0666666667);
      if (v10 != v15) {
        [(NSMutableArray *)self->_motionSamples count];
      }
      uint64_t v16 = (void *)[(NSMutableArray *)self->_motionSamples objectAtIndexedSubscript:v15];
      uint64_t v17 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, v15, [(NSMutableArray *)self->_motionSamples count] - 1, 0.266666667);
      uint64_t v18 = -[FigIrisAutoTrimmer _findClosestIndexToOffset:atLeastOneFromIndex:limitIndex:]((uint64_t)self, v15, 0, 0.133333333);
      BOOL v19 = -[FigIrisAutoTrimmer _shouldCut:withLookahead:withLookback:]((uint64_t)self, v16, (void *)[(NSMutableArray *)self->_motionSamples objectAtIndexedSubscript:v17], (void *)[(NSMutableArray *)self->_motionSamples objectAtIndexedSubscript:v18]);
      if ([v16 intermediateCalculations])
      {
        double v20 = (void *)[v16 intermediateCalculations];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __47__FigIrisAutoTrimmer_emissionStatusForHostPTS___block_invoke;
        v25[3] = &unk_1E5C2BF10;
        v25[4] = v13;
        [v20 enumerateKeysAndObjectsUsingBlock:v25];
        objc_msgSend((id)objc_msgSend(v16, "intermediateCalculations"), "removeAllObjects");
      }
      if (v19)
      {
        int lastStatus = 1;
        self->_int lastStatus = 1;
        CMTime time1 = (CMTime)*a3;
        self->_lastCheckedTimestamp = CMTimeGetSeconds(&time1);
        return lastStatus;
      }
      self->_int lastStatus = 4;
      if (v13) {
        [v13 cmTimestamp];
      }
      else {
        memset(&v24, 0, sizeof(v24));
      }
      CMTime time1 = (CMTime)*a3;
      if (CMTimeCompare(&v24, &time1) > 0) {
        break;
      }
      if (++v10 >= v5) {
        goto LABEL_26;
      }
    }
    int lastStatus = self->_lastStatus;
    if ((lastStatus & 0xFFFFFFFB) != 1)
    {
      CMTime lhs = v33;
      CMTimeGetSeconds(&lhs);
    }
  }
  return lastStatus;
}

uint64_t __47__FigIrisAutoTrimmer_emissionStatusForHostPTS___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "intermediateCalculations"), "objectForKeyedSubscript:", a2)) {
    __47__FigIrisAutoTrimmer_emissionStatusForHostPTS___block_invoke_cold_1();
  }
  uint64_t v6 = (void *)[*(id *)(a1 + 32) intermediateCalculations];
  return [v6 setObject:a3 forKeyedSubscript:a2];
}

- (float)computeVitalityScoreForStillImageHostPTS:(id *)a3 movieRange:(id *)a4
{
  memset(&v17, 0, sizeof(v17));
  long long v6 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a4->var1.var1;
  CMTimeRangeGetEnd(&v17, &range);
  if (![(NSMutableArray *)self->_motionSamples count])
  {
LABEL_17:
    [(NSMutableArray *)self->_motionSamples count];
    return 1.0;
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    uint64_t v9 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v7, v14.value, *(void *)&v14.timescale, v14.epoch, time1.value, *(void *)&time1.timescale, time1.epoch);
    if (v9) {
      [v9 originatingFrameTime];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0.var0;
    range.start.epoch = a4->var0.var3;
    if ((CMTimeCompare(&time1, &range.start) & 0x80000000) == 0) {
      break;
    }
LABEL_13:
    if (++v7 >= (unint64_t)[(NSMutableArray *)self->_motionSamples count])
    {
      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_17;
      }
LABEL_20:
      uint64_t v7 = [(NSMutableArray *)self->_motionSamples count];
      goto LABEL_21;
    }
  }
  int64_t v10 = (void *)[(NSMutableArray *)self->_motionSamples objectAtIndexedSubscript:v7];
  if (v10) {
    [v10 originatingFrameTime];
  }
  else {
    memset(&v14, 0, sizeof(v14));
  }
  range.start = v17;
  if (CMTimeCompare(&v14, &range.start) < 0)
  {
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v8 = v7;
    }
    goto LABEL_13;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_17;
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_20;
  }
LABEL_21:
  float v11 = 1.0;
  if (v8 < v7)
  {
    float v11 = -[FigIrisAutoTrimmer _computeVitalityFrom:to:]((uint64_t)self, v8, v7);
    if (self->_intermediateLoggingEnabled)
    {
      do
      {
        objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v8, v14.value, *(void *)&v14.timescale, v14.epoch), "prepareIntermediates:", self->_estimatedIntermediatesCount);
        *(float *)&double v13 = v11;
        objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_motionSamples, "objectAtIndexedSubscript:", v8++), "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v13), @"vitality");
      }
      while (v7 != v8);
    }
  }
  return v11;
}

- (float)_computeVitalityFrom:(uint64_t)a3 to:
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v4 = a2;
  float v6 = 1.0;
  if (*(float *)(a1 + 268) >= 0.0 && a2 < a3)
  {
    uint64_t v8 = a2;
    while ((int)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v8), "vitalityObjectCount") <= 0)
    {
      if (a3 == ++v8)
      {
        int v9 = 0;
        uint64_t v10 = *MEMORY[0x1E4F54D90];
        uint64_t v11 = *MEMORY[0x1E4F54D48];
        float v12 = 0.0;
        do
        {
          double v13 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v4), "inferences");
          if (v13)
          {
            unsigned int v14 = *(unsigned __int16 *)(a1 + 276);
            uint64_t v15 = v11;
            if (v14 >= 5)
            {
              if (v14 != 5 || (uint64_t v15 = v11, *(_WORD *)(a1 + 278))) {
                uint64_t v15 = v10;
              }
            }
            uint64_t v16 = (void *)[v13 objectForKeyedSubscript:v15];
            if (v16)
            {
              [v16 floatValue];
              float v12 = v12 + v17;
              ++v9;
            }
          }
          ++v4;
        }
        while (a3 != v4);
        if (v9)
        {
          float v18 = *(float *)(a1 + 268);
          float v19 = v18 - (float)(v12 / (float)v9);
          float v20 = fabsf(v18);
          float v21 = fabsf(v18 + -1.0);
          if (v20 > v21) {
            float v21 = v20;
          }
          return (float)((float)(v19 / v21) * 0.5) + 0.5;
        }
        return v6;
      }
    }
  }
  return v6;
}

- (unsigned)vitalityScoringVersion
{
  return self->_vitalityScoringVersion;
}

- (uint64_t)_directionalWeightForSample:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    [a2 accel];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v10 = sqrt(v6 * v6 + v4 * v4 + v8 * v8);
    long double v11 = acos(*(long double *)(v3 + 16));
    double v12 = v11 + v11;
    if (v12 > 3.14159265) {
      double v12 = v12 + -6.28318531;
    }
    double v13 = fabs(v12) / *(double *)(v3 + 48);
    if ([a2 intermediateCalculations])
    {
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v10 < 0.0001), @"noAccel");
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v13), @"captureRate");
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v13 > *(double *)&sMotionThreshold), @"usingCaptureDP");
    }
    if (v10 >= 0.0001)
    {
      if (v13 <= *(double *)&sMotionThreshold)
      {
        [a2 gravity];
        double v14 = v17;
        [a2 gravity];
        double v15 = v18;
        [a2 gravity];
        double v16 = v19;
      }
      else
      {
        double v14 = *(double *)(v3 + 24);
        double v15 = *(double *)(v3 + 32);
        double v16 = *(double *)(v3 + 40);
      }
      double v20 = (v7 * v15 + v14 * v5 + v16 * v9) / (v10 * sqrt(v15 * v15 + v14 * v14 + v16 * v16));
      double result = [a2 intermediateCalculations];
      if (result)
      {
        objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", (v7 * *(double *)(v3 + 32) + *(double *)(v3 + 24) * v5 + *(double *)(v3 + 40) * v9)/ (v10* sqrt(*(double *)(v3 + 32) * *(double *)(v3 + 32)+ *(double *)(v3 + 24) * *(double *)(v3 + 24)+ *(double *)(v3 + 40) * *(double *)(v3 + 40)))), @"captureDP");
        [a2 gravity];
        double v22 = v21;
        [a2 gravity];
        double v24 = v23;
        [a2 gravity];
        objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", (v7 * v24 + v22 * v5 + v25 * v9) / (v10 * sqrt(v24 * v24 + v22 * v22 + v25 * v25))), @"gravityDP");
        return objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v20), @"weightDP");
      }
    }
    else
    {
      double result = [a2 intermediateCalculations];
      if (result)
      {
        objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", &unk_1EFB01820, @"captureDP");
        objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", &unk_1EFB01820, @"gravityDP");
        return objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", 0.735294118), @"weightDP");
      }
    }
  }
  return result;
}

- (BOOL)_isUnstable:(void *)a3 withLookback:
{
  if (result)
  {
    uint64_t v5 = result;
    [a2 delta];
    long double v7 = acos(v6);
    double v8 = v7 + v7;
    if (v8 > 3.14159265) {
      double v8 = v8 + -6.28318531;
    }
    double v9 = fabs(v8);
    [a2 deltaPeriod];
    double v11 = v9 / v10;
    [a3 delta];
    long double v13 = acos(v12);
    double v14 = v13 + v13;
    if (v14 > 3.14159265) {
      double v14 = v14 + -6.28318531;
    }
    double v15 = fabs(v14);
    [a3 deltaPeriod];
    double v17 = v15 / v16;
    if (v15 / v16 >= v11) {
      double v18 = v11;
    }
    else {
      double v18 = v15 / v16;
    }
    [a2 accel];
    long double v20 = v19;
    -[FigIrisAutoTrimmer _directionalWeightForSample:](v5, a2);
    double v22 = v21;
    double v23 = 1.0 / (v18 * 1.5 + 1.0);
    long double v24 = acos(v20);
    double v25 = v24 + v24;
    if (v25 > 3.14159265) {
      double v25 = v25 + -6.28318531;
    }
    double v26 = fabs(v25);
    [a2 deltaPeriod];
    double v28 = v23 * (v22 * (v26 / v27));
    [a2 timestamp];
    if ([a2 intermediateCalculations])
    {
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v17), @"deltaMagnitudeLookback");
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v11), @"deltaMagnitudeSample");
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v18), @"deltaMagnitude");
      CMTime v29 = NSNumber;
      [a2 deltaPeriod];
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(v29, "numberWithDouble:", v26 / v30), @"accelMagnitude");
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v22), @"dirWeight");
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v23), @"speedWeight");
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v28), @"weightedAccelMagnitude");
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v28 > *(double *)&sBadAccelThreshold), @"unstable");
    }
    return v28 > *(double *)&sBadAccelThreshold;
  }
  return result;
}

- (BOOL)_shouldCutUnstable:(void *)a3 withLookahead:
{
  if (result)
  {
    [a3 attitudeRelativeTo:a2];
    long double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    long double v13 = acos(v5);
    double v14 = v13 + v13;
    if (v14 > 3.14159265) {
      double v14 = v14 + -6.28318531;
    }
    double v15 = fabs(v14);
    [a3 timestamp];
    double v17 = v16;
    [a2 timestamp];
    double v19 = vabdd_f64(v17, v18);
    double v20 = 0.0;
    if (v19 <= 0.0001) {
      double v21 = 0.0;
    }
    else {
      double v21 = v15 / v19;
    }
    [a3 timestamp];
    [a2 timestamp];
    [a2 accel];
    double v26 = sqrt(v10 * v10 + v8 * v8 + v12 * v12);
    if (v26 >= 0.00001)
    {
      double v27 = sqrt(v24 * v24 + v23 * v23 + v25 * v25);
      if (v27 >= 0.00001) {
        double v20 = (v10 * v24 + v8 * v23 + v12 * v25) / (v26 * v27);
      }
    }
    if (*(void *)&v6 >> 63 == v22 >> 63) {
      double v28 = v20;
    }
    else {
      double v28 = -v20;
    }
    if ([a2 intermediateCalculations])
    {
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v15), @"aheadAngle");
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v21 * v28), @"aheadAccComp");
      objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v28), @"accelConsistency");
    }
    return v21 * v28 > 0.47;
  }
  return result;
}

- (BOOL)_shouldCutSVM:(BOOL)result
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = [*(id *)(result + 168) bytes];
    long double v5 = (const float *)[*(id *)(v3 + 176) bytes];
    v25[1] = v25;
    vDSP_Length v6 = *(int *)(v3 + 148) - 1;
    unint64_t v7 = (4 * v6 + 15) & 0xFFFFFFFFFFFFFFF0;
    if ([*(id *)(v3 + 160) count])
    {
      unint64_t v8 = 0;
      do
      {
        uint64_t v9 = objc_msgSend((id)objc_msgSend(a2, "intermediateCalculations"), "objectForKeyedSubscript:", objc_msgSend(*(id *)(v3 + 160), "objectAtIndexedSubscript:", v8));
        int v10 = 0;
        if (v9)
        {
          double v11 = (void *)v9;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v11 floatValue];
            int v10 = v12;
          }
        }
        *(_DWORD *)((char *)v25 + 4 * v8++ - v7) = v10;
      }
      while ([*(id *)(v3 + 160) count] > v8);
    }
    vDSP_vma((const float *)((char *)v25 - v7), 1, (const float *)(v4 + 8), 2, (const float *)(v4 + 12), 2, (float *)((char *)v25 - v7), 1, v6);
    double v14 = (int *)(v3 + 144);
    uint64_t v13 = *(unsigned int *)(v3 + 144);
    double v15 = (float *)((char *)v25 - ((4 * v13 + 15) & 0x7FFFFFFF0));
    int v16 = *(_DWORD *)(v3 + 140);
    if (v16 == 1)
    {
      double v19 = (const float *)((char *)v25 - ((4 * v13 + 15) & 0x7FFFFFFF0));
      int v20 = *v14;
      if (*v14 < 1)
      {
        vDSP_Length v23 = v20;
      }
      else
      {
        v25[0] = v25;
        uint64_t v21 = 0;
        unint64_t v22 = (float *)v19;
        do
        {
          vDSP_distancesq(&v5[*(_DWORD *)(v3 + 148) * (int)v21++ + 1], 1, (const float *)((char *)v25 - v7), 1, v22, v6);
          int v20 = *(_DWORD *)(v3 + 144);
          ++v22;
        }
        while (v21 < v20);
        vDSP_Length v23 = v20;
      }
      float __B = -*(float *)(v3 + 156);
      double v24 = (float *)((char *)v25 - ((4 * v20 + 15) & 0x7FFFFFFF0));
      vDSP_vsmul(v19, 1, &__B, v24, 1, v23);
      vvexpf(v15, v24, (const int *)(v3 + 144));
      LODWORD(v13) = *(_DWORD *)(v3 + 144);
    }
    else if (!v16 && (int)v13 >= 1)
    {
      uint64_t v17 = 0;
      double v18 = (float *)((char *)v25 - ((4 * *(unsigned int *)(v3 + 144) + 15) & 0x7FFFFFFF0));
      do
      {
        vDSP_dotpr(&v5[*(_DWORD *)(v3 + 148) * (int)v17++ + 1], 1, (const float *)((char *)v25 - v7), 1, v18, v6);
        uint64_t v13 = *(int *)(v3 + 144);
        ++v18;
      }
      while (v17 < v13);
    }
    float __B = 0.0;
    vDSP_dotpr(v5, *(int *)(v3 + 148), v15, 1, &__B, (int)v13);
    return __B > *(float *)(v3 + 152);
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxHoldDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[8].var2;
  retstr->int64_t var3 = *(int64_t *)((char *)&self[9].var0 + 4);
  return self;
}

- (double)bufferHistorySeconds
{
  return self->_bufferHistorySeconds;
}

- (double)videoFrameRate
{
  return self->_motionSampleRate;
}

- (BOOL)intermediateLoggingEnabled
{
  return self->_intermediateLoggingEnabled;
}

- (void)setIntermediateLoggingEnabled:(BOOL)a3
{
  self->_intermediateLoggingEnabled = a3;
}

- (BOOL)vitalityScoringEnabled
{
  return self->_vitalityScoringEnabled;
}

- ($2ACC23B9A21F50F5CC728381CA870116)vitalityScoringSmartCameraPipelineVersion
{
  return ($2ACC23B9A21F50F5CC728381CA870116)(*(unsigned int *)&self->_vitalityScoringSmartCameraPipelineVersion.major | ((unint64_t)self->_vitalityScoringSmartCameraPipelineVersion.patch << 32));
}

- (Float64)_getHostTime
{
  if (!a1) {
    return 0.0;
  }
  memset(&v4, 0, sizeof(v4));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v4, HostTimeClock);
  CMTime v3 = v4;
  return CMTimeGetSeconds(&v3);
}

- (id)exportMotionSamples
{
  uint64_t v2 = self->_motionSamples;
  return v2;
}

void __47__FigIrisAutoTrimmer_emissionStatusForHostPTS___block_invoke_cold_1()
{
  __assert_rtn("-[FigIrisAutoTrimmer emissionStatusForHostPTS:]_block_invoke", "FigIrisAutoTrimmer.m", 544, "sample.intermediateCalculations[key] == nil");
}

@end