@interface HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent
- (HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent)initWitheMACAddress:(id)a3 connectionState:(int64_t)a4;
- (NSString)eMACAddressAsString;
- (int64_t)connectionState;
@end

@implementation HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent

- (void).cxx_destruct
{
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (NSString)eMACAddressAsString
{
  return self->_eMACAddressAsString;
}

- (HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent)initWitheMACAddress:(id)a3 connectionState:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent;
  v8 = [(HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eMACAddressAsString, a3);
    v9->_connectionState = a4;
  }

  return v9;
}

@end