@interface HMDCloudDataSyncStateFilter
+ (BOOL)isAllowedMessage:(id)a3;
+ (id)logCategory;
- (BOOL)_cloudSyncinProgressCheck:(id)a3 supressPopup:(BOOL)a4 sendCanceledError:(BOOL *)a5 dataSyncState:(unint64_t *)a6;
- (BOOL)_verifyAccountStatusForMigration;
- (BOOL)acceptMessage:(id)a3 target:(id)a4 errorReason:(id *)a5;
- (BOOL)areWeAllowedToAutoMigrateEmptyAccountsToHH2;
- (BOOL)cloudDataSyncCompleted;
- (BOOL)dataSyncInProgressWithState:(unint64_t *)a3 withMessage:(id)a4;
- (BOOL)decryptionFailed;
- (BOOL)hasHH2MigrationAlreadyRequested;
- (BOOL)iCloudAccountActive;
- (BOOL)iCloudSwitchRequiredPopShown;
- (BOOL)iCloudSwitchStateEnabled;
- (BOOL)isCloudDataSyncPeerAvailable;
- (BOOL)isHomeManagerFirstFetchFinished;
- (BOOL)isKeychainSyncPeerAvailable;
- (BOOL)isKeychainSyncSwitchEnabled;
- (BOOL)isLocalDataDecryptionFailed;
- (BOOL)isiCloudSwitchEnabled;
- (BOOL)keychainSyncEnabled;
- (BOOL)keychainSyncRequiredPopShown;
- (BOOL)localDataDecryptionFailed;
- (BOOL)networkConnectivityAvailable;
- (BOOL)resetConfigDisplayTimeHasElapsed;
- (BOOL)serverTokenAvailable;
- (BOOL)shouldCloudSyncData;
- (HMDCloudDataSyncStateFilter)initWithName:(id)a3 homeManager:(id)a4 messageDispatcher:(id)a5 serverTokenAvailable:(BOOL)a6 homeDataHasBeenDecrypted:(BOOL)a7 homeManagerServerTokenAvailable:(BOOL)a8 localDataDecryptionFailed:(BOOL)a9 totalHomes:(int64_t)a10 currentAccount:(id)a11;
- (HMDHomeManager)homeManager;
- (HMFMessageDispatcher)msgDispatcher;
- (HMFTimer)cloudDataSyncInProgressTimer;
- (HMFTimer)resetConfigDisplayTimer;
- (NSDate)dataSyncTimerStartTimestamp;
- (NSDate)resetConfigDisplayTimerStartTimestamp;
- (NSUUID)uuid;
- (OS_dispatch_source)iCloudSwitchPopupTimer;
- (OS_dispatch_source)popupTimer;
- (double)remainingDataSyncPeriod;
- (double)remainingResetConfigDisplayPeriod;
- (int64_t)totalHomes;
- (void)_clearResetConfigDisplayTimer;
- (void)_detectAndMigrateSharedUserWithEmptyOwnedHomes;
- (void)_evaluateMoveToHH2;
- (void)_handleCloudZoneReadyNotification:(id)a3;
- (void)_markHH1FirstCloudSyncComplete;
- (void)_moveDirectlyToHH2IfAccountIsEmpty;
- (void)_postNotificationForDataSyncInProgress:(BOOL)a3 dataSyncState:(unint64_t)a4 forcePost:(BOOL)a5;
- (void)_resetCloudDataSyncTimer;
- (void)_stallCloudDataSyncTimer;
- (void)_stallResetConfigDisplayTimer;
- (void)_startCloudDataSyncTimer;
- (void)_startDataConfigResetTimers;
- (void)_startPopupTimer;
- (void)_startResetConfigDisplayTimer;
- (void)_startiCloudSwitchPopupTimer;
- (void)_stopCloudDataSyncTimer;
- (void)_stopDataConfigResetTimers;
- (void)_stopPopupTimer;
- (void)_stopResetConfigDisplayTimer;
- (void)_stopiCloudSwitchPopupTimer;
- (void)_updateCloudDataSyncState:(BOOL)a3;
- (void)_updateCurrentAccount:(id)a3;
- (void)_updateKeychainSyncEnabled:(BOOL)a3;
- (void)dealloc;
- (void)evaluateMoveToHH2;
- (void)handleKeychainSyncStateChangedNotification:(id)a3;
- (void)kickResetConfigDisplayTimer;
- (void)moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes:(BOOL)a3;
- (void)resetConfiguration;
- (void)setCloudDataSyncCompleted:(BOOL)a3;
- (void)setCloudDataSyncInProgressTimer:(id)a3;
- (void)setCloudDataSyncPeerAvailable:(BOOL)a3;
- (void)setDataSyncTimerStartTimestamp:(id)a3;
- (void)setDecryptionFailed:(BOOL)a3;
- (void)setHasHH2MigrationAlreadyRequested:(BOOL)a3;
- (void)setHomeManager:(id)a3;
- (void)setHomeManagerFirstFetchFinished:(BOOL)a3;
- (void)setICloudAccountActive:(BOOL)a3;
- (void)setICloudSwitchPopupTimer:(id)a3;
- (void)setICloudSwitchRequiredPopShown:(BOOL)a3;
- (void)setICloudSwitchStateEnabled:(BOOL)a3;
- (void)setKeychainSyncEnabled:(BOOL)a3;
- (void)setKeychainSyncPeerAvailable:(BOOL)a3;
- (void)setKeychainSyncRequiredPopShown:(BOOL)a3;
- (void)setLocalDataDecryptionFailed:(BOOL)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setNetworkConnectivityAvailable:(BOOL)a3;
- (void)setPopupTimer:(id)a3;
- (void)setRemainingDataSyncPeriod:(double)a3;
- (void)setRemainingResetConfigDisplayPeriod:(double)a3;
- (void)setResetConfigDisplayTimeHasElapsed:(BOOL)a3;
- (void)setResetConfigDisplayTimer:(id)a3;
- (void)setResetConfigDisplayTimerStartTimestamp:(id)a3;
- (void)setServerTokenAvailable:(BOOL)a3;
- (void)setTotalHomes:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)startDataConfigResetTimers;
- (void)timerDidFire:(id)a3;
- (void)totalHomesInCloudZones:(id)a3;
- (void)updateCloudDataSyncState:(BOOL)a3;
- (void)updateCurrentAccount:(id)a3;
- (void)updateLocalDataDecryptionFailed:(BOOL)a3;
- (void)updateNetworkConnectivity:(BOOL)a3;
- (void)updateServerTokenAvailable:(BOOL)a3;
- (void)updateTotalHomes:(int64_t)a3;
- (void)updateWithoutDataSynCheckServerTokenAvailable:(BOOL)a3;
- (void)updateiCloudAccountActive:(BOOL)a3;
- (void)updateiCloudSwitchState:(BOOL)a3;
@end

@implementation HMDCloudDataSyncStateFilter

- (BOOL)acceptMessage:(id)a3 target:(id)a4 errorReason:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  v10 = [(HMDMessageFilter *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__HMDCloudDataSyncStateFilter_acceptMessage_target_errorReason___block_invoke;
  v13[3] = &unk_1E6A16D50;
  v13[4] = self;
  id v14 = v8;
  v15 = &v17;
  v16 = a5;
  id v11 = v8;
  dispatch_sync(v10, v13);

  LOBYTE(v8) = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return (char)v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t108 != -1) {
    dispatch_once(&logCategory__hmf_once_t108, &__block_literal_global_176);
  }
  v2 = (void *)logCategory__hmf_once_v109;
  return v2;
}

uint64_t __71__HMDCloudDataSyncStateFilter_dataSyncInProgressWithState_withMessage___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _cloudSyncinProgressCheck:*(void *)(a1 + 40) supressPopup:1 sendCanceledError:0 dataSyncState:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __65__HMDCloudDataSyncStateFilter__moveDirectlyToHH2IfAccountIsEmpty__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "totalHomes"));
    [*(id *)(a1 + 32) hasHH2MigrationAlreadyRequested];
    v7 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Going to check whether there are homes in the account or not: [homes = %@] [HH2 migration requested: %@]", buf, 0x20u);
  }
  uint64_t result = [*(id *)(a1 + 32) totalHomes];
  if (!result)
  {
    uint64_t result = [*(id *)(a1 + 32) _verifyAccountStatusForMigration];
    if (result)
    {
      id v9 = *(void **)(a1 + 32);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __65__HMDCloudDataSyncStateFilter__moveDirectlyToHH2IfAccountIsEmpty__block_invoke_134;
      v10[3] = &unk_1E6A18C40;
      v10[4] = v9;
      return [v9 totalHomesInCloudZones:v10];
    }
  }
  return result;
}

- (int64_t)totalHomes
{
  return self->_totalHomes;
}

- (BOOL)hasHH2MigrationAlreadyRequested
{
  return self->_hasHH2MigrationAlreadyRequested;
}

- (BOOL)_verifyAccountStatusForMigration
{
  v2 = self;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(HMDCloudDataSyncStateFilter *)self iCloudAccountActive])
  {
    if ([(HMDCloudDataSyncStateFilter *)v2 hasHH2MigrationAlreadyRequested])
    {
      id v3 = (void *)MEMORY[0x1D9452090]();
      v2 = v2;
      v4 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v13 = v5;
        v6 = "%{public}@Migration to HH2 is already requested. Not requesting again.";
LABEL_16:
        _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, v6, buf, 0xCu);
LABEL_17:
      }
    }
    else if ([(HMDCloudDataSyncStateFilter *)v2 networkConnectivityAvailable])
    {
      if ([(HMDCloudDataSyncStateFilter *)v2 isHomeManagerFirstFetchFinished])
      {
        uint64_t v11 = 0;
        if ([(HMDCloudDataSyncStateFilter *)v2 _cloudSyncinProgressCheck:0 supressPopup:1 sendCanceledError:0 dataSyncState:&v11])
        {
          id v3 = (void *)MEMORY[0x1D9452090]();
          v7 = v2;
          v4 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            v5 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            __int16 v13 = v5;
            v6 = "%{public}@cloud data is still syncing. Let's re-evaluate HH2 migration condition once it is done";
            goto LABEL_16;
          }
        }
        else
        {
          if (v11 == 1) {
            return 1;
          }
          id v3 = (void *)MEMORY[0x1D9452090]();
          id v9 = v2;
          v4 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            v5 = HMFGetLogIdentifier();
            v10 = [NSNumber numberWithUnsignedInteger:v11];
            *(_DWORD *)buf = 138543618;
            __int16 v13 = v5;
            __int16 v14 = 2112;
            __int16 v15 = v10;
            _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@HH1 data sync state is not good yet. %@", buf, 0x16u);

            goto LABEL_17;
          }
        }
      }
      else
      {
        id v3 = (void *)MEMORY[0x1D9452090]();
        v2 = v2;
        v4 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          v5 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v13 = v5;
          v6 = "%{public}@First fetch for Home Manager's zone is not done yet.";
          goto LABEL_16;
        }
      }
    }
    else
    {
      id v3 = (void *)MEMORY[0x1D9452090]();
      v2 = v2;
      v4 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v13 = v5;
        v6 = "%{public}@Network is not reachable right now. Not auto migrating account.";
        goto LABEL_16;
      }
    }
  }
  else
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    v2 = v2;
    v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v13 = v5;
      v6 = "%{public}@iCloud account is not signed in. Not going to auto migrate empty account.";
      goto LABEL_16;
    }
  }

  return 0;
}

