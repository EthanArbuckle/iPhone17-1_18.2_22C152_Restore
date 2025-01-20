@interface AppleProxAnalytics
- (AppleProxAnalytics)init;
- (BOOL)sendEvent:(id)a3 event:(id)a4;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)aggTimer;
- (double)aggTimeout;
- (float)aggDurationDay;
- (float)aggReflectEstimate;
- (float)aggSignalOnhead;
- (id)_floatToNsIntegerNumber:(float)a3;
- (id)_floatToNsNumber:(float)a3;
- (id)analyticsTestCallback;
- (int64_t)aggBHCallsDay;
- (int64_t)aggCallsDay;
- (int64_t)aggExternalReleases;
- (int64_t)aggHACallsDay;
- (int64_t)aggLongCallsDay;
- (int64_t)aggNumOnheadSamples;
- (int64_t)aggNumReflectSamples;
- (int64_t)aggReleases;
- (int64_t)aggSmudgeReleases;
- (void)aggregateCallEvent:(id *)a3;
- (void)cancel;
- (void)dealloc;
- (void)handleAtlantisProxReleaseEvent:(id *)a3;
- (void)handleCallEvent:(id *)a3;
- (void)handleCurrentReport:(id *)a3;
- (void)handleFaultsReport:(id *)a3 size:(unint64_t)a4;
- (void)handleResidencyReport:(id *)a3 size:(unint64_t)a4;
- (void)resetCallAggregations;
- (void)sendDayEvent;
- (void)setAggBHCallsDay:(int64_t)a3;
- (void)setAggCallsDay:(int64_t)a3;
- (void)setAggDurationDay:(float)a3;
- (void)setAggExternalReleases:(int64_t)a3;
- (void)setAggHACallsDay:(int64_t)a3;
- (void)setAggLongCallsDay:(int64_t)a3;
- (void)setAggNumOnheadSamples:(int64_t)a3;
- (void)setAggNumReflectSamples:(int64_t)a3;
- (void)setAggReflectEstimate:(float)a3;
- (void)setAggReleases:(int64_t)a3;
- (void)setAggSignalOnhead:(float)a3;
- (void)setAggSmudgeReleases:(int64_t)a3;
- (void)setAggTimeout:(double)a3;
- (void)setAggTimer:(id)a3;
- (void)setAnalyticsTestCallback:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation AppleProxAnalytics

