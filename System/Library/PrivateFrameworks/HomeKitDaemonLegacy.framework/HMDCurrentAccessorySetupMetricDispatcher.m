@interface HMDCurrentAccessorySetupMetricDispatcher
+ (id)homepodSetupLogEventFromProtoSetupInfo:(id)a3;
+ (id)logCategory;
+ (id)readLastAccessorySetupInfo:(id)a3;
+ (id)readSetupLogEventFromUserDefaults:(id)a3;
+ (void)removeLastAccessorySetupInfoFromUserDefaults:(id)a3;
+ (void)saveSetupLogEventIntoUserDefaults:(id)a3 setupLogEvent:(id)a4;
- (BOOL)allStagesSubmitted;
- (HMDCurrentAccessorySetupMetricDispatcher)initWithDataSource:(id)a3 setupLogEvent:(id)a4 logEventSubmitter:(id)a5;
- (HMDCurrentAccessorySetupMetricDispatcher)initWithDataSource:(id)a3 setupLogEvent:(id)a4 logEventSubmitter:(id)a5 currentUpTicksFactory:(id)a6 submissionTimerFactory:(id)a7 userDefaults:(id)a8;
- (HMFTimer)submissionTimer;
- (id)_findFirstNonCommunicationErrorIn:(uint64_t)a1 depth:(void *)a2 maxDepth:(uint64_t)a3;
- (id)_underlyingErrorByIgnoringCommunicationFailureErrors:(id)a3;
- (id)dataSource;
- (unint64_t)addAccessoryBeginTime;
- (unint64_t)addAccessoryEndTime;
- (unint64_t)hh2SentinelZoneFetchBeginTime;
- (unint64_t)hh2SentinelZoneFetchEndTime;
- (unint64_t)pairingIdentityCreationBeginTime;
- (unint64_t)pairingIdentityCreationEndTime;
- (unint64_t)receiveControllerKeyBeginTime;
- (unint64_t)receiveControllerKeyEndTime;
- (unint64_t)sentUnassociatedMediaAccessoryBeginTime;
- (unint64_t)sentUnassociatedMediaAccessoryEndTime;
- (unint64_t)settingsCreationBeginTime;
- (unint64_t)settingsCreationEndTime;
- (unint64_t)setupSessionCloseBeginTime;
- (unint64_t)setupSessionCloseEndTime;
- (unint64_t)setupSessionOpenBeginTime;
- (unint64_t)setupSessionOpenEndTime;
- (unint64_t)siriReadyBeginTime;
- (unint64_t)siriReadyEndTime;
- (void)_handleErrorAndSaveStage:(uint64_t)a3 stageTime:(void *)a4 stageString:(void *)a5 error:;
- (void)_logWithoutStatesWithPrefix:(void *)a1 stage:(void *)a2 time:(uint64_t)a3;
- (void)_markMetricDispatcherSubmission;
- (void)_recordTotalDuration;
- (void)_shouldEndStage:(void *)a3 error:;
- (void)markControllerHH2Mode:(BOOL)a3 controllerHH2SentinelExists:(BOOL)a4;
- (void)markSetupBeginStage:(unint64_t)a3 error:(id)a4;
- (void)markSetupEndStage:(unint64_t)a3 error:(id)a4;
- (void)setControllerSetupSessionIdentifier:(id)a3;
- (void)setSubmissionTimer:(id)a3;
- (void)startFinalSubmissionTimer;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDCurrentAccessorySetupMetricDispatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionTimer, 0);
  objc_storeStrong((id *)&self->_stageErrorDict, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_setupLogEvent, 0);
  objc_storeStrong(&self->_submissionTimerFactory, 0);
  objc_destroyWeak((id *)&self->_logEventSubmitter);
  objc_storeStrong(&self->_currentUpTicksFactory, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (unint64_t)siriReadyEndTime
{
  return self->_siriReadyEndTime;
}

- (unint64_t)siriReadyBeginTime
{
  return self->_siriReadyBeginTime;
}

- (unint64_t)hh2SentinelZoneFetchEndTime
{
  return self->_hh2SentinelZoneFetchEndTime;
}

- (unint64_t)hh2SentinelZoneFetchBeginTime
{
  return self->_hh2SentinelZoneFetchBeginTime;
}

- (unint64_t)addAccessoryEndTime
{
  return self->_addAccessoryEndTime;
}

- (unint64_t)addAccessoryBeginTime
{
  return self->_addAccessoryBeginTime;
}

- (unint64_t)settingsCreationEndTime
{
  return self->_settingsCreationEndTime;
}

- (unint64_t)settingsCreationBeginTime
{
  return self->_settingsCreationBeginTime;
}

- (unint64_t)pairingIdentityCreationEndTime
{
  return self->_pairingIdentityCreationEndTime;
}

- (unint64_t)pairingIdentityCreationBeginTime
{
  return self->_pairingIdentityCreationBeginTime;
}

- (unint64_t)sentUnassociatedMediaAccessoryEndTime
{
  return self->_sentUnassociatedMediaAccessoryEndTime;
}

- (unint64_t)sentUnassociatedMediaAccessoryBeginTime
{
  return self->_sentUnassociatedMediaAccessoryBeginTime;
}

- (unint64_t)receiveControllerKeyEndTime
{
  return self->_receiveControllerKeyEndTime;
}

- (unint64_t)receiveControllerKeyBeginTime
{
  return self->_receiveControllerKeyBeginTime;
}

- (unint64_t)setupSessionCloseEndTime
{
  return self->_setupSessionCloseEndTime;
}

- (unint64_t)setupSessionCloseBeginTime
{
  return self->_setupSessionCloseBeginTime;
}

- (unint64_t)setupSessionOpenEndTime
{
  return self->_setupSessionOpenEndTime;
}

- (unint64_t)setupSessionOpenBeginTime
{
  return self->_setupSessionOpenBeginTime;
}

- (void)setSubmissionTimer:(id)a3
{
}

- (HMFTimer)submissionTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)allStagesSubmitted
{
  return self->_allStagesSubmitted;
}

- (void)setControllerSetupSessionIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting controller setup session identifier %@ on the log event.", (uint8_t *)&v10, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  v9 = (void *)[v4 copy];
  [(HMDHomePodSetupLatencyLogEvent *)v6->_setupLogEvent setSetupSessionIdentifier:v9];

  os_unfair_lock_unlock(&v6->_lock);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = -[HMDCurrentAccessorySetupMetricDispatcher dataSource]((id *)&self->super.super.isa);
  [(HMDCurrentAccessorySetupMetricDispatcher *)self setSubmissionTimer:0];
  if ([(HMDCurrentAccessorySetupMetricDispatcher *)self allStagesSubmitted])
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v71 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Submission timer fired, but all stages are already submitted.", buf, 0xCu);
    }
