@interface HMDCompanionLinkClient
- (OS_dispatch_queue)dispatchQueue;
- (RPCompanionLinkClient)client;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (void)dealloc;
- (void)setClient:(id)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation HMDCompanionLinkClient

- (void).cxx_destruct
{
}

- (void)setClient:(id)a3
{
}

- (void)stop
{
  v3 = [(HMDCompanionLinkClient *)self client];
  [v3 invalidate];

  [(HMDCompanionLinkClient *)self setClient:0];
}

- (void)start
{
  id v2 = [(HMDCompanionLinkClient *)self client];
  [v2 activateWithCompletion:&__block_literal_global_226201];
}

void __31__HMDCompanionLinkClient_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = (void *)MEMORY[0x230FBD990]();
  v4 = HMFGetOSLogHandle();
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = HMFGetLogIdentifier();
      int v11 = 138543618;
      v12 = v6;
      __int16 v13 = 2112;
      id v14 = v2;
      v7 = "%{public}@Failed to activate RPCompanionLinkClient with error %@";
      v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v11 = 138543362;
    v12 = v6;
    v7 = "%{public}@Successfully activated RPCompanionLinkClient.";
    v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

- (void)setDeviceLostHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCompanionLinkClient *)self client];
  [v5 setDeviceLostHandler:v4];
}

- (id)deviceLostHandler
{
  id v2 = [(HMDCompanionLinkClient *)self client];
  v3 = [v2 deviceLostHandler];

  return v3;
}

- (void)setDeviceChangedHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCompanionLinkClient *)self client];
  [v5 setDeviceChangedHandler:v4];
}

- (id)deviceChangedHandler
{
  id v2 = [(HMDCompanionLinkClient *)self client];
  v3 = [v2 deviceChangedHandler];

  return v3;
}

- (void)setDeviceFoundHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCompanionLinkClient *)self client];
  [v5 setDeviceFoundHandler:v4];
}

- (id)deviceFoundHandler
{
  id v2 = [(HMDCompanionLinkClient *)self client];
  v3 = [v2 deviceFoundHandler];

  return v3;
}

- (void)setDispatchQueue:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCompanionLinkClient *)self client];
  [v5 setDispatchQueue:v4];
}

- (OS_dispatch_queue)dispatchQueue
{
  id v2 = [(HMDCompanionLinkClient *)self client];
  v3 = [v2 dispatchQueue];

  return (OS_dispatch_queue *)v3;
}

- (RPCompanionLinkClient)client
{
  client = self->_client;
  if (!client)
  {
    id v4 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x263F62B70]);
    id v5 = self->_client;
    self->_client = v4;

    client = self->_client;
  }
  return client;
}

- (void)dealloc
{
  [(HMDCompanionLinkClient *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)HMDCompanionLinkClient;
  [(HMDCompanionLinkClient *)&v3 dealloc];
}

@end