@interface HMDAppleMediaAccessorySleepWakeStateController
- (HMDAppleMediaAccessorySleepWakeStateController)initWithAccessoryUUID:(id)a3 dataSource:(id)a4;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (id)dataSource;
- (void)_handleFetchSleepWakeStateMessage:(id)a3;
- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4 workQueue:(id)a5;
- (void)fetchSleepWakeStateWithCompletion:(id)a3;
@end

@implementation HMDAppleMediaAccessorySleepWakeStateController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_fetchSleepWakeFuture, 0);
}

- (OS_dispatch_queue)messageReceiveQueue
{
  if (self)
  {
    self = (HMDAppleMediaAccessorySleepWakeStateController *)objc_getProperty(self, a2, 24, 1);
    uint64_t v2 = vars8;
  }
  return (OS_dispatch_queue *)self;
}

- (NSUUID)messageTargetUUID
{
  if (self)
  {
    self = (HMDAppleMediaAccessorySleepWakeStateController *)objc_getProperty(self, a2, 32, 1);
    uint64_t v2 = vars8;
  }
  return (NSUUID *)self;
}

- (void)_handleFetchSleepWakeStateMessage:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = -[HMDAppleMediaAccessorySleepWakeStateController dataSource]((id *)&self->super.super.isa);
  v6 = [v5 deviceForAppleMediaAccessorySleepWakeStateController:self];
  if ([v6 isCurrentDevice])
  {
    v7 = [v5 currentDeviceProductInfoForAppleMediaAccessorySleepWakeStateController:self];
    uint64_t v8 = [v7 productClass];
    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v8 == 4)
    {
      if (v12)
      {
        v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v23 = v13;
        v14 = "%{public}@Unsupported attempt to fetch sleep wake state on a non TVOS device";
LABEL_12:
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
      }
    }
    else if (v12)
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v23 = v13;
      v14 = "%{public}@Unsupported attempt to fetch sleep wake state on a non ATV device";
      goto LABEL_12;
    }

    v19 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v19];

    goto LABEL_15;
  }
  if (([v4 isRemote] & 1) != 0 || objc_msgSend(v4, "isSecureRemote"))
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot relay remote fetch sleep wake message twice", buf, 0xCu);
    }
    v7 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v7];
  }
  else
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __84__HMDAppleMediaAccessorySleepWakeStateController__handleFetchSleepWakeStateMessage___block_invoke;
    v20[3] = &unk_264A2E2B0;
    id v21 = v4;
    [(HMDAppleMediaAccessorySleepWakeStateController *)self fetchSleepWakeStateWithCompletion:v20];
    v7 = v21;
  }
LABEL_15:
}

- (id)dataSource
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 6);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

void __84__HMDAppleMediaAccessorySleepWakeStateController__handleFetchSleepWakeStateMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "respondWithError:");
  }
  else
  {
    uint64_t v7 = *MEMORY[0x263F0C730];
    v5 = [NSNumber numberWithUnsignedInteger:a2];
    v8[0] = v5;
    v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v3 respondWithPayload:v6];
  }
}

