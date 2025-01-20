@interface HMDUserDataZoneControllerShareLogEvent
- (BOOL)didAccept;
- (HMDUserDataZoneControllerShareLogEvent)initWithResult:(unint64_t)a3 didAccept:(BOOL)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)result;
@end

@implementation HMDUserDataZoneControllerShareLogEvent

- (BOOL)didAccept
{
  return self->_didAccept;
}

- (unint64_t)result
{
  return self->_result;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"result";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserDataZoneControllerShareLogEvent result](self, "result"));
  v7[1] = @"didAccept";
  v8[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUserDataZoneControllerShareLogEvent didAccept](self, "didAccept"));
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.UserDataZoneShare";
}

- (HMDUserDataZoneControllerShareLogEvent)initWithResult:(unint64_t)a3 didAccept:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMDUserDataZoneControllerShareLogEvent;
  result = [(HMMLogEvent *)&v7 init];
  if (result)
  {
    result->_result = a3;
    result->_didAccept = a4;
  }
  return result;
}

@end