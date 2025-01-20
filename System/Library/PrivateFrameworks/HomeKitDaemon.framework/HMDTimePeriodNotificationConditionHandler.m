@interface HMDTimePeriodNotificationConditionHandler
+ (id)logCategory;
- (BOOL)canHandleCondition:(id)a3;
- (BOOL)conditionPasses:(id)a3 registrationUser:(id)a4;
- (HMDHome)home;
- (HMDTimePeriodNotificationConditionHandler)initWithHome:(id)a3;
- (HMDTimePeriodNotificationConditionHandler)initWithHome:(id)a3 timeProvider:(id)a4 sunriseSunsetProvider:(id)a5;
- (HMDTimePeriodNotificationConditionSunsetSunriseProvider)sunriseSunsetProvider;
- (HMDTimePeriodNotificationConditionTimeProvider)timeProvider;
- (id)_dateComponentsForTimePeriodElement:(id)a3 home:(id)a4;
- (id)_dateTodayMatchingComponents:(id)a3;
@end

@implementation HMDTimePeriodNotificationConditionHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sunriseSunsetProvider, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (HMDTimePeriodNotificationConditionSunsetSunriseProvider)sunriseSunsetProvider
{
  return (HMDTimePeriodNotificationConditionSunsetSunriseProvider *)objc_getProperty(self, a2, 24, 1);
}

- (HMDTimePeriodNotificationConditionTimeProvider)timeProvider
{
  return (HMDTimePeriodNotificationConditionTimeProvider *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)_dateTodayMatchingComponents:(id)a3
{
  id v4 = a3;
  v5 = [(HMDTimePeriodNotificationConditionHandler *)self timeProvider];
  v6 = [v5 currentDate];

  v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  v8 = [v7 components:124 fromDate:v6];
  objc_msgSend(v8, "setHour:", objc_msgSend(v4, "hour"));
  uint64_t v9 = [v4 minute];

  [v8 setMinute:v9];
  v10 = [v7 dateFromComponents:v8];

  return v10;
}

- (id)_dateComponentsForTimePeriodElement:(id)a3 home:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    id v15 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    id v14 = objc_alloc_init(MEMORY[0x263EFF918]);
    objc_msgSend(v14, "setHour:", objc_msgSend(v17, "hour"));
    uint64_t v18 = [v17 minute];

    [v14 setMinute:v18];
    [v14 setSecond:0];
    goto LABEL_22;
  }
  uint64_t v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    id v19 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    id v21 = v20;

    v22 = [v21 significantEvent];
    int v23 = [v22 isEqualToString:*MEMORY[0x263F0D8F8]];

    if (v23)
    {
      v24 = [(HMDTimePeriodNotificationConditionHandler *)self sunriseSunsetProvider];
      uint64_t v25 = [v24 sunriseTimeForHome:v7];
    }
    else
    {
      v26 = [v21 significantEvent];
      int v27 = [v26 isEqualToString:*MEMORY[0x263F0D908]];

      if (!v27)
      {
        v34 = (void *)MEMORY[0x230FBD990]();
        v35 = self;
        v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = HMFGetLogIdentifier();
          v38 = [v21 significantEvent];
          int v40 = 138543618;
          v41 = v37;
          __int16 v42 = 2112;
          id v43 = v38;
          _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Only sunrise & sunset are supported, not: %@", (uint8_t *)&v40, 0x16u);
        }
        id v14 = 0;
        goto LABEL_21;
      }
      v24 = [(HMDTimePeriodNotificationConditionHandler *)self sunriseSunsetProvider];
      uint64_t v25 = [v24 sunsetTimeForHome:v7];
    }
    v28 = (void *)v25;

    id v29 = objc_alloc(MEMORY[0x263EFF8F0]);
    v30 = (void *)[v29 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    v31 = [v21 offset];
    v32 = [v30 dateByAddingComponents:v31 toDate:v28 options:0];

    v33 = objc_msgSend(v32, "hmf_dateComponents");
    id v14 = objc_alloc_init(MEMORY[0x263EFF918]);
    objc_msgSend(v14, "setHour:", objc_msgSend(v33, "hour"));
    objc_msgSend(v14, "setMinute:", objc_msgSend(v33, "minute"));

LABEL_21:
    goto LABEL_22;
  }
  v10 = (void *)MEMORY[0x230FBD990]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = HMFGetLogIdentifier();
    int v40 = 138543618;
    v41 = v13;
    __int16 v42 = 2112;
    id v43 = v6;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unsupported HMDTimePeriodElement: %@", (uint8_t *)&v40, 0x16u);
  }
  id v14 = 0;
LABEL_22:

  return v14;
}