void __64__HMDCloudDataSyncStateFilter_acceptMessage_target_errorReason___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v2 = +[HMDDeviceCapabilities deviceCapabilities];
  if (![v2 supportsKeychainSync]
    || ![*(id *)(a1 + 32) iCloudAccountActive]
    || [*(id *)(a1 + 32) keychainSyncEnabled])
  {

    goto LABEL_5;
  }
  v22 = [*(id *)(a1 + 40) name];
  BOOL v23 = +[HMDCloudDataSyncStateFilter isAllowedMessage:v22];

  if (v23
    || ![*(id *)(a1 + 32) isKeychainSyncPeerAvailable]
    || [*(id *)(a1 + 32) totalHomes] <= 0
    && ([*(id *)(a1 + 40) name],
        v24 = objc_claimAutoreleasedReturnValue(),
        int v25 = [v24 isEqualToString:@"kAddHomeRequestKey"],
        v24,
        !v25))
  {
LABEL_5:
    char v43 = 0;
    id v3 = [*(id *)(a1 + 40) name];
    if (+[HMDCloudDataSyncStateFilter isAllowedMessage:v3])
    {
    }
    else
    {
      int v4 = [*(id *)(a1 + 32) _cloudSyncinProgressCheck:*(void *)(a1 + 40) supressPopup:0 sendCanceledError:&v43 dataSyncState:0];

      if (v4)
      {
        if (*(void *)(a1 + 56))
        {
          if (v43) {
            uint64_t v5 = 23;
          }
          else {
            uint64_t v5 = 77;
          }
          **(void **)(a1 + 56) = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:v5 userInfo:0];
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        v6 = (void *)MEMORY[0x1D9452090]();
        v7 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          id v8 = HMFGetLogIdentifier();
          id v9 = [*(id *)(a1 + 40) name];
          *(_DWORD *)buf = 138543618;
          v47 = v8;
          __int16 v48 = 2112;
          v49 = v9;
          _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since cloud data sync is in progress", buf, 0x16u);
        }
        v10 = (void *)MEMORY[0x1D9452090]();
        uint64_t v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = HMFGetLogIdentifier();
          [*(id *)(a1 + 32) cloudDataSyncCompleted];
          __int16 v13 = HMFBooleanToString();
          [*(id *)(a1 + 32) serverTokenAvailable];
          __int16 v14 = HMFBooleanToString();
          [*(id *)(a1 + 32) isCloudDataSyncPeerAvailable];
          __int16 v15 = HMFBooleanToString();
          *(_DWORD *)buf = 138544130;
          v47 = v12;
          __int16 v48 = 2112;
          v49 = v13;
          __int16 v50 = 2112;
          v51 = v14;
          __int16 v52 = 2112;
          v53 = v15;
          _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@cloudDataSyncCompleted: %@, serverTokenAvailable: %@, cloudDataSyncPeerAvailable: %@", buf, 0x2Au);
        }
        uint64_t v16 = (void *)MEMORY[0x1D9452090]();
        uint64_t v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = HMFGetLogIdentifier();
          [*(id *)(a1 + 32) networkConnectivityAvailable];
          uint64_t v19 = HMFBooleanToString();
          [*(id *)(a1 + 32) iCloudAccountActive];
          char v20 = HMFBooleanToString();
          v21 = HMFBooleanToString();
          *(_DWORD *)buf = 138544130;
          v47 = v18;
          __int16 v48 = 2112;
          v49 = v19;
          __int16 v50 = 2112;
          v51 = v20;
          __int16 v52 = 2112;
          v53 = v21;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@networkConnectivityAvailable: %@, iCloudAccountActive: %@, decryptionFailed: %@", buf, 0x2Au);
        }
      }
    }
    return;
  }
  v26 = *(void **)(a1 + 32);
  v27 = +[HMDAppleAccountSettings sharedSettings];
  objc_msgSend(v26, "_updateKeychainSyncEnabled:", objc_msgSend(v27, "isKeychainSyncEnabled"));

  if ([*(id *)(a1 + 32) keychainSyncEnabled])
  {
    v28 = (void *)MEMORY[0x1D9452090]();
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = HMFGetLogIdentifier();
      v31 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138543618;
      v47 = v30;
      __int16 v48 = 2112;
      v49 = v31;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Resampled keychain sync state and it is enabled, accepting message %@", buf, 0x16u);
    }
    goto LABEL_5;
  }
  if (*(void *)(a1 + 56))
  {
    **(void **)(a1 + 56) = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:76 userInfo:0];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  v32 = (void *)MEMORY[0x1D9452090]();
  v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = HMFGetLogIdentifier();
    v35 = [*(id *)(a1 + 40) name];
    *(_DWORD *)buf = 138543618;
    v47 = v34;
    __int16 v48 = 2112;
    v49 = v35;
    _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Rejecting message %@ since keychain sync is not enabled", buf, 0x16u);
  }
  if (([*(id *)(a1 + 40) isEntitledForSPIAccess] & 1) == 0
    && ([*(id *)(a1 + 32) keychainSyncRequiredPopShown] & 1) == 0)
  {
    v36 = (void *)MEMORY[0x1D9452090]();
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v47 = v38;
      _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Presenting dialog about keychain sync being required since we have more than one account", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setKeychainSyncRequiredPopShown:1];
    v39 = +[HMDUIDialogPresenter sharedUIDialogPresenter];
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v40 = [*(id *)(a1 + 32) name];
    v41 = *(void **)(a1 + 32);
    v42 = [v41 workQueue];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __64__HMDCloudDataSyncStateFilter_acceptMessage_target_errorReason___block_invoke_160;
    v44[3] = &unk_1E6A10BF8;
    objc_copyWeak(&v45, (id *)buf);
    [v39 displayKeychainSyncForHome:v40 withContext:v41 queue:v42 completionHandler:v44];

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)_cloudSyncinProgressCheck:(id)a3 supressPopup:(BOOL)a4 sendCanceledError:(BOOL *)a5 dataSyncState:(unint64_t *)a6
{
  BOOL v8 = a4;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState__onceToken == -1)
  {
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState__onceToken, &__block_literal_global_166_85049);
  if (a5) {
LABEL_3:
  }
    *a5 = 0;
LABEL_4:
  if (a6) {
    *a6 = 1;
  }
  uint64_t v11 = +[HMDDeviceCapabilities deviceCapabilities];
  if ([v11 supportsKeychainSync]
    && [(HMDCloudDataSyncStateFilter *)self iCloudAccountActive]
    && ![(HMDCloudDataSyncStateFilter *)self keychainSyncEnabled])
  {
    if ([(HMDCloudDataSyncStateFilter *)self isKeychainSyncPeerAvailable])
    {
    }
    else
    {
      BOOL decryptionFailed = self->_decryptionFailed;

      if (!decryptionFailed) {
        goto LABEL_10;
      }
    }
    v64 = [v10 name];

    if (v64)
    {
      if ([v10 isEntitledForSPIAccess]
        && (v65 = (void *)_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___allowedMessages,
            [v10 name],
            v66 = objc_claimAutoreleasedReturnValue(),
            LODWORD(v65) = [v65 containsObject:v66],
            v66,
            v65))
      {
        v67 = (void *)MEMORY[0x1D9452090]();
        v68 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          v69 = HMFGetLogIdentifier();
          v70 = [v10 name];
          *(_DWORD *)buf = 138543618;
          v80 = v69;
          __int16 v81 = 2112;
          id v82 = v70;
          _os_log_impl(&dword_1D49D5000, v68, OS_LOG_TYPE_INFO, "%{public}@Allowing the message %@ though Keychain is not enabled", buf, 0x16u);
        }
        BOOL v26 = 0;
      }
      else
      {
        v67 = (void *)MEMORY[0x1D9452090]();
        v68 = HMFGetOSLogHandle();
        BOOL v26 = 1;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          v71 = HMFGetLogIdentifier();
          v72 = [v10 name];
          *(_DWORD *)buf = 138543618;
          v80 = v71;
          __int16 v81 = 2112;
          id v82 = v72;
          _os_log_impl(&dword_1D49D5000, v68, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since Keychain is not enabled and there are peers", buf, 0x16u);

          BOOL v26 = 1;
        }
      }

      if (!a6) {
        goto LABEL_103;
      }
    }
    else
    {
      BOOL v26 = 1;
      if (!a6) {
        goto LABEL_103;
      }
    }
    v73 = (void *)MEMORY[0x1D9452090]();
    v74 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      v75 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v80 = v75;
      _os_log_impl(&dword_1D49D5000, v74, OS_LOG_TYPE_INFO, "%{public}@Setting data sync state to keychain not enabled", buf, 0xCu);
    }
    unint64_t v62 = 2;
LABEL_102:
    *a6 = v62;
    goto LABEL_103;
  }

LABEL_10:
  if ([(HMDCloudDataSyncStateFilter *)self iCloudAccountActive]
    && ![(HMDCloudDataSyncStateFilter *)self iCloudSwitchStateEnabled])
  {
    uint64_t v19 = [v10 name];

    if (v19)
    {
      if ([v10 isEntitledForSPIAccess]
        && (char v20 = (void *)_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___allowedMessages,
            [v10 name],
            v21 = objc_claimAutoreleasedReturnValue(),
            LODWORD(v20) = [v20 containsObject:v21],
            v21,
            v20))
      {
        v22 = (void *)MEMORY[0x1D9452090]();
        BOOL v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = HMFGetLogIdentifier();
          int v25 = [v10 name];
          *(_DWORD *)buf = 138543618;
          v80 = v24;
          __int16 v81 = 2112;
          id v82 = v25;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Allowing message %@ though iCloud Switch is not enabled", buf, 0x16u);
        }
        BOOL v26 = 0;
      }
      else
      {
        v22 = (void *)MEMORY[0x1D9452090]();
        BOOL v23 = HMFGetOSLogHandle();
        BOOL v26 = 1;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v36 = HMFGetLogIdentifier();
          v37 = [v10 name];
          *(_DWORD *)buf = 138543618;
          v80 = v36;
          __int16 v81 = 2112;
          id v82 = v37;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since iCloud Switch is not enabled", buf, 0x16u);

          BOOL v26 = 1;
        }
      }

      if (!v10) {
        goto LABEL_85;
      }
    }
    else
    {
      BOOL v26 = 1;
      if (!v10)
      {
LABEL_85:
        if (!a6) {
          goto LABEL_103;
        }
        unint64_t v62 = 3;
        goto LABEL_102;
      }
    }
    if (([v10 isEntitledForSPIAccess] & 1) == 0
      && ![(HMDCloudDataSyncStateFilter *)self iCloudSwitchRequiredPopShown]
      && !v8)
    {
      v57 = (void *)MEMORY[0x1D9452090]();
      v58 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v80 = v59;
        _os_log_impl(&dword_1D49D5000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@Presenting dialog about iCloud Switch being required", buf, 0xCu);
      }
      [(HMDCloudDataSyncStateFilter *)self setICloudSwitchRequiredPopShown:1];
      if (a5) {
        *a5 = 1;
      }
      v60 = +[HMDUIDialogPresenter sharedUIDialogPresenter];
      objc_initWeak((id *)buf, self);
      v61 = [(HMDMessageFilter *)self workQueue];
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __102__HMDCloudDataSyncStateFilter__cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___block_invoke_169;
      v77[3] = &unk_1E6A10BF8;
      objc_copyWeak(&v78, (id *)buf);
      [v60 displayiCloudSwitchWithContext:self queue:v61 completionHandler:v77];

      objc_destroyWeak(&v78);
      objc_destroyWeak((id *)buf);
    }
    goto LABEL_85;
  }
  if (isWatch())
  {
    v12 = +[HMDDeviceCapabilities deviceCapabilities];
    if ([v12 supportsCloudDataSync])
    {
      __int16 v13 = (void *)_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState__watchAllowedCommands;
      __int16 v14 = [v10 name];
      LODWORD(v13) = [v13 containsObject:v14];

      if (v13)
      {
        __int16 v15 = (void *)MEMORY[0x1D9452090]();
        uint64_t v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = HMFGetLogIdentifier();
          v18 = [v10 name];
          *(_DWORD *)buf = 138543618;
          v80 = v17;
          __int16 v81 = 2112;
          id v82 = v18;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Allowing configuration message (%@) on watch supporting cloud data sync", buf, 0x16u);
        }
LABEL_74:

LABEL_75:
        BOOL v26 = 0;
        goto LABEL_103;
      }
    }
    else
    {
    }
  }
  if (![(HMDCloudDataSyncStateFilter *)self iCloudAccountActive]
    || [(HMDCloudDataSyncStateFilter *)self cloudDataSyncCompleted]
    || [(HMDCloudDataSyncStateFilter *)self serverTokenAvailable]
    || ![(HMDCloudDataSyncStateFilter *)self isCloudDataSyncPeerAvailable])
  {
    if ([(HMDCloudDataSyncStateFilter *)self iCloudAccountActive]
      && ![(HMDCloudDataSyncStateFilter *)self serverTokenAvailable])
    {
      v27 = (void *)MEMORY[0x1D9452090]();
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v34 = HMFGetLogIdentifier();
        v35 = [v10 name];
        *(_DWORD *)buf = 138543618;
        v80 = v34;
        __int16 v81 = 2112;
        id v82 = v35;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since signed into cloud, no valid server token", buf, 0x16u);
      }
    }
    else if ([(HMDCloudDataSyncStateFilter *)self iCloudAccountActive] {
           && ![(HMDCloudDataSyncStateFilter *)self cloudDataSyncCompleted])
    }
    {
      v27 = (void *)MEMORY[0x1D9452090]();
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v38 = HMFGetLogIdentifier();
        v39 = [v10 name];
        *(_DWORD *)buf = 138543618;
        v80 = v38;
        __int16 v81 = 2112;
        id v82 = v39;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since signed into cloud, but initial sync is not complete", buf, 0x16u);
      }
    }
    else if ([(HMDCloudDataSyncStateFilter *)self iCloudAccountActive] {
           && [(HMDCloudDataSyncStateFilter *)self cloudDataSyncCompleted]
    }
           && self->_decryptionFailed)
    {
      v27 = (void *)MEMORY[0x1D9452090]();
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v30 = HMFGetLogIdentifier();
        v31 = [v10 name];
        *(_DWORD *)buf = 138543618;
        v80 = v30;
        __int16 v81 = 2112;
        id v82 = v31;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since decryption failed", buf, 0x16u);
      }
    }
    else
    {
      if (![(HMDCloudDataSyncStateFilter *)self localDataDecryptionFailed])
      {
        BOOL v26 = 0;
        goto LABEL_62;
      }
      v27 = (void *)MEMORY[0x1D9452090]();
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v32 = HMFGetLogIdentifier();
        v33 = [v10 name];
        *(_DWORD *)buf = 138543618;
        v80 = v32;
        __int16 v81 = 2112;
        id v82 = v33;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since local data decryption failed", buf, 0x16u);
      }
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1D9452090]();
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v80 = v29;
      __int16 v81 = 2112;
      id v82 = v10;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since server token unavailable and cloud sync not completed and transient devices present", buf, 0x16u);
    }
  }

  if (a6)
  {
    if ([(HMDCloudDataSyncStateFilter *)self resetConfigDisplayTimeHasElapsed])
    {
      *a6 = 5;
      v40 = (void *)MEMORY[0x1D9452090]();
      v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v80 = v42;
        _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Setting data sync state to requiring configuration reset", buf, 0xCu);
      }
    }
    else
    {
      *a6 = 4;
      v40 = (void *)MEMORY[0x1D9452090]();
      v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        char v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v80 = v43;
        _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Setting data sync state to waiting for cloud data", buf, 0xCu);
      }
    }
  }
  BOOL v26 = 1;
