@interface HLPAnalyticsEvent
+ (id)event;
- (NSDictionary)caRepresentation;
- (NSString)eventName;
- (void)log;
@end

@implementation HLPAnalyticsEvent

+ (id)event
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)caRepresentation
{
  id v2 = +[HLPAnalyticsEventController sharedInstance];
  v3 = [v2 requiredKeys];

  return (NSDictionary *)v3;
}

- (void)log
{
  id v3 = +[HLPAnalyticsEventController sharedInstance];
  [v3 logAnalyticsEvent:self];
}

- (NSString)eventName
{
  return 0;
}

@end