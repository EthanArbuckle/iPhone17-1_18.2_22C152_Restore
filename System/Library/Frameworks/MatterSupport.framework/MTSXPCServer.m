@interface MTSXPCServer
+ (id)logCategory;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MTSAuthorizationServerInterface)authorizationServer;
- (MTSDevicePairingServerInterface)devicePairingServer;
- (MTSSystemCommissionerPairingServerInterface)systemCommissionerPairingServer;
- (MTSXPCDeviceSetupClientProxyDelegate)deviceSetupServer;
- (MTSXPCListener)listener;
- (MTSXPCServer)init;
- (MTSXPCServer)initWithListener:(id)a3 clientProxyFactory:(id)a4;
- (NSMutableSet)clientProxies;
- (id)clientProxyFactory;
- (void)clientProxy:(id)a3 checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:(id)a4;
- (void)clientProxy:(id)a3 fetchDevicePairingsForSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5;
- (void)clientProxy:(id)a3 fetchSystemCommissionerPairingsWithCompletionHandler:(id)a4;
- (void)clientProxy:(id)a3 openCommissioningWindowForSystemCommissionerPairingUUID:(id)a4 duration:(double)a5 completionHandler:(id)a6;
- (void)clientProxy:(id)a3 performDeviceSetupUsingRequest:(id)a4 completionHandler:(id)a5;
- (void)clientProxy:(id)a3 readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5;
- (void)clientProxy:(id)a3 removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5;
- (void)clientProxy:(id)a3 removeDevicePairingWithUUID:(id)a4 forSystemCommissionerPairingUUID:(id)a5 completionHandler:(id)a6;
- (void)clientProxy:(id)a3 removeSystemCommissionerPairingWithUUID:(id)a4 completionHandler:(id)a5;
- (void)setAuthorizationServer:(id)a3;
- (void)setDevicePairingServer:(id)a3;
- (void)setDeviceSetupServer:(id)a3;
- (void)setSystemCommissionerPairingServer:(id)a3;
- (void)showRestrictedCharacteristicsAccessWarningAlertWithClientProxy:(id)a3;
- (void)start;
@end

@implementation MTSXPCServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProxies, 0);
  objc_storeStrong(&self->_clientProxyFactory, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_authorizationServer);
  objc_destroyWeak((id *)&self->_systemCommissionerPairingServer);
  objc_destroyWeak((id *)&self->_deviceSetupServer);

  objc_destroyWeak((id *)&self->_devicePairingServer);
}

- (NSMutableSet)clientProxies
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (id)clientProxyFactory
{
  return objc_getProperty(self, a2, 56, 1);
}

- (MTSXPCListener)listener
{
  return (MTSXPCListener *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAuthorizationServer:(id)a3
{
}

- (MTSAuthorizationServerInterface)authorizationServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authorizationServer);

  return (MTSAuthorizationServerInterface *)WeakRetained;
}

- (void)setSystemCommissionerPairingServer:(id)a3
{
}

- (MTSSystemCommissionerPairingServerInterface)systemCommissionerPairingServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemCommissionerPairingServer);

  return (MTSSystemCommissionerPairingServerInterface *)WeakRetained;
}

- (void)setDeviceSetupServer:(id)a3
{
}

- (MTSXPCDeviceSetupClientProxyDelegate)deviceSetupServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceSetupServer);

  return (MTSXPCDeviceSetupClientProxyDelegate *)WeakRetained;
}

- (void)setDevicePairingServer:(id)a3
{
}

- (MTSDevicePairingServerInterface)devicePairingServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_devicePairingServer);

  return (MTSDevicePairingServerInterface *)WeakRetained;
}

