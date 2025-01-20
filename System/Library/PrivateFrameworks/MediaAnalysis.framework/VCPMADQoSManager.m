@interface VCPMADQoSManager
+ (id)sharedManager;
+ (unsigned)_currentQoSWithTaskID:(unint64_t)a3;
- (VCPMADQoSManager)init;
- (void)_reportDelayForQoS:(unsigned int)a3 withTaskID:(unint64_t)a4;
- (void)_reportQoSChange:(unsigned int)a3 withTaskID:(unint64_t)a4;
- (void)_reportStartingQoS:(unsigned int)a3 withTaskID:(unint64_t)a4;
- (void)disable;
- (void)enable;
- (void)runAsyncBlock:(id)a3 withTaskID:(unint64_t)a4;
- (void)runBlock:(id)a3 withTaskID:(unint64_t)a4;
@end

@implementation VCPMADQoSManager

- (VCPMADQoSManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)VCPMADQoSManager;
  v2 = [(VCPMADQoSManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    atomic_store(0, (unsigned __int8 *)&v2->_enabled);
    v4 = (VCPTimeMeasurement *)objc_alloc_init((Class)VCPTimeMeasurement);
    timer = v3->_timer;
    v3->_timer = v4;

    mach_timebase_info(&v3->_timebase);
  }
  return v3;
}

+ (id)sharedManager
{
  if (qword_100252640 != -1) {
    dispatch_once(&qword_100252640, &stru_10021C928);
  }
  v2 = (void *)qword_100252638;
  return v2;
}

- (void)_reportStartingQoS:(unsigned int)a3 withTaskID:(unint64_t)a4
{
  if ([(VCPTimeMeasurement *)self->_timer started])
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      objc_super v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v7, v8))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "[DAS QoS] manager timer already started; reset", buf, 2u);
      }
    }
    [(VCPTimeMeasurement *)self->_timer reset];
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v9, v10))
    {
      v11 = VCPMAQoSDescription(a3);
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = VCPAnalyticsEventDasDutyCycleKey;
      __int16 v21 = 2112;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[DAS QoS] %@: Starting QoS %@", buf, 0x16u);
    }
  }
  v12 = +[VCPMADCoreAnalyticsManager sharedManager];
  uint64_t v16 = VCPAnalyticsFieldKeyRequestedQoS;
  v13 = VCPMAQoSDescription(a3);
  v18[0] = v13;
  uint64_t v17 = VCPAnalyticsFieldKeyTaskName;
  v14 = VCPTaskIDDescription(a4);
  v18[1] = v14;
  v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:&v16 count:2];
  objc_msgSend(v12, "sendEvent:withAnalytics:", VCPAnalyticsEventDasDutyCycleKey, v15, v16, v17, v18[0]);

  [(VCPTimeMeasurement *)self->_timer start];
}

- (void)_reportQoSChange:(unsigned int)a3 withTaskID:(unint64_t)a4
{
  if ([(VCPTimeMeasurement *)self->_timer started])
  {
    [(VCPTimeMeasurement *)self->_timer stop];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      objc_super v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v7, v8))
      {
        v9 = VCPMAQoSDescription(a3);
        [(VCPTimeMeasurement *)self->_timer elapsedTimeSeconds];
        *(_DWORD *)buf = 138412802;
        uint64_t v21 = VCPAnalyticsEventDasDutyCycleKey;
        __int16 v22 = 2112;
        v23 = v9;
        __int16 v24 = 2048;
        uint64_t v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "[DAS QoS] %@: QoS %@ changed after %f seconds", buf, 0x20u);
      }
    }
    v11 = +[VCPMADCoreAnalyticsManager sharedManager];
    v18[0] = VCPAnalyticsFieldKeyPreviousQoS;
    v12 = VCPMAQoSDescription(a3);
    v19[0] = v12;
    [(VCPTimeMeasurement *)self->_timer elapsedTimeSeconds];
    v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v19[1] = v13;
    void v18[2] = VCPAnalyticsFieldKeyTaskName;
    v14 = VCPTaskIDDescription(a4);
    v19[2] = v14;
    v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
    [v11 sendEvent:VCPAnalyticsEventDasDutyCycleKey withAnalytics:v15];

    [(VCPTimeMeasurement *)self->_timer reset];
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v16 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v16, v17))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[DAS QoS] manager timer not started yet; start;", buf, 2u);
    }
  }
  [(VCPTimeMeasurement *)self->_timer start];
}

