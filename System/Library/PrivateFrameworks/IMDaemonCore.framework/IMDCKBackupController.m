@interface IMDCKBackupController
+ (id)sharedInstance;
- (BOOL)_canDisableiCloudBackupsAfterRestore;
- (BOOL)_currentDeviceStateIsRestore:(id)a3;
- (BOOL)_deviceStateHasChanged:(id)a3;
- (BOOL)_firstSyncTimeoutHasExpired;
- (BOOL)_setiCloudBackupAttribute:(BOOL)a3 onItemAtPath:(id)a4 error:(id *)a5;
- (BOOL)_timeIntervalFromFirstSync:(id)a3 hasExpiredForDate:(id)a4;
- (BOOL)checkDatabaseWasRestored;
- (BOOL)iCloudBackupEnabledSystemWide;
- (BOOL)iCloudBackupsDisabled;
- (BOOL)pathRemovedFromBackup:(id)a3;
- (BOOL)readUserDefaultBoolForKey:(id)a3;
- (BOOL)setupAssistantNeedsToRun;
- (IMDCKUtilities)ckUtilities;
- (NSDate)firstSyncDate;
- (double)_firstSyncExpirationTimeInterval;
- (id)_debuggingRestoreStateDescription;
- (id)_primaryAccountAltDSID;
- (id)_readCurrentDeviceState;
- (id)_readPreviousDeviceState;
- (id)_serverBagTimeIntervalForFirstSyncTimeout;
- (id)createBackupManager;
- (id)dateOfLastBackUp;
- (id)readUserDefaultForKey:(id)a3;
- (id)syncStateDebuggingInfo:(id)a3;
- (int64_t)_attemptToDisableiCloudBackupsWithCurrentDeviceState:(id)a3;
- (int64_t)_disableiCloudBackupIfSyncPercentageIsHighEnough:(int64_t)a3 totalCount:(int64_t)a4;
- (int64_t)_readRecordCount;
- (void)_deviceIDFromMobileBackupManager:(id *)a3 legacyDeviceID:(id *)a4;
- (void)_enqueOperation:(id)a3;
- (void)_ensureRestoredDatabaseToBackup;
- (void)_fetchCountOfSyncedCloudKitRecords:(int64_t *)a3 totalCount:(int64_t *)a4;
- (void)_savePreviousDeviceState:(id)a3;
- (void)_saveRecordCount:(int64_t)a3;
- (void)_setICloudBackupsDisabled:(BOOL)a3;
- (void)eventStreamHandler:(id)a3 didReceiveEventWithName:(id)a4 userInfo:(id)a5;
- (void)registerForDistributedNotifications;
- (void)removePathFromiCloudBackup:(id)a3;
- (void)removeUserDefault:(id)a3;
- (void)sendDeviceIDToCloudKitWithCompletion:(id)a3;
- (void)setCkUtilities:(id)a3;
- (void)setFirstSyncDate:(id)a3;
- (void)setFirstSyncDateToNow;
- (void)setUserDefaultBool:(BOOL)a3 forKey:(id)a4;
- (void)toggleiCloudBackupsIfNeeded:(id)a3;
- (void)writeUserDefault:(id)a3 forKey:(id)a4;
@end

@implementation IMDCKBackupController

- (BOOL)iCloudBackupsDisabled
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [(IMDCKBackupController *)self _disabledDirectoryPath];
  char v14 = 0;
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = 0;
  char v4 = objc_msgSend(v3, "__im_getiCloudBackupAttributeForItemAtPath:attributeValue:error:", v2, &v14, &v13);
  id v5 = v13;

  int v6 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v6)
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = @"DISABLED";
        if (!v14) {
          v8 = @"ENABLED";
        }
        *(_DWORD *)buf = 138412546;
        v16 = v8;
        __int16 v17 = 2112;
        v18 = v2;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "iCloud backups are %@ (at path '%@')", buf, 0x16u);
      }
    }
    BOOL v9 = v14 != 0;
  }
  else
  {
    if (v6)
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = [v5 localizedDescription];
        *(_DWORD *)buf = 138412546;
        v16 = v2;
        __int16 v17 = 2112;
        v18 = v11;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Failed to get iCloud backup attribute for path '%@', error: %@", buf, 0x16u);
      }
    }
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97E9DF8;
  block[3] = &unk_1E6B72BE8;
  block[4] = a1;
  if (qword_1EBE2BAA0 != -1) {
    dispatch_once(&qword_1EBE2BAA0, block);
  }
  v2 = (void *)qword_1EBE2BA00;

  return v2;
}

