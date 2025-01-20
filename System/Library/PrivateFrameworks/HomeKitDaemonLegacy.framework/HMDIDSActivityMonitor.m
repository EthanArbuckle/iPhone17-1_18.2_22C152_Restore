@interface HMDIDSActivityMonitor
+ (id)logCategory;
- (HMDIDSActivityMonitor)initWithActivity:(id)a3 serviceIdentifier:(id)a4;
- (IDSActivityMonitor)activityMonitor;
- (NSString)description;
- (id)logIdentifier;
- (void)listenWithDelegate:(id)a3;
@end

@implementation HMDIDSActivityMonitor

- (void).cxx_destruct
{
}

- (IDSActivityMonitor)activityMonitor
{
  return (IDSActivityMonitor *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDIDSActivityMonitor *)self activityMonitor];
  v3 = [v2 activity];

  return v3;
}

- (NSString)description
{
  v2 = [(HMDIDSActivityMonitor *)self activityMonitor];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (void)listenWithDelegate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    int v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Enabling IDSActivityMonitor", (uint8_t *)&v11, 0xCu);
  }
  v9 = [(HMDIDSActivityMonitor *)v6 activityMonitor];
  [v9 setDelegate:v4];

  v10 = [(HMDIDSActivityMonitor *)v6 activityMonitor];
  [v10 setListeningForUpdates:1];
}

- (HMDIDSActivityMonitor)initWithActivity:(id)a3 serviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDIDSActivityMonitor;
  v8 = [(HMDIDSActivityMonitor *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F6AAD0]) initWithActivity:v6 serviceIdentifier:v7];
    activityMonitor = v8->_activityMonitor;
    v8->_activityMonitor = (IDSActivityMonitor *)v9;
  }
  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_135719 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_135719, &__block_literal_global_135720);
  }
  v2 = (void *)logCategory__hmf_once_v2_135721;
  return v2;
}

uint64_t __36__HMDIDSActivityMonitor_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_135721;
  logCategory__hmf_once_v2_135721 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end