LABEL_4:

    [v5 removeCurrentAccessorySetupMetricDispatcherIfNeeded];
    goto LABEL_68;
  }
  if (!self)
  {
LABEL_13:
    v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v14 = self;
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v71 = v15;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Not a valid log event and do not submit", buf, 0xCu);
    }
    goto LABEL_4;
  }
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent sessionSetupOpenMS_HH1] >= 1
    && [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent sessionSetupCloseMS_HH1] >= 1
    && (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent controllerKeyExchangeMS_HH1]|| ![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent newAccessoryTransferMS_HH1]))
  {
    int v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    __int16 v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v71 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Do not submit as this appears to be a device repair session.", buf, 0xCu);
    }
    goto LABEL_13;
  }
  -[HMDHomePodSetupLatencyLogEvent setNetworkAvailable_INT:](self->_setupLogEvent, "setNetworkAvailable_INT:", [v5 hasValidNetwork]);
  -[HMDHomePodSetupLatencyLogEvent setManateeAvailable_INT:](self->_setupLogEvent, "setManateeAvailable_INT:", [v5 hasManatee]);
  -[HMDHomePodSetupLatencyLogEvent setICloudAvailable_INT:](self->_setupLogEvent, "setICloudAvailable_INT:", [v5 isSignedIntoiCloud]);
  -[HMDHomePodSetupLatencyLogEvent setIDSAvailable_INT:](self->_setupLogEvent, "setIDSAvailable_INT:", [v5 isIdsServiceActive]);
  -[HMDHomePodSetupLatencyLogEvent setIDSRegistrationStatus_INT:](self->_setupLogEvent, "setIDSRegistrationStatus_INT:", [v5 IDSAccountRegistrationStatus]);
  -[HMDHomePodSetupLatencyLogEvent setIDSRegistrationError_INT:](self->_setupLogEvent, "setIDSRegistrationError_INT:", [v5 IDSAccountRegistrationError]);
  self->_allStagesSubmitted = 1;
  os_unfair_lock_assert_owner(&self->_lock);
  v16 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"Setup Session Open"];
  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent sessionSetupOpenMS_HH1]
    || [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent sessionSetupOpenMS_HH1] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"Setup Session Open"];
    id v17 = v16;
  }
  else
  {
    id v17 = 0;
  }
  uint64_t v18 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"Controller Key Exchange"];
  v19 = (void *)v18;
  if (v18) {
    v20 = (void *)v18;
  }
  else {
    v20 = v16;
  }
  id v21 = v20;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent controllerKeyExchangeMS_HH1]|| [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent controllerKeyExchangeMS_HH1] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"Controller Key Exchange"];
    id v22 = v21;

    id v17 = v22;
  }
  uint64_t v23 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"New Accessory Transfer"];
  v24 = (void *)v23;
  if (v23) {
    v25 = (void *)v23;
  }
  else {
    v25 = v21;
  }
  id v26 = v25;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent newAccessoryTransferMS_HH1]
    || [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent newAccessoryTransferMS_HH1] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"New Accessory Transfer"];
    id v27 = v26;

    id v17 = v27;
  }
  uint64_t v28 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"Setup Session Close"];
  v29 = (void *)v28;
  if (v28) {
    v30 = (void *)v28;
  }
  else {
    v30 = v26;
  }
  id v31 = v30;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent sessionSetupCloseMS_HH1]
    || [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent sessionSetupCloseMS_HH1] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"Setup Session Close"];
    id v32 = v31;

    id v17 = v32;
  }
  uint64_t v33 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"Settings Creation"];
  v34 = (void *)v33;
  if (v33) {
    v35 = (void *)v33;
  }
  else {
    v35 = v31;
  }
  id v36 = v35;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent settingsCreationMS_HH2]
    || [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent settingsCreationMS_HH2] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"Settings Creation"];
    id v37 = v36;

    id v17 = v37;
  }
  uint64_t v38 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"Pairing Identity Creation"];
  v39 = (void *)v38;
  if (v38) {
    v40 = (void *)v38;
  }
  else {
    v40 = v36;
  }
  id v41 = v40;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent pairingIdentityCreationMS_HH2]|| [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent pairingIdentityCreationMS_HH2] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"Pairing Identity Creation"];
    id v42 = v41;

    id v17 = v42;
  }
  uint64_t v43 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"Accessory Add"];
  v44 = (void *)v43;
  if (v43) {
    v45 = (void *)v43;
  }
  else {
    v45 = v41;
  }
  id v46 = v45;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent accessoryAddMS_HH2]
    || [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent accessoryAddMS_HH2] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"Accessory Add"];
    id v47 = v46;

    id v17 = v47;
  }
  uint64_t v48 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"Siri Home Automation Ready"];
  v49 = (void *)v48;
  if (v48) {
    v50 = (void *)v48;
  }
  else {
    v50 = v46;
  }
  id v51 = v50;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent siriReadyMS_HH2]
    || [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent siriReadyMS_HH2] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"Siri Home Automation Ready"];
    id v52 = v51;

    id v17 = v52;
  }

  if (!v17)
  {
    id v17 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:13];
  }
  [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setSavedEventState:3];
  -[HMDCurrentAccessorySetupMetricDispatcher _recordTotalDuration]((uint64_t)self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logEventSubmitter);
  [WeakRetained submitLogEvent:self->_setupLogEvent error:v17];

  v54 = (void *)MEMORY[0x1D9452090]();
  v55 = self;
  HMFGetOSLogHandle();
  v56 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    v58 = [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent coreAnalyticsEventDictionary];
    *(_DWORD *)buf = 138543874;
    id v71 = v57;
    __int16 v72 = 2112;
    v73 = v58;
    __int16 v74 = 2112;
    id v75 = v17;
    _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_INFO, "%{public}@Submission timer fired and submitting the final metric log event: %@ with error %@", buf, 0x20u);
  }
  v59 = objc_opt_class();
  id v61 = objc_getProperty(v55, v60, 56, 1);
  id v63 = objc_getProperty(v55, v62, 48, 1);
  [v59 saveSetupLogEventIntoUserDefaults:v61 setupLogEvent:v63];

  [(HMDCurrentAccessorySetupMetricDispatcher *)v55 _markMetricDispatcherSubmission];
  v65 = (void *)MEMORY[0x1D9452090]();
  v66 = v55;
  HMFGetOSLogHandle();
  v67 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
  {
    v68 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v71 = v68;
    _os_log_impl(&dword_1D49D5000, v67, OS_LOG_TYPE_INFO, "%{public}@Log event submitted during timeout, removing the metric dispatcher", buf, 0xCu);
  }
  [v5 removeCurrentAccessorySetupMetricDispatcherIfNeeded];

LABEL_68:
  os_unfair_lock_unlock(p_lock);
}

- (id)dataSource
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 2);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)_recordTotalDuration
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    Property = (uint64_t (**)(void))objc_getProperty((id)a1, v2, 24, 1);
    unint64_t v4 = Property[2]();
    unint64_t v5 = *(void *)(a1 + 80);
    if (v4 <= v5 || v5 == 0) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = v4 - v5;
    }
    v8 = (void *)MEMORY[0x1D9452090](objc_msgSend(*(id *)(a1 + 48), "setTotalDurationMS_HH1:", v7));
    v9 = (id *)(id)a1;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      uint64_t v12 = objc_msgSend(v9[6], "totalDurationMS_HH1");
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2048;
      uint64_t v16 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Total duration for HH1: %llu", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)_markMetricDispatcherSubmission
{
  if (a1)
  {
    Property = (uint64_t (**)(void))objc_getProperty(a1, a2, 24, 1);
    uint64_t v4 = Property[2]();
    -[HMDCurrentAccessorySetupMetricDispatcher _logWithoutStatesWithPrefix:stage:time:](a1, @"End stage", v4);
  }
}

