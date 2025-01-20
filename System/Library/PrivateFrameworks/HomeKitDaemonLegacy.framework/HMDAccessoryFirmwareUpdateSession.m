@interface HMDAccessoryFirmwareUpdateSession
+ (id)__calculateDigestDataFromFile:(id)a3 maxDataSize:(unint64_t)a4 error:(id *)a5;
+ (id)logCategory;
- (BOOL)assetOfferedForCurrentDataStream;
- (BOOL)dataStreamOpenInProgress;
- (BOOL)documentationAvailable;
- (BOOL)isAccessoryVersionInSyncWithAssetVersion:(id)a3 matterFirmwareRevisionNumber:(id)a4 assetVersionString:(id)a5 matterFirmwareRevisionString:(id)a6;
- (BOOL)isCurrentUpdateLatest;
- (BOOL)isCurrentlyApplying;
- (BOOL)isCurrentlyStaging;
- (BOOL)isFirmwareVersionUpToDate;
- (BOOL)isMatterFirmwareUpdateRetryAllowed;
- (BOOL)isReadyForStaging;
- (BOOL)isReadyToApplyUpdate;
- (BOOL)isStagedFirmwareVersionUpToDate;
- (BOOL)isUserInitiatedInstall;
- (BOOL)isUserInitiatedStaging;
- (BOOL)isVerifyingUpdate;
- (BOOL)remoteApplyInProgress;
- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (BOOL)sessionEnded;
- (BOOL)startManualUpdate:(id)a3 error:(id *)a4;
- (HMDAccessoryFirmwareUpdateConcurrencyLogEventManager)logEventManager;
- (HMDAccessoryFirmwareUpdateManager)accessoryFirmwareUpdateManager;
- (HMDAccessoryFirmwareUpdateScheduler)updateScheduler;
- (HMDAccessoryFirmwareUpdateSession)init;
- (HMDAccessoryFirmwareUpdateSession)initWithHAPAccessory:(id)a3 uarpAccessory:(id)a4 accessoryFirmwareUpdateManager:(id)a5 logEventManager:(id)a6;
- (HMDAccessoryFirmwareUpdateSession)initWithHAPAccessory:(id)a3 uarpAccessory:(id)a4 accessoryFirmwareUpdateManager:(id)a5 logEventManager:(id)a6 wingman:(id)a7;
- (HMDAccessoryFirmwareUpdateSessionWingman)wingman;
- (HMDDataStreamSocket)dataStreamSocket;
- (HMDHAPAccessory)hapAccessory;
- (HMFSoftwareVersion)accessoryVersion;
- (HMFSoftwareVersion)lastStagedVersion;
- (HMFTimer)allowedApplyDurationTimer;
- (HMFTimer)expectedApplyDurationTimer;
- (HMFTimer)queryFirmwareUpdateResultDurationTimer;
- (HMFTimer)registerFailureRetryTimer;
- (HMFTimer)socketIdleTimer;
- (NSString)description;
- (OS_dispatch_queue)workQueue;
- (UARPAccessory)uarpAccessory;
- (UARPAssetID)assetID;
- (double)_allowedApplyDuration;
- (double)_expectedApplyDuration;
- (double)allowedApplyDuration;
- (double)expectedApplyDuration;
- (id)availableSoftwareVersion;
- (id)logIdentifier;
- (id)newDocumentationMetadata;
- (id)newSoftwareUpdateWithState:(int64_t)a3;
- (id)privateDescription;
- (id)registerFailureRetryTimerFactory;
- (unint64_t)applyHDSRetryCount;
- (unint64_t)currentAutomaticApplyRetriesCount;
- (unint64_t)currentCommunicationErrorCount;
- (unint64_t)currentRegisterFailureCount;
- (unint64_t)internalState;
- (unint64_t)matterFirmwareUpdateRetryCount;
- (unint64_t)nextStateToSchedule;
- (unint64_t)sessionState;
- (void)_applyFailed;
- (void)_applyFirmware;
- (void)_automaticUpdateEnabledChanged:(BOOL)a3;
- (void)_cancelApplyTimer;
- (void)_cancelQueryFirmwareUpdateResultTimer;
- (void)_cancelRegisterFailureRetryTimer;
- (void)_cancelSocketIdleTimer;
- (void)_endSession;
- (void)_evaluateHDSRetryForApplyFirmware;
- (void)_handleApplyTimerFired;
- (void)_handleAutomaticUpdateEnabledChanged:(id)a3;
- (void)_handleQueryFirmwareUpdateResultTimeout;
- (void)_handleRegisterFailureRetryTimeout;
- (void)_handleSocketTimeout;
- (void)_logApplyEventWithStatus:(int64_t)a3;
- (void)_logDebugStates:(const char *)a3;
- (void)_register;
- (void)_resetAvailableSoftwareUpdate;
- (void)_resetSocketIdleTimer;
- (void)_schedule;
- (void)_stagingFailed;
- (void)_startSocketIdleTimer;
- (void)_syncStateWithAccessoryOnResume;
- (void)_updateAvailableSoftwareUpdate;
- (void)_updateAvailableSoftwareUpdateDocumentation;
- (void)_updateAvailableSoftwareUpdateState:(int64_t)a3;
- (void)_updateSoftwareUpdateNotReadyReasons;
- (void)_updateSoftwareUpdateStateForMatterAccessoryWithState:(unint64_t)a3;
- (void)_verifyUpdateComplete;
- (void)_withOpenSocketDoBlock:(id)a3 error:(id)a4;
- (void)applyFirmware;
- (void)assetAvailablityUpdateForAccessory:(id)a3 assetID:(id)a4;
- (void)configure;
- (void)dealloc;
- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)firmwareUpdateResult:(id)a3 vendorSpecificStatus:(unsigned int)a4 error:(id)a5;
- (void)handleAccessoryFirmwareVersionChangedNotification:(id)a3;
- (void)handleAccessoryFirmwareVersionNumberChangedNotification:(id)a3;
- (void)handleAccessoryVIDPIDChangedNotification:(id)a3;
- (void)handleFirmwareUpdateStateChangedNotification:(id)a3;
- (void)handleNotReadyReasonsChanged:(id)a3;
- (void)incrementMatterFirmwareUpdateRetryCount;
- (void)logDebugStates;
- (void)pause;
- (void)registerAccessory;
- (void)rescindStagedAsset:(id)a3;
- (void)resetMatterFirmwareUpdateRetryCount;
- (void)resumeWithState:(unint64_t)a3;
- (void)setAllowedApplyDurationTimer:(id)a3;
- (void)setApplyHDSRetryCount:(unint64_t)a3;
- (void)setAssetID:(id)a3;
- (void)setAssetOfferedForCurrentDataStream:(BOOL)a3;
- (void)setCurrentAutomaticApplyRetriesCount:(unint64_t)a3;
- (void)setCurrentCommunicationErrorCount:(unint64_t)a3;
- (void)setCurrentRegisterFailureCount:(unint64_t)a3;
- (void)setDataStreamOpenInProgress:(BOOL)a3;
- (void)setDataStreamSocket:(id)a3;
- (void)setExpectedApplyDurationTimer:(id)a3;
- (void)setInternalState:(unint64_t)a3;
- (void)setIsVerifyingUpdate:(BOOL)a3;
- (void)setLastStagedVersion:(id)a3;
- (void)setMatterFirmwareUpdateRetryCount:(unint64_t)a3;
- (void)setQueryFirmwareUpdateResultDurationTimer:(id)a3;
- (void)setRegisterFailureRetryTimer:(id)a3;
- (void)setRegisterFailureRetryTimerFactory:(id)a3;
- (void)setRemoteApplyInProgress:(BOOL)a3;
- (void)setSessionEnded:(BOOL)a3;
- (void)setSocketIdleTimer:(id)a3;
- (void)setUpdateScheduler:(id)a3;
- (void)setUserInitiatedInstall:(BOOL)a3;
- (void)setUserInitiatedStaging:(BOOL)a3;
- (void)socket:(id)a3 didFailWithError:(id)a4;
- (void)socketDidClose:(id)a3;
- (void)socketDidReceiveData:(id)a3;
- (void)stageFirmware;
- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)stagingComplete;
- (void)startApplyDurationTimers;
- (void)timerDidFire:(id)a3;
- (void)unregisterAccessory;
- (void)updateAccessoryFirmwareVersion;
- (void)updateAccessoryStagedFirmwareVersion;
- (void)updateAccessoryVendorIDAndProductID;
- (void)updateAvailableSoftwareUpdate;
- (void)updateAvailableSoftwareUpdateState:(int64_t)a3;
@end

@implementation HMDAccessoryFirmwareUpdateSession

- (void).cxx_destruct
{
  objc_storeStrong(&self->_registerFailureRetryTimerFactory, 0);
  objc_storeStrong((id *)&self->_lastStagedVersion, 0);
  objc_storeStrong((id *)&self->_registerFailureRetryTimer, 0);
  objc_storeStrong((id *)&self->_updateScheduler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_uarpAccessory, 0);
  objc_destroyWeak((id *)&self->_logEventManager);
  objc_destroyWeak((id *)&self->_accessoryFirmwareUpdateManager);
  objc_storeStrong((id *)&self->_wingman, 0);
  objc_storeStrong((id *)&self->_socketIdleTimer, 0);
  objc_storeStrong((id *)&self->_queryFirmwareUpdateResultDurationTimer, 0);
  objc_destroyWeak((id *)&self->_hapAccessory);
  objc_storeStrong((id *)&self->_expectedApplyDurationTimer, 0);
  objc_storeStrong((id *)&self->_dataStreamSocket, 0);
  objc_storeStrong((id *)&self->_allowedApplyDurationTimer, 0);
}

- (void)setRegisterFailureRetryTimerFactory:(id)a3
{
}

- (id)registerFailureRetryTimerFactory
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setCurrentRegisterFailureCount:(unint64_t)a3
{
  self->_currentRegisterFailureCount = a3;
}

- (unint64_t)currentRegisterFailureCount
{
  return self->_currentRegisterFailureCount;
}

- (void)setApplyHDSRetryCount:(unint64_t)a3
{
  self->_applyHDSRetryCount = a3;
}

- (unint64_t)applyHDSRetryCount
{
  return self->_applyHDSRetryCount;
}

- (void)setMatterFirmwareUpdateRetryCount:(unint64_t)a3
{
  self->_matterFirmwareUpdateRetryCount = a3;
}

- (unint64_t)matterFirmwareUpdateRetryCount
{
  return self->_matterFirmwareUpdateRetryCount;
}

- (void)setLastStagedVersion:(id)a3
{
}

- (HMFSoftwareVersion)lastStagedVersion
{
  return self->_lastStagedVersion;
}

- (void)setCurrentCommunicationErrorCount:(unint64_t)a3
{
  self->_currentCommunicationErrorCount = a3;
}

- (unint64_t)currentCommunicationErrorCount
{
  return self->_currentCommunicationErrorCount;
}

- (void)setCurrentAutomaticApplyRetriesCount:(unint64_t)a3
{
  self->_currentAutomaticApplyRetriesCount = a3;
}

- (unint64_t)currentAutomaticApplyRetriesCount
{
  return self->_currentAutomaticApplyRetriesCount;
}

- (void)setIsVerifyingUpdate:(BOOL)a3
{
  self->_isVerifyingUpdate = a3;
}

- (BOOL)isVerifyingUpdate
{
  return self->_isVerifyingUpdate;
}

- (void)setRemoteApplyInProgress:(BOOL)a3
{
  self->_remoteApplyInProgress = a3;
}

- (BOOL)remoteApplyInProgress
{
  return self->_remoteApplyInProgress;
}

- (void)setRegisterFailureRetryTimer:(id)a3
{
}

- (HMFTimer)registerFailureRetryTimer
{
  return self->_registerFailureRetryTimer;
}

- (void)setUpdateScheduler:(id)a3
{
}

- (HMDAccessoryFirmwareUpdateScheduler)updateScheduler
{
  return self->_updateScheduler;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAssetID:(id)a3
{
}

- (UARPAssetID)assetID
{
  return (UARPAssetID *)objc_getProperty(self, a2, 112, 1);
}

- (UARPAccessory)uarpAccessory
{
  return (UARPAccessory *)objc_getProperty(self, a2, 104, 1);
}

- (HMDAccessoryFirmwareUpdateConcurrencyLogEventManager)logEventManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logEventManager);
  return (HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)WeakRetained;
}

- (HMDAccessoryFirmwareUpdateManager)accessoryFirmwareUpdateManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryFirmwareUpdateManager);
  return (HMDAccessoryFirmwareUpdateManager *)WeakRetained;
}

- (void)setDataStreamOpenInProgress:(BOOL)a3
{
  self->_dataStreamOpenInProgress = a3;
}

- (BOOL)dataStreamOpenInProgress
{
  return self->_dataStreamOpenInProgress;
}

- (HMDAccessoryFirmwareUpdateSessionWingman)wingman
{
  return (HMDAccessoryFirmwareUpdateSessionWingman *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSocketIdleTimer:(id)a3
{
}

- (HMFTimer)socketIdleTimer
{
  return self->_socketIdleTimer;
}

- (void)setQueryFirmwareUpdateResultDurationTimer:(id)a3
{
}

- (HMFTimer)queryFirmwareUpdateResultDurationTimer
{
  return self->_queryFirmwareUpdateResultDurationTimer;
}

- (HMDHAPAccessory)hapAccessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hapAccessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (void)setExpectedApplyDurationTimer:(id)a3
{
}

- (HMFTimer)expectedApplyDurationTimer
{
  return self->_expectedApplyDurationTimer;
}

- (void)setAssetOfferedForCurrentDataStream:(BOOL)a3
{
  self->_assetOfferedForCurrentDataStream = a3;
}

- (BOOL)assetOfferedForCurrentDataStream
{
  return self->_assetOfferedForCurrentDataStream;
}

- (void)setAllowedApplyDurationTimer:(id)a3
{
}

- (HMFTimer)allowedApplyDurationTimer
{
  return self->_allowedApplyDurationTimer;
}

- (void)rescindStagedAsset:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](self, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession rescindStagedAsset:]");
  v6 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  v7 = [v6 firmwareUpdateProfile];
  v8 = [v7 stagedFirmwareVersion];

  if (v8)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__HMDAccessoryFirmwareUpdateSession_rescindStagedAsset___block_invoke;
    v16[3] = &unk_1E6A10900;
    v16[4] = self;
    id v17 = v6;
    id v18 = v4;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__HMDAccessoryFirmwareUpdateSession_rescindStagedAsset___block_invoke_174;
    v14[3] = &unk_1E6A17D78;
    v14[4] = self;
    id v15 = v18;
    [(HMDAccessoryFirmwareUpdateSession *)self _withOpenSocketDoBlock:v16 error:v14];
  }
  else
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      __int16 v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@No staged firmware in accessory %@", buf, 0x16u);
    }
    v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:0 reason:@"No staged firmware in accessory" suggestion:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v13);
  }
}

void __56__HMDAccessoryFirmwareUpdateSession_rescindStagedAsset___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) accessoryFirmwareUpdateManager];
  v3 = [v2 UARPAccessoryForHMDAccessory:*(void *)(a1 + 40)];
  id v4 = [v2 UARPControllerForAccessory:*(void *)(a1 + 40)];
  v16[0] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  char v6 = [v4 rescindStagedFirmwareOnAccessoryList:v5 withUserIntent:1];

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to rescind staged firmware for UARP accessory %@", (uint8_t *)&v12, 0x16u);
    }
    v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:58 description:0 reason:@"Failed to rescind staged firmware for UARP accessory %@" suggestion:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __56__HMDAccessoryFirmwareUpdateSession_rescindStagedAsset___block_invoke_174(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  char v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error opening socket for UARP communication: %@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)privateDescription
{
  v2 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([v2 isAppleAccessory]) {
    [v2 model];
  }
  else {
  id v5 = [v2 productData];
  }
  char v6 = [v2 uuid];
  v7 = [v6 UUIDString];
  int v8 = [v3 stringWithFormat:@"<%@ %@.%@>", v4, v5, v7];

  return v8;
}

- (NSString)description
{
  v2 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  id v3 = NSString;
  if ([v2 isAppleAccessory]) {
    [v2 model];
  }
  else {
  uint64_t v4 = [v2 productData];
  }
  id v5 = [v2 uuid];
  char v6 = [v3 stringWithFormat:@"Session for %@.%@", v4, v5];

  return (NSString *)v6;
}

- (id)logIdentifier
{
  v2 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  id v3 = [v2 logIdentifier];

  return v3;
}

- (void)_logDebugStates:(const char *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  v7 = [v6 firmwareUpdateProfile];
  int v8 = [(HMDAccessoryFirmwareUpdateSession *)self accessoryVersion];
  v9 = [v6 firmwareUpdateProfile];
  v34 = [v9 stagedFirmwareVersion];

  v33 = [(HMDAccessoryFirmwareUpdateSession *)self availableSoftwareVersion];
  unint64_t v10 = [(HMDAccessoryFirmwareUpdateSession *)self nextStateToSchedule];
  id v11 = [v6 softwareUpdate];
  uint64_t v12 = [(HMDAccessoryFirmwareUpdateSession *)self assetID];
  v32 = [v12 assetVersion];

  v13 = (void *)MEMORY[0x1D9452090]();
  __int16 v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v29 = HMFGetLogIdentifier();
    v28 = [NSString stringWithUTF8String:a3];
    uint64_t v16 = [(HMDAccessoryFirmwareUpdateSession *)v14 internalState];
    if ((unint64_t)(v16 - 1) > 4) {
      id v17 = @"Up To Date";
    }
    else {
      id v17 = off_1E6A10938[v16 - 1];
    }
    v26 = v17;
    v30 = v8;
    if (v10 - 1 > 4) {
      id v18 = @"Up To Date";
    }
    else {
      id v18 = off_1E6A10938[v10 - 1];
    }
    v19 = objc_msgSend(v6, "firmwareUpdateProfile", v18);
    [v19 updateState];
    HAPFirmwareUpdateStateAsString();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    v31 = v7;
    v27 = v13;
    if (v11)
    {
      [v11 state];
      HMSoftwareUpdateStateToString();
      __int16 v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v21 = @"NA";
    }
    v22 = [(HMDAccessoryFirmwareUpdateSession *)v14 lastStagedVersion];
    [v31 stagingNotReadyReasons];
    uint64_t v23 = HAPStagingNotReadyReasonsAsString();
    [v31 updateNotReadyReasons];
    v24 = HAPUpdateNotReadyReasonsAsString();
    *(_DWORD *)buf = 138546434;
    v36 = v29;
    __int16 v37 = 2112;
    v38 = v28;
    __int16 v39 = 2112;
    v40 = v26;
    __int16 v41 = 2112;
    uint64_t v42 = v25;
    __int16 v43 = 2112;
    id v44 = v20;
    __int16 v45 = 2112;
    v46 = v21;
    __int16 v47 = 2112;
    v48 = v33;
    __int16 v49 = 2112;
    v50 = v34;
    __int16 v51 = 2112;
    v52 = v22;
    __int16 v53 = 2112;
    v54 = v30;
    __int16 v55 = 2114;
    v56 = v32;
    __int16 v57 = 2114;
    v58 = v23;
    __int16 v59 = 2114;
    v60 = v24;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@%@ States <Session internal %@, next %@, accessory %@, SU %@> Versions <available %@, staged %@ (last %@), accessory %@, asset %{public}@> Not Ready Reasons <Stage (%{public}@) Apply (%{public}@)>", buf, 0x84u);

    if (v11) {
    int v8 = v30;
    }
    v7 = v31;
    v13 = v27;
  }
}

- (void)logDebugStates
{
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HMDAccessoryFirmwareUpdateSession_logDebugStates__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __51__HMDAccessoryFirmwareUpdateSession_logDebugStates__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    char v6 = [*(id *)(a1 + 32) hapAccessory];
    v7 = [*(id *)(a1 + 32) assetID];
    int v8 = [*(id *)(a1 + 32) hapAccessory];
    [v8 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled];
    v9 = HMFBooleanToString();
    int v11 = 138544130;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    __int16 v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory: %@, asset: %@, auto update: %@", (uint8_t *)&v11, 0x2Au);
  }
  return [*(id *)(a1 + 32) _logDebugStates:"\t"];
}

- (void)socket:(id)a3 didFailWithError:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  unint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = HMFGetLogIdentifier();
    [v6 isClosed];
    uint64_t v12 = HMFBooleanToString();
    __int16 v13 = [(HMDAccessoryFirmwareUpdateSession *)v9 hapAccessory];
    int v14 = 138544386;
    __int16 v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    __int16 v21 = v13;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@HDS socket %@ closed: %@ failed for accessory %@ with error %@", (uint8_t *)&v14, 0x34u);
  }
  if (v6 && [v6 isClosed]) {
    [(HMDAccessoryFirmwareUpdateSession *)v9 socketDidClose:v6];
  }
  else {
    [v6 close];
  }
}

- (void)socketDidClose:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ((_os_feature_enabled_impl() & 1) == 0
    && !CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)|| (-[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory"), id v6 = objc_claimAutoreleasedReturnValue(), v7 = [v6 supportsCHIP], v6, !v7))
  {
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    __int16 v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = HMFGetLogIdentifier();
      unint64_t v16 = [(HMDAccessoryFirmwareUpdateSession *)v13 internalState] - 1;
      if (v16 > 4) {
        id v17 = @"Up To Date";
      }
      else {
        id v17 = off_1E6A10938[v16];
      }
      __int16 v18 = [(HMDAccessoryFirmwareUpdateSession *)v13 hapAccessory];
      if ([v18 isReachable]) {
        uint64_t v19 = &stru_1F2C9F1A8;
      }
      else {
        uint64_t v19 = @"unreachable ";
      }
      __int16 v20 = [(HMDAccessoryFirmwareUpdateSession *)v13 hapAccessory];
      *(_DWORD *)uint64_t v42 = 138544130;
      *(void *)&v42[4] = v15;
      *(_WORD *)&v42[12] = 2112;
      *(void *)&v42[14] = v17;
      __int16 v43 = 2112;
      id v44 = v19;
      __int16 v45 = 2112;
      v46 = v20;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@HDS socket closed in state %@ for %@accessory %@", v42, 0x2Au);
    }
    [(HMDAccessoryFirmwareUpdateSession *)v13 _cancelSocketIdleTimer];
    [(HMDAccessoryFirmwareUpdateSession *)v13 setDataStreamSocket:0];
    __int16 v21 = [(HMDAccessoryFirmwareUpdateSession *)v13 hapAccessory];
    __int16 v22 = HAPStringFromAccessoryServerSession();
    [v21 deregisterFromSessionRestore:v22];

    id v23 = [(HMDAccessoryFirmwareUpdateSession *)v13 accessoryFirmwareUpdateManager];
    uint64_t v24 = [v23 UARPControllerForAccessory:v21];

    uint64_t v25 = [(HMDAccessoryFirmwareUpdateSession *)v13 uarpAccessory];
    char v26 = [v24 accessoryUnreachable:v25];

    v27 = (void *)MEMORY[0x1D9452090]();
    v28 = v13;
    v29 = HMFGetOSLogHandle();
    v30 = v29;
    if (v26)
    {
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)uint64_t v42 = 138543362;
      *(void *)&v42[4] = v31;
      v32 = "%{public}@Notified UARP accessory unreacheable";
      v33 = v30;
      os_log_type_t v34 = OS_LOG_TYPE_INFO;
    }
    else
    {
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)uint64_t v42 = 138543362;
      *(void *)&v42[4] = v31;
      v32 = "%{public}@Failed to notify about unreachable accessory to UARP controller";
      v33 = v30;
      os_log_type_t v34 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_1D49D5000, v33, v34, v32, v42, 0xCu);

