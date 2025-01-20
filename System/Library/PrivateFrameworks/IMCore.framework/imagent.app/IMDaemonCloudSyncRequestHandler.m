@interface IMDaemonCloudSyncRequestHandler
- (id)rampStateDictionaryFromPromoted:(BOOL)a3 featureHadServerError:(BOOL)a4;
- (void)broadcastCloudKitState;
- (void)broadcastCloudKitStateAfterClearingErrors;
- (void)broadcastCloudKitStateAfterFetchingAccountStatus;
- (void)cancelSync:(id)a3;
- (void)clearAnalyticDefaultsAndLocalSyncState;
- (void)clearChatZoneSyncToken;
- (void)clearDataFromCloudKit;
- (void)clearLocalCloudKitSyncState;
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
- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4;
- (void)markAllChatsAsDirty;
- (void)metricAttachments:(int64_t)a3;
- (void)performAdditionalStorageRequiredCheck;
- (void)printCachedRampState;
- (void)printCachedSalt;
- (void)purgeAttachments:(int64_t)a3;
- (void)removePathFromiCloudBackups:(id)a3;
- (void)reportMetricToCK:(id)a3 withDict:(id)a4;
- (void)sendRestoreFailuresLogDumps;
- (void)setCloudKitEnabled:(BOOL)a3;
- (void)setiCloudBackupsDisabled:(BOOL)a3;
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

@implementation IMDaemonCloudSyncRequestHandler

- (void)broadcastCloudKitStateAfterFetchingAccountStatus
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Requested to broadcast CloudKit state after fetching account status", v4, 2u);
    }
  }
  v3 = +[IMDCKUtilities sharedInstance];
  [v3 broadcastCloudKitStateAfterFetchingAccountStatus];
}

- (void)broadcastCloudKitState
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Requested to broadcast CloudKit state", v4, 2u);
    }
  }
  v3 = +[IMDCKUtilities sharedInstance];
  [v3 broadcastCloudKitState];
}

- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = +[IMDCKUtilities sharedInstance];
  [v6 logDumpAndSendMessageTo:v5 forHours:v4 reason:@"IMToolRequest"];
}

- (void)createChatZone
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request to create chat zone", v4, 2u);
    }
  }
  v3 = +[IMDRecordZoneManager sharedInstance];
  [v3 createChatZoneIfNeededWithCompletionBlock:&stru_1000719D0];
}

- (void)writeDirtyChats
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request to write all dirty chats", v3, 2u);
    }
  }
}

- (void)deleteChatZone
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request to delet chat zone and nuke chat sync token", v4, 2u);
    }
  }
  v3 = +[IMDCKChatSyncController sharedInstance];
  [v3 deleteChatZone];
}

- (void)fetchAccountStatusAndUpdateMiCSwitchEligibility
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request to fetch security level and update MiC switch eligibility", v4, 2u);
    }
  }
  v3 = +[IMDCKUtilities sharedInstance];
  [v3 fetchAccountStatusAndUpdateMiCSwitchEligibility];
}

- (void)syncChats
{
  id v2 = +[IMDCKSyncController sharedInstance];
  [v2 beginChatSyncPeriodic:0 activity:0];
}

- (void)markAllChatsAsDirty
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request to mark all chats as dirty", v4, 2u);
    }
  }
  v3 = +[IMDChatStore sharedInstance];
  [v3 enumerateBatchedChatsFilteredUsingPredicate:0 block:&stru_100071A10];
}

- (void)clearChatZoneSyncToken
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request to clear chat sync token", v4, 2u);
    }
  }
  v3 = +[IMDCKChatSyncController sharedInstance];
  [v3 deleteChatSyncToken];
}

- (void)createAttachmentZone
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request to create attachment zone", v4, 2u);
    }
  }
  v3 = +[IMDRecordZoneManager sharedInstance];
  [v3 createAttachmentZoneIfNeededWithCompletionBlock:&stru_100071A30];
}

- (void)deleteAttachmentZone
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request to delete attachment zone", v4, 2u);
    }
  }
  v3 = +[IMDRecordZoneManager sharedInstance];
  [v3 deleteAttachmentZone];
}

