@interface HMDCameraRecordingBulkSendSessionInitiator
+ (id)logCategory;
- (BOOL)isSessionOpenInProgress;
- (BOOL)isWaitingForAccessory;
- (HMDCameraRecordingBulkSendListener)currentListener;
- (HMDCameraRecordingBulkSendSessionInitiator)initWithWorkQueue:(id)a3 accessory:(id)a4;
- (HMDHAPAccessory)accessory;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)_registerBulkSendListener;
- (void)configure;
- (void)handleAccessoryDoesSupportBulkSendDataStreamNotification:(id)a3;
- (void)listenerDidReceiveDataStreamClose:(id)a3;
- (void)listenerDidReceiveDataStreamStart:(id)a3;
- (void)openNewSessionWithCallback:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setCurrentListener:(id)a3;
- (void)setWaitingForAccessory:(BOOL)a3;
- (void)stop;
@end

@implementation HMDCameraRecordingBulkSendSessionInitiator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentListener, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setCurrentListener:(id)a3
{
}

- (HMDCameraRecordingBulkSendListener)currentListener
{
  return (HMDCameraRecordingBulkSendListener *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWaitingForAccessory:(BOOL)a3
{
  self->_waitingForAccessory = a3;
}

- (BOOL)isWaitingForAccessory
{
  return self->_waitingForAccessory;
}

- (void)setAccessory:(id)a3
{
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDCameraRecordingBulkSendSessionInitiator *)self accessory];
  v3 = [v2 logIdentifier];

  return v3;
}

- (void)listenerDidReceiveDataStreamClose:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraRecordingBulkSendSessionInitiator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingBulkSendSessionInitiator *)self currentListener];

  v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6 == v4)
  {
    if (v10)
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v12;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Data stream did close for listener: %@", (uint8_t *)&v13, 0x16u);
    }
    [(HMDCameraRecordingBulkSendSessionInitiator *)v8 setWaitingForAccessory:0];
    [(HMDCameraRecordingBulkSendSessionInitiator *)v8 setCurrentListener:0];
  }
  else
  {
    if (v10)
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Ignoring data stream close for irrelevant listener: %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)listenerDidReceiveDataStreamStart:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraRecordingBulkSendSessionInitiator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingBulkSendSessionInitiator *)self currentListener];

  v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6 == v4)
  {
    if (v10)
    {
      v12 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v12;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Data stream did start for listener: %@", (uint8_t *)&v19, 0x16u);
    }
    int v13 = [MEMORY[0x1E4F65530] sharedPreferences];
    v14 = [v13 preferenceForKey:@"HAPDefaultIPCameraDisconnectOnIdleTimeoutSeconds"];
    __int16 v15 = [v14 numberValue];
    [v15 doubleValue];
    double v17 = v16;

    v18 = [(HMDCameraRecordingBulkSendSessionInitiator *)v8 accessory];
    [v18 updateActiveDisconnectOnIdleTimeout:v17];
  }
  else
  {
    if (v10)
    {
      v11 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v11;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Ignoring data stream start for irrelevant listener: %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)handleAccessoryDoesSupportBulkSendDataStreamNotification:(id)a3
{
  id v4 = [(HMDCameraRecordingBulkSendSessionInitiator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__HMDCameraRecordingBulkSendSessionInitiator_handleAccessoryDoesSupportBulkSendDataStreamNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __103__HMDCameraRecordingBulkSendSessionInitiator_handleAccessoryDoesSupportBulkSendDataStreamNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isWaitingForAccessory];
  if (result)
  {
    v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 32);
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Accessory now supports data streams so registering bulk send listener because we were waiting for accessory", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) setWaitingForAccessory:0];
    return [*(id *)(a1 + 32) _registerBulkSendListener];
  }
  return result;
}

- (void)_registerBulkSendListener
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCameraRecordingBulkSendSessionInitiator *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRecordingBulkSendSessionInitiator *)self currentListener];

  if (!v4) {
    _HMFPreconditionFailure();
  }
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    uint64_t v9 = [(HMDCameraRecordingBulkSendSessionInitiator *)v6 currentListener];
    int v12 = 138543618;
    int v13 = v8;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering bulk send listener: %@", (uint8_t *)&v12, 0x16u);
  }
  BOOL v10 = [(HMDCameraRecordingBulkSendSessionInitiator *)v6 accessory];
  v11 = [(HMDCameraRecordingBulkSendSessionInitiator *)v6 currentListener];
  [v10 addDataStreamBulkSendListener:v11 fileType:@"ipcamera.recording"];
}

