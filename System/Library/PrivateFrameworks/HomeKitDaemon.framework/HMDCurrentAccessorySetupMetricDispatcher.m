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
- (NSString)setupSessionIdentifier;
- (id)_findFirstNonCommunicationErrorIn:(uint64_t)a1 depth:(void *)a2 maxDepth:(uint64_t)a3;
- (id)_underlyingErrorByIgnoringCommunicationFailureErrors:(id)a3;
- (id)dataSource;
- (unint64_t)addAccessoryBeginTime;
- (unint64_t)addAccessoryEndTime;
- (unint64_t)appleAccountSettledBeginTime;
- (unint64_t)appleAccountSettledEndTime;
- (unint64_t)coreDataFirstCloudImportBeginTime;
- (unint64_t)coreDataFirstCloudImportEndTime;
- (unint64_t)currentIDSDeviceSettledBeginTime;
- (unint64_t)currentIDSDeviceSettledEndTime;
- (unint64_t)eventRouterServerConnectBeginTime;
- (unint64_t)eventRouterServerConnectEndTime;
- (unint64_t)firstCurrentDeviceJoinMeshBeginTime;
- (unint64_t)firstPrimaryResidentElectionBeginTime;
- (unint64_t)firstPrimaryResidentElectionEndTime;
- (unint64_t)firstServerEventSentBeginTime;
- (unint64_t)firstServerEventSentEndTime;
- (unint64_t)hh2SentinelZoneFetchBeginTime;
- (unint64_t)hh2SentinelZoneFetchEndTime;
- (unint64_t)homeManagerInitBeginTime;
- (unint64_t)homeManagerInitEndTime;
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
- (void)_logWithoutStatesWithPrefix:(void *)a3 stage:(uint64_t)a4 time:;
- (void)_markMetricDispatcherSubmission;
- (void)_recordTotalDuration;
- (void)_shouldEndStage:(void *)a3 error:;
- (void)markControllerHH2Mode:(BOOL)a3 controllerHH2SentinelExists:(BOOL)a4;
- (void)markCurrentDeviceConfirmedPrimaryResidentStatusDidChange:(BOOL)a3;
- (void)markEventRouterPrimaryClientConnectMessageFailedWithError:(id)a3;
- (void)markEventRouterPrimaryClientConnectStatusChanged:(BOOL)a3;
- (void)markFirstCoreDataContainerSetupDuration:(double)a3 error:(id)a4;
- (void)markPrimaryResidentElectionFirstCloudKitImportFutureResolved;
- (void)markPrimaryResidentElectionJoinMesh;
- (void)markPrimaryResidentElectionModernTransportStartedFutureResolved;
- (void)markPrimaryResidentElectionPeerDeviceFutureResolved;
- (void)markPrimaryResidentSelectionConnectedToStatusKitFutureResolved;
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

- (unint64_t)firstCurrentDeviceJoinMeshBeginTime
{
  return self->_firstCurrentDeviceJoinMeshBeginTime;
}

- (unint64_t)firstPrimaryResidentElectionEndTime
{
  return self->_firstPrimaryResidentElectionEndTime;
}

- (unint64_t)firstPrimaryResidentElectionBeginTime
{
  return self->_firstPrimaryResidentElectionBeginTime;
}

- (unint64_t)firstServerEventSentEndTime
{
  return self->_firstServerEventSentEndTime;
}

- (unint64_t)firstServerEventSentBeginTime
{
  return self->_firstServerEventSentBeginTime;
}

- (unint64_t)eventRouterServerConnectEndTime
{
  return self->_eventRouterServerConnectEndTime;
}

- (unint64_t)eventRouterServerConnectBeginTime
{
  return self->_eventRouterServerConnectBeginTime;
}

- (unint64_t)homeManagerInitEndTime
{
  return self->_homeManagerInitEndTime;
}

- (unint64_t)homeManagerInitBeginTime
{
  return self->_homeManagerInitBeginTime;
}

- (unint64_t)currentIDSDeviceSettledEndTime
{
  return self->_currentIDSDeviceSettledEndTime;
}

- (unint64_t)currentIDSDeviceSettledBeginTime
{
  return self->_currentIDSDeviceSettledBeginTime;
}

- (unint64_t)appleAccountSettledEndTime
{
  return self->_appleAccountSettledEndTime;
}

- (unint64_t)appleAccountSettledBeginTime
{
  return self->_appleAccountSettledBeginTime;
}

- (unint64_t)coreDataFirstCloudImportEndTime
{
  return self->_coreDataFirstCloudImportEndTime;
}

- (unint64_t)coreDataFirstCloudImportBeginTime
{
  return self->_coreDataFirstCloudImportBeginTime;
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
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting controller setup session identifier %@ on the log event.", (uint8_t *)&v10, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  v9 = (void *)[v4 copy];
  [(HMDHomePodSetupLatencyLogEvent *)v6->_setupLogEvent setSetupSessionIdentifier:v9];

  os_unfair_lock_unlock(&v6->_lock);
}

- (NSString)setupSessionIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setupSessionIdentifier];
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (void)markFirstCoreDataContainerSetupDuration:(double)a3 error:(id)a4
{
  id v12 = a4;
  os_unfair_lock_lock_with_options();
  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent firstCoreDataContainerSetupDurationMS_HH2])
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setFirstCoreDataContainerSetupDurationMS_HH2:(uint64_t)(a3 * 1000.0)];
    if (v12)
    {
      -[HMDHomePodSetupLatencyLogEvent setFirstCoreDataContainerSetupErrorCode_HH2:](self->_setupLogEvent, "setFirstCoreDataContainerSetupErrorCode_HH2:", [v12 code]);
      v6 = [v12 domain];
      [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setFirstCoreDataContainerSetupErrorDomain_HH2:v6];

      v7 = [v12 underlyingErrors];
      v8 = [v7 firstObject];
      if (v8) {
        v9 = v8;
      }
      else {
        v9 = v12;
      }
      id v10 = v9;

      -[HMDHomePodSetupLatencyLogEvent setFirstCoreDataContainerSetupUnderlyingErrorCode_HH2:](self->_setupLogEvent, "setFirstCoreDataContainerSetupUnderlyingErrorCode_HH2:", [v10 code]);
      v11 = [v10 domain];
      [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setFirstCoreDataContainerSetupUnderlyingErrorDomain_HH2:v11];
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v104 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = -[HMDCurrentAccessorySetupMetricDispatcher dataSource]((id *)&self->super.super.isa);
  [(HMDCurrentAccessorySetupMetricDispatcher *)self setSubmissionTimer:0];
  if ([(HMDCurrentAccessorySetupMetricDispatcher *)self allStagesSubmitted])
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v106 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Submission timer fired, but all stages are already submitted.", buf, 0xCu);
    }
