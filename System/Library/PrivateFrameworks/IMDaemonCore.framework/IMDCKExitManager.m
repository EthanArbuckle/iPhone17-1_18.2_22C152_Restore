@interface IMDCKExitManager
+ (id)sharedInstance;
- (BOOL)_analyticZoneCreated;
- (BOOL)_canSubmitCloudKitAnalytic;
- (BOOL)_canSubmitCloudKitMetric;
- (BOOL)_saltZoneCreated;
- (BOOL)_subscriptionCreated;
- (BOOL)fetchedExitDateOnLaunch;
- (CKRecordID)exitRecordID;
- (IMDCKDatabaseManager)databaseManager;
- (IMDCKExitManager)init;
- (IMDRecordZoneManager)recordZoneManager;
- (NSDate)exitRecordDate;
- (NSError)errorFetchingExitDate;
- (NSNumber)saltZoneCreatedOverride;
- (NSNumber)subscriptionCreatedOverride;
- (OS_dispatch_queue)ckQueue;
- (id)_modifiedOpGroupName:(id)a3;
- (id)_sharedCKUtilities;
- (id)analyticZoneRecordID;
- (id)exitConfiguration;
- (id)initRecordZoneManager:(id)a3 databaseManager:(id)a4;
- (id)syncCompleteRecordID;
- (int64_t)derivedQualityOfService;
- (void)_evalToggleiCloudSettingsSwitch;
- (void)_fetchExitRecordDateWithCompletion:(id)a3;
- (void)_scheduleMetricOperation:(id)a3;
- (void)_scheduleOperation:(id)a3;
- (void)_setUpSubscription;
- (void)_submitCloudKitMetricWithOperationGroupName:(id)a3 record:(id)a4 ignoreZoneNotFoundError:(BOOL)a5 completion:(id)a6;
- (void)deleteExitRecordWithCompletion:(id)a3;
- (void)exitRecordDateWithCompletion:(id)a3;
- (void)handleNotificationForSubscriptionID:(id)a3;
- (void)sendCloudKitZoneFetchRequestToNoteFeatureIsOn;
- (void)setCkQueue:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setErrorFetchingExitDate:(id)a3;
- (void)setExitRecordDate:(id)a3;
- (void)setExitRecordID:(id)a3;
- (void)setFetchedExitDateOnLaunch:(BOOL)a3;
- (void)setRecordZoneManager:(id)a3;
- (void)setSaltZoneCreatedOverride:(id)a3;
- (void)setSubscriptionCreatedOverride:(id)a3;
- (void)submitCloudKitAnalyticWithDictionary:(id)a3 operationGroupName:(id)a4 completion:(id)a5;
- (void)submitCloudKitAnalyticWithOperationGroupName:(id)a3 analyticDictionary:(id)a4;
- (void)submitCloudKitMetricWithData:(id)a3 operationGroupName:(id)a4 completion:(id)a5;
- (void)submitCloudKitMetricWithOperationGroupName:(id)a3;
- (void)writeExitRecordWithDate:(id)a3 completion:(id)a4;
- (void)writeInitialSyncCompletedRecordIfNeeded;
- (void)writeSyncCompletedRecordWithDate:(id)a3 completion:(id)a4;
@end

@implementation IMDCKExitManager

+ (id)sharedInstance
{
  if (qword_1EBE2B818 != -1) {
    dispatch_once(&qword_1EBE2B818, &unk_1F3390880);
  }
  v2 = (void *)qword_1EBE2B940;

  return v2;
}

- (id)initRecordZoneManager:(id)a3 databaseManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMDCKExitManager;
  v9 = [(IMDCKExitManager *)&v13 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.private.IMDCKExitManager", 0);
    ckQueue = v9->_ckQueue;
    v9->_ckQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_recordZoneManager, a3);
    objc_storeStrong((id *)&v9->_databaseManager, a4);
    v9->_fetchedExitDateOnLaunch = 0;
  }

  return v9;
}

