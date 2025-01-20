@interface BRKMetricsLogger
+ (id)sharedInstance;
- (id)_coreAnalyticsKeyForMetricKey:(id)a3;
- (id)_init;
- (void)logEventName:(id)a3 eventPayLoad:(id)a4;
@end

@implementation BRKMetricsLogger

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_Logger;
  return v2;
}

uint64_t __34__BRKMetricsLogger_sharedInstance__block_invoke()
{
  sharedInstance_Logger = [[BRKMetricsLogger alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)BRKMetricsLogger;
  return [(BRKMetricsLogger *)&v3 init];
}

- (void)logEventName:(id)a3 eventPayLoad:(id)a4
{
  id v6 = a4;
  id v7 = [(BRKMetricsLogger *)self _coreAnalyticsKeyForMetricKey:a3];
  AnalyticsSendEvent();
}

- (id)_coreAnalyticsKeyForMetricKey:(id)a3
{
  objc_super v3 = [a3 lowercaseString];
  v4 = [@"com.apple.brook." stringByAppendingString:v3];

  return v4;
}

@end