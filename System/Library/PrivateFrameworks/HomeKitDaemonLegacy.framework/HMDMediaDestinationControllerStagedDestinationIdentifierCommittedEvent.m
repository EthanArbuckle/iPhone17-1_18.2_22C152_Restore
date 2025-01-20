@interface HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent
- (HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent)initWithStagedDestinationIdentifier:(id)a3 isTriggeredOnControllerDevice:(id)a4 userPrivilege:(id)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSUUID)stagedDestinationIdentifier;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent

- (void).cxx_destruct
{
}

- (NSUUID)stagedDestinationIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"duration";
  v3 = objc_msgSend(NSNumber, "numberWithDouble:", ceil((double)-[HMMLogEvent durationMilliseconds](self, "durationMilliseconds") / 1000.0 / 0.1) * 0.1);
  v9[0] = v3;
  v8[1] = @"isTriggeredOnControllerDevice";
  v4 = [(HMDMediaDestinationControllerLogEvent *)self isTriggeredOnControllerDevice];
  v9[1] = v4;
  v8[2] = @"userPrivilege";
  v5 = [(HMDMediaDestinationControllerLogEvent *)self userPrivilege];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.media.destination.controller.stagedDestinationIdentifierCommitted";
}

- (HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent)initWithStagedDestinationIdentifier:(id)a3 isTriggeredOnControllerDevice:(id)a4 userPrivilege:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v12 = v11;
    v18.receiver = self;
    v18.super_class = (Class)HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent;
    v13 = [(HMDMediaDestinationControllerLogEvent *)&v18 initWithIsTriggeredOnControllerDevice:v10 userPrivilege:v11];
    v14 = v13;
    if (v13) {
      objc_storeStrong((id *)&v13->_stagedDestinationIdentifier, a3);
    }

    return v14;
  }
  else
  {
    v16 = (HMDMediaDestinationControllerDailySetDestinationEvent *)_HMFPreconditionFailure();
    [(HMDMediaDestinationControllerDailySetDestinationEvent *)v16 .cxx_destruct];
  }
  return result;
}

@end