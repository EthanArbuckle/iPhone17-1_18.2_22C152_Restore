@interface HMDAccessoryFirmwareUpdatePresencePolicy
+ (id)logCategory;
- (BOOL)evaluate;
- (BOOL)isEqual:(id)a3;
- (BOOL)presenceNeeded;
- (HMDAccessoryFirmwareUpdatePresencePolicy)initWithAccessory:(id)a3 presenceNeeded:(BOOL)a4 workQueue:(id)a5;
- (HMDHome)home;
- (unint64_t)hash;
- (void)configure;
- (void)handlePresenceChange:(id)a3;
- (void)registerForNotifications;
@end

@implementation HMDAccessoryFirmwareUpdatePresencePolicy

- (void).cxx_destruct
{
}

- (BOOL)presenceNeeded
{
  return self->_presenceNeeded;
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (BOOL)evaluate
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAccessoryFirmwareUpdatePresencePolicy *)self home];
  v4 = [v3 presenceMonitor];
  v5 = [v4 currentHomePresence];

  if ([(HMDAccessoryFirmwareUpdatePresencePolicy *)self presenceNeeded])
  {
    if ([v3 isCurrentDeviceAvailableResident])
    {
      if (v5)
      {
        char v6 = [v5 isAnyUserAtHome];
        v7 = (void *)MEMORY[0x1D9452090]();
        v8 = self;
        v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = HMFGetLogIdentifier();
          [v5 isAnyUserAtHome];
          v11 = HMFBooleanToString();
          int v32 = 138543618;
          v33 = v10;
          __int16 v34 = 2112;
          v35 = v11;
          v12 = "%{public}@final policy outcome: (presenceNeeded, resident, isAnyUserAtHome -> %@)";
LABEL_11:
          _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v32, 0x16u);

LABEL_20:
          goto LABEL_36;
        }
        goto LABEL_36;
      }
      v7 = (void *)MEMORY[0x1D9452090]();
      v22 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        int v32 = 138543362;
        v33 = v20;
        v21 = "%{public}@(presenceNeeded, resident, currentHomePresence is nil) -> NO";
        goto LABEL_33;
      }
      goto LABEL_35;
    }
    v14 = [v3 presenceFeeder];
    uint64_t v15 = [v14 presenceRegionStatus];

    if (!v15)
    {
      v7 = (void *)MEMORY[0x1D9452090]();
      v23 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        int v32 = 138543362;
        v33 = v20;
        v21 = "%{public}@(presenceNeeded, non-resident, HMDUserPresenceRegionStatusUnknown) -> NO";
        goto LABEL_33;
      }
      goto LABEL_35;
    }
    if (v15 == 2)
    {
      v7 = (void *)MEMORY[0x1D9452090]();
      v24 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        int v32 = 138543362;
        v33 = v20;
        v21 = "%{public}@(presenceNeeded, non-resident, HMDUserPresenceRegionStatusNotAtHome) -> NO";
        goto LABEL_33;
      }
      goto LABEL_35;
    }
    if (v15 != 1)
    {
      v7 = (void *)MEMORY[0x1D9452090]();
      v25 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        v26 = [v3 presenceFeeder];
        v27 = NSNumber;
        v28 = [v3 presenceFeeder];
        v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "presenceRegionStatus"));
        int v32 = 138543874;
        v33 = v20;
        __int16 v34 = 2112;
        v35 = v26;
        __int16 v36 = 2112;
        v37 = v29;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Bad configuration -- (presenceNeeded, non-resident, missing presenceFeeder %@ or presenceRegionStatus %@", (uint8_t *)&v32, 0x20u);

LABEL_34:
        goto LABEL_35;
      }
      goto LABEL_35;
    }
    v7 = (void *)MEMORY[0x1D9452090]();
    v16 = self;
    v9 = HMFGetOSLogHandle();
    char v6 = 1;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_36;
    }
    v10 = HMFGetLogIdentifier();
    int v32 = 138543362;
    v33 = v10;
    v17 = "%{public}@(presenceNeeded, non-resident, HMDUserPresenceRegionStatusAtHome) -> YES";
LABEL_19:
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v32, 0xCu);
    goto LABEL_20;
  }
  if (([v3 isResidentSupported] & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    v18 = self;
    v9 = HMFGetOSLogHandle();
    char v6 = 1;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_36;
    }
    v10 = HMFGetLogIdentifier();
    int v32 = 138543362;
    v33 = v10;
    v17 = "%{public}@(presenceNotNeeded, !home.isResidentSupported) -> YES";
    goto LABEL_19;
  }
  if (([v3 isCurrentDeviceAvailableResident] & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    v19 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      int v32 = 138543362;
      v33 = v20;
      v21 = "%{public}@(presenceNotNeeded, non-resident) -> NO";
LABEL_33:
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v32, 0xCu);
      goto LABEL_34;
    }