- (AppleProxAnalytics)init
{
  v6.receiver = self;
  v6.super_class = (Class)AppleProxAnalytics;
  v2 = [(AppleProxAnalytics *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_aggTimeout = 86400.0;
    [(AppleProxAnalytics *)v2 resetCallAggregations];
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  aggTimer = self->_aggTimer;
  if (aggTimer) {
    dispatch_source_cancel(aggTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)AppleProxAnalytics;
  [(AppleProxAnalytics *)&v4 dealloc];
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
  [(AppleProxAnalytics *)self aggTimeout];

  [(AppleProxAnalytics *)self setAggTimeout:"setAggTimeout:"];
}

- (void)setAggTimeout:(double)a3
{
  self->_aggTimeout = a3;
  aggTimer = self->_aggTimer;
  if (aggTimer) {
    dispatch_source_cancel(aggTimer);
  }
  queue = self->_queue;
  if (queue)
  {
    objc_super v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)queue);
    v7 = self->_aggTimer;
    self->_aggTimer = v6;

    v8 = self->_aggTimer;
    dispatch_time_t v9 = dispatch_walltime(0, (uint64_t)(self->_aggTimeout * 1000000000.0));
    dispatch_source_set_timer(v8, v9, (unint64_t)(self->_aggTimeout * 1000000000.0), 0x3B9ACA00uLL);
    objc_initWeak(&location, self);
    v10 = self->_aggTimer;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_6324;
    v11[3] = &unk_14708;
    objc_copyWeak(&v12, &location);
    dispatch_source_set_event_handler(v10, v11);
    dispatch_resume((dispatch_object_t)self->_aggTimer);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (id)_floatToNsNumber:(float)a3
{
  v5 = +[NSNumber numberWithFloat:v3];
  return v5;
}

- (id)_floatToNsIntegerNumber:(float)a3
{
  v5 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llroundf(a3), v3);
  return v5;
}

- (void)handleCallEvent:(id *)a3
{
  -[AppleProxAnalytics aggregateCallEvent:](self, "aggregateCallEvent:");
  v5 = LoggingProx();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double var0 = a3->var0;
    int var42 = a3->var42;
    *(_DWORD *)buf = 134218240;
    double v70 = var0;
    __int16 v71 = 1024;
    int v72 = var42;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "handleCallPacket: call duration %f release_condition=%u", buf, 0x12u);
  }

  v66 = [@"com.apple.aop.prox." stringByAppendingString:@"call"];
  v67[0] = @"avg_reflect_estimate";
  v65 = +[NSNumber numberWithUnsignedShort:a3->var6];
  v68[0] = v65;
  v67[1] = @"call_duration";
  *(float *)&double v8 = a3->var0;
  v64 = [(AppleProxAnalytics *)self _floatToNsNumber:v8];
  v68[1] = v64;
  v67[2] = @"call_pickups";
  *(float *)&double v9 = a3->var1;
  v63 = [(AppleProxAnalytics *)self _floatToNsNumber:v9];
  v68[2] = v63;
  v67[3] = @"final_temp";
  v62 = +[NSNumber numberWithUnsignedShort:a3->var8];
  v68[3] = v62;
  v67[4] = @"initial_temp";
  v61 = +[NSNumber numberWithUnsignedShort:a3->var7];
  v68[4] = v61;
  v67[5] = @"max_diff_temp_1s";
  v60 = +[NSNumber numberWithUnsignedShort:a3->var12];
  v68[5] = v60;
  v67[6] = @"max_temp";
  v59 = +[NSNumber numberWithUnsignedShort:a3->var9];
  v68[6] = v59;
  v67[7] = @"mean_abs_diff_temp_1s";
  v58 = +[NSNumber numberWithUnsignedShort:a3->var14];
  v68[7] = v58;
  v67[8] = @"mean_temp";
  v57 = +[NSNumber numberWithUnsignedShort:a3->var11];
  v68[8] = v57;
  v67[9] = @"min_diff_temp_1s";
  v56 = +[NSNumber numberWithUnsignedShort:a3->var13];
  v68[9] = v56;
  v67[10] = @"min_in_spec";
  v55 = +[NSNumber numberWithBool:a3->var20];
  v68[10] = v55;
  v67[11] = @"min_temp";
  v54 = +[NSNumber numberWithUnsignedShort:a3->var10];
  v68[11] = v54;
  v67[12] = @"num_temp_samples";
  v53 = +[NSNumber numberWithUnsignedInt:a3->var3];
  v68[12] = v53;
  v67[13] = @"range_temp";
  v52 = +[NSNumber numberWithUnsignedShort:a3->var16];
  v68[13] = v52;
  v67[14] = @"range_temp_time";
  v51 = +[NSNumber numberWithUnsignedShort:a3->var17];
  v68[14] = v51;
  v67[15] = @"std_temp";
  v50 = +[NSNumber numberWithUnsignedShort:a3->var15];
  v68[15] = v50;
  v67[16] = @"temperature_range_int";
  v49 = +[NSNumber numberWithUnsignedShort:a3->var18];
  v68[16] = v49;
  v67[17] = @"temperature_tracking_enabled";
  v48 = +[NSNumber numberWithBool:a3->var21];
  v68[17] = v48;
  v67[18] = @"was_BH";
  v47 = +[NSNumber numberWithBool:a3->var22];
  v68[18] = v47;
  v67[19] = @"was_HA";
  v46 = +[NSNumber numberWithBool:a3->var23];
  v68[19] = v46;
  v67[20] = @"was_SM";
  v45 = +[NSNumber numberWithBool:a3->var24];
  v68[20] = v45;
  v67[21] = @"external_releases";
  v44 = +[NSNumber numberWithUnsignedShort:a3->var19];
  v68[21] = v44;
  v67[22] = @"begin_field_baseline_kcpsps";
  *(float *)&double v10 = a3->var25;
  v43 = [(AppleProxAnalytics *)self _floatToNsNumber:v10];
  v68[22] = v43;
  v67[23] = @"begin_delta_baseline_kcpsps";
  *(float *)&double v11 = a3->var26;
  v42 = [(AppleProxAnalytics *)self _floatToNsNumber:v11];
  v68[23] = v42;
  v67[24] = @"begin_delta_baseline_pct";
  *(float *)&double v12 = a3->var27;
  v41 = [(AppleProxAnalytics *)self _floatToNsNumber:v12];
  v68[24] = v41;
  v67[25] = @"end_field_baseline_kcpsps";
  *(float *)&double v13 = a3->var28;
  v40 = [(AppleProxAnalytics *)self _floatToNsNumber:v13];
  v68[25] = v40;
  v67[26] = @"end_delta_baseline_kcpsps";
  *(float *)&double v14 = a3->var29;
  v39 = [(AppleProxAnalytics *)self _floatToNsNumber:v14];
  v68[26] = v39;
  v67[27] = @"end_delta_baseline_pct";
  *(float *)&double v15 = a3->var30;
  v38 = [(AppleProxAnalytics *)self _floatToNsNumber:v15];
  v68[27] = v38;
  v67[28] = @"max_amb_off_head";
  *(float *)&double v16 = a3->var31;
  v37 = [(AppleProxAnalytics *)self _floatToNsNumber:v16];
  v68[28] = v37;
  v67[29] = @"max_range_trigger_mm";
  *(float *)&double v17 = a3->var33;
  v36 = [(AppleProxAnalytics *)self _floatToNsNumber:v17];
  v68[29] = v36;
  v67[30] = @"min_range_trigger_mm";
  *(float *)&double v18 = a3->var34;
  v35 = [(AppleProxAnalytics *)self _floatToNsNumber:v18];
  v68[30] = v35;
  v67[31] = @"mean_range_trigger_mm";
  *(float *)&double v19 = a3->var35;
  v20 = [(AppleProxAnalytics *)self _floatToNsNumber:v19];
  v68[31] = v20;
  v67[32] = @"max_ambient_trigger_kcpsps";
  *(float *)&double v21 = a3->var36;
  v22 = [(AppleProxAnalytics *)self _floatToNsNumber:v21];
  v68[32] = v22;
  v67[33] = @"min_signal_trigger_kcpsps";
  *(float *)&double v23 = a3->var37;
  v24 = [(AppleProxAnalytics *)self _floatToNsNumber:v23];
  v68[33] = v24;
  v67[34] = @"max_range_release_mm";
  *(float *)&double v25 = a3->var38;
  v26 = [(AppleProxAnalytics *)self _floatToNsNumber:v25];
  v68[34] = v26;
  v67[35] = @"min_range_release_mm";
  *(float *)&double v27 = a3->var39;
  v28 = [(AppleProxAnalytics *)self _floatToNsNumber:v27];
  v68[35] = v28;
  v67[36] = @"mean_range_release_mm";
  *(float *)&double v29 = a3->var40;
  v30 = [(AppleProxAnalytics *)self _floatToNsNumber:v29];
  v68[36] = v30;
  v67[37] = @"max_ambient_release_kcpsps";
  *(float *)&double v31 = a3->var41;
  v32 = [(AppleProxAnalytics *)self _floatToNsNumber:v31];
  v68[37] = v32;
  v67[38] = @"release_condition_v2";
  v33 = +[NSNumber numberWithUnsignedChar:a3->var42];
  v68[38] = v33;
  v34 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:39];

  [(AppleProxAnalytics *)self sendEvent:v66 event:v34];
}