- (void)_logWithoutStatesWithPrefix:(void *)a1 stage:(void *)a2 time:(uint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = (void *)MEMORY[0x1D9452090](@"Setup In HH1");
  id v7 = a1;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v10 = HMFBooleanToString();
    int v11 = 138544386;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = @"Setup In HH1";
    __int16 v17 = 2048;
    uint64_t v18 = a3;
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@%@: %@, time: %llu, HH2 mode: %@.", (uint8_t *)&v11, 0x34u);
  }
}

- (id)_underlyingErrorByIgnoringCommunicationFailureErrors:(id)a3
{
  id v4 = a3;
  id v5 = -[HMDCurrentAccessorySetupMetricDispatcher _findFirstNonCommunicationErrorIn:depth:maxDepth:]((uint64_t)self, v4, 0);
  v6 = v5;
  if (!v5) {
    id v5 = v4;
  }
  id v7 = v5;

  return v7;
}

- (id)_findFirstNonCommunicationErrorIn:(uint64_t)a1 depth:(void *)a2 maxDepth:(uint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (v5 && a3 < 6 && ([v5 code] == 54 || objc_msgSend(v6, "code") == 3203))
    {
      [v6 underlyingErrors];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        uint64_t v11 = a3 + 1;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v13 = -[HMDCurrentAccessorySetupMetricDispatcher _findFirstNonCommunicationErrorIn:depth:maxDepth:](a1, *(void *)(*((void *)&v16 + 1) + 8 * i), v11);
            if (v13)
            {
              id v14 = (id)v13;
              goto LABEL_17;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
      id v14 = 0;
LABEL_17:
    }
    else
    {
      id v14 = v6;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)startFinalSubmissionTimer
{
  SEL v2 = self;
  if (self) {
    self = (HMDCurrentAccessorySetupMetricDispatcher *)objc_getProperty(self, a2, 40, 1);
  }
  v3 = ((void (*)(HMDCurrentAccessorySetupMetricDispatcher *, SEL))self->_dataSource)(self, a2);
  [(HMDCurrentAccessorySetupMetricDispatcher *)v2 setSubmissionTimer:v3];

  id v4 = [(HMDCurrentAccessorySetupMetricDispatcher *)v2 submissionTimer];
  [v4 setDelegate:v2];

  id v5 = [(HMDCurrentAccessorySetupMetricDispatcher *)v2 submissionTimer];
  [v5 resume];
}

- (void)markControllerHH2Mode:(BOOL)a3 controllerHH2SentinelExists:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setControllerInHH2_INT:v5];
  [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setControllerHasSentinelZone_INT:v4];
  os_unfair_lock_unlock(p_lock);
}

- (void)markSetupEndStage:(unint64_t)a3 error:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v6 = (__CFString *)a4;
  id v7 = (void *)MEMORY[0x1D9452090]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = (void *)v10;
    if (a3 - 1 > 8) {
      uint64_t v12 = @"Unknown Setup Stage";
    }
    else {
      uint64_t v12 = off_1E6A148F0[a3 - 1];
    }
    int v39 = 138543874;
    uint64_t v40 = v10;
    __int16 v41 = 2112;
    id v42 = v12;
    __int16 v43 = 2112;
    v44 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Mark end stage: %@ error: %@", (uint8_t *)&v39, 0x20u);
  }
  switch(a3)
  {
    case 0uLL:
      uint64_t v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = v8;
      __int16 v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        long long v16 = HMFGetLogIdentifier();
        int v39 = 138543618;
        uint64_t v40 = (uint64_t)v16;
        __int16 v41 = 2112;
        id v42 = v6;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unknown setup stage with error: %@", (uint8_t *)&v39, 0x16u);
      }
      break;
    case 1uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_setupSessionOpenBeginTime && !v8->_setupSessionOpenEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"Setup Session Open", v17);
          long long v19 = (uint64_t (**)(void))objc_getProperty(v8, v18, 24, 1);
          v8->_setupSessionOpenEndTime = v19[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSessionSetupOpenMS_HH1:v8->_setupSessionOpenEndTime - v8->_setupSessionOpenBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent sessionSetupOpenMS_HH1]) {
            [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSessionSetupOpenMS_HH1:1];
          }
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_setupSessionOpenEndTime, @"Setup Session Open", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_81;
    case 2uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_setupSessionCloseBeginTime && !v8->_setupSessionCloseEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"Setup Session Close", v17);
          uint64_t v21 = (uint64_t (**)(void))objc_getProperty(v8, v20, 24, 1);
          v8->_setupSessionCloseEndTime = v21[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSessionSetupCloseMS_HH1:v8->_setupSessionCloseEndTime - v8->_setupSessionCloseBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent sessionSetupCloseMS_HH1]) {
            [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSessionSetupCloseMS_HH1:1];
          }
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_setupSessionCloseEndTime, @"Setup Session Close", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_81;
    case 3uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_receiveControllerKeyBeginTime && !v8->_receiveControllerKeyEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"Controller Key Exchange", v17);
          uint64_t v23 = (uint64_t (**)(void))objc_getProperty(v8, v22, 24, 1);
          v8->_receiveControllerKeyEndTime = v23[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setControllerKeyExchangeMS_HH1:v8->_receiveControllerKeyEndTime - v8->_receiveControllerKeyBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent sessionSetupCloseMS_HH1]) {
            [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSessionSetupCloseMS_HH1:1];
          }
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_receiveControllerKeyEndTime, @"Controller Key Exchange", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_81;
    case 4uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_sentUnassociatedMediaAccessoryBeginTime && !v8->_sentUnassociatedMediaAccessoryEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"New Accessory Transfer", v17);
          v25 = (uint64_t (**)(void))objc_getProperty(v8, v24, 24, 1);
          v8->_sentUnassociatedMediaAccessoryEndTime = v25[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setNewAccessoryTransferMS_HH1:v8->_sentUnassociatedMediaAccessoryEndTime - v8->_sentUnassociatedMediaAccessoryBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent newAccessoryTransferMS_HH1])[(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setNewAccessoryTransferMS_HH1:1]; {
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_sentUnassociatedMediaAccessoryEndTime, @"New Accessory Transfer", v17);
          }
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_81;
    case 5uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_settingsCreationBeginTime && !v8->_settingsCreationEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"Settings Creation", v17);
          id v27 = (uint64_t (**)(void))objc_getProperty(v8, v26, 24, 1);
          v8->_settingsCreationEndTime = v27[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSettingsCreationMS_HH2:v8->_settingsCreationEndTime - v8->_settingsCreationBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent settingsCreationMS_HH2]) {
            [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSettingsCreationMS_HH2:1];
          }
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_settingsCreationEndTime, @"Settings Creation", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_81;
    case 6uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_pairingIdentityCreationBeginTime && !v8->_pairingIdentityCreationEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"Pairing Identity Creation", v17);
          v29 = (uint64_t (**)(void))objc_getProperty(v8, v28, 24, 1);
          v8->_pairingIdentityCreationEndTime = v29[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setPairingIdentityCreationMS_HH2:v8->_pairingIdentityCreationEndTime - v8->_pairingIdentityCreationBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent pairingIdentityCreationMS_HH2])[(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setPairingIdentityCreationMS_HH2:1]; {
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_pairingIdentityCreationEndTime, @"Pairing Identity Creation", v17);
          }
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_81;
    case 7uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_addAccessoryBeginTime && !v8->_addAccessoryEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"Accessory Add", v17);
          id v31 = (uint64_t (**)(void))objc_getProperty(v8, v30, 24, 1);
          v8->_addAccessoryEndTime = v31[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setAccessoryAddMS_HH2:v8->_addAccessoryEndTime - v8->_addAccessoryBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent accessoryAddMS_HH2]) {
            [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setAccessoryAddMS_HH2:1];
          }
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_addAccessoryEndTime, @"Accessory Add", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_81;
    case 8uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_siriReadyBeginTime && !v8->_siriReadyEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"Siri Home Automation Ready", v17);
          uint64_t v33 = (uint64_t (**)(void))objc_getProperty(v8, v32, 24, 1);
          v8->_siriReadyEndTime = v33[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSiriReadyMS_HH2:v8->_siriReadyEndTime - v8->_siriReadyBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent siriReadyMS_HH2]) {
            [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSiriReadyMS_HH2:1];
          }
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_siriReadyEndTime, @"Siri Home Automation Ready", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_81;
    case 9uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_hh2SentinelZoneFetchBeginTime && !v8->_hh2SentinelZoneFetchEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"HH2 sentinel zone fetched", v17);
          v35 = (uint64_t (**)(void))objc_getProperty(v8, v34, 24, 1);
          v8->_hh2SentinelZoneFetchEndTime = v35[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSentinelZoneFetchMS_HH1:v8->_hh2SentinelZoneFetchEndTime - v8->_hh2SentinelZoneFetchBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent sentinelZoneFetchMS_HH1]) {
            [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSentinelZoneFetchMS_HH1:1];
          }
          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSavedEventState:1];
          -[HMDCurrentAccessorySetupMetricDispatcher _recordTotalDuration]((uint64_t)v8);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_hh2SentinelZoneFetchEndTime, @"HH2 sentinel zone fetched", v17);
          id v37 = (uint64_t (**)(void))objc_getProperty(v8, v36, 24, 1);
          uint64_t v38 = v37[2]();
          -[HMDCurrentAccessorySetupMetricDispatcher _logWithoutStatesWithPrefix:stage:time:](v8, @"End stage", v38);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
