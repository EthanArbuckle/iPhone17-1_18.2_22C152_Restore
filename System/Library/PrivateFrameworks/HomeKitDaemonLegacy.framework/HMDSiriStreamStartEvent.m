@interface HMDSiriStreamStartEvent
- (HMDSiriStreamStartEvent)initWithActivationType:(unint64_t)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)activationType;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDSiriStreamStartEvent

- (unint64_t)activationType
{
  return self->_activationType;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"duration";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  v7[1] = @"activationType";
  v8[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDSiriStreamStartEvent activationType](self, "activationType"));
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (NSString)coreAnalyticsEventName
{
  v2 = @"com.apple.HomeKit.daemon.siri.stream-start";
  return (NSString *)@"com.apple.HomeKit.daemon.siri.stream-start";
}

- (HMDSiriStreamStartEvent)initWithActivationType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDSiriStreamStartEvent;
  result = [(HMMLogEvent *)&v5 init];
  if (result) {
    result->_activationType = a3;
  }
  return result;
}

@end