LABEL_21:
    v35 = [(HMDAccessoryFirmwareUpdateSession *)v28 logEventManager];
    if ([(HMDAccessoryFirmwareUpdateSession *)v28 internalState] == 2)
    {
      [v35 stopStagingWithAccessory:v21];
    }
    else if ([(HMDAccessoryFirmwareUpdateSession *)v28 internalState] == 4)
    {
      v36 = [(HMDAccessoryFirmwareUpdateSession *)v28 allowedApplyDurationTimer];
      int v37 = [v36 isRunning];

      if (v37)
      {
        [v35 stopApplyWithAccessory:v21];
LABEL_32:

        goto LABEL_33;
      }
    }
    else if ([(HMDAccessoryFirmwareUpdateSession *)v28 internalState] == 5 {
           && [(HMDAccessoryFirmwareUpdateSession *)v28 isFirmwareVersionUpToDate])
    }
    {
      v38 = (void *)MEMORY[0x1D9452090]();
      __int16 v39 = v28;
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v41 = HMFGetLogIdentifier();
        *(_DWORD *)uint64_t v42 = 138543362;
        *(void *)&v42[4] = v41;
        _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Registration complete", v42, 0xCu);
      }
      [(HMDAccessoryFirmwareUpdateSession *)v39 _endSession];
    }
    [(HMDAccessoryFirmwareUpdateSession *)v28 _schedule];
    goto LABEL_32;
  }
  int v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  unint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)uint64_t v42 = 138543618;
    *(void *)&v42[4] = v11;
    *(_WORD *)&v42[12] = 2080;
    *(void *)&v42[14] = "-[HMDAccessoryFirmwareUpdateSession socketDidClose:]";
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s: Matter accessory does not use this function", v42, 0x16u);
  }
LABEL_33:
}

- (void)_handleApplyTimerFired
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(HMDAccessoryFirmwareUpdateSession *)self isUserInitiatedInstall];
  id v5 = (void *)MEMORY[0x1D9452090]([(HMDAccessoryFirmwareUpdateSession *)self setUserInitiatedInstall:0]);
  id v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = HMFGetLogIdentifier();
    if (v4) {
      v9 = @"manual";
    }
    else {
      v9 = @"automatic";
    }
    BOOL v10 = [(HMDAccessoryFirmwareUpdateSession *)v6 remoteApplyInProgress];
    int v11 = @"local";
    *(_DWORD *)buf = 138543874;
    __int16 v22 = v8;
    __int16 v23 = 2112;
    if (v10) {
      int v11 = @"remote";
    }
    uint64_t v24 = v9;
    __int16 v25 = 2112;
    char v26 = v11;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Apply timer fired for %@ %@ install", buf, 0x20u);
  }
  -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](v6, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession _handleApplyTimerFired]");
  [(HMDAccessoryFirmwareUpdateSession *)v6 _cancelApplyTimer];
  if ([(HMDAccessoryFirmwareUpdateSession *)v6 isFirmwareVersionUpToDate])
  {
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    __int16 v13 = v6;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v22 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware is up to date", buf, 0xCu);
    }
  }
  else
  {
    objc_initWeak((id *)buf, v6);
    unint64_t v16 = [(HMDAccessoryFirmwareUpdateSession *)v6 hapAccessory];
    id v17 = [v16 firmwareUpdateProfile];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__HMDAccessoryFirmwareUpdateSession__handleApplyTimerFired__block_invoke;
    v18[3] = &unk_1E6A158D8;
    objc_copyWeak(&v19, (id *)buf);
    BOOL v20 = v4;
    [v17 updateProfileWithCompletion:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

void __59__HMDAccessoryFirmwareUpdateSession__handleApplyTimerFired__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isFirmwareVersionUpToDate])
  {
    [WeakRetained _verifyUpdateComplete];
LABEL_18:
    [WeakRetained setRemoteApplyInProgress:0];
    goto LABEL_19;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    if (([WeakRetained remoteApplyInProgress] & 1) == 0) {
      objc_msgSend(WeakRetained, "setInternalState:", objc_msgSend(WeakRetained, "nextStateToSchedule"));
    }
    if (*(unsigned char *)(a1 + 40)) {
      goto LABEL_8;
    }
  }
  if ([WeakRetained remoteApplyInProgress])
  {
LABEL_8:
    id v3 = [WeakRetained hapAccessory];
    int v4 = [v3 isReachable];

    if (v4) {
      [WeakRetained _updateAvailableSoftwareUpdate];
    }
    else {
      [WeakRetained _resetAvailableSoftwareUpdate];
    }
    goto LABEL_18;
  }
  id v5 = (void *)MEMORY[0x1D9452090](objc_msgSend(WeakRetained, "setCurrentAutomaticApplyRetriesCount:", objc_msgSend(WeakRetained, "currentAutomaticApplyRetriesCount") + 1));
  id v6 = WeakRetained;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = HMFGetLogIdentifier();
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "currentAutomaticApplyRetriesCount"));
    *(_DWORD *)buf = 138543618;
    __int16 v18 = v8;
    __int16 v19 = 2112;
    BOOL v20 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Firmware is still not applied after apply timer fired: retries count=%@", buf, 0x16u);
  }
  if ((unint64_t)[v6 currentAutomaticApplyRetriesCount] < 0xB)
  {
    [v6 setInternalState:3];
    dispatch_time_t v14 = dispatch_time(0, 10000000000);
    __int16 v15 = [v6 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__HMDAccessoryFirmwareUpdateSession__handleApplyTimerFired__block_invoke_146;
    block[3] = &unk_1E6A19B30;
    block[4] = v6;
    dispatch_after(v14, v15, block);

    goto LABEL_18;
  }
  BOOL v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = v6;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v18 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Out of retries for automatic apply", buf, 0xCu);
  }
  [v11 _endSession];
LABEL_19:
}

uint64_t __59__HMDAccessoryFirmwareUpdateSession__handleApplyTimerFired__block_invoke_146(uint64_t a1)
{
  return [*(id *)(a1 + 32) _schedule];
}

- (void)_verifyUpdateComplete
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDAccessoryFirmwareUpdateSession *)self isVerifyingUpdate])
  {
    int v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_5:

      return;
    }
    int v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v7;
    int v8 = "%{public}@Verification already in progress";
LABEL_4:
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, v8, buf, 0xCu);

    goto LABEL_5;
  }
  if ([(HMDAccessoryFirmwareUpdateSession *)self internalState] == 4)
  {
    if ([(HMDAccessoryFirmwareUpdateSession *)self isFirmwareVersionUpToDate])
    {
      [(HMDAccessoryFirmwareUpdateSession *)self setUserInitiatedInstall:0];
      [(HMDAccessoryFirmwareUpdateSession *)self setIsVerifyingUpdate:1];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __58__HMDAccessoryFirmwareUpdateSession__verifyUpdateComplete__block_invoke;
      v10[3] = &unk_1E6A18288;
      v10[4] = self;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __58__HMDAccessoryFirmwareUpdateSession__verifyUpdateComplete__block_invoke_133;
      v9[3] = &unk_1E6A197F0;
      v9[4] = self;
      [(HMDAccessoryFirmwareUpdateSession *)self _withOpenSocketDoBlock:v10 error:v9];
      return;
    }
    int v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_5;
    }
    int v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v7;
    int v8 = "%{public}@Firmware is not up to date. Skipping update complete verification";
    goto LABEL_4;
  }
  [(HMDAccessoryFirmwareUpdateSession *)self _schedule];
}

void __58__HMDAccessoryFirmwareUpdateSession__verifyUpdateComplete__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  int v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v27 = 138543362;
    v28 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Asking UARP for Apply Results", (uint8_t *)&v27, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) logEventManager];
  int v7 = [*(id *)(a1 + 32) hapAccessory];
  [v6 startApplyWithAccessory:v7];
  int v8 = [*(id *)(a1 + 32) queryFirmwareUpdateResultDurationTimer];

  if (!v8)
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v27 = 138543362;
      v28 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Start the timer for querying result", (uint8_t *)&v27, 0xCu);
    }
    id v13 = objc_alloc(MEMORY[0x1E4F65580]);
    dispatch_time_t v14 = [MEMORY[0x1E4F65530] sharedPreferences];
    __int16 v15 = [v14 preferenceForKey:@"firmwareUpdateQueryResultDurationAllowance"];
    unint64_t v16 = [v15 numberValue];
    unsigned int v17 = [v16 unsignedIntValue];

    __int16 v18 = (void *)[v13 initWithTimeInterval:1 options:(double)v17];
    [*(id *)(a1 + 32) setQueryFirmwareUpdateResultDurationTimer:v18];

    __int16 v19 = *(void **)(a1 + 32);
    BOOL v20 = [v19 queryFirmwareUpdateResultDurationTimer];
    [v20 setDelegate:v19];

    uint64_t v21 = [*(id *)(a1 + 32) workQueue];
    __int16 v22 = [*(id *)(a1 + 32) queryFirmwareUpdateResultDurationTimer];
    [v22 setDelegateQueue:v21];

    __int16 v23 = [*(id *)(a1 + 32) queryFirmwareUpdateResultDurationTimer];
    [v23 resume];
  }
  uint64_t v24 = [*(id *)(a1 + 32) accessoryFirmwareUpdateManager];
  __int16 v25 = [v24 UARPControllerForAccessory:v7];

  char v26 = [*(id *)(a1 + 32) uarpAccessory];
  [v25 queryFirmwareUpdateResultForAccessory:v26];
}

void __58__HMDAccessoryFirmwareUpdateSession__verifyUpdateComplete__block_invoke_133(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error opening HDS socket: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  [*(id *)(a1 + 32) setIsVerifyingUpdate:0];
  [*(id *)(a1 + 32) _schedule];
}

- (void)_logApplyEventWithStatus:(int64_t)a3
{
  id v5 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [(HMDAccessoryFirmwareUpdateSession *)self _expectedApplyDuration];
  unint64_t v7 = (unint64_t)v6;
  [(HMDAccessoryFirmwareUpdateSession *)self _allowedApplyDuration];
  unint64_t v9 = (unint64_t)v8;
  id v15 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  __int16 v10 = [[HMDAccessoryMetricVendorDetails alloc] initWithAccessory:v15];
  id v11 = [v15 firmwareUpdateProfile];
  uint64_t v12 = [v11 stagedFirmwareVersion];
  id v13 = +[HMDAccessorySoftwareUpdateApplyEvent eventWithMetricVendorDetails:v10 stagedVersion:v12 advertisedDuration:v7 totalAllowedDuration:v9 status:a3];

  dispatch_time_t v14 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v14 submitLogEvent:v13];
}

- (void)timerDidFire:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  double v6 = [(HMDAccessoryFirmwareUpdateSession *)self allowedApplyDurationTimer];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    [(HMDAccessoryFirmwareUpdateSession *)self _logApplyEventWithStatus:2];
    [(HMDAccessoryFirmwareUpdateSession *)self _handleApplyTimerFired];
  }
  else
  {
    double v8 = [(HMDAccessoryFirmwareUpdateSession *)self expectedApplyDurationTimer];
    int v9 = [v4 isEqual:v8];

    if (v9)
    {
      [(HMDAccessoryFirmwareUpdateSession *)self _logApplyEventWithStatus:1];
    }
    else
    {
      __int16 v10 = [(HMDAccessoryFirmwareUpdateSession *)self socketIdleTimer];
      int v11 = [v4 isEqual:v10];

      if (v11)
      {
        [(HMDAccessoryFirmwareUpdateSession *)self _handleSocketTimeout];
      }
      else
      {
        uint64_t v12 = [(HMDAccessoryFirmwareUpdateSession *)self queryFirmwareUpdateResultDurationTimer];
        int v13 = [v4 isEqual:v12];

        if (v13)
        {
          [(HMDAccessoryFirmwareUpdateSession *)self _handleQueryFirmwareUpdateResultTimeout];
        }
        else
        {
          dispatch_time_t v14 = [(HMDAccessoryFirmwareUpdateSession *)self registerFailureRetryTimer];
          int v15 = [v4 isEqual:v14];

          if (v15)
          {
            [(HMDAccessoryFirmwareUpdateSession *)self _handleRegisterFailureRetryTimeout];
          }
          else
          {
            unint64_t v16 = (void *)MEMORY[0x1D9452090]();
            unsigned int v17 = self;
            __int16 v18 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              __int16 v19 = HMFGetLogIdentifier();
              int v20 = 138543362;
              uint64_t v21 = v19;
              _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unknown timer", (uint8_t *)&v20, 0xCu);
            }
          }
        }
      }
    }
  }
}

- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory"), v7 = objc_claimAutoreleasedReturnValue(), int v8 = [v7 supportsCHIP], v7, v8))
  {
    int v9 = (void *)MEMORY[0x1D9452090]();
    __int16 v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v18 = v12;
      __int16 v19 = 2080;
      int v20 = "-[HMDAccessoryFirmwareUpdateSession stagedFirmwareRescindComplete:withStatus:]";
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@%s: Matter Accessory responsible for staging firmware. No action taken.", buf, 0x16u);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    int v13 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__HMDAccessoryFirmwareUpdateSession_stagedFirmwareRescindComplete_withStatus___block_invoke;
    block[3] = &unk_1E6A15DE0;
    objc_copyWeak(v16, (id *)buf);
    v16[1] = (id)a4;
    id v15 = v6;
    dispatch_async(v13, block);

    objc_destroyWeak(v16);
    objc_destroyWeak((id *)buf);
  }
}

void __78__HMDAccessoryFirmwareUpdateSession_stagedFirmwareRescindComplete_withStatus___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = WeakRetained;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138543874;
    int v11 = v6;
    __int16 v12 = 2112;
    int v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Staged firmware rescinded with status: %@ for accessory %@", (uint8_t *)&v10, 0x20u);
  }
  int v9 = [v4 dataStreamSocket];
  [v9 close];
}

- (void)firmwareUpdateResult:(id)a3 vendorSpecificStatus:(unsigned int)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  int v10 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__HMDAccessoryFirmwareUpdateSession_firmwareUpdateResult_vendorSpecificStatus_error___block_invoke;
  v12[3] = &unk_1E6A108D8;
  objc_copyWeak(&v14, &location);
  id v13 = v8;
  unsigned int v15 = a4;
  id v11 = v8;
  dispatch_async(v10, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __85__HMDAccessoryFirmwareUpdateSession_firmwareUpdateResult_vendorSpecificStatus_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = WeakRetained;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
    int v12 = 138543874;
    id v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    unsigned int v17 = v8;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Results from apply accessory %@ status %@", (uint8_t *)&v12, 0x20u);
  }
  [v4 _cancelQueryFirmwareUpdateResultTimer];
  id v9 = [v4 hapAccessory];
  int v10 = [v9 firmwareUpdateProfile];
  id v11 = [v4 accessoryVersion];
  [v10 _updateAccessoryFirmwareVersion:v11];

  [v4 _schedule];
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = self;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = HMFGetLogIdentifier();
    __int16 v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s", UARPFirmwareStagingCompletionStatusToString());
    *(_DWORD *)buf = 138543618;
    __int16 v23 = v13;
    __int16 v24 = 2112;
    __int16 v25 = v14;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@firmwareStagingComplete called with status %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v11);
  workQueue = v11->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__HMDAccessoryFirmwareUpdateSession_firmwareStagingComplete_assetID_withStatus___block_invoke;
  block[3] = &unk_1E6A108B0;
  objc_copyWeak(v21, (id *)buf);
  v21[1] = (id)a5;
  id v19 = v9;
  id v20 = v8;
  id v16 = v8;
  id v17 = v9;
  dispatch_async(workQueue, block);

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);
}

void __80__HMDAccessoryFirmwareUpdateSession_firmwareStagingComplete_assetID_withStatus___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained hapAccessory];
  switch(*(void *)(a1 + 56))
  {
    case 0:
      os_log_type_t v34 = (void *)MEMORY[0x1D9452090]();
      id v35 = WeakRetained;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v48 = (uint64_t)v37;
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Asset staging complete", buf, 0xCu);
      }
      [v35 setAssetOfferedForCurrentDataStream:0];
      v38 = [*(id *)(a1 + 32) softwareVersion];
      [v35 setLastStagedVersion:v38];

      [v35 _logDebugStates:"Updating profile due to firmwareStagingComplete:"];
      __int16 v39 = [v3 firmwareUpdateProfile];
      v40 = [*(id *)(a1 + 32) softwareVersion];
      __int16 v41 = [v40 versionString];
      [v39 updateProfileWithStagedFirmwareVersion:v41];

      goto LABEL_32;
    case 1:
      uint64_t v42 = (void *)MEMORY[0x1D9452090]();
      id v43 = WeakRetained;
      id v44 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      __int16 v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = (uint64_t)v45;
      v46 = "%{public}@Update interrupted";
      goto LABEL_28;
    case 2:
    case 8:
      id v4 = [*(id *)(a1 + 32) softwareVersion];
      id v5 = [WeakRetained assetID];
      id v6 = [v5 softwareVersion];
      char v7 = [v4 isEqualToVersion:v6];

      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = WeakRetained;
      int v10 = HMFGetOSLogHandle();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v11)
        {
          uint64_t v12 = HMFGetLogIdentifier();
          id v13 = (void *)v12;
          uint64_t v14 = *(void *)(a1 + 56);
          uint64_t v15 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          if (v14 == 2) {
            id v16 = @"failed";
          }
          else {
            id v16 = @"rejected";
          }
          uint64_t v48 = v12;
          __int16 v49 = 2112;
          v50 = v16;
          __int16 v51 = 2112;
          uint64_t v52 = v15;
          _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Staging %@ for asset %@", buf, 0x20u);
        }
        [v9 setAssetOfferedForCurrentDataStream:0];
        [v9 _stagingFailed];
        id v17 = v9;
LABEL_31:
        [v17 setUserInitiatedInstall:0];
      }
      else
      {
        if (v11)
        {
          v30 = HMFGetLogIdentifier();
          if (*(void *)(a1 + 56) == 2) {
            v31 = @"failed";
          }
          else {
            v31 = @"rejected";
          }
          uint64_t v32 = *(void *)(a1 + 32);
          v33 = [v9 assetID];
          *(_DWORD *)buf = 138544130;
          uint64_t v48 = (uint64_t)v30;
          __int16 v49 = 2112;
          v50 = v31;
          __int16 v51 = 2112;
          uint64_t v52 = v32;
          __int16 v53 = 2112;
          v54 = v33;
          _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring Staging %@ for asset %@ with current asset %@", buf, 0x2Au);
        }
      }
LABEL_32:

      return;
    case 3:
      uint64_t v42 = (void *)MEMORY[0x1D9452090]();
      id v43 = WeakRetained;
      id v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v45 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v48 = (uint64_t)v45;
        v46 = "%{public}@Accessory disconnected";
LABEL_28:
        _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_DEFAULT, v46, buf, 0xCu);
      }
LABEL_29:

      goto LABEL_30;
    case 4:
    case 5:
      uint64_t v18 = (void *)MEMORY[0x1D9452090]();
      id v19 = WeakRetained;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v48 = (uint64_t)v21;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Update canceled", buf, 0xCu);
      }
      uint64_t v22 = [v19 accessoryFirmwareUpdateManager];
      __int16 v23 = [v19 assetID];
      [v22 resetFirmwareUpdateAccessoryRetryTracking:v3 forAsset:v23];

LABEL_30:
      id v17 = WeakRetained;
      goto LABEL_31;
    default:
      __int16 v24 = (void *)MEMORY[0x1D9452090]();
      id v25 = WeakRetained;
      uint64_t v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        int v27 = HMFGetLogIdentifier();
        objc_msgSend(NSString, "stringWithFormat:", @"%s", UARPFirmwareStagingCompletionStatusToString());
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v29 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v48 = (uint64_t)v27;
        __int16 v49 = 2112;
        v50 = v28;
        __int16 v51 = 2112;
        uint64_t v52 = v29;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Staging completion status %@ not handled for accessory %@", buf, 0x20u);
      }
      [v25 _endSession];
      goto LABEL_32;
  }
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void *)MEMORY[0x1D9452090]();
  id v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    id v16 = [NSNumber numberWithUnsignedInteger:a5];
    id v17 = [NSNumber numberWithUnsignedInteger:a6];
    int v18 = 138544130;
    id v19 = v15;
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    __int16 v23 = v16;
    __int16 v24 = 2112;
    id v25 = v17;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@firmwareStagingProgress called for accessory %@ %@/%@ bytes sent", (uint8_t *)&v18, 0x2Au);
  }
}

