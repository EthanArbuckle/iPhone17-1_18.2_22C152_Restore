@interface MTSXPCServerProxy
+ (id)logCategory;
- (MTSXPCConnection)connection;
- (MTSXPCServerProxy)init;
- (MTSXPCServerProxy)initWithConnectionFactory:(id)a3;
- (NSUUID)UUID;
- (id)connectionFactory;
- (id)logIdentifier;
- (void)checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)fetchDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4;
- (void)fetchSystemCommissionerPairingsWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)openCommissioningWindowForSystemCommissionerPairingUUID:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)performDeviceSetupUsingRequest:(id)a3 completionHandler:(id)a4;
- (void)readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4;
- (void)removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4;
- (void)removeDevicePairingWithUUID:(id)a3 forSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5;
- (void)removeSystemCommissionerPairingWithUUID:(id)a3 completionHandler:(id)a4;
- (void)setConnection:(id)a3;
- (void)showRestrictedCharacteristicsAccessWarningAlert;
@end

@implementation MTSXPCServerProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_connectionFactory, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setConnection:(id)a3
{
}

- (id)connectionFactory
{
  return objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  v2 = [(MTSXPCServerProxy *)self UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)showRestrictedCharacteristicsAccessWarningAlert
{
  v3 = [(MTSXPCServerProxy *)self connection];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__MTSXPCServerProxy_showRestrictedCharacteristicsAccessWarningAlert__block_invoke;
  v5[3] = &unk_2651C5DA0;
  v5[4] = self;
  v4 = [v3 remoteObjectProxyWithErrorHandler:v5];

  [v4 showRestrictedCharacteristicsAccessWarningAlert];
}

void __68__MTSXPCServerProxy_showRestrictedCharacteristicsAccessWarningAlert__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for showing warning: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSXPCServerProxy *)self connection];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  __int16 v10 = __86__MTSXPCServerProxy_checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler___block_invoke;
  id v11 = &unk_2651C5D78;
  uint64_t v12 = self;
  id v13 = v4;
  id v6 = v4;
  v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&v8];

  objc_msgSend(v7, "checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:", v6, v8, v9, v10, v11, v12);
}

void __86__MTSXPCServerProxy_checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for checking allows restricted characteristics access: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeSystemCommissionerPairingWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(MTSXPCServerProxy *)self connection];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __79__MTSXPCServerProxy_removeSystemCommissionerPairingWithUUID_completionHandler___block_invoke;
  v14 = &unk_2651C5D78;
  v15 = self;
  id v16 = v6;
  id v9 = v6;
  __int16 v10 = [v8 remoteObjectProxyWithErrorHandler:&v11];

  objc_msgSend(v10, "removeSystemCommissionerPairingWithUUID:completionHandler:", v7, v9, v11, v12, v13, v14, v15);
}

void __79__MTSXPCServerProxy_removeSystemCommissionerPairingWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for remove system commissioner pairing: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchSystemCommissionerPairingsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSXPCServerProxy *)self connection];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  __int16 v10 = __74__MTSXPCServerProxy_fetchSystemCommissionerPairingsWithCompletionHandler___block_invoke;
  id v11 = &unk_2651C5D78;
  uint64_t v12 = self;
  id v13 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:&v8];

  objc_msgSend(v7, "fetchSystemCommissionerPairingsWithCompletionHandler:", v6, v8, v9, v10, v11, v12);
}

void __74__MTSXPCServerProxy_fetchSystemCommissionerPairingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for fetch system commissioner pairings: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)performDeviceSetupUsingRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(MTSXPCServerProxy *)self connection];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __70__MTSXPCServerProxy_performDeviceSetupUsingRequest_completionHandler___block_invoke;
  v14 = &unk_2651C5D78;
  v15 = self;
  id v16 = v6;
  id v9 = v6;
  __int16 v10 = [v8 remoteObjectProxyWithErrorHandler:&v11];

  objc_msgSend(v10, "performDeviceSetupUsingRequest:completionHandler:", v7, v9, v11, v12, v13, v14, v15);
}

void __70__MTSXPCServerProxy_performDeviceSetupUsingRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for performDeviceSetupUsingRequest: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(MTSXPCServerProxy *)self connection];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __101__MTSXPCServerProxy_readCommissioningWindowStatusForSystemCommissionerPairingUUID_completionHandler___block_invoke;
  v14 = &unk_2651C5D78;
  v15 = self;
  id v16 = v6;
  id v9 = v6;
  __int16 v10 = [v8 remoteObjectProxyWithErrorHandler:&v11];

  objc_msgSend(v10, "readCommissioningWindowStatusForSystemCommissionerPairingUUID:completionHandler:", v7, v9, v11, v12, v13, v14, v15);
}

void __101__MTSXPCServerProxy_readCommissioningWindowStatusForSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for reading commissioning window status: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)openCommissioningWindowForSystemCommissionerPairingUUID:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  __int16 v10 = [(MTSXPCServerProxy *)self connection];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __104__MTSXPCServerProxy_openCommissioningWindowForSystemCommissionerPairingUUID_duration_completionHandler___block_invoke;
  id v16 = &unk_2651C5D78;
  v17 = self;
  id v18 = v8;
  id v11 = v8;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:&v13];

  objc_msgSend(v12, "openCommissioningWindowForSystemCommissionerPairingUUID:duration:completionHandler:", v9, v11, a4, v13, v14, v15, v16, v17);
}

