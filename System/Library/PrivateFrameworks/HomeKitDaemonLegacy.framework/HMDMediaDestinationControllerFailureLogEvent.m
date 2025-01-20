@interface HMDMediaDestinationControllerFailureLogEvent
- (HMDMediaDestinationControllerFailureLogEvent)initWithDestinationControllerErrorCode:(id)a3 errorCode:(id)a4 errorDomain:(id)a5 isTriggeredOnControllerDevice:(id)a6 userPrivilege:(id)a7;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)destinationControllerErrorCode;
- (NSString)errorCode;
- (NSString)errorDomain;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDMediaDestinationControllerFailureLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_destinationControllerErrorCode, 0);
}

- (NSString)errorDomain
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)errorCode
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)destinationControllerErrorCode
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"isTriggeredOnControllerDevice";
  v3 = [(HMDMediaDestinationControllerLogEvent *)self isTriggeredOnControllerDevice];
  v11[0] = v3;
  v10[1] = @"destinationControllerErrorCode";
  v4 = [(HMDMediaDestinationControllerFailureLogEvent *)self destinationControllerErrorCode];
  v11[1] = v4;
  v10[2] = @"userPrivilege";
  v5 = [(HMDMediaDestinationControllerLogEvent *)self userPrivilege];
  v11[2] = v5;
  v10[3] = @"errorCode";
  v6 = [(HMDMediaDestinationControllerFailureLogEvent *)self errorCode];
  v11[3] = v6;
  v10[4] = @"errorDomain";
  v7 = [(HMDMediaDestinationControllerFailureLogEvent *)self errorDomain];
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return (NSDictionary *)v8;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.media.destination.controller.updateDestinationFailed";
}

- (HMDMediaDestinationControllerFailureLogEvent)initWithDestinationControllerErrorCode:(id)a3 errorCode:(id)a4 errorDomain:(id)a5 isTriggeredOnControllerDevice:(id)a6 userPrivilege:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v14)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v15)
  {
LABEL_9:
    v22 = (HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent *)_HMFPreconditionFailure();
    [(HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent *)v22 .cxx_destruct];
    return result;
  }
  v18 = v17;
  v24.receiver = self;
  v24.super_class = (Class)HMDMediaDestinationControllerFailureLogEvent;
  v19 = [(HMDMediaDestinationControllerLogEvent *)&v24 initWithIsTriggeredOnControllerDevice:v16 userPrivilege:v17];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_destinationControllerErrorCode, a3);
    objc_storeStrong((id *)&v20->_errorCode, a4);
    objc_storeStrong((id *)&v20->_errorDomain, a5);
  }

  return v20;
}

@end