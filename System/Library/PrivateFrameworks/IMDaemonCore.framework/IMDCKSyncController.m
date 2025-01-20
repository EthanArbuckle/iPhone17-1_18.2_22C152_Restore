@interface IMDCKSyncController
+ (BOOL)initialSyncAllowed;
+ (IMDCKSyncController)sharedInstance;
- (BOOL)_accountHasMultipleDevices;
- (BOOL)_chatSyncedRecently;
- (BOOL)_completedPeriodicSyncSinceFirstFullSyncForLastSyncDate:(id)a3 firstFullSyncCompletedDate:(id)a4;
- (BOOL)_didUpgradeOrRestoreFromBackup;
- (BOOL)_errorIndicatesDeviceNotGoodForSync:(id)a3;
- (BOOL)_handleSyncFailureType:(int64_t)a3 step:(int64_t)a4 activity:(id)a5 attemptCount:(unint64_t)a6 startTime:(id)a7 error:(id)a8 retry:(id)a9;
- (BOOL)_hasDumpedLogsInPastHour;
- (BOOL)_hasDumpedRestoreFailureLogsInPastHour;
- (BOOL)_hasTriedToEnableMiCByDefault;
- (BOOL)_serverAllowsUIRefreshTimerWhileSyncing;
- (BOOL)_serverAllowsUIRefreshWhileSyncing;
- (BOOL)_serverDeniesDailySyncStateAnalytics;
- (BOOL)_serverDeniesPeriodicSyncAnalytics;
- (BOOL)_serverDoesNotAllowComingBackOnlineChatSync;
- (BOOL)_serverDoesNotSingleDeviceLimitation;
- (BOOL)_shouldEnableMiCByDefaultUponReinstallation;
- (BOOL)_syncNotCompletedRecently;
- (BOOL)_withinAnHourOfLogDumpHour;
- (BOOL)isFetchingExitForEnablement;
- (BOOL)logCloudKitAnalytics;
- (BOOL)shouldMarkAllIncompatibleMessagesForDeletion;
- (BOOL)shouldReloadConversations;
- (BOOL)verifyAccountsMatchForMoc;
- (IMDCKSyncController)init;
- (IMStateCaptureAssistant)stateCaptureAssistant;
- (IMSyncResumer)syncResumer;
- (IMTimer)nightlySyncTimer;
- (NSDate)lastLogDumpDate;
- (NSDate)lastRestoreFailureLogDumpDate;
- (NSDate)syncStartDate;
- (NSTimer)longRunningSyncTimer;
- (NSTimer)reloadTimer;
- (double)_IMAHDAgentFallbackIntervalInSeconds;
- (double)_minimumChatComingOnlineSyncInterval;
- (double)_retryIntervalToEnableMicByDefaultForAttempt:(int)a3;
- (double)reloadTimeInterval;
- (id)_dailySyncStateDictionary;
- (id)_dateForNext24LogDumpAtHour:(int64_t)a3 timeNow:(id)a4 dumpNow:(BOOL *)a5;
- (id)_keychainError;
- (id)_keychainErrorWithCause:(id)a3;
- (id)_periodicSyncStateDictionary;
- (id)_recordManager;
- (id)_retryError;
- (id)_sharedDatabaseManager;
- (id)_stringForDate:(id)a3 withFormatter:(id)a4;
- (id)_stringForObject:(id)a3;
- (id)attachmentSyncController;
- (id)backupController;
- (id)chatSyncController;
- (id)exitManager;
- (id)initialAttachmentSyncController;
- (id)initialMessageSyncController;
- (id)messageSyncController;
- (id)recoverableMessageSyncController;
- (id)stateDictionaryForDiagnosticsRequest;
- (id)syncStateDebuggingInfo:(id)a3;
- (id)updateSyncController;
- (int)_maxRetryAttemptsToEnableMiCByDefault;
- (int64_t)_manualSyncAttemptCount;
- (int64_t)_periodicSyncAttemptCount;
- (int64_t)initialSyncAttempts;
- (int64_t)syncControllerRecordType;
- (unint64_t)_currentHour;
- (unint64_t)_maxTimeToDeferInSeconds;
- (void)_addDatesDefaultsIfNeededToDictionary:(id)a3;
- (void)_addDatesDefaultsIfNeededToDictionary:(id)a3 keys:(id)a4;
- (void)_attemptToEnableMiCByDefaultOnce;
- (void)_attemptToEnableMiCByDefaultOnceAttempt:(int)a3;
- (void)_attemptToMigrateACAccountEnablementOnce;
- (void)_autoBugCaptureWithSubType:(id)a3 debugDescription:(id)a4;
- (void)_beginExitStateCleanupIfNeededWithActivity:(id)a3;
- (void)_beginPeriodicSyncWithActivity:(id)a3 attemptCount:(unint64_t)a4;
- (void)_beginPeriodicSyncWithActivity:(id)a3 attemptCount:(unint64_t)a4 syncChatsCompletionBlock:(id)a5;
- (void)_callSyncWithCompletion:(id)a3 activity:(id)a4;
- (void)_clearTombstonesWithActivity:(id)a3;
- (void)_deleteRestoreFailuresDirectory;
- (void)_didPassAccountAndIdentityUpdateNeeds;
- (void)_dispatchNotification:(id)a3 withBlock:(id)a4;
- (void)_iCloudAccountDidChange:(id)a3;
- (void)_ifCloudKitAbleToSyncWithActivity:(id)a3 callBlock:(id)a4;
- (void)_kickOffNightlyPeriodicSyncIfApplicable;
- (void)_needsSyncOnAccountUpdate;
- (void)_needsSyncOnIdentityUpdate;
- (void)_nightlySyncTimerFired;
- (void)_noteMeticsForSyncEndedWithSuccces:(BOOL)a3;
- (void)_noteMetricsForSyncStartFrom:(id)a3 fullSync:(BOOL)a4;
- (void)_noteSyncStarted:(BOOL)a3;
- (void)_nukeCKData;
- (void)_postMetricsToCloudKitOnAutomaticHistoryDeletionAgentLaunch;
- (void)_refreshUIWhileSyncing;
- (void)_reloadChatRegistryOnMainThread;
- (void)_resetSyncStateAndAttemptCounts;
- (void)_setHasTriedToEnableMiCByDefault;
- (void)_submitCloudKitAnalyticWithOperationGroupName:(id)a3 analyticDictionary:(id)a4;
- (void)_syncChatsWithActivity:(id)a3;
- (void)_syncRecoverableMessagesToCloudKitWithActivity:(id)a3 syncAttemptCount:(unint64_t)a4 startTime:(id)a5 syncCompletionBlock:(id)a6 retryCompletionBock:(id)a7;
- (void)_writeDownSyncDate;
- (void)beginChatSyncPeriodic:(BOOL)a3 activity:(id)a4;
- (void)beginComingBackOnlineSyncWithActivity:(id)a3;
- (void)beginInitialSyncAttemptCount:(unint64_t)a3 withActivity:(id)a4;
- (void)beginInitialSyncWithActivity:(id)a3;
- (void)beginPeriodicSyncWithActivity:(id)a3;
- (void)beginPeriodicSyncWithChecks:(unint64_t)a3 priority:(const char *)a4 reason:(id)a5;
- (void)beginUserInitiatedSync;
- (void)clearAnalyticDefaultsAndLocalSyncState;
- (void)clearCKRelatedDefaults;
- (void)clearLocalCloudKitSyncState;
- (void)collectLogsIfNeeded;
- (void)dealloc;
- (void)eventStreamHandler:(id)a3 didReceiveEventWithName:(id)a4 userInfo:(id)a5;
- (void)handleAKUserInfoChangedNotification:(id)a3;
- (void)idsAccountsDidChange;
- (void)kickOffCloudKitSyncIfNeededOnImagentLaunch;
- (void)kickOffEagerSyncIfApplicable;
- (void)performInitialSyncOnFirstConnectionOfImagentIfNeeded;
- (void)performOneTimeAccountUpgradeCheckIfNeeded;
- (void)recordMetricIsCloudKitEnabled;
- (void)refreshUIIfApplicableWithBatchCount:(unint64_t)a3;
- (void)registerCloudSyncDependencies;
- (void)registerForAccountNotifications;
- (void)resumeSyncOnLaunchIfNeeded;
- (void)scheduleAttachmentAssetDownload;
- (void)sendRestoreFailuresLogDumps;
- (void)sendRestoreFailuresLogDumpsIfNeeded;
- (void)setInitialSyncAttempts:(int64_t)a3;
- (void)setIsFetchingExitForEnablement:(BOOL)a3;
- (void)setLastLogDumpDate:(id)a3;
- (void)setLastRestoreFailureLogDumpDate:(id)a3;
- (void)setLongRunningSyncTimer:(id)a3;
- (void)setNightlySyncTimer:(id)a3;
- (void)setReloadTimer:(id)a3;
- (void)setShouldReloadConversations:(BOOL)a3;
- (void)setStateCaptureAssistant:(id)a3;
- (void)setSyncResumer:(id)a3;
- (void)setSyncStartDate:(id)a3;
- (void)syncAttachmentMetadataFirstSyncWithActivity:(id)a3 deviceConditionsToCheck:(unint64_t)a4 completionBlock:(id)a5;
- (void)syncChatsWithMessageContext:(id)a3;
- (void)syncController:(id)a3 syncBatchCompleted:(unint64_t)a4;
- (void)syncCoordinatorFinishedFetchingRecordsOfType:(int64_t)a3 name:(id)a4 identifier:(id)a5 count:(int64_t)a6 error:(id)a7;
- (void)syncCoordinatorFinishedSyncWithName:(id)a3 identifier:(id)a4 error:(id)a5;
- (void)syncCoordinatorStartedSyncWithName:(id)a3 identifier:(id)a4;
- (void)syncCoordinatorWaitingForImportToFinishWithName:(id)a3 identifier:(id)a4;
- (void)syncDeletesToCloudKitWithActivity:(id)a3 completion:(id)a4;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)systemDidUnlock;
- (void)updateSecurityLevelDowngradedIfNeeded:(id)a3;
@end

@implementation IMDCKSyncController

- (void)performInitialSyncOnFirstConnectionOfImagentIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (IMGetDomainBoolForKeyWithDefaultValue()) {
    int v3 = 1;
  }
  else {
    int v3 = IMGetDomainBoolForKeyWithDefaultValue();
  }
  int v4 = IMGetDomainBoolForKey();
  v5 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int v6 = [v5 cloudKitSyncingEnabled];

  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = @"NO";
      if (v3) {
        v9 = @"YES";
      }
      else {
        v9 = @"NO";
      }
      if (v4) {
        v10 = @"YES";
      }
      else {
        v10 = @"NO";
      }
      int v12 = 138412802;
      v13 = v9;
      __int16 v14 = 2112;
      v15 = v10;
      if (v6) {
        v8 = @"YES";
      }
      __int16 v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "performInitialSyncOnFirstConnectionOfImagentIfNeeded {hasPerformedInitialSync: %@ hasTriedToEnableCKAndSyncForFirstTime: %@ cloudKitEnabled: %@", (uint8_t *)&v12, 0x20u);
    }
  }
  if ((v3 & 1) == 0)
  {
    if ((v4 | v6))
    {
      if (v6) {
        [(IMDCKSyncController *)self beginInitialSyncWithActivity:0];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "This is our first time connecting to imagent on this device (either first time ever or from a restore) and cloudkit is disabled --- will attempt to enable and perform initial sync -- we won't do this again", (uint8_t *)&v12, 2u);
        }
      }
      IMSetDomainBoolForKey();
    }
  }
}

+ (IMDCKSyncController)sharedInstance
{
  if (qword_1EBE2B8D0 != -1) {
    dispatch_once(&qword_1EBE2B8D0, &unk_1F3391B80);
  }
  v2 = (void *)qword_1EBE2BA10;

  return (IMDCKSyncController *)v2;
}

- (void)syncCoordinatorStartedSyncWithName:(id)a3 identifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Kicked off sync with name: %@, identifier: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)syncCoordinatorFinishedSyncWithName:(id)a3 identifier:(id)a4 error:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    __int16 v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412802;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Finished sync with name: %@, identifier: %@, and error: %@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)syncCoordinatorFinishedFetchingRecordsOfType:(int64_t)a3 name:(id)a4 identifier:(id)a5 count:(int64_t)a6 error:(id)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = 134219010;
      int64_t v16 = a6;
      __int16 v17 = 2112;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      __int16 v21 = 2048;
      int64_t v22 = a3;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Finished fetching (%ld) records for sync with name: %@, identifier %@ of type %ld (%@)", (uint8_t *)&v15, 0x34u);
    }
  }
}

- (void)syncCoordinatorWaitingForImportToFinishWithName:(id)a3 identifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Sync waiting for importer to finish with name: %@, identifier: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (id)messageSyncController
{
  int v3 = +[IMDCKMessageSyncController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D97F95F8;
  v7[3] = &unk_1E6B73218;
  id v4 = v3;
  id v8 = v4;
  id v9 = self;
  if (qword_1EBE2BCC8 != -1) {
    dispatch_once(&qword_1EBE2BCC8, v7);
  }
  id v5 = v4;

  return v5;
}

- (id)initialMessageSyncController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97F9698;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  if (qword_1EA8CA5E0 != -1) {
    dispatch_once(&qword_1EA8CA5E0, block);
  }
  return (id)qword_1EA8CA5D8;
}

- (id)chatSyncController
{
  return +[IMDCKChatSyncController sharedInstance];
}

- (id)exitManager
{
  return +[IMDCKExitManager sharedInstance];
}

- (id)attachmentSyncController
{
  int v3 = +[IMDCKAttachmentSyncController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D97F97CC;
  v7[3] = &unk_1E6B73218;
  id v4 = v3;
  id v8 = v4;
  id v9 = self;
  if (qword_1EBE2BCB0 != -1) {
    dispatch_once(&qword_1EBE2BCB0, v7);
  }
  id v5 = v4;

  return v5;
}

- (id)updateSyncController
{
  int v3 = +[IMDCKUpdateSyncController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D97F98A0;
  v7[3] = &unk_1E6B73218;
  id v4 = v3;
  id v8 = v4;
  id v9 = self;
  if (qword_1EA8CA5E8 != -1) {
    dispatch_once(&qword_1EA8CA5E8, v7);
  }
  id v5 = v4;

  return v5;
}

- (id)recoverableMessageSyncController
{
  return +[IMDCKRecoverableMessageSyncController sharedInstance];
}

- (id)initialAttachmentSyncController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97F994C;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  if (qword_1EA8CA5F8 != -1) {
    dispatch_once(&qword_1EA8CA5F8, block);
  }
  return (id)qword_1EA8CA5F0;
}

- (id)backupController
{
  return +[IMDCKBackupController sharedInstance];
}

- (int64_t)syncControllerRecordType
{
  return 0;
}

- (unint64_t)_maxTimeToDeferInSeconds
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  int v3 = [v2 objectForKey:@"ck-client-max-time-to-defer-nightly-sync"];
  unint64_t v4 = [v3 unsignedIntegerValue];
  if (v4)
  {
    unint64_t v5 = arc4random() % v4;
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [NSNumber numberWithUnsignedInteger:v5];
        int v11 = 138412290;
        uint64_t v12 = v7;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Max Time to defer from server bag %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [NSNumber numberWithUnsignedInteger:0];
        int v11 = 138412290;
        uint64_t v12 = v9;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Max Time to defer default value %@", (uint8_t *)&v11, 0xCu);
      }
    }
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)_postMetricsToCloudKitOnAutomaticHistoryDeletionAgentLaunch
{
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unint64_t v5 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "_postMetricsToCloudKitOnAutomaticHistoryDeletionAgentLaunch", v5, 2u);
    }
  }
  if (![(IMDCKAbstractSyncController *)self isSyncing])
  {
    unint64_t v4 = [(IMDCKSyncController *)self exitManager];
    [v4 sendCloudKitZoneFetchRequestToNoteFeatureIsOn];
  }
}

