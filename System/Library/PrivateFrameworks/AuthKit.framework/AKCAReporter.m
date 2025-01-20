@interface AKCAReporter
- (AKCAReporter)initWithEvent:(id)a3;
- (double)machAbsoluteTimeToTimeInterval:(unint64_t)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)sendReport;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation AKCAReporter

- (AKCAReporter)initWithEvent:(id)a3
{
  id v5 = a3;
  if (getenv("__OSINSTALL_ENVIRONMENT") || getenv("__AKSYNCBUBBLE"))
  {
    v6 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)AKCAReporter;
    v8 = [(AKCAReporter *)&v12 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_eventName, a3);
      uint64_t v10 = +[NSMutableDictionary dictionary];
      reportData = v9->_reportData;
      v9->_reportData = (NSMutableDictionary *)v10;

      mach_timebase_info(&v9->_clock_timebase);
      v9->_initTime = mach_absolute_time();
    }
    self = v9;
    v6 = self;
  }

  return v6;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return [(NSMutableDictionary *)self->_reportData objectForKeyedSubscript:a3];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
}

- (void)sendReport
{
  if (self->_initTime)
  {
    [(AKCAReporter *)self machAbsoluteTimeToTimeInterval:mach_absolute_time() - self->_initTime];
    double v4 = v3;
    id v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(NSMutableDictionary *)self->_reportData setObject:v5 forKeyedSubscript:@"duration"];

    self->_initTime = 0;
    v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100180864((uint64_t)self, v6, v4);
    }

    if (&_AnalyticsSendEvent) {
      AnalyticsSendEvent();
    }
  }
  else
  {
    v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1001807E8((uint64_t)self, v7);
    }
  }
}

- (double)machAbsoluteTimeToTimeInterval:(unint64_t)a3
{
  return (double)(self->_clock_timebase.numer * a3 / self->_clock_timebase.denom) / 1000000000.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportData, 0);

  objc_storeStrong((id *)&self->_eventName, 0);
}

@end