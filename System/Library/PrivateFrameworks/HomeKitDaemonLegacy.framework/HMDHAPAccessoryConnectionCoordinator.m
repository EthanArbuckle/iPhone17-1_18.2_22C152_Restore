@interface HMDHAPAccessoryConnectionCoordinator
+ (id)logCategory;
- (HMDHAPAccessoryConnectionCoordinator)initWithHome:(id)a3 notificationCenter:(id)a4;
- (id)logIdentifier;
- (void)_disableDisconnectOnIdleWithAccessoriesAndConnect:(BOOL)a3;
- (void)_enableDisconnectOnIdleWithAccessories;
- (void)configureWithIsResidentCapable:(BOOL)a3;
- (void)evaluateAccessoryConnectionStatus;
- (void)handleCurrentResidentChanged:(id)a3;
- (void)handleIsResidentFirstAccessoryCommunicationEnabledDidChangeNotification:(id)a3;
- (void)handlePrimaryResidentChanged:(id)a3;
- (void)handleResidentAddRemove:(id)a3;
- (void)handleResidentChangedOnNonResident;
- (void)handleResidentStatusChanged:(id)a3;
- (void)handleResidentUpdated:(id)a3;
@end

@implementation HMDHAPAccessoryConnectionCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (id)logIdentifier
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  }
  else {
    id WeakRetained = 0;
  }
  v3 = [WeakRetained uuid];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)_enableDisconnectOnIdleWithAccessories
{
  p_isa = (id *)&self->super.isa;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (p_isa) {
    p_isa = (id *)objc_loadWeakRetained(p_isa + 2);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = objc_msgSend(p_isa, "hapAccessories", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ((shouldDisconnectOnIdleForAccessory(v8) & 1) != 0 && ([v8 shouldDisconnectOnIdle] & 1) == 0) {
          [v8 setShouldDisconnectOnIdle:1];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_disableDisconnectOnIdleWithAccessoriesAndConnect:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  }
  else {
    id WeakRetained = 0;
  }
  v19 = self;
  v20 = WeakRetained;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [WeakRetained hapAccessories];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v10 shouldDisconnectOnIdle]) {
          [v10 setShouldDisconnectOnIdle:0];
        }
        if (v3)
        {
          long long v11 = [v10 bridge];
          BOOL v12 = v11 == 0;

          if (v12)
          {
            v13 = (void *)MEMORY[0x1D9452090]();
            uint64_t v14 = v19;
            HMFGetOSLogHandle();
            v15 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              v16 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v16;
              _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Triggering evaluation of HAP servers", buf, 0xCu);
            }
            *(void *)buf = 0;
            id v17 = (id)[v10 preferredHAPAccessoryForOperation:10 linkType:buf];
            [v20 retrieveHAPAccessoryForHMDAccessory:v10 linkType:*(void *)buf forceRetrieve:0 queue:0 completion:0];
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(lock);
}

- (void)evaluateAccessoryConnectionStatus
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  }
  else {
    id WeakRetained = 0;
  }
  v4 = (void *)MEMORY[0x1D9452090]();
  uint64_t v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    [WeakRetained isCurrentDevicePrimaryResident];
    uint64_t v8 = HMFBooleanToString();
    [WeakRetained isCurrentDeviceAvailableResident];
    long long v9 = HMFBooleanToString();
    [WeakRetained areAllResidentsUnreachable];
    long long v10 = HMFBooleanToString();
    *(_DWORD *)buf = 138544130;
    long long v22 = v7;
    __int16 v23 = 2114;
    long long v24 = v8;
    __int16 v25 = 2114;
    v26 = v9;
    __int16 v27 = 2114;
    v28 = v10;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Evaluating connection status for all accessories using - isCurrentDevicePrimaryResident = %{public}@, isCurrentDeviceAvailableResident = %{public}@, areAllResidentsUnreachable = %{public}@", buf, 0x2Au);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v11 = objc_msgSend(WeakRetained, "hapAccessories", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) checkHAPSessionRestore];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }

  if (defaultAccessoryShouldDisconnectOnIdleForHome(WeakRetained)) {
    [(HMDHAPAccessoryConnectionCoordinator *)v5 _enableDisconnectOnIdleWithAccessories];
  }
  else {
    -[HMDHAPAccessoryConnectionCoordinator _disableDisconnectOnIdleWithAccessoriesAndConnect:](v5, "_disableDisconnectOnIdleWithAccessoriesAndConnect:", [WeakRetained isCurrentDevicePrimaryResident]);
  }
}

