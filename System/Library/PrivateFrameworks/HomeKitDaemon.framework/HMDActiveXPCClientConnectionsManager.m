@interface HMDActiveXPCClientConnectionsManager
+ (id)logCategory;
- (HMDActiveXPCClientConnectionsManager)initWithLogIdentifier:(id)a3 workQueue:(id)a4;
- (HMDActiveXPCClientConnectionsManagerDelegate)delegate;
- (NSHashTable)mutableClientConnections;
- (NSSet)clientConnections;
- (NSString)logIdentifier;
- (OS_dispatch_queue)workQueue;
- (void)addClientConnection:(id)a3;
- (void)configure;
- (void)handleClientConnectionDidActivate:(id)a3;
- (void)handleClientConnectionDidDeactivate:(id)a3;
- (void)removeClientConnection:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMDActiveXPCClientConnectionsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableClientConnections, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (NSHashTable)mutableClientConnections
{
  return (NSHashTable *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDActiveXPCClientConnectionsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDActiveXPCClientConnectionsManagerDelegate *)WeakRetained;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)handleClientConnectionDidDeactivate:(id)a3
{
  v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"connection"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(HMDActiveXPCClientConnectionsManager *)self clientConnections];
    int v9 = [v8 containsObject:v7];

    if (v9)
    {
      v10 = [(HMDActiveXPCClientConnectionsManager *)self workQueue];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __76__HMDActiveXPCClientConnectionsManager_handleClientConnectionDidDeactivate___block_invoke;
      v11[3] = &unk_264A2F820;
      v11[4] = self;
      id v12 = v7;
      dispatch_async(v10, v11);
    }
  }
}

void __76__HMDActiveXPCClientConnectionsManager_handleClientConnectionDidDeactivate___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    int v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling client connection did deactivate: %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) delegate];
  [v7 clientConnectionsManager:*(void *)(a1 + 32) didHandleDeactivationForClientConnection:*(void *)(a1 + 40)];
}

- (void)handleClientConnectionDidActivate:(id)a3
{
  v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"connection"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    int v8 = [(HMDActiveXPCClientConnectionsManager *)self clientConnections];
    int v9 = [v8 containsObject:v7];

    if (v9)
    {
      __int16 v10 = [(HMDActiveXPCClientConnectionsManager *)self workQueue];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __74__HMDActiveXPCClientConnectionsManager_handleClientConnectionDidActivate___block_invoke;
      v11[3] = &unk_264A2F820;
      v11[4] = self;
      id v12 = v7;
      dispatch_async(v10, v11);
    }
  }
}

void __74__HMDActiveXPCClientConnectionsManager_handleClientConnectionDidActivate___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    int v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling client connection did activate: %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) delegate];
  [v7 clientConnectionsManager:*(void *)(a1 + 32) didHandleActivationForClientConnection:*(void *)(a1 + 40)];
}

- (void)removeClientConnection:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDActiveXPCClientConnectionsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    int v12 = 138543618;
    v13 = v9;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing client connection: %@", (uint8_t *)&v12, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  __int16 v10 = [(HMDActiveXPCClientConnectionsManager *)v7 mutableClientConnections];
  [v10 removeObject:v4];

  os_unfair_lock_unlock(&v7->_lock);
  uint64_t v11 = [(HMDActiveXPCClientConnectionsManager *)v7 delegate];
  [v11 clientConnectionsManager:v7 didHandleDeactivationForClientConnection:v4];
}

- (void)addClientConnection:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDActiveXPCClientConnectionsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    int v12 = 138543618;
    v13 = v9;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Adding client connection: %@", (uint8_t *)&v12, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  __int16 v10 = [(HMDActiveXPCClientConnectionsManager *)v7 mutableClientConnections];
  [v10 addObject:v4];

  os_unfair_lock_unlock(&v7->_lock);
  if ([v4 isActivated])
  {
    uint64_t v11 = [(HMDActiveXPCClientConnectionsManager *)v7 delegate];
    [v11 clientConnectionsManager:v7 didHandleActivationForClientConnection:v4];
  }
}

- (void)configure
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_handleClientConnectionDidActivate_ name:@"HMDXPCClientConnectionDidActivateNotification" object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_handleClientConnectionDidDeactivate_ name:@"HMDXPCClientConnectionDidDeactivateNotification" object:0];
}

- (NSSet)clientConnections
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)MEMORY[0x263EFFA08];
  v5 = [(HMDActiveXPCClientConnectionsManager *)self mutableClientConnections];
  uint64_t v6 = [v5 allObjects];
  id v7 = [v4 setWithArray:v6];

  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v7;
}

- (HMDActiveXPCClientConnectionsManager)initWithLogIdentifier:(id)a3 workQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  int v8 = v7;
  if (!v7)
  {
LABEL_7:
    id v15 = (void *)_HMFPreconditionFailure();
    return (HMDActiveXPCClientConnectionsManager *)+[HMDActiveXPCClientConnectionsManager logCategory];
  }
  v17.receiver = self;
  v17.super_class = (Class)HMDActiveXPCClientConnectionsManager;
  int v9 = [(HMDActiveXPCClientConnectionsManager *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    logIdentifier = v9->_logIdentifier;
    v9->_logIdentifier = (NSString *)v10;

    objc_storeStrong((id *)&v9->_workQueue, a4);
    uint64_t v12 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    mutableClientConnections = v9->_mutableClientConnections;
    v9->_mutableClientConnections = (NSHashTable *)v12;
  }
  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_251853 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_251853, &__block_literal_global_251854);
  }
  v2 = (void *)logCategory__hmf_once_v10_251855;
  return v2;
}

void __51__HMDActiveXPCClientConnectionsManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v10_251855;
  logCategory__hmf_once_v10_251855 = v0;
}

@end