- (void)idsAccountsDidChange
{
  if ([(IMDCKSyncController *)self verifyAccountsMatchForMoc])
  {
    int v3 = [(IMDCKAbstractSyncController *)self ckUtilities];
    char v4 = [v3 cloudKitSyncingEnabled];

    if ((v4 & 1) == 0) {
      [(IMDCKSyncController *)self _attemptToEnableMiCByDefaultOnce];
    }
    [(IMDCKSyncController *)self _attemptToMigrateACAccountEnablementOnce];
  }
}

- (void)_iCloudAccountDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int v6 = [v5 cloudKitSyncingEnabled];

  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = @"NO";
      if (v6) {
        id v8 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Received iCloud Account change notification, syncing enabled: %@", buf, 0xCu);
    }
  }
  id v9 = [(IMDCKAbstractSyncController *)self ckUtilities];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1D97F9E4C;
  v10[3] = &unk_1E6B771B8;
  char v11 = v6;
  v10[4] = self;
  [v9 fetchCloudKitAccountStatusAndUpdateEligibilityAndNeedsRepairStatusWithCompletion:v10];
}

- (BOOL)_didUpgradeOrRestoreFromBackup
{
  v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  char v3 = [v2 getBoolFromDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CEF8]];

  return v3;
}

- (BOOL)_hasTriedToEnableMiCByDefault
{
  v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  char v3 = [v2 getValueFromDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF10]];

  if (v3) {
    BOOL v4 = (int)[v3 intValue] > 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_setHasTriedToEnableMiCByDefault
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v2 setValue:&unk_1F33C5DF0 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF10]];
}

- (void)_attemptToEnableMiCByDefaultOnce
{
}

- (void)_attemptToEnableMiCByDefaultOnceAttempt:(int)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ([(IMDCKSyncController *)self _hasTriedToEnableMiCByDefault])
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Enable MiC by default: already tried, skipping", buf, 2u);
    }
LABEL_51:

    return;
  }
  int v6 = [(IMDCKAbstractSyncController *)self ckUtilities];
  char v7 = [v6 signedIntoiCloudAccount];

  if ((v7 & 1) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Enable MiC by default: needs icloud login, skipping", buf, 2u);
    }
    goto LABEL_51;
  }
  id v8 = [(IMDCKAbstractSyncController *)self ckUtilities];
  if ([v8 deviceIsPhoneOrWatch])
  {
  }
  else
  {
    id v9 = [(IMDCKAbstractSyncController *)self ckUtilities];
    char v10 = [v9 signedIntoiMessageAccount];

    if ((v10 & 1) == 0)
    {
      if (!IMOSLoggingEnabled()) {
        return;
      }
      unint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Enable MiC by default: needs iMessage login, skipping", buf, 2u);
      }
      goto LABEL_51;
    }
  }
  char v11 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  int v12 = [v11 isUnderFirstDataProtectionLock];

  if (v12)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Enable MiC by default: isUnderFirstUnlock, deferring to unlock", buf, 2u);
      }
    }
    uint64_t v14 = [MEMORY[0x1E4F6E720] sharedInstance];
    [v14 setBool:1 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CEF0]];

    return;
  }
  int v15 = +[IMDCKUtilities sharedInstance];
  int v16 = [v15 shouldAttemptMiCOnByDefault];

  if (IMOSLoggingEnabled())
  {
    __int16 v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = v16;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Enable MiC by default: shouldAttemptMiCOnByDefault %d", buf, 8u);
    }
  }
  if ((v16 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Enable MiC by default: we are not onboarding new users, we won't check again", buf, 2u);
      }
    }
    goto LABEL_62;
  }
  id v18 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int v19 = [v18 cloudKitSyncingEnabled];

  BOOL v20 = [(IMDCKSyncController *)self _didUpgradeOrRestoreFromBackup];
  __int16 v21 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int v22 = [v21 iCloudAccountMatchesiMessageAccount];

  BOOL v23 = [(IMDCKSyncController *)self _shouldEnableMiCByDefaultUponReinstallation];
  if (IMOSLoggingEnabled())
  {
    id v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = @"YES";
      if (v19) {
        v26 = @"YES";
      }
      else {
        v26 = @"NO";
      }
      *(_DWORD *)buf = 138413314;
      v35 = v26;
      if (v20) {
        v27 = @"YES";
      }
      else {
        v27 = @"NO";
      }
      __int16 v36 = 2112;
      v37 = v27;
      if (v22) {
        v28 = @"YES";
      }
      else {
        v28 = @"NO";
      }
      __int16 v38 = 2112;
      v39 = v28;
      if (!v23) {
        uint64_t v25 = @"NO";
      }
      __int16 v40 = 2112;
      v41 = @"NO";
      __int16 v42 = 2112;
      v43 = v25;
      _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Enable MiC by default: isSyncingEnabled %@ didRestore %@ accountsMatch %@ hasEnabled %@, MiC was enabled before uninstalling %@", buf, 0x34u);
    }
  }
  if (((v19 | v20) & 1) != 0 || ((v22 ^ 1) & 1) != 0 || !v23)
  {
    if (IMOSLoggingEnabled())
    {
      v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v35) = a3;
        _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Enable MiC by default: criteria do not allow enablement on attempt %d, will not enable, won't try again.", buf, 8u);
      }
    }
LABEL_62:
    [(IMDCKSyncController *)self _setHasTriedToEnableMiCByDefault];
    return;
  }
  if ([(IMDCKSyncController *)self isFetchingExitForEnablement])
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Enable MiC by default: Already fetching exit record, exiting early", buf, 2u);
    }
    goto LABEL_51;
  }
  [(IMDCKSyncController *)self setIsFetchingExitForEnablement:1];
  v30 = +[IMDCKExitManager sharedInstance];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1D97FA8A8;
  v32[3] = &unk_1E6B77208;
  v32[4] = self;
  int v33 = a3;
  [v30 exitRecordDateWithCompletion:v32];
}

- (BOOL)_shouldEnableMiCByDefaultUponReinstallation
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Messages.InstallationState"];
  char v3 = [v2 BOOLForKey:@"micWasEnabled"];
  char v4 = [v2 BOOLForKey:*MEMORY[0x1E4F6CEF8]] ^ 1 | v3;

  return v4;
}

- (double)_retryIntervalToEnableMicByDefaultForAttempt:(int)a3
{
  return (double)(a3 + 1) * 60.0;
}

- (int)_maxRetryAttemptsToEnableMiCByDefault
{
  id v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  char v3 = [v2 objectForKey:*MEMORY[0x1E4F6CF40]];

  if (v3 && (int)[v3 intValue] >= 1) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 5;
  }

  return v4;
}

- (void)registerForAccountNotifications
{
  if (IMOSLoggingEnabled())
  {
    char v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Registering for account notifications", buf, 2u);
    }
  }
  int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__iCloudAccountDidChange_ name:*MEMORY[0x1E4F19BE0] object:0];

  if (IMOSLoggingEnabled())
  {
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Registered for cloudkit account change notifications", v6, 2u);
    }
  }
}

- (void)_attemptToMigrateACAccountEnablementOnce
{
  id v2 = +[IMDCKUtilities sharedInstance];
  [v2 repairACAccountEnablementStatusIfNeeded];
}

- (id)_dateForNext24LogDumpAtHour:(int64_t)a3 timeNow:(id)a4 dumpNow:(BOOL *)a5
{
  unint64_t v5 = 0;
  if ((unint64_t)a3 <= 0x18 && a4)
  {
    id v8 = (void *)MEMORY[0x1E4F1C9A8];
    id v9 = a4;
    char v10 = [v8 currentCalendar];
    char v11 = [MEMORY[0x1E4F1C9C8] date];
    unint64_t v5 = [v10 dateBySettingHour:a3 minute:0 second:0 ofDate:v11 options:0];

    [v5 timeIntervalSinceDate:v9];
    double v13 = v12;

    if (v13 <= 0.0)
    {
      uint64_t v14 = [v5 dateByAddingTimeInterval:86400.0];

      *a5 = v13 > -3600.0;
      unint64_t v5 = (void *)v14;
    }
  }

  return v5;
}

- (void)_dispatchNotification:(id)a3 withBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 cStringUsingEncoding:4];
  IMDispatchForNotify();
}

- (double)_IMAHDAgentFallbackIntervalInSeconds
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  char v3 = [v2 objectForKey:@"ck-imahd-sync-interval"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4 * 60.0 * 60.0;
  }
  else
  {
    double v5 = 43200.0;
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      char v7 = [NSNumber numberWithDouble:v5];
      int v9 = 138412290;
      char v10 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "_IMAHDAgentFallbackInterval %@", (uint8_t *)&v9, 0xCu);
    }
  }

  return v5;
}

- (BOOL)_syncNotCompletedRecently
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v3 = [(IMDCKAbstractSyncController *)self syncState];
  double v4 = [v3 lastSyncDate];

  double v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;
  BOOL v9 = 1;
  if (v4)
  {
    [(IMDCKSyncController *)self _IMAHDAgentFallbackIntervalInSeconds];
    if (v7 <= v8) {
      BOOL v9 = 0;
    }
  }
  if (IMOSLoggingEnabled())
  {
    char v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [NSNumber numberWithDouble:v7];
      double v12 = (void *)v11;
      double v13 = @"NO";
      int v15 = 138412802;
      int v16 = v4;
      __int16 v17 = 2112;
      if (v9) {
        double v13 = @"YES";
      }
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      BOOL v20 = v13;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Last synced date %@ timeInterval %@, syncNotCompletedRecently %@", (uint8_t *)&v15, 0x20u);
    }
  }

  return v9;
}

- (void)_kickOffNightlyPeriodicSyncIfApplicable
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  IMSetDomainBoolForKey();
  double v3 = (double)[(IMDCKSyncController *)self _maxTimeToDeferInSeconds];
  if (IMOSLoggingEnabled())
  {
    double v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 134217984;
      double v8 = v3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Scheduling nightlySyncTimer. Firing time: in %f sec.", (uint8_t *)&v7, 0xCu);
    }
  }
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F6C3F0]) initWithTimeInterval:0 name:1 shouldWake:self target:sel__nightlySyncTimerFired selector:0 userInfo:v3];
  [(IMDCKSyncController *)self setNightlySyncTimer:v5];

  double v6 = [MEMORY[0x1E4F6E810] sharedInstance];
  [v6 dumpMOCLoggingMetaData];
}

- (void)_nightlySyncTimerFired
{
  if (IMOSLoggingEnabled())
  {
    double v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "nightlySyncTimer fired", v9, 2u);
    }
  }
  double v4 = +[IMDCKUtilities sharedInstance];
  [v4 repairACAccountEnablementStatusIfNeeded];

  double v5 = [MEMORY[0x1E4F1C9C8] date];
  IMSetDomainValueForKey();

  double v6 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int v7 = [v6 deviceConditions];
  IMSetDomainValueForKey();

  IMSetDomainBoolForKey();
  +[IMDCKUtilities calculateAndSaveAliasesToDefaults];
  double v8 = [(IMDCKSyncController *)self nightlySyncTimer];
  [v8 invalidate];

  [(IMDCKSyncController *)self setNightlySyncTimer:0];
}

- (void)kickOffEagerSyncIfApplicable
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [(IMDCKAbstractSyncController *)self ckUtilities];
  char v3 = [v2 cloudKitSyncingEnabled];

  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      double v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        double v6 = [NSNumber numberWithDouble:10.0];
        int v8 = 138412290;
        uint64_t v9 = v6;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "attempting to kick off an eager sync in %@ seconds", (uint8_t *)&v8, 0xCu);
      }
    }
    im_dispatch_after();
  }
  else if (v4)
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Ignoring request to kick off of eager sync, since syncing is disabled", (uint8_t *)&v8, 2u);
    }
  }
}

- (IMDCKSyncController)init
{
  v29.receiver = self;
  v29.super_class = (Class)IMDCKSyncController;
  id v2 = [(IMDCKSyncController *)&v29 init];
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      char v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Init IMDCKSyncController", buf, 2u);
      }
    }
    int v4 = [(IMDCKAbstractSyncController *)v2 syncState];
    [v4 clearLocalCloudKitSyncState];

    [(IMDCKSyncController *)v2 registerForAccountNotifications];
    id v5 = objc_alloc(MEMORY[0x1E4F6EA48]);
    double v6 = (void *)[v5 initWithObject:v2 title:@"MiC State" queue:MEMORY[0x1E4F14428]];
    [(IMDCKSyncController *)v2 setStateCaptureAssistant:v6];

    if ((IMIsRunningInUnitTesting() & 1) == 0)
    {
      int v7 = +[IMDDistributedNotificationXPCEventStreamHandler sharedInstance];
      int v8 = (void *)MEMORY[0x1E4F14428];
      [v7 addDelegate:v2 queue:MEMORY[0x1E4F14428]];
    }
    uint64_t v9 = *MEMORY[0x1E4F6D038];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1D97FBE80;
    v26[3] = &unk_1E6B76280;
    uint64_t v10 = v2;
    v27 = v10;
    [(IMDCKSyncController *)v10 _dispatchNotification:v9 withBlock:v26];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)sub_1D97FBF1C, @"com.apple.protectedcloudstorage.roll.Messages3", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    double v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v12, v10, (CFNotificationCallback)sub_1D97FBFC8, @"com.apple.ProtectedCloudStorage.mobileBackupStateChange", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    double v13 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v13, v10, (CFNotificationCallback)sub_1D97FC208, @"com.apple.ProtectedCloudStorage.test.mobileBackupStateChange", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v14 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v14, v10, (CFNotificationCallback)sub_1D97FC35C, @"com.apple.ProtectedCloudStorage.test.mobileBackupStateChange.success", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    int v15 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v15, v10, (CFNotificationCallback)sub_1D97FC48C, @"com.apple.ProtectedCloudStorage.PendingKeyRoll", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    int v16 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v16, v10, (CFNotificationCallback)sub_1D97FC5BC, (CFStringRef)*MEMORY[0x1E4F1A5D8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    __int16 v17 = [MEMORY[0x1E4F6EAB8] sharedInstance];
    [v17 addListener:v10];

    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F77E78]) initWithDelegate:v10];
    [(IMDCKSyncController *)v10 setSyncResumer:v18];

    __int16 v19 = [MEMORY[0x1E4F6EAB8] sharedInstance];
    BOOL v20 = [(IMDCKSyncController *)v10 syncResumer];
    uint64_t v21 = [v20 systemMonitorListener];
    [v19 addListener:v21];

    if ((IMIsRunningInUnitTesting() & 1) != 0
      || ([MEMORY[0x1E4F6EAB8] sharedInstance],
          int v22 = objc_claimAutoreleasedReturnValue(),
          char v23 = [v22 isSystemLocked],
          v22,
          (v23 & 1) != 0))
    {
      if (IMOSLoggingEnabled())
      {
        id v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Not doing account check on launch as device is locked", buf, 2u);
        }
      }
    }
    else
    {
      [(IMDCKSyncController *)v10 performOneTimeAccountUpgradeCheckIfNeeded];
    }
  }
  return v2;
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  int v4 = [(IMDCKSyncController *)self longRunningSyncTimer];

  if (v4)
  {
    id v5 = [(IMDCKSyncController *)self longRunningSyncTimer];
    [v5 invalidate];

    [(IMDCKSyncController *)self setLongRunningSyncTimer:0];
  }
  double v6 = [(IMDCKSyncController *)self nightlySyncTimer];

  if (v6)
  {
    int v7 = [(IMDCKSyncController *)self nightlySyncTimer];
    [v7 invalidate];

    [(IMDCKSyncController *)self setNightlySyncTimer:0];
  }
  int v8 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  [v8 removeListener:self];

  uint64_t v9 = [(IMDCKSyncController *)self reloadTimer];

  if (v9)
  {
    uint64_t v10 = [(IMDCKSyncController *)self reloadTimer];
    [v10 invalidate];

    [(IMDCKSyncController *)self setReloadTimer:0];
  }
  v11.receiver = self;
  v11.super_class = (Class)IMDCKSyncController;
  [(IMDCKSyncController *)&v11 dealloc];
}