- (void)assetAvailablityUpdateForAccessory:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__HMDAccessoryFirmwareUpdateSession_assetAvailablityUpdateForAccessory_assetID___block_invoke;
  v11[3] = &unk_1E6A16550;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __80__HMDAccessoryFirmwareUpdateSession_assetAvailablityUpdateForAccessory_assetID___block_invoke(id *a1)
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = WeakRetained;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [a1[4] assetVersion];
    [a1[4] updateAvailabilityStatus];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", UARPFirmwareUpdateAvailabilityStatusToString());
    [a1[4] downloadStatus];
    uint64_t v9 = UARPAssetDownloadStatusToString();
    [a1[4] releaseNotesAvailabilityStatus];
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s", UARPFirmwareUpdateAvailabilityStatusToString());
    [a1[4] releaseNotesDownloadStatus];
    uint64_t v11 = UARPAssetDownloadStatusToString();
    id v12 = a1[4];
    *(_DWORD *)buf = 138544898;
    v127 = v6;
    __int16 v128 = 2114;
    v129 = v7;
    __int16 v130 = 2114;
    v131 = v8;
    __int16 v132 = 2082;
    uint64_t v133 = v9;
    __int16 v134 = 2114;
    v135 = v10;
    __int16 v136 = 2082;
    uint64_t v137 = v11;
    __int16 v138 = 2112;
    id v139 = v12;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@assetAvailabilityUpdate called with firmware %{public}@,  status: <%{public}@, %{public}s> releaseNotes status: <%{public}@, %{public}s> for asset %@", buf, 0x48u);
  }
  [v4 _logDebugStates:"-[HMDAccessoryFirmwareUpdateSession assetAvailablityUpdateForAccessory:assetID:]_block_invoke"];
  id v13 = [v4 hapAccessory];
  id v14 = [v4 accessoryVersion];
  uint64_t v15 = [v13 firmwareUpdateProfile];
  id v16 = [v15 stagedFirmwareVersion];

  id v17 = [v4 availableSoftwareVersion];
  if ([v13 supportsCHIP])
  {
    uint64_t v18 = [a1[4] softwareVersion];

    id v17 = (void *)v18;
  }
  v125 = [a1[4] softwareVersion];
  id v19 = [v4 assetID];
  __int16 v20 = [v19 softwareVersion];

  uint64_t v21 = [v4 assetID];
  if (v21)
  {
    __int16 v22 = (void *)v21;
    if (([v14 isAtLeastVersion:v125] & 1) != 0
      || ([v16 isAtLeastVersion:v125] & 1) != 0)
    {

      goto LABEL_9;
    }
    char v30 = [v20 isGreaterThanVersion:v125];

    if (v30)
    {
LABEL_9:
      __int16 v23 = (void *)MEMORY[0x1D9452090]();
      id v24 = v4;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        uint64_t v26 = v14;
        int v27 = v17;
        uint64_t v29 = v28 = v20;
        *(_DWORD *)buf = 138544386;
        v127 = v29;
        __int16 v128 = 2112;
        v129 = v125;
        __int16 v130 = 2112;
        v131 = v28;
        __int16 v132 = 2112;
        uint64_t v133 = (uint64_t)v26;
        __int16 v134 = 2112;
        v135 = v16;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring assetAvailability with asset version %@: current asset %@, accessory %@, staged %@", buf, 0x34u);

        __int16 v20 = v28;
        id v17 = v27;
        id v14 = v26;
      }

      [v24 updateAvailableSoftwareUpdate];
      if (![v14 isAtLeastVersion:v125] || objc_msgSend(v24, "internalState") == 4) {
        goto LABEL_77;
      }
LABEL_21:
      [v24 _endSession];
      goto LABEL_77;
    }
  }
  [v4 setAssetID:a1[4]];
  if ([v4 internalState] == 5) {
    objc_msgSend(v4, "setInternalState:", objc_msgSend(v4, "nextStateToSchedule"));
  }
  if ([a1[4] downloadStatus] == 2)
  {
    v31 = (void *)MEMORY[0x1D9452090]();
    id v24 = v4;
    uint64_t v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = v14;
      os_log_type_t v34 = v17;
      v36 = id v35 = v20;
      *(_DWORD *)buf = 138543362;
      v127 = v36;
      _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Firmware failed to download", buf, 0xCu);

      __int16 v20 = v35;
      id v17 = v34;
      id v14 = v33;
    }

    goto LABEL_21;
  }
  int v37 = [v4 accessoryFirmwareUpdateManager];
  v123 = [v37 UARPControllerForAccessory:v13];

  v38 = (void *)MEMORY[0x1D9452090](objc_msgSend(v4, "setUserInitiatedStaging:", objc_msgSend(a1[5], "userInitiatedFirmwareStaging")));
  id v39 = v4;
  v40 = HMFGetOSLogHandle();
  v124 = v16;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v118 = v13;
    __int16 v41 = v14;
    uint64_t v42 = v17;
    v44 = id v43 = v20;
    [a1[5] userInitiatedFirmwareStaging];
    __int16 v45 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    v127 = v44;
    __int16 v128 = 2112;
    v129 = v45;
    _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_DEBUG, "%{public}@userInitiatedFirmwareStaging: %@", buf, 0x16u);

    id v16 = v124;
    __int16 v20 = v43;
    id v17 = v42;
    id v14 = v41;
    id v13 = v118;
  }

  v122 = v39;
  if (v16)
  {
    if ([v17 isGreaterThanVersion:v16]) {
      goto LABEL_26;
    }
LABEL_30:
    v120 = v14;
    v54 = v17;
    uint64_t v55 = v20;
    v56 = (void *)MEMORY[0x1D9452090]();
    id v57 = v39;
    v58 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v59 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v127 = v59;
      _os_log_impl(&dword_1D49D5000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@No asset download needed", buf, 0xCu);

      id v16 = v124;
    }

    [v57 _updateAvailableSoftwareUpdate];
    [v57 _logDebugStates:"-[HMDAccessoryFirmwareUpdateSession assetAvailablityUpdateForAccessory:assetID:]_block_invoke"];
    [v57 _schedule];
LABEL_33:
    __int16 v20 = v55;
    id v17 = v54;
    id v14 = v120;
    goto LABEL_51;
  }
  if (([v17 isGreaterThanVersion:v14] & 1) == 0) {
    goto LABEL_30;
  }
LABEL_26:
  switch([a1[4] updateAvailabilityStatus])
  {
    case 1:
      v60 = (void *)MEMORY[0x1D9452090]();
      id v61 = v39;
      v62 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v64 = v63 = v60;
        id v66 = a1[4];
        id v65 = a1[5];
        *(_DWORD *)buf = 138543874;
        v127 = v64;
        __int16 v128 = 2112;
        v129 = v65;
        __int16 v130 = 2112;
        v131 = v66;
        _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@telling uarpController to download asset for accessory:%@ assetID:%@", buf, 0x20u);

        v60 = v63;
      }

      id v16 = v124;
      if (objc_msgSend(v123, "downloadAvailableFirmwareUpdate:assetID:withUserIntent:", a1[5], a1[4], objc_msgSend(v61, "isUserInitiatedInstall")))break; {
      uint64_t v67 = MEMORY[0x1D9452090]([v61 setUserInitiatedInstall:0]);
      }
      id v68 = v61;
      v69 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        v70 = HMFGetLogIdentifier();
        id v72 = a1[4];
        id v71 = a1[5];
        *(_DWORD *)buf = 138543874;
        v127 = v70;
        __int16 v128 = 2112;
        v129 = v71;
        __int16 v130 = 2112;
        v131 = v72;
        _os_log_impl(&dword_1D49D5000, v69, OS_LOG_TYPE_ERROR, "%{public}@downloadAvailableFirmwareUpdate failed for accessory:%@ assetID:%@", buf, 0x20u);

        id v16 = v124;
      }

      v73 = (void *)v67;
      goto LABEL_50;
    case 2:
      v120 = v14;
      v54 = v17;
      uint64_t v55 = v20;
      v74 = (void *)MEMORY[0x1D9452090]();
      id v75 = v39;
      v76 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        v77 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v127 = v77;
        _os_log_impl(&dword_1D49D5000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware downloading", buf, 0xCu);

        id v16 = v124;
      }

      goto LABEL_33;
    case 3:
      contexta = (void *)MEMORY[0x1D9452090]();
      id v78 = v39;
      v79 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        v80 = HMFGetLogIdentifier();
        [a1[4] localURL];
        v81 = v14;
        v82 = v17;
        v84 = v83 = v20;
        *(_DWORD *)buf = 138543618;
        v127 = v80;
        __int16 v128 = 2114;
        v129 = v84;
        _os_log_impl(&dword_1D49D5000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware downloaded to %{public}@", buf, 0x16u);

        __int16 v20 = v83;
        id v17 = v82;
        id v14 = v81;

        id v16 = v124;
      }

      [v78 _updateAvailableSoftwareUpdate];
      [v78 _schedule];
      break;
    case 6:
    case 7:
    case 8:
      context = (void *)MEMORY[0x1D9452090]();
      id v46 = v39;
      uint64_t v47 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        goto LABEL_49;
      }
      uint64_t v48 = HMFGetLogIdentifier();
      [a1[4] updateAvailabilityStatus];
      v119 = v13;
      __int16 v49 = v14;
      v50 = v17;
      __int16 v51 = v20;
      uint64_t v52 = objc_msgSend(NSString, "stringWithFormat:", @"%s", UARPFirmwareUpdateAvailabilityStatusToString());
      *(_DWORD *)buf = 138543618;
      v127 = v48;
      __int16 v128 = 2114;
      v129 = v52;
      __int16 v53 = "%{public}@Asset not found status, %{public}@";
      goto LABEL_48;
    default:
      context = (void *)MEMORY[0x1D9452090]();
      id v46 = v39;
      uint64_t v47 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        goto LABEL_49;
      }
      uint64_t v48 = HMFGetLogIdentifier();
      [a1[4] updateAvailabilityStatus];
      v119 = v13;
      __int16 v49 = v14;
      v50 = v17;
      __int16 v51 = v20;
      uint64_t v52 = objc_msgSend(NSString, "stringWithFormat:", @"%s", UARPFirmwareUpdateAvailabilityStatusToString());
      *(_DWORD *)buf = 138543618;
      v127 = v48;
      __int16 v128 = 2114;
      v129 = v52;
      __int16 v53 = "%{public}@Ignoring asset availability status %{public}@";
LABEL_48:
      _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_ERROR, v53, buf, 0x16u);

      __int16 v20 = v51;
      id v17 = v50;
      id v14 = v49;
      id v13 = v119;

      id v16 = v124;
LABEL_49:

      v73 = context;
LABEL_50:
      break;
  }
LABEL_51:
  if ([a1[4] releaseNotesDownloadStatus] == 2)
  {
    v85 = (void *)MEMORY[0x1D9452090]();
    id v86 = v122;
    v87 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      v88 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v127 = v88;
      v89 = "%{public}@Release notes failed to download";
      v90 = v87;
      os_log_type_t v91 = OS_LOG_TYPE_ERROR;
LABEL_54:
      _os_log_impl(&dword_1D49D5000, v90, v91, v89, buf, 0xCu);

      id v16 = v124;
    }
LABEL_55:
  }
  else
  {
    switch([a1[4] releaseNotesAvailabilityStatus])
    {
      case 1:
        v121 = v20;
        v98 = (void *)MEMORY[0x1D9452090]();
        id v99 = v122;
        v100 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
        {
          v101 = HMFGetLogIdentifier();
          id v103 = a1[4];
          id v102 = a1[5];
          *(_DWORD *)buf = 138543874;
          v127 = v101;
          __int16 v128 = 2112;
          v129 = v102;
          __int16 v130 = 2112;
          v131 = v103;
          _os_log_impl(&dword_1D49D5000, v100, OS_LOG_TYPE_DEFAULT, "%{public}@telling uarpController to download release notes for accessory:%@ assetID:%@", buf, 0x20u);

          id v16 = v124;
        }

        __int16 v20 = v121;
        if ([v123 downloadReleaseNotes:a1[5] assetID:a1[4]]) {
          break;
        }
        uint64_t v104 = MEMORY[0x1D9452090]();
        id v105 = v99;
        v106 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          v107 = HMFGetLogIdentifier();
          id v109 = a1[4];
          id v108 = a1[5];
          *(_DWORD *)buf = 138543874;
          v127 = v107;
          __int16 v128 = 2112;
          v129 = v108;
          __int16 v130 = 2112;
          v131 = v109;
          _os_log_impl(&dword_1D49D5000, v106, OS_LOG_TYPE_ERROR, "%{public}@Download of release notes failed for accessory:%@ assetID:%@", buf, 0x20u);

          id v16 = v124;
        }

        v110 = (void *)v104;
        goto LABEL_74;
      case 2:
        v85 = (void *)MEMORY[0x1D9452090]();
        id v86 = v122;
        v87 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_55;
        }
        v88 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v127 = v88;
        v89 = "%{public}@Release notes downloading";
        v90 = v87;
        os_log_type_t v91 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_54;
      case 3:
        v121 = v20;
        v111 = (void *)MEMORY[0x1D9452090]();
        id v112 = v122;
        v113 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
        {
          v114 = HMFGetLogIdentifier();
          v115 = [a1[4] releaseNotesLocalURL];
          *(_DWORD *)buf = 138543618;
          v127 = v114;
          __int16 v128 = 2114;
          v129 = v115;
          _os_log_impl(&dword_1D49D5000, v113, OS_LOG_TYPE_DEFAULT, "%{public}@Release notes downloaded to %{public}@", buf, 0x16u);

          id v16 = v124;
        }

        [v112 _updateAvailableSoftwareUpdateDocumentation];
        goto LABEL_75;
      case 6:
      case 7:
      case 8:
        v121 = v20;
        uint64_t v92 = MEMORY[0x1D9452090]();
        id v93 = v122;
        v94 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
          goto LABEL_73;
        }
        v95 = HMFGetLogIdentifier();
        [a1[4] updateAvailabilityStatus];
        v96 = objc_msgSend(NSString, "stringWithFormat:", @"%s", UARPFirmwareUpdateAvailabilityStatusToString());
        *(_DWORD *)buf = 138543618;
        v127 = v95;
        __int16 v128 = 2114;
        v129 = v96;
        v97 = "%{public}@Release notes not found, status %{public}@";
        goto LABEL_72;
      default:
        v121 = v20;
        uint64_t v92 = MEMORY[0x1D9452090]();
        id v93 = v122;
        v94 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
          goto LABEL_73;
        }
        v95 = HMFGetLogIdentifier();
        [a1[4] releaseNotesAvailabilityStatus];
        v96 = objc_msgSend(NSString, "stringWithFormat:", @"%s", UARPFirmwareUpdateAvailabilityStatusToString());
        *(_DWORD *)buf = 138543618;
        v127 = v95;
        __int16 v128 = 2114;
        v129 = v96;
        v97 = "%{public}@Ignoring release notes status: %{public}@";
LABEL_72:
        _os_log_impl(&dword_1D49D5000, v94, OS_LOG_TYPE_ERROR, v97, buf, 0x16u);

        id v16 = v124;
LABEL_73:

        v110 = (void *)v92;
LABEL_74:
LABEL_75:
        __int16 v20 = v121;
        break;
    }
  }

LABEL_77:
}

- (void)_register
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory"), id v4 = objc_claimAutoreleasedReturnValue(), v5 = [v4 supportsCHIP], v4, v5))
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v13 = v9;
      __int16 v14 = 2080;
      uint64_t v15 = "-[HMDAccessoryFirmwareUpdateSession _register]";
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@%s: called on accessory that supports Matter", buf, 0x16u);
    }
    [(HMDAccessoryFirmwareUpdateSession *)v7 resetMatterFirmwareUpdateRetryCount];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__HMDAccessoryFirmwareUpdateSession__register__block_invoke;
    v11[3] = &unk_1E6A18288;
    void v11[4] = self;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__HMDAccessoryFirmwareUpdateSession__register__block_invoke_2;
    v10[3] = &unk_1E6A197F0;
    v10[4] = self;
    [(HMDAccessoryFirmwareUpdateSession *)self _withOpenSocketDoBlock:v11 error:v10];
  }
}

uint64_t __46__HMDAccessoryFirmwareUpdateSession__register__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentRegisterFailureCount:0];
}

void __46__HMDAccessoryFirmwareUpdateSession__register__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 32) uarpAccessory];
    uint64_t v9 = [v8 uuid];
    *(_DWORD *)buf = 138543874;
    id v39 = v7;
    __int16 v40 = 2112;
    __int16 v41 = v9;
    __int16 v42 = 2112;
    id v43 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Register accessory failed for %@ - couldn't open socket error:%@", buf, 0x20u);
  }
  if ((unint64_t)[*(id *)(a1 + 32) currentRegisterFailureCount] < 0xA)
  {
    uint64_t v15 = (void *)MEMORY[0x1D9452090](objc_msgSend(*(id *)(a1 + 32), "setCurrentRegisterFailureCount:", objc_msgSend(*(id *)(a1 + 32), "currentRegisterFailureCount") + 1));
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v39 = v17;
      __int16 v40 = 2112;
      __int16 v41 = &unk_1F2DC8AA0;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Rescheduling register in %@ seconds", buf, 0x16u);
    }
    dispatch_time_t v18 = dispatch_time(0, 10000000000);
    id v19 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__HMDAccessoryFirmwareUpdateSession__register__block_invoke_122;
    block[3] = &unk_1E6A19B30;
    void block[4] = *(void *)(a1 + 32);
    dispatch_after(v18, v19, block);
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) registerFailureRetryTimer];

    if (v10)
    {
      uint64_t v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = *(id *)(a1 + 32);
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        __int16 v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v39 = v14;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Register retry timer is active", buf, 0xCu);
      }
    }
    else
    {
      __int16 v20 = [MEMORY[0x1E4F65530] sharedPreferences];
      uint64_t v21 = [v20 preferenceForKey:@"firmwareUpdateRegisterFailureRetryDuration"];
      __int16 v22 = [v21 numberValue];
      unsigned int v23 = [v22 unsignedIntValue];

      double v24 = (double)v23;
      id v25 = (void *)MEMORY[0x1D9452090]();
      id v26 = *(id *)(a1 + 32);
      int v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = HMFGetLogIdentifier();
        uint64_t v29 = [NSNumber numberWithDouble:v24 / 3600.0];
        *(_DWORD *)buf = 138543618;
        id v39 = v28;
        __int16 v40 = 2112;
        __int16 v41 = v29;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Waiting up to %@ hours to retry registering accessory", buf, 0x16u);
      }
      char v30 = [*(id *)(a1 + 32) registerFailureRetryTimerFactory];
      v31 = v30[2](v30, 1, v24);
      [*(id *)(a1 + 32) setRegisterFailureRetryTimer:v31];

      uint64_t v32 = *(void **)(a1 + 32);
      v33 = [v32 registerFailureRetryTimer];
      [v33 setDelegate:v32];

      os_log_type_t v34 = [*(id *)(a1 + 32) workQueue];
      id v35 = [*(id *)(a1 + 32) registerFailureRetryTimer];
      [v35 setDelegateQueue:v34];

      v36 = [*(id *)(a1 + 32) registerFailureRetryTimer];
      [v36 resume];
    }
  }
}

uint64_t __46__HMDAccessoryFirmwareUpdateSession__register__block_invoke_122(uint64_t a1)
{
  return [*(id *)(a1 + 32) _schedule];
}

- (void)unregisterAccessory
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__HMDAccessoryFirmwareUpdateSession_unregisterAccessory__block_invoke;
  v4[3] = &unk_1E6A16E40;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __56__HMDAccessoryFirmwareUpdateSession_unregisterAccessory__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _endSession];
}

- (void)registerAccessory
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__HMDAccessoryFirmwareUpdateSession_registerAccessory__block_invoke;
  v4[3] = &unk_1E6A16E40;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__HMDAccessoryFirmwareUpdateSession_registerAccessory__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setInternalState:5];
  [WeakRetained _register];
}

- (void)socketDidReceiveData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory"), v5 = objc_claimAutoreleasedReturnValue(), int v6 = [v5 supportsCHIP], v5, v6))
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v10;
      __int16 v17 = 2080;
      dispatch_time_t v18 = "-[HMDAccessoryFirmwareUpdateSession socketDidReceiveData:]";
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@%s: Matter accessory does not use this function", buf, 0x16u);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    workQueue = self->_workQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__HMDAccessoryFirmwareUpdateSession_socketDidReceiveData___block_invoke;
    v12[3] = &unk_1E6A16CE0;
    objc_copyWeak(&v14, (id *)buf);
    id v13 = v4;
    dispatch_async(workQueue, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __58__HMDAccessoryFirmwareUpdateSession_socketDidReceiveData___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained accessoryFirmwareUpdateManager];
  id v4 = [WeakRetained hapAccessory];
  uint64_t v29 = [v3 UARPControllerForAccessory:v4];

  uint64_t v5 = [*(id *)(a1 + 32) readData];
  if (v5)
  {
    id v7 = (void *)v5;
    *(void *)&long long v6 = 138543874;
    long long v28 = v6;
    while (1)
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = WeakRetained;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v11;
        __int16 v33 = 2112;
        os_log_type_t v34 = v12;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@HDS socket received %@ bytes", buf, 0x16u);
      }
      id v13 = [v9 uarpAccessory];
      id v30 = 0;
      char v14 = [v29 recvDataFromAccessory:v13 data:v7 error:&v30];
      id v15 = v30;

      if ((v14 & 1) == 0)
      {
        uint64_t v16 = (void *)MEMORY[0x1D9452090]();
        id v17 = v9;
        dispatch_time_t v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = HMFGetLogIdentifier();
          __int16 v20 = [v17 uarpAccessory];
          *(_DWORD *)buf = v28;
          uint64_t v32 = v19;
          __int16 v33 = 2112;
          os_log_type_t v34 = v20;
          __int16 v35 = 2112;
          id v36 = v15;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Couldn't send data from accessory %@ to controller: %@", buf, 0x20u);
        }
        uint64_t v21 = [v17 dataStreamSocket];
        int v22 = [v21 isClosed];

        if (v22) {
          break;
        }
      }

      uint64_t v23 = [*(id *)(a1 + 32) readData];

      id v7 = (void *)v23;
      if (!v23) {
        goto LABEL_14;
      }
    }
    double v24 = (void *)MEMORY[0x1D9452090]([v17 setDataStreamSocket:0]);
    id v25 = v17;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v27;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Socket closed", buf, 0xCu);
    }
  }
LABEL_14:
  objc_msgSend(WeakRetained, "_resetSocketIdleTimer", v28);
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D9452090]();
  uint64_t v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = HMFGetLogIdentifier();
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
    char v14 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    __int16 v33 = v13;
    __int16 v34 = 2112;
    __int16 v35 = v14;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@sendMessageToAccessory called with %@ bytes", buf, 0x16u);
  }
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](v11, "hapAccessory"), id v15 = objc_claimAutoreleasedReturnValue(), v16 = [v15 supportsCHIP], v15, v16))
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    dispatch_time_t v18 = v11;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v33 = v20;
      __int16 v34 = 2080;
      __int16 v35 = "-[HMDAccessoryFirmwareUpdateSession sendMessageToAccessory:uarpMsg:error:]";
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@%s: Matter accessory does not use this function", buf, 0x16u);
    }
    char v21 = 0;
  }
  else
  {
    int v22 = [(HMDAccessoryFirmwareUpdateSession *)v11 dataStreamSocket];
    uint64_t v23 = v22;
    if (v22 && ![v22 isClosed])
    {
      objc_initWeak((id *)buf, v11);
      workQueue = v11->_workQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__HMDAccessoryFirmwareUpdateSession_sendMessageToAccessory_uarpMsg_error___block_invoke;
      block[3] = &unk_1E6A16E40;
      objc_copyWeak(&v31, (id *)buf);
      dispatch_async(workQueue, block);
      char v21 = [v23 writeData:v9 error:a5];
      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (a5)
      {
        *a5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54 description:0 reason:@"Socket not open" suggestion:0];
      }
      double v24 = (void *)MEMORY[0x1D9452090]();
      id v25 = v11;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        int v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v33 = v27;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@sendMessageToAccessory: Socket not open", buf, 0xCu);
      }
      char v21 = 0;
    }
  }
  return v21;
}

void __74__HMDAccessoryFirmwareUpdateSession_sendMessageToAccessory_uarpMsg_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetSocketIdleTimer];
}