- (void)_reportDelayForQoS:(unsigned int)a3 withTaskID:(unint64_t)a4
{
  if ([(VCPTimeMeasurement *)self->_timer started])
  {
    [(VCPTimeMeasurement *)self->_timer stop];
    [(VCPTimeMeasurement *)self->_timer elapsedTimeSeconds];
    double v8 = v7;
    [(VCPTimeMeasurement *)self->_timer start];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v9, v10))
      {
        v11 = VCPTaskIDDescription(a4);
        v12 = VCPMAQoSDescription(a3);
        *(_DWORD *)buf = 138413058;
        uint64_t v20 = VCPAnalyticsEventDasDutyCycleTaskKey;
        __int16 v21 = 2112;
        __int16 v22 = v11;
        __int16 v23 = 2112;
        __int16 v24 = v12;
        __int16 v25 = 2048;
        double v26 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "[DAS QoS] %@: %@ (%@) QoS change delay %f seconds", buf, 0x2Au);
      }
    }
    v13 = +[VCPMADCoreAnalyticsManager sharedManager];
    uint64_t v17 = VCPAnalyticsFieldKeyTaskName;
    v14 = VCPTaskIDDescription(a4);
    v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8, v17, VCPAnalyticsFieldKeyQoSDelay, v14);
    v18[1] = v15;
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:2];
    [v13 sendEvent:VCPAnalyticsEventDasDutyCycleTaskKey withAnalytics:v16];
  }
}

+ (unsigned)_currentQoSWithTaskID:(unint64_t)a3
{
  double v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  os_log_type_t v10 = sub_1000B916C;
  v11 = &unk_10021A6D8;
  id v12 = a1;
  unint64_t v13 = a3;
  if (qword_100252650 != -1) {
    dispatch_once(&qword_100252650, &v8);
  }
  uint64_t v4 = atomic_load(&dword_100252648);
  unsigned __int8 v5 = atomic_load(byte_100252658);
  if (v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "sharedManager", v8, v9, v10, v11, v12, v13);
    [v6 _reportDelayForQoS:v4 withTaskID:a3];

    atomic_store(0, byte_100252658);
  }
  return v4;
}

- (void)enable
{
  atomic_store(1u, (unsigned __int8 *)&self->_enabled);
  if ([(VCPTimeMeasurement *)self->_timer started]) {
    [(VCPTimeMeasurement *)self->_timer stop];
  }
  timer = self->_timer;
  [(VCPTimeMeasurement *)timer reset];
}

- (void)disable
{
  atomic_store(0, (unsigned __int8 *)&self->_enabled);
  if ([(VCPTimeMeasurement *)self->_timer started])
  {
    timer = self->_timer;
    [(VCPTimeMeasurement *)timer stop];
  }
}