- (IMDCKUtilities)ckUtilities
{
  p_ckUtilities = &self->_ckUtilities;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ckUtilities);

  if (!WeakRetained)
  {
    char v4 = +[IMDCKUtilities sharedInstance];
    objc_storeWeak((id *)p_ckUtilities, v4);
  }
  id v5 = objc_loadWeakRetained((id *)p_ckUtilities);

  return (IMDCKUtilities *)v5;
}

- (void)_ensureRestoredDatabaseToBackup
{
  if ((IMGetCachedDomainBoolForKey() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)char v4 = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "_ensureRestoredDatabaseToBackup restoring everything to iCloudBackup.", v4, 2u);
      }
    }
    IMSetDomainBoolForKey();
    [(IMDCKBackupController *)self _setICloudBackupsDisabled:0];
  }
}

- (void)setUserDefaultBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  int v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(IMDCKBackupController *)self writeUserDefault:v8 forKey:v7];
}

- (void)removeUserDefault:(id)a3
{
}

- (BOOL)readUserDefaultBoolForKey:(id)a3
{
  v3 = [(IMDCKBackupController *)self readUserDefaultForKey:a3];
  BOOL v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)readUserDefaultForKey:(id)a3
{
  return (id)IMGetCachedDomainValueForKey();
}

- (void)writeUserDefault:(id)a3 forKey:(id)a4
{
}

- (int64_t)_readRecordCount
{
  v2 = [(IMDCKBackupController *)self readUserDefaultForKey:@"IMDCKBackupControllerBackupRecordCountKey"];
  v3 = v2;
  if (v2) {
    int64_t v4 = [v2 longLongValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)_saveRecordCount:(int64_t)a3
{
  id v4 = [NSNumber numberWithLongLong:a3];
  [(IMDCKBackupController *)self writeUserDefault:v4 forKey:@"IMDCKBackupControllerBackupRecordCountKey"];
}

- (void)_savePreviousDeviceState:(id)a3
{
}

- (id)_readPreviousDeviceState
{
  return [(IMDCKBackupController *)self readUserDefaultForKey:@"IMDCKBackupControllerBackupDeviceStateKey"];
}

- (id)_readCurrentDeviceState
{
  return (id)MEMORY[0x1F41235E0](self, a2);
}

- (id)_serverBagTimeIntervalForFirstSyncTimeout
{
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  v3 = [v2 objectForKey:@"disable-icloud-backup-after-first-sync-interval"];

  return v3;
}

- (double)_firstSyncExpirationTimeInterval
{
  uint64_t v2 = IMDCKBackupControllerDefaultTimebombIntervalInDays;
  v3 = [(IMDCKBackupController *)self _serverBagTimeIntervalForFirstSyncTimeout];
  id v4 = v3;
  if (v3) {
    uint64_t v2 = [v3 integerValue];
  }

  return (double)v2 * 86400.0;
}

- (void)setFirstSyncDate:(id)a3
{
}

- (NSDate)firstSyncDate
{
  return (NSDate *)[(IMDCKBackupController *)self readUserDefaultForKey:@"IMDCKBackupControllerTimebombStartUserDefaultsKey"];
}

- (void)setFirstSyncDateToNow
{
  v3 = [(IMDCKBackupController *)self firstSyncDate];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [(IMDCKBackupController *)self setFirstSyncDate:v4];
  }
}

- (BOOL)_firstSyncTimeoutHasExpired
{
  v3 = [(IMDCKBackupController *)self firstSyncDate];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v5 = [(IMDCKBackupController *)self _timeIntervalFromFirstSync:v3 hasExpiredForDate:v4];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "First sync date is nil, this is a bug -- setFirstSyncDateToNow should have been called before this.", v8, 2u);
      }
    }
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_timeIntervalFromFirstSync:(id)a3 hasExpiredForDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    [v6 timeIntervalSinceReferenceDate];
    double v10 = v9;
    [v8 timeIntervalSinceReferenceDate];
    double v12 = v11 - v10;
    [(IMDCKBackupController *)self _firstSyncExpirationTimeInterval];
    BOOL v14 = v12 > v13;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v17 = 0;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "nil dates sent into _timeIntervalFromFirstSync", v17, 2u);
      }
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (void)toggleiCloudBackupsIfNeeded:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IMDCKBackupController *)self _readCurrentDeviceState];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D97EA61C;
  aBlock[3] = &unk_1E6B76F58;
  aBlock[4] = self;
  id v6 = v5;
  id v16 = v6;
  id v7 = v4;
  id v17 = v7;
  id v8 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  double v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6BF20]];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    if (v8) {
      v8[2](v8, 3, 0);
    }
  }
  else
  {
    double v11 = [(IMDCKBackupController *)self ckUtilities];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1D97EA7D0;
    v12[3] = &unk_1E6B76F58;
    v12[4] = self;
    id v13 = v6;
    BOOL v14 = v8;
    [v11 fetchCloudKitAccountStatusWithCompletion:v12];
  }
}

