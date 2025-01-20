@interface IMCloudKitHooks
+ (id)logHandle;
+ (id)sharedInstance;
+ (void)__setSingleton__im:(id)a3;
- (BOOL)eligibleForTruthZone;
- (BOOL)isDisablingDevices;
- (BOOL)isEnabled;
- (BOOL)isInExitState;
- (BOOL)isStartingSync;
- (BOOL)isSyncing;
- (BOOL)mocAccountsMatch;
- (BOOL)rampedIntoTruthZone;
- (BOOL)removedFromiCloudBackup;
- (BOOL)serverBagAllowsOnboarding;
- (BOOL)shouldOptimizeAttachmentStorage;
- (BOOL)shouldShowCloudKitUI;
- (IMCloudKitHooks)init;
- (id)exitDate;
- (id)lastSyncDate;
- (id)logHandle;
- (id)syncStateDictionary;
- (int64_t)isChangingEnabledState;
- (void)_didAttemptToDisableAllDevicesResult:(BOOL)a3;
- (void)_didAttemptToSetEnabledTo:(BOOL)a3 result:(BOOL)a4;
- (void)_didPerformAdditionalStorageRequiredCheckWithSuccess:(BOOL)a3 additionalStorageRequired:(unint64_t)a4 forAccountId:(id)a5 error:(id)a6;
- (void)_updateCloudKitProgressWithDictionary:(id)a3;
- (void)_updateCloudKitState;
- (void)_updateCloudKitStateWithDictionary:(id)a3;
- (void)broadcastCloudKitState;
- (void)broadcastCloudKitStateAfterClearingErrors;
- (void)broadcastCloudKitStateAfterFetchingAccountStatus;
- (void)cancelSync:(id)a3;
- (void)clearAnalyticDefaultsAndLocalSyncState;
- (void)clearChatZoneSyncToken;
- (void)clearDataFromCloudKit;
- (void)clearLocalSyncState;
- (void)clearTombStoneMessagesTable;
- (void)createAttachmentZone;
- (void)createChatZone;
- (void)currentStorageOnDeviceWithReply:(id)a3;
- (void)deleteAttachmentZone;
- (void)deleteChatZone;
- (void)deleteExitRecord;
- (void)deleteMessagesZone;
- (void)deleteSalt;
- (void)downloadAttachmentAssets;
- (void)fetchAccountStatusAndUpdateMiCSwitchEligibility;
- (void)fetchCloudKitSyncStateDebuggingInfo:(id)a3;
- (void)fetchExitRecord;
- (void)fetchLatestRampState;
- (void)fetchLatestSalt;
- (void)fetchSyncStateStatistics;
- (void)initiatePeriodicSync;
- (void)initiateSync:(id)a3 forceRunNow:(BOOL)a4 reply:(id)a5;
- (void)loadDeletedMessagesWithLimit:(int64_t)a3;
- (void)loadDirtyMessagesWithLimit:(int64_t)a3;
- (void)markAllChatsAsDirty;
- (void)metricAttachments:(int64_t)a3;
- (void)performAdditionalStorageRequiredCheck;
- (void)printCachedRampState;
- (void)printCachedSalt;
- (void)purgeAttachments:(int64_t)a3;
- (void)removePathFromiCloudBackups:(id)a3;
- (void)reportMetricToCK:(id)a3;
- (void)reportMetricToCK:(id)a3 withDict:(id)a4;
- (void)reportMetricToCK:(id)a3 withSuccess:(BOOL)a4;
- (void)sendRestoreFailuresLogDumps;
- (void)setEnabled:(BOOL)a3;
- (void)setiCloudBackupsDisabled:(BOOL)a3;
- (void)setupIMCloudKitHooks;
- (void)simulateCloudKitSyncWithSyncState:(id)a3;
- (void)startUserInitiatedSync;
- (void)syncAttachments;
- (void)syncChats;
- (void)syncDeletesToCloudKit;
- (void)syncMessages;
- (void)toggleiCloudBackupsIfNeeded;
- (void)tryToAutoCollectLogsWithErrorString:(id)a3 sendLogsTo:(id)a4;
- (void)tryToDisableAllDevices;
- (void)updateAttachmentFileSizes;
- (void)uploadDailyAnalyticstoCloudKit;
- (void)writeAttachments;
- (void)writeCloudKitSyncCounts:(id)a3;
- (void)writeDirtyChats;
- (void)writeDirtyMessages;
- (void)writeExitRecord;
@end

