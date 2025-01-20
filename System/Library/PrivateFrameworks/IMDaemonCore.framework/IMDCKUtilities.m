@interface IMDCKUtilities
+ (id)_idsAccountController;
+ (id)calculateAliasesForDefaults;
+ (id)im_AKSecurityLevelKey;
+ (id)logHandle;
+ (id)readAliasesFromDefaults;
+ (id)restoreFailuresDirectory;
+ (id)sharedInstance;
+ (void)addConditionChecks:(unint64_t)a3 toCriteria:(id)a4;
+ (void)calculateAndSaveAliasesToDefaults;
- (BOOL)PCSKeyRollPending;
- (BOOL)_accountNeedsRepairOverride;
- (BOOL)_allowDestructiveMOCFeaturesBasedOnDSID;
- (BOOL)_checkEligibilityWithAccountInfo:(id)a3;
- (BOOL)_checkIfEnabledByServerBagOrDefault:(id)a3;
- (BOOL)_deviceActive;
- (BOOL)_isInExitState;
- (BOOL)_isLogDumpAllowed;
- (BOOL)_isSyncingPausedOverride;
- (BOOL)_mocFeatureEnabled;
- (BOOL)_serverAllowsCacheDelete;
- (BOOL)_serverAllowsRemovalFromBackUp;
- (BOOL)_serverAllowsSync;
- (BOOL)_shouldDisplayPopUpForResettingKeepMessages;
- (BOOL)_shouldiCloudSwitchBeEnabled;
- (BOOL)accountIsVerifiedForMOCAndSafeForCacheDelete;
- (BOOL)cacheDeleteEnabled;
- (BOOL)cloudKitSyncDownloadAssetsOnly;
- (BOOL)cloudKitSyncingEnabled;
- (BOOL)deviceConditionsAllowPeriodicSync;
- (BOOL)deviceIsPhoneOrWatch;
- (BOOL)didKeyRollPendingCheck;
- (BOOL)enableAttachmentMetricCollection;
- (BOOL)iCloudAccountMatchesiMessageAccount;
- (BOOL)isCKPartialError:(id)a3;
- (BOOL)isDeviceCharging;
- (BOOL)isDeviceOnWifi;
- (BOOL)isInCloudKitDemoMode;
- (BOOL)isLocalCachedSaltPresent;
- (BOOL)isSyncingPaused;
- (BOOL)logDumpIsExpected;
- (BOOL)logDumpIsNecessaryAfterSync;
- (BOOL)readServerBagBoolForKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)removeFromBackUpAllowed;
- (BOOL)serverAllowsAnalyticDetailsSubmission;
- (BOOL)serverAllowsAnalyticSubmission;
- (BOOL)serverAllowsMetricSubmission;
- (BOOL)shouldAttemptMiCOnByDefault;
- (BOOL)shouldCollectDailyLogDump;
- (BOOL)shouldCollectDailyLogDumpForRestoreFailures;
- (BOOL)shouldForceArchivedMessagesSync;
- (BOOL)shouldKickOffWriteForSyncType:(int64_t)a3;
- (BOOL)shouldLogDumpOnCloudKitError;
- (BOOL)shouldPresentTTROnCloudKitError;
- (BOOL)shouldRepairAccountWithAccountStatus:(int64_t)a3 securityLevel:(unint64_t)a4;
- (BOOL)shouldReportToAnalytics;
- (BOOL)shouldReportToRTC;
- (BOOL)shouldUseDevContainer;
- (BOOL)shouldUseDevNickNameContainer;
- (BOOL)signedIntoiCloudAccount;
- (BOOL)signedIntoiCloudAndiMessageAndiCloudAccountMatchesiMessageAccount;
- (BOOL)signedIntoiMessageAccount;
- (BOOL)useDeprecatedApi;
- (FTDeviceSupport)deviceSupport;
- (IDSServerBag)serverBag;
- (IMDCKSyncState)syncState;
- (IMDCKUtilities)init;
- (IMDCKUtilities)initWithServerBag:(id)a3 lockDownmanager:(id)a4 deviceSupport:(id)a5 imDefaults:(id)a6;
- (IMDSyncTelemetryReporter)telemetryReporter;
- (IMDefaults)imDefaults;
- (IMLockdownManager)lockdownManager;
- (double)_iCloudStorageSizeFudgeFactorBagValue;
- (id)_accountManager;
- (id)_accountStore;
- (id)_authenticationController;
- (id)_createAccountError:(id)a3;
- (id)_getKeepMessagesValue;
- (id)_personIdFromAccount:(id)a3;
- (id)_primaryAccountCountryCode;
- (id)_primaryiCloudAccount;
- (id)_primaryiCloudAccountAltDSID;
- (id)_truthContainer;
- (id)_truthDatabase;
- (id)backupController;
- (id)deviceActiveString;
- (id)deviceConditions;
- (id)dsid;
- (id)exitManager;
- (id)extractServerRecordFromCKServerErrorRecordChanged:(id)a3;
- (id)finalSyncStateFor:(int64_t)a3;
- (id)findRootCauses:(id)a3;
- (id)internalQueue;
- (id)lastDeviceBackUpDate;
- (id)logCollectorAddress;
- (id)logHandle;
- (id)newfilteredArrayRemovingCKRecordDupes:(id)a3;
- (id)newfilteredArrayRemovingCKRecordIDDupes:(id)a3;
- (id)recordNameForMessageWithGUID:(id)a3 usingSalt:(id)a4;
- (id)simplifiedError:(id)a3;
- (id)syncFailureMetricString:(id)a3 isRecoverable:(BOOL)a4 error:(id)a5;
- (int64_t)_mininimumServerBagClientValue;
- (int64_t)overrideNumberOfChatsToFetch;
- (int64_t)overrideNumberOfChatsToWrite;
- (unint64_t)_primaryiCloudAccountSecurityLevel;
- (unint64_t)currentStorageOnDevice;
- (unint64_t)messageDatabaseSize;
- (unsigned)PCSReportManateeStatus;
- (void)PCSKeyRollPendingAsync:(id)a3 timeout:(double)a4;
- (void)PCSReportManateeStatusAsync:(id)a3 timeout:(double)a4;
- (void)_askToTapToRadarWithString:(id)a3 internalOnly:(BOOL)a4;
- (void)_didAttemptToUpdateCloudKitEnablementTo:(BOOL)a3 result:(BOOL)a4;
- (void)_fetchPrimaryAccountWithCompletion:(id)a3;
- (void)_resetKeepMessagesSettingandBroadcastToAllDevices;
- (void)_setEligibleToToggleMiCSwitch:(BOOL)a3;
- (void)_setiCloudSettingsSwitchEnabled:(BOOL)a3;
- (void)_showCKLogNotificationWithCompletion:(id)a3;
- (void)broadcastCloudKitState;
- (void)broadcastCloudKitStateAfterClearingErrors;
- (void)broadcastCloudKitStateAfterFetchingAccountStatus;
- (void)checkiCloudQuota:(id)a3;
- (void)clearLocalCloudKitSyncState:(unint64_t)a3;
- (void)disableAllDevicesWithCompletion:(id)a3;
- (void)downgradingFromHSA2AndDisablingMOC;
- (void)eligibleForTruthZoneWithCompletion:(id)a3;
- (void)estimateQuotaAvailability:(id)a3;
- (void)evalToggleiCloudSettingsSwitch;
- (void)fetchAccountStatusAndUpdateMiCSwitchEligibility;
- (void)fetchAccountStatusAndUpdateMiCSwitchEligibilityIfNeededOnImagentLaunch;
- (void)fetchCloudKitAccountStatusAndUpdateEligibilityAndNeedsRepairStatusWithCompletion:(id)a3;
- (void)fetchCloudKitAccountStatusWithCompletion:(id)a3;
- (void)fetchiCloudAccountPersonID:(id)a3;
- (void)isFirstSyncWithActivity:(id)a3 completion:(id)a4;
- (void)keyRollPendingStateDidChange;
- (void)logCloudKitSyncToPowerLogForSyncType:(int64_t)a3 isCoreDuetSync:(BOOL)a4 didCompleteChatSync:(BOOL)a5 didSucceedSyncingChats:(BOOL)a6 didCompleteMessageSync:(BOOL)a7 didSucceedSyncingMessages:(BOOL)a8 didCompleteAttachmentSync:(BOOL)a9 didSucceedSyncingAttachments:(BOOL)a10 didCompleteRecoverableMessageSync:(BOOL)a11 didSucceedSyncingRecoverableMessageSync:(BOOL)a12 syncAttemptCount:(unint64_t)a13;
- (void)logCloudKitSyncToPowerLogForSyncType:(int64_t)a3 isCoreDuetSync:(BOOL)a4 didStartSync:(BOOL)a5 didFinishSync:(BOOL)a6 didSucceedSyncing:(BOOL)a7;
- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4 reason:(id)a5;
- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4 reason:(id)a5 isInitialSync:(BOOL)a6 requirePreviousPrompt:(BOOL)a7 willSendBlock:(id)a8;
- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4 reason:(id)a5 requirePreviousPrompt:(BOOL)a6 willSendBlock:(id)a7;
- (void)logToPowerLogForLogDumpGUID:(id)a3 logDumpCompleted:(BOOL)a4 logDumpSucceeded:(BOOL)a5 logDumpSendingCompleted:(BOOL)a6 logDumpSendingSucceeded:(BOOL)a7 reason:(id)a8;
- (void)postSyncStateToCloudKit:(id)a3;
- (void)postSyncStateToRTC:(id)a3 category:(int64_t)a4 reportDictionary:(id)a5;
- (void)primaryAccountHasiCloudBackupEnabledWithCompletion:(id)a3;
- (void)repairACAccountEnablementStatusIfNeeded;
- (void)reportCompletionForSyncType:(int64_t)a3 isCoreDuetSync:(BOOL)a4 onAttempt:(unint64_t)a5 wasSuccessful:(BOOL)a6 duration:(double)a7;
- (void)reportErrorForSyncType:(int64_t)a3 syncStep:(id)a4 response:(int64_t)a5 error:(id)a6;
- (void)reportMOCDebuggingErrorWithString:(id)a3 internalOnly:(BOOL)a4;
- (void)reportMOCDebuggingErrorWithString:(id)a3 internalOnly:(BOOL)a4 initialSync:(BOOL)a5;
- (void)reportMOCDebuggingErrorWithString:(id)a3 internalOnly:(BOOL)a4 initialSync:(BOOL)a5 sendToHandle:(id)a6;
- (void)reportMOCDebuggingErrorWithString:(id)a3 internalOnly:(BOOL)a4 initialSync:(BOOL)a5 sendToHandle:(id)a6 reasonString:(id)a7;
- (void)reportZoneCreation:(id)a3;
- (void)resetLastSyncDate;
- (void)setCloudKitEnabled:(BOOL)a3;
- (void)setCloudKitSyncingEnabled:(BOOL)a3;
- (void)setDeviceSupport:(id)a3;
- (void)setDidKeyRollPendingCheck:(BOOL)a3;
- (void)setImDefaults:(id)a3;
- (void)setLockdownManager:(id)a3;
- (void)setServerBag:(id)a3;
- (void)setTelemetryReporter:(id)a3;
- (void)setUseDeprecatedApi:(BOOL)a3;
- (void)syncStateWillUpdate:(id)a3;
@end

@implementation IMDCKUtilities

- (void)broadcastCloudKitStateAfterFetchingAccountStatus
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1D9688658;
  v2[3] = &unk_1E6B72C38;
  v2[4] = self;
  [(IMDCKUtilities *)self fetchCloudKitAccountStatusAndUpdateEligibilityAndNeedsRepairStatusWithCompletion:v2];
}

- (void)fetchCloudKitAccountStatusAndUpdateEligibilityAndNeedsRepairStatusWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(IMDCKUtilities *)self _primaryiCloudAccountSecurityLevel];
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (v5 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"AKAppleIDSecurityLevel(%ld)", v5);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E6B73078[v5];
      }
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Got local account security level %@", buf, 0xCu);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D9688DA0;
  aBlock[3] = &unk_1E6B72DE0;
  id v11 = v4;
  unint64_t v12 = v5;
  aBlock[4] = self;
  id v8 = v4;
  v9 = _Block_copy(aBlock);
  [(IMDCKUtilities *)self fetchCloudKitAccountStatusWithCompletion:v9];
}

- (void)fetchCloudKitAccountStatusWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"isEligibleForTruthZoneOverride", (CFStringRef)*MEMORY[0x1E4F6CF00], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    int v6 = AppBooleanValue;
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = @"YES";
        if (!v6) {
          id v8 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Overriding isEligibleForTruthZone: %@", buf, 0xCu);
      }
    }
    if (keyExistsAndHasValidFormat) {
      uint64_t v9 = 4;
    }
    else {
      uint64_t v9 = 3;
    }
    v4[2](v4, v9, 0);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D9682950;
    aBlock[3] = &unk_1E6B72D90;
    v17 = v4;
    v10 = _Block_copy(aBlock);
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Fetching cloud kit account info with cloudkit api", buf, 2u);
      }
    }
    unint64_t v12 = [(IMDCKUtilities *)self _truthContainer];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1D9682464;
    v14[3] = &unk_1E6B72DB8;
    v14[4] = self;
    id v15 = v10;
    id v13 = v10;
    [v12 accountInfoWithCompletionHandler:v14];
  }
}

- (id)_truthContainer
{
  v2 = +[IMDCKDatabaseManager sharedInstance];
  v3 = [v2 truthContainer];

  return v3;
}

- (unint64_t)_primaryiCloudAccountSecurityLevel
{
  v3 = [(IMDCKUtilities *)self _primaryiCloudAccountAltDSID];
  if ([v3 length])
  {
    id v4 = [(IMDCKUtilities *)self _accountManager];
    unint64_t v5 = [v4 authKitAccountWithAltDSID:v3];

    if (v5)
    {
      int v6 = [(IMDCKUtilities *)self _accountManager];
      unint64_t v7 = [v6 securityLevelForAccount:v5];
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)_primaryiCloudAccountAltDSID
{
  v3 = [(IMDCKUtilities *)self _primaryiCloudAccount];
  if (v3)
  {
    id v4 = [(IMDCKUtilities *)self _accountManager];
    unint64_t v5 = [v4 altDSIDForAccount:v3];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)_primaryiCloudAccount
{
  v2 = [(IMDCKUtilities *)self _accountStore];
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return v3;
}

- (id)_accountStore
{
  if (qword_1EBE2BAE8 != -1) {
    dispatch_once(&qword_1EBE2BAE8, &unk_1F3390520);
  }
  v2 = (void *)qword_1EBE2BAE0;

  return v2;
}

- (void)broadcastCloudKitState
{
  v3 = [(IMDCKUtilities *)self syncState];
  id v4 = [(IMDCKUtilities *)self logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1D98FDC84(v3);
  }

  [v3 broadcastSyncState];
}

- (void)syncStateWillUpdate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(v4, "setSyncingEnabled:", -[IMDCKUtilities cloudKitSyncingEnabled](self, "cloudKitSyncingEnabled"));
  objc_msgSend(v4, "setSyncingPaused:", -[IMDCKUtilities isSyncingPaused](self, "isSyncingPaused"));
  unint64_t v5 = [(IMDCKUtilities *)self backupController];
  objc_msgSend(v4, "setRemovedFromBackup:", objc_msgSend(v5, "iCloudBackupsDisabled"));

  BOOL v6 = [(IMDCKUtilities *)self cloudKitSyncingEnabled];
  if ([(IMDCKUtilities *)self didKeyRollPendingCheck] || !v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        BOOL v9 = [(IMDCKUtilities *)self didKeyRollPendingCheck];
        v10 = @"NO";
        if (v9) {
          id v11 = @"YES";
        }
        else {
          id v11 = @"NO";
        }
        if (v6) {
          v10 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v16 = v11;
        __int16 v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Not performing key roll check didKeyRollPendingCheck %@ cloudKitSyncingEnabled %@", buf, 0x16u);
      }
    }
  }
  else
  {
    [(IMDCKUtilities *)self setDidKeyRollPendingCheck:1];
    unint64_t v7 = +[IMDCKUtilities sharedInstance];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1D9699654;
    v13[3] = &unk_1E6B72C10;
    id v14 = v4;
    [v7 PCSKeyRollPendingAsync:v13 timeout:10.0];
  }
  unint64_t v12 = [(IMDCKUtilities *)self logHandle];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1D98FDBF8(v4);
  }
}

- (BOOL)cloudKitSyncingEnabled
{
  if (IMAllowMessagesIniCloud())
  {
    if ([(IMDCKUtilities *)self _serverAllowsSync])
    {
      if ((IMGetCachedDomainBoolForKey() & 1) == 0)
      {
        v3 = [(IMDCKUtilities *)self syncState];
        char v4 = [v3 isFeatureEnabled];

        return v4;
      }
    }
    else if ((IMGetDomainBoolForKey() & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        unint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)BOOL v9 = 0;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Putting user back into backup as Madrid server has turned off the feature", v9, 2u);
        }
      }
      id v8 = +[IMDCKBackupController sharedInstance];
      [v8 setICloudBackupsDisabled:0];

      IMSetDomainBoolForKey();
    }
  }
  else if (IMOSLoggingEnabled())
  {
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "**** cloudKitSyncingEnabled is turned off in this build", buf, 2u);
    }
  }
  return 0;
}

- (IMDCKSyncState)syncState
{
  syncState = self->_syncState;
  if (!syncState)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F6E7F8]);
    unint64_t v5 = (void *)[v4 initWithDomain:*MEMORY[0x1E4F6CF00]];
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F6E638]) initWithKeyValueStorage:v5];
    unint64_t v7 = [[IMDCKSyncState alloc] initWithKeyValueCollection:v6];
    id v8 = self->_syncState;
    self->_syncState = v7;

    [(IMDCKSyncState *)self->_syncState setDelegate:self];
    BOOL v9 = [(IMDCKUtilities *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1D98FDBB4(v9);
    }

    syncState = self->_syncState;
  }

  return syncState;
}

- (BOOL)_serverAllowsSync
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(IMDCKUtilities *)self _mininimumServerBagClientValue];
  if (v2 >= 1 && IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5[0] = 67109376;
      v5[1] = 0;
      __int16 v6 = 2048;
      uint64_t v7 = v2;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Madrid server bag does not allow us to sync. Our client version %d server client version %ld", (uint8_t *)v5, 0x12u);
    }
  }
  return v2 < 1;
}

- (int64_t)_mininimumServerBagClientValue
{
  uint64_t v2 = [(IMDCKUtilities *)self serverBag];
  v3 = [v2 objectForKey:@"ck-client-min-version"];

  int64_t v4 = [v3 integerValue];
  return v4;
}

- (IDSServerBag)serverBag
{
  serverBag = self->_serverBag;
  if (!serverBag)
  {
    int64_t v4 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
    unint64_t v5 = self->_serverBag;
    self->_serverBag = v4;

    serverBag = self->_serverBag;
  }

  return serverBag;
}

- (id)logHandle
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 logHandle];
}

+ (id)logHandle
{
  if (qword_1EBE2BA60 != -1) {
    dispatch_once(&qword_1EBE2BA60, &unk_1F3390480);
  }
  uint64_t v2 = (void *)qword_1EBE2BA50;

  return v2;
}

- (BOOL)shouldRepairAccountWithAccountStatus:(int64_t)a3 securityLevel:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(IMDCKUtilities *)self _accountNeedsRepairOverride])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "account repair overridden", (uint8_t *)&v18, 2u);
      }
    }
    LOBYTE(v8) = 1;
  }
  else
  {
    BOOL v9 = [(IMDCKUtilities *)self syncState];
    char v10 = [v9 isSyncingEnabled];

    if (v10)
    {
      BOOL v8 = a3 == 3 && a4 == 4 || a3 == 2;
      if (IMOSLoggingEnabled())
      {
        id v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = @"NO";
          if (v8) {
            id v14 = @"YES";
          }
          if ((unint64_t)a3 > 4) {
            id v15 = 0;
          }
          else {
            id v15 = off_1E6B73050[a3];
          }
          int v18 = 138412546;
          uint64_t v19 = v14;
          __int16 v20 = 2112;
          uint64_t v21 = v15;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Account needs repair: %@ (account status: %@)", (uint8_t *)&v18, 0x16u);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "MiC is disabled, does not need repair", (uint8_t *)&v18, 2u);
        }
      }
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (BOOL)isSyncingPaused
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (![(IMDCKUtilities *)self _isSyncingPausedOverride])
  {
    unint64_t v5 = [(IMDCKUtilities *)self syncState];
    if ([v5 isSyncingEnabled])
    {
      __int16 v6 = [v5 lastSyncDate];

      if (v6)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v7 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            LOWORD(v15) = 0;
            _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "syncing not paused because we have a valid sync date", (uint8_t *)&v15, 2u);
          }
LABEL_16:
        }
      }
      else
      {
        if ([v5 isSyncing])
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_17;
          }
          uint64_t v7 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            LOWORD(v15) = 0;
            _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "syncing not paused because we are syncing", (uint8_t *)&v15, 2u);
          }
          goto LABEL_16;
        }
        BOOL v9 = [(IMDCKUtilities *)self isDeviceCharging];
        BOOL v10 = [(IMDCKUtilities *)self isDeviceOnWifi];
        int v11 = IMOSLoggingEnabled();
        if (!v9 || !v10)
        {
          if (v11)
          {
            unint64_t v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              id v13 = @"NO";
              if (v10) {
                id v14 = @"YES";
              }
              else {
                id v14 = @"NO";
              }
              if (v9) {
                id v13 = @"YES";
              }
              int v15 = 138412546;
              v16 = v14;
              __int16 v17 = 2112;
              int v18 = v13;
              _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "syncing paused: connected to Wifi: %@, device is charging: %@", (uint8_t *)&v15, 0x16u);
            }
          }
          BOOL v4 = 1;
          goto LABEL_18;
        }
        if (v11)
        {
          uint64_t v7 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            LOWORD(v15) = 0;
            _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "syncing not paused because we are connected wifi and device is charging", (uint8_t *)&v15, 2u);
          }
          goto LABEL_16;
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "syncing not paused because syncing not enabled", (uint8_t *)&v15, 2u);
      }
      goto LABEL_16;
    }
LABEL_17:
    BOOL v4 = 0;
LABEL_18:

    return v4;
  }
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "syncing paused because syncing override is YES", (uint8_t *)&v15, 2u);
    }
  }
  return 1;
}

- (BOOL)didKeyRollPendingCheck
{
  return self->_didKeyRollPendingCheck;
}

- (id)backupController
{
  return +[IMDCKBackupController sharedInstance];
}

- (void)_setEligibleToToggleMiCSwitch:(BOOL)a3
{
}

- (BOOL)_isSyncingPausedOverride
{
  if (qword_1EBE2BAF0 != -1) {
    dispatch_once(&qword_1EBE2BAF0, &unk_1F3390560);
  }
  return byte_1EA8CA368;
}

- (BOOL)_accountNeedsRepairOverride
{
  if (qword_1EBE2BAD8 != -1) {
    dispatch_once(&qword_1EBE2BAD8, &unk_1F33904E0);
  }
  return byte_1EA8CA350;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D96994A8;
  block[3] = &unk_1E6B72BE8;
  block[4] = a1;
  if (qword_1EBE2BA70 != -1) {
    dispatch_once(&qword_1EBE2BA70, block);
  }
  uint64_t v2 = (void *)qword_1EBE2B928;

  return v2;
}

- (IMLockdownManager)lockdownManager
{
  lockdownManager = self->_lockdownManager;
  if (!lockdownManager)
  {
    BOOL v4 = [MEMORY[0x1E4F6C360] sharedInstance];
    unint64_t v5 = self->_lockdownManager;
    self->_lockdownManager = v4;

    lockdownManager = self->_lockdownManager;
  }

  return lockdownManager;
}

- (FTDeviceSupport)deviceSupport
{
  deviceSupport = self->_deviceSupport;
  if (!deviceSupport)
  {
    BOOL v4 = [MEMORY[0x1E4F61740] sharedInstance];
    unint64_t v5 = self->_deviceSupport;
    self->_deviceSupport = v4;

    deviceSupport = self->_deviceSupport;
  }

  return deviceSupport;
}

- (id)exitManager
{
  return +[IMDCKExitManager sharedInstance];
}

- (id)_truthDatabase
{
  uint64_t v2 = +[IMDCKDatabaseManager sharedInstance];
  v3 = [v2 truthDatabase];

  return v3;
}

- (IMDefaults)imDefaults
{
  imDefaults = self->_imDefaults;
  if (!imDefaults)
  {
    BOOL v4 = (IMDefaults *)objc_alloc_init(MEMORY[0x1E4F6E720]);
    unint64_t v5 = self->_imDefaults;
    self->_imDefaults = v4;

    imDefaults = self->_imDefaults;
  }

  return imDefaults;
}

- (IMDSyncTelemetryReporter)telemetryReporter
{
  telemetryReporter = self->_telemetryReporter;
  if (!telemetryReporter)
  {
    BOOL v4 = (IMDSyncTelemetryReporter *)objc_alloc_init(MEMORY[0x1E4F77E70]);
    unint64_t v5 = self->_telemetryReporter;
    self->_telemetryReporter = v4;

    telemetryReporter = self->_telemetryReporter;
  }

  return telemetryReporter;
}

