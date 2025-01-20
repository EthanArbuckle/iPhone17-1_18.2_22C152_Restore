@interface HMDUnexpectedNotificationLogEvent
- (HMDUnexpectedNotificationLogEvent)initWithCount:(int64_t)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (int64_t)count;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDUnexpectedNotificationLogEvent

- (int64_t)count
{
  return self->_count;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"numUnexpectedNotificationCount";
  v2 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDUnexpectedNotificationLogEvent count](self, "count"));
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.unexpectedNotification";
}

- (HMDUnexpectedNotificationLogEvent)initWithCount:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDUnexpectedNotificationLogEvent;
  result = [(HMMLogEvent *)&v5 init];
  if (result) {
    result->_count = a3;
  }
  return result;
}

@end