- (IMDCKExitManager)init
{
  v3 = +[IMDRecordZoneManager sharedInstance];
  v4 = [(IMDCKExitManager *)self initRecordZoneManager:v3 databaseManager:0];

  if (v4 && (IMIsRunningInUnitTesting() & 1) == 0) {
    [(IMDCKExitManager *)v4 _setUpSubscription];
  }
  return v4;
}

- (void)_setUpSubscription
{
  v3 = [(IMDCKExitManager *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D96CD324;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (NSDate)exitRecordDate
{
  exitRecordDate = self->_exitRecordDate;
  if (!exitRecordDate)
  {
    IMGetCachedDomainValueForKey();
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_exitRecordDate;
    self->_exitRecordDate = v4;

    exitRecordDate = self->_exitRecordDate;
  }

  return exitRecordDate;
}

- (void)setExitRecordDate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(IMDCKExitManager *)self exitRecordDate];
  if (!v5 || ([v5 isEqualToDate:v6] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = @"NO";
        int v9 = 138412802;
        dispatch_queue_t v10 = v6;
        __int16 v11 = 2112;
        if (v5) {
          id v8 = @"YES";
        }
        id v12 = v5;
        __int16 v13 = 2112;
        v14 = v8;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Exit Record date has been modified, changing it from %@ to %@. Are we in exit state ? %@", (uint8_t *)&v9, 0x20u);
      }
    }
    IMSetDomainValueForKey();
    IMSetDomainBoolForKey();
    objc_storeStrong((id *)&self->_exitRecordDate, a3);
  }
}

- (NSError)errorFetchingExitDate
{
  errorFetchingExitDate = self->_errorFetchingExitDate;
  if (!errorFetchingExitDate)
  {
    v4 = IMGetCachedDomainValueForKey();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (v5)
      {
        v6 = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithSerializedError_im:", v5);
        id v7 = self->_errorFetchingExitDate;
        self->_errorFetchingExitDate = v6;
      }
    }

    errorFetchingExitDate = self->_errorFetchingExitDate;
  }

  return errorFetchingExitDate;
}

- (void)setErrorFetchingExitDate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(IMDCKExitManager *)self errorFetchingExitDate];
  if (!v5 || ([v5 isEqual:v6] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412546;
        __int16 v11 = v6;
        __int16 v12 = 2112;
        id v13 = v5;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Error fetching exit record date has been modified, changing it from %@ to %@", (uint8_t *)&v10, 0x16u);
      }
    }
    if (v5)
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Messages.IMDCKExitManagerErrorDomain" code:3 userInfo:0];
      int v9 = objc_msgSend(v8, "serializedError_im");
    }
    else
    {
      int v9 = 0;
    }
    IMSetDomainValueForKey();
    objc_storeStrong((id *)&self->_errorFetchingExitDate, a3);
  }
}

- (void)handleNotificationForSubscriptionID:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Handling notification for subscriptionID: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  if ([v4 isEqualToString:@"ExitRecordKeyManateeZoneSubscription"]) {
    [(IMDCKExitManager *)self _fetchExitRecordDateWithCompletion:0];
  }
}

- (void)writeExitRecordWithDate:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Calling writeExitRecordWithDate. ExitDate: %@", buf, 0xCu);
    }
  }
  if (v6)
  {
    int v9 = [(IMDCKExitManager *)self ckQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D96CDB1C;
    block[3] = &unk_1E6B73A60;
    block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(v9, block);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "writeExitRecordWithDate, must be called with a non-nil exit date ignoring request", buf, 2u);
      }
    }
    if (v7)
    {
      __int16 v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Messages.IMDCKExitManagerErrorDomain" code:2 userInfo:0];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
    }
  }
}