- (void)kickOffCloudKitSyncIfNeededOnImagentLaunch
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    char v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "kickOffCloudKitSyncIfNeededOnImagentLaunch", buf, 2u);
    }
  }
  uint64_t v4 = IMGetDomainBoolForKeyWithDefaultValue();
  IMSetDomainBoolForKey();
  id v5 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  if ([v5 isUnderFirstDataProtectionLock])
  {
  }
  else
  {
    char v6 = IMGetCachedDomainBoolForKey();

    if ((v6 & 1) == 0)
    {
      uint64_t v8 = IMGetDomainBoolForKeyWithDefaultValue();
      uint64_t v9 = [(IMDCKSyncController *)self _periodicSyncAttemptCount];
      if (v9 < 1)
      {
        if ([(IMDCKSyncController *)self _manualSyncAttemptCount] < 1)
        {
          if (IMOSLoggingEnabled())
          {
            int v22 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Not kicking off a sync as there was no sync in progress or we hit max limit attempts of sync", buf, 2u);
            }
          }
          goto LABEL_34;
        }
        int64_t v10 = [(IMDCKSyncController *)self _manualSyncAttemptCount];
        if (IMOSLoggingEnabled())
        {
          double v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v27) = v10;
            _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "imagent started and we were in the middle of manual sync attempt %ud", buf, 8u);
          }
        }
        [(IMDCKSyncController *)self _autoBugCaptureWithSubType:@"CrashedDuringSync" debugDescription:@"duringManualSync"];
        if (IMOSLoggingEnabled())
        {
          double v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "NOT Kicking off a periodic sync after we got back as we are not on battery and wifi", buf, 2u);
          }
        }
        [(IMDCKSyncController *)self _resetSyncStateAndAttemptCounts];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = sub_1D97FCEB8;
        v23[3] = &unk_1E6B73F78;
        v23[4] = self;
        [(IMDCKSyncController *)self _ifCloudKitAbleToSyncWithActivity:0 callBlock:v23];
      }
      else
      {
        int64_t v10 = [(IMDCKSyncController *)self _periodicSyncAttemptCount];
        if (IMOSLoggingEnabled())
        {
          objc_super v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            int64_t v27 = v10;
            _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Not kicking off a sync as this is a periodic sync attempt %ld and coreduet should decide whether to kick off a sync again", buf, 0xCu);
          }
        }
        [(IMDCKSyncController *)self _autoBugCaptureWithSubType:@"CrashedDuringSync" debugDescription:@"duringPeriodicSync"];
        [(IMDCKSyncController *)self _resetSyncStateAndAttemptCounts];
      }
      BOOL v14 = v9 > 0;
      v24[0] = @"wasXPCtriggered";
      int v15 = [NSNumber numberWithBool:v14];
      v25[0] = v15;
      v24[1] = @"restoreSync";
      int v16 = [NSNumber numberWithBool:v8];
      v25[1] = v16;
      v24[2] = @"nightlyTriggerCrash";
      __int16 v17 = [NSNumber numberWithBool:v4];
      v25[2] = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

      __int16 v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6D138] code:8 userInfo:v18];
      BOOL v20 = [(IMDCKAbstractSyncController *)self ckUtilities];
      [v20 reportErrorForSyncType:1 syncStep:@"Unknown/Crash" response:1 error:v19];

      uint64_t v21 = [(IMDCKAbstractSyncController *)self ckUtilities];
      [v21 reportCompletionForSyncType:1 isCoreDuetSync:v14 onAttempt:v10 wasSuccessful:0 duration:0.0];

      return;
    }
  }
  if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Not attempting to kick off periodic sync as we are under first unlock AND/OR we have a defaults set com.apple.madrid disableSyncRetryOnCrash", buf, 2u);
    }
  }
LABEL_34:
  [(IMDCKSyncController *)self _resetSyncStateAndAttemptCounts];
}

- (void)resumeSyncOnLaunchIfNeeded
{
  char v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isMessagesIniCloudVersion2];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Checking to see if we should resume an MiC Sync", buf, 2u);
      }
    }
    char v6 = [(IMDCKSyncController *)self syncResumer];
    [v6 attemptToResumeSyncIfAppropriate];
  }
  else
  {
    int v7 = [(IMDCKAbstractSyncController *)self ckUtilities];
    int v8 = [v7 cloudKitSyncingEnabled];

    if (v8)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int64_t v10 = 0;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Checking to see if we should resume an MiC Sync", v10, 2u);
        }
      }
      if ((IMGetDomainBoolForKeyWithDefaultValue() & 1) == 0 && (IMGetDomainBoolForKeyWithDefaultValue() & 1) == 0) {
        [(IMDCKSyncController *)self beginInitialSyncWithActivity:0];
      }
    }
  }
}

- (void)_needsSyncOnIdentityUpdate
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v2 setBool:1 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF78]];
}

- (void)_needsSyncOnAccountUpdate
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v2 setBool:1 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF68]];
}

- (void)_didPassAccountAndIdentityUpdateNeeds
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  uint64_t v3 = *MEMORY[0x1E4F6CF00];
  [v2 setValue:0 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF78]];

  id v4 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v4 setValue:0 forDomain:v3 forKey:*MEMORY[0x1E4F6CF68]];
}

+ (BOOL)initialSyncAllowed
{
  return [MEMORY[0x1E4F6E730] deviceIsLockedDown] ^ 1;
}

- (void)registerCloudSyncDependencies
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97FD3A0;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  if (qword_1EBE2BE60 != -1) {
    dispatch_once(&qword_1EBE2BE60, block);
  }
}

- (void)scheduleAttachmentAssetDownload
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F77E68] scheduleAttachmentAssetDownloadWithDelegate:self];
  if (v2 && IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Failed to schedule attachment asset download with error %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)beginInitialSyncWithActivity:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isMessagesIniCloudVersion2];

  if (v6)
  {
    [(IMDCKSyncController *)self registerCloudSyncDependencies];
    int v7 = [MEMORY[0x1E4F77E68] startInitialSyncWithDelegate:self];
    if (v7 && IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        objc_super v29 = v7;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Failed to schedule initial sync with error %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Request to beginInitialSync", buf, 2u);
      }
    }
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_beginInitialSyncWithActivity_ object:0];
    int64_t v10 = [(IMDCKAbstractSyncController *)self ckUtilities];
    uint64_t v11 = [v10 cloudKitSyncingEnabled];

    uint64_t v12 = IMGetDomainBoolForKeyWithDefaultValue();
    if ((v11 ^ 1 | v12) == 1)
    {
      if (IMOSLoggingEnabled())
      {
        double v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          BOOL v14 = [NSNumber numberWithBool:v11];
          int v15 = [NSNumber numberWithBool:v12];
          *(_DWORD *)buf = 138412546;
          objc_super v29 = v14;
          __int16 v30 = 2112;
          v31 = v15;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "**** Has performed initial sync, or we aren't enabled. Not kicking off initial sync *** | isEnabled %@, hasPerformedInitalSync %@", buf, 0x16u);
        }
      }
      [(IMDCKSyncController *)self setInitialSyncAttempts:0];
    }
    else
    {
      int v16 = [MEMORY[0x1E4F1C9C8] now];
      __int16 v17 = [(IMDCKAbstractSyncController *)self syncState];
      uint64_t v18 = [MEMORY[0x1E4F29128] UUID];
      __int16 v19 = [v18 UUIDString];
      [v17 setSyncSessionID:v19];

      BOOL v20 = [(IMDCKAbstractSyncController *)self syncState];
      uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
      [v20 setAnalyticSyncDatesDictionaryObject:v21 forKey:*MEMORY[0x1E4F6CFF8] shouldOverrideIfExists:0];

      int v22 = [(IMDCKAbstractSyncController *)self ckUtilities];
      [v22 postSyncStateToCloudKit:@"ManateeIdentityFetchAttemptRestoreSync"];

      [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToStartingInitialSync];
      char v23 = [(IMDCKSyncController *)self _recordManager];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = sub_1D97FDC8C;
      void v25[3] = &unk_1E6B73BA0;
      v25[4] = self;
      id v26 = v4;
      id v27 = v16;
      id v24 = v16;
      [v23 fetchChatZoneToCheckManateeStatus:v25];
    }
  }
}

- (void)beginChatSyncPeriodic:(BOOL)a3 activity:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = @"NO";
      if (v4) {
        int v8 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      BOOL v20 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Request to begin chat sync isPeriodic:%@", buf, 0xCu);
    }
  }
  uint64_t v9 = [(IMDCKAbstractSyncController *)self ckUtilities];
  char v10 = [v9 cloudKitSyncingEnabled];

  if (v10)
  {
    if (![(IMDCKSyncController *)self _chatSyncedRecently])
    {
      [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToStartingPeriodicSync];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = sub_1D97FE5F4;
      v16[3] = &unk_1E6B77230;
      v16[4] = self;
      BOOL v18 = v4;
      id v17 = v6;
      [(IMDCKSyncController *)self _ifCloudKitAbleToSyncWithActivity:v17 callBlock:v16];

      goto LABEL_28;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "We synced recently chats not syncing again after coming back online", buf, 2u);
      }
    }
    if (v6)
    {
      BOOL v12 = xpc_activity_set_state((xpc_activity_t)v6, 5);
      if (IMOSLoggingEnabled())
      {
        double v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v20) = v12;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Set state for chat syncing with result %d", buf, 8u);
        }
LABEL_17:
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v20 = @"NO";
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Not syncing chats from xpc activity -- mocEnabled: %@", buf, 0xCu);
      }
    }
    [(IMDCKSyncController *)self _clearTombstonesWithActivity:v6];
    if (v6)
    {
      BOOL v15 = xpc_activity_set_state((xpc_activity_t)v6, 5);
      if (IMOSLoggingEnabled())
      {
        double v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v20) = v15;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Set state for chat syncing with result %d", buf, 8u);
        }
        goto LABEL_17;
      }
    }
  }
LABEL_28:
}

- (BOOL)shouldMarkAllIncompatibleMessagesForDeletion
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IMGetDomainIntForKey();
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 134218240;
      uint64_t v6 = v2;
      __int16 v7 = 1024;
      int v8 = 1;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Request to determine if we should mark all incompatibleMessagesForDeletion, set version (%ld) current version (%d)", (uint8_t *)&v5, 0x12u);
    }
  }
  return v2 != 1;
}

- (void)beginPeriodicSyncWithChecks:(unint64_t)a3 priority:(const char *)a4 reason:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v13 = a3;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Request to begin full sync checks %lu (reason %@)", buf, 0x16u);
    }
  }
  uint64_t v9 = [@"com.apple.Messages.PeriodicSync." stringByAppendingString:v7];
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, (const char *)*MEMORY[0x1E4F142C8], a4);
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E4F142F8], 0);
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E4F14338], 1);
  +[IMDCKUtilities addConditionChecks:a3 toCriteria:v10];
  id v11 = v9;
  [v11 UTF8String];
  IMRegisterSADAwareXPCActivity();
}

- (void)beginPeriodicSyncWithActivity:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (char *)a3;
  int v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isMessagesIniCloudVersion2];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F77E68] scheduleBackfillSyncWithDelegate:self];
    if (v7 && IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        BOOL v18 = "-[IMDCKSyncController beginPeriodicSyncWithActivity:]";
        __int16 v19 = 2112;
        BOOL v20 = v7;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "%s: Tried to kick off backfill sync but encountered error %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v18 = v4;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Request to begin full sync activity:%@", buf, 0xCu);
      }
    }
    xpc_object_t v10 = [MEMORY[0x1E4F6E810] sharedInstance];
    [v10 incrementCoreDuetSyncAttempts];

    id v11 = [(IMDCKAbstractSyncController *)self syncState];
    BOOL v12 = [MEMORY[0x1E4F29128] UUID];
    unint64_t v13 = [v12 UUIDString];
    [v11 setSyncSessionID:v13];

    [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToStartingPeriodicSync];
    if ([(IMDCKSyncController *)self shouldMarkAllIncompatibleMessagesForDeletion])
    {
      IMSetDomainIntForKey();
      __int16 v14 = [(IMDCKSyncController *)self messageSyncController];
      [v14 _markAllIncompatibleMessagesForDeletion];
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1D97FF0A0;
    v15[3] = &unk_1E6B73B78;
    v15[4] = self;
    uint64_t v16 = v4;
    [(IMDCKSyncController *)self _ifCloudKitAbleToSyncWithActivity:v16 callBlock:v15];
  }
}

- (void)beginUserInitiatedSync
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isMessagesIniCloudVersion2];

  if (v4)
  {
    int v5 = [MEMORY[0x1E4F77E68] startUserInitiatedSyncWithDelegate:self];
    if (v5 && IMOSLoggingEnabled())
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v8 = 136315394;
        uint64_t v9 = "-[IMDCKSyncController beginUserInitiatedSync]";
        __int16 v10 = 2112;
        id v11 = v5;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "%s: Tried to kick off user initiated sync but encountered error %@", (uint8_t *)&v8, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v7 = *MEMORY[0x1E4F142E0];
    [(IMDCKSyncController *)self beginPeriodicSyncWithChecks:2 priority:v7 reason:@"User Initiated"];
  }
}

- (BOOL)_serverDoesNotAllowComingBackOnlineChatSync
{
  uint64_t v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  uint64_t v3 = [v2 objectForKey:@"ck-stop-online-sync"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (double)_minimumChatComingOnlineSyncInterval
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  uint64_t v3 = [v2 objectForKey:@"ck-chat-sync-interval"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 1800.0;
  }
  if (IMOSLoggingEnabled())
  {
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [NSNumber numberWithDouble:v5];
      int v9 = 138412290;
      __int16 v10 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "_minimumChatComingOnlineSyncInterval %@", (uint8_t *)&v9, 0xCu);
    }
  }

  return v5;
}

- (BOOL)_chatSyncedRecently
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = IMGetCachedDomainValueForKey();
  if (IMOSLoggingEnabled())
  {
    double v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      unint64_t v13 = v3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Last coming online chat sync date %@", (uint8_t *)&v12, 0xCu);
    }
  }
  if ([(IMDCKSyncController *)self _serverDoesNotAllowComingBackOnlineChatSync])
  {
    if (IMOSLoggingEnabled())
    {
      double v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Server override prevents us from syncing chats when coming back online", (uint8_t *)&v12, 2u);
      }
    }
  }
  else if (!v3 {
         || ([MEMORY[0x1E4F1C9C8] date],
  }
             int v6 = objc_claimAutoreleasedReturnValue(),
             [v6 timeIntervalSinceDate:v3],
             double v8 = v7,
             v6,
             v8 <= 0.0)
         || ([(IMDCKSyncController *)self _minimumChatComingOnlineSyncInterval],
             v8 >= v9))
  {
    BOOL v10 = 0;
    goto LABEL_15;
  }
  BOOL v10 = 1;
