@interface CalStopwatch
- (BOOL)usesSignalFlags;
- (CalStopwatch)init;
- (double)markEventEnd:(id)a3;
- (double)markEventSplit:(id)a3;
- (id)description;
- (id)elapsedTimeAsString:(int)a3;
- (unint64_t)elapsedTimeAsNumber:(int)a3;
- (unint64_t)elapsedTimeInNanoseconds;
- (void)markEventStart:(id)a3;
- (void)reset;
- (void)setUsesSignalFlags:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation CalStopwatch

- (CalStopwatch)init
{
  v7.receiver = self;
  v7.super_class = (Class)CalStopwatch;
  v2 = [(CalStopwatch *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_isRunning = 0;
    v2->_hasValidElapsedTime = 0;
    uint64_t v4 = objc_opt_new();
    events = v3->_events;
    v3->_events = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (void)start
{
}

- (id)elapsedTimeAsString:(int)a3
{
  unint64_t v4 = [(CalStopwatch *)self elapsedTimeAsNumber:*(void *)&a3];
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_hasValidElapsedTime)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%llu", v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = @"Unknown";
  }
  objc_sync_exit(v5);

  return v6;
}

- (unint64_t)elapsedTimeAsNumber:(int)a3
{
  unint64_t v4 = [(CalStopwatch *)self elapsedTimeInNanoseconds];
  if (a3 > 2) {
    unint64_t v5 = 1;
  }
  else {
    unint64_t v5 = qword_190DEF118[a3];
  }
  return v4 / v5;
}

- (unint64_t)elapsedTimeInNanoseconds
{
  uint64_t v3 = mach_absolute_time();
  if (elapsedTimeInNanoseconds_onceToken != -1) {
    dispatch_once(&elapsedTimeInNanoseconds_onceToken, &__block_literal_global_33);
  }
  if (!elapsedTimeInNanoseconds_ratio) {
    return 0;
  }
  unint64_t v4 = self;
  objc_sync_enter(v4);
  if (v4->_isRunning)
  {
    unint64_t v5 = (v3 - v4->_lastStartTime + v4->_elapsedTime) * elapsedTimeInNanoseconds_ratio;
  }
  else if (v4->_hasValidElapsedTime)
  {
    unint64_t v5 = v4->_elapsedTime * elapsedTimeInNanoseconds_ratio;
  }
  else
  {
    unint64_t v5 = 0;
  }
  objc_sync_exit(v4);

  return v5;
}

void __40__CalStopwatch_elapsedTimeInNanoseconds__block_invoke()
{
  kern_return_t v0;
  int v1;
  NSObject *v2;
  mach_timebase_info info;

  info = 0;
  v0 = mach_timebase_info(&info);
  if (v0)
  {
    v1 = v0;
    v2 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __40__CalStopwatch_elapsedTimeInNanoseconds__block_invoke_cold_3(v1, v2);
    }
  }
  else if (info.denom)
  {
    elapsedTimeInNanoseconds_ratio = info.numer / info.denom;
    v2 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __40__CalStopwatch_elapsedTimeInNanoseconds__block_invoke_cold_2(v2);
    }
  }
  else
  {
    v2 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __40__CalStopwatch_elapsedTimeInNanoseconds__block_invoke_cold_1(v2);
    }
  }
}

- (void).cxx_destruct
{
}

- (id)description
{
  uint64_t v3 = [CalDescriptionBuilder alloc];
  v9.receiver = self;
  v9.super_class = (Class)CalStopwatch;
  unint64_t v4 = [(CalStopwatch *)&v9 description];
  unint64_t v5 = [(CalDescriptionBuilder *)v3 initWithSuperclassDescription:v4];

  v6 = self;
  objc_sync_enter(v6);
  [(CalDescriptionBuilder *)v5 setKey:@"LastStartTime" withUnsignedLongLong:v6->_lastStartTime];
  [(CalDescriptionBuilder *)v5 setKey:@"ElapsedTime" withUnsignedLongLong:v6->_elapsedTime];
  [(CalDescriptionBuilder *)v5 setKey:@"IsRunning" withBoolean:v6->_isRunning];
  [(CalDescriptionBuilder *)v5 setKey:@"HasValidElapsedTime" withBoolean:v6->_hasValidElapsedTime];
  objc_sync_exit(v6);

  objc_super v7 = [(CalDescriptionBuilder *)v5 build];

  return v7;
}