- (void)exitRecordDateWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void *))a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [(IMDCKExitManager *)self exitRecordDate];
      id v7 = [(IMDCKExitManager *)self errorFetchingExitDate];
      BOOL v8 = [(IMDCKExitManager *)self fetchedExitDateOnLaunch];
      int v9 = @"NO";
      *(_DWORD *)buf = 138412802;
      id v24 = v6;
      __int16 v25 = 2112;
      if (v8) {
        int v9 = @"YES";
      }
      id v26 = v7;
      __int16 v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Calling exitRecordDateWithCompletion date: %@ error: %@ fetchedExitDateOnLaunch: %@", buf, 0x20u);
    }
  }
  if ([(IMDCKExitManager *)self fetchedExitDateOnLaunch]
    && ([(IMDCKExitManager *)self errorFetchingExitDate],
        int v10 = objc_claimAutoreleasedReturnValue(),
        BOOL v11 = v10 == 0,
        v10,
        v11))
  {
    if (v4)
    {
      __int16 v12 = [MEMORY[0x1E4F29060] currentThread];
      char v13 = [v12 isMainThread];

      if (v13)
      {
        if (IMOSLoggingEnabled())
        {
          id v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            id v15 = [(IMDCKExitManager *)self exitRecordDate];
            id v16 = [(IMDCKExitManager *)self errorFetchingExitDate];
            *(_DWORD *)buf = 138412546;
            id v24 = v15;
            __int16 v25 = 2112;
            id v26 = v16;
            _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Already on main queue exitDate: %@ error: %@", buf, 0x16u);
          }
        }
        uint64_t v17 = [(IMDCKExitManager *)self exitRecordDate];
        v18 = [(IMDCKExitManager *)self errorFetchingExitDate];
        v4[2](v4, v17, v18);
      }
      else
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = sub_1D96CE5F4;
        v19[3] = &unk_1E6B73AB0;
        v19[4] = self;
        v20 = v4;
        dispatch_async(MEMORY[0x1E4F14428], v19);
      }
    }
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1D96CE450;
    v21[3] = &unk_1E6B73A88;
    v21[4] = self;
    v22 = v4;
    [(IMDCKExitManager *)self _fetchExitRecordDateWithCompletion:v21];
  }
}

- (void)_evalToggleiCloudSettingsSwitch
{
  id v2 = +[IMDCKUtilities sharedInstance];
  [v2 evalToggleiCloudSettingsSwitch];
}

- (void)_fetchExitRecordDateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDCKExitManager *)self ckQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D96CE844;
  v7[3] = &unk_1E6B73AB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)deleteExitRecordWithCompletion:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Calling deleteExitRecordCompletionBlock", buf, 2u);
    }
  }
  id v6 = [(IMDCKExitManager *)self ckQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D96CF0A4;
  v8[3] = &unk_1E6B73AB0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (CKRecordID)exitRecordID
{
  exitRecordID = self->_exitRecordID;
  if (!exitRecordID)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    id v5 = [(IMDCKExitManager *)self recordZoneManager];
    id v6 = [v5 deDupeSaltZoneID];
    id v7 = (CKRecordID *)[v4 initWithRecordName:@"CloudKitExitRecord" zoneID:v6];
    id v8 = self->_exitRecordID;
    self->_exitRecordID = v7;

    exitRecordID = self->_exitRecordID;
  }

  return exitRecordID;
}

- (id)syncCompleteRecordID
{
  id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v4 = [(IMDCKExitManager *)self recordZoneManager];
  id v5 = [v4 metricZoneID];
  id v6 = (void *)[v3 initWithRecordName:@"SyncCompleteRecord" zoneID:v5];

  return v6;
}

- (id)analyticZoneRecordID
{
  id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v4 = [(IMDCKExitManager *)self recordZoneManager];
  id v5 = [v4 analyticRecordZoneID];
  id v6 = (void *)[v3 initWithRecordName:@"AnalyticZoneRecord" zoneID:v5];

  return v6;
}