- (BOOL)conditionPasses:(id)a3 registrationUser:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v48 = a4;
  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    uint64_t v10 = [v9 startElement];
    uint64_t v11 = [v9 endElement];
    v12 = [(HMDTimePeriodNotificationConditionHandler *)self home];
    v47 = (void *)v10;
    v13 = [(HMDTimePeriodNotificationConditionHandler *)self _dateComponentsForTimePeriodElement:v10 home:v12];
    v46 = (void *)v11;
    id v14 = [(HMDTimePeriodNotificationConditionHandler *)self _dateComponentsForTimePeriodElement:v11 home:v12];
    id v15 = (void *)MEMORY[0x230FBD990]();
    v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v50 = v18;
      __int16 v51 = 2112;
      id v52 = v13;
      __int16 v53 = 2112;
      v54 = v14;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Start: %@ End: %@", buf, 0x20u);
    }
    if (v13 && v14)
    {
      uint64_t v44 = v12;
      id v19 = [(HMDTimePeriodNotificationConditionHandler *)v16 _dateTodayMatchingComponents:v13];
      v20 = [(HMDTimePeriodNotificationConditionHandler *)v16 _dateTodayMatchingComponents:v14];
      id v21 = [(HMDTimePeriodNotificationConditionHandler *)v16 timeProvider];
      uint64_t v22 = [v21 currentDate];

      uint64_t v23 = [v19 compare:v20];
      id v24 = objc_alloc(MEMORY[0x263F08798]);
      v45 = (void *)v22;
      if (v23 == -1)
      {
        uint64_t v25 = (void *)[v24 initWithStartDate:v19 endDate:v20];
        LOBYTE(v26) = [v25 containsDate:v22];
      }
      else
      {
        uint64_t v25 = (void *)[v24 initWithStartDate:v20 endDate:v19];
        LODWORD(v26) = [v25 containsDate:v22] ^ 1;
      }

      v35 = (void *)MEMORY[0x230FBD990]();
      v36 = v16;
      v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = id v43 = v14;
        HMFBooleanToString();
        v39 = v41 = v35;
        *(_DWORD *)buf = 138544642;
        v50 = v38;
        __int16 v51 = 2112;
        id v52 = v7;
        __int16 v53 = 2112;
        v54 = v39;
        __int16 v55 = 2112;
        v56 = v19;
        __int16 v57 = 2112;
        v58 = v20;
        __int16 v59 = 2112;
        v60 = v45;
        _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Condition: %@ passes: %@ for Start: %@ End: %@ Time: %@", buf, 0x3Eu);

        v35 = v41;
        id v14 = v43;
      }

      v32 = v46;
      v12 = v44;
    }
    else
    {
      v30 = (void *)MEMORY[0x230FBD990]();
      v26 = v16;
      v31 = HMFGetOSLogHandle();
      v32 = v46;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        __int16 v42 = v14;
        v34 = v33 = v12;
        *(_DWORD *)buf = 138543874;
        v50 = v34;
        __int16 v51 = 2112;
        id v52 = v47;
        __int16 v53 = 2112;
        v54 = v46;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve date components for startElement: %@ endElement: %@", buf, 0x20u);

        v12 = v33;
        id v14 = v42;
      }

      LOBYTE(v26) = 0;
    }
  }
  else
  {
    v26 = (HMDTimePeriodNotificationConditionHandler *)MEMORY[0x230FBD990]();
    int v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v50 = v29;
      __int16 v51 = 2112;
      id v52 = v7;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Attempting to evaluate a non-time period condition: %@", buf, 0x16u);
    }
    LOBYTE(v26) = 0;
  }

  return (char)v26;
}

- (BOOL)canHandleCondition:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = objc_opt_isKindOfClass() & (v3 != 0);

  return v4;
}

- (HMDTimePeriodNotificationConditionHandler)initWithHome:(id)a3 timeProvider:(id)a4 sunriseSunsetProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDTimePeriodNotificationConditionHandler;
  uint64_t v11 = [(HMDTimePeriodNotificationConditionHandler *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_home, v8);
    objc_storeStrong((id *)&v12->_timeProvider, a4);
    objc_storeStrong((id *)&v12->_sunriseSunsetProvider, a5);
  }

  return v12;
}

- (HMDTimePeriodNotificationConditionHandler)initWithHome:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HMDTimePeriodNotificationConditionDefaultTimeProvider);
  id v6 = objc_alloc_init(HMDTimePeriodNotificationConditionDefaultSunsetSunriseProvider);
  id v7 = [(HMDTimePeriodNotificationConditionHandler *)self initWithHome:v4 timeProvider:v5 sunriseSunsetProvider:v6];

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_34737 != -1) {
    dispatch_once(&logCategory__hmf_once_t10_34737, &__block_literal_global_34738);
  }
  v2 = (void *)logCategory__hmf_once_v11_34739;
  return v2;
}

void __56__HMDTimePeriodNotificationConditionHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v11_34739;
  logCategory__hmf_once_v11_34739 = v0;
}

@end