@interface HMDAccessoryFirmwareUpdateTimedAutomationPolicy
+ (id)logCategory;
- (BOOL)evaluate;
- (BOOL)isEqual:(id)a3;
- (HMFTimer)reevaluateTimer;
- (id)_getMaxUpdateApplyEndTime;
- (id)_getTriggerFireDateBeforeEndTime:(id)a3;
- (unint64_t)hash;
- (void)_startReevaluateTimer:(double)a3;
- (void)_stopReevaluateTimer;
- (void)setReevaluateTimer:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDAccessoryFirmwareUpdateTimedAutomationPolicy

- (void).cxx_destruct
{
}

- (void)setReevaluateTimer:(id)a3
{
}

- (HMFTimer)reevaluateTimer
{
  return self->_reevaluateTimer;
}

- (void)_stopReevaluateTimer
{
  v3 = [(HMDAccessoryFirmwareUpdateTimedAutomationPolicy *)self reevaluateTimer];
  [v3 suspend];

  [(HMDAccessoryFirmwareUpdateTimedAutomationPolicy *)self setReevaluateTimer:0];
}

- (void)_startReevaluateTimer:(double)a3
{
  double v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 < 0.0)
  {
    v5 = (void *)MEMORY[0x230FBD990](self, a2);
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Invalid time interval", (uint8_t *)&v14, 0xCu);
    }
    double v3 = 0.0;
  }
  v9 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:1 options:v3 + (double)(unint64_t)applyGuardTime()];
  [(HMDAccessoryFirmwareUpdateTimedAutomationPolicy *)self setReevaluateTimer:v9];

  v10 = [(HMDAccessoryFirmwareUpdateTimedAutomationPolicy *)self reevaluateTimer];
  [v10 setDelegate:self];

  v11 = [(HMDAccessoryFirmwareUpdatePolicy *)self workQueue];
  v12 = [(HMDAccessoryFirmwareUpdateTimedAutomationPolicy *)self reevaluateTimer];
  [v12 setDelegateQueue:v11];

  v13 = [(HMDAccessoryFirmwareUpdateTimedAutomationPolicy *)self reevaluateTimer];
  [v13 resume];
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateTimedAutomationPolicy *)self reevaluateTimer];

  if (v5 == v4 && [(HMDAccessoryFirmwareUpdateTimedAutomationPolicy *)self status])
  {
    [(HMDAccessoryFirmwareUpdatePolicy *)self notify:1];
  }
}

- (id)_getTriggerFireDateBeforeEndTime:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v60 = a3;
  double v3 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  id v4 = [v3 home];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v5 = [v4 triggers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v56 = *(void *)v66;
    v55 = v5;
    v52 = v4;
    v53 = v3;
    while (2)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v56;
      uint64_t v57 = v7;
      do
      {
        if (*(void *)v66 != v9) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v65 + 1) + 8 * v8);
        if ([v10 isAssociatedWithAccessory:v3])
        {
          id v11 = v10;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v12 = v11;
          }
          else {
            v12 = 0;
          }
          id v13 = v12;

          id v14 = v11;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v15 = v14;
          }
          else {
            v15 = 0;
          }
          id v16 = v15;

          if (v13)
          {
            v17 = (void *)MEMORY[0x230FBD990]();
            v18 = self;
            v19 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v21 = id v20 = v16;
              *(_DWORD *)buf = 138543362;
              v71 = v21;
              _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Evaluating timer trigger...", buf, 0xCu);

              id v16 = v20;
              id v5 = v55;
              uint64_t v9 = v56;
            }

            v22 = [v13 currentFireDate];
            uint64_t v23 = [v60 compare:v22];

            BOOL v24 = v23 == 1;
            uint64_t v7 = v57;
            if (v24)
            {
              v46 = (void *)MEMORY[0x230FBD990]();
              v47 = v18;
              v48 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
              {
                v49 = HMFGetLogIdentifier();
                [v14 name];
                v51 = id v50 = v16;
                *(_DWORD *)buf = 138543618;
                v71 = v49;
                __int16 v72 = 2112;
                v73 = v51;
                _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_INFO, "%{public}@Update could be interrupted by trigger:%@", buf, 0x16u);

                id v16 = v50;
                id v5 = v55;
              }
              v39 = [v13 currentFireDate];