LABEL_4:

    [v5 removeCurrentAccessorySetupMetricDispatcherIfNeeded];
    goto LABEL_110;
  }
  if (!self)
  {
LABEL_13:
    v6 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = self;
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v106 = v15;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Not a valid log event and do not submit", buf, 0xCu);
    }
    goto LABEL_4;
  }
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent sessionSetupOpenMS_HH1] >= 1
    && [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent sessionSetupCloseMS_HH1] >= 1
    && (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent controllerKeyExchangeMS_HH1]|| ![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent newAccessoryTransferMS_HH1]))
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v106 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Do not submit as this appears to be a device repair session.", buf, 0xCu);
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
  uint64_t v33 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"Apple account settled"];
  v34 = (void *)v33;
  if (v33) {
    v35 = (void *)v33;
  }
  else {
    v35 = v31;
  }
  id v36 = v35;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent accountSettleWaitMS_HH2]
    || [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent accountSettleWaitMS_HH2] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"Apple account settled"];
    id v37 = v36;

    id v17 = v37;
  }
  uint64_t v38 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"Current device settled"];
  v39 = (void *)v38;
  if (v38) {
    v40 = (void *)v38;
  }
  else {
    v40 = v36;
  }
  id v41 = v40;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent currentDeviceIDSWaitMS_HH2]
    || [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent currentDeviceIDSWaitMS_HH2] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"Current device settled"];
    id v42 = v41;

    id v17 = v42;
  }
  uint64_t v43 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"Home Manager Initialized"];
  v44 = (void *)v43;
  if (v43) {
    v45 = (void *)v43;
  }
  else {
    v45 = v41;
  }
  id v46 = v45;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent homeManagerReadyMS_HH2]
    || [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent homeManagerReadyMS_HH2] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"Home Manager Initialized"];
    id v47 = v46;

    id v17 = v47;
  }
  uint64_t v48 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"First CoreData Import"];
  v49 = (void *)v48;
  if (v48) {
    v50 = (void *)v48;
  }
  else {
    v50 = v46;
  }
  id v51 = v50;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent firstCoreDataImportMS_HH2]
    || [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent firstCoreDataImportMS_HH2] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"First CoreData Import"];
    id v52 = v51;

    id v17 = v52;
  }
  uint64_t v53 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"Settings Creation"];
  v54 = (void *)v53;
  if (v53) {
    v55 = (void *)v53;
  }
  else {
    v55 = v51;
  }
  id v56 = v55;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent settingsCreationMS_HH2]
    || [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent settingsCreationMS_HH2] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"Settings Creation"];
    id v57 = v56;

    id v17 = v57;
  }
  uint64_t v58 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"Pairing Identity Creation"];
  v59 = (void *)v58;
  if (v58) {
    v60 = (void *)v58;
  }
  else {
    v60 = v56;
  }
  id v61 = v60;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent pairingIdentityCreationMS_HH2]|| [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent pairingIdentityCreationMS_HH2] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"Pairing Identity Creation"];
    id v62 = v61;

    id v17 = v62;
  }
  uint64_t v63 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"Accessory Add"];
  v64 = (void *)v63;
  if (v63) {
    v65 = (void *)v63;
  }
  else {
    v65 = v61;
  }
  id v66 = v65;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent accessoryAddMS_HH2]
    || [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent accessoryAddMS_HH2] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"Accessory Add"];
    id v67 = v66;

    id v17 = v67;
  }
  uint64_t v68 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"Siri Home Automation Ready"];
  v69 = (void *)v68;
  if (v68) {
    v70 = (void *)v68;
  }
  else {
    v70 = v66;
  }
  id v71 = v70;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent siriReadyMS_HH2]
    || [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent siriReadyMS_HH2] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"Siri Home Automation Ready"];
    id v72 = v71;

    id v17 = v72;
  }
  uint64_t v73 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"First Primary Resident Election"];
  v74 = (void *)v73;
  if (v73) {
    v75 = (void *)v73;
  }
  else {
    v75 = v71;
  }
  id v76 = v75;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent primaryResidentElectionMS_HH2]|| [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent primaryResidentElectionMS_HH2] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"First Primary Resident Election"];
    id v77 = v76;

    id v17 = v77;
  }
  uint64_t v78 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"First Event Router Server Connection"];
  v79 = (void *)v78;
  if (v78) {
    v80 = (void *)v78;
  }
  else {
    v80 = v76;
  }
  id v81 = v80;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent eventRouterServerConnectionMS_HH2]|| [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent eventRouterServerConnectionMS_HH2] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"First Event Router Server Connection"];
    id v82 = v81;

    id v17 = v82;
  }
  uint64_t v83 = [(NSMutableDictionary *)self->_stageErrorDict objectForKeyedSubscript:@"First Event Push"];
  v84 = (void *)v83;
  if (v83) {
    v85 = (void *)v83;
  }
  else {
    v85 = v81;
  }
  id v86 = v85;

  if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent eventRouterFirstEventPushMS_HH2]|| [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent eventRouterFirstEventPushMS_HH2] == -1)
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setErrorStage_String:@"First Event Push"];
    id v87 = v86;

    id v17 = v87;
  }

  if (!v17)
  {
    id v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:13];
  }
  [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setSavedEventState:3];
  -[HMDCurrentAccessorySetupMetricDispatcher _recordTotalDuration]((uint64_t)self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logEventSubmitter);
  [WeakRetained submitLogEvent:self->_setupLogEvent error:v17];

  v89 = (void *)MEMORY[0x230FBD990]();
  v90 = self;
  HMFGetOSLogHandle();
  v91 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v92 = (id)objc_claimAutoreleasedReturnValue();
    v93 = [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent coreAnalyticsEventDictionary];
    *(_DWORD *)buf = 138543874;
    id v106 = v92;
    __int16 v107 = 2112;
    v108 = v93;
    __int16 v109 = 2112;
    id v110 = v17;
    _os_log_impl(&dword_22F52A000, v91, OS_LOG_TYPE_INFO, "%{public}@Submission timer fired and submitting the final metric log event: %@ with error %@", buf, 0x20u);
  }
  v94 = objc_opt_class();
  id v96 = objc_getProperty(v90, v95, 56, 1);
  id v98 = objc_getProperty(v90, v97, 48, 1);
  [v94 saveSetupLogEventIntoUserDefaults:v96 setupLogEvent:v98];

  [(HMDCurrentAccessorySetupMetricDispatcher *)v90 _markMetricDispatcherSubmission];
  v100 = (void *)MEMORY[0x230FBD990]();
  v101 = v90;
  HMFGetOSLogHandle();
  v102 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
  {
    v103 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v106 = v103;
    _os_log_impl(&dword_22F52A000, v102, OS_LOG_TYPE_INFO, "%{public}@Log event submitted during timeout, removing the metric dispatcher", buf, 0xCu);
  }
  [v5 removeCurrentAccessorySetupMetricDispatcherIfNeeded];

