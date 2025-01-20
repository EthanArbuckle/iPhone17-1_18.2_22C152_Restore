@interface HMDHomeAdministratorHandler
+ (id)logCategory;
- (BOOL)allowLocalFallbackForMessage:(id)a3;
- (BOOL)shouldRelayMessage:(id)a3;
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

- (void)addOperation:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Adding operation: %@", (uint8_t *)&v9, 0x16u);
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
        int v9 = [HMDHomeAdministratorConfigurationOperation alloc];
        v10 = [(HMDHomeAdministratorHandler *)self dispatcher];
        __int16 v11 = [(HMDHomeAdministratorConfigurationOperation *)v9 initWithMessage:v6 home:WeakRetained dispatcher:v10];

LABEL_14:
        goto LABEL_15;
      }
      if (a4)
      {
        id v12 = (void *)MEMORY[0x263F087E8];
        uint64_t v13 = @"Dispatcher is nil.";
        uint64_t v14 = -1;
        goto LABEL_11;
      }
    }
    else if (a4)
    {
      id v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = @"The home is no longer valid.";
      uint64_t v14 = 2;
LABEL_11:
      [v12 hmErrorWithCode:v14 description:0 reason:v13 suggestion:0];
      __int16 v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    __int16 v11 = 0;
    goto LABEL_14;
  }
  if (a4)
  {
    [MEMORY[0x263F087E8] hmErrorWithCode:20];
    __int16 v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v11 = 0;
  }
LABEL_15:

  return v11;
}

- (BOOL)shouldRelayMessages
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained isSharedAdmin] & 1) == 0)
  {
    if ([v3 hasAnyResident]) {
      int v4 = [v3 isCurrentDeviceConfirmedPrimaryResident] ^ 1;
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (BOOL)shouldRelayMessage:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMDHomeAdministratorHandler *)self shouldRelayMessages])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    id v6 = [WeakRetained deviceHomeKitSetupSession];
    BOOL v7 = [(HMDHomeAdministratorHandler *)self allowLocalFallbackForMessage:v4];
    if (WeakRetained) {
      BOOL v8 = !v7;
    }
    else {
      BOOL v8 = 1;
    }
    BOOL v9 = v8 || v6 == 0;
    if (v9 || ([v6 shouldRelayRequest] & 1) != 0)
    {
      BOOL v10 = 1;
    }
    else
    {
      __int16 v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = self;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        v15 = [v4 shortDescription];
        v16 = [v4 clientName];
        [v6 isFirstResidentForHome];
        v17 = HMFBooleanToString();
        [v6 hasFailedRelayAttempt];
        HMFBooleanToString();
        v18 = v20 = v11;
        *(_DWORD *)buf = 138544386;
        v22 = v14;
        __int16 v23 = 2112;
        v24 = v15;
        __int16 v25 = 2112;
        v26 = v16;
        __int16 v27 = 2112;
        v28 = v17;
        __int16 v29 = 2112;
        v30 = v18;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Skip attempt to relay message %@ from client %@, firstResidentForHome=%@, hasFailedRelayAttempt=%@", buf, 0x34u);

        __int16 v11 = v20;
      }

      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)allowLocalFallbackForMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 clientName];
  if ([v4 isEqual:*MEMORY[0x263F0C748]])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [v3 clientName];
    if ([v6 isEqual:*MEMORY[0x263F0D4A0]])
    {
      char v5 = 1;
    }
    else
    {
      BOOL v7 = [v3 clientName];
      if ([v7 isEqual:*MEMORY[0x263F0DB30]])
      {
        char v5 = 1;
      }
      else if (isInternalBuild())
      {
        BOOL v8 = [v3 clientName];
        if ([v8 isEqual:*MEMORY[0x263F0C740]])
        {
          char v5 = 1;
        }
        else
        {
          BOOL v9 = [v3 clientName];
          char v5 = [v9 isEqual:*MEMORY[0x263F0DB38]];
        }
      }
      else
      {
        char v5 = 0;
      }
    }
  }

  return v5;
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
    char v5 = [(NSMapTable *)self->_receivers objectForKey:v4];
    [(NSMapTable *)self->_receivers removeObjectForKey:v4];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)registerForMessage:(id)a3 receiver:(id)a4 policies:(id)a5 selector:(SEL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = self;
  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  v17 = (void *)MEMORY[0x230FBD990]();
  v18 = 0;
  if (!v13 || !v14 || !v15 || !v16)
  {
LABEL_10:

    v30.receiver = v13;
    v30.super_class = (Class)HMDHomeAdministratorHandler;
    [(HMFMessageDispatcher *)&v30 registerForMessage:v14 receiver:v15 policies:v18 selector:a6];

    return;
  }
  uint64_t v19 = objc_msgSend(v16, "hmf_objectPassingTest:", &__block_literal_global_179_240704);
  if (v19)
  {
    v20 = (void *)v19;
    __int16 v29 = a6;
    v18 = (void *)[v16 mutableCopy];
    uint64_t v21 = [v16 indexOfObjectPassingTest:&__block_literal_global_184_240706];
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = [(HMDHomeAdministratorHandler *)v13 home];
      __int16 v23 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v22 userPrivilege:4 remoteAccessRequired:0];
      [v18 addObject:v23];
    }
    else
    {
      uint64_t v24 = v21;
      __int16 v25 = [v18 objectAtIndex:v21];
      v22 = (void *)[v25 mutableCopy];

      [v22 setUserPrivilege:4];
      [v22 setRequiresRemoteAccess:0];
      __int16 v23 = (void *)[v22 copy];
      [v18 replaceObjectAtIndex:v24 withObject:v23];
    }

    v26 = __HMDHomeAdministratorHandlerGetOrCreateReceiver(v13, v15);
    [v26 registerForMessage:v14 policies:v18];

    a6 = v29;
    goto LABEL_10;
  }
  __int16 v27 = (void *)_HMFPreconditionFailure();
  __HMDHomeAdministratorHandlerGetOrCreateReceiver(v27, v28);
}

