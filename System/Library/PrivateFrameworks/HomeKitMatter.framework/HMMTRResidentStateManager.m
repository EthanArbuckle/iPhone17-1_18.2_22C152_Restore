@interface HMMTRResidentStateManager
+ (id)logCategory;
- (BOOL)isCurrentDevicePrimaryResident;
- (HMMTRResidentStateManager)init;
- (HMMTRResidentStateManagerDataSource)dataSource;
- (HMMTRResidentStateManagerDelegate)delegate;
- (void)handleResidentReachabilityChangeForFabric:(id)a3;
- (void)handleResidentStateUpdated;
- (void)handleUpdateNotificationsEnabled:(BOOL)a3 forFabric:(id)a4 keepAliveOnly:(BOOL)a5;
- (void)setCurrentDevicePrimaryResident:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMMTRResidentStateManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)setDelegate:(id)a3
{
}

- (HMMTRResidentStateManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMMTRResidentStateManagerDelegate *)WeakRetained;
}

- (void)setCurrentDevicePrimaryResident:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  uint64_t v6 = os_unfair_lock_lock_with_options();
  if (self->_currentDevicePrimaryResident != v3)
  {
    v7 = (void *)MEMORY[0x2533B64D0](v6);
    v8 = self;
    HMFGetOSLogHandle();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = HMFBooleanToString();
      int v13 = 138543874;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v11;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating isCurrentDevicePrimaryResident from %@ to %@", (uint8_t *)&v13, 0x20u);
    }
    self->_currentDevicePrimaryResident = v3;
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isCurrentDevicePrimaryResident
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_currentDevicePrimaryResident;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)handleUpdateNotificationsEnabled:(BOOL)a3 forFabric:(id)a4 keepAliveOnly:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = [v8 fabricID];
  id v10 = (void *)MEMORY[0x2533B64D0]();
  id v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    id v14 = HMFBooleanToString();
    __int16 v15 = HMFBooleanToString();
    int v21 = 138544130;
    v22 = v13;
    __int16 v23 = 2112;
    v24 = v14;
    __int16 v25 = 2112;
    v26 = v9;
    __int16 v27 = 2112;
    v28 = v15;
    _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Receive update notification enabled:%@ for fabricID:%@ keepAliveOnly:%@", (uint8_t *)&v21, 0x2Au);
  }
  if (v9 && ![v9 isEqualToNumber:&unk_2702B53D0])
  {
    v20 = [(HMMTRResidentStateManager *)v11 delegate];
    [v20 handleUpdateNotificationsEnabled:v6 forFabric:v8 keepAliveOnly:v5];
  }
  else
  {
    id v16 = (void *)MEMORY[0x2533B64D0]();
    __int16 v17 = v11;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      int v21 = 138543618;
      v22 = v19;
      __int16 v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@Received %@ as fabricID, ignoring updateNotifications", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)handleResidentReachabilityChangeForFabric:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 fabricID];
  BOOL v6 = (void *)MEMORY[0x2533B64D0]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v15 = 138543618;
    id v16 = v9;
    __int16 v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Resident state change for fabricID:%@", (uint8_t *)&v15, 0x16u);
  }
  if (v5 && ![v5 isEqualToNumber:&unk_2702B53D0])
  {
    id v14 = [(HMMTRResidentStateManager *)v7 delegate];
    [v14 handleResidentReachabilityChangeForFabric:v4];
  }
  else
  {
    id v10 = (void *)MEMORY[0x2533B64D0]();
    id v11 = v7;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v13;
      __int16 v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Received %@ as fabricID, ignoring ResidentReachabilityChange", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)handleResidentStateUpdated
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Handling updated resident state", (uint8_t *)&v8, 0xCu);
  }
  v7 = [(HMMTRResidentStateManager *)v4 dataSource];
  -[HMMTRResidentStateManager setCurrentDevicePrimaryResident:](v4, "setCurrentDevicePrimaryResident:", [v7 isCurrentDevicePrimaryResident]);
}

- (void)setDataSource:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_dataSource, v4);
  os_unfair_lock_unlock(&self->_lock);
  BOOL v5 = (void *)MEMORY[0x2533B64D0](-[HMMTRResidentStateManager setCurrentDevicePrimaryResident:](self, "setCurrentDevicePrimaryResident:", [v4 isCurrentDevicePrimaryResident]));
  BOOL v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    [(HMMTRResidentStateManager *)v6 isCurrentDevicePrimaryResident];
    v9 = HMFBooleanToString();
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2112;
    int v13 = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Data source set with isCurrentDevicePrimaryResident: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (HMMTRResidentStateManagerDataSource)dataSource
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  os_unfair_lock_unlock(p_lock);
  return (HMMTRResidentStateManagerDataSource *)WeakRetained;
}

- (HMMTRResidentStateManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMMTRResidentStateManager;
  result = [(HMMTRResidentStateManager *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11 != -1) {
    dispatch_once(&logCategory__hmf_once_t11, &__block_literal_global_2396);
  }
  v2 = (void *)logCategory__hmf_once_v12;
  return v2;
}

uint64_t __40__HMMTRResidentStateManager_logCategory__block_invoke()
{
  logCategory__hmf_once___int16 v12 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end