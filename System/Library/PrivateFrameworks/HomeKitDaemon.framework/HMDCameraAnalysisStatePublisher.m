@interface HMDCameraAnalysisStatePublisher
+ (id)logCategory;
- (HMDCameraAnalysisStatePublisher)initWithHome:(id)a3;
- (HMDCameraAnalysisStatePublisher)initWithHomeMessagingContext:(id)a3 analysisStateManager:(id)a4 workQueue:(id)a5 cameraAnalysisStatePublisherDebounceTimer:(id)a6;
- (HMDHomeResidentMessagingContext)messagingContext;
- (HMFTimer)cameraAnalysisStatePublisherDebounceTimer;
- (HMIAnalysisStateManager)analysisStateManager;
- (HMIAnalysisStateUpdate)stateUpdate;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (void)_handleRemoteAnalysisStateUpdate:(id)a3;
- (void)_processStateUpdate:(id)a3;
- (void)_publishAnalysisStateUpdate;
- (void)configureWithHome:(id)a3;
- (void)setMessagingContext:(id)a3;
- (void)setStateUpdate:(id)a3;
- (void)stateManager:(id)a3 didReceiveLocalUpdate:(id)a4;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDCameraAnalysisStatePublisher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateUpdate, 0);
  objc_storeStrong((id *)&self->_cameraAnalysisStatePublisherDebounceTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_messagingContext);
  objc_storeStrong((id *)&self->_analysisStateManager, 0);
}

- (void)setStateUpdate:(id)a3
{
}

- (HMIAnalysisStateUpdate)stateUpdate
{
  return (HMIAnalysisStateUpdate *)objc_getProperty(self, a2, 40, 1);
}

- (HMFTimer)cameraAnalysisStatePublisherDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMessagingContext:(id)a3
{
}

- (HMDHomeResidentMessagingContext)messagingContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messagingContext);
  return (HMDHomeResidentMessagingContext *)WeakRetained;
}

- (HMIAnalysisStateManager)analysisStateManager
{
  return (HMIAnalysisStateManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraAnalysisStatePublisher *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraAnalysisStatePublisher *)self cameraAnalysisStatePublisherDebounceTimer];

  if (v6 == v4)
  {
    [(HMDCameraAnalysisStatePublisher *)self _publishAnalysisStateUpdate];
  }
}

- (NSUUID)messageTargetUUID
{
  v2 = [(HMDCameraAnalysisStatePublisher *)self messagingContext];
  v3 = [v2 messageTargetUUID];

  return (NSUUID *)v3;
}

- (void)stateManager:(id)a3 didReceiveLocalUpdate:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received local analysis state update: %@", buf, 0x16u);
  }
  v12 = [(HMDCameraAnalysisStatePublisher *)v9 workQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__HMDCameraAnalysisStatePublisher_stateManager_didReceiveLocalUpdate___block_invoke;
  v14[3] = &unk_264A2F820;
  v14[4] = v9;
  id v15 = v7;
  id v13 = v7;
  dispatch_async(v12, v14);
}

uint64_t __70__HMDCameraAnalysisStatePublisher_stateManager_didReceiveLocalUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processStateUpdate:*(void *)(a1 + 40)];
}

- (void)_handleRemoteAnalysisStateUpdate:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraAnalysisStatePublisher *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 messagePayload];
  v21[0] = objc_opt_class();
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMDCameraAnalysisStatePublisherStateUpdateMessageKey", v7);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v17 = 138543618;
      __int16 v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling remote state update: %@", (uint8_t *)&v17, 0x16u);
    }
    v14 = [(HMDCameraAnalysisStatePublisher *)v10 analysisStateManager];
    [v14 handleRemoteStateUpdate:v8];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      v16 = [v4 identifier];
      int v17 = 138543618;
      __int16 v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Received nil analysis state update from message with identifier: %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)_publishAnalysisStateUpdate
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = [(HMDCameraAnalysisStatePublisher *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraAnalysisStatePublisher *)self stateUpdate];
  if (v4)
  {
    [(HMDCameraAnalysisStatePublisher *)self setStateUpdate:0];
    id v21 = 0;
    v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v21];
    id v6 = v21;
    if (v5)
    {
      v22 = @"HMDCameraAnalysisStatePublisherStateUpdateMessageKey";
      v23 = v5;
      id v7 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      v8 = [(HMDCameraAnalysisStatePublisher *)self messagingContext];
      v9 = [v8 enabledResidents];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __62__HMDCameraAnalysisStatePublisher__publishAnalysisStateUpdate__block_invoke;
      v19[3] = &unk_264A19BA8;
      v19[4] = self;
      id v20 = v7;
      id v10 = v7;
      objc_msgSend(v9, "na_each:", v19);
    }
    else
    {
      id v15 = (void *)MEMORY[0x230FBD990]();
      v16 = self;
      int v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v25 = v18;
        __int16 v26 = 2112;
        v27 = v4;
        __int16 v28 = 2112;
        id v29 = v6;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize %@: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invoking _publishAnalysisStateUpdate with nil stateUpdate!", buf, 0xCu);
    }
  }
}