@implementation IMCloudKitHooks

- (BOOL)mocAccountsMatch
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = IMGetDomainBoolForKey();
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = @"NO";
      if (v2) {
        v4 = @"YES";
      }
      int v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "iCloud and iMessage accounts match ? %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v2;
}

- (IMCloudKitHooks)init
{
  v4.receiver = self;
  v4.super_class = (Class)IMCloudKitHooks;
  int v2 = [(IMCloudKitHooks *)&v4 init];
  if (v2) {
    dispatch_async(MEMORY[0x1E4F14428], &unk_1EF8E4210);
  }
  return v2;
}

- (BOOL)isEnabled
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = IMGetDomainBoolForKeyWithDefaultValue();
  int v3 = IMGetDomainBoolForKeyWithDefaultValue();
  if (IMOSLoggingEnabled())
  {
    objc_super v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = @"NO";
      if (v2) {
        int v6 = @"YES";
      }
      else {
        int v6 = @"NO";
      }
      if (v3) {
        v5 = @"YES";
      }
      int v8 = 138412546;
      v9 = v6;
      __int16 v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "isEnabled returning = isCloudKitEnabled = %@ isInExitState(%@) ", (uint8_t *)&v8, 0x16u);
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4AFDC40;
  block[3] = &unk_1E5B7B2A8;
  block[4] = a1;
  if (qword_1EB3F2340 != -1) {
    dispatch_once(&qword_1EB3F2340, block);
  }
  int v2 = (void *)qword_1EB3F2320;

  return v2;
}

- (void)_updateCloudKitStateWithDictionary:(id)a3
{
  id v4 = a3;
  int v8 = objc_msgSend_logHandle(self, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1A4CBAC98((uint64_t)v4, v8);
  }

  uint64_t v12 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10, v11);
  objc_msgSend_postNotificationName_object_userInfo_(v12, v13, @"com.apple.IMCore.IMCloudKitHooks.ValuesChanged", (uint64_t)self, v4);
}

- (id)logHandle
{
  int v2 = objc_opt_class();

  return (id)objc_msgSend_logHandle(v2, v3, v4, v5);
}

+ (id)logHandle
{
  if (qword_1EB3F2300 != -1) {
    dispatch_once(&qword_1EB3F2300, &unk_1EF8E5958);
  }
  int v2 = (void *)qword_1EB3F2318;

  return v2;
}

- (void)broadcastCloudKitState
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_broadcastCloudKitState(v7, v4, v5, v6);
}

+ (void)__setSingleton__im:(id)a3
{
}

- (void)uploadDailyAnalyticstoCloudKit
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uploadDailyAnalyticstoCloudKit(v7, v4, v5, v6);
}

- (void)clearAnalyticDefaultsAndLocalSyncState
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearAnalyticDefaultsAndLocalSyncState(v7, v4, v5, v6);
}

- (void)setupIMCloudKitHooks
{
  uint64_t v4 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], a2, v2, v3);
  objc_msgSend_bundleIdentifier(v4, v5, v6, v7);
  v22 = (char *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend_stringWithFormat_(NSString, v22, @"%@-CloudKitHooks", v8, v22);
  v13 = objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
  objc_msgSend_addListenerID_capabilities_(v13, v14, (uint64_t)v9, *MEMORY[0x1E4F6C4F0] | 0x40000000u);

  v18 = objc_msgSend_sharedInstance(IMDaemonController, v15, v16, v17);
  objc_msgSend_blockUntilConnected(v18, v19, v20, v21);
}

- (void)createChatZone
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createChatZone(v7, v4, v5, v6);
}

- (void)writeDirtyChats
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeDirtyChats(v7, v4, v5, v6);
}

- (void)deleteChatZone
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteChatZone(v7, v4, v5, v6);
}

- (void)syncChats
{
  IMSetDomainBoolForKey();
  objc_msgSend__updateCloudKitState(self, v3, v4, v5);
  objc_msgSend_sharedInstance(IMDaemonController, v6, v7, v8);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncChats(v12, v9, v10, v11);
}

