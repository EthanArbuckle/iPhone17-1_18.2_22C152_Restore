@interface CBIndicatorAnalyticsModule
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (CBIndicatorAnalyticsModule)initWithQueue:(id)a3 andIndicatorModule:(id)a4;
- (CBIndicatorAnalyticsModule)initWithQueue:(id)a3 andIndicatorModule:(id)a4 andDDFactorMapping:(id)a5 andLuxMapping:(id)a6 andDDFactorEdges:(id)a7 andLuxEdges:(id)a8 andTimerIntervalMs:(double)a9;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (void)dealloc;
- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4;
- (void)indicatorStatsTimerCallback;
- (void)startTimer;
- (void)stopTimer;
- (void)submit;
@end

@implementation CBIndicatorAnalyticsModule

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  if ([a3 isEqualToString:@"TrustedLux"])
  {
    [a4 floatValue];
    self->_trustedLux = v4;
  }
}

- (CBIndicatorAnalyticsModule)initWithQueue:(id)a3 andIndicatorModule:(id)a4
{
  context = (void *)MEMORY[0x1BA9ECAE0]();
  v6 = [(CBIndicatorAnalyticsModule *)self initWithQueue:a3 andIndicatorModule:a4 andDDFactorMapping:&unk_1F1418558 andLuxMapping:&unk_1F1418580 andDDFactorEdges:&unk_1F14183E0 andLuxEdges:&unk_1F14183F8 andTimerIntervalMs:16.6666667];
  return v6;
}

- (CBIndicatorAnalyticsModule)initWithQueue:(id)a3 andIndicatorModule:(id)a4 andDDFactorMapping:(id)a5 andLuxMapping:(id)a6 andDDFactorEdges:(id)a7 andLuxEdges:(id)a8 andTimerIntervalMs:(double)a9
{
  id v39 = self;
  SEL v38 = a2;
  id v37 = a3;
  id v36 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v32 = a8;
  double v31 = a9;
  v30.receiver = self;
  v30.super_class = (Class)CBIndicatorAnalyticsModule;
  id v39 = [(CBModule *)&v30 initWithQueue:a3];
  if (!v39) {
    return (CBIndicatorAnalyticsModule *)v39;
  }
  if (v36)
  {
    id v9 = v36;
    *((void *)v39 + 5) = v9;
    id v10 = v35;
    *((void *)v39 + 7) = v10;
    id v11 = v34;
    *((void *)v39 + 8) = v11;
    v12 = [CBHistogramBuilder2D alloc];
    uint64_t v13 = [(CBHistogramBuilder2D *)v12 initWithFirstDim:v32 andSecondDim:v33];
    *((void *)v39 + 4) = v13;
    if (*((void *)v39 + 4))
    {
      dispatch_source_t v14 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v39 + 3));
      *((void *)v39 + 6) = v14;
      if (*((void *)v39 + 6))
      {
        *((double *)v39 + 10) = v31;
        dispatch_source_set_timer(*((dispatch_source_t *)v39 + 6), 0, (unint64_t)(*((double *)v39 + 10) * 1000000.0), 0);
        v15 = *((void *)v39 + 6);
        uint64_t handler = MEMORY[0x1E4F143A8];
        int v25 = -1073741824;
        int v26 = 0;
        v27 = __144__CBIndicatorAnalyticsModule_initWithQueue_andIndicatorModule_andDDFactorMapping_andLuxMapping_andDDFactorEdges_andLuxEdges_andTimerIntervalMs___block_invoke;
        v28 = &unk_1E6218FE0;
        id v29 = v39;
        dispatch_source_set_event_handler(v15, &handler);
        *((unsigned char *)v39 + 72) = 1;
        *((_DWORD *)v39 + 23) = 0;
        *((_DWORD *)v39 + 22) = 0;
        *((_DWORD *)v39 + 24) = 2143289344;
        return (CBIndicatorAnalyticsModule *)v39;
      }
    }
  }
  os_log_t oslog = 0;
  if (*((void *)v39 + 2))
  {
    v20 = *((void *)v39 + 2);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    v20 = inited;
  }
  os_log_t oslog = v20;
  os_log_type_t type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    log = oslog;
    os_log_type_t v18 = type;
    __os_log_helper_16_0_0(v21);
    _os_log_error_impl(&dword_1BA438000, log, v18, "Failed to create CBIndicatorAnalyticsModule", v21, 2u);
  }

  id v39 = 0;
  return 0;
}

