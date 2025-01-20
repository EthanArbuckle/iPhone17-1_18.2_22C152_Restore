@interface HMDRemotelyAddedAccessoryReachabilityObserver
+ (id)logCategory;
- (HMDAccessory)accessory;
- (HMDRemotelyAddedAccessoryReachabilityObserver)initWithAccessory:(id)a3 message:(id)a4 workQueue:(id)a5;
- (HMDRemotelyAddedAccessoryReachabilityObserver)initWithAccessory:(id)a3 message:(id)a4 workQueue:(id)a5 timer:(id)a6 notificationCenter:(id)a7;
- (HMFMessage)message;
- (HMFTimer)timer;
- (NSNotificationCenter)notificationCenter;
- (NSObject)notificationToken;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)_respondToMessage;
- (void)setNotificationToken:(id)a3;
- (void)setTimer:(id)a3;
- (void)start;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDRemotelyAddedAccessoryReachabilityObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationToken, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

- (void)setNotificationToken:(id)a3
{
}

- (NSObject)notificationToken
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setTimer:(id)a3
{
}

- (HMFTimer)timer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMFMessage)message
{
  return (HMFMessage *)objc_getProperty(self, a2, 16, 1);
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_getProperty(self, a2, 8, 1);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)self timer];

  if (v5 == v4)
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Timed out waiting for added accessory to become reachable so responding to message", (uint8_t *)&v10, 0xCu);
    }
    [(HMDRemotelyAddedAccessoryReachabilityObserver *)v7 _respondToMessage];
  }
}

- (id)logIdentifier
{
  v2 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)self accessory];
  v3 = [v2 uuid];
  id v4 = [v3 UUIDString];

  return v4;
}

- (void)_respondToMessage
{
  v3 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)self notificationToken];

  if (v4)
  {
    id v5 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)self message];
    [v5 respondWithSuccess];

    [(HMDRemotelyAddedAccessoryReachabilityObserver *)self setTimer:0];
    v6 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)self notificationCenter];
    v7 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)self notificationToken];
    [v6 removeObserver:v7];

    [(HMDRemotelyAddedAccessoryReachabilityObserver *)self setNotificationToken:0];
  }
}

- (void)start
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)self notificationToken];

  if (v4) {
    _HMFPreconditionFailure();
  }
  id v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)v6 accessory];
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    __int16 v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting tracking for remotely added accessory: %@", buf, 0x16u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__HMDRemotelyAddedAccessoryReachabilityObserver_start__block_invoke;
  aBlock[3] = &unk_264A24438;
  aBlock[4] = v6;
  int v10 = _Block_copy(aBlock);
  v11 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)v6 notificationCenter];
  uint64_t v12 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)v6 accessory];
  v13 = [v11 addObserverForName:@"HMDAccessoryIsReachableNotification" object:v12 queue:0 usingBlock:v10];
  [(HMDRemotelyAddedAccessoryReachabilityObserver *)v6 setNotificationToken:v13];

  v14 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)v6 timer];
  [v14 setDelegate:v6];

  v15 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)v6 workQueue];
  v16 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)v6 timer];
  [v16 setDelegateQueue:v15];

  v17 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)v6 timer];
  [v17 resume];

  v18 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)v6 accessory];
  LODWORD(v16) = [v18 isReachable];

  if (v16)
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    v20 = v6;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Immediately responding to message because added accessory is already reachable", buf, 0xCu);
    }
    [(HMDRemotelyAddedAccessoryReachabilityObserver *)v20 _respondToMessage];
  }
}

void __54__HMDRemotelyAddedAccessoryReachabilityObserver_start__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HMDRemotelyAddedAccessoryReachabilityObserver_start__block_invoke_2;
  block[3] = &unk_264A2F7F8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __54__HMDRemotelyAddedAccessoryReachabilityObserver_start__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Pending added accessory became reachable so responding to message", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _respondToMessage];
}

- (HMDRemotelyAddedAccessoryReachabilityObserver)initWithAccessory:(id)a3 message:(id)a4 workQueue:(id)a5 timer:(id)a6 notificationCenter:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDRemotelyAddedAccessoryReachabilityObserver;
  v17 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_accessory, a3);
    objc_storeStrong((id *)&v18->_message, a4);
    objc_storeStrong((id *)&v18->_workQueue, a5);
    objc_storeStrong((id *)&v18->_timer, a6);
    objc_storeStrong((id *)&v18->_notificationCenter, a7);
  }

  return v18;
}

- (HMDRemotelyAddedAccessoryReachabilityObserver)initWithAccessory:(id)a3 message:(id)a4 workQueue:(id)a5
{
  v8 = (void *)MEMORY[0x263F42608];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 sharedPreferences];
  id v13 = [v12 preferenceForKey:@"RemotelyAddedAccessoryReachabilityTimeout"];
  id v14 = [v13 numberValue];

  [v14 doubleValue];
  id v16 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:v15];
  v17 = [MEMORY[0x263F08A00] defaultCenter];
  v18 = [(HMDRemotelyAddedAccessoryReachabilityObserver *)self initWithAccessory:v11 message:v10 workQueue:v9 timer:v16 notificationCenter:v17];

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_183821 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_183821, &__block_literal_global_183822);
  }
  v2 = (void *)logCategory__hmf_once_v4_183823;
  return v2;
}

void __60__HMDRemotelyAddedAccessoryReachabilityObserver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v4_183823;
  logCategory__hmf_once_v4_183823 = v0;
}

@end