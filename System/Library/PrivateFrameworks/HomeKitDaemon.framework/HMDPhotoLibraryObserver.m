@interface HMDPhotoLibraryObserver
+ (id)logCategory;
- (HMDPhotoLibrary)photoLibrary;
- (HMDPhotoLibraryObserver)initWithUUID:(id)a3 workQueue:(id)a4 photoLibrary:(id)a5;
- (HMDPhotoLibraryObserver)initWithUUID:(id)a3 workQueue:(id)a4 photoLibrary:(id)a5 minorUpdateTimer:(id)a6 majorUpdateTimer:(id)a7 changeDebounceTimer:(id)a8 changeDebounceLimit:(double)a9;
- (HMDPhotoLibraryObserverDelegate)delegate;
- (HMFTimer)changeDebounceTimer;
- (HMFTimer)majorUpdateTimer;
- (HMFTimer)minorUpdateTimer;
- (NSDate)initiallyDebouncedChangeDate;
- (NSUUID)UUID;
- (OS_dispatch_queue)workQueue;
- (double)changeDebounceLimit;
- (id)logIdentifier;
- (void)configure;
- (void)invalidate;
- (void)photoLibraryPersonsDidChange;
- (void)setDelegate:(id)a3;
- (void)setInitiallyDebouncedChangeDate:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDPhotoLibraryObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiallyDebouncedChangeDate, 0);
  objc_storeStrong((id *)&self->_changeDebounceTimer, 0);
  objc_storeStrong((id *)&self->_majorUpdateTimer, 0);
  objc_storeStrong((id *)&self->_minorUpdateTimer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setInitiallyDebouncedChangeDate:(id)a3
{
}

- (NSDate)initiallyDebouncedChangeDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (double)changeDebounceLimit
{
  return self->_changeDebounceLimit;
}

- (HMFTimer)changeDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 56, 1);
}

- (HMFTimer)majorUpdateTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 48, 1);
}

- (HMFTimer)minorUpdateTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (HMDPhotoLibrary)photoLibrary
{
  return (HMDPhotoLibrary *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDPhotoLibraryObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDPhotoLibraryObserverDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDPhotoLibraryObserver *)self UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDPhotoLibraryObserver *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDPhotoLibraryObserver *)self delegate];
  id v7 = [(HMDPhotoLibraryObserver *)self minorUpdateTimer];

  if (v7 == v4)
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Minor update timer fired", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_10;
  }
  id v8 = [(HMDPhotoLibraryObserver *)self majorUpdateTimer];

  if (v8 == v4)
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Major update timer fired", (uint8_t *)&v21, 0xCu);
    }
    [v6 observerDidObserveMajorChange:v18];
  }
  else
  {
    id v9 = [(HMDPhotoLibraryObserver *)self changeDebounceTimer];

    if (v9 == v4)
    {
      v10 = (void *)MEMORY[0x230FBD990]();
      v11 = self;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = HMFGetLogIdentifier();
        int v21 = 138543362;
        v22 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Photo library persons did change debounce timer fired", (uint8_t *)&v21, 0xCu);
      }
      [(HMDPhotoLibraryObserver *)v11 setInitiallyDebouncedChangeDate:0];
LABEL_10:
      [v6 observerDidObserveMinorChange:v11];
    }
  }
}

- (void)photoLibraryPersonsDidChange
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = [(HMDPhotoLibraryObserver *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(HMDPhotoLibraryObserver *)self initiallyDebouncedChangeDate];
  if (!v4) {
    goto LABEL_6;
  }
  v5 = (void *)v4;
  v6 = [(HMDPhotoLibraryObserver *)self initiallyDebouncedChangeDate];
  [v6 timeIntervalSinceNow];
  double v8 = -v7;
  [(HMDPhotoLibraryObserver *)self changeDebounceLimit];
  double v10 = v9;

  if (v10 < v8)
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      v15 = [(HMDPhotoLibraryObserver *)v12 initiallyDebouncedChangeDate];
      int v23 = 138543618;
      v24 = v14;
      __int16 v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Photo library persons did change; handling change immediately since we've been debouncing since %@",
        (uint8_t *)&v23,
        0x16u);
    }
    v16 = [(HMDPhotoLibraryObserver *)v12 changeDebounceTimer];
    [v16 fire];
  }
  else
  {
LABEL_6:
    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      int v23 = 138543362;
      v24 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Photo library persons did change; resuming debounce timer",
        (uint8_t *)&v23,
        0xCu);
    }
    int v21 = [(HMDPhotoLibraryObserver *)v18 initiallyDebouncedChangeDate];

    if (!v21)
    {
      v22 = [MEMORY[0x263EFF910] now];
      [(HMDPhotoLibraryObserver *)v18 setInitiallyDebouncedChangeDate:v22];
    }
    v16 = [(HMDPhotoLibraryObserver *)v18 changeDebounceTimer];
    [v16 resume];
  }
}