LABEL_110:
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
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    Property = (uint64_t (**)(void))objc_getProperty((id)a1, v2, 24, 1);
    unint64_t v4 = Property[2]();
    unint64_t v5 = *(void *)(a1 + 208);
    if (v4 <= v5 || v5 == 0) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = v4 - v5;
    }
    v8 = (void *)MEMORY[0x230FBD990](objc_msgSend(*(id *)(a1 + 48), "setTotalDurationMS_HH2:", v7));
    v9 = (id *)(id)a1;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      uint64_t v12 = objc_msgSend(v9[6], "totalDurationMS_HH2");
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2048;
      uint64_t v16 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Total duration for HH2: %llu", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)_markMetricDispatcherSubmission
{
  if (a1)
  {
    Property = (uint64_t (**)(void))objc_getProperty(a1, a2, 24, 1);
    uint64_t v4 = Property[2]();
    -[HMDCurrentAccessorySetupMetricDispatcher _logWithoutStatesWithPrefix:stage:time:](a1, @"End stage", @"Setup In HH2", v4);
  }
}

- (void)_logWithoutStatesWithPrefix:(void *)a3 stage:(uint64_t)a4 time:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = a1;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v13 = HMFBooleanToString();
    int v14 = 138544386;
    __int16 v15 = v12;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2048;
    uint64_t v21 = a4;
    __int16 v22 = 2112;
    uint64_t v23 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@%@: %@, time: %llu, HH2 mode: %@.", (uint8_t *)&v14, 0x34u);
  }
}