LABEL_62:
  v44 = +[HMDAppleAccountManager sharedManager];
  id v45 = [v44 account];
  if (v45)
  {
    v46 = +[HMDDeviceCapabilities deviceCapabilities];
    int v47 = [v46 isRemoteGatewayCapable];

    if (v47
      && !+[HMDKeyTransferAgentServer isPeerAvailable])
    {
      __int16 v48 = (void *)MEMORY[0x1D9452090]();
      v49 = self;
      __int16 v50 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v51 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v80 = v51;
        _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_INFO, "%{public}@Allowing message due to no key transfer peers available", buf, 0xCu);
      }
      goto LABEL_75;
    }
  }
  else
  {
  }
  __int16 v52 = [v10 name];
  if (!v52 || ([v10 isEntitledForSPIAccess] & 1) == 0)
  {

    goto LABEL_103;
  }
  v53 = (void *)_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___allowedMessages;
  uint64_t v54 = [v10 name];
  LODWORD(v53) = [v53 containsObject:v54];

  if (v53)
  {
    __int16 v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v55 = HMFGetLogIdentifier();
      v56 = [v10 name];
      *(_DWORD *)buf = 138543618;
      v80 = v55;
      __int16 v81 = 2112;
      id v82 = v56;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Allowing the message %@", buf, 0x16u);
    }
    goto LABEL_74;
  }
LABEL_103:

  return v26;
}

- (BOOL)iCloudAccountActive
{
  return self->_iCloudAccountActive;
}

- (BOOL)localDataDecryptionFailed
{
  return self->_localDataDecryptionFailed;
}

+ (BOOL)isAllowedMessage:(id)a3
{
  uint64_t v3 = isAllowedMessage__pred;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isAllowedMessage__pred, &__block_literal_global_181);
  }
  char v5 = [(id)isAllowedMessage___allowedMessages containsObject:v4];

  return v5;
}

- (BOOL)dataSyncInProgressWithState:(unint64_t *)a3 withMessage:(id)a4
{
  id v6 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v7 = [(HMDMessageFilter *)self workQueue];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __71__HMDCloudDataSyncStateFilter_dataSyncInProgressWithState_withMessage___block_invoke;
  __int16 v13 = &unk_1E6A16D50;
  uint64_t v16 = &v18;
  __int16 v14 = self;
  id v8 = v6;
  id v15 = v8;
  uint64_t v17 = a3;
  dispatch_sync(v7, &v10);

  [(HMDCloudDataSyncStateFilter *)self _moveDirectlyToHH2IfAccountIsEmpty];
  LOBYTE(self) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)self;
}

- (BOOL)areWeAllowedToAutoMigrateEmptyAccountsToHH2
{
  v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  uint64_t v3 = [v2 preferenceForKey:@"stopAutoMigratingEmptyAccountsToHH2"];
  char v4 = [v3 BOOLValue];

  return (CFPreferencesGetAppBooleanValue(@"stopAutoMigratingEmptyAccountsToHH2", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0) == 0) & ~v4;
}

- (void)_moveDirectlyToHH2IfAccountIsEmpty
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"DefaultNewUsersToHH2Enabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0);
  if ((_os_feature_enabled_impl() & 1) != 0 || AppBooleanValue)
  {
    char v4 = [(HMDCloudDataSyncStateFilter *)self homeManager];
    char v5 = [v4 idsServerBag];
    char v6 = [v5 isHH2SoftwareReleased];

    if (v6)
    {
      if ([(HMDCloudDataSyncStateFilter *)self areWeAllowedToAutoMigrateEmptyAccountsToHH2])
      {
        if (![v4 areThereAnyTTSUSessionsOngoing])
        {
          id v15 = [(HMDMessageFilter *)self workQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __65__HMDCloudDataSyncStateFilter__moveDirectlyToHH2IfAccountIsEmpty__block_invoke;
          block[3] = &unk_1E6A19B30;
          block[4] = self;
          dispatch_async(v15, block);

          goto LABEL_15;
        }
        v7 = (void *)MEMORY[0x1D9452090]();
        id v8 = self;
        id v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v18 = v10;
          uint64_t v11 = "%{public}@Not migrating to HH2 as a TTSU session is ongoing.";
LABEL_12:
          _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
          goto LABEL_13;
        }
      }
      else
      {
        v7 = (void *)MEMORY[0x1D9452090]();
        id v8 = self;
        id v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v18 = v10;
          uint64_t v11 = "%{public}@Not migrating empty account to HH2 as 'allowed to auto migrate empty accounts' is NO.";
          goto LABEL_12;
        }
      }
    }
    else
    {
      v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = self;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        v12 = [(HMDCloudDataSyncStateFilter *)v8 homeManager];
        __int16 v13 = [v12 idsServerBag];
        [v13 isHH2SoftwareReleased];
        __int16 v14 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v10;
        __int16 v19 = 2112;
        uint64_t v20 = v14;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Can't migrate empty account to HH2 as HH2 software released server bag value is %@", buf, 0x16u);

LABEL_13:
      }
    }

LABEL_15:
  }
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_resetConfigDisplayTimerStartTimestamp, 0);
  objc_storeStrong((id *)&self->_resetConfigDisplayTimer, 0);
  objc_storeStrong((id *)&self->_dataSyncTimerStartTimestamp, 0);
  objc_storeStrong((id *)&self->_cloudDataSyncInProgressTimer, 0);
  objc_storeStrong((id *)&self->_iCloudSwitchPopupTimer, 0);
  objc_storeStrong((id *)&self->_popupTimer, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)setCloudDataSyncPeerAvailable:(BOOL)a3
{
  self->_cloudDataSyncPeerAvailable = a3;
}

- (BOOL)isCloudDataSyncPeerAvailable
{
  return self->_cloudDataSyncPeerAvailable;
}

- (void)setKeychainSyncPeerAvailable:(BOOL)a3
{
  self->_keychainSyncPeerAvailable = a3;
}

- (BOOL)isKeychainSyncPeerAvailable
{
  return self->_keychainSyncPeerAvailable;
}

- (void)setHomeManager:(id)a3
{
}

- (void)setHasHH2MigrationAlreadyRequested:(BOOL)a3
{
  self->_hasHH2MigrationAlreadyRequested = a3;
}

- (void)setResetConfigDisplayTimeHasElapsed:(BOOL)a3
{
  self->_resetConfigDisplayTimeHasElapsed = a3;
}

- (BOOL)resetConfigDisplayTimeHasElapsed
{
  return self->_resetConfigDisplayTimeHasElapsed;
}

- (void)setResetConfigDisplayTimerStartTimestamp:(id)a3
{
}

- (NSDate)resetConfigDisplayTimerStartTimestamp
{
  return self->_resetConfigDisplayTimerStartTimestamp;
}

- (void)setRemainingResetConfigDisplayPeriod:(double)a3
{
  self->_remainingResetConfigDisplayPeriod = a3;
}

- (double)remainingResetConfigDisplayPeriod
{
  return self->_remainingResetConfigDisplayPeriod;
}

- (void)setResetConfigDisplayTimer:(id)a3
{
}

- (HMFTimer)resetConfigDisplayTimer
{
  return self->_resetConfigDisplayTimer;
}

- (void)setDataSyncTimerStartTimestamp:(id)a3
{
}

- (NSDate)dataSyncTimerStartTimestamp
{
  return self->_dataSyncTimerStartTimestamp;
}

- (void)setRemainingDataSyncPeriod:(double)a3
{
  self->_remainingDataSyncPeriod = a3;
}

- (double)remainingDataSyncPeriod
{
  return self->_remainingDataSyncPeriod;
}

- (void)setCloudDataSyncInProgressTimer:(id)a3
{
}

- (HMFTimer)cloudDataSyncInProgressTimer
{
  return self->_cloudDataSyncInProgressTimer;
}

- (void)setNetworkConnectivityAvailable:(BOOL)a3
{
  self->_networkConnectivityAvailable = a3;
}

- (BOOL)networkConnectivityAvailable
{
  return self->_networkConnectivityAvailable;
}

- (void)setTotalHomes:(int64_t)a3
{
  self->_totalHomes = a3;
}

- (void)setLocalDataDecryptionFailed:(BOOL)a3
{
  self->_localDataDecryptionFailed = a3;
}

- (void)setICloudSwitchStateEnabled:(BOOL)a3
{
  self->_iCloudSwitchStateEnabled = a3;
}

- (BOOL)iCloudSwitchStateEnabled
{
  return self->_iCloudSwitchStateEnabled;
}

- (void)setServerTokenAvailable:(BOOL)a3
{
  self->_serverTokenAvailable = a3;
}

- (BOOL)serverTokenAvailable
{
  return self->_serverTokenAvailable;
}

- (void)setCloudDataSyncCompleted:(BOOL)a3
{
  self->_cloudDataSyncCompleted = a3;
}

- (BOOL)cloudDataSyncCompleted
{
  return self->_cloudDataSyncCompleted;
}

- (void)setICloudAccountActive:(BOOL)a3
{
  self->_iCloudAccountActive = a3;
}

- (void)setICloudSwitchRequiredPopShown:(BOOL)a3
{
  self->_iCloudSwitchRequiredPopShown = a3;
}

- (BOOL)iCloudSwitchRequiredPopShown
{
  return self->_iCloudSwitchRequiredPopShown;
}

- (void)setKeychainSyncRequiredPopShown:(BOOL)a3
{
  self->_keychainSyncRequiredPopShown = a3;
}

- (BOOL)keychainSyncRequiredPopShown
{
  return self->_keychainSyncRequiredPopShown;
}

- (void)setICloudSwitchPopupTimer:(id)a3
{
}

- (OS_dispatch_source)iCloudSwitchPopupTimer
{
  return self->_iCloudSwitchPopupTimer;
}

- (void)setPopupTimer:(id)a3
{
}

- (OS_dispatch_source)popupTimer
{
  return self->_popupTimer;
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setKeychainSyncEnabled:(BOOL)a3
{
  self->_keychainSyncEnabled = a3;
}

- (BOOL)keychainSyncEnabled
{
  return self->_keychainSyncEnabled;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setHomeManagerFirstFetchFinished:(BOOL)a3
{
  self->_homeManagerFirstFetchFinished = a3;
}

- (BOOL)isHomeManagerFirstFetchFinished
{
  return self->_homeManagerFirstFetchFinished;
}

- (BOOL)shouldCloudSyncData
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(HMDMessageFilter *)self workQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__HMDCloudDataSyncStateFilter_shouldCloudSyncData__block_invoke;
  v5[3] = &unk_1E6A18690;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __50__HMDCloudDataSyncStateFilter_shouldCloudSyncData__block_invoke(uint64_t a1)
{
  v2 = +[HMDDeviceCapabilities deviceCapabilities];
  int v3 = [v2 supportsStandaloneMode];

  uint64_t result = [*(id *)(a1 + 32) iCloudAccountActive];
  if (v3)
  {
    if (result)
    {
      if (([*(id *)(a1 + 32) keychainSyncEnabled] & 1) != 0
        || (uint64_t result = [*(id *)(a1 + 32) isCloudDataSyncPeerAvailable], result))
      {
        uint64_t result = [*(id *)(a1 + 32) iCloudSwitchStateEnabled];
      }
    }
  }
  else if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) keychainSyncEnabled];
    if (result)
    {
      uint64_t result = [*(id *)(a1 + 32) iCloudSwitchStateEnabled];
      if (result) {
        uint64_t result = *(unsigned char *)(*(void *)(a1 + 32) + 37) == 0;
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)resetConfiguration
{
  int v3 = [(HMDMessageFilter *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HMDCloudDataSyncStateFilter_resetConfiguration__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __49__HMDCloudDataSyncStateFilter_resetConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setServerTokenAvailable:0];
  [*(id *)(a1 + 32) setCloudDataSyncCompleted:0];
  v2 = +[HMDDeviceCapabilities deviceCapabilities];
  *(unsigned char *)(*(void *)(a1 + 32) + 37) = [v2 supportsStandaloneMode] ^ 1;

  int v3 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) setLocalDataDecryptionFailed:0]);
  char v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    char v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@HomeKit configuration got reset, stopping data reset timers", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _stopDataConfigResetTimers];
}