LABEL_15:

  return v10;
}

- (BOOL)_serverDoesNotSingleDeviceLimitation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  uint64_t v3 = [v2 objectForKey:@"ck-block-single-device-limitation"];
  int v4 = [v3 BOOLValue];

  if (v4 && IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      double v8 = @"YES";
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "The server is not allowing us to block chat syncing for iMessage accounts with only one device: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4;
}

- (BOOL)_accountHasMultipleDevices
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.madrid"];
  int v4 = [v3 devices];
  uint64_t v5 = [v4 count];

  BOOL v6 = [(IMDCKSyncController *)self _serverDoesNotSingleDeviceLimitation];
  if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      double v8 = NSNumber;
      uint64_t v9 = [v3 devices];
      BOOL v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      int v13 = 138412290;
      uint64_t v14 = v10;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Number of devices for iMessage account: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  if (v5) {
    BOOL v11 = !v6;
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_clearTombstonesWithActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMDCKAbstractSyncController *)self ckUtilities];
  char v6 = [v5 cloudKitSyncingEnabled];

  if ((v6 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v8 = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Cleaning up tombstone table as CloudKit syncing is off", v8, 2u);
      }
    }
    IMDMessageRecordClearDeleteTombStones();
    IMDAttachmentRecordClearDeleteTombStones();
  }
}

- (void)beginComingBackOnlineSyncWithActivity:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Request to beginChatSync from coming back online", buf, 2u);
    }
  }
  char v6 = [(IMDCKAbstractSyncController *)self ckUtilities];
  char v7 = [v6 cloudKitSyncingEnabled];

  if (v7)
  {
    BOOL v8 = [(IMDCKSyncController *)self _chatSyncedRecently];
    int v9 = IMOSLoggingEnabled();
    if (v8)
    {
      if (v9)
      {
        BOOL v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "We synced recently chats not syncing again after coming back online", buf, 2u);
        }
      }
    }
    else
    {
      if (v9)
      {
        int v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Proceeding with coming back online sync", buf, 2u);
        }
      }
      [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToStartingPeriodicSync];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = sub_1D97FFC94;
      v13[3] = &unk_1E6B73F78;
      v13[4] = self;
      [(IMDCKSyncController *)self _ifCloudKitAbleToSyncWithActivity:0 callBlock:v13];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Not syncing chats from coming back online -- clearing tombstones for deletes only ", buf, 2u);
      }
    }
    [(IMDCKSyncController *)self _clearTombstonesWithActivity:v4];
  }
}

- (void)clearCKRelatedDefaults
{
  uint64_t v3 = [(IMDCKAbstractSyncController *)self syncState];
  [v3 setLastSyncDate:0];

  id v4 = [(IMDCKAbstractSyncController *)self syncState];
  [v4 setAnalyticSyncDatesDictionary:0];

  IMSetDomainBoolForKey();
  IMSetDomainBoolForKey();
  IMSetDomainBoolForKey();

  IMSetDomainBoolForKey();
}

- (void)clearLocalCloudKitSyncState
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v24 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "clearLocalCloudKitSyncState", v24, 2u);
    }
  }
  id v4 = [(IMDCKAbstractSyncController *)self syncState];
  [v4 _startBatchChange];
  uint64_t v5 = [MEMORY[0x1E4F6E720] sharedInstance];
  uint64_t v6 = *MEMORY[0x1E4F6CF00];
  [v5 setBool:0 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF28]];

  char v7 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v7 setBool:0 forDomain:v6 forKey:*MEMORY[0x1E4F6CF38]];

  BOOL v8 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v8 setBool:0 forDomain:v6 forKey:*MEMORY[0x1E4F6CF20]];

  [(IMDCKSyncController *)self clearCKRelatedDefaults];
  int v9 = [(IMDCKAbstractSyncController *)self ckUtilities];
  BOOL v10 = [v9 logCollectorAddress];

  BOOL v11 = [(IMDCKAbstractSyncController *)self ckUtilities];
  [v11 reportMOCDebuggingErrorWithString:@"ResetSyncDate" internalOnly:1 initialSync:0 sendToHandle:v10 reasonString:@"ResetSyncDate"];

  int v12 = +[IMDCKChatSyncController sharedInstance];
  [v12 deleteChatSyncToken];

  int v13 = +[IMDCKChatSyncController sharedInstance];
  [v13 deleteChat1SyncToken];

  uint64_t v14 = +[IMDCKMessageSyncController sharedInstance];
  [v14 deleteMessageSyncToken];

  uint64_t v15 = +[IMDCKAttachmentSyncController sharedInstance];
  [v15 deleteAttachmentSyncToken];

  uint64_t v16 = +[IMDCKUpdateSyncController sharedInstance];
  [v16 deleteSyncToken];

  id v17 = +[IMDCKRecoverableMessageSyncController sharedInstance];
  [v17 deleteSyncToken];

  BOOL v18 = +[IMDCKMessageSyncController sharedInstance];
  [v18 deleteChatBotMessageSyncToken];

  __int16 v19 = +[IMDCKAttachmentSyncController sharedInstance];
  [v19 deleteChatBotAttachmentSyncToken];

  BOOL v20 = +[IMDCKRecoverableMessageSyncController sharedInstance];
  [v20 deleteChatBotRecoverableMessageSyncToken];

  uint64_t v21 = +[IMDCKRecordSaltManager sharedInstance];
  [v21 clearLocalSyncState];

  int v22 = [(IMDCKAbstractSyncController *)self syncState];
  [v22 clearLocalCloudKitSyncState];

  char v23 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LODWORD(v21) = [v23 isMessagesIniCloudVersion2];

  if (v21) {
    [MEMORY[0x1E4F77E68] clearLocalCountsWhenSafe];
  }

  [v4 _finishBatchChange];
}

- (void)syncController:(id)a3 syncBatchCompleted:(unint64_t)a4
{
}

- (BOOL)_serverAllowsUIRefreshWhileSyncing
{
  BOOL v2 = 1;
  uint64_t v3 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v4 = [v3 objectForKey:@"disable-mic-ui-refresh-during-sync"];
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 BOOLValue])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)BOOL v8 = 0;
          _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Server disallows refreshing UI while syncing", v8, 2u);
        }
      }
      BOOL v2 = 0;
    }
    else
    {
      BOOL v2 = 1;
    }
  }

  return v2;
}

- (BOOL)_serverAllowsUIRefreshTimerWhileSyncing
{
  BOOL v2 = 1;
  uint64_t v3 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v4 = [v3 objectForKey:@"disable-mic-ui-refresh-timer-during-sync"];
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 BOOLValue])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)BOOL v8 = 0;
          _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Server disallows refreshing UI while syncing using timer", v8, 2u);
        }
      }
      BOOL v2 = 0;
    }
    else
    {
      BOOL v2 = 1;
    }
  }

  return v2;
}

- (double)reloadTimeInterval
{
  return 180.0;
}

- (void)refreshUIIfApplicableWithBatchCount:(unint64_t)a3
{
  if (a3 && [(IMDCKSyncController *)self _serverAllowsUIRefreshWhileSyncing])
  {
    [(IMDCKSyncController *)self setShouldReloadConversations:1];
    if ([(IMDCKSyncController *)self _serverAllowsUIRefreshTimerWhileSyncing])
    {
      id v4 = [MEMORY[0x1E4F29060] mainThread];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = sub_1D98003D0;
      v5[3] = &unk_1E6B73268;
      v5[4] = self;
      objc_msgSend(v4, "__im_performBlock:", v5);
    }
  }
}

- (void)_refreshUIWhileSyncing
{
  uint64_t v3 = [MEMORY[0x1E4F29060] mainThread];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1D98006F8;
  v4[3] = &unk_1E6B73268;
  v4[4] = self;
  objc_msgSend(v3, "__im_performBlock:", v4);
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "systemDidLeaveFirstDataProtection", v9, 2u);
    }
  }
  id v4 = [MEMORY[0x1E4F6E720] sharedInstance];
  uint64_t v5 = *MEMORY[0x1E4F6CF00];
  uint64_t v6 = *MEMORY[0x1E4F6CEF0];
  int v7 = [v4 getBoolFromDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CEF0]];

  if (v7)
  {
    BOOL v8 = [MEMORY[0x1E4F6E720] sharedInstance];
    [v8 setValue:0 forDomain:v5 forKey:v6];

    [(IMDCKSyncController *)self _attemptToEnableMiCByDefaultOnce];
  }
}

- (void)systemDidUnlock
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "systemDidUnlock", buf, 2u);
    }
  }
  if ([(IMDCKSyncController *)self shouldReloadConversations])
  {
    [(IMDCKSyncController *)self setShouldReloadConversations:0];
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Refreshing UI after unlock", v5, 2u);
      }
    }
    [(IMDCKSyncController *)self _refreshUIWhileSyncing];
  }
}

- (void)recordMetricIsCloudKitEnabled
{
  id v6 = [MEMORY[0x1E4F6E890] sharedInstance];
  uint64_t v3 = *MEMORY[0x1E4F6D7B0];
  id v4 = [(IMDCKAbstractSyncController *)self ckUtilities];
  if ([v4 cloudKitSyncingEnabled]) {
    uint64_t v5 = &unk_1F33C5DF0;
  }
  else {
    uint64_t v5 = &unk_1F33C5E08;
  }
  [v6 trackEvent:v3 withCount:v5];
}

- (BOOL)_hasDumpedLogsInPastHour
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [(IMDCKSyncController *)self lastLogDumpDate];
  if (v4)
  {
    [v3 timeIntervalSinceDate:v4];
    if (v5 <= 3600.0)
    {
      BOOL v7 = 1;
      goto LABEL_9;
    }
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v9 = 0;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Dumped logs in past hour", v9, 2u);
      }
    }
  }
  BOOL v7 = 0;
LABEL_9:

  return v7;
}

- (BOOL)_hasDumpedRestoreFailureLogsInPastHour
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [(IMDCKSyncController *)self lastRestoreFailureLogDumpDate];
  if (v4)
  {
    [v3 timeIntervalSinceDate:v4];
    if (v5 <= 3600.0)
    {
      BOOL v7 = 1;
      goto LABEL_9;
    }
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v9 = 0;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Dumped restore failure logs in past hour", v9, 2u);
      }
    }
  }
  BOOL v7 = 0;
LABEL_9:

  return v7;
}

- (unint64_t)_currentHour
{
  BOOL v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  double v5 = [v4 components:32 fromDate:v2];
  unint64_t v6 = [v5 hour];

  return v6;
}

- (BOOL)_withinAnHourOfLogDumpHour
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [(IMDCKSyncController *)self _currentHour];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [NSNumber numberWithUnsignedInteger:v2];
      int v6 = 138412290;
      BOOL v7 = v4;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Current hour %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v2 - 7 < 2;
}

- (void)_deleteRestoreFailuresDirectory
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = +[IMDCKUtilities restoreFailuresDirectory];
  id v10 = 0;
  int v4 = [v2 removeItemAtPath:v3 error:&v10];
  id v5 = v10;

  int v6 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v6)
    {
      BOOL v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = +[IMDCKUtilities restoreFailuresDirectory];
        *(_DWORD *)buf = 138412290;
        int v12 = v8;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Deleted restore failures directory at path %@", buf, 0xCu);
      }
LABEL_9:
    }
  }
  else if (v6)
  {
    BOOL v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = +[IMDCKUtilities restoreFailuresDirectory];
      *(_DWORD *)buf = 138412546;
      int v12 = v9;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Failed to delete restore failures directory at path %@ with error %@", buf, 0x16u);
    }
    goto LABEL_9;
  }
}

- (void)sendRestoreFailuresLogDumps
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    unint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "Dumping restore failure logs", buf, 2u);
    }
  }
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(IMDCKSyncController *)self setLastRestoreFailureLogDumpDate:v3];

  int v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = +[IMDCKUtilities restoreFailuresDirectory];
  uint64_t v24 = [v4 fileURLWithPath:v5];

  int v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v7 = [v6 contentsOfDirectoryAtURL:v24 includingPropertiesForKeys:0 options:4 error:0];

  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      *(_DWORD *)buf = 138412290;
      v35 = v9;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Feature is on, time to send restore failure logdumps, found %@ to send", buf, 0xCu);
    }
  }
  id v10 = +[IMDAccountController sharedInstance];
  BOOL v11 = [v10 anySessionForServiceName:*MEMORY[0x1E4F6E1B0]];

  int v12 = [(IMDCKAbstractSyncController *)self ckUtilities];
  __int16 v13 = [v12 logCollectorAddress];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v7;
  uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        BOOL v18 = [NSString stringGUID];
        __int16 v19 = +[IMDCKUtilities sharedInstance];
        [v19 logToPowerLogForLogDumpGUID:v18 logDumpCompleted:1 logDumpSucceeded:1 logDumpSendingCompleted:0 logDumpSendingSucceeded:0 reason:@"RestoreFailuresDump"];

        if (IMOSLoggingEnabled())
        {
          BOOL v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            uint64_t v21 = [v17 path];
            *(_DWORD *)buf = 138412802;
            v35 = v18;
            __int16 v36 = 2112;
            v37 = v21;
            __int16 v38 = 2112;
            v39 = v13;
            _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Sending restore failure log (guid %@) at path %@ to recipient %@", buf, 0x20u);
          }
        }
        int v22 = [v17 path];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = sub_1D98014E0;
        v28[3] = &unk_1E6B72C10;
        id v29 = v18;
        id v23 = v18;
        [v11 sendLogDumpMessageAtFilePath:v22 toRecipient:v13 shouldDeleteFile:1 withCompletion:v28];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v14);
  }

  [(IMDCKSyncController *)self _deleteRestoreFailuresDirectory];
}

- (void)sendRestoreFailuresLogDumpsIfNeeded
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(IMDCKAbstractSyncController *)self ckUtilities];
  if ([v3 cloudKitSyncingEnabled])
  {
    int v4 = [(IMDCKAbstractSyncController *)self ckUtilities];
    int v5 = [v4 shouldCollectDailyLogDumpForRestoreFailures] ^ 1;
  }
  else
  {
    int v5 = 1;
  }

  BOOL v6 = [(IMDCKSyncController *)self _withinAnHourOfLogDumpHour];
  BOOL v7 = [(IMDCKSyncController *)self _hasDumpedRestoreFailureLogsInPastHour];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = @"NO";
      if (v5) {
        id v10 = @"YES";
      }
      else {
        id v10 = @"NO";
      }
      if (v6) {
        BOOL v11 = @"YES";
      }
      else {
        BOOL v11 = @"NO";
      }
      *(_DWORD *)id v17 = 138412802;
      *(void *)&v17[4] = v10;
      *(_WORD *)&v17[12] = 2112;
      *(void *)&v17[14] = v11;
      if (v7) {
        int v9 = @"YES";
      }
      *(_WORD *)&v17[22] = 2112;
      BOOL v18 = v9;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Checking we whould send logs. allowedToSendLogs %@ withinAnHourOfLogDumpHour %@ hasDumpedRestoreFailureLogsInPastHour %@", v17, 0x20u);
    }
  }
  if ((v5 | v7 | !v6))
  {
    if (!v6 || v7)
    {
      if (IMOSLoggingEnabled())
      {
        int v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          __int16 v13 = objc_msgSend(NSNumber, "numberWithBool:", -[IMDCKSyncController _withinAnHourOfLogDumpHour](self, "_withinAnHourOfLogDumpHour"));
          uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[IMDCKSyncController _hasDumpedRestoreFailureLogsInPastHour](self, "_hasDumpedRestoreFailureLogsInPastHour"));
          uint64_t v15 = [(IMDCKSyncController *)self lastRestoreFailureLogDumpDate];
          *(_DWORD *)id v17 = 138412802;
          *(void *)&v17[4] = v13;
          *(_WORD *)&v17[12] = 2112;
          *(void *)&v17[14] = v14;
          *(_WORD *)&v17[22] = 2112;
          BOOL v18 = v15;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Not auto dumping Restore Failure MOC logs withingLogDumpHour %@ hasDumpedLogsInPastHour %@ lastLogDumpTime %@", v17, 0x20u);
        }
      }
    }
    else
    {
      [(IMDCKSyncController *)self sendRestoreFailuresLogDumps];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v17 = 0;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "It is dump log time but feature is off, deleting restore failures directory", v17, 2u);
      }
    }
    [(IMDCKSyncController *)self _deleteRestoreFailuresDirectory];
  }
}

