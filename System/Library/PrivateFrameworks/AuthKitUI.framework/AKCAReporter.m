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
      uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
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
  return (id)[(NSMutableDictionary *)self->_reportData objectForKeyedSubscript:a3];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
}

- (void)sendReport
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a3;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Sending Report: %@ (time: %f)", (uint8_t *)&v4, 0x16u);
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