- (void)runBlock:(id)a3 withTaskID:(unint64_t)a4
{
  double v7 = (void (**)(void))a3;
  double v8 = v7;
  unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->_enabled);
  if (v9)
  {
    unsigned int v10 = [(id)objc_opt_class() _currentQoSWithTaskID:a4];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v11, v12))
      {
        VCPMAQoSDescription(v10);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        qos_class_t v14 = qos_class_self();
        v15 = VCPMAQoSDescription(v14);
        *(_DWORD *)buf = 138412546;
        id v38 = v13;
        __int16 v39 = 2112;
        v40 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "[DAS QoS] Target QoS: %@ Current QoS: %@", buf, 0x16u);
      }
    }
    uint64_t v16 = mach_absolute_time();
    if (v10 == qos_class_self())
    {
      v8[2](v8);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v17 = VCPLogInstance();
        os_log_type_t v18 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v17, v18))
        {
          v19 = VCPMAQoSDescription(v10);
          *(_DWORD *)buf = 138412290;
          id v38 = v19;
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "[DAS QoS] Dispatching to target QoS: %@", buf, 0xCu);
        }
      }
      uint64_t v20 = dispatch_group_create();
      __int16 v21 = dispatch_get_global_queue(v10, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000B9B9C;
      block[3] = &unk_10021A010;
      v34 = v8;
      dispatch_group_async(v20, v21, block);

      dispatch_group_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    }
    uint64_t v22 = mach_absolute_time();
    LODWORD(v4) = self->_timebase.denom;
    double v23 = (double)((v22 - v16) * self->_timebase.numer) / (double)v4 / 1000000000.0;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      __int16 v24 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v24, v25))
      {
        double v26 = VCPTaskIDDescription(a4);
        v27 = VCPMAQoSDescription(v10);
        *(_DWORD *)buf = 138413058;
        id v38 = (id)VCPAnalyticsEventDasDutyCycleTaskKey;
        __int16 v39 = 2112;
        v40 = v26;
        __int16 v41 = 2112;
        v42 = v27;
        __int16 v43 = 2048;
        double v44 = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "[DAS QoS] %@: %@ - %@: %.2f", buf, 0x2Au);
      }
    }
    v28 = +[VCPMADCoreAnalyticsManager sharedManager];
    v35[0] = VCPAnalyticsFieldKeyTaskName;
    v29 = VCPTaskIDDescription(a4);
    v36[0] = v29;
    v35[1] = VCPAnalyticsFieldKeyQoS;
    v30 = VCPMAQoSDescription(v10);
    v36[1] = v30;
    v35[2] = VCPAnalyticsFieldKeyDuration;
    v31 = +[NSNumber numberWithDouble:v23];
    v36[2] = v31;
    v32 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
    [v28 sendEvent:VCPAnalyticsEventDasDutyCycleTaskKey withAnalytics:v32];
  }
  else
  {
    v7[2](v7);
  }
}

- (void)runAsyncBlock:(id)a3 withTaskID:(unint64_t)a4
{
  id v6 = a3;
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_enabled);
  if (v7) {
    qos_class_t v8 = [(id)objc_opt_class() _currentQoSWithTaskID:a4];
  }
  else {
    qos_class_t v8 = qos_class_self();
  }
  unsigned int v9 = v8;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    unsigned int v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v10, v11))
    {
      VCPMAQoSDescription(v9);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      qos_class_t v13 = qos_class_self();
      qos_class_t v14 = VCPMAQoSDescription(v13);
      *(_DWORD *)buf = 138412546;
      id v27 = v12;
      __int16 v28 = 2112;
      v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[DAS QoS] Target QoS: %@ Current QoS: %@", buf, 0x16u);
    }
  }
  uint64_t v15 = mach_absolute_time();
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v16 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v16, v17))
    {
      os_log_type_t v18 = VCPMAQoSDescription(v9);
      *(_DWORD *)buf = 138412290;
      id v27 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[DAS QoS] Dispatching to target QoS: %@", buf, 0xCu);
    }
  }
  v19 = dispatch_get_global_queue(v9, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B9E4C;
  block[3] = &unk_10021C970;
  void block[4] = self;
  id v22 = v6;
  uint64_t v23 = v15;
  unint64_t v24 = a4;
  unsigned int v25 = v9;
  id v20 = v6;
  dispatch_async(v19, block);
}

- (void).cxx_destruct
{
}

@end