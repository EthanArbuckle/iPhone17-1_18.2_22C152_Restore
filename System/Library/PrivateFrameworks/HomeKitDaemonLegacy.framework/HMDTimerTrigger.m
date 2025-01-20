@interface HMDTimerTrigger
+ (BOOL)supportsSecureCoding;
+ (id)getCalendar:(id)a3;
+ (id)logCategory;
+ (id)validateRecurrence:(id)a3 calendar:(id)a4 fireDate:(id)a5;
+ (id)validateRecurrences:(id)a3;
+ (id)validateSignificantOffset:(id)a3;
+ (id)validateTriggerModel:(id)a3 message:(id)a4 currentFireDate:(id)a5;
+ (id)validateWholeMinuteDate:(id)a3 onCalendar:(id)a4;
- (BOOL)_reactivateFireDateTrigger;
- (BOOL)_reactivateSignificantEventTrigger;
- (BOOL)_reactivateTrigger;
- (BOOL)_shouldExecuteActionSet;
- (BOOL)shouldActivateOnLocalDevice;
- (HMDTimerTrigger)initWithCoder:(id)a3;
- (HMDTimerTrigger)initWithModel:(id)a3 home:(id)a4;
- (HMDTimerTrigger)initWithName:(id)a3 uuid:(id)a4;
- (NSArray)recurrences;
- (NSDate)currentFireDate;
- (NSDate)fireDate;
- (NSDateComponents)fireRepeatInterval;
- (NSDateComponents)significantEventOffset;
- (NSString)significantEvent;
- (NSString)timerID;
- (NSTimeZone)fireDateTimeZone;
- (id)_nextFireDate;
- (id)_nextSignificantEventFireDate;
- (id)_serializeForAdd;
- (id)backingStoreObjects:(int64_t)a3;
- (id)description;
- (id)dumpState;
- (id)emptyModelObject;
- (id)getCalendar;
- (id)getFireInterval;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (unint64_t)triggerType;
- (void)_activateWithCompletion:(id)a3;
- (void)_closestDatesForStartDate:(id)a3 earliestDate:(id)a4 timeZone:(id)a5 deliveryRepeatInterval:(id)a6 returnDateBefore:(id *)a7 returnDateAfter:(id *)a8;
- (void)_disableTimerOffReactivationFailure;
- (void)_handleTimerTriggerUpdate:(id)a3 message:(id)a4;
- (void)_handleUpdateTimerTriggerPropertiesModel:(id)a3 message:(id)a4;
- (void)_handleUpdateTimerTriggerPropertiesRequest:(id)a3;
- (void)_reactiveTriggerAfterDelay;
- (void)_registerForMessages;
- (void)_startTimer:(id)a3;
- (void)_startTimerWithFireDate:(id)a3;
- (void)_stopTimer;
- (void)_timerTriggered;
- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)completeConfiguration;
- (void)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleTimerFiredNotification:(id)a3;
- (void)invalidate;
- (void)setCurrentFireDate:(id)a3;
- (void)setFireDate:(id)a3;
- (void)setFireDateTimeZone:(id)a3;
- (void)setFireRepeatInterval:(id)a3;
- (void)setRecurrences:(id)a3;
- (void)setSignificantEvent:(id)a3;
- (void)setSignificantEventOffset:(id)a3;
- (void)setTimerID:(id)a3;
- (void)timerTriggered;
@end

@implementation HMDTimerTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerID, 0);
  objc_storeStrong((id *)&self->_recurrences, 0);
  objc_storeStrong((id *)&self->_fireRepeatInterval, 0);
  objc_storeStrong((id *)&self->_significantEventOffset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
  objc_storeStrong((id *)&self->_fireDateTimeZone, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_currentFireDate, 0);
  objc_storeStrong((id *)&self->currentFireDate, 0);
}

- (void)setTimerID:(id)a3
{
}

- (NSString)timerID
{
  return self->_timerID;
}

- (void)setRecurrences:(id)a3
{
}

- (NSArray)recurrences
{
  return self->_recurrences;
}

- (void)setFireRepeatInterval:(id)a3
{
}

- (NSDateComponents)fireRepeatInterval
{
  return self->_fireRepeatInterval;
}

- (void)setSignificantEventOffset:(id)a3
{
}

- (NSDateComponents)significantEventOffset
{
  return self->_significantEventOffset;
}

- (void)setSignificantEvent:(id)a3
{
}

- (NSString)significantEvent
{
  return self->_significantEvent;
}

- (void)setFireDateTimeZone:(id)a3
{
}

- (NSTimeZone)fireDateTimeZone
{
  return self->_fireDateTimeZone;
}

- (void)setFireDate:(id)a3
{
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)handleTimerFiredNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"HMD.BGTM.NK"];

  v7 = [(HMDTimerTrigger *)self timerID];
  int v8 = [v7 isEqualToString:v6];

  if (v8)
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [(HMDTimerTrigger *)v10 timerID];
      int v14 = 138543618;
      v15 = v12;
      __int16 v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Timer Trigger fired : %@", (uint8_t *)&v14, 0x16u);
    }
    [(HMDTimerTrigger *)v10 timerTriggered];
  }
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    [(HMDTimerTrigger *)self _handleTimerTriggerUpdate:v13 message:v10];
  }
  else
  {
    int v14 = (void *)MEMORY[0x1D9452090]();
    v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      int v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Received unknown model object", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HMDTimerTrigger;
  id v4 = a3;
  [(HMDTrigger *)&v12 encodeWithCoder:v4];
  v5 = [(HMDTimerTrigger *)self fireDate];
  [v4 encodeObject:v5 forKey:@"timerTriggerInitialFireDate"];

  v6 = [(HMDTimerTrigger *)self fireDateTimeZone];
  [v4 encodeObject:v6 forKey:@"timerTriggerTimeZone"];

  v7 = [(HMDTimerTrigger *)self fireRepeatInterval];
  [v4 encodeObject:v7 forKey:@"timerTriggerRepeatInterval"];

  id v8 = [(HMDTimerTrigger *)self recurrences];
  [v4 encodeObject:v8 forKey:@"HM.timerTriggerRecurrences"];

  id v9 = [(HMDTimerTrigger *)self timerID];
  [v4 encodeObject:v9 forKey:@"timerTriggerTimerIDCodingKey"];

  id v10 = [(HMDTimerTrigger *)self significantEvent];
  [v4 encodeObject:v10 forKey:@"HM.timerTriggerSignificantEvent"];

  id v11 = [(HMDTimerTrigger *)self significantEventOffset];
  [v4 encodeObject:v11 forKey:@"HM.timerTriggerSignificantEventOffset"];
}

