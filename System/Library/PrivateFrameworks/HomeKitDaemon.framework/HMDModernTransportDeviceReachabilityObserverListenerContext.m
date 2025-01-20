@interface HMDModernTransportDeviceReachabilityObserverListenerContext
- (HMDDeviceAddress)address;
- (HMDModernTransportDeviceReachabilityObserverListenerContext)initWithAddress:(id)a3;
- (NSHashTable)listeners;
- (NSNumber)reachability;
- (double)unreachableStartTime;
- (void)setAddress:(id)a3;
- (void)setReachability:(id)a3;
- (void)setUnreachableStartTime:(double)a3;
@end

@implementation HMDModernTransportDeviceReachabilityObserverListenerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

- (void)setUnreachableStartTime:(double)a3
{
  self->_unreachableStartTime = a3;
}

- (double)unreachableStartTime
{
  return self->_unreachableStartTime;
}

- (void)setAddress:(id)a3
{
}

- (HMDDeviceAddress)address
{
  return self->_address;
}

- (void)setReachability:(id)a3
{
}

- (NSNumber)reachability
{
  return self->_reachability;
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (HMDModernTransportDeviceReachabilityObserverListenerContext)initWithAddress:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDModernTransportDeviceReachabilityObserverListenerContext;
  v6 = [(HMDModernTransportDeviceReachabilityObserverListenerContext *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    listeners = v6->_listeners;
    v6->_listeners = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_address, a3);
  }

  return v6;
}

@end