- (void)handleResidencyReport:(id *)a3 size:(unint64_t)a4
{
  v7 = [@"com.apple.aop.prox." stringByAppendingString:@"mode_residency"];
  double v8 = LoggingProx();
  unint64_t v9 = a4 - 1;
  unint64_t v10 = (a4 - 1) >> 2;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v20 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "handleResidencyReport: %zu modes", buf, 0xCu);
  }

  if (v9 >= 4)
  {
    uint64_t v11 = 0;
    if (v10 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v10;
    }
    double v13 = &a3->var0 + 1;
    do
    {
      v17[0] = @"residency";
      double v14 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)&v13[4 * v11], @"residency"];
      v17[1] = @"mode";
      v18[0] = v14;
      double v15 = +[NSNumber numberWithUnsignedLong:v11];
      v18[1] = v15;
      double v16 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

      [(AppleProxAnalytics *)self sendEvent:v7 event:v16];
      ++v11;
    }
    while (v12 != v11);
  }
}

- (void)handleFaultsReport:(id *)a3 size:(unint64_t)a4
{
  p_var2 = &a3->var2;
  BOOL v8 = (unint64_t)a3->var2 + 3 > a4;
  unint64_t v9 = LoggingProx();
  unint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_D614(p_var2, a4, v10);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *p_var2;
      *(_DWORD *)buf = 67109120;
      int v20 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "handleFaultsReport: %u counters", buf, 8u);
    }

    unint64_t v10 = [@"com.apple.aop.prox." stringByAppendingString:@"faults"];
    if (*p_var2)
    {
      unint64_t v12 = 0;
      var3 = a3->var3;
      do
      {
        v17[0] = @"fault_count";
        double v14 = +[NSNumber numberWithUnsignedChar:var3[v12], @"fault_count"];
        v17[1] = @"fault_type";
        v18[0] = v14;
        double v15 = +[NSNumber numberWithUnsignedLong:v12];
        v18[1] = v15;
        double v16 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

        [(AppleProxAnalytics *)self sendEvent:v10 event:v16];
        ++v12;
      }
      while (v12 < *p_var2);
    }
  }
}

