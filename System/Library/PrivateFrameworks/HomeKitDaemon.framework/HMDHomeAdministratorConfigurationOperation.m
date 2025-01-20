@interface HMDHomeAdministratorConfigurationOperation
+ (double)timeout;
+ (id)logCategory;
- (BOOL)shouldSuspendSyncing;
- (HMDHome)home;
- (HMDHomeAdministratorConfigurationOperation)initWithMessage:(id)a3 home:(id)a4 dispatcher:(id)a5;
- (HMFMessage)message;
- (HMFMessageDispatcher)dispatcher;
- (id)logIdentifier;
- (id)responseHandler;
- (id)sendCompletionBlock;
- (void)main;
- (void)setResponseHandler:(id)a3;
- (void)setSendCompletionBlock:(id)a3;
- (void)setShouldSuspendSyncing:(BOOL)a3;
@end

@implementation HMDHomeAdministratorConfigurationOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong(&self->_sendCompletionBlock, 0);
}

- (HMFMessageDispatcher)dispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 352, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (HMFMessage)message
{
  return (HMFMessage *)objc_getProperty(self, a2, 336, 1);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return objc_getProperty(self, a2, 328, 1);
}

- (void)setSendCompletionBlock:(id)a3
{
}

- (id)sendCompletionBlock
{
  return objc_getProperty(self, a2, 320, 1);
}

- (void)setShouldSuspendSyncing:(BOOL)a3
{
  self->_shouldSuspendSyncing = a3;
}

- (BOOL)shouldSuspendSyncing
{
  return self->_shouldSuspendSyncing;
}

- (id)logIdentifier
{
  v2 = [(HMDHomeAdministratorConfigurationOperation *)self message];
  v3 = [v2 identifier];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)main
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  v4 = (void *)[(HMFMessage *)self->_message mutableCopy];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke;
  v11[3] = &unk_264A2F0C8;
  v11[4] = self;
  [v4 setResponseHandler:v11];
  if ([(HMFMessage *)self->_message isAuthorizedForLocationAccess]) {
    [v4 setHeaderValue:MEMORY[0x263EFFA88] forKey:@"cl.locauthz"];
  }
  if ([(HMFMessage *)self->_message isEntitledForShortcutsAutomationAccess]) {
    [v4 setHeaderValue:MEMORY[0x263EFFA88] forKey:@"cl.shortcutent"];
  }
  v5 = [HMDRemoteHomeMessageDestination alloc];
  v6 = [(HMFMessage *)self->_message destination];
  v7 = [v6 target];
  v8 = [WeakRetained uuid];
  v9 = [(HMDRemoteHomeMessageDestination *)v5 initWithTarget:v7 homeUUID:v8 queueTimeout:&unk_26E472388];

  [v4 setDestination:v9];
  v10 = [WeakRetained residentSyncManager];
  [v10 performResidentRequest:v4 options:0];
}

void __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (a2)
  {
    [*(id *)(v6 + 336) respondWithError:a2];
    [*(id *)(a1 + 32) finish];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 344));
    v8 = [WeakRetained backingStore];
    v9 = [v8 context];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke_2;
    v10[3] = &unk_264A2F820;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v5;
    [v9 performBlock:v10];
  }
}

uint64_t __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 336) respondWithPayload:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 finish];
}

- (HMDHomeAdministratorConfigurationOperation)initWithMessage:(id)a3 home:(id)a4 dispatcher:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v9 && v10 && v11)
  {
    [(id)objc_opt_class() timeout];
    v19.receiver = self;
    v19.super_class = (Class)HMDHomeAdministratorConfigurationOperation;
    v14 = [(HMFOperation *)&v19 initWithTimeout:sel_initWithTimeout_];
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_message, a3);
      objc_storeWeak((id *)&v15->_home, v10);
      objc_storeStrong((id *)&v15->_dispatcher, a5);
      uint64_t v16 = [v9 responseHandler];
      id responseHandler = v15->_responseHandler;
      v15->_id responseHandler = (id)v16;

      -[HMFOperation setQualityOfService:](v15, "setQualityOfService:", [v9 qualityOfService]);
    }
    self = v15;
    v13 = self;
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_164838 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_164838, &__block_literal_global_164839);
  }
  v2 = (void *)logCategory__hmf_once_v1_164840;
  return v2;
}

void __57__HMDHomeAdministratorConfigurationOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_164840;
  logCategory__hmf_once_v1_164840 = v0;
}

+ (double)timeout
{
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  v3 = [v2 preferenceForKey:@"adminConfigurationOperationTimeout"];

  v4 = [v3 numberValue];

  if (v4)
  {
    id v5 = [v3 numberValue];
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 65.0;
  }

  return v7;
}

@end