- (id)syncOperationManager
{
  v2 = [(HMDHomeAdministratorHandler *)self home];
  id v3 = [v2 homeManager];
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
  BOOL v8 = v7;
  BOOL v9 = 0;
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
      id v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
      queue = v11->_queue;
      v11->_queue = v12;

      id v14 = [v6 uuid];
      id v15 = [v14 UUIDString];
      id v16 = HMDispatchQueueNameString();
      [(NSOperationQueue *)v11->_queue setName:v16];

      [(NSOperationQueue *)v11->_queue setQualityOfService:9];
      [(NSOperationQueue *)v11->_queue setMaxConcurrentOperationCount:1];
      uint64_t v17 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
      receivers = v11->_receivers;
      v11->_receivers = (NSMapTable *)v17;

      uint64_t v19 = [v8 resolveHook];
      [(HMFMessageDispatcher *)v11 setResolveHook:v19];
    }
    self = v11;
    BOOL v9 = self;
  }

  return v9;
}

- (HMDHomeAdministratorHandler)initWithHome:(id)a3
{
  id v4 = a3;
  char v5 = +[HMDMessageDispatcher defaultDispatcher];
  id v6 = [(HMDHomeAdministratorHandler *)self initWithHome:v4 dispatcher:v5];

  return v6;
}

- (HMDHomeAdministratorHandler)initWithTransport:(id)a3
{
  id v4 = a3;
  char v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  BOOL v8 = NSStringFromSelector(a2);
  BOOL v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_240794 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_240794, &__block_literal_global_240795);
  }
  v2 = (void *)logCategory__hmf_once_v5_240796;
  return v2;
}

void __42__HMDHomeAdministratorHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_240796;
  logCategory__hmf_once_v5_240796 = v0;
}

@end