@interface CSLanguageCodeUpdateMonitor
+ (id)sharedInstance;
- (BOOL)isLanguageCodeCurrent:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)notifySiriLanguageCodeChanged:(id)a3;
@end

@implementation CSLanguageCodeUpdateMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5977 != -1) {
    dispatch_once(&sharedInstance_onceToken_5977, &__block_literal_global_5978);
  }
  v2 = (void *)sharedInstance__sharedInstance_5979;
  return v2;
}

uint64_t __45__CSLanguageCodeUpdateMonitor_sharedInstance__block_invoke()
{
  BOOL v0 = +[CSUtils isDarwinOS];
  v1 = off_1E61FE978;
  if (!v0) {
    v1 = off_1E61FE970;
  }
  sharedInstance__sharedInstance_5979 = (uint64_t)objc_alloc_init(*v1);
  return MEMORY[0x1F41817F8]();
}

- (BOOL)isLanguageCodeCurrent:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSLanguageCodeUpdateMonitor isLanguageCodeCurrent:]", "CSLanguageCodeUpdateMonitor.m", 51, "NO");
}

- (void)notifySiriLanguageCodeChanged:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSLanguageCodeUpdateMonitor notifySiriLanguageCodeChanged:]", "CSLanguageCodeUpdateMonitor.m", 47, "NO");
}

- (void)_stopMonitoring
{
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSLanguageCodeUpdateMonitor _startMonitoringWithQueue:]", "CSLanguageCodeUpdateMonitor.m", 39, "NO");
}

@end