- (HMDTimerTrigger)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HMDTimerTrigger;
  v5 = [(HMDTrigger *)&v25 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timerTriggerInitialFireDate"];
    fireDate = v5->_fireDate;
    v5->_fireDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timerTriggerTimeZone"];
    fireDateTimeZone = v5->_fireDateTimeZone;
    v5->_fireDateTimeZone = (NSTimeZone *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timerTriggerRepeatInterval"];
    fireRepeatInterval = v5->_fireRepeatInterval;
    v5->_fireRepeatInterval = (NSDateComponents *)v10;

    objc_super v12 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    int v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"HM.timerTriggerRecurrences"];
    recurrences = v5->_recurrences;
    v5->_recurrences = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timerTriggerTimerIDCodingKey"];
    timerID = v5->_timerID;
    v5->_timerID = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.timerTriggerSignificantEvent"];
    significantEvent = v5->_significantEvent;
    v5->_significantEvent = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.timerTriggerSignificantEventOffset"];
    significantEventOffset = v5->_significantEventOffset;
    v5->_significantEventOffset = (NSDateComponents *)v21;

    v23 = v5->_fireRepeatInterval;
    if (v23)
    {
      if ([(NSDateComponents *)v23 nanosecond]) {
        [(NSDateComponents *)v5->_fireRepeatInterval setNanosecond:0];
      }
    }
  }

  return v5;
}

- (id)getFireInterval
{
  v3 = [(HMDTimerTrigger *)self fireDate];

  if (!v3) {
    goto LABEL_6;
  }
  id v4 = [(HMDTimerTrigger *)self fireRepeatInterval];

  if (v4)
  {
    id v5 = [(HMDTimerTrigger *)self fireRepeatInterval];
    goto LABEL_7;
  }
  uint64_t v6 = [(HMDTimerTrigger *)self recurrences];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v5 setDay:1];
  }
  else
  {
LABEL_6:
    id v5 = 0;
  }
LABEL_7:
  return v5;
}

- (id)getCalendar
{
  v2 = [(HMDTimerTrigger *)self fireRepeatInterval];
  v3 = +[HMDTimerTrigger getCalendar:v2];

  return v3;
}

- (void)_closestDatesForStartDate:(id)a3 earliestDate:(id)a4 timeZone:(id)a5 deliveryRepeatInterval:(id)a6 returnDateBefore:(id *)a7 returnDateAfter:(id *)a8
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = [(HMDTimerTrigger *)self getCalendar];
  v83 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  int v18 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v19 = [v13 compare:v18];

  if (v19 != 1)
  {
    if (v15)
    {
      uint64_t v31 = [v83 secondsFromGMT];
      uint64_t v32 = [v15 secondsFromGMT];
      id v33 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v13 sinceDate:(double)(v31 - v32)];
    }
    else
    {
      id v33 = v13;
    }
    v29 = v33;
    if (v16)
    {
      v77 = self;
      id v70 = v13;
      v34 = 0;
      uint64_t v35 = 1;
      do
      {
        v36 = v34;
        unint64_t v37 = v35;
        v34 = _NCSchedulerDateWithMultiple(v29, v17, v16, v35);

        v35 *= 2;
      }
      while ([v34 compare:v14] == -1);
      id v76 = v15;
      if (v37 < 2)
      {
        unint64_t v40 = v37;
        id v28 = v34;
      }
      else
      {
        unint64_t v38 = v37 >> 1;
        uint64_t v39 = (unint64_t)(float)((float)(v37 - (v37 >> 1)) * 0.5) + (v37 >> 1);
        do
        {
          unint64_t v40 = v39;
          _NCSchedulerDateWithMultiple(v29, v17, v16, v39);
          id v28 = (id)objc_claimAutoreleasedReturnValue();

          if ([v28 compare:v14] == -1) {
            unint64_t v38 = v40;
          }
          else {
            unint64_t v37 = v40;
          }
          uint64_t v39 = v38 + (unint64_t)((float)(v37 - v38) * 0.5);
          v34 = v28;
        }
        while (v37 - v38 > 1);
      }
      uint64_t v46 = [v28 compare:v14];
      if (v46 == 1)
      {
        self = v77;
        if (a8)
        {
          *a8 = v28;
          v73 = (void *)MEMORY[0x1D9452090]();
          v54 = v77;
          v55 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            uint64_t v56 = HMFGetLogIdentifier();
            id v67 = *a8;
            contexta = (void *)v56;
            v57 = [MEMORY[0x1E4F1C9C8] date];
            *(_DWORD *)buf = 138543874;
            uint64_t v85 = v56;
            __int16 v86 = 2112;
            id v87 = v67;
            self = v77;
            __int16 v88 = 2112;
            v89 = v57;
            _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_INFO, "%{public}@(d) Timer fires next at %@; current time (GMT): %@",
              buf,
              0x20u);
          }
        }
        if (a7)
        {
          _NCSchedulerDateWithMultiple(v29, v17, v16, v40 - 1);
          *a7 = (id)objc_claimAutoreleasedReturnValue();
          v74 = (void *)MEMORY[0x1D9452090]();
          v58 = self;
          v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v59 = HMFGetLogIdentifier();
            id v60 = *a7;
            v61 = [MEMORY[0x1E4F1C9C8] date];
            *(_DWORD *)buf = 138543874;
            uint64_t v85 = (uint64_t)v59;
            __int16 v86 = 2112;
            id v87 = v60;
            self = v77;
            __int16 v88 = 2112;
            v89 = v61;
            _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@(e) Timer fires next at %@; current time (GMT): %@",
              buf,
              0x20u);
          }
          id v13 = v70;
          v30 = v74;
          goto LABEL_47;
        }
        id v13 = v70;
      }
      else
      {
        self = v77;
        if (!v46)
        {
          id v28 = v28;
          *a8 = v28;
          v30 = (void *)MEMORY[0x1D9452090]();
          v62 = v77;
          v82 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            id v13 = v70;
            id v15 = v76;
            v22 = v82;
            goto LABEL_51;
          }
          v63 = HMFGetLogIdentifier();
          id v64 = *a8;
          v65 = [MEMORY[0x1E4F1C9C8] date];
          *(_DWORD *)buf = 138543874;
          uint64_t v85 = (uint64_t)v63;
          __int16 v86 = 2112;
          id v87 = v64;
          self = v77;
          v22 = v82;
          __int16 v88 = 2112;
          v89 = v65;
          _os_log_impl(&dword_1D49D5000, v82, OS_LOG_TYPE_INFO, "%{public}@(f) Timer fires next at %@; current time (GMT): %@",
            buf,
            0x20u);

          id v13 = v70;
LABEL_47:
          id v15 = v76;
LABEL_51:

          goto LABEL_52;
        }
        id v13 = v70;
        if (v46 == -1)
        {
          if (a7)
          {
            *a7 = v28;
            context = (void *)MEMORY[0x1D9452090]();
            v72 = v77;
            v47 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              uint64_t v48 = HMFGetLogIdentifier();
              id v66 = *a7;
              v80 = [MEMORY[0x1E4F1C9C8] date];
              *(_DWORD *)buf = 138543874;
              v49 = (void *)v48;
              uint64_t v85 = v48;
              __int16 v86 = 2112;
              id v87 = v66;
              self = v77;
              __int16 v88 = 2112;
              v89 = v80;
              _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@(b) Timer fires next at %@; current time (GMT): %@",
                buf,
                0x20u);
            }
            id v13 = v70;
          }
          if (a8)
          {
            _NCSchedulerDateWithMultiple(v29, v17, v16, v40 + 1);
            v81 = a8;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
            v30 = (void *)MEMORY[0x1D9452090]();
            v50 = self;
            v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              v51 = HMFGetLogIdentifier();
              id v52 = *v81;
              v53 = [MEMORY[0x1E4F1C9C8] date];
              *(_DWORD *)buf = 138543874;
              uint64_t v85 = (uint64_t)v51;
              __int16 v86 = 2112;
              id v87 = v52;
              self = v77;
              __int16 v88 = 2112;
              v89 = v53;
              _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@(c) Timer fires next at %@; current time (GMT): %@",
                buf,
                0x20u);

              id v13 = v70;
            }
            goto LABEL_47;
          }
        }
      }
      id v15 = v76;
      goto LABEL_52;
    }
    if ([v33 compare:v14] == -1)
    {
      v41 = a7;
      if (!a7) {
        goto LABEL_23;
      }
    }
    else
    {
      v41 = a8;
      if (!a8)
      {
LABEL_23:
        v30 = (void *)MEMORY[0x1D9452090]();
        v42 = self;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v43 = HMFGetLogIdentifier();
          [MEMORY[0x1E4F1C9C8] date];
          v78 = self;
          v45 = id v44 = v15;
          *(_DWORD *)buf = 138543874;
          uint64_t v85 = (uint64_t)v43;
          __int16 v86 = 2112;
          id v87 = v29;
          __int16 v88 = 2112;
          v89 = v45;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@(g) Timer fires next at %@; current time (GMT): %@",
            buf,
            0x20u);

          id v15 = v44;
          self = v78;
        }
        id v28 = 0;
        goto LABEL_51;
      }
    }
    id *v41 = v29;
    goto LABEL_23;
  }
  if (a8)
  {
    uint64_t v20 = a8;
    *a8 = v13;
    v71 = (void *)MEMORY[0x1D9452090]();
    uint64_t v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      v24 = v22;
      objc_super v25 = self;
      id v26 = *v20;
      [MEMORY[0x1E4F1C9C8] date];
      v27 = id v75 = v15;
      *(_DWORD *)buf = 138543874;
      uint64_t v85 = (uint64_t)v23;
      __int16 v86 = 2112;
      id v87 = v26;
      self = v25;
      v22 = v24;
      __int16 v88 = 2112;
      v89 = v27;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@(a) Timer fires next at %@; current time (GMT): %@",
        buf,
        0x20u);

      id v15 = v75;
    }
    id v28 = 0;
    v29 = 0;
    v30 = v71;
    goto LABEL_51;
  }
  id v28 = 0;
  v29 = 0;