- (void)fetchSleepWakeStateWithCompletion:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = -[HMDAppleMediaAccessorySleepWakeStateController dataSource]((id *)&self->super.super.isa);
  v6 = [v5 deviceForAppleMediaAccessorySleepWakeStateController:self];

  if (v6)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    p_fetchSleepWakeFuture = &self->_fetchSleepWakeFuture;
    v9 = self->_fetchSleepWakeFuture;
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    HMFGetOSLogHandle();
    BOOL v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Fetching sleep wake state with current fetch future: %@", buf, 0x16u);
    }
    if (v9)
    {
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v9 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
      objc_storeStrong((id *)p_fetchSleepWakeFuture, v9);
      os_unfair_lock_unlock(p_lock);
      id v18 = v6;
      v19 = [HMDRemoteDeviceMessageDestination alloc];
      v20 = [(HMDAppleMediaAccessorySleepWakeStateController *)v11 messageTargetUUID];
      id v21 = [(HMDRemoteDeviceMessageDestination *)v19 initWithTarget:v20 device:v18];

      v22 = [MEMORY[0x263F42590] messageWithName:*MEMORY[0x263F0C738] destination:v21 payload:0];
      [v22 setSecureRemote:1];
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __80__HMDAppleMediaAccessorySleepWakeStateController__sendSleepWakeMessageToDevice___block_invoke;
      v33 = &unk_264A2F0C8;
      v34 = v11;
      [v22 setResponseHandler:buf];
      int v23 = [v18 isCurrentDevice];

      if (v23) {
        [(HMDAppleMediaAccessorySleepWakeStateController *)v11 _handleFetchSleepWakeStateMessage:v22];
      }
      else {
        objc_msgSend(objc_getProperty(v11, v24, 40, 1), "sendMessage:", v22);
      }
    }
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __84__HMDAppleMediaAccessorySleepWakeStateController_fetchSleepWakeStateWithCompletion___block_invoke;
    v30[3] = &unk_264A2E260;
    id v25 = v4;
    id v31 = v25;
    id v26 = (id)[(NAFuture *)v9 addSuccessBlock:v30];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __84__HMDAppleMediaAccessorySleepWakeStateController_fetchSleepWakeStateWithCompletion___block_invoke_2;
    v28[3] = &unk_264A2E288;
    id v29 = v25;
    id v27 = (id)[(NAFuture *)v9 addFailureBlock:v28];
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to get current device from AppleMediaAccessorySleepWakeStateControllerDataSource", buf, 0xCu);
    }
    v9 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    (*((void (**)(id, void, NAFuture *))v4 + 2))(v4, 0, v9);
  }
}

uint64_t __84__HMDAppleMediaAccessorySleepWakeStateController_fetchSleepWakeStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  self;
  if ([v3 unsignedIntValue] != 2) {
    [v3 unsignedIntValue];
  }

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

uint64_t __84__HMDAppleMediaAccessorySleepWakeStateController_fetchSleepWakeStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__HMDAppleMediaAccessorySleepWakeStateController__sendSleepWakeMessageToDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  id v8 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 16);
  *(void *)(v9 + 16) = 0;

  os_unfair_lock_unlock(v7);
  if (v5)
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v21 = 138543618;
      v22 = v14;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Fetching sleep wake state failed with error: %@", (uint8_t *)&v21, 0x16u);
    }
    [v8 finishWithError:v5];
  }
  else
  {
    v15 = objc_msgSend(v6, "hmf_numberForKey:", *MEMORY[0x263F0C730]);
    if (v15)
    {
      [v8 finishWithResult:v15];
    }
    else
    {
      v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 32);
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v21 = 138543618;
        v22 = v19;
        __int16 v23 = 2112;
        id v24 = 0;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Fetching sleep wake state failed, missing sleep wake state key: %@", (uint8_t *)&v21, 0x16u);
      }
      v20 = [MEMORY[0x263F087E8] hmErrorWithCode:43];
      [v8 finishWithError:v20];
    }
  }
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4 workQueue:(id)a5
{
  v21[2] = *MEMORY[0x263EF8340];
  id v20 = a3;
  if (self)
  {
    id v8 = a4;
    objc_setProperty_atomic(self, v9, a5, 24);
    objc_setProperty_atomic(self, v10, v8, 40);

    id v11 = v20;
    id v12 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    v21[0] = v12;
    v13 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v11 userPrivilege:0 remoteAccessRequired:1];

    v21[1] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v16 = [WeakRetained currentDeviceProductInfoForAppleMediaAccessorySleepWakeStateController:self];

    if ([v16 productClass] == 4)
    {
      id v18 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
      uint64_t v19 = [v14 arrayByAddingObject:v18];

      v14 = (void *)v19;
    }
    objc_msgSend(objc_getProperty(self, v17, 40, 1), "registerForMessage:receiver:policies:selector:", *MEMORY[0x263F0C738], self, v14, sel__handleFetchSleepWakeStateMessage_);
  }
}

- (HMDAppleMediaAccessorySleepWakeStateController)initWithAccessoryUUID:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDAppleMediaAccessorySleepWakeStateController;
  id v8 = [(HMDAppleMediaAccessorySleepWakeStateController *)&v13 init];
  SEL v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [v6 copy];
    accessoryUUID = v9->_accessoryUUID;
    v9->_accessoryUUID = (NSUUID *)v10;

    objc_storeWeak((id *)&v9->_dataSource, v7);
  }

  return v9;
}

@end