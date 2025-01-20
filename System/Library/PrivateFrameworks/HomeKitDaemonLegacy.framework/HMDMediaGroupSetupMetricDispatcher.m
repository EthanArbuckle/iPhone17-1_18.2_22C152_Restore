@interface HMDMediaGroupSetupMetricDispatcher
+ (id)logCategory;
- (HMDMediaGroupSetupMetricDispatcher)initWithDataSource:(id)a3 logEventSubmitter:(id)a4;
- (HMDMediaGroupSetupMetricDispatcher)initWithDataSource:(id)a3 logEventSubmitter:(id)a4 currentUpTicksFactory:(id)a5 submissionTimerFactory:(id)a6;
- (HMDMediaGroupSetupMetricDispatcherDataSource)dataSource;
- (HMFTimer)submissionTimer;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSUUID)activeGroupIdentifier;
- (NSUUID)setupSessionIdentifier;
- (id)currentUpTicksFactory;
- (id)setupLatencyLogEvent:(unint64_t)a3 groupIdentifier:(id)a4 isController:(BOOL)a5 isPrimaryResident:(BOOL)a6 totalDuration:(unint64_t)a7 setupSessionIdentifier:(id)a8 totalDurationSinceSetupSessionStart:(unint64_t)a9 errorStage:(id)a10;
- (id)submissionTimerFactory;
- (unint64_t)metricType;
- (unint64_t)requestCommittedTimeMS;
- (unint64_t)requestReceivedTimeMS;
- (unint64_t)setupSessionStartTimeMS;
- (void)_resetActiveTracking;
- (void)_submitLogEvent:(id)a3 error:(id)a4;
- (void)_submitLogEventWithTotalDuration:(unint64_t)a3 totalDurationSinceSetupSessionStart:(unint64_t)a4 error:(id)a5;
- (void)markRequestCommittedForGroupIdentifier:(id)a3 metricType:(unint64_t)a4 error:(id)a5;
- (void)markRequestReceivedForGroupIdentifier:(id)a3 metricType:(unint64_t)a4 setupSessionIdentifier:(id)a5 setupSessionStartTimeMS:(unint64_t)a6;
- (void)setActiveGroupIdentifier:(id)a3;
- (void)setSubmissionTimer:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDMediaGroupSetupMetricDispatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionTimer, 0);
  objc_storeStrong((id *)&self->_activeGroupIdentifier, 0);
  objc_storeStrong(&self->_submissionTimerFactory, 0);
  objc_destroyWeak((id *)&self->_logEventSubmitter);
  objc_storeStrong(&self->_currentUpTicksFactory, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_setupSessionIdentifier, 0);
}

- (void)setSubmissionTimer:(id)a3
{
}

- (HMFTimer)submissionTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setActiveGroupIdentifier:(id)a3
{
}

- (NSUUID)activeGroupIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (id)submissionTimerFactory
{
  return objc_getProperty(self, a2, 80, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logEventSubmitter);
  return (HMMLogEventSubmitting *)WeakRetained;
}

- (id)currentUpTicksFactory
{
  return objc_getProperty(self, a2, 64, 1);
}

- (unint64_t)metricType
{
  return self->_metricType;
}

- (HMDMediaGroupSetupMetricDispatcherDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaGroupSetupMetricDispatcherDataSource *)WeakRetained;
}

- (unint64_t)setupSessionStartTimeMS
{
  return self->_setupSessionStartTimeMS;
}

- (NSUUID)setupSessionIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)requestCommittedTimeMS
{
  return self->_requestCommittedTimeMS;
}