- (id)newDocumentationMetadata
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([(HMDAccessoryFirmwareUpdateSession *)self documentationAvailable])
  {
    id v3 = [(HMDAccessoryFirmwareUpdateSession *)self assetID];
    id v4 = [v3 releaseNotesLocalURL];

    uint64_t v5 = [(HMDAccessoryFirmwareUpdateSession *)self assetID];
    long long v6 = [v5 releaseNotesRemoteURL];

    if (documentationMaxSize_onceToken != -1) {
      dispatch_once(&documentationMaxSize_onceToken, &__block_literal_global_571);
    }
    id v7 = [MEMORY[0x1E4F65530] sharedPreferences];
    if (isInternalBuild())
    {
      id v8 = [v7 preferenceForKey:@"firmwareUpdateDocumentationMaxSize"];
      id v9 = [v8 numberValue];
      uint64_t v10 = [v9 unsignedIntValue];
    }
    else
    {
      uint64_t v10 = 0x200000;
    }

    id v26 = 0;
    id v17 = +[HMDAccessoryFirmwareUpdateSession __calculateDigestDataFromFile:v4 maxDataSize:v10 error:&v26];
    id v18 = v26;
    if (v17)
    {
      id v19 = objc_alloc(MEMORY[0x1E4F2EB40]);
      __int16 v20 = (void *)[objc_alloc(MEMORY[0x1E4F65418]) initWithAlgorithm:2 value:v17];
      int v16 = (void *)[v19 initWithURL:v6 digest:v20];
    }
    else
    {
      char v21 = (void *)MEMORY[0x1D9452090]();
      int v22 = self;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        double v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        long long v28 = v24;
        __int16 v29 = 2112;
        id v30 = v4;
        __int16 v31 = 2112;
        uint64_t v32 = v6;
        __int16 v33 = 2112;
        id v34 = v18;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Couldn't create digest for URLs local %@ remote: %@ error: %@", buf, 0x2Au);
      }
      int v16 = 0;
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      char v14 = HMFGetLogIdentifier();
      id v15 = [(HMDAccessoryFirmwareUpdateSession *)v12 uarpAccessory];
      *(_DWORD *)buf = 138543618;
      long long v28 = v14;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEBUG, "%{public}@No documentation available for %@", buf, 0x16u);
    }
    return 0;
  }
  return v16;
}

- (id)newSoftwareUpdateWithState:(int64_t)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v45 = [(HMDAccessoryFirmwareUpdateSession *)self newDocumentationMetadata];
  uint64_t v47 = [(HMDAccessoryFirmwareUpdateSession *)self availableSoftwareVersion];
  uint64_t v5 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  int v6 = [v5 supportsCHIP];

  if (v6)
  {
    id v7 = [(HMDAccessoryFirmwareUpdateSession *)self uarpAccessory];
    id v8 = [v7 availableFirmwareVersion];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [(HMDAccessoryFirmwareUpdateSession *)self uarpAccessory];
  unsigned int v10 = [v9 firmwareUpdateBytesTotal];
  if (v10 <= 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v46 = v11;

  id v12 = [(HMDAccessoryFirmwareUpdateSession *)self assetID];
  uint64_t v13 = [v12 assetReleaseDate];

  uint64_t v48 = (void *)v13;
  if (!v13)
  {
    char v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = self;
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = HMFGetLogIdentifier();
      id v18 = [(HMDAccessoryFirmwareUpdateSession *)v15 assetID];
      *(_DWORD *)buf = 138543618;
      v50 = v17;
      __int16 v51 = 2112;
      uint64_t v52 = v18;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@No release date set for asset, using current date - assetID %@", buf, 0x16u);
    }
    uint64_t v48 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v19 = (void *)MEMORY[0x1D9452090]();
  __int16 v20 = self;
  char v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    int v22 = HMFGetLogIdentifier();
    uint64_t v23 = HMSoftwareUpdateStateToString();
    double v24 = [NSNumber numberWithUnsignedLongLong:v46];
    id v43 = v19;
    id v25 = NSNumber;
    __int16 v41 = [(HMDAccessoryFirmwareUpdateSession *)v20 uarpAccessory];
    id v26 = objc_msgSend(v25, "numberWithUnsignedInt:", objc_msgSend(v41, "firmwareUpdateBytesTotal"));
    int v27 = [v45 URL];
    long long v28 = NSNumber;
    [(HMDAccessoryFirmwareUpdateSession *)v20 hapAccessory];
    v29 = int64_t v44 = a3;
    [v29 firmwareUpdateProfile];
    v30 = __int16 v42 = v8;
    __int16 v31 = objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v30, "updateDuration"));
    *(_DWORD *)buf = 138545154;
    v50 = v22;
    __int16 v51 = 2112;
    uint64_t v52 = v47;
    __int16 v53 = 2112;
    v54 = v23;
    __int16 v55 = 2112;
    v56 = v24;
    __int16 v57 = 2112;
    v58 = v26;
    __int16 v59 = 2112;
    v60 = v27;
    __int16 v61 = 2112;
    v62 = v48;
    __int16 v63 = 2112;
    v64 = v31;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Creating SoftwareUpdate with version %@, state %@, downloadSize %@(uarpAccessory downloadSize %@), documentation %@, release date %@, duration %@", buf, 0x52u);

    id v8 = v42;
    a3 = v44;

    id v19 = v43;
  }

  uint64_t v32 = [(HMDAccessoryFirmwareUpdateSession *)v20 hapAccessory];
  __int16 v33 = [v32 home];
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    int v34 = [v32 supportsCHIP];
    if (a3 == 2 && v34 && [v33 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled])
    {
      uint64_t v35 = [v33 homeManager];
      uint64_t v36 = [v35 matterSoftwareUpdateProviderDelegate];
      [v36 notifyUpdateRequestedForHMDHAPAccessory:v32 isUserTriggered:0];
    }
  }
  uint64_t v37 = [HMDSoftwareUpdate alloc];
  v38 = [v32 firmwareUpdateProfile];
  id v39 = -[HMDSoftwareUpdate initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:](v37, "initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:", v47, v8, v46, a3, v45, v48, (double)(unint64_t)[v38 updateDuration]);

  return v39;
}

- (void)_updateAvailableSoftwareUpdateDocumentation
{
  id v6 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  id v3 = [v6 softwareUpdate];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 documentationMetadata];
    if (!v5)
    {
      if (![(HMDAccessoryFirmwareUpdateSession *)self documentationAvailable]) {
        goto LABEL_6;
      }
      id v5 = -[HMDAccessoryFirmwareUpdateSession newSoftwareUpdateWithState:](self, "newSoftwareUpdateWithState:", [v4 state]);
      [(HMDAccessoryFirmwareUpdateSession *)self _updateSoftwareUpdateNotReadyReasons];
      [v6 updateSoftwareUpdate:v5 completionHandler:&__block_literal_global_111_124183];
    }
  }
LABEL_6:
}

- (void)_updateAvailableSoftwareUpdateState:(int64_t)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  id v7 = [(HMDAccessoryFirmwareUpdateSession *)self availableSoftwareVersion];
  if (!v7)
  {
    uint64_t v24 = MEMORY[0x1D9452090]();
    id v25 = self;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v27 = HMFGetLogIdentifier();
      unint64_t v28 = [(HMDAccessoryFirmwareUpdateSession *)v25 internalState] - 1;
      if (v28 > 4) {
        __int16 v29 = @"Up To Date";
      }
      else {
        __int16 v29 = off_1E6A10938[v28];
      }
      uint64_t v36 = HMSoftwareUpdateStateToString();
      int v39 = 138543874;
      __int16 v40 = v27;
      __int16 v41 = 2112;
      __int16 v42 = v29;
      __int16 v43 = 2112;
      int64_t v44 = v36;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Not updating state from %@ to %@ because update firmware version is not set by UARP", (uint8_t *)&v39, 0x20u);
    }
    uint64_t v37 = (void *)v24;
    goto LABEL_24;
  }
  if (a3 == 2 && [(HMDAccessoryFirmwareUpdateSession *)self isFirmwareVersionUpToDate])
  {
    uint64_t v8 = MEMORY[0x1D9452090]();
    id v9 = self;
    unsigned int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [(HMDAccessoryFirmwareUpdateSession *)v9 internalState];
      if ((unint64_t)(v12 - 1) > 4) {
        uint64_t v13 = @"Up To Date";
      }
      else {
        uint64_t v13 = off_1E6A10938[v12 - 1];
      }
      int v39 = 138543618;
      __int16 v40 = v11;
      __int16 v41 = 2112;
      __int16 v42 = v13;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Not updating state from %@ to downloaded because firmware version is up to date", (uint8_t *)&v39, 0x16u);
    }
    uint64_t v37 = (void *)v8;
LABEL_24:
    goto LABEL_29;
  }
  char v14 = [v6 softwareUpdate];
  id v15 = v14;
  if (v14
    && ([v14 version],
        int v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v7 isEqualToVersion:v16],
        v16,
        v17))
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = self;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      char v21 = HMFGetLogIdentifier();
      unint64_t v22 = [(HMDAccessoryFirmwareUpdateSession *)v19 internalState] - 1;
      if (v22 > 4) {
        uint64_t v23 = @"Up To Date";
      }
      else {
        uint64_t v23 = off_1E6A10938[v22];
      }
      v38 = HMSoftwareUpdateStateToString();
      int v39 = 138543874;
      __int16 v40 = v21;
      __int16 v41 = 2112;
      __int16 v42 = v23;
      __int16 v43 = 2112;
      int64_t v44 = v38;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating available software update state from %@ to %@", (uint8_t *)&v39, 0x20u);
    }
    [v15 updateLocalState:a3];
  }
  else
  {
    id v30 = (void *)MEMORY[0x1D9452090]();
    __int16 v31 = self;
    uint64_t v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      __int16 v33 = HMFGetLogIdentifier();
      HMSoftwareUpdateStateToString();
      int v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v39 = 138543618;
      __int16 v40 = v33;
      __int16 v41 = 2112;
      __int16 v42 = v34;
      _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@New available software update with state %@", (uint8_t *)&v39, 0x16u);
    }
    id v35 = [(HMDAccessoryFirmwareUpdateSession *)v31 newSoftwareUpdateWithState:a3];
    [(HMDAccessoryFirmwareUpdateSession *)v31 _updateSoftwareUpdateNotReadyReasons];
    [v6 updateSoftwareUpdate:v35 completionHandler:&__block_literal_global_109_124189];
  }
LABEL_29:
}

- (void)updateAvailableSoftwareUpdateState:(int64_t)a3
{
  id v5 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__HMDAccessoryFirmwareUpdateSession_updateAvailableSoftwareUpdateState___block_invoke;
  v6[3] = &unk_1E6A189D0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __72__HMDAccessoryFirmwareUpdateSession_updateAvailableSoftwareUpdateState___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) allowedApplyDurationTimer];

  if (v2)
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = HMFGetLogIdentifier();
      unint64_t v7 = [*(id *)(a1 + 32) internalState] - 1;
      if (v7 > 4) {
        uint64_t v8 = @"Up To Date";
      }
      else {
        uint64_t v8 = off_1E6A10938[v7];
      }
      uint64_t v11 = HMSoftwareUpdateStateToString();
      int v12 = 138543874;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      int v17 = v11;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Not updating available software update state from %@ to %@ because apply timer is active", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    [v9 _updateAvailableSoftwareUpdateState:v10];
  }
}

- (BOOL)documentationAvailable
{
  v2 = [(HMDAccessoryFirmwareUpdateSession *)self assetID];
  id v3 = [v2 releaseNotesLocalURL];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_resetAvailableSoftwareUpdate
{
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  BOOL v4 = [v5 softwareUpdate];

  if (v4) {
    [v5 updateSoftwareUpdate:0 completionHandler:&__block_literal_global_107_124192];
  }
}

- (void)_updateAvailableSoftwareUpdate
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](self, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession _updateAvailableSoftwareUpdate]");
  BOOL v4 = [(HMDAccessoryFirmwareUpdateSession *)self availableSoftwareVersion];
  id v5 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  id v6 = v5;
  if (v4)
  {
    unint64_t v7 = [v5 firmwareUpdateProfile];
    uint64_t v8 = [(HMDAccessoryFirmwareUpdateSession *)self accessoryVersion];
    id v9 = [v7 stagedFirmwareVersion];
    if (([v8 isGreaterThanVersion:v4] & 1) != 0
      || [v9 isGreaterThanVersion:v4])
    {
      uint64_t v10 = (void *)MEMORY[0x1D9452090]();
      uint64_t v11 = self;
      int v12 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
LABEL_7:

LABEL_8:

        goto LABEL_12;
      }
      uint64_t v13 = HMFGetLogIdentifier();
      __int16 v14 = [(HMDAccessoryFirmwareUpdateSession *)v11 accessoryVersion];
      *(_DWORD *)buf = 138544130;
      __int16 v43 = v13;
      __int16 v44 = 2112;
      uint64_t v45 = v4;
      __int16 v46 = 2112;
      uint64_t v47 = v14;
      __int16 v48 = 2112;
      __int16 v49 = v9;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Session available firmware version (%@) is older than either current accessory version (%@) or the staged version (%@)", buf, 0x2Au);

LABEL_6:
      goto LABEL_7;
    }
    if (![v6 supportsCHIP]) {
      goto LABEL_39;
    }
    __int16 v41 = [(HMDAccessoryFirmwareUpdateSession *)self assetID];
    [v41 assetVersionNumber];
    id v19 = v40 = v7;
    __int16 v20 = NSNumber;
    int v39 = [v6 firmwareVersion];
    char v21 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v39, "majorVersion"));
    unint64_t v22 = [(HMDAccessoryFirmwareUpdateSession *)self assetID];
    uint64_t v23 = [v22 assetVersion];
    uint64_t v24 = [v6 displayableFirmwareVersion];
    BOOL v38 = [(HMDAccessoryFirmwareUpdateSession *)self isAccessoryVersionInSyncWithAssetVersion:v19 matterFirmwareRevisionNumber:v21 assetVersionString:v23 matterFirmwareRevisionString:v24];

    unint64_t v7 = v40;
    if (!v38)
    {
      uint64_t v10 = (void *)MEMORY[0x1D9452090]();
      uint64_t v11 = self;
      int v12 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
        goto LABEL_7;
      }
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v43 = v13;
      id v35 = "%{public}@Updating Available Software Update: Waiting for version number and version string to be in sync before proceeding";
    }
    else
    {
LABEL_39:
      if ([v4 isEqualToVersion:v8])
      {
        id v25 = (void *)MEMORY[0x1D9452090]();
        id v26 = self;
        int v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          unint64_t v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v43 = v28;
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Session available firmware version is the same as the current accessory version. Software Update has been installed.", buf, 0xCu);
        }
        __int16 v29 = v26;
        uint64_t v30 = 4;
LABEL_23:
        [(HMDAccessoryFirmwareUpdateSession *)v29 updateAvailableSoftwareUpdateState:v30];
        goto LABEL_8;
      }
      if ([v4 isEqualToVersion:v9])
      {
        __int16 v31 = (void *)MEMORY[0x1D9452090]();
        uint64_t v32 = self;
        __int16 v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          int v34 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v43 = v34;
          _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Session available firmware version is staged on accessory. Software Update has been downloaded.", buf, 0xCu);
        }
        __int16 v29 = v32;
        uint64_t v30 = 2;
        goto LABEL_23;
      }
      if (v9) {
        goto LABEL_8;
      }
      if (![v6 supportsCHIP])
      {
        BOOL v36 = [(HMDAccessoryFirmwareUpdateSession *)self internalState] != 1
           && [(HMDAccessoryFirmwareUpdateSession *)self internalState] != 2;
        uint64_t v37 = [v7 updateState];
        if (!v36 && v37 != 4) {
          [(HMDAccessoryFirmwareUpdateSession *)self _resetAvailableSoftwareUpdate];
        }
        goto LABEL_8;
      }
      uint64_t v10 = (void *)MEMORY[0x1D9452090]();
      uint64_t v11 = self;
      int v12 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
        goto LABEL_7;
      }
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v43 = v13;
      id v35 = "%{public}@Not re-setting software update state for matter accessory";
    }
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, v35, buf, 0xCu);
    goto LABEL_6;
  }
  id v15 = (void *)MEMORY[0x1D9452090]();
  __int16 v16 = self;
  int v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v43 = v18;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@firmware version not available in UARP accessory", buf, 0xCu);
  }
LABEL_12:
}

- (void)updateAvailableSoftwareUpdate
{
  objc_initWeak(&location, self);
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__HMDAccessoryFirmwareUpdateSession_updateAvailableSoftwareUpdate__block_invoke;
  v4[3] = &unk_1E6A16E40;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __66__HMDAccessoryFirmwareUpdateSession_updateAvailableSoftwareUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAvailableSoftwareUpdate];
}

- (void)resetMatterFirmwareUpdateRetryCount
{
}

- (void)incrementMatterFirmwareUpdateRetryCount
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(HMDAccessoryFirmwareUpdateSession *)self isMatterFirmwareUpdateRetryAllowed])
  {
    id v3 = (void *)MEMORY[0x1D9452090]([(HMDAccessoryFirmwareUpdateSession *)self setMatterFirmwareUpdateRetryCount:[(HMDAccessoryFirmwareUpdateSession *)self matterFirmwareUpdateRetryCount]+ 1]);
    BOOL v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v7 = 138543874;
      uint64_t v8 = v6;
      __int16 v9 = 2048;
      uint64_t v10 = [(HMDAccessoryFirmwareUpdateSession *)v4 matterFirmwareUpdateRetryCount];
      __int16 v11 = 2048;
      uint64_t v12 = 10;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Matter firmware update retry attempt %lu of %lu", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (BOOL)isMatterFirmwareUpdateRetryAllowed
{
  return [(HMDAccessoryFirmwareUpdateSession *)self matterFirmwareUpdateRetryCount] < 0xA;
}

- (void)updateAccessoryVendorIDAndProductID
{
  objc_initWeak(&location, self);
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__HMDAccessoryFirmwareUpdateSession_updateAccessoryVendorIDAndProductID__block_invoke;
  v4[3] = &unk_1E6A16E40;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __72__HMDAccessoryFirmwareUpdateSession_updateAccessoryVendorIDAndProductID__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained hapAccessory];
  id v3 = [WeakRetained accessoryFirmwareUpdateManager];
  BOOL v4 = [v3 UARPControllerForAccessory:v2];

  id v5 = [v2 matterVendorID];
  id v6 = [v5 stringValue];
  int v7 = [WeakRetained uarpAccessory];
  char v8 = [v4 updateProperty:7 value:v6 forAccessory:v7];

  __int16 v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = WeakRetained;
  __int16 v11 = HMFGetOSLogHandle();
  uint64_t v12 = v11;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      int v26 = 138543362;
      int v27 = v24;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to update UARP accessory vendor ID property", (uint8_t *)&v26, 0xCu);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    __int16 v14 = [v2 matterVendorID];
    int v26 = 138543618;
    int v27 = v13;
    __int16 v28 = 2112;
    __int16 v29 = v14;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Accessory vendor ID updated to %@", (uint8_t *)&v26, 0x16u);
  }
  id v15 = [v2 matterProductID];
  __int16 v16 = [v15 stringValue];
  int v17 = [v10 uarpAccessory];
  char v18 = [v4 updateProperty:8 value:v16 forAccessory:v17];

  __int16 v9 = (void *)MEMORY[0x1D9452090]();
  id v19 = v10;
  __int16 v20 = HMFGetOSLogHandle();
  char v21 = v20;
  if ((v18 & 1) == 0)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      int v26 = 138543362;
      int v27 = v25;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to update UARP accessory product ID property", (uint8_t *)&v26, 0xCu);
    }
LABEL_14:
    goto LABEL_15;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    unint64_t v22 = HMFGetLogIdentifier();
    uint64_t v23 = [v2 matterProductID];
    int v26 = 138543618;
    int v27 = v22;
    __int16 v28 = 2112;
    __int16 v29 = v23;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Accessory product ID updated to %@", (uint8_t *)&v26, 0x16u);
  }
  [v19 _cancelApplyTimer];
  [v19 _updateAvailableSoftwareUpdate];
LABEL_15:
}

- (void)_updateSoftwareUpdateNotReadyReasons
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  id v5 = [v4 firmwareUpdateProfile];
  __int16 v44 = [v4 softwareUpdate];
  unint64_t v6 = [v5 stagingNotReadyReasons];
  uint64_t v7 = 0;
  if (v6)
  {
    uint64_t v8 = 1;
    unint64_t v9 = v6;
    do
    {
      unint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFBLL;
      uint64_t v11 = v7 | 4;
      unint64_t v12 = v9 & 0xFFFFFFFFFFFFFFFDLL;
      uint64_t v13 = v7 | 2;
      unint64_t v14 = v9 & 0xFFFFFFFFFFFFFFFELL;
      uint64_t v15 = v7 | 1;
      if (v8 != 1)
      {
        uint64_t v15 = v7;
        unint64_t v14 = v9;
      }
      if (v8 != 2)
      {
        uint64_t v13 = v15;
        unint64_t v12 = v14;
      }
      if (v8 != 4)
      {
        uint64_t v11 = v13;
        unint64_t v10 = v12;
      }
      if ((v8 & v6) != 0)
      {
        uint64_t v7 = v11;
        unint64_t v9 = v10;
      }
      v8 *= 2;
    }
    while (v8 - 1 < v6);
  }
  else
  {
    unint64_t v9 = 0;
  }
  __int16 v16 = (void *)MEMORY[0x1D9452090]();
  int v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    char v18 = HMFGetLogIdentifier();
    id v19 = [NSNumber numberWithUnsignedInteger:v9];
    *(_DWORD *)buf = 138543618;
    __int16 v46 = v18;
    __int16 v47 = 2112;
    __int16 v48 = v19;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Unknown stagingNotReadyReasons %@", buf, 0x16u);
  }
  unint64_t v20 = [v5 updateNotReadyReasons];
  uint64_t v21 = 0;
  if (v20)
  {
    uint64_t v22 = 1;
    unint64_t v23 = v20;
    do
    {
      if ((v22 & v20) != 0)
      {
        switch(v22)
        {
          case 1:
            v23 &= ~1uLL;
            v21 |= 1uLL;
            break;
          case 2:
            v23 &= ~2uLL;
            v21 |= 2uLL;
            break;
          case 4:
            v23 &= ~4uLL;
            break;
          case 8:
            v23 &= ~8uLL;
            v21 |= 8uLL;
            break;
          default:
            break;
        }
      }
      v22 *= 2;
    }
    while (v22 - 1 < v20);
  }
  else
  {
    unint64_t v23 = 0;
  }
  uint64_t v24 = (void *)MEMORY[0x1D9452090]();
  id v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = HMFGetLogIdentifier();
    int v27 = [NSNumber numberWithUnsignedInteger:v23];
    *(_DWORD *)buf = 138543618;
    __int16 v46 = v26;
    __int16 v47 = 2112;
    __int16 v48 = v27;
    _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Unknown applyNotReadyReasons %@", buf, 0x16u);
  }
  __int16 v28 = [v4 softwareUpdate];

  if (v28)
  {
    uint64_t v29 = v21 | v7;
    uint64_t v30 = (void *)MEMORY[0x1D9452090]();
    __int16 v31 = self;
    uint64_t v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      __int16 v42 = HMFGetLogIdentifier();
      [v44 needsAttentionReasons];
      __int16 v41 = HMSoftwareUpdateNeedsAttentionReasonsToString();
      __int16 v43 = v30;
      __int16 v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v44, "needsAttentionReasons"));
      BOOL v38 = HMSoftwareUpdateNeedsAttentionReasonsToString();
      int v39 = [NSNumber numberWithUnsignedInteger:v29];
      [v5 stagingNotReadyReasons];
      uint64_t v37 = HAPStagingNotReadyReasonsAsString();
      __int16 v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "stagingNotReadyReasons"));
      [v5 updateNotReadyReasons];
      int v34 = HAPUpdateNotReadyReasonsAsString();
      id v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "updateNotReadyReasons"));
      *(_DWORD *)buf = 138545410;
      __int16 v46 = v42;
      __int16 v47 = 2114;
      __int16 v48 = v41;
      __int16 v49 = 2114;
      uint64_t v50 = v40;
      __int16 v51 = 2114;
      uint64_t v52 = v38;
      __int16 v53 = 2114;
      v54 = v39;
      __int16 v55 = 2114;
      v56 = v37;
      __int16 v57 = 2114;
      v58 = v33;
      __int16 v59 = 2114;
      v60 = v34;
      __int16 v61 = 2114;
      v62 = v35;
      _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@SoftwareUpdate needsAttentionReasons changed - old %{public}@ (%{public}@) new %{public}@ (%{public}@) staging reasons %{public}@ (%{public}@) apply reasons %{public}@ (%{public}@)", buf, 0x5Cu);

      uint64_t v30 = v43;
    }

    BOOL v36 = [v4 softwareUpdate];
    [v36 setNeedsAttentionReasons:v29];
  }
}

