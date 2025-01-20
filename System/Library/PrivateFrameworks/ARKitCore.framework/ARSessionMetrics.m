@interface ARSessionMetrics
+ (id)getRenderEngineString:(id)a3;
+ (void)recordAltitudeLookupAttemptWithDuration:(double)a3 andResult:(id)a4;
+ (void)recordHitTest:(unint64_t)a3;
+ (void)recordReplayMetrics:(id)a3;
+ (void)setRenderType:(unint64_t)a3;
- (ARSessionMetrics)init;
- (ARSessionMetrics)initWithReporter:(id)a3;
- (void)_processFrameProperties:(id)a3;
- (void)_recordBadFramePercentageFinal:(BOOL)a3;
- (void)_recordSessionEnd;
- (void)recordCoachingOverlayUsage:(int)a3;
- (void)recordHiResFrameCapture;
- (void)recordRaycast:(id)a3 tracked:(BOOL)a4;
- (void)recordSaveMap:(int64_t)a3 numberOfFeaturePoints:(unint64_t)a4;
- (void)recordTrueNorthUnavailable;
- (void)reportSessionFailure:(id)a3;
- (void)sessionDidUpdateFrame:(id)a3;
- (void)sessionStarted:(id)a3 withConfiguration:(id)a4;
- (void)sessionStopped;
- (void)sessionUpdateThermalState:(int64_t)a3;
@end

@implementation ARSessionMetrics

- (void)sessionUpdateThermalState:(int64_t)a3
{
  if (a3 >= 2 && !self->_sessionWasThrottled)
  {
    startDate = self->_startDate;
    if (startDate)
    {
      [(NSDate *)startDate timeIntervalSinceNow];
      *(float *)&double v5 = v5;
      float v6 = -*(float *)&v5;
    }
    else
    {
      float v6 = 0.0;
    }
    self->_timeUntilThrottling = v6;
    self->_sessionWasThrottled = 1;
  }
}

- (ARSessionMetrics)init
{
  v3 = objc_opt_new();
  v4 = [(ARSessionMetrics *)self initWithReporter:v3];

  return v4;
}

- (ARSessionMetrics)initWithReporter:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARSessionMetrics;
  float v6 = [(ARSessionMetrics *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reporter, a3);
    v7->_sessionWasThrottled = 0;
    s_isSessionStopped = 1;
    v8 = (void *)s_replayStats;
    s_replayStats = 0;

    v7->_sessionDidFailWithError = 0;
    v7->_coachingOverlayGoal = 0;
    v7->_coachingOverlayActivationCount = 0;
  }

  return v7;
}

+ (void)setRenderType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    v3 = 0;
  }
  else {
    v3 = off_1E61862D8[a3 - 1];
  }
  v4 = (void *)s_reportedRendererString;
  s_reportedRendererString = (uint64_t)v3;
}

+ (void)recordHitTest:(unint64_t)a3
{
  v4 = reportingQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ARSessionMetrics_recordHitTest___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(v4, block);
}

void __34__ARSessionMetrics_recordHitTest___block_invoke(uint64_t a1)
{
  if ((s_isSessionStopped & 1) == 0)
  {
    v2 = hitTestReportingMap();
    v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
    v4 = [v2 objectForKey:v3];

    if (v4)
    {
      id v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "intValue") + 1);
    }
    else
    {
      id v5 = &unk_1F1259DD0;
    }
    id v7 = v5;
    float v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
    [v2 setObject:v7 forKey:v6];
  }
}

+ (void)recordReplayMetrics:(id)a3
{
  id v3 = a3;
  v4 = reportingQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ARSessionMetrics_recordReplayMetrics___block_invoke;
  block[3] = &unk_1E61851B0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __40__ARSessionMetrics_recordReplayMetrics___block_invoke(uint64_t a1)
{
}

+ (void)recordAltitudeLookupAttemptWithDuration:(double)a3 andResult:(id)a4
{
  id v5 = a4;
  float v6 = reportingQueue();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__ARSessionMetrics_recordAltitudeLookupAttemptWithDuration_andResult___block_invoke;
  v8[3] = &unk_1E61860A0;
  double v10 = a3;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __70__ARSessionMetrics_recordAltitudeLookupAttemptWithDuration_andResult___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();
}

id __70__ARSessionMetrics_recordAltitudeLookupAttemptWithDuration_andResult___block_invoke_2(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"duration";
  double v2 = *(double *)(a1 + 40);
  *(float *)&double v2 = v2;
  id v3 = [NSNumber numberWithFloat:v2];
  v9[0] = v3;
  v8[1] = @"bundleID";
  v4 = bundleID();
  v8[2] = @"result";
  uint64_t v5 = *(void *)(a1 + 32);
  v9[1] = v4;
  v9[2] = v5;
  float v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (void)recordTrueNorthUnavailable
{
  id v3 = reportingQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ARSessionMetrics_recordTrueNorthUnavailable__block_invoke;
  block[3] = &unk_1E61851B0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __46__ARSessionMetrics_recordTrueNorthUnavailable__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 241) = 1;
  double v2 = _ARLogSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    id v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1B88A2000, v2, OS_LOG_TYPE_INFO, "%{public}@ <%p>: True North was not available during the session - as reported by CoreMotion", (uint8_t *)&v6, 0x16u);
  }
}

+ (id)getRenderEngineString:(id)a3
{
  id v3 = a3;
  uint64_t isKindOfClass = (uint64_t)NSClassFromString(&cfstr_Fapplearkitses.isa);
  Class v5 = NSClassFromString(&cfstr_Unityarsession.isa);
  int32_t v6 = NSVersionOfRunTimeLibrary("RealityKit");
  if (isKindOfClass)
  {
    id v7 = [v3 delegate];
    uint64_t isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      __int16 v8 = @"Unreal";
      goto LABEL_14;
    }
  }
  if (v5)
  {
    uint64_t isKindOfClass = [v3 delegate];
    if (objc_opt_isKindOfClass())
    {

LABEL_10:
      __int16 v8 = @"Unity3d";
      goto LABEL_14;
    }
  }
  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.unity3d.framework"];

  if (v5) {
  if (v9)
  }
    goto LABEL_10;
  if (v6 == -1) {
    __int16 v8 = @"Unknown";
  }
  else {
    __int16 v8 = @"RealityKit";
  }
LABEL_14:

  return v8;
}

- (void)sessionStarted:(id)a3 withConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = reportingQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ARSessionMetrics_sessionStarted_withConfiguration___block_invoke;
  block[3] = &unk_1E61860F0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __53__ARSessionMetrics_sessionStarted_withConfiguration___block_invoke(id *a1)
{
  s_isSessionStopped = 0;
  *((unsigned char *)a1[4] + 202) = 0;
  uint64_t v2 = *((void *)a1[4] + 7);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = v4;
  if (v2) {
    BOOL v6 = v3 == v4;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (!v2) {
      [*((id *)a1[4] + 1) postDarwinNotification:@"com.apple.arkit.session.run"];
    }
  }
  else
  {
    [a1[4] _recordSessionEnd];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ARSessionMetrics_sessionStarted_withConfiguration___block_invoke_2;
  block[3] = &unk_1E61851B0;
  id v23 = a1[6];
  if (s_rendererString_block_invoke_onceToken != -1) {
    dispatch_once(&s_rendererString_block_invoke_onceToken, block);
  }
  if ([a1[5] isKindOfConfiguration:objc_opt_class()])
  {
    id v7 = [a1[5] getAsKindOfConfiguration:objc_opt_class()];
    __int16 v8 = [v7 initialWorldMap];
    int v9 = v8 != 0;

    id v10 = a1[4];
    if (*((unsigned __int8 *)v10 + 200) != v9)
    {
      if (*((unsigned char *)v10 + 200))
      {
        v11 = (void *)v10[1];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __53__ARSessionMetrics_sessionStarted_withConfiguration___block_invoke_3;
        v21[3] = &unk_1E61860C8;
        v21[4] = v10;
        [v11 sendEvent:@"com.apple.arkit.ARWorldMap.loading" dictionary:v21];
        id v10 = a1[4];
      }
      *((unsigned char *)v10 + 200) = v9;
    }
  }
  if (v3 != v5)
  {
    *((void *)a1[4] + 5) = objc_opt_class();
    uint64_t v12 = [a1[5] copy];
    id v13 = a1[4];
    v14 = (void *)v13[6];
    v13[6] = v12;

    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    v16 = a1[4];
    v17 = (void *)v16[7];
    v16[7] = v15;

    objc_storeStrong((id *)a1[4] + 8, *((id *)a1[4] + 7));
    *((void *)a1[4] + 9) = 0;
    *((void *)a1[4] + 11) = 0;
    *((void *)a1[4] + 12) = 0;
    *((unsigned char *)a1[4] + 112) = 0;
    *((void *)a1[4] + 26) = 0;
    *((void *)a1[4] + 27) = 0;
    *((unsigned char *)a1[4] + 240) = 0;
    *((unsigned char *)a1[4] + 241) = 0;
    *((void *)a1[4] + 33) = 0;
    *((void *)a1[4] + 34) = 0;
    *((void *)a1[4] + 35) = 0;
    *((void *)a1[4] + 37) = 0;
    *((void *)a1[4] + 31) = 0;
    *((void *)a1[4] + 32) = 0;
    *((void *)a1[4] + 38) = 0;
    *((void *)a1[4] + 39) = 0;
    *((void *)a1[4] + 40) = 0;
    *((void *)a1[4] + 41) = 0;
    *((void *)a1[4] + 42) = 0;
    *((void *)a1[4] + 43) = 0;
    *((void *)a1[4] + 44) = 0;
    *((void *)a1[4] + 45) = 0;
    *((void *)a1[4] + 46) = 0;
    *((void *)a1[4] + 47) = 0;
    *((void *)a1[4] + 48) = 0;
    *((void *)a1[4] + 49) = 0;
    *((void *)a1[4] + 50) = 0;
    *((void *)a1[4] + 51) = 0;
    v18 = hitTestReportingMap();
    [v18 removeAllObjects];
    *((unsigned char *)a1[4] + 16) = 1;
    if (objc_opt_respondsToSelector()) {
      *((unsigned char *)a1[4] + 16) = [a1[5] performSelector:sel_isAutoFocusEnabled] != 0;
    }
    if ([a1[5] isKindOfConfiguration:objc_opt_class()])
    {
      v19 = [a1[5] getAsKindOfConfiguration:objc_opt_class()];
      v20 = [v19 initialWorldMap];
      *((unsigned char *)a1[4] + 200) = v20 != 0;
    }
  }
}

void __53__ARSessionMetrics_sessionStarted_withConfiguration___block_invoke_2(uint64_t a1)
{
  if (!s_reportedRendererString)
  {
    uint64_t v1 = +[ARSessionMetrics getRenderEngineString:*(void *)(a1 + 32)];
    uint64_t v2 = (void *)s_rendererString;
    s_rendererString = v1;
  }
}

id __53__ARSessionMetrics_sessionStarted_withConfiguration___block_invoke_3(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  v8[0] = MEMORY[0x1E4F1CC28];
  v7[0] = @"success";
  v7[1] = @"duration";
  uint64_t v1 = NSNumber;
  [*(id *)(*(void *)(a1 + 32) + 56) timeIntervalSinceNow];
  *(float *)&double v2 = v2;
  *(float *)&double v2 = -*(float *)&v2;
  uint64_t v3 = [v1 numberWithFloat:v2];
  v8[1] = v3;
  v7[2] = @"bundleID";
  uint64_t v4 = bundleID();
  v8[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)sessionDidUpdateFrame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[ARSessionMetricsFrameProperties alloc] initWithFrame:v4];

  [(ARSessionMetrics *)self _processFrameProperties:v5];
}