- (void)updateiCloudAccountActive:(BOOL)a3
{
  char v5 = [(HMDMessageFilter *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HMDCloudDataSyncStateFilter_updateiCloudAccountActive___block_invoke;
  v6[3] = &unk_1E6A19B58;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __57__HMDCloudDataSyncStateFilter_updateiCloudAccountActive___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) iCloudAccountActive];
  if (*(unsigned __int8 *)(a1 + 40) != result)
  {
    uint64_t v9 = 0;
    uint64_t v3 = [*(id *)(a1 + 32) _cloudSyncinProgressCheck:0 supressPopup:1 sendCanceledError:0 dataSyncState:&v9];
    char v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = HMFGetLogIdentifier();
      int v8 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 1024;
      int v13 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating iCloud account active to %{BOOL}d", buf, 0x12u);
    }
    [*(id *)(a1 + 32) setICloudAccountActive:*(unsigned __int8 *)(a1 + 40)];
    if (([*(id *)(a1 + 32) iCloudAccountActive] & 1) != 0
      || ![*(id *)(a1 + 32) cloudDataSyncCompleted])
    {
      return [*(id *)(a1 + 32) _postNotificationForDataSyncInProgress:v3 dataSyncState:v9 forcePost:0];
    }
    else
    {
      return [*(id *)(a1 + 32) _updateCloudDataSyncState:0];
    }
  }
  return result;
}

- (BOOL)isLocalDataDecryptionFailed
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(HMDMessageFilter *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__HMDCloudDataSyncStateFilter_isLocalDataDecryptionFailed__block_invoke;
  v5[3] = &unk_1E6A18690;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __58__HMDCloudDataSyncStateFilter_isLocalDataDecryptionFailed__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) localDataDecryptionFailed];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)updateLocalDataDecryptionFailed:(BOOL)a3
{
  id v5 = [(HMDMessageFilter *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__HMDCloudDataSyncStateFilter_updateLocalDataDecryptionFailed___block_invoke;
  v6[3] = &unk_1E6A19B58;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __63__HMDCloudDataSyncStateFilter_updateLocalDataDecryptionFailed___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) localDataDecryptionFailed];
  if (*(unsigned __int8 *)(a1 + 40) != result)
  {
    uint64_t v9 = 0;
    uint64_t v3 = [*(id *)(a1 + 32) _cloudSyncinProgressCheck:0 supressPopup:1 sendCanceledError:0 dataSyncState:&v9];
    char v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      BOOL v7 = (void *)v6;
      uint64_t v8 = "YES";
      if (!*(unsigned char *)(a1 + 40)) {
        uint64_t v8 = "NO";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      int v13 = v8;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating local data decryption fail state to: %s", buf, 0x16u);
    }
    [*(id *)(a1 + 32) setLocalDataDecryptionFailed:*(unsigned __int8 *)(a1 + 40)];
    return [*(id *)(a1 + 32) _postNotificationForDataSyncInProgress:v3 dataSyncState:v9 forcePost:0];
  }
  return result;
}

- (BOOL)isKeychainSyncSwitchEnabled
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(HMDMessageFilter *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__HMDCloudDataSyncStateFilter_isKeychainSyncSwitchEnabled__block_invoke;
  v5[3] = &unk_1E6A18690;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __58__HMDCloudDataSyncStateFilter_isKeychainSyncSwitchEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) keychainSyncEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isiCloudSwitchEnabled
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(HMDMessageFilter *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__HMDCloudDataSyncStateFilter_isiCloudSwitchEnabled__block_invoke;
  v5[3] = &unk_1E6A18690;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __52__HMDCloudDataSyncStateFilter_isiCloudSwitchEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) iCloudSwitchStateEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)updateiCloudSwitchState:(BOOL)a3
{
  id v5 = [(HMDMessageFilter *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__HMDCloudDataSyncStateFilter_updateiCloudSwitchState___block_invoke;
  v6[3] = &unk_1E6A19B58;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __55__HMDCloudDataSyncStateFilter_updateiCloudSwitchState___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) iCloudSwitchStateEnabled];
  if (*(unsigned __int8 *)(a1 + 40) != result)
  {
    uint64_t v9 = 0;
    uint64_t v3 = [*(id *)(a1 + 32) _cloudSyncinProgressCheck:0 supressPopup:1 sendCanceledError:0 dataSyncState:&v9];
    char v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      BOOL v7 = (void *)v6;
      uint64_t v8 = "";
      if (!*(unsigned char *)(a1 + 40)) {
        uint64_t v8 = "not ";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      int v13 = v8;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating iCloud Switch state to: %senabled", buf, 0x16u);
    }
    [*(id *)(a1 + 32) setICloudSwitchStateEnabled:*(unsigned __int8 *)(a1 + 40)];
    return [*(id *)(a1 + 32) _postNotificationForDataSyncInProgress:v3 dataSyncState:v9 forcePost:0];
  }
  return result;
}

- (void)updateServerTokenAvailable:(BOOL)a3
{
  id v5 = [(HMDMessageFilter *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__HMDCloudDataSyncStateFilter_updateServerTokenAvailable___block_invoke;
  v6[3] = &unk_1E6A19B58;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __58__HMDCloudDataSyncStateFilter_updateServerTokenAvailable___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) serverTokenAvailable];
  if (*(unsigned __int8 *)(a1 + 40) != result)
  {
    uint64_t v9 = 0;
    uint64_t v3 = [*(id *)(a1 + 32) _cloudSyncinProgressCheck:0 supressPopup:1 sendCanceledError:0 dataSyncState:&v9];
    char v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      BOOL v7 = (void *)v6;
      uint64_t v8 = "";
      if (!*(unsigned char *)(a1 + 40)) {
        uint64_t v8 = "not ";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      int v13 = v8;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating cloud server token available state to %savailable", buf, 0x16u);
    }
    [*(id *)(a1 + 32) setServerTokenAvailable:*(unsigned __int8 *)(a1 + 40)];
    return [*(id *)(a1 + 32) _postNotificationForDataSyncInProgress:v3 dataSyncState:v9 forcePost:0];
  }
  return result;
}

- (void)updateWithoutDataSynCheckServerTokenAvailable:(BOOL)a3
{
  id v5 = [(HMDMessageFilter *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__HMDCloudDataSyncStateFilter_updateWithoutDataSynCheckServerTokenAvailable___block_invoke;
  v6[3] = &unk_1E6A19B58;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __77__HMDCloudDataSyncStateFilter_updateWithoutDataSynCheckServerTokenAvailable___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) serverTokenAvailable];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != result)
  {
    char v4 = *(void **)(a1 + 32);
    return [v4 setServerTokenAvailable:v3 != 0];
  }
  return result;
}

- (void)_markHH1FirstCloudSyncComplete
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_hh1FirstCloudSyncComplete)
  {
    self->_hh1FirstCloudSyncComplete = 1;
    logger = self->_logger;
    if (os_signpost_enabled(logger))
    {
      *(_WORD *)id v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D49D5000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HH1FirstCloudSyncComplete", "", v5, 2u);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_updateCloudDataSyncState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(HMDCloudDataSyncStateFilter *)self cloudDataSyncCompleted] != a3)
  {
    uint64_t v12 = 0;
    BOOL v5 = [(HMDCloudDataSyncStateFilter *)self _cloudSyncinProgressCheck:0 supressPopup:1 sendCanceledError:0 dataSyncState:&v12];
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    BOOL v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = (void *)v8;
      uint64_t v10 = "Sync in progress";
      if (v3) {
        uint64_t v10 = "Sync completed";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2080;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating cloud sync state to %s", buf, 0x16u);
    }
    [(HMDCloudDataSyncStateFilter *)self setCloudDataSyncCompleted:v3];
    if ([(HMDCloudDataSyncStateFilter *)self cloudDataSyncCompleted])
    {
      uint64_t v11 = [(HMDCloudDataSyncStateFilter *)self homeManager];
      [v11 assistantSyncDataChanged:@"SyncStateCompleted"];

      [(HMDCloudDataSyncStateFilter *)self _markHH1FirstCloudSyncComplete];
    }
    [(HMDCloudDataSyncStateFilter *)self _postNotificationForDataSyncInProgress:v5 dataSyncState:v12 forcePost:[(HMDCloudDataSyncStateFilter *)self cloudDataSyncCompleted]];
  }
}

- (void)updateCloudDataSyncState:(BOOL)a3
{
  BOOL v5 = [(HMDMessageFilter *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__HMDCloudDataSyncStateFilter_updateCloudDataSyncState___block_invoke;
  v6[3] = &unk_1E6A19B58;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __56__HMDCloudDataSyncStateFilter_updateCloudDataSyncState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCloudDataSyncState:*(unsigned __int8 *)(a1 + 40)];
}

void __102__HMDCloudDataSyncStateFilter__cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___block_invoke_169(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    char v4 = (void *)MEMORY[0x1D9452090]();
    BOOL v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Enabling iCloud switch", (uint8_t *)&v8, 0xCu);
    }
    BOOL v7 = +[HMDAppleAccountSettings sharedSettings];
    [v7 updateHomeEnabled:1 completionHandler:&__block_literal_global_172];
  }
  [WeakRetained _startiCloudSwitchPopupTimer];
}

void __102__HMDCloudDataSyncStateFilter__cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___block_invoke()
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = @"kHomeConfigInternalRequestKey";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v1 = (void *)_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState__watchAllowedCommands;
  _cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState__watchAllowedCommands = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = @"kUpdateAccessAllowedWhenLockedRequestKey";
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
  uint64_t v4 = [v2 setWithArray:v3];
  BOOL v5 = (void *)_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___allowedMessages;
  _cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___allowedMessages = v4;
}

void __64__HMDCloudDataSyncStateFilter_acceptMessage_target_errorReason___block_invoke_160(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    uint64_t v4 = (void *)MEMORY[0x1D9452090]();
    BOOL v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      int v8 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Launching settings for iCloud Keychain", (uint8_t *)&v7, 0xCu);
    }
    launchURL(@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync");
  }
  [WeakRetained _startPopupTimer];
}

- (void)_updateCurrentAccount:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v27 = a3;
  uint64_t v4 = [v27 devices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    char v8 = 0;
    uint64_t v9 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (([v11 isCurrentDevice] & 1) == 0)
        {
          uint64_t v12 = [v11 capabilities];
          char v13 = [(id)v12 supportsKeychainSync];

          v8 |= v13;
          uint64_t v14 = [v11 capabilities];
          LOBYTE(v12) = [v14 supportsCloudDataSync];

          v7 |= v12;
          if (v8 & 1) != 0 && (v7)
          {
            char v7 = 1;
            char v8 = 1;
            goto LABEL_14;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v7 = 0;
    char v8 = 0;
  }
LABEL_14:

  if ((v8 & 1) != [(HMDCloudDataSyncStateFilter *)self isKeychainSyncPeerAvailable])
  {
    __int16 v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v18)
      {
        __int16 v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v33 = v19;
        uint64_t v20 = "%{public}@Keychain sync peers are available";
LABEL_20:
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, v20, buf, 0xCu);
      }
    }
    else if (v18)
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      uint64_t v20 = "%{public}@Keychain sync peers are not available";
      goto LABEL_20;
    }

    [(HMDCloudDataSyncStateFilter *)v16 setKeychainSyncPeerAvailable:v8 & 1];
  }
  if ((v7 & 1) != [(HMDCloudDataSyncStateFilter *)self isCloudDataSyncPeerAvailable])
  {
    uint64_t v21 = (void *)MEMORY[0x1D9452090]();
    v22 = self;
    BOOL v23 = HMFGetOSLogHandle();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v24)
      {
        int v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v33 = v25;
        BOOL v26 = "%{public}@Cloud data sync peers are available";
LABEL_28:
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, v26, buf, 0xCu);
      }
    }
    else if (v24)
    {
      int v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v25;
      BOOL v26 = "%{public}@Cloud data sync peers are not available";
      goto LABEL_28;
    }

    [(HMDCloudDataSyncStateFilter *)v22 setCloudDataSyncPeerAvailable:v7 & 1];
  }
}

- (void)updateCurrentAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDMessageFilter *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __52__HMDCloudDataSyncStateFilter_updateCurrentAccount___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __52__HMDCloudDataSyncStateFilter_updateCurrentAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentAccount:*(void *)(a1 + 40)];
}

- (void)updateTotalHomes:(int64_t)a3
{
  uint64_t v5 = [(HMDMessageFilter *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__HMDCloudDataSyncStateFilter_updateTotalHomes___block_invoke;
  v6[3] = &unk_1E6A189D0;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_sync(v5, v6);
}

uint64_t __48__HMDCloudDataSyncStateFilter_updateTotalHomes___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTotalHomes:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 _evaluateMoveToHH2];
}

- (void)_stopiCloudSwitchPopupTimer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(HMDCloudDataSyncStateFilter *)self setICloudSwitchRequiredPopShown:0];
  BOOL v3 = [(HMDCloudDataSyncStateFilter *)self iCloudSwitchPopupTimer];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Cancelling iCloud Switch popup shown timer", (uint8_t *)&v8, 0xCu);
    }
    char v7 = [(HMDCloudDataSyncStateFilter *)self iCloudSwitchPopupTimer];
    dispatch_source_cancel(v7);

    [(HMDCloudDataSyncStateFilter *)self setICloudSwitchPopupTimer:0];
  }
}

