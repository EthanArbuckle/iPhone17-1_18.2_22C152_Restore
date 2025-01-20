@interface HMMTRAccessoryReachabilityManager
+ (id)logCategory;
- (BOOL)reachable;
- (HMFTimer)reachabilityTimer;
- (HMMTRAccessoryReachabilityManager)initWithServer:(id)a3 timeout:(int64_t)a4 queue:(id)a5;
- (HMMTRAccessoryServer)server;
- (void)reachabilityUpdate;
- (void)setReachabilityTimer:(id)a3;
- (void)setReachable:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)timerDidFire:(id)a3;
@end

@implementation HMMTRAccessoryReachabilityManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityTimer, 0);
  objc_destroyWeak((id *)&self->_server);
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (void)setReachabilityTimer:(id)a3
{
}

- (HMFTimer)reachabilityTimer
{
  return self->_reachabilityTimer;
}

- (HMMTRAccessoryServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (HMMTRAccessoryServer *)WeakRetained;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMMTRAccessoryReachabilityManager *)self reachable])
  {
    v5 = (void *)MEMORY[0x2533B64D0]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      v9 = [(HMMTRAccessoryReachabilityManager *)v6 server];
      [v4 timeInterval];
      int v12 = 138543874;
      v13 = v8;
      __int16 v14 = 2112;
      v15 = v9;
      __int16 v16 = 2048;
      uint64_t v17 = v10;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory Server: %@ did not report in over %.2f seconds, marking unreachable", (uint8_t *)&v12, 0x20u);
    }
    [(HMMTRAccessoryReachabilityManager *)v6 setReachable:0];
    v11 = [(HMMTRAccessoryReachabilityManager *)v6 server];
    objc_msgSend(v11, "didUpdateReachability:", -[HMMTRAccessoryReachabilityManager reachable](v6, "reachable"));
  }
}

- (void)reachabilityUpdate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (![(HMMTRAccessoryReachabilityManager *)self reachable])
  {
    [(HMMTRAccessoryReachabilityManager *)self setReachable:1];
    v3 = [(HMMTRAccessoryReachabilityManager *)self server];
    objc_msgSend(v3, "didUpdateReachability:", -[HMMTRAccessoryReachabilityManager reachable](self, "reachable"));

    id v4 = (void *)MEMORY[0x2533B64D0]();
    v5 = self;
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      v8 = [(HMMTRAccessoryReachabilityManager *)v5 server];
      int v10 = 138543618;
      v11 = v7;
      __int16 v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Accessory Server: %@ became reachable again", (uint8_t *)&v10, 0x16u);
    }
  }
  v9 = [(HMMTRAccessoryReachabilityManager *)self reachabilityTimer];
  [v9 resume];
}

- (void)stop
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [(HMMTRAccessoryReachabilityManager *)self reachabilityTimer];
  [v3 suspend];

  id v4 = (void *)MEMORY[0x2533B64D0]();
  v5 = self;
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    v8 = [(HMMTRAccessoryReachabilityManager *)v5 server];
    int v9 = 138543618;
    int v10 = v7;
    __int16 v11 = 2112;
    __int16 v12 = v8;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Accessory Server: %@ stopped updating reachability", (uint8_t *)&v9, 0x16u);
  }
}

- (void)start
{
  id v2 = [(HMMTRAccessoryReachabilityManager *)self reachabilityTimer];
  [v2 resume];
}

- (HMMTRAccessoryReachabilityManager)initWithServer:(id)a3 timeout:(int64_t)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRAccessoryReachabilityManager;
  int v10 = [(HMMTRAccessoryReachabilityManager *)&v15 init];
  __int16 v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_server, v8);
    v11->_reachable = 0;
    uint64_t v12 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:8 options:(double)a4];
    reachabilityTimer = v11->_reachabilityTimer;
    v11->_reachabilityTimer = (HMFTimer *)v12;

    [(HMFTimer *)v11->_reachabilityTimer setDelegateQueue:v9];
    [(HMFTimer *)v11->_reachabilityTimer setDelegate:v11];
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3 != -1) {
    dispatch_once(&logCategory__hmf_once_t3, &__block_literal_global_793);
  }
  id v2 = (void *)logCategory__hmf_once_v4;
  return v2;
}

uint64_t __48__HMMTRAccessoryReachabilityManager_logCategory__block_invoke()
{
  logCategory__hmf_once_id v4 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end