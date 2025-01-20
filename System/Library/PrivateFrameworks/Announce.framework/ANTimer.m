@interface ANTimer
+ (id)timerWithLabel:(id)a3 identifier:(id)a4;
- (ANTimer)initWithLabel:(id)a3 identifier:(id)a4;
- (NSString)label;
- (OS_dispatch_source)timer;
- (OS_os_log)log;
- (double)timeoutValue;
- (id)description;
- (void)_createAndStartTimerWithQueue:(id)a3 handler:(id)a4;
- (void)_startTimer;
- (void)cancel;
- (void)dealloc;
- (void)reset;
- (void)setTimeoutValue:(double)a3;
- (void)setTimer:(id)a3;
- (void)startWithValue:(double)a3 queue:(id)a4 handler:(id)a5;
@end

@implementation ANTimer

+ (id)timerWithLabel:(id)a3 identifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[ANTimer alloc] initWithLabel:v6 identifier:v5];

  return v7;
}

- (ANTimer)initWithLabel:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ANTimer;
  v9 = [(ANTimer *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    v11 = [NSString stringWithFormat:@"%@Timer", v7];
    v12 = (char *)ANLogBuildCategoryName(v11, v8);
    uint64_t v13 = ANLogWithCategory(v12);
    log = v10->_log;
    v10->_log = (OS_os_log *)v13;
  }
  return v10;
}

- (void)dealloc
{
  [(ANTimer *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)ANTimer;
  [(ANTimer *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = [(ANTimer *)self timer];
  id v5 = [(ANTimer *)self label];
  [(ANTimer *)self timeoutValue];
  id v7 = [v3 stringWithFormat:@"Timer = %@, Label = %@, Timeout Value = %f", v4, v5, v6];

  return v7;
}

- (void)startWithValue:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(ANTimer *)self setTimeoutValue:a3];
  [(ANTimer *)self cancel];
  [(ANTimer *)self _createAndStartTimerWithQueue:v9 handler:v8];
}

- (void)_createAndStartTimerWithQueue:(id)a3 handler:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_source_t v7 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)a3);
  [(ANTimer *)self setTimer:v7];

  id v8 = [(ANTimer *)self timer];

  if (v8)
  {
    id v9 = [(ANTimer *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(ANTimer *)self timer];
      int v12 = 138412290;
      uint64_t v13 = v10;
      _os_log_impl(&dword_220FAA000, v9, OS_LOG_TYPE_DEFAULT, "Created Timer %@", (uint8_t *)&v12, 0xCu);
    }
    v11 = [(ANTimer *)self timer];
    dispatch_source_set_event_handler(v11, v6);

    [(ANTimer *)self _startTimer];
  }
}

- (void)_startTimer
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_super v3 = [(ANTimer *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(ANTimer *)self timer];
    [(ANTimer *)self timeoutValue];
    int v11 = 138412546;
    int v12 = v4;
    __int16 v13 = 2048;
    uint64_t v14 = v5;
    _os_log_impl(&dword_220FAA000, v3, OS_LOG_TYPE_DEFAULT, "Starting Timer (%@) for %f seconds", (uint8_t *)&v11, 0x16u);
  }
  id v6 = [(ANTimer *)self timer];
  [(ANTimer *)self timeoutValue];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  [(ANTimer *)self timeoutValue];
  dispatch_source_set_timer(v6, v8, (unint64_t)(v9 * 1000000000.0), 0);

  v10 = [(ANTimer *)self timer];
  dispatch_resume(v10);
}

- (void)reset
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v3 = [(ANTimer *)self timer];

  if (v3)
  {
    v4 = [(ANTimer *)self timer];
    dispatch_suspend(v4);

    uint64_t v5 = [(ANTimer *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(ANTimer *)self timer];
      int v7 = 138412290;
      dispatch_time_t v8 = v6;
      _os_log_impl(&dword_220FAA000, v5, OS_LOG_TYPE_DEFAULT, "Restarting Timer %@", (uint8_t *)&v7, 0xCu);
    }
    [(ANTimer *)self _startTimer];
  }
}

- (void)cancel
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v3 = [(ANTimer *)self timer];

  if (v3)
  {
    v4 = [(ANTimer *)self log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(ANTimer *)self timer];
      int v7 = 138412290;
      dispatch_time_t v8 = v5;
      _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_DEFAULT, "Canceling and removing Timer %@", (uint8_t *)&v7, 0xCu);
    }
    id v6 = [(ANTimer *)self timer];
    dispatch_source_cancel(v6);

    [(ANTimer *)self setTimer:0];
  }
}

- (NSString)label
{
  return self->_label;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (double)timeoutValue
{
  return self->_timeoutValue;
}

- (void)setTimeoutValue:(double)a3
{
  self->_timeoutValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end