- (unint64_t)requestReceivedTimeMS
{
  return self->_requestReceivedTimeMS;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(HMDMediaGroupSetupMetricDispatcher *)self activeGroupIdentifier];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:13 reason:@"Timeout in getting commited group"];
    v8 = [(HMDMediaGroupSetupMetricDispatcher *)self currentUpTicksFactory];
    unint64_t v9 = v8[2]();

    unint64_t requestReceivedTimeMS = self->_requestReceivedTimeMS;
    if (v9 <= requestReceivedTimeMS || requestReceivedTimeMS == 0) {
      unint64_t v12 = 0;
    }
    else {
      unint64_t v12 = v9 - requestReceivedTimeMS;
    }
    if (self->_setupSessionIdentifier) {
      unint64_t v13 = v9 - self->_setupSessionStartTimeMS;
    }
    else {
      unint64_t v13 = 0;
    }
    v18 = (void *)MEMORY[0x1D9452090]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      int v22 = 138543874;
      v23 = v21;
      __int16 v24 = 2048;
      unint64_t v25 = v12;
      __int16 v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Timer fired, submitting log event with duration: %llu error: %@", (uint8_t *)&v22, 0x20u);
    }
    [(HMDMediaGroupSetupMetricDispatcher *)v19 _submitLogEventWithTotalDuration:v12 totalDurationSinceSetupSessionStart:v13 error:v7];
    [(HMDMediaGroupSetupMetricDispatcher *)v19 _resetActiveTracking];
  }
  else
  {
    v14 = (void *)MEMORY[0x1D9452090]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      int v22 = 138543362;
      v23 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Timer fired but no active metric type being tracked.", (uint8_t *)&v22, 0xCu);
    }
    [(HMDMediaGroupSetupMetricDispatcher *)v15 _resetActiveTracking];
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)setupLatencyLogEvent:(unint64_t)a3 groupIdentifier:(id)a4 isController:(BOOL)a5 isPrimaryResident:(BOOL)a6 totalDuration:(unint64_t)a7 setupSessionIdentifier:(id)a8 totalDurationSinceSetupSessionStart:(unint64_t)a9 errorStage:(id)a10
{
  BOOL v12 = a6;
  BOOL v13 = a5;
  id v16 = a10;
  id v17 = a8;
  id v18 = a4;
  v19 = [HMDMediaGroupSetupLatencyLogEvent alloc];
  if (a3 - 1 > 3) {
    v20 = @"Unknown Metric Type";
  }
  else {
    v20 = off_1E6A0E7E8[a3 - 1];
  }
  v21 = @"Unknown Role";
  if (v12) {
    v21 = @"Primary Resident";
  }
  if (v13) {
    int v22 = @"Controller";
  }
  else {
    int v22 = v21;
  }
  v23 = [v18 UUIDString];

  __int16 v24 = [v17 UUIDString];

  unint64_t v25 = [(HMDMediaGroupSetupLatencyLogEvent *)v19 initWithRequestType:v20 systemUUID:v23 deviceRole:v22 totalDurationMS:a7 setupSessionIdentifier:v24 totalDurationSinceAccessorySetupStartMS:a9 errorStage:v16];
  return v25;
}

- (void)_submitLogEvent:(id)a3 error:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v8 = (void *)MEMORY[0x1D9452090]();
  unint64_t v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    BOOL v12 = [v6 coreAnalyticsEventDictionary];
    int v14 = 138543618;
    v15 = v11;
    __int16 v16 = 2112;
    id v17 = v12;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Submitting log event: %@", (uint8_t *)&v14, 0x16u);
  }
  BOOL v13 = [(HMDMediaGroupSetupMetricDispatcher *)v9 logEventSubmitter];
  [v13 submitLogEvent:v6 error:v7];
}

- (void)_submitLogEventWithTotalDuration:(unint64_t)a3 totalDurationSinceSetupSessionStart:(unint64_t)a4 error:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  unint64_t v9 = [(HMDMediaGroupSetupMetricDispatcher *)self dataSource];
  v10 = (void *)MEMORY[0x1D9452090]();
  v11 = self;
  BOOL v12 = HMFGetOSLogHandle();
  BOOL v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v23 = v14;
      __int16 v24 = 2048;
      unint64_t v25 = a3;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Submitting log event: %llu error: %@", buf, 0x20u);
    }
    uint64_t v15 = [v9 isCurrentDeviceIOSDevice];
    uint64_t v16 = [v9 isPrimaryResidentDevice];
    uint64_t v17 = [(HMDMediaGroupSetupMetricDispatcher *)v11 metricType];
    uint64_t v18 = [(HMDMediaGroupSetupMetricDispatcher *)v11 activeGroupIdentifier];
    v19 = [(HMDMediaGroupSetupMetricDispatcher *)v11 setupSessionIdentifier];
    v20 = [(HMDMediaGroupSetupMetricDispatcher *)v11 setupLatencyLogEvent:v17 groupIdentifier:v18 isController:v15 isPrimaryResident:v16 totalDuration:a3 setupSessionIdentifier:v19 totalDurationSinceSetupSessionStart:a4 errorStage:@"Committed Group"];

    [(HMDMediaGroupSetupMetricDispatcher *)v11 _submitLogEvent:v20 error:v8];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v23 = v21;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get data source for metric event submission", buf, 0xCu);
    }
    [(HMDMediaGroupSetupMetricDispatcher *)v11 _resetActiveTracking];
  }
}

