@interface HMDActiveXPCClientConnectionsPeriodicTimer
+ (id)logCategory;
- (HMDActiveXPCClientConnectionsManager)clientConnectionsManager;
- (HMDActiveXPCClientConnectionsPeriodicTimer)initWithTimeInterval:(double)a3 logIdentifier:(id)a4 workQueue:(id)a5;
- (HMDActiveXPCClientConnectionsPeriodicTimer)initWithTimer:(id)a3 clientConnectionsManager:(id)a4 logIdentifier:(id)a5 workQueue:(id)a6;
- (HMDActiveXPCClientConnectionsPeriodicTimerDelegate)delegate;
- (HMFTimer)timer;
- (NSSet)clientConnections;
- (NSString)logIdentifier;
- (OS_dispatch_queue)workQueue;
- (double)timeInterval;
- (void)_configure;
- (void)_updateTimer;
- (void)addClientConnection:(id)a3;
- (void)clientConnectionsManager:(id)a3 didHandleActivationForClientConnection:(id)a4;
- (void)clientConnectionsManager:(id)a3 didHandleDeactivationForClientConnection:(id)a4;
- (void)removeClientConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDActiveXPCClientConnectionsPeriodicTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConnectionsManager, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (HMDActiveXPCClientConnectionsManager)clientConnectionsManager
{
  return (HMDActiveXPCClientConnectionsManager *)objc_getProperty(self, a2, 48, 1);
}

- (HMFTimer)timer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDActiveXPCClientConnectionsPeriodicTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDActiveXPCClientConnectionsPeriodicTimerDelegate *)WeakRetained;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self timer];

  if (v6 == v4)
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of timer firing", (uint8_t *)&v12, 0xCu);
    }
    v11 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)v8 delegate];
    [v11 clientConnectionsTimerDidFire:v8];
  }
}

- (void)clientConnectionsManager:(id)a3 didHandleDeactivationForClientConnection:(id)a4
{
  v5 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [(HMDActiveXPCClientConnectionsPeriodicTimer *)self _updateTimer];
}

- (void)clientConnectionsManager:(id)a3 didHandleActivationForClientConnection:(id)a4
{
  v5 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [(HMDActiveXPCClientConnectionsPeriodicTimer *)self _updateTimer];
}

- (void)_updateTimer
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self clientConnections];
  int v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_127447);

  id v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      v10 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting timer", (uint8_t *)&v14, 0xCu);
    }
    v11 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)v7 timer];
    [v11 resume];

    int v12 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)v7 delegate];
    [v12 clientConnectionsTimerDidFire:v7];
  }
  else
  {
    if (v9)
    {
      v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Suspending timer", (uint8_t *)&v14, 0xCu);
    }
    int v12 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)v7 timer];
    [v12 suspend];
  }
}

uint64_t __58__HMDActiveXPCClientConnectionsPeriodicTimer__updateTimer__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isActivated];
}

- (void)_configure
{
  v3 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self clientConnectionsManager];
  int v5 = [v4 delegate];

  if (!v5)
  {
    id v6 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self clientConnectionsManager];
    [v6 setDelegate:self];

    v7 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self clientConnectionsManager];
    [v7 configure];

    v8 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self timer];
    [v8 setDelegate:self];

    id v10 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self workQueue];
    BOOL v9 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self timer];
    [v9 setDelegateQueue:v10];
  }
}

- (void)removeClientConnection:(id)a3
{
  id v4 = a3;
  int v5 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self clientConnectionsManager];
  [v6 removeClientConnection:v4];
}

- (void)addClientConnection:(id)a3
{
  id v4 = a3;
  int v5 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [(HMDActiveXPCClientConnectionsPeriodicTimer *)self _configure];
  id v6 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self clientConnectionsManager];
  [v6 addClientConnection:v4];
}

- (NSSet)clientConnections
{
  v3 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self clientConnectionsManager];
  int v5 = [v4 clientConnections];

  return (NSSet *)v5;
}

- (HMDActiveXPCClientConnectionsPeriodicTimer)initWithTimer:(id)a3 clientConnectionsManager:(id)a4 logIdentifier:(id)a5 workQueue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    v21 = (HMDActiveXPCClientConnectionsPeriodicTimer *)_HMFPreconditionFailure();
    return [(HMDActiveXPCClientConnectionsPeriodicTimer *)v21 initWithTimeInterval:v25 logIdentifier:v23 workQueue:v24];
  }
  v26.receiver = self;
  v26.super_class = (Class)HMDActiveXPCClientConnectionsPeriodicTimer;
  uint64_t v16 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)&v26 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_timer, a3);
    uint64_t v18 = [v13 copy];
    logIdentifier = v17->_logIdentifier;
    v17->_logIdentifier = (NSString *)v18;

    objc_storeStrong((id *)&v17->_workQueue, a6);
    objc_storeStrong((id *)&v17->_clientConnectionsManager, a4);
  }

  return v17;
}

- (HMDActiveXPCClientConnectionsPeriodicTimer)initWithTimeInterval:(double)a3 logIdentifier:(id)a4 workQueue:(id)a5
{
  v8 = (objc_class *)MEMORY[0x263F42658];
  id v9 = a5;
  id v10 = a4;
  id v11 = (void *)[[v8 alloc] initWithTimeInterval:4 options:a3];
  id v12 = [[HMDActiveXPCClientConnectionsManager alloc] initWithLogIdentifier:v10 workQueue:v9];
  id v13 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)self initWithTimer:v11 clientConnectionsManager:v12 logIdentifier:v10 workQueue:v9];

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_127472 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_127472, &__block_literal_global_14_127473);
  }
  v2 = (void *)logCategory__hmf_once_v3_127474;
  return v2;
}

void __57__HMDActiveXPCClientConnectionsPeriodicTimer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v3_127474;
  logCategory__hmf_once_v3_127474 = v0;
}

@end