LABEL_52:
}

- (void)_reactiveTriggerAfterDelay
{
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, (uint64_t)(*(double *)&minimumTimerRecurrence / 30.0 * 1000000000.0));
  id v4 = [(HMDTrigger *)self workQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__HMDTimerTrigger__reactiveTriggerAfterDelay__block_invoke;
  v5[3] = &unk_1E6A16E40;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __45__HMDTimerTrigger__reactiveTriggerAfterDelay__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained active]
    && [WeakRetained shouldActivateOnLocalDevice])
  {
    [WeakRetained _reactivateTrigger];
  }
}

- (void)_timerTriggered
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDTimerTrigger *)self _shouldExecuteActionSet];
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      objc_super v12 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Going to execute the Action set.", buf, 0xCu);
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __34__HMDTimerTrigger__timerTriggered__block_invoke;
    v10[3] = &unk_1E6A18C18;
    v10[4] = v5;
    [(HMDTrigger *)v5 _executeActionSetsWithCompletionHandler:v10];
    [(HMDTrigger *)v5 triggerFired];
  }
  else
  {
    if (v7)
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      objc_super v12 = v9;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Should execute action set returned NO, going ahead to reactivate trigger", buf, 0xCu);
    }
  }
  [(HMDTimerTrigger *)v5 _reactiveTriggerAfterDelay];
}

uint64_t __34__HMDTimerTrigger__timerTriggered__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) executeCompleteWithError:a2];
}

- (BOOL)_shouldExecuteActionSet
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDTimerTrigger *)self recurrences];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 1;
  }
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  id v6 = [(HMDTimerTrigger *)self recurrences];
  BOOL v7 = [v6 firstObject];
  uint64_t v8 = [v7 calendar];

  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  id v9 = [v8 components:512 fromDate:v5];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(HMDTimerTrigger *)self recurrences];
  uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v26 = v8;
    v27 = v5;
    uint64_t v12 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v15 = (void *)MEMORY[0x1D9452090]();
        id v16 = self;
        uint64_t v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v34 = v18;
          __int16 v35 = 2112;
          v36 = v14;
          __int16 v37 = 2112;
          unint64_t v38 = v9;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Comparing date components iter: %@, now: %@", buf, 0x20u);
        }
        uint64_t v19 = [v9 weekday];
        if (v19 == [v14 weekday])
        {
          uint64_t v21 = (void *)MEMORY[0x1D9452090]();
          v22 = v16;
          v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            v24 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v34 = v24;
            _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Current week day matches with a recurring instance, allowing execution of action set", buf, 0xCu);
          }
          BOOL v20 = 1;
          goto LABEL_18;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    BOOL v20 = 0;
LABEL_18:
    uint64_t v8 = v26;
    id v5 = v27;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (id)_nextSignificantEventFireDate
{
  BOOL v3 = [(HMDTrigger *)self home];
  uint64_t v4 = [v3 homeLocationHandler];
  id v5 = [v4 location];
  id v6 = [(HMDTimerTrigger *)self significantEvent];
  BOOL v7 = [(HMDTimerTrigger *)self significantEventOffset];
  uint64_t v8 = +[HMDSignificantTimeEvent nextTimerDateFromHomeLocation:v5 signifiantEvent:v6 offset:v7 loggingObject:self];

  return v8;
}