- (void)stop
{
}

- (void)reset
{
  obj = self;
  objc_sync_enter(obj);
  obj->_isRunning = 0;
  obj->_lastStartTime = 0;
  obj->_elapsedTime = 0;
  obj->_hasValidElapsedTime = 0;
  objc_sync_exit(obj);
}

- (void)markEventStart:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = +[CalFoundationLogSubsystem eventTimer];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CalStopwatch markEventStart:]((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }

  if ([(CalStopwatch *)self usesSignalFlags])
  {
    v13 = +[CalFoundationLogSubsystem eventTimer];
    CalPerfLogStart(v13);
  }
  v14 = [MEMORY[0x1E4F1CA48] arrayWithObject:v5];
  [(NSMutableDictionary *)self->_events setObject:v14 forKeyedSubscript:v4];
}

- (double)markEventSplit:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [(NSMutableDictionary *)self->_events objectForKeyedSubscript:v4];
  uint64_t v7 = [v6 lastObject];
  uint64_t v8 = [v6 firstObject];
  uint64_t v9 = 0;
  double v10 = 0.0;
  if (v7)
  {
    [v5 timeIntervalSinceDate:v7];
    double v10 = v11;
  }
  if (v8)
  {
    [v5 timeIntervalSinceDate:v8];
    uint64_t v9 = v12;
  }
  v13 = +[CalFoundationLogSubsystem eventTimer];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v18 = v4;
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    __int16 v21 = 2048;
    double v22 = v10;
    _os_log_debug_impl(&dword_190D88000, v13, OS_LOG_TYPE_DEBUG, "Event %@ has taken %f seconds so far (%f seconds since last split)", buf, 0x20u);
  }

  if ([(CalStopwatch *)self usesSignalFlags])
  {
    v14 = [NSString stringWithFormat:@"%@ Split %li", v4, objc_msgSend(v6, "count") + 1];
    v15 = +[CalFoundationLogSubsystem eventTimer];
    CalPerfLogPoint(v15);
  }
  [v6 addObject:v5];

  return v10;
}

- (double)markEventEnd:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [(NSMutableDictionary *)self->_events objectForKeyedSubscript:v4];
  uint64_t v7 = [v6 lastObject];
  uint64_t v8 = [v6 firstObject];
  double v9 = 0.0;
  uint64_t v10 = 0;
  if (v7)
  {
    [v5 timeIntervalSinceDate:v7];
    uint64_t v10 = v11;
  }
  if (v8)
  {
    [v5 timeIntervalSinceDate:v8];
    double v9 = v12;
  }
  v13 = +[CalFoundationLogSubsystem eventTimer];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412802;
    id v17 = v4;
    __int16 v18 = 2048;
    double v19 = v9;
    __int16 v20 = 2048;
    uint64_t v21 = v10;
    _os_log_debug_impl(&dword_190D88000, v13, OS_LOG_TYPE_DEBUG, "Event %@ took a total of %f seconds (%f seconds since last split)", (uint8_t *)&v16, 0x20u);
  }

  if ([(CalStopwatch *)self usesSignalFlags])
  {
    v14 = +[CalFoundationLogSubsystem eventTimer];
    CalPerfLogEnd(v14);
  }
  [(NSMutableDictionary *)self->_events removeObjectForKey:v4];

  return v9;
}

- (BOOL)usesSignalFlags
{
  return self->_usesSignalFlags;
}

- (void)setUsesSignalFlags:(BOOL)a3
{
  self->_usesSignalFlags = a3;
}

void __40__CalStopwatch_elapsedTimeInNanoseconds__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_190D88000, log, OS_LOG_TYPE_ERROR, "Mach timebase information produced a result with a denominator of 0.  Stopwatches will not work.", v1, 2u);
}

void __40__CalStopwatch_elapsedTimeInNanoseconds__block_invoke_cold_2(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = elapsedTimeInNanoseconds_ratio;
  _os_log_debug_impl(&dword_190D88000, log, OS_LOG_TYPE_DEBUG, "Mach timebase information ratio: [%u]", (uint8_t *)v1, 8u);
}

void __40__CalStopwatch_elapsedTimeInNanoseconds__block_invoke_cold_3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Could not acquire Mach timebase information.  Stopwatches will not work.  Error: [%d]", (uint8_t *)v2, 8u);
}

- (void)markEventStart:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end