- (void)handleCurrentReport:(id *)a3
{
  v5 = [@"com.apple.aop.prox." stringByAppendingString:@"supplyCurrent"];
  objc_super v6 = LoggingProx();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(&a3->var0 + 1);
    int v8 = BYTE1(a3->var1);
    *(_DWORD *)buf = 134218240;
    uint64_t v15 = v7;
    __int16 v16 = 1024;
    int v17 = v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Current reading received - avg: %lld microamps over %u samples", buf, 0x12u);
  }

  unint64_t v9 = +[NSNumber numberWithLongLong:*(void *)(&a3->var0 + 1), @"average_current_ua"];
  v12[1] = @"num_current_samples";
  v13[0] = v9;
  unint64_t v10 = +[NSNumber numberWithUnsignedChar:BYTE1(a3->var1)];
  v13[1] = v10;
  int v11 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  [(AppleProxAnalytics *)self sendEvent:v5 event:v11];
}

- (BOOL)sendEvent:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  analyticsTestCallback = (void (**)(id, id, id))self->_analyticsTestCallback;
  if (analyticsTestCallback) {
    analyticsTestCallback[2](analyticsTestCallback, v6, v7);
  }
  else {
    AnalyticsSendEvent();
  }
  unint64_t v9 = LoggingProx();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_D6A0((uint64_t)v6, (uint64_t)v7, v9);
  }

  return 1;
}

- (void)aggregateCallEvent:(id *)a3
{
  uint64_t var4 = a3->var4;
  if (var4)
  {
    LOWORD(v3) = a3->var6;
    self->_aggReflectEstimate = self->_aggReflectEstimate + (float)((float)v3 * (float)var4);
    self->_aggNumReflectSamples += var4;
  }
  uint64_t var5 = a3->var5;
  if (var5)
  {
    self->_aggSignalOnhead = self->_aggSignalOnhead + (float)(a3->var2 * (float)var5);
    self->_aggNumOnheadSamples += var5;
  }
  float var0 = a3->var0;
  int64_t v7 = self->_aggExternalReleases + a3->var19;
  self->_aggReleases = (uint64_t)(float)(a3->var1 + (float)self->_aggReleases);
  self->_aggExternalReleases = v7;
  self->_aggSmudgeReleases += a3->var32;
  self->_aggDurationDay = var0 + self->_aggDurationDay;
  float v8 = a3->var0;
  if (a3->var0 > 10.0) {
    ++self->_aggCallsDay;
  }
  if (v8 > 300.0) {
    ++self->_aggLongCallsDay;
  }
  if (a3->var22) {
    ++self->_aggBHCallsDay;
  }
  if (a3->var23) {
    ++self->_aggHACallsDay;
  }
}