- (void)collectLogsIfNeeded
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = [(IMDCKAbstractSyncController *)self ckUtilities];
  if ([v25 cloudKitSyncingEnabled])
  {
    id v3 = [(IMDCKAbstractSyncController *)self ckUtilities];
    int v4 = [v3 shouldCollectDailyLogDump];

    if (v4)
    {
      if ([(IMDCKSyncController *)self _withinAnHourOfLogDumpHour]
        && ![(IMDCKSyncController *)self _hasDumpedLogsInPastHour])
      {
        int v9 = [MEMORY[0x1E4F1C9C8] date];
        id v10 = [(IMDCKAbstractSyncController *)self syncState];
        BOOL v11 = [v10 lastSyncDate];

        if (v11)
        {
          [v11 timeIntervalSinceDate:v9];
          BOOL v13 = v12 > -84000.0;
        }
        else
        {
          BOOL v13 = 0;
        }
        uint64_t v14 = IMGetCachedDomainValueForKey();
        uint64_t v15 = v14;
        if (v14)
        {
          [v14 timeIntervalSinceDate:v9];
          BOOL v17 = v16 > -84000.0;
        }
        else
        {
          BOOL v17 = 0;
        }
        if (IMOSLoggingEnabled())
        {
          BOOL v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            int v26 = 138412546;
            id v27 = v15;
            __int16 v28 = 2112;
            id v29 = v11;
            _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Checking if we need to dump logs using LastErrorDate:%@ and LastSyncDate%@", (uint8_t *)&v26, 0x16u);
          }
        }
        if (!v13 && !v17)
        {
          uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
          [(IMDCKSyncController *)self setLastLogDumpDate:v19];

          if (IMOSLoggingEnabled())
          {
            BOOL v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              LOWORD(v26) = 0;
              _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "We haven't reported any errors in the last 24 hours and haven't syned.  Dumping logs ", (uint8_t *)&v26, 2u);
            }
          }
          uint64_t v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-3600.0];
          IMSetDomainValueForKey();

          int v22 = [(IMDCKAbstractSyncController *)self ckUtilities];
          id v23 = [(IMDCKAbstractSyncController *)self ckUtilities];
          uint64_t v24 = [v23 logCollectorAddress];
          [v22 logDumpAndSendMessageTo:v24 forHours:24 reason:@"NoSyncFor24Hours"];
        }
      }
      else if (IMOSLoggingEnabled())
      {
        int v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          BOOL v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IMDCKSyncController _withinAnHourOfLogDumpHour](self, "_withinAnHourOfLogDumpHour"));
          BOOL v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IMDCKSyncController _hasDumpedLogsInPastHour](self, "_hasDumpedLogsInPastHour"));
          uint64_t v8 = [(IMDCKSyncController *)self lastLogDumpDate];
          int v26 = 138412802;
          id v27 = v6;
          __int16 v28 = 2112;
          id v29 = v7;
          __int16 v30 = 2112;
          long long v31 = v8;
          _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Not auto dumping MOC logs withingLogDumpHour %@ hasDumpedLogsInPastHour %@ lastLogDumpTime %@", (uint8_t *)&v26, 0x20u);
        }
      }
    }
  }
  else
  {
  }
}

- (BOOL)_handleSyncFailureType:(int64_t)a3 step:(int64_t)a4 activity:(id)a5 attemptCount:(unint64_t)a6 startTime:(id)a7 error:(id)a8 retry:(id)a9
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  activity = (_xpc_activity_s *)a5;
  id v53 = a7;
  uint64_t v15 = (__CFString *)a8;
  id v52 = a9;
  v54 = IMStringFromCloudKitSyncStep();
  double v16 = [v54 stringByAppendingString:@"Sync"];
  if (IMOSLoggingEnabled())
  {
    BOOL v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      xpc_activity_state_t v61 = (xpc_activity_state_t)v54;
      __int16 v62 = 2112;
      v63 = v15;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Failed syncing %@ with error %@", buf, 0x16u);
    }
  }
  [(IMDCKSyncController *)self _reloadChatRegistryOnMainThread];
  if (!v15)
  {
    BOOL v18 = (void *)MEMORY[0x1E4F28C58];
    v58 = @"syncStep";
    v59 = v54;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    uint64_t v15 = [v18 errorWithDomain:@"IMDCKSyncDomain" code:0 userInfo:v19];
  }
  BOOL v20 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v20 autoBugCaptureWithSubType:v16 errorPayload:v15];

  uint64_t v21 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
  id v57 = 0;
  uint64_t v22 = [v21 responseForError:v15 attempt:a6 retryInterval:&v57];
  id v51 = v57;

  id v23 = [(IMDCKAbstractSyncController *)self ckUtilities];
  uint64_t v24 = [v16 stringByAppendingString:@"Failed"];
  [v23 reportErrorForSyncType:a3 syncStep:v24 response:v22 error:v15];

  uint64_t v25 = [(IMDCKAbstractSyncController *)self ckUtilities];
  BOOL v26 = activity != 0;
  id v27 = [MEMORY[0x1E4F1C9C8] now];
  [v27 timeIntervalSinceDate:v53];
  objc_msgSend(v25, "reportCompletionForSyncType:isCoreDuetSync:onAttempt:wasSuccessful:duration:", a3, v26, a6, 0);

  __int16 v28 = [(IMDCKAbstractSyncController *)self ckUtilities];
  BYTE3(v50) = a4 > 6;
  BYTE2(v50) = a4 > 5;
  BYTE1(v50) = a4 > 5;
  LOBYTE(v50) = a4 > 4;
  objc_msgSend(v28, "logCloudKitSyncToPowerLogForSyncType:isCoreDuetSync:didCompleteChatSync:didSucceedSyncingChats:didCompleteMessageSync:didSucceedSyncingMessages:didCompleteAttachmentSync:didSucceedSyncingAttachments:didCompleteRecoverableMessageSync:didSucceedSyncingRecoverableMessageSync:syncAttemptCount:", a3, v26, a4 > 1, a4 > 2, a4 > 2, a4 > 3, v50, a6);

  if (![(IMDCKSyncController *)self _errorIndicatesDeviceNotGoodForSync:v15])
  {
    id v29 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v29 autoBugCaptureWithSubType:v16 errorPayload:v15];

    __int16 v30 = [(IMDCKAbstractSyncController *)self ckUtilities];
    long long v31 = [NSString stringWithFormat:@"Failed syncing Messages %@, please file a radar", v54];
    [v30 reportMOCDebuggingErrorWithString:v31 internalOnly:0];
  }
  switch(v22)
  {
    case 2:
      xpc_activity_state_t v32 = 4;
      goto LABEL_16;
    case 3:
      xpc_activity_state_t v32 = 3;
      goto LABEL_16;
    case 4:
      [(IMDCKSyncController *)self _needsSyncOnAccountUpdate];
      goto LABEL_15;
    case 5:
      [(IMDCKSyncController *)self _needsSyncOnIdentityUpdate];
      goto LABEL_15;
    case 6:
      uint64_t v33 = [(IMDCKAbstractSyncController *)self syncState];
      v34 = [MEMORY[0x1E4F1C9C8] date];
      [v33 setAnalyticSyncDatesDictionaryObject:v34 forKey:*MEMORY[0x1E4F6D1B0] shouldOverrideIfExists:1];

      [(IMDCKSyncController *)self _nukeCKData];
      goto LABEL_15;
    default:
LABEL_15:
      xpc_activity_state_t v32 = 5;
LABEL_16:
      if (activity)
      {
        BOOL v35 = xpc_activity_set_state(activity, v32);
        if (IMOSLoggingEnabled())
        {
          __int16 v36 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            v37 = @"NO";
            if (v35) {
              v37 = @"YES";
            }
            *(_DWORD *)buf = 134218242;
            xpc_activity_state_t v61 = v32;
            __int16 v62 = 2112;
            v63 = v37;
            _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_INFO, "Set activity to state %ld success %@", buf, 0x16u);
          }
        }
      }
      if (v22 == 2)
      {
        if (v52 && v51)
        {
          [v51 integerValue];
          id v56 = v52;
          im_dispatch_after();
          __int16 v38 = v56;
LABEL_31:
        }
      }
      else
      {
        [(IMDCKAbstractSyncController *)self setIsSyncing:0];
        [(IMDCKSyncController *)self _noteMeticsForSyncEndedWithSuccces:0];
        v39 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
        char v40 = [v39 errorIndicatesDeviceConditionsDontAllowSync:v15];

        if ((v40 & 1) == 0)
        {
          uint64_t v41 = [(IMDCKAbstractSyncController *)self ckUtilities];
          __int16 v42 = [NSString stringWithFormat:@"Failed syncing Messages %@, please file a radar", v54];
          [v41 reportMOCDebuggingErrorWithString:v42 internalOnly:0 initialSync:a3 == 0];

          v43 = [MEMORY[0x1E4F6E890] sharedInstance];
          [v43 forceAutoBugCaptureWithSubType:@"Restore Fail" errorPayload:v15];
        }
        if (a3 == 1)
        {
          uint64_t v44 = [MEMORY[0x1E4F6E6E8] sharedInstance];
          [v44 postCoreAutomationNotificationFinishedPeriodicSyncNotificationWithStartTime:v53 chatsDidsync:a4 > 2 messagesDidSync:a4 > 3 attachmentsDidSync:a4 > 5 recoverableMessagesDidSync:a4 > 6];

          __int16 v38 = [MEMORY[0x1E4F6E890] sharedInstance];
          v45 = NSNumber;
          v46 = [MEMORY[0x1E4F1C9C8] date];
          v47 = [(IMDCKSyncController *)self syncStartDate];
          [v46 timeIntervalSinceDate:v47];
          v48 = objc_msgSend(v45, "numberWithDouble:");
          [v38 trackEvent:*MEMORY[0x1E4F6D798] withStatistic:v48];

          goto LABEL_31;
        }
      }

      return v22 == 2;
  }
}

- (id)_retryError
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"IMDCKRestoreDomain" code:1 userInfo:0];
}

- (id)_keychainErrorWithCause:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = [NSString stringWithFormat:@"Caused by: %@", a3, *MEMORY[0x1E4F28568]];
    v8[0] = v3;
    int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    int v4 = 0;
  }
  int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMDCKRestoreDomain" code:0 userInfo:v4];

  return v5;
}

- (id)_keychainError
{
  return [(IMDCKSyncController *)self _keychainErrorWithCause:0];
}

- (void)beginInitialSyncAttemptCount:(unint64_t)a3 withActivity:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (_xpc_activity_s *)a4;
  [(IMDCKAbstractSyncController *)self setIsSyncing:1];
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
      *(_DWORD *)buf = 138412290;
      unint64_t v31 = (unint64_t)v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Beginning initial new device sync with CloudKit. , attemptCount %@", buf, 0xCu);
    }
  }
  int v9 = [MEMORY[0x1E4F1C9C8] now];
  if (a3 < 0x65)
  {
    if (v6 && xpc_activity_should_defer(v6))
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          xpc_activity_state_t state = xpc_activity_get_state(v6);
          *(_DWORD *)buf = 134218240;
          unint64_t v31 = a3;
          __int16 v32 = 2048;
          xpc_activity_state_t v33 = state;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Deferring initial sync on attempt %lu, in state %ld", buf, 0x16u);
        }
      }
      if (!xpc_activity_set_state(v6, 3) && IMOSLoggingEnabled())
      {
        BOOL v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          xpc_activity_state_t v21 = xpc_activity_get_state(v6);
          *(_DWORD *)buf = 134218240;
          unint64_t v31 = a3;
          __int16 v32 = 2048;
          xpc_activity_state_t v33 = v21;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Failed to set activity to STATE_DEFER(3) on attempt %lu, in state %ld", buf, 0x16u);
        }
      }
      [(IMDCKAbstractSyncController *)self setIsSyncing:0];
    }
    else
    {
      IMSetDomainBoolForKey();
      uint64_t v22 = [(IMDCKAbstractSyncController *)self ckUtilities];
      [v22 postSyncStateToCloudKit:@"InitialSyncInitiated"];

      id v23 = [(IMDCKAbstractSyncController *)self ckUtilities];
      LODWORD(v25) = 0;
      objc_msgSend(v23, "logCloudKitSyncToPowerLogForSyncType:isCoreDuetSync:didCompleteChatSync:didSucceedSyncingChats:didCompleteMessageSync:didSucceedSyncingMessages:didCompleteAttachmentSync:didSucceedSyncingAttachments:didCompleteRecoverableMessageSync:didSucceedSyncingRecoverableMessageSync:syncAttemptCount:", 0, 0, 0, 0, 0, 0, v25, a3);

      uint64_t v24 = +[IMDCKRecordSaltManager sharedInstance];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_1D9802A8C;
      v26[3] = &unk_1E6B772A0;
      void v26[4] = self;
      id v27 = v6;
      unint64_t v29 = a3;
      id v28 = v9;
      [v24 fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:v26];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Max attempts to sync due to recoverAble error exceeded", buf, 2u);
      }
    }
    BOOL v11 = [(IMDCKSyncController *)self _retryError];
    double v12 = [(IMDCKAbstractSyncController *)self ckUtilities];
    [v12 reportMOCDebuggingErrorWithString:@"Messages: Failed syncing to CloudKit please file a radar" internalOnly:0 initialSync:1];

    BOOL v13 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v13 forceAutoBugCaptureWithSubType:@"Restore Fail" errorPayload:v11];

    uint64_t v14 = [(IMDCKAbstractSyncController *)self ckUtilities];
    [v14 logCloudKitSyncToPowerLogForSyncType:0 isCoreDuetSync:0 didStartSync:1 didFinishSync:1 didSucceedSyncing:0];

    uint64_t v15 = [(IMDCKAbstractSyncController *)self ckUtilities];
    [v15 reportErrorForSyncType:0 syncStep:@"Retry" response:1 error:v11];

    double v16 = [(IMDCKAbstractSyncController *)self ckUtilities];
    BOOL v17 = [MEMORY[0x1E4F1C9C8] now];
    [v17 timeIntervalSinceDate:v9];
    objc_msgSend(v16, "reportCompletionForSyncType:isCoreDuetSync:onAttempt:wasSuccessful:duration:", 0, 0, a3, 0);

    [(IMDCKSyncController *)self _noteMeticsForSyncEndedWithSuccces:0];
    [(IMDCKAbstractSyncController *)self setIsSyncing:0];
  }
}

- (BOOL)_errorIndicatesDeviceNotGoodForSync:(id)a3
{
  id v4 = a3;
  int v5 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
  char v6 = [v5 errorIndicatesDeviceConditionsDontAllowSync:v4];

  return v6;
}

