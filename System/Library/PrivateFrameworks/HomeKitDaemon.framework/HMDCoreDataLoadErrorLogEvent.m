@interface HMDCoreDataLoadErrorLogEvent
- (HMDCoreDataLoadErrorLogEvent)initWithReason:(unint64_t)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)description;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)reason;
@end

@implementation HMDCoreDataLoadErrorLogEvent

- (unint64_t)reason
{
  return self->_reason;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCoreDataLoadErrorLogEvent reason](self, "reason"));
  [v3 setObject:v4 forKeyedSubscript:@"action"];

  v5 = (void *)[v3 copy];
  return (NSDictionary *)v5;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.coredata.persistentStore.load";
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"HMDCoreDataLoadErrorLogEvent - action: %lu", -[HMDCoreDataLoadErrorLogEvent reason](self, "reason"));
}

- (HMDCoreDataLoadErrorLogEvent)initWithReason:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDCoreDataLoadErrorLogEvent;
  result = [(HMMLogEvent *)&v5 init];
  if (result) {
    result->_reason = a3;
  }
  return result;
}

@end