@interface HMDMediaDestinationControllerDestinationLogEvent
- (HMDMediaDestinationControllerDestinationLogEvent)initWithExistingDestinationType:(id)a3 destinationType:(id)a4 isTriggeredOnControllerDevice:(id)a5 userPrivilege:(id)a6;
- (NSString)destinationType;
- (NSString)existingDestinationType;
@end

@implementation HMDMediaDestinationControllerDestinationLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationType, 0);
  objc_storeStrong((id *)&self->_existingDestinationType, 0);
}

- (NSString)destinationType
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)existingDestinationType
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (HMDMediaDestinationControllerDestinationLogEvent)initWithExistingDestinationType:(id)a3 destinationType:(id)a4 isTriggeredOnControllerDevice:(id)a5 userPrivilege:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    v19 = (HMDMediaDestinationControllerReceivedUpdateDestinationRequestMessageLogEvent *)_HMFPreconditionFailure();
    return (HMDMediaDestinationControllerDestinationLogEvent *)[(HMDMediaDestinationControllerReceivedUpdateDestinationRequestMessageLogEvent *)v19 coreAnalyticsEventOptions];
  }
  v21.receiver = self;
  v21.super_class = (Class)HMDMediaDestinationControllerDestinationLogEvent;
  v16 = [(HMDMediaDestinationControllerLogEvent *)&v21 initWithIsTriggeredOnControllerDevice:v13 userPrivilege:v14];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_existingDestinationType, a3);
    objc_storeStrong((id *)&v17->_destinationType, a4);
  }

  return v17;
}

@end