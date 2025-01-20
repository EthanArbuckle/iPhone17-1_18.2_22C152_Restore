@interface HMDThreadNetworkBTCallStateEvent
- (HMDThreadNetworkBTCallStateEvent)initWithCallState:(int64_t)a3;
- (int64_t)callState;
@end

@implementation HMDThreadNetworkBTCallStateEvent

- (int64_t)callState
{
  return self->_callState;
}

- (HMDThreadNetworkBTCallStateEvent)initWithCallState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDThreadNetworkBTCallStateEvent;
  result = [(HMDThreadNetworkBTCallStateEvent *)&v5 init];
  if (result) {
    result->_callState = a3;
  }
  return result;
}

@end