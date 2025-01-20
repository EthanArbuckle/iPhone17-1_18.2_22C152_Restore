@interface HFUpdateLogger
+ (id)history;
+ (id)runningLoggers;
- (BOOL)didReachSoftTimeout;
- (HFUpdateLogger)initWithTimeout:(double)a3 description:(id)a4;
- (NSDate)startDate;
- (NSString)clientDescription;
- (NSTimer)softTimeoutTimer;
- (OS_os_activity)loggerActivity;
- (double)softTimeoutInterval;
- (id)description;
- (void)_handleTimeout:(id)a3;
- (void)finish;
- (void)setClientDescription:(id)a3;
- (void)setDidReachSoftTimeout:(BOOL)a3;
- (void)setLoggerActivity:(id)a3;
- (void)setSoftTimeoutInterval:(double)a3;
- (void)setSoftTimeoutTimer:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation HFUpdateLogger

- (OS_os_activity)loggerActivity
{
  return self->_loggerActivity;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HFUpdateLogger *)self clientDescription];
  v7 = [v3 stringWithFormat:@"<%@: %p> \"%@\"", v5, self, v6];

  return v7;
}

- (NSString)clientDescription
{
  return self->_clientDescription;
}

- (HFUpdateLogger)initWithTimeout:(double)a3 description:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HFUpdateLogger;
  v7 = [(HFUpdateLogger *)&v16 init];
  if (v7)
  {
    v8 = [MEMORY[0x263EFF910] date];
    [(HFUpdateLogger *)v7 setStartDate:v8];

    [(HFUpdateLogger *)v7 setClientDescription:v6];
    os_activity_t v9 = _os_activity_create(&dword_20B986000, "HFUpdateLogger", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    [(HFUpdateLogger *)v7 setLoggerActivity:v9];

    [(HFUpdateLogger *)v7 setSoftTimeoutInterval:a3];
    if (a3 > 0.0)
    {
      v10 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:v7 target:sel__handleTimeout_ selector:0 userInfo:0 repeats:a3];
      [(HFUpdateLogger *)v7 setSoftTimeoutTimer:v10];
    }
    v11 = +[HFUpdateLoggerDebuggingController _sharedInstance];
    [v11 _addRunningLogger:v7];

    v12 = [(HFUpdateLogger *)v7 loggerActivity];
    os_activity_scope_enter(v12, &v15);

    v13 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v7;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "%@: Starting log for: %@", buf, 0x16u);
    }

    os_activity_scope_leave(&v15);
  }

  return v7;
}

- (void)setStartDate:(id)a3
{
}

- (void)setSoftTimeoutTimer:(id)a3
{
}

- (void)setSoftTimeoutInterval:(double)a3
{
  self->_softTimeoutInterval = a3;
}

- (void)setLoggerActivity:(id)a3
{
}

- (void)setClientDescription:(id)a3
{
}

- (void)finish
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(HFUpdateLogger *)self softTimeoutTimer];
  [v3 invalidate];

  v4 = [MEMORY[0x263EFF910] date];
  v5 = [(HFUpdateLogger *)self startDate];
  [v4 timeIntervalSinceDate:v5];
  uint64_t v7 = v6;

  if (self)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v8 = [(HFUpdateLogger *)self loggerActivity];
    os_activity_scope_enter(v8, &state);

    os_activity_t v9 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = v7;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Update finished in %f seconds", (uint8_t *)&v12, 0xCu);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    v11 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(state.opaque[0]) = 134217984;
      *(uint64_t *)((char *)state.opaque + 4) = v7;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Update finished in %f seconds", (uint8_t *)&state, 0xCu);
    }
  }
  v10 = +[HFUpdateLoggerDebuggingController _sharedInstance];
  [v10 _removeRunningLogger:self];
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSTimer)softTimeoutTimer
{
  return self->_softTimeoutTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_loggerActivity, 0);
  objc_storeStrong((id *)&self->_clientDescription, 0);
}

+ (id)runningLoggers
{
  v2 = +[HFUpdateLoggerDebuggingController _sharedInstance];
  v3 = [v2 _runningLoggers];

  return v3;
}

+ (id)history
{
  v2 = +[HFUpdateLoggerDebuggingController _sharedInstance];
  v3 = [v2 _historyStrings];
  v4 = [v3 componentsJoinedByString:@"\n"];

  return v4;
}

- (void)_handleTimeout:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = [(HFUpdateLogger *)self softTimeoutTimer];
  [v4 invalidate];

  [(HFUpdateLogger *)self setDidReachSoftTimeout:1];
  v5 = [MEMORY[0x263EFF910] date];
  uint64_t v6 = [(HFUpdateLogger *)self startDate];
  [v5 timeIntervalSinceDate:v6];
  uint64_t v8 = v7;

  if (self)
  {
    os_activity_t v9 = [(HFUpdateLogger *)self loggerActivity];
    os_activity_scope_enter(v9, &v12);

    v10 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = self;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "%@: Soft timeout reached after %f seconds. The update will continue until it completes.", buf, 0x16u);
    }

    os_activity_scope_leave(&v12);
  }
  else
  {
    v11 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "%@: Soft timeout reached after %f seconds. The update will continue until it completes.", buf, 0x16u);
    }
  }
}

- (double)softTimeoutInterval
{
  return self->_softTimeoutInterval;
}

- (BOOL)didReachSoftTimeout
{
  return self->_didReachSoftTimeout;
}

- (void)setDidReachSoftTimeout:(BOOL)a3
{
  self->_didReachSoftTimeout = a3;
}

@end