- (void)markPrimaryResidentElectionJoinMesh
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_firstPrimaryResidentElectionBeginTime && !self->_firstCurrentDeviceJoinMeshBeginTime)
  {
    unint64_t v5 = (uint64_t (**)(void))objc_getProperty(self, v4, 24, 1);
    self->_firstCurrentDeviceJoinMeshBeginTime = v5[2]();

    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setPrimaryResidentElectionJoinMeshMS_HH2:-1];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markPrimaryResidentSelectionConnectedToStatusKitFutureResolved
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_firstPrimaryResidentElectionBeginTime)
  {
    if ([(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2] == -1)
    {
      unint64_t v5 = (uint64_t (**)(void))objc_getProperty(self, v4, 24, 1);
      [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:v5[2]() - self->_firstPrimaryResidentElectionBeginTime];

      if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2])[(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:1]; {
    }
      }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markPrimaryResidentElectionModernTransportStartedFutureResolved
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_firstPrimaryResidentElectionBeginTime)
  {
    if ([(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2] == -1)
    {
      unint64_t v5 = (uint64_t (**)(void))objc_getProperty(self, v4, 24, 1);
      [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setPrimaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:v5[2]() - self->_firstPrimaryResidentElectionBeginTime];

      if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2])[(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setPrimaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:1]; {
    }
      }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markPrimaryResidentElectionFirstCloudKitImportFutureResolved
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_firstPrimaryResidentElectionBeginTime)
  {
    if ([(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2] == -1)
    {
      unint64_t v5 = (uint64_t (**)(void))objc_getProperty(self, v4, 24, 1);
      [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:v5[2]() - self->_firstPrimaryResidentElectionBeginTime];

      if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2])[(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:1]; {
    }
      }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markPrimaryResidentElectionPeerDeviceFutureResolved
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_firstPrimaryResidentElectionBeginTime)
  {
    if ([(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent primaryResidentElectionPeerDeviceFutureResolvedMS_HH2] == -1)
    {
      unint64_t v5 = (uint64_t (**)(void))objc_getProperty(self, v4, 24, 1);
      [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setPrimaryResidentElectionPeerDeviceFutureResolvedMS_HH2:v5[2]() - self->_firstPrimaryResidentElectionBeginTime];

      if (![(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent primaryResidentElectionPeerDeviceFutureResolvedMS_HH2])[(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setPrimaryResidentElectionPeerDeviceFutureResolvedMS_HH2:1]; {
    }
      }
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)_underlyingErrorByIgnoringCommunicationFailureErrors:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[HMDCurrentAccessorySetupMetricDispatcher _findFirstNonCommunicationErrorIn:depth:maxDepth:]((uint64_t)self, v4, 0);
  v6 = v5;
  if (!v5) {
    unint64_t v5 = v4;
  }
  id v7 = v5;

  return v7;
}

- (id)_findFirstNonCommunicationErrorIn:(uint64_t)a1 depth:(void *)a2 maxDepth:(uint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
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

- (void)markCurrentDeviceConfirmedPrimaryResidentStatusDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent currentDeviceConfirmedPrimaryResident_INT] == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setCurrentDeviceConfirmedPrimaryResident_INT:v3];
    os_unfair_lock_unlock(p_lock);
    v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = HMFBooleanToString();
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Marking current device confirmed primary resident status did change: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)markEventRouterPrimaryClientConnectMessageFailedWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDCurrentAccessorySetupMetricDispatcher *)self _underlyingErrorByIgnoringCommunicationFailureErrors:v4];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent primaryResidentElectionMS_HH2])
  {
    [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setNumberOfTimesPrimaryClientConnectMessageFailed_HH2:[(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent numberOfTimesPrimaryClientConnectMessageFailed_HH2]+ 1];
    if (v5)
    {
      -[HMDHomePodSetupLatencyLogEvent setLastPrimaryClientConnectMessageFailErrorCode_HH2:](self->_setupLogEvent, "setLastPrimaryClientConnectMessageFailErrorCode_HH2:", [v5 code]);
      id v7 = [v5 domain];
      [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setLastPrimaryClientConnectMessageFailErrorDomain_HH2:v7];

      uint64_t v8 = [v4 underlyingErrors];
      uint64_t v9 = [v8 firstObject];
      uint64_t v10 = (void *)v9;
      if (v9) {
        int v11 = (void *)v9;
      }
      else {
        int v11 = v5;
      }
      id v12 = v11;

      -[HMDHomePodSetupLatencyLogEvent setLastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:](self->_setupLogEvent, "setLastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:", [v12 code]);
      __int16 v13 = [v12 domain];
      [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setLastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:v13];
    }
    os_unfair_lock_unlock(&self->_lock);
    id v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = self;
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = HMFGetLogIdentifier();
      int v22 = 138543618;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Marking event router primary client connection message fail with error: %@", (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    long long v18 = (void *)MEMORY[0x230FBD990]();
    long long v19 = self;
    HMFGetOSLogHandle();
    __int16 v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v22 = 138543362;
      uint64_t v23 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring primary client connect message failures before primary resident is established", (uint8_t *)&v22, 0xCu);
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)markEventRouterPrimaryClientConnectStatusChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent primaryResidentElectionMS_HH2])
  {
    if (v3)
    {
      id v7 = (uint64_t (**)(void))objc_getProperty(self, v6, 24, 1);
      [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setLastPrimaryClientConnectedTime_HH2:v7[2]() - self->_firstPrimaryResidentElectionEndTime];

      [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setNumberOfTimesPrimaryClientConnected_HH2:[(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent numberOfTimesPrimaryClientConnected_HH2]+ 1];
    }
    else
    {
      [(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent setNumberOfTimesPrimaryClientDisconnected_HH2:[(HMDHomePodSetupLatencyLogEvent *)self->_setupLogEvent numberOfTimesPrimaryClientDisconnected_HH2]+ 1];
    }
    os_unfair_lock_unlock(p_lock);
    id v12 = (void *)MEMORY[0x230FBD990]();
    __int16 v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      long long v16 = HMFBooleanToString();
      int v17 = 138543618;
      long long v18 = v15;
      __int16 v19 = 2112;
      __int16 v20 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Marking event router primary client did change connection: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    HMFGetOSLogHandle();
    uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = HMFGetLogIdentifier();
      int v17 = 138543362;
      long long v18 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring primary client connection change before primary resident is established", (uint8_t *)&v17, 0xCu);
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)markSetupEndStage:(unint64_t)a3 error:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v6 = (__CFString *)a4;
  id v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    if (a3 - 1 > 0xF) {
      int v11 = @"Unknown Setup Stage";
    }
    else {
      int v11 = off_264A25A40[a3 - 1];
    }
    id v12 = v11;
    int v53 = 138543874;
    v54 = v10;
    __int16 v55 = 2112;
    id v56 = v12;
    __int16 v57 = 2112;
    uint64_t v58 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Mark end stage: %@ error: %@", (uint8_t *)&v53, 0x20u);
  }
  switch(a3)
  {
    case 0uLL:
      __int16 v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = v8;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        long long v16 = HMFGetLogIdentifier();
        int v53 = 138543618;
        v54 = v16;
        __int16 v55 = 2112;
        id v56 = v6;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unknown setup stage with error: %@", (uint8_t *)&v53, 0x16u);
      }
      break;
    case 1uLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_setupSessionOpenBeginTime && !v8->_setupSessionOpenEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"Setup Session Open", v17);
          __int16 v19 = (uint64_t (**)(void))objc_getProperty(v8, v18, 24, 1);
          v8->_setupSessionOpenEndTime = v19[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSessionSetupOpenMS_HH1:v8->_setupSessionOpenEndTime - v8->_setupSessionOpenBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent sessionSetupOpenMS_HH1]) {
            [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSessionSetupOpenMS_HH1:1];
          }
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_setupSessionOpenEndTime, @"Setup Session Open", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 2uLL:
      int v17 = v6;
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
      goto LABEL_141;
    case 3uLL:
      int v17 = v6;
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
      goto LABEL_141;
    case 4uLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_sentUnassociatedMediaAccessoryBeginTime && !v8->_sentUnassociatedMediaAccessoryEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"New Accessory Transfer", v17);
          id v25 = (uint64_t (**)(void))objc_getProperty(v8, v24, 24, 1);
          v8->_sentUnassociatedMediaAccessoryEndTime = v25[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setNewAccessoryTransferMS_HH1:v8->_sentUnassociatedMediaAccessoryEndTime - v8->_sentUnassociatedMediaAccessoryBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent newAccessoryTransferMS_HH1])[(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setNewAccessoryTransferMS_HH1:1]; {
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_sentUnassociatedMediaAccessoryEndTime, @"New Accessory Transfer", v17);
          }
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 5uLL:
      int v17 = v6;
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
      goto LABEL_141;
    case 6uLL:
      int v17 = v6;
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
      goto LABEL_141;
    case 7uLL:
      int v17 = v6;
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
      goto LABEL_141;
    case 8uLL:
      int v17 = v6;
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
      goto LABEL_141;
    case 9uLL:
      int v17 = v6;
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
          -[HMDCurrentAccessorySetupMetricDispatcher _logWithoutStatesWithPrefix:stage:time:](v8, @"End stage", @"Setup In HH1", v38);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 0xAuLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_appleAccountSettledBeginTime && !v8->_appleAccountSettledEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"Apple account settled", v17);
          v40 = (uint64_t (**)(void))objc_getProperty(v8, v39, 24, 1);
          v8->_appleAccountSettledEndTime = v40[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setAccountSettleWaitMS_HH2:v8->_appleAccountSettledEndTime - v8->_appleAccountSettledBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent accountSettleWaitMS_HH2]) {
            [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setAccountSettleWaitMS_HH2:1];
          }
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_appleAccountSettledEndTime, @"Apple account settled", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 0xBuLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_currentIDSDeviceSettledBeginTime && !v8->_currentIDSDeviceSettledEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"Current device settled", v17);
          id v42 = (uint64_t (**)(void))objc_getProperty(v8, v41, 24, 1);
          v8->_currentIDSDeviceSettledEndTime = v42[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setCurrentDeviceIDSWaitMS_HH2:v8->_currentIDSDeviceSettledEndTime - v8->_currentIDSDeviceSettledBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent currentDeviceIDSWaitMS_HH2])[(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setCurrentDeviceIDSWaitMS_HH2:1]; {
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_currentIDSDeviceSettledEndTime, @"Current device settled", v17);
          }
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 0xCuLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_homeManagerInitBeginTime && !v8->_homeManagerInitEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"Home Manager Initialized", v17);
          v44 = (uint64_t (**)(void))objc_getProperty(v8, v43, 24, 1);
          v8->_homeManagerInitEndTime = v44[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setHomeManagerReadyMS_HH2:v8->_homeManagerInitEndTime - v8->_homeManagerInitBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent homeManagerReadyMS_HH2]) {
            [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setHomeManagerReadyMS_HH2:1];
          }
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_homeManagerInitEndTime, @"Home Manager Initialized", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 0xDuLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_coreDataFirstCloudImportBeginTime && !v8->_coreDataFirstCloudImportEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"First CoreData Import", v17);
          id v46 = (uint64_t (**)(void))objc_getProperty(v8, v45, 24, 1);
          v8->_coreDataFirstCloudImportEndTime = v46[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setFirstCoreDataImportMS_HH2:v8->_coreDataFirstCloudImportEndTime - v8->_coreDataFirstCloudImportBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent firstCoreDataImportMS_HH2])[(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setFirstCoreDataImportMS_HH2:1]; {
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_coreDataFirstCloudImportEndTime, @"First CoreData Import", v17);
          }
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 0xEuLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setNumberOfTimesPrimaryResidentChanged_HH2:[(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent numberOfTimesPrimaryResidentChanged_HH2]+ 1];
        if (v8->_firstPrimaryResidentElectionBeginTime && !v8->_firstPrimaryResidentElectionEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"First Primary Resident Election", v17);
          uint64_t v48 = (uint64_t (**)(void))objc_getProperty(v8, v47, 24, 1);
          v8->_firstPrimaryResidentElectionEndTime = v48[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setPrimaryResidentElectionMS_HH2:v8->_firstPrimaryResidentElectionEndTime - v8->_firstPrimaryResidentElectionBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent primaryResidentElectionMS_HH2])[(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setPrimaryResidentElectionMS_HH2:1]; {
          if (v8->_firstCurrentDeviceJoinMeshBeginTime)
          }
          {
            if ([(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent primaryResidentElectionJoinMeshMS_HH2] == -1)
            {
              [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setPrimaryResidentElectionJoinMeshMS_HH2:v8->_firstPrimaryResidentElectionEndTime - v8->_firstCurrentDeviceJoinMeshBeginTime];
              if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent primaryResidentElectionJoinMeshMS_HH2])[(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setPrimaryResidentElectionJoinMeshMS_HH2:1]; {
            }
              }
          }
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_firstPrimaryResidentElectionEndTime, @"First Primary Resident Election", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 0xFuLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_eventRouterServerConnectBeginTime && !v8->_eventRouterServerConnectEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"First Event Router Server Connection", v17);
          v50 = (uint64_t (**)(void))objc_getProperty(v8, v49, 24, 1);
          v8->_eventRouterServerConnectEndTime = v50[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setEventRouterServerConnectionMS_HH2:v8->_eventRouterServerConnectEndTime - v8->_eventRouterServerConnectBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent eventRouterServerConnectionMS_HH2])[(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setEventRouterServerConnectionMS_HH2:1]; {
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_eventRouterServerConnectEndTime, @"First Event Router Server Connection", v17);
          }
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 0x10uLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_firstServerEventSentBeginTime && !v8->_firstServerEventSentEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, @"First Event Push", v17);
          id v52 = (uint64_t (**)(void))objc_getProperty(v8, v51, 24, 1);
          v8->_firstServerEventSentEndTime = v52[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setEventRouterFirstEventPushMS_HH2:v8->_firstServerEventSentEndTime - v8->_firstServerEventSentBeginTime];
          if (![(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent eventRouterFirstEventPushMS_HH2])[(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setEventRouterFirstEventPushMS_HH2:1]; {
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_firstServerEventSentEndTime, @"First Event Push", v17);
          }
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
LABEL_141:

      break;
    default:
      break;
  }
}