- (void)showRestrictedCharacteristicsAccessWarningAlertWithClientProxy:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 hasPrivateHomeKitEntitlement])
  {
    v5 = [(MTSXPCServer *)self authorizationServer];
    if (!v5) {
      _HMFPreconditionFailure();
    }
    v6 = v5;
    [v5 showRestrictedCharacteristicsAccessWarningAlert];
  }
  else
  {
    v7 = (void *)MEMORY[0x245697870]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      v12 = v10;
      __int16 v13 = 2112;
      v14 = @"com.apple.private.homekit";
      _os_log_impl(&dword_2450FD000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not showing restricted characteristics access warning because process is missing entitlement: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)clientProxy:(id)a3 checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if ([v6 hasPrivateHomeKitEntitlement])
  {
    v8 = [(MTSXPCServer *)self authorizationServer];
    if (!v8) {
      _HMFPreconditionFailure();
    }
    v9 = v8;
    [v8 checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:v7];
  }
  else
  {
    v10 = (void *)MEMORY[0x245697870]();
    int v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = HMFGetLogIdentifier();
      int v14 = 138543618;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      v17 = @"com.apple.private.homekit";
      _os_log_impl(&dword_2450FD000, v12, OS_LOG_TYPE_ERROR, "%{public}@Returning NO to check restricted characteristics access allowed because process is missing entitlement: %@", (uint8_t *)&v14, 0x16u);
    }
    v7[2](v7, 0);
  }
}

- (void)clientProxy:(id)a3 removeSystemCommissionerPairingWithUUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if ([v8 hasDevicePairingEntitlement])
  {
    int v11 = [(MTSXPCServer *)self systemCommissionerPairingServer];
    if (!v11) {
      _HMFPreconditionFailure();
    }
    v12 = v11;
    [v11 removeSystemCommissionerPairingWithUUID:v9 completionHandler:v10];
  }
  else
  {
    v12 = [NSString stringWithFormat:@"Process is missing entitlement: %@", @"com.apple.matter.support.xpc.device-pairing"];
    __int16 v13 = (void *)MEMORY[0x245697870]();
    int v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v19 = v16;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_2450FD000, v15, OS_LOG_TYPE_ERROR, "%{public}@Disallowing remove system commissioner pairing request because %@", buf, 0x16u);
    }
    v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:5 reason:v12];
    v10[2](v10, v17);
  }
}

- (void)clientProxy:(id)a3 fetchSystemCommissionerPairingsWithCompletionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if ([v6 hasDevicePairingEntitlement])
  {
    id v8 = [(MTSXPCServer *)self systemCommissionerPairingServer];
    if (!v8) {
      _HMFPreconditionFailure();
    }
    id v9 = v8;
    [v8 fetchSystemCommissionerPairingsWithCompletionHandler:v7];
  }
  else
  {
    id v9 = [NSString stringWithFormat:@"Process is missing entitlement: %@", @"com.apple.matter.support.xpc.device-pairing"];
    v10 = (void *)MEMORY[0x245697870]();
    int v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_2450FD000, v12, OS_LOG_TYPE_ERROR, "%{public}@Disallowing fetch system commissioner pairings request because %@", buf, 0x16u);
    }
    int v14 = [MEMORY[0x263F087E8] hmfErrorWithCode:5 reason:v9];
    v7[2](v7, 0, v14);
  }
}

- (void)clientProxy:(id)a3 performDeviceSetupUsingRequest:(id)a4 completionHandler:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(MTSXPCServer *)self deviceSetupServer];
  if (v10)
  {
    int v11 = v10;
    [v10 clientProxy:v17 performDeviceSetupUsingRequest:v8 completionHandler:v9];
  }
  else
  {
    v12 = (MTSXPCServer *)_HMFPreconditionFailure();
    [(MTSXPCServer *)v12 clientProxy:v14 readCommissioningWindowStatusForSystemCommissionerPairingUUID:v15 completionHandler:v16];
  }
}

- (void)clientProxy:(id)a3 readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  if ([v8 hasDevicePairingEntitlement])
  {
    int v11 = [(MTSXPCServer *)self devicePairingServer];
    if (!v11) {
      _HMFPreconditionFailure();
    }
    v12 = v11;
    [v11 readCommissioningWindowStatusForSystemCommissionerPairingUUID:v9 completionHandler:v10];
  }
  else
  {
    v12 = [NSString stringWithFormat:@"Process is missing entitlement: %@", @"com.apple.matter.support.xpc.device-pairing"];
    SEL v13 = (void *)MEMORY[0x245697870]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v16;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_2450FD000, v15, OS_LOG_TYPE_ERROR, "%{public}@Disallowing reading commissioning window status because %@", buf, 0x16u);
    }
    id v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:5 reason:v12];
    v10[2](v10, 0, v17);
  }
}

