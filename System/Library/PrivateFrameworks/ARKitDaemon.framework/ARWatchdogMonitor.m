@interface ARWatchdogMonitor
- (ARWatchdogMonitor)init;
@end

@implementation ARWatchdogMonitor

- (ARWatchdogMonitor)init
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)ARWatchdogMonitor;
  v2 = [(ARWatchdogMonitor *)&v8 init];
  if (v2)
  {
    if (_ARLogDaemon_onceToken_5 != -1) {
      dispatch_once(&_ARLogDaemon_onceToken_5, &__block_literal_global_6);
    }
    v3 = (void *)_ARLogDaemon_logObj_5;
    if (os_log_type_enabled((os_log_t)_ARLogDaemon_logObj_5, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138543618;
      v10 = v6;
      __int16 v11 = 2048;
      v12 = v2;
      _os_log_impl(&dword_24719A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Watchdog monitoring is not supported", buf, 0x16u);
    }
  }

  return 0;
}

@end