- (void)handleNotReadyReasonsChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__HMDAccessoryFirmwareUpdateSession_handleNotReadyReasonsChanged___block_invoke;
  v6[3] = &unk_1E6A16E40;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __66__HMDAccessoryFirmwareUpdateSession_handleNotReadyReasonsChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSoftwareUpdateNotReadyReasons];
}

- (void)handleFirmwareUpdateStateChangedNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__HMDAccessoryFirmwareUpdateSession_handleFirmwareUpdateStateChangedNotification___block_invoke;
  block[3] = &unk_1E6A16CE0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __82__HMDAccessoryFirmwareUpdateSession_handleFirmwareUpdateStateChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [*(id *)(a1 + 32) userInfo];
  id v4 = objc_msgSend(v3, "hmf_numberForKey:", @"HMDAccessoryFirmwareUpdateStateKey");

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    [v4 longValue];
    id v9 = HAPFirmwareUpdateStateAsString();
    int v18 = 138543618;
    id v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory state changed to %@", (uint8_t *)&v18, 0x16u);
  }
  if ([v6 internalState] == 2 && (!objc_msgSend(v4, "longValue") || objc_msgSend(v4, "longValue") == 2))
  {
    unint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = v6;
    unint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v18 = 138543362;
      id v19 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Restarting staging", (uint8_t *)&v18, 0xCu);
    }
    [v11 _schedule];
  }
  else if ([v6 internalState] == 3 && objc_msgSend(v4, "longValue") == 4)
  {
    unint64_t v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = v6;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = HMFGetLogIdentifier();
      int v18 = 138543362;
      id v19 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Detected remote apply in progress", (uint8_t *)&v18, 0xCu);
    }
    [v15 setRemoteApplyInProgress:1];
    [v15 _updateAvailableSoftwareUpdateState:3];
    [v15 startApplyDurationTimers];
  }
  else if ([v6 internalState] == 4 {
         && [v4 longValue] == 3
  }
         && ([v6 isFirmwareVersionUpToDate] & 1) == 0)
  {
    if (([v6 remoteApplyInProgress] & 1) == 0) {
      [v6 _updateAvailableSoftwareUpdate];
    }
    [v6 setRemoteApplyInProgress:0];
    [v6 _applyFailed];
  }
  else if (([v6 internalState] == 2 || objc_msgSend(v6, "internalState") == 1) {
         && [v4 longValue] == 3)
  }
  {
    [v6 stagingComplete];
  }
}

- (void)updateAccessoryStagedFirmwareVersion
{
  objc_initWeak(&location, self);
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__HMDAccessoryFirmwareUpdateSession_updateAccessoryStagedFirmwareVersion__block_invoke;
  v4[3] = &unk_1E6A16E40;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __73__HMDAccessoryFirmwareUpdateSession_updateAccessoryStagedFirmwareVersion__block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained hapAccessory];
  id v3 = [v2 firmwareUpdateProfile];
  id v4 = [v3 stagedFirmwareVersion];

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v6 uarpAccessory];
    unint64_t v10 = [v9 stagedFirmwareVersion];
    int v37 = 138543874;
    BOOL v38 = v8;
    __int16 v39 = 2112;
    __int16 v40 = v10;
    __int16 v41 = 2112;
    __int16 v42 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Staged firmware version changed from %@ to %@", (uint8_t *)&v37, 0x20u);
  }
  [v6 _logDebugStates:"-[HMDAccessoryFirmwareUpdateSession updateAccessoryStagedFirmwareVersion]_block_invoke"];
  id v11 = [v6 accessoryFirmwareUpdateManager];
  unint64_t v12 = [v6 availableSoftwareVersion];
  int v13 = [v4 isGreaterThanVersion:v12];

  if (!v13)
  {
    unint64_t v23 = [v11 UARPControllerForAccessory:v2];
    uint64_t v24 = [v4 versionString];
    id v25 = [v6 uarpAccessory];
    char v26 = [v23 updateProperty:5 value:v24 forAccessory:v25];

    int v27 = (void *)MEMORY[0x1D9452090]();
    id v28 = v6;
    uint64_t v29 = HMFGetOSLogHandle();
    uint64_t v30 = v29;
    if (v26)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        __int16 v31 = HMFGetLogIdentifier();
        int v37 = 138543362;
        BOOL v38 = v31;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Updated UARP staged firmware version property", (uint8_t *)&v37, 0xCu);
      }
      [v28 _updateAvailableSoftwareUpdate];
      if (v4)
      {
        [v28 setLastStagedVersion:v4];
LABEL_19:

        goto LABEL_20;
      }
      __int16 v33 = [v28 availableSoftwareVersion];
      if (v33)
      {

        goto LABEL_19;
      }
      int v34 = [v28 uarpAccessory];
      char v35 = [v23 checkForUpdate:v34];

      if (v35) {
        goto LABEL_19;
      }
      int v27 = (void *)MEMORY[0x1D9452090]();
      id v28 = v28;
      uint64_t v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        BOOL v36 = [v28 uarpAccessory];
        int v37 = 138543874;
        BOOL v38 = v32;
        __int16 v39 = 2112;
        __int16 v40 = v2;
        __int16 v41 = 2112;
        __int16 v42 = v36;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@checkForUpdate failed for accessory %@ %@", (uint8_t *)&v37, 0x20u);

        goto LABEL_17;
      }
    }
    else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = HMFGetLogIdentifier();
      int v37 = 138543362;
      BOOL v38 = v32;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to update UARP staged firmware version property", (uint8_t *)&v37, 0xCu);
LABEL_17:
    }
    goto LABEL_19;
  }
  unint64_t v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = v6;
  __int16 v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = HMFGetLogIdentifier();
    int v18 = [v15 availableSoftwareVersion];
    int v37 = 138543618;
    BOOL v38 = v17;
    __int16 v39 = 2112;
    __int16 v40 = v18;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Staged firmware version newer than available version (%@)", (uint8_t *)&v37, 0x16u);
  }
  if (([v11 checkForUpdateForAccessory:v2] & 1) == 0)
  {
    id v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = v15;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v37 = 138543362;
      BOOL v38 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Error request UARP to check for available updates", (uint8_t *)&v37, 0xCu);
    }
  }
LABEL_20:
}

- (void)updateAccessoryFirmwareVersion
{
  objc_initWeak(&location, self);
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__HMDAccessoryFirmwareUpdateSession_updateAccessoryFirmwareVersion__block_invoke;
  v4[3] = &unk_1E6A16E40;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __67__HMDAccessoryFirmwareUpdateSession_updateAccessoryFirmwareVersion__block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained hapAccessory];
  id v3 = [WeakRetained accessoryFirmwareUpdateManager];
  id v4 = [v3 UARPControllerForAccessory:v2];

  id v5 = [WeakRetained accessoryVersion];
  id v6 = [v5 versionString];

  if (![v2 supportsCHIP])
  {
LABEL_4:
    id v19 = [WeakRetained uarpAccessory];
    char v20 = [v4 updateProperty:4 value:v6 forAccessory:v19];

    uint64_t v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = WeakRetained;
    unint64_t v23 = HMFGetOSLogHandle();
    uint64_t v24 = v23;
    if (v20)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v25 = HMFGetLogIdentifier();
        char v26 = [v22 accessoryVersion];
        *(_DWORD *)buf = 138544130;
        int v37 = v25;
        __int16 v38 = 2112;
        __int16 v39 = v2;
        __int16 v40 = 2112;
        __int16 v41 = v6;
        __int16 v42 = 2112;
        uint64_t v43 = v26;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Accessory %@: UARP accessory firmware version property updated to %@ (accessoryVersion is %@)", buf, 0x2Au);
      }
      [v22 _cancelApplyTimer];
      [v22 _updateAvailableSoftwareUpdate];
      [v22 _verifyUpdateComplete];
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        int v37 = v27;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to update UARP accessory firmware version property", buf, 0xCu);
      }
    }
    goto LABEL_14;
  }
  int v34 = v6;
  char v35 = v4;
  id v7 = [WeakRetained assetID];
  id v8 = [v7 assetVersionNumber];
  id v9 = NSNumber;
  unint64_t v10 = [v2 firmwareVersion];
  id v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "majorVersion"));
  unint64_t v12 = [WeakRetained assetID];
  int v13 = [v12 assetVersion];
  unint64_t v14 = [v2 displayableFirmwareVersion];
  char v15 = [WeakRetained isAccessoryVersionInSyncWithAssetVersion:v8 matterFirmwareRevisionNumber:v11 assetVersionString:v13 matterFirmwareRevisionString:v14];

  if (v15)
  {
    __int16 v16 = [v2 firmwareUpdateProfile];
    int v17 = [v16 matterFirmwareUpdateProfile];
    int v18 = [v17 matterFirmwareRevisionNumber];

    id v6 = [v18 stringValue];

    id v4 = v35;
    goto LABEL_4;
  }
  id v28 = (void *)MEMORY[0x1D9452090]();
  id v29 = WeakRetained;
  uint64_t v30 = HMFGetOSLogHandle();
  id v6 = v34;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    __int16 v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v37 = v31;
    _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Waiting for version number and version string to be in sync before proceeding", buf, 0xCu);
  }
  uint64_t v32 = [v2 firmwareUpdateProfile];
  __int16 v33 = [v32 matterFirmwareUpdateProfile];
  [v33 readMatterFirmwareUpdateCharacteristics];

  id v4 = v35;
LABEL_14:
}

- (BOOL)isAccessoryVersionInSyncWithAssetVersion:(id)a3 matterFirmwareRevisionNumber:(id)a4 assetVersionString:(id)a5 matterFirmwareRevisionString:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unint64_t v14 = [v11 stringValue];
  if (v14)
  {
    char v15 = [v10 isEqualToValue:v11];
    char v38 = [v12 isEqualToString:v13];
    __int16 v16 = (void *)MEMORY[0x1D9452090]();
    int v17 = self;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      HMFBooleanToString();
      id v36 = v12;
      id v37 = v13;
      uint64_t v21 = v20 = v10;
      HMFBooleanToString();
      unint64_t v23 = v22 = v15;
      *(_DWORD *)buf = 138543874;
      __int16 v40 = v19;
      __int16 v41 = 2112;
      id v42 = v21;
      __int16 v43 = 2112;
      id v44 = v23;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@isAccessoryVersionInSyncWithAssetVersion: VersionNumberInSync : %@, VersionStringInSync: %@", buf, 0x20u);

      char v15 = v22;
      id v10 = v20;
      id v12 = v36;
      id v13 = v37;
    }
    uint64_t v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = v17;
    char v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = char v27 = v15;
      *(_DWORD *)buf = 138544386;
      __int16 v40 = v28;
      __int16 v41 = 2112;
      id v42 = v10;
      __int16 v43 = 2112;
      id v44 = v11;
      __int16 v45 = 2112;
      id v46 = v12;
      __int16 v47 = 2112;
      id v48 = v13;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@isAccessoryVersionInSyncWithAssetVersion: AssetVersionNumber: %@, MatterFirmwareRevisionNumber: %@, AssetVersionString %@, FirmwareVersionString: %@", buf, 0x34u);

      char v15 = v27;
    }

    char v29 = v15 & v38;
  }
  else
  {
    id v30 = v10;
    __int16 v31 = (void *)MEMORY[0x1D9452090]();
    uint64_t v32 = self;
    __int16 v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      int v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v40 = v34;
      __int16 v41 = 2112;
      id v42 = 0;
      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Matter firmware version is invalid: %@", buf, 0x16u);
    }
    char v29 = 0;
    id v10 = v30;
  }

  return v29;
}

- (void)handleAccessoryFirmwareVersionChangedNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Received accessory firmware updated notification", (uint8_t *)&v9, 0xCu);
  }
  [(HMDAccessoryFirmwareUpdateSession *)v6 updateAccessoryFirmwareVersion];
}

- (void)handleAccessoryVIDPIDChangedNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Received matter VID PID updated notification", (uint8_t *)&v9, 0xCu);
  }
  [(HMDAccessoryFirmwareUpdateSession *)v6 updateAccessoryVendorIDAndProductID];
}

- (void)handleAccessoryFirmwareVersionNumberChangedNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Received accessory firmware version number updated notification", (uint8_t *)&v9, 0xCu);
  }
  [(HMDAccessoryFirmwareUpdateSession *)v6 updateAccessoryFirmwareVersion];
}

- (void)_updateSoftwareUpdateStateForMatterAccessoryWithState:(unint64_t)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    id v4 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
    id v5 = [(__CFString *)v4 softwareUpdate];
    id v6 = [(HMDAccessoryFirmwareUpdateSession *)self accessoryVersion];
    id v7 = [(HMDAccessoryFirmwareUpdateSession *)self availableSoftwareVersion];
    if ([v7 isEqualToVersion:v6])
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      int v9 = self;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        id v12 = [(HMDAccessoryFirmwareUpdateSession *)v9 uarpAccessory];
        int v27 = 138544130;
        uint64_t v28 = (uint64_t)v11;
        __int16 v29 = 2112;
        id v30 = v4;
        __int16 v31 = 2112;
        uint64_t v32 = v12;
        __int16 v33 = 2112;
        int v34 = v5;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Update is already installed for acc:%@ uarpAcc:%@ softwareUpdate:%@", (uint8_t *)&v27, 0x2Au);
      }
      uint64_t v13 = 4;
    }
    else
    {
      uint64_t v13 = 2;
      if (([(__CFString *)v4 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled] & 1) == 0&& v5)
      {
        if ((([v5 state] - 3) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
          uint64_t v13 = 2;
        }
        else {
          uint64_t v13 = 5;
        }
      }
    }
    char v22 = (void *)MEMORY[0x1D9452090]();
    unint64_t v23 = self;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = HMFGetLogIdentifier();
      HMSoftwareUpdateStateToString();
      char v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v27 = 138543618;
      uint64_t v28 = (uint64_t)v25;
      __int16 v29 = 2112;
      id v30 = v26;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Marking Update as %@, matter accessory will trigger staging by itself.", (uint8_t *)&v27, 0x16u);
    }
    [(HMDAccessoryFirmwareUpdateSession *)v23 updateAvailableSoftwareUpdateState:v13];
  }
  else
  {
    char v15 = (void *)MEMORY[0x1D9452090](self, a2);
    __int16 v16 = self;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      id v19 = (void *)v18;
      id v20 = @"Up-To-Date";
      if (a3 == 2) {
        id v20 = @"Needs Apply";
      }
      if (a3 == 3) {
        id v20 = @"Needs Register";
      }
      int v27 = 138543618;
      uint64_t v28 = v18;
      __int16 v29 = 2112;
      id v30 = v20;
      uint64_t v21 = v20;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unsupported state %@ for Matter Accessory, ignoring.", (uint8_t *)&v27, 0x16u);
    }
  }
}

- (void)_cancelApplyTimer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAccessoryFirmwareUpdateSession *)self allowedApplyDurationTimer];
  if (v4)
  {
  }
  else
  {
    id v5 = [(HMDAccessoryFirmwareUpdateSession *)self expectedApplyDurationTimer];

    if (!v5) {
      return;
    }
  }
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    int v12 = 138543362;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Apply timer cancelled", (uint8_t *)&v12, 0xCu);
  }
  id v10 = [(HMDAccessoryFirmwareUpdateSession *)v7 allowedApplyDurationTimer];
  [v10 suspend];

  [(HMDAccessoryFirmwareUpdateSession *)v7 setAllowedApplyDurationTimer:0];
  uint64_t v11 = [(HMDAccessoryFirmwareUpdateSession *)v7 expectedApplyDurationTimer];
  [v11 suspend];

  [(HMDAccessoryFirmwareUpdateSession *)v7 setExpectedApplyDurationTimer:0];
}

- (void)_endSession
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](self, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession _endSession]");
  id v4 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& [v4 supportsCHIP])
  {
    id v5 = [v4 firmwareUpdateProfile];
    id v6 = [v5 matterFirmwareUpdateProfile];
    id v7 = [v6 matterSoftwareUpdateProviderDelegate];

    if (v7)
    {
      [v7 resetOTAProviderStateForHMDHAPAccessory:v4];
    }
    else
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      int v9 = self;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        int v23 = 138543362;
        uint64_t v24 = v11;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Couldn't get a strong ref to the software update provider delegate", (uint8_t *)&v23, 0xCu);
      }
    }
    [(HMDAccessoryFirmwareUpdateSession *)self resetMatterFirmwareUpdateRetryCount];
  }
  int v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    char v15 = HMFGetLogIdentifier();
    [(HMDAccessoryFirmwareUpdateSession *)v13 sessionEnded];
    __int16 v16 = HMFBooleanToString();
    int v23 = 138543618;
    uint64_t v24 = v15;
    __int16 v25 = 2112;
    char v26 = v16;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Session ended (already ended: %@)", (uint8_t *)&v23, 0x16u);
  }
  if (![(HMDAccessoryFirmwareUpdateSession *)v13 sessionEnded])
  {
    [(HMDAccessoryFirmwareUpdateSession *)v13 setSessionEnded:1];
    id WeakRetained = objc_loadWeakRetained((id *)&v13->_hapAccessory);
    uint64_t v18 = [WeakRetained firmwareUpdateProfile];
    [v18 monitorCharacteristics:0];

    id v19 = [(HMDAccessoryFirmwareUpdateSession *)v13 dataStreamSocket];
    [v19 close];

    [(HMDAccessoryFirmwareUpdateSession *)v13 setInternalState:0];
    [(HMDAccessoryFirmwareUpdateSession *)v13 _updateAvailableSoftwareUpdate];
    id v20 = [(HMDAccessoryFirmwareUpdateSession *)v13 accessoryFirmwareUpdateManager];
    uint64_t v21 = [(HMDAccessoryFirmwareUpdateSession *)v13 assetID];
    [v20 resetFirmwareUpdateAccessoryRetryTracking:v4 forAsset:v21];

    [v20 removeSession:v13];
    char v22 = [(HMDAccessoryFirmwareUpdateSession *)v13 updateScheduler];
    [v22 removeUpdatePolicy];
  }
}

- (void)_schedule
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  unint64_t v4 = [(HMDAccessoryFirmwareUpdateSession *)self internalState];
  id v5 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  [(HMDAccessoryFirmwareUpdateSession *)self setInternalState:[(HMDAccessoryFirmwareUpdateSession *)self nextStateToSchedule]];
  if (![(HMDAccessoryFirmwareUpdateSession *)self isVerifyingUpdate]
    && ![(HMDAccessoryFirmwareUpdateSession *)self internalState])
  {
    char v15 = (void *)MEMORY[0x1D9452090]();
    __int16 v16 = self;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v23 = 138543362;
      uint64_t v24 = v18;
      id v19 = "%{public}@Update successful";
      id v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_INFO;
LABEL_21:
      _os_log_impl(&dword_1D49D5000, v20, v21, v19, (uint8_t *)&v23, 0xCu);
    }
LABEL_22:

    [(HMDAccessoryFirmwareUpdateSession *)v16 _endSession];
    goto LABEL_23;
  }
  if (v4 - 3 <= 1 && [(HMDAccessoryFirmwareUpdateSession *)self internalState] == 1)
  {
    id v6 = [(HMDAccessoryFirmwareUpdateSession *)self accessoryFirmwareUpdateManager];
    id v7 = [(HMDAccessoryFirmwareUpdateSession *)self assetID];
    char v8 = [v6 isFirmwareUpdateRetryAllowedForAccessory:v5 forAsset:v7];

    if ((v8 & 1) == 0)
    {
      char v15 = (void *)MEMORY[0x1D9452090]();
      __int16 v16 = self;
      int v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        int v23 = 138543362;
        uint64_t v24 = v18;
        id v19 = "%{public}@No more staging retries for this accessory's firmware update session";
        id v20 = v17;
        os_log_type_t v21 = OS_LOG_TYPE_ERROR;
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& [v5 supportsCHIP]&& -[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState") == 1)
  {
    [(HMDAccessoryFirmwareUpdateSession *)self _updateSoftwareUpdateStateForMatterAccessoryWithState:1];
  }
  else
  {
    int v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      uint64_t v13 = [(HMDAccessoryFirmwareUpdateSession *)v10 internalState];
      if ((unint64_t)(v13 - 1) > 4) {
        uint64_t v14 = @"Up To Date";
      }
      else {
        uint64_t v14 = off_1E6A10938[v13 - 1];
      }
      int v23 = 138543618;
      uint64_t v24 = v12;
      __int16 v25 = 2112;
      char v26 = v14;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Scheduling next operation, state %@", (uint8_t *)&v23, 0x16u);
    }
    char v22 = [(HMDAccessoryFirmwareUpdateSession *)v10 updateScheduler];
    [v22 scheduleWithDelay:1];
  }
LABEL_23:
}

- (void)_applyFailed
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory"), unint64_t v4 = objc_claimAutoreleasedReturnValue(), v5 = [v4 supportsCHIP], v4, v5))
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    char v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      int v14 = 138543618;
      char v15 = v9;
      __int16 v16 = 2080;
      int v17 = "-[HMDAccessoryFirmwareUpdateSession _applyFailed]";
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@%s: Matter Accessory responsible for managing firmware application. No action taken.", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      char v15 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Apply did not complete or failed in the accessory", (uint8_t *)&v14, 0xCu);
    }
    if ([(HMDAccessoryFirmwareUpdateSession *)v11 isStagedFirmwareVersionUpToDate])
    {
      [(HMDAccessoryFirmwareUpdateSession *)v11 setInternalState:3];
      if ([(HMDAccessoryFirmwareUpdateSession *)v11 isUserInitiatedInstall])
      {
        [(HMDAccessoryFirmwareUpdateSession *)v11 setUserInitiatedInstall:0];
        [(HMDAccessoryFirmwareUpdateSession *)v11 _updateAvailableSoftwareUpdate];
      }
      else
      {
        [(HMDAccessoryFirmwareUpdateSession *)v11 _evaluateHDSRetryForApplyFirmware];
      }
    }
    else
    {
      [(HMDAccessoryFirmwareUpdateSession *)v11 _endSession];
    }
  }
}

