@interface HMDThreadPreferredNetworkUpdatedEvent
- (HMDThreadPreferredNetworkUpdatedEvent)initWithEventValue:(id)a3;
- (NSData)eventValue;
@end

@implementation HMDThreadPreferredNetworkUpdatedEvent

- (void).cxx_destruct
{
}

- (NSData)eventValue
{
  return self->_eventValue;
}

- (HMDThreadPreferredNetworkUpdatedEvent)initWithEventValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDThreadPreferredNetworkUpdatedEvent;
  v6 = [(HMDThreadPreferredNetworkUpdatedEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_eventValue, a3);
  }

  return v7;
}

@end