- (void)registerForDistributedNotifications
{
  if ((IMIsRunningInUnitTesting() & 1) == 0)
  {
    id v3 = +[IMDDistributedNotificationXPCEventStreamHandler sharedInstance];
    [v3 addDelegate:self queue:MEMORY[0x1E4F14428]];
  }
}

- (id)_primaryAccountAltDSID
{
  uint64_t v2 = [(IMDCKBackupController *)self ckUtilities];
  id v3 = [v2 _primaryiCloudAccountAltDSID];

  return v3;
}

- (int64_t)_disableiCloudBackupIfSyncPercentageIsHighEnough:(int64_t)a3 totalCount:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a4 < 1) {
    float v7 = 1.0;
  }
  else {
    float v7 = (float)a3 / (float)a4;
  }
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 134218496;
      double v15 = v7;
      __int16 v16 = 2048;
      int64_t v17 = a3;
      __int16 v18 = 2048;
      int64_t v19 = a4;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Calculated percent synced (%f) from (%lld synced of %lld total records) ok ", (uint8_t *)&v14, 0x20u);
    }
  }
  BOOL v9 = v7 > *(float *)a33s;
  int v10 = IMOSLoggingEnabled();
  if (v9)
  {
    if (v10)
    {
      double v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v14 = 134218240;
        double v15 = v7;
        __int16 v16 = 2048;
        *(double *)&int64_t v17 = *(float *)a33s;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Disabling iCloud backup since percentage of synced cloudkit records is high enough: %f >= %f ", (uint8_t *)&v14, 0x16u);
      }
    }
    [(IMDCKBackupController *)self setICloudBackupsDisabled:1];
    return 1;
  }
  else
  {
    if (v10)
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = 134218240;
        double v15 = v7;
        __int16 v16 = 2048;
        *(double *)&int64_t v17 = *(float *)a33s;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "NOT disabling iCloud backup since percentage of synced cloudkit records is NOT high enough: %f < %f. We will check again later.", (uint8_t *)&v14, 0x16u);
      }
    }
    return 5;
  }
}

- (void)_fetchCountOfSyncedCloudKitRecords:(int64_t *)a3 totalCount:(int64_t *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = IMDMessageRecordCalculateLocalCloudKitStatistics();
  int v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        BOOL v9 = [v6 description];
        int v10 = [v9 description];
        double v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F3398578];
        int v18 = 138412290;
        int64_t v19 = (int64_t)v11;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Loaded cloud kit stats: %@", (uint8_t *)&v18, 0xCu);
      }
    }
    double v12 = [v6 objectForKey:*MEMORY[0x1E4F6D278]];
    *a4 = [v12 unsignedLongValue];

    id v13 = [v6 objectForKey:*MEMORY[0x1E4F6D210]];
    *a3 = [v13 unsignedLongValue];

    if (IMOSLoggingEnabled())
    {
      int v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int64_t v15 = *a4;
        int64_t v16 = *a3;
        int v18 = 134218240;
        int64_t v19 = v15;
        __int16 v20 = 2048;
        int64_t v21 = v16;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Total record count: %lld, total syncedCount: %lld", (uint8_t *)&v18, 0x16u);
      }
    }
  }
  else if (v7)
  {
    int64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "IMDMessageRecordCalculateLocalCloudKitStatistics returned NULL stats", (uint8_t *)&v18, 2u);
    }
  }
}

