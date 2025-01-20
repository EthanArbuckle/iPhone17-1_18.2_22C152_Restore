@interface HMDRemoteEventRouterProcessStateChangeAssertion
+ (id)logCategory;
- (HMDRemoteEventRouterProcessStateChangeAssertion)initWithQueue:(id)a3 timerProvider:(id)a4 applicationsAndIntervals:(id)a5 dataSource:(id)a6;
- (HMDRemoteEventRouterProcessStateChangeAssertionDataSource)dataSource;
- (HMETimerProvider)timerProvider;
- (HMFCancellable)eventRouterActiveAssertion;
- (NSDictionary)applicationsAndIntervals;
- (NSMutableDictionary)backgroundProcesses;
- (NSMutableSet)foregroundProcesses;
- (OS_dispatch_queue)queue;
- (id)_enableBackgroundTimerWithBundleIdentifier:(id)a3;
- (void)_backgroundTimerDidExpire:(id)a3;
- (void)_removeBackgroundTimer:(id)a3;
- (void)handleProcessWithBundleIdentifier:(id)a3 updatedIsActive:(BOOL)a4;
- (void)setEventRouterActiveAssertion:(id)a3;
@end

@implementation HMDRemoteEventRouterProcessStateChangeAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventRouterActiveAssertion, 0);
  objc_storeStrong((id *)&self->_backgroundProcesses, 0);
  objc_storeStrong((id *)&self->_foregroundProcesses, 0);
  objc_storeStrong((id *)&self->_applicationsAndIntervals, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_timerProvider);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setEventRouterActiveAssertion:(id)a3
{
}

- (HMFCancellable)eventRouterActiveAssertion
{
  return self->_eventRouterActiveAssertion;
}

- (NSMutableDictionary)backgroundProcesses
{
  return self->_backgroundProcesses;
}

- (NSMutableSet)foregroundProcesses
{
  return self->_foregroundProcesses;
}

- (NSDictionary)applicationsAndIntervals
{
  return self->_applicationsAndIntervals;
}

- (HMDRemoteEventRouterProcessStateChangeAssertionDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDRemoteEventRouterProcessStateChangeAssertionDataSource *)WeakRetained;
}

- (HMETimerProvider)timerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timerProvider);
  return (HMETimerProvider *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_backgroundTimerDidExpire:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)self backgroundProcesses];
  v7 = [v6 objectForKeyedSubscript:v4];

  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v31 = 138543874;
    v32 = v11;
    __int16 v33 = 2112;
    id v34 = v4;
    __int16 v35 = 2112;
    v36 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@bundleIdentifier: %@ backgroundTimer: %@ expired.", (uint8_t *)&v31, 0x20u);
  }
  if (v7)
  {
    [(HMDRemoteEventRouterProcessStateChangeAssertion *)v9 _removeBackgroundTimer:v7];
    v12 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)v9 backgroundProcesses];
    [v12 removeObjectForKey:v4];
  }
  v13 = (void *)MEMORY[0x1D9452090]();
  v14 = v9;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = HMFGetLogIdentifier();
    v17 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)v14 foregroundProcesses];
    v18 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)v14 backgroundProcesses];
    int v31 = 138543874;
    v32 = v16;
    __int16 v33 = 2112;
    id v34 = v17;
    __int16 v35 = 2112;
    v36 = v18;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@foregroundProcesses %@, backgroundProcesses %@", (uint8_t *)&v31, 0x20u);
  }
  v19 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)v14 foregroundProcesses];
  if (objc_msgSend(v19, "hmf_isEmpty"))
  {
    v20 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)v14 backgroundProcesses];
    BOOL v21 = [v20 count] != 0;
  }
  else
  {
    BOOL v21 = 1;
  }

  v22 = (void *)MEMORY[0x1D9452090]();
  v23 = v14;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = HMFGetLogIdentifier();
    v26 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)v23 eventRouterActiveAssertion];
    v27 = HMFBooleanToString();
    v28 = HMFBooleanToString();
    int v31 = 138543874;
    v32 = v25;
    __int16 v33 = 2112;
    id v34 = v27;
    __int16 v35 = 2112;
    v36 = v28;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@self.isProcessForeground %@, isProcessForeground %@", (uint8_t *)&v31, 0x20u);
  }
  if (!v21)
  {
    v29 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)v23 eventRouterActiveAssertion];

    if (v29)
    {
      v30 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)v23 eventRouterActiveAssertion];
      [v30 cancel];

      [(HMDRemoteEventRouterProcessStateChangeAssertion *)v23 setEventRouterActiveAssertion:0];
    }
  }
}

