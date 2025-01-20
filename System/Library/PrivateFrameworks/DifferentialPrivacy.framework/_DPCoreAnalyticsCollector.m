@interface _DPCoreAnalyticsCollector
+ (id)sharedInstance;
- (void)reportMetricsForEvent:(id)a3 withMetrics:(id)a4;
@end

@implementation _DPCoreAnalyticsCollector

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_reporter;
  return v2;
}

- (void)reportMetricsForEvent:(id)a3 withMetrics:(id)a4
{
}

@end