- (void)_startiCloudSwitchPopupTimer
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = keychainPopupTimerInterval;
  id v4 = [(HMDMessageFilter *)self workQueue];
  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
  [(HMDCloudDataSyncStateFilter *)self setICloudSwitchPopupTimer:v5];

  id v6 = [(HMDCloudDataSyncStateFilter *)self iCloudSwitchPopupTimer];
  dispatch_time_t v7 = dispatch_time(0, 1000000000 * v3);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);

  objc_initWeak(&location, self);
  int v8 = [(HMDCloudDataSyncStateFilter *)self iCloudSwitchPopupTimer];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  __int16 v15 = __59__HMDCloudDataSyncStateFilter__startiCloudSwitchPopupTimer__block_invoke;
  uint64_t v16 = &unk_1E6A16E40;
  objc_copyWeak(&v17, &location);
  dispatch_source_set_event_handler(v8, &v13);

  uint64_t v9 = [(HMDCloudDataSyncStateFilter *)self iCloudSwitchPopupTimer];
  dispatch_resume(v9);

  uint64_t v10 = (void *)MEMORY[0x1D9452090]();
  HMFGetOSLogHandle();
  uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting iCloud Switch popup shown timer", buf, 0xCu);
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __59__HMDCloudDataSyncStateFilter__startiCloudSwitchPopupTimer__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    uint64_t v3 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = HMFGetLogIdentifier();
      int v5 = 138543362;
      id v6 = v4;
      _os_log_impl(&dword_1D49D5000, v3, OS_LOG_TYPE_INFO, "%{public}@iCloud Switch popup timer fired, resetting last shown flag", (uint8_t *)&v5, 0xCu);
    }
    [WeakRetained _stopiCloudSwitchPopupTimer];
  }
}

- (void)_stopPopupTimer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(HMDCloudDataSyncStateFilter *)self setKeychainSyncRequiredPopShown:0];
  uint64_t v3 = [(HMDCloudDataSyncStateFilter *)self popupTimer];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    int v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Cancelling keychain sync popup shown timer", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v7 = [(HMDCloudDataSyncStateFilter *)self popupTimer];
    dispatch_source_cancel(v7);

    [(HMDCloudDataSyncStateFilter *)self setPopupTimer:0];
  }
}

- (void)_startPopupTimer
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = keychainPopupTimerInterval;
  id v4 = [(HMDMessageFilter *)self workQueue];
  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
  [(HMDCloudDataSyncStateFilter *)self setPopupTimer:v5];

  id v6 = [(HMDCloudDataSyncStateFilter *)self popupTimer];
  dispatch_time_t v7 = dispatch_time(0, 1000000000 * v3);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);

  objc_initWeak(&location, self);
  int v8 = [(HMDCloudDataSyncStateFilter *)self popupTimer];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  __int16 v15 = __47__HMDCloudDataSyncStateFilter__startPopupTimer__block_invoke;
  uint64_t v16 = &unk_1E6A16E40;
  objc_copyWeak(&v17, &location);
  dispatch_source_set_event_handler(v8, &v13);

  uint64_t v9 = [(HMDCloudDataSyncStateFilter *)self popupTimer];
  dispatch_resume(v9);

  uint64_t v10 = (void *)MEMORY[0x1D9452090]();
  HMFGetOSLogHandle();
  uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting keychain sync popup shown timer", buf, 0xCu);
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __47__HMDCloudDataSyncStateFilter__startPopupTimer__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    uint64_t v3 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = HMFGetLogIdentifier();
      int v5 = 138543362;
      id v6 = v4;
      _os_log_impl(&dword_1D49D5000, v3, OS_LOG_TYPE_INFO, "%{public}@Keychain sync popup timer fired, resetting last shown flag", (uint8_t *)&v5, 0xCu);
    }
    [WeakRetained _stopPopupTimer];
  }
}

- (void)_stallResetConfigDisplayTimer
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDCloudDataSyncStateFilter *)self resetConfigDisplayTimer];

  if (!v3)
  {
    uint64_t v20 = (void *)MEMORY[0x1D9452090]();
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      int v24 = 138543362;
      int v25 = v22;
      BOOL v23 = "%{public}@There is no reset config display timer running?";
LABEL_14:
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, v23, (uint8_t *)&v24, 0xCu);
    }
LABEL_15:

    return;
  }
  id v4 = [(HMDCloudDataSyncStateFilter *)self resetConfigDisplayTimerStartTimestamp];

  if (!v4)
  {
    uint64_t v20 = (void *)MEMORY[0x1D9452090]();
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      int v24 = 138543362;
      int v25 = v22;
      BOOL v23 = "%{public}@Reset config display timer start time in invalid?";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  [(HMDCloudDataSyncStateFilter *)self setResetConfigDisplayTimer:0];
  int v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [(HMDCloudDataSyncStateFilter *)self resetConfigDisplayTimerStartTimestamp];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  uint64_t v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v24 = 138543618;
    int v25 = v11;
    __int16 v26 = 2048;
    double v27 = v8;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Stalling the reset config display timer, %lf seconds have passed on this timer", (uint8_t *)&v24, 0x16u);
  }
  [(HMDCloudDataSyncStateFilter *)self remainingResetConfigDisplayPeriod];
  [(HMDCloudDataSyncStateFilter *)self setRemainingResetConfigDisplayPeriod:v12 - v8];
  uint64_t v13 = [(HMDCloudDataSyncStateFilter *)self remainingResetConfigDisplayPeriod];
  if (v14 <= 0.0)
  {
    __int16 v15 = (void *)MEMORY[0x1D9452090](v13);
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      int v24 = 138543362;
      int v25 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Remaining period for reset config display timer became less than 0?", (uint8_t *)&v24, 0xCu);
    }
    [(HMDCloudDataSyncStateFilter *)self setRemainingResetConfigDisplayPeriod:(double)(unint64_t)controllerKeyNotLandingWaitPeriod];
    BOOL v18 = +[HMDDeviceSetupManager sharedManager];
    int v19 = [v18 isRunning];

    if (v19) {
      [(HMDCloudDataSyncStateFilter *)self setRemainingResetConfigDisplayPeriod:(double)(unint64_t)controllerKeyNotLandingShortCircuitWaitPeriod];
    }
  }
}

- (void)_clearResetConfigDisplayTimer
{
  [(HMDCloudDataSyncStateFilter *)self setResetConfigDisplayTimer:0];
  [(HMDCloudDataSyncStateFilter *)self setResetConfigDisplayTimerStartTimestamp:0];
  [(HMDCloudDataSyncStateFilter *)self setRemainingResetConfigDisplayPeriod:0.0];
}

- (void)_stopResetConfigDisplayTimer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    double v7 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping reset config display timer", (uint8_t *)&v6, 0xCu);
  }
  [(HMDCloudDataSyncStateFilter *)self _clearResetConfigDisplayTimer];
  [(HMDCloudDataSyncStateFilter *)self setResetConfigDisplayTimeHasElapsed:0];
}

- (void)_startResetConfigDisplayTimer
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!+[HMDDeviceCapabilities supportsCustomerReset])
  {
    uint64_t v21 = MEMORY[0x1D9452090]();
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      BOOL v23 = HMFGetLogIdentifier();
      int v42 = 138543362;
      char v43 = v23;
      int v24 = "%{public}@Reset config display timer is not valid on this platform";
LABEL_22:
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v42, 0xCu);
    }
LABEL_23:

    v39 = (void *)v21;
    goto LABEL_24;
  }
  uint64_t v3 = +[HMDDeviceSetupManager sharedManager];
  int v4 = [v3 isRunning];

  int v5 = [(HMDCloudDataSyncStateFilter *)self resetConfigDisplayTimer];

  if (v5)
  {
    if (v4)
    {
      int v6 = [MEMORY[0x1E4F1C9C8] date];
      double v7 = [(HMDCloudDataSyncStateFilter *)self resetConfigDisplayTimerStartTimestamp];
      [v6 timeIntervalSinceDate:v7];
      double v9 = v8;

      uint64_t v10 = [(HMDCloudDataSyncStateFilter *)self remainingResetConfigDisplayPeriod];
      double v12 = v11 - v9;
      double v13 = (double)(unint64_t)controllerKeyNotLandingShortCircuitWaitPeriod;
      double v14 = (void *)MEMORY[0x1D9452090](v10);
      __int16 v15 = HMFGetOSLogHandle();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v12 >= v13)
      {
        if (v16)
        {
          id v17 = HMFGetLogIdentifier();
          int v42 = 138543362;
          char v43 = v17;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Reset config display timer is running but short circuit time is less than current remaining, restarting timer", (uint8_t *)&v42, 0xCu);
        }
        [(HMDCloudDataSyncStateFilter *)self _stopResetConfigDisplayTimer];
        uint64_t v18 = [(HMDCloudDataSyncStateFilter *)self remainingResetConfigDisplayPeriod];
        if (v19 > 0.0) {
          goto LABEL_17;
        }
        uint64_t v20 = &controllerKeyNotLandingShortCircuitWaitPeriod;
        goto LABEL_14;
      }
      if (v16)
      {
        v40 = HMFGetLogIdentifier();
        [(HMDCloudDataSyncStateFilter *)self remainingResetConfigDisplayPeriod];
        int v42 = 138543874;
        char v43 = v40;
        __int16 v44 = 2048;
        double v45 = v41 - v9;
        __int16 v46 = 2048;
        uint64_t v47 = controllerKeyNotLandingShortCircuitWaitPeriod;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Reset config display timer is already running and remaining time %lf is less than short circuit time %lu", (uint8_t *)&v42, 0x20u);
      }
      v39 = v14;
LABEL_24:
      return;
    }
    uint64_t v21 = MEMORY[0x1D9452090]();
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      BOOL v23 = HMFGetLogIdentifier();
      int v42 = 138543362;
      char v43 = v23;
      int v24 = "%{public}@Reset config display timer is already running, not restarting";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  uint64_t v18 = [(HMDCloudDataSyncStateFilter *)self remainingResetConfigDisplayPeriod];
  if (v25 <= 0.0)
  {
    uint64_t v20 = &controllerKeyNotLandingWaitPeriod;
    if (v4) {
      uint64_t v20 = &controllerKeyNotLandingShortCircuitWaitPeriod;
    }
LABEL_14:
    double v26 = (double)(unint64_t)*v20;
    double v27 = (void *)MEMORY[0x1D9452090](v18);
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      long long v29 = HMFGetLogIdentifier();
      int v42 = 138543618;
      char v43 = v29;
      __int16 v44 = 2048;
      double v45 = v26;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Reset config display timer does not exist, initializing it to %lf", (uint8_t *)&v42, 0x16u);
    }
    uint64_t v18 = [(HMDCloudDataSyncStateFilter *)self setRemainingResetConfigDisplayPeriod:v26];
  }
LABEL_17:
  long long v30 = (void *)MEMORY[0x1D9452090](v18);
  long long v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = HMFGetLogIdentifier();
    [(HMDCloudDataSyncStateFilter *)self remainingResetConfigDisplayPeriod];
    int v42 = 138543618;
    char v43 = v32;
    __int16 v44 = 2048;
    double v45 = v33;
    _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Starting a timer with %lf seconds to wait for controller key to land", (uint8_t *)&v42, 0x16u);
  }
  id v34 = objc_alloc(MEMORY[0x1E4F65580]);
  [(HMDCloudDataSyncStateFilter *)self remainingResetConfigDisplayPeriod];
  uint64_t v35 = objc_msgSend(v34, "initWithTimeInterval:options:", 1);
  [(HMDCloudDataSyncStateFilter *)self setResetConfigDisplayTimer:v35];

  v36 = [(HMDCloudDataSyncStateFilter *)self resetConfigDisplayTimer];
  [v36 setDelegate:self];

  v37 = [(HMDCloudDataSyncStateFilter *)self resetConfigDisplayTimer];
  [v37 resume];

  v38 = [MEMORY[0x1E4F1C9C8] date];
  [(HMDCloudDataSyncStateFilter *)self setResetConfigDisplayTimerStartTimestamp:v38];
}

- (void)kickResetConfigDisplayTimer
{
  uint64_t v3 = [(HMDMessageFilter *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HMDCloudDataSyncStateFilter_kickResetConfigDisplayTimer__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __58__HMDCloudDataSyncStateFilter_kickResetConfigDisplayTimer__block_invoke(uint64_t a1)
{
  id v4 = +[HMDDeviceCapabilities deviceCapabilities];
  if ([v4 supportsKeychainSync]
    && ([*(id *)(a1 + 32) keychainSyncEnabled] & 1) != 0)
  {
    v2 = [*(id *)(a1 + 32) resetConfigDisplayTimer];

    if (v2)
    {
      uint64_t v3 = *(void **)(a1 + 32);
      [v3 _startResetConfigDisplayTimer];
    }
  }
  else
  {
  }
}

- (void)_stallCloudDataSyncTimer
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDCloudDataSyncStateFilter *)self cloudDataSyncInProgressTimer];

  if (!v3)
  {
    uint64_t v18 = (void *)MEMORY[0x1D9452090]();
    double v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v22 = 138543362;
      BOOL v23 = v20;
      uint64_t v21 = "%{public}@There is no cloud sync timer running?";
LABEL_13:
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v22, 0xCu);
    }
