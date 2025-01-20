@interface HMAccessoryInfoSleepWakeState
- (BOOL)isEqual:(id)a3;
- (HMAccessoryInfoSleepWakeState)initWithProtoData:(id)a3;
- (HMAccessoryInfoSleepWakeState)initWithProtoPayload:(id)a3;
- (HMAccessoryInfoSleepWakeState)initWithSleepWakeState:(unint64_t)a3;
- (id)description;
- (id)protoData;
- (id)protoPayload;
- (unint64_t)sleepWakeState;
@end

@implementation HMAccessoryInfoSleepWakeState

- (unint64_t)sleepWakeState
{
  return self->_sleepWakeState;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMAccessoryInfoSleepWakeState *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      unint64_t v7 = [(HMAccessoryInfoSleepWakeState *)self sleepWakeState];
      BOOL v8 = v7 == [(HMAccessoryInfoSleepWakeState *)v6 sleepWakeState];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (HMAccessoryInfoSleepWakeState)initWithProtoData:(id)a3
{
  id v4 = a3;
  v5 = [[HMAccessoryInfoProtoSleepWakeStateEvent alloc] initWithData:v4];

  v6 = [(HMAccessoryInfoSleepWakeState *)self initWithProtoPayload:v5];
  return v6;
}

- (HMAccessoryInfoSleepWakeState)initWithProtoPayload:(id)a3
{
  uint64_t v4 = [a3 sleepWakeState];

  return [(HMAccessoryInfoSleepWakeState *)self initWithSleepWakeState:v4];
}

- (id)protoData
{
  v2 = [(HMAccessoryInfoSleepWakeState *)self protoPayload];
  v3 = [v2 data];

  return v3;
}

- (id)protoPayload
{
  v3 = objc_alloc_init(HMAccessoryInfoProtoSleepWakeStateEvent);
  [(HMAccessoryInfoProtoSleepWakeStateEvent *)v3 setSleepWakeState:[(HMAccessoryInfoSleepWakeState *)self sleepWakeState]];

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryInfoSleepWakeState;
  uint64_t v4 = [(HMAccessoryInfoSleepWakeState *)&v8 description];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMAccessoryInfoSleepWakeState sleepWakeState](self, "sleepWakeState"));
  v6 = [v3 stringWithFormat:@"%@, sws: %@", v4, v5];

  return v6;
}

- (HMAccessoryInfoSleepWakeState)initWithSleepWakeState:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMAccessoryInfoSleepWakeState;
  result = [(HMAccessoryInfoSleepWakeState *)&v5 init];
  if (result) {
    result->_sleepWakeState = a3;
  }
  return result;
}

@end