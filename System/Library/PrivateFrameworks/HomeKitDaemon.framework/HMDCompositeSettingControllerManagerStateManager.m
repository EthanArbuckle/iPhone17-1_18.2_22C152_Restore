@interface HMDCompositeSettingControllerManagerStateManager
+ (id)logCategory;
- (HMDCompositeSettingControllerManagerStateManager)initWithDataSource:(id)a3 notificationRegistrationProvider:(id)a4 subscribeWithOptions:(unint64_t)a5 delegate:(id)a6 uuid:(id)a7;
- (HMDCompositeSettingControllerManagerStateManagerDataSource)dataSource;
- (HMDCompositeSettingControllerManagerStateTransitionDelegate)delegate;
- (HMDCompositeSettingNotificationRegistrationProviding)notificationRegistrationProvider;
- (NSUUID)uuid;
- (id)logIdentifier;
- (int64_t)stateForHomeUUID:(id)a3;
- (unint64_t)notificationOptions;
- (void)_computeResidentStateChangeForHome:(id)a3;
- (void)_createStateForHomeUUIDIfNotExist:(id)a3;
- (void)_handleAccessoryLanguagesChangedNotification:(id)a3;
- (void)_handleAccessoryRemovedNotification:(id)a3;
- (void)_handleCompositeSettingsControllerConfiguredNotification:(id)a3;
- (void)_handleHomeAdded:(id)a3;
- (void)_handleResidentDeviceUpdated:(id)a3;
- (void)_handleSiriEndpointProfileCreation:(id)a3;
- (void)_handleSiriEndpointProfileSettingsUpdate:(id)a3;
- (void)_registerForNotifications;
- (void)_unregisterForNotifications;
@end

@implementation HMDCompositeSettingControllerManagerStateManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_notificationRegistrationProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeUUIDToState, 0);
}

- (HMDCompositeSettingControllerManagerStateManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDCompositeSettingControllerManagerStateManagerDataSource *)WeakRetained;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)notificationOptions
{
  return self->_notificationOptions;
}

- (HMDCompositeSettingNotificationRegistrationProviding)notificationRegistrationProvider
{
  return (HMDCompositeSettingNotificationRegistrationProviding *)objc_getProperty(self, a2, 32, 1);
}

- (HMDCompositeSettingControllerManagerStateTransitionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCompositeSettingControllerManagerStateTransitionDelegate *)WeakRetained;
}

- (int64_t)stateForHomeUUID:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = [(NSMutableDictionary *)self->_homeUUIDToState objectForKeyedSubscript:v4];
  v7 = (void *)v6;
  v8 = &unk_26E4728B0;
  if (v6) {
    v8 = (void *)v6;
  }
  id v9 = v8;

  if ([v9 integerValue] <= 3) {
    int64_t v10 = [v9 integerValue];
  }
  else {
    int64_t v10 = 4;
  }

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)logIdentifier
{
  v2 = [(HMDCompositeSettingControllerManagerStateManager *)self uuid];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)_handleAccessoryRemovedNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:@"HMDAccessoryNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8 && [v8 isHomePod])
  {
    id v9 = [v4 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v10 = v9;
    }
    else {
      int64_t v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      v12 = [(HMDCompositeSettingControllerManagerStateManager *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        v13 = [v11 uuid];
        [v12 languagesDidChangeForHome:v13];
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x230FBD990]();
      v15 = self;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        int v18 = 138543362;
        v19 = v17;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find home for removed accessory, will not process language change", (uint8_t *)&v18, 0xCu);
      }
    }
  }
}

