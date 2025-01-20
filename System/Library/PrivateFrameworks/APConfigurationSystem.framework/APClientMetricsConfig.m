@interface APClientMetricsConfig
+ (id)path;
@end

@implementation APClientMetricsConfig

+ (id)path
{
  return @"EventCollection/ClientMetrics";
}

@end