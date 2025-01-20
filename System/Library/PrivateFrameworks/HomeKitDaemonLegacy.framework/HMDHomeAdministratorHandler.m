@interface HMDHomeAdministratorHandler
+ (id)logCategory;
- (BOOL)shouldRelayMessages;
- (HMDHome)home;
- (HMDHomeAdministratorHandler)initWithHome:(id)a3;
- (HMDHomeAdministratorHandler)initWithHome:(id)a3 dispatcher:(id)a4;
- (HMDHomeAdministratorHandler)initWithTransport:(id)a3;
- (HMFMessageDispatcher)dispatcher;
- (NSOperationQueue)operationQueue;
- (id)logIdentifier;
- (id)operationForMessage:(id)a3 error:(id *)a4;
- (id)syncOperationManager;
- (id)wrapReceiver:(id)a3;
- (void)addOperation:(id)a3;
- (void)deregisterReceiver:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerForMessage:(id)a3 receiver:(id)a4 policies:(id)a5 selector:(SEL)a6;
@end

@implementation HMDHomeAdministratorHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (HMFMessageDispatcher)dispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 104, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDHomeAdministratorHandler *)self home];
  v3 = [v2 name];

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(HMDHomeAdministratorHandler *)self syncOperationManager];
  id v13 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    v16 = (void *)MEMORY[0x1D9452090]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = HMFGetLogIdentifier();
      int v33 = 138544130;
      v34 = v19;
      __int16 v35 = 2112;
      id v36 = v15;
      __int16 v37 = 2112;
      id v38 = v9;
      __int16 v39 = 2112;
      id v40 = v11;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Received notification operation '%@' property '%@' updated to: %@", (uint8_t *)&v33, 0x2Au);
    }
    if ([v9 isEqualToString:@"isExecuting"])
    {
      v20 = (void *)MEMORY[0x1D9452090]();
      v21 = v17;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = HMFGetLogIdentifier();
        int v33 = 138543362;
        v34 = v23;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Disabling syncing", (uint8_t *)&v33, 0xCu);
      }
      [v12 pauseCloudPush];
      [v15 removeObserver:v21 forKeyPath:v9];
    }
    else if ([v9 isEqualToString:@"isFinished"] {
           && [v15 isFinished])
    }
    {
      v24 = [v15 error];

      BOOL v25 = v24 == 0;
      v26 = (void *)MEMORY[0x1D9452090]();
      v27 = v17;
      v28 = HMFGetOSLogHandle();
      v29 = v28;
      if (v25)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v32 = HMFGetLogIdentifier();
          int v33 = 138543362;
          v34 = v32;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Enabling syncing", (uint8_t *)&v33, 0xCu);
        }
        [v12 resumeCloudPush];
      }
      else
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v30 = HMFGetLogIdentifier();
          v31 = [v15 error];
          int v33 = 138543874;
          v34 = v30;
          __int16 v35 = 2112;
          id v36 = v15;
          __int16 v37 = 2112;
          id v38 = v31;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Operation '%@' failed, resetting syncing: %@", (uint8_t *)&v33, 0x20u);
        }
        [v12 killCloudPushAndResume];
      }
      [v15 removeObserver:v27 forKeyPath:v9];
    }
  }
}

- (void)addOperation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1D9452090]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v8;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Adding operation: %@", (uint8_t *)&v13, 0x16u);
    }
    if ([v4 shouldSuspendSyncing])
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = v6;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        int v13 = 138543362;
        v14 = v12;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Registering for state change notifications", (uint8_t *)&v13, 0xCu);
      }
      [v4 addObserver:v10 forKeyPath:@"isExecuting" options:0 context:0];
      [v4 addObserver:v10 forKeyPath:@"isFinished" options:0 context:0];
    }
    [(NSOperationQueue *)v6->_queue addOperation:v4];
  }
}

- (id)operationForMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    if (WeakRetained)
    {
      v8 = [(HMDHomeAdministratorHandler *)self dispatcher];

      if (v8)
      {
        id v9 = [HMDHomeAdministratorConfigurationOperation alloc];
        id v10 = [(HMDHomeAdministratorHandler *)self dispatcher];
        id v11 = [(HMDHomeAdministratorConfigurationOperation *)v9 initWithMessage:v6 home:WeakRetained dispatcher:v10];

LABEL_14:
        goto LABEL_15;
      }
      if (a4)
      {
        v12 = (void *)MEMORY[0x1E4F28C58];
        int v13 = @"Dispatcher is nil.";
        uint64_t v14 = -1;
        goto LABEL_11;
      }
    }
    else if (a4)
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      int v13 = @"The home is no longer valid.";
      uint64_t v14 = 2;
LABEL_11:
      [v12 hmErrorWithCode:v14 description:0 reason:v13 suggestion:0];
      id v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    id v11 = 0;
    goto LABEL_14;
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
LABEL_15:

  return v11;
}