- (id)_nextFireDate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDTimerTrigger *)self fireDate];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] now];
  id v5 = [(HMDTimerTrigger *)self fireDateTimeZone];
  id v6 = [(HMDTimerTrigger *)self getFireInterval];
  id v13 = 0;
  [(HMDTimerTrigger *)self _closestDatesForStartDate:v3 earliestDate:v4 timeZone:v5 deliveryRepeatInterval:v6 returnDateBefore:0 returnDateAfter:&v13];
  id v7 = v13;

  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Next Fire Date : [%@]", buf, 0x16u);
  }
  return v7;
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__HMDTimerTrigger__activateWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6A16F80;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = _Block_copy(aBlock);
  if ([(HMDTrigger *)self active]) {
    BOOL v7 = [(HMDTimerTrigger *)self shouldActivateOnLocalDevice];
  }
  else {
    BOOL v7 = 0;
  }
  [(HMDTrigger *)self _activate:v7 completionHandler:v6];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __43__HMDTimerTrigger__activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = v5;
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = HMFGetLogIdentifier();
        int v22 = 138543362;
        v23 = v9;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Activate on super class failed, bailing out", (uint8_t *)&v22, 0xCu);
      }
      uint64_t v10 = *(void *)(a1 + 32);
      if (v10)
      {
        uint64_t v11 = *(void (**)(void))(v10 + 16);
LABEL_19:
        v11();
      }
    }
    else
    {
      if ([WeakRetained active]
        && [v5 shouldActivateOnLocalDevice])
      {
        [v5 _reactiveTriggerAfterDelay];
      }
      else if ([v5 active])
      {
        id v17 = (void *)MEMORY[0x1D9452090]();
        id v18 = v5;
        uint64_t v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          BOOL v20 = HMFGetLogIdentifier();
          int v22 = 138543362;
          v23 = v20;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Looks like the timer is already running. Stopping it.", (uint8_t *)&v22, 0xCu);
        }
        [v18 _stopTimer];
      }
      uint64_t v21 = *(void *)(a1 + 32);
      if (v21)
      {
        uint64_t v11 = *(void (**)(void))(v21 + 16);
        goto LABEL_19;
      }
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v22 = 138543362;
      v23 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@TimerTrigger instance is gone. Doing Nothing.", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v15 = *(void *)(a1 + 32);
    __int16 v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
  }
}

- (BOOL)shouldActivateOnLocalDevice
{
  id v3 = [(HMDTrigger *)self home];
  v10.receiver = self;
  v10.super_class = (Class)HMDTimerTrigger;
  if ([(HMDTrigger *)&v10 shouldActivateOnLocalDevice])
  {
    id v4 = [(HMDTrigger *)self owningDevice];

    if (v4)
    {
      if ([v3 isResidentSupported])
      {
        id v5 = [v3 primaryResident];
        id v6 = [v5 device];
      }
      else
      {
        id v5 = [(HMDTrigger *)self owner];
        if (![v5 isCurrentUser])
        {
          char v7 = 0;
          goto LABEL_11;
        }
        id v6 = [(HMDTrigger *)self owningDevice];
      }
      uint64_t v8 = v6;
      char v7 = [v6 isCurrentDevice];
    }
    else
    {
      id v5 = [(HMDTrigger *)self owner];
      char v7 = [v5 isCurrentUser];
    }
LABEL_11:

    goto LABEL_12;
  }
  char v7 = 0;
LABEL_12:

  return v7;
}

- (void)_disableTimerOffReactivationFailure
{
  [(HMDTimerTrigger *)self _stopTimer];
  [(HMDTrigger *)self setEnabled:0 message:0];
}

- (BOOL)_reactivateSignificantEventTrigger
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDTimerTrigger *)self _nextSignificantEventFireDate];
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      uint64_t v8 = HMFGetLogIdentifier();
      id v9 = objc_msgSend(v3, "hmf_localTimeDescription");
      int v12 = 138543618;
      id v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting timer based on significant event with %@", (uint8_t *)&v12, 0x16u);
    }
    [(HMDTimerTrigger *)v5 _startTimerWithSignificantEventDate:v3];
  }
  else
  {
    if (v7)
    {
      objc_super v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v10;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@No valid next significant fire date, disabling the timer", (uint8_t *)&v12, 0xCu);
    }
    [(HMDTimerTrigger *)v5 _disableTimerOffReactivationFailure];
  }

  return 1;
}

- (BOOL)_reactivateFireDateTrigger
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDTimerTrigger *)self _nextFireDate];
  if (v3)
  {
    [(HMDTimerTrigger *)self _startTimerWithFireDate:v3];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      objc_super v10 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@No valid next fire date, disabling the timer", (uint8_t *)&v9, 0xCu);
    }
    [(HMDTimerTrigger *)v5 _disableTimerOffReactivationFailure];
  }

  return 1;
}

- (BOOL)_reactivateTrigger
{
  id v3 = [(HMDTimerTrigger *)self fireDate];

  if (v3)
  {
    return [(HMDTimerTrigger *)self _reactivateFireDateTrigger];
  }
  else
  {
    return [(HMDTimerTrigger *)self _reactivateSignificantEventTrigger];
  }
}

- (id)_serializeForAdd
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(HMDTimerTrigger *)self fireDate];

  if (v4)
  {
    id v5 = [(HMDTimerTrigger *)self fireDate];
    [v3 setObject:v5 forKeyedSubscript:@"kTimerTriggerInitialFireDateKey"];
  }
  id v6 = [(HMDTimerTrigger *)self fireDateTimeZone];

  if (v6)
  {
    BOOL v7 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v8 = [(HMDTimerTrigger *)self fireDateTimeZone];
    int v9 = [v7 archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
    [v3 setObject:v9 forKeyedSubscript:@"kTimerTriggerTimeZoneDataKey"];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kTimerTriggerResetTimeZoneDataKey"];
  }
  objc_super v10 = [(HMDTimerTrigger *)self fireRepeatInterval];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28DB0];
    int v12 = [(HMDTimerTrigger *)self fireRepeatInterval];
    id v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
    [v3 setObject:v13 forKeyedSubscript:@"kTimerTriggerRecurrenceDataKey"];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kTimerTriggerResetRecurrenceDataKey"];
  }
  __int16 v14 = [(HMDTimerTrigger *)self recurrences];

  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v16 = [(HMDTimerTrigger *)self recurrences];
    id v17 = [v15 archivedDataWithRootObject:v16 requiringSecureCoding:1 error:0];
    [v3 setObject:v17 forKeyedSubscript:@"kTimerTriggerRecurrencesKey"];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kTimerTriggerResetRecurrencesKey"];
  }
  id v18 = [(HMDTimerTrigger *)self significantEvent];

  if (v18)
  {
    uint64_t v19 = [(HMDTimerTrigger *)self significantEvent];
    [v3 setObject:v19 forKeyedSubscript:@"kTimerTriggerSignificantEventKey"];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kTimerTriggerResetSignificantEventKey"];
  }
  BOOL v20 = [(HMDTimerTrigger *)self significantEventOffset];

  if (v20)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28DB0];
    int v22 = [(HMDTimerTrigger *)self significantEventOffset];
    v23 = [v21 archivedDataWithRootObject:v22 requiringSecureCoding:1 error:0];
    [v3 setObject:v23 forKeyedSubscript:@"kTimerTriggerSignificantEventOffsetKey"];
  }
  else
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kTimerTriggerResetSignificantEventOffsetKey"];
  }
  return v3;
}