- (void)openNewSessionWithCallback:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  v5 = [(HMDCameraRecordingBulkSendSessionInitiator *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  int v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v35 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Opening new session", buf, 0xCu);
  }
  BOOL v10 = [(HMDCameraRecordingBulkSendSessionInitiator *)v7 currentListener];
  int v11 = [v10 isSessionOpenInProgress];

  if (v11)
  {
    int v12 = (void *)MEMORY[0x1D9452090]();
    int v13 = v7;
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v35 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot open new session because a session is already being opened", buf, 0xCu);
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:9];
    v4[2](v4, 0, v16);
  }
  else
  {
    uint64_t v16 = [(HMDCameraRecordingBulkSendSessionInitiator *)v7 accessory];
    double v17 = [(HMDCameraRecordingBulkSendSessionInitiator *)v7 currentListener];
    v18 = v17;
    if (v17)
    {
      [v17 openBulkSendSessionWithAccessory:v16 callback:v4];
    }
    else
    {
      int v19 = (void *)MEMORY[0x1D9452090]();
      v20 = v7;
      __int16 v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v35 = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Registering bulk send listener before opening new session", buf, 0xCu);
      }
      uint64_t v23 = [HMDCameraRecordingBulkSendListener alloc];
      v24 = [(HMDCameraRecordingBulkSendSessionInitiator *)v20 workQueue];
      v25 = [(HMDCameraRecordingBulkSendListener *)v23 initWithWorkQueue:v24];

      [(HMDCameraRecordingBulkSendListener *)v25 setDelegate:v20];
      [(HMDCameraRecordingBulkSendListener *)v25 addPendingBulkSendSessionCallback:v4];
      [(HMDCameraRecordingBulkSendSessionInitiator *)v20 setCurrentListener:v25];
      if ([v16 canAcceptBulkSendListeners])
      {
        [(HMDCameraRecordingBulkSendSessionInitiator *)v20 _registerBulkSendListener];
      }
      else
      {
        v26 = (void *)MEMORY[0x1D9452090]();
        v27 = v20;
        v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v35 = v29;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Establishing local HAP connection with accessory because it cannot currently accept bulk send listeners", buf, 0xCu);
        }
        [(HMDCameraRecordingBulkSendSessionInitiator *)v27 setWaitingForAccessory:1];
        v30 = [(HMDCameraRecordingBulkSendSessionInitiator *)v27 workQueue];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __73__HMDCameraRecordingBulkSendSessionInitiator_openNewSessionWithCallback___block_invoke;
        v31[3] = &unk_1E6A18BA0;
        v31[4] = v27;
        v32 = v25;
        id v33 = v16;
        [v33 establishLocalHAPConnectionWithQueue:v30 completion:v31];
      }
    }
  }
}

void __73__HMDCameraRecordingBulkSendSessionInitiator_openNewSessionWithCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 32);
    int v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      BOOL v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to start HAP session with camera: %@", (uint8_t *)&v9, 0x16u);
    }
    [*(id *)(a1 + 40) accessory:*(void *)(a1 + 48) didCloseDataStreamWithError:v3];
  }
}

- (void)stop
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraRecordingBulkSendSessionInitiator *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    int v16 = 138543362;
    double v17 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Stopping bulk send session initiator", (uint8_t *)&v16, 0xCu);
  }
  v8 = [(HMDCameraRecordingBulkSendSessionInitiator *)v5 currentListener];
  int v9 = (void *)MEMORY[0x1D9452090]();
  BOOL v10 = v5;
  __int16 v11 = HMFGetOSLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v16 = 138543618;
      double v17 = v13;
      __int16 v18 = 2112;
      int v19 = v8;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing bulk send listener: %@", (uint8_t *)&v16, 0x16u);
    }
    __int16 v14 = [(HMDCameraRecordingBulkSendSessionInitiator *)v10 accessory];
    [v14 removeDataStreamBulkSendListener:v8];

    [(HMDCameraRecordingBulkSendSessionInitiator *)v10 setWaitingForAccessory:0];
    [(HMDCameraRecordingBulkSendSessionInitiator *)v10 setCurrentListener:0];
  }
  else
  {
    if (v12)
    {
      __int16 v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      double v17 = v15;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Ignoring stop request because we have no active listener", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)configure
{
  id v3 = [(HMDCameraRecordingBulkSendSessionInitiator *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = [(HMDCameraRecordingBulkSendSessionInitiator *)self accessory];
  [v5 addObserver:self selector:sel_handleAccessoryDoesSupportBulkSendDataStreamNotification_ name:@"HMDAccessoryDoesSupportBulkSendDataStreamNotification" object:v4];
}

- (BOOL)isSessionOpenInProgress
{
  id v3 = [(HMDCameraRecordingBulkSendSessionInitiator *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraRecordingBulkSendSessionInitiator *)self currentListener];
  LOBYTE(v3) = [v4 isSessionOpenInProgress];

  return (char)v3;
}

- (HMDCameraRecordingBulkSendSessionInitiator)initWithWorkQueue:(id)a3 accessory:(id)a4
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
    uint64_t v13 = (void *)_HMFPreconditionFailure();
    return (HMDCameraRecordingBulkSendSessionInitiator *)+[HMDCameraRecordingBulkSendSessionInitiator logCategory];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraRecordingBulkSendSessionInitiator;
  BOOL v10 = [(HMDCameraRecordingBulkSendSessionInitiator *)&v15 init];
  __int16 v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_workQueue, a3);
    objc_storeWeak((id *)&v11->_accessory, v9);
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_108287 != -1) {
    dispatch_once(&logCategory__hmf_once_t14_108287, &__block_literal_global_108288);
  }
  v2 = (void *)logCategory__hmf_once_v15_108289;
  return v2;
}

uint64_t __57__HMDCameraRecordingBulkSendSessionInitiator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v15_108289;
  logCategory__hmf_once_v15_108289 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end