- (BOOL)shouldRelayMessages
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  v3 = WeakRetained;
  if (WeakRetained) {
    char v4 = [WeakRetained isSharedAdmin];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)deregisterReceiver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)HMDHomeAdministratorHandler;
    [(HMFMessageDispatcher *)&v6 deregisterReceiver:v4];
    os_unfair_lock_lock_with_options();
    v5 = [(NSMapTable *)self->_receivers objectForKey:v4];
    [(NSMapTable *)self->_receivers removeObjectForKey:v4];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)registerForMessage:(id)a3 receiver:(id)a4 policies:(id)a5 selector:(SEL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = self;
  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  uint64_t v17 = (void *)MEMORY[0x1D9452090]();
  v18 = 0;
  if (!v13 || !v14 || !v15 || !v16)
  {
LABEL_10:

    v30.receiver = v13;
    v30.super_class = (Class)HMDHomeAdministratorHandler;
    [(HMFMessageDispatcher *)&v30 registerForMessage:v14 receiver:v15 policies:v18 selector:a6];

    return;
  }
  uint64_t v19 = objc_msgSend(v16, "hmf_objectPassingTest:", &__block_literal_global_194_166959);
  if (v19)
  {
    v20 = (void *)v19;
    v29 = a6;
    v18 = (void *)[v16 mutableCopy];
    uint64_t v21 = [v16 indexOfObjectPassingTest:&__block_literal_global_199];
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = [(HMDHomeAdministratorHandler *)v13 home];
      v23 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v22 userPrivilege:4 remoteAccessRequired:0];
      [v18 addObject:v23];
    }
    else
    {
      uint64_t v24 = v21;
      BOOL v25 = [v18 objectAtIndex:v21];
      v22 = (void *)[v25 mutableCopy];

      [v22 setUserPrivilege:4];
      [v22 setRequiresRemoteAccess:0];
      v23 = (void *)[v22 copy];
      [v18 replaceObjectAtIndex:v24 withObject:v23];
    }

    v26 = __HMDHomeAdministratorHandlerGetOrCreateReceiver(v13, v15);
    [v26 registerForMessage:v14 policies:v18];

    a6 = v29;
    goto LABEL_10;
  }
  v27 = (void *)_HMFPreconditionFailure();
  __HMDHomeAdministratorHandlerGetOrCreateReceiver(v27, v28);
}

- (id)syncOperationManager
{
  v2 = [(HMDHomeAdministratorHandler *)self home];
  v3 = [v2 homeManager];
  id v4 = [v3 syncManager];

  return v4;
}

- (NSOperationQueue)operationQueue
{
  return self->_queue;
}

- (id)wrapReceiver:(id)a3
{
  return __HMDHomeAdministratorHandlerGetOrCreateReceiver(self, a3);
}

- (HMDHomeAdministratorHandler)initWithHome:(id)a3 dispatcher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    v21.receiver = self;
    v21.super_class = (Class)HMDHomeAdministratorHandler;
    id v10 = [(HMFMessageDispatcher *)&v21 initWithTransport:0];
    id v11 = v10;
    if (v10)
    {
      objc_storeWeak((id *)&v10->_home, v6);
      objc_storeStrong((id *)&v11->_dispatcher, a4);
      id v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
      queue = v11->_queue;
      v11->_queue = v12;

      id v14 = [v6 uuid];
      id v15 = [v14 UUIDString];
      id v16 = HMDispatchQueueNameString();
      [(NSOperationQueue *)v11->_queue setName:v16];

      [(NSOperationQueue *)v11->_queue setQualityOfService:9];
      [(NSOperationQueue *)v11->_queue setMaxConcurrentOperationCount:1];
      uint64_t v17 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
      receivers = v11->_receivers;
      v11->_receivers = (NSMapTable *)v17;

      uint64_t v19 = [v8 resolveHook];
      [(HMFMessageDispatcher *)v11 setResolveHook:v19];
    }
    self = v11;
    id v9 = self;
  }

  return v9;
}

- (HMDHomeAdministratorHandler)initWithHome:(id)a3
{
  id v4 = a3;
  v5 = +[HMDMessageDispatcher defaultDispatcher];
  id v6 = [(HMDHomeAdministratorHandler *)self initWithHome:v4 dispatcher:v5];

  return v6;
}

- (HMDHomeAdministratorHandler)initWithTransport:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_167049 != -1) {
    dispatch_once(&logCategory__hmf_once_t10_167049, &__block_literal_global_167050);
  }
  v2 = (void *)logCategory__hmf_once_v11_167051;
  return v2;
}

uint64_t __42__HMDHomeAdministratorHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v11_167051;
  logCategory__hmf_once_v11_167051 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end