- (void)handlePrimaryResidentChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  }
  else {
    id WeakRetained = 0;
  }
  int v6 = [WeakRetained isCurrentDeviceAvailableResident];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    long long v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Primary resident changed, evaluating connection status with accessories", (uint8_t *)&v11, 0xCu);
    }
    [(HMDHAPAccessoryConnectionCoordinator *)v8 evaluateAccessoryConnectionStatus];
  }
}

- (void)handleResidentChangedOnNonResident
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v4) {
      id WeakRetained = objc_loadWeakRetained((id *)&v4->_home);
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v8 = [WeakRetained name];
    if (v4) {
      id v9 = objc_loadWeakRetained((id *)&v4->_home);
    }
    else {
      id v9 = 0;
    }
    long long v10 = [v9 uuid];
    int v11 = [v10 UUIDString];
    int v12 = 138543874;
    id v13 = v6;
    __int16 v14 = 2112;
    v15 = v8;
    __int16 v16 = 2112;
    long long v17 = v11;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@A resident device was updated for home %@(%@), evaluating current non-resident device connection status with accessories", (uint8_t *)&v12, 0x20u);
  }
  [(HMDHAPAccessoryConnectionCoordinator *)v4 evaluateAccessoryConnectionStatus];
}

- (void)handleCurrentResidentChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    [v4 isEnabled];
    id v9 = HMFBooleanToString();
    if (v6) {
      id WeakRetained = objc_loadWeakRetained((id *)&v6->_home);
    }
    else {
      id WeakRetained = 0;
    }
    [WeakRetained isCurrentDevicePrimaryResident];
    int v11 = HMFBooleanToString();
    int v12 = 138543874;
    id v13 = v8;
    __int16 v14 = 2112;
    v15 = v9;
    __int16 v16 = 2112;
    long long v17 = v11;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Current device resident enable = %@, isPrimary = %@, evaluate connection status with accessories", (uint8_t *)&v12, 0x20u);
  }
  [(HMDHAPAccessoryConnectionCoordinator *)v6 evaluateAccessoryConnectionStatus];
}

- (void)handleIsResidentFirstAccessoryCommunicationEnabledDidChangeNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    long long v10 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Home changed resident first accessory communication enablement", (uint8_t *)&v9, 0xCu);
  }
  [(HMDHAPAccessoryConnectionCoordinator *)v6 evaluateAccessoryConnectionStatus];
}

