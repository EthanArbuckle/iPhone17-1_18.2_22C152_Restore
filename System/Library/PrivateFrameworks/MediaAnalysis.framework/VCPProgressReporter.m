@interface VCPProgressReporter
+ (id)reporterWithIntervalSeconds:(unint64_t)a3 andTotalJobCount:(int64_t)a4 andBlock:(id)a5;
- (VCPProgressReporter)init;
- (VCPProgressReporter)initWithIntervalSeconds:(unint64_t)a3 andTotalJobCount:(int64_t)a4 andBlock:(id)a5;
- (void)_reportProgressWithBlock:(id)a3;
- (void)dealloc;
- (void)increaseProcessedJobCountByOne;
@end

@implementation VCPProgressReporter

- (VCPProgressReporter)init
{
  return 0;
}

- (VCPProgressReporter)initWithIntervalSeconds:(unint64_t)a3 andTotalJobCount:(int64_t)a4 andBlock:(id)a5
{
  id v8 = a5;
  v9 = v8;
  if (!a4)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v20, v21))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "VCPProgressReporter: totalJobCount must be non-zero", buf, 2u);
      }
      goto LABEL_17;
    }
LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  if (!v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v20 = VCPLogInstance();
      os_log_type_t v22 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v20, v22))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v22, "VCPProgressReporter: report block must be non-nil", buf, 2u);
      }
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  v28.receiver = self;
  v28.super_class = (Class)VCPProgressReporter;
  v10 = [(VCPProgressReporter *)&v28 init];
  v11 = v10;
  if (v10)
  {
    v10->_int64_t totalJobCount = a4;
    atomic_store(0, (unsigned int *)&v10->_processedJobCount);
    v10->_processedJobCountOnLastUpdate = -1;
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mediaanalysisd.progressreport", 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    objc_initWeak(&location, v11);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100019774;
    v24[3] = &unk_100219F58;
    objc_copyWeak(&v26, &location);
    id v25 = v9;
    uint64_t v14 = +[VCPTimer timerWithIntervalSeconds:a3 isOneShot:0 andBlock:v24];
    timer = v11->_timer;
    v11->_timer = (VCPTimer *)v14;

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v16 = VCPLogInstance();
      os_log_type_t v17 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v16, v17))
      {
        int64_t totalJobCount = v11->_totalJobCount;
        *(_DWORD *)buf = 134217984;
        int64_t v30 = totalJobCount;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "Initialized VCPProgressReporter %lu", buf, 0xCu);
      }
    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  self = v11;
  v19 = self;
LABEL_19:

  return v19;
}

+ (id)reporterWithIntervalSeconds:(unint64_t)a3 andTotalJobCount:(int64_t)a4 andBlock:(id)a5
{
  id v7 = a5;
  id v8 = [objc_alloc((Class)objc_opt_class()) initWithIntervalSeconds:a3 andTotalJobCount:a4 andBlock:v7];

  return v8;
}

- (void)dealloc
{
  [(VCPTimer *)self->_timer destroy];
  v3.receiver = self;
  v3.super_class = (Class)VCPProgressReporter;
  [(VCPProgressReporter *)&v3 dealloc];
}

- (void)increaseProcessedJobCountByOne
{
}

- (void)_reportProgressWithBlock:(id)a3
{
  id v4 = a3;
  signed int v5 = atomic_load((unsigned int *)&self->_processedJobCount);
  if (self->_processedJobCountOnLastUpdate != v5) {
    self->_int64_t processedJobCountOnLastUpdate = v5;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v6, v7))
    {
      int64_t processedJobCountOnLastUpdate = self->_processedJobCountOnLastUpdate;
      int64_t totalJobCount = self->_totalJobCount;
      *(_DWORD *)buf = 134218240;
      int64_t v15 = processedJobCountOnLastUpdate;
      __int16 v16 = 2048;
      int64_t v17 = totalJobCount;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "VCPProgressReporter report: %lu / %lu", buf, 0x16u);
    }
  }
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100019A70;
  v12[3] = &unk_100219F80;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_async(queue, v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end