- (void)_stagingFailed
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  unint64_t v4 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& [v4 supportsCHIP])
  {
    int v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      char v8 = HMFGetLogIdentifier();
      int v20 = 138543618;
      os_log_type_t v21 = v8;
      __int16 v22 = 2080;
      int v23 = "-[HMDAccessoryFirmwareUpdateSession _stagingFailed]";
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@%s: Matter Accessory responsible for managing firmware staging. No action taken.", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    int v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      int v20 = 138543362;
      os_log_type_t v21 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Staging failed", (uint8_t *)&v20, 0xCu);
    }
    [(HMDAccessoryFirmwareUpdateSession *)v10 _endSession];
    uint64_t v13 = [(HMDAccessoryFirmwareUpdateSession *)v10 accessoryFirmwareUpdateManager];
    int v14 = [(HMDAccessoryFirmwareUpdateSession *)v10 assetID];
    int v15 = [v13 isFirmwareUpdateRetryAllowedForAccessory:v4 forAsset:v14];

    if (v15)
    {
      [v13 checkForUpdateForAccessory:v4];
    }
    else
    {
      __int16 v16 = (void *)MEMORY[0x1D9452090]();
      int v17 = v10;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        int v20 = 138543362;
        os_log_type_t v21 = v19;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@No more staging retries for this accessory's firmware update session", (uint8_t *)&v20, 0xCu);
      }
    }
  }
}

- (void)_automaticUpdateEnabledChanged:(BOOL)a3
{
  if (a3 && [(HMDAccessoryFirmwareUpdateSession *)self internalState] == 3)
  {
    [(HMDAccessoryFirmwareUpdateSession *)self _schedule];
  }
}

- (void)_handleAutomaticUpdateEnabledChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int v5 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HMDAccessoryFirmwareUpdateSession__handleAutomaticUpdateEnabledChanged___block_invoke;
  block[3] = &unk_1E6A16CE0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __74__HMDAccessoryFirmwareUpdateSession__handleAutomaticUpdateEnabledChanged___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v9 = 0;
  id v3 = [*(id *)(a1 + 32) userInfo];
  uint64_t v4 = objc_msgSend(v3, "hmf_BOOLForKey:isPresent:", @"kEnabledKey", &v9);

  if (v9)
  {
    [WeakRetained _automaticUpdateEnabledChanged:v4];
  }
  else
  {
    int v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Notification missing required key", buf, 0xCu);
    }
  }
}

- (double)_expectedApplyDuration
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  int v5 = [v4 firmwareUpdateProfile];
  uint64_t v6 = [v5 updateDuration];

  if (!v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    char v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Expected duration is not set - default to minimum apply duration", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v6 = minimumApplyDurationAllowance();
  }
  return (double)(unint64_t)v6;
}

- (double)_allowedApplyDuration
{
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDAccessoryFirmwareUpdateSession *)self _expectedApplyDuration];
  double v5 = v4;
  uint64_t v6 = minimumApplyDurationAllowance();
  if (v5 < (double)(unint64_t)v6) {
    double v5 = (double)(unint64_t)v6;
  }
  [(HMDAccessoryFirmwareUpdateSession *)self _expectedApplyDuration];
  return v7 + v5;
}

- (double)expectedApplyDuration
{
  uint64_t v7 = 0;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__HMDAccessoryFirmwareUpdateSession_expectedApplyDuration__block_invoke;
  v6[3] = &unk_1E6A18690;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __58__HMDAccessoryFirmwareUpdateSession_expectedApplyDuration__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _expectedApplyDuration];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)allowedApplyDuration
{
  uint64_t v7 = 0;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HMDAccessoryFirmwareUpdateSession_allowedApplyDuration__block_invoke;
  v6[3] = &unk_1E6A18690;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __57__HMDAccessoryFirmwareUpdateSession_allowedApplyDuration__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _allowedApplyDuration];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)startApplyDurationTimers
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(HMDAccessoryFirmwareUpdateSession *)self _allowedApplyDuration];
  double v4 = v3;
  double v5 = [(HMDAccessoryFirmwareUpdateSession *)self allowedApplyDurationTimer];

  if (!v5)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:v4];
    [(HMDAccessoryFirmwareUpdateSession *)self setAllowedApplyDurationTimer:v6];

    uint64_t v7 = [(HMDAccessoryFirmwareUpdateSession *)self allowedApplyDurationTimer];
    [v7 setDelegate:self];

    id v8 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
    uint64_t v9 = [(HMDAccessoryFirmwareUpdateSession *)self allowedApplyDurationTimer];
    [v9 setDelegateQueue:v8];

    id v10 = objc_alloc(MEMORY[0x1E4F65580]);
    [(HMDAccessoryFirmwareUpdateSession *)self _expectedApplyDuration];
    uint64_t v11 = objc_msgSend(v10, "initWithTimeInterval:options:", 1);
    [(HMDAccessoryFirmwareUpdateSession *)self setExpectedApplyDurationTimer:v11];

    int v12 = [(HMDAccessoryFirmwareUpdateSession *)self expectedApplyDurationTimer];
    [v12 setDelegate:self];

    uint64_t v13 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
    uint64_t v14 = [(HMDAccessoryFirmwareUpdateSession *)self expectedApplyDurationTimer];
    [v14 setDelegateQueue:v13];
  }
  int v15 = (void *)MEMORY[0x1D9452090]();
  __int16 v16 = self;
  int v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    id v19 = [NSNumber numberWithDouble:v4];
    int v22 = 138543618;
    int v23 = v18;
    __int16 v24 = 2112;
    __int16 v25 = v19;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Waiting up to %@ seconds for accessory to apply update", (uint8_t *)&v22, 0x16u);
  }
  int v20 = [(HMDAccessoryFirmwareUpdateSession *)v16 allowedApplyDurationTimer];
  [v20 resume];

  os_log_type_t v21 = [(HMDAccessoryFirmwareUpdateSession *)v16 expectedApplyDurationTimer];
  [v21 resume];
}

- (void)_applyFirmware
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  double v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& [v4 supportsCHIP])
  {
    double v5 = (void *)MEMORY[0x1D9452090]();
    uint64_t v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v31 = v8;
      __int16 v32 = 2080;
      __int16 v33 = "-[HMDAccessoryFirmwareUpdateSession _applyFirmware]";
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@%s: Matter Accessory responsible for managing firmware application. No action taken.", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v9 = [(HMDAccessoryFirmwareUpdateSession *)self accessoryFirmwareUpdateManager];
    id v10 = [v9 UARPControllerForAccessory:v4];

    uint64_t v11 = (void *)MEMORY[0x1D9452090]([(HMDAccessoryFirmwareUpdateSession *)self setInternalState:4]);
    int v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v31 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@telling uarpController to apply asset", buf, 0xCu);
    }
    int v15 = [(HMDAccessoryFirmwareUpdateSession *)v12 uarpAccessory];
    __int16 v29 = v15;
    __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    char v17 = objc_msgSend(v10, "applyFirmwareUpdateOnAccessoryList:withUserIntent:", v16, -[HMDAccessoryFirmwareUpdateSession isUserInitiatedInstall](v12, "isUserInitiatedInstall"));

    if (v17)
    {
      uint64_t v18 = [v4 softwareUpdate];
      [v18 updateLocalState:3];

      id v19 = [v4 firmwareUpdateProfile];
      if (v19)
      {
        [(HMDAccessoryFirmwareUpdateSession *)v12 startApplyDurationTimers];
      }
      else
      {
        __int16 v25 = (void *)MEMORY[0x1D9452090]();
        uint64_t v26 = v12;
        uint64_t v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v31 = v28;
          __int16 v32 = 2112;
          __int16 v33 = (const char *)v4;
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@No firmwareUpdateProfile for accessory: %@", buf, 0x16u);
        }
        [(HMDAccessoryFirmwareUpdateSession *)v26 _endSession];
      }
    }
    else
    {
      int v20 = (void *)MEMORY[0x1D9452090]([(HMDAccessoryFirmwareUpdateSession *)v12 setUserInitiatedInstall:0]);
      os_log_type_t v21 = v12;
      int v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = HMFGetLogIdentifier();
        __int16 v24 = [(HMDAccessoryFirmwareUpdateSession *)v21 uarpAccessory];
        *(_DWORD *)buf = 138543618;
        __int16 v31 = v23;
        __int16 v32 = 2112;
        __int16 v33 = v24;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@applyFirmwareUpdateOnAccessoryList failed for %@", buf, 0x16u);
      }
    }
  }
}

- (void)applyFirmware
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  double v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& [v4 supportsCHIP])
  {
    double v5 = (void *)MEMORY[0x1D9452090]();
    uint64_t v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v8;
      __int16 v29 = 2080;
      id v30 = "-[HMDAccessoryFirmwareUpdateSession applyFirmware]";
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@%s: Matter Accessory responsible for managing firmware application. No action taken.", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v9 = [v4 home];
    if (v9)
    {
      if (([v4 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled] & 1) != 0
        || [(HMDAccessoryFirmwareUpdateSession *)self isUserInitiatedInstall])
      {
        id v10 = [v4 firmwareUpdateProfile];
        uint64_t v11 = [v10 stagedFirmwareVersion];

        int v12 = [(HMDAccessoryFirmwareUpdateSession *)self availableSoftwareVersion];
        int v13 = [v11 isGreaterThanVersion:v12];

        if (v13)
        {
          uint64_t v14 = (void *)MEMORY[0x1D9452090]();
          int v15 = self;
          __int16 v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            char v17 = HMFGetLogIdentifier();
            uint64_t v18 = [(HMDAccessoryFirmwareUpdateSession *)v15 availableSoftwareVersion];
            id v19 = [v18 shortVersionString];
            *(_DWORD *)buf = 138543874;
            uint64_t v28 = v17;
            __int16 v29 = 2112;
            id v30 = (const char *)v11;
            __int16 v31 = 2112;
            __int16 v32 = v19;
            _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Staged version %@ is different then available version %@", buf, 0x20u);
          }
          [(HMDAccessoryFirmwareUpdateSession *)v15 setUserInitiatedInstall:0];
        }
        else
        {
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __50__HMDAccessoryFirmwareUpdateSession_applyFirmware__block_invoke;
          v26[3] = &unk_1E6A18288;
          v26[4] = self;
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __50__HMDAccessoryFirmwareUpdateSession_applyFirmware__block_invoke_2;
          v25[3] = &unk_1E6A197F0;
          v25[4] = self;
          [(HMDAccessoryFirmwareUpdateSession *)self _withOpenSocketDoBlock:v26 error:v25];
        }
      }
      else
      {
        int v20 = (void *)MEMORY[0x1D9452090]();
        os_log_type_t v21 = self;
        int v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          int v23 = HMFGetLogIdentifier();
          [v4 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled];
          HMFEnabledStatusToString();
          __int16 v24 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          uint64_t v28 = v23;
          __int16 v29 = 2112;
          id v30 = v24;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Not auto applying firmware update because isAutomaticThirdPartyAccessorySoftwareUpdateEnabled = %@", buf, 0x16u);
        }
      }
    }
  }
}

void __50__HMDAccessoryFirmwareUpdateSession_applyFirmware__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) logEventManager];
  v2 = [*(id *)(a1 + 32) hapAccessory];
  [v3 startApplyWithAccessory:v2];

  [*(id *)(a1 + 32) _applyFirmware];
}

uint64_t __50__HMDAccessoryFirmwareUpdateSession_applyFirmware__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateHDSRetryForApplyFirmware];
}

- (void)stagingComplete
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& [v4 supportsCHIP])
  {
    double v5 = (void *)MEMORY[0x1D9452090]();
    uint64_t v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v14 = 138543618;
      int v15 = v8;
      __int16 v16 = 2080;
      char v17 = "-[HMDAccessoryFirmwareUpdateSession stagingComplete]";
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@%s: Matter Accessory responsible for managing firmware staging. No action taken.", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    [(HMDAccessoryFirmwareUpdateSession *)self setInternalState:[(HMDAccessoryFirmwareUpdateSession *)self nextStateToSchedule]];
    -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](self, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession stagingComplete]");
    if (([v4 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled] & 1) != 0
      || [(HMDAccessoryFirmwareUpdateSession *)self isUserInitiatedInstall])
    {
      uint64_t v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = self;
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = HMFGetLogIdentifier();
        int v14 = 138543362;
        int v15 = v12;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Staging complete", (uint8_t *)&v14, 0xCu);
      }
      [(HMDAccessoryFirmwareUpdateSession *)v10 _schedule];
    }
    else
    {
      int v13 = [v4 home];
      [v13 reevaluateAccessoryInfo];
    }
  }
}

- (void)stageFirmware
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& [v4 supportsCHIP])
  {
    double v5 = (void *)MEMORY[0x1D9452090]();
    uint64_t v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v13 = v8;
      __int16 v14 = 2080;
      int v15 = "-[HMDAccessoryFirmwareUpdateSession stageFirmware]";
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@%s: firmware has been downloaded for Matter Accessory. Matter Accessory responsible for staging firmware. No action taken.", buf, 0x16u);
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__HMDAccessoryFirmwareUpdateSession_stageFirmware__block_invoke;
    v10[3] = &unk_1E6A10888;
    v10[4] = self;
    id v11 = v4;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__HMDAccessoryFirmwareUpdateSession_stageFirmware__block_invoke_105;
    v9[3] = &unk_1E6A197F0;
    v9[4] = self;
    [(HMDAccessoryFirmwareUpdateSession *)self _withOpenSocketDoBlock:v10 error:v9];
  }
}

void __50__HMDAccessoryFirmwareUpdateSession_stageFirmware__block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) accessoryFirmwareUpdateManager];
  id v3 = [v2 UARPControllerForAccessory:*(void *)(a1 + 40)];

  double v4 = [*(id *)(a1 + 32) uarpAccessory];
  v16[0] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  char v6 = objc_msgSend(v3, "stageFirmwareUpdateOnAccessoryList:withUserIntent:", v5, objc_msgSend(*(id *)(a1 + 32), "isUserInitiatedInstall"));

  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v14 = 138543362;
      int v15 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@UARP initated asset staging", (uint8_t *)&v14, 0xCu);
    }
    [*(id *)(a1 + 32) setInternalState:2];
    [*(id *)(a1 + 32) setAssetOfferedForCurrentDataStream:1];
    int v12 = [*(id *)(a1 + 32) logEventManager];
    [v12 startStagingWithAccessory:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      int v15 = v13;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to initate asset staging in UARP controller", (uint8_t *)&v14, 0xCu);
    }
  }
}

uint64_t __50__HMDAccessoryFirmwareUpdateSession_stageFirmware__block_invoke_105(uint64_t a1)
{
  return [*(id *)(a1 + 32) _schedule];
}

- (unint64_t)nextStateToSchedule
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self accessoryVersion];
  double v4 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  double v5 = [v4 firmwareUpdateProfile];
  char v6 = [v5 stagedFirmwareVersion];

  uint64_t v7 = [(HMDAccessoryFirmwareUpdateSession *)self availableSoftwareVersion];
  BOOL v8 = [(HMDAccessoryFirmwareUpdateSession *)self isFirmwareVersionUpToDate];
  if ([(HMDAccessoryFirmwareUpdateSession *)self internalState] == 5)
  {
    if (v8) {
      unint64_t v9 = 5;
    }
    else {
      unint64_t v9 = 1;
    }
    goto LABEL_22;
  }
  if (v8)
  {
LABEL_6:
    unint64_t v9 = 0;
    goto LABEL_22;
  }
  if (!v6)
  {
    id v10 = [(HMDAccessoryFirmwareUpdateSession *)self lastStagedVersion];
    char v11 = [v3 isAtLeastVersion:v10];

    if ([(HMDAccessoryFirmwareUpdateSession *)self isCurrentlyApplying] && (v11 & 1) != 0
      || ![(HMDAccessoryFirmwareUpdateSession *)self isCurrentlyStaging]
      && ![(HMDAccessoryFirmwareUpdateSession *)self isCurrentlyApplying])
    {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (![v6 isAtLeastVersion:v7]
    || ![v6 isGreaterThanVersion:v3])
  {
    if (![v7 isGreaterThanVersion:v6])
    {
      int v13 = (void *)MEMORY[0x1D9452090]();
      int v14 = self;
      int v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        int v17 = 138543362;
        uint64_t v18 = v16;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unhandled version combination in nextStateToSchedule", (uint8_t *)&v17, 0xCu);
      }
      goto LABEL_6;
    }
    if (![(HMDAccessoryFirmwareUpdateSession *)self isCurrentlyStaging])
    {
LABEL_21:
      unint64_t v9 = 1;
      goto LABEL_22;
    }
LABEL_20:
    unint64_t v9 = [(HMDAccessoryFirmwareUpdateSession *)self internalState];
    goto LABEL_22;
  }
  if ([(HMDAccessoryFirmwareUpdateSession *)self internalState] == 4) {
    unint64_t v9 = 4;
  }
  else {
    unint64_t v9 = 3;
  }
LABEL_22:

  return v9;
}

- (BOOL)isReadyToApplyUpdate
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  double v4 = [v3 firmwareUpdateProfile];

  uint64_t v5 = [v4 updateState];
  uint64_t v6 = [v4 updateNotReadyReasons];
  BOOL v7 = [(HMDAccessoryFirmwareUpdateSession *)self isFirmwareVersionUpToDate];
  BOOL v8 = v7;
  if (!v6 && v5 == 3 && !v7) {
    goto LABEL_8;
  }
  unint64_t v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  char v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    uint64_t v18 = HMFBooleanToString();
    [v4 updateNotReadyReasons];
    int v17 = HAPUpdateNotReadyReasonsAsString();
    int v12 = HMFBooleanToString();
    [v4 updateState];
    int v13 = HAPFirmwareUpdateStateAsString();
    int v14 = HMFBooleanToString();
    *(_DWORD *)buf = 138544642;
    os_log_type_t v21 = v19;
    __int16 v22 = 2112;
    int v23 = v18;
    __int16 v24 = 2114;
    __int16 v25 = v17;
    __int16 v26 = 2112;
    uint64_t v27 = v12;
    __int16 v28 = 2112;
    __int16 v29 = v13;
    __int16 v30 = 2112;
    __int16 v31 = v14;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Not ready for applying update - Not ready reason: %@ (%{public}@), updateState %@ (%@), isFirmwareVersionUpToDate %@", buf, 0x3Eu);
  }
  if (v6) {
    BOOL v15 = 0;
  }
  else {
LABEL_8:
  }
    BOOL v15 = v5 == 3 && !v8;

  return v15;
}

- (BOOL)isCurrentUpdateLatest
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self availableSoftwareVersion];
  if (v3)
  {
    double v4 = [(HMDAccessoryFirmwareUpdateSession *)self accessoryVersion];
    if ([v3 isAtLeastVersion:v4])
    {
      char v5 = 1;
    }
    else
    {
      id v10 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
      char v11 = [v10 firmwareUpdateProfile];
      int v12 = [v11 stagedFirmwareVersion];
      char v5 = [v3 isAtLeastVersion:v12];
    }
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    BOOL v7 = self;
    BOOL v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unint64_t v9 = HMFGetLogIdentifier();
      int v14 = 138543362;
      BOOL v15 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@No available version from UARP", (uint8_t *)&v14, 0xCu);
    }
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isCurrentlyApplying
{
  return [(HMDAccessoryFirmwareUpdateSession *)self internalState] == 4;
}

- (BOOL)isReadyForStaging
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  double v4 = [v3 firmwareUpdateProfile];

  BOOL v5 = ![v4 updateState]
    || [v4 updateState] == 2
    || [v4 updateState] == 1
    || [v4 updateState] == 3;
  uint64_t v6 = [v4 stagingNotReadyReasons];
  BOOL v7 = [(HMDAccessoryFirmwareUpdateSession *)self isStagedFirmwareVersionUpToDate];
  BOOL v8 = v7;
  if (!v6 && v5 && !v7) {
    goto LABEL_12;
  }
  unint64_t v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  char v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    uint64_t v18 = HMFBooleanToString();
    [v4 stagingNotReadyReasons];
    int v17 = HAPStagingNotReadyReasonsAsString();
    int v12 = HMFBooleanToString();
    [v4 updateState];
    int v13 = HAPFirmwareUpdateStateAsString();
    int v14 = HMFBooleanToString();
    *(_DWORD *)buf = 138544642;
    os_log_type_t v21 = v19;
    __int16 v22 = 2112;
    int v23 = v18;
    __int16 v24 = 2114;
    __int16 v25 = v17;
    __int16 v26 = 2112;
    uint64_t v27 = v12;
    __int16 v28 = 2114;
    __int16 v29 = v13;
    __int16 v30 = 2112;
    __int16 v31 = v14;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Not ready for staging - Not ready reasons: %@ (%{public}@), updateState %@ (%{public}@), isStagedFirmwareVersionUpToDate %@", buf, 0x3Eu);
  }
  if (v6) {
    BOOL v15 = 0;
  }
  else {
LABEL_12:
  }
    BOOL v15 = v5 && !v8;

  return v15;
}

- (BOOL)isCurrentlyStaging
{
  return [(HMDAccessoryFirmwareUpdateSession *)self internalState] == 2;
}

- (BOOL)isFirmwareVersionUpToDate
{
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self accessoryVersion];
  double v4 = [(HMDAccessoryFirmwareUpdateSession *)self availableSoftwareVersion];
  char v5 = [v3 isAtLeastVersion:v4];

  return v5;
}

- (BOOL)isStagedFirmwareVersionUpToDate
{
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  double v4 = [v3 firmwareUpdateProfile];
  char v5 = [v4 stagedFirmwareVersion];

  uint64_t v6 = [(HMDAccessoryFirmwareUpdateSession *)self availableSoftwareVersion];
  LOBYTE(v3) = [v5 isAtLeastVersion:v6];

  return (char)v3;
}