- (void)_processFrameProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = reportingQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ARSessionMetrics__processFrameProperties___block_invoke;
  void v7[3] = &unk_1E6185160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__ARSessionMetrics__processFrameProperties___block_invoke(uint64_t a1)
{
  uint64_t v178 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (id *)(a1 + 32);
  if (*(void *)(*(void *)(a1 + 32) + 56))
  {
    uint64_t v3 = [*(id *)(a1 + 40) anchors];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 160);
    *(void *)(v4 + 160) = v3;

    uint64_t v6 = [*(id *)(a1 + 40) location];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 168);
    *(void *)(v7 + 168) = v6;

    int v9 = [*(id *)(a1 + 40) camera];
    if (([*(id *)(*(void *)(a1 + 32) + 48) isKindOfConfiguration:objc_opt_class()] & 1) != 0
      || [*((id *)*v1 + 6) isKindOfConfiguration:objc_opt_class()])
    {
      if (![v9 trackingState]
        || [v9 trackingState] == 1 && objc_msgSend(v9, "trackingStateReason") == 1)
      {
        *((unsigned char *)*v1 + 80) = 1;
        *((unsigned char *)*v1 + 201) = 1;
LABEL_146:

        return;
      }
      id v10 = *v1;
      if (*((unsigned char *)*v1 + 80))
      {
        v10[80] = 0;
        [*((id *)*v1 + 7) timeIntervalSinceNow];
        *((double *)*v1 + 13) = -v11;
        uint64_t v12 = _ARLogSession();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          id v13 = (objc_class *)objc_opt_class();
          v14 = NSStringFromClass(v13);
          id v15 = *v1;
          uint64_t v16 = *((void *)*v1 + 13);
          *(_DWORD *)buf = 138543874;
          id v169 = v14;
          __int16 v170 = 2048;
          id v171 = v15;
          __int16 v172 = 2048;
          uint64_t v173 = v16;
          _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: It took %f seconds to initialize vio", buf, 0x20u);
        }
        uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
        v18 = (void *)*((void *)*v1 + 8);
        *((void *)*v1 + 8) = v17;

        id v10 = *v1;
      }
      if (v10[200])
      {
        if ([v9 trackingState] == 1 && objc_msgSend(v9, "trackingStateReason") == 4)
        {
          *((unsigned char *)*v1 + 201) = 1;
        }
        else if ([v9 trackingState] == 2 && *((unsigned char *)*v1 + 201))
        {
          *((unsigned char *)*v1 + 201) = 0;
          id v36 = *v1;
          v37 = (void *)*((void *)*v1 + 1);
          v167[0] = MEMORY[0x1E4F143A8];
          v167[1] = 3221225472;
          v167[2] = __44__ARSessionMetrics__processFrameProperties___block_invoke_446;
          v167[3] = &unk_1E61860C8;
          v167[4] = v36;
          [v37 sendEvent:@"com.apple.arkit.ARWorldMap.loading" dictionary:v167];
        }
      }
      [v9 transform];
      v39 = (float32x4_t *)*v1;
      if (!*((unsigned char *)*v1 + 112))
      {
        v39[8] = v38;
        *((float32x4_t *)*v1 + 9) = v38;
        *((unsigned char *)*v1 + 112) = 1;
        v39 = (float32x4_t *)*v1;
      }
      float32x4_t v40 = v39[8];
      if ((vmovn_s32(vcgtq_f32(v38, v40)).u8[0] & 1) == 0) {
        v40.f32[0] = v38.f32[0];
      }
      v39[8].i32[0] = v40.i32[0];
      float v41 = *((float *)*v1 + 33);
      if (v41 >= v38.f32[1]) {
        float v41 = v38.f32[1];
      }
      *((float *)*v1 + 33) = v41;
      float v42 = *((float *)*v1 + 34);
      if (v42 >= v38.f32[2]) {
        float v42 = v38.f32[2];
      }
      *((float *)*v1 + 34) = v42;
      float32x4_t v43 = *((float32x4_t *)*v1 + 9);
      if (vmovn_s32(vcgtq_f32(v38, v43)).u8[0]) {
        v43.f32[0] = v38.f32[0];
      }
      *((_DWORD *)*v1 + 36) = v43.i32[0];
      float v44 = *((float *)*v1 + 37);
      if (v44 < v38.f32[1]) {
        float v44 = v38.f32[1];
      }
      *((float *)*v1 + 37) = v44;
      float v45 = *((float *)*v1 + 38);
      if (v45 < v38.f32[2]) {
        float v45 = v38.f32[2];
      }
      *((float *)*v1 + 38) = v45;
    }
    else if ([*((id *)*v1 + 6) isKindOfConfiguration:objc_opt_class()])
    {
      v19 = [*(id *)(a1 + 40) geoTrackingStatus];
      v20 = v19;
      if (v19)
      {
        if (*((double *)*v1 + 31) == 0.0 && [v19 state] != 1 && objc_msgSend(v20, "state"))
        {
          [*((id *)*v1 + 7) timeIntervalSinceNow];
          *((double *)*v1 + 31) = -v21;
          v22 = _ARLogSession();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            id v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            id v24 = (id)objc_claimAutoreleasedReturnValue();
            id v25 = *v1;
            uint64_t v26 = *((void *)*v1 + 31);
            *(_DWORD *)buf = 138543874;
            id v169 = v24;
            __int16 v170 = 2048;
            id v171 = v25;
            __int16 v172 = 2048;
            uint64_t v173 = v26;
            _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Attempting to localize geo tracking after %f seconds", buf, 0x20u);
          }
        }
        uint64_t v27 = [v20 state];
        v28 = *v1;
        if (v27 == 3)
        {
          if (!v28[240])
          {
            v28[240] = 1;
            ++*((void *)*v1 + 36);
            if (*((double *)*v1 + 32) == 0.0)
            {
              [*((id *)*v1 + 7) timeIntervalSinceNow];
              *((double *)*v1 + 32) = -v29;
              v30 = _ARLogSession();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                v31 = (objc_class *)objc_opt_class();
                NSStringFromClass(v31);
                id v32 = (id)objc_claimAutoreleasedReturnValue();
                id v33 = *v1;
                uint64_t v34 = *((void *)*v1 + 32);
                *(_DWORD *)buf = 138543874;
                id v169 = v32;
                __int16 v170 = 2048;
                id v171 = v33;
                __int16 v172 = 2048;
                uint64_t v173 = v34;
                _os_log_impl(&dword_1B88A2000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Geo tracking successful localized after %f seconds", buf, 0x20u);
              }
            }
          }
          uint64_t v35 = [v20 accuracy];
          switch(v35)
          {
            case 3:
              ++*((void *)*v1 + 35);
              break;
            case 2:
              ++*((void *)*v1 + 34);
              break;
            case 1:
              ++*((void *)*v1 + 33);
              break;
          }
        }
        else
        {
          v28[240] = 0;
        }
        if ([v20 state] == 2 || objc_msgSend(v20, "state") == 1) {
          *((void *)*v1 + 37) |= [v20 failureReasons];
        }
        else {
          *((void *)*v1 + 37) = [v20 failureReasons];
        }
        v46 = [*(id *)(a1 + 40) location];
        v47 = v46;
        if (*(double *)(*(void *)(a1 + 32) + 304) == 0.0)
        {
          [v46 horizontalAccuracy];
          double v49 = v48;
          [MEMORY[0x1E4FB4110] maximumHorizontalAccuracyThreshold];
          if (v49 < v50 && [v47 type] == 1)
          {
            [*((id *)*v1 + 7) timeIntervalSinceNow];
            *((double *)*v1 + 38) = -v51;
            v52 = _ARLogSession();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              v53 = (objc_class *)objc_opt_class();
              NSStringFromClass(v53);
              id v54 = (id)objc_claimAutoreleasedReturnValue();
              id v55 = *v1;
              uint64_t v56 = *((void *)*v1 + 38);
              *(_DWORD *)buf = 138543874;
              id v169 = v54;
              __int16 v170 = 2048;
              id v171 = v55;
              __int16 v172 = 2048;
              uint64_t v173 = v56;
              _os_log_impl(&dword_1B88A2000, v52, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CL first GPS %f seconds", buf, 0x20u);
            }
          }
        }
        if (*((double *)*v1 + 39) == 0.0)
        {
          [v47 horizontalAccuracy];
          double v58 = v57;
          [MEMORY[0x1E4FB4110] maximumHorizontalAccuracyThreshold];
          if (v58 < v59
            && [v47 type] != 6
            && [v47 type] != 10)
          {
            [*((id *)*v1 + 7) timeIntervalSinceNow];
            *((double *)*v1 + 39) = -v60;
            v61 = _ARLogSession();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
            {
              v62 = (objc_class *)objc_opt_class();
              NSStringFromClass(v62);
              id v63 = (id)objc_claimAutoreleasedReturnValue();
              id v64 = *v1;
              uint64_t v65 = *((void *)*v1 + 39);
              int v66 = [v47 type];
              *(_DWORD *)buf = 138544130;
              id v169 = v63;
              __int16 v170 = 2048;
              id v171 = v64;
              __int16 v172 = 2048;
              uint64_t v173 = v65;
              __int16 v174 = 1024;
              LODWORD(v175) = v66;
              _os_log_impl(&dword_1B88A2000, v61, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CL first non-GPS %f seconds, type %i", buf, 0x26u);
            }
          }
        }
        if (*((double *)*v1 + 40) == 0.0
          && +[ARLocationData isAltitudeValid:v47])
        {
          [*((id *)*v1 + 7) timeIntervalSinceNow];
          *((double *)*v1 + 40) = -v67;
          v68 = _ARLogSession();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            v69 = (objc_class *)objc_opt_class();
            NSStringFromClass(v69);
            id v70 = (id)objc_claimAutoreleasedReturnValue();
            id v71 = *v1;
            uint64_t v72 = *((void *)*v1 + 40);
            *(_DWORD *)buf = 138543874;
            id v169 = v70;
            __int16 v170 = 2048;
            id v171 = v71;
            __int16 v172 = 2048;
            uint64_t v173 = v72;
            _os_log_impl(&dword_1B88A2000, v68, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CL first DEM value %f seconds", buf, 0x20u);
          }
        }
        [v9 transform];
        double v74 = acosf(-v73) * 0.318309886 * 180.0;
        *(float *)&double v74 = v74;
        BOOL v75 = +[ARGeoTrackingTechnique isCameraUp:v74];
        BOOL v76 = v75;
        v77 = (id *)*v1;
        double v78 = *((double *)*v1 + 41);
        if (v78 == 0.0 && v75)
        {
          [v77[7] timeIntervalSinceNow];
          *((double *)*v1 + 41) = -v79;
          v80 = _ARLogSession();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          {
            v81 = (objc_class *)objc_opt_class();
            NSStringFromClass(v81);
            id v82 = (id)objc_claimAutoreleasedReturnValue();
            id v83 = *v1;
            uint64_t v84 = *((void *)*v1 + 41);
            *(_DWORD *)buf = 138543874;
            id v169 = v82;
            __int16 v170 = 2048;
            id v171 = v83;
            __int16 v172 = 2048;
            uint64_t v173 = v84;
            _os_log_impl(&dword_1B88A2000, v80, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Camera first up %f seconds", buf, 0x20u);
          }
          v77 = (id *)*v1;
          double v78 = *((double *)*v1 + 41);
        }
        if (v78 > 0.0)
        {
          [v77[7] timeIntervalSinceNow];
          BOOL v86 = *((double *)*v1 + 42) != 0.0;
          if (-v85 - *((double *)*v1 + 41) <= 1.0) {
            BOOL v86 = 1;
          }
          if (!v86 && !v76)
          {
            [*((id *)*v1 + 7) timeIntervalSinceNow];
            *((double *)*v1 + 42) = -v87;
            v88 = _ARLogSession();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
            {
              v89 = (objc_class *)objc_opt_class();
              NSStringFromClass(v89);
              id v90 = (id)objc_claimAutoreleasedReturnValue();
              id v91 = *v1;
              uint64_t v92 = *((void *)*v1 + 42);
              *(_DWORD *)buf = 138543874;
              id v169 = v90;
              __int16 v170 = 2048;
              id v171 = v91;
              __int16 v172 = 2048;
              uint64_t v173 = v92;
              _os_log_impl(&dword_1B88A2000, v88, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Camera down again %f seconds", buf, 0x20u);
            }
          }
        }
        v93 = [*(id *)(a1 + 40) vlState];
        int v94 = [v93 hasStartedAvailabilityCheck];
        uint64_t v95 = *(void *)(a1 + 32);
        if (*(double *)(v95 + 344) == 0.0 && v94)
        {
          [*(id *)(v95 + 56) timeIntervalSinceNow];
          *((double *)*v1 + 43) = -v96;
          v97 = _ARLogSession();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
          {
            v98 = (objc_class *)objc_opt_class();
            NSStringFromClass(v98);
            id v99 = (id)objc_claimAutoreleasedReturnValue();
            id v100 = *v1;
            uint64_t v101 = *((void *)*v1 + 43);
            *(_DWORD *)buf = 138543874;
            id v169 = v99;
            __int16 v170 = 2048;
            id v171 = v100;
            __int16 v172 = 2048;
            uint64_t v173 = v101;
            _os_log_impl(&dword_1B88A2000, v97, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Called VL available started %f seconds", buf, 0x20u);
          }
        }
        int v102 = [v93 hasReturnedAvailabilityCheck];
        if (*((double *)*v1 + 44) == 0.0 && v102)
        {
          [*((id *)*v1 + 7) timeIntervalSinceNow];
          *((double *)*v1 + 44) = -v103;
          v104 = _ARLogSession();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
          {
            v105 = (objc_class *)objc_opt_class();
            NSStringFromClass(v105);
            id v106 = (id)objc_claimAutoreleasedReturnValue();
            id v107 = *v1;
            uint64_t v108 = *((void *)*v1 + 43);
            *(_DWORD *)buf = 138543874;
            id v169 = v106;
            __int16 v170 = 2048;
            id v171 = v107;
            __int16 v172 = 2048;
            uint64_t v173 = v108;
            _os_log_impl(&dword_1B88A2000, v104, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Called VL available returned %f seconds", buf, 0x20u);
          }
        }
        int v109 = [v93 hasStartedLocalization];
        if (*((double *)*v1 + 45) == 0.0 && v109)
        {
          [*((id *)*v1 + 7) timeIntervalSinceNow];
          *((double *)*v1 + 45) = -v110;
          v111 = _ARLogSession();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
          {
            v112 = (objc_class *)objc_opt_class();
            NSStringFromClass(v112);
            id v113 = (id)objc_claimAutoreleasedReturnValue();
            id v114 = *v1;
            uint64_t v115 = *((void *)*v1 + 45);
            *(_DWORD *)buf = 138543874;
            id v169 = v113;
            __int16 v170 = 2048;
            id v171 = v114;
            __int16 v172 = 2048;
            uint64_t v173 = v115;
            _os_log_impl(&dword_1B88A2000, v111, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Called VL localization started %f seconds", buf, 0x20u);
          }
        }
        int v116 = [v93 hasReturnedLocalization];
        if (*((double *)*v1 + 46) == 0.0 && v116)
        {
          [*((id *)*v1 + 7) timeIntervalSinceNow];
          *((double *)*v1 + 46) = -v117;
          v118 = _ARLogSession();
          if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
          {
            v119 = (objc_class *)objc_opt_class();
            NSStringFromClass(v119);
            id v120 = (id)objc_claimAutoreleasedReturnValue();
            id v121 = *v1;
            uint64_t v122 = *((void *)*v1 + 46);
            *(_DWORD *)buf = 138543874;
            id v169 = v120;
            __int16 v170 = 2048;
            id v171 = v121;
            __int16 v172 = 2048;
            uint64_t v173 = v122;
            _os_log_impl(&dword_1B88A2000, v118, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Called VL localization returned %f seconds", buf, 0x20u);
          }
        }
        char v123 = [v20 failureReasons];
        if (*((double *)*v1 + 47) == 0.0 && (v123 & 0x10) != 0)
        {
          [*((id *)*v1 + 7) timeIntervalSinceNow];
          *((double *)*v1 + 47) = -v124;
          v125 = _ARLogSession();
          if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
          {
            v126 = (objc_class *)objc_opt_class();
            NSStringFromClass(v126);
            id v127 = (id)objc_claimAutoreleasedReturnValue();
            id v128 = *v1;
            uint64_t v129 = *((void *)*v1 + 47);
            *(_DWORD *)buf = 138543874;
            id v169 = v127;
            __int16 v170 = 2048;
            id v171 = v128;
            __int16 v172 = 2048;
            uint64_t v173 = v129;
            _os_log_impl(&dword_1B88A2000, v125, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VL failed to localize after %f seconds", buf, 0x20u);
          }
        }
        BOOL v130 = [v9 trackingState] != 2 && objc_msgSend(v9, "trackingState") != 1;
        if (*((double *)*v1 + 48) == 0.0 && !v130)
        {
          [*((id *)*v1 + 7) timeIntervalSinceNow];
          *((double *)*v1 + 48) = -v131;
          v132 = _ARLogSession();
          if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
          {
            v133 = (objc_class *)objc_opt_class();
            NSStringFromClass(v133);
            id v134 = (id)objc_claimAutoreleasedReturnValue();
            id v135 = *v1;
            uint64_t v136 = *((void *)*v1 + 48);
            *(_DWORD *)buf = 138543874;
            id v169 = v134;
            __int16 v170 = 2048;
            id v171 = v135;
            __int16 v172 = 2048;
            uint64_t v173 = v136;
            _os_log_impl(&dword_1B88A2000, v132, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VIO first pose after %f seconds", buf, 0x20u);
          }
        }
        uint64_t v137 = [v9 trackingState];
        uint64_t v138 = v137;
        v139 = (id *)*v1;
        double v140 = *((double *)*v1 + 49);
        if (v140 == 0.0 && v137 == 2)
        {
          [v139[7] timeIntervalSinceNow];
          *((double *)*v1 + 49) = -v141;
          v142 = _ARLogSession();
          if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
          {
            v143 = (objc_class *)objc_opt_class();
            NSStringFromClass(v143);
            id v144 = (id)objc_claimAutoreleasedReturnValue();
            id v145 = *v1;
            uint64_t v146 = *((void *)*v1 + 49);
            *(_DWORD *)buf = 138543874;
            id v169 = v144;
            __int16 v170 = 2048;
            id v171 = v145;
            __int16 v172 = 2048;
            uint64_t v173 = v146;
            _os_log_impl(&dword_1B88A2000, v142, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VIO first normal pose after %f seconds", buf, 0x20u);
          }
          v139 = (id *)*v1;
          double v140 = *((double *)*v1 + 49);
        }
        if (v140 > 0.0)
        {
          [v139[7] timeIntervalSinceNow];
          v148 = (id *)*v1;
          if (*((double *)*v1 + 50) == 0.0 && -v147 - *((double *)v148 + 49) > 1.0 && v138 != 2)
          {
            [v148[7] timeIntervalSinceNow];
            *((double *)*v1 + 50) = -v149;
            v150 = _ARLogSession();
            if (os_log_type_enabled(v150, OS_LOG_TYPE_DEBUG))
            {
              v151 = (objc_class *)objc_opt_class();
              NSStringFromClass(v151);
              id v152 = (id)objc_claimAutoreleasedReturnValue();
              id v153 = *v1;
              uint64_t v154 = *((void *)*v1 + 50);
              *(_DWORD *)buf = 138543874;
              id v169 = v152;
              __int16 v170 = 2048;
              id v171 = v153;
              __int16 v172 = 2048;
              uint64_t v173 = v154;
              _os_log_impl(&dword_1B88A2000, v150, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VIO not normal after %f seconds", buf, 0x20u);
            }
          }
        }
        [v9 imageResolution];
        double v156 = v155;
        [v9 imageResolution];
        if (*((double *)*v1 + 51) == 0.0)
        {
          double v158 = v157;
          if (v156 * v157 > 0.0)
          {
            objc_msgSend(*((id *)*v1 + 7), "timeIntervalSinceNow", v156 * v157);
            *((double *)*v1 + 51) = -v159;
            v160 = _ARLogSession();
            if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
            {
              v161 = (objc_class *)objc_opt_class();
              NSStringFromClass(v161);
              id v162 = (id)objc_claimAutoreleasedReturnValue();
              id v163 = *v1;
              uint64_t v164 = *((void *)*v1 + 51);
              *(_DWORD *)buf = 138544386;
              id v169 = v162;
              __int16 v170 = 2048;
              id v171 = v163;
              __int16 v172 = 2048;
              uint64_t v173 = v164;
              __int16 v174 = 2048;
              double v175 = v156;
              __int16 v176 = 2048;
              double v177 = v158;
              _os_log_impl(&dword_1B88A2000, v160, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: first image after %f seconds (%f x %f)", buf, 0x34u);
            }
          }
        }
      }
    }
    v165 = [*(id *)(a1 + 40) worldTrackingState];
    v166 = v165;
    if (v165)
    {
      *((void *)*v1 + 22) = [v165 currentVIOMapSize];
      *((void *)*v1 + 23) = [v166 numberOfCameraSwitches];
      *((void *)*v1 + 24) = [v166 reinitializationAttempts];
    }
    ++*((void *)*v1 + 11);
    if ([v9 trackingState] != 2) {
      ++*((void *)*v1 + 12);
    }
    if ([*((id *)*v1 + 6) isKindOfConfiguration:objc_opt_class()]) {
      [*v1 _recordBadFramePercentageFinal:0];
    }

    goto LABEL_146;
  }
}

id __44__ARSessionMetrics__processFrameProperties___block_invoke_446(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  v8[0] = MEMORY[0x1E4F1CC38];
  v7[0] = @"success";
  v7[1] = @"duration";
  uint64_t v1 = NSNumber;
  [*(id *)(*(void *)(a1 + 32) + 56) timeIntervalSinceNow];
  *(float *)&double v2 = v2;
  *(float *)&double v2 = -*(float *)&v2;
  uint64_t v3 = [v1 numberWithFloat:v2];
  v8[1] = v3;
  v7[2] = @"bundleID";
  uint64_t v4 = bundleID();
  v8[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)recordSaveMap:(int64_t)a3 numberOfFeaturePoints:(unint64_t)a4
{
  uint64_t v7 = reportingQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ARSessionMetrics_recordSaveMap_numberOfFeaturePoints___block_invoke;
  block[3] = &unk_1E6186138;
  void block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(v7, block);
}

uint64_t __56__ARSessionMetrics_recordSaveMap_numberOfFeaturePoints___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__ARSessionMetrics_recordSaveMap_numberOfFeaturePoints___block_invoke_2;
  v3[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  long long v4 = *(_OWORD *)(a1 + 40);
  return [v1 sendEvent:@"com.apple.arkit.ARWorldMap.saving" dictionary:v3];
}

id __56__ARSessionMetrics_recordSaveMap_numberOfFeaturePoints___block_invoke_2(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"mappingStatus";
  double v2 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v8[0] = v2;
  v7[1] = @"numberOfFeaturePoints";
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v8[1] = v3;
  v7[2] = @"bundleID";
  long long v4 = bundleID();
  v8[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)recordRaycast:(id)a3 tracked:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = reportingQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__ARSessionMetrics_recordRaycast_tracked___block_invoke;
  block[3] = &unk_1E6186188;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __42__ARSessionMetrics_recordRaycast_tracked___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__ARSessionMetrics_recordRaycast_tracked___block_invoke_2;
  v3[3] = &unk_1E6186160;
  id v4 = *(id *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);
  [v2 sendEvent:@"com.apple.arkit.ARRaycast" dictionary:v3];
  ++*(void *)(*(void *)(a1 + 32) + 208);
}

id __42__ARSessionMetrics_recordRaycast_tracked___block_invoke_2(uint64_t a1)
{
  void v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"target";
  double v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "target"));
  v9[0] = v2;
  v8[1] = @"alignment";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "targetAlignment"));
  v9[1] = v3;
  v8[2] = @"isTracked";
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v9[2] = v4;
  void v8[3] = @"bundleID";
  char v5 = bundleID();
  v9[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)recordHiResFrameCapture
{
  uint64_t v3 = reportingQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ARSessionMetrics_recordHiResFrameCapture__block_invoke;
  block[3] = &unk_1E61851B0;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __43__ARSessionMetrics_recordHiResFrameCapture__block_invoke(uint64_t result)
{
  return result;
}

- (void)recordCoachingOverlayUsage:(int)a3
{
  char v5 = reportingQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__ARSessionMetrics_recordCoachingOverlayUsage___block_invoke;
  v6[3] = &unk_1E61861B0;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __47__ARSessionMetrics_recordCoachingOverlayUsage___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 224) = *(int *)(result + 40);
  ++*(void *)(*(void *)(result + 32) + 232);
  return result;
}

- (void)reportSessionFailure:(id)a3
{
  id v4 = a3;
  char v5 = reportingQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__ARSessionMetrics_reportSessionFailure___block_invoke;
  void v7[3] = &unk_1E6185160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __41__ARSessionMetrics_reportSessionFailure___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 202) = 1;
  double v2 = [*(id *)(a1 + 40) userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  [*(id *)(*(void *)(a1 + 32) + 56) timeIntervalSinceNow];
  double v5 = -v4;
  id v6 = *(void **)(*(void *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__ARSessionMetrics_reportSessionFailure___block_invoke_2;
  void v8[3] = &unk_1E61861D8;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  double v11 = v5;
  id v7 = v3;
  [v6 sendEvent:@"com.apple.arkit.ARSessionError" dictionary:v8];
}

id __41__ARSessionMetrics_reportSessionFailure___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v12[0] = @"errorCode";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  uint64_t v16 = v3;
  v12[1] = @"underlyingErrorCode";
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    uint64_t v1 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
    double v5 = *(void **)(a1 + 40);
    uint64_t v17 = v1;
    id v13 = @"underlyingErrorDomain";
    if (v5)
    {
      id v6 = [v5 domain];
      char v7 = 0;
    }
    else
    {
      id v6 = &stru_1F120C8F0;
      char v7 = 1;
    }
  }
  else
  {
    uint64_t v17 = &unk_1F1259DE8;
    id v13 = @"underlyingErrorDomain";
    id v6 = &stru_1F120C8F0;
    char v7 = 1;
  }
  v18 = v6;
  v14 = @"duration";
  id v8 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v19 = v8;
  id v15 = @"bundleID";
  id v9 = bundleID();
  v20 = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:v12 count:5];

  if ((v7 & 1) == 0) {
  if (v4)
  }

  return v10;
}

- (void)sessionStopped
{
  uint64_t v3 = reportingQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ARSessionMetrics_sessionStopped__block_invoke;
  block[3] = &unk_1E61851B0;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __34__ARSessionMetrics_sessionStopped__block_invoke(uint64_t a1)
{
  s_isSessionStopped = 1;
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 56) && !*(unsigned char *)(result + 202))
  {
    [(id)result _recordSessionEnd];
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
    return [v3 postDarwinNotification:@"com.apple.arkit.session.pause"];
  }
  return result;
}

- (void)_recordSessionEnd
{
  double v2 = self;
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  [(NSDate *)self->_startDate timeIntervalSinceNow];
  double v4 = -v3;
  double v5 = _ARLogSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = (objc_class *)objc_opt_class();
    char v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543874;
    v142 = v7;
    __int16 v143 = 2048;
    id v144 = v2;
    __int16 v145 = 2048;
    double v146 = v4;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARSession duration seconds: %f", buf, 0x20u);
  }
  startDate = v2->_startDate;
  v2->_startDate = 0;

  id v9 = &off_1B8A2A000;
  if ([(ARConfiguration *)v2->_currentConfiguration isKindOfConfiguration:objc_opt_class()]
    && ![(ARConfiguration *)v2->_currentConfiguration isKindOfConfiguration:objc_opt_class()])
  {
    id v23 = [(ARConfiguration *)v2->_currentConfiguration getAsKindOfConfiguration:objc_opt_class()];
    id v24 = (objc_class *)objc_opt_class();
    uint64_t v25 = NSStringFromClass(v24);
    [(ARSessionMetrics *)v2 _recordBadFramePercentageFinal:1];
    if (v2->_hasInitialWorldMap && v2->_relocalizingToInitialWorldMap)
    {
      reporter = v2->_reporter;
      v137[0] = MEMORY[0x1E4F143A8];
      v137[1] = 3221225472;
      v137[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke;
      v137[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
      *(double *)&v137[4] = v4;
      [(ARSessionMetricsReporting *)reporter sendEvent:@"com.apple.arkit.ARWorldMap.loading" dictionary:v137];
    }
    if (v2->_positionInitialized)
    {
      float v27 = (float)(*(float *)v2->_maxPos - *(float *)v2->_minPos)
          * (float)(*(float *)&v2->_maxPos[8] - *(float *)&v2->_minPos[8]);
      float v28 = *(float *)&v2->_maxPos[4] - *(float *)&v2->_minPos[4];
    }
    else
    {
      float v28 = 0.0;
      float v27 = 0.0;
    }
    v97 = (void *)v25;
    if ([v23 isCollaborationEnabled])
    {
      long long v135 = 0u;
      long long v136 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      uint64_t v34 = v2->_lastUpdatedFrameAnchors;
      uint64_t v35 = [(NSArray *)v34 countByEnumeratingWithState:&v133 objects:v140 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = 0;
        uint64_t v38 = *(void *)v134;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v134 != v38) {
              objc_enumerationMutation(v34);
            }
            objc_opt_class();
            v37 += objc_opt_isKindOfClass() & 1;
          }
          uint64_t v36 = [(NSArray *)v34 countByEnumeratingWithState:&v133 objects:v140 count:16];
        }
        while (v36);
      }
      else
      {
        uint64_t v37 = 0;
      }
    }
    else
    {
      uint64_t v37 = 0;
    }
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    id v63 = v2->_lastUpdatedFrameAnchors;
    uint64_t v64 = [(NSArray *)v63 countByEnumeratingWithState:&v129 objects:v139 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = 0;
      uint64_t v67 = *(void *)v130;
      do
      {
        for (uint64_t j = 0; j != v65; ++j)
        {
          if (*(void *)v130 != v67) {
            objc_enumerationMutation(v63);
          }
          objc_opt_class();
          v66 += objc_opt_isKindOfClass() & 1;
        }
        uint64_t v65 = [(NSArray *)v63 countByEnumeratingWithState:&v129 objects:v139 count:16];
      }
      while (v65);
    }
    else
    {
      uint64_t v66 = 0;
    }

    v69 = v2->_reporter;
    v122[0] = MEMORY[0x1E4F143A8];
    id v9 = &off_1B8A2A000;
    v122[1] = 3221225472;
    v122[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_2;
    v122[3] = &unk_1E6186220;
    v122[4] = v2;
    id v123 = v23;
    float v127 = v27;
    float v128 = v28;
    uint64_t v124 = v37;
    uint64_t v125 = v66;
    double v126 = v4;
    id v70 = v23;
    [(ARSessionMetricsReporting *)v69 sendEvent:@"com.apple.arkit.ARWorldTracking" dictionary:v122];

    goto LABEL_70;
  }
  BOOL v10 = [(ARConfiguration *)v2->_currentConfiguration isKindOfConfiguration:objc_opt_class()];
  currentConfiguration = v2->_currentConfiguration;
  if (v10)
  {
    uint64_t v12 = [(ARConfiguration *)currentConfiguration getAsKindOfConfiguration:objc_opt_class()];
    id v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    id v15 = v2->_reporter;
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_3;
    v120[3] = &unk_1E61860C8;
    id v121 = v12;
    id v16 = v12;
    [(ARSessionMetricsReporting *)v15 sendEvent:@"com.apple.arkit.ARImageTracking" dictionary:v120];
    uint64_t v17 = v121;
LABEL_16:

    goto LABEL_71;
  }
  BOOL v18 = [(ARConfiguration *)currentConfiguration isKindOfConfiguration:objc_opt_class()];
  v19 = v2->_currentConfiguration;
  if (v18)
  {
    v20 = [(ARConfiguration *)v19 getAsKindOfConfiguration:objc_opt_class()];
    uint64_t v21 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v21);
    v22 = v2->_reporter;
    v118[0] = MEMORY[0x1E4F143A8];
    v118[1] = 3221225472;
    v118[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_4;
    v118[3] = &unk_1E61860C8;
    v119 = v20;
    id v16 = v20;
    [(ARSessionMetricsReporting *)v22 sendEvent:@"com.apple.arkit.ARFaceTracking" dictionary:v118];
    uint64_t v17 = v119;
    goto LABEL_16;
  }
  BOOL v29 = [(ARConfiguration *)v19 isKindOfConfiguration:objc_opt_class()];
  v30 = v2->_currentConfiguration;
  if (v29)
  {
    v31 = [(ARConfiguration *)v30 getAsKindOfConfiguration:objc_opt_class()];
    id v32 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v32);
    id v33 = v2->_reporter;
    v116[0] = MEMORY[0x1E4F143A8];
    v116[1] = 3221225472;
    v116[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_5;
    v116[3] = &unk_1E61860C8;
    double v117 = v31;
    id v16 = v31;
    [(ARSessionMetricsReporting *)v33 sendEvent:@"com.apple.arkit.ARBodyTracking" dictionary:v116];
    uint64_t v17 = v117;
    goto LABEL_16;
  }
  if ([(ARConfiguration *)v30 isKindOfConfiguration:objc_opt_class()])
  {
    float32x4_t v40 = (objc_class *)objc_opt_class();
    uint64_t v41 = NSStringFromClass(v40);
    v14 = (void *)v41;
    if (!v2->_frameCount) {
      goto LABEL_71;
    }
    v97 = (void *)v41;
    v98 = v2->_lastUpdatedFrameLocation;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    float v42 = v2->_lastUpdatedFrameAnchors;
    uint64_t v43 = [(NSArray *)v42 countByEnumeratingWithState:&v112 objects:v138 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      double v96 = v2;
      uint64_t v45 = 0;
      unint64_t v46 = 0;
      uint64_t v47 = *(void *)v113;
      double v48 = 0.0;
      double v49 = 1.79769313e308;
      double v50 = 0.0;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v113 != v47) {
            objc_enumerationMutation(v42);
          }
          v52 = *(void **)(*((void *)&v112 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v53 = v52;
            id v54 = objc_alloc(MEMORY[0x1E4F1E5F0]);
            if (v53)
            {
              [v53 locationLLA];
              double v55 = v111;
              [v53 locationLLA];
              *(void *)&double v56 = vextq_s8(v110, v110, 8uLL).u64[0];
            }
            else
            {
              double v55 = 0.0;
              double v56 = 0.0;
            }
            double v57 = (void *)[v54 initWithLatitude:v55 longitude:v56];
            [(CLLocation *)v98 distanceFromLocation:v57];
            double v59 = v58;

            if ([v53 altitudeSource] == 3) {
              ++v45;
            }
            double v50 = v50 + v59;
            if (v49 >= v59) {
              double v49 = v59;
            }
            if (v48 < v59) {
              double v48 = v59;
            }
            ++v46;
          }
        }
        uint64_t v44 = [(NSArray *)v42 countByEnumeratingWithState:&v112 objects:v138 count:16];
      }
      while (v44);

      if (v46) {
        unint64_t v60 = v46;
      }
      else {
        unint64_t v60 = 0;
      }
      if (v46) {
        double v61 = v49;
      }
      else {
        double v61 = 0.0;
      }
      if (v46) {
        double v62 = v50 / (double)v46;
      }
      else {
        double v62 = v50;
      }
      double v2 = v96;
      id v9 = &off_1B8A2A000;
    }
    else
    {

      unint64_t v60 = 0;
      uint64_t v45 = 0;
      double v48 = 0.0;
      double v61 = 0.0;
      double v62 = 0.0;
    }
    BOOL geoTrackingTrueNorthUnavailable = v2->_geoTrackingTrueNorthUnavailable;
    id v83 = _ARLogSession();
    BOOL v84 = os_log_type_enabled(v83, OS_LOG_TYPE_INFO);
    if (geoTrackingTrueNorthUnavailable)
    {
      if (v84)
      {
        double v85 = (objc_class *)objc_opt_class();
        BOOL v86 = NSStringFromClass(v85);
        *(_DWORD *)buf = 138543618;
        v142 = v86;
        __int16 v143 = 2048;
        id v144 = v2;
        double v87 = "%{public}@ <%p>: True North was not available during the session";
LABEL_90:
        _os_log_impl(&dword_1B88A2000, v83, OS_LOG_TYPE_INFO, v87, buf, 0x16u);
      }
    }
    else if (v84)
    {
      v88 = (objc_class *)objc_opt_class();
      BOOL v86 = NSStringFromClass(v88);
      *(_DWORD *)buf = 138543618;
      v142 = v86;
      __int16 v143 = 2048;
      id v144 = v2;
      double v87 = "%{public}@ <%p>: True North was available during the session";
      goto LABEL_90;
    }

    int64x2_t v89 = *(int64x2_t *)&v2->_geoTrackingLowAccuracyFrameCount;
    unint64_t geoTrackingHighAccuracyFrameCount = v2->_geoTrackingHighAccuracyFrameCount;
    unint64_t v91 = vaddvq_s64(v89) + geoTrackingHighAccuracyFrameCount;
    float v92 = 0.0;
    double v93 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vdivq_f64(vcvtq_f64_u64((uint64x2_t)v89), (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v91), 0)), (float64x2_t)vdupq_n_s64(0x4059000000000000uLL))));
    int v94 = v2->_reporter;
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = *((void *)v9 + 505);
    v108[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_462;
    v108[3] = &unk_1E6186248;
    v108[4] = v2;
    *(double *)&v108[5] = v4;
    if (v91)
    {
      float v95 = (double)geoTrackingHighAccuracyFrameCount / (double)v91 * 100.0;
      float v92 = v95;
    }
    v108[6] = v60;
    v108[7] = v45;
    if (!v91) {
      double v93 = 0.0;
    }
    *(double *)&v108[8] = v61;
    *(double *)&v108[9] = v48;
    *(double *)&v108[10] = v62;
    *(double *)&v108[11] = v93;
    float v109 = v92;
    [(ARSessionMetricsReporting *)v94 sendEvent:@"com.apple.arkit.ARGeoTracking" dictionary:v108];

LABEL_70:
    v14 = v97;
    goto LABEL_71;
  }
  if ([(ARConfiguration *)v2->_currentConfiguration isKindOfConfiguration:objc_opt_class()]
    || [(ARConfiguration *)v2->_currentConfiguration isKindOfConfiguration:objc_opt_class()]
    || [(ARConfiguration *)v2->_currentConfiguration isKindOfConfiguration:objc_opt_class()])
  {
    v81 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v81);
  }
  else
  {
    v14 = 0;
  }
