@interface HMDNotificationRegistration
+ (id)logCategory;
- (HMDNotificationRegistration)initWithRegisterer:(id)a3;
- (HMFLogging)registerer;
- (NSMutableSet)registeredNotifications;
- (id)logIdentifier;
- (void)addObserver:(SEL)a3 name:(id)a4 object:(id)a5;
@end

@implementation HMDNotificationRegistration

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_registerer);
  objc_storeStrong((id *)&self->_registeredNotifications, 0);
}

- (HMFLogging)registerer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registerer);
  return (HMFLogging *)WeakRetained;
}

- (NSMutableSet)registeredNotifications
{
  return self->_registeredNotifications;
}

- (void)addObserver:(SEL)a3 name:(id)a4 object:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [(HMDNotificationRegistration *)self registeredNotifications];
  char v11 = [v10 containsObject:v8];

  if (v11)
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      int v21 = 138543618;
      v22 = v15;
      __int16 v23 = 2112;
      id v24 = v8;
      v16 = "%{public}@Not Registering for notification %@";
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v18 = [(HMDNotificationRegistration *)self registerer];
    [v17 addObserver:v18 selector:a3 name:v8 object:v9];

    v19 = [(HMDNotificationRegistration *)self registeredNotifications];
    [v19 addObject:v8];

    v12 = (void *)MEMORY[0x1D9452090]();
    v20 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      int v21 = 138543618;
      v22 = v15;
      __int16 v23 = 2112;
      id v24 = v8;
      v16 = "%{public}@Registering for notification %@";
      goto LABEL_6;
    }
  }
}

- (id)logIdentifier
{
  v2 = [(HMDNotificationRegistration *)self registerer];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  if (objc_opt_respondsToSelector())
  {
    v5 = NSString;
    v6 = [v2 logIdentifier];
    uint64_t v7 = [v5 stringWithFormat:@"%@/%@", v4, v6];

    v4 = (void *)v7;
  }

  return v4;
}

- (HMDNotificationRegistration)initWithRegisterer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDNotificationRegistration;
  v5 = [(HMDNotificationRegistration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    registeredNotifications = v5->_registeredNotifications;
    v5->_registeredNotifications = (NSMutableSet *)v6;

    objc_storeWeak((id *)&v5->_registerer, v4);
  }

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_173817 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_173817, &__block_literal_global_173818);
  }
  v2 = (void *)logCategory__hmf_once_v1_173819;
  return v2;
}

uint64_t __42__HMDNotificationRegistration_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_173819;
  logCategory__hmf_once_v1_173819 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end