- (void)_shouldEndStage:(void *)a3 error:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = (id *)(id)a1;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v18 = 138543874;
      __int16 v19 = v10;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Save error %@ for stage %@", (uint8_t *)&v18, 0x20u);
    }
    int v11 = (void *)[v6 copy];
    [v8[8] setObject:v11 forKeyedSubscript:v5];
  }
  else
  {
    id v12 = [*(id *)(a1 + 64) objectForKeyedSubscript:v5];

    if (v12)
    {
      __int16 v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = (id *)(id)a1;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        long long v16 = HMFGetLogIdentifier();
        int v17 = [v14[8] objectForKeyedSubscript:v5];
        int v18 = 138543874;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        id v21 = v5;
        __int16 v22 = 2112;
        id v23 = v17;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Clear stage %@ with previously saved error %@", (uint8_t *)&v18, 0x20u);
      }
      [v14[8] removeObjectForKey:v5];
    }
  }
}

- (void)_handleErrorAndSaveStage:(uint64_t)a3 stageTime:(void *)a4 stageString:(void *)a5 error:
{
  uint64_t v75 = *MEMORY[0x263EF8340];
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
  id v54 = WeakRetained;
  objc_msgSend(*(id *)(a1 + 48), "setIDSRegistrationError_INT:", objc_msgSend(WeakRetained, "IDSAccountRegistrationError"));
  int v52 = a2;
  if (a2) {
    int v11 = @"End stage";
  }
  else {
    int v11 = @"Begin stage";
  }
  objc_msgSend(*(id *)(a1 + 48), "networkAvailable_INT");
  objc_msgSend(*(id *)(a1 + 48), "manateeAvailable_INT");
  objc_msgSend(*(id *)(a1 + 48), "iCloudAvailable_INT");
  objc_msgSend(*(id *)(a1 + 48), "IDSAvailable_INT");
  id v12 = v11;
  __int16 v13 = (__CFString *)v8;
  id v14 = v9;
  context = (void *)MEMORY[0x230FBD990]();
  id v15 = (id)a1;
  long long v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    int v17 = v49 = v12;
    HMFBooleanToString();
    v19 = int v18 = v13;
    __int16 v20 = HMFBooleanToString();
    id v21 = HMFBooleanToString();
    __int16 v22 = HMFBooleanToString();
    id v23 = HMFBooleanToString();
    *(_DWORD *)buf = 138545666;
    id v56 = v17;
    __int16 v57 = 2112;
    uint64_t v58 = v49;
    __int16 v59 = 2112;
    v60 = v18;
    __int16 v61 = 2048;
    uint64_t v62 = a3;
    __int16 v63 = 2112;
    v64 = v19;
    __int16 v65 = 2112;
    id v66 = v14;
    __int16 v67 = 2112;
    uint64_t v68 = v20;
    __int16 v69 = 2112;
    v70 = v21;
    __int16 v71 = 2112;
    id v72 = v22;
    __int16 v73 = 2112;
    v74 = v23;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@%@: %@, time: %llu, HH2 mode: %@, error: %@. Current state info - Network: %@, Manatee: %@, iCloud: %@, IDS: %@.", buf, 0x66u);

    __int16 v13 = v18;
    id v12 = v49;
  }

  uint64_t v24 = v54;
  id v25 = v14;
  if (v52)
  {
    SEL v26 = v13;
    if (([v15 allStagesSubmitted] & 1) != 0
      || (os_unfair_lock_assert_owner((const os_unfair_lock *)v15 + 2),
          objc_msgSend(*((id *)v15 + 6), "sessionSetupOpenMS_HH1") < 1)
      || objc_msgSend(*((id *)v15 + 6), "controllerKeyExchangeMS_HH1") < 1
      || objc_msgSend(*((id *)v15 + 6), "newAccessoryTransferMS_HH1") < 1
      || objc_msgSend(*((id *)v15 + 6), "sessionSetupCloseMS_HH1") < 1
      || objc_msgSend(*((id *)v15 + 6), "accessoryAddMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "settingsCreationMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "pairingIdentityCreationMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "siriReadyMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "accountSettleWaitMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "currentDeviceIDSWaitMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "homeManagerReadyMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "firstCoreDataImportMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "eventRouterServerConnectionMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "primaryResidentElectionMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "eventRouterFirstEventPushMS_HH2") < 1)
    {
LABEL_42:
      SEL v45 = objc_opt_class();
      id v47 = objc_getProperty(v15, v46, 56, 1);
      objc_msgSend(v45, "saveSetupLogEventIntoUserDefaults:setupLogEvent:", v47, objc_getProperty(v15, v48, 48, 1));

      __int16 v13 = v26;
      goto LABEL_43;
    }
    -[HMDCurrentAccessorySetupMetricDispatcher _recordTotalDuration]((uint64_t)v15);
    id v27 = objc_loadWeakRetained((id *)v15 + 4);
    [v27 submitLogEvent:*((void *)v15 + 6) error:v14];

    uint64_t v28 = [*((id *)v15 + 6) setSavedEventState:3];
    *((unsigned char *)v15 + 12) = 1;
    v29 = (void *)MEMORY[0x230FBD990](v28);
    id v53 = v15;
    SEL v30 = (id *)v15;
    id v31 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
LABEL_39:

      [(HMDCurrentAccessorySetupMetricDispatcher *)v30 _markMetricDispatcherSubmission];
      v40 = [v30 submissionTimer];
      [v40 suspend];

      SEL v41 = (void *)MEMORY[0x230FBD990]([v30 setSubmissionTimer:0]);
      id v42 = v30;
      SEL v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v56 = v44;
        _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Log event submitted for all stages, removing the metric dispatcher", buf, 0xCu);
      }
      [v24 removeCurrentAccessorySetupMetricDispatcherIfNeeded];
      id v15 = v53;
      goto LABEL_42;
    }
    SEL v32 = HMFGetLogIdentifier();
    uint64_t v33 = [v30[6] coreAnalyticsEventDictionary];
    uint64_t v34 = [v30[6] savedEventState];
    v35 = @"HH1Initial";
    if (v34 > 2)
    {
      if (v34 != 3)
      {
        BOOL v36 = v34 == 0x10000;
        id v37 = @"Unknown";
LABEL_33:
        if (v36) {
          v35 = v37;
        }
        goto LABEL_38;
      }
      v35 = @"Submitted";
    }
    else
    {
      if (v34 != 1)
      {
        BOOL v36 = v34 == 2;
        id v37 = @"HH2Initial";
        goto LABEL_33;
      }
      v35 = @"HH2SentinelFetched";
    }