uint64_t __144__CBIndicatorAnalyticsModule_initWithQueue_andIndicatorModule_andDDFactorMapping_andLuxMapping_andDDFactorEdges_andLuxEdges_andTimerIntervalMs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "indicatorStatsTimerCallback", a1, a1);
}

- (void)dealloc
{
  float v4 = self;
  SEL v3 = a2;

  dispatch_source_cancel((dispatch_source_t)v4->_timer);
  if (v4->_timerIsSuspended) {
    dispatch_resume((dispatch_object_t)v4->_timer);
  }
  dispatch_release((dispatch_object_t)v4->_timer);
  v2.receiver = v4;
  v2.super_class = (Class)CBIndicatorAnalyticsModule;
  [(CBModule *)&v2 dealloc];
}

- (void)indicatorStatsTimerCallback
{
  [(CBIndicatorBrightnessModule *)self->_indicatorModule currentDigitalDimmingFactor];
  *(float *)&double v2 = self->_trustedLux;
  [(CBHistogramBuilder2D *)self->_stats pushNumberWeighted:v3 withWeight:self->_timerIntervalMs forFirstDimValue:v2];
}

- (void)startTimer
{
  if (self->_timerIsSuspended)
  {
    self->_sessionStart = mach_time_now_in_milliseconds();
    dispatch_resume((dispatch_object_t)self->_timer);
    self->_timerIsSuspended = 0;
  }
}

- (void)stopTimer
{
  if (!self->_timerIsSuspended)
  {
    dispatch_suspend((dispatch_object_t)self->_timer);
    self->_timerIsSuspended = 1;
    self->_lastSessionDuration = mach_time_now_in_milliseconds() - self->_sessionStart;
    [(CBIndicatorAnalyticsModule *)self submit];
  }
}

- (void)submit
{
  uint64_t v13 = self;
  SEL v12 = a2;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  stats = v13->_stats;
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __36__CBIndicatorAnalyticsModule_submit__block_invoke;
  v8 = &unk_1E621A848;
  id v9 = v13;
  uint64_t v10 = v11;
  -[CBHistogramBuilder2D enumerateBinsUsingBlock:](stats, "enumerateBinsUsingBlock:");
  [(CBHistogramBuilder2D *)v13->_stats reset];
}

uint64_t __36__CBIndicatorAnalyticsModule_submit__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v21 = a1;
  uint64_t v20 = a2;
  uint64_t v19 = a3;
  uint64_t v18 = a4;
  uint64_t v17 = a5;
  uint64_t v16 = a6;
  uint64_t v15 = a1;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __36__CBIndicatorAnalyticsModule_submit__block_invoke_2;
  uint64_t v10 = &unk_1E621A820;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = a4;
  uint64_t v13 = a5;
  uint64_t v14 = a6;
  return +[CBAnalytics send:@".MIB", MEMORY[0x1E4F143A8], 3221225472, __36__CBIndicatorAnalyticsModule_submit__block_invoke_2, &unk_1E621A820, v11, a4, a5, a6, *(void *)(a1 + 40), a1, a6, a5, a4, a3, a2, a1 withBlock];
}

uint64_t __36__CBIndicatorAnalyticsModule_submit__block_invoke_2(void *a1)
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"luxEdge";
  v5[0] = [*(id *)(a1[4] + 64) valueForKey:a1[5]];
  v4[1] = @"ddEdge";
  v5[1] = [*(id *)(a1[4] + 56) valueForKey:a1[6]];
  v4[2] = @"value";
  v5[2] = a1[7];
  v4[3] = @"sessionTime";
  LODWORD(v1) = *(_DWORD *)(a1[4] + 92);
  v5[3] = [NSNumber numberWithFloat:v1];
  v4[4] = @"sessionID";
  v5[4] = a1[8];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
}

- (id)copyPropertyForKey:(id)a3
{
  return 0;
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  if ([a4 isEqualToString:@"SecureIndicatorState"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [a3 unsignedIntegerValue];
      if (v5 == 1)
      {
        [(CBIndicatorAnalyticsModule *)self startTimer];
      }
      else if (v5 == 4)
      {
        [(CBIndicatorAnalyticsModule *)self stopTimer];
      }
    }
  }
  return 1;
}

@end