- (int64_t)derivedQualityOfService
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v3 = [v2 qualityOfService];

  if (v3 <= 17) {
    int64_t v4 = 17;
  }
  else {
    int64_t v4 = v3;
  }
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [MEMORY[0x1E4F29060] currentThread];
      int v8 = 134218240;
      uint64_t v9 = [v6 qualityOfService];
      __int16 v10 = 2048;
      int64_t v11 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "QOS: 0x%lX target qos: 0x%lX", (uint8_t *)&v8, 0x16u);
    }
  }
  return v4;
}

- (id)exitConfiguration
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v3 setAllowsCellularAccess:1];
  objc_msgSend(v3, "setQualityOfService:", -[IMDCKExitManager derivedQualityOfService](self, "derivedQualityOfService"));

  return v3;
}

- (IMDCKDatabaseManager)databaseManager
{
  databaseManager = self->_databaseManager;
  if (!databaseManager)
  {
    int64_t v4 = +[IMDCKDatabaseManager sharedInstance];
    id v5 = self->_databaseManager;
    self->_databaseManager = v4;

    databaseManager = self->_databaseManager;
  }

  return databaseManager;
}

- (void)_scheduleOperation:(id)a3
{
  id v4 = a3;
  id v6 = [(IMDCKExitManager *)self databaseManager];
  id v5 = [v6 truthDatabase];
  [v5 addOperation:v4];
}

- (BOOL)_saltZoneCreated
{
  saltZoneCreatedOverride = self->_saltZoneCreatedOverride;
  if (saltZoneCreatedOverride)
  {
    return [(NSNumber *)saltZoneCreatedOverride BOOLValue];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Checking if salt zone needs to be created", buf, 2u);
      }
    }
    *(void *)buf = 0;
    uint64_t v17 = buf;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    id v7 = [(IMDCKExitManager *)self recordZoneManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1D96CFAF8;
    v13[3] = &unk_1E6B73B50;
    id v15 = buf;
    int v8 = v6;
    id v14 = v8;
    [v7 createDeDupeSaltZoneIfNeededWithCompletionBlock:v13];

    dispatch_time_t v9 = dispatch_time(0, 600000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      v17[24] = 0;
      if (IMOSLoggingEnabled())
      {
        __int16 v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "***** Timed out creating salt zone *******", v12, 2u);
        }
      }
    }
    uint8_t v11 = v17[24];

    _Block_object_dispose(buf, 8);
    return v11;
  }
}

- (BOOL)_subscriptionCreated
{
  subscriptionCreatedOverride = self->_subscriptionCreatedOverride;
  if (subscriptionCreatedOverride)
  {
    return [(NSNumber *)subscriptionCreatedOverride BOOLValue];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Checking if exit zone subscription needs to be created", buf, 2u);
      }
    }
    *(void *)buf = 0;
    uint64_t v17 = buf;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    id v7 = [(IMDCKExitManager *)self recordZoneManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1D96CFE58;
    v13[3] = &unk_1E6B73B50;
    id v15 = buf;
    int v8 = v6;
    id v14 = v8;
    [v7 createSubscriptionIfNeededOnDeDupeZoneForSubscription:@"ExitRecordKeyManateeZoneSubscription" recordType:@"Exit" completionBlock:v13];

    dispatch_time_t v9 = dispatch_time(0, 180000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      v17[24] = 0;
      if (IMOSLoggingEnabled())
      {
        __int16 v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "***** Timed out creating exit zone subscription *******", v12, 2u);
        }
      }
    }
    uint8_t v11 = v17[24];

    _Block_object_dispose(buf, 8);
    return v11;
  }
}