- (id)backingStoreObjects:(int64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDTimerTrigger *)self modelObjectWithChangeType:1];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)emptyModelObject
{
  id v3 = [HMDTimerTriggerModel alloc];
  id v4 = [(HMDTrigger *)self uuid];
  id v5 = [(HMDTrigger *)self home];
  id v6 = [v5 uuid];
  BOOL v7 = [(HMDBackingStoreModelObject *)v3 initWithObjectChangeType:2 uuid:v4 parentUUID:v6];

  return v7;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  id v5 = [HMDTimerTriggerModel alloc];
  id v6 = [(HMDTrigger *)self uuid];
  BOOL v7 = [(HMDTrigger *)self home];
  uint64_t v8 = [v7 uuid];
  int v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  [(HMDTrigger *)self _fillBaseObjectChangeModel:v9];
  objc_super v10 = [(HMDTimerTrigger *)self fireDate];
  [(HMDTimerTriggerModel *)v9 setFireDate:v10];

  uint64_t v11 = (void *)MEMORY[0x1E4F28DB0];
  int v12 = [(HMDTimerTrigger *)self fireDateTimeZone];
  id v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
  [(HMDTimerTriggerModel *)v9 setFireDateTimeZone:v13];

  __int16 v14 = [(HMDTimerTrigger *)self significantEvent];
  [(HMDTimerTriggerModel *)v9 setSignificantEvent:v14];

  uint64_t v15 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v16 = [(HMDTimerTrigger *)self significantEventOffset];
  id v17 = [v15 archivedDataWithRootObject:v16 requiringSecureCoding:1 error:0];
  [(HMDTimerTriggerModel *)v9 setSignificantEventOffset:v17];

  id v18 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v19 = [(HMDTimerTrigger *)self fireRepeatInterval];
  BOOL v20 = [v18 archivedDataWithRootObject:v19 requiringSecureCoding:1 error:0];
  [(HMDTimerTriggerModel *)v9 setFireRepeatInterval:v20];

  uint64_t v21 = (void *)MEMORY[0x1E4F28DB0];
  int v22 = [(HMDTimerTrigger *)self recurrences];
  v23 = [v21 archivedDataWithRootObject:v22 requiringSecureCoding:1 error:0];
  [(HMDTimerTriggerModel *)v9 setRecurrences:v23];

  return v9;
}

- (void)_handleTimerTriggerUpdate:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HMDTimerTrigger *)self _handleUpdateTimerTriggerPropertiesModel:v7 message:v6];
  [(HMDTrigger *)self _handleTriggerUpdate:v7 message:v6];
}

- (void)_handleUpdateTimerTriggerPropertiesModel:(id)a3 message:(id)a4
{
  id v33 = a3;
  id v6 = a4;
  id v7 = [v33 setProperties];
  int v8 = [v7 containsObject:@"fireDate"];

  if (v8)
  {
    int v9 = [v33 fireDate];
    [(HMDTimerTrigger *)self setFireDate:v9];
  }
  objc_super v10 = [v33 setProperties];
  int v11 = [v10 containsObject:@"fireDateTimeZone"];

  if (v11)
  {
    int v12 = [v33 fireDateTimeZone];
    id v13 = [v12 decodeTimeZone];
    [(HMDTimerTrigger *)self setFireDateTimeZone:v13];

    int v8 = 1;
  }
  __int16 v14 = [v33 setProperties];
  int v15 = [v14 containsObject:@"fireRepeatInterval"];

  if (v15)
  {
    uint64_t v16 = [v33 fireRepeatInterval];
    id v17 = [v16 decodeDateComponents];
    [(HMDTimerTrigger *)self setFireRepeatInterval:v17];

    int v8 = 1;
  }
  id v18 = [v33 setProperties];
  int v19 = [v18 containsObject:@"recurrences"];

  if (v19)
  {
    BOOL v20 = [v33 recurrences];
    uint64_t v21 = [v20 decodeArrayOfDateComponents];
    [(HMDTimerTrigger *)self setRecurrences:v21];

    int v8 = 1;
  }
  int v22 = [v33 setProperties];
  int v23 = [v22 containsObject:@"significantEvent"];

  if (v23)
  {
    uint64_t v24 = [v33 significantEvent];
    [(HMDTimerTrigger *)self setSignificantEvent:v24];

    int v8 = 1;
  }
  objc_super v25 = [v33 setProperties];
  int v26 = [v25 containsObject:@"significantEventOffset"];

  if (v26)
  {
    v27 = [v33 significantEventOffset];
    id v28 = [v27 decodeDateComponents];
    [(HMDTimerTrigger *)self setSignificantEventOffset:v28];
  }
  else if (!v8)
  {
    goto LABEL_15;
  }
  long long v29 = [v6 messagePayload];
  long long v30 = (void *)[v29 mutableCopy];

  long long v31 = HMDRemoteMessagePayloadKeysForTransportMetadata();
  [v30 removeObjectsForKeys:v31];

  long long v32 = [(HMDTimerTrigger *)self _serializeForAdd];
  [v30 addEntriesFromDictionary:v32];

  [v6 respondWithPayload:v30];
LABEL_15:
}

- (void)_handleUpdateTimerTriggerPropertiesRequest:(id)a3
{
  id v14 = a3;
  id v4 = [(HMDTimerTrigger *)self emptyModelObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [(HMDTimerTrigger *)self fireDate];
  int v8 = +[HMDTimerTrigger validateTriggerModel:v6 message:v14 currentFireDate:v7];

  if (v8)
  {
    int v9 = [(HMDTrigger *)self home];
    objc_super v10 = [v9 backingStore];
    int v11 = [v14 name];
    int v12 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    id v13 = [v10 transaction:v11 options:v12];

    [v13 add:v8 withMessage:v14];
    [v13 run];
  }
}

- (void)_registerForMessages
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)HMDTimerTrigger;
  [(HMDTrigger *)&v9 _registerForMessages];
  id v3 = [(HMDTrigger *)self home];
  id v4 = [v3 administratorHandler];
  id v5 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v10[0] = v5;
  id v6 = +[HMDXPCBackgroundMessagePolicy policyWithEntitlementRequirement:1];
  v10[1] = v6;
  id v7 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v10[2] = v7;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  [v4 registerForMessage:@"kScheduleTimerTriggerRequestKey" receiver:self policies:v8 selector:sel__handleUpdateTimerTriggerPropertiesRequest_];
}

- (void)_stopTimer
{
  id v3 = +[HMDBackgroundTaskManager sharedManager];
  id v4 = [(HMDTimerTrigger *)self timerID];
  [v3 cancelTaskWithIdentifier:v4 onObserver:self];

  [(HMDTimerTrigger *)self setCurrentFireDate:0];
}