- (void)_nukeCKData
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "******** Nuking CloudKit data ******", v7, 2u);
    }
  }
  id v4 = [(IMDCKAbstractSyncController *)self ckUtilities];
  [v4 reportMOCDebuggingErrorWithString:@"Deleting CloudKit Data" internalOnly:1];

  int v5 = [(IMDCKAbstractSyncController *)self syncState];
  [v5 setDeletedZones:1];

  char v6 = +[IMDRecordZoneManager sharedInstance];
  [v6 deleteAllZones];

  [(IMDCKSyncController *)self clearLocalCloudKitSyncState];
}

- (void)_reloadChatRegistryOnMainThread
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v3 = +[IMDChatRegistry sharedInstance];
    [v3 _forceReloadChats:1];
  }
  else
  {
    unint64_t v2 = MEMORY[0x1E4F14428];
    dispatch_async(v2, &unk_1F3391BA0);
  }
}

- (id)_recordManager
{
  return +[IMDRecordZoneManager sharedInstance];
}

- (void)_beginPeriodicSyncWithActivity:(id)a3 attemptCount:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = [NSNumber numberWithUnsignedInteger:a4];
      *(_DWORD *)buf = 138412290;
      BOOL v20 = v9;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Attempting periodicSync for attemptCount %@ so setting fullSyncAttempted date.", buf, 0xCu);
    }
  }
  id v10 = [(IMDCKAbstractSyncController *)self syncState];
  [v10 setAnalyticSyncDatesDictionaryObject:v7 forKey:*MEMORY[0x1E4F6CFD0] shouldOverrideIfExists:1];

  BOOL v11 = [(IMDCKAbstractSyncController *)self ckUtilities];
  [v11 postSyncStateToCloudKit:@"ManateeIdentityFetchAttemptFullSync"];

  double v12 = [(IMDCKSyncController *)self _recordManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D9803714;
  v15[3] = &unk_1E6B772A0;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  unint64_t v18 = a4;
  id v13 = v7;
  id v14 = v6;
  [v12 fetchChatZoneToCheckManateeStatus:v15];
}

- (void)syncAttachmentMetadataFirstSyncWithActivity:(id)a3 deviceConditionsToCheck:(unint64_t)a4 completionBlock:(id)a5
{
  id v8 = a3;
  int v9 = (void (**)(id, uint64_t, void))a5;
  BOOL v10 = [(IMDCKAbstractSyncController *)self _fetchedAllChangesFromCloudKit];
  int v11 = IMOSLoggingEnabled();
  if (v10)
  {
    if (v11)
    {
      double v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "First full sync has completed - lets just do a normal sync flows", buf, 2u);
      }
    }
    v9[2](v9, 1, 0);
  }
  else
  {
    if (v11)
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Doing an attachment metadata only sync before we continue with the full sync", buf, 2u);
      }
    }
    id v14 = [(IMDCKSyncController *)self attachmentSyncController];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1D9803F10;
    v15[3] = &unk_1E6B72C60;
    id v16 = v9;
    [v14 syncAttachmentsWithSyncType:5 deviceConditionsToCheck:a4 activity:v8 completionBlock:v15];
  }
}

- (void)_beginPeriodicSyncWithActivity:(id)a3 attemptCount:(unint64_t)a4 syncChatsCompletionBlock:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = (_xpc_activity_s *)a3;
  int v9 = (void (**)(id, void))a5;
  [(IMDCKAbstractSyncController *)self setIsSyncing:1];
  if (IMOSLoggingEnabled())
  {
    BOOL v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [NSNumber numberWithUnsignedInteger:a4];
      double v12 = (void *)v11;
      id v13 = @"YES";
      if (!v8) {
        id v13 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      unint64_t v44 = (unint64_t)v13;
      __int16 v45 = 2112;
      uint64_t v46 = v11;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Initiating full sync with CloudKit. Core Duet Sync %@, attemptCount %@", buf, 0x16u);
    }
  }
  id v14 = [(IMDCKAbstractSyncController *)self ckUtilities];
  LODWORD(v37) = 0;
  objc_msgSend(v14, "logCloudKitSyncToPowerLogForSyncType:isCoreDuetSync:didCompleteChatSync:didSucceedSyncingChats:didCompleteMessageSync:didSucceedSyncingMessages:didCompleteAttachmentSync:didSucceedSyncingAttachments:didCompleteRecoverableMessageSync:didSucceedSyncingRecoverableMessageSync:syncAttemptCount:", 1, v8 != 0, 0, 0, 0, 0, v37, a4);

  if (IMGetDomainBoolForKey()
    && ([MEMORY[0x1E4F6C360] sharedInstance],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 isInternalInstall],
        v15,
        v16))
  {
    [(IMDCKAbstractSyncController *)self setIsSyncing:0];
    if (IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Asked to sync but we are not allowed to do so", buf, 2u);
      }
    }
    if (v9) {
      v9[2](v9, 0);
    }
    if (v8)
    {
      BOOL v18 = xpc_activity_set_state(v8, 5);
      if (IMOSLoggingEnabled())
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v44) = v18;
          _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Set state full sync activity result %d", buf, 8u);
        }
      }
    }
  }
  else
  {
    BOOL v20 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v21 = [MEMORY[0x1E4F6E810] sharedInstance];
    [v21 dumpMOCLoggingMetaData];

    uint64_t v22 = @"FullSyncInitiated";
    id v23 = [(IMDCKAbstractSyncController *)self ckUtilities];
    [v23 postSyncStateToCloudKit:v22];

    if (a4 < 0x65)
    {
      if (v8 && xpc_activity_should_defer(v8))
      {
        if (IMOSLoggingEnabled())
        {
          __int16 v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            xpc_activity_state_t state = xpc_activity_get_state(v8);
            *(_DWORD *)buf = 134218240;
            unint64_t v44 = a4;
            __int16 v45 = 2048;
            uint64_t v46 = state;
            _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Deferring periodic sync on attempt %lu, in state %ld", buf, 0x16u);
          }
        }
        if (!xpc_activity_set_state(v8, 3) && IMOSLoggingEnabled())
        {
          uint64_t v34 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            xpc_activity_state_t v35 = xpc_activity_get_state(v8);
            *(_DWORD *)buf = 134218240;
            unint64_t v44 = a4;
            __int16 v45 = 2048;
            uint64_t v46 = v35;
            _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "Failed to set activity to STATE_DEFER(3) on attempt %lu, in state %ld", buf, 0x16u);
          }
        }
        [(IMDCKAbstractSyncController *)self setIsSyncing:0];
        if (v9) {
          v9[2](v9, 0);
        }
      }
      else
      {
        __int16 v36 = +[IMDCKRecordSaltManager sharedInstance];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = sub_1D98047C8;
        v38[3] = &unk_1E6B77390;
        v38[4] = self;
        v39 = v8;
        unint64_t v42 = a4;
        id v40 = v20;
        uint64_t v41 = v9;
        [v36 fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:v38];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Max attempts to sync due to recoverable error exceeded", buf, 2u);
        }
      }
      uint64_t v25 = [(IMDCKAbstractSyncController *)self ckUtilities];
      [v25 reportMOCDebuggingErrorWithString:@"Messages: Failed syncing to CloudKit please file a radar" internalOnly:0];

      [(IMDCKAbstractSyncController *)self setIsSyncing:0];
      [(IMDCKSyncController *)self _resetSyncStateAndAttemptCounts];
      [(IMDCKSyncController *)self _autoBugCaptureWithSubType:@"FullMessageSync" debugDescription:@"RetryAttemptExceeded"];
      [(IMDCKSyncController *)self _reloadChatRegistryOnMainThread];
      if (v9) {
        v9[2](v9, 0);
      }
      if (v8)
      {
        BOOL v26 = xpc_activity_set_state(v8, 5);
        if (IMOSLoggingEnabled())
        {
          id v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v44) = v26;
            _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Set state full sync activity result %d", buf, 8u);
          }
        }
      }
      id v28 = [(IMDCKAbstractSyncController *)self ckUtilities];
      unint64_t v29 = [(IMDCKSyncController *)self _retryError];
      [v28 reportErrorForSyncType:1 syncStep:@"Retry" response:1 error:v29];

      __int16 v30 = [(IMDCKAbstractSyncController *)self ckUtilities];
      unint64_t v31 = [MEMORY[0x1E4F1C9C8] now];
      [v31 timeIntervalSinceDate:v20];
      objc_msgSend(v30, "reportCompletionForSyncType:isCoreDuetSync:onAttempt:wasSuccessful:duration:", 1, 0, a4, 0);
    }
  }
}

- (void)syncDeletesToCloudKitWithActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Kicking off delete sync to CloudKit", buf, 2u);
    }
  }
  int v9 = [(IMDCKSyncController *)self chatSyncController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1D9805ABC;
  v12[3] = &unk_1E6B773B8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 syncPendingDeletionWithCompletion:v12];
}

- (void)_syncRecoverableMessagesToCloudKitWithActivity:(id)a3 syncAttemptCount:(unint64_t)a4 startTime:(id)a5 syncCompletionBlock:(id)a6 retryCompletionBock:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int v16 = [(IMDCKSyncController *)self recoverableMessageSyncController];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1D9806184;
  v21[3] = &unk_1E6B773E0;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v15;
  id v25 = v14;
  unint64_t v26 = a4;
  id v17 = v14;
  id v18 = v15;
  id v19 = v13;
  id v20 = v12;
  [v16 syncWithType:1 withActivity:v20 withCompletion:v21];
}

- (id)_sharedDatabaseManager
{
  return +[IMDCKDatabaseManager sharedInstance];
}

- (void)_syncChatsWithActivity:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Request to sync all chats", buf, 2u);
    }
  }
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  id v7 = [(IMDCKAbstractSyncController *)self syncState];
  id v8 = [MEMORY[0x1E4F29128] UUID];
  int v9 = [v8 UUIDString];
  [v7 setSyncSessionID:v9];

  [(IMDCKAbstractSyncController *)self setIsSyncing:1];
  uint64_t v10 = +[IMDCKRecordSaltManager sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D9806718;
  v15[3] = &unk_1E6B73BA0;
  void v15[4] = self;
  id v11 = v4;
  id v16 = v11;
  id v12 = v6;
  id v17 = v12;
  [(id)v10 fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:v15];

  id v13 = [(IMDCKAbstractSyncController *)self ckUtilities];
  LOBYTE(v10) = [v13 cloudKitSyncingEnabled];

  if ((v10 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Cleaning up tombstone table as CloudKit syncing is off", buf, 2u);
      }
    }
    IMDMessageRecordClearDeleteTombStones();
    IMDAttachmentRecordClearDeleteTombStones();
  }
}

- (void)_callSyncWithCompletion:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IMDCKSyncController *)self backupController];
  [v8 sendDeviceIDToCloudKitWithCompletion:0];

  int v9 = [(IMDCKAbstractSyncController *)self ckUtilities];
  char v10 = [v9 cloudKitSyncDownloadAssetsOnly];

  id v11 = [(IMDCKSyncController *)self exitManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1D9806BC8;
  v14[3] = &unk_1E6B77408;
  char v17 = v10;
  v14[4] = self;
  id v15 = v7;
  id v16 = v6;
  id v12 = v6;
  id v13 = v7;
  [v11 exitRecordDateWithCompletion:v14];
}

- (void)_ifCloudKitAbleToSyncWithActivity:(id)a3 callBlock:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F6E730] deviceIsLockedDown])
  {
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else if ([(IMDCKAbstractSyncController *)self isSyncing])
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v25.receiver = self;
        v25.super_class = (Class)IMDCKSyncController;
        if ([(IMDCKAbstractSyncController *)&v25 isSyncing]) {
          int v9 = @"YES";
        }
        else {
          int v9 = @"NO";
        }
        id v23 = v9;
        id v24 = [(IMDCKSyncController *)self chatSyncController];
        if ([v24 isSyncing]) {
          char v10 = @"YES";
        }
        else {
          char v10 = @"NO";
        }
        id v22 = v10;
        id v11 = [(IMDCKSyncController *)self messageSyncController];
        if ([v11 isSyncing]) {
          id v12 = @"YES";
        }
        else {
          id v12 = @"NO";
        }
        id v13 = [(IMDCKSyncController *)self attachmentSyncController];
        if ([v13 isSyncing]) {
          id v14 = @"YES";
        }
        else {
          id v14 = @"NO";
        }
        id v15 = [(IMDCKSyncController *)self exitManager];
        if ([v15 isSyncing]) {
          id v16 = @"YES";
        }
        else {
          id v16 = @"NO";
        }
        *(_DWORD *)buf = 138413314;
        id v27 = v23;
        __int16 v28 = 2112;
        unint64_t v29 = v22;
        __int16 v30 = 2112;
        unint64_t v31 = v12;
        __int16 v32 = 2112;
        xpc_activity_state_t v33 = v14;
        __int16 v34 = 2112;
        xpc_activity_state_t v35 = v16;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "** We are already performing a sync.  Ignoring current request to sync.\n Syncing Self:%@ Chat:%@ Message:%@ Attachment:%@ Exit:%@", buf, 0x34u);
      }
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else
  {
    char v17 = [(IMDCKAbstractSyncController *)self ckUtilities];
    uint64_t v18 = [v17 iCloudAccountMatchesiMessageAccount];

    id v19 = [MEMORY[0x1E4F6E720] sharedInstance];
    [v19 setBool:v18 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CC68]];

    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = @"NO";
        if (v18) {
          uint64_t v21 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        id v27 = v21;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "iCloud and iMessage accounts match up ? %@", buf, 0xCu);
      }
    }
    if (v18)
    {
      [(IMDCKSyncController *)self _callSyncWithCompletion:v7 activity:v6];
    }
    else if (v7)
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

- (void)_beginExitStateCleanupIfNeededWithActivity:(id)a3
{
  id v4 = a3;
  int v5 = +[IMDCKRecordSaltManager sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D98072D4;
  v7[3] = &unk_1E6B73B78;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:v7 forceFetch:1];
}

- (void)_autoBugCaptureWithSubType:(id)a3 debugDescription:(id)a4
{
  int v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a3;
  id v8 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", a4, @"NSDebugDescription", 0);
  id v10 = [v5 errorWithDomain:@"IMDCKSyncController" code:100 userInfo:v8];

  int v9 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v9 autoBugCaptureWithSubType:v7 errorPayload:v10];
}

- (void)_noteSyncStarted:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v3 = (void *)*MEMORY[0x1E4F6D0A8];
  }
  else {
    id v3 = (void *)*MEMORY[0x1E4F6D068];
  }
  if (a3) {
    id v4 = (void *)*MEMORY[0x1E4F6D068];
  }
  else {
    id v4 = (void *)*MEMORY[0x1E4F6D0A8];
  }
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = IMGetCachedDomainIntForKeyWithDefaultValue();
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = [NSNumber numberWithInteger:v7];
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Noting down sync started. Initial value Key %@ value %@", (uint8_t *)&v12, 0x16u);
    }
  }
  IMSetDomainIntForKey();
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [NSNumber numberWithInteger:IMGetCachedDomainIntForKeyWithDefaultValue()];
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Noting down sync started. After setting value Key %@ value %@", (uint8_t *)&v12, 0x16u);
    }
  }
  IMSetDomainIntForKey();
}