- (void)writeAttachments
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request to write all attachments", v4, 2u);
    }
  }
  v3 = +[IMDCKAttachmentSyncController sharedInstance];
  [v3 syncAttachmentsWithSyncType:2 deviceConditionsToCheck:0 activity:0 completionBlock:0];
}

- (void)syncAttachments
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request to sync all attachments", v4, 2u);
    }
  }
  v3 = +[IMDCKAttachmentSyncController sharedInstance];
  [v3 syncAttachmentsWithSyncType:0 deviceConditionsToCheck:0 activity:0 completionBlock:0];
}

- (void)downloadAttachmentAssets
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request to download CloudKit attachment assets", v4, 2u);
    }
  }
  v3 = +[IMDCKAttachmentSyncController sharedInstance];
  [v3 downloadAttachmentAssetsWithActivity:0 restoringAttachments:1 completion:0];
}

- (void)writeDirtyMessages
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request to write all dirty messages", v4, 2u);
    }
  }
  v3 = +[IMDCKMessageSyncController sharedInstance];
  [v3 syncMessagesWithSyncType:2 deviceConditionsToCheck:0 activity:0 completionBlock:0];
}

- (void)deleteMessagesZone
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request to delete message zone", v4, 2u);
    }
  }
  v3 = +[IMDCKMessageSyncController sharedInstance];
  [v3 deleteMessagesZone];
}

- (void)syncMessages
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request to sync with messages zone", v4, 2u);
    }
  }
  v3 = +[IMDCKMessageSyncController sharedInstance];
  [v3 syncMessagesWithSyncType:1 deviceConditionsToCheck:0 activity:0 completionBlock:0];
}

- (void)writeExitRecord
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Requesting to write Exit record for current date", v5, 2u);
    }
  }
  v3 = +[IMDCKExitManager sharedInstance];
  uint64_t v4 = +[NSDate date];
  [v3 writeExitRecordWithDate:v4 completion:&stru_100071A50];
}

- (void)fetchExitRecord
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Requesting to fetch exit record", v4, 2u);
    }
  }
  v3 = +[IMDCKExitManager sharedInstance];
  [v3 exitRecordDateWithCompletion:&stru_100071A90];
}

- (void)deleteExitRecord
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Requesting to delete exit record", v4, 2u);
    }
  }
  v3 = +[IMDCKExitManager sharedInstance];
  [v3 deleteExitRecordWithCompletion:&stru_100071AB0];
}

- (void)setCloudKitEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[IMDCKUtilities sharedInstance];
  [v4 setCloudKitEnabled:v3];
}

- (void)tryToDisableAllDevices
{
  id v2 = +[IMDCKUtilities sharedInstance];
  [v2 disableAllDevicesWithCompletion:&stru_100071AF0];
}

- (void)initiateSync:(id)a3 forceRunNow:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = (void (**)(id, uint64_t, _UNKNOWN **))a5;
  v9 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v10 = [v9 isMessagesIniCloudVersion2];

  int v11 = IMOSLoggingEnabled();
  if (v10)
  {
    if (v11)
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        CFStringRef v13 = @"NO";
        if (v6) {
          CFStringRef v13 = @"YES";
        }
        int v16 = 138412546;
        id v17 = v7;
        __int16 v18 = 2112;
        CFStringRef v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Trying to initiate sync for %@ forceRunNow %@", (uint8_t *)&v16, 0x16u);
      }
    }
    +[IMDMessagesSyncCoordinator initiateSync:v7 forceRunNow:v6 reply:v8];
  }
  else
  {
    if (v11)
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "beginning initial sync", (uint8_t *)&v16, 2u);
      }
    }
    v15 = +[IMDCKSyncController sharedInstance];
    [v15 beginInitialSyncWithActivity:0];

    if (v8) {
      v8[2](v8, 1, &off_100073490);
    }
  }
}

- (void)cancelSync:(id)a3
{
  BOOL v3 = (void (**)(id, uint64_t, id))a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Attempting to cancel sync", v7, 2u);
    }
  }
  id v5 = +[IMDCKSyncController sharedInstance];
  BOOL v6 = [v5 syncState];

  [v6 setSyncCancelled:1];
  v3[2](v3, 1, [v6 syncType]);
}