- (void)markRequestCommittedForGroupIdentifier:(id)a3 metricType:(unint64_t)a4 error:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (a4)
  {
    os_unfair_lock_lock_with_options();
    activeGroupIdentifier = self->_activeGroupIdentifier;
    if (activeGroupIdentifier)
    {
      if ([(NSUUID *)activeGroupIdentifier hmf_isEqualToUUID:v8])
      {
        unint64_t metricType = self->_metricType;
        BOOL v12 = (void *)MEMORY[0x1D9452090]();
        BOOL v13 = self;
        if (metricType == a4)
        {
          HMFGetOSLogHandle();
          int v14 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            uint64_t v15 = HMFGetLogIdentifier();
            uint64_t v16 = (void *)v15;
            uint64_t v17 = self->_activeGroupIdentifier;
            if (a4 > 4) {
              uint64_t v18 = @"Unknown Metric Type";
            }
            else {
              uint64_t v18 = off_1E6A0E7E8[a4 - 1];
            }
            int v44 = 138543874;
            uint64_t v45 = v15;
            __int16 v46 = 2112;
            id v47 = v17;
            __int16 v48 = 2112;
            v49 = v18;
            _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Request committed for group identifier %@ metric type: %@", (uint8_t *)&v44, 0x20u);
          }
          v36 = [(HMDMediaGroupSetupMetricDispatcher *)v13 currentUpTicksFactory];
          v13->_unint64_t requestCommittedTimeMS = v36[2]();

          unint64_t requestReceivedTimeMS = v13->_requestReceivedTimeMS;
          if (requestReceivedTimeMS)
          {
            unint64_t requestCommittedTimeMS = v13->_requestCommittedTimeMS;
            BOOL v39 = requestCommittedTimeMS >= requestReceivedTimeMS;
            unint64_t v40 = requestCommittedTimeMS - requestReceivedTimeMS;
            if (v39) {
              unint64_t v41 = v40;
            }
            else {
              unint64_t v41 = 0;
            }
          }
          else
          {
            unint64_t v41 = 0;
          }
          if (v13->_setupSessionIdentifier) {
            unint64_t v42 = v13->_requestCommittedTimeMS - v13->_setupSessionStartTimeMS;
          }
          else {
            unint64_t v42 = 0;
          }
          [(HMDMediaGroupSetupMetricDispatcher *)v13 _submitLogEventWithTotalDuration:v41 totalDurationSinceSetupSessionStart:v42 error:v9];
          [(HMDMediaGroupSetupMetricDispatcher *)v13 _resetActiveTracking];
          goto LABEL_38;
        }
        HMFGetOSLogHandle();
        __int16 v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          uint64_t v32 = HMFGetLogIdentifier();
          v33 = (void *)v32;
          unint64_t v34 = self->_metricType - 1;
          if (v34 > 3) {
            v35 = @"Unknown Metric Type";
          }
          else {
            v35 = off_1E6A0E7E8[v34];
          }
          if (a4 > 4) {
            v43 = @"Unknown Metric Type";
          }
          else {
            v43 = off_1E6A0E7E8[a4 - 1];
          }
          int v44 = 138543874;
          uint64_t v45 = v32;
          __int16 v46 = 2112;
          id v47 = v35;
          __int16 v48 = 2112;
          v49 = v43;
          _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Dispatcher is tracking metric type %@ but ask to mark metric type %@", (uint8_t *)&v44, 0x20u);
        }
      }
      else
      {
        BOOL v12 = (void *)MEMORY[0x1D9452090]();
        v29 = self;
        HMFGetOSLogHandle();
        __int16 v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v30 = HMFGetLogIdentifier();
          v31 = self->_activeGroupIdentifier;
          int v44 = 138543874;
          uint64_t v45 = (uint64_t)v30;
          __int16 v46 = 2112;
          id v47 = v8;
          __int16 v48 = 2112;
          v49 = v31;
          _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Tracking different group identifier: %@ active group identifier: %@", (uint8_t *)&v44, 0x20u);
        }
      }
    }
    else
    {
      BOOL v12 = (void *)MEMORY[0x1D9452090]();
      v23 = self;
      HMFGetOSLogHandle();
      __int16 v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        __int16 v26 = (void *)v25;
        unint64_t v27 = v23->_metricType - 1;
        if (v27 > 3) {
          uint64_t v28 = @"Unknown Metric Type";
        }
        else {
          uint64_t v28 = off_1E6A0E7E8[v27];
        }
        int v44 = 138543618;
        uint64_t v45 = v25;
        __int16 v46 = 2112;
        id v47 = v28;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@No active setup tracking for metric type: %@", (uint8_t *)&v44, 0x16u);
      }
    }