- (IMDCKUtilities)initWithServerBag:(id)a3 lockDownmanager:(id)a4 deviceSupport:(id)a5 imDefaults:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)IMDCKUtilities;
  int v15 = [(IMDCKUtilities *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_serverBag, a3);
    objc_storeStrong((id *)&v16->_lockdownManager, a4);
    objc_storeStrong((id *)&v16->_deviceSupport, a5);
    objc_storeStrong((id *)&v16->_imDefaults, a6);
    id v17 = [(IMDCKUtilities *)v16 _authenticationController];
  }

  return v16;
}

- (IMDCKUtilities)init
{
  return (IMDCKUtilities *)MEMORY[0x1F4181798](self, sel_initWithServerBag_lockDownmanager_deviceSupport_imDefaults_);
}

+ (id)restoreFailuresDirectory
{
  uint64_t v2 = IMSafeTemporaryDirectory();
  v3 = [v2 URLByAppendingPathComponent:@"CKMessagesLogDump"];
  BOOL v4 = [v3 path];

  return v4;
}

- (void)broadcastCloudKitStateAfterClearingErrors
{
  id v3 = [(IMDCKUtilities *)self syncState];
  [v3 clearSyncErrors];
  [(IMDCKUtilities *)self broadcastCloudKitStateAfterFetchingAccountStatus];
}

- (void)keyRollPendingStateDidChange
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "updating key roll pending state", v4, 2u);
    }
  }
  [(IMDCKUtilities *)self setDidKeyRollPendingCheck:0];
  [(IMDCKUtilities *)self broadcastCloudKitStateAfterFetchingAccountStatus];
}

- (BOOL)shouldUseDevContainer
{
  int v3 = IMGetCachedDomainBoolForKey();
  if (v3)
  {
    BOOL v4 = [(IMDCKUtilities *)self lockdownManager];
    char v5 = [v4 isInternalInstall];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)shouldUseDevNickNameContainer
{
  int v3 = IMGetCachedDomainBoolForKey();
  if (v3)
  {
    BOOL v4 = [(IMDCKUtilities *)self lockdownManager];
    char v5 = [v4 isInternalInstall];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)shouldForceArchivedMessagesSync
{
  if (!IMIsRunningInAutomation() || !IMGetCachedDomainBoolForKey()) {
    return 0;
  }
  int v3 = [(IMDCKUtilities *)self lockdownManager];
  char v4 = [v3 isInternalInstall];

  return v4;
}

- (int64_t)overrideNumberOfChatsToFetch
{
  uint64_t v2 = [(IMDCKUtilities *)self lockdownManager];
  if ([v2 isInternalInstall])
  {
    char v3 = IMIsRunningInUnitTesting();

    if (v3) {
      return -1;
    }
    char v4 = IMGetCachedDomainValueForKey();
    if (!v4) {
      return -1;
    }
    uint64_t v2 = v4;
    int64_t v5 = [v4 integerValue];
  }
  else
  {
    int64_t v5 = -1;
  }

  return v5;
}

- (int64_t)overrideNumberOfChatsToWrite
{
  uint64_t v2 = [(IMDCKUtilities *)self lockdownManager];
  if ([v2 isInternalInstall])
  {
    char v3 = IMIsRunningInUnitTesting();

    if (v3) {
      return -1;
    }
    char v4 = IMGetCachedDomainValueForKey();
    if (!v4) {
      return -1;
    }
    uint64_t v2 = v4;
    int64_t v5 = [v4 integerValue];
  }
  else
  {
    int64_t v5 = -1;
  }

  return v5;
}

- (void)isFirstSyncWithActivity:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[IMDCKChatSyncController sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D9699BBC;
  v9[3] = &unk_1E6B72C60;
  id v10 = v5;
  id v8 = v5;
  [v7 anyChatExistsOnServerWithActivity:v6 completion:v9];
}

- (unint64_t)messageDatabaseSize
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IMSharedHelperMessagesRootFolderPath();
  if (IMOSLoggingEnabled())
  {
    char v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      uint64_t v7 = v2;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Get file size on path: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  unint64_t v4 = IMLegacyCalculateFileSizeForPath();

  return v4;
}

- (double)_iCloudStorageSizeFudgeFactorBagValue
{
  MEMORY[0x1F4123F18](@"mic-icloud-storage-size-fudge-factor", a2, 1.2);
  return result;
}

- (unint64_t)currentStorageOnDevice
{
  uint64_t v21 = self;
  v40[3] = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[IMDCKUtilities currentStorageOnDevice]";
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "%s: retrieving current storage for CloudKit storage calculation", buf, 0xCu);
    }
  }
  v26 = IMSMSDirectoryURL();
  v25 = [@"sms.db" stringByAppendingString:@"-wal"];
  v24 = [v26 URLByAppendingPathComponent:@"sms.db"];
  v23 = [v26 URLByAppendingPathComponent:v25];
  uint64_t v22 = IMAttachmentsDirectoryURL();
  v40[0] = v24;
  v40[1] = v23;
  v40[2] = v22;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = 0;
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v30;
    uint64_t v6 = *MEMORY[0x1E4F1C628];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v28 = 0;
        int v9 = objc_msgSend(v8, "getResourceValue:forKey:error:", &v28, v6, 0, v21);
        id v10 = v28;
        id v11 = v10;
        if (v9) {
          [v10 BOOLValue];
        }
        id v12 = [v8 path];
        uint64_t v13 = IMCalculateFileSizeForPath();

        if (IMOSLoggingEnabled())
        {
          id v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v15 = [v8 path];
            *(_DWORD *)buf = 138412546;
            v34 = v15;
            __int16 v35 = 2048;
            unint64_t v36 = v13;
            _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Calculated file size on path %@ as: %llu", buf, 0x16u);
          }
        }

        v3 += v13;
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v4);
  }

  [(IMDCKUtilities *)v21 _iCloudStorageSizeFudgeFactorBagValue];
  double v17 = v16;
  unint64_t v18 = (unint64_t)(v16 * (double)v3);
  if (IMOSLoggingEnabled())
  {
    objc_super v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v34 = *(const char **)&v17;
      __int16 v35 = 2048;
      unint64_t v36 = v3;
      __int16 v37 = 2048;
      unint64_t v38 = v18;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "fudge factor (%f) total size (%llu) final size (%llu)", buf, 0x20u);
    }
  }
  return v18;
}

- (void)estimateQuotaAvailability:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[IMDCKBackupController sharedInstance];
  int v5 = [v4 iCloudBackupsDisabled];

  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = @"YES";
      if (v5) {
        uint64_t v7 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "performAdditionalStorageRequiredCheckWithMessageContext , backup exists: %@", buf, 0xCu);
    }
  }
  if (v5)
  {
    uint64_t v8 = +[IMDCKUtilities sharedInstance];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1D969A284;
    v9[3] = &unk_1E6B72C60;
    id v10 = v3;
    [v8 isFirstSyncWithActivity:0 completion:v9];
  }
  else if (v3)
  {
    (*((void (**)(id, void, void, void))v3 + 2))(v3, 0, 0, 0);
  }
}

- (void)checkiCloudQuota:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Check if there is enough iCloud quota", buf, 2u);
    }
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1A0F8]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v7 setQualityOfService:17];
  [v7 setAllowsCellularAccess:1];
  [v6 setConfiguration:v7];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = sub_1D969A670;
  uint64_t v13 = &unk_1E6B72CB0;
  id v14 = self;
  id v15 = v4;
  id v8 = v4;
  [v6 setFetchUserQuotaCompletionBlock:&v10];
  int v9 = [(IMDCKUtilities *)self _truthDatabase];
  [v9 addOperation:v6];
}

- (BOOL)_isInExitState
{
  return IMGetCachedDomainBoolForKey();
}

- (BOOL)_mocFeatureEnabled
{
  uint64_t v2 = [(IMDCKUtilities *)self syncState];
  char v3 = [v2 isFeatureEnabled];

  return v3;
}

- (BOOL)_shouldiCloudSwitchBeEnabled
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(IMDCKUtilities *)self iCloudAccountMatchesiMessageAccount])
  {
    IMSetDomainBoolForKey();
    uint64_t v10 = [(IMDCKUtilities *)self syncState];
    [v10 setFeatureEnabled:0];

    int v5 = [(IMDCKUtilities *)self backupController];
    [v5 setICloudBackupsDisabled:0];

    LOBYTE(v5) = 0;
    if (!IMOSLoggingEnabled()) {
      return (char)v5;
    }
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "_shouldiCloudSwitchBeEnabled is FALSE as iCloud and iMessage accounts do not match up", (uint8_t *)&v15, 2u);
    }
    goto LABEL_15;
  }
  BOOL v3 = [(IMDCKUtilities *)self _serverAllowsSync];
  BOOL v4 = [(IMDCKUtilities *)self _mocFeatureEnabled];
  if (!v3)
  {
    if (!IMOSLoggingEnabled())
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return (char)v5;
    }
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "_shouldiCloudSwitchBeEnabled is FALSE because server does not allow sync", (uint8_t *)&v15, 2u);
    }
LABEL_15:

    goto LABEL_16;
  }
  int v5 = (void *)v4;
  BOOL v6 = [(IMDCKUtilities *)self _isInExitState];
  int v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = [NSNumber numberWithBool:v5];
        int v15 = 138412290;
        double v16 = v9;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "_shouldiCloudSwitchBeEnabled is FALSE because we are in exit state. Is moc feature enabled %@", (uint8_t *)&v15, 0xCu);
      }
    }
    goto LABEL_16;
  }
  if (v7)
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [NSNumber numberWithBool:v5];
      int v15 = 138412290;
      double v16 = v14;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "We are not in exit state, _shouldiCloudSwitchBeEnabled is based on whether feature is enabled or not: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  return (char)v5;
}

- (BOOL)cloudKitSyncDownloadAssetsOnly
{
  uint64_t v2 = [(IMDCKUtilities *)self syncState];
  char v3 = [v2 isFeatureEnabled] ^ 1;

  return v3;
}

- (void)setCloudKitEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL v6 = @"NO";
      if (v3) {
        BOOL v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      double v16 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Request to set cloudkit enabled %@", buf, 0xCu);
    }
  }
  if (v3) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  id v8 = [NSNumber numberWithInteger:v7];
  IMSetDomainValueForKey();

  if (v3)
  {
    if ((IMGetDomainBoolForKeyWithDefaultValue() & 1) == 0)
    {
      int v9 = +[IMDCKSyncController sharedInstance];
      [v9 setBroadcastedSyncStateStateToStarting];
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Setting priority defaults", buf, 2u);
      }
    }
    IMSetDomainBoolForKey();
    uint64_t v11 = +[IMDCKExitManager sharedInstance];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1D969AE78;
    v13[3] = &unk_1E6B72D00;
    void v13[4] = self;
    BOOL v14 = v3;
    [v11 exitRecordDateWithCompletion:v13];
  }
  else
  {
    [(IMDCKUtilities *)self setCloudKitSyncingEnabled:0];
    [(IMDCKUtilities *)self _didAttemptToUpdateCloudKitEnablementTo:0 result:1];
    id v12 = +[IMDCKBackupController sharedInstance];
    [v12 setICloudBackupsDisabled:0];

    [(IMDCKUtilities *)self clearLocalCloudKitSyncState:17];
  }
}

- (void)clearLocalCloudKitSyncState:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109120;
      v13[1] = a3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Clearing local sync state, flags %x", (uint8_t *)v13, 8u);
    }
  }
  int v5 = +[IMDCKChatSyncController sharedInstance];
  [v5 clearLocalSyncState:a3];

  BOOL v6 = +[IMDCKMessageSyncController sharedInstance];
  [v6 clearLocalSyncState:a3];

  uint64_t v7 = +[IMDCKAttachmentSyncController sharedInstance];
  [v7 clearLocalSyncState:a3];

  id v8 = +[IMDCKUpdateSyncController sharedInstance];
  [v8 clearLocalSyncState:a3];

  int v9 = +[IMDCKRecoverableMessageSyncController sharedInstance];
  [v9 clearLocalSyncState:a3];

  uint64_t v10 = +[IMDCKRecordSaltManager sharedInstance];
  [v10 clearLocalSyncState];

  uint64_t v11 = +[IMDCKSyncController sharedInstance];
  [v11 clearCKRelatedDefaults];

  id v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LODWORD(v9) = [v12 isMessagesIniCloudVersion2];

  if (v9)
  {
    [MEMORY[0x1E4F77E68] clearSyncStoreWhenSafe];
    [MEMORY[0x1E4F77E68] clearLocalCountsWhenSafe];
  }
}