LABEL_71:
  id v71 = v2->_reporter;
  v105[0] = MEMORY[0x1E4F143A8];
  uint64_t v72 = *((void *)v9 + 505);
  v105[1] = v72;
  v105[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_2_466;
  v105[3] = &unk_1E61861D8;
  v105[4] = v2;
  id v73 = v14;
  id v106 = v73;
  double v107 = v4;
  [(ARSessionMetricsReporting *)v71 sendEvent:@"com.apple.arkit.session" dictionary:v105];
  double v74 = [(ARConfiguration *)v2->_currentConfiguration videoFormat];
  BOOL v75 = v74;
  if (v74)
  {
    BOOL v76 = v2->_reporter;
    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = v72;
    v101[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_3_467;
    v101[3] = &unk_1E6186270;
    id v102 = v74;
    id v103 = v73;
    v104 = v2;
    [(ARSessionMetricsReporting *)v76 sendEvent:@"com.apple.arkit.videoformat" dictionary:v101];
  }
  if (s_replayStats) {
    [(ARSessionMetricsReporting *)v2->_reporter sendEvent:@"com.apple.arkit.ARReplay" dictionary:&__block_literal_global_25];
  }
  if (v2->_coachingOverlayActivationCount)
  {
    v77 = v2->_reporter;
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = v72;
    v100[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_5_473;
    v100[3] = &unk_1E61860C8;
    v100[4] = v2;
    [(ARSessionMetricsReporting *)v77 sendEvent:@"com.apple.arkit.ARCoachingOverlay" dictionary:v100];
  }
  double v78 = hitTestReportingMap();
  if ([v78 count])
  {
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = v72;
    v99[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_6;
    v99[3] = &unk_1E61862B8;
    v99[4] = v2;
    *(double *)&v99[5] = v4;
    [v78 enumerateKeysAndObjectsUsingBlock:v99];
  }
  double v79 = v2->_currentConfiguration;
  v2->_currentConfiguration = 0;

  v2->_sessionWasThrottled = 0;
  v80 = (void *)s_replayStats;
  s_replayStats = 0;

  v2->_coachingOverlayActivationCount = 0;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke(uint64_t a1)
{
  void v7[3] = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F1CC28];
  v6[0] = @"success";
  v6[1] = @"duration";
  double v1 = *(double *)(a1 + 32);
  *(float *)&double v1 = v1;
  double v2 = [NSNumber numberWithFloat:v1];
  v7[1] = v2;
  v6[2] = @"bundleID";
  double v3 = bundleID();
  v7[2] = v3;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_2(uint64_t a1, double a2)
{
  v48[27] = *MEMORY[0x1E4F143B8];
  v47[0] = @"area";
  LODWORD(a2) = *(_DWORD *)(a1 + 72);
  unint64_t v46 = [NSNumber numberWithFloat:a2];
  v48[0] = v46;
  v47[1] = @"badFramePercentage10s";
  LODWORD(v3) = *(_DWORD *)(*(void *)(a1 + 32) + 24);
  uint64_t v45 = [NSNumber numberWithFloat:v3];
  v48[1] = v45;
  v47[2] = @"badFramePercentage60s";
  LODWORD(v4) = *(_DWORD *)(*(void *)(a1 + 32) + 28);
  uint64_t v44 = [NSNumber numberWithFloat:v4];
  v48[2] = v44;
  v47[3] = @"badFramePercentageMoreThan60s";
  LODWORD(v5) = *(_DWORD *)(*(void *)(a1 + 32) + 32);
  uint64_t v43 = [NSNumber numberWithFloat:v5];
  v48[3] = v43;
  v47[4] = @"collaborativeSessionEnabled";
  float v42 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isCollaborationEnabled"));
  v48[4] = v42;
  v47[5] = @"collaborativeSessionMaximumNumberOfUsers";
  uint64_t v41 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v48[5] = v41;
  v47[6] = @"environmentTexturingHdrEnabled";
  float32x4_t v40 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "wantsHDREnvironmentTextures"));
  v48[6] = v40;
  v47[7] = @"environmentTexturingMode";
  v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "environmentTexturing"));
  v48[7] = v39;
  v47[8] = @"frameSemantics";
  uint64_t v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "frameSemantics"));
  v48[8] = v38;
  v47[9] = @"heightDelta";
  LODWORD(v6) = *(_DWORD *)(a1 + 76);
  uint64_t v37 = [NSNumber numberWithFloat:v6];
  v48[9] = v37;
  v47[10] = @"maximumNumberOfTrackedImages";
  uint64_t v36 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfTrackedImages"));
  v48[10] = v36;
  v47[11] = @"numberOfDetectedPlanes";
  *(float *)&double v7 = (float)*(unint64_t *)(a1 + 56);
  uint64_t v35 = [NSNumber numberWithFloat:v7];
  v48[11] = v35;
  v47[12] = @"numberOfDetectionImages";
  id v8 = NSNumber;
  uint64_t v34 = [*(id *)(a1 + 40) detectionImages];
  *(float *)&double v9 = (float)(unint64_t)[v34 count];
  id v33 = [v8 numberWithFloat:v9];
  v48[12] = v33;
  v47[13] = @"numberOfDetectionObjects";
  BOOL v10 = NSNumber;
  id v32 = [*(id *)(a1 + 40) detectionObjects];
  *(float *)&double v11 = (float)(unint64_t)[v32 count];
  v31 = [v10 numberWithFloat:v11];
  v48[13] = v31;
  v47[14] = @"numberOfRaycasts";
  v30 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 208)];
  v48[14] = v30;
  v47[15] = @"planeDetectionMode";
  BOOL v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "planeDetection"));
  v48[15] = v29;
  v47[16] = @"sceneReconstruction";
  float v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "sceneReconstruction"));
  v48[16] = v28;
  v47[17] = @"userFaceTrackingEnabled";
  float v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "userFaceTrackingEnabled"));
  v48[17] = v27;
  v47[18] = @"vioInitializationTime";
  double v12 = *(double *)(*(void *)(a1 + 32) + 104);
  *(float *)&double v12 = v12;
  uint64_t v26 = [NSNumber numberWithFloat:v12];
  v48[18] = v26;
  v47[19] = @"automaticImageScaleEstimationEnabled";
  id v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "automaticImageScaleEstimationEnabled"));
  v48[19] = v13;
  v47[20] = @"bundleID";
  v14 = bundleID();
  v48[20] = v14;
  v47[21] = @"numberOfCameraSwitches";
  id v15 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 184)];
  v48[21] = v15;
  v47[22] = @"numberOfReinitializationAttempts";
  id v16 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 192)];
  v48[22] = v16;
  v47[23] = @"vioMapSize";
  uint64_t v17 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 176)];
  v48[23] = v17;
  v47[24] = @"timeToThrottle";
  uint64_t v19 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v19 + 17)) {
    LODWORD(v18) = *(_DWORD *)(v19 + 20);
  }
  else {
    LODWORD(v18) = -1.0;
  }
  v20 = [NSNumber numberWithFloat:v18];
  v48[24] = v20;
  v47[25] = @"duration";
  double v21 = *(double *)(a1 + 64);
  *(float *)&double v21 = v21;
  v22 = [NSNumber numberWithFloat:v21];
  v48[25] = v22;
  v47[26] = @"appClipCodeTrackingEnabled";
  id v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "appClipCodeTrackingEnabled"));
  v48[26] = v23;
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:27];

  return v24;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_3(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"numberOfTrackingImages";
  double v2 = NSNumber;
  double v3 = [*(id *)(a1 + 32) trackingImages];
  *(float *)&double v4 = (float)(unint64_t)[v3 count];
  double v5 = [v2 numberWithFloat:v4];
  v11[0] = v5;
  v10[1] = @"maximumNumberOfTrackedImages";
  double v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "maximumNumberOfTrackedImages"));
  v11[1] = v6;
  v10[2] = @"bundleID";
  double v7 = bundleID();
  v11[2] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_4(uint64_t a1)
{
  void v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"maximumNumberOfTrackedFaces";
  double v2 = NSNumber;
  *(float *)&double v3 = (float)[*(id *)(a1 + 32) maximumNumberOfTrackedFaces];
  double v4 = [v2 numberWithFloat:v3];
  v10[0] = v4;
  v9[1] = @"worldTrackingEnabled";
  double v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "isWorldTrackingEnabled"));
  v10[1] = v5;
  v9[2] = @"bundleID";
  double v6 = bundleID();
  v10[2] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_5(uint64_t a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"automaticSkeletonScaleEstimationEnabled";
  double v1 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "automaticSkeletonScaleEstimationEnabled"));
  v5[1] = @"bundleID";
  v6[0] = v1;
  double v2 = bundleID();
  v6[1] = v2;
  double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_462(uint64_t a1)
{
  v58[30] = *MEMORY[0x1E4F143B8];
  v57[0] = @"localized";
  double v56 = [NSNumber numberWithBool:*(double *)(*(void *)(a1 + 32) + 256) > 0.0];
  v58[0] = v56;
  v57[1] = @"trueNorthUnavailable";
  double v55 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 241)];
  v58[1] = v55;
  v57[2] = @"failureReason";
  id v54 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 296)];
  v58[2] = v54;
  v57[3] = @"initializationTime";
  double v2 = *(double *)(*(void *)(a1 + 32) + 248);
  *(float *)&double v2 = v2;
  id v53 = [NSNumber numberWithFloat:v2];
  v58[3] = v53;
  v57[4] = @"localizationTime";
  double v3 = *(double *)(*(void *)(a1 + 32) + 256);
  *(float *)&double v3 = v3;
  v52 = [NSNumber numberWithFloat:v3];
  v58[4] = v52;
  v57[5] = @"clFirstGps";
  double v4 = *(double *)(*(void *)(a1 + 32) + 304);
  *(float *)&double v4 = v4;
  double v51 = [NSNumber numberWithFloat:v4];
  v58[5] = v51;
  v57[6] = @"clFirstNonGps";
  double v5 = *(double *)(*(void *)(a1 + 32) + 312);
  *(float *)&double v5 = v5;
  double v50 = [NSNumber numberWithFloat:v5];
  v58[6] = v50;
  v57[7] = @"clFirstDem";
  double v6 = *(double *)(*(void *)(a1 + 32) + 320);
  *(float *)&double v6 = v6;
  double v49 = [NSNumber numberWithFloat:v6];
  v58[7] = v49;
  v57[8] = @"angleFirstUp";
  double v7 = *(double *)(*(void *)(a1 + 32) + 328);
  *(float *)&double v7 = v7;
  double v48 = [NSNumber numberWithFloat:v7];
  v58[8] = v48;
  v57[9] = @"angleBackToDown";
  double v8 = *(double *)(*(void *)(a1 + 32) + 336);
  *(float *)&double v8 = v8;
  uint64_t v47 = [NSNumber numberWithFloat:v8];
  v58[9] = v47;
  v57[10] = @"vlBeforeAvailabilityCall";
  double v9 = *(double *)(*(void *)(a1 + 32) + 344);
  *(float *)&double v9 = v9;
  unint64_t v46 = [NSNumber numberWithFloat:v9];
  v58[10] = v46;
  v57[11] = @"vlAfterAvailabilityCall";
  double v10 = *(double *)(*(void *)(a1 + 32) + 352);
  *(float *)&double v10 = v10;
  uint64_t v45 = [NSNumber numberWithFloat:v10];
  v58[11] = v45;
  v57[12] = @"vlBeforeLocalizationCall";
  double v11 = *(double *)(*(void *)(a1 + 32) + 360);
  *(float *)&double v11 = v11;
  uint64_t v44 = [NSNumber numberWithFloat:v11];
  v58[12] = v44;
  v57[13] = @"vlAfterLocalizationCall";
  double v12 = *(double *)(*(void *)(a1 + 32) + 368);
  *(float *)&double v12 = v12;
  uint64_t v43 = [NSNumber numberWithFloat:v12];
  v58[13] = v43;
  v57[14] = @"vlFirstNonLocalized";
  double v13 = *(double *)(*(void *)(a1 + 32) + 376);
  *(float *)&double v13 = v13;
  float v42 = [NSNumber numberWithFloat:v13];
  v58[14] = v42;
  v57[15] = @"vioFirstPose";
  double v14 = *(double *)(*(void *)(a1 + 32) + 384);
  *(float *)&double v14 = v14;
  uint64_t v41 = [NSNumber numberWithFloat:v14];
  v58[15] = v41;
  v57[16] = @"vioFirstNormalPose";
  double v15 = *(double *)(*(void *)(a1 + 32) + 392);
  *(float *)&double v15 = v15;
  float32x4_t v40 = [NSNumber numberWithFloat:v15];
  v58[16] = v40;
  v57[17] = @"vioBackToLimited";
  double v16 = *(double *)(*(void *)(a1 + 32) + 400);
  *(float *)&double v16 = v16;
  v39 = [NSNumber numberWithFloat:v16];
  v58[17] = v39;
  v57[18] = @"firstImage";
  double v17 = *(double *)(*(void *)(a1 + 32) + 408);
  *(float *)&double v17 = v17;
  uint64_t v38 = [NSNumber numberWithFloat:v17];
  v58[18] = v38;
  v57[19] = @"sessionEnd";
  double v18 = *(double *)(a1 + 40);
  *(float *)&double v18 = v18;
  uint64_t v37 = [NSNumber numberWithFloat:v18];
  v58[19] = v37;
  v57[20] = @"numberOfLocalizations";
  uint64_t v19 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 288)];
  v58[20] = v19;
  v57[21] = @"numberOfGeoAnchors";
  v20 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v58[21] = v20;
  v57[22] = @"numberOfGeoAnchorsWithUserDefinedAltitude";
  double v21 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v58[22] = v21;
  v57[23] = @"minGeoAnchorDistance";
  double v22 = *(double *)(a1 + 64);
  *(float *)&double v22 = v22;
  id v23 = [NSNumber numberWithFloat:v22];
  v58[23] = v23;
  v57[24] = @"maxGeoAnchorDistance";
  double v24 = *(double *)(a1 + 72);
  *(float *)&double v24 = v24;
  uint64_t v25 = [NSNumber numberWithFloat:v24];
  v58[24] = v25;
  v57[25] = @"meanGeoAnchorDistance";
  double v26 = *(double *)(a1 + 80);
  *(float *)&double v26 = v26;
  float v27 = [NSNumber numberWithFloat:v26];
  v58[25] = v27;
  v57[26] = @"lowAccuracyFramePercentage";
  LODWORD(v28) = *(_DWORD *)(a1 + 88);
  BOOL v29 = [NSNumber numberWithFloat:v28];
  v58[26] = v29;
  v57[27] = @"mediumAccuracyFramePercentage";
  LODWORD(v30) = *(_DWORD *)(a1 + 92);
  v31 = [NSNumber numberWithFloat:v30];
  v58[27] = v31;
  v57[28] = @"highAccuracyFramePercentage";
  LODWORD(v32) = *(_DWORD *)(a1 + 96);
  id v33 = [NSNumber numberWithFloat:v32];
  v58[28] = v33;
  v57[29] = @"bundleID";
  uint64_t v34 = bundleID();
  v58[29] = v34;
  id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:30];

  return v36;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_2_466(uint64_t a1)
{
  v17[7] = *MEMORY[0x1E4F143B8];
  v16[0] = @"autofocus";
  double v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 16)];
  v17[0] = v2;
  v16[1] = @"configuration";
  double v3 = *(void **)(a1 + 40);
  double v4 = v3;
  if (!v3)
  {
    double v4 = NSStringFromClass(*(Class *)(*(void *)(a1 + 32) + 40));
  }
  v17[1] = v4;
  v16[2] = @"duration";
  double v5 = *(double *)(a1 + 48);
  *(float *)&double v5 = v5;
  uint64_t v6 = [NSNumber numberWithFloat:v5];
  double v7 = (void *)v6;
  uint64_t v8 = s_reportedRendererString;
  if (!s_reportedRendererString) {
    uint64_t v8 = s_rendererString;
  }
  v17[2] = v6;
  v17[3] = v8;
  v16[3] = @"renderer";
  v16[4] = @"bundleID";
  double v9 = bundleID();
  v17[4] = v9;
  v16[5] = @"frameSemantics";
  double v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "frameSemantics"));
  v17[5] = v10;
  v16[6] = @"timeToThrottle";
  uint64_t v12 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v12 + 17)) {
    LODWORD(v11) = *(_DWORD *)(v12 + 20);
  }
  else {
    LODWORD(v11) = -1.0;
  }
  double v13 = [NSNumber numberWithFloat:v11];
  v17[6] = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:7];

  if (!v3) {
  return v14;
  }
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_3_467(uint64_t a1)
{
  v18[8] = *MEMORY[0x1E4F143B8];
  v17[0] = @"captureDevicePosition";
  double v2 = NSStringFromAVCaptureDevicePosition([*(id *)(a1 + 32) captureDevicePosition]);
  v18[0] = v2;
  v17[1] = @"configuration";
  double v3 = *(void **)(a1 + 40);
  double v4 = v3;
  if (!v3)
  {
    double v4 = NSStringFromClass(*(Class *)(*(void *)(a1 + 48) + 40));
  }
  v18[1] = v4;
  v17[2] = @"imageResolution";
  double v5 = NSString;
  [*(id *)(a1 + 32) imageResolution];
  uint64_t v7 = v6;
  [*(id *)(a1 + 32) imageResolution];
  double v9 = objc_msgSend(v5, "stringWithFormat:", @"%.0fx%.0f", v7, v8);
  v18[2] = v9;
  v17[3] = @"framesPerSecond";
  double v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "framesPerSecond"));
  v18[3] = v10;
  v17[4] = @"videoHDRSupported";
  double v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isVideoHDRSupported"));
  v18[4] = v11;
  v17[5] = @"nonBinned";
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isRecommendedForHighResolutionFrameCapturing"));
  v18[5] = v12;
  v17[6] = @"hiResFrameCaptureCount";
  double v13 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 48) + 216)];
  v18[6] = v13;
  v17[7] = @"bundleID";
  double v14 = bundleID();
  v18[7] = v14;
  double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:8];

  if (!v3) {
  return v15;
  }
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_4_472()
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"format";
  unsigned int v0 = [(id)s_replayStats recordingFormat];
  if (v0 > 7) {
    double v1 = @"Unknown";
  }
  else {
    double v1 = off_1E61862F0[v0];
  }
  v10[0] = v1;
  v9[1] = @"recordingDevice";
  double v2 = [(id)s_replayStats deviceModel];
  v10[1] = v2;
  v9[2] = @"recordingARKitVersion";
  double v3 = [(id)s_replayStats arkitVersion];
  v10[2] = v3;
  void v9[3] = @"recordingOSVersion";
  double v4 = [(id)s_replayStats osVersion];
  void v10[3] = v4;
  void v9[4] = @"fileName";
  double v5 = [(id)s_replayStats fileName];
  void v10[4] = v5;
  void v9[5] = @"bundleID";
  uint64_t v6 = bundleID();
  v10[5] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];

  return v7;
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_5_473(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"activationCount";
  double v2 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 232)];
  v8[0] = v2;
  v7[1] = @"goal";
  double v3 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 224)];
  v8[1] = v3;
  v7[2] = @"bundleID";
  double v4 = bundleID();
  v8[2] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