LABEL_40:

              id v4 = v52;
              goto LABEL_42;
            }
          }
          else
          {
            v25 = (void *)MEMORY[0x230FBD990]();
            v58 = self;
            v26 = HMFGetOSLogHandle();
            BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
            if (v16)
            {
              if (v27)
              {
                v28 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v71 = v28;
                _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Evaluating event trigger...", buf, 0xCu);
              }
              long long v63 = 0u;
              long long v64 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              id v54 = v16;
              v29 = [v16 timeEvents];
              uint64_t v30 = [v29 countByEnumeratingWithState:&v61 objects:v69 count:16];
              if (v30)
              {
                uint64_t v31 = v30;
                uint64_t v32 = *(void *)v62;
                while (2)
                {
                  for (uint64_t i = 0; i != v31; ++i)
                  {
                    if (*(void *)v62 != v32) {
                      objc_enumerationMutation(v29);
                    }
                    v34 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                    v35 = [v34 _nextTimerDate];
                    uint64_t v36 = [v60 compare:v35];

                    if (v36 == 1)
                    {
                      v40 = (void *)MEMORY[0x230FBD990]();
                      v41 = v58;
                      v42 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                      {
                        v43 = HMFGetLogIdentifier();
                        v44 = [v14 name];
                        *(_DWORD *)buf = 138543618;
                        v71 = v43;
                        __int16 v72 = 2112;
                        v73 = v44;
                        _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Update could be interrupted by trigger:%@", buf, 0x16u);
                      }
                      v39 = [v34 _nextTimerDate];

                      id v14 = 0;
                      double v3 = v53;
                      id v16 = v54;
                      id v5 = v55;
                      goto LABEL_40;
                    }
                  }
                  uint64_t v31 = [v29 countByEnumeratingWithState:&v61 objects:v69 count:16];
                  if (v31) {
                    continue;
                  }
                  break;
                }
              }

              double v3 = v53;
              id v16 = v54;
              id v5 = v55;
              uint64_t v9 = v56;
              uint64_t v7 = v57;
            }
            else
            {
              if (v27)
              {
                v37 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v71 = v37;
                _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Unknown trigger type", buf, 0xCu);

                uint64_t v9 = v56;
              }
            }
          }
        }
        ++v8;
      }
      while (v8 != v7);
      uint64_t v38 = [v5 countByEnumeratingWithState:&v65 objects:v74 count:16];
      uint64_t v7 = v38;
      v39 = 0;
      id v4 = v52;
      if (v38) {
        continue;
      }
      break;
    }
  }
  else
  {
    v39 = 0;
  }
LABEL_42:

  return v39;
}

- (id)_getMaxUpdateApplyEndTime
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  double v3 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  id v4 = [v3 firmwareUpdateProfile];

  if (v4)
  {
    id v5 = [v3 firmwareUpdateProfile];
    uint64_t v6 = [v5 updateDuration];

    if (v6)
    {
      uint64_t v7 = applyGuardTime() + v6;
      uint64_t v8 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v9 = [MEMORY[0x263EFF910] date];
      v10 = [v8 dateByAddingUnit:128 value:v7 toDate:v9 options:0];

      goto LABEL_10;
    }
    id v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v14;
      v15 = "%{public}@Invalid update duration";
      goto LABEL_8;
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v14;
      v15 = "%{public}@Invalid update profile";
LABEL_8:
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0xCu);
    }
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)evaluate
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  double v3 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  id v4 = [v3 bridge];

  if (!v4)
  {
    uint64_t v10 = [(HMDAccessoryFirmwareUpdateTimedAutomationPolicy *)self _getMaxUpdateApplyEndTime];
    if (v10)
    {
      id v11 = (void *)v10;
      uint64_t v12 = [(HMDAccessoryFirmwareUpdateTimedAutomationPolicy *)self _getTriggerFireDateBeforeEndTime:v10];
      if (!v12)
      {

        goto LABEL_2;
      }
      id v13 = (void *)v12;
      id v14 = (void *)MEMORY[0x230FBD990]();
      v15 = self;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v17 = HMFGetLogIdentifier();
        int v23 = 138543362;
        BOOL v24 = v17;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Policy status evaluated to NO", (uint8_t *)&v23, 0xCu);
      }
      v18 = [MEMORY[0x263EFF910] date];
      [v13 timeIntervalSinceDate:v18];
      -[HMDAccessoryFirmwareUpdateTimedAutomationPolicy _startReevaluateTimer:](v15, "_startReevaluateTimer:");
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        int v23 = 138543362;
        BOOL v24 = v22;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Invalid max update apply end time, policy status evaluated to NO", (uint8_t *)&v23, 0xCu);
      }
    }
    return 0;
  }
LABEL_2:
  id v5 = (void *)MEMORY[0x230FBD990]([(HMDAccessoryFirmwareUpdateTimedAutomationPolicy *)self _stopReevaluateTimer]);
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v23 = 138543362;
    BOOL v24 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Policy status evaluated to YES", (uint8_t *)&v23, 0xCu);
  }
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAccessoryFirmwareUpdateTimedAutomationPolicy *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      uint64_t v7 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
      uint64_t v8 = [(HMDAccessoryFirmwareUpdatePolicy *)v6 accessory];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_189229 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_189229, &__block_literal_global_189230);
  }
  v2 = (void *)logCategory__hmf_once_v1_189231;
  return v2;
}

void __62__HMDAccessoryFirmwareUpdateTimedAutomationPolicy_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_189231;
  logCategory__hmf_once_v1_189231 = v0;
}

@end