- (void)clientProxy:(id)a3 openCommissioningWindowForSystemCommissionerPairingUUID:(id)a4 duration:(double)a5 completionHandler:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v10 hasDevicePairingEntitlement])
  {
    SEL v13 = [(MTSXPCServer *)self devicePairingServer];
    if (!v13) {
      _HMFPreconditionFailure();
    }
    id v14 = v13;
    [v13 openCommissioningWindowForSystemCommissionerPairingUUID:v11 duration:v12 completionHandler:a5];
  }
  else
  {
    id v14 = [NSString stringWithFormat:@"Process is missing entitlement: %@", @"com.apple.matter.support.xpc.device-pairing"];
    id v15 = (void *)MEMORY[0x245697870]();
    id v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v21 = v18;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_2450FD000, v17, OS_LOG_TYPE_ERROR, "%{public}@Disallowing opening commissioning window because %@", buf, 0x16u);
    }
    uint64_t v19 = [MEMORY[0x263F087E8] hmfErrorWithCode:5 reason:v14];
    (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0, 0, v19);
  }
}

- (void)clientProxy:(id)a3 removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if ([v8 hasDevicePairingEntitlement])
  {
    id v11 = [(MTSXPCServer *)self devicePairingServer];
    if (!v11) {
      _HMFPreconditionFailure();
    }
    id v12 = v11;
    [v11 removeAllDevicePairingsForSystemCommissionerPairingUUID:v9 completionHandler:v10];
  }
  else
  {
    id v12 = [NSString stringWithFormat:@"Process is missing entitlement: %@", @"com.apple.matter.support.xpc.device-pairing"];
    SEL v13 = (void *)MEMORY[0x245697870]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v16;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_2450FD000, v15, OS_LOG_TYPE_ERROR, "%{public}@Disallowing remove all device pairings because %@", buf, 0x16u);
    }
    id v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:5 reason:v12];
    v10[2](v10, v17);
  }
}

- (void)clientProxy:(id)a3 removeDevicePairingWithUUID:(id)a4 forSystemCommissionerPairingUUID:(id)a5 completionHandler:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  SEL v13 = (void (**)(id, void *))a6;
  if ([v10 hasDevicePairingEntitlement])
  {
    id v14 = [(MTSXPCServer *)self devicePairingServer];
    if (!v14) {
      _HMFPreconditionFailure();
    }
    id v15 = v14;
    [v14 removeDevicePairingWithUUID:v11 forSystemCommissionerPairingUUID:v12 completionHandler:v13];
  }
  else
  {
    id v15 = [NSString stringWithFormat:@"Process is missing entitlement: %@", @"com.apple.matter.support.xpc.device-pairing"];
    id v16 = (void *)MEMORY[0x245697870]();
    id v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v19;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      _os_log_impl(&dword_2450FD000, v18, OS_LOG_TYPE_ERROR, "%{public}@Disallowing remove device pairing request because %@", buf, 0x16u);
    }
    __int16 v20 = [MEMORY[0x263F087E8] hmfErrorWithCode:5 reason:v15];
    v13[2](v13, v20);
  }
}

