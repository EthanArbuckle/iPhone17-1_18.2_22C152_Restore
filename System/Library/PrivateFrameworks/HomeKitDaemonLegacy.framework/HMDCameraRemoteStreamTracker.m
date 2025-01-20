@interface HMDCameraRemoteStreamTracker
+ (HMDCameraRemoteStreamTracker)sharedTracker;
+ (id)logCategory;
- (BOOL)startTrackingStreamSession:(id)a3;
- (HMDCameraRemoteStreamTracker)init;
- (NSMutableSet)currentStreamIdentifiers;
- (OS_dispatch_queue)workQueue;
- (void)stopTrackingStreamWithSessionID:(id)a3;
@end

@implementation HMDCameraRemoteStreamTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStreamIdentifiers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (NSMutableSet)currentStreamIdentifiers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)stopTrackingStreamWithSessionID:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraRemoteStreamTracker *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HMDCameraRemoteStreamTracker_stopTrackingStreamWithSessionID___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__HMDCameraRemoteStreamTracker_stopTrackingStreamWithSessionID___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) currentStreamIdentifiers];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v13 = 138543618;
      v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@No longer tracking stream with session ID: %@", (uint8_t *)&v13, 0x16u);
    }
    v10 = [*(id *)(a1 + 32) currentStreamIdentifiers];
    [v10 removeObject:*(void *)(a1 + 40)];
  }
  else
  {
    if (v7)
    {
      v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Cannot find stream to stop tracking: %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (BOOL)startTrackingStreamSession:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(HMDCameraRemoteStreamTracker *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HMDCameraRemoteStreamTracker_startTrackingStreamSession___block_invoke;
  block[3] = &unk_1E6A19A00;
  block[4] = self;
  id v9 = v4;
  v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __59__HMDCameraRemoteStreamTracker_startTrackingStreamSession___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) currentStreamIdentifiers];
  unint64_t v3 = [v2 count];
  unint64_t v4 = maximumSimultaneousRemoteStreams;

  if (v3 >= v4)
  {
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = *(id *)(a1 + 32);
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      uint64_t v21 = *(void *)(a1 + 40);
      v22 = [*(id *)(a1 + 32) currentStreamIdentifiers];
      int v23 = 138543874;
      v24 = v20;
      __int16 v25 = 2112;
      uint64_t v26 = v21;
      __int16 v27 = 2112;
      uint64_t v28 = (uint64_t)v22;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Cannot start tracking stream session: %@. Already tracking maximum number of stream sessions: %@", (uint8_t *)&v23, 0x20u);
    }
  }
  else
  {
    id v5 = [_HMDCameraRemoteStreamTrackerAssertion alloc];
    uint64_t v6 = *(void *)(a1 + 32);
    BOOL v7 = [*(id *)(a1 + 40) sessionID];
    id v8 = [(_HMDCameraRemoteStreamTrackerAssertion *)v5 initWithStreamTracker:v6 streamIdentifier:v7];

    id v9 = [*(id *)(a1 + 32) currentStreamIdentifiers];
    v10 = [*(id *)(a1 + 40) sessionID];
    [v9 addObject:v10];

    objc_setAssociatedObject(*(id *)(a1 + 40), "HMD.StreamTrackerAssertion", v8, (void *)1);
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      char v14 = HMFGetLogIdentifier();
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = [*(id *)(a1 + 32) currentStreamIdentifiers];
      int v23 = 138543874;
      v24 = v14;
      __int16 v25 = 2112;
      uint64_t v26 = v15;
      __int16 v27 = 2048;
      uint64_t v28 = [v16 count];
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Started tracking stream session: %@. Total count is now %lu", (uint8_t *)&v23, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (HMDCameraRemoteStreamTracker)init
{
  v11.receiver = self;
  v11.super_class = (Class)HMDCameraRemoteStreamTracker;
  v2 = [(HMDCameraRemoteStreamTracker *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    currentStreamIdentifiers = v2->_currentStreamIdentifiers;
    v2->_currentStreamIdentifiers = (NSMutableSet *)v3;

    HMDispatchQueueNameString();
    id v5 = objc_claimAutoreleasedReturnValue();
    uint64_t v6 = (const char *)[v5 UTF8String];
    BOOL v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(v6, v7);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_100650 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_100650, &__block_literal_global_5_100651);
  }
  v2 = (void *)logCategory__hmf_once_v5_100652;
  return v2;
}

uint64_t __43__HMDCameraRemoteStreamTracker_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_100652;
  logCategory__hmf_once_v5_100652 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (HMDCameraRemoteStreamTracker)sharedTracker
{
  if (sharedTracker_onceToken_100657 != -1) {
    dispatch_once(&sharedTracker_onceToken_100657, &__block_literal_global_100658);
  }
  v2 = (void *)streamTracker;
  return (HMDCameraRemoteStreamTracker *)v2;
}

uint64_t __45__HMDCameraRemoteStreamTracker_sharedTracker__block_invoke()
{
  uint64_t v0 = objc_alloc_init(HMDCameraRemoteStreamTracker);
  uint64_t v1 = streamTracker;
  streamTracker = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end