- (void)resetCallAggregations
{
  *(void *)&self->_aggReflectEstimate = 0;
  self->_aggDurationDay = 0.0;
  *(_OWORD *)&self->_aggNumReflectSamples = 0u;
  *(_OWORD *)&self->_aggReleases = 0u;
  *(_OWORD *)&self->_aggSmudgeReleases = 0u;
  *(_OWORD *)&self->_aggLongCallsDay = 0u;
  self->_aggHACallsDay = 0;
}

- (void)sendDayEvent
{
  unsigned int v3 = LoggingProx();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Send Call Day event", buf, 2u);
  }

  double v25 = [@"com.apple.aop.prox." stringByAppendingString:@"call_day"];
  v27[0] = @"avg_reflect_estimate";
  int64_t aggNumReflectSamples = self->_aggNumReflectSamples;
  if (aggNumReflectSamples) {
    LODWORD(v4) = vcvtas_u32_f32(self->_aggReflectEstimate / (float)aggNumReflectSamples);
  }
  else {
    uint64_t v4 = 0;
  }
  v24 = +[NSNumber numberWithUnsignedInt:v4];
  v28[0] = v24;
  v27[1] = @"avg_signal_onhead";
  *(float *)&double v6 = self->_aggSignalOnhead / (float)self->_aggNumOnheadSamples;
  double v23 = [(AppleProxAnalytics *)self _floatToNsNumber:v6];
  v28[1] = v23;
  v27[2] = @"BH_calls_day";
  v22 = +[NSNumber numberWithInteger:self->_aggBHCallsDay];
  v28[2] = v22;
  v27[3] = @"calls_day";
  if (self->_aggCallsDay >= 50) {
    int64_t aggCallsDay = 50;
  }
  else {
    int64_t aggCallsDay = self->_aggCallsDay;
  }
  double v21 = +[NSNumber numberWithInteger:aggCallsDay];
  v28[3] = v21;
  v27[4] = @"calls_day_f";
  float v8 = +[NSNumber numberWithInteger:self->_aggCallsDay];
  v28[4] = v8;
  v27[5] = @"duration_day";
  *(float *)&double v9 = self->_aggDurationDay;
  unint64_t v10 = [(AppleProxAnalytics *)self _floatToNsNumber:v9];
  v28[5] = v10;
  v27[6] = @"HA_calls_day";
  int v11 = +[NSNumber numberWithInteger:self->_aggHACallsDay];
  v28[6] = v11;
  v27[7] = @"long_calls_day";
  if (self->_aggLongCallsDay >= 50) {
    int64_t aggLongCallsDay = 50;
  }
  else {
    int64_t aggLongCallsDay = self->_aggLongCallsDay;
  }
  double v13 = +[NSNumber numberWithInteger:aggLongCallsDay];
  v28[7] = v13;
  v27[8] = @"perc_external_releases";
  LODWORD(v14) = vcvtas_u32_f32((float)((float)self->_aggExternalReleases * 100.0) / (float)self->_aggReleases);
  uint64_t v15 = +[NSNumber numberWithUnsignedInt:v14];
  v28[8] = v15;
  v27[9] = @"perc_smudge_releases";
  LODWORD(v16) = vcvtas_u32_f32((float)((float)self->_aggSmudgeReleases * 100.0) / (float)self->_aggReleases);
  int v17 = +[NSNumber numberWithUnsignedInt:v16];
  v28[9] = v17;
  v27[10] = @"long_calls_day_f";
  double v18 = +[NSNumber numberWithInteger:self->_aggLongCallsDay];
  v28[10] = v18;
  v27[11] = @"releases";
  double v19 = +[NSNumber numberWithInteger:self->_aggReleases];
  v28[11] = v19;
  int v20 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:12];

  [(AppleProxAnalytics *)self sendEvent:v25 event:v20];
  [(AppleProxAnalytics *)self resetCallAggregations];
}