void __37__ARSessionMetrics__recordSessionEnd__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__ARSessionMetrics__recordSessionEnd__block_invoke_7;
  void v10[3] = &unk_1E61861D8;
  id v11 = v5;
  id v12 = v6;
  uint64_t v13 = *(void *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  [v7 sendEvent:@"com.apple.arkit.ARHitTest" dictionary:v10];
}

id __37__ARSessionMetrics__recordSessionEnd__block_invoke_7(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  double v2 = *(void **)(a1 + 40);
  v12[0] = v3;
  v11[0] = @"type";
  v11[1] = @"numberOfHitTestsPerSecond";
  double v4 = NSNumber;
  [v2 floatValue];
  double v6 = v5 / *(double *)(a1 + 48);
  *(float *)&double v6 = v6;
  uint64_t v7 = [v4 numberWithFloat:v6];
  v12[1] = v7;
  v11[2] = @"bundleID";
  id v8 = bundleID();
  void v12[2] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (void)_recordBadFramePercentageFinal:(BOOL)a3
{
  if (self->_frameCount >= 0xA)
  {
    [(NSDate *)self->_frameStartDate timeIntervalSinceNow];
    if (v5 < -10.0)
    {
      p_sessionTimeForLastBadFrameRecording = &self->_sessionTimeForLastBadFrameRecording;
      if (self->_sessionTimeForLastBadFrameRecording < 10.0)
      {
        uint64_t v7 = 24;
LABEL_8:
        double *p_sessionTimeForLastBadFrameRecording = -v5;
LABEL_9:
        float v8 = (double)self->_badFrameCount / (double)self->_frameCount * 100.0;
        *(float *)((char *)&self->super.isa + v7) = v8;
        return;
      }
    }
    if (v5 >= -60.0) {
      return;
    }
    p_sessionTimeForLastBadFrameRecording = &self->_sessionTimeForLastBadFrameRecording;
    if (self->_sessionTimeForLastBadFrameRecording < 60.0)
    {
      uint64_t v7 = 28;
      goto LABEL_8;
    }
    if (a3)
    {
      uint64_t v7 = 32;
      goto LABEL_9;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedFrameLocation, 0);
  objc_storeStrong((id *)&self->_lastUpdatedFrameAnchors, 0);
  objc_storeStrong((id *)&self->_frameStartDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
}

@end