- (void)_removeBackgroundTimer:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)self queue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      v11 = v9;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Remove backgroundTimer: %@", (uint8_t *)&v10, 0x16u);
    }
    [v4 suspend];
  }
}

- (id)_enableBackgroundTimerWithBundleIdentifier:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)self applicationsAndIntervals];
  v7 = [v6 objectForKeyedSubscript:v4];
  [v7 doubleValue];
  double v9 = v8;

  int v10 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)self timerProvider];
  v11 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)self queue];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __94__HMDRemoteEventRouterProcessStateChangeAssertion__enableBackgroundTimerWithBundleIdentifier___block_invoke;
  v28 = &unk_1E6A197C8;
  v29 = self;
  id v12 = v4;
  id v30 = v12;
  id v13 = [v10 timerWithQueue:v11 interval:&v25 timerFireHandler:v9];

  v19 = (void *)MEMORY[0x1D9452090](v14, v15, v16, v17, v18);
  v20 = self;
  BOOL v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = HMFGetLogIdentifier();
    v23 = objc_msgSend(NSNumber, "numberWithDouble:", v9, v25, v26, v27, v28, v29);
    *(_DWORD *)buf = 138543874;
    v32 = v22;
    __int16 v33 = 2112;
    id v34 = v13;
    __int16 v35 = 2112;
    v36 = v23;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Starting backgroundTimer: %@ interval: %@", buf, 0x20u);
  }
  [v13 resume];

  return v13;
}

uint64_t __94__HMDRemoteEventRouterProcessStateChangeAssertion__enableBackgroundTimerWithBundleIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _backgroundTimerDidExpire:*(void *)(a1 + 40)];
}

- (void)handleProcessWithBundleIdentifier:(id)a3 updatedIsActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)self applicationsAndIntervals];
  double v8 = [v7 objectForKey:v6];

  if (v8)
  {
    double v9 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__HMDRemoteEventRouterProcessStateChangeAssertion_handleProcessWithBundleIdentifier_updatedIsActive___block_invoke;
    block[3] = &unk_1E6A18708;
    block[4] = self;
    id v15 = v6;
    BOOL v16 = v4;
    dispatch_async(v9, block);
  }
  else
  {
    int v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 1024;
      BOOL v22 = v4;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring foreground state change for application %@ with isActive: %{BOOL}d", buf, 0x1Cu);
    }
  }
}