LABEL_35:
    char v6 = 0;
    goto LABEL_36;
  }
  if (!v5)
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    v30 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      int v32 = 138543362;
      v33 = v20;
      v21 = "%{public}@(presenceNotNeeded, resident, currentHomePresence is nil) -> NO";
      goto LABEL_33;
    }
    goto LABEL_35;
  }
  char v6 = [v5 isNoUserAtHome];
  v7 = (void *)MEMORY[0x1D9452090]();
  v13 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    [v5 isNoUserAtHome];
    v11 = HMFBooleanToString();
    int v32 = 138543618;
    v33 = v10;
    __int16 v34 = 2112;
    v35 = v11;
    v12 = "%{public}@final policy outcome: (presenceNotNeeded, resident, isNoUserAtHome -> %@)";
    goto LABEL_11;
  }
LABEL_36:

  return v6;
}

- (void)handlePresenceChange:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessoryFirmwareUpdatePolicy *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HMDAccessoryFirmwareUpdatePresencePolicy_handlePresenceChange___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __65__HMDAccessoryFirmwareUpdatePresencePolicy_handlePresenceChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) name];
    int v8 = 138543618;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %@ -- presence has changed, updating policy status", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) evaluateAndNotify];
}

- (void)registerForNotifications
{
  id v7 = [(HMDAccessoryFirmwareUpdatePresencePolicy *)self home];
  int v3 = [v7 isCurrentDeviceAvailableResident];
  id v4 = [v7 notificationCenter];
  v5 = v4;
  if (v3)
  {
    id v6 = [v7 presenceMonitor];
    [v5 addObserver:self selector:sel_handlePresenceChange_ name:@"HMDHomePresenceEvaluatedNotification" object:v6];
  }
  else
  {
    [v4 addObserver:self selector:sel_handlePresenceChange_ name:@"HMDHomeDidArriveHomeNotificationKey" object:v7];

    v5 = [v7 notificationCenter];
    [v5 addObserver:self selector:sel_handlePresenceChange_ name:@"HMDHomeDidLeaveHomeNotificationKey" object:v7];
  }
}

- (void)configure
{
  [(HMDAccessoryFirmwareUpdatePolicy *)self setStatus:[(HMDAccessoryFirmwareUpdatePresencePolicy *)self evaluate]];
  [(HMDAccessoryFirmwareUpdatePresencePolicy *)self registerForNotifications];
}

- (HMDAccessoryFirmwareUpdatePresencePolicy)initWithAccessory:(id)a3 presenceNeeded:(BOOL)a4 workQueue:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDAccessoryFirmwareUpdatePresencePolicy;
  v9 = [(HMDAccessoryFirmwareUpdatePolicy *)&v12 initWithAccessory:v8 workQueue:a5];
  if (v9)
  {
    __int16 v10 = [v8 home];
    objc_storeWeak((id *)&v9->_home, v10);

    v9->_presenceNeeded = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAccessoryFirmwareUpdatePresencePolicy *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      id v7 = [(HMDAccessoryFirmwareUpdatePresencePolicy *)self home];
      id v8 = [v7 uuid];
      v9 = [(HMDAccessoryFirmwareUpdatePresencePolicy *)v6 home];
      __int16 v10 = [v9 uuid];
      if ([v8 isEqual:v10])
      {
        v11 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
        objc_super v12 = [v11 uuid];
        v13 = [(HMDAccessoryFirmwareUpdatePolicy *)v6 accessory];
        [v13 uuid];
        v14 = v19 = v7;
        int v18 = [v12 isEqual:v14];

        if (v18)
        {
          BOOL v15 = [(HMDAccessoryFirmwareUpdatePresencePolicy *)self presenceNeeded];
          BOOL v16 = v15 ^ [(HMDAccessoryFirmwareUpdatePresencePolicy *)v6 presenceNeeded] ^ 1;
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
      }
    }
    LOBYTE(v16) = 0;
    goto LABEL_12;
  }
  LOBYTE(v16) = 1;
LABEL_13:

  return v16;
}

- (unint64_t)hash
{
  int v3 = [(HMDAccessoryFirmwareUpdatePresencePolicy *)self home];
  id v4 = [v3 uuid];
  uint64_t v5 = [v4 hash];

  return v5 ^ [(HMDAccessoryFirmwareUpdatePresencePolicy *)self presenceNeeded];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_106696 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_106696, &__block_literal_global_106697);
  }
  v2 = (void *)logCategory__hmf_once_v1_106698;
  return v2;
}

uint64_t __55__HMDAccessoryFirmwareUpdatePresencePolicy_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_106698;
  logCategory__hmf_once_v1_106698 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end