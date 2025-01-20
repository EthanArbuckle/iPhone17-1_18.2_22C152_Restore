@interface HMDAccessoryFirmwareUpdateTimeWindowPolicy
+ (id)logCategory;
- (BOOL)evaluate;
- (BOOL)isEqual:(id)a3;
- (HMDAccessoryFirmwareUpdateTimeWindow)updateTimeWindow;
- (HMDAccessoryFirmwareUpdateTimeWindowPolicy)initWithAccessory:(id)a3 timeWindow:(id)a4 workQueue:(id)a5;
- (HMFTimer)reevaluateTimer;
- (NSDateFormatter)dateFormatter;
- (unint64_t)hash;
- (void)_startReevaluateTimer:(id)a3;
- (void)_stopReevaluateTimer;
- (void)configure;
- (void)setDateFormatter:(id)a3;
- (void)setReevaluateTimer:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDAccessoryFirmwareUpdateTimeWindowPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_updateTimeWindow, 0);
  objc_storeStrong((id *)&self->_reevaluateTimer, 0);
}

- (void)setDateFormatter:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (HMDAccessoryFirmwareUpdateTimeWindow)updateTimeWindow
{
  return self->_updateTimeWindow;
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
  v3 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self reevaluateTimer];
  [v3 suspend];

  [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self setReevaluateTimer:0];
}

- (void)_startReevaluateTimer:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v6 = [v4 date];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:v8];
  [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self setReevaluateTimer:v9];

  v10 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self reevaluateTimer];
  [v10 setDelegate:self];

  v11 = [(HMDAccessoryFirmwareUpdatePolicy *)self workQueue];
  v12 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self reevaluateTimer];
  [v12 setDelegateQueue:v11];

  id v13 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self reevaluateTimer];
  [v13 resume];
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self reevaluateTimer];

  if (v5 == v4)
  {
    [(HMDAccessoryFirmwareUpdatePolicy *)self evaluateAndNotify];
  }
}

- (BOOL)evaluate
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v3 components:252 fromDate:v4];

  v6 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self updateTimeWindow];
  double v7 = [v6 startTimeComponents];
  objc_msgSend(v5, "setHour:", objc_msgSend(v7, "hour"));

  double v8 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self updateTimeWindow];
  v9 = [v8 startTimeComponents];
  objc_msgSend(v5, "setMinute:", objc_msgSend(v9, "minute"));

  v10 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self updateTimeWindow];
  v11 = [v10 startTimeComponents];
  objc_msgSend(v5, "setSecond:", objc_msgSend(v11, "second"));

  v12 = [v3 dateFromComponents:v5];
  id v13 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self updateTimeWindow];
  v14 = [v13 endTimeComponents];
  objc_msgSend(v5, "setHour:", objc_msgSend(v14, "hour"));

  v15 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self updateTimeWindow];
  v16 = [v15 endTimeComponents];
  objc_msgSend(v5, "setMinute:", objc_msgSend(v16, "minute"));

  v17 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self updateTimeWindow];
  v18 = [v17 endTimeComponents];
  objc_msgSend(v5, "setSecond:", objc_msgSend(v18, "second"));

  v19 = [v3 dateFromComponents:v5];
  if ([v12 compare:v19] == 1)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    v21 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v22 = [v21 compare:v19];

    if (v22 == 1)
    {
      [v20 setDay:1];
      uint64_t v23 = [v3 dateByAddingComponents:v20 toDate:v19 options:0];
      v24 = v19;
      v19 = (void *)v23;
    }
    else
    {
      [v20 setDay:-1];
      uint64_t v25 = [v3 dateByAddingComponents:v20 toDate:v12 options:0];
      v24 = v12;
      v12 = (void *)v25;
    }
  }
  uint64_t v26 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self _stopReevaluateTimer];
  if (!v12 || !v19)
  {
    v39 = (void *)MEMORY[0x1D9452090](v26);
    v40 = self;
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v58 = v42;
      _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Invalid time window, policy status evaluated to NO", buf, 0xCu);
    }
    id v27 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v27 setHour:12];
    v43 = [MEMORY[0x1E4F1C9C8] date];
    v44 = [v3 dateByAddingComponents:v27 toDate:v43 options:0];

    [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)v40 _startReevaluateTimer:v44];
    goto LABEL_15;
  }
  v56 = v12;
  id v27 = [MEMORY[0x1E4F1C9C8] date];
  v28 = (void *)MEMORY[0x1D9452090]();
  v29 = self;
  v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v51 = HMFGetLogIdentifier();
    v53 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)v29 dateFormatter];
    v31 = [v53 stringFromDate:v27];
    [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)v29 dateFormatter];
    v52 = v55 = v3;
    uint64_t v32 = [v52 stringFromDate:v56];
    v33 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)v29 dateFormatter];
    [v33 stringFromDate:v19];
    v34 = v54 = v28;
    *(_DWORD *)buf = 138544130;
    v58 = v51;
    __int16 v59 = 2112;
    v60 = v31;
    __int16 v61 = 2112;
    uint64_t v62 = v32;
    v35 = (void *)v32;
    __int16 v63 = 2112;
    v64 = v34;
    _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Evaluate now=%@ in interval=[%@, %@]", buf, 0x2Au);

    v3 = v55;
    v28 = v54;
  }
  if ([v27 compare:v19] == 1)
  {
    id v36 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v36 setDay:1];
    uint64_t v37 = [v3 dateByAddingComponents:v36 toDate:v56 options:0];

    [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)v29 _startReevaluateTimer:v37];
    BOOL v38 = 0;
    v12 = (void *)v37;
    goto LABEL_18;
  }
  v12 = v56;
  if ([v27 compare:v56] == -1)
  {
    [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)v29 _startReevaluateTimer:v56];