- (void)_didAttemptToUpdateCloudKitEnablementTo:(BOOL)a3 result:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = @"NO";
      if (v5) {
        id v8 = @"YES";
      }
      else {
        id v8 = @"NO";
      }
      if (v4) {
        uint64_t v7 = @"YES";
      }
      int v12 = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      int v15 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Completed changing enabled state to: %@, with result: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  IMSetDomainValueForKey();
  int v9 = +[IMDBroadcastController sharedProvider];
  uint64_t v10 = [v9 broadcasterForAccountListeners];
  [v10 didAttemptToSetEnabledTo:v5 result:v4];

  if (v5 && !v4)
  {
    uint64_t v11 = +[IMDCKSyncController sharedInstance];
    [v11 setBroadcastedSyncStateStateToFinished];
  }
}

- (void)setCloudKitSyncingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL v6 = @"NO";
      if (v3) {
        BOOL v6 = @"YES";
      }
      int v13 = 138412290;
      __int16 v14 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Setting cloudkit enabled: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t v7 = [(IMDCKUtilities *)self syncState];
  [v7 setFeatureEnabled:v3];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"com.apple.IMDaemonCore.IMDCKUtilities.MiCEnabledStateReturned" object:0];

  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Starting initial sync", (uint8_t *)&v13, 2u);
      }
    }
    [(IMDCKUtilities *)self _resetKeepMessagesSettingandBroadcastToAllDevices];
    uint64_t v10 = +[IMDCKSyncController sharedInstance];
    [v10 beginInitialSyncWithActivity:0];

    IMSetDomainValueForKey();
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Attachment watermark reset to 0", (uint8_t *)&v13, 2u);
      }
    }
  }
  else
  {
    int v12 = +[IMDAttachmentStore sharedInstance];
    [v12 markAllAttachmentsAsNotPurgeable];
  }
  [(IMDCKUtilities *)self evalToggleiCloudSettingsSwitch];
}

- (BOOL)serverAllowsMetricSubmission
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  BOOL v3 = [v2 objectForKey:@"ck-submit-metrics-min-version"];
  BOOL v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v5 = 3;
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [NSNumber numberWithUnsignedInteger:v5];
      id v8 = (void *)v7;
      int v9 = @"NO";
      if (v5 < 3) {
        int v9 = @"YES";
      }
      int v11 = 138412802;
      int v12 = v9;
      __int16 v13 = 2112;
      __int16 v14 = &unk_1F33C5658;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "server allows submitting metrics result %@ clientVersion %@ serverVersion %@", (uint8_t *)&v11, 0x20u);
    }
  }

  return v5 < 3;
}

- (BOOL)serverAllowsAnalyticSubmission
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  BOOL v3 = [v2 objectForKey:@"ck-submit-analytics-min-version"];
  unint64_t v4 = [v3 unsignedIntegerValue];
  if (IMOSLoggingEnabled())
  {
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [NSNumber numberWithUnsignedInteger:v4];
      uint64_t v7 = (void *)v6;
      id v8 = @"NO";
      if (v4 < 3) {
        id v8 = @"YES";
      }
      int v10 = 138412802;
      int v11 = v8;
      __int16 v12 = 2112;
      __int16 v13 = &unk_1F33C5658;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "server allows submitting analytics result %@ clientVersion %@ serverVersion %@", (uint8_t *)&v10, 0x20u);
    }
  }

  return v4 < 3;
}

- (BOOL)serverAllowsAnalyticDetailsSubmission
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  BOOL v3 = [v2 objectForKey:@"ck-submit-analytics-details-min-version"];
  unint64_t v4 = [v3 unsignedIntegerValue];
  if (IMOSLoggingEnabled())
  {
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [NSNumber numberWithUnsignedInteger:v4];
      uint64_t v7 = (void *)v6;
      id v8 = @"NO";
      if (v4 < 3) {
        id v8 = @"YES";
      }
      int v10 = 138412802;
      int v11 = v8;
      __int16 v12 = 2112;
      __int16 v13 = &unk_1F33C5658;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "server allows submitting analytics details result %@ clientVersion %@ serverVersion %@", (uint8_t *)&v10, 0x20u);
    }
  }

  return v4 < 3;
}

- (id)_getKeepMessagesValue
{
  return (id)IMGetCachedDomainValueForKey();
}

- (BOOL)_shouldDisplayPopUpForResettingKeepMessages
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(IMDCKUtilities *)self _getKeepMessagesValue];
  uint64_t v3 = [v2 integerValue];
  if (v3 && IMOSLoggingEnabled())
  {
    unint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      uint64_t v7 = v2;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Keep Messages value should be altered from %@ to 0", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 != 0;
}

- (void)_resetKeepMessagesSettingandBroadcastToAllDevices
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = IMGetCachedDomainValueForKey();
  unint64_t v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 integerValue] + 1;
  }
  else {
    uint64_t v5 = 1;
  }
  if (IMOSLoggingEnabled())
  {
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Resetting Keep Message setting to Keep forever.  VersionID: %ld", (uint8_t *)&v11, 0xCu);
    }
  }
  if ([(IMDCKUtilities *)self _shouldDisplayPopUpForResettingKeepMessages])
  {
    IMSetDomainValueForKey();
  }
  uint64_t v7 = [NSNumber numberWithInteger:v5];
  IMSetDomainValueForKey();

  uint64_t v8 = [NSNumber numberWithInteger:0];
  IMSetDomainValueForKey();

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E4F6E268], 0, 0, 1u);
  int v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v10, (CFNotificationName)*MEMORY[0x1E4F6E298], 0, 0, 1u);
  notify_post((const char *)*MEMORY[0x1E4F6E288]);
}

- (BOOL)_serverAllowsCacheDelete
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(IMDCKUtilities *)self serverBag];
  uint64_t v3 = [v2 objectForKey:@"ck-cache-delete-version-V3"];

  unint64_t v4 = [v3 unsignedIntegerValue];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (v4 >= 2) {
        int v6 = @"NO";
      }
      else {
        int v6 = @"YES";
      }
      uint64_t v7 = [NSNumber numberWithUnsignedInteger:1];
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:v4];
      int v10 = 138412802;
      int v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "server allows cached delete check result %@ clientVersion %@ serverVersion %@", (uint8_t *)&v10, 0x20u);
    }
  }

  return v4 < 2;
}

- (BOOL)enableAttachmentMetricCollection
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v4 = [v3 isInternalInstall];

  if (v4
    && ([(IMDCKUtilities *)self serverBag],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKey:@"ck-enable-attachment-validation"],
        int v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "enableAttachmentMetricCollection overridden by iMessage server", (uint8_t *)&v12, 2u);
      }
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = @"NO";
      if (v8) {
        int v10 = @"YES";
      }
      int v12 = 138412290;
      uint64_t v13 = v10;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Should enable attachment metric-ing %@", (uint8_t *)&v12, 0xCu);
    }
  }
  return v8;
}

- (BOOL)cacheDeleteEnabled
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(IMDCKUtilities *)self _allowDestructiveMOCFeaturesBasedOnDSID]) {
    BOOL v3 = [(IMDCKUtilities *)self _serverAllowsCacheDelete];
  }
  else {
    BOOL v3 = 0;
  }
  int v4 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v5 = [v4 isInternalInstall];

  BOOL v6 = (v5 | v3) == 1 && [(IMDCKUtilities *)self cloudKitSyncingEnabled];
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = @"NO";
      if (v6) {
        BOOL v8 = @"YES";
      }
      int v10 = 138412290;
      int v11 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "CacheDeleteEnabled %@", (uint8_t *)&v10, 0xCu);
    }
  }
  return v6;
}

- (BOOL)_serverAllowsRemovalFromBackUp
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(IMDCKUtilities *)self serverBag];
  BOOL v3 = [v2 objectForKey:@"ck-remove-from-backup-version-V3"];

  uint64_t v4 = [v3 unsignedIntegerValue];
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [NSNumber numberWithUnsignedInteger:v4];
      uint64_t v7 = (void *)v6;
      BOOL v8 = @"NO";
      if (v4) {
        BOOL v8 = @"YES";
      }
      int v10 = 138412546;
      int v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "server allows removal from backup result %@ serverVersion %@", (uint8_t *)&v10, 0x16u);
    }
  }

  return v4 != 0;
}

- (BOOL)removeFromBackUpAllowed
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDCKUtilities *)self _allowDestructiveMOCFeaturesBasedOnDSID]
    && [(IMDCKUtilities *)self _serverAllowsRemovalFromBackUp]
    && [(IMDCKUtilities *)self cloudKitSyncingEnabled];
  uint64_t v4 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v5 = [v4 isInternalInstall];

  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "This is an internal install so overriding server bag check and defaulting to yes", (uint8_t *)&v10, 2u);
      }
    }
    BOOL v3 = 1;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = @"NO";
      if (v3) {
        BOOL v8 = @"YES";
      }
      int v10 = 138412290;
      int v11 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Removal from back up allowed %@", (uint8_t *)&v10, 0xCu);
    }
  }
  return v3;
}

- (id)internalQueue
{
  if (qword_1EBE2BCC0 != -1) {
    dispatch_once(&qword_1EBE2BCC0, &unk_1F33904A0);
  }
  uint64_t v2 = (void *)qword_1EBE2BCB8;

  return v2;
}

- (BOOL)accountIsVerifiedForMOCAndSafeForCacheDelete
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v4 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v4 startTimingForKey:@"accountIsVerifiedForMOCAndSafeForCacheDelete"];
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Checking if account is verified", buf, 2u);
    }
  }
  uint64_t v6 = [(IMDCKUtilities *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D969CA98;
  block[3] = &unk_1E6B72D68;
  block[4] = self;
  uint64_t v16 = &v17;
  uint64_t v7 = v3;
  uint64_t v15 = v7;
  dispatch_async(v6, block);

  if (IMOSLoggingEnabled())
  {
    BOOL v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "About to wait for accountIsVerifiedForMOCAndSafeForCacheDelete call", buf, 2u);
    }
  }
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v7, v9);
  [v4 stopTimingForKey:@"accountIsVerifiedForMOCAndSafeForCacheDelete"];
  if (IMOSLoggingEnabled())
  {
    int v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if (*((unsigned char *)v18 + 24)) {
        int v11 = @"YES";
      }
      else {
        int v11 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      id v22 = v4;
      __int16 v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Finished blocking accountIsVerifiedForMOCAndSafeForCacheDelete with time: %@ and accountValidForCD %@", buf, 0x16u);
    }
  }
  if (*((unsigned char *)v18 + 24)) {
    BOOL v12 = [(IMDCKUtilities *)self cacheDeleteEnabled];
  }
  else {
    BOOL v12 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (id)_authenticationController
{
  if (qword_1EBE2BAD0 != -1) {
    dispatch_once(&qword_1EBE2BAD0, &unk_1F33904C0);
  }
  uint64_t v2 = (void *)qword_1EBE2BAC8;

  return v2;
}

- (BOOL)_checkEligibilityWithAccountInfo:(id)a3
{
  return MEMORY[0x1F4181798](a3, sel_supportsDeviceToDeviceEncryption);
}

- (id)_createAccountError:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = v3;
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    int v5 = 0;
  }
  uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMDCKUtilitiesErrorDomain" code:1 userInfo:v5];

  return v6;
}

- (void)fetchAccountStatusAndUpdateMiCSwitchEligibility
{
}

- (void)fetchAccountStatusAndUpdateMiCSwitchEligibilityIfNeededOnImagentLaunch
{
  if ((IMGetCachedDomainBoolForKeyWithDefaultValue() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Fetching security level and updating mic switch eligible on imagent launch", v4, 2u);
      }
    }
    [(IMDCKUtilities *)self fetchAccountStatusAndUpdateMiCSwitchEligibility];
  }
}

- (BOOL)_checkIfEnabledByServerBagOrDefault:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(IMDCKUtilities *)self serverBag];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6) {
    int v7 = [v6 BOOLValue];
  }
  else {
    int v7 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      dispatch_time_t v9 = @"NO";
      if (v7) {
        dispatch_time_t v9 = @"YES";
      }
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Server allowing %@: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  int v10 = IMGetCachedDomainBoolForKey();
  if (IMOSLoggingEnabled())
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      BOOL v12 = @"NO";
      if (v10) {
        BOOL v12 = @"YES";
      }
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Defaults over allowing %@: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  uint64_t v13 = [(IMDCKUtilities *)self lockdownManager];
  if (![v13 isInternalInstall])
  {

    goto LABEL_20;
  }

  if (((v7 | v10) & 1) == 0)
  {
LABEL_20:
    BOOL v14 = 0;
    goto LABEL_21;
  }
  BOOL v14 = 1;
LABEL_21:

  return v14;
}

- (BOOL)shouldPresentTTROnCloudKitError
{
  if (IMIsRunningInAutomation()) {
    return 0;
  }

  return [(IMDCKUtilities *)self _checkIfEnabledByServerBagOrDefault:@"should-ttr-on-icloud-kit-error"];
}