LABEL_81:

      break;
    default:
      break;
  }
}

- (void)_shouldEndStage:(void *)a3 error:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = (id *)(id)a1;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v18 = 138543874;
      long long v19 = v10;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Save error %@ for stage %@", (uint8_t *)&v18, 0x20u);
    }
    uint64_t v11 = (void *)[v6 copy];
    [v8[8] setObject:v11 forKeyedSubscript:v5];
  }
  else
  {
    uint64_t v12 = [*(id *)(a1 + 64) objectForKeyedSubscript:v5];

    if (v12)
    {
      uint64_t v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = (id *)(id)a1;
      __int16 v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        long long v16 = HMFGetLogIdentifier();
        long long v17 = [v14[8] objectForKeyedSubscript:v5];
        int v18 = 138543874;
        long long v19 = v16;
        __int16 v20 = 2112;
        id v21 = v5;
        __int16 v22 = 2112;
        id v23 = v17;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Clear stage %@ with previously saved error %@", (uint8_t *)&v18, 0x20u);
      }
      [v14[8] removeObjectForKey:v5];
    }
  }
}

- (void)_handleErrorAndSaveStage:(uint64_t)a3 stageTime:(void *)a4 stageString:(void *)a5 error:
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  if (v9)
  {
    [*(id *)(a1 + 48) setError:v9];
    objc_msgSend(*(id *)(a1 + 48), "setErrorStage_String:", v8);
LABEL_4:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    goto LABEL_5;
  }
  if (a1) {
    goto LABEL_4;
  }
  id WeakRetained = 0;
LABEL_5:
  objc_msgSend(*(id *)(a1 + 48), "setNetworkAvailable_INT:", objc_msgSend(WeakRetained, "hasValidNetwork"));
  objc_msgSend(*(id *)(a1 + 48), "setManateeAvailable_INT:", objc_msgSend(WeakRetained, "hasManatee"));
  objc_msgSend(*(id *)(a1 + 48), "setICloudAvailable_INT:", objc_msgSend(WeakRetained, "isSignedIntoiCloud"));
  objc_msgSend(*(id *)(a1 + 48), "setIDSAvailable_INT:", objc_msgSend(WeakRetained, "isIdsServiceActive"));
  objc_msgSend(*(id *)(a1 + 48), "setIDSRegistrationStatus_INT:", objc_msgSend(WeakRetained, "IDSAccountRegistrationStatus"));
  v53 = WeakRetained;
  objc_msgSend(*(id *)(a1 + 48), "setIDSRegistrationError_INT:", objc_msgSend(WeakRetained, "IDSAccountRegistrationError"));
  int v51 = a2;
  if (a2) {
    uint64_t v11 = @"End stage";
  }
  else {
    uint64_t v11 = @"Begin stage";
  }
  objc_msgSend(*(id *)(a1 + 48), "networkAvailable_INT");
  objc_msgSend(*(id *)(a1 + 48), "manateeAvailable_INT");
  objc_msgSend(*(id *)(a1 + 48), "iCloudAvailable_INT");
  objc_msgSend(*(id *)(a1 + 48), "IDSAvailable_INT");
  uint64_t v12 = v11;
  uint64_t v13 = (__CFString *)v8;
  id v14 = v9;
  context = (void *)MEMORY[0x1D9452090]();
  id v15 = (id)a1;
  long long v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    long long v17 = v48 = v12;
    HMFBooleanToString();
    v19 = int v18 = v13;
    __int16 v20 = HMFBooleanToString();
    id v21 = HMFBooleanToString();
    __int16 v22 = HMFBooleanToString();
    id v23 = HMFBooleanToString();
    *(_DWORD *)buf = 138545666;
    v55 = v17;
    __int16 v56 = 2112;
    id v57 = v48;
    __int16 v58 = 2112;
    v59 = v18;
    __int16 v60 = 2048;
    uint64_t v61 = a3;
    __int16 v62 = 2112;
    id v63 = v19;
    __int16 v64 = 2112;
    id v65 = v14;
    __int16 v66 = 2112;
    v67 = v20;
    __int16 v68 = 2112;
    id v69 = v21;
    __int16 v70 = 2112;
    id v71 = v22;
    __int16 v72 = 2112;
    v73 = v23;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@%@: %@, time: %llu, HH2 mode: %@, error: %@. Current state info - Network: %@, Manatee: %@, iCloud: %@, IDS: %@.", buf, 0x66u);

    uint64_t v13 = v18;
    uint64_t v12 = v48;
  }

  uint64_t v24 = v14;
  if (v51)
  {
    v25 = v13;
    if (([v15 allStagesSubmitted] & 1) != 0
      || (os_unfair_lock_assert_owner((const os_unfair_lock *)v15 + 2),
          objc_msgSend(*((id *)v15 + 6), "sessionSetupOpenMS_HH1") < 1)
      || objc_msgSend(*((id *)v15 + 6), "controllerKeyExchangeMS_HH1") < 1
      || objc_msgSend(*((id *)v15 + 6), "newAccessoryTransferMS_HH1") < 1
      || objc_msgSend(*((id *)v15 + 6), "sessionSetupCloseMS_HH1") < 1
      || objc_msgSend(*((id *)v15 + 6), "accessoryAddMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "settingsCreationMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "pairingIdentityCreationMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "siriReadyMS_HH2") < 1)
    {
LABEL_35:
      v44 = objc_opt_class();
      id v46 = objc_getProperty(v15, v45, 56, 1);
      objc_msgSend(v44, "saveSetupLogEventIntoUserDefaults:setupLogEvent:", v46, objc_getProperty(v15, v47, 48, 1));

      uint64_t v13 = v25;
      goto LABEL_36;
    }
    -[HMDCurrentAccessorySetupMetricDispatcher _recordTotalDuration]((uint64_t)v15);
    id v26 = objc_loadWeakRetained((id *)v15 + 4);
    [v26 submitLogEvent:*((void *)v15 + 6) error:v14];

    uint64_t v27 = [*((id *)v15 + 6) setSavedEventState:3];
    *((unsigned char *)v15 + 12) = 1;
    SEL v28 = (void *)MEMORY[0x1D9452090](v27);
    id v52 = v15;
    v29 = (id *)v15;
    SEL v30 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
LABEL_32:

      [(HMDCurrentAccessorySetupMetricDispatcher *)v29 _markMetricDispatcherSubmission];
      int v39 = [v29 submissionTimer];
      [v39 suspend];

      uint64_t v40 = (void *)MEMORY[0x1D9452090]([v29 setSubmissionTimer:0]);
      __int16 v41 = v29;
      id v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        __int16 v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v55 = v43;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Log event submitted for all stages, removing the metric dispatcher", buf, 0xCu);
      }
      [v53 removeCurrentAccessorySetupMetricDispatcherIfNeeded];
      id v15 = v52;
      goto LABEL_35;
    }
    id v31 = HMFGetLogIdentifier();
    SEL v32 = [v29[6] coreAnalyticsEventDictionary];
    uint64_t v33 = [v29[6] savedEventState];
    SEL v34 = @"HH1Initial";
    if (v33 > 2)
    {
      if (v33 != 3)
      {
        BOOL v35 = v33 == 0x10000;
        SEL v36 = @"Unknown";
LABEL_26:
        if (v35) {
          SEL v34 = v36;
        }
        goto LABEL_31;
      }
      SEL v34 = @"Submitted";
    }
    else
    {
      if (v33 != 1)
      {
        BOOL v35 = v33 == 2;
        SEL v36 = @"HH2Initial";
        goto LABEL_26;
      }
      SEL v34 = @"HH2SentinelFetched";
    }
LABEL_31:
    id v37 = v34;
    *(_DWORD *)buf = 138543874;
    v55 = v31;
    __int16 v56 = 2112;
    id v57 = v32;
    __int16 v58 = 2112;
    v59 = v37;
    _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@All stages completed and submitted the event: %@ final state: %@", buf, 0x20u);

    goto LABEL_32;
  }