void __62__HMDCameraAnalysisStatePublisher__publishAnalysisStateUpdate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 device];
  if (([v4 isCurrentDevice] & 1) == 0)
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      v9 = [v4 identifier];
      int v17 = 138543618;
      __int16 v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending state update to %@", (uint8_t *)&v17, 0x16u);
    }
    id v10 = [HMDRemoteDeviceMessageDestination alloc];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    v12 = [WeakRetained messageTargetUUID];
    id v13 = [(HMDRemoteDeviceMessageDestination *)v10 initWithTarget:v12 device:v4];

    v14 = [[HMDRemoteMessage alloc] initWithName:@"HMDCameraAnalysisStatePublisherStateUpdateMessage" destination:v13 payload:*(void *)(a1 + 40) type:3 timeout:1 secure:20.0];
    id v15 = [*(id *)(a1 + 32) messagingContext];
    v16 = [v15 msgDispatcher];
    [v16 sendMessage:v14];
  }
}

- (void)_processStateUpdate:(id)a3
{
  id v11 = a3;
  id v4 = [(HMDCameraAnalysisStatePublisher *)self workQueue];
  dispatch_assert_queue_V2(v4);

  v5 = [(HMDCameraAnalysisStatePublisher *)self stateUpdate];

  if (v5)
  {
    id v6 = [(HMDCameraAnalysisStatePublisher *)self stateUpdate];
    id v7 = [v6 stateUpdateByMergingStateUpdate:v11];
    [(HMDCameraAnalysisStatePublisher *)self setStateUpdate:v7];
  }
  else
  {
    [(HMDCameraAnalysisStatePublisher *)self setStateUpdate:v11];
  }
  v8 = [(HMDCameraAnalysisStatePublisher *)self cameraAnalysisStatePublisherDebounceTimer];
  char v9 = [v8 isRunning];

  if ((v9 & 1) == 0)
  {
    id v10 = [(HMDCameraAnalysisStatePublisher *)self cameraAnalysisStatePublisherDebounceTimer];
    [v10 resume];
  }
}

- (void)configureWithHome:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraAnalysisStatePublisher *)self analysisStateManager];
  [v5 setDelegate:self];

  id v6 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v6, "setRoles:", objc_msgSend(v6, "roles") | 4);
  id v7 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:3 remoteAccessRequired:0];

  v8 = [(HMDCameraAnalysisStatePublisher *)self messagingContext];
  char v9 = [v8 msgDispatcher];
  v14[0] = v6;
  v14[1] = v7;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  [v9 registerForMessage:@"HMDCameraAnalysisStatePublisherStateUpdateMessage" receiver:self policies:v10 selector:sel__handleRemoteAnalysisStateUpdate_];

  id v11 = [(HMDCameraAnalysisStatePublisher *)self cameraAnalysisStatePublisherDebounceTimer];
  [v11 setDelegate:self];

  v12 = [(HMDCameraAnalysisStatePublisher *)self workQueue];
  id v13 = [(HMDCameraAnalysisStatePublisher *)self cameraAnalysisStatePublisherDebounceTimer];
  [v13 setDelegateQueue:v12];
}

- (HMDCameraAnalysisStatePublisher)initWithHomeMessagingContext:(id)a3 analysisStateManager:(id)a4 workQueue:(id)a5 cameraAnalysisStatePublisherDebounceTimer:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMDCameraAnalysisStatePublisher;
  v14 = [(HMDCameraAnalysisStatePublisher *)&v17 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_messagingContext, v10);
    objc_storeStrong((id *)&v15->_analysisStateManager, a4);
    objc_storeStrong((id *)&v15->_cameraAnalysisStatePublisherDebounceTimer, a6);
    objc_storeStrong((id *)&v15->_workQueue, a5);
  }

  return v15;
}

- (HMDCameraAnalysisStatePublisher)initWithHome:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F47C68];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 uuid];
  v8 = (void *)[v6 initWithHomeUUID:v7];

  char v9 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:8 options:16.0];
  id v10 = [v5 workQueue];
  id v11 = [(HMDCameraAnalysisStatePublisher *)self initWithHomeMessagingContext:v5 analysisStateManager:v8 workQueue:v10 cameraAnalysisStatePublisherDebounceTimer:v9];

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_45491 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_45491, &__block_literal_global_45492);
  }
  v2 = (void *)logCategory__hmf_once_v7_45493;
  return v2;
}

void __46__HMDCameraAnalysisStatePublisher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v7_45493;
  logCategory__hmf_once_v7_45493 = v0;
}

@end