- (BOOL)shouldLogDumpOnCloudKitError
{
  if (![(IMDCKUtilities *)self _isLogDumpAllowed] || (IMIsRunningInAutomation() & 1) != 0) {
    return 0;
  }

  return [(IMDCKUtilities *)self _checkIfEnabledByServerBagOrDefault:@"should-dump-logs-on-icloud-kit-error"];
}

- (BOOL)shouldCollectDailyLogDump
{
  if (IMIsRunningInAutomation()) {
    return 0;
  }

  return [(IMDCKUtilities *)self _checkIfEnabledByServerBagOrDefault:@"should-dump-logs-daily-if-havent-synced"];
}

- (BOOL)shouldCollectDailyLogDumpForRestoreFailures
{
  if (IMIsRunningInAutomation()) {
    return 0;
  }
  else {
    return ![(IMDCKUtilities *)self _checkIfEnabledByServerBagOrDefault:@"disable-dumping-logs-daily-for_restore_failures"];
  }
}

- (id)logCollectorAddress
{
  uint64_t v2 = [(IMDCKUtilities *)self serverBag];
  id v3 = [v2 objectForKey:@"log-collector-handle"];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = @"msgs_on_icloud_logs@icloud.com";
  }

  return v4;
}

- (void)reportMOCDebuggingErrorWithString:(id)a3 internalOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(IMDCKUtilities *)self logCollectorAddress];
  [(IMDCKUtilities *)self reportMOCDebuggingErrorWithString:v6 internalOnly:v4 initialSync:0 sendToHandle:v7];
}

- (void)reportMOCDebuggingErrorWithString:(id)a3 internalOnly:(BOOL)a4 initialSync:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(IMDCKUtilities *)self logCollectorAddress];
  [(IMDCKUtilities *)self reportMOCDebuggingErrorWithString:v8 internalOnly:v6 initialSync:v5 sendToHandle:v9];
}

- (void)reportMOCDebuggingErrorWithString:(id)a3 internalOnly:(BOOL)a4 initialSync:(BOOL)a5 sendToHandle:(id)a6
{
}

- (void)reportMOCDebuggingErrorWithString:(id)a3 internalOnly:(BOOL)a4 initialSync:(BOOL)a5 sendToHandle:(id)a6 reasonString:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v12 = (__CFString *)a3;
  id v13 = a6;
  BOOL v14 = (__CFString *)a7;
  if ([(IMDCKUtilities *)self cloudKitSyncingEnabled])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412290;
        uint64_t v21 = v12;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "A cloudkit error(%@) occured checking if we should try to report the error", (uint8_t *)&v20, 0xCu);
      }
    }
    BOOL v16 = [(IMDCKUtilities *)self shouldLogDumpOnCloudKitError];
    if (IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __int16 v18 = @"NO";
        if (v16) {
          __int16 v18 = @"YES";
        }
        int v20 = 138412290;
        uint64_t v21 = v18;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Should log dump on cloudkit error? %@", (uint8_t *)&v20, 0xCu);
      }
    }
    if ([(__CFString *)v14 length])
    {
      if (v16) {
        goto LABEL_14;
      }
    }
    else
    {

      BOOL v14 = @"TriggeredByCKError";
      if (v16)
      {
LABEL_14:
        [(IMDCKUtilities *)self logDumpAndSendMessageTo:v13 forHours:6 reason:v14 isInitialSync:v9 requirePreviousPrompt:0 willSendBlock:0];
        if (![(IMDCKUtilities *)self shouldPresentTTROnCloudKitError]) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    if ([(IMDCKUtilities *)self shouldPresentTTROnCloudKitError])
    {
LABEL_18:
      [(IMDCKUtilities *)self _askToTapToRadarWithString:v12 internalOnly:v10];
LABEL_19:
      uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
      IMSetDomainValueForKey();
    }
  }
}

- (void)_askToTapToRadarWithString:(id)a3 internalOnly:(BOOL)a4
{
  id v4 = a3;
  if (qword_1EA8CA360 != -1) {
    dispatch_once(&qword_1EA8CA360, &unk_1F3390500);
  }
  id v5 = v4;
  BOOL v6 = (void *)MEMORY[0x1E4F6C410];
  id v7 = [NSString stringGUID];
  id v8 = [v6 userNotificationWithIdentifier:v7 title:@"Messages on iCloud Debug UI" message:v5 defaultButton:@"File a radar" alternateButton:@"Dismiss" otherButton:0];

  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "We present a CK UI", buf, 2u);
      }
    }
    BOOL v10 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v10 trackEvent:*MEMORY[0x1E4F6DA58]];

    [v8 setUsesNotificationCenter:0];
    [v8 setRepresentedApplicationBundle:*MEMORY[0x1E4F6C440]];
    int v11 = [MEMORY[0x1E4F6C418] sharedInstance];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1D969D9A4;
    v12[3] = &unk_1E6B72E08;
    id v13 = v5;
    [v11 addUserNotification:v8 listener:0 completionHandler:v12];
  }
}

- (id)recordNameForMessageWithGUID:(id)a3 usingSalt:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 length] && objc_msgSend(v5, "length"))
  {
    id v7 = [NSString stringWithFormat:@"%@%@", v5, v6];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        BOOL v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
        *(_DWORD *)buf = 138412546;
        BOOL v12 = v9;
        __int16 v13 = 2112;
        id v14 = v5;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "IMDCKUtilities recordNameForMessageWithGUID invalid parameters [key length] %@ guid %@", buf, 0x16u);
      }
    }
    id v7 = 0;
  }

  return v7;
}

- (id)syncFailureMetricString:(id)a3 isRecoverable:(BOOL)a4 error:(id)a5
{
  id v6 = NSString;
  if (a4) {
    id v7 = @"RecoverableError";
  }
  else {
    id v7 = @"NonRecoverableError";
  }
  id v8 = a5;
  id v9 = a3;
  BOOL v10 = [v8 domain];
  int v11 = NSNumber;
  uint64_t v12 = [v8 code];

  __int16 v13 = [v11 numberWithInteger:v12];
  id v14 = [v6 stringWithFormat:@"%@-%@-%@-%@", v9, v7, v10, v13];

  return v14;
}

- (id)extractServerRecordFromCKServerErrorRecordChanged:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 code] == 14)
  {
    id v4 = [v3 userInfo];
    id v5 = [v4 valueForKey:*MEMORY[0x1E4F19D10]];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "******** IMDCKUtilities not a partial error %@", (uint8_t *)&v8, 0xCu);
      }
    }
    id v5 = 0;
  }

  return v5;
}

- (void)resetLastSyncDate
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Resetting last sync date to nil", v5, 2u);
    }
  }
  id v4 = [(IMDCKUtilities *)self syncState];
  [v4 removeObjectFromAnalyticSyncDatesDictionaryForKey:*MEMORY[0x1E4F6CEE0]];

  [(IMDCKUtilities *)self reportMOCDebuggingErrorWithString:@"Last sync date was reset to nil" internalOnly:0 initialSync:0];
}

- (void)repairACAccountEnablementStatusIfNeeded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = +[IMDServiceController sharedController];
  id v4 = [v3 serviceWithName:*MEMORY[0x1E4F6E1B0]];

  id v5 = +[IMDAccountController sharedInstance];
  id v6 = [v5 accountsForService:v4];

  if ([v6 count])
  {
    IMGetDomainBoolForKey();
    if (IMGetCachedDomainIntForKeyWithDefaultValue() < 1)
    {
      BOOL v8 = [(IMDCKUtilities *)self _shouldiCloudSwitchBeEnabled];
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = @"NO";
          if (v8) {
            uint64_t v10 = @"YES";
          }
          int v11 = 138412290;
          uint64_t v12 = v10;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Needs to repair ACAccount enablement; force switching ACAccount switch to %@.",
            (uint8_t *)&v11,
            0xCu);
        }
      }
      [(IMDCKUtilities *)self _setiCloudSettingsSwitchEnabled:v8];
      IMSetDomainIntForKey();
    }
    else if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "No need to try to repair ACAccount dataclass enablement status.", (uint8_t *)&v11, 2u);
      }
    }
  }
}

- (void)evalToggleiCloudSettingsSwitch
{
  BOOL v3 = [(IMDCKUtilities *)self _shouldiCloudSwitchBeEnabled];

  [(IMDCKUtilities *)self _setiCloudSettingsSwitchEnabled:v3];
}

- (void)_setiCloudSettingsSwitchEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((IMIsRunningInUnitTesting() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = @"NO";
        if (v3) {
          id v6 = @"YES";
        }
        int v10 = 138412290;
        int v11 = v6;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Trying to set iCloud Settings Switch to enabled={%@}", (uint8_t *)&v10, 0xCu);
      }
    }
    id v7 = [(IMDCKUtilities *)self _accountStore];
    BOOL v8 = objc_msgSend(v7, "aa_primaryAppleAccountWithPreloadedDataclasses");
    id v9 = v8;
    if (v8)
    {
      [v8 setEnabled:v3 forDataclass:*MEMORY[0x1E4F17AE8]];
      [v7 saveVerifiedAccount:v9 withCompletionHandler:&unk_1F3390540];
    }
  }
}

- (void)_fetchPrimaryAccountWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDCKUtilities *)self _accountStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D969E568;
  v7[3] = &unk_1E6B72E50;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "aa_primaryAppleAccountWithCompletion:", v7);
}

- (void)fetchiCloudAccountPersonID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D969E734;
  v6[3] = &unk_1E6B72E78;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(IMDCKUtilities *)self _fetchPrimaryAccountWithCompletion:v6];
}

- (id)_personIdFromAccount:(id)a3
{
  return (id)objc_msgSend(a3, "aa_personID");
}

- (void)primaryAccountHasiCloudBackupEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D969E9AC;
  v6[3] = &unk_1E6B72E50;
  id v7 = v4;
  id v5 = v4;
  [(IMDCKUtilities *)self _fetchPrimaryAccountWithCompletion:v6];
}

- (BOOL)isDeviceCharging
{
  uint64_t v2 = [MEMORY[0x1E4F6E728] sharedInstance];
  char v3 = [v2 isDeviceCharging];

  return v3;
}

- (BOOL)isDeviceOnWifi
{
  uint64_t v2 = [MEMORY[0x1E4F6E728] sharedInstance];
  char v3 = [v2 isDeviceOnWifi];

  return v3;
}

- (id)deviceConditions
{
  BOOL v3 = [(IMDCKUtilities *)self isDeviceCharging];
  BOOL v4 = [(IMDCKUtilities *)self isDeviceOnWifi];
  id v5 = [(IMDCKUtilities *)self syncState];
  id v6 = [v5 lastSyncDate];

  id v7 = [(IMDCKUtilities *)self syncState];
  id v8 = [v7 getAnalyticSyncDatesObjectForKey:*MEMORY[0x1E4F6CEE0]];

  id v9 = @"NO";
  if (v4) {
    int v10 = @"YES";
  }
  else {
    int v10 = @"NO";
  }
  if (v3) {
    int v11 = v10;
  }
  else {
    int v11 = @"NO";
  }
  if (v3) {
    id v9 = @"YES";
  }
  uint64_t v12 = [NSString stringWithFormat:@"isOnWifiAndPower %@, Is charging %@, isOnWifi %@, lastSyncDate %@ lastCompleteSyncedDBDate %@", v11, v9, v10, v6, v8];

  return v12;
}

- (BOOL)deviceConditionsAllowPeriodicSync
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDCKUtilities *)self isDeviceCharging];
  BOOL v4 = [(IMDCKUtilities *)self isDeviceOnWifi];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = @"NO";
      if (v3 && v4) {
        id v7 = @"YES";
      }
      else {
        id v7 = @"NO";
      }
      if (v3) {
        id v8 = @"YES";
      }
      else {
        id v8 = @"NO";
      }
      int v10 = 138412802;
      int v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      if (v4) {
        id v6 = @"YES";
      }
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "isOnWifiAndPower %@, Is charging %@ , isOnWifi %@ ", (uint8_t *)&v10, 0x20u);
    }
  }
  return v3 && v4;
}

- (id)newfilteredArrayRemovingCKRecordDupes:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v8 = 138412290;
    long long v16 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        __int16 v12 = objc_msgSend(v11, "recordID", v16, (void)v17);
        uint64_t v13 = [v12 recordName];

        if (v13 && ([v4 containsObject:v13] & 1) == 0)
        {
          [v5 addObject:v11];
          [v4 addObject:v13];
        }
        else if (IMOSLoggingEnabled())
        {
          __int16 v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v16;
            uint64_t v22 = v11;
            _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Found duplicate record while syncing or record does not have a record name. Dropping record: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)newfilteredArrayRemovingCKRecordIDDupes:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v17;
    *(void *)&long long v8 = 138412290;
    long long v15 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        __int16 v12 = objc_msgSend(v11, "recordName", v15, (void)v16);
        if (v12 && ([v4 containsObject:v12] & 1) == 0)
        {
          [v5 addObject:v11];
          [v4 addObject:v12];
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            uint64_t v21 = v11;
            _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Found duplicate recordID while syncing or recordID does not have a record name. Dropping record: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)lastDeviceBackUpDate
{
  uint64_t v2 = +[IMDCKBackupController sharedInstance];
  id v3 = [v2 dateOfLastBackUp];

  return v3;
}