LABEL_14:

    return;
  }
  id v4 = [(HMDCloudDataSyncStateFilter *)self dataSyncTimerStartTimestamp];

  if (!v4)
  {
    uint64_t v18 = (void *)MEMORY[0x1D9452090]();
    double v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v22 = 138543362;
      BOOL v23 = v20;
      uint64_t v21 = "%{public}@There is data sync timer timestamp timer running?";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  [(HMDCloudDataSyncStateFilter *)self setCloudDataSyncInProgressTimer:0];
  int v5 = [MEMORY[0x1E4F1C9C8] date];
  int v6 = [(HMDCloudDataSyncStateFilter *)self dataSyncTimerStartTimestamp];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  double v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    double v11 = HMFGetLogIdentifier();
    int v22 = 138543618;
    BOOL v23 = v11;
    __int16 v24 = 2048;
    double v25 = v8;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Stalling the cloud data sync timer, %lf seconds have passed on this timer", (uint8_t *)&v22, 0x16u);
  }
  [(HMDCloudDataSyncStateFilter *)self remainingDataSyncPeriod];
  [(HMDCloudDataSyncStateFilter *)self setRemainingDataSyncPeriod:v12 - v8];
  uint64_t v13 = [(HMDCloudDataSyncStateFilter *)self remainingDataSyncPeriod];
  if (v14 <= 0.0)
  {
    __int16 v15 = (void *)MEMORY[0x1D9452090](v13);
    BOOL v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      int v22 = 138543362;
      BOOL v23 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Remaining period became less than 0?", (uint8_t *)&v22, 0xCu);
    }
    [(HMDCloudDataSyncStateFilter *)self setRemainingDataSyncPeriod:(double)(unint64_t)cloudDataSyncInProgressWaitPeriod];
  }
}

- (void)_resetCloudDataSyncTimer
{
  [(HMDCloudDataSyncStateFilter *)self setCloudDataSyncInProgressTimer:0];
  [(HMDCloudDataSyncStateFilter *)self setDataSyncTimerStartTimestamp:0];
  [(HMDCloudDataSyncStateFilter *)self setRemainingDataSyncPeriod:0.0];
}

- (void)_stopCloudDataSyncTimer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    double v7 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping cloud data sync timer", (uint8_t *)&v6, 0xCu);
  }
  [(HMDCloudDataSyncStateFilter *)self _resetCloudDataSyncTimer];
}

- (void)_startCloudDataSyncTimer
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[HMDDeviceCapabilities deviceCapabilities];
  char v4 = [v3 supportsKeychainSync];

  if (v4)
  {
    uint64_t v5 = [(HMDCloudDataSyncStateFilter *)self remainingDataSyncPeriod];
    if (v6 <= 0.0)
    {
      double v7 = (double)(unint64_t)cloudDataSyncInProgressWaitPeriod;
      uint64_t v8 = (void *)MEMORY[0x1D9452090](v5);
      double v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        int v23 = 138543618;
        __int16 v24 = v10;
        __int16 v25 = 2048;
        double v26 = v7;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Timer does not exist, initializing it to %lf", (uint8_t *)&v23, 0x16u);
      }
      uint64_t v5 = [(HMDCloudDataSyncStateFilter *)self setRemainingDataSyncPeriod:v7];
    }
    double v11 = (void *)MEMORY[0x1D9452090](v5);
    double v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      [(HMDCloudDataSyncStateFilter *)self remainingDataSyncPeriod];
      int v23 = 138543618;
      __int16 v24 = v13;
      __int16 v25 = 2048;
      double v26 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting a timer with %lf seconds to wait for cloud data sync to complete", (uint8_t *)&v23, 0x16u);
    }
    __int16 v15 = [(HMDCloudDataSyncStateFilter *)self cloudDataSyncInProgressTimer];
    [v15 setDelegate:self];

    id v16 = objc_alloc(MEMORY[0x1E4F65580]);
    [(HMDCloudDataSyncStateFilter *)self remainingDataSyncPeriod];
    id v17 = objc_msgSend(v16, "initWithTimeInterval:options:", 1);
    [(HMDCloudDataSyncStateFilter *)self setCloudDataSyncInProgressTimer:v17];

    uint64_t v18 = [(HMDCloudDataSyncStateFilter *)self cloudDataSyncInProgressTimer];
    [v18 resume];

    double v19 = [MEMORY[0x1E4F1C9C8] date];
    [(HMDCloudDataSyncStateFilter *)self setDataSyncTimerStartTimestamp:v19];
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1D9452090]();
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = HMFGetLogIdentifier();
      int v23 = 138543362;
      __int16 v24 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Cloud data sync timer is not valid on devices without keychain sync", (uint8_t *)&v23, 0xCu);
    }
  }
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDMessageFilter *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __44__HMDCloudDataSyncStateFilter_timerDidFire___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__HMDCloudDataSyncStateFilter_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) cloudDataSyncInProgressTimer];

  if (v2 == v3)
  {
    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    double v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      id v17 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Cloud data sync in progress timer has fired", (uint8_t *)&v16, 0xCu);
    }
    [*(id *)(a1 + 40) _resetCloudDataSyncTimer];
    *(unsigned char *)(*(void *)(a1 + 40) + 37) = 0;
    double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)(a1 + 40);
    double v12 = @"kCloudDataSyncTimerExpiredNotification";
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) resetConfigDisplayTimer];

    if (v4 != v5) {
      return;
    }
    id v6 = (void *)MEMORY[0x1D9452090]();
    double v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v16 = 138543362;
      id v17 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Reset config display timer has fired", (uint8_t *)&v16, 0xCu);
    }
    [*(id *)(a1 + 40) _clearResetConfigDisplayTimer];
    [*(id *)(a1 + 40) setResetConfigDisplayTimeHasElapsed:1];
    double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)(a1 + 40);
    double v12 = @"kCloudDataSyncInProgressUpdatedNotification";
  }
  [v9 postNotificationName:v12 object:v11];
}

- (void)updateNetworkConnectivity:(BOOL)a3
{
  uint64_t v5 = [(HMDMessageFilter *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HMDCloudDataSyncStateFilter_updateNetworkConnectivity___block_invoke;
  v6[3] = &unk_1E6A19B58;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __57__HMDCloudDataSyncStateFilter_updateNetworkConnectivity___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setNetworkConnectivityAvailable:*(unsigned __int8 *)(a1 + 40)];
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[37] && [v2 keychainSyncEnabled])
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    id v4 = (void *)MEMORY[0x1D9452090]();
    uint64_t v5 = HMFGetOSLogHandle();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        BOOL v7 = HMFGetLogIdentifier();
        int v15 = 138543362;
        int v16 = v7;
        _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Network is reachable now, starting the cloud sync timer", (uint8_t *)&v15, 0xCu);
      }
      [*(id *)(a1 + 32) _startDataConfigResetTimers];
    }
    else
    {
      if (v6)
      {
        double v14 = HMFGetLogIdentifier();
        int v15 = 138543362;
        int v16 = v14;
        _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Network is not reachable now, stalling the cloud sync timer", (uint8_t *)&v15, 0xCu);
      }
      [*(id *)(a1 + 32) _stallCloudDataSyncTimer];
      [*(id *)(a1 + 32) _stallResetConfigDisplayTimer];
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    double v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = HMFBooleanToString();
      [*(id *)(a1 + 32) keychainSyncEnabled];
      double v12 = HMFBooleanToString();
      int v15 = 138543874;
      int v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Network reachability changed to %@ and decryption failed, keychain enabled: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  uint64_t result = [*(id *)(a1 + 32) networkConnectivityAvailable];
  if (result) {
    return [*(id *)(a1 + 32) _evaluateMoveToHH2];
  }
  return result;
}

- (void)_stopDataConfigResetTimers
{
  [(HMDCloudDataSyncStateFilter *)self _stopCloudDataSyncTimer];
  [(HMDCloudDataSyncStateFilter *)self _stopResetConfigDisplayTimer];
}

- (void)_startDataConfigResetTimers
{
  [(HMDCloudDataSyncStateFilter *)self _startCloudDataSyncTimer];
  if (![(HMDCloudDataSyncStateFilter *)self resetConfigDisplayTimeHasElapsed])
  {
    [(HMDCloudDataSyncStateFilter *)self _startResetConfigDisplayTimer];
  }
}

- (void)startDataConfigResetTimers
{
  int v3 = [(HMDMessageFilter *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HMDCloudDataSyncStateFilter_startDataConfigResetTimers__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __57__HMDCloudDataSyncStateFilter_startDataConfigResetTimers__block_invoke(uint64_t a1)
{
  id v4 = +[HMDDeviceCapabilities deviceCapabilities];
  if ([v4 supportsKeychainSync])
  {
    int v2 = [*(id *)(a1 + 32) keychainSyncEnabled];

    if (v2)
    {
      int v3 = *(void **)(a1 + 32);
      [v3 _startDataConfigResetTimers];
    }
  }
  else
  {
  }
}

- (void)setDecryptionFailed:(BOOL)a3
{
  uint64_t v5 = [(HMDMessageFilter *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__HMDCloudDataSyncStateFilter_setDecryptionFailed___block_invoke;
  v6[3] = &unk_1E6A19B58;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __51__HMDCloudDataSyncStateFilter_setDecryptionFailed___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 **)(a1 + 32);
  if (v2[37] == *(unsigned __int8 *)(a1 + 40))
  {
    int v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      BOOL v6 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      __int16 v24 = v5;
      __int16 v25 = 2112;
      double v26 = v6;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Decrypt failed is already set to %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v7 = [v2 _cloudSyncinProgressCheck:0 supressPopup:1 sendCanceledError:0 dataSyncState:&v22];
    id v8 = (void *)MEMORY[0x1D9452090]();
    double v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = HMFBooleanToString();
      double v12 = HMFBooleanToString();
      uint64_t v13 = HMHomeManagerDataSyncStateToString();
      *(_DWORD *)buf = 138544130;
      __int16 v24 = v10;
      __int16 v25 = 2112;
      double v26 = v11;
      __int16 v27 = 2112;
      uint64_t v28 = v12;
      __int16 v29 = 2112;
      long long v30 = v13;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating decrypt fail state from %@ to %@, dataSyncState: %@", buf, 0x2Au);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 37) = *(unsigned char *)(a1 + 40);
    uint64_t v14 = [*(id *)(a1 + 32) _postNotificationForDataSyncInProgress:v7 dataSyncState:v22 forcePost:0];
    if (*(unsigned char *)(a1 + 40) && (uint64_t v14 = [*(id *)(a1 + 32) keychainSyncEnabled], v14))
    {
      int v15 = (void *)MEMORY[0x1D9452090]();
      int v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __int16 v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v24 = v17;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Decrypt failed and keychain is enabled, starting data reset timers", buf, 0xCu);
      }
      [*(id *)(a1 + 32) _startDataConfigResetTimers];
    }
    else
    {
      uint64_t v18 = (void *)MEMORY[0x1D9452090](v14);
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        [*(id *)(a1 + 32) keychainSyncEnabled];
        uint64_t v21 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        __int16 v24 = v20;
        __int16 v25 = 2112;
        double v26 = v21;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Stopping data reset timers, keychain enabled: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 32) _stopDataConfigResetTimers];
    }
  }
}

- (BOOL)decryptionFailed
{
  int v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  int v3 = [(HMDMessageFilter *)self workQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__HMDCloudDataSyncStateFilter_decryptionFailed__block_invoke;
  v5[3] = &unk_1E6A18690;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __47__HMDCloudDataSyncStateFilter_decryptionFailed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 37);
  return result;
}

- (void)totalHomesInCloudZones:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDCloudDataSyncStateFilter *)self homeManager];
  uint64_t v6 = [v5 cloudDataSyncManager];
  uint64_t v7 = [v6 homeManagerZone];

  uint64_t v8 = [v5 uuid];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__HMDCloudDataSyncStateFilter_totalHomesInCloudZones___block_invoke;
  v10[3] = &unk_1E6A187D0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v7 cloudRecordsForParentID:v8 completionHandler:v10];
}

void __54__HMDCloudDataSyncStateFilter_totalHomesInCloudZones___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Encountered an error while querying cloud cache for records", (uint8_t *)&buf, 0xCu);
    }
    id v11 = _Block_copy(*(const void **)(a1 + 40));
    double v12 = v11;
    if (v11) {
      (*((void (**)(void *, void, id))v11 + 2))(v11, 0, v6);
    }
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__HMDCloudDataSyncStateFilter_totalHomesInCloudZones___block_invoke_150;
    v15[3] = &unk_1E6A0DA50;
    v15[4] = *(void *)(a1 + 32);
    v15[5] = &buf;
    objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);
    uint64_t v13 = _Block_copy(*(const void **)(a1 + 40));
    uint64_t v14 = v13;
    if (v13) {
      (*((void (**)(void *, void, void))v13 + 2))(v13, *(void *)(*((void *)&buf + 1) + 24), 0);
    }

    _Block_object_dispose(&buf, 8);
  }
}