- (void)invalidate
{
  v3 = [(HMDPhotoLibraryObserver *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(HMDPhotoLibraryObserver *)self photoLibrary];
  [v4 setDelegate:0];

  v5 = [(HMDPhotoLibraryObserver *)self minorUpdateTimer];
  [v5 suspend];

  v6 = [(HMDPhotoLibraryObserver *)self majorUpdateTimer];
  [v6 suspend];

  id v7 = [(HMDPhotoLibraryObserver *)self changeDebounceTimer];
  [v7 suspend];
}

- (void)configure
{
  v3 = [(HMDPhotoLibraryObserver *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(HMDPhotoLibraryObserver *)self photoLibrary];
  [v4 setDelegate:self];

  v5 = [(HMDPhotoLibraryObserver *)self minorUpdateTimer];
  [v5 setDelegate:self];

  v6 = [(HMDPhotoLibraryObserver *)self workQueue];
  id v7 = [(HMDPhotoLibraryObserver *)self minorUpdateTimer];
  [v7 setDelegateQueue:v6];

  double v8 = [(HMDPhotoLibraryObserver *)self minorUpdateTimer];
  [v8 resume];

  double v9 = [(HMDPhotoLibraryObserver *)self majorUpdateTimer];
  [v9 setDelegate:self];

  double v10 = [(HMDPhotoLibraryObserver *)self workQueue];
  v11 = [(HMDPhotoLibraryObserver *)self majorUpdateTimer];
  [v11 setDelegateQueue:v10];

  v12 = [(HMDPhotoLibraryObserver *)self majorUpdateTimer];
  [v12 resume];

  v13 = [(HMDPhotoLibraryObserver *)self changeDebounceTimer];
  [v13 setDelegate:self];

  id v15 = [(HMDPhotoLibraryObserver *)self workQueue];
  v14 = [(HMDPhotoLibraryObserver *)self changeDebounceTimer];
  [v14 setDelegateQueue:v15];
}

- (HMDPhotoLibraryObserver)initWithUUID:(id)a3 workQueue:(id)a4 photoLibrary:(id)a5 minorUpdateTimer:(id)a6 majorUpdateTimer:(id)a7 changeDebounceTimer:(id)a8 changeDebounceLimit:(double)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMDPhotoLibraryObserver;
  v20 = [(HMDPhotoLibraryObserver *)&v26 init];
  int v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_workQueue, a4);
    objc_storeStrong((id *)&v21->_UUID, a3);
    objc_storeStrong((id *)&v21->_photoLibrary, a5);
    objc_storeStrong((id *)&v21->_minorUpdateTimer, a6);
    objc_storeStrong((id *)&v21->_majorUpdateTimer, a7);
    objc_storeStrong((id *)&v21->_changeDebounceTimer, a8);
    v21->_changeDebounceLimit = a9;
  }

  return v21;
}

- (HMDPhotoLibraryObserver)initWithUUID:(id)a3 workQueue:(id)a4 photoLibrary:(id)a5
{
  double v8 = (objc_class *)MEMORY[0x263F42658];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[[v8 alloc] initWithTimeInterval:4 options:86400.0];
  v13 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:4 options:2592000.0];
  v14 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:300.0];
  id v15 = [(HMDPhotoLibraryObserver *)self initWithUUID:v11 workQueue:v10 photoLibrary:v9 minorUpdateTimer:v12 majorUpdateTimer:v13 changeDebounceTimer:v14 changeDebounceLimit:7200.0];

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_265832 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_265832, &__block_literal_global_265833);
  }
  v2 = (void *)logCategory__hmf_once_v6_265834;
  return v2;
}

void __38__HMDPhotoLibraryObserver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v6_265834;
  logCategory__hmf_once_v6_265834 = v0;
}

@end