- (BOOL)_currentDeviceStateIsRestore:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F6BF10]];
  if ([v4 BOOLValue])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F6BF08]];
    if ([v6 BOOLValue])
    {
      char v5 = 1;
    }
    else
    {
      int v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F6BF18]];
      char v5 = [v7 BOOLValue];
    }
  }

  return v5;
}

- (BOOL)_deviceStateHasChanged:(id)a3
{
  id v4 = a3;
  char v5 = [(IMDCKBackupController *)self _readPreviousDeviceState];
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x1E4F6BF00];
    int v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6BF00]];
    uint64_t v8 = [v5 objectForKeyedSubscript:v6];
    BOOL v9 = (void *)v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10) {
      LOBYTE(v11) = 1;
    }
    else {
      int v11 = [v7 isEqual:v8] ^ 1;
    }
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (int64_t)_attemptToDisableiCloudBackupsWithCurrentDeviceState:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(IMDCKBackupController *)self _currentDeviceStateIsRestore:v4];
    int v6 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v6)
      {
        int v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Device has been restored, checking to see if we can disable iCloud backups", buf, 2u);
        }
      }
      BOOL v8 = [(IMDCKBackupController *)self _canDisableiCloudBackupsAfterRestore];
      int v9 = IMOSLoggingEnabled();
      if (v8)
      {
        if (v9)
        {
          BOOL v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Device has been restored ok and is in acceptable state, wa are disabling iClound backups now", buf, 2u);
          }
        }
        int64_t v11 = 1;
        [(IMDCKBackupController *)self setICloudBackupsDisabled:1];
      }
      else
      {
        if (v9)
        {
          int v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Enabling iCloud backup and restore until restore is complete.", buf, 2u);
          }
        }
        [(IMDCKBackupController *)self setICloudBackupsDisabled:0];
        int64_t v11 = 5;
      }
    }
    else
    {
      if (v6)
      {
        id v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Checking counts of synced records to see if we can automatically disable iCloud backups", buf, 2u);
        }
      }
      uint64_t v16 = 0;
      *(void *)buf = 0;
      [(IMDCKBackupController *)self _fetchCountOfSyncedCloudKitRecords:buf totalCount:&v16];
      int64_t v11 = [(IMDCKBackupController *)self _disableiCloudBackupIfSyncPercentageIsHighEnough:*(void *)buf totalCount:v16];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      double v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Device State is unexpectedly nil", buf, 2u);
      }
    }
    int64_t v11 = 8;
  }

  return v11;
}

- (void)_setICloudBackupsDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    int v7 = [(IMDCKBackupController *)self _disabledDirectoryPath];
    int64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v21 = 0;
    char v9 = objc_msgSend(v11, "__im_setiCloudBackupAttribute:onDirectoryAndChildrenAtPath:error:", 0, v7, &v21);
    id v10 = v21;

    goto LABEL_5;
  }
  BOOL v5 = [(IMDCKBackupController *)self ckUtilities];
  char v6 = [v5 removeFromBackUpAllowed];

  if (v6)
  {
    int v7 = [(IMDCKBackupController *)self _disabledDirectoryPath];
    BOOL v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v22 = 0;
    char v9 = objc_msgSend(v8, "__im_setiCloudBackupAttribute:onItemAtPath:error:", 1, v7, &v22);
    id v10 = v22;

LABEL_5:
    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        double v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = [(IMDCKBackupController *)self _disabledDirectoryPath];
          int v14 = (void *)v13;
          int64_t v15 = @"ENABLED";
          if (v3) {
            int64_t v15 = @"DISABLED";
          }
          *(_DWORD *)buf = 138412546;
          v24 = v15;
          __int16 v25 = 2112;
          uint64_t v26 = v13;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "set iCloud backups to %@ (at path '%@')", buf, 0x16u);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = [v10 localizedDescription];
        int v18 = (void *)v17;
        int64_t v19 = @"NO";
        *(_DWORD *)buf = 138412802;
        if (v3) {
          int64_t v19 = @"YES";
        }
        v24 = v19;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v7;
        __int16 v27 = 2112;
        uint64_t v28 = v17;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Failed to set iCloud backup file attribute to %@ on path: '%@'. Error: %@", buf, 0x20u);
      }
    }

    return;
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "We are not allowed to remove backups from iCloud and we got called to disable the back up -- early returning", buf, 2u);
    }
  }
}

