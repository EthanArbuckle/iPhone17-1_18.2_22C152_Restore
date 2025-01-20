@interface __HMDDeviceController
- (HMDAccountRegistry)accountRegistry;
- (__HMDDeviceController)initWithDevice:(id)a3 accountRegistry:(id)a4;
- (void)__handleAddedAccount:(id)a3;
- (void)__handleAddedDevice:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)updateWithDevice:(id)a3 completionHandler:(id)a4;
@end

@implementation __HMDDeviceController

- (void).cxx_destruct
{
}

- (HMDAccountRegistry)accountRegistry
{
  return (HMDAccountRegistry *)objc_getProperty(self, a2, 40, 1);
}

- (void)__handleAddedDevice:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [v4 userInfo];
  v9 = [v8 objectForKeyedSubscript:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  v12 = [v11 identifier];
  v13 = [(HMDDeviceController *)self identifier];
  if (objc_msgSend(v12, "hmf_isEqualToUUID:", v13))
  {
    v14 = [(__HMDDeviceController *)self accountRegistry];
    v15 = [v14 accounts];
    int v16 = [v15 containsObject:v7];

    if (v16)
    {
      v17 = (void *)MEMORY[0x1D9452090]();
      v18 = self;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        v21 = [v7 shortDescription];
        int v22 = 138543618;
        v23 = v20;
        __int16 v24 = 2112;
        v25 = v21;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Target device added to account: %@", (uint8_t *)&v22, 0x16u);
      }
      __HMDDeviceControllerUpdateDevice(v18, v11);
    }
  }
  else
  {
  }
}

- (void)__handleAddedAccount:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"HMDAccountNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = [v8 devices];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __46____HMDDeviceController___handleAddedAccount___block_invoke;
    v16[3] = &unk_1E6A0EA38;
    v16[4] = self;
    v10 = objc_msgSend(v9, "hmf_objectPassingTest:", v16);

    if (v10)
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      v12 = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = HMFGetLogIdentifier();
        v15 = [v8 shortDescription];
        *(_DWORD *)buf = 138543618;
        v18 = v14;
        __int16 v19 = 2112;
        v20 = v15;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Account added containing target device: %@", buf, 0x16u);
      }
      __HMDDeviceControllerUpdateDevice(v12, v10);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if ((void *)__HMDAccountRegistryStartedContext == a6)
  {
    v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;

    if ([v16 BOOLValue])
    {
      v17 = (void *)MEMORY[0x1D9452090]();
      v18 = self;
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v30 = v20;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Registry is available", buf, 0xCu);
      }
      uint64_t v21 = [(__HMDDeviceController *)v18 accountRegistry];
      int v22 = [(HMDDeviceController *)v18 identifier];
      v23 = [v21 deviceForIdentifier:v22];

      if (v23)
      {
        __int16 v24 = (void *)MEMORY[0x1D9452090]();
        v25 = v18;
        uint64_t v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v30 = v27;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Device present in registry, updating", buf, 0xCu);
        }
        __HMDDeviceControllerUpdateDevice(v25, v23);
      }
    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)__HMDDeviceController;
    [(__HMDDeviceController *)&v28 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)updateWithDevice:(id)a3 completionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  char v31 = 0;
  id v8 = [(HMDDeviceController *)self device];
  if (!v8)
  {
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Device not found." reason:@"Unknown device." suggestion:0];
    id v10 = 0;
    id v11 = 0;
    if (!v7) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  v9 = [(__HMDDeviceController *)self accountRegistry];
  id v10 = [v9 deviceForDevice:v8 exists:&v31];

  if (v31)
  {
    if (v10 != v8)
    {
      v25 = (void *)MEMORY[0x1D9452090]();
      uint64_t v26 = self;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        objc_super v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v33 = v28;
        __int16 v34 = 2112;
        id v35 = v8;
        __int16 v36 = 2112;
        v37 = v10;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Device controller is not backed by registry device: %@ != %@", buf, 0x20u);
      }
      v29 = [[HMDAssertionLogEvent alloc] initWithReason:@"Device controller is not backed by registry device: %@ != %@", v8, v10];
      v30 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v30 submitLogEvent:v29];
    }
    id v11 = [v8 account];
    if ([v11 isCurrentAccount])
    {
      id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48 description:@"Not supported." reason:@"Cannot update device on current account." suggestion:0];
      if (!v7) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    uint64_t v21 = (void *)MEMORY[0x1D9452090]();
    int v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      __int16 v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v33 = v24;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating with device: %@", buf, 0x16u);
    }
    [v8 updateWithDevice:v6];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0 || [v8 shouldMergeObject:v6])
    {
      v13 = (void *)MEMORY[0x1D9452090]();
      v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v33 = v16;
        __int16 v34 = 2112;
        id v35 = v6;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Merging with device: %@", buf, 0x16u);
      }
      if ([v8 mergeObject:v6])
      {
        v17 = (void *)MEMORY[0x1D9452090]();
        v18 = v14;
        __int16 v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v33 = v20;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Updated device", buf, 0xCu);
        }
      }
    }
    id v11 = 0;
  }
  id v12 = 0;
  if (v7) {
LABEL_22:
  }
    v7[2](v7, v12);
LABEL_23:
}

- (void)dealloc
{
  v3 = [(__HMDDeviceController *)self accountRegistry];
  id v4 = NSStringFromSelector(sel_started);
  [v3 removeObserver:self forKeyPath:v4 context:__HMDAccountRegistryStartedContext];

  v5.receiver = self;
  v5.super_class = (Class)__HMDDeviceController;
  [(HMDDeviceController *)&v5 dealloc];
}

- (__HMDDeviceController)initWithDevice:(id)a3 accountRegistry:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 identifier];
  v14.receiver = self;
  v14.super_class = (Class)__HMDDeviceController;
  id v10 = [(HMDDeviceController *)&v14 initWithDevice:v8 identifier:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_accountRegistry, a4);
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v10 selector:sel___handleAddedAccount_ name:@"HMDAccountRegistryAddedAccountNotification" object:v7];
    [v11 addObserver:v10 selector:sel___handleAddedDevice_ name:@"HMDAccountAddedDeviceNotification" object:0];
    id v12 = NSStringFromSelector(sel_started);
    [v7 addObserver:v10 forKeyPath:v12 options:5 context:__HMDAccountRegistryStartedContext];
  }
  return v10;
}

@end