@interface IMDaemonCloudKitManager
+ (IMDaemonCloudKitManager)sharedManager;
- (BOOL)_hasFinishedTelemetrySync;
- (int64_t)_attachmentFileSizeUpdateIntervalBagValue;
- (int64_t)_chatSyncingIntervalBagValue;
- (int64_t)_messageSyncingDelayBagValue;
- (int64_t)_messageSyncingIntervalBagValue;
- (int64_t)_metricsLoggingUpdateIntervalBagValue;
- (void)_registerForAttachmentFileSizeUpdate;
- (void)_registerForAutoLogDump;
- (void)_registerForBackupSyncing;
- (void)_registerForChatSyncing;
- (void)_registerForMessageSyncing;
- (void)_registerForMetricsLogging;
- (void)_registerForTelemetrySyncing;
- (void)fetchLatestSaltWithMessageContext:(id)a3;
- (void)registerForCloudKitSyncing;
- (void)uploadDailyAnalyticstoCloudKit;
@end

@implementation IMDaemonCloudKitManager

+ (IMDaemonCloudKitManager)sharedManager
{
  if (qword_10007D360 != -1) {
    dispatch_once(&qword_10007D360, &stru_100071D68);
  }
  v2 = (void *)qword_10007D368;

  return (IMDaemonCloudKitManager *)v2;
}

- (void)registerForCloudKitSyncing
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Registering for cloudKitSyncing", v6, 2u);
    }
  }
  v4 = +[IMDCKBackupController sharedInstance];
  [v4 registerForDistributedNotifications];

  [(IMDaemonCloudKitManager *)self fetchLatestSaltWithMessageContext:0];
  v5 = +[IMDCKRampManager sharedInstance];
  [v5 fetchLatestRampStateFromCK:0];

  [(IMDaemonCloudKitManager *)self _registerForBackupSyncing];
  [(IMDaemonCloudKitManager *)self _registerForChatSyncing];
  [(IMDaemonCloudKitManager *)self _registerForMessageSyncing];
  [(IMDaemonCloudKitManager *)self _registerForAttachmentFileSizeUpdate];
  [(IMDaemonCloudKitManager *)self _registerForMetricsLogging];
  [(IMDaemonCloudKitManager *)self _registerForAutoLogDump];
  if (![(IMDaemonCloudKitManager *)self _hasFinishedTelemetrySync]) {
    [(IMDaemonCloudKitManager *)self _registerForTelemetrySyncing];
  }
}

- (BOOL)_hasFinishedTelemetrySync
{
  uint64_t v2 = IMGetDomainIntForKey();
  return v2 >= (uint64_t)+[IMDMessagesSyncCoordinator currentTelemetryVersion];
}

- (void)_registerForBackupSyncing
{
  uint64_t v2 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v3 = [v2 isMessagesIniCloudVersion2];

  if (v3)
  {
    v4 = +[IMDCKSyncController sharedInstance];
    [v4 registerCloudSyncDependencies];

    v5 = +[IMDMessagesSyncCoordinator scheduleBackupSyncWithDelegate:0];
    if (v5 && IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v8 = 136315394;
        v9 = "-[IMDaemonCloudKitManager _registerForBackupSyncing]";
        __int16 v10 = 2112;
        v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: Tried to schedule backup sync but encountered error %@", (uint8_t *)&v8, 0x16u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Registering for backup triggered MiC sync", (uint8_t *)&v8, 2u);
      }
    }
    IMRegisterSADAwareXPCActivity();
  }
}

- (void)_registerForChatSyncing
{
  unsigned int v3 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned __int8 v4 = [v3 isMessagesIniCloudVersion2];

  if ((v4 & 1) == 0)
  {
    int64_t v5 = [(IMDaemonCloudKitManager *)self _chatSyncingIntervalBagValue];
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        int v8 = "com.apple.messages.chatSyncing";
        __int16 v9 = 2048;
        int64_t v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Registering for chat syncing using identifier %s interval %lld", buf, 0x16u);
      }
    }
    IMRegisterSADAwareXPCActivity();
  }
}

