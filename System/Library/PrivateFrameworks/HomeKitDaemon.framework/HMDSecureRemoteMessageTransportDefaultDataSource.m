@interface HMDSecureRemoteMessageTransportDefaultDataSource
- (HMDAccountRegistry)accountRegistry;
- (HMDModernTransportDeviceReachabilityObserver)reachabilityObserver;
- (HMDRemoteDeviceMonitor)deviceMonitor;
- (HMDRemoteHomeMessagingManager)homeMessagingManager;
- (HMDSecureRemoteMessageTransportDefaultDataSource)init;
- (NSArray)transports;
- (id)secureSessionWithDevice:(id)a3;
@end

@implementation HMDSecureRemoteMessageTransportDefaultDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeMessagingManager, 0);
  objc_storeStrong((id *)&self->_reachabilityObserver, 0);
  objc_storeStrong((id *)&self->_accountRegistry, 0);
  objc_storeStrong((id *)&self->_deviceMonitor, 0);
  objc_storeStrong((id *)&self->_transports, 0);
}

- (HMDRemoteHomeMessagingManager)homeMessagingManager
{
  return self->_homeMessagingManager;
}

- (HMDModernTransportDeviceReachabilityObserver)reachabilityObserver
{
  return self->_reachabilityObserver;
}

- (HMDAccountRegistry)accountRegistry
{
  return self->_accountRegistry;
}

- (HMDRemoteDeviceMonitor)deviceMonitor
{
  return self->_deviceMonitor;
}

- (NSArray)transports
{
  return self->_transports;
}

- (id)secureSessionWithDevice:(id)a3
{
  id v4 = a3;
  v5 = [HMDSecureRemoteSession alloc];
  v6 = [(HMDSecureRemoteMessageTransportDefaultDataSource *)self accountRegistry];
  v7 = [(HMDSecureRemoteSession *)v5 initWithDevice:v4 accountRegistry:v6];

  return v7;
}

- (HMDSecureRemoteMessageTransportDefaultDataSource)init
{
  v20.receiver = self;
  v20.super_class = (Class)HMDSecureRemoteMessageTransportDefaultDataSource;
  v2 = [(HMDSecureRemoteMessageTransportDefaultDataSource *)&v20 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F42620] productInfo];
    uint64_t v4 = +[HMDRemoteMessageTransport remoteMessageTransportsForProductInfo:v3];
    transports = v2->_transports;
    v2->_transports = (NSArray *)v4;

    uint64_t v6 = +[HMDAccountRegistry sharedRegistry];
    accountRegistry = v2->_accountRegistry;
    v2->_accountRegistry = (HMDAccountRegistry *)v6;

    v8 = [HMDRemoteDeviceMonitor alloc];
    v9 = v2->_accountRegistry;
    v10 = +[HMDIDSServiceManager sharedManager];
    v11 = [v10 activityObserver];
    v12 = +[HMDAppleAccountManager sharedManager];
    uint64_t v13 = [(HMDRemoteDeviceMonitor *)v8 initWithAccountRegistry:v9 activityObserver:v11 accountManager:v12];
    deviceMonitor = v2->_deviceMonitor;
    v2->_deviceMonitor = (HMDRemoteDeviceMonitor *)v13;

    v15 = objc_alloc_init(HMDModernTransportDeviceReachabilityObserver);
    reachabilityObserver = v2->_reachabilityObserver;
    v2->_reachabilityObserver = v15;

    v17 = objc_alloc_init(HMDRemoteHomeMessagingManager);
    homeMessagingManager = v2->_homeMessagingManager;
    v2->_homeMessagingManager = v17;
  }
  return v2;
}

@end