- (void)markAllChatsAsDirty
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_markAllChatsAsDirty(v7, v4, v5, v6);
}

- (void)clearChatZoneSyncToken
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearChatZoneSyncToken(v7, v4, v5, v6);
}

- (void)createAttachmentZone
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createAttachmentZone(v7, v4, v5, v6);
}

- (void)writeAttachments
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttachments(v7, v4, v5, v6);
}

- (void)syncAttachments
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncAttachments(v7, v4, v5, v6);
}

- (void)deleteAttachmentZone
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteAttachmentZone(v7, v4, v5, v6);
}

- (void)writeDirtyMessages
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeDirtyMessages(v7, v4, v5, v6);
}

- (void)deleteMessagesZone
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteMessagesZone(v7, v4, v5, v6);
}

- (void)writeExitRecord
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeExitRecord(v7, v4, v5, v6);
}

- (void)fetchExitRecord
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchExitRecord(v7, v4, v5, v6);
}

- (void)deleteExitRecord
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteExitRecord(v7, v4, v5, v6);
}

- (void)syncMessages
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncMessages(v7, v4, v5, v6);
}

- (void)downloadAttachmentAssets
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_downloadAttachmentAssets(v7, v4, v5, v6);
}

- (void)initiatePeriodicSync
{
  IMSetDomainBoolForKey();
  objc_msgSend__updateCloudKitState(self, v3, v4, v5);
  objc_msgSend_sharedInstance(IMDaemonController, v6, v7, v8);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_initiatePeriodicSync(v12, v9, v10, v11);
}

- (void)startUserInitiatedSync
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startUserInitiatedSync(v7, v4, v5, v6);
}

- (void)loadDirtyMessagesWithLimit:(int64_t)a3
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loadDirtyMessagesWithLimit_(v7, v5, a3, v6);
}

- (void)clearLocalSyncState
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearLocalCloudKitSyncState(v7, v4, v5, v6);
}

- (void)clearDataFromCloudKit
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearDataFromCloudKit(v7, v4, v5, v6);
}

- (void)sendRestoreFailuresLogDumps
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendRestoreFailuresLogDumps(v7, v4, v5, v6);
}

- (BOOL)shouldShowCloudKitUI
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int isEnabled = objc_msgSend_isEnabled(self, a2, v2, v3);
  int v9 = objc_msgSend_eligibleForTruthZone(self, v6, v7, v8);
  int v13 = objc_msgSend_rampedIntoTruthZone(self, v10, v11, v12);
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = @"NO";
      if (isEnabled) {
        uint64_t v16 = @"YES";
      }
      else {
        uint64_t v16 = @"NO";
      }
      if (v9) {
        uint64_t v17 = @"YES";
      }
      else {
        uint64_t v17 = @"NO";
      }
      int v19 = 138412802;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      v22 = v17;
      if (v13) {
        v15 = @"YES";
      }
      __int16 v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "shouldShowCloudKitUI - isEnabled(%@) eligibleForTruthZone(%@), rampedIntoTruthZone(%@)", (uint8_t *)&v19, 0x20u);
    }
  }
  return v9 & ~(_BYTE)isEnabled & v13;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3) {
    objc_msgSend_numberWithInteger_(NSNumber, a2, 1, v3);
  }
  else {
  uint64_t v6 = objc_msgSend_numberWithInteger_(NSNumber, a2, 2, v3);
  }
  IMSetDomainValueForKey();

  objc_msgSend__updateCloudKitState(self, v7, v8, v9);
  if (IMOSLoggingEnabled())
  {
    int v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = IMStringFromCloudKitChangingSettingState();
      int v18 = 138412290;
      int v19 = v14;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Setting cloudkit enabled to state: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  v15 = objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
  objc_msgSend_setCloudKitEnabled_(v15, v16, v4, v17);
}

- (void)currentStorageOnDeviceWithReply:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Calculating current storage on device for iCloud", v11, 2u);
    }
  }
  uint64_t v8 = objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  objc_msgSend_currentStorageOnDeviceWithReply_(v8, v9, (uint64_t)v3, v10);
}