- (void)handleResidentUpdated:(id)a3
{
  id v10 = a3;
  id v4 = [v10 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    if (self)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
      goto LABEL_7;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  id WeakRetained = 0;
LABEL_7:
  char v9 = [WeakRetained isCurrentDeviceAvailableResident];

  if ((v9 & 1) == 0) {
    [(HMDHAPAccessoryConnectionCoordinator *)self handleResidentChangedOnNonResident];
  }
}

- (void)handleResidentAddRemove:(id)a3
{
  id v10 = a3;
  id v4 = [v10 userInfo];
  uint64_t v5 = [v4 objectForKey:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    if ([v7 isCurrentDevice])
    {
      [(HMDHAPAccessoryConnectionCoordinator *)self handleCurrentResidentChanged:v7];
      goto LABEL_11;
    }
    if (self)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
      goto LABEL_9;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  id WeakRetained = 0;
LABEL_9:
  char v9 = [WeakRetained isCurrentDeviceAvailableResident];

  if ((v9 & 1) == 0) {
    [(HMDHAPAccessoryConnectionCoordinator *)self handleResidentChangedOnNonResident];
  }
LABEL_11:
}

- (void)handleResidentStatusChanged:(id)a3
{
  id v9 = a3;
  id v4 = [v9 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    if ([v6 isCurrentDevice])
    {
      [(HMDHAPAccessoryConnectionCoordinator *)self handleCurrentResidentChanged:v6];
      goto LABEL_11;
    }
    if (self)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
      goto LABEL_9;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  id WeakRetained = 0;
LABEL_9:
  char v8 = [WeakRetained isCurrentDeviceAvailableResident];

  if ((v8 & 1) == 0) {
    [(HMDHAPAccessoryConnectionCoordinator *)self handleResidentChangedOnNonResident];
  }
LABEL_11:
}

- (void)configureWithIsResidentCapable:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    self = (HMDHAPAccessoryConnectionCoordinator *)objc_getProperty(v4, v5, 24, 1);
  }
  else
  {
    id WeakRetained = 0;
  }
  [(HMDHAPAccessoryConnectionCoordinator *)self addObserver:v4 selector:sel_handleResidentStatusChanged_ name:@"HMDResidentDeviceEnabledStateChangedNotification" object:0];
  if (v4) {
    id Property = objc_getProperty(v4, v6, 24, 1);
  }
  else {
    id Property = 0;
  }
  [Property addObserver:v4 selector:sel_handleResidentAddRemove_ name:@"HMDResidentDeviceManagerAddResidentNotification" object:0];
  if (v4)
  {
    objc_msgSend(objc_getProperty(v4, v8, 24, 1), "addObserver:selector:name:object:", v4, sel_handleResidentAddRemove_, @"HMDResidentDeviceManagerRemoveResidentNotification", 0);
    id v10 = objc_getProperty(v4, v9, 24, 1);
  }
  else
  {
    [0 addObserver:0 selector:sel_handleResidentAddRemove_ name:@"HMDResidentDeviceManagerRemoveResidentNotification" object:0];
    id v10 = 0;
  }
  [v10 addObserver:v4 selector:sel_handleIsResidentFirstAccessoryCommunicationEnabledDidChangeNotification_ name:@"HMDHomeIsResidentFirstAccessoryCommunicationEnabledDidChangeNotification" object:WeakRetained];
  if (v3)
  {
    if (v4) {
      id v12 = objc_getProperty(v4, v11, 24, 1);
    }
    else {
      id v12 = 0;
    }
    id v13 = sel_handlePrimaryResidentChanged_;
    id v14 = v12;
    v15 = [WeakRetained residentDeviceManager];
    __int16 v16 = @"HMDResidentDeviceManagerUpdatePrimaryResidentNotification";
  }
  else
  {
    if (v4) {
      id v17 = objc_getProperty(v4, v11, 24, 1);
    }
    else {
      id v17 = 0;
    }
    id v13 = sel_handleResidentUpdated_;
    id v14 = v17;
    v15 = [WeakRetained residentDeviceManager];
    __int16 v16 = @"HMDResidentDeviceManagerUpdateResidentNotification";
  }
  [v14 addObserver:v4 selector:v13 name:v16 object:v15];

  if (isiPadDevice())
  {
    if (v4) {
      id v19 = objc_getProperty(v4, v18, 24, 1);
    }
    else {
      id v19 = 0;
    }
    id v20 = v19;
    long long v21 = [WeakRetained residentDeviceManager];
    [v20 addObserver:v4 selector:sel_handleResidentUpdated_ name:@"HMDResidentDeviceManagerUpdateResidentNotification" object:v21];
  }
  [(HMDHAPAccessoryConnectionCoordinator *)v4 evaluateAccessoryConnectionStatus];
}

- (HMDHAPAccessoryConnectionCoordinator)initWithHome:(id)a3 notificationCenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDHAPAccessoryConnectionCoordinator;
  char v8 = [(HMDHAPAccessoryConnectionCoordinator *)&v11 init];
  SEL v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_home, v6);
    objc_storeStrong((id *)&v9->_notificationCenter, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_28764 != -1) {
    dispatch_once(&logCategory__hmf_once_t11_28764, &__block_literal_global_28765);
  }
  v2 = (void *)logCategory__hmf_once_v12_28766;
  return v2;
}

uint64_t __51__HMDHAPAccessoryConnectionCoordinator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v12_28766;
  logCategory__hmf_once_v12_28766 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end