- (BOOL)_setiCloudBackupAttribute:(BOOL)a3 onItemAtPath:(id)a4 error:(id *)a5
{
  char v6 = (void *)MEMORY[0x1E4F28CB8];
  id v7 = a4;
  BOOL v8 = [v6 defaultManager];
  LOBYTE(a5) = objc_msgSend(v8, "__im_setiCloudBackupAttribute:onItemAtPath:error:", 1, v7, a5);

  return (char)a5;
}

- (void)removePathFromiCloudBackup:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(IMDCKBackupController *)self ckUtilities];
  char v6 = [v5 removeFromBackUpAllowed];

  if ((v6 & 1) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_21;
    }
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "We are not allowed to remove this device from backup -- not removing path (%@) from backup", buf, 0xCu);
    }
    goto LABEL_6;
  }
  if (![(IMDCKBackupController *)self iCloudBackupsDisabled])
  {
    id v13 = 0;
    BOOL v8 = [(IMDCKBackupController *)self _setiCloudBackupAttribute:1 onItemAtPath:v4 error:&v13];
    id v9 = v13;
    int v10 = IMOSLoggingEnabled();
    if (v8)
    {
      if (v10)
      {
        int64_t v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v4;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "removed path from iCloud backup: '%@'", buf, 0xCu);
        }
LABEL_19:
      }
    }
    else if (v10)
    {
      int64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        double v12 = [v9 localizedDescription];
        *(_DWORD *)buf = 138412546;
        id v15 = v4;
        __int16 v16 = 2112;
        uint64_t v17 = v12;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Failed to set iCloud backup file attribute to YES on path: '%@'. Error: %@", buf, 0x16u);
      }
      goto LABEL_19;
    }

    goto LABEL_21;
  }
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "All iCloud backups disabled so path is already not backing up: %@", buf, 0xCu);
    }
LABEL_6:
  }
LABEL_21:
}

- (BOOL)pathRemovedFromBackup:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  if ([(IMDCKBackupController *)self iCloudBackupsDisabled])
  {
    BOOL v5 = 1;
  }
  else
  {
    char v16 = 0;
    char v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v15 = 0;
    char v7 = objc_msgSend(v6, "__im_getiCloudBackupAttributeForItemAtPath:attributeValue:error:", v4, &v16, &v15);
    id v8 = v15;

    int v9 = IMOSLoggingEnabled();
    if (v7)
    {
      if (v9)
      {
        int v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int64_t v11 = @"DISABLED";
          if (!v16) {
            int64_t v11 = @"ENABLED";
          }
          *(_DWORD *)buf = 138412546;
          uint64_t v18 = v11;
          __int16 v19 = 2112;
          __int16 v20 = v4;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "iCloud backups are %@ for path '%@')", buf, 0x16u);
        }
      }
      BOOL v5 = v16 != 0;
    }
    else
    {
      if (v9)
      {
        double v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = [v8 localizedDescription];
          *(_DWORD *)buf = 138412546;
          uint64_t v18 = v4;
          __int16 v19 = 2112;
          __int16 v20 = v13;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Failed to get iCloud backup attribute for path '%@', error: %@", buf, 0x16u);
        }
      }
      BOOL v5 = 0;
    }
  }
  return v5;
}