- (void)writeInitialSyncCompletedRecordIfNeeded
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  int v4 = [v3 isUnderFirstDataProtectionLock];

  if (v4)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "writeInitialSyncCompletedRecordIfNeeded Not doing under first unlock", (uint8_t *)&v14, 2u);
    }
  }
  else if (IMGetDomainBoolForKeyWithDefaultValue())
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "writeInitialSyncCompletedRecordIfNeeded We have already done this. Not doing again unless you do defaults delete com.apple.madrid initialSyncRecordHasBeenWritten", (uint8_t *)&v14, 2u);
    }
  }
  else
  {
    IMSetDomainBoolForKey();
    dispatch_semaphore_t v6 = [(IMDCKAbstractSyncController *)self syncState];
    id v5 = [v6 lastSyncDate];

    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v5;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "writeInitialSyncCompletedRecordIfNeeded Requesting last sync date for metrics: %@", (uint8_t *)&v14, 0xCu);
      }
    }
    if (v5)
    {
      int v8 = [MEMORY[0x1E4F1C9C8] date];
      BOOL v9 = (unint64_t)([v5 differenceFromDate:v8] + 7) < 8;
      int v10 = IMOSLoggingEnabled();
      if (v9)
      {
        if (v10)
        {
          uint8_t v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Last sync was within the last 7 days", (uint8_t *)&v14, 2u);
          }
        }
        [(IMDCKExitManager *)self writeSyncCompletedRecordWithDate:v5 completion:&unk_1F33908A0];
      }
      else if (v10)
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v14 = 138412290;
          id v15 = v5;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "writeInitialSyncCompletedRecordIfNeeded last sync date %@ was not in last 7 days", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      char v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "writeInitialSyncCompletedRecordIfNeeded No last sync date", (uint8_t *)&v14, 2u);
      }
    }
  }
}

- (void)writeSyncCompletedRecordWithDate:(id)a3 completion:(id)a4
{
}

- (void)submitCloudKitMetricWithOperationGroupName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int v6 = [v5 cloudKitSyncingEnabled];

  id v7 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int v8 = [v7 serverAllowsMetricSubmission];

  if ((v6 & v8) == 1)
  {
    BOOL v9 = [MEMORY[0x1E4F1C9C8] date];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1D96D063C;
    v13[3] = &unk_1E6B73B78;
    void v13[4] = self;
    id v14 = v4;
    [(IMDCKExitManager *)self submitCloudKitMetricWithData:v9 operationGroupName:v14 completion:v13];
  }
  else if (IMOSLoggingEnabled())
  {
    int v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint8_t v11 = @"NO";
      if (v6) {
        uint64_t v12 = @"YES";
      }
      else {
        uint64_t v12 = @"NO";
      }
      if (v8) {
        uint8_t v11 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "*** submitCloudKitMetricWithOperationGroupName not submitting MOC enabled: %@, serverAllowsSubmission: %@", buf, 0x16u);
    }
  }
}

- (BOOL)_analyticZoneCreated
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(IMDCKExitManager *)self recordZoneManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D96D08FC;
  v11[3] = &unk_1E6B73B50;
  char v13 = &v14;
  id v5 = v3;
  uint64_t v12 = v5;
  [v4 createAnalyticZoneIfNeededWithCompletionBlock:v11];

  dispatch_time_t v6 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    *((unsigned char *)v15 + 24) = 0;
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v10 = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "***** Timed out creating analytic zone *******", v10, 2u);
      }
    }
  }
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)submitCloudKitAnalyticWithOperationGroupName:(id)a3 analyticDictionary:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    char v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      *(_DWORD *)buf = 138412546;
      char v17 = v9;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Request to submit dictionary (%@) opGroupName %@", buf, 0x16u);
    }
  }
  int v10 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int v11 = [v10 serverAllowsAnalyticSubmission];

  if (v11)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1D96D0C48;
    v13[3] = &unk_1E6B73BA0;
    void v13[4] = self;
    id v14 = v7;
    id v15 = v6;
    [(IMDCKExitManager *)self submitCloudKitAnalyticWithDictionary:v14 operationGroupName:v15 completion:v13];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "*** submitCloudKitMetricWithOperationGroupName not submitting as analytic submission is not enabled", buf, 2u);
    }
  }
}