- (void)_handleAccessoryLanguagesChangedNotification:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v19 = 138543618;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received notification for language list change: %@", (uint8_t *)&v19, 0x16u);
  }
  id v9 = [v4 userInfo];
  int64_t v10 = [v9 objectForKeyedSubscript:@"HMDHomeNotificationKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    v13 = [(HMDCompositeSettingControllerManagerStateManager *)v6 delegate];
    if (objc_opt_respondsToSelector())
    {
      v14 = [v12 uuid];
      [v13 languagesDidChangeForHome:v14];
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = v6;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find home to work with, will not process language change", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)_computeResidentStateChangeForHome:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 uuid];
  if ([v4 isCurrentDeviceAvailableResident])
  {
    os_unfair_lock_lock_with_options();
    [(HMDCompositeSettingControllerManagerStateManager *)self _createStateForHomeUUIDIfNotExist:v5];
    uint64_t v6 = [(NSMutableDictionary *)self->_homeUUIDToState objectForKeyedSubscript:v5];
    uint64_t v7 = [v6 integerValue];
    int v8 = [v4 isCurrentDeviceConfirmedPrimaryResident];
    if (v8) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 2;
    }
    int64_t v10 = [NSNumber numberWithInteger:v9];
    [(NSMutableDictionary *)self->_homeUUIDToState setObject:v10 forKeyedSubscript:v5];

    os_unfair_lock_unlock(&self->_lock);
    if ((unint64_t)(v7 - 1) > 3) {
      id v11 = @"HMDCompositeSettingControllerManagerRunStatePrimaryResidentUnknown";
    }
    else {
      id v11 = off_264A258C8[v7 - 1];
    }
    v16 = @"HMDCompositeSettingControllerManagerRunStateResident";
    if (v8) {
      v16 = @"HMDCompositeSettingControllerManagerRunStatePrimaryResident";
    }
    v17 = v16;
    int v18 = (void *)MEMORY[0x230FBD990]();
    int v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = HMFGetLogIdentifier();
      int v23 = 138543874;
      v24 = v21;
      __int16 v25 = 2112;
      v26 = v11;
      __int16 v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@updated device is a resident and is the current device, state: %@ -> %@", (uint8_t *)&v23, 0x20u);
    }
    id v22 = [(HMDCompositeSettingControllerManagerStateManager *)v19 delegate];
    [v22 didUpdateCurrentRunState:v7 updatedState:v9 forHome:v5];
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      int v23 = 138543618;
      v24 = v15;
      __int16 v25 = 2112;
      v26 = @"HMDCompositeSettingControllerManagerRunStateRegular";
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Current device is not a resident, will update current state to %@", (uint8_t *)&v23, 0x16u);
    }
    os_unfair_lock_lock_with_options();
    [(HMDCompositeSettingControllerManagerStateManager *)v13 _createStateForHomeUUIDIfNotExist:v5];
    [(NSMutableDictionary *)v13->_homeUUIDToState setObject:&unk_26E472898 forKeyedSubscript:v5];
    os_unfair_lock_unlock(&v13->_lock);
  }
}

- (void)_handleResidentDeviceUpdated:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 name];
    int v23 = 138543618;
    v24 = v8;
    __int16 v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received notification for resident update: %{public}@", (uint8_t *)&v23, 0x16u);
  }
  int64_t v10 = [v4 userInfo];
  id v11 = [v10 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  if (v11) {
    id v12 = @"HMDResidentDeviceManagerResidentDeviceNotificationKey";
  }
  else {
    id v12 = @"HMDResidentDeviceResidentNotificationKey";
  }
  v13 = [v10 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  uint64_t v16 = [v15 home];
  v17 = (void *)v16;
  if (!v15)
  {
    int v18 = (void *)MEMORY[0x230FBD990]();
    int v19 = v6;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      int v23 = 138543362;
      v24 = v21;
      id v22 = "%{public}@Couldn't find resident, will not process resident update";
LABEL_16:
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v23, 0xCu);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!v16)
  {
    int v18 = (void *)MEMORY[0x230FBD990]();
    int v19 = v6;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      int v23 = 138543362;
      v24 = v21;
      id v22 = "%{public}@Couldn't find home to work with, will not process resident update";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  [(HMDCompositeSettingControllerManagerStateManager *)v6 _computeResidentStateChangeForHome:v16];
LABEL_18:
}

- (void)_handleSiriEndpointProfileCreation:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v21 = 138543618;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling HMDSiriEndpointProfileAddedNotification:%@", (uint8_t *)&v21, 0x16u);
  }
  uint64_t v9 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    id v12 = [v11 home];
    if (v12)
    {
      [(HMDCompositeSettingControllerManagerStateManager *)v6 _computeResidentStateChangeForHome:v12];
    }
    else
    {
      v17 = (void *)MEMORY[0x230FBD990]();
      int v18 = v6;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        int v21 = 138543362;
        id v22 = v20;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@HomeUUID or home are null, will not update state after siri endpoint profile creation", (uint8_t *)&v21, 0xCu);
      }
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = v6;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v21 = 138543618;
      id v22 = v16;
      __int16 v23 = 2112;
      id v24 = 0;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Accessory %@ is not a HAPAccessory", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)_handleSiriEndpointProfileSettingsUpdate:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v24 = 138543618;
    uint64_t v25 = v8;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@received notification:%@", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v9 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = 0;
  }
  id v11 = v10;

  id v12 = [v11 accessory];
  v13 = [v12 home];
  uint64_t v14 = [v13 uuid];
  if (!v14
    || (id v15 = (void *)v14,
        [v12 uuid],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        !v16))
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    int v18 = v6;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v24 = 138543874;
      uint64_t v25 = v20;
      __int16 v26 = 2112;
      id v27 = v12;
      __int16 v28 = 2112;
      uint64_t v29 = v13;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@nil home:%@ or accessory:%@", (uint8_t *)&v24, 0x20u);
    }
  }
  int v21 = [(HMDCompositeSettingControllerManagerStateManager *)v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v22 = [v13 uuid];
    __int16 v23 = [v12 uuid];
    [v21 didUpdateSiriEndpointSettingForHomeUUID:v22 accessoryUUID:v23];
  }
}