void __54__HMDCloudDataSyncStateFilter_totalHomesInCloudZones___block_invoke_150(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 extractObjectChange];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      double v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Found : %@", (uint8_t *)&v11, 0x16u);
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (void)_handleCloudZoneReadyNotification:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = objc_msgSend(v5, "hmf_UUIDForKey:", @"HMDCR.id");
  objc_msgSend(v5, "hmf_BOOLForKey:", @"HMDCR.stc");
  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    int v11 = [v6 UUIDString];
    double v12 = HMFBooleanToString();
    *(_DWORD *)long long buf = 138543874;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    int v23 = v11;
    __int16 v24 = 2112;
    __int16 v25 = v12;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Cloud manager completed initial fetch for zone %@, didServerTokenChange: %@", buf, 0x20u);
  }
  __int16 v13 = [(HMDMessageFilter *)v8 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HMDCloudDataSyncStateFilter__handleCloudZoneReadyNotification___block_invoke;
  block[3] = &unk_1E6A19668;
  id v17 = v6;
  uint64_t v18 = v8;
  id v19 = v5;
  id v14 = v5;
  id v15 = v6;
  dispatch_async(v13, block);
}

uint64_t __65__HMDCloudDataSyncStateFilter__handleCloudZoneReadyNotification___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1411CE6C-B4DE-4622-A49D-F66FE296D6B5"];
    int v4 = [v2 isEqual:v3];

    if (v4)
    {
      id v5 = (void *)MEMORY[0x1D9452090]();
      id v6 = *(id *)(a1 + 40);
      uint64_t v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        int v20 = 138543362;
        uint64_t v21 = v8;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@home manager zone fetch finished", (uint8_t *)&v20, 0xCu);
      }
      [*(id *)(a1 + 40) setHomeManagerFirstFetchFinished:1];
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 40);
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      double v12 = HMFGetLogIdentifier();
      int v20 = 138543362;
      uint64_t v21 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Legacy zone fetch finished", (uint8_t *)&v20, 0xCu);
    }
    __int16 v13 = objc_msgSend(*(id *)(a1 + 48), "hmf_numberForKey:", @"HMDCR.de");
    id v14 = v13;
    if (v13 && ([v13 BOOLValue] & 1) == 0)
    {
      id v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = *(id *)(a1 + 40);
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        int v20 = 138543362;
        uint64_t v21 = v18;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Legacy zone does not have home data records, home manager zone will not be fetched", (uint8_t *)&v20, 0xCu);
      }
      [*(id *)(a1 + 40) setHomeManagerFirstFetchFinished:1];
    }
  }
  uint64_t result = [*(id *)(a1 + 40) isHomeManagerFirstFetchFinished];
  if (result) {
    return [*(id *)(a1 + 40) _evaluateMoveToHH2];
  }
  return result;
}

- (void)_detectAndMigrateSharedUserWithEmptyOwnedHomes
{
  id v3 = [(HMDCloudDataSyncStateFilter *)self homeManager];
  int v4 = [v3 workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke;
  v6[3] = &unk_1E6A197C8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) hasHH2MigrationAlreadyRequested])
  {
    int v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 32);
    int v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      long long v30 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@HH2 migration has already been requested. Not requesting again.", buf, 0xCu);
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) homes];
    id v7 = objc_msgSend(v6, "na_filter:", &__block_literal_global_144_85139);

    id v8 = [*(id *)(a1 + 40) homes];
    uint64_t v9 = [v8 count];
    uint64_t v10 = [v7 count];

    int v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = *(id *)(a1 + 32);
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      id v16 = [NSNumber numberWithUnsignedInteger:v9 - v10];
      *(_DWORD *)long long buf = 138543874;
      long long v30 = v14;
      __int16 v31 = 2112;
      v32 = v15;
      __int16 v33 = 2112;
      id v34 = v16;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Owned Home Count : %@, Total Shared Home Count: %@", buf, 0x20u);
    }
    if ([v7 count])
    {
      if (v9 == v10)
      {
        id v17 = (void *)MEMORY[0x1D9452090]();
        id v18 = *(id *)(a1 + 32);
        id v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543362;
          long long v30 = v20;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Not migrating empty owned homes for shared users as they do not have any shared homes right now. This is already covered by the daily overnight migration which has some extra few checks. Please take a look at : fetchIsCurrentUserEligibleForAutoMigrationWithCompletion method", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v21 = *(void **)(a1 + 40);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke_145;
        v25[3] = &unk_1E6A0F3D0;
        id v22 = v7;
        uint64_t v23 = *(void *)(a1 + 32);
        __int16 v24 = *(void **)(a1 + 40);
        id v26 = v22;
        uint64_t v27 = v23;
        id v28 = v24;
        [v21 determineEmptyHomesForSharedUsersWithCompletionHandler:v25];
      }
    }
    else
    {
      [*(id *)(a1 + 32) setHasHH2MigrationAlreadyRequested:1];
      if (([*(id *)(a1 + 40) moveDirectlyToHH2IfOnlyHH2SharedHomesExist] & 1) == 0) {
        [*(id *)(a1 + 32) setHasHH2MigrationAlreadyRequested:0];
      }
    }
  }
}

void __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke_145(id *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [a1[4] count];
  if (v4 == [v3 count])
  {
    id v5 = [a1[6] homes];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke_146;
    v19[3] = &unk_1E6A161A0;
    v19[4] = a1[5];
    id v20 = v3;
    char v6 = objc_msgSend(v5, "na_allObjectsPassTest:", v19);

    if (v6)
    {
      [a1[5] setHasHH2MigrationAlreadyRequested:1];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke_147;
      v18[3] = &unk_1E6A197F0;
      id v7 = a1[6];
      v18[4] = a1[5];
      [v7 autoMigrateToHH2WithCompletionHandler:v18];
    }
    else
    {
      id v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = a1[5];
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        id v22 = v17;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Not All the homes are ready for HH2 yet. Not auto migrating shared user to HH2", buf, 0xCu);
      }
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = a1[5];
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = HMFGetLogIdentifier();
      id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1[4], "count"));
      __int16 v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
      *(_DWORD *)long long buf = 138543874;
      id v22 = v11;
      __int16 v23 = 2112;
      __int16 v24 = v12;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Actual owned homes and empty home map do not agree. Not moving shared user to HH2: [%@ / %@]", buf, 0x20u);
    }
  }
}

uint64_t __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke_146(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  char v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = *(void **)(a1 + 40);
    id v9 = [v3 uuid];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];
    [v10 BOOLValue];
    int v11 = HMFBooleanToString();
    [v3 isUpdatedToHH2];
    id v12 = HMFBooleanToString();
    int v18 = 138544130;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v3;
    __int16 v22 = 2112;
    __int16 v23 = v11;
    __int16 v24 = 2112;
    __int16 v25 = v12;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@%@ / is owned home empty: %@ / is shared user updated to HH2: %@", (uint8_t *)&v18, 0x2Au);
  }
  if ([v3 isOwnerUser])
  {
    __int16 v13 = *(void **)(a1 + 40);
    id v14 = [v3 uuid];
    id v15 = [v13 objectForKeyedSubscript:v14];
    uint64_t v16 = [v15 BOOLValue];
  }
  else
  {
    uint64_t v16 = [v3 isUpdatedToHH2];
  }

  return v16;
}

void __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke_147(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    char v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@failed to start auto migration to HH2 with an error: %@", (uint8_t *)&v8, 0x16u);
    }
    [*(id *)(a1 + 32) setHasHH2MigrationAlreadyRequested:0];
  }
}

uint64_t __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke_141(uint64_t a1, void *a2)
{
  return [a2 isOwnerUser];
}

- (void)moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes:(BOOL)a3
{
  if (_os_feature_enabled_impl())
  {
    id v5 = [(HMDMessageFilter *)self workQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke;
    v6[3] = &unk_1E6A19B58;
    v6[4] = self;
    BOOL v7 = a3;
    dispatch_async(v5, v6);
  }
}

uint64_t __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    char v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "totalHomes"));
    [*(id *)(a1 + 32) hasHH2MigrationAlreadyRequested];
    BOOL v7 = HMFBooleanToString();
    *(_DWORD *)long long buf = 138543874;
    __int16 v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@[Shared User] : Going to check whether there are homes in the account or not: [homes = %@] [HH2 migration requested: %@]", buf, 0x20u);
  }
  uint64_t result = [*(id *)(a1 + 32) totalHomes];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) _verifyAccountStatusForMigration];
    if (result)
    {
      id v9 = *(void **)(a1 + 32);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke_139;
      v10[3] = &unk_1E6A0DA28;
      v10[4] = v9;
      char v11 = *(unsigned char *)(a1 + 40);
      return [v9 totalHomesInCloudZones:v10];
    }
  }
  return result;
}

void __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke_139(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v10 = v3;
    uint64_t v11 = v4;
    BOOL v7 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke_2;
    block[3] = &unk_1E6A0E838;
    void block[4] = *(void *)(a1 + 32);
    void block[5] = a2;
    char v9 = *(unsigned char *)(a1 + 40);
    dispatch_async(v7, block);
  }
}

void __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) totalHomes] != *(void *)(a1 + 40))
  {
    uint64_t v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      __int16 v20 = v12;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@[Shared User] : There are still homes in the cloud which are not yet downloaded. : [HomesInCloud : %@]", buf, 0x16u);
    }
    goto LABEL_11;
  }
  BOOL v2 = +[HMDRemoteLoginUtilities isTwoFactorAuthenticationEnabledForAccount];
  uint64_t v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (!v2)
  {
    if (v6)
    {
      __int16 v13 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v18 = v13;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@[Empty Account] : HSA is not enabled for this account. Cannot move this account to HH2", buf, 0xCu);
    }
LABEL_11:

    return;
  }
  if (v6)
  {
    BOOL v7 = HMFGetLogIdentifier();
    int v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "totalHomes"));
    char v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    *(_DWORD *)long long buf = 138543874;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    __int16 v20 = v8;
    __int16 v21 = 2112;
    __int16 v22 = v9;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Moving shared user to HH2 : [total Homes : %@], [HomesInCloud : %@]", buf, 0x20u);
  }
  uint64_t v10 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    [v10 _detectAndMigrateSharedUserWithEmptyOwnedHomes];
  }
  else
  {
    [v10 setHasHH2MigrationAlreadyRequested:1];
    __int16 v14 = [*(id *)(a1 + 32) homeManager];
    id v15 = [v14 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke_140;
    block[3] = &unk_1E6A19B30;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v15, block);
  }
}

void __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke_140(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) homeManager];
  char v3 = [v2 moveDirectlyToHH2IfOnlyHH2SharedHomesExist];

  if ((v3 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 setHasHH2MigrationAlreadyRequested:0];
  }
}

void __65__HMDCloudDataSyncStateFilter__moveDirectlyToHH2IfAccountIsEmpty__block_invoke_134(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    if (a2)
    {
      BOOL v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = *(id *)(a1 + 32);
      int v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        char v9 = HMFGetLogIdentifier();
        uint64_t v10 = [NSNumber numberWithUnsignedInteger:a2];
        *(_DWORD *)long long buf = 138543618;
        __int16 v16 = v9;
        __int16 v17 = 2112;
        uint64_t v18 = v10;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@[Empty Account] : There are still homes in the cloud which are not yet downloaded. : [HomesInCloud : %@]", buf, 0x16u);
      }
LABEL_9:

      goto LABEL_10;
    }
    if (!+[HMDRemoteLoginUtilities isTwoFactorAuthenticationEnabledForAccount])
    {
      BOOL v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = *(id *)(a1 + 32);
      int v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        __int16 v16 = v13;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@[Empty Account] : HSA is not enabled for this account. Cannot move this account to HH2", buf, 0xCu);
      }
      goto LABEL_9;
    }
    [*(id *)(a1 + 32) setHasHH2MigrationAlreadyRequested:1];
    uint64_t v11 = [*(id *)(a1 + 32) homeManager];
    uint64_t v12 = [v11 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__HMDCloudDataSyncStateFilter__moveDirectlyToHH2IfAccountIsEmpty__block_invoke_136;
    block[3] = &unk_1E6A19B30;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v12, block);
  }
LABEL_10:
}

void __65__HMDCloudDataSyncStateFilter__moveDirectlyToHH2IfAccountIsEmpty__block_invoke_136(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [*(id *)(a1 + 32) homeManager];
  char v3 = [v2 moveDirectlyToHH2];

  if ((v3 & 1) == 0)
  {
    id v4 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) setHasHH2MigrationAlreadyRequested:0]);
    id v5 = *(id *)(a1 + 32);
    BOOL v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      char v9 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to create HH2 sentinel zone hence empty account cannot be moved to HH2 for now.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_evaluateMoveToHH2
{
  [(HMDCloudDataSyncStateFilter *)self _moveDirectlyToHH2IfAccountIsEmpty];
  [(HMDCloudDataSyncStateFilter *)self moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes:1];
}

