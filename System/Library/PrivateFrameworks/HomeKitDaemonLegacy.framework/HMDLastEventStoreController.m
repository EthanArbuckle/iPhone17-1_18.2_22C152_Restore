@interface HMDLastEventStoreController
+ (id)logCategory;
- (HMDLastEventStoreController)initWithWithEventStore:(id)a3;
- (HMELastEventStore)eventStore;
- (void)didRemoveAccessory:(id)a3;
- (void)didRemoveHome:(id)a3;
- (void)didRemoveMediaSystem:(id)a3;
@end

@implementation HMDLastEventStoreController

- (void).cxx_destruct
{
}

- (HMELastEventStore)eventStore
{
  return self->_eventStore;
}

- (void)didRemoveAccessory:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Removing accessory events, accessory: %@", buf, 0x16u);
  }
  v9 = [(HMDLastEventStoreController *)v6 eventStore];
  v10 = NSString;
  v11 = [v4 UUIDString];
  v12 = [v10 stringWithFormat:@"accessory.%@", v11];
  [v9 resetWildcardTopics:v12];
}

- (void)didRemoveMediaSystem:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Removing media system events, media system: %@", buf, 0x16u);
  }
  v9 = [(HMDLastEventStoreController *)v6 eventStore];
  v10 = NSString;
  v11 = [v4 UUIDString];
  v12 = [v10 stringWithFormat:@"stereo.%@", v11];
  [v9 resetWildcardTopics:v12];
}

- (void)didRemoveHome:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Removing home events, home: %@", buf, 0x16u);
  }
  v9 = [(HMDLastEventStoreController *)v6 eventStore];
  v10 = NSString;
  v11 = [v4 UUIDString];
  v12 = [v10 stringWithFormat:@"home.%@", v11];
  [v9 resetWildcardTopics:v12];
}

- (HMDLastEventStoreController)initWithWithEventStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLastEventStoreController;
  v6 = [(HMDLastEventStoreController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_eventStore, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_105713 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_105713, &__block_literal_global_105714);
  }
  v2 = (void *)logCategory__hmf_once_v4_105715;
  return v2;
}

uint64_t __42__HMDLastEventStoreController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_105715;
  logCategory__hmf_once_v4_105715 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end