- (void)_handleHomeAdded:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@received notification:%@", buf, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  uint64_t v9 = [(HMDCompositeSettingControllerManagerStateManager *)v6 dataSource];
  int64_t v10 = [v9 homes];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__HMDCompositeSettingControllerManagerStateManager__handleHomeAdded___block_invoke;
  v11[3] = &unk_264A2B898;
  v11[4] = v6;
  objc_msgSend(v10, "na_each:", v11);

  os_unfair_lock_unlock(&v6->_lock);
}

void __69__HMDCompositeSettingControllerManagerStateManager__handleHomeAdded___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  [v2 _createStateForHomeUUIDIfNotExist:v3];
}

- (void)_handleCompositeSettingsControllerConfiguredNotification:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v20 = 138543362;
    int v21 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Did handle CompositeSettingsControllerDidConfigure notification", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v9 = [v4 userInfo];
  int64_t v10 = [v9 objectForKeyedSubscript:@"HMDHomeUUIDOwnerUUIDKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  v13 = objc_msgSend(v12, "hmf_UUIDForKey:", @"HMDCompositeSettingControllerHomeUUIDNotificationKey");
  __int16 v14 = objc_msgSend(v12, "hmf_UUIDForKey:", @"HMDCompositeSettingControllerOwnerUUIDNotificationKey");
  if (v14 && v13)
  {
    id v15 = [(HMDCompositeSettingControllerManagerStateManager *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      [v15 didConfigureCompositeSettingsControllerForHomeUUID:v13 accessoryUUID:v14];
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    v17 = v6;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = HMFGetLogIdentifier();
      int v20 = 138543874;
      int v21 = v19;
      __int16 v22 = 2112;
      __int16 v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v13;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil hapAccessoryUUID:%@ or homeUUID:%@", (uint8_t *)&v20, 0x20u);
    }
  }
}

- (void)_createStateForHomeUUIDIfNotExist:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = [(NSMutableDictionary *)self->_homeUUIDToState objectForKeyedSubscript:v4];

  if (!v5)
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    uint64_t v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543874;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = @"HMDCompositeSettingControllerManagerRunStateRegular";
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Initializing state for home %@ as %@", (uint8_t *)&v10, 0x20u);
    }
    [(NSMutableDictionary *)self->_homeUUIDToState setObject:&unk_26E472898 forKeyedSubscript:v4];
  }
}

- (void)_unregisterForNotifications
{
  id v3 = [(HMDCompositeSettingControllerManagerStateManager *)self notificationRegistrationProvider];
  [v3 removeObserver:self];
}