LABEL_36:
}

- (void)markSetupBeginStage:(unint64_t)a3 error:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a4;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = (void *)v10;
    if (a3 - 1 > 8) {
      uint64_t v12 = @"Unknown Setup Stage";
    }
    else {
      uint64_t v12 = off_1E6A148F0[a3 - 1];
    }
    int v36 = 138543874;
    uint64_t v37 = v10;
    __int16 v38 = 2112;
    int v39 = v12;
    __int16 v40 = 2112;
    __int16 v41 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Mark begin stage: %@ error: %@", (uint8_t *)&v36, 0x20u);
  }
  switch(a3)
  {
    case 0uLL:
      uint64_t v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = v8;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        long long v16 = HMFGetLogIdentifier();
        int v36 = 138543618;
        uint64_t v37 = (uint64_t)v16;
        __int16 v38 = 2112;
        int v39 = v6;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unknown setup stage with error: %@", (uint8_t *)&v36, 0x16u);
      }
      break;
    case 1uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_setupSessionOpenBeginTime)
        {
          long long v19 = (uint64_t (**)(void))objc_getProperty(v8, v18, 24, 1);
          v8->_setupSessionOpenBeginTime = v19[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSessionSetupOpenMS_HH1:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_setupSessionOpenBeginTime, @"Setup Session Open", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_54;
    case 2uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_setupSessionCloseBeginTime)
        {
          id v21 = (uint64_t (**)(void))objc_getProperty(v8, v20, 24, 1);
          v8->_setupSessionCloseBeginTime = v21[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSessionSetupCloseMS_HH1:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_setupSessionCloseBeginTime, @"Setup Session Close", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_54;
    case 3uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_receiveControllerKeyBeginTime)
        {
          id v23 = (uint64_t (**)(void))objc_getProperty(v8, v22, 24, 1);
          v8->_receiveControllerKeyBeginTime = v23[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setControllerKeyExchangeMS_HH1:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_receiveControllerKeyBeginTime, @"Controller Key Exchange", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_54;
    case 4uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_sentUnassociatedMediaAccessoryBeginTime)
        {
          v25 = (uint64_t (**)(void))objc_getProperty(v8, v24, 24, 1);
          v8->_sentUnassociatedMediaAccessoryBeginTime = v25[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setNewAccessoryTransferMS_HH1:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_sentUnassociatedMediaAccessoryBeginTime, @"New Accessory Transfer", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_54;
    case 5uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_settingsCreationBeginTime)
        {
          uint64_t v27 = (uint64_t (**)(void))objc_getProperty(v8, v26, 24, 1);
          v8->_settingsCreationBeginTime = v27[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSettingsCreationMS_HH2:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_settingsCreationBeginTime, @"Settings Creation", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_54;
    case 6uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_pairingIdentityCreationBeginTime)
        {
          v29 = (uint64_t (**)(void))objc_getProperty(v8, v28, 24, 1);
          v8->_pairingIdentityCreationBeginTime = v29[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setPairingIdentityCreationMS_HH2:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_pairingIdentityCreationBeginTime, @"Pairing Identity Creation", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_54;
    case 7uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_addAccessoryBeginTime)
        {
          id v31 = (uint64_t (**)(void))objc_getProperty(v8, v30, 24, 1);
          v8->_addAccessoryBeginTime = v31[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setAccessoryAddMS_HH2:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_addAccessoryBeginTime, @"Accessory Add", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_54;
    case 8uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_siriReadyBeginTime)
        {
          uint64_t v33 = (uint64_t (**)(void))objc_getProperty(v8, v32, 24, 1);
          v8->_siriReadyBeginTime = v33[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSiriReadyMS_HH2:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_siriReadyBeginTime, @"Siri Home Automation Ready", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_54;
    case 9uLL:
      long long v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_hh2SentinelZoneFetchBeginTime)
        {
          BOOL v35 = (uint64_t (**)(void))objc_getProperty(v8, v34, 24, 1);
          v8->_hh2SentinelZoneFetchBeginTime = v35[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSentinelZoneFetchMS_HH1:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_hh2SentinelZoneFetchBeginTime, @"HH2 sentinel zone fetched", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
LABEL_54:

      break;
    default:
      break;
  }
}

- (HMDCurrentAccessorySetupMetricDispatcher)initWithDataSource:(id)a3 setupLogEvent:(id)a4 logEventSubmitter:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1CB18];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 standardUserDefaults];
  uint64_t v13 = [(HMDCurrentAccessorySetupMetricDispatcher *)self initWithDataSource:v11 setupLogEvent:v10 logEventSubmitter:v9 currentUpTicksFactory:&__block_literal_global_157408 submissionTimerFactory:&__block_literal_global_67_157409 userDefaults:v12];

  return v13;
}

id __95__HMDCurrentAccessorySetupMetricDispatcher_initWithDataSource_setupLogEvent_logEventSubmitter___block_invoke_2()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:8 options:900.0];
  return v0;
}

__uint64_t __95__HMDCurrentAccessorySetupMetricDispatcher_initWithDataSource_setupLogEvent_logEventSubmitter___block_invoke()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0xF4240;
}

- (HMDCurrentAccessorySetupMetricDispatcher)initWithDataSource:(id)a3 setupLogEvent:(id)a4 logEventSubmitter:(id)a5 currentUpTicksFactory:(id)a6 submissionTimerFactory:(id)a7 userDefaults:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v32.receiver = self;
  v32.super_class = (Class)HMDCurrentAccessorySetupMetricDispatcher;
  __int16 v20 = [(HMDCurrentAccessorySetupMetricDispatcher *)&v32 init];
  id v21 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_dataSource, v14);
    objc_storeStrong((id *)&v21->_setupLogEvent, a4);
    __int16 v22 = _Block_copy(v17);
    id currentUpTicksFactory = v21->_currentUpTicksFactory;
    v21->_id currentUpTicksFactory = v22;

    objc_storeWeak((id *)&v21->_logEventSubmitter, v16);
    uint64_t v24 = _Block_copy(v18);
    id submissionTimerFactory = v21->_submissionTimerFactory;
    v21->_id submissionTimerFactory = v24;

    objc_storeStrong((id *)&v21->_userDefaults, a8);
    v21->_lock._os_unfair_lock_opaque = 0;
    v21->_allStagesSubmitted = 0;
    uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
    stageErrorDict = v21->_stageErrorDict;
    v21->_stageErrorDict = (NSMutableDictionary *)v26;

    Property = (uint64_t (**)(void))objc_getProperty(v21, v28, 24, 1);
    uint64_t v30 = Property[2]();
    -[HMDCurrentAccessorySetupMetricDispatcher _logWithoutStatesWithPrefix:stage:time:](v21, @"Begin stage", v30);
  }

  return v21;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42_157426 != -1) {
    dispatch_once(&logCategory__hmf_once_t42_157426, &__block_literal_global_78_157427);
  }
  SEL v2 = (void *)logCategory__hmf_once_v43_157428;
  return v2;
}

