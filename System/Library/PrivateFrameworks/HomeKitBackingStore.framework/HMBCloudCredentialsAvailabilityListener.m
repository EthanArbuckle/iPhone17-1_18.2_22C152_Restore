@interface HMBCloudCredentialsAvailabilityListener
+ (id)logCategory;
- (HMBCloudCredentialsAvailabilityListener)initWithContainer:(id)a3;
- (HMBCloudCredentialsAvailabilityListener)initWithContainer:(id)a3 notificationCenter:(id)a4;
- (id)_waitForAccountAvailabilityAndRecheckIfAlreadyAvailable:(os_unfair_lock_s *)a1;
- (id)keychainAvailabilityTimerFactory;
- (id)logIdentifier;
- (id)waitForAccountAvailability;
- (id)waitForAccountAvailabilityAndRecheckIfAlreadyAvailable;
- (id)waitForKeychainAvailability;
- (void)_checkAccountAvailability;
- (void)_handleKeychainAvailabilityChanged;
- (void)handleAccountChangedNotification:(id)a3;
- (void)handleIdentityUpdateNotification:(id)a3;
- (void)setKeychainAvailabilityTimerFactory:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMBCloudCredentialsAvailabilityListener

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keychainAvailabilityTimerFactory, 0);
  objc_storeStrong((id *)&self->_keychainAvailabilityTimer, 0);
  objc_storeStrong((id *)&self->_keychainAvailabilityFuture, 0);
  objc_storeStrong((id *)&self->_accountAvailabilityFuture, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (void)setKeychainAvailabilityTimerFactory:(id)a3
{
}

- (id)keychainAvailabilityTimerFactory
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 48, 1);
  }
  else {
    id Property = 0;
  }
  if (Property == v5)
  {
    v7 = (void *)MEMORY[0x1D944CB30]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling keychain availability timer", (uint8_t *)&v11, 0xCu);
    }
    -[HMBCloudCredentialsAvailabilityListener _handleKeychainAvailabilityChanged]((os_unfair_lock_s *)v8);
  }
}

- (void)_handleKeychainAvailabilityChanged
{
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock_with_options();
    id v8 = objc_getProperty(a1, v3, 40, 1);
    objc_setProperty_atomic(a1, v4, 0, 40);
    objc_setProperty_atomic(a1, v5, 0, 48);
    id v7 = objc_getProperty(a1, v6, 24, 1);
    [v7 removeObserver:a1 name:*MEMORY[0x1E4F19C98] object:0];

    os_unfair_lock_unlock(v2);
    [v8 finishWithNoResult];
  }
}

- (id)logIdentifier
{
  if (self) {
    self = (HMBCloudCredentialsAvailabilityListener *)objc_getProperty(self, a2, 16, 1);
  }
  v2 = [(HMBCloudCredentialsAvailabilityListener *)self containerID];
  SEL v3 = [v2 containerIdentifier];

  return v3;
}

- (void)handleIdentityUpdateNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  SEL v5 = (void *)MEMORY[0x1D944CB30]();
  SEL v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling CKIdentityUpdateNotification", (uint8_t *)&v9, 0xCu);
  }
  -[HMBCloudCredentialsAvailabilityListener _handleKeychainAvailabilityChanged]((os_unfair_lock_s *)v6);
}

- (void)handleAccountChangedNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  SEL v5 = (void *)MEMORY[0x1D944CB30]();
  SEL v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling CKAccountChangedNotification", (uint8_t *)&v9, 0xCu);
  }
  -[HMBCloudCredentialsAvailabilityListener _checkAccountAvailability](v6);
}

- (void)_checkAccountAvailability
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v12 = (id)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Check account availability"];
    v2 = (void *)MEMORY[0x1D944CB30]();
    id v3 = a1;
    HMFGetOSLogHandle();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      SEL v6 = [v12 identifier];
      id v7 = [v6 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v14 = v5;
      __int16 v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1D4693000, v4, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching account info", buf, 0x16u);
    }
    id v9 = objc_getProperty(v3, v8, 16, 1);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__HMBCloudCredentialsAvailabilityListener__checkAccountAvailability__block_invoke;
    v10[3] = &unk_1E69E9648;
    v10[4] = v3;
    id v11 = v12;
    [v9 accountInfoWithCompletionHandler:v10];

    __HMFActivityScopeLeave();
  }
}