- (id)createBackupManager
{
  if (qword_1EA8CA5C0 != -1) {
    dispatch_once(&qword_1EA8CA5C0, &unk_1F3391B00);
  }
  id v2 = (id)qword_1EA8CA5B8;
  if (qword_1EA8CA5B8) {
    id v2 = objc_alloc_init((Class)qword_1EA8CA5B8);
  }

  return v2;
}

- (BOOL)iCloudBackupEnabledSystemWide
{
  id v2 = [(IMDCKBackupController *)self createBackupManager];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 isBackupEnabled];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)setupAssistantNeedsToRun
{
  if (qword_1EA8CA5D0 != -1) {
    dispatch_once(&qword_1EA8CA5D0, &unk_1F3391B20);
  }
  id v2 = (uint64_t (*)(void))off_1EA8CA5C8;
  if (!off_1EA8CA5C8) {
    return 1;
  }

  return v2();
}

- (void)_deviceIDFromMobileBackupManager:(id *)a3 legacyDeviceID:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v6 = [(IMDCKBackupController *)self createBackupManager];
  char v7 = v6;
  if (v6)
  {
    id v8 = [v6 backupDeviceUUID];
    int v9 = [v7 backupDeviceUDID];
  }
  else
  {
    int v9 = 0;
    id v8 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    int v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      double v12 = v8;
      __int16 v13 = 2112;
      int v14 = v9;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Device ID from MobileBackup deviceID (deviceUUID) = %@, legacyDevice (deviceUDID) = %@", (uint8_t *)&v11, 0x16u);
    }
  }
  if (a3) {
    *a3 = v8;
  }
  if (a4) {
    *a4 = v9;
  }
}

- (void)_enqueOperation:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    char v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Starting operation: '%@'", (uint8_t *)&v7, 0xCu);
    }
  }
  BOOL v5 = +[IMDCKDatabaseManager sharedInstance];
  char v6 = [v5 truthDatabase];
  [v6 addOperation:v3];
}

- (void)sendDeviceIDToCloudKitWithCompletion:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  char v4 = (void (**)(id, uint64_t, void))a3;
  BOOL v5 = [(IMDCKBackupController *)self ckUtilities];
  char v6 = [v5 cloudKitSyncingEnabled];

  if (v6)
  {
    int v7 = [(IMDCKBackupController *)self readUserDefaultForKey:@"IMDCKBackupControllerWrittenQuotaRecordKeyV2"];
    int v8 = [v7 BOOLValue];

    if (v8)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "The iCloud quota record has already been written, returning", buf, 2u);
        }
      }
      if (v4) {
        v4[2](v4, 1, 0);
      }
      goto LABEL_37;
    }
    id v29 = 0;
    id v30 = 0;
    [(IMDCKBackupController *)self _deviceIDFromMobileBackupManager:&v30 legacyDeviceID:&v29];
    unint64_t v12 = (unint64_t)v30;
    unint64_t v13 = (unint64_t)v29;
    int v14 = IMOSLoggingEnabled();
    if (v12 | v13)
    {
      if (v14)
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          unint64_t v32 = v12;
          __int16 v33 = 2112;
          unint64_t v34 = v13;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "deviceID (deviceUUID) = %@, legacyDevice (deviceUDID) = %@", buf, 0x16u);
        }
      }
      char v16 = _IMCreatePredicateWithDeviceUDIDAndDeviceUUID((void *)v12, (void *)v13);
      if (IMOSLoggingEnabled())
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = [v16 predicateFormat];
          *(_DWORD *)buf = 138412290;
          unint64_t v32 = (unint64_t)v18;
          _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Writing grace quota with device IDs: '%@'", buf, 0xCu);
        }
      }
      __int16 v19 = (void *)[objc_alloc(MEMORY[0x1E4F1A2A0]) initWithRecordType:@"InitialGraceQuota" predicate:v16];
      if (IMOSLoggingEnabled())
      {
        __int16 v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v32 = (unint64_t)v19;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "created query ok: %@", buf, 0xCu);
        }
      }
      id v21 = objc_alloc_init(MEMORY[0x1E4F1A208]);
      [v21 setAllowsCellularAccess:1];
      [v21 setQualityOfService:17];
      id v22 = (void *)[objc_alloc(MEMORY[0x1E4F1A2B8]) initWithQuery:v19];
      [v22 setConfiguration:v21];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = sub_1D97EC8F0;
      v25[3] = &unk_1E6B76F80;
      id v26 = v16;
      __int16 v27 = self;
      uint64_t v28 = v4;
      id v23 = v16;
      [v22 setQueryCompletionBlock:v25];
      [(IMDCKBackupController *)self _enqueOperation:v22];
    }
    else
    {
      if (v14)
      {
        v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "both device UUID or UDID are nil", buf, 2u);
        }
      }
      if (!v4) {
        goto LABEL_36;
      }
      __int16 v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMDCKBackupControllerErrorDomain" code:0 userInfo:0];
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v19);
    }