- (void)_registerForMessageSyncing
{
  unsigned int v3 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v4 = [v3 isMessagesIniCloudVersion2];

  if (v4)
  {
    int64_t v5 = +[IMDCKSyncController sharedInstance];
    [v5 registerCloudSyncDependencies];

    v6 = +[IMDMessagesSyncCoordinator schedulePeriodicSyncWithDelegate:0];
    if (v6 && IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315394;
        v13 = "-[IMDaemonCloudKitManager _registerForMessageSyncing]";
        __int16 v14 = 2112;
        int64_t v15 = (int64_t)v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: Tried to schedule periodic sync but encountered error %@", (uint8_t *)&v12, 0x16u);
      }
    }
LABEL_14:

    return;
  }
  int v8 = +[IMLockdownManager sharedInstance];
  if ([v8 isInternalInstall] && IMIsRunningInAutomation())
  {
    int v9 = IMGetDomainBoolForKey();

    if (v9)
    {
      if (!IMOSLoggingEnabled()) {
        return;
      }
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "**** Not doing Core Duet for message syncing", (uint8_t *)&v12, 2u);
      }
      goto LABEL_14;
    }
  }
  else
  {
  }
  int64_t v10 = [(IMDaemonCloudKitManager *)self _messageSyncingIntervalBagValue];
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      v13 = "com.apple.messages.messageSyncing";
      __int16 v14 = 2048;
      int64_t v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Registering for message syncing using identifier %s interval %lld", (uint8_t *)&v12, 0x16u);
    }
  }
  IMRegisterSADAwareXPCActivity();
}

- (void)_registerForTelemetrySyncing
{
  uint64_t v2 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v3 = [v2 isMessagesIniCloudVersion2];

  if (v3)
  {
    unsigned int v4 = +[IMDCKSyncController sharedInstance];
    [v4 registerCloudSyncDependencies];

    int64_t v5 = +[IMDMessagesSyncCoordinator scheduleTelemetrySyncWithDelegate:0];
    if (v5 && IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = 136315394;
        int v8 = "-[IMDaemonCloudKitManager _registerForTelemetrySyncing]";
        __int16 v9 = 2112;
        int64_t v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: Tried to schedule telemetry sync but encountered error %@", (uint8_t *)&v7, 0x16u);
      }
    }
  }
}

- (void)_registerForAttachmentFileSizeUpdate
{
  int64_t v2 = [(IMDaemonCloudKitManager *)self _attachmentFileSizeUpdateIntervalBagValue];
  if (IMOSLoggingEnabled())
  {
    unsigned int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int64_t v5 = "com.apple.messages.attachmentFileSizeUpdate";
      __int16 v6 = 2048;
      int64_t v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Registering for filesize update using identifier %s interval %lld", buf, 0x16u);
    }
  }
  IMRegisterSADAwareXPCActivity();
}

- (void)_registerForMetricsLogging
{
  if (IMOSLoggingEnabled())
  {
    unsigned int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int64_t v5 = "com.apple.messages.ckMetricsLogging";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Registering for metrics logging using identifier %s", buf, 0xCu);
    }
  }
  [(IMDaemonCloudKitManager *)self _metricsLoggingUpdateIntervalBagValue];
  IMRegisterSADAwareXPCActivity();
}

- (void)_registerForAutoLogDump
{
  int64_t v2 = +[IMLockdownManager sharedInstance];
  unsigned int v3 = [v2 isInternalInstall];

  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v5 = 136315138;
        __int16 v6 = "com.apple.messages.ckLogDumping";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Registering for auto log dumping using identifier %s", (uint8_t *)&v5, 0xCu);
      }
    }
    IMRegisterSADAwareXPCActivity();
  }
}

- (void)fetchLatestSaltWithMessageContext:(id)a3
{
  id v3 = +[IMDCKRecordSaltManager sharedInstance];
  [v3 fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:0];
}

- (void)uploadDailyAnalyticstoCloudKit
{
  if (IMOSLoggingEnabled())
  {
    int64_t v2 = OSLogHandleForIMFoundationCategory();
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
    __int16 v6 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    __int16 v10 = 0;
    int64_t v7 = "Uploaded analytics to CK.";
    int v8 = (uint8_t *)&v10;
    goto LABEL_12;
  }
  if (!v5) {
    return;
  }
  __int16 v6 = OSLogHandleForIMFoundationCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = 0;
    int64_t v7 = "Did not upload analytics to CK.";
    int v8 = (uint8_t *)&v9;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
  }
LABEL_13:
}

- (int64_t)_chatSyncingIntervalBagValue
{
  return _IMBagIntValueWithDefault(14400, @"imessage-chat-sync-interval");
}

- (int64_t)_attachmentFileSizeUpdateIntervalBagValue
{
  return _IMBagIntValueWithDefault(86400, @"imessage-attachment-filesize-update-interval");
}

- (int64_t)_metricsLoggingUpdateIntervalBagValue
{
  return _IMBagIntValueWithDefault(86400, @"imessage-chat-sync-interval");
}

- (int64_t)_messageSyncingIntervalBagValue
{
  return _IMBagIntValueWithDefault(XPC_ACTIVITY_INTERVAL_1_DAY, @"imessage-message-sync-interval");
}

- (int64_t)_messageSyncingDelayBagValue
{
  return _IMBagIntValueWithDefault(XPC_ACTIVITY_INTERVAL_1_DAY, @"imessage-message-sync-delay");
}

@end