- (void)performAdditionalStorageRequiredCheck
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Request to check if additinal storage is required to store all messages", v10, 2u);
    }
  }
  uint64_t v6 = objc_msgSend_sharedInstance(IMDaemonController, v2, v3, v4);
  objc_msgSend_performAdditionalStorageRequiredCheck(v6, v7, v8, v9);
}

- (void)fetchAccountStatusAndUpdateMiCSwitchEligibility
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchAccountStatusAndUpdateMiCSwitchEligibility(v7, v4, v5, v6);
}

- (void)tryToDisableAllDevices
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "Request to try and disable cloudkit on all devices", v14, 2u);
    }
  }
  IMSetDomainBoolForKey();
  objc_msgSend__updateCloudKitState(self, v4, v5, v6);
  uint64_t v10 = objc_msgSend_sharedInstance(IMDaemonController, v7, v8, v9);
  objc_msgSend_tryToDisableAllDevices(v10, v11, v12, v13);
}

- (BOOL)removedFromiCloudBackup
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = IMGetDomainBoolForKeyWithDefaultValue();
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = @"NO";
      if (v2) {
        uint64_t v4 = @"YES";
      }
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "removedFromiCloudBackup returning = %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v2;
}

- (BOOL)rampedIntoTruthZone
{
  if (IMOSLoggingEnabled())
  {
    int v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1A4AF7000, v2, OS_LOG_TYPE_INFO, "rampedIntoTruthZone always returning YES, this shouldn't be called anymore.", v4, 2u);
    }
  }
  return 1;
}

- (BOOL)eligibleForTruthZone
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = IMGetDomainBoolForKeyWithDefaultValue();
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = @"NO";
      if (v2) {
        uint64_t v4 = @"YES";
      }
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "eligibleForTruthZone returning = %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v2;
}

- (BOOL)shouldOptimizeAttachmentStorage
{
  return 1;
}

- (void)initiateSync:(id)a3 forceRunNow:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Initiating sync phase %@", (uint8_t *)&v19, 0xCu);
    }
  }
  IMSetDomainBoolForKey();
  objc_msgSend__updateCloudKitState(self, v11, v12, v13);
  uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
  objc_msgSend_initiateSync_forceRunNow_reply_(v17, v18, (uint64_t)v8, v6, v9);
}

- (void)cancelSync:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Sync cancellation requested", v11, 2u);
    }
  }
  id v8 = objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  objc_msgSend_cancelSync_(v8, v9, (uint64_t)v3, v10);
}

- (BOOL)isStartingSync
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMGetDomainBoolForKeyWithDefaultValue()) {
    int v2 = 1;
  }
  else {
    int v2 = IMGetDomainBoolForKeyWithDefaultValue();
  }
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = @"NO";
      if (v2) {
        uint64_t v4 = @"YES";
      }
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "isStartingSync returning = %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v2;
}

- (BOOL)isSyncing
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isMessagesIniCloudVersion2 = objc_msgSend_isMessagesIniCloudVersion2(v4, v5, v6, v7);

  if (isMessagesIniCloudVersion2)
  {
    id v9 = IMGetCachedDomainValueForKey();
    uint64_t v13 = objc_msgSend_unsignedIntegerValue(v9, v10, v11, v12);
    LOBYTE(v14) = v13 != 0;
    int v15 = IMOSLoggingEnabled();
    if (v13)
    {
      if (v15)
      {
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "isSyncing returning = YES", (uint8_t *)&v19, 2u);
        }
LABEL_16:
      }
    }
    else if (v15)
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "isSyncing returning = NO", (uint8_t *)&v19, 2u);
      }
      goto LABEL_16;
    }
LABEL_17:

    return v14;
  }
  int v14 = IMGetDomainBoolForKeyWithDefaultValue();
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = @"NO";
      if (v14) {
        uint64_t v17 = @"YES";
      }
      int v19 = 138412290;
      id v20 = v17;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "isSyncing returning = %@", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_17;
  }
  return v14;
}

- (id)lastSyncDate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IMGetCachedDomainValueForKey();
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      uint64_t v6 = v2;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "Requesting last sync date: %@", (uint8_t *)&v5, 0xCu);
    }
  }

  return v2;
}