- (void)_startTimer:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDTrigger *)self home];
  if (v5)
  {
    if ([(HMDTrigger *)self active]
      && [(HMDTimerTrigger *)self shouldActivateOnLocalDevice])
    {
      id v6 = +[HMDBackgroundTaskManager sharedManager];
      id v7 = [(HMDTimerTrigger *)self timerID];
      id v26 = 0;
      [v6 scheduleTaskWithIdentifier:v7 fireDate:v4 onObserver:self selector:sel_handleTimerFiredNotification_ error:&v26];
      id v8 = v26;

      if (v8)
      {
        objc_super v9 = (void *)MEMORY[0x1D9452090]();
        objc_super v10 = self;
        int v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v12 = HMFGetLogIdentifier();
          id v13 = [(HMDTimerTrigger *)v10 timerID];
          *(_DWORD *)buf = 138543874;
          id v28 = v12;
          __int16 v29 = 2112;
          long long v30 = v13;
          __int16 v31 = 2112;
          id v32 = v8;
          _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to start timer %@ with error %@", buf, 0x20u);
        }

        goto LABEL_15;
      }
    }
    else
    {
      id v14 = (void *)MEMORY[0x1D9452090]();
      int v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = HMFGetLogIdentifier();
        id v18 = [(HMDTrigger *)v15 name];
        *(_DWORD *)buf = 138543618;
        id v28 = v17;
        __int16 v29 = 2112;
        long long v30 = v18;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Trigger %@ not activated on local device - skipping scheduling the trigger", buf, 0x16u);
      }
    }
    [(HMDTimerTrigger *)self setCurrentFireDate:v4];
    goto LABEL_15;
  }
  int v19 = (void *)MEMORY[0x1D9452090]();
  BOOL v20 = self;
  uint64_t v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    int v22 = HMFGetLogIdentifier();
    int v23 = [(HMDTrigger *)v20 name];
    uint64_t v24 = [(HMDTrigger *)v20 uuid];
    objc_super v25 = [v24 UUIDString];
    *(_DWORD *)buf = 138543874;
    id v28 = v22;
    __int16 v29 = 2112;
    long long v30 = v23;
    __int16 v31 = 2112;
    id v32 = v25;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@/%@: Home reference is nil", buf, 0x20u);
  }
LABEL_15:
}

- (void)_startTimerWithFireDate:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 timeIntervalSinceNow];
  if (v6 <= 0.0)
  {
    id v8 = [(HMDTimerTrigger *)self getCalendar];
    objc_super v9 = [(HMDTimerTrigger *)self getFireInterval];
    id v7 = [v8 dateByAddingComponents:v9 toDate:v4 options:0];

    objc_super v10 = (void *)MEMORY[0x1D9452090]();
    int v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = objc_msgSend(v7, "hmf_localTimeDescription");
      int v20 = 138543618;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      int v23 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Revised Next Fire Date %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    id v7 = v4;
  }
  int v15 = (void *)MEMORY[0x1D9452090](v5);
  uint64_t v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    int v19 = objc_msgSend(v7, "hmf_localTimeDescription");
    int v20 = 138543618;
    uint64_t v21 = v18;
    __int16 v22 = 2112;
    int v23 = v19;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Next fire date %@", (uint8_t *)&v20, 0x16u);
  }
  [(HMDTimerTrigger *)v16 _startTimer:v7];
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v11 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Invalidating the trigger", buf, 0xCu);
  }
  id v7 = +[HMDBackgroundTaskManager sharedManager];
  id v8 = [(HMDTimerTrigger *)v4 timerID];
  [v7 cancelTaskWithIdentifier:v8 onObserver:v4];

  v9.receiver = v4;
  v9.super_class = (Class)HMDTimerTrigger;
  [(HMDTrigger *)&v9 invalidate];
}

- (void)timerTriggered
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v11 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Timer Triggered", buf, 0xCu);
  }
  objc_initWeak((id *)buf, v4);
  id v7 = [(HMDTrigger *)v4 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__HMDTimerTrigger_timerTriggered__block_invoke;
  block[3] = &unk_1E6A16E40;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async(v7, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __33__HMDTimerTrigger_timerTriggered__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timerTriggered];
}

- (void)dealloc
{
  id v3 = [(HMDTrigger *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  id v4 = [(HMDTrigger *)self home];
  uint64_t v5 = [v4 administratorHandler];
  [v5 deregisterReceiver:self];

  v6.receiver = self;
  v6.super_class = (Class)HMDTimerTrigger;
  [(HMDTrigger *)&v6 dealloc];
}

- (void)completeConfiguration
{
  id v3 = [(HMDTrigger *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__HMDTimerTrigger_completeConfiguration__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __40__HMDTimerTrigger_completeConfiguration__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:0];
}

- (void)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)HMDTimerTrigger;
  [(HMDTrigger *)&v28 configure:v8 messageDispatcher:v9 queue:v10];
  int v11 = [(HMDTimerTrigger *)self timerID];

  if (!v11)
  {
    uint64_t v12 = [(HMDTrigger *)self uuid];
    id v13 = [v12 UUIDString];
    id v14 = [@"com.apple.homed.timertriggers." stringByAppendingString:v13];
    [(HMDTimerTrigger *)self setTimerID:v14];

    int v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      int v19 = [(HMDTimerTrigger *)v16 timerID];
      *(_DWORD *)buf = 138543618;
      long long v30 = v18;
      __int16 v31 = 2112;
      id v32 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Null timerID -- initializing with %@", buf, 0x16u);
    }
  }
  int v20 = (void *)MEMORY[0x1D9452090]();
  uint64_t v21 = self;
  __int16 v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    int v23 = HMFGetLogIdentifier();
    uint64_t v24 = [(HMDTimerTrigger *)v21 fireDate];
    objc_super v25 = [(HMDTimerTrigger *)v21 fireDateTimeZone];
    id v26 = [(HMDTimerTrigger *)v21 timerID];
    uint64_t v27 = [v26 cStringUsingEncoding:4];
    *(_DWORD *)buf = 138544130;
    long long v30 = v23;
    __int16 v31 = 2112;
    id v32 = v24;
    __int16 v33 = 2112;
    v34 = v25;
    __int16 v35 = 2080;
    uint64_t v36 = v27;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Configuring with firedate %@ and timezone %@ for %s", buf, 0x2Au);
  }
  [(HMDTimerTrigger *)v21 _activateWithCompletion:0];
}

- (void)setCurrentFireDate:(id)a3
{
  id v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  currentFireDate = self->_currentFireDate;
  self->_currentFireDate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)currentFireDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_currentFireDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)triggerType
{
  return 2;
}

- (id)dumpState
{
  v23.receiver = self;
  v23.super_class = (Class)HMDTimerTrigger;
  id v3 = [(HMDTrigger *)&v23 dumpState];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(HMDTimerTrigger *)self fireRepeatInterval];

  if (v5)
  {
    objc_super v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v7 = [(HMDTimerTrigger *)self fireRepeatInterval];
    id v8 = [(HMDTimerTrigger *)self fireDate];
    id v9 = [v6 dateByAddingComponents:v7 toDate:v8 options:0];

    id v10 = [(HMDTimerTrigger *)self fireDate];
    [v9 timeIntervalSinceDate:v10];
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = NSString;
  id v14 = [(HMDTimerTrigger *)self fireDate];
  int v15 = objc_msgSend(v14, "hmf_localTimeDescription");
  uint64_t v16 = [(HMDTimerTrigger *)self fireDateTimeZone];
  id v17 = [(HMDTimerTrigger *)self significantEvent];
  id v18 = [(HMDTimerTrigger *)self significantEventOffset];
  uint64_t v19 = [v18 second];
  int v20 = [(HMDTimerTrigger *)self recurrences];
  uint64_t v21 = [v13 stringWithFormat:@"initial fire date: %@, time zone: %@, sig-event: %@, sig-event-offset: %tu, repeat interval: %f seconds, recur-instances: %@", v15, v16, v17, v19, v12, v20];

  [v4 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F64EB0]];
  return v4;
}

