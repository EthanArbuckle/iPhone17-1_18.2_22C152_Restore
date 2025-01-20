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
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  v4 = [WeakRetained primaryResident];
  if (v4)
  {
    v5 = (void *)[(HMFMessage *)self->_message copy];
    v6 = (void *)[v5 mutableCopy];

    [v6 setRemote:1];
    [v6 setSecureRemote:1];
    v7 = [HMDRemoteDeviceMessageDestination alloc];
    v8 = [(HMFMessage *)self->_message destination];
    v9 = [v8 target];
    v10 = [v4 device];
    v11 = [(HMDRemoteDeviceMessageDestination *)v7 initWithTarget:v9 device:v10];
    [v6 setDestination:v11];

    objc_initWeak(&location, self);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke;
    v23[3] = &unk_1E6A17A08;
    objc_copyWeak(&v24, &location);
    v12 = (void *)MEMORY[0x1D9452090]([v6 setResponseHandler:v23]);
    v13 = self;
    HMFGetOSLogHandle();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v15;
      __int16 v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Sending message: %@", buf, 0x16u);
    }
    v16 = [(HMDHomeAdministratorConfigurationOperation *)v13 dispatcher];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke_8;
    v21[3] = &unk_1E6A18528;
    objc_copyWeak(&v22, &location);
    [v16 sendMessage:v6 completionHandler:v21];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    v17 = (void *)MEMORY[0x1D9452090]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to forward message to home without a resident", buf, 0xCu);
    }
    v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48 description:0 reason:@"A home hub is required." suggestion:0];
    [(HMFOperation *)v18 cancelWithError:v6];
  }
}

void __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = WeakRetained;
  v10 = HMFGetOSLogHandle();
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v12;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to forward message with error: %@", (uint8_t *)&v19, 0x16u);
    }
    [v9 cancelWithError:v5];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Received confirmation for forwarded message", (uint8_t *)&v19, 0xCu);
    }
    [v9 finish];
  }
  v14 = [v9 responseHandler];
  if (v14)
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = v9;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Notifying client of response", (uint8_t *)&v19, 0xCu);
    }
    [v16 setResponseHandler:0];
    ((void (**)(void, id, id))v14)[2](v14, v5, v6);
  }
}

void __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained sendCompletionBlock];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = WeakRetained;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      v11 = v9;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying client the send completed with error: %@", (uint8_t *)&v10, 0x16u);
    }
    [v7 setSendCompletionBlock:0];
    ((void (**)(void, id))v5)[2](v5, v3);
  }
}

- (HMDHomeAdministratorConfigurationOperation)initWithMessage:(id)a3 home:(id)a4 dispatcher:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = v11;
  id v13 = 0;
  if (v9 && v10 && v11)
  {
    [(id)objc_opt_class() timeout];
    v19.receiver = self;
    v19.super_class = (Class)HMDHomeAdministratorConfigurationOperation;
    uint64_t v14 = [(HMFOperation *)&v19 initWithTimeout:sel_initWithTimeout_];
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
    id v13 = self;
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_113772 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_113772, &__block_literal_global_113773);
  }
  v2 = (void *)logCategory__hmf_once_v7_113774;
  return v2;
}

uint64_t __57__HMDHomeAdministratorConfigurationOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v7_113774;
  logCategory__hmf_once_v7_113774 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (double)timeout
{
  v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v3 = [v2 preferenceForKey:@"adminConfigurationOperationTimeout"];

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