- (void)_noteMetricsForSyncStartFrom:(id)a3 fullSync:(BOOL)a4
{
  id v5 = a3;
  [(IMDCKSyncController *)self recordMetricIsCloudKitEnabled];
  id v6 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int v7 = [v6 cloudKitSyncingEnabled];

  if (v7)
  {
    id v8 = [(IMDCKSyncController *)self syncStartDate];
    if (v8)
    {
    }
    else
    {
      int v9 = [(IMDCKSyncController *)self longRunningSyncTimer];

      if (!v9)
      {
LABEL_9:
        *(void *)buf = 0;
        objc_initWeak((id *)buf, self);
        id v11 = (void *)MEMORY[0x1E4F1CB00];
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        uint64_t v16 = sub_1D98078EC;
        char v17 = &unk_1E6B77430;
        id v18 = v5;
        objc_copyWeak(&v19, (id *)buf);
        int v12 = [v11 scheduledTimerWithTimeInterval:0 repeats:&v14 block:28800.0];
        -[IMDCKSyncController setLongRunningSyncTimer:](self, "setLongRunningSyncTimer:", v12, v14, v15, v16, v17);
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        [(IMDCKSyncController *)self setSyncStartDate:v13];

        objc_destroyWeak(&v19);
        objc_destroyWeak((id *)buf);
        goto LABEL_10;
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "IMDCKSyncController: We started a second sync before a previous one was finished.  Likely there is an exit path that isn't calling _noteMeticsForSyncEndedWithSuccces", buf, 2u);
      }
    }
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_resetSyncStateAndAttemptCounts
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Resetting sync state, and attempt counts", v4, 2u);
    }
  }
  [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateStateToFinished];
  IMSetDomainIntForKey();
  IMSetDomainIntForKey();
}

- (int64_t)_periodicSyncAttemptCount
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    unint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = [NSNumber numberWithInteger:IMGetCachedDomainIntForKeyWithDefaultValue()];
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "_periodicSyncAttemptCount %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

- (int64_t)_manualSyncAttemptCount
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    unint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = [NSNumber numberWithInteger:IMGetCachedDomainIntForKeyWithDefaultValue()];
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "_manualSyncAttemptCount %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

- (void)_writeDownSyncDate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Chats, messages, and attachments have synced successfully, sync time: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Updating sync date for Manatee sync %@", (uint8_t *)&v9, 0xCu);
    }
  }
  id v6 = [(IMDCKAbstractSyncController *)self syncState];
  [v6 setLastSyncDate:v3];

  uint64_t v7 = [(IMDCKAbstractSyncController *)self syncState];
  [v7 setAnalyticSyncDatesDictionaryObject:v3 forKey:*MEMORY[0x1E4F6D130] shouldOverrideIfExists:1];

  id v8 = [(IMDCKSyncController *)self exitManager];
  [v8 writeSyncCompletedRecordWithDate:v3 completion:&unk_1F3391BC0];
}

- (void)syncChatsWithMessageContext:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Request to syncChats from XPC", buf, 2u);
    }
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D9808098;
  v6[3] = &unk_1E6B73F78;
  v6[4] = self;
  [(IMDCKSyncController *)self _ifCloudKitAbleToSyncWithActivity:0 callBlock:v6];
}

- (void)_noteMeticsForSyncEndedWithSuccces:(BOOL)a3
{
  id v4 = [(IMDCKSyncController *)self longRunningSyncTimer];
  [v4 invalidate];

  [(IMDCKSyncController *)self setLongRunningSyncTimer:0];
  [(IMDCKSyncController *)self setSyncStartDate:0];

  [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateStateToFinished];
}

- (id)syncStateDebuggingInfo:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [(IMDCKAbstractSyncController *)self syncState];
  uint64_t v7 = [v6 serializedRepresentation];
  [v5 setObject:v7 forKey:@"sync-state-user-defaults"];

  v38.receiver = self;
  v38.super_class = (Class)IMDCKSyncController;
  id v8 = [(IMDCKAbstractSyncController *)&v38 syncStateDebuggingInfo:v4];
  int v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  [v5 setObject:v8 forKey:v10];

  uint64_t v11 = [(IMDCKSyncController *)self attachmentSyncController];
  int v12 = [v11 syncStateDebuggingInfo:v4];
  id v13 = [(IMDCKSyncController *)self attachmentSyncController];
  uint64_t v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  [v5 setObject:v12 forKey:v15];

  uint64_t v16 = [(IMDCKSyncController *)self exitManager];
  char v17 = [v16 syncStateDebuggingInfo:v4];
  id v18 = [(IMDCKSyncController *)self exitManager];
  id v19 = (objc_class *)objc_opt_class();
  id v20 = NSStringFromClass(v19);
  [v5 setObject:v17 forKey:v20];

  uint64_t v21 = [(IMDCKSyncController *)self chatSyncController];
  id v22 = [v21 syncStateDebuggingInfo:v4];
  id v23 = [(IMDCKSyncController *)self chatSyncController];
  id v24 = (objc_class *)objc_opt_class();
  objc_super v25 = NSStringFromClass(v24);
  [v5 setObject:v22 forKey:v25];

  unint64_t v26 = [(IMDCKSyncController *)self messageSyncController];
  id v27 = [v26 syncStateDebuggingInfo:v4];
  __int16 v28 = [(IMDCKSyncController *)self messageSyncController];
  unint64_t v29 = (objc_class *)objc_opt_class();
  __int16 v30 = NSStringFromClass(v29);
  [v5 setObject:v27 forKey:v30];

  unint64_t v31 = +[IMDCKBackupController sharedInstance];
  __int16 v32 = [v31 syncStateDebuggingInfo:v4];
  xpc_activity_state_t v33 = +[IMDCKBackupController sharedInstance];
  __int16 v34 = (objc_class *)objc_opt_class();
  xpc_activity_state_t v35 = NSStringFromClass(v34);
  [v5 setObject:v32 forKey:v35];

  if (IMOSLoggingEnabled())
  {
    uint64_t v36 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v5;
      _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_INFO, "assembled sync state debugging info: %@", buf, 0xCu);
    }
  }

  return v5;
}

- (void)eventStreamHandler:(id)a3 didReceiveEventWithName:(id)a4 userInfo:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F6E550] IMAKUserInfoChangedNotification];
  int v12 = [v11 isEqualToString:v9];

  if (v12)
  {
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412546;
        id v18 = v9;
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Handling event with name %@ userInfo %@", (uint8_t *)&v17, 0x16u);
      }
    }
    [(IMDCKSyncController *)self handleAKUserInfoChangedNotification:v10];
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F6D1B8]])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Got user signed into HSA2 account notification", (uint8_t *)&v17, 2u);
      }
    }
    uint64_t v15 = [MEMORY[0x1E4F6EAB8] sharedInstance];
    char v16 = [v15 isUnderFirstDataProtectionLock];

    if ((v16 & 1) == 0) {
      [(IMDCKSyncController *)self verifyAccountsMatchForMoc];
    }
  }
}

- (void)updateSecurityLevelDowngradedIfNeeded:(id)a3
{
  id v4 = a3;
  int v5 = [(IMDCKSyncController *)self exitManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D980877C;
  v7[3] = &unk_1E6B77480;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 exitRecordDateWithCompletion:v7];
}

- (void)handleAKUserInfoChangedNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412290;
      id v21 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Handling AKUserInfoChangedNotification with user info: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  if (v4)
  {
    id v6 = [MEMORY[0x1E4F6E550] IMAKUserInfoChangedAltDSIDKey];
    uint64_t v7 = [MEMORY[0x1E4F6E550] IMAKUserInfoChangedSecurityLevelKey];
    id v8 = (void *)v7;
    if (v6)
    {
      id v9 = [v4 objectForKeyedSubscript:v6];
      if (v8)
      {
LABEL_8:
        id v10 = [v4 objectForKeyedSubscript:v8];
LABEL_11:
        uint64_t v11 = [(IMDCKAbstractSyncController *)self ckUtilities];
        int v12 = [v11 _primaryiCloudAccountAltDSID];
        int v13 = [v9 isEqualToString:v12];

        if (v13)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue"));
              int v20 = 138412290;
              id v21 = v15;
              _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Account level changed to %@", (uint8_t *)&v20, 0xCu);
            }
          }
          if ([v10 unsignedIntegerValue])
          {
            if ([v10 unsignedIntegerValue] != 4)
            {
              if (IMOSLoggingEnabled())
              {
                char v16 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  LOWORD(v20) = 0;
                  _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "We are downgrading from HSA2 -- turning off messages on iCloud", (uint8_t *)&v20, 2u);
                }
              }
              int v17 = [(IMDCKSyncController *)self backupController];
              [v17 setICloudBackupsDisabled:0];

              id v18 = [(IMDCKAbstractSyncController *)self ckUtilities];
              [v18 downgradingFromHSA2AndDisablingMOC];
            }
            [(IMDCKSyncController *)self updateSecurityLevelDowngradedIfNeeded:&unk_1F3391BE0];
          }
          else if (IMOSLoggingEnabled())
          {
            __int16 v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              LOWORD(v20) = 0;
              _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Account level changed to unknown, not turning off messages in iCloud or refreshing values associated with IMCloudKitAppleIDSecurityLevelHSA2.", (uint8_t *)&v20, 2u);
            }
          }
        }

        goto LABEL_29;
      }
    }
    else
    {
      id v9 = 0;
      if (v7) {
        goto LABEL_8;
      }
    }
    id v10 = 0;
    goto LABEL_11;
  }
LABEL_29:
}

- (BOOL)verifyAccountsMatchForMoc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int v4 = [v3 iCloudAccountMatchesiMessageAccount];

  IMSetDomainBoolForKey();
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = @"NO";
      if (v4) {
        id v6 = @"YES";
      }
      int v12 = 138412290;
      int v13 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "iCloud and iMessage account match up ? %@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v7 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int v8 = [v7 cloudKitSyncingEnabled];

  if (((v8 ^ 1 | v4) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "iCloud and iMessage accounts do not match up.", (uint8_t *)&v12, 2u);
      }
    }
    id v10 = [(IMDCKSyncController *)self backupController];
    [v10 setICloudBackupsDisabled:0];
  }
  return v4;
}

- (void)performOneTimeAccountUpgradeCheckIfNeeded
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "performOneTimeAccountUpgradeCheckIfNeeded", buf, 2u);
    }
  }
  if ((IMGetDomainBoolForKey() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      int v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v8 = 0x403E000000000000;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Will performing MOIC account check on upgrade after %f seconds", buf, 0xCu);
      }
    }
    dispatch_time_t v5 = dispatch_time(0, 30000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D98092FC;
    block[3] = &unk_1E6B73268;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E4F14428], block);
  }
}

- (void)clearAnalyticDefaultsAndLocalSyncState
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)dispatch_time_t v5 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Clear analytic defaults and local sync state", v5, 2u);
    }
  }
  int v4 = [(IMDCKAbstractSyncController *)self syncState];
  [v4 setAnalyticSyncDatesDictionary:MEMORY[0x1E4F1CC08]];

  [(IMDCKSyncController *)self clearLocalCloudKitSyncState];
}

- (void)_addDatesDefaultsIfNeededToDictionary:(id)a3 keys:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        int v12 = [v5 objectForKey:v11];

        if (!v12) {
          [v5 setObject:&unk_1F33C5E20 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)_addDatesDefaultsIfNeededToDictionary:(id)a3
{
  v11[8] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F6CFD0];
  v11[0] = *MEMORY[0x1E4F6D130];
  v11[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F6CFF8];
  v11[2] = *MEMORY[0x1E4F6CFD8];
  v11[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F6CEE0];
  v11[4] = *MEMORY[0x1E4F6D008];
  v11[5] = v6;
  uint64_t v7 = *MEMORY[0x1E4F6CFE0];
  v11[6] = *MEMORY[0x1E4F6D010];
  v11[7] = v7;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a3;
  id v10 = [v8 arrayWithObjects:v11 count:8];
  [(IMDCKSyncController *)self _addDatesDefaultsIfNeededToDictionary:v9 keys:v10];
}

- (id)_dailySyncStateDictionary
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [(IMDCKAbstractSyncController *)self syncState];
  uint64_t v5 = [v4 analyticSyncDatesDictionary];
  uint64_t v6 = (void *)[v3 initWithDictionary:v5];

  [v6 setObject:@"1" forKeyedSubscript:@"version"];
  uint64_t v7 = [(IMDCKAbstractSyncController *)self syncState];
  uint64_t v8 = [v7 syncUserType];
  [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F6D1A8]];

  [(IMDCKSyncController *)self _addDatesDefaultsIfNeededToDictionary:v6];
  id v9 = [(IMDCKAbstractSyncController *)self syncState];
  id v10 = [v9 micDeviceIdentifier];

  if (v10)
  {
    uint64_t v11 = [(IMDCKAbstractSyncController *)self syncState];
    int v12 = [v11 micDeviceIdentifier];
    [v6 setObject:v12 forKeyedSubscript:@"deviceID"];
  }
  long long v13 = [MEMORY[0x1E4F6E720] sharedInstance];
  uint64_t v14 = *MEMORY[0x1E4F6CF00];
  long long v15 = [v13 getValueFromDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6D1F8]];
  long long v16 = v15;
  if (v15)
  {
    int v17 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F6D270]];
    uint64_t v18 = v17;
    if (v17)
    {
      __int16 v19 = [v17 bucket];
      [v6 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F6D188]];
    }
    int v20 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F6D280]];
    id v21 = v20;
    if (v20)
    {
      uint64_t v22 = [v20 bucket];
      [v6 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F6D198]];
    }
    id v23 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F6D268]];
    id v24 = v23;
    if (v23)
    {
      objc_super v25 = [v23 bucket];
      [v6 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F6D180]];
    }
    uint64_t v47 = v24;
    v48 = v21;
    unint64_t v26 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F6D278]];
    id v27 = v26;
    if (v26)
    {
      __int16 v28 = [v26 bucket];
      [v6 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F6D190]];
    }
    unint64_t v29 = [v13 getValueFromDomain:v14 forKey:@"Server.TotalRecords.chatManateeZone"];
    __int16 v30 = v29;
    v49 = v18;
    if (v29) {
      id v31 = v29;
    }
    else {
      id v31 = (id)[objc_alloc(NSNumber) initWithLongLong:0];
    }
    __int16 v32 = v31;

    xpc_activity_state_t v33 = [v13 getValueFromDomain:v14 forKey:@"Server.TotalRecords.chatManateeZone"];
    __int16 v34 = v33;
    if (v33) {
      id v35 = v33;
    }
    else {
      id v35 = (id)[objc_alloc(NSNumber) initWithLongLong:0];
    }
    uint64_t v36 = v35;

    uint64_t v37 = [v13 getValueFromDomain:v14 forKey:@"Server.TotalRecords.chatManateeZone"];
    objc_super v38 = v37;
    if (v37) {
      id v39 = v37;
    }
    else {
      id v39 = (id)[objc_alloc(NSNumber) initWithLongLong:0];
    }
    id v40 = v39;

    uint64_t v41 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v36, "longLongValue")+ objc_msgSend(v32, "longLongValue")+ objc_msgSend(v40, "longLongValue"));
    unint64_t v42 = [v41 bucket];
    [v6 setObject:v42 forKeyedSubscript:*MEMORY[0x1E4F6D1A0]];
  }
  v43 = [(IMDCKAbstractSyncController *)self syncState];
  unint64_t v44 = [v43 describeErrors];

  if ([v44 length]) {
    [v6 setObject:v44 forKeyedSubscript:@"syncErrors"];
  }
  __int16 v45 = (void *)[v6 copy];

  return v45;
}

- (BOOL)_completedPeriodicSyncSinceFirstFullSyncForLastSyncDate:(id)a3 firstFullSyncCompletedDate:(id)a4
{
  BOOL result = 0;
  if (a3)
  {
    if (a4) {
      return [a3 isEqualToDate:a4] ^ 1;
    }
  }
  return result;
}