- (void)_evaluateHDSRetryForApplyFirmware
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& [v3 supportsCHIP])
  {
    double v4 = (void *)MEMORY[0x1D9452090]();
    char v5 = self;
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v28 = v7;
      __int16 v29 = 2080;
      __int16 v30 = "-[HMDAccessoryFirmwareUpdateSession _evaluateHDSRetryForApplyFirmware]";
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@%s: called to control Matter Accessory. No sockets used with Matter Accessories. No action taken.", buf, 0x16u);
    }
    goto LABEL_24;
  }
  BOOL v8 = [(HMDAccessoryFirmwareUpdateSession *)self allowedApplyDurationTimer];
  if (v8)
  {

    goto LABEL_10;
  }
  if ([v3 isReachable])
  {
LABEL_10:
    if ([(HMDAccessoryFirmwareUpdateSession *)self applyHDSRetryCount] < 0xA)
    {
      int v13 = (void *)MEMORY[0x1D9452090]([(HMDAccessoryFirmwareUpdateSession *)self setApplyHDSRetryCount:[(HMDAccessoryFirmwareUpdateSession *)self applyHDSRetryCount] + 1]);
      int v14 = self;
      BOOL v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        int v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessoryFirmwareUpdateSession applyHDSRetryCount](v14, "applyHDSRetryCount"));
        *(_DWORD *)buf = 138543874;
        __int16 v28 = v16;
        __int16 v29 = 2112;
        __int16 v30 = (const char *)&unk_1F2DC8AA0;
        __int16 v31 = 2112;
        uint64_t v32 = v17;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Rescheduling apply task after HDS failure in %@ sec for retry: %@", buf, 0x20u);
      }
      dispatch_time_t v18 = dispatch_time(0, 10000000000);
      uint64_t v19 = [(HMDAccessoryFirmwareUpdateSession *)v14 workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__HMDAccessoryFirmwareUpdateSession__evaluateHDSRetryForApplyFirmware__block_invoke;
      block[3] = &unk_1E6A19B30;
      void block[4] = v14;
      dispatch_after(v18, v19, block);
    }
    else
    {
      if ([(HMDAccessoryFirmwareUpdateSession *)self internalState] == 3)
      {
        unint64_t v9 = (void *)MEMORY[0x1D9452090]();
        id v10 = self;
        char v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v12 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v28 = v12;
          _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Out of HDS retries for apply. Moving update back to downloaded.", buf, 0xCu);
        }
        -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](v10, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession _evaluateHDSRetryForApplyFirmware]");
        [(HMDAccessoryFirmwareUpdateSession *)v10 updateAvailableSoftwareUpdateState:2];
      }
      if ([(HMDAccessoryFirmwareUpdateSession *)self isUserInitiatedInstall])
      {
        [(HMDAccessoryFirmwareUpdateSession *)self setApplyHDSRetryCount:0];
        [(HMDAccessoryFirmwareUpdateSession *)self setUserInitiatedInstall:0];
      }
      else
      {
        [(HMDAccessoryFirmwareUpdateSession *)self _endSession];
      }
    }
    goto LABEL_24;
  }
  int v20 = (void *)MEMORY[0x1D9452090]();
  os_log_type_t v21 = self;
  __int16 v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    int v23 = HMFGetLogIdentifier();
    __int16 v24 = [(HMDAccessoryFirmwareUpdateSession *)v21 hapAccessory];
    __int16 v25 = [v24 name];
    *(_DWORD *)buf = 138543618;
    __int16 v28 = v23;
    __int16 v29 = 2112;
    __int16 v30 = v25;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Not performing HDS retries because firmware apply has not started and accessory %@ is unreachable", buf, 0x16u);
  }
  [(HMDAccessoryFirmwareUpdateSession *)v21 updateAvailableSoftwareUpdateState:2];
  [(HMDAccessoryFirmwareUpdateSession *)v21 setInternalState:3];
LABEL_24:
}

void __70__HMDAccessoryFirmwareUpdateSession__evaluateHDSRetryForApplyFirmware__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) sessionEnded])
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 32);
    double v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      char v5 = HMFGetLogIdentifier();
      int v7 = 138543362;
      BOOL v8 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Session has been ended, stop performing retries", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 32);
    [v6 _schedule];
  }
}

- (void)_syncStateWithAccessoryOnResume
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDAccessoryFirmwareUpdateSession *)self setInternalState:[(HMDAccessoryFirmwareUpdateSession *)self nextStateToSchedule]];
  -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](self, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession _syncStateWithAccessoryOnResume]");
  if ([(HMDAccessoryFirmwareUpdateSession *)self internalState])
  {
    double v4 = (void *)MEMORY[0x1D9452090]();
    char v5 = self;
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = HMFGetLogIdentifier();
      uint64_t v8 = [(HMDAccessoryFirmwareUpdateSession *)v5 internalState];
      if ((unint64_t)(v8 - 1) > 4) {
        uint64_t v9 = @"Up To Date";
      }
      else {
        uint64_t v9 = off_1E6A10938[v8 - 1];
      }
      int v10 = 138543618;
      char v11 = v7;
      __int16 v12 = 2112;
      int v13 = v9;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Synced state is: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    [(HMDAccessoryFirmwareUpdateSession *)self _endSession];
  }
}

- (void)_withOpenSocketDoBlock:(id)a3 error:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void))a3;
  int v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  if ((_os_feature_enabled_impl() & 1) == 0
    && !CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)|| ![v9 supportsCHIP])
  {
    if ([(HMDAccessoryFirmwareUpdateSession *)self dataStreamOpenInProgress])
    {
      uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15 description:0 reason:@"Socket open already in progress" suggestion:0];
      v7[2](v7, v14);
    }
    else
    {
      uint64_t v15 = [(HMDAccessoryFirmwareUpdateSession *)self dataStreamSocket];
      if (v15)
      {
        uint64_t v16 = (void *)v15;
        int v17 = [(HMDAccessoryFirmwareUpdateSession *)self dataStreamSocket];
        int v18 = [v17 isClosed];

        if (!v18)
        {
          v6[2](v6, 0);
          goto LABEL_20;
        }
      }
      uint64_t v14 = [v9 dataStreamSocketController];
      uint64_t v19 = (void *)MEMORY[0x1D9452090]();
      int v20 = self;
      os_log_type_t v21 = HMFGetOSLogHandle();
      __int16 v22 = v21;
      if (v14)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v31 = v23;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Opening HDS connection to accessory", buf, 0xCu);
        }
        [(HMDAccessoryFirmwareUpdateSession *)v20 setDataStreamOpenInProgress:1];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __66__HMDAccessoryFirmwareUpdateSession__withOpenSocketDoBlock_error___block_invoke;
        v26[3] = &unk_1E6A10860;
        v26[4] = v20;
        __int16 v28 = v7;
        id v27 = v9;
        __int16 v29 = v6;
        [v14 openStreamSocketWithApplicationProtocol:@"UARP" completion:v26];
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          __int16 v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v31 = v24;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@No dataStreamSocketController", buf, 0xCu);
        }
        __int16 v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54 description:0 reason:@"No dataStreamSocketController" suggestion:0];
        v7[2](v7, v25);
      }
    }

    goto LABEL_20;
  }
  int v10 = (void *)MEMORY[0x1D9452090]();
  char v11 = self;
  __int16 v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v31 = v13;
    __int16 v32 = 2080;
    uint64_t v33 = "-[HMDAccessoryFirmwareUpdateSession _withOpenSocketDoBlock:error:]";
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@%s: called to control Matter Accessory. No sockets used with Matter Accessories. No action taken.", buf, 0x16u);
  }
LABEL_20:
}

void __66__HMDAccessoryFirmwareUpdateSession__withOpenSocketDoBlock_error___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_initWeak(&location, a1[4]);
  int v7 = [a1[4] workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HMDAccessoryFirmwareUpdateSession__withOpenSocketDoBlock_error___block_invoke_2;
  block[3] = &unk_1E6A10838;
  objc_copyWeak(&v16, &location);
  id v11 = v5;
  id v12 = v6;
  id v14 = a1[6];
  id v13 = a1[5];
  id v15 = a1[7];
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __66__HMDAccessoryFirmwareUpdateSession__withOpenSocketDoBlock_error___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setDataStreamOpenInProgress:0];
    [v3 setDataStreamSocket:*(void *)(a1 + 32)];
    double v4 = *(void **)(a1 + 32);
    if (v4)
    {
      [v4 setDelegate:v3];
      [v3 setAssetOfferedForCurrentDataStream:0];
      id v5 = (void *)MEMORY[0x1D9452090]([v3 setApplyHDSRetryCount:0]);
      id v6 = v3;
      int v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        int v28 = 138543362;
        __int16 v29 = v8;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Opened HDS connection to accessory", (uint8_t *)&v28, 0xCu);
      }
      [v6 _startSocketIdleTimer];
      id v9 = *(void **)(a1 + 48);
      int v10 = HAPStringFromAccessoryServerSession();
      [v9 registerForSessionRestore:v10];

      id v11 = [v6 accessoryFirmwareUpdateManager];
      id v12 = [v11 UARPControllerForAccessory:*(void *)(a1 + 48)];

      id v13 = [v6 uarpAccessory];
      char v14 = [v12 accessoryReachable:v13];

      id v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = v6;
      int v17 = HMFGetOSLogHandle();
      int v18 = v17;
      if (v14)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = HMFGetLogIdentifier();
          int v28 = 138543362;
          __int16 v29 = v19;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Notified UARP accessory is reachable", (uint8_t *)&v28, 0xCu);
        }
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          __int16 v25 = HMFGetLogIdentifier();
          int v28 = 138543362;
          __int16 v29 = v25;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify about reachable accessory to UARP", (uint8_t *)&v28, 0xCu);
        }
        uint64_t v26 = *(void *)(a1 + 56);
        id v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23 description:0 reason:@"UARP accessoryReachable failed" suggestion:0];
        (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);
      }
    }
    else
    {
      int v20 = (void *)MEMORY[0x1D9452090]();
      id v21 = v3;
      __int16 v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = HMFGetLogIdentifier();
        uint64_t v24 = *(void *)(a1 + 40);
        int v28 = 138543618;
        __int16 v29 = v23;
        __int16 v30 = 2112;
        uint64_t v31 = v24;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Couldn't open HDS connection to accessory error %@", (uint8_t *)&v28, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

- (void)_handleRegisterFailureRetryTimeout
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Register failure retry timeout", (uint8_t *)&v8, 0xCu);
  }
  [(HMDAccessoryFirmwareUpdateSession *)v5 _cancelRegisterFailureRetryTimer];
  [(HMDAccessoryFirmwareUpdateSession *)v5 setCurrentRegisterFailureCount:0];
  [(HMDAccessoryFirmwareUpdateSession *)v5 _schedule];
}

- (void)_cancelRegisterFailureRetryTimer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Cancel register failure retry timer", (uint8_t *)&v9, 0xCu);
  }
  int v8 = [(HMDAccessoryFirmwareUpdateSession *)v5 registerFailureRetryTimer];
  [v8 suspend];

  [(HMDAccessoryFirmwareUpdateSession *)v5 setRegisterFailureRetryTimer:0];
}

- (void)_handleQueryFirmwareUpdateResultTimeout
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    int v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Query firmware update result duration timeout", (uint8_t *)&v8, 0xCu);
  }
  [(HMDAccessoryFirmwareUpdateSession *)v5 _cancelQueryFirmwareUpdateResultTimer];
  [(HMDAccessoryFirmwareUpdateSession *)v5 _schedule];
}

- (void)_cancelQueryFirmwareUpdateResultTimer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Cancel query firmware update result duration timer", (uint8_t *)&v9, 0xCu);
  }
  int v8 = [(HMDAccessoryFirmwareUpdateSession *)v5 queryFirmwareUpdateResultDurationTimer];
  [v8 suspend];

  [(HMDAccessoryFirmwareUpdateSession *)v5 setQueryFirmwareUpdateResultDurationTimer:0];
  [(HMDAccessoryFirmwareUpdateSession *)v5 setIsVerifyingUpdate:0];
}

- (void)_handleSocketTimeout
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = HMFGetLogIdentifier();
    int v14 = 138543362;
    id v15 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Socket idle timeout", (uint8_t *)&v14, 0xCu);
  }
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    int v8 = [(HMDAccessoryFirmwareUpdateSession *)v5 hapAccessory];
    if ([v8 supportsCHIP])
    {
      int v9 = (void *)MEMORY[0x1D9452090]();
      uint64_t v10 = v5;
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = HMFGetLogIdentifier();
        int v14 = 138543618;
        id v15 = v12;
        __int16 v16 = 2080;
        int v17 = "-[HMDAccessoryFirmwareUpdateSession _handleSocketTimeout]";
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@%s: called to control Matter Accessory. No sockets used with Matter Accessories. No action taken.", (uint8_t *)&v14, 0x16u);
      }

      return;
    }
  }
  [(HMDAccessoryFirmwareUpdateSession *)v5 _cancelSocketIdleTimer];
  id v13 = [(HMDAccessoryFirmwareUpdateSession *)v5 dataStreamSocket];
  [v13 close];

  if ([(HMDAccessoryFirmwareUpdateSession *)v5 internalState] == 2)
  {
    [(HMDAccessoryFirmwareUpdateSession *)v5 setInternalState:1];
  }
  else if ([(HMDAccessoryFirmwareUpdateSession *)v5 internalState] == 5 {
         && [(HMDAccessoryFirmwareUpdateSession *)v5 isFirmwareVersionUpToDate])
  }
  {
    [(HMDAccessoryFirmwareUpdateSession *)v5 setInternalState:0];
    [(HMDAccessoryFirmwareUpdateSession *)v5 _endSession];
  }
}

- (void)_cancelSocketIdleTimer
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = HMFGetLogIdentifier();
    int v15 = 138543362;
    __int16 v16 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Cancel socket idle timer", (uint8_t *)&v15, 0xCu);
  }
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](v5, "hapAccessory"), int v8 = objc_claimAutoreleasedReturnValue(), v9 = [v8 supportsCHIP], v8, v9))
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = v5;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      __int16 v16 = v13;
      __int16 v17 = 2080;
      uint64_t v18 = "-[HMDAccessoryFirmwareUpdateSession _cancelSocketIdleTimer]";
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@%s: called to control Matter Accessory. No sockets used with Matter Accessories. No action taken.", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    int v14 = [(HMDAccessoryFirmwareUpdateSession *)v5 socketIdleTimer];
    [v14 suspend];

    [(HMDAccessoryFirmwareUpdateSession *)v5 setSocketIdleTimer:0];
  }
}

- (void)_resetSocketIdleTimer
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = HMFGetLogIdentifier();
    int v15 = 138543362;
    __int16 v16 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Reset socket idle timer", (uint8_t *)&v15, 0xCu);
  }
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](v5, "hapAccessory"), int v8 = objc_claimAutoreleasedReturnValue(), v9 = [v8 supportsCHIP], v8, v9))
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = v5;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      __int16 v16 = v13;
      __int16 v17 = 2080;
      uint64_t v18 = "-[HMDAccessoryFirmwareUpdateSession _resetSocketIdleTimer]";
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@%s: called to control Matter Accessory. No sockets used with Matter Accessories. No action taken.", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    int v14 = [(HMDAccessoryFirmwareUpdateSession *)v5 socketIdleTimer];
    [v14 resume];
  }
}

- (void)_startSocketIdleTimer
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory"), double v4 = objc_claimAutoreleasedReturnValue(), v5 = [v4 supportsCHIP], v4, v5))
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    int v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      int v25 = 138543618;
      uint64_t v26 = v9;
      __int16 v27 = 2080;
      int v28 = "-[HMDAccessoryFirmwareUpdateSession _startSocketIdleTimer]";
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@%s: called to control Matter Accessory. No sockets used with Matter Accessories. No action taken.", (uint8_t *)&v25, 0x16u);
    }
  }
  else
  {
    if (maxSocketIdleDuration_onceToken != -1) {
      dispatch_once(&maxSocketIdleDuration_onceToken, &__block_literal_global_568);
    }
    uint64_t v10 = [MEMORY[0x1E4F65530] sharedPreferences];
    if (isInternalBuild())
    {
      uint64_t v11 = [v10 preferenceForKey:@"firmwareUpdateMaxSocketIdleDuration"];
      id v12 = [v11 numberValue];
      unsigned int v13 = [v12 unsignedIntValue];

      double v14 = (double)v13;
    }
    else
    {
      double v14 = 60.0;
    }

    int v15 = (void *)MEMORY[0x1D9452090]();
    __int16 v16 = self;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      uint64_t v19 = [NSNumber numberWithDouble:v14];
      int v25 = 138543618;
      uint64_t v26 = v18;
      __int16 v27 = 2112;
      int v28 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Start socket idle timer for %@ seconds", (uint8_t *)&v25, 0x16u);
    }
    int v20 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:v14];
    [(HMDAccessoryFirmwareUpdateSession *)v16 setSocketIdleTimer:v20];

    id v21 = [(HMDAccessoryFirmwareUpdateSession *)v16 socketIdleTimer];
    [v21 setDelegate:v16];

    __int16 v22 = [(HMDAccessoryFirmwareUpdateSession *)v16 workQueue];
    int v23 = [(HMDAccessoryFirmwareUpdateSession *)v16 socketIdleTimer];
    [v23 setDelegateQueue:v22];

    uint64_t v24 = [(HMDAccessoryFirmwareUpdateSession *)v16 socketIdleTimer];
    [v24 resume];
  }
}

- (void)resumeWithState:(unint64_t)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int v5 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  int v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    unint64_t v10 = [(HMDAccessoryFirmwareUpdateSession *)v7 internalState] - 1;
    if (v10 > 4) {
      uint64_t v11 = @"Up To Date";
    }
    else {
      uint64_t v11 = off_1E6A10938[v10];
    }
    id v12 = [(HMDAccessoryFirmwareUpdateSession *)v7 hapAccessory];
    unsigned int v13 = [v12 firmwareUpdateProfile];
    [v13 updateState];
    uint64_t v14 = HAPFirmwareUpdateStateAsString();
    int v15 = (void *)v14;
    if (a3 - 1 > 2) {
      __int16 v16 = @"Up-To-Date";
    }
    else {
      __int16 v16 = off_1E6A10920[a3 - 1];
    }
    *(_DWORD *)buf = 138544130;
    uint64_t v35 = v9;
    __int16 v36 = 2112;
    id v37 = v11;
    __int16 v38 = 2112;
    uint64_t v39 = v14;
    __int16 v40 = 2112;
    __int16 v41 = v16;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Resume called with sessionState: %@ accessoryState %@ resumeState %@", buf, 0x2Au);
  }
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    __int16 v17 = [(HMDAccessoryFirmwareUpdateSession *)v7 hapAccessory];
    int v18 = [v17 supportsCHIP];

    if (v18)
    {
      [(HMDAccessoryFirmwareUpdateSession *)v7 _updateSoftwareUpdateStateForMatterAccessoryWithState:a3];
      return;
    }
  }
  -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](v7, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession resumeWithState:]");
  uint64_t v19 = [(HMDAccessoryFirmwareUpdateSession *)v7 dataStreamSocket];
  int v20 = [v19 isClosing];

  if (v20)
  {
    id v21 = (void *)MEMORY[0x1D9452090]();
    __int16 v22 = v7;
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v24;
      int v25 = "%{public}@Resume ignored with socket in closing state";
LABEL_24:
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, v25, buf, 0xCu);

      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (a3 != 1)
  {
LABEL_21:
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __53__HMDAccessoryFirmwareUpdateSession_resumeWithState___block_invoke;
    v33[3] = &unk_1E6A10810;
    v33[4] = v7;
    v33[5] = a3;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __53__HMDAccessoryFirmwareUpdateSession_resumeWithState___block_invoke_88;
    v32[3] = &unk_1E6A197F0;
    v32[4] = v7;
    [(HMDAccessoryFirmwareUpdateSession *)v7 _withOpenSocketDoBlock:v33 error:v32];
    return;
  }
  uint64_t v26 = [(HMDAccessoryFirmwareUpdateSession *)v7 lastStagedVersion];
  __int16 v27 = [(HMDAccessoryFirmwareUpdateSession *)v7 assetID];
  int v28 = [v27 softwareVersion];
  int v29 = [v26 isEqualToVersion:v28];

  if (!v29)
  {
    __int16 v30 = [(HMDAccessoryFirmwareUpdateSession *)v7 assetID];
    uint64_t v31 = [v30 downloadStatus];

    if (v31 != 1)
    {
      id v21 = (void *)MEMORY[0x1D9452090]();
      __int16 v22 = v7;
      int v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v35 = v24;
        int v25 = "%{public}@Asset not ready to stage";
        goto LABEL_24;
      }
      goto LABEL_25;
    }
    goto LABEL_21;
  }
  id v21 = (void *)MEMORY[0x1D9452090]([(HMDAccessoryFirmwareUpdateSession *)v7 setLastStagedVersion:0]);
  __int16 v22 = v7;
  int v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v35 = v24;
    int v25 = "%{public}@Re-stage required. Waiting for asset update availability previously requested on the staged version "
          "change notification";
    goto LABEL_24;
  }
LABEL_25:
}

void __53__HMDAccessoryFirmwareUpdateSession_resumeWithState___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setCurrentCommunicationErrorCount:0];
  [*(id *)(a1 + 32) _syncStateWithAccessoryOnResume];
  if (([*(id *)(a1 + 32) internalState] == 1 || objc_msgSend(*(id *)(a1 + 32), "internalState") == 2)
    && *(void *)(a1 + 40) != 1
    || [*(id *)(a1 + 32) internalState] == 3 && *(void *)(a1 + 40) != 2
    || ([*(id *)(a1 + 32) updateScheduler],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 currentTask],
        id v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 shouldRun],
        v3,
        v2,
        (v4 & 1) == 0))
  {
    int v9 = *(void **)(a1 + 32);
    [v9 _schedule];
  }
  else
  {
    switch([*(id *)(a1 + 32) internalState])
    {
      case 0:
        int v5 = (void *)MEMORY[0x1D9452090]();
        id v6 = *(id *)(a1 + 32);
        int v7 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          int v8 = HMFGetLogIdentifier();
          int v28 = 138543362;
          int v29 = v8;
          _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Next action: -", (uint8_t *)&v28, 0xCu);
        }
        goto LABEL_33;
      case 1:
        unint64_t v10 = (void *)MEMORY[0x1D9452090]();
        id v11 = *(id *)(a1 + 32);
        id v12 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_20;
        }
        unsigned int v13 = HMFGetLogIdentifier();
        int v28 = 138543362;
        int v29 = v13;
        uint64_t v14 = "%{public}@Next action: stageFirmware";
        goto LABEL_19;
      case 2:
        if ([*(id *)(a1 + 32) assetOfferedForCurrentDataStream]) {
          return;
        }
        unint64_t v10 = (void *)MEMORY[0x1D9452090]();
        id v11 = *(id *)(a1 + 32);
        id v12 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_20;
        }
        unsigned int v13 = HMFGetLogIdentifier();
        int v28 = 138543362;
        int v29 = v13;
        uint64_t v14 = "%{public}@Next action: stageFirmware (recover)";
LABEL_19:
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v28, 0xCu);

LABEL_20:
        [*(id *)(a1 + 32) stageFirmware];
        break;
      case 3:
        int v15 = (void *)MEMORY[0x1D9452090]();
        id v16 = *(id *)(a1 + 32);
        __int16 v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          int v18 = HMFGetLogIdentifier();
          int v28 = 138543362;
          int v29 = v18;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Next action: applyFirmware", (uint8_t *)&v28, 0xCu);
        }
        [*(id *)(a1 + 32) applyFirmware];
        return;
      case 4:
        int v5 = (void *)MEMORY[0x1D9452090]();
        id v19 = *(id *)(a1 + 32);
        int v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v21 = HMFGetLogIdentifier();
          uint64_t v22 = [*(id *)(a1 + 32) internalState];
          if ((unint64_t)(v22 - 1) > 4) {
            int v23 = @"Up To Date";
          }
          else {
            int v23 = off_1E6A10938[v22 - 1];
          }
          int v28 = 138543618;
          int v29 = v21;
          __int16 v30 = 2112;
          uint64_t v31 = v23;
          _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Ignoring resume in state %@", (uint8_t *)&v28, 0x16u);
        }