uint64_t __55__HMDCurrentAccessorySetupMetricDispatcher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v43_157428;
  logCategory__hmf_once_v43_157428 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)saveSetupLogEventIntoUserDefaults:(id)a3 setupLogEvent:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F2E560]);
  id v9 = [v7 error];
  id v10 = (void *)[v9 copy];

  objc_msgSend(v8, "setSessionSetupOpenMSHH1:", objc_msgSend(v7, "sessionSetupOpenMS_HH1"));
  objc_msgSend(v8, "setControllerKeyExchangeMSHH1:", objc_msgSend(v7, "controllerKeyExchangeMS_HH1"));
  objc_msgSend(v8, "setNewAccessoryTransferMSHH1:", objc_msgSend(v7, "newAccessoryTransferMS_HH1"));
  objc_msgSend(v8, "setSessionSetupCloseMSHH1:", objc_msgSend(v7, "sessionSetupCloseMS_HH1"));
  objc_msgSend(v8, "setTotalDurationMSHH1:", objc_msgSend(v7, "totalDurationMS_HH1"));
  objc_msgSend(v8, "setSentinelZoneFetchMSHH1:", objc_msgSend(v7, "sentinelZoneFetchMS_HH1"));
  objc_msgSend(v8, "setAccountSettleWaitMSHH2:", objc_msgSend(v7, "accountSettleWaitMS_HH2"));
  objc_msgSend(v8, "setCurrentDeviceIDSWaitMSHH2:", objc_msgSend(v7, "currentDeviceIDSWaitMS_HH2"));
  objc_msgSend(v8, "setHomeManagerReadyMSHH2:", objc_msgSend(v7, "homeManagerReadyMS_HH2"));
  objc_msgSend(v8, "setFirstCoreDataImportMSHH2:", objc_msgSend(v7, "firstCoreDataImportMS_HH2"));
  objc_msgSend(v8, "setAccessoryAddMSHH2:", objc_msgSend(v7, "accessoryAddMS_HH2"));
  objc_msgSend(v8, "setSettingsCreationMSHH2:", objc_msgSend(v7, "settingsCreationMS_HH2"));
  objc_msgSend(v8, "setPairingIdentityCreationMSHH2:", objc_msgSend(v7, "pairingIdentityCreationMS_HH2"));
  objc_msgSend(v8, "setSiriReadyMSHH2:", objc_msgSend(v7, "siriReadyMS_HH2"));
  objc_msgSend(v8, "setEventRouterServerConnectionMSHH2:", objc_msgSend(v7, "eventRouterServerConnectionMS_HH2"));
  objc_msgSend(v8, "setPrimaryResidentElectionMSHH2:", objc_msgSend(v7, "primaryResidentElectionMS_HH2"));
  objc_msgSend(v8, "setEventRouterFirstEventPushMSHH2:", objc_msgSend(v7, "eventRouterFirstEventPushMS_HH2"));
  objc_msgSend(v8, "setTotalDurationMSHH2:", objc_msgSend(v7, "totalDurationMS_HH2"));
  objc_msgSend(v8, "setICloudAvailableINT:", objc_msgSend(v7, "iCloudAvailable_INT"));
  objc_msgSend(v8, "setIDSAvailableINT:", objc_msgSend(v7, "IDSAvailable_INT"));
  objc_msgSend(v8, "setManateeAvailableINT:", objc_msgSend(v7, "manateeAvailable_INT"));
  objc_msgSend(v8, "setNetworkAvailableINT:", objc_msgSend(v7, "networkAvailable_INT"));
  if (objc_msgSend(v7, "controllerInHH2_INT")) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  [v8 setLastKnownControllerHH2Mode:v11];
  objc_msgSend(v8, "setLastKnownControllerSentinelZoneExistence:", objc_msgSend(v7, "controllerHasSentinelZone_INT"));
  if (v10)
  {
    objc_msgSend(v8, "setLastKnownStageErrorCode:", objc_msgSend(v10, "code"));
    uint64_t v12 = [v10 domain];
    [v8 setLastKnownStageErrorDomain:v12];

    uint64_t v13 = [v10 underlyingErrors];
    uint64_t v14 = [v13 firstObject];
    id v15 = (void *)v14;
    if (v14) {
      id v16 = (void *)v14;
    }
    else {
      id v16 = v10;
    }
    id v17 = v16;

    objc_msgSend(v8, "setLastKnownStageUnderlyingErrorCode:", objc_msgSend(v17, "code"));
    id v18 = [v17 domain];

    [v8 setLastKnownStageUnderlyingErrorDomain:v18];
  }
  id v19 = objc_msgSend(v7, "errorStage_String");
  [v8 setLastKnownStageErrorString:v19];

  __int16 v20 = [v7 setupSessionIdentifier];
  [v8 setControllerSetupSessionIdentifier:v20];

  objc_msgSend(v8, "setNumberOfTimesPrimaryResidentChangedHH2:", objc_msgSend(v7, "numberOfTimesPrimaryResidentChanged_HH2"));
  objc_msgSend(v8, "setLastPrimaryClientConnectedTimeHH2:", objc_msgSend(v7, "lastPrimaryClientConnectedTime_HH2"));
  objc_msgSend(v8, "setNumberOfTimesPrimaryClientConnectedHH2:", objc_msgSend(v7, "numberOfTimesPrimaryClientConnected_HH2"));
  objc_msgSend(v8, "setNumberOfTimesPrimaryClientDisconnectedHH2:", objc_msgSend(v7, "numberOfTimesPrimaryClientDisconnected_HH2"));
  objc_msgSend(v8, "setNumberOfTimesPrimaryClientConnectMessageFailedHH2:", objc_msgSend(v7, "numberOfTimesPrimaryClientConnectMessageFailed_HH2"));
  objc_msgSend(v8, "setCurrentDeviceConfirmedPrimaryResidentINT:", objc_msgSend(v7, "currentDeviceConfirmedPrimaryResident_INT"));
  objc_msgSend(v8, "setLastPrimaryClientConnectMessageFailErrorCodeHH2:", objc_msgSend(v7, "lastPrimaryClientConnectMessageFailErrorCode_HH2"));
  id v21 = objc_msgSend(v7, "lastPrimaryClientConnectMessageFailErrorDomain_HH2");
  [v8 setLastPrimaryClientConnectMessageFailErrorDomainHH2:v21];

  objc_msgSend(v8, "setLastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2:", objc_msgSend(v7, "lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2"));
  __int16 v22 = objc_msgSend(v7, "lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2");
  [v8 setLastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2:v22];

  objc_msgSend(v8, "setPrimaryResidentElectionPeerDeviceFutureResolvedMSHH2:", objc_msgSend(v7, "primaryResidentElectionPeerDeviceFutureResolvedMS_HH2"));
  objc_msgSend(v8, "setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2:", objc_msgSend(v7, "primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2"));
  objc_msgSend(v8, "setPrimaryResidentElectionModernTransportStartedFutureResolvedMSHH2:", objc_msgSend(v7, "primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2"));
  objc_msgSend(v8, "setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2:", objc_msgSend(v7, "primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2"));
  objc_msgSend(v8, "setPrimaryResidentElectionJoinMeshMSHH2:", objc_msgSend(v7, "primaryResidentElectionJoinMeshMS_HH2"));
  objc_msgSend(v8, "setFirstCoreDataContainerSetupDurationMSHH2:", objc_msgSend(v7, "firstCoreDataContainerSetupDurationMS_HH2"));
  objc_msgSend(v8, "setFirstCoreDataContainerSetupErrorCodeHH2:", objc_msgSend(v7, "firstCoreDataContainerSetupErrorCode_HH2"));
  id v23 = objc_msgSend(v7, "firstCoreDataContainerSetupErrorDomain_HH2");
  [v8 setFirstCoreDataContainerSetupErrorDomainHH2:v23];

  objc_msgSend(v8, "setFirstCoreDataContainerSetupUnderlyingErrorCodeHH2:", objc_msgSend(v7, "firstCoreDataContainerSetupUnderlyingErrorCode_HH2"));
  uint64_t v24 = objc_msgSend(v7, "firstCoreDataContainerSetupUnderlyingErrorDomain_HH2");
  [v8 setFirstCoreDataContainerSetupUnderlyingErrorDomainHH2:v24];

  objc_msgSend(v8, "setSavedEventState:", objc_msgSend(v7, "savedEventState"));
  v25 = [v8 data];
  uint64_t v26 = (void *)MEMORY[0x1D9452090]();
  id v27 = a1;
  SEL v28 = HMFGetOSLogHandle();
  v29 = v28;
  if (v25)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      int v32 = 138543362;
      uint64_t v33 = v30;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Saved HomePod setup latency log event", (uint8_t *)&v32, 0xCu);
    }
    [v6 setObject:v25 forKey:@"accessorysetup.latencylogevent"];
  }
  else
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      int v32 = 138543362;
      uint64_t v33 = v31;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Error saving setup log event", (uint8_t *)&v32, 0xCu);
    }
  }
}