void __104__MTSXPCServerProxy_openCommissioningWindowForSystemCommissionerPairingUUID_duration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for opening commissioning window: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(MTSXPCServerProxy *)self connection];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __95__MTSXPCServerProxy_removeAllDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke;
  uint64_t v14 = &unk_2651C5D78;
  v15 = self;
  id v16 = v6;
  id v9 = v6;
  __int16 v10 = [v8 remoteObjectProxyWithErrorHandler:&v11];

  objc_msgSend(v10, "removeAllDevicePairingsForSystemCommissionerPairingUUID:completionHandler:", v7, v9, v11, v12, v13, v14, v15);
}

void __95__MTSXPCServerProxy_removeAllDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for remove all device pairings: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeDevicePairingWithUUID:(id)a3 forSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTSXPCServerProxy *)self connection];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __100__MTSXPCServerProxy_removeDevicePairingWithUUID_forSystemCommissionerPairingUUID_completionHandler___block_invoke;
  v17 = &unk_2651C5D78;
  id v18 = self;
  id v19 = v8;
  id v12 = v8;
  uint64_t v13 = [v11 remoteObjectProxyWithErrorHandler:&v14];

  objc_msgSend(v13, "removeDevicePairingWithUUID:forSystemCommissionerPairingUUID:completionHandler:", v10, v9, v12, v14, v15, v16, v17, v18);
}

void __100__MTSXPCServerProxy_removeDevicePairingWithUUID_forSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for remove device pairing: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(MTSXPCServerProxy *)self connection];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __91__MTSXPCServerProxy_fetchDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke;
  uint64_t v14 = &unk_2651C5D78;
  uint64_t v15 = self;
  id v16 = v6;
  id v9 = v6;
  __int16 v10 = [v8 remoteObjectProxyWithErrorHandler:&v11];

  objc_msgSend(v10, "fetchDevicePairingsForSystemCommissionerPairingUUID:completionHandler:", v7, v9, v11, v12, v13, v14, v15);
}

void __91__MTSXPCServerProxy_fetchDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x245697870]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2450FD000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain remote object proxy for fetch device pairings: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (MTSXPCConnection)connection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  connection = self->_connection;
  if (connection)
  {
    id v5 = connection;
  }
  else
  {
    id v6 = [(MTSXPCServerProxy *)self connectionFactory];
    v6[2]();
    id v5 = (MTSXPCConnection *)objc_claimAutoreleasedReturnValue();

    id v7 = objc_msgSend(MEMORY[0x263F08D80], "mts_clientInterface");
    [(MTSXPCConnection *)v5 setExportedInterface:v7];

    [(MTSXPCConnection *)v5 setExportedObject:self];
    int v8 = objc_msgSend(MEMORY[0x263F08D80], "mts_serverInterface");
    [(MTSXPCConnection *)v5 setRemoteObjectInterface:v8];

    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __31__MTSXPCServerProxy_connection__block_invoke;
    v12[3] = &unk_2651C5D50;
    objc_copyWeak(&v13, &location);
    [(MTSXPCConnection *)v5 setInterruptionHandler:v12];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __31__MTSXPCServerProxy_connection__block_invoke_8;
    v10[3] = &unk_2651C5D50;
    objc_copyWeak(&v11, &location);
    [(MTSXPCConnection *)v5 setInvalidationHandler:v10];
    objc_storeStrong((id *)&self->_connection, v5);
    [(MTSXPCConnection *)v5 resume];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_lock);

  return v5;
}

void __31__MTSXPCServerProxy_connection__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x245697870]();
    id v3 = WeakRetained;
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = HMFGetLogIdentifier();
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_2450FD000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Connection to daemon was interrupted", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __31__MTSXPCServerProxy_connection__block_invoke_8(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x245697870]();
    id v3 = (os_unfair_lock_s *)WeakRetained;
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = HMFGetLogIdentifier();
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_2450FD000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Connection to daemon was invalidated", (uint8_t *)&v6, 0xCu);
    }
    os_unfair_lock_lock_with_options();
    [(os_unfair_lock_s *)v3 setConnection:0];
    os_unfair_lock_unlock(v3 + 2);
  }
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(MTSXPCConnection *)self->_connection invalidate];

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(MTSXPCConnection *)self->_connection invalidate];
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)MTSXPCServerProxy;
  [(MTSXPCServerProxy *)&v4 dealloc];
}

- (MTSXPCServerProxy)initWithConnectionFactory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    v15.receiver = self;
    v15.super_class = (Class)MTSXPCServerProxy;
    int v6 = [(MTSXPCServerProxy *)&v15 init];
    id v7 = v6;
    if (v6)
    {
      v6->_lock._os_unfair_lock_opaque = 0;
      uint64_t v8 = [MEMORY[0x263F08C38] UUID];
      UUID = v7->_UUID;
      v7->_UUID = (NSUUID *)v8;

      __int16 v10 = _Block_copy(v5);
      id connectionFactory = v7->_connectionFactory;
      v7->_id connectionFactory = v10;
    }
    return v7;
  }
  else
  {
    id v13 = (MTSXPCServerProxy *)_HMFPreconditionFailure();
    return [(MTSXPCServerProxy *)v13 init];
  }
}

- (MTSXPCServerProxy)init
{
  return [(MTSXPCServerProxy *)self initWithConnectionFactory:&__block_literal_global_2325];
}

MTSXPCConnection *__25__MTSXPCServerProxy_init__block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.matter.support.xpc" options:0];
  v1 = [[MTSXPCConnection alloc] initWithXPCConnection:v0];

  return v1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16 != -1) {
    dispatch_once(&logCategory__hmf_once_t16, &__block_literal_global_11);
  }
  v2 = (void *)logCategory__hmf_once_v17;

  return v2;
}

uint64_t __32__MTSXPCServerProxy_logCategory__block_invoke()
{
  logCategory__hmf_once_v17 = HMFCreateOSLogHandle();

  return MEMORY[0x270F9A758]();
}

@end