LABEL_38:
    uint64_t v38 = v35;
    *(_DWORD *)buf = 138543874;
    id v56 = v32;
    __int16 v57 = 2112;
    uint64_t v58 = v33;
    __int16 v59 = 2112;
    v60 = v38;
    _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@All stages completed and submitted the event: %@ final state: %@", buf, 0x20u);

    uint64_t v24 = v54;
    goto LABEL_39;
  }
LABEL_43:
}

- (void)markSetupBeginStage:(unint64_t)a3 error:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = (__CFString *)a4;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    if (a3 - 1 > 0xF) {
      int v11 = @"Unknown Setup Stage";
    }
    else {
      int v11 = off_264A25A40[a3 - 1];
    }
    id v12 = v11;
    int v51 = 138543874;
    int v52 = v10;
    __int16 v53 = 2112;
    id v54 = v12;
    __int16 v55 = 2112;
    id v56 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Mark begin stage: %@ error: %@", (uint8_t *)&v51, 0x20u);
  }
  switch(a3)
  {
    case 0uLL:
      __int16 v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = v8;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        long long v16 = HMFGetLogIdentifier();
        int v51 = 138543618;
        int v52 = v16;
        __int16 v53 = 2112;
        id v54 = v6;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unknown setup stage with error: %@", (uint8_t *)&v51, 0x16u);
      }
      break;
    case 1uLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_setupSessionOpenBeginTime)
        {
          __int16 v19 = (uint64_t (**)(void))objc_getProperty(v8, v18, 24, 1);
          v8->_setupSessionOpenBeginTime = v19[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSessionSetupOpenMS_HH1:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_setupSessionOpenBeginTime, @"Setup Session Open", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 2uLL:
      int v17 = v6;
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
      goto LABEL_89;
    case 3uLL:
      int v17 = v6;
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
      goto LABEL_89;
    case 4uLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_sentUnassociatedMediaAccessoryBeginTime)
        {
          id v25 = (uint64_t (**)(void))objc_getProperty(v8, v24, 24, 1);
          v8->_sentUnassociatedMediaAccessoryBeginTime = v25[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setNewAccessoryTransferMS_HH1:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_sentUnassociatedMediaAccessoryBeginTime, @"New Accessory Transfer", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 5uLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_settingsCreationBeginTime)
        {
          id v27 = (uint64_t (**)(void))objc_getProperty(v8, v26, 24, 1);
          v8->_settingsCreationBeginTime = v27[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSettingsCreationMS_HH2:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_settingsCreationBeginTime, @"Settings Creation", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 6uLL:
      int v17 = v6;
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
      goto LABEL_89;
    case 7uLL:
      int v17 = v6;
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
      goto LABEL_89;
    case 8uLL:
      int v17 = v6;
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
      goto LABEL_89;
    case 9uLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_hh2SentinelZoneFetchBeginTime)
        {
          v35 = (uint64_t (**)(void))objc_getProperty(v8, v34, 24, 1);
          v8->_hh2SentinelZoneFetchBeginTime = v35[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSentinelZoneFetchMS_HH1:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_hh2SentinelZoneFetchBeginTime, @"HH2 sentinel zone fetched", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 0xAuLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_appleAccountSettledBeginTime)
        {
          id v37 = (uint64_t (**)(void))objc_getProperty(v8, v36, 24, 1);
          v8->_appleAccountSettledBeginTime = v37[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setAccountSettleWaitMS_HH2:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_appleAccountSettledBeginTime, @"Apple account settled", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 0xBuLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_currentIDSDeviceSettledBeginTime)
        {
          SEL v39 = (uint64_t (**)(void))objc_getProperty(v8, v38, 24, 1);
          v8->_currentIDSDeviceSettledBeginTime = v39[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setCurrentDeviceIDSWaitMS_HH2:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_currentIDSDeviceSettledBeginTime, @"Current device settled", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 0xCuLL:
      v40 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_homeManagerInitBeginTime)
        {
          id v42 = (uint64_t (**)(void))objc_getProperty(v8, v41, 24, 1);
          v8->_homeManagerInitBeginTime = v42[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setHomeManagerReadyMS_HH2:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_homeManagerInitBeginTime, @"Home Manager Initialized", v40);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }

      goto LABEL_70;
    case 0xDuLL:
LABEL_70:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_coreDataFirstCloudImportBeginTime)
        {
          v44 = (uint64_t (**)(void))objc_getProperty(v8, v43, 24, 1);
          v8->_coreDataFirstCloudImportBeginTime = v44[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setFirstCoreDataImportMS_HH2:-1];
          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setSavedEventState:2];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_coreDataFirstCloudImportBeginTime, @"First CoreData Import", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 0xEuLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_firstPrimaryResidentElectionBeginTime)
        {
          SEL v46 = (uint64_t (**)(void))objc_getProperty(v8, v45, 24, 1);
          v8->_firstPrimaryResidentElectionBeginTime = v46[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setPrimaryResidentElectionMS_HH2:-1];
          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setPrimaryResidentElectionPeerDeviceFutureResolvedMS_HH2:-1];
          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:-1];
          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setPrimaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:-1];
          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_firstPrimaryResidentElectionBeginTime, @"First Primary Resident Election", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 0xFuLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_eventRouterServerConnectBeginTime)
        {
          SEL v48 = (uint64_t (**)(void))objc_getProperty(v8, v47, 24, 1);
          v8->_eventRouterServerConnectBeginTime = v48[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setEventRouterServerConnectionMS_HH2:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_eventRouterServerConnectBeginTime, @"First Event Router Server Connection", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 0x10uLL:
      int v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_firstServerEventSentBeginTime)
        {
          v50 = (uint64_t (**)(void))objc_getProperty(v8, v49, 24, 1);
          v8->_firstServerEventSentBeginTime = v50[2]();

          [(HMDHomePodSetupLatencyLogEvent *)v8->_setupLogEvent setEventRouterFirstEventPushMS_HH2:-1];
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_firstServerEventSentBeginTime, @"First Event Push", v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
LABEL_89:

      break;
    default:
      break;
  }
}

- (HMDCurrentAccessorySetupMetricDispatcher)initWithDataSource:(id)a3 setupLogEvent:(id)a4 logEventSubmitter:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFFA40];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 standardUserDefaults];
  __int16 v13 = [(HMDCurrentAccessorySetupMetricDispatcher *)self initWithDataSource:v11 setupLogEvent:v10 logEventSubmitter:v9 currentUpTicksFactory:&__block_literal_global_195536 submissionTimerFactory:&__block_literal_global_67_195537 userDefaults:v12];

  return v13;
}

