@interface HMDTriggerConfirmationTimer
- (HMDTriggerConfirmationTimer)initWithExecutionSessionID:(id)a3 timeoutInterval:(double)a4;
- (NSUUID)executionSessionID;
- (id)description;
@end

@implementation HMDTriggerConfirmationTimer

- (void).cxx_destruct
{
}

- (NSUUID)executionSessionID
{
  return self->_executionSessionID;
}

- (id)description
{
  v2 = NSString;
  v3 = NSNumber;
  [(HMFTimer *)self timeInterval];
  v4 = objc_msgSend(v3, "numberWithDouble:");
  v5 = [v2 stringWithFormat:@"[Timeout interval: %@]", v4];

  return v5;
}

- (HMDTriggerConfirmationTimer)initWithExecutionSessionID:(id)a3 timeoutInterval:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDTriggerConfirmationTimer;
  v8 = [(HMFTimer *)&v11 initWithTimeInterval:1 options:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_executionSessionID, a3);
  }

  return v9;
}

@end