@interface IDSKTAnalyticsLogger
+ (id)logger;
- (void)logMetric:(id)a3;
@end

@implementation IDSKTAnalyticsLogger

+ (id)logger
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (void)logMetric:(id)a3
{
  id v3 = a3;
  id v6 = +[TransparencyAnalytics logger];
  v4 = [v3 name];
  v5 = [v3 dictionaryRepresentation];

  [v6 logSoftFailureForEventNamed:v4 withAttributes:v5];
}

@end