LABEL_38:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_39;
  }
  v19 = (void *)MEMORY[0x1D9452090]();
  v20 = self;
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    int v22 = HMFGetLogIdentifier();
    int v44 = 138543362;
    uint64_t v45 = (uint64_t)v22;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Dispatcher cannot track unknown metric type for committed request", (uint8_t *)&v44, 0xCu);
  }
LABEL_39:
}

- (void)markRequestReceivedForGroupIdentifier:(id)a3 metricType:(unint64_t)a4 setupSessionIdentifier:(id)a5 setupSessionStartTimeMS:(unint64_t)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v11 = a5;
  if (a4)
  {
    uint64_t v12 = os_unfair_lock_lock_with_options();
    if (self->_activeGroupIdentifier)
    {
      BOOL v13 = (void *)MEMORY[0x1D9452090](v12);
      int v14 = self;
      HMFGetOSLogHandle();
      uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        uint64_t v17 = (void *)v16;
        activeGroupIdentifier = self->_activeGroupIdentifier;
        unint64_t v19 = v14->_metricType - 1;
        if (v19 > 3) {
          v20 = @"Unknown Metric Type";
        }
        else {
          v20 = off_1E6A0E7E8[v19];
        }
        *(_DWORD *)buf = 138543874;
        uint64_t v48 = v16;
        __int16 v49 = 2112;
        id v50 = activeGroupIdentifier;
        __int16 v51 = 2112;
        v52 = v20;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Already has active setup tracking for metric identifier: %@ group type: %@", buf, 0x20u);
      }
    }
    else
    {
      unint64_t metricType = self->_metricType;
      BOOL v13 = (void *)MEMORY[0x1D9452090](v12);
      __int16 v26 = self;
      if (!metricType)
      {
        HMFGetOSLogHandle();
        v31 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          uint64_t v32 = HMFGetLogIdentifier();
          if (a4 > 4) {
            v33 = @"Unknown Metric Type";
          }
          else {
            v33 = off_1E6A0E7E8[a4 - 1];
          }
          *(_DWORD *)buf = 138544386;
          uint64_t v48 = v32;
          __int16 v49 = 2112;
          id v50 = v46;
          __int16 v51 = 2112;
          v52 = v33;
          __int16 v53 = 2112;
          id v54 = v11;
          __int16 v55 = 2048;
          unint64_t v56 = a6;
          uint64_t v45 = (void *)v32;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Request received for group identifier %@ metric type: %@ session identifier: %@ setup start time: %llu", buf, 0x34u);
        }
        submissionTimer = v26->_submissionTimer;
        if (submissionTimer)
        {
          [(HMFTimer *)submissionTimer suspend];
          v35 = v26->_submissionTimer;
          v26->_submissionTimer = 0;

          context = (void *)MEMORY[0x1D9452090]();
          v36 = v26;
          HMFGetOSLogHandle();
          v37 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            uint64_t v38 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v48 = v38;
            v43 = (void *)v38;
            _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Resetting the submission timer", buf, 0xCu);
          }
        }
        objc_storeStrong((id *)&self->_activeGroupIdentifier, a3);
        self->_unint64_t metricType = a4;
        BOOL v39 = [(HMDMediaGroupSetupMetricDispatcher *)v26 currentUpTicksFactory];
        v26->_unint64_t requestReceivedTimeMS = v39[2]();

        if (v11)
        {
          objc_storeStrong((id *)&v26->_setupSessionIdentifier, a5);
          v26->_setupSessionStartTimeMS = a6;
        }
        unint64_t v40 = [(HMDMediaGroupSetupMetricDispatcher *)v26 submissionTimerFactory];
        uint64_t v41 = v40[2]();
        unint64_t v42 = v26->_submissionTimer;
        v26->_submissionTimer = (HMFTimer *)v41;

        [(HMFTimer *)v26->_submissionTimer setDelegate:v26];
        [(HMFTimer *)v26->_submissionTimer resume];
        goto LABEL_21;
      }
      HMFGetOSLogHandle();
      uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        uint64_t v28 = (void *)v27;
        unint64_t v29 = self->_metricType - 1;
        if (v29 > 3) {
          v30 = @"Unknown Metric Type";
        }
        else {
          v30 = off_1E6A0E7E8[v29];
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v48 = v27;
        __int16 v49 = 2112;
        id v50 = v30;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Dispatcher already tracking metric type: %@", buf, 0x16u);
      }
    }

