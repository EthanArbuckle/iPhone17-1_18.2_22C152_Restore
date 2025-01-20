@interface HMDTimeEvent
+ (BOOL)isValidAbsoluteDateComponents:(id)a3;
+ (BOOL)isValidOffsetDateComponents:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4;
- (BOOL)isActive;
- (BOOL)isCompatibleWithEvent:(id)a3;
- (BOOL)repetitive;
- (HMDBackgroundTaskManager)backgroundTaskManager;
- (HMDTimeEvent)initWithCoder:(id)a3;
- (HMDTimeEvent)initWithModel:(id)a3 home:(id)a4;
- (NSString)timerID;
- (id)_nextTimerDate;
- (void)_initialize;
- (void)_reactivateTriggerAfterDelay;
- (void)_updateRepetitive;
- (void)encodeWithCoder:(id)a3;
- (void)handleTimerFiredNotification:(id)a3;
- (void)invalidate;
@end

@implementation HMDTimeEvent

- (void).cxx_destruct
{
}

- (BOOL)repetitive
{
  return self->_repetitive;
}

- (NSString)timerID
{
  return self->_timerID;
}

- (void)invalidate
{
  id v4 = [(HMDTimeEvent *)self backgroundTaskManager];
  v3 = [(HMDTimeEvent *)self timerID];
  [v4 cancelTaskWithIdentifier:v3 onObserver:self];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HMDTimeEvent;
  [(HMDEvent *)&v3 encodeWithCoder:a3];
}

- (HMDTimeEvent)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDTimeEvent;
  objc_super v3 = [(HMDEvent *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(HMDTimeEvent *)v3 _initialize];
  }
  return v4;
}

- (HMDBackgroundTaskManager)backgroundTaskManager
{
  v2 = [(HMDEvent *)self home];
  objc_super v3 = [v2 backgroundTaskManager];

  return (HMDBackgroundTaskManager *)v3;
}

- (void)_reactivateTriggerAfterDelay
{
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 60000000000);
  id v4 = [(HMDEvent *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HMDTimeEvent__reactivateTriggerAfterDelay__block_invoke;
  block[3] = &unk_1E6A16CE0;
  block[4] = self;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __44__HMDTimeEvent__reactivateTriggerAfterDelay__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) eventTrigger];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__HMDTimeEvent__reactivateTriggerAfterDelay__block_invoke_2;
  v3[3] = &unk_1E6A18528;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  [v2 _activateWithCompletion:v3];

  objc_destroyWeak(&v4);
}

void __44__HMDTimeEvent__reactivateTriggerAfterDelay__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Reactivated trigger after timer fired", (uint8_t *)&v9, 0xCu);
  }
}

- (void)handleTimerFiredNotification:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = objc_msgSend(v5, "hmf_stringForKey:", @"HMD.BGTM.NK");

  v7 = [(HMDTimeEvent *)self timerID];
  int v8 = HMFEqualObjects();

  if (v8)
  {
    int v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      v13 = HMDEventTriggerActivationTypeAsString([(HMDEvent *)v10 activationType]);
      int v25 = 138543874;
      v26 = v12;
      __int16 v27 = 2112;
      v28 = v6;
      __int16 v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Timer has fired %@, current activation state: %@", (uint8_t *)&v25, 0x20u);
    }
    if ([(HMDTimeEvent *)v10 isActive])
    {
      v14 = [(HMDEvent *)v10 delegate];
      id v15 = (id)[v14 didOccurEvent:v10 causingDevice:0];

      if ([(HMDTimeEvent *)v10 repetitive])
      {
        v16 = [(HMDEvent *)v10 eventTrigger];
        v17 = [v16 recurrences];
        uint64_t v18 = [v17 count];

        v19 = (void *)MEMORY[0x1D9452090]();
        v20 = v10;
        v21 = HMFGetOSLogHandle();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
        if (v18)
        {
          if (v22)
          {
            v23 = HMFGetLogIdentifier();
            int v25 = 138543362;
            v26 = v23;
            _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Reactivating the event as it does have some recurrences", (uint8_t *)&v25, 0xCu);
          }
          [(HMDTimeEvent *)v20 _reactivateTriggerAfterDelay];
        }
        else
        {
          if (v22)
          {
            v24 = HMFGetLogIdentifier();
            int v25 = 138543362;
            v26 = v24;
            _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Not-Reactivating the event as it does not have recurrences", (uint8_t *)&v25, 0xCu);
          }
        }
      }
    }
  }
}

- (id)_nextTimerDate
{
  return 0;
}

- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v37.receiver = self;
  v37.super_class = (Class)HMDTimeEvent;
  BOOL v7 = [(HMDEvent *)&v37 _activate:a3 completionHandler:0];
  if ([(HMDTimeEvent *)self isActive])
  {
    int v8 = [(HMDTimeEvent *)self _nextTimerDate];
    if (v8)
    {
      int v9 = [(HMDTimeEvent *)self timerID];
      v10 = (void *)MEMORY[0x1D9452090]();
      uint64_t v11 = self;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = HMFGetLogIdentifier();
        v14 = objc_msgSend(v8, "hmf_localTimeDescription");
        *(_DWORD *)buf = 138543874;
        v39 = v13;
        __int16 v40 = 2112;
        v41 = v9;
        __int16 v42 = 2112;
        id v43 = v14;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting the next timer (%@) set to [%@]", buf, 0x20u);
      }
      id v15 = [(HMDTimeEvent *)v11 backgroundTaskManager];
      id v36 = 0;
      char v16 = [v15 scheduleTaskWithIdentifier:v9 fireDate:v8 onObserver:v11 selector:sel_handleTimerFiredNotification_ error:&v36];
      id v17 = v36;

      if ((v16 & 1) == 0)
      {
        uint64_t v18 = (void *)MEMORY[0x1D9452090]();
        v19 = v11;
        v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v39 = v21;
          __int16 v40 = 2112;
          v41 = v9;
          __int16 v42 = 2112;
          id v43 = v17;
          _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to activate time trigger %@ with error %@", buf, 0x20u);
        }
      }
      BOOL v22 = _Block_copy(v6);
      v23 = v22;
      if (v22) {
        (*((void (**)(void *, id))v22 + 2))(v22, v17);
      }
    }
    else
    {
      uint64_t v31 = (void *)MEMORY[0x1D9452090]();
      v32 = self;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v39 = v34;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to get next time date", buf, 0xCu);
      }
      int v9 = (void (**)(void, void))_Block_copy(v6);
      if (!v9) {
        goto LABEL_22;
      }
      id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
      ((void (**)(void, id))v9)[2](v9, v17);
    }

LABEL_22:
    goto LABEL_23;
  }
  int v8 = [(HMDTimeEvent *)self timerID];
  v24 = [(HMDTimeEvent *)self backgroundTaskManager];
  [v24 cancelTaskWithIdentifier:v8 onObserver:self];

  int v25 = _Block_copy(v6);
  v26 = v25;
  if (v25) {
    (*((void (**)(void *, void))v25 + 2))(v25, 0);
  }

  __int16 v27 = (void *)MEMORY[0x1D9452090]();
  v28 = self;
  __int16 v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v39 = v30;
    __int16 v40 = 2112;
    v41 = v8;
    _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Stopping the already scheduled timer with ID: %@", buf, 0x16u);
  }
LABEL_23:

  return v7;
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDTimeEvent;
  return [(HMDEvent *)&v4 isCompatibleWithEvent:a3];
}

- (BOOL)isActive
{
  return ([(HMDEvent *)self activationType] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_updateRepetitive
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    BOOL v3 = 1;
LABEL_4:
    self->_repetitive = v3;
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = 0;
    goto LABEL_4;
  }
}

- (void)_initialize
{
  BOOL v3 = [(HMDEvent *)self uuid];
  objc_super v4 = [v3 UUIDString];
  v5 = [@"com.apple.homed.triggers." stringByAppendingString:v4];
  objc_msgSend(v5, "hmf_stringWithSmallestEncoding");
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  timerID = self->_timerID;
  self->_timerID = v6;

  [(HMDTimeEvent *)self _updateRepetitive];
}

- (HMDTimeEvent)initWithModel:(id)a3 home:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMDTimeEvent;
  objc_super v4 = [(HMDEvent *)&v7 initWithModel:a3 home:a4];
  v5 = v4;
  if (v4) {
    [(HMDTimeEvent *)v4 _initialize];
  }
  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_126658 != -1) {
    dispatch_once(&logCategory__hmf_once_t14_126658, &__block_literal_global_126659);
  }
  v2 = (void *)logCategory__hmf_once_v15_126660;
  return v2;
}

uint64_t __27__HMDTimeEvent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v15_126660;
  logCategory__hmf_once_v15_126660 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)isValidOffsetDateComponents:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    if ([v4 minute] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v5, "setMinute:", objc_msgSend(v4, "minute"));
    }
    if ([v4 hour] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v5, "setHour:", objc_msgSend(v4, "hour"));
    }
    if ([v4 day] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v5, "setDay:", objc_msgSend(v4, "day"));
    }
    if ([v4 month] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v5, "setMonth:", objc_msgSend(v4, "month"));
    }
    char v6 = [v4 isEqual:v5];
    if ((v6 & 1) == 0)
    {
      objc_super v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = a1;
      int v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = HMFGetLogIdentifier();
        int v12 = 138543618;
        v13 = v10;
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Given date component contains non supported fields set: %@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

+ (BOOL)isValidAbsoluteDateComponents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 minute] != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v5, "hour") != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v13 = +[HMDTimeEvent isValidOffsetDateComponents:v5];
      goto LABEL_10;
    }
    char v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = a1;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      int v15 = 138543618;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v5;
      v10 = "%{public}@Minute and hour fields are not set in %@";
      uint64_t v11 = v8;
      uint32_t v12 = 22;
LABEL_8:
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v15, v12);
    }
  }
  else
  {
    char v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = a1;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v9;
      v10 = "%{public}@Given date components is nil";
      uint64_t v11 = v8;
      uint32_t v12 = 12;
      goto LABEL_8;
    }
  }

  BOOL v13 = 0;
LABEL_10:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end