- (id)deviceActiveString
{
  if ([(IMDCKUtilities *)self _deviceActive]) {
    return @"active";
  }
  else {
    return @"inActive";
  }
}

- (BOOL)_deviceActive
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IMGetCachedDomainValueForKey();
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceDate:v2];
    BOOL v5 = v4 > 86400.0;
  }
  else
  {
    BOOL v5 = 1;
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = @"YES";
      if (v5) {
        uint64_t v7 = @"NO";
      }
      int v9 = 138412546;
      int v10 = v7;
      __int16 v11 = 2112;
      __int16 v12 = v2;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Active state %@ last activity date %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return !v5;
}

- (void)_showCKLogNotificationWithCompletion:(id)a3
{
  id v3 = a3;
  double v4 = (void *)MEMORY[0x1E4F6C410];
  BOOL v5 = [NSString stringGUID];
  id v6 = [v4 userNotificationWithIdentifier:v5, @"Messages on iCloud Debug UI", @"Messages will automatically send Apple a sysdiagnose when Messages detects an issue with Messages on iCloud.  You will be notified if a radar is created, otherwise the data will be automatically deleted after seven days.  You may turn this off in Internal Settings > Messages", @"Just send", @"Notify me each time", 0 title message defaultButton alternateButton otherButton];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F6C418] sharedInstance];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1D969F628;
    v8[3] = &unk_1E6B72EA0;
    id v9 = v3;
    [v7 addUserNotification:v6 listener:0 completionHandler:v8];
  }
}

- (BOOL)shouldKickOffWriteForSyncType:(int64_t)a3
{
  return a3 != 0;
}

- (BOOL)isLocalCachedSaltPresent
{
  uint64_t v2 = +[IMDCKRecordSaltManager sharedInstance];
  id v3 = [v2 cachedSalt];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (BOOL)shouldReportToRTC
{
  return MEMORY[0x1F4181798](self, sel_readServerBagBoolForKey_defaultValue_);
}

- (BOOL)shouldReportToAnalytics
{
  return MEMORY[0x1F4181798](self, sel_readServerBagBoolForKey_defaultValue_);
}

- (BOOL)readServerBagBoolForKey:(id)a3 defaultValue:(BOOL)a4
{
  int v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(IMDCKUtilities *)self serverBag];
  long long v8 = [v7 objectForKey:v6];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v4 = [v8 BOOLValue];
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = @"NO";
        if (v4) {
          int v10 = @"YES";
        }
        int v13 = 138412546;
        __int16 v14 = v10;
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Read server bag BOOL: [%@] for key: [%@]", (uint8_t *)&v13, 0x16u);
      }
LABEL_14:
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = @"NO";
      if (v4) {
        __int16 v11 = @"YES";
      }
      int v13 = 138412546;
      __int16 v14 = v11;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Server bag BOOL default: [%@] for key: [%@]", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_14;
  }

  return v4;
}

- (void)postSyncStateToCloudKit:(id)a3
{
  id v9 = a3;
  if ([(IMDCKUtilities *)self shouldReportToRTC])
  {
    int v4 = [(IMDCKUtilities *)self syncState];
    BOOL v5 = [v4 syncReportDictionary];
    [(IMDCKUtilities *)self postSyncStateToRTC:v9 category:2 reportDictionary:v5];
  }
  if ([(IMDCKUtilities *)self shouldReportToAnalytics]
    && [(IMDCKUtilities *)self serverAllowsAnalyticDetailsSubmission])
  {
    id v6 = [(IMDCKUtilities *)self exitManager];
    uint64_t v7 = [(IMDCKUtilities *)self syncState];
    long long v8 = [v7 syncReportDictionary];
    [v6 submitCloudKitAnalyticWithOperationGroupName:v9 analyticDictionary:v8];
  }
}

- (void)postSyncStateToRTC:(id)a3 category:(int64_t)a4 reportDictionary:(id)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = @"groupName";
  v14[1] = @"deviceState";
  v15[0] = a3;
  id v8 = a5;
  id v9 = a3;
  int v10 = [(IMDCKUtilities *)self deviceActiveString];
  v15[1] = v10;
  __int16 v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  __int16 v12 = (void *)[v11 mutableCopy];
  [v12 addEntriesFromDictionary:v8];

  int v13 = [(IMDCKUtilities *)self telemetryReporter];
  [v13 postMessage:v12 category:a4];
}

- (void)reportZoneCreation:(id)a3
{
  id v6 = [NSString stringWithFormat:@"ZoneCreateDate-%@", a3];
  int v4 = [(IMDCKUtilities *)self syncState];
  BOOL v5 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setAnalyticSyncDatesDictionaryObject:v5 forKey:v6 shouldOverrideIfExists:0];
}

- (void)reportErrorForSyncType:(int64_t)a3 syncStep:(id)a4 response:(int64_t)a5 error:(id)a6
{
  if (a6)
  {
    id v7 = a6;
    id v8 = [(IMDCKUtilities *)self syncState];
    [v8 addSyncError:v7];
  }
}

- (id)finalSyncStateFor:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = *off_1E6B730A8[a3];
  }
  return v4;
}

- (void)reportCompletionForSyncType:(int64_t)a3 isCoreDuetSync:(BOOL)a4 onAttempt:(unint64_t)a5 wasSuccessful:(BOOL)a6 duration:(double)a7
{
  BOOL v8 = a6;
  __int16 v12 = [(IMDCKUtilities *)self syncState];
  id v16 = [v12 syncReportDictionaryForAttempt:a5 withSuccess:v8 duration:a7];

  int v13 = [(IMDCKUtilities *)self finalSyncStateFor:a3];
  if ([(IMDCKUtilities *)self shouldReportToRTC]) {
    [(IMDCKUtilities *)self postSyncStateToRTC:v13 category:3 reportDictionary:v16];
  }
  if ([(IMDCKUtilities *)self shouldReportToAnalytics]
    && [(IMDCKUtilities *)self serverAllowsAnalyticSubmission])
  {
    __int16 v14 = [(IMDCKUtilities *)self exitManager];
    [v14 submitCloudKitAnalyticWithOperationGroupName:v13 analyticDictionary:v16];
  }
  __int16 v15 = [(IMDCKUtilities *)self syncState];
  [v15 clearSyncErrors];
}

- (BOOL)isCKPartialError:(id)a3
{
  id v3 = a3;
  int v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F19C40]]) {
    BOOL v5 = [v3 code] == 2;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)findRootCauses:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (![(IMDCKUtilities *)self isCKPartialError:v4]) {
    goto LABEL_18;
  }
  id v6 = [v4 userInfo];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  long long v18 = v7;
  id v19 = v4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v21;
  uint64_t v12 = *MEMORY[0x1E4F19C40];
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v8);
      }
      __int16 v14 = objc_msgSend(v8, "objectForKeyedSubscript:", *(void *)(*((void *)&v20 + 1) + 8 * i), v18, v19, (void)v20);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v15 = [v14 domain];
        if (![v15 isEqualToString:v12])
        {

LABEL_13:
          [v5 addObject:v14];
          goto LABEL_14;
        }
        uint64_t v16 = [v14 code];

        if (v16 != 22) {
          goto LABEL_13;
        }
      }
LABEL_14:
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v10);
LABEL_16:

  id v7 = v18;
  id v4 = v19;
LABEL_17:

LABEL_18:
  if (!objc_msgSend(v5, "count", v18, v19)) {
    [v5 addObject:v4];
  }

  return v5;
}

- (id)simplifiedError:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 localizedDescription];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = *MEMORY[0x1E4F28568];
LABEL_4:
    uint64_t v13 = v6;
    v14[0] = v5;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    goto LABEL_5;
  }
  id v7 = [v3 userInfo];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  id v5 = [v7 objectForKey:*MEMORY[0x1E4F28568]];

  if (v5) {
    goto LABEL_4;
  }
  id v8 = 0;
LABEL_5:
  uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = [v3 domain];
  uint64_t v11 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v3, "code"), v8);

  return v11;
}

- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4 reason:(id)a5
{
}

- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4 reason:(id)a5 requirePreviousPrompt:(BOOL)a6 willSendBlock:(id)a7
{
}

- (void)logToPowerLogForLogDumpGUID:(id)a3 logDumpCompleted:(BOOL)a4 logDumpSucceeded:(BOOL)a5 logDumpSendingCompleted:(BOOL)a6 logDumpSendingSucceeded:(BOOL)a7 reason:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a8;
  if (qword_1EA8CA378 != -1) {
    dispatch_once(&qword_1EA8CA378, &unk_1F3390580);
  }
  __int16 v15 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v16 = [NSNumber numberWithBool:v12];
  uint64_t v17 = [NSNumber numberWithBool:v11];
  long long v18 = [NSNumber numberWithBool:v10];
  id v19 = [NSNumber numberWithBool:v9];
  long long v20 = objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v14, @"LogDumpReason", v16, @"LogDumpingCompleted", v17, @"LogDumpingSucceeded", v18, @"LogDumpSendingCompleted", v19, @"LogDumpSendingSucceeded", v13, @"LogDumpGUID", 0);

  if (IMOSLoggingEnabled())
  {
    long long v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = v20;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Logging logDump (guid: %@) info to power log: %@", buf, 0x16u);
    }
  }
  if (off_1EA8CA370) {
    off_1EA8CA370(7, @"IMLogDump", v20, 0);
  }
}

- (void)logCloudKitSyncToPowerLogForSyncType:(int64_t)a3 isCoreDuetSync:(BOOL)a4 didStartSync:(BOOL)a5 didFinishSync:(BOOL)a6 didSucceedSyncing:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (qword_1EA8CA388 != -1) {
    dispatch_once(&qword_1EA8CA388, &unk_1F33905A0);
  }
  BOOL v12 = (void *)MEMORY[0x1E4F1C9E8];
  id v13 = [NSNumber numberWithInteger:a3];
  id v14 = [NSNumber numberWithBool:v10];
  __int16 v15 = [NSNumber numberWithBool:v9];
  uint64_t v16 = [NSNumber numberWithBool:v8];
  uint64_t v17 = [NSNumber numberWithBool:v7];
  long long v18 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, @"SyncType", v14, @"IsCoreDuetSync", v15, @"DidStartSync", v16, @"DidFinishSync", v17, @"DidSucceedSyncing", 0);

  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v21 = v18;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Logging sync info to power log: %@", buf, 0xCu);
    }
  }
  if (off_1EA8CA380) {
    off_1EA8CA380(7, @"IMCloudKitSync", v18, 0);
  }
}

- (void)logCloudKitSyncToPowerLogForSyncType:(int64_t)a3 isCoreDuetSync:(BOOL)a4 didCompleteChatSync:(BOOL)a5 didSucceedSyncingChats:(BOOL)a6 didCompleteMessageSync:(BOOL)a7 didSucceedSyncingMessages:(BOOL)a8 didCompleteAttachmentSync:(BOOL)a9 didSucceedSyncingAttachments:(BOOL)a10 didCompleteRecoverableMessageSync:(BOOL)a11 didSucceedSyncingRecoverableMessageSync:(BOOL)a12 syncAttemptCount:(unint64_t)a13
{
  BOOL v13 = a8;
  BOOL v14 = a7;
  BOOL v15 = a6;
  BOOL v16 = a5;
  BOOL v17 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (qword_1EA8CA398 != -1) {
    dispatch_once(&qword_1EA8CA398, &unk_1F33905C0);
  }
  long long v30 = (void *)MEMORY[0x1E4F1C9E8];
  long long v32 = [NSNumber numberWithInteger:a3];
  long long v31 = [NSNumber numberWithBool:v17];
  id v19 = [NSNumber numberWithBool:v16];
  long long v20 = [NSNumber numberWithBool:v15];
  long long v21 = [NSNumber numberWithBool:v14];
  uint64_t v22 = [NSNumber numberWithBool:v13];
  id v23 = [NSNumber numberWithBool:a9];
  __int16 v24 = [NSNumber numberWithBool:a10];
  uint64_t v25 = [NSNumber numberWithBool:a11];
  uint64_t v26 = [NSNumber numberWithBool:a12];
  v27 = [NSNumber numberWithUnsignedInteger:a13];
  objc_msgSend(v30, "dictionaryWithObjectsAndKeys:", v32, @"SyncType", v31, @"IsCoreDuetSync", v19, @"DidCompleteChatSync", v20, @"DidSucceedSyncingChats", v21, @"DidCompleteMessageSync", v22, @"DidSucceedSyncingMessages", v23, @"DidCompleteAttachmentSync", v24, @"DidSucceedSyncingAttachments", v25,
    @"DidCompleteRecoverableMessageSync",
    v26,
    @"DidSucceedSyncingRecoverableMessageSync",
    v27,
    @"SyncAttemptCount",
  id v28 = 0);

  if (IMOSLoggingEnabled())
  {
    long long v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v28;
      _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Logging sync attempt info to power log: %@", buf, 0xCu);
    }
  }
  if (off_1EA8CA390) {
    off_1EA8CA390(7, @"IMCloudKitSync", v28, 0);
  }
}