- (void)initiatePeriodicSync
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "beginning periodic sync and setting priority ramp request default", v4, 2u);
    }
  }
  BOOL v3 = +[IMDCKSyncController sharedInstance];
  [v3 beginPeriodicSyncWithChecks:2 priority:XPC_ACTIVITY_PRIORITY_UTILITY reason:@"SPI_initiated"];
}

- (void)startUserInitiatedSync
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "beginning user initiated sync", v4, 2u);
    }
  }
  BOOL v3 = +[IMDCKSyncController sharedInstance];
  [v3 beginUserInitiatedSync];
}

- (void)loadDirtyMessagesWithLimit:(int64_t)a3
{
  id v4 = +[IMDMessageStore sharedInstance];
}

- (void)loadDeletedMessagesWithLimit:(int64_t)a3
{
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 134217984;
      int64_t v7 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "loadDeleted messages with limit %ld", (uint8_t *)&v6, 0xCu);
    }
  }
  id v5 = +[IMDMessageStore sharedInstance];
}

- (void)clearLocalCloudKitSyncState
{
  id v2 = +[IMDCKUtilities sharedInstance];
  [v2 clearLocalCloudKitSyncState:3];

  id v3 = +[IMCoreAutomationNotifications sharedInstance];
  [v3 postCoreAutomationNotificationWithAction:@"clearLocalCloudKitSyncState"];
}

- (void)sendRestoreFailuresLogDumps
{
  id v2 = +[IMDCKSyncController sharedInstance];
  [v2 sendRestoreFailuresLogDumps];
}

- (void)clearDataFromCloudKit
{
  id v2 = +[IMDRecordZoneManager sharedInstance];
  [v2 deleteAllZones];

  id v3 = +[IMDCKChatSyncController sharedInstance];
  [v3 deleteChatZone];

  id v4 = +[IMDCKMessageSyncController sharedInstance];
  [v4 deleteMessagesZone];

  id v5 = +[IMDCKAttachmentSyncController sharedInstance];
  [v5 deleteAttachmentZone];

  int v6 = +[IMDCKRecordSaltManager sharedInstance];
  [v6 deleteDeDupeRecordZone];

  int64_t v7 = +[IMDCKUpdateSyncController sharedInstance];
  [v7 deleteUpdateZone];

  v8 = +[IMDCKRecoverableMessageSyncController sharedInstance];
  [v8 deleteRecoverableMessageZone];

  v9 = +[IMDCKSyncController sharedInstance];
  [v9 clearCKRelatedDefaults];

  id v10 = +[IMCoreAutomationNotifications sharedInstance];
  [v10 postCoreAutomationNotificationWithAction:@"clearDataFromCloudKit"];
}

- (void)currentStorageOnDeviceWithReply:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023BC4;
  block[3] = &unk_100071B18;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)performAdditionalStorageRequiredCheck
{
  id v2 = +[IMDCKUtilities sharedInstance];
  [v2 estimateQuotaAvailability:&stru_100071B58];
}

- (void)broadcastCloudKitStateAfterClearingErrors
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Requested to clear sync errors and broadcast CloudKit state", v4, 2u);
    }
  }
  id v3 = +[IMDCKUtilities sharedInstance];
  [v3 broadcastCloudKitStateAfterClearingErrors];
}

- (void)uploadDailyAnalyticstoCloudKit
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Requested to upload daily syncing analytics to CK", buf, 2u);
    }
  }
  id v3 = +[IMDCKSyncController sharedInstance];
  unsigned int v4 = [v3 logCloudKitAnalytics];

  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (!v5) {
      return;
    }
    int v6 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    __int16 v10 = 0;
    id v7 = "Uploaded analytics to CK.";
    v8 = (uint8_t *)&v10;
    goto LABEL_12;
  }
  if (!v5) {
    return;
  }
  int v6 = OSLogHandleForIMFoundationCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = 0;
    id v7 = "Did not upload analytics to CK.";
    v8 = (uint8_t *)&v9;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
  }
LABEL_13:
}