void __101__HMDRemoteEventRouterProcessStateChangeAssertion_handleProcessWithBundleIdentifier_updatedIsActive___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  BOOL v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = *(void **)(a1 + 40);
    int v7 = *(unsigned __int8 *)(a1 + 48);
    int v36 = 138543874;
    uint64_t v37 = v5;
    __int16 v38 = 2112;
    v39 = v6;
    __int16 v40 = 1024;
    LODWORD(v41) = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Application %@ isActive state changed to %{BOOL}d", (uint8_t *)&v36, 0x1Cu);
  }
  int v8 = *(unsigned __int8 *)(a1 + 48);
  double v9 = [*(id *)(a1 + 32) foregroundProcesses];
  int v10 = v9;
  uint64_t v11 = *(void *)(a1 + 40);
  if (v8)
  {
    [v9 addObject:v11];

    id v12 = [*(id *)(a1 + 32) backgroundProcesses];
    id v13 = [v12 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (v13)
    {
      [*(id *)(a1 + 32) _removeBackgroundTimer:v13];
      uint64_t v14 = [*(id *)(a1 + 32) backgroundProcesses];
      [v14 removeObjectForKey:*(void *)(a1 + 40)];
    }
    id v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      __int16 v19 = [*(id *)(a1 + 32) eventRouterActiveAssertion];
      id v20 = HMFBooleanToString();
      int v36 = 138543618;
      uint64_t v37 = v18;
      __int16 v38 = 2112;
      v39 = v20;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@self.isProcessForeground %@, isProcessForeground YES", (uint8_t *)&v36, 0x16u);
    }
    __int16 v21 = [*(id *)(a1 + 32) eventRouterActiveAssertion];

    if (!v21)
    {
      BOOL v22 = [*(id *)(a1 + 32) dataSource];
      uint64_t v23 = [v22 createEventRouterAssertion];
      [*(id *)(a1 + 32) setEventRouterActiveAssertion:v23];

LABEL_13:
    }
  }
  else
  {
    [v9 removeObject:v11];

    v24 = [*(id *)(a1 + 32) backgroundProcesses];
    id v13 = [v24 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (v13) {
      goto LABEL_14;
    }
    uint64_t v25 = [*(id *)(a1 + 32) _enableBackgroundTimerWithBundleIdentifier:*(void *)(a1 + 40)];
    if (v25)
    {
      id v13 = (void *)v25;
      BOOL v22 = [*(id *)(a1 + 32) backgroundProcesses];
      [v22 setObject:v13 forKey:*(void *)(a1 + 40)];
      goto LABEL_13;
    }
    v32 = (void *)MEMORY[0x1D9452090]();
    id v33 = *(id *)(a1 + 32);
    id v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      __int16 v35 = HMFGetLogIdentifier();
      int v36 = 138543362;
      uint64_t v37 = v35;
      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable background timer.", (uint8_t *)&v36, 0xCu);
    }
    id v13 = 0;
  }
LABEL_14:

  uint64_t v26 = (void *)MEMORY[0x1D9452090]();
  id v27 = *(id *)(a1 + 32);
  v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = HMFGetLogIdentifier();
    id v30 = [*(id *)(a1 + 32) foregroundProcesses];
    int v31 = [*(id *)(a1 + 32) backgroundProcesses];
    int v36 = 138543874;
    uint64_t v37 = v29;
    __int16 v38 = 2112;
    v39 = v30;
    __int16 v40 = 2112;
    v41 = v31;
    _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@foregroundProcesses %@, backgroundProcesses %@", (uint8_t *)&v36, 0x20u);
  }
}

- (HMDRemoteEventRouterProcessStateChangeAssertion)initWithQueue:(id)a3 timerProvider:(id)a4 applicationsAndIntervals:(id)a5 dataSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HMDRemoteEventRouterProcessStateChangeAssertion;
  id v15 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)&v23 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeWeak((id *)&v16->_timerProvider, v12);
    objc_storeStrong((id *)&v16->_applicationsAndIntervals, a5);
    objc_storeWeak((id *)&v16->_dataSource, v14);
    eventRouterActiveAssertion = v16->_eventRouterActiveAssertion;
    v16->_eventRouterActiveAssertion = 0;

    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v13, "count"));
    foregroundProcesses = v16->_foregroundProcesses;
    v16->_foregroundProcesses = (NSMutableSet *)v18;

    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v13, "count"));
    backgroundProcesses = v16->_backgroundProcesses;
    v16->_backgroundProcesses = (NSMutableDictionary *)v20;
  }
  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_124697 != -1) {
    dispatch_once(&logCategory__hmf_once_t10_124697, &__block_literal_global_124698);
  }
  v2 = (void *)logCategory__hmf_once_v11_124699;
  return v2;
}

uint64_t __62__HMDRemoteEventRouterProcessStateChangeAssertion_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v11_124699;
  logCategory__hmf_once_v11_124699 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end