id __95__HMDCurrentAccessorySetupMetricDispatcher_initWithDataSource_setupLogEvent_logEventSubmitter___block_invoke_2()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:8 options:900.0];
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
    uint64_t v26 = [MEMORY[0x263EFF9A0] dictionary];
    stageErrorDict = v21->_stageErrorDict;
    v21->_stageErrorDict = (NSMutableDictionary *)v26;

    Property = (uint64_t (**)(void))objc_getProperty(v21, v28, 24, 1);
    uint64_t v30 = Property[2]();
    -[HMDCurrentAccessorySetupMetricDispatcher _logWithoutStatesWithPrefix:stage:time:](v21, @"Begin stage", @"Setup In HH2", v30);
  }

  return v21;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t71 != -1) {
    dispatch_once(&logCategory__hmf_once_t71, &__block_literal_global_78_195554);
  }
  SEL v2 = (void *)logCategory__hmf_once_v72;
  return v2;
}

void __55__HMDCurrentAccessorySetupMetricDispatcher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v72;
  logCategory__hmf_once_id v72 = v0;
}

+ (void)saveSetupLogEventIntoUserDefaults:(id)a3 setupLogEvent:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F0DF88]);
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
    id v12 = [v10 domain];
    [v8 setLastKnownStageErrorDomain:v12];

    __int16 v13 = [v10 underlyingErrors];
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
  id v25 = [v8 data];
  uint64_t v26 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Saved HomePod setup latency log event", (uint8_t *)&v32, 0xCu);
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
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Error saving setup log event", (uint8_t *)&v32, 0xCu);
    }
  }
}