- (void)_registerForNotifications
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    uint64_t v7 = [(HMDCompositeSettingControllerManagerStateManager *)v4 notificationOptions];
    int v8 = @"HMDCompositeSettingControllerRunStateResidentNotification";
    switch(v7)
    {
      case 1:
        break;
      case 2:
        int v8 = @"HMDCompositeSettingControllerRunStateHomeNotification";
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_6;
      case 4:
        int v8 = @"HMDCompositeSettingControllerRunStateSidekickNotification";
        break;
      case 8:
        int v8 = @"HMDCompositeSettingControllerRunStateAccessoryNotification";
        break;
      default:
        if (v7 == 15) {
          int v8 = @"HMDCompositeSettingControllerRunStateAllNotification";
        }
        else {
LABEL_6:
        }
          int v8 = @"HMDCompositeSettingControllerRunStateUnkownNotification";
        break;
    }
    int v9 = 138543618;
    int v10 = v6;
    __int16 v11 = 2112;
    __int16 v12 = v8;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Register for notification with option: %@", (uint8_t *)&v9, 0x16u);
  }
  if ([(HMDCompositeSettingControllerManagerStateManager *)v4 notificationOptions])
  {
    [(HMDCompositeSettingNotificationRegistrationProviding *)v4->_notificationRegistrationProvider addObserver:v4 selector:sel__handleResidentDeviceUpdated_ name:@"HMDResidentDeviceManagerAddResidentNotification" object:0];
    [(HMDCompositeSettingNotificationRegistrationProviding *)v4->_notificationRegistrationProvider addObserver:v4 selector:sel__handleResidentDeviceUpdated_ name:@"HMDResidentDeviceManagerRemoveResidentNotification" object:0];
    [(HMDCompositeSettingNotificationRegistrationProviding *)v4->_notificationRegistrationProvider addObserver:v4 selector:sel__handleResidentDeviceUpdated_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:0];
    [(HMDCompositeSettingNotificationRegistrationProviding *)v4->_notificationRegistrationProvider addObserver:v4 selector:sel__handleResidentDeviceUpdated_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:0];
    [(HMDCompositeSettingNotificationRegistrationProviding *)v4->_notificationRegistrationProvider addObserver:v4 selector:sel__handleResidentDeviceUpdated_ name:@"HMDResidentDeviceManagerUpdateResidentNotification" object:0];
  }
  if (([(HMDCompositeSettingControllerManagerStateManager *)v4 notificationOptions] & 2) != 0) {
    [(HMDCompositeSettingNotificationRegistrationProviding *)v4->_notificationRegistrationProvider addObserver:v4 selector:sel__handleHomeAdded_ name:@"HMDHomeAddedNotification" object:0];
  }
  if (([(HMDCompositeSettingControllerManagerStateManager *)v4 notificationOptions] & 4) != 0)
  {
    [(HMDCompositeSettingNotificationRegistrationProviding *)v4->_notificationRegistrationProvider addObserver:v4 selector:sel__handleSiriEndpointProfileCreation_ name:@"HMDSiriEndpointProfileAddedNotification" object:0];
    [(HMDCompositeSettingNotificationRegistrationProviding *)v4->_notificationRegistrationProvider addObserver:v4 selector:sel__handleSiriEndpointProfileSettingsUpdate_ name:@"HMDSiriEndpointProfileSettingsUpdatedNotification" object:0];
    [(HMDCompositeSettingNotificationRegistrationProviding *)v4->_notificationRegistrationProvider addObserver:v4 selector:sel__handleCompositeSettingsControllerConfiguredNotification_ name:@"HMDCompositeSettingsControllerDidConfigureNotification" object:0];
  }
  if (([(HMDCompositeSettingControllerManagerStateManager *)v4 notificationOptions] & 8) != 0)
  {
    [(HMDCompositeSettingNotificationRegistrationProviding *)v4->_notificationRegistrationProvider addObserver:v4 selector:sel__handleAccessoryLanguagesChangedNotification_ name:@"HMDAppleMediaAccessoryLanguagesChangedNotification" object:0];
    [(HMDCompositeSettingNotificationRegistrationProviding *)v4->_notificationRegistrationProvider addObserver:v4 selector:sel__handleAccessoryRemovedNotification_ name:@"HMDHomeAccessoryRemovedNotification" object:0];
  }
}

- (HMDCompositeSettingControllerManagerStateManager)initWithDataSource:(id)a3 notificationRegistrationProvider:(id)a4 subscribeWithOptions:(unint64_t)a5 delegate:(id)a6 uuid:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDCompositeSettingControllerManagerStateManager;
  uint64_t v16 = [(HMDCompositeSettingControllerManagerStateManager *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v14);
    objc_storeStrong((id *)&v17->_notificationRegistrationProvider, a4);
    v17->_notificationOptions = a5;
    objc_storeStrong((id *)&v17->_uuid, a7);
    v17->_lock._os_unfair_lock_opaque = 0;
    int v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    homeUUIDToState = v17->_homeUUIDToState;
    v17->_homeUUIDToState = v18;

    objc_storeWeak((id *)&v17->_dataSource, v12);
    [(HMDCompositeSettingControllerManagerStateManager *)v17 _unregisterForNotifications];
    [(HMDCompositeSettingControllerManagerStateManager *)v17 _registerForNotifications];
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t29_194568 != -1) {
    dispatch_once(&logCategory__hmf_once_t29_194568, &__block_literal_global_194569);
  }
  v2 = (void *)logCategory__hmf_once_v30_194570;
  return v2;
}

void __63__HMDCompositeSettingControllerManagerStateManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v30_194570;
  logCategory__hmf_once_v30_194570 = v0;
}

@end