LABEL_21:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_22;
  }
  v21 = (void *)MEMORY[0x1D9452090]();
  int v22 = self;
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    __int16 v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v48 = (uint64_t)v24;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Dispatcher cannot track unknown metric type for request", buf, 0xCu);
  }
LABEL_22:
}

- (void)_resetActiveTracking
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    activeGroupIdentifier = v4->_activeGroupIdentifier;
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    int v14 = activeGroupIdentifier;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Reset active tracking for group identifier: %@", (uint8_t *)&v11, 0x16u);
  }
  v4->_unint64_t metricType = 0;
  id v8 = v4->_activeGroupIdentifier;
  v4->_activeGroupIdentifier = 0;

  v4->_unint64_t requestReceivedTimeMS = 0;
  v4->_unint64_t requestCommittedTimeMS = 0;
  submissionTimer = v4->_submissionTimer;
  v4->_submissionTimer = 0;

  setupSessionIdentifier = v4->_setupSessionIdentifier;
  v4->_setupSessionIdentifier = 0;

  v4->_setupSessionStartTimeMS = 0;
}

- (HMDMediaGroupSetupMetricDispatcher)initWithDataSource:(id)a3 logEventSubmitter:(id)a4
{
  return [(HMDMediaGroupSetupMetricDispatcher *)self initWithDataSource:a3 logEventSubmitter:a4 currentUpTicksFactory:&__block_literal_global_94737 submissionTimerFactory:&__block_literal_global_25_94738];
}

id __75__HMDMediaGroupSetupMetricDispatcher_initWithDataSource_logEventSubmitter___block_invoke_2()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:8 options:900.0];
  return v0;
}

__uint64_t __75__HMDMediaGroupSetupMetricDispatcher_initWithDataSource_logEventSubmitter___block_invoke()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0xF4240;
}

- (HMDMediaGroupSetupMetricDispatcher)initWithDataSource:(id)a3 logEventSubmitter:(id)a4 currentUpTicksFactory:(id)a5 submissionTimerFactory:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDMediaGroupSetupMetricDispatcher;
  int v14 = [(HMDMediaGroupSetupMetricDispatcher *)&v21 init];
  uint64_t v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v14->_dataSource, v10);
    v15->_unint64_t metricType = 0;
    uint64_t v16 = _Block_copy(v12);
    id currentUpTicksFactory = v15->_currentUpTicksFactory;
    v15->_id currentUpTicksFactory = v16;

    objc_storeWeak((id *)&v15->_logEventSubmitter, v11);
    uint64_t v18 = _Block_copy(v13);
    id submissionTimerFactory = v15->_submissionTimerFactory;
    v15->_id submissionTimerFactory = v18;
  }
  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_94749 != -1) {
    dispatch_once(&logCategory__hmf_once_t19_94749, &__block_literal_global_36_94750);
  }
  v2 = (void *)logCategory__hmf_once_v20_94751;
  return v2;
}

uint64_t __49__HMDMediaGroupSetupMetricDispatcher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v20_94751;
  logCategory__hmf_once_v20_94751 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end