+ (id)readSetupLogEventFromUserDefaults:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 readLastAccessorySetupInfo:v4];
  if (v5)
  {
    id v6 = [a1 homepodSetupLogEventFromProtoSetupInfo:v5];
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      __int16 v13 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Loaded setup log event", (uint8_t *)&v12, 0xCu);
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
  v60 = [HMDHomePodSetupLatencyLogEvent alloc];
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
  __int16 v13 = -[HMDHomePodSetupLatencyLogEvent initWithSessionSetupOpenMS_HH1:controllerKeyExchangeMS_HH1:newAccessoryTransferMS_HH1:sessionSetupCloseMS_HH1:sentinelZoneFetchMS_HH1:totalDurationMS_HH1:accountSettleWaitMS_HH2:currentDeviceIDSWaitMS_HH2:homeManagerReadyMS_HH2:firstCoreDataImportMS_HH2:accessoryAddMS_HH2:settingsCreationMS_HH2:pairingIdentityCreationMS_HH2:siriReadyMS_HH2:eventRouterServerConnectionMS_HH2:primaryResidentElectionMS_HH2:eventRouterFirstEventPushMS_HH2:totalDurationMS_HH2:iCloudAvailable_INT:IDSAvailable_INT:manateeAvailable_INT:networkAvailable_INT:controllerInHH2_INT:controllerHasSentinelZone_INT:errorCode:errorDomain:underlyingErrorCode:underlyingErrorDomain:errorStage_String:setupSessionIdentifier:numberOfTimesPrimaryResidentChanged_HH2:lastPrimaryClientConnectedTime_HH2:numberOfTimesPrimaryClientConnected_HH2:numberOfTimesPrimaryClientDisconnected_HH2:numberOfTimesPrimaryClientConnectMessageFailed_HH2:currentDeviceConfirmedPrimaryResident_INT:lastPrimaryClientConnectMessageFailErrorCode_HH2:lastPrimaryClientConnectMessageFailErrorDomain_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:primaryResidentElectionPeerDeviceFutureResolvedMS_HH2:primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:primaryResidentElectionJoinMeshMS_HH2:firstCoreDataContainerSetupDurationMS_HH2:firstCoreDataContainerSetupErrorCode_HH2:firstCoreDataContainerSetupErrorDomain_HH2:firstCoreDataContainerSetupUnderlyingErrorCode_HH2:firstCoreDataContainerSetupUnderlyingErrorDomain_HH2:savedEventState:](v60, "initWithSessionSetupOpenMS_HH1:controllerKeyExchangeMS_HH1:newAccessoryTransferMS_HH1:sessionSetupCloseMS_HH1:sentinelZoneFetchMS_HH1:totalDurationMS_HH1:accountSettleWaitMS_HH2:currentDeviceIDSWaitMS_HH2:homeManagerReadyMS_HH2:firstCoreDataImportMS_HH2:accessoryAddMS_HH2:settingsCreationMS_HH2:pairingIdentityCreationMS_HH2:siriReadyMS_HH2:eventRouterServerConnectionMS_HH2:primaryResidentElectionMS_HH2:eventRouterFirstEventPushMS_HH2:totalDurationMS_HH2:iCloudAvailable_INT:IDSAvailable_INT:manateeAvailable_INT:networkAvailable_INT:controllerInHH2_INT:controllerHasSentinelZone_INT:errorCode:errorDomain:underlyingErrorCode:underlyingErrorDomain:errorStage_String:setupSessionIdentifier:numberOfTimesPrimaryResidentChanged_HH2:lastPrimaryClientConnectedTime_HH2:numberOfTimesPrimaryClientConnected_HH2:numberOfTimesPrimaryClientDisconnected_HH2:numberOfTimesPrimaryClientConnectMessageFailed_HH2:currentDeviceConfirmedPrimaryResident_INT:lastPrimaryClientConnectMessageFailErrorCode_HH2:lastPrimaryClientConnectMessageFailErrorDomain_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:primaryResidentElectionPeerDeviceFutureResolvedMS_HH2:primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:primaryResidentElectionJoinMeshMS_HH2:firstCoreDataContainerSetupDurationMS_HH2:firstCoreDataContainerSetupErrorCode_HH2:firstCoreDataContainerSetupErrorDomain_HH2:firstCoreDataContainerSetupUnderlyingErrorCode_HH2:firstCoreDataContainerSetupUnderlyingErrorDomain_HH2:savedEventState:", v59, v58,
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
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = a1;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing last accessory setup info", (uint8_t *)&v9, 0xCu);
  }
  [v4 removeObjectForKey:@"accessorysetup.latencylogevent"];
}

+ (id)readLastAccessorySetupInfo:(id)a3
{
  id v3 = [a3 dataForKey:@"accessorysetup.latencylogevent"];
  if (v3) {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F0DF88]) initWithData:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end