- (void)evaluateMoveToHH2
{
  char v3 = [(HMDMessageFilter *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HMDCloudDataSyncStateFilter_evaluateMoveToHH2__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __48__HMDCloudDataSyncStateFilter_evaluateMoveToHH2__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateMoveToHH2];
}

- (void)_postNotificationForDataSyncInProgress:(BOOL)a3 dataSyncState:(unint64_t)a4 forcePost:(BOOL)a5
{
  BOOL v7 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  BOOL v9 = [(HMDCloudDataSyncStateFilter *)self _cloudSyncinProgressCheck:0 supressPopup:1 sendCanceledError:0 dataSyncState:&v17];
  if (a5 || v9 != v7 || v17 != a4)
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090](v9);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Posting notification kCloudDataSyncInProgressUpdatedNotification", buf, 0xCu);
    }
    __int16 v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"kCloudDataSyncInProgressUpdatedNotification" object:self];

    __int16 v14 = [(HMDCloudDataSyncStateFilter *)self homeManager];
    id v15 = [v14 metricsManager];
    __int16 v16 = [v15 deviceStateManager];
    [v16 updateWithDataSyncState:v17];
  }
  [(HMDCloudDataSyncStateFilter *)self _evaluateMoveToHH2];
}

- (void)handleKeychainSyncStateChangedNotification:(id)a3
{
  id v4 = [(HMDMessageFilter *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HMDCloudDataSyncStateFilter_handleKeychainSyncStateChangedNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __74__HMDCloudDataSyncStateFilter_handleKeychainSyncStateChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) _cloudSyncinProgressCheck:0 supressPopup:1 sendCanceledError:0 dataSyncState:&v10];
  char v3 = *(void **)(a1 + 32);
  id v4 = +[HMDAppleAccountSettings sharedSettings];
  objc_msgSend(v3, "_updateKeychainSyncEnabled:", objc_msgSend(v4, "isKeychainSyncEnabled"));

  id v5 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) _postNotificationForDataSyncInProgress:v2 dataSyncState:v10 forcePost:0]);
  BOOL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = HMFGetLogIdentifier();
    int v8 = [*(id *)(a1 + 32) keychainSyncEnabled];
    BOOL v9 = @"disabled";
    if (v8) {
      BOOL v9 = @"enabled";
    }
    *(_DWORD *)long long buf = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    __int16 v14 = v9;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification about keychain sync change, keychain is %@", buf, 0x16u);
  }
}

- (void)_updateKeychainSyncEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(HMDCloudDataSyncStateFilter *)self keychainSyncEnabled] == a3) {
    return;
  }
  uint64_t v5 = [(HMDCloudDataSyncStateFilter *)self setKeychainSyncEnabled:v3];
  if (!self->_decryptionFailed)
  {
    if (!v3) {
      return;
    }
    goto LABEL_8;
  }
  BOOL v6 = (void *)MEMORY[0x1D9452090](v5);
  BOOL v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v8)
    {
      BOOL v9 = HMFGetLogIdentifier();
      int v15 = 138543362;
      __int16 v16 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Keychain has been enabled but decryption had failed earlier, starting data reset timers", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v5 = [(HMDCloudDataSyncStateFilter *)self _startDataConfigResetTimers];
LABEL_8:
    uint64_t v10 = (void *)MEMORY[0x1D9452090](v5);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v15 = 138543362;
      __int16 v16 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Keychain just got enabled, requesting an upload if necessary", (uint8_t *)&v15, 0xCu);
    }
    __int16 v13 = [(HMDCloudDataSyncStateFilter *)self homeManager];
    [v13 determineLocalChangesAndSchedulePush];

    return;
  }
  if (v8)
  {
    __int16 v14 = HMFGetLogIdentifier();
    int v15 = 138543362;
    __int16 v16 = v14;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Decryption had failed earlier but keychain is not enabled, stopping data reset timers", (uint8_t *)&v15, 0xCu);
  }
  [(HMDCloudDataSyncStateFilter *)self _stopDataConfigResetTimers];
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(HMDCloudDataSyncStateFilter *)self msgDispatcher];
  [v4 deregisterReceiver:self];

  v5.receiver = self;
  v5.super_class = (Class)HMDCloudDataSyncStateFilter;
  [(HMDCloudDataSyncStateFilter *)&v5 dealloc];
}

- (HMDCloudDataSyncStateFilter)initWithName:(id)a3 homeManager:(id)a4 messageDispatcher:(id)a5 serverTokenAvailable:(BOOL)a6 homeDataHasBeenDecrypted:(BOOL)a7 homeManagerServerTokenAvailable:(BOOL)a8 localDataDecryptionFailed:(BOOL)a9 totalHomes:(int64_t)a10 currentAccount:(id)a11
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a11;
  v38.receiver = self;
  v38.super_class = (Class)HMDCloudDataSyncStateFilter;
  __int16 v21 = [(HMDMessageFilter *)&v38 initWithName:v17];
  if (v21)
  {
    BOOL v37 = a8;
    int64_t v22 = a10;
    uint64_t v23 = HMFGetOSLogHandle();
    logger = v21->_logger;
    v21->_logger = (OS_os_log *)v23;

    v21->_hh1FirstCloudSyncComplete = 0;
    objc_storeStrong((id *)&v21->_msgDispatcher, a5);
    __int16 v25 = +[HMDAppleAccountSettings sharedSettings];
    v21->_BOOL keychainSyncEnabled = [v25 isKeychainSyncEnabled];

    uint64_t v26 = (void *)MEMORY[0x1D9452090]();
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v28 = HMFGetLogIdentifier();
      BOOL keychainSyncEnabled = v21->_keychainSyncEnabled;
      *(_DWORD *)long long buf = 138543618;
      v40 = v28;
      __int16 v41 = 1024;
      BOOL v42 = keychainSyncEnabled;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Key chain sync enabled is set to: %d", buf, 0x12u);

      int64_t v22 = a10;
    }

    popupTimer = v21->_popupTimer;
    v21->_popupTimer = 0;

    v21->_keychainSyncRequiredPopShown = 0;
    v21->_iCloudAccountActive = 0;
    v21->_cloudDataSyncCompleted = (v37 | ~a7) & a6;
    v21->_serverTokenAvailable = a6;
    uint64_t v31 = [MEMORY[0x1E4F29128] UUID];
    uuid = v21->_uuid;
    v21->_uuid = (NSUUID *)v31;

    v21->_totalHomes = v22;
    objc_storeWeak((id *)&v21->_homeManager, v18);
    v21->_remainingDataSyncPeriod = 0.0;
    __int16 v33 = +[HMDDeviceCapabilities deviceCapabilities];
    v21->_BOOL decryptionFailed = ([v33 supportsStandaloneMode] | a7) ^ 1;

    v21->_localDataDecryptionFailed = a9;
    [(HMDCloudDataSyncStateFilter *)v21 _updateCurrentAccount:v20];
    id v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:v21 selector:sel_handleKeychainSyncStateChangedNotification_ name:@"HMDAppleAccountSettingsKeychainSyncStateUpdatedNotificationKey" object:0];

    uint64_t v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v35 addObserver:v21 selector:sel__handleCloudZoneReadyNotification_ name:@"HMDCloudZoneReadyNotification" object:0];
  }
  return v21;
}

void __48__HMDCloudDataSyncStateFilter_isAllowedMessage___block_invoke()
{
  v18[76] = *MEMORY[0x1E4F143B8];
  v18[0] = @"kPrimaryAccountWasModifiedRequestKey";
  v18[1] = @"kPrimaryAccountWasDeletedRequestKey";
  v18[2] = @"kResetConfigRequestKey";
  v18[3] = @"kQueryHomeKitUsageStateRequestKey";
  v18[4] = @"kSearchForNewAccessoriesRequestKey";
  void v18[5] = @"kFetchNewAccessoriesRequestKey";
  uint64_t v0 = *MEMORY[0x1E4F2D508];
  v18[6] = *MEMORY[0x1E4F2D418];
  v18[7] = v0;
  uint64_t v1 = *MEMORY[0x1E4F2D518];
  v18[8] = *MEMORY[0x1E4F2D560];
  v18[9] = v1;
  v18[10] = @"kRetrieveHomeLocationRequestKey";
  v18[11] = @"kRetrieveLocationEventRequestKey";
  uint64_t v2 = *MEMORY[0x1E4F2D070];
  v18[12] = *MEMORY[0x1E4F2D068];
  v18[13] = v2;
  uint64_t v3 = *MEMORY[0x1E4F2D0F0];
  v18[14] = @"HMHomeAllowUserManagementMessage";
  v18[15] = v3;
  uint64_t v4 = *MEMORY[0x1E4F2D0C8];
  v18[16] = *MEMORY[0x1E4F2D0D0];
  v18[17] = v4;
  uint64_t v5 = *MEMORY[0x1E4F2D540];
  v18[18] = *MEMORY[0x1E4F2D0F8];
  v18[19] = v5;
  uint64_t v6 = *MEMORY[0x1E4F2E0F0];
  v18[20] = *MEMORY[0x1E4F2E0D0];
  v18[21] = v6;
  uint64_t v7 = *MEMORY[0x1E4F2E0C0];
  v18[22] = *MEMORY[0x1E4F2E0E0];
  v18[23] = v7;
  uint64_t v8 = *MEMORY[0x1E4F2E298];
  v18[24] = *MEMORY[0x1E4F2E0D8];
  v18[25] = v8;
  v18[26] = @"kSecureServerIDSMessageRequestKey";
  v18[27] = @"kSecureClientIDSMessageRequestKey";
  v18[28] = @"kSecureSessionInvalidatedNotificationKey";
  v18[29] = @"kHomeDataSyncRequestKey";
  v18[30] = @"kHomeDataFragmentedSyncRequestKey";
  v18[31] = @"kAreYouAtHomeRequestKey";
  v18[32] = @"kDoYouSeeUnpairedAccessoriesKey";
  v18[33] = @"kAddRemoteAccessRequestKey";
  v18[34] = @"kUserRemovedRequestKey";
  v18[35] = @"kElectDeviceForIDSSessionKey";
  v18[36] = @"kUserResetHomeConfigRequestKey";
  v18[37] = @"kMetadataDataSyncRequestKey";
  v18[38] = @"kModifyCharacterisiticNotificationsRequestKey";
  v18[39] = @"kCharacterisiticsChangedInternalNotificationKey";
  v18[40] = @"kDismissBulletinInternalRequestKey";
  v18[41] = @"kDismissDialogInternalRequestKey";
  v18[42] = @"kRequestForCompanionKeysSyncInternalRequestKey";
  v18[43] = @"kCompanionKeysSyncInternalRequestKey";
  v18[44] = @"kResidentElectionParametersInternalRequestKey";
  v18[45] = @"kRetrieveVendorIdentifierInternalKey";
  uint64_t v9 = *MEMORY[0x1E4F2D520];
  v18[46] = @"kHomeConfigInternalRequestKey";
  v18[47] = v9;
  v18[48] = *MEMORY[0x1E4F2D5B0];
  v18[49] = @"kAccessHomeInviteRequestKey";
  v18[50] = @"kUpdateHomeInvitationStateInternalRequestKey";
  v18[51] = @"kUpdateInvitationStateRequestKey";
  v18[52] = @"kPingInternalRequestKey";
  v18[53] = @"kStartRemoteStreamRequestKey";
  v18[54] = @"kReconfigureRemoteStreamRequestKey";
  v18[55] = @"kNegotitateRemoteStreamRequestKey";
  v18[56] = @"kStopRemoteStreamRequestKey";
  v18[57] = @"kTakeSnapshotRemoteRequestKey";
  v18[58] = @"kTakeSnapshotRemoteReceivedKey";
  v18[59] = @"kEnableAccessoryReachabilityNotificationRequestKey";
  v18[60] = @"kDisableAccessoryReachabilityNotificationRequestKey";
  v18[61] = @"kRemoteReachabilityChangedNotificationKey";
  uint64_t v10 = *MEMORY[0x1E4F2D3C0];
  v18[62] = @"kAddHomeInvitesInternalRequestKey";
  v18[63] = v10;
  v18[64] = @"kDeviceMeshUpdateRequestKey";
  v18[65] = @"kDeviceMeshUpdateKey";
  v18[66] = @"kKeyTransferAgentKey";
  v18[67] = @"kSystemLogCaptureRequestKey";
  v18[68] = @"kLocationEventOccuredRequestKey";
  v18[69] = @"kRemoteUpdateUserPresenceNotificationKey";
  v18[70] = @"kEventTriggerUserPermissionRequestKey";
  v18[71] = @"kEventTriggerUserPermissionRemoveDialogKey";
  v18[72] = @"kEventTriggerUserPermissionResponseKey";
  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  v18[73] = *MEMORY[0x1E4F2E038];
  v18[74] = *MEMORY[0x1E4F2E048];
  v18[75] = @"HMDHouseholdMetricsHomeDataLogEventRequest";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:76];
  __int16 v13 = [v11 setWithArray:v12];
  __int16 v14 = (void *)[v13 mutableCopy];

  int v15 = +[HMDRemoteLoginHandler remoteMessages];
  [v14 addObjectsFromArray:v15];

  uint64_t v16 = [v14 copy];
  id v17 = (void *)isAllowedMessage___allowedMessages;
  isAllowedMessage___allowedMessages = v16;
}

uint64_t __42__HMDCloudDataSyncStateFilter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v109;
  logCategory__hmf_once_v109 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end