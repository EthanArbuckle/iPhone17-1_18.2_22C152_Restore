@interface HMDMediaDestinationControllerLogEvent
- (HMDMediaDestinationControllerLogEvent)initWithIsTriggeredOnControllerDevice:(id)a3 userPrivilege:(id)a4;
- (NSString)isTriggeredOnControllerDevice;
- (NSString)userPrivilege;
@end

@implementation HMDMediaDestinationControllerLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPrivilege, 0);
  objc_storeStrong((id *)&self->_isTriggeredOnControllerDevice, 0);
}

- (NSString)userPrivilege
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)isTriggeredOnControllerDevice
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (HMDMediaDestinationControllerLogEvent)initWithIsTriggeredOnControllerDevice:(id)a3 userPrivilege:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMDMediaDestinationControllerDestinationLogEvent *)_HMFPreconditionFailure();
    [(HMDMediaDestinationControllerDestinationLogEvent *)v13 .cxx_destruct];
    return result;
  }
  v15.receiver = self;
  v15.super_class = (Class)HMDMediaDestinationControllerLogEvent;
  v10 = [(HMMLogEvent *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_isTriggeredOnControllerDevice, a3);
    objc_storeStrong((id *)&v11->_userPrivilege, a4);
  }

  return v11;
}

@end