+ (id)readSetupLogEventFromUserDefaults:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 readLastAccessorySetupInfo:v4];
  if (v5)
  {
    id v6 = [a1 homepodSetupLogEventFromProtoSetupInfo:v5];
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = a1;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Loaded setup log event", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)homepodSetupLogEventFromProtoSetupInfo:(id)a3
{
  id v3 = a3;
  __int16 v60 = [HMDHomePodSetupLatencyLogEvent alloc];
  uint64_t v59 = [v3 sessionSetupOpenMSHH1];
  uint64_t v58 = [v3 controllerKeyExchangeMSHH1];
  uint64_t v57 = [v3 newAccessoryTransferMSHH1];
  uint64_t v56 = [v3 sessionSetupCloseMSHH1];
  uint64_t v55 = [v3 sentinelZoneFetchMSHH1];
  uint64_t v54 = [v3 totalDurationMSHH1];
  uint64_t v53 = [v3 accountSettleWaitMSHH2];
  uint64_t v52 = [v3 currentDeviceIDSWaitMSHH2];
  uint64_t v51 = [v3 homeManagerReadyMSHH2];
  uint64_t v50 = [v3 firstCoreDataImportMSHH2];
  uint64_t v49 = [v3 accessoryAddMSHH2];
  uint64_t v48 = [v3 settingsCreationMSHH2];
  uint64_t v47 = [v3 pairingIdentityCreationMSHH2];
  uint64_t v46 = [v3 siriReadyMSHH2];
  uint64_t v45 = [v3 eventRouterServerConnectionMSHH2];
  uint64_t v44 = [v3 primaryResidentElectionMSHH2];
  uint64_t v43 = [v3 eventRouterFirstEventPushMSHH2];
  uint64_t v42 = [v3 totalDurationMSHH2];
  BOOL v41 = [v3 iCloudAvailableINT] == 1;
  BOOL v40 = [v3 iDSAvailableINT] == 1;
  BOOL v39 = [v3 manateeAvailableINT] == 1;
  BOOL v38 = [v3 networkAvailableINT] == 1;
  BOOL v37 = [v3 lastKnownControllerHH2Mode] == 2;
  BOOL v36 = [v3 lastKnownControllerSentinelZoneExistence] == 1;
  uint64_t v35 = [v3 lastKnownStageErrorCode];
  uint64_t v34 = [v3 lastKnownStageErrorDomain];
  uint64_t v33 = [v3 lastKnownStageUnderlyingErrorCode];
  int v32 = [v3 lastKnownStageUnderlyingErrorDomain];
  id v31 = [v3 lastKnownStageErrorString];
  uint64_t v30 = [v3 controllerSetupSessionIdentifier];
  int v29 = [v3 numberOfTimesPrimaryResidentChangedHH2];
  uint64_t v28 = [v3 lastPrimaryClientConnectedTimeHH2];
  unsigned int v27 = [v3 numberOfTimesPrimaryClientConnectedHH2];
  unsigned int v26 = [v3 numberOfTimesPrimaryClientDisconnectedHH2];
  int v25 = [v3 numberOfTimesPrimaryClientConnectMessageFailedHH2];
  BOOL v23 = [v3 currentDeviceConfirmedPrimaryResidentINT] == 1;
  uint64_t v24 = [v3 lastPrimaryClientConnectMessageFailErrorCodeHH2];
  __int16 v22 = [v3 lastPrimaryClientConnectMessageFailErrorDomainHH2];
  uint64_t v21 = [v3 lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2];
  __int16 v20 = [v3 lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2];
  uint64_t v19 = [v3 primaryResidentElectionPeerDeviceFutureResolvedMSHH2];
  uint64_t v18 = [v3 primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2];
  uint64_t v4 = [v3 primaryResidentElectionModernTransportStartedFutureResolvedMSHH2];
  uint64_t v5 = [v3 primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2];
  uint64_t v6 = [v3 primaryResidentElectionJoinMeshMSHH2];
  uint64_t v7 = [v3 firstCoreDataContainerSetupDurationMSHH2];
  uint64_t v8 = [v3 firstCoreDataContainerSetupErrorCodeHH2];
  id v9 = [v3 firstCoreDataContainerSetupErrorDomainHH2];
  uint64_t v10 = [v3 firstCoreDataContainerSetupUnderlyingErrorCodeHH2];
  uint64_t v11 = [v3 firstCoreDataContainerSetupUnderlyingErrorDomainHH2];
  uint64_t v12 = [v3 savedEventState];

  BYTE4(v17) = v23;
  LODWORD(v17) = v25;
  LODWORD(v16) = v29;
  BYTE5(v15) = v36;
  BYTE4(v15) = v37;
  BYTE3(v15) = v38;
  BYTE2(v15) = v39;
  BYTE1(v15) = v40;
  LOBYTE(v15) = v41;
  uint64_t v13 = -[HMDHomePodSetupLatencyLogEvent initWithSessionSetupOpenMS_HH1:controllerKeyExchangeMS_HH1:newAccessoryTransferMS_HH1:sessionSetupCloseMS_HH1:sentinelZoneFetchMS_HH1:totalDurationMS_HH1:accountSettleWaitMS_HH2:currentDeviceIDSWaitMS_HH2:homeManagerReadyMS_HH2:firstCoreDataImportMS_HH2:accessoryAddMS_HH2:settingsCreationMS_HH2:pairingIdentityCreationMS_HH2:siriReadyMS_HH2:eventRouterServerConnectionMS_HH2:primaryResidentElectionMS_HH2:eventRouterFirstEventPushMS_HH2:totalDurationMS_HH2:iCloudAvailable_INT:IDSAvailable_INT:manateeAvailable_INT:networkAvailable_INT:controllerInHH2_INT:controllerHasSentinelZone_INT:errorCode:errorDomain:underlyingErrorCode:underlyingErrorDomain:errorStage_String:setupSessionIdentifier:numberOfTimesPrimaryResidentChanged_HH2:lastPrimaryClientConnectedTime_HH2:numberOfTimesPrimaryClientConnected_HH2:numberOfTimesPrimaryClientDisconnected_HH2:numberOfTimesPrimaryClientConnectMessageFailed_HH2:currentDeviceConfirmedPrimaryResident_INT:lastPrimaryClientConnectMessageFailErrorCode_HH2:lastPrimaryClientConnectMessageFailErrorDomain_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:primaryResidentElectionPeerDeviceFutureResolvedMS_HH2:primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:primaryResidentElectionJoinMeshMS_HH2:firstCoreDataContainerSetupDurationMS_HH2:firstCoreDataContainerSetupErrorCode_HH2:firstCoreDataContainerSetupErrorDomain_HH2:firstCoreDataContainerSetupUnderlyingErrorCode_HH2:firstCoreDataContainerSetupUnderlyingErrorDomain_HH2:savedEventState:](v60, "initWithSessionSetupOpenMS_HH1:controllerKeyExchangeMS_HH1:newAccessoryTransferMS_HH1:sessionSetupCloseMS_HH1:sentinelZoneFetchMS_HH1:totalDurationMS_HH1:accountSettleWaitMS_HH2:currentDeviceIDSWaitMS_HH2:homeManagerReadyMS_HH2:firstCoreDataImportMS_HH2:accessoryAddMS_HH2:settingsCreationMS_HH2:pairingIdentityCreationMS_HH2:siriReadyMS_HH2:eventRouterServerConnectionMS_HH2:primaryResidentElectionMS_HH2:eventRouterFirstEventPushMS_HH2:totalDurationMS_HH2:iCloudAvailable_INT:IDSAvailable_INT:manateeAvailable_INT:networkAvailable_INT:controllerInHH2_INT:controllerHasSentinelZone_INT:errorCode:errorDomain:underlyingErrorCode:underlyingErrorDomain:errorStage_String:setupSessionIdentifier:numberOfTimesPrimaryResidentChanged_HH2:lastPrimaryClientConnectedTime_HH2:numberOfTimesPrimaryClientConnected_HH2:numberOfTimesPrimaryClientDisconnected_HH2:numberOfTimesPrimaryClientConnectMessageFailed_HH2:currentDeviceConfirmedPrimaryResident_INT:lastPrimaryClientConnectMessageFailErrorCode_HH2:lastPrimaryClientConnectMessageFailErrorDomain_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:primaryResidentElectionPeerDeviceFutureResolvedMS_HH2:primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:primaryResidentElectionJoinMeshMS_HH2:firstCoreDataContainerSetupDurationMS_HH2:firstCoreDataContainerSetupErrorCode_HH2:firstCoreDataContainerSetupErrorDomain_HH2:firstCoreDataContainerSetupUnderlyingErrorCode_HH2:firstCoreDataContainerSetupUnderlyingErrorDomain_HH2:savedEventState:", v59, v58,
          v57,
          v56,
          v55,
          v54,
          v53,
          v52,
          v51,
          v50,
          v49,
          v48,
          v47,
          v46,
          v45,
          v44,
          v43,
          v42,
          v15,
          v35,
          v34,
          v33,
          v32,
          v31,
          v30,
          v16,
          v28,
          __PAIR64__(v26, v27),
          v17,
          v24,
          v22,
          v21,
          v20,
          v19,
          v18,
          v4,
          v5,
          v6,
          v7,
          v8,
          v9,
          v10,
          v11,
          v12);

  return v13;
}

+ (void)removeLastAccessorySetupInfoFromUserDefaults:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = a1;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing last accessory setup info", (uint8_t *)&v9, 0xCu);
  }
  [v4 removeObjectForKey:@"accessorysetup.latencylogevent"];
}

+ (id)readLastAccessorySetupInfo:(id)a3
{
  id v3 = [a3 dataForKey:@"accessorysetup.latencylogevent"];
  if (v3) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F2E560]) initWithData:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end