- (void)handleAtlantisProxReleaseEvent:(id *)a3
{
  v5 = LoggingProx();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double var0 = a3->var0;
    int var1 = a3->var1;
    *(_DWORD *)buf = 134218240;
    double v56 = var0;
    __int16 v57 = 1024;
    int v58 = var1;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "handleAtlantisProxReleasesEvent: call duration %f release_condition=%u", buf, 0x12u);
  }

  if (a3->var1 == 4) {
    +[AppleProxNotificationTTR sendNotificationTTR];
  }
  v52 = [@"com.apple.aop.prox." stringByAppendingString:@"atlantis_release"];
  v53[0] = @"call_duration_in_sec";
  *(float *)&double v8 = a3->var0;
  v51 = [(AppleProxAnalytics *)self _floatToNsNumber:v8];
  v54[0] = v51;
  v53[1] = @"release_condition";
  v50 = +[NSNumber numberWithUnsignedChar:a3->var1];
  v54[1] = v50;
  v53[2] = @"call_begin_field_baseline_na";
  *(float *)&double v9 = a3->var2;
  v49 = [(AppleProxAnalytics *)self _floatToNsNumber:v9];
  v54[2] = v49;
  v53[3] = @"call_begin_ntc_pre_degc";
  *(float *)&double v10 = a3->var3;
  v48 = [(AppleProxAnalytics *)self _floatToNsIntegerNumber:v10];
  v54[3] = v48;
  v53[4] = @"call_begin_rxamb_na";
  *(float *)&double v11 = a3->var4;
  v47 = [(AppleProxAnalytics *)self _floatToNsNumber:v11];
  v54[4] = v47;
  v53[5] = @"call_begin_als_lux_level";
  *(float *)&double v12 = a3->var5;
  v46 = [(AppleProxAnalytics *)self _floatToNsNumber:v12];
  v54[5] = v46;
  v53[6] = @"call_end_field_baseline_na";
  *(float *)&double v13 = a3->var6;
  v45 = [(AppleProxAnalytics *)self _floatToNsNumber:v13];
  v54[6] = v45;
  v53[7] = @"call_end_ntc_pre_degc";
  *(float *)&double v14 = a3->var7;
  v44 = [(AppleProxAnalytics *)self _floatToNsIntegerNumber:v14];
  v54[7] = v44;
  v53[8] = @"call_end_rxamb_na";
  *(float *)&double v15 = a3->var8;
  v43 = [(AppleProxAnalytics *)self _floatToNsNumber:v15];
  v54[8] = v43;
  v53[9] = @"call_end_als_lux_level";
  *(float *)&double v16 = a3->var9;
  v42 = [(AppleProxAnalytics *)self _floatToNsNumber:v16];
  v54[9] = v42;
  v53[10] = @"temp_corrected_xtalk_at_release";
  *(float *)&double v17 = a3->var10;
  v41 = [(AppleProxAnalytics *)self _floatToNsNumber:v17];
  v54[10] = v41;
  v53[11] = @"rxpd_at_release_na";
  *(float *)&double v18 = a3->var11;
  v40 = [(AppleProxAnalytics *)self _floatToNsNumber:v18];
  v54[11] = v40;
  v53[12] = @"als_lux_level_at_release";
  *(float *)&double v19 = a3->var12;
  v39 = [(AppleProxAnalytics *)self _floatToNsNumber:v19];
  v54[12] = v39;
  v53[13] = @"delta_baseline_error_na";
  *(float *)&double v20 = a3->var13;
  v38 = [(AppleProxAnalytics *)self _floatToNsNumber:v20];
  v54[13] = v38;
  v53[14] = @"delta_baseline_error_pct";
  *(float *)&double v21 = a3->var14;
  v22 = [(AppleProxAnalytics *)self _floatToNsNumber:v21];
  v54[14] = v22;
  v53[15] = @"delta_rxpd_at_release_na";
  *(float *)&double v23 = a3->var15;
  v24 = [(AppleProxAnalytics *)self _floatToNsNumber:v23];
  v54[15] = v24;
  v53[16] = @"delta_ntc_degc";
  *(float *)&double v25 = a3->var16;
  v26 = [(AppleProxAnalytics *)self _floatToNsIntegerNumber:v25];
  v54[16] = v26;
  v53[17] = @"delta_rxpd_call_end_na";
  *(float *)&double v27 = a3->var17;
  v28 = [(AppleProxAnalytics *)self _floatToNsNumber:v27];
  v54[17] = v28;
  v53[18] = @"delta_rxpd_release_vs_call_end_na";
  *(float *)&double v29 = a3->var18;
  v30 = [(AppleProxAnalytics *)self _floatToNsNumber:v29];
  v54[18] = v30;
  v53[19] = @"delta_rxamb_na";
  *(float *)&double v31 = a3->var19;
  v32 = [(AppleProxAnalytics *)self _floatToNsNumber:v31];
  v54[19] = v32;
  v53[20] = @"delta_als_lux_end";
  *(float *)&double v33 = a3->var20;
  v34 = [(AppleProxAnalytics *)self _floatToNsNumber:v33];
  v54[20] = v34;
  v53[21] = @"delta_als_lux_at_release";
  *(float *)&double v35 = a3->var21;
  v36 = [(AppleProxAnalytics *)self _floatToNsNumber:v35];
  v54[21] = v36;
  v37 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:22];

  [(AppleProxAnalytics *)self sendEvent:v52 event:v37];
}

