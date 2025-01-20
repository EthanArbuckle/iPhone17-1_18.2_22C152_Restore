@interface HMDIDSActivityMonitorObserver
+ (id)logCategory;
- (HMDIDSActivityMonitor)activityMonitor;
- (HMDIDSActivityMonitorObserver)initWithActivityMonitor:(id)a3;
- (HMDIDSActivityMonitorObserverRegistrationManager)dataSource;
- (NSMutableDictionary)subactivityToDelegatesMap;
- (id)logIdentifier;
- (void)activityMonitor:(id)a3 didReceiveActivityUpdate:(id)a4;
- (void)addObserver:(id)a3 forSubActivity:(id)a4;
- (void)configureWithDataSource:(id)a3;
- (void)removeObserver:(id)a3 forSubActivity:(id)a4;
- (void)setDataSource:(id)a3;
- (void)startObservingPresenceForDevice:(id)a3;
- (void)stopObservingPresenceForDevice:(id)a3;
@end

@implementation HMDIDSActivityMonitorObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_subactivityToDelegatesMap, 0);
  objc_storeStrong((id *)&self->_activityMonitor, 0);
}

- (void)setDataSource:(id)a3
{
}

- (HMDIDSActivityMonitorObserverRegistrationManager)dataSource
{
  return (HMDIDSActivityMonitorObserverRegistrationManager *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)subactivityToDelegatesMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (HMDIDSActivityMonitor)activityMonitor
{
  return (HMDIDSActivityMonitor *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDIDSActivityMonitorObserver *)self activityMonitor];
  v3 = [v2 logIdentifier];

  return v3;
}

- (void)activityMonitor:(id)a3 didReceiveActivityUpdate:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = +[HMDAccountRegistry sharedRegistry];
  v9 = [v7 pushToken];
  v10 = [v8 deviceForPushToken:v9];

  if (v10)
  {
    os_unfair_lock_lock_with_options();
    subactivityToDelegatesMap = self->_subactivityToDelegatesMap;
    v12 = [v7 subActivity];
    v13 = [(NSMutableDictionary *)subactivityToDelegatesMap objectForKeyedSubscript:v12];

    v14 = [v13 allObjects];

    os_unfair_lock_unlock(&self->_lock);
    v15 = (void *)MEMORY[0x1D9452090]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v33 = v18;
      __int16 v34 = 2112;
      id v35 = v7;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying delegates of IDS Activity update: %@", buf, 0x16u);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = v14;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v28;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v22++), "observer:didUpdateDevice:isOnline:", v16, v10, objc_msgSend(v7, "isDeviceOnline", (void)v27));
        }
        while (v20 != v22);
        uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v20);
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x1D9452090]();
    v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v33 = v26;
      __int16 v34 = 2112;
      id v35 = v7;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Received IDS Activity update for unkonwn device: %@", buf, 0x16u);
    }
  }
}

- (void)stopObservingPresenceForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDIDSActivityMonitorObserver *)self dataSource];
  [v5 stopObservingDevice:v4 subActivity:*MEMORY[0x1E4F6A690]];
}

- (void)startObservingPresenceForDevice:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDIDSActivityMonitorObserver *)self dataSource];

  if (!v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@startObservingPresenceForDevice: called before configureWithDataSource:", (uint8_t *)&v11, 0xCu);
    }
  }
  v10 = [(HMDIDSActivityMonitorObserver *)self dataSource];
  [v10 startObservingDevice:v4 subActivity:*MEMORY[0x1E4F6A690]];
}

- (void)removeObserver:(id)a3 forSubActivity:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  id v7 = [(NSMutableDictionary *)self->_subactivityToDelegatesMap objectForKeyedSubscript:v6];
  v8 = v7;
  if (v7)
  {
    [v7 removeObject:v9];
    if (![v8 count]) {
      [(NSMutableDictionary *)self->_subactivityToDelegatesMap setObject:0 forKeyedSubscript:v6];
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)addObserver:(id)a3 forSubActivity:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  uint64_t v7 = [(NSMutableDictionary *)self->_subactivityToDelegatesMap count];
  v8 = [(NSMutableDictionary *)self->_subactivityToDelegatesMap objectForKeyedSubscript:v6];
  if (!v8)
  {
    v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMutableDictionary *)self->_subactivityToDelegatesMap setObject:v8 forKeyedSubscript:v6];
  }
  [v8 addObject:v10];

  os_unfair_lock_unlock(&self->_lock);
  if (!v7)
  {
    id v9 = [(HMDIDSActivityMonitorObserver *)self activityMonitor];
    [v9 listenWithDelegate:self];
  }
}

- (void)configureWithDataSource:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v9 = v4;
  id v5 = [(HMDIDSActivityMonitorObserver *)self dataSource];

  if (v5)
  {
LABEL_7:
    id v6 = (HMDIDSActivityMonitorObserver *)_HMFPreconditionFailure();
    [(HMDIDSActivityMonitorObserver *)v6 initWithActivityMonitor:v8];
    return;
  }
  [(HMDIDSActivityMonitorObserver *)self setDataSource:v9];
}

- (HMDIDSActivityMonitorObserver)initWithActivityMonitor:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDIDSActivityMonitorObserver;
  id v6 = [(HMDIDSActivityMonitorObserver *)&v11 init];
  SEL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityMonitor, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    subactivityToDelegatesMap = v7->_subactivityToDelegatesMap;
    v7->_subactivityToDelegatesMap = (NSMutableDictionary *)v8;
  }
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17_135831 != -1) {
    dispatch_once(&logCategory__hmf_once_t17_135831, &__block_literal_global_147_135832);
  }
  v2 = (void *)logCategory__hmf_once_v18_135833;
  return v2;
}

uint64_t __44__HMDIDSActivityMonitorObserver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v18_135833;
  logCategory__hmf_once_v18_135833 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end