- (void)clientProxy:(id)a3 fetchDevicePairingsForSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if ([v8 hasDevicePairingEntitlement])
  {
    id v11 = [(MTSXPCServer *)self devicePairingServer];
    if (!v11) {
      _HMFPreconditionFailure();
    }
    id v12 = v11;
    [v11 fetchDevicePairingsForSystemCommissionerPairingUUID:v9 completionHandler:v10];
  }
  else
  {
    id v12 = [NSString stringWithFormat:@"Process is missing entitlement: %@", @"com.apple.matter.support.xpc.device-pairing"];
    SEL v13 = (void *)MEMORY[0x245697870]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v16;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_2450FD000, v15, OS_LOG_TYPE_ERROR, "%{public}@Disallowing fetch device pairings request because %@", buf, 0x16u);
    }
    id v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:5 reason:v12];
    v10[2](v10, 0, v17);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTSXPCServer *)self clientProxyFactory];
  id v9 = ((void (**)(void, id))v8)[2](v8, v7);

  id v10 = (void *)MEMORY[0x245697870]([v9 setDelegate:self]);
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    SEL v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v26 = v13;
    __int16 v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_2450FD000, v12, OS_LOG_TYPE_INFO, "%{public}@Accepting new client proxy: %@", buf, 0x16u);
  }
  id v14 = objc_msgSend(MEMORY[0x263F08D80], "mts_clientInterface");
  [v7 setRemoteObjectInterface:v14];

  id v15 = objc_msgSend(MEMORY[0x263F08D80], "mts_serverInterface");
  [v7 setExportedInterface:v15];

  [v7 setExportedObject:v9];
  objc_initWeak((id *)buf, v9);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __51__MTSXPCServer_listener_shouldAcceptNewConnection___block_invoke;
  uint64_t v22 = &unk_2651C5CF0;
  objc_copyWeak(&v24, (id *)buf);
  __int16 v23 = v11;
  [v7 setInvalidationHandler:&v19];
  p_lock = &v11->_lock;
  os_unfair_lock_lock_with_options();
  id v17 = [(MTSXPCServer *)v11 clientProxies];
  [v17 addObject:v9];

  os_unfair_lock_unlock(p_lock);
  [v7 resume];
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

  return 1;
}

void __51__MTSXPCServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x245697870]();
    id v4 = *(id *)(a1 + 32);
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v9 = 138543618;
      id v10 = v6;
      __int16 v11 = 2112;
      id v12 = WeakRetained;
      _os_log_impl(&dword_2450FD000, v5, OS_LOG_TYPE_INFO, "%{public}@Client proxy invalidated: %@", (uint8_t *)&v9, 0x16u);
    }
    id v7 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
    os_unfair_lock_lock_with_options();
    id v8 = [*(id *)(a1 + 32) clientProxies];
    [v8 removeObject:WeakRetained];

    os_unfair_lock_unlock(v7);
  }
}

- (void)start
{
  v3 = [(MTSXPCServer *)self listener];
  [v3 setDelegate:self];

  id v4 = [(MTSXPCServer *)self listener];
  [v4 start];
}

- (MTSXPCServer)initWithListener:(id)a3 clientProxyFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  int v9 = v8;
  if (!v8)
  {
LABEL_7:
    id v17 = (MTSXPCServer *)_HMFPreconditionFailure();
    return [(MTSXPCServer *)v17 init];
  }
  v19.receiver = self;
  v19.super_class = (Class)MTSXPCServer;
  id v10 = [(MTSXPCServer *)&v19 init];
  __int16 v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_listener, a3);
    id v12 = _Block_copy(v9);
    id clientProxyFactory = v11->_clientProxyFactory;
    v11->_id clientProxyFactory = v12;

    uint64_t v14 = [MEMORY[0x263EFF9C0] set];
    clientProxies = v11->_clientProxies;
    v11->_clientProxies = (NSMutableSet *)v14;
  }
  return v11;
}

- (MTSXPCServer)init
{
  v3 = [MTSXPCListener alloc];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.matter.support.xpc"];
  v5 = [(MTSXPCListener *)v3 initWithXPCListener:v4];

  id v6 = [(MTSXPCServer *)self initWithListener:v5 clientProxyFactory:&__block_literal_global_2193];
  return v6;
}

MTSXPCClientProxy *__20__MTSXPCServer_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MTSXPCClientProxy alloc] initWithConnection:v2];

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_2200 != -1) {
    dispatch_once(&logCategory__hmf_once_t13_2200, &__block_literal_global_28);
  }
  id v2 = (void *)logCategory__hmf_once_v14_2201;

  return v2;
}

uint64_t __27__MTSXPCServer_logCategory__block_invoke()
{
  logCategory__hmf_once_v14_2201 = HMFCreateOSLogHandle();

  return MEMORY[0x270F9A758]();
}

@end