- (void)_scheduleMetricOperation:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDCKExitManager *)self databaseManager];
  id v6 = [v5 manateeDataBase];

  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      char v8 = [v4 group];
      BOOL v9 = [v8 name];
      int v10 = 138412546;
      int v11 = v9;
      __int16 v12 = 2112;
      char v13 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Performing metric operation name %@ using DB %@", (uint8_t *)&v10, 0x16u);
    }
  }
  [v6 addOperation:v4];
}

- (id)_sharedCKUtilities
{
  return +[IMDCKUtilities sharedInstance];
}

- (id)_modifiedOpGroupName:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  id v6 = [(IMDCKExitManager *)self _sharedCKUtilities];
  id v7 = [v6 deviceActiveString];
  char v8 = [v4 stringWithFormat:@"-%@", v7];

  BOOL v9 = [v5 stringByAppendingString:v8];

  return v9;
}

- (void)_submitCloudKitMetricWithOperationGroupName:(id)a3 record:(id)a4 ignoreZoneNotFoundError:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  char v13 = [(IMDCKExitManager *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D96D15B4;
  block[3] = &unk_1E6B73C18;
  id v18 = v11;
  id v19 = v10;
  BOOL v22 = a5;
  uint64_t v20 = self;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(v13, block);
}

- (BOOL)_canSubmitCloudKitMetric
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [(IMDCKAbstractSyncController *)self ckUtilities];
  char v3 = [v2 serverAllowsMetricSubmission];

  id v4 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v5 = [v4 isInternalInstall];

  if ((v3 & 1) == 0 && IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = @"YES";
      int v9 = 138412802;
      id v10 = @"NO";
      __int16 v11 = 2112;
      if (!v5) {
        id v7 = @"NO";
      }
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = @"NO";
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "We should not be submitting metrics to CloudKit: serverAllowsMetricSubmission: %@ isInternal: %@ isSeed: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  return v3;
}

- (BOOL)_canSubmitCloudKitAnalytic
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [(IMDCKAbstractSyncController *)self ckUtilities];
  char v3 = [v2 serverAllowsAnalyticSubmission];

  id v4 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v5 = [v4 isInternalInstall];

  if ((v3 & 1) == 0 && IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = @"YES";
      int v9 = 138412802;
      id v10 = @"NO";
      __int16 v11 = 2112;
      if (!v5) {
        id v7 = @"NO";
      }
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = @"NO";
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "We should not be submitting metrics to CloudKit: serverAllowsMetricSubmission: %@ isInternal: %@ isSeed: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  return v3;
}

- (void)submitCloudKitMetricWithData:(id)a3 operationGroupName:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  if ([(IMDCKExitManager *)self _canSubmitCloudKitMetric])
  {
    __int16 v11 = [(IMDCKExitManager *)self _modifiedOpGroupName:v9];

    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v11;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Writing up sync metric using opGroup %@", (uint8_t *)&v17, 0xCu);
      }
    }
    id v13 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    id v14 = [(IMDCKExitManager *)self syncCompleteRecordID];
    uint64_t v15 = (void *)[v13 initWithRecordType:@"SyncCompleteRecordType" recordID:v14];

    [v15 setObject:v8 forKey:@"SyncCompleteDateKey"];
    [(IMDCKExitManager *)self _submitCloudKitMetricWithOperationGroupName:v11 record:v15 ignoreZoneNotFoundError:1 completion:v10];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "We should not be submitting metrics to CloudKit so calling completion with success.", (uint8_t *)&v17, 2u);
      }
    }
    if (v10) {
      v10[2](v10, 1, 0);
    }
    __int16 v11 = v9;
  }
}