LABEL_33:
        return;
      case 5:
        uint64_t v24 = (void *)MEMORY[0x1D9452090]();
        id v25 = *(id *)(a1 + 32);
        uint64_t v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          __int16 v27 = HMFGetLogIdentifier();
          int v28 = 138543362;
          int v29 = v27;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Next action: register", (uint8_t *)&v28, 0xCu);
        }
        [*(id *)(a1 + 32) _register];
        return;
      default:
        return;
    }
  }
}

void __53__HMDAccessoryFirmwareUpdateSession_resumeWithState___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) internalState] == 3)
  {
    [*(id *)(a1 + 32) _evaluateHDSRetryForApplyFirmware];
    goto LABEL_13;
  }
  if (!v3
    || ([*(id *)(a1 + 32) hapAccessory],
        char v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isReachable],
        v4,
        !v5))
  {
    int64_t v15 = 0;
LABEL_12:
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    dispatch_time_t v16 = dispatch_time(0, v15);
    __int16 v17 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__HMDAccessoryFirmwareUpdateSession_resumeWithState___block_invoke_90;
    block[3] = &unk_1E6A16E40;
    objc_copyWeak(&v19, (id *)buf);
    dispatch_after(v16, v17, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
    goto LABEL_13;
  }
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 32);
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = HMFGetLogIdentifier();
    unint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "currentCommunicationErrorCount"));
    *(_DWORD *)buf = 138543874;
    id v21 = v9;
    __int16 v22 = 2112;
    int v23 = v10;
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@HAP Communication Error occurrence: %@ error: %@", buf, 0x20u);
  }
  if ((unint64_t)[*(id *)(a1 + 32) currentCommunicationErrorCount] < 0xA)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCurrentCommunicationErrorCount:", objc_msgSend(*(id *)(a1 + 32), "currentCommunicationErrorCount") + 1);
    int64_t v15 = 10000000000;
    goto LABEL_12;
  }
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = *(id *)(a1 + 32);
  unsigned int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v21 = v14;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Out of retries for socket open", buf, 0xCu);
  }
  [*(id *)(a1 + 32) _endSession];
LABEL_13:
}

void __53__HMDAccessoryFirmwareUpdateSession_resumeWithState___block_invoke_90(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = WeakRetained;
  char v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@rescheduling task after socket open failed", (uint8_t *)&v6, 0xCu);
  }
  [v3 _schedule];
}

- (void)pause
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](self, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession pause]");
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    char v4 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
    int v5 = [v4 supportsCHIP];

    if (v5)
    {
      uint64_t v6 = MEMORY[0x1D9452090]();
      id v7 = self;
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v19 = v9;
        __int16 v20 = 2080;
        id v21 = "-[HMDAccessoryFirmwareUpdateSession pause]";
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@%s: called by the controller's scheduler. Only a Matter Accessory can pause a firmware staging/application. No action taken.", buf, 0x16u);
      }
      unint64_t v10 = (void *)v6;
LABEL_11:
      return;
    }
  }
  id v11 = [(HMDAccessoryFirmwareUpdateSession *)self dataStreamSocket];
  int v12 = [v11 isClosing];

  if (v12)
  {
    uint64_t v13 = MEMORY[0x1D9452090]();
    uint64_t v14 = self;
    int64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      dispatch_time_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v19 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Pause ignored with socket in closing state", buf, 0xCu);
    }
    unint64_t v10 = (void *)v13;
    goto LABEL_11;
  }
  id v17 = [(HMDAccessoryFirmwareUpdateSession *)self dataStreamSocket];
  [v17 close];
}

- (id)availableSoftwareVersion
{
  id v3 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  int v4 = [v3 supportsCHIP];

  if (v4)
  {
    int v5 = [(HMDAccessoryFirmwareUpdateSession *)self assetID];
    [v5 softwareVersion];
  }
  else
  {
    int v5 = [(HMDAccessoryFirmwareUpdateSession *)self uarpAccessory];
    [v5 availableSoftwareVersion];
  uint64_t v6 = };

  return v6;
}

- (BOOL)startManualUpdate:(id)a3 error:(id *)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMDAccessoryFirmwareUpdateSession *)self workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  int v9 = [v8 firmwareVersion];
  unint64_t v10 = [v6 version];
  if (![v9 isAtLeastVersion:v10])
  {

LABEL_7:
    uint64_t v22 = [v6 version];
    int v23 = [(HMDAccessoryFirmwareUpdateSession *)self availableSoftwareVersion];
    char v24 = [v22 isEqualToVersion:v23];

    if ((v24 & 1) == 0)
    {
      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      }
      __int16 v38 = (void *)MEMORY[0x1D9452090]();
      uint64_t v39 = self;
      __int16 v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        __int16 v41 = HMFGetLogIdentifier();
        uint64_t v42 = [v6 version];
        __int16 v43 = [(HMDAccessoryFirmwareUpdateSession *)v39 uarpAccessory];
        [v43 availableFirmwareVersion];
        id v62 = v6;
        v45 = id v44 = v8;
        id v46 = [(HMDAccessoryFirmwareUpdateSession *)v39 uarpAccessory];
        __int16 v47 = [v46 firmwareVersion];
        *(_DWORD *)buf = 138544130;
        uint64_t v64 = (uint64_t)v41;
        __int16 v65 = 2112;
        id v66 = v42;
        __int16 v67 = 2112;
        id v68 = v45;
        __int16 v69 = 2112;
        v70 = v47;
        _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_ERROR, "%{public}@Requested install version %@ is different than available version %@ / %@", buf, 0x2Au);

        uint64_t v8 = v44;
        id v6 = v62;
      }
      goto LABEL_18;
    }
    id v25 = [v8 firmwareUpdateProfile];
    uint64_t v26 = [v25 stagedFirmwareVersion];

    __int16 v27 = [(HMDAccessoryFirmwareUpdateSession *)self availableSoftwareVersion];
    int v28 = [v26 isGreaterThanVersion:v27];

    if (v28)
    {
      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      }
      int v29 = (void *)MEMORY[0x1D9452090]();
      __int16 v30 = self;
      uint64_t v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        uint64_t v33 = [(HMDAccessoryFirmwareUpdateSession *)v30 availableSoftwareVersion];
        uint64_t v34 = [v33 shortVersionString];
        *(_DWORD *)buf = 138543874;
        uint64_t v64 = (uint64_t)v32;
        __int16 v65 = 2112;
        id v66 = v26;
        __int16 v67 = 2112;
        id v68 = v34;
        uint64_t v35 = "%{public}@Staged version %@ is different than available version %@";
        __int16 v36 = v31;
        uint32_t v37 = 32;
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v48 = [v8 firmwareUpdateProfile];
      uint64_t v49 = [(id)v48 updateNotReadyReasons];

      if (!v49)
      {
        __int16 v51 = (void *)MEMORY[0x1D9452090]();
        uint64_t v52 = self;
        __int16 v53 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v48 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v64 = v48;
          _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@Starting user-initiated update", buf, 0xCu);
        }
        [(HMDAccessoryFirmwareUpdateSession *)v52 _syncStateWithAccessoryOnResume];
        [(HMDAccessoryFirmwareUpdateSession *)v52 setUserInitiatedInstall:1];
        switch([(HMDAccessoryFirmwareUpdateSession *)v52 internalState])
        {
          case 0uLL:
            v54 = (void *)MEMORY[0x1D9452090]();
            __int16 v55 = v52;
            v56 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
              goto LABEL_37;
            }
            __int16 v57 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v64 = (uint64_t)v57;
            v58 = "%{public}@Already up to date";
            __int16 v59 = v56;
            os_log_type_t v60 = OS_LOG_TYPE_ERROR;
            goto LABEL_36;
          case 1uLL:
            goto LABEL_39;
          case 2uLL:
          case 4uLL:
            v54 = (void *)MEMORY[0x1D9452090]();
            __int16 v55 = v52;
            v56 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_37;
            }
            __int16 v57 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v64 = (uint64_t)v57;
            v58 = "%{public}@Already in progress";
            __int16 v59 = v56;
            os_log_type_t v60 = OS_LOG_TYPE_DEFAULT;
LABEL_36:
            _os_log_impl(&dword_1D49D5000, v59, v60, v58, buf, 0xCu);

LABEL_37:
            goto LABEL_40;
          case 3uLL:
            [(HMDAccessoryFirmwareUpdateSession *)v52 updateAvailableSoftwareUpdateState:3];
LABEL_39:
            [(HMDAccessoryFirmwareUpdateSession *)v52 _schedule];
LABEL_40:
            LOBYTE(v48) = 1;
            break;
          case 5uLL:
            int v29 = (void *)MEMORY[0x1D9452090]();
            __int16 v30 = v52;
            uint64_t v31 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              goto LABEL_26;
            }
            uint64_t v32 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v64 = (uint64_t)v32;
            _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Cannot update while registration is in progress", buf, 0xCu);
            goto LABEL_25;
          default:
            goto LABEL_27;
        }
        goto LABEL_27;
      }
      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      }
      int v29 = (void *)MEMORY[0x1D9452090]();
      __int16 v30 = self;
      uint64_t v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        uint64_t v33 = [v8 firmwareUpdateProfile];
        [v33 updateNotReadyReasons];
        uint64_t v34 = HAPUpdateNotReadyReasonsAsString();
        *(_DWORD *)buf = 138543618;
        uint64_t v64 = (uint64_t)v32;
        __int16 v65 = 2114;
        id v66 = v34;
        uint64_t v35 = "%{public}@Update failed due to updateNotReadyReasons: %{public}@";
        __int16 v36 = v31;
        uint32_t v37 = 22;
LABEL_24:
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, v35, buf, v37);

LABEL_25:
      }
    }
LABEL_26:

    LOBYTE(v48) = 0;
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v11 = [v6 state];

  if (v11 != 2) {
    goto LABEL_7;
  }
  int v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v15 = HMFGetLogIdentifier();
    dispatch_time_t v16 = [v8 shortDescription];
    id v17 = [v8 firmwareVersion];
    [v6 version];
    __int16 v61 = v12;
    v19 = int v18 = v8;
    __int16 v20 = [(HMDAccessoryFirmwareUpdateSession *)v13 uarpAccessory];
    id v21 = [v20 firmwareVersion];
    *(_DWORD *)buf = 138544386;
    uint64_t v64 = (uint64_t)v15;
    __int16 v65 = 2112;
    id v66 = v16;
    __int16 v67 = 2112;
    id v68 = v17;
    __int16 v69 = 2112;
    v70 = v19;
    __int16 v71 = 2112;
    id v72 = v21;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Already has the latest version: %@. Ignoring the downloaded version: %@ / %@", buf, 0x34u);

    uint64_t v8 = v18;
    int v12 = v61;
  }
  [v6 updateLocalState:4];
LABEL_18:
  LOBYTE(v48) = 0;
LABEL_28:

  return v48 & 1;
}

- (HMFSoftwareVersion)accessoryVersion
{
  v2 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  id v3 = [v2 firmwareUpdateProfile];
  int v4 = [v3 currentVersion];

  int v5 = [v2 firmwareVersion];
  if ([v2 supportsCHIP])
  {
    id v6 = [v2 firmwareUpdateProfile];
    id v7 = [v6 matterFirmwareUpdateProfile];
    uint64_t v8 = [v7 matterFirmwareRevisionNumber];

    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F65558]), "initWithMajorVersion:minorVersion:updateVersion:", objc_msgSend(v8, "unsignedLongValue"), 0, 0);
    int v5 = (void *)v9;
  }
  if ([v5 isGreaterThanVersion:v4]) {
    unint64_t v10 = v5;
  }
  else {
    unint64_t v10 = v4;
  }
  uint64_t v11 = v10;

  return v11;
}

- (void)setUserInitiatedInstall:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_userInitiatedInstall = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isUserInitiatedInstall
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_userInitiatedInstall;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setUserInitiatedStaging:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_userInitiatedStaging = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isUserInitiatedStaging
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_userInitiatedStaging;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)sessionState
{
  unint64_t v2 = [(HMDAccessoryFirmwareUpdateSession *)self nextStateToSchedule];
  if (v2 - 1 > 4) {
    return 0;
  }
  else {
    return qword_1D54D3FA0[v2 - 1];
  }
}

- (void)setSessionEnded:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_sessionEnded = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)sessionEnded
{
  unint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_sessionEnded;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setDataStreamSocket:(id)a3
{
  int v4 = (HMDDataStreamSocket *)a3;
  os_unfair_lock_lock_with_options();
  dataStreamSocket = self->_dataStreamSocket;
  self->_dataStreamSocket = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDDataStreamSocket)dataStreamSocket
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int v4 = self->_dataStreamSocket;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setInternalState:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t internalState = self->_internalState;
  self->_unint64_t internalState = a3;
  os_unfair_lock_unlock(p_lock);
  if (internalState != a3)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = (void *)v10;
      if (a3 - 1 > 4) {
        int v12 = @"Up To Date";
      }
      else {
        int v12 = off_1E6A10938[a3 - 1];
      }
      int v13 = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      dispatch_time_t v16 = v12;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@State changed to %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (unint64_t)internalState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t internalState = self->_internalState;
  os_unfair_lock_unlock(p_lock);
  return internalState;
}

- (void)dealloc
{
  [(HMDDataStreamSocket *)self->_dataStreamSocket close];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDAccessoryFirmwareUpdateSession;
  [(HMDAccessoryFirmwareUpdateSession *)&v4 dealloc];
}

- (void)configure
{
  id v18 = [(HMDAccessoryFirmwareUpdateSession *)self hapAccessory];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_super v4 = [v18 home];
  [v3 addObserver:self selector:sel__handleAutomaticUpdateEnabledChanged_ name:@"HMDHomeAutomaticThirdPartyUpdateEnabledChangedNotification" object:v4];

  int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_handleAccessoryFirmwareVersionChangedNotification_ name:@"HMDAccessoryFirmwareVersionUpdatedNotification" object:v18];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel_handleAccessoryFirmwareVersionChangedNotification_ name:@"HMDAccessoryFirmwareDisplayableVersionUpdatedNotification" object:v18];

  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:self selector:sel_handleAccessoryFirmwareVersionNumberChangedNotification_ name:@"HMDAccessoryFirmwareUpdateMatterFirmwareRevisionNumberChangedNotification" object:v18];

    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:self selector:sel_handleAccessoryVIDPIDChangedNotification_ name:@"HMDAccessoryVendorIDProductIDUpdatedNotification" object:v18];
  }
  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v10 = [v18 firmwareUpdateProfile];
  [v9 addObserver:self selector:sel_handleStagedFirmwareVersionChangedNotification_ name:@"HMDAccessoryStagedFirmwareVersionChangedNotification" object:v10];

  uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int v12 = [v18 firmwareUpdateProfile];
  [v11 addObserver:self selector:sel_handleFirmwareUpdateStateChangedNotification_ name:@"HMDAccessoryFirmwareUpdateStateChangedNotification" object:v12];

  int v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v14 = [v18 firmwareUpdateProfile];
  [v13 addObserver:self selector:sel_handleNotReadyReasonsChanged_ name:@"HMDAccessoryFirmwareUpdateStagingNotReadyReasonsChangedNotification" object:v14];

  __int16 v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  dispatch_time_t v16 = [v18 firmwareUpdateProfile];
  [v15 addObserver:self selector:sel_handleNotReadyReasonsChanged_ name:@"HMDAccessoryFirmwareUpdateApplyNotReadyReasonsChangedNotification" object:v16];

  uint64_t v17 = [v18 firmwareUpdateProfile];
  [v17 monitorCharacteristics:1];
}

- (HMDAccessoryFirmwareUpdateSession)initWithHAPAccessory:(id)a3 uarpAccessory:(id)a4 accessoryFirmwareUpdateManager:(id)a5 logEventManager:(id)a6 wingman:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  dispatch_time_t v16 = (HMDAccessoryFirmwareUpdateSessionWingman *)a7;
  v26.receiver = self;
  v26.super_class = (Class)HMDAccessoryFirmwareUpdateSession;
  uint64_t v17 = [(HMDAccessoryFirmwareUpdateSession *)&v26 init];
  if (v17)
  {
    id v18 = v16;
    if (!v16) {
      id v18 = objc_alloc_init(HMDAccessoryFirmwareUpdateSessionWingman);
    }
    objc_storeStrong((id *)&v17->_wingman, v18);
    if (!v16) {

    }
    objc_storeWeak((id *)&v17->_hapAccessory, v12);
    objc_storeStrong((id *)&v17->_uarpAccessory, a4);
    objc_storeWeak((id *)&v17->_accessoryFirmwareUpdateManager, v14);
    objc_storeWeak((id *)&v17->_logEventManager, v15);
    if (v16) {
      uint64_t v19 = [(HMDAccessoryFirmwareUpdateSessionWingman *)v16 initialSessionState];
    }
    else {
      uint64_t v19 = 0;
    }
    v17->_unint64_t internalState = v19;
    v17->_lock._os_unfair_lock_opaque = 0;
    uint64_t v20 = [v12 workQueue];
    workQueue = v17->_workQueue;
    v17->_workQueue = (OS_dispatch_queue *)v20;

    v17->_userInitiatedStaging = 0;
    v17->_userInitiatedInstall = 0;
    v17->_sessionEnded = 0;
    v17->_assetOfferedForCurrentDataStream = 0;
    v17->_applyHDSRetryCount = 0;
    v17->_currentAutomaticApplyRetriesCount = 0;
    v17->_currentCommunicationErrorCount = 0;
    v17->_dataStreamOpenInProgress = 0;
    v17->_isVerifyingUpdate = 0;
    v17->_remoteApplyInProgress = 0;
    v17->_matterFirmwareUpdateRetryCount = 0;
    v17->_currentRegisterFailureCount = 0;
    id registerFailureRetryTimerFactory = v17->_registerFailureRetryTimerFactory;
    v17->_id registerFailureRetryTimerFactory = &__block_literal_global_124353;

    uint64_t v23 = [(HMDAccessoryFirmwareUpdateSessionWingman *)v17->_wingman newSchedulerWithAccessory:v12 firmwareUpdateSession:v17 workQueue:v17->_workQueue];
    updateScheduler = v17->_updateScheduler;
    v17->_updateScheduler = (HMDAccessoryFirmwareUpdateScheduler *)v23;

    [(HMDAccessoryFirmwareUpdateScheduler *)v17->_updateScheduler configure];
  }

  return v17;
}

id __127__HMDAccessoryFirmwareUpdateSession_initWithHAPAccessory_uarpAccessory_accessoryFirmwareUpdateManager_logEventManager_wingman___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:a3 options:a1];
  return v3;
}

- (HMDAccessoryFirmwareUpdateSession)initWithHAPAccessory:(id)a3 uarpAccessory:(id)a4 accessoryFirmwareUpdateManager:(id)a5 logEventManager:(id)a6
{
  return [(HMDAccessoryFirmwareUpdateSession *)self initWithHAPAccessory:a3 uarpAccessory:a4 accessoryFirmwareUpdateManager:a5 logEventManager:a6 wingman:0];
}

- (HMDAccessoryFirmwareUpdateSession)init
{
  unint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  objc_super v4 = NSString;
  int v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t198 != -1) {
    dispatch_once(&logCategory__hmf_once_t198, &__block_literal_global_158_124363);
  }
  unint64_t v2 = (void *)logCategory__hmf_once_v199;
  return v2;
}

uint64_t __48__HMDAccessoryFirmwareUpdateSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v199;
  logCategory__hmf_once_v199 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)__calculateDigestDataFromFile:(id)a3 maxDataSize:(unint64_t)a4 error:(id *)a5
{
  uint64_t v5 = MEMORY[0x1F4188790](a1);
  id v7 = v6;
  unint64_t v9 = v8;
  uint64_t v10 = (void *)v5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = v11;
  id v13 = [MEMORY[0x1E4F1CA10] inputStreamWithURL:v12];
  if (!v13)
  {
    char v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = v10;
    objc_super v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v27 = HMFGetLogIdentifier();
      int data = 138543618;
      __int16 v51 = v27;
      __int16 v52 = 2112;
      id v53 = v12;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Couldn't open input stream for %@", (uint8_t *)&data, 0x16u);
    }
    goto LABEL_17;
  }
  memset(&v43, 0, sizeof(v43));
  CC_SHA1_Init(&v43);
  [v13 open];
  uint64_t v14 = [v13 read:&data maxLength:4096];
  if (v14 >= 1)
  {
    unint64_t v15 = 0;
    while (1)
    {
      BOOL v16 = __CFADD__(v14, v15);
      v15 += v14;
      uint64_t v17 = v16;
      uint64_t v18 = v17 << 63 >> 63;
      if (v18 != v17 || v18 < 0 || v15 > v9) {
        break;
      }
      CC_SHA1_Update(&v43, &data, v14);
      uint64_t v14 = [v13 read:&data maxLength:4096];
      if (v14 <= 0) {
        goto LABEL_11;
      }
    }
    int v28 = (void *)MEMORY[0x1D9452090]([v13 close]);
    id v29 = v10;
    __int16 v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v45 = v31;
      __int16 v46 = 2048;
      uint64_t v47 = v9;
      __int16 v48 = 2112;
      id v49 = v12;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Data size is bigger than maximum %ld bytes on file %@", buf, 0x20u);
    }
    if (v7)
    {
      uint64_t v32 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
LABEL_26:
      uint64_t v23 = 0;
      void *v7 = v32;
      goto LABEL_33;
    }
    goto LABEL_17;
  }
LABEL_11:
  uint64_t v19 = [v13 close];
  if (v14 < 0)
  {
    uint64_t v33 = (void *)MEMORY[0x1D9452090](v19);
    id v34 = v10;
    uint64_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = HMFGetLogIdentifier();
      uint32_t v37 = [v13 streamError];
      *(_DWORD *)buf = 138543874;
      __int16 v45 = v36;
      __int16 v46 = 2112;
      uint64_t v47 = (uint64_t)v12;
      __int16 v48 = 2112;
      id v49 = v37;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Error reading documentation from %@: %@", buf, 0x20u);
    }
    if (v7)
    {
      uint64_t v32 = [v13 streamError];
      goto LABEL_26;
    }
LABEL_17:
    uint64_t v23 = 0;
    goto LABEL_33;
  }
  uint64_t v20 = [MEMORY[0x1E4F1CA58] dataWithLength:20];
  id v21 = v20;
  if (v20)
  {
    id v22 = v20;
    CC_SHA1_Final((unsigned __int8 *)[v22 mutableBytes], &v43);
    uint64_t v23 = (void *)[v22 copy];
  }
  else
  {
    __int16 v38 = (void *)MEMORY[0x1D9452090]();
    id v39 = v10;
    __int16 v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      __int16 v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v45 = v41;
      __int16 v46 = 2048;
      uint64_t v47 = 20;
      _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to allocate %lu bytes to hold digest", buf, 0x16u);
    }
    if (v7)
    {
      [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      uint64_t v23 = 0;
      void *v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = 0;
    }
  }

LABEL_33:
  return v23;
}

@end