LABEL_36:
    goto LABEL_37;
  }
  if (IMOSLoggingEnabled())
  {
    int v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Messages in iCloud is not on, not sending up quota grace request", buf, 2u);
    }
  }
  if (v4)
  {
    int v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMDCKBackupControllerErrorDomain" code:1 userInfo:0];
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v11);
  }
LABEL_37:
}

- (id)dateOfLastBackUp
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [(IMDCKBackupController *)self createBackupManager];
  id v3 = v2;
  if (v2)
  {
    char v4 = [v2 dateOfLastBackup];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "BackupManager is nil, no date for last backup", (uint8_t *)&v8, 2u);
      }
    }
    char v4 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    char v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Date of last backup %@", (uint8_t *)&v8, 0xCu);
    }
  }

  return v4;
}

- (BOOL)checkDatabaseWasRestored
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  [(IMDCKBackupController *)self _fetchCountOfSyncedCloudKitRecords:&v7 totalCount:&v6];
  uint64_t v2 = v6;
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      char v4 = @"NO";
      *(_DWORD *)buf = 138412802;
      if (v2 > 9) {
        char v4 = @"YES";
      }
      uint64_t v9 = v4;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      __int16 v12 = 1024;
      int v13 = 10;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Database is in acceptable restore state: %@ (%lld records found, at least %d expected before we can disable iCloud backups if device is in restore state)", buf, 0x1Cu);
    }
  }
  return v2 > 9;
}

- (id)_debuggingRestoreStateDescription
{
  uint64_t v2 = [(IMDCKBackupController *)self createBackupManager];
  id v3 = v2;
  if (v2)
  {
    char v4 = [v2 restoreState];
    BOOL v5 = v4;
    if (v4)
    {
      uint64_t v6 = NSString;
      unsigned int v7 = [v4 state];
      if (v7 > 6) {
        int v8 = &stru_1F3398578;
      }
      else {
        int v8 = off_1E6B77000[v7];
      }
      __int16 v10 = [v5 description];
      uint64_t v9 = [v6 stringWithFormat:@"Got valid restore state (%@) from MBManager: %@", v8, v10];
    }
    else
    {
      uint64_t v9 = @"BackupManager restore state is nil";
    }
  }
  else
  {
    uint64_t v9 = @"BackupManager is nil, can't disable iCloud backups";
  }

  return v9;
}