- (void)submitCloudKitAnalyticWithDictionary:(id)a3 operationGroupName:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  id v9 = (__CFString *)a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  BOOL v11 = [(IMDCKExitManager *)self _canSubmitCloudKitAnalytic];
  if (v8 && [MEMORY[0x1E4F28D90] isValidJSONObject:v8])
  {
    id v22 = 0;
    id v12 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:1 error:&v22];
    id v13 = v22;
    if (!v11)
    {
LABEL_4:
      if (IMOSLoggingEnabled())
      {
        id v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = @"YES";
          if (v12) {
            uint64_t v15 = @"NO";
          }
          *(_DWORD *)buf = 138412546;
          id v24 = @"NO";
          __int16 v25 = 2112;
          id v26 = v15;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Not submitting metrics to CloudKit because notAllowed: %@ noJsonData: %@ so calling completion with success.", buf, 0x16u);
        }
      }
      v10[2](v10, 1, 0);
      id v16 = v9;
      goto LABEL_23;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v24 = v8;
        __int16 v25 = 2112;
        id v26 = v9;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Failed to serizlize analyticdict as JSON %@. Posting operationGroupName %@ only.", buf, 0x16u);
      }
    }
    id v12 = 0;
    id v13 = 0;
    if (!v11) {
      goto LABEL_4;
    }
  }
  id v16 = [(IMDCKExitManager *)self _modifiedOpGroupName:v9];

  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v16;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Writing up sync analytic using opGroup %@", buf, 0xCu);
    }
  }
  id v19 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  uint64_t v20 = [(IMDCKExitManager *)self analyticZoneRecordID];
  id v21 = (void *)[v19 initWithRecordType:@"AnalyticDataRecordType" recordID:v20];

  if (v12) {
    [v21 setObject:v12 forKey:@"AnalyticDataKey"];
  }
  [(IMDCKExitManager *)self _submitCloudKitMetricWithOperationGroupName:v16 record:v21 ignoreZoneNotFoundError:0 completion:v10];

LABEL_23:
}

- (void)sendCloudKitZoneFetchRequestToNoteFeatureIsOn
{
  if (IMOSLoggingEnabled())
  {
    char v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "sendCloudKitZoneFetchRequestToNoteFeatureIsOn", buf, 2u);
    }
  }
  id v4 = +[IMDCKUtilities sharedInstance];
  char v5 = [v4 cloudKitSyncingEnabled];

  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Pinging cloudkit to tell feature is on.", buf, 2u);
      }
    }
    id v8 = [(IMDCKExitManager *)self ckQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D96D23D8;
    block[3] = &unk_1E6B73268;
    void block[4] = self;
    dispatch_async(v8, block);
  }
  else if (v6)
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "sendCloudKitZoneFetchRequestToNoteFeatureIsOn not pinging CK as feature is off", buf, 2u);
    }
  }
}

- (void)setExitRecordID:(id)a3
{
}

- (NSNumber)saltZoneCreatedOverride
{
  return self->_saltZoneCreatedOverride;
}

- (void)setSaltZoneCreatedOverride:(id)a3
{
}

- (NSNumber)subscriptionCreatedOverride
{
  return self->_subscriptionCreatedOverride;
}

- (void)setSubscriptionCreatedOverride:(id)a3
{
}

- (OS_dispatch_queue)ckQueue
{
  return self->_ckQueue;
}

- (void)setCkQueue:(id)a3
{
}

- (IMDRecordZoneManager)recordZoneManager
{
  return self->_recordZoneManager;
}

- (void)setRecordZoneManager:(id)a3
{
}

- (void)setDatabaseManager:(id)a3
{
}

- (BOOL)fetchedExitDateOnLaunch
{
  return self->_fetchedExitDateOnLaunch;
}

- (void)setFetchedExitDateOnLaunch:(BOOL)a3
{
  self->_fetchedExitDateOnLaunch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_recordZoneManager, 0);
  objc_storeStrong((id *)&self->_ckQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionCreatedOverride, 0);
  objc_storeStrong((id *)&self->_saltZoneCreatedOverride, 0);
  objc_storeStrong((id *)&self->_exitRecordID, 0);
  objc_storeStrong((id *)&self->_errorFetchingExitDate, 0);

  objc_storeStrong((id *)&self->_exitRecordDate, 0);
}

@end