- (BOOL)_isLogDumpAllowed
{
  return 0;
}

- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4 reason:(id)a5 isInitialSync:(BOOL)a6 requirePreviousPrompt:(BOOL)a7 willSendBlock:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v12 = *(void *)&a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  BOOL v14 = a3;
  BOOL v15 = a5;
  id v16 = a8;
  if ([(IMDCKUtilities *)self _isLogDumpAllowed])
  {
    BOOL v17 = [NSString stringGUID];
    long long v18 = [(IMDCKUtilities *)self lockdownManager];
    int v19 = [v18 isInternalInstall];

    if (v19)
    {
      if (IMOSLoggingEnabled())
      {
        long long v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = [NSNumber numberWithInt:v12];
          uint64_t v22 = (void *)v21;
          id v23 = @"NO";
          *(_DWORD *)buf = 138413314;
          __int16 v37 = v14;
          if (v10) {
            id v23 = @"YES";
          }
          __int16 v38 = 2112;
          uint64_t v39 = v21;
          __int16 v40 = 2112;
          v41 = v15;
          __int16 v42 = 2112;
          v43 = v23;
          __int16 v44 = 2112;
          v45 = v17;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "logDumpAndSendMessageTo called for recipient %@, hrs %@, reason %@, initialSync %@ logDumpGuid %@", buf, 0x34u);
        }
      }
      uint64_t v24 = IMGetDomainIntForKey();
      if (v24 == 3)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v37 = v17;
            _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "User has opted out of auto log collection. Not dumping logs for logDumpGuid %@", buf, 0xCu);
          }
LABEL_27:

          goto LABEL_17;
        }
        goto LABEL_17;
      }
      if (v9 && !v24)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v37 = v17;
            _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "User has never seen a prompt and this collection requires a previous prompt. Not dumping logs for logDumpGuid %@", buf, 0xCu);
          }
          goto LABEL_27;
        }
LABEL_17:

        goto LABEL_31;
      }
      v27 = [(IMDCKUtilities *)self _truthContainer];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = sub_1D96A0F8C;
      v28[3] = &unk_1E6B72F68;
      long long v29 = v17;
      long long v30 = self;
      long long v31 = v15;
      BOOL v35 = v10;
      int v34 = v12;
      id v33 = v16;
      long long v32 = v14;
      [v27 fetchCurrentDeviceIDWithCompletionHandler:v28];
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Not log dumping since not on internal device", buf, 2u);
      }
    }
    goto LABEL_31;
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v37 = v15;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "logDumpAndSendMessage not allowed with error: %@", buf, 0xCu);
    }
    goto LABEL_17;
  }
LABEL_31:
}

- (BOOL)logDumpIsExpected
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDCKUtilities *)self _isLogDumpAllowed];
  BOOL v4 = [(IMDCKUtilities *)self deviceConditionsAllowPeriodicSync];
  BOOL v5 = [(IMDCKUtilities *)self _isRunningInAutomation];
  int v6 = v3 && v4 && !v5;
  if (IMOSLoggingEnabled())
  {
    BOOL v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = @"NO";
      if (v6) {
        BOOL v9 = @"YES";
      }
      else {
        BOOL v9 = @"NO";
      }
      if (v3) {
        BOOL v10 = @"YES";
      }
      else {
        BOOL v10 = @"NO";
      }
      int v13 = 138413058;
      BOOL v14 = v9;
      if (v4) {
        BOOL v11 = @"YES";
      }
      else {
        BOOL v11 = @"NO";
      }
      __int16 v15 = 2112;
      id v16 = v10;
      __int16 v17 = 2112;
      long long v18 = v11;
      if (v5) {
        BOOL v8 = @"YES";
      }
      __int16 v19 = 2112;
      long long v20 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Returning %@ for logDumpIsExpcted - _isLogDumpAllowed: %@, _isOnPowerAndWifi: %@, _isRunningInAutomation: %@", (uint8_t *)&v13, 0x2Au);
    }
  }
  return v6;
}

- (BOOL)logDumpIsNecessaryAfterSync
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v72 = [v3 isInternalInstall];

  BOOL v4 = IMGetCachedDomainValueForKey();
  if (![(IMDCKUtilities *)self logDumpIsExpected])
  {
LABEL_9:
    BOOL v33 = 0;
    goto LABEL_62;
  }
  if (!v4)
  {
    if (IMOSLoggingEnabled())
    {
      long long v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "For some reason we do not have the sync counts prior to syncing", buf, 2u);
      }
    }
    goto LABEL_9;
  }
  BOOL v5 = [(IMDCKUtilities *)self ckStatisticCalculations];
  uint64_t v6 = *MEMORY[0x1E4F6D258];
  BOOL v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6D258]];
  uint64_t v71 = [v7 unsignedIntegerValue];
  BOOL v8 = [v4 objectForKeyedSubscript:v6];
  uint64_t v70 = [v8 unsignedIntegerValue];

  uint64_t v9 = *MEMORY[0x1E4F6D250];
  BOOL v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6D250]];
  uint64_t v68 = [v10 unsignedIntegerValue];
  BOOL v11 = [v4 objectForKeyedSubscript:v9];
  uint64_t v66 = [v11 unsignedIntegerValue];

  uint64_t v12 = *MEMORY[0x1E4F6D248];
  int v13 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6D248]];
  uint64_t v65 = [v13 unsignedIntegerValue];
  BOOL v14 = [v4 objectForKeyedSubscript:v12];
  uint64_t v63 = [v14 unsignedIntegerValue];

  __int16 v15 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6D280]];
  uint64_t v69 = [v15 unsignedIntegerValue];
  id v16 = [v5 objectForKeyedSubscript:v6];
  uint64_t v67 = [v16 unsignedIntegerValue];

  __int16 v17 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6D270]];
  uint64_t v64 = [v17 unsignedIntegerValue];
  long long v18 = [v5 objectForKeyedSubscript:v9];
  uint64_t v19 = [v18 unsignedIntegerValue];

  long long v20 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6D268]];
  uint64_t v62 = [v20 unsignedIntegerValue];
  uint64_t v21 = [v5 objectForKeyedSubscript:v12];
  uint64_t v22 = [v21 unsignedIntegerValue];

  id v23 = [(IMDCKUtilities *)self syncState];
  uint64_t v24 = [v23 getAnalyticSyncDatesObjectForKey:*MEMORY[0x1E4F6CFE0]];
  LODWORD(v21) = v24 == 0;

  uint64_t v25 = [(IMDCKUtilities *)self syncState];
  uint64_t v26 = [v5 objectForKeyedSubscript:v6];
  if (v21)
  {
    [v25 setAnalyticSyncDatesDictionaryObject:v26 forKey:*MEMORY[0x1E4F6D070] shouldOverrideIfExists:1];

    int v34 = [(IMDCKUtilities *)self syncState];
    BOOL v35 = [v5 objectForKeyedSubscript:v9];
    [v34 setAnalyticSyncDatesDictionaryObject:v35 forKey:*MEMORY[0x1E4F6CEC8] shouldOverrideIfExists:1];

    long long v29 = [(IMDCKUtilities *)self syncState];
    long long v30 = [v5 objectForKeyedSubscript:v12];
    long long v31 = (void *)MEMORY[0x1E4F6CEB8];
  }
  else
  {
    [v25 setAnalyticSyncDatesDictionaryObject:v26 forKey:*MEMORY[0x1E4F6D078] shouldOverrideIfExists:1];

    v27 = [(IMDCKUtilities *)self syncState];
    id v28 = [v5 objectForKeyedSubscript:v9];
    [v27 setAnalyticSyncDatesDictionaryObject:v28 forKey:*MEMORY[0x1E4F6CED0] shouldOverrideIfExists:1];

    long long v29 = [(IMDCKUtilities *)self syncState];
    long long v30 = [v5 objectForKeyedSubscript:v12];
    long long v31 = (void *)MEMORY[0x1E4F6CEC0];
  }
  [v29 setAnalyticSyncDatesDictionaryObject:v30 forKey:*v31 shouldOverrideIfExists:1];

  if (v69 == v67 && v64 == v19 && v62 == v22)
  {
    unint64_t v36 = [MEMORY[0x1E4F1C9C8] date];
    if (IMOSLoggingEnabled())
    {
      __int16 v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v74 = v36;
        _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_INFO, "All items have been synced, noting down last complete synced DB date %@", buf, 0xCu);
      }
    }
    __int16 v38 = [(IMDCKUtilities *)self syncState];
    [v38 setAnalyticSyncDatesDictionaryObject:v36 forKey:*MEMORY[0x1E4F6CEE0] shouldOverrideIfExists:1];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v39 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      __int16 v40 = [NSNumber numberWithInteger:v64 - v19];
      v41 = [NSNumber numberWithInteger:v69 - v67];
      __int16 v42 = [NSNumber numberWithInteger:v62 - v22];
      *(_DWORD *)buf = 138412802;
      v74 = v40;
      __int16 v75 = 2112;
      v76 = v41;
      __int16 v77 = 2112;
      v78 = v42;
      _os_log_impl(&dword_1D967A000, v39, OS_LOG_TYPE_INFO, "Could not log db sync date because not all items synced: chatsLeftToSync %@ | messagesLeftToSync %@ | attachmentsLeftToSync %@", buf, 0x20u);
    }
  }
  uint64_t v43 = v71 - v70;
  uint64_t v44 = v65 - v63;
  if (v71 == v70) {
    unint64_t v45 = v71 - v70;
  }
  else {
    unint64_t v45 = v70 - v71;
  }
  BOOL v47 = v43 > 0 || v45 < 0x15;
  if (v65 == v63) {
    unint64_t v48 = v65 - v63;
  }
  else {
    unint64_t v48 = v63 - v65;
  }
  BOOL v50 = v44 > 0 || v48 < 0x15;
  uint64_t v51 = v68 - v66;
  if (IMOSLoggingEnabled())
  {
    v52 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v53 = [NSNumber numberWithInteger:v51];
      v54 = [NSNumber numberWithInteger:v43];
      v55 = [NSNumber numberWithInteger:v44];
      *(_DWORD *)buf = 138412802;
      v74 = v53;
      __int16 v75 = 2112;
      v76 = v54;
      __int16 v77 = 2112;
      v78 = v55;
      _os_log_impl(&dword_1D967A000, v52, OS_LOG_TYPE_INFO, "<StartSyncStats> syncedChatDifference %@ | syncedMessageDifference %@ | syncedAttachmentDifference %@ <EndSyncStats>", buf, 0x20u);
    }
  }
  BOOL v56 = v51 > 0 && v47 && v50;
  if (!v56 && IMOSLoggingEnabled())
  {
    v57 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      v58 = @"NO";
      if (v47) {
        v59 = @"YES";
      }
      else {
        v59 = @"NO";
      }
      if (v51 <= 0) {
        v60 = @"NO";
      }
      else {
        v60 = @"YES";
      }
      *(_DWORD *)buf = 138412802;
      v74 = v59;
      __int16 v75 = 2112;
      v76 = v60;
      if (v50) {
        v58 = @"YES";
      }
      __int16 v77 = 2112;
      v78 = v58;
      _os_log_impl(&dword_1D967A000, v57, OS_LOG_TYPE_INFO, "Log dump needed -- didn't sync enough items | syncedMessages %@ | syncedChats %@ | syncedAttachments %@", buf, 0x20u);
    }
  }
  BOOL v33 = v72 & !v56;
LABEL_62:

  return v33;
}

- (BOOL)PCSKeyRollPending
{
  if (qword_1EBE2BFC8 != -1) {
    dispatch_once(&qword_1EBE2BFC8, &unk_1F33905E0);
  }
  uint64_t v2 = (uint64_t (*)(__CFString *))off_1EBE2BFC0;
  if (!off_1EBE2BFC0) {
    return 0;
  }

  return v2(@"Messages3");
}