- (void)_didAttemptToSetEnabledTo:(BOOL)a3 result:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = @"NO";
      if (v5) {
        uint64_t v8 = @"YES";
      }
      else {
        uint64_t v8 = @"NO";
      }
      if (v4) {
        uint64_t v7 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      int v15 = v7;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "didAttemptToSetEnabledTo returned: targetEnabled:%@ result%@ clients should update values", buf, 0x16u);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4C8B6D8;
  block[3] = &unk_1E5B7FA50;
  BOOL v10 = v4;
  BOOL v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (int64_t)isChangingEnabledState
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IMGetCachedDomainValueForKey();
  uint64_t v6 = v2;
  if (v2) {
    int64_t v7 = objc_msgSend_integerValue(v2, v3, v4, v5);
  }
  else {
    int64_t v7 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = IMStringFromCloudKitChangingSettingState();
      int v11 = 138412290;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "isChangingEnabledState returning = %@", (uint8_t *)&v11, 0xCu);
    }
  }

  return v7;
}

- (void)_didPerformAdditionalStorageRequiredCheckWithSuccess:(BOOL)a3 additionalStorageRequired:(unint64_t)a4 forAccountId:(id)a5 error:(id)a6
{
  BOOL v8 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  if (IMOSLoggingEnabled())
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = @"NO";
      *(_DWORD *)buf = 138413058;
      if (v8) {
        uint64_t v12 = @"YES";
      }
      uint64_t v21 = v12;
      __int16 v22 = 2048;
      unint64_t v23 = a4;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v10;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "didPerformAdditionalStorageRequiredCheck returned with success: %@, additionalStorageRequired %llu for iCloud account id %@, error: %@", buf, 0x2Au);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1A4C8BABC;
  v15[3] = &unk_1E5B7FA98;
  BOOL v19 = v8;
  id v17 = v10;
  unint64_t v18 = a4;
  id v16 = v9;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

- (BOOL)isDisablingDevices
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = IMGetDomainBoolForKeyWithDefaultValue();
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = @"NO";
      if (v2) {
        uint64_t v4 = @"YES";
      }
      int v6 = 138412290;
      int64_t v7 = v4;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "isDisabling devices returning = %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v2;
}

- (void)_didAttemptToDisableAllDevicesResult:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = @"NO";
      if (v3) {
        uint64_t v5 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "_didAttemptToDisableAllDevicesResult returned: result:%@ clients should update values", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4C8BE18;
  block[3] = &unk_1E5B7E9F8;
  BOOL v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (BOOL)isInExitState
{
  return IMGetDomainBoolForKeyWithDefaultValue();
}

- (id)exitDate
{
  return (id)IMGetCachedDomainValueForKey();
}

- (void)_updateCloudKitProgressWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_logHandle(self, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1A4CBAD10((uint64_t)v4, v8);
  }

  uint64_t v12 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10, v11);
  objc_msgSend_postNotificationName_object_userInfo_(v12, v13, @"com.apple.IMCore.IMCloudKitHooks.ProgressChanged", (uint64_t)self, v4);
}

- (void)_updateCloudKitState
{
  uint64_t v5 = objc_msgSend_logHandle(self, a2, v2, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1A4CBAD88(v5);
  }

  id v9 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v6, v7, v8);
  char isMessagesIniCloudVersion2 = objc_msgSend_isMessagesIniCloudVersion2(v9, v10, v11, v12);

  if ((isMessagesIniCloudVersion2 & 1) == 0)
  {
    id v17 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v14, v15, v16);
    uint64_t v21 = objc_msgSend_syncStateDictionary(self, v18, v19, v20);
    objc_msgSend_postNotificationName_object_userInfo_(v17, v22, @"com.apple.IMCore.IMCloudKitHooks.ValuesChanged", (uint64_t)self, v21);
  }
}

- (void)loadDeletedMessagesWithLimit:(int64_t)a3
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loadDeletedMessagesWithLimit_(v7, v5, a3, v6);
}

- (void)clearTombStoneMessagesTable
{
}

- (void)fetchLatestSalt
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchLatestSalt(v7, v4, v5, v6);
}

- (void)printCachedSalt
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_printCachedSalt(v7, v4, v5, v6);
}

- (void)deleteSalt
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteSalt(v7, v4, v5, v6);
}