- (id)_periodicSyncStateDictionary
{
  id v3 = [(IMDCKAbstractSyncController *)self syncState];
  uint64_t v4 = [v3 getAnalyticSyncDatesObjectForKey:*MEMORY[0x1E4F6CFE0]];

  if (![v4 intValue])
  {
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "longLongValue"));
  if (!v5)
  {
LABEL_11:
    id v10 = 0;
    goto LABEL_14;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v20 = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "User has completed a first full sync so device has started doing periodic syncs. Logging full periodic sync metric.", v20, 2u);
    }
  }
  id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = [(IMDCKAbstractSyncController *)self syncState];
  id v9 = [v8 analyticSyncDatesDictionary];
  id v10 = (void *)[v7 initWithDictionary:v9];

  uint64_t v11 = [(IMDCKAbstractSyncController *)self syncState];
  int v12 = [v11 getAnalyticSyncDatesObjectForKey:*MEMORY[0x1E4F6D130]];

  [(IMDCKSyncController *)self _addDatesDefaultsIfNeededToDictionary:v10];
  [v10 setObject:@"1" forKey:@"version"];
  long long v13 = [(IMDCKAbstractSyncController *)self syncState];
  uint64_t v14 = [v13 syncUserType];
  [v10 setObject:v14 forKey:*MEMORY[0x1E4F6D1A8]];

  if (!v12 || [v12 intValue] == -1) {
    long long v15 = 0;
  }
  else {
    long long v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSince1970:", (double)objc_msgSend(v12, "longLongValue"));
  }
  BOOL v16 = [(IMDCKSyncController *)self _completedPeriodicSyncSinceFirstFullSyncForLastSyncDate:v15 firstFullSyncCompletedDate:v5];
  int v17 = [NSNumber numberWithBool:v16];
  [v10 setObject:v17 forKey:@"completedPeriodicSyncSinceFirstFullSync"];

LABEL_14:
  uint64_t v18 = (void *)[v10 copy];

  return v18;
}

- (BOOL)_serverDeniesPeriodicSyncAnalytics
{
  return IMBagIntValueWithDefault() != 0;
}

- (BOOL)_serverDeniesDailySyncStateAnalytics
{
  return IMBagIntValueWithDefault() != 0;
}

- (void)_submitCloudKitAnalyticWithOperationGroupName:(id)a3 analyticDictionary:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int v8 = [v7 shouldReportToRTC];

  if (v8)
  {
    id v9 = +[IMDCKUtilities sharedInstance];
    [v9 postSyncStateToRTC:v13 category:1 reportDictionary:v6];
  }
  id v10 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int v11 = [v10 shouldReportToAnalytics];

  if (v11)
  {
    int v12 = +[IMDCKExitManager sharedInstance];
    [v12 submitCloudKitAnalyticWithOperationGroupName:v13 analyticDictionary:v6];
  }
}

- (BOOL)logCloudKitAnalytics
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = [(IMDCKAbstractSyncController *)self syncState];
  if ([v3 isSyncingEnabled])
  {
    uint64_t v4 = [(IMDCKAbstractSyncController *)self ckUtilities];
    char v5 = [v4 serverAllowsAnalyticSubmission];

    if (v5)
    {
      id v6 = [(IMDCKSyncController *)self _dailySyncStateDictionary];
      BOOL v7 = v6 != 0;
      if (v6)
      {
        int v8 = [(IMDCKAbstractSyncController *)self syncState];
        int v9 = [v8 createdChatZone];

        id v10 = [(IMDCKAbstractSyncController *)self syncState];
        int v11 = [v10 deletedZones];

        int v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        char v13 = [v12 isMessagesIniCloudVersion2];

        if (v13)
        {
          uint64_t v14 = @"daily_status";
        }
        else
        {
          int v17 = [(IMDCKAbstractSyncController *)self syncState];
          uint64_t v18 = [v17 syncUserType];
          uint64_t v14 = [@"dailySyncState-" stringByAppendingString:v18];
        }
        if (IMOSLoggingEnabled())
        {
          __int16 v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            int v20 = @"NO";
            *(_DWORD *)id v27 = 138413058;
            *(void *)&v27[4] = v14;
            if (v9) {
              id v21 = @"YES";
            }
            else {
              id v21 = @"NO";
            }
            *(_WORD *)&v27[12] = 2112;
            *(void *)&v27[14] = v6;
            if (v11) {
              int v20 = @"YES";
            }
            *(_WORD *)&v27[22] = 2112;
            __int16 v28 = v21;
            __int16 v29 = 2112;
            __int16 v30 = v20;
            _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Device will be uploading %@ analytic dict %@ to CK. CreatedZones: %@ DeletedZones:%@", v27, 0x2Au);
          }
        }
        -[IMDCKSyncController _submitCloudKitAnalyticWithOperationGroupName:analyticDictionary:](self, "_submitCloudKitAnalyticWithOperationGroupName:analyticDictionary:", v14, v6, *(_OWORD *)v27, *(void *)&v27[16]);
      }
      else if (IMOSLoggingEnabled())
      {
        BOOL v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v27 = 0;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Not uploading daily sync state.", v27, 2u);
        }
      }
      uint64_t v22 = [(IMDCKSyncController *)self _periodicSyncStateDictionary];
      int v23 = IMOSLoggingEnabled();
      if (v22)
      {
        if (v23)
        {
          id v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id v27 = 138412290;
            *(void *)&v27[4] = v22;
            _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Will be uploading dailySyncState-PeriodicSync analytic dict %@ to CK.", v27, 0xCu);
          }
        }
        [(IMDCKSyncController *)self _submitCloudKitAnalyticWithOperationGroupName:@"dailySyncState-PeriodicSync" analyticDictionary:v22];
        BOOL v7 = 1;
      }
      else if (v23)
      {
        objc_super v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v27 = 0;
          _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Not uploading periodic sync activity.", v27, 2u);
        }
      }
      return v7;
    }
  }
  else
  {
  }
  if (IMOSLoggingEnabled())
  {
    long long v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v27 = 0;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Not logging analytics", v27, 2u);
    }
  }
  return 0;
}

- (id)_stringForDate:(id)a3 withFormatter:(id)a4
{
  id v5 = a3;
  id v6 = @"nil";
  if (v5 && a4)
  {
    BOOL v7 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v8 = a4;
    id v9 = [v7 alloc];
    [v5 doubleValue];
    id v10 = objc_msgSend(v9, "initWithTimeIntervalSince1970:");
    int v11 = [v8 stringFromDate:v10];

    if (v11)
    {
      int v12 = v11;
    }
    else
    {
      int v12 = [NSString stringWithFormat:@"error formatting %@", v5];
    }
    id v6 = v12;
  }

  return v6;
}

- (id)_stringForObject:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  else {
    id v5 = @"nil";
  }

  return v5;
}

- (id)stateDictionaryForDiagnosticsRequest
{
  v73[7] = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Gathering stats for sysdiagnose", buf, 2u);
    }
  }
  __int16 v62 = [MEMORY[0x1E4F6E720] sharedInstance];
  v72[0] = @"micDeviceID";
  uint64_t v59 = *MEMORY[0x1E4F6CF00];
  v60 = objc_msgSend(v62, "getValueFromDomain:forKey:");
  uint64_t v4 = [(IMDCKSyncController *)self _stringForObject:v60];
  v73[0] = v4;
  v72[1] = @"enabled";
  id v5 = NSNumber;
  id v6 = [(IMDCKAbstractSyncController *)self ckUtilities];
  BOOL v7 = objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "cloudKitSyncingEnabled"));
  v73[1] = v7;
  v72[2] = @"syncing";
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4F77E68], "isSyncing"));
  v73[2] = v8;
  v72[3] = @"outOfBackup";
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v62, "getBoolFromDomain:forKey:", v59, *MEMORY[0x1E4F6D028]));
  v73[3] = v9;
  v72[4] = @"accountStatus";
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v62, "getBoolFromDomain:forKey:", v59, *MEMORY[0x1E4F6CE88]));
  v73[4] = v10;
  v72[5] = @"accountsMatch";
  int v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v62, "getBoolFromDomain:forKey:", v59, *MEMORY[0x1E4F6CC68]));
  v73[5] = v11;
  v72[6] = @"errors";
  int v12 = [(IMDCKAbstractSyncController *)self syncState];
  uint64_t v13 = [v12 describeErrors];
  uint64_t v14 = (void *)v13;
  long long v15 = @"no errors";
  if (v13) {
    long long v15 = (__CFString *)v13;
  }
  v73[6] = v15;
  v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:7];

  id v61 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v61 setDateFormat:@"MM/dd/YYYY hh:mm:ss a"];
  BOOL v16 = [(IMDCKAbstractSyncController *)self syncState];
  v58 = [v16 analyticSyncDatesDictionary];

  v70[0] = @"initStart";
  id v56 = [v58 objectForKeyedSubscript:*MEMORY[0x1E4F6CFF8]];
  v55 = [(IMDCKSyncController *)self _stringForDate:v56 withFormatter:v61];
  v71[0] = v55;
  v70[1] = @"initEnd";
  v54 = [v58 objectForKeyedSubscript:*MEMORY[0x1E4F6D008]];
  id v53 = [(IMDCKSyncController *)self _stringForDate:v54 withFormatter:v61];
  v71[1] = v53;
  v70[2] = @"restoreStart";
  id v52 = [v58 objectForKeyedSubscript:*MEMORY[0x1E4F6CFB0]];
  id v51 = [(IMDCKSyncController *)self _stringForDate:v52 withFormatter:v61];
  v71[2] = v51;
  v70[3] = @"restoreEnd";
  uint64_t v50 = [v58 objectForKeyedSubscript:*MEMORY[0x1E4F6CFB8]];
  int v17 = [(IMDCKSyncController *)self _stringForDate:v50 withFormatter:v61];
  v71[3] = v17;
  v70[4] = @"fullFirstEnd";
  uint64_t v18 = [v58 objectForKeyedSubscript:*MEMORY[0x1E4F6CFE0]];
  __int16 v19 = [(IMDCKSyncController *)self _stringForDate:v18 withFormatter:v61];
  v71[4] = v19;
  v70[5] = @"fullStart";
  int v20 = [v58 objectForKeyedSubscript:*MEMORY[0x1E4F6CFD0]];
  id v21 = [(IMDCKSyncController *)self _stringForDate:v20 withFormatter:v61];
  v71[5] = v21;
  v70[6] = @"fullEnd";
  uint64_t v22 = [v58 objectForKeyedSubscript:*MEMORY[0x1E4F6CFD8]];
  int v23 = [(IMDCKSyncController *)self _stringForDate:v22 withFormatter:v61];
  v71[6] = v23;
  v70[7] = @"last";
  id v24 = [v58 objectForKeyedSubscript:*MEMORY[0x1E4F6D130]];
  objc_super v25 = [(IMDCKSyncController *)self _stringForDate:v24 withFormatter:v61];
  v71[7] = v25;
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:8];

  v68[0] = @"chat";
  unint64_t v26 = [v62 getValueFromDomain:v59 forKey:@"Server.TotalRecords.chatManateeZone"];
  id v27 = [(IMDCKSyncController *)self _stringForObject:v26];
  v69[0] = v27;
  v68[1] = @"msg";
  __int16 v28 = [v62 getValueFromDomain:v59 forKey:@"Server.TotalRecords.messageManateeZone"];
  __int16 v29 = [(IMDCKSyncController *)self _stringForObject:v28];
  v69[1] = v29;
  v68[2] = @"att";
  __int16 v30 = [v62 getValueFromDomain:v59 forKey:@"Server.TotalRecords.attachmentManateeZone"];
  uint64_t v31 = [(IMDCKSyncController *)self _stringForObject:v30];
  v69[2] = v31;
  v68[3] = @"upd";
  __int16 v32 = [v62 getValueFromDomain:v59 forKey:@"Server.TotalRecords.messageUpdateZone"];
  xpc_activity_state_t v33 = [(IMDCKSyncController *)self _stringForObject:v32];
  v69[3] = v33;
  v68[4] = @"rdel";
  __int16 v34 = [v62 getValueFromDomain:v59 forKey:@"Server.TotalRecords.recoverableMessageDeleteZone"];
  id v35 = [(IMDCKSyncController *)self _stringForObject:v34];
  v69[4] = v35;
  id v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:5];

  uint64_t v36 = [v62 getValueFromDomain:v59 forKey:*MEMORY[0x1E4F6D1F8]];
  uint64_t v37 = [v62 getValueFromDomain:v59 forKey:@"IMD-IDS-Aliases"];
  v66[0] = @"total";
  objc_super v38 = NSNumber;
  id v39 = [v37 objectForKey:@"allAliases"];
  id v40 = objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "count"));
  v66[1] = @"active";
  v67[0] = v40;
  uint64_t v41 = NSNumber;
  unint64_t v42 = [v37 objectForKey:@"selectedAliases"];
  v43 = objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v42, "count"));
  v67[1] = v43;
  unint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];

  v64[0] = @"summary";
  v64[1] = @"syncDates";
  v64[2] = @"serverCounts";
  v64[3] = @"dbSummary";
  if (v36) {
    __int16 v45 = v36;
  }
  else {
    __int16 v45 = (void *)MEMORY[0x1E4F1CC08];
  }
  v65[2] = v57;
  v65[3] = v45;
  v64[5] = @"aliasesSummary";
  v65[0] = v49;
  v65[1] = v48;
  v64[4] = @"syncDbSummary";
  v65[4] = MEMORY[0x1E4F1CC08];
  v65[5] = v44;
  uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:6];

  return v46;
}

- (NSDate)syncStartDate
{
  return self->_syncStartDate;
}

- (void)setSyncStartDate:(id)a3
{
}

- (NSTimer)longRunningSyncTimer
{
  return self->_longRunningSyncTimer;
}

- (void)setLongRunningSyncTimer:(id)a3
{
}

- (IMTimer)nightlySyncTimer
{
  return self->_nightlySyncTimer;
}

- (void)setNightlySyncTimer:(id)a3
{
}

- (int64_t)initialSyncAttempts
{
  return self->_initialSyncAttempts;
}

- (void)setInitialSyncAttempts:(int64_t)a3
{
  self->_initialSyncAttempts = a3;
}

- (NSDate)lastLogDumpDate
{
  return self->_lastLogDumpDate;
}

- (void)setLastLogDumpDate:(id)a3
{
}

- (NSDate)lastRestoreFailureLogDumpDate
{
  return self->_lastRestoreFailureLogDumpDate;
}

- (void)setLastRestoreFailureLogDumpDate:(id)a3
{
}

- (BOOL)shouldReloadConversations
{
  return self->_shouldReloadConversations;
}

- (void)setShouldReloadConversations:(BOOL)a3
{
  self->_shouldReloadConversations = a3;
}

- (NSTimer)reloadTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setReloadTimer:(id)a3
{
}

- (IMSyncResumer)syncResumer
{
  return self->_syncResumer;
}

- (void)setSyncResumer:(id)a3
{
}

- (IMStateCaptureAssistant)stateCaptureAssistant
{
  return self->_stateCaptureAssistant;
}

- (void)setStateCaptureAssistant:(id)a3
{
}

- (BOOL)isFetchingExitForEnablement
{
  return self->_isFetchingExitForEnablement;
}

- (void)setIsFetchingExitForEnablement:(BOOL)a3
{
  self->_isFetchingExitForEnablement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssistant, 0);
  objc_storeStrong((id *)&self->_syncResumer, 0);
  objc_storeStrong((id *)&self->_reloadTimer, 0);
  objc_storeStrong((id *)&self->_lastRestoreFailureLogDumpDate, 0);
  objc_storeStrong((id *)&self->_lastLogDumpDate, 0);
  objc_storeStrong((id *)&self->_nightlySyncTimer, 0);
  objc_storeStrong((id *)&self->_longRunningSyncTimer, 0);

  objc_storeStrong((id *)&self->_syncStartDate, 0);
}

@end