- (void)PCSKeyRollPendingAsync:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D96A28E4;
  block[3] = &unk_1E6B72F90;
  id v16 = v17;
  id v8 = v6;
  id v15 = v8;
  dispatch_after(v7, MEMORY[0x1E4F14428], block);
  uint64_t v9 = [(IMDCKUtilities *)self internalQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D96A291C;
  v11[3] = &unk_1E6B72FE0;
  id v12 = v8;
  int v13 = v17;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(v9, v11);

  _Block_object_dispose(v17, 8);
}

- (unsigned)PCSReportManateeStatus
{
  if (qword_1EA8CA3A8 != -1) {
    dispatch_once(&qword_1EA8CA3A8, &unk_1F3390600);
  }
  uint64_t v2 = (uint64_t (*)(__CFString *))off_1EA8CA3A0;
  if (off_1EA8CA3A0)
  {
    return v2(@"Engram");
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v5 = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Failed to weak link ProtectedCloudStorage, this should not happen", v5, 2u);
      }
    }
    return 0;
  }
}

- (void)PCSReportManateeStatusAsync:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D96A2DA8;
  block[3] = &unk_1E6B72F90;
  id v16 = v17;
  id v8 = v6;
  id v15 = v8;
  dispatch_after(v7, MEMORY[0x1E4F14428], block);
  uint64_t v9 = [(IMDCKUtilities *)self internalQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D96A2DE0;
  v11[3] = &unk_1E6B72FE0;
  id v12 = v8;
  int v13 = v17;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(v9, v11);

  _Block_object_dispose(v17, 8);
}

- (id)_accountManager
{
  if (qword_1EBE2BB00 != -1) {
    dispatch_once(&qword_1EBE2BB00, &unk_1F3390620);
  }
  uint64_t v2 = (void *)qword_1EBE2BAF8;

  return v2;
}

- (id)dsid
{
  BOOL v3 = (void *)MEMORY[0x1E016A370](self, a2);
  BOOL v4 = [(IMDCKUtilities *)self _accountStore];
  BOOL v5 = objc_msgSend(v4, "aa_primaryAppleAccount");

  id v6 = objc_msgSend(v5, "aa_personID");

  return v6;
}

- (id)_primaryAccountCountryCode
{
  BOOL v3 = [(IMDCKUtilities *)self _accountManager];
  uint64_t v4 = [v3 primaryAuthKitAccount];
  BOOL v5 = (void *)v4;
  id v6 = 0;
  if (v3 && v4)
  {
    dispatch_time_t v7 = [(IMDCKUtilities *)self _accountManager];
    id v6 = [v7 appleIDCountryCodeForAccount:v5];
  }

  return v6;
}

- (BOOL)_allowDestructiveMOCFeaturesBasedOnDSID
{
  return 1;
}

- (BOOL)deviceIsPhoneOrWatch
{
  uint64_t v2 = [MEMORY[0x1E4F61740] sharedInstance];
  BOOL v3 = [v2 deviceType] != 4;

  return v3;
}

- (BOOL)shouldAttemptMiCOnByDefault
{
  uint64_t v2 = [(IMDCKUtilities *)self serverBag];
  BOOL v3 = [v2 objectForKey:*MEMORY[0x1E4F6CF08]];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (BOOL)iCloudAccountMatchesiMessageAccount
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  BOOL v32 = [(IMDCKUtilities *)self deviceIsPhoneOrWatch];
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = @"NO";
      if (v32) {
        uint64_t v4 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = v4;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "is phone or watch: [%@]", buf, 0xCu);
    }
  }
  long long v30 = [(IMDCKUtilities *)self _primaryiCloudAccount];
  BOOL v5 = [(IMDCKUtilities *)self dsid];
  BOOL v33 = [NSString stringWithFormat:@"D:%@", v5];

  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = v33;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "iCloud DSID %@", buf, 0xCu);
    }
  }
  if (v30 && [(__CFString *)v33 length])
  {
    dispatch_time_t v7 = +[IMDServiceController sharedController];
    long long v29 = [v7 serviceWithName:*MEMORY[0x1E4F6E1B0]];

    id v8 = +[IMDAccountController sharedInstance];
    uint64_t v9 = [v8 accountsForService:v29];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v35;
      char v31 = v32;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v10);
          }
          BOOL v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = [v14 idsAccount];
            id v16 = [v15 profileID];
            if (v16 && [v15 accountType] == 1)
            {
              if (IMOSLoggingEnabled())
              {
                __int16 v17 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v39 = v16;
                  _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "iMessage account DSID %@", buf, 0xCu);
                }
              }
              char v18 = [(__CFString *)v16 isEqualToString:v33];
              int v19 = IMOSLoggingEnabled();
              if (v18)
              {
                if (v19)
                {
                  long long v20 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                  {
                    id v21 = [v15 profileID];
                    int v22 = [v14 isActive];
                    *(_DWORD *)buf = 138412802;
                    id v23 = @"NO";
                    if (v22) {
                      id v23 = @"YES";
                    }
                    uint64_t v39 = v33;
                    __int16 v40 = 2112;
                    id v41 = v21;
                    __int16 v42 = 2112;
                    uint64_t v43 = v23;
                    _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "We found one that matches up (icloud: %@, iMessage: %@), the ids account is active: [%@]", buf, 0x20u);
                  }
                }
                if (v32 || [v14 isActive])
                {

                  char v27 = 1;
                  goto LABEL_47;
                }
              }
              else
              {
                if (v19)
                {
                  uint64_t v24 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v25 = [v15 profileID];
                    *(_DWORD *)buf = 138412546;
                    uint64_t v39 = v33;
                    __int16 v40 = 2112;
                    id v41 = v25;
                    _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "iCloud account %@ and iMessage account %@ DO NOT match up", buf, 0x16u);
                  }
                }
                char v31 = 0;
              }
            }
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v27 = v32;
LABEL_47:
      char v31 = v27;
    }

    BOOL v26 = v31 & 1;
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (BOOL)signedIntoiCloudAccount
{
  uint64_t v2 = [(IMDCKUtilities *)self _primaryiCloudAccount];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)signedIntoiMessageAccount
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[IMDServiceController sharedController];
  BOOL v3 = [v2 serviceWithName:*MEMORY[0x1E4F6E1B0]];

  uint64_t v4 = +[IMDAccountController sharedInstance];
  BOOL v5 = [v4 accountsForService:v3];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = objc_msgSend(v10, "idsAccount", (void)v13);
          if [v11 accountType] == 1 && (objc_msgSend(v11, "isActive"))
          {

            LOBYTE(v7) = 1;
            goto LABEL_14;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v7;
}

- (BOOL)signedIntoiCloudAndiMessageAndiCloudAccountMatchesiMessageAccount
{
  BOOL v3 = [(IMDCKUtilities *)self _primaryiCloudAccount];
  if (v3)
  {
    uint64_t v4 = [(IMDCKUtilities *)self dsid];
    BOOL v5 = [v4 length] == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  BOOL v6 = [(IMDCKUtilities *)self signedIntoiMessageAccount];
  if (v5 || !v6) {
    return 0;
  }

  return [(IMDCKUtilities *)self iCloudAccountMatchesiMessageAccount];
}

- (void)downgradingFromHSA2AndDisablingMOC
{
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "/**---DISABLING MESSAGES ON ICLOUD---**/", v4, 2u);
    }
  }
  IMSetDomainBoolForKey();
  [(IMDCKUtilities *)self setCloudKitSyncingEnabled:0];
}

- (void)eligibleForTruthZoneWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Fetching eligibility for truth zone before attempting to sync", buf, 2u);
    }
  }
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1D96A3CD4;
  v12[3] = &unk_1E6B72D40;
  long long v14 = &v15;
  uint64_t v7 = v6;
  long long v13 = v7;
  [(IMDCKUtilities *)self fetchCloudKitAccountStatusWithCompletion:v12];
  dispatch_time_t v8 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    *((unsigned char *)v16 + 24) = 0;
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "***** Timed out checking truth zone eligibility *******", buf, 2u);
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if (*((unsigned char *)v16 + 24)) {
        uint64_t v11 = @"YES";
      }
      else {
        uint64_t v11 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      long long v20 = v11;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "eligibleForTruthZone %@", buf, 0xCu);
    }
  }
  if (v4) {
    v4[2](v4, *((unsigned __int8 *)v16 + 24));
  }

  _Block_object_dispose(&v15, 8);
}

- (BOOL)isInCloudKitDemoMode
{
  if (qword_1EA8CA3B8 != -1) {
    dispatch_once(&qword_1EA8CA3B8, &unk_1F3390640);
  }
  return byte_1EA8CA3B0;
}

- (void)disableAllDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Attempt to disable MiC across all devices", buf, 2u);
    }
  }
  IMSetDomainBoolForKey();
  dispatch_semaphore_t v6 = [(IMDCKUtilities *)self exitManager];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = sub_1D96A3F7C;
  v9[3] = &unk_1E6B73030;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v6 writeExitRecordWithDate:v7 completion:v9];
}

+ (id)im_AKSecurityLevelKey
{
  if (qword_1EA8CA3C8 != -1) {
    dispatch_once(&qword_1EA8CA3C8, &unk_1F3390660);
  }
  uint64_t v2 = (void *)qword_1EA8CA3C0;

  return v2;
}

+ (id)_idsAccountController
{
  if (qword_1EBE2BCA8 != -1) {
    dispatch_once(&qword_1EBE2BCA8, &unk_1F3390680);
  }
  uint64_t v2 = (void *)qword_1EBE2BCA0;

  return v2;
}

+ (id)readAliasesFromDefaults
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"IMD-IDS-Aliases" inDomain:*MEMORY[0x1E4F6CF00]];

  if (v3)
  {
    id v4 = [v3 allKeys];
    if ([v4 containsObject:@"allAliases"])
    {
      BOOL v5 = [v3 allKeys];
      if ([v5 containsObject:@"selectedAliases"])
      {
        v14[0] = @"allAliases";
        dispatch_semaphore_t v6 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v7 = [v3 objectForKey:@"allAliases"];
        id v8 = [v6 setWithArray:v7];
        v14[1] = @"selectedAliases";
        v15[0] = v8;
        uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
        id v10 = [v3 objectForKey:@"selectedAliases"];
        uint64_t v11 = [v9 setWithArray:v10];
        v15[1] = v11;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)calculateAliasesForDefaults
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Calculating selected/all aliases", buf, 2u);
    }
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  dispatch_semaphore_t v6 = [MEMORY[0x1E4F6E660] IMPhoneNumbersEnabledForMultipleSubscriptionDevice];
  if ([v6 count])
  {
    [v4 addObjectsFromArray:v6];
    [v5 addObjectsFromArray:v6];
  }
  uint64_t v7 = [a1 _idsAccountController];
  id v8 = [v7 accounts];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "im_registeredURIs", (void)v20);
        if ([v14 count]) {
          [v4 addObjectsFromArray:v14];
        }
        uint64_t v15 = [v13 vettedAliases];
        if ([v15 count]) {
          [v5 addObjectsFromArray:v15];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v10);
  }

  v25[0] = @"allAliases";
  long long v16 = [v5 allObjects];
  v25[1] = @"selectedAliases";
  v26[0] = v16;
  uint64_t v17 = [v4 allObjects];
  v26[1] = v17;
  char v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  return v18;
}

+ (void)calculateAndSaveAliasesToDefaults
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 calculateAliasesForDefaults];
  int v3 = IMOSLoggingEnabled();
  id v4 = (void *)MEMORY[0x1E4F6CF00];
  if (v3)
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *v4;
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v2;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Saving (domain %@) selected aliases %@", (uint8_t *)&v8, 0x16u);
    }
  }
  uint64_t v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v7 setObject:v2 forKey:@"IMD-IDS-Aliases" inDomain:*v4];
}

+ (void)addConditionChecks:(unint64_t)a3 toCriteria:(id)a4
{
  id v5 = a4;
  xpc_object_t xdict = v5;
  if (a3 != 1)
  {
    if (a3 != 2) {
      goto LABEL_5;
    }
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14330], 1);
  }
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14138], 0);
  id v5 = xdict;
LABEL_5:
}

- (void)setDidKeyRollPendingCheck:(BOOL)a3
{
  self->_didKeyRollPendingCheck = a3;
}

- (void)setLockdownManager:(id)a3
{
}

- (void)setServerBag:(id)a3
{
}

- (void)setDeviceSupport:(id)a3
{
}

- (void)setImDefaults:(id)a3
{
}

- (void)setTelemetryReporter:(id)a3
{
}

- (BOOL)useDeprecatedApi
{
  return self->_useDeprecatedApi;
}

- (void)setUseDeprecatedApi:(BOOL)a3
{
  self->_useDeprecatedApuint64_t i = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryReporter, 0);
  objc_storeStrong((id *)&self->_imDefaults, 0);
  objc_storeStrong((id *)&self->_deviceSupport, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_lockdownManager, 0);

  objc_storeStrong((id *)&self->_syncState, 0);
}

@end