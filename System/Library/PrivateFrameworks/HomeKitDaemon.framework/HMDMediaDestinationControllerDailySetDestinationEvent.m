@interface HMDMediaDestinationControllerDailySetDestinationEvent
- (HMDMediaDestinationControllerDailySetDestinationEvent)initWithExistingDestinationType:(id)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)existingDestinationType;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDMediaDestinationControllerDailySetDestinationEvent

- (void).cxx_destruct
{
}

- (NSString)existingDestinationType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"existingMediaDestinationType";
  v2 = [(HMDMediaDestinationControllerDailySetDestinationEvent *)self existingDestinationType];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.media.destination.controller.daily.setDestination";
}

- (HMDMediaDestinationControllerDailySetDestinationEvent)initWithExistingDestinationType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDMediaDestinationControllerDailySetDestinationEvent;
  v6 = [(HMMLogEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_existingDestinationType, a3);
  }

  return v7;
}

@end