- (id)description
{
  v17.receiver = self;
  v17.super_class = (Class)HMDTimerTrigger;
  int v15 = (void *)MEMORY[0x1E4F28E78];
  id v3 = [(HMFObject *)&v17 description];
  id v4 = [(HMDTimerTrigger *)self fireDate];
  uint64_t v5 = objc_msgSend(v4, "hmf_localTimeDescription");
  objc_super v6 = [(HMDTimerTrigger *)self fireDateTimeZone];
  id v7 = [(HMDTimerTrigger *)self significantEvent];
  id v8 = [(HMDTimerTrigger *)self significantEventOffset];
  uint64_t v9 = [v8 second];
  id v10 = [(HMDTimerTrigger *)self fireRepeatInterval];
  uint64_t v11 = [(HMDTimerTrigger *)self recurrences];
  uint64_t v12 = [v15 stringWithFormat:@"<Timer-Trigger: %@, fireDate = %@, fireDateTimeZone = %@, significantEvent = %@, significantEventOffset = %tu, repeatInterval: %@, recurrences = %@", v3, v5, v6, v7, v9, v10, v11];

  v16.receiver = self;
  v16.super_class = (Class)HMDTimerTrigger;
  id v13 = [(HMFObject *)&v16 description];
  [v12 appendString:v13];

  return v12;
}

- (HMDTimerTrigger)initWithModel:(id)a3 home:(id)a4
{
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HMDTimerTrigger;
  id v7 = [(HMDTrigger *)&v25 initWithModel:v6 home:a4];
  if (v7)
  {
    uint64_t v8 = [v6 fireDate];
    fireDate = v7->_fireDate;
    v7->_fireDate = (NSDate *)v8;

    id v10 = [v6 fireDateTimeZone];
    uint64_t v11 = [v10 decodeTimeZone];
    fireDateTimeZone = v7->_fireDateTimeZone;
    v7->_fireDateTimeZone = (NSTimeZone *)v11;

    id v13 = [v6 fireRepeatInterval];
    uint64_t v14 = [v13 decodeDateComponents];
    fireRepeatInterval = v7->_fireRepeatInterval;
    v7->_fireRepeatInterval = (NSDateComponents *)v14;

    objc_super v16 = [v6 recurrences];
    uint64_t v17 = [v16 decodeArrayOfDateComponents];
    recurrences = v7->_recurrences;
    v7->_recurrences = (NSArray *)v17;

    uint64_t v19 = [v6 significantEvent];
    significantEvent = v7->_significantEvent;
    v7->_significantEvent = (NSString *)v19;

    uint64_t v21 = [v6 significantEventOffset];
    uint64_t v22 = [v21 decodeDateComponents];
    significantEventOffset = v7->_significantEventOffset;
    v7->_significantEventOffset = (NSDateComponents *)v22;
  }
  return v7;
}

- (HMDTimerTrigger)initWithName:(id)a3 uuid:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HMDTimerTrigger;
  id v4 = [(HMDTrigger *)&v11 initWithName:a3 uuid:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [(HMDTrigger *)v4 uuid];
    id v7 = [v6 UUIDString];
    uint64_t v8 = [@"com.apple.homed.timertriggers." stringByAppendingString:v7];
    timerID = v5->_timerID;
    v5->_timerID = (NSString *)v8;

    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)getCalendar:(id)a3
{
  id v3 = a3;
  id v4 = [v3 calendar];

  if (v4) {
    [v3 calendar];
  }
  else {
  uint64_t v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }

  return v5;
}

+ (id)validateWholeMinuteDate:(id)a3 onCalendar:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v10 = 0;
    goto LABEL_12;
  }
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  }
  uint64_t v8 = [v7 components:3178750 fromDate:v5];
  if ([v8 second])
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:70 userInfo:0];
  }
  else
  {
    [v5 timeIntervalSinceNow];
    if (v11 >= 0.0)
    {
      id v10 = 0;
      goto LABEL_11;
    }
    uint64_t v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:28];
  }
  id v10 = (void *)v9;
LABEL_11:

LABEL_12:
  return v10;
}

+ (id)validateTriggerModel:(id)a3 message:(id)a4 currentFireDate:(id)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 dateForKey:@"kTimerTriggerInitialFireDateKey"];
  if (!v11)
  {
    id v12 = v10;
    goto LABEL_9;
  }
  id v12 = (id)v11;
  uint64_t v13 = +[HMDTimerTrigger validateWholeMinuteDate:v11 onCalendar:0];
  if (!v13)
  {
    [v8 setFireDate:v12];
    [v8 setSignificantEvent:0];
    [v8 setSignificantEventOffset:0];
LABEL_9:
    uint64_t v22 = [v9 timeZoneForKey:@"kTimerTriggerTimeZoneDataKey"];
    if (v22)
    {
      uint64_t v24 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v22 requiringSecureCoding:1 error:0];
      [v8 setFireDateTimeZone:v24];
    }
    else if ([v9 BOOLForKey:@"kTimerTriggerResetTimeZoneDataKey"])
    {
      [v8 setFireDateTimeZone:0];
    }
    uint64_t v25 = [v9 dateComponentsForKey:@"kTimerTriggerRecurrenceDataKey"];
    v68 = (void *)v25;
    if (v25)
    {
      uint64_t v26 = v25;
      id v66 = v22;
      id v27 = v10;
      objc_super v28 = +[HMDTimerTrigger getCalendar:v25];
      uint64_t v14 = +[HMDTimerTrigger validateRecurrence:v26 calendar:v28 fireDate:v12];

      if (v14)
      {
        __int16 v29 = (void *)MEMORY[0x1D9452090]();
        id v30 = a1;
        __int16 v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v70 = (uint64_t)v32;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Not a valid recurrence", buf, 0xCu);
        }
        __int16 v33 = [v9 responseHandler];

        if (!v33)
        {
          id v23 = 0;
          id v10 = v27;
          uint64_t v22 = v66;
LABEL_61:

          goto LABEL_62;
        }
        v34 = [v9 responseHandler];
        ((void (**)(void, void *, void))v34)[2](v34, v14, 0);
        id v23 = 0;
        id v10 = v27;
        uint64_t v22 = v66;
LABEL_60:

        goto LABEL_61;
      }
      __int16 v35 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v26 requiringSecureCoding:1 error:0];
      [v8 setFireRepeatInterval:v35];

      id v10 = v27;
      uint64_t v22 = v66;
    }
    else if ([v9 BOOLForKey:@"kTimerTriggerResetRecurrenceDataKey"])
    {
      [v8 setFireRepeatInterval:0];
    }
    uint64_t v36 = [v9 numberForKey:@"kTimerTriggerRecurrencesKey"];
    id v65 = v10;
    id v67 = v36;
    if (v36)
    {
      if ([v36 unsignedIntegerValue] == 127) {
        goto LABEL_33;
      }
      uint64_t v37 = HMDaysOfTheWeekToDateComponents();
    }
    else
    {
      uint64_t v37 = [v9 arrayOfDateComponentsForKey:@"kTimerTriggerRecurrencesKey"];
    }
    uint64_t v38 = v37;
    if (v37)
    {
      uint64_t v39 = +[HMDTimerTrigger validateRecurrences:v37];
      if (v39)
      {
        uint64_t v14 = (void *)v39;
        id v64 = (void (**)(void, void, void))v38;
        uint64_t v40 = (void *)MEMORY[0x1D9452090]();
        id v41 = a1;
        v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v70 = (uint64_t)v43;
          _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Invalid recurrence instances", buf, 0xCu);
        }
        id v44 = [v9 responseHandler];

        if (!v44)
        {
          id v23 = 0;
          goto LABEL_59;
        }
        v45 = [v9 responseHandler];
        ((void (**)(void, void *, void))v45)[2](v45, v14, 0);
        id v23 = 0;
LABEL_58:

LABEL_59:
        v34 = v64;

        id v10 = v65;
        goto LABEL_60;
      }
      [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v38 requiringSecureCoding:1 error:0];
      v47 = uint64_t v46 = (void (**)(void, void, void))v38;
      [v8 setRecurrences:v47];