- (void)clearAnalyticDefaultsAndLocalSyncState
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Requested to clear analytic defaults and local sync state", v4, 2u);
    }
  }
  id v3 = +[IMDCKSyncController sharedInstance];
  [v3 clearAnalyticDefaultsAndLocalSyncState];
}

- (void)printCachedRampState
{
  id v2 = +[IMDCKRampManager sharedInstance];
  [v2 cachedRampState:&stru_100071B98];
}

- (void)updateAttachmentFileSizes
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Calling to update attachment file sizes", v4, 2u);
    }
  }
  id v3 = +[IMDCKCacheDeleteManager sharedInstance];
  [v3 updateAttachmentFileSizesWithActivity:0];
}

- (void)fetchSyncStateStatistics
{
  id v2 = IMDMessageRecordCalculateLocalCloudKitStatistics();
  if (v2)
  {
    id v3 = +[IMDefaults sharedInstance];
    [v3 setValue:v2 forDomain:IMCloudKitDefinesDomain forKey:IMDCKLocalDBStatsKey];

    unsigned int v4 = +[IMFeatureFlags sharedFeatureFlags];
    unsigned int v5 = [v4 isMessagesIniCloudVersion2];

    if (v5)
    {
      int v6 = [v2 mutableCopy];
      uint64_t v7 = +[IMDMessagesSyncCoordinator readServerCountsFromDefaults];
      v8 = (void *)v7;
      if (v7)
      {
        uint64_t v19 = IMDMessageRecordCloudKitStatisticServerCountsKey;
        uint64_t v20 = v7;
        __int16 v9 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        [v6 addEntriesFromDictionary:v9];
      }
      else
      {
        __int16 v9 = IMLogHandleForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10004CCFC(v9);
        }
      }

      if (IMOSLoggingEnabled())
      {
        CFStringRef v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = [v6 description];
          int v17 = 138412290;
          __int16 v18 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Fetching sync stats: %@", (uint8_t *)&v17, 0xCu);
        }
      }
      v15 = +[IMDBroadcastController sharedProvider];
      int v16 = [v15 broadcasterForAllListeners];
      [v16 didFetchSyncStateStats:v6];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v11 = [v2 description];
          int v17 = 138412290;
          __int16 v18 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Fetching sync stats: %@", (uint8_t *)&v17, 0xCu);
        }
      }
      int v6 = +[IMDBroadcastController sharedProvider];
      v12 = [v6 broadcasterForAllListeners];
      [v12 didFetchSyncStateStats:v2];
    }
  }
  else
  {
    int v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10004CCB8(v6);
    }
  }
}

- (void)toggleiCloudBackupsIfNeeded
{
  id v2 = +[IMDCKBackupController sharedInstance];
  [v2 toggleiCloudBackupsIfNeeded:&stru_100071BD8];
}

- (void)removePathFromiCloudBackups:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    unsigned int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = NSStringFromSelector(a2);
      int v8 = 138412546;
      __int16 v9 = v6;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ (%@)", (uint8_t *)&v8, 0x16u);
    }
  }
  uint64_t v7 = +[IMDCKBackupController sharedInstance];
  [v7 removePathFromiCloudBackup:v4];
}

- (void)setiCloudBackupsDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (IMOSLoggingEnabled())
  {
    unsigned int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = NSStringFromSelector(a2);
      uint64_t v7 = (void *)v6;
      CFStringRef v8 = @"NO";
      if (v3) {
        CFStringRef v8 = @"YES";
      }
      int v10 = 138412546;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      CFStringRef v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ (%@)", (uint8_t *)&v10, 0x16u);
    }
  }
  __int16 v9 = +[IMDCKBackupController sharedInstance];
  [v9 setICloudBackupsDisabled:v3];
}

- (void)writeCloudKitSyncCounts:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      unsigned int v5 = [v3 description];
      uint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_100072DA0];
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "set sync counts: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  _IMDMessageRecordSetCloudKitSyncCounts();
}

- (void)reportMetricToCK:(id)a3 withDict:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "post metric to analytic zone with opGroupName: %@, dict: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  CFStringRef v8 = +[IMDCKExitManager sharedInstance];
  [v8 submitCloudKitAnalyticWithOperationGroupName:v5 analyticDictionary:v6];
}