LABEL_15:
    BOOL v38 = 0;
    goto LABEL_18;
  }
  [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)v29 _startReevaluateTimer:v19];
  BOOL v38 = 1;
LABEL_18:

  v45 = (void *)MEMORY[0x1D9452090]();
  v46 = self;
  v47 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v48 = HMFGetLogIdentifier();
    v49 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    v58 = v48;
    __int16 v59 = 2112;
    v60 = v49;
    _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@Policy status evaluated to %@", buf, 0x16u);
  }

  return v38;
}

- (void)configure
{
  BOOL v3 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self evaluate];
  [(HMDAccessoryFirmwareUpdatePolicy *)self setStatus:v3];
}

- (HMDAccessoryFirmwareUpdateTimeWindowPolicy)initWithAccessory:(id)a3 timeWindow:(id)a4 workQueue:(id)a5
{
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDAccessoryFirmwareUpdateTimeWindowPolicy;
  v10 = [(HMDAccessoryFirmwareUpdatePolicy *)&v15 initWithAccessory:a3 workQueue:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_updateTimeWindow, a4);
    v12 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v11->_dateFormatter;
    v11->_dateFormatter = v12;

    [(NSDateFormatter *)v11->_dateFormatter setDateFormat:@"HH:mm"];
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAccessoryFirmwareUpdateTimeWindowPolicy *)a3;
  if (self == v4)
  {
    char v17 = 1;
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
    v6 = v5;
    if (v6)
    {
      double v7 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self updateTimeWindow];
      double v8 = [v7 startTimeComponents];
      id v9 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)v6 updateTimeWindow];
      v10 = [v9 startTimeComponents];
      if ([v8 isEqual:v10])
      {
        v11 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self updateTimeWindow];
        v12 = [v11 endTimeComponents];
        uint64_t v22 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)v6 updateTimeWindow];
        id v13 = [v22 endTimeComponents];
        uint64_t v23 = v12;
        if ([v12 isEqual:v13])
        {
          id v20 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
          v19 = [v20 uuid];
          [(HMDAccessoryFirmwareUpdatePolicy *)v6 accessory];
          v14 = v21 = v11;
          objc_super v15 = [v14 uuid];
          int v16 = [v19 isEqual:v15] ^ 1;

          v11 = v21;
        }
        else
        {
          LOBYTE(v16) = 1;
        }
      }
      else
      {
        LOBYTE(v16) = 1;
      }

      char v17 = v16 ^ 1;
    }
    else
    {
      char v17 = 0;
    }
  }
  return v17;
}

- (unint64_t)hash
{
  BOOL v3 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self updateTimeWindow];
  id v4 = [v3 startTimeComponents];
  uint64_t v5 = [v4 hash];

  v6 = [(HMDAccessoryFirmwareUpdateTimeWindowPolicy *)self updateTimeWindow];
  double v7 = [v6 endTimeComponents];
  unint64_t v8 = [v7 hash] ^ v5;

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_120049 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_120049, &__block_literal_global_67_120050);
  }
  v2 = (void *)logCategory__hmf_once_v3_120051;
  return v2;
}

uint64_t __57__HMDAccessoryFirmwareUpdateTimeWindowPolicy_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_120051;
  logCategory__hmf_once_v3_120051 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end