void __68__HMBCloudCredentialsAvailabilityListener__checkAccountAvailability__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (!v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      v19 = [*(id *)(a1 + 40) identifier];
      v20 = [v19 shortDescription];
      int v35 = 138543874;
      v36 = v18;
      __int16 v37 = 2114;
      v38 = v20;
      __int16 v39 = 2112;
      id v40 = v6;
      v21 = "%{public}@[%{public}@] Failed to fetch account info: %@";
      v22 = v10;
      uint32_t v23 = 32;
LABEL_19:
      _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v35, v23);

      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) identifier];
    uint64_t v13 = [v12 shortDescription];
    int v35 = 138543874;
    v36 = v11;
    __int16 v37 = 2114;
    v38 = v13;
    __int16 v39 = 2112;
    id v40 = v5;
    _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetched account info: %@", (uint8_t *)&v35, 0x20u);
  }
  if ([v5 accountStatus] != 1)
  {
    id v7 = (void *)MEMORY[0x1D944CB30]();
    id v8 = *(id *)(a1 + 32);
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      v19 = [*(id *)(a1 + 40) identifier];
      v20 = [v19 shortDescription];
      int v35 = 138543618;
      v36 = v18;
      __int16 v37 = 2114;
      v38 = v20;
      v21 = "%{public}@[%{public}@] CloudKit account is not currently available; waiting for CKAccountChangedNotification to check again";
      goto LABEL_18;
    }
LABEL_20:

    goto LABEL_21;
  }
  if (([v5 hasValidCredentials] & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1D944CB30]();
    id v8 = *(id *)(a1 + 32);
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      v19 = [*(id *)(a1 + 40) identifier];
      v20 = [v19 shortDescription];
      int v35 = 138543618;
      v36 = v18;
      __int16 v37 = 2114;
      v38 = v20;
      v21 = "%{public}@[%{public}@] Account does not have valid credentials; waiting for CKAccountChangedNotification to check again";
      goto LABEL_18;
    }
    goto LABEL_20;
  }
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v14, 16, 1);
  }
  v16 = [Property options];
  if ([v16 useZoneWidePCS])
  {
    char v17 = [v5 supportsDeviceToDeviceEncryption];

    if ((v17 & 1) == 0)
    {
      id v7 = (void *)MEMORY[0x1D944CB30]();
      id v8 = *(id *)(a1 + 32);
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        v19 = [*(id *)(a1 + 40) identifier];
        v20 = [v19 shortDescription];
        int v35 = 138543618;
        v36 = v18;
        __int16 v37 = 2114;
        v38 = v20;
        v21 = "%{public}@[%{public}@] Manatee is not currently available; waiting for CKAccountChangedNotification to check again";
LABEL_18:
        v22 = v10;
        uint32_t v23 = 22;
        goto LABEL_19;
      }
      goto LABEL_20;
    }
  }
  else
  {
  }
  v24 = (void *)MEMORY[0x1D944CB30]();
  id v25 = *(id *)(a1 + 32);
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = HMFGetLogIdentifier();
    v28 = [*(id *)(a1 + 40) identifier];
    v29 = [v28 shortDescription];
    int v35 = 138543618;
    v36 = v27;
    __int16 v37 = 2114;
    v38 = v29;
    _os_log_impl(&dword_1D4693000, v26, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Account is available", (uint8_t *)&v35, 0x16u);
  }
  id v31 = *(id *)(a1 + 32);
  if (v31)
  {
    id v31 = objc_getProperty(v31, v30, 24, 1);
    uint64_t v32 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v32 = 0;
  }
  [v31 removeObserver:v32 name:*MEMORY[0x1E4F19BE0] object:0];
  id v34 = *(id *)(a1 + 32);
  if (v34) {
    id v34 = objc_getProperty(v34, v33, 32, 1);
  }
  [v34 finishWithNoResult];
LABEL_21:
}

- (id)waitForKeychainAvailability
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  uint64_t Property = os_unfair_lock_lock_with_options();
  if (self)
  {
    uint64_t Property = (uint64_t)objc_getProperty(self, v5, 40, 1);
    if (Property)
    {
      char v7 = 0;
LABEL_10:
      id v18 = objc_getProperty(self, v6, 40, 1);
      goto LABEL_11;
    }
  }
  id v8 = (void *)MEMORY[0x1D944CB30](Property);
  id v9 = self;
  HMFGetOSLogHandle();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v25 = 138543362;
    v26 = v11;
    _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Will wait for keychain availability", (uint8_t *)&v25, 0xCu);
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  if (self) {
    objc_setProperty_atomic(v9, v12, v13, 40);
  }

  id v14 = [(HMBCloudCredentialsAvailabilityListener *)v9 keychainAvailabilityTimerFactory];
  __int16 v15 = v14[2](v14, 0, 600.0);
  char v17 = v15;
  if (self)
  {
    objc_setProperty_atomic(v9, v16, v15, 48);

    char v7 = 1;
    goto LABEL_10;
  }

  id v18 = 0;
  char v7 = 1;