- (void)fetchCloudKitSyncStateDebuggingInfo:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDCKSyncController sharedInstance];
  id v5 = [v4 syncStateDebuggingInfo:v3];

  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "fetched cloudkit sync state debugging info: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  int v7 = +[IMDBroadcastController sharedProvider];
  CFStringRef v8 = [v7 broadcasterForAllListeners];
  [v8 didFetchCloudKitSyncDebuggingInfo:v5];
}

- (void)tryToAutoCollectLogsWithErrorString:(id)a3 sendLogsTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "tryToAutoCollectLogsWithErrorString called with error: %@ sendto:%@", (uint8_t *)&v9, 0x16u);
    }
  }
  CFStringRef v8 = +[IMDCKUtilities sharedInstance];
  [v8 reportMOCDebuggingErrorWithString:v5 internalOnly:1 initialSync:0 sendToHandle:v6];
}

- (void)simulateCloudKitSyncWithSyncState:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "simulateCloudKitSyncWithSyncState called with sync state %@", (uint8_t *)&v7, 0xCu);
    }
  }
  if (v3)
  {
    id v5 = +[IMDBroadcastController sharedProvider];
    id v6 = [v5 broadcasterForCloudSyncListeners];
    [v6 updateCloudKitStateWithDictionary:v3];
  }
}

- (void)metricAttachments:(int64_t)a3
{
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 134217984;
      int64_t v7 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Calling to metric attachments with bytes: %lld", (uint8_t *)&v6, 0xCu);
    }
  }
  id v5 = +[IMDCKCacheDeleteManager sharedInstance];
  [v5 metricAttachmentsToPurge:a3 withActivity:0];
}

- (void)purgeAttachments:(int64_t)a3
{
  id v4 = +[IMDCKUtilities sharedInstance];
  unsigned __int8 v5 = [v4 cacheDeleteEnabled];

  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      int64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 134217984;
        int64_t v11 = a3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Calling to purge attachments with bytes: %lld", (uint8_t *)&v10, 0xCu);
      }
    }
    id v8 = +[IMDCKCacheDeleteManager sharedInstance];
    [v8 purgeAttachments:a3];
    goto LABEL_13;
  }
  if (v6)
  {
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Tried to purge attachments without proper default ---- please set them: defaults write com.apple.madrid EnableCacheDelete -BOOL YES", (uint8_t *)&v10, 2u);
    }
  }
  if (IMIsRunningInAutomation())
  {
    id v8 = +[IMCoreAutomationNotifications sharedInstance];
    [v8 postCoreAutomationNotificationFinishedPurgingAttachments:0 withErrorString:@"EnableCacheDelete default not enabled"];
LABEL_13:
  }
}

- (void)fetchLatestSalt
{
  id v2 = +[IMDCKRecordSaltManager sharedInstance];
  [v2 fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:0];
}

- (void)printCachedSalt
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = +[IMDCKRecordSaltManager sharedInstance];
      id v4 = [v3 cachedSalt];
      int v5 = 138412290;
      int v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Current cached salt %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)deleteSalt
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Deleting salt locally and from cloudKit", v4, 2u);
    }
  }
  id v3 = +[IMDCKRecordSaltManager sharedInstance];
  [v3 deleteDeDupeRecordZone];
}

- (void)fetchLatestRampState
{
  id v3 = +[IMDCKRampManager sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100025430;
  v4[3] = &unk_100071C00;
  v4[4] = self;
  [v3 fetchLatestRampStateFromCK:v4];
}

- (id)rampStateDictionaryFromPromoted:(BOOL)a3 featureHadServerError:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = +[NSNumber numberWithBool:a3];
  uint64_t v6 = IMCloudKitRampStateFeaturePromoted;
  int64_t v7 = +[NSNumber numberWithBool:v4];
  id v8 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, v6, v7, IMCloudKitRampStateFetchHadServerError, 0);

  return v8;
}

- (void)syncDeletesToCloudKit
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request from client to sync deletes to cloudkit", v4, 2u);
    }
  }
  id v3 = +[IMDCKSyncController sharedInstance];
  [v3 syncDeletesToCloudKitWithActivity:0 completion:&stru_100071C20];
}

@end