LABEL_38:
      v45 = [v9 stringForKey:@"kTimerTriggerSignificantEventKey"];
      id v64 = v46;
      if (v45)
      {
        if ((HMIsValidSignificantEvent() & 1) == 0)
        {
          v55 = (void *)MEMORY[0x1D9452090]();
          id v56 = a1;
          v57 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            v58 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v70 = (uint64_t)v58;
            _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_ERROR, "%{public}@Significant event is not valid", buf, 0xCu);
          }
          uint64_t v48 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
          v59 = [v9 responseHandler];

          if (v59)
          {
            id v60 = [v9 responseHandler];
            ((void (**)(void, void *, void))v60)[2](v60, v48, 0);
          }
          uint64_t v14 = 0;
LABEL_52:
          id v23 = 0;
LABEL_57:

          goto LABEL_58;
        }
        [v8 setSignificantEvent:v45];
        [v8 setFireDate:0];
        [v8 setFireDateTimeZone:0];
        [v8 setFireRepeatInterval:0];
      }
      uint64_t v48 = [v9 dateComponentsForKey:@"kTimerTriggerSignificantEventOffsetKey"];
      if (v48)
      {
        uint64_t v49 = +[HMDTimerTrigger validateSignificantOffset:v48];
        if (v49)
        {
          uint64_t v14 = (void *)v49;
          v50 = (void *)MEMORY[0x1D9452090]();
          id v51 = a1;
          id v52 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v70 = *(_DWORD *)buf = 138543362;
            v63 = v50;
            v53 = (void *)v70;
            _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_ERROR, "%{public}@Invalid significant event offset", buf, 0xCu);

            v50 = v63;
          }

          id v23 = [v9 responseHandler];

          if (!v23) {
            goto LABEL_57;
          }
          v54 = [v9 responseHandler];
          ((void (**)(void, void *, void))v54)[2](v54, v14, 0);

          goto LABEL_52;
        }
        v61 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v48 requiringSecureCoding:1 error:0];
        [v8 setSignificantEventOffset:v61];
      }
      else if ([v9 BOOLForKey:@"kTimerTriggerResetSignificantEventOffsetKey"])
      {
        [v8 setSignificantEventOffset:0];
      }
      id v23 = v8;
      uint64_t v14 = 0;
      goto LABEL_57;
    }
LABEL_33:
    if ([v9 BOOLForKey:@"kTimerTriggerResetRecurrencesKey"]) {
      [v8 setRecurrences:0];
    }
    uint64_t v46 = 0;
    goto LABEL_38;
  }
  uint64_t v14 = (void *)v13;
  id v15 = v8;
  objc_super v16 = (void *)MEMORY[0x1D9452090]();
  id v17 = a1;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    int v20 = v19 = v10;
    *(_DWORD *)buf = 138543362;
    uint64_t v70 = (uint64_t)v20;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Fire date is not valid", buf, 0xCu);

    id v10 = v19;
  }

  uint64_t v21 = [v9 responseHandler];

  if (!v21)
  {
    id v23 = 0;
    id v8 = v15;
    goto LABEL_63;
  }
  uint64_t v22 = [v9 responseHandler];
  ((void (**)(void, void *, void))v22)[2](v22, v14, 0);
  id v23 = 0;
  id v8 = v15;
LABEL_62:

LABEL_63:
  return v23;
}

+ (id)validateRecurrences:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [v4 firstObject];
    id v6 = [v5 calendar];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v40 + 1) + 8 * i) calendar];
          char v13 = HMFEqualObjects();

          if ((v13 & 1) == 0)
          {
            uint64_t v22 = MEMORY[0x1D9452090]();
            id v23 = a1;
            uint64_t v24 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              uint64_t v25 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v45 = v25;
              _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Calendars are not matching in the recurrence instances", buf, 0xCu);
            }
            uint64_t v26 = (void *)v22;
LABEL_23:
            uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
            goto LABEL_24;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v14 = v7;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v37;
      while (2)
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          if (![v19 weekday])
          {
            uint64_t v28 = MEMORY[0x1D9452090]();
            id v29 = a1;
            id v30 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              __int16 v31 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v45 = v31;
              __int16 v46 = 2112;
              v47 = v19;
              _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Invalid values for week day: %@", buf, 0x16u);
            }
            uint64_t v26 = (void *)v28;
            goto LABEL_23;
          }
          id v20 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
          objc_msgSend(v20, "setWeekday:", objc_msgSend(v19, "weekday"));
          [v20 setCalendar:v6];
          if (([v19 isEqual:v20] & 1) == 0)
          {
            id v32 = (void *)MEMORY[0x1D9452090]();
            id v33 = a1;
            v34 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              __int16 v35 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v45 = v35;
              __int16 v46 = 2112;
              v47 = v19;
              _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Miscellaneous fields have been set recurrence instances: %@", buf, 0x16u);
            }
            uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];

            goto LABEL_24;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v48 count:16];
        uint64_t v21 = 0;
        if (v16) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
LABEL_24:
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

+ (id)validateSignificantOffset:(id)a3
{
  return 0;
}

+ (id)validateRecurrence:(id)a3 calendar:(id)a4 fireDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    if (([v7 second] == 0x7FFFFFFFFFFFFFFFLL || !objc_msgSend(v7, "second"))
      && ([v7 nanosecond] == 0x7FFFFFFFFFFFFFFFLL || !objc_msgSend(v7, "nanosecond")))
    {
      uint64_t v11 = [v8 dateByAddingComponents:v7 toDate:v9 options:0];
      [v11 timeIntervalSinceDate:v9];
      uint64_t v10 = 0;
      if (v12 < *(double *)&minimumTimerRecurrence)
      {
        uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:42 userInfo:0];
      }
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:69 userInfo:0];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v13 = v10;

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_27732 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_27732, &__block_literal_global_27733);
  }
  v2 = (void *)logCategory__hmf_once_v1_27734;
  return v2;
}

uint64_t __30__HMDTimerTrigger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_27734;
  logCategory__hmf_once_v1_27734 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end