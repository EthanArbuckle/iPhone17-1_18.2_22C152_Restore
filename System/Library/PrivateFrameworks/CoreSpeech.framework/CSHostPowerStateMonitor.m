@interface CSHostPowerStateMonitor
+ (id)sharedInstance;
- (int64_t)currentDarwinHostState;
- (int64_t)currentPowerState;
- (int64_t)currentRawPowerState;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSHostPowerStateMonitor

+ (id)sharedInstance
{
  if (+[CSUtils isDarwinOS])
  {
    v2 = +[CSHostPowerStateMonitorImplDarwin sharedInstance];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_stopMonitoring
{
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSHostPowerStateMonitor _startMonitoringWithQueue:]", "CSHostPowerStateMonitor.m", 49, "NO");
}

- (int64_t)currentDarwinHostState
{
  return -1;
}

- (int64_t)currentRawPowerState
{
}

- (int64_t)currentPowerState
{
}

@end