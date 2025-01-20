@interface HMDCameraPowerAssertionHandler
+ (id)logCategory;
+ (id)sharedHandler;
- (HMDCameraPowerAssertionHandler)init;
- (NSMutableSet)currentRequestHandlerSessionIDs;
- (OS_dispatch_queue)workQueue;
- (unsigned)powerAssertion;
- (void)deregisterRemoteRequestHandler:(id)a3;
- (void)registerRemoteRequestHandler:(id)a3 forSessionID:(id)a4;
- (void)setPowerAssertion:(unsigned int)a3;
@end

@implementation HMDCameraPowerAssertionHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentRequestHandlerSessionIDs, 0);
}

- (void)setPowerAssertion:(unsigned int)a3
{
  self->_powerAssertion = a3;
}

- (unsigned)powerAssertion
{
  return self->_powerAssertion;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSMutableSet)currentRequestHandlerSessionIDs
{
  return self->_currentRequestHandlerSessionIDs;
}

- (void)deregisterRemoteRequestHandler:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraPowerAssertionHandler *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HMDCameraPowerAssertionHandler_deregisterRemoteRequestHandler___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__HMDCameraPowerAssertionHandler_deregisterRemoteRequestHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) currentRequestHandlerSessionIDs];
  char v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = *(id *)(a1 + 32);
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      uint64_t v21 = *(void *)(a1 + 40);
      v22 = [*(id *)(a1 + 32) currentRequestHandlerSessionIDs];
      int v23 = 138543874;
      v24 = v20;
      __int16 v25 = 2112;
      uint64_t v26 = v21;
      __int16 v27 = 2112;
      v28 = v22;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Cannot find session %@ in current assertion holders %@", (uint8_t *)&v23, 0x20u);
    }
    goto LABEL_13;
  }
  id v4 = [*(id *)(a1 + 32) currentRequestHandlerSessionIDs];
  [v4 removeObject:*(void *)(a1 + 40)];

  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 32);
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 40);
    v10 = [*(id *)(a1 + 32) currentRequestHandlerSessionIDs];
    int v23 = 138543874;
    v24 = v8;
    __int16 v25 = 2112;
    uint64_t v26 = v9;
    __int16 v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Deregistering power assertion holder %@, current camera power assertion holders: %@", (uint8_t *)&v23, 0x20u);
  }
  v11 = [*(id *)(a1 + 32) currentRequestHandlerSessionIDs];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    if ([*(id *)(a1 + 32) powerAssertion])
    {
      IOPMAssertionRelease([*(id *)(a1 + 32) powerAssertion]);
      v13 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) setPowerAssertion:0]);
      id v14 = *(id *)(a1 + 32);
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = HMFGetLogIdentifier();
        int v23 = 138543362;
        v24 = v16;
        v17 = "%{public}@Releasing power assertion for camera";
        v18 = v15;
        os_log_type_t v19 = OS_LOG_TYPE_INFO;
LABEL_12:
        _os_log_impl(&dword_1D49D5000, v18, v19, v17, (uint8_t *)&v23, 0xCu);
      }
    }
    else
    {
      v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = *(id *)(a1 + 32);
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        int v23 = 138543362;
        v24 = v16;
        v17 = "%{public}@Needed to release power assertion, but it isnt valid?";
        v18 = v15;
        os_log_type_t v19 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
    }
LABEL_13:
  }
}

- (void)registerRemoteRequestHandler:(id)a3 forSessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraPowerAssertionHandler *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HMDCameraPowerAssertionHandler_registerRemoteRequestHandler_forSessionID___block_invoke;
  block[3] = &unk_1E6A19668;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __76__HMDCameraPowerAssertionHandler_registerRemoteRequestHandler_forSessionID___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = *(void **)(a1 + 40);
    int v21 = 138543618;
    v22 = v5;
    __int16 v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Registering power assertion holder for session %@", (uint8_t *)&v21, 0x16u);
  }
  id v7 = [[_HMDCameraPowerAssertion alloc] initWithPowerAssertionHandler:*(void *)(a1 + 32) remoteRequestHandlerSessionID:*(void *)(a1 + 40)];
  objc_setAssociatedObject(*(id *)(a1 + 48), "HMD.CameraPowerAssertionKey", v7, (void *)1);
  id v8 = [*(id *)(a1 + 32) currentRequestHandlerSessionIDs];
  [v8 addObject:*(void *)(a1 + 40)];

  if (![*(id *)(a1 + 32) powerAssertion])
  {
    IOReturn v9 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", @"HomeKit Camera Streaming", 0, 0, 0, 0.0, 0, (IOPMAssertionID *)(*(void *)(a1 + 32) + 8));
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v13)
      {
        id v14 = HMFGetLogIdentifier();
        int v21 = 138543362;
        v22 = v14;
        v15 = "%{public}@Failed to create power assertion for camera request handler";
LABEL_9:
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v21, 0xCu);
      }
    }
    else if (v13)
    {
      id v14 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v14;
      v15 = "%{public}@Taking power assertion for camera";
      goto LABEL_9;
    }
  }
  v16 = (void *)MEMORY[0x1D9452090]();
  id v17 = *(id *)(a1 + 32);
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    os_log_type_t v19 = HMFGetLogIdentifier();
    v20 = [*(id *)(a1 + 32) currentRequestHandlerSessionIDs];
    int v21 = 138543618;
    v22 = v19;
    __int16 v23 = 2112;
    v24 = v20;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Current camera power assertion holders: %@", (uint8_t *)&v21, 0x16u);
  }
}

- (HMDCameraPowerAssertionHandler)init
{
  v11.receiver = self;
  v11.super_class = (Class)HMDCameraPowerAssertionHandler;
  v2 = [(HMDCameraPowerAssertionHandler *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    currentRequestHandlerSessionIDs = v2->_currentRequestHandlerSessionIDs;
    v2->_currentRequestHandlerSessionIDs = (NSMutableSet *)v3;

    HMDispatchQueueNameString();
    id v5 = objc_claimAutoreleasedReturnValue();
    id v6 = (const char *)[v5 UTF8String];
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(v6, v7);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_124559 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_124559, &__block_literal_global_21_124560);
  }
  v2 = (void *)logCategory__hmf_once_v1_124561;
  return v2;
}

uint64_t __45__HMDCameraPowerAssertionHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_124561;
  logCategory__hmf_once_v1_124561 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)sharedHandler
{
  if (sharedHandler_onceToken_124566 != -1) {
    dispatch_once(&sharedHandler_onceToken_124566, &__block_literal_global_124567);
  }
  v2 = (void *)assertionHandler;
  return v2;
}

uint64_t __47__HMDCameraPowerAssertionHandler_sharedHandler__block_invoke()
{
  uint64_t v0 = objc_alloc_init(HMDCameraPowerAssertionHandler);
  uint64_t v1 = assertionHandler;
  assertionHandler = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end