- (void)metricAttachments:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      int64_t v12 = a3;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Metric attachments in cloudkit hooks bytes: %lld", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  objc_msgSend_metricAttachments_(v8, v9, a3, v10);
}

- (void)purgeAttachments:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      int64_t v12 = a3;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Purge attachments in cloudkit hooks bytes: %lld", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  objc_msgSend_purgeAttachments_(v8, v9, a3, v10);
}

- (void)updateAttachmentFileSizes
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Update attachment file sizes", v10, 2u);
    }
  }
  uint64_t v6 = objc_msgSend_sharedInstance(IMDaemonController, v2, v3, v4);
  objc_msgSend_updateAttachmentFileSizes(v6, v7, v8, v9);
}

- (void)fetchSyncStateStatistics
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchSyncStateStatistics(v7, v4, v5, v6);
}

- (void)writeCloudKitSyncCounts:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeCloudKitSyncCounts_(v9, v7, (uint64_t)v3, v8);
}

- (void)toggleiCloudBackupsIfNeeded
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_toggleiCloudBackupsIfNeeded(v7, v4, v5, v6);
}

- (void)setiCloudBackupsDisabled:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, a2, a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setiCloudBackupsDisabled_(v7, v5, v4, v6);
}

- (void)removePathFromiCloudBackups:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removePathFromiCloudBackups_(v9, v7, (uint64_t)v3, v8);
}

- (void)fetchLatestRampState
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchLatestRampState(v7, v4, v5, v6);
}

- (void)printCachedRampState
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_printCachedRampState(v7, v4, v5, v6);
}

- (void)syncDeletesToCloudKit
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncDeletesToCloudKit(v7, v4, v5, v6);
}

- (id)syncStateDictionary
{
  return (id)MEMORY[0x1F4123FB8](self, a2);
}

- (void)fetchCloudKitSyncStateDebuggingInfo:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Fetching sync state debugging info…", v11, 2u);
    }
  }
  uint64_t v8 = objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  objc_msgSend_fetchCloudKitSyncStateDebuggingInfo_(v8, v9, (uint64_t)v3, v10);
}

- (void)simulateCloudKitSyncWithSyncState:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Simulating sync with sync state", v11, 2u);
    }
  }
  uint64_t v8 = objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  objc_msgSend_simulateCloudKitSyncWithSyncState_(v8, v9, (uint64_t)v3, v10);
}

- (void)tryToAutoCollectLogsWithErrorString:(id)a3 sendLogsTo:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Auto collecting logs because:(%@), sending to %@", (uint8_t *)&v13, 0x16u);
    }
  }
  int v11 = objc_msgSend_sharedInstance(IMDaemonController, v7, v8, v9);
  objc_msgSend_tryToAutoCollectLogsWithErrorString_sendLogsTo_(v11, v12, (uint64_t)v5, (uint64_t)v6);
}

- (void)broadcastCloudKitStateAfterFetchingAccountStatus
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_broadcastCloudKitStateAfterFetchingAccountStatus(v7, v4, v5, v6);
}

- (void)broadcastCloudKitStateAfterClearingErrors
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_broadcastCloudKitStateAfterClearingErrors(v7, v4, v5, v6);
}

- (void)reportMetricToCK:(id)a3
{
}

- (void)reportMetricToCK:(id)a3 withSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v14 = @"syncSuccess";
  uint64_t v6 = NSNumber;
  id v7 = a3;
  uint64_t v10 = objc_msgSend_numberWithBool_(v6, v8, v4, v9);
  v15[0] = v10;
  int64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v15, (uint64_t)&v14, 1);

  objc_msgSend_reportMetricToCK_withDict_(self, v13, (uint64_t)v7, (uint64_t)v12);
}

- (void)reportMetricToCK:(id)a3 withDict:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reportMetricToCK_withDict_(v11, v10, (uint64_t)v6, (uint64_t)v5);
}

- (BOOL)serverBagAllowsOnboarding
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IMBagIntValueWithDefault();
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v6 = objc_msgSend_numberWithLongLong_(NSNumber, v4, v2, v5);
      int v8 = 138412546;
      uint64_t v9 = &unk_1EF914608;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "Onboarding local version: %@, server version: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  return v2 < 2;
}

@end