@interface HMDMediaDestinationControllerReceivedUpdateDestinationRequestMessageLogEvent
- (HMDMediaDestinationControllerReceivedUpdateDestinationRequestMessageLogEvent)initWithExistingDestinationType:(id)a3 destinationType:(id)a4 isTriggeredOnControllerDevice:(id)a5 userPrivilege:(id)a6;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDMediaDestinationControllerReceivedUpdateDestinationRequestMessageLogEvent

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v10[4] = *MEMORY[0x263EF8340];
  v9[0] = @"existingMediaDestinationType";
  v3 = [(HMDMediaDestinationControllerDestinationLogEvent *)self existingDestinationType];
  v10[0] = v3;
  v9[1] = @"mediaDestinationType";
  v4 = [(HMDMediaDestinationControllerDestinationLogEvent *)self destinationType];
  v10[1] = v4;
  v9[2] = @"isTriggeredOnControllerDevice";
  v5 = [(HMDMediaDestinationControllerLogEvent *)self isTriggeredOnControllerDevice];
  v10[2] = v5;
  v9[3] = @"userPrivilege";
  v6 = [(HMDMediaDestinationControllerLogEvent *)self userPrivilege];
  v10[3] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return (NSDictionary *)v7;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.media.destination.controller.receivedUpdateDestinationRequestMessage";
}

- (HMDMediaDestinationControllerReceivedUpdateDestinationRequestMessageLogEvent)initWithExistingDestinationType:(id)a3 destinationType:(id)a4 isTriggeredOnControllerDevice:(id)a5 userPrivilege:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)HMDMediaDestinationControllerReceivedUpdateDestinationRequestMessageLogEvent;
  return [(HMDMediaDestinationControllerDestinationLogEvent *)&v7 initWithExistingDestinationType:a3 destinationType:a4 isTriggeredOnControllerDevice:a5 userPrivilege:a6];
}

@end