- (BOOL)_canDisableiCloudBackupsAfterRestore
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "checking to see if device is restoring…", (uint8_t *)&v20, 2u);
    }
  }
  if (![(IMDCKBackupController *)self setupAssistantNeedsToRun])
  {
    BOOL v5 = [(IMDCKBackupController *)self createBackupManager];
    uint64_t v6 = v5;
    if (!v5)
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "BackupManager is nil, can't disable iCloud backups", (uint8_t *)&v20, 2u);
        }
      }
      BOOL v4 = 0;
      goto LABEL_38;
    }
    unsigned int v7 = [v5 restoreState];
    int v8 = IMOSLoggingEnabled();
    if (v7)
    {
      if (v8)
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          unsigned int v10 = [v7 state];
          if (v10 > 6) {
            uint64_t v11 = &stru_1F3398578;
          }
          else {
            uint64_t v11 = off_1E6B77000[v10];
          }
          uint64_t v14 = [v7 description];
          int v20 = 138412546;
          id v21 = v11;
          __int16 v22 = 2112;
          id v23 = v14;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Got valid restore state (%@) from MBManager: %@", (uint8_t *)&v20, 0x16u);
        }
      }
      unsigned int v15 = [v7 state];
      if (v15 > 6) {
        goto LABEL_36;
      }
      if (((1 << v15) & 0x6E) != 0)
      {
        if (IMOSLoggingEnabled())
        {
          char v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            unsigned int v17 = [v7 state];
            if (v17 > 6) {
              uint64_t v18 = &stru_1F3398578;
            }
            else {
              uint64_t v18 = off_1E6B77000[v17];
            }
            int v20 = 138412290;
            id v21 = v18;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Can't disable iCloud backups because restore state is: %@. Will try again later.", (uint8_t *)&v20, 0xCu);
          }
        }
LABEL_36:
        BOOL v4 = 0;
        goto LABEL_37;
      }
    }
    else if (v8)
    {
      int v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "BackupManager restore state is nil, checking database directly...", (uint8_t *)&v20, 2u);
      }
    }
    BOOL v4 = [(IMDCKBackupController *)self checkDatabaseWasRestored];
LABEL_37:

LABEL_38:
    return v4;
  }
  return 0;
}

- (id)syncStateDebuggingInfo:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  BOOL v5 = [(IMDCKBackupController *)self _debuggingRestoreStateDescription];
  [v4 setObject:v5 forKey:@"restore-state"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IMDCKBackupController setupAssistantNeedsToRun](self, "setupAssistantNeedsToRun"));
  [v4 setObject:v6 forKey:@"setup-assistant-needs-to-run"];

  unsigned int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IMDCKBackupController checkDatabaseWasRestored](self, "checkDatabaseWasRestored"));
  [v4 setObject:v7 forKey:@"db-has-records"];

  id v8 = [(IMDCKBackupController *)self dateOfLastBackUp];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v11 = v10;

  [v4 setObject:v11 forKey:@"last-backup-date"];
  __int16 v12 = objc_msgSend(NSNumber, "numberWithBool:", -[IMDCKBackupController iCloudBackupsDisabled](self, "iCloudBackupsDisabled"));
  [v4 setObject:v12 forKey:@"icloud-backups-disabled"];

  id v13 = [(IMDCKBackupController *)self firstSyncDate];
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1CA98] null];
  }
  char v16 = v15;

  [v4 setObject:v16 forKey:@"first-sync-date"];
  id v17 = [(IMDCKBackupController *)self _readCurrentDeviceState];
  uint64_t v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [MEMORY[0x1E4F1CA98] null];
  }
  int v20 = v19;

  [v4 setObject:v20 forKey:@"device-state"];
  id v21 = [MEMORY[0x1E4F28CB8] defaultManager];
  __int16 v22 = [(IMDCKBackupController *)self _disabledDirectoryPath];
  id v32 = 0;
  id v33 = 0;
  id v31 = 0;
  objc_msgSend(v21, "__im_getItemsRemovedFromiCloudBackupsAtDirectoryPath:outPaths:outRemovedPaths:error:", v22, &v33, &v32, &v31);
  id v23 = v33;
  id v24 = v32;
  id v25 = v31;

  id v26 = v24;
  __int16 v27 = v26;
  if (v26)
  {
    id v28 = v26;
  }
  else
  {
    id v28 = [MEMORY[0x1E4F1CA98] null];
  }
  id v29 = v28;

  [v4 setObject:v29 forKey:@"paths-removed-from-backup"];

  return v4;
}

- (void)eventStreamHandler:(id)a3 didReceiveEventWithName:(id)a4 userInfo:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:*MEMORY[0x1E4F6D1C0]])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412546;
        id v13 = v9;
        __int16 v14 = 2112;
        id v15 = v10;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Handling event with name %@ userInfo %@", (uint8_t *)&v12, 0x16u);
      }
    }
    [(IMDCKBackupController *)self setICloudBackupsDisabled:0];
  }
}

- (void)setCkUtilities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end