LABEL_11:
  id v19 = v18;
  os_unfair_lock_unlock(&p_lock->lock);
  if (v7)
  {
    if (self)
    {
      objc_msgSend(objc_getProperty(self, v20, 24, 1), "addObserver:selector:name:object:", self, sel_handleIdentityUpdateNotification_, *MEMORY[0x1E4F19C98], 0);
      objc_msgSend(objc_getProperty(self, v21, 48, 1), "setDelegate:", self);
      id v23 = objc_getProperty(self, v22, 48, 1);
    }
    else
    {
      [0 addObserver:0 selector:sel_handleIdentityUpdateNotification_ name:*MEMORY[0x1E4F19C98] object:0];
      [0 setDelegate:0];
      id v23 = 0;
    }
    [v23 resume];
  }
  return v19;
}

- (id)waitForAccountAvailabilityAndRecheckIfAlreadyAvailable
{
  return -[HMBCloudCredentialsAvailabilityListener _waitForAccountAvailabilityAndRecheckIfAlreadyAvailable:]((os_unfair_lock_s *)self, 1);
}

- (id)_waitForAccountAvailabilityAndRecheckIfAlreadyAvailable:(os_unfair_lock_s *)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v24 = 0;
    goto LABEL_16;
  }
  id v4 = a1 + 2;
  os_unfair_lock_lock_with_options();
  if (objc_getProperty(a1, v5, 32, 1))
  {
    if (!a2
      || (id v7 = objc_getProperty(a1, v6, 32, 1), v8 = [v7 isFinished],
                                                               v7,
                                                               !v8))
    {
      id v13 = (void *)MEMORY[0x1D944CB30]();
      id v14 = a1;
      HMFGetOSLogHandle();
      __int16 v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        int v27 = 138543874;
        id v28 = v16;
        __int16 v29 = 2112;
        id v30 = v17;
        __int16 v31 = 2112;
        id Property = objc_getProperty(v14, v18, 32, 1);
        _os_log_impl(&dword_1D4693000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping re-check with should check: %@ account available future: %@", (uint8_t *)&v27, 0x20u);
      }
      char v20 = 1;
      goto LABEL_14;
    }
    id v9 = (void *)MEMORY[0x1D944CB30]();
    v10 = a1;
    HMFGetOSLogHandle();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v27 = 138543362;
      id v28 = v12;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_INFO, "%{public}@Will reset and re-check account availability", (uint8_t *)&v27, 0xCu);
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D944CB30]();
    v10 = a1;
    HMFGetOSLogHandle();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      SEL v21 = HMFGetLogIdentifier();
      int v27 = 138543362;
      id v28 = v21;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_INFO, "%{public}@Will wait for account availability", (uint8_t *)&v27, 0xCu);
    }
  }

  id v22 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  objc_setProperty_atomic(v10, v23, v22, 32);

  char v20 = 0;
LABEL_14:
  id v24 = objc_getProperty(a1, v19, 32, 1);
  os_unfair_lock_unlock(v4);
  if ((v20 & 1) == 0)
  {
    objc_msgSend(objc_getProperty(a1, v25, 24, 1), "addObserver:selector:name:object:", a1, sel_handleAccountChangedNotification_, *MEMORY[0x1E4F19BE0], 0);
    -[HMBCloudCredentialsAvailabilityListener _checkAccountAvailability](a1);
  }
LABEL_16:
  return v24;
}

- (id)waitForAccountAvailability
{
  return -[HMBCloudCredentialsAvailabilityListener _waitForAccountAvailabilityAndRecheckIfAlreadyAvailable:]((os_unfair_lock_s *)self, 0);
}

- (HMBCloudCredentialsAvailabilityListener)initWithContainer:(id)a3 notificationCenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMBCloudCredentialsAvailabilityListener;
  id v9 = [(HMBCloudCredentialsAvailabilityListener *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_container, a3);
    objc_storeStrong((id *)&v10->_notificationCenter, a4);
    id keychainAvailabilityTimerFactory = v10->_keychainAvailabilityTimerFactory;
    v10->_id keychainAvailabilityTimerFactory = &__block_literal_global_452;
  }
  return v10;
}

id __80__HMBCloudCredentialsAvailabilityListener_initWithContainer_notificationCenter___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:a3 options:a1];
  return v3;
}

- (HMBCloudCredentialsAvailabilityListener)initWithContainer:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  id v7 = [(HMBCloudCredentialsAvailabilityListener *)self initWithContainer:v5 notificationCenter:v6];

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16 != -1) {
    dispatch_once(&logCategory__hmf_once_t16, &__block_literal_global_12);
  }
  v2 = (void *)logCategory__hmf_once_v17;
  return v2;
}

uint64_t __54__HMBCloudCredentialsAvailabilityListener_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v17;
  logCategory__hmf_once_id v17 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end