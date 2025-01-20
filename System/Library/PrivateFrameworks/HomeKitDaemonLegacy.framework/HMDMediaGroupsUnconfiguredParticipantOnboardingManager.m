@interface HMDMediaGroupsUnconfiguredParticipantOnboardingManager
+ (id)logCategory;
- (HMDMediaGroupsUnconfiguredParticipantOnboardingManager)initWithIdentifier:(id)a3;
- (HMDMediaGroupsUnconfiguredParticipantOnboardingManagerDataSource)dataSource;
- (NSUUID)identifier;
- (id)dequeuedAssociatedGroupIdentifierForParticipantAccessoryUUID:(id)a3;
- (id)logIdentifier;
- (id)mediaDestinationManagerWithParticipantAccessoryUUID:(id)a3;
- (id)queuedParticipantAccessoryUUIDs;
- (void)attemptOnboardingForParticipantAccessoryUUID:(id)a3;
- (void)configureWithNotificationCenter:(id)a3;
- (void)dequeueAvailableOnboadedParticipants;
- (void)queueOnboardingParticipantWithAccessoryUUID:(id)a3 withAssociatedGroupIdentifier:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setQueuedAssociatedGroupIdentifier:(id)a3 forParticipantAccessoryUUID:(id)a4;
@end

@implementation HMDMediaGroupsUnconfiguredParticipantOnboardingManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_queuedAssociatedGroupIdentifiers, 0);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDMediaGroupsUnconfiguredParticipantOnboardingManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaGroupsUnconfiguredParticipantOnboardingManagerDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDMediaGroupsUnconfiguredParticipantOnboardingManager *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)mediaDestinationManagerWithParticipantAccessoryUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDMediaGroupsUnconfiguredParticipantOnboardingManager *)self dataSource];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 mediaDestinationManagerWithParticipantAccessoryUUID:v4 forMediaGroupsUnconfiguredParticipantOnboardingManager:self];
  }
  else
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media destination manager with participant accessory uuid: %@ due to no data source", (uint8_t *)&v13, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (id)dequeuedAssociatedGroupIdentifierForParticipantAccessoryUUID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = [(NSMutableDictionary *)self->_queuedAssociatedGroupIdentifiers objectForKey:v4];
  if (v5) {
    [(NSMutableDictionary *)self->_queuedAssociatedGroupIdentifiers removeObjectForKey:v4];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (id)queuedParticipantAccessoryUUIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_queuedAssociatedGroupIdentifiers allKeys];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setQueuedAssociatedGroupIdentifier:(id)a3 forParticipantAccessoryUUID:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_queuedAssociatedGroupIdentifiers setObject:v7 forKey:v6];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)attemptOnboardingForParticipantAccessoryUUID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDMediaGroupsUnconfiguredParticipantOnboardingManager *)self mediaDestinationManagerWithParticipantAccessoryUUID:v4];
  if (v5)
  {
    id v6 = [(HMDMediaGroupsUnconfiguredParticipantOnboardingManager *)self dequeuedAssociatedGroupIdentifierForParticipantAccessoryUUID:v4];
    if (v6)
    {
      id v7 = (void *)MEMORY[0x1D9452090]();
      v8 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = HMFGetLogIdentifier();
        v11 = [v5 identifier];
        *(_DWORD *)buf = 138544130;
        __int16 v15 = v10;
        __int16 v16 = 2112;
        uint64_t v17 = v6;
        __int16 v18 = 2112;
        id v19 = v4;
        __int16 v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending request to update audio group identifier: %@ for participant accessory identifier: %@ destination: %@", buf, 0x2Au);
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __103__HMDMediaGroupsUnconfiguredParticipantOnboardingManager_attemptOnboardingForParticipantAccessoryUUID___block_invoke;
      v12[3] = &unk_1E6A196E0;
      v12[4] = v8;
      id v13 = v4;
      [v5 requestToUpdateAudioGroupIdentifier:v6 completion:v12];
    }
  }
}

void __103__HMDMediaGroupsUnconfiguredParticipantOnboardingManager_attemptOnboardingForParticipantAccessoryUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138543874;
      __int16 v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      v10 = "%{public}@Completed send request to update audio group identifier for participant accessory identifier: %@ with error: %@";
      v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138543618;
    __int16 v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    v10 = "%{public}@Completed send request to update audio group identifier for participant accessory identifier: %@";
    v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

- (void)dequeueAvailableOnboadedParticipants
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMediaGroupsUnconfiguredParticipantOnboardingManager *)self queuedParticipantAccessoryUUIDs];
  if ([v3 count])
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v10 = v7;
      __int16 v11 = 2112;
      os_log_type_t v12 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Attempting onboarding for participant accessory uuids: %@", buf, 0x16u);
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __94__HMDMediaGroupsUnconfiguredParticipantOnboardingManager_dequeueAvailableOnboadedParticipants__block_invoke;
    v8[3] = &unk_1E6A0F000;
    v8[4] = v5;
    objc_msgSend(v3, "na_each:", v8);
  }
}

uint64_t __94__HMDMediaGroupsUnconfiguredParticipantOnboardingManager_dequeueAvailableOnboadedParticipants__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) attemptOnboardingForParticipantAccessoryUUID:a2];
}

- (void)queueOnboardingParticipantWithAccessoryUUID:(id)a3 withAssociatedGroupIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = HMFGetLogIdentifier();
    int v12 = 138543874;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Queueing onboarding for participant accessory uuid: %@ associated group identifier: %@", (uint8_t *)&v12, 0x20u);
  }
  [(HMDMediaGroupsUnconfiguredParticipantOnboardingManager *)v9 setQueuedAssociatedGroupIdentifier:v7 forParticipantAccessoryUUID:v6];
  [(HMDMediaGroupsUnconfiguredParticipantOnboardingManager *)v9 dequeueAvailableOnboadedParticipants];
}

- (void)configureWithNotificationCenter:(id)a3
{
}

- (HMDMediaGroupsUnconfiguredParticipantOnboardingManager)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)HMDMediaGroupsUnconfiguredParticipantOnboardingManager;
    id v7 = [(HMDMediaGroupsUnconfiguredParticipantOnboardingManager *)&v14 init];
    v8 = v7;
    if (v7)
    {
      v7->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v7->_identifier, a3);
      uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
      queuedAssociatedGroupIdentifiers = v8->_queuedAssociatedGroupIdentifiers;
      v8->_queuedAssociatedGroupIdentifiers = (NSMutableDictionary *)v9;
    }
    return v8;
  }
  else
  {
    int v12 = (void *)_HMFPreconditionFailure();
    return (HMDMediaGroupsUnconfiguredParticipantOnboardingManager *)+[HMDMediaGroupsUnconfiguredParticipantOnboardingManager logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_103524 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_103524, &__block_literal_global_103525);
  }
  v2 = (void *)logCategory__hmf_once_v10_103526;
  return v2;
}

uint64_t __69__HMDMediaGroupsUnconfiguredParticipantOnboardingManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v10_103526;
  logCategory__hmf_once_v10_103526 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end