- (void)cancel
{
}

- (id)analyticsTestCallback
{
  return self->_analyticsTestCallback;
}

- (void)setAnalyticsTestCallback:(id)a3
{
}

- (double)aggTimeout
{
  return self->_aggTimeout;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_source)aggTimer
{
  return self->_aggTimer;
}

- (void)setAggTimer:(id)a3
{
}

- (float)aggReflectEstimate
{
  return self->_aggReflectEstimate;
}

- (void)setAggReflectEstimate:(float)a3
{
  self->_aggReflectEstimate = a3;
}

- (int64_t)aggNumReflectSamples
{
  return self->_aggNumReflectSamples;
}

- (void)setAggNumReflectSamples:(int64_t)a3
{
  self->_int64_t aggNumReflectSamples = a3;
}

- (float)aggSignalOnhead
{
  return self->_aggSignalOnhead;
}

- (void)setAggSignalOnhead:(float)a3
{
  self->_aggSignalOnhead = a3;
}

- (int64_t)aggNumOnheadSamples
{
  return self->_aggNumOnheadSamples;
}

- (void)setAggNumOnheadSamples:(int64_t)a3
{
  self->_aggNumOnheadSamples = a3;
}

- (int64_t)aggReleases
{
  return self->_aggReleases;
}

- (void)setAggReleases:(int64_t)a3
{
  self->_aggReleases = a3;
}

- (int64_t)aggExternalReleases
{
  return self->_aggExternalReleases;
}

- (void)setAggExternalReleases:(int64_t)a3
{
  self->_aggExternalReleases = a3;
}

- (int64_t)aggSmudgeReleases
{
  return self->_aggSmudgeReleases;
}

- (void)setAggSmudgeReleases:(int64_t)a3
{
  self->_aggSmudgeReleases = a3;
}

- (float)aggDurationDay
{
  return self->_aggDurationDay;
}

- (void)setAggDurationDay:(float)a3
{
  self->_aggDurationDay = a3;
}

- (int64_t)aggCallsDay
{
  return self->_aggCallsDay;
}

- (void)setAggCallsDay:(int64_t)a3
{
  self->_int64_t aggCallsDay = a3;
}

- (int64_t)aggLongCallsDay
{
  return self->_aggLongCallsDay;
}

- (void)setAggLongCallsDay:(int64_t)a3
{
  self->_int64_t aggLongCallsDay = a3;
}

- (int64_t)aggBHCallsDay
{
  return self->_aggBHCallsDay;
}

- (void)setAggBHCallsDay:(int64_t)a3
{
  self->_aggBHCallsDay = a3;
}

- (int64_t)aggHACallsDay
{
  return self->_aggHACallsDay;
}

- (void)setAggHACallsDay:(int64_t)a3
{
  self->_aggHACallsDay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_analyticsTestCallback, 0);
}

@end