@interface IMDCKMessageSyncController
+ (id)sharedInstance;
- (BOOL)_deviceConditionsAllowsMessageSyncForActivity:(id)a3 deviceConditionsToCheck:(unint64_t)a4 currentBatchCount:(int64_t)a5 maxBatchCount:(int64_t)a6;
- (BOOL)_deviceConditionsAllowsMessageSyncForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4 activity:(id)a5;
- (BOOL)_doesAnyRecordZoneIDHavePendingArchivedRecords:(int64_t)a3;
- (BOOL)_isCoreDuetSyncForMaxBatchCount:(int64_t)a3 activity:(id)a4;
- (BOOL)_isDiskSpaceAvailableForSyncType:(int64_t)a3 currentBatchCount:(int64_t)a4;
- (BOOL)_isValidCKRecordToSync:(id)a3;
- (BOOL)_kickOffWriteIfNeededForSyncType:(int64_t)a3 activity:(id)a4 completion:(id)a5;
- (BOOL)_messageZoneCreated;
- (BOOL)_shouldDeferCoreDuetMessagesSyncWithActivity:(id)a3;
- (BOOL)_shouldFetchArchivedRecords:(id)a3;
- (BOOL)_shouldMarkAllMessagesAsNeedingSync;
- (BOOL)encounteredIncompatibleMessage;
- (CKServerChangeToken)archivedRecordSyncToken;
- (CKServerChangeToken)latestSyncToken;
- (IMDCKMessageSyncCKOperationFactory)CKOperationFactory;
- (IMDCKMessageSyncController)init;
- (IMDCKMessageSyncController)initWithSyncTokenStore:(id)a3;
- (IMDRecordZoneManager)recordZoneManager;
- (NSMutableDictionary)visitedChats;
- (OS_dispatch_queue)ckQueue;
- (SyncTokenStoreProviding)syncTokenStore;
- (id)_changeTokenKey;
- (id)_chatRegistry;
- (id)_ckUtilitiesInstance;
- (id)_constructMessageRecordIDUsingTombStoneDictionary:(id)a3;
- (id)_copyRecordIDsToDeleteWithLimit:(unint64_t)a3;
- (id)_messageRecordSalt;
- (id)_messageZoneID;
- (id)_operationErrorForModifyingRecordCompletion:(id)a3;
- (id)_recordKeyManagerSharedInstance;
- (id)_recordsToSave;
- (id)_recordsToSaveWithAttemptCount:(unint64_t)a3;
- (id)_sharedIMDMessageStore;
- (id)_syncOperationGroupName;
- (int64_t)_numberOfBatchesOfMessagesToFetchInInitialSync;
- (int64_t)syncControllerRecordType;
- (unint64_t)_messageDeleteBatchSize;
- (unint64_t)_numberOfMessagesToUpload;
- (unint64_t)_numberOfRecordsToFetchForSyncType:(int64_t)a3;
- (unint64_t)deviceConditionsToCheck;
- (void)_deleteMessagesWithRecordIDs:(id)a3 completion:(id)a4;
- (void)_fetchArchivedRecordsIfNeeded:(BOOL)a3 currentBatchCount:(int64_t)a4 maxNumberOfBatches:(int64_t)a5 activity:(id)a6 withCompletionBlock:(id)a7;
- (void)_fetchMessageZoneChangesSyncType:(int64_t)a3 currentBatchCount:(int64_t)a4 maxNumberOfBatches:(int64_t)a5 activity:(id)a6 completionBlock:(id)a7;
- (void)_hasMarkedAllMessagesAsNeedingSync;
- (void)_kickOffWriteOnCKQueueWithActivity:(id)a3 completion:(id)a4;
- (void)_markAllIncompatibleMessagesForDeletion;
- (void)_markAllUnsuccessFullSyncMessagesAsNeedingSync;
- (void)_migrateSyncTokens;
- (void)_needsToMarkAllMessagesAsNeedingSync;
- (void)_noteSyncEnded;
- (void)_processArchivedRecordsFetchCompletionZoneID:(id)a3 serverChangeToken:(id)a4 moreComing:(BOOL)a5 currentBatchCount:(int64_t)a6 maxNumberOfBatches:(int64_t)a7 activity:(id)a8 error:(id)a9 completionBlock:(id)a10;
- (void)_processFetchArchivedRecordCompletionWithError:(id)a3 WithCompletionBlock:(id)a4;
- (void)_processFetchRecordZoneChangesCompletionWithError:(id)a3 completionBlock:(id)a4;
- (void)_processModifyRecordsCompletion:(id)a3 deletedRecordIDs:(id)a4 operationError:(id)a5 isLastBatchOfWrite:(BOOL)a6 activity:(id)a7 writeCompletionBlock:(id)a8;
- (void)_processRecordChange:(id)a3;
- (void)_processRecordDeletionCompletion:(id)a3 error:(id)a4 completionBlock:(id)a5;
- (void)_processRecordWriteCompletionForRecord:(id)a3 NSError:(id)a4;
- (void)_processRecordZoneFetchCompletionZoneID:(id)a3 serverChangeToken:(id)a4 clientChangeTokenData:(id)a5 moreComing:(BOOL)a6 NSError:(id)a7 syncType:(int64_t)a8 currentBatchCount:(int64_t)a9 maxNumberOfBatches:(int64_t)a10 shouldFetchArchivedRecords:(BOOL)a11 activity:(id)a12 completionBlock:(id)a13;
- (void)_resetArvchivedRecordSyncToken;
- (void)_resetSyncToken;
- (void)_scheduleOperation:(id)a3;
- (void)_updateDeviceConditionsToCheckIfNeededForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4;
- (void)_writeDirtyMessagesToCloudKitWithActivity:(id)a3 completion:(id)a4;
- (void)clearLocalSyncState:(unint64_t)a3;
- (void)deleteChatBotMessageSyncToken;
- (void)deleteMessageSyncToken;
- (void)deleteMessagesZone;
- (void)incompatibleMessageDeleteDetected:(id)a3;
- (void)setArchivedRecordSyncToken:(id)a3;
- (void)setCKOperationFactory:(id)a3;
- (void)setCkQueue:(id)a3;
- (void)setDeviceConditionsToCheck:(unint64_t)a3;
- (void)setEncounteredIncompatibleMessage:(BOOL)a3;
- (void)setLatestSyncToken:(id)a3;
- (void)setRecordZoneManager:(id)a3;
- (void)setSyncTokenStore:(id)a3;
- (void)setVisitedChats:(id)a3;
- (void)syncDeletedMessagesToCloudKitWithCompletion:(id)a3;
- (void)syncMessagesWithSyncType:(int64_t)a3 deviceConditionsToCheck:(unint64_t)a4 activity:(id)a5 completionBlock:(id)a6;
@end

@implementation IMDCKMessageSyncController

- (IMDCKMessageSyncController)initWithSyncTokenStore:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMDCKMessageSyncController;
  v6 = [(IMDCKMessageSyncController *)&v17 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.private.IMDCKMessageSyncController", 0);
    ckQueue = v6->_ckQueue;
    v6->_ckQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[IMDRecordZoneManager sharedInstance];
    recordZoneManager = v6->_recordZoneManager;
    v6->_recordZoneManager = (IMDRecordZoneManager *)v9;

    objc_storeStrong((id *)&v6->_syncTokenStore, a3);
    v11 = objc_alloc_init(IMDCKMessageSyncCKOperationFactory);
    CKOperationFactory = v6->_CKOperationFactory;
    v6->_CKOperationFactory = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    visitedChats = v6->_visitedChats;
    v6->_visitedChats = v13;

    v6->_deviceConditionsToCheck = 0;
    v6->_encounteredIncompatibleMessage = 0;
    [(IMDCKMessageSyncController *)v6 _migrateSyncTokens];
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v6 selector:sel_incompatibleMessageDeleteDetected_ name:@"__kCKRecordIMMessageIncompatibleDeleteNotification" object:0];
  }
  return v6;
}

- (IMDCKMessageSyncController)init
{
  v3 = objc_alloc_init(IMDCKSyncTokenStore);
  v4 = [(IMDCKMessageSyncController *)self initWithSyncTokenStore:v3];

  return v4;
}

- (id)_chatRegistry
{
  return +[IMDChatRegistry sharedInstance];
}

- (int64_t)syncControllerRecordType
{
  return 1;
}

+ (id)sharedInstance
{
  if (qword_1EBE2B8B0 != -1) {
    dispatch_once(&qword_1EBE2B8B0, &unk_1F33919A0);
  }
  v2 = (void *)qword_1EBE2B9E8;

  return v2;
}

- (id)_messageZoneID
{
  v2 = [(IMDCKMessageSyncController *)self recordZoneManager];
  v3 = [v2 messageRecordZoneID];

  return v3;
}

- (id)_recordKeyManagerSharedInstance
{
  return +[IMDCKRecordSaltManager sharedInstance];
}

- (id)_messageRecordSalt
{
  v2 = [(IMDCKMessageSyncController *)self _recordKeyManagerSharedInstance];
  v3 = [v2 cachedSalt];

  return v3;
}

- (unint64_t)_numberOfMessagesToUpload
{
  return 200;
}

- (unint64_t)_numberOfRecordsToFetchForSyncType:(int64_t)a3
{
  return 200;
}

- (unint64_t)_messageDeleteBatchSize
{
  v2 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int v3 = [v2 isInCloudKitDemoMode];

  if (v3) {
    return 5;
  }
  else {
    return 20;
  }
}

- (int64_t)_numberOfBatchesOfMessagesToFetchInInitialSync
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = [(IMDCKAbstractSyncController *)self ckUtilities];
  char v4 = [v3 isInCloudKitDemoMode];

  if (v4) {
    return 1;
  }
  v6 = [(IMDCKAbstractSyncController *)self ckUtilities];
  dispatch_queue_t v7 = [v6 serverBag];
  v8 = [v7 objectForKey:@"ck-max-number-of-message-batches"];

  if (v8 && [v8 integerValue] >= 1)
  {
    int64_t v5 = [v8 integerValue];
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = [NSNumber numberWithUnsignedInteger:v5];
        int v12 = 138412290;
        v13 = v10;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, " overriding max number of message batches to fetch %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    int64_t v5 = 5;
  }

  return v5;
}

- (BOOL)_isValidCKRecordToSync:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 size];
  if (v4 > 0xA000 && IMOSLoggingEnabled())
  {
    int64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 134217984;
      uint64_t v8 = [v3 size];
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "**** Message %lu CKRecord size exceeds max limit.", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4 <= 0xA000;
}

- (id)_recordsToSaveWithAttemptCount:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = v5;
  if (a3 < 0x32)
  {
    *(void *)buf = 0;
    objc_super v17 = buf;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D97D9118;
    block[3] = &unk_1E6B72D68;
    block[4] = self;
    v15 = buf;
    id v9 = v5;
    id v14 = v9;
    dispatch_sync(MEMORY[0x1E4F14428], block);
    if (v17[24])
    {
      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v20 = 134217984;
          unint64_t v21 = a3;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "We had invalid records attempting to load records again. Attempt count %lu", v20, 0xCu);
        }
      }
      id v11 = [(IMDCKMessageSyncController *)self _recordsToSaveWithAttemptCount:a3 + 1];
    }
    else
    {
      id v11 = v9;
    }
    id v8 = v11;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "**** We hit max number of attempts to creat CKRecords", buf, 2u);
      }
    }
    id v8 = v6;
  }

  return v8;
}

- (id)_recordsToSave
{
  return [(IMDCKMessageSyncController *)self _recordsToSaveWithAttemptCount:0];
}

- (BOOL)_messageZoneCreated
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  unint64_t v4 = [(IMDCKMessageSyncController *)self recordZoneManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D97D9680;
  v11[3] = &unk_1E6B73B50;
  v13 = &v14;
  id v5 = v3;
  int v12 = v5;
  [v4 createMessageZoneIfNeededWithCompletionBlock:v11];

  dispatch_time_t v6 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    *((unsigned char *)v15 + 24) = 0;
    if (IMOSLoggingEnabled())
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "***** Timed out creating message zone *******", v10, 2u);
      }
    }
  }
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)_scheduleOperation:(id)a3
{
  id v3 = a3;
  id v5 = +[IMDCKDatabaseManager sharedInstance];
  unint64_t v4 = [v5 truthDatabase];
  [v4 addOperation:v3];
}

- (void)_processRecordWriteCompletionForRecord:(id)a3 NSError:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    char v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v6 _stringForKey:@"guid"];
      v10 = [v6 recordID];
      *(_DWORD *)buf = 138412802;
      uint64_t v31 = (uint64_t)v9;
      __int16 v32 = 2112;
      id v33 = v7;
      __int16 v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Wrote message with GUID %@, error %@, recordName:%@", buf, 0x20u);
    }
  }
  if (!v7)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1D97D9D14;
    v28[3] = &unk_1E6B73218;
    v28[4] = self;
    id v11 = &v29;
    id v29 = v6;
    int v12 = MEMORY[0x1E4F14428];
    v13 = v28;
LABEL_26:
    dispatch_sync(v12, v13);
    goto LABEL_27;
  }
  if ([v7 code] != 14)
  {
    if ([v7 code] == 26)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = sub_1D97D9F80;
      v23[3] = &unk_1E6B73218;
      v23[4] = self;
      id v11 = &v24;
      id v24 = v6;
      int v12 = MEMORY[0x1E4F14428];
      v13 = v23;
    }
    else if ([v7 code] == 12 || objc_msgSend(v7, "code") == 11)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Record had invalid arguments, we'll try this record again on the next sync", buf, 2u);
        }
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = sub_1D97D9FD8;
      v21[3] = &unk_1E6B73218;
      v21[4] = self;
      id v11 = &v22;
      id v22 = v6;
      int v12 = MEMORY[0x1E4F14428];
      v13 = v21;
    }
    else if ([v7 code] == 2050 || objc_msgSend(v7, "code") == 100)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = sub_1D97DA030;
      v19[3] = &unk_1E6B73218;
      v19[4] = self;
      id v11 = &v20;
      id v20 = v6;
      int v12 = MEMORY[0x1E4F14428];
      v13 = v19;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = [v7 code];
          *(_DWORD *)buf = 134217984;
          uint64_t v31 = v16;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Encountered an unknown error.  We'll try syncing this message again on the next sync. Error code: %llu", buf, 0xCu);
        }
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = sub_1D97DA088;
      v17[3] = &unk_1E6B73218;
      v17[4] = self;
      id v11 = &v18;
      id v18 = v6;
      int v12 = MEMORY[0x1E4F14428];
      v13 = v17;
    }
    goto LABEL_26;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97D9D74;
  block[3] = &unk_1E6B73BC8;
  block[4] = self;
  id v26 = v7;
  id v27 = v6;
  dispatch_sync(MEMORY[0x1E4F14428], block);

  id v11 = &v26;
LABEL_27:
}

- (id)_ckUtilitiesInstance
{
  return +[IMDCKUtilities sharedInstance];
}

- (id)_operationErrorForModifyingRecordCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
  int v6 = [v5 CKPartialError:v4 onlyHasErrorCodes:&unk_1F33C6030];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Modify message had conflicts or the zone was not found, so treating this as a non error case", v10, 2u);
      }
    }
    id v8 = 0;
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

- (void)_processModifyRecordsCompletion:(id)a3 deletedRecordIDs:(id)a4 operationError:(id)a5 isLastBatchOfWrite:(BOOL)a6 activity:(id)a7 writeCompletionBlock:(id)a8
{
  BOOL v10 = a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = (__CFString *)a5;
  id v17 = a7;
  id v18 = (void (**)(id, BOOL, void *))a8;
  if (IMOSLoggingEnabled())
  {
    char v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = v16;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "_processModifyRecordsCompletion error %@", buf, 0xCu);
    }
  }
  id v20 = [(IMDCKMessageSyncController *)self _operationErrorForModifyingRecordCompletion:v16];

  if (v20) {
    goto LABEL_28;
  }
  if (IMIsRunningInAutomation())
  {
    unint64_t v21 = [MEMORY[0x1E4F6E6E8] sharedInstance];
    objc_msgSend(v21, "addNewMessagesSyncedCount:", objc_msgSend(v14, "count"));
  }
  if (v10)
  {
LABEL_28:
    if (IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = @"NO";
        if (v10) {
          id v24 = @"YES";
        }
        else {
          id v24 = @"NO";
        }
        *(_DWORD *)buf = 138412802;
        uint64_t v31 = v24;
        __int16 v32 = 2112;
        id v33 = v20;
        if (!v20) {
          v23 = @"YES";
        }
        __int16 v34 = 2112;
        v35 = v23;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "We completed writing messages. isLastBatch %@, write error %@, writeSuccess %@", buf, 0x20u);
      }
    }
    if (v18) {
      v18[2](v18, v20 == 0, v20);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Kicking off another batch of message writes to cloudKit", buf, 2u);
      }
    }
    id v26 = [(IMDCKMessageSyncController *)self ckQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D97DA534;
    block[3] = &unk_1E6B73A60;
    block[4] = self;
    id v28 = v17;
    id v29 = v18;
    dispatch_async(v26, block);
  }
}

- (id)_syncOperationGroupName
{
  v2 = [(IMDCKAbstractSyncController *)self syncState];
  id v3 = [v2 lastSyncDate];

  if (v3) {
    return @"PeriodicMessageSync";
  }
  else {
    return @"BackFillMessageSync";
  }
}

- (void)_writeDirtyMessagesToCloudKitWithActivity:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(IMDCKMessageSyncController *)self _deviceConditionsAllowsMessageSyncForCurrentBatchCount:1 maxBatchCount:-1 activity:v6])
  {
    id v8 = [(IMDCKMessageSyncController *)self _recordsToSave];
    id v9 = [(IMDCKAbstractSyncController *)self ckUtilities];
    BOOL v10 = (void *)[v9 newfilteredArrayRemovingCKRecordDupes:v8];

    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
        int v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        *(_DWORD *)buf = 138412546;
        __int16 v32 = v12;
        __int16 v33 = 2112;
        unint64_t v34 = (unint64_t)v13;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Got %@ records to sync, filtered to %@ unique records", buf, 0x16u);
      }
    }
    if ([v8 count])
    {
      unint64_t v14 = [v8 count];
      unint64_t v15 = [(IMDCKMessageSyncController *)self _numberOfMessagesToUpload];
      if (v14 < v15)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            uint64_t v17 = [v8 count];
            unint64_t v18 = [(IMDCKMessageSyncController *)self _numberOfMessagesToUpload];
            *(_DWORD *)buf = 134218240;
            __int16 v32 = (__CFString *)v17;
            __int16 v33 = 2048;
            unint64_t v34 = v18;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Number of messages to upload %lu < max batch size. %lu ", buf, 0x16u);
          }
        }
        if (IMOSLoggingEnabled())
        {
          char v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "**** This is the last batch of messages we will write", buf, 2u);
          }
        }
      }
      BOOL v20 = v14 < v15;
      [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToUploading];
      unint64_t v21 = [(IMDCKMessageSyncController *)self CKOperationFactory];
      id v22 = [(IMDCKMessageSyncController *)self _syncOperationGroupName];
      v23 = [v21 saveMessagesCKOperationUsingRecordsToSave:v10 operationGroupName:v22 activity:v6];

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = sub_1D97DAB00;
      v30[3] = &unk_1E6B74AB0;
      v30[4] = self;
      [v23 setPerRecordCompletionBlock:v30];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_1D97DAB10;
      v26[3] = &unk_1E6B73BF0;
      v26[4] = self;
      BOOL v29 = v20;
      id v27 = v6;
      id v28 = v7;
      [v23 setModifyRecordsCompletionBlock:v26];
      [(IMDCKMessageSyncController *)self _scheduleOperation:v23];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "**** We completed writing up messages. No more messages to write up. ***", buf, 2u);
        }
      }
      if (v7) {
        (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
      }
    }

    goto LABEL_30;
  }
  if (IMOSLoggingEnabled())
  {
    id v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v32 = @"NO";
      _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Did not schedule a write. Device Conditions suitable to write:%@", buf, 0xCu);
    }
  }
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6D208] code:2 userInfo:0];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v8);
LABEL_30:
  }
}

- (void)_processRecordChange:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 _stringForKey:@"guid"];
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Fetched message record with GUID %@", buf, 0xCu);
    }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D97DAC9C;
  v8[3] = &unk_1E6B73218;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(MEMORY[0x1E4F14428], v8);
}

- (void)_updateDeviceConditionsToCheckIfNeededForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (![(IMDCKMessageSyncController *)self deviceConditionsToCheck])
  {
    if (a4 == -1)
    {
      if (IMOSLoggingEnabled())
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v10) = 0;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "This is a periodic sync and deviceConditionstoCheck is set to IMCheckNoDeviceConditions, changing it to IMCheckAllDeviceConditions", (uint8_t *)&v10, 2u);
        }
        goto LABEL_12;
      }
LABEL_13:
      [(IMDCKMessageSyncController *)self setDeviceConditionsToCheck:1];
      return;
    }
    if ((a4 & 0x8000000000000000) == 0 && a3 > a4)
    {
      if (IMOSLoggingEnabled())
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          id v8 = [NSNumber numberWithInteger:a3];
          id v9 = [NSNumber numberWithInteger:a4];
          int v10 = 138412546;
          id v11 = v8;
          __int16 v12 = 2112;
          v13 = v9;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "This is an initial sync but current batch count [%@] >= maxBatchCount [%@] and deviceConditionstoCheck is set to IMCheckNoDeviceConditions, changing it to IMCheckAllDeviceConditions", (uint8_t *)&v10, 0x16u);
        }
LABEL_12:

        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
}

- (BOOL)_deviceConditionsAllowsMessageSyncForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4 activity:(id)a5
{
  id v8 = a5;
  [(IMDCKMessageSyncController *)self _updateDeviceConditionsToCheckIfNeededForCurrentBatchCount:a3 maxBatchCount:a4];
  LOBYTE(a4) = [(IMDCKMessageSyncController *)self _deviceConditionsAllowsMessageSyncForActivity:v8 deviceConditionsToCheck:[(IMDCKMessageSyncController *)self deviceConditionsToCheck] currentBatchCount:a3 maxBatchCount:a4];

  return a4;
}

- (BOOL)_shouldDeferCoreDuetMessagesSyncWithActivity:(id)a3
{
  id v3 = (_xpc_activity_s *)a3;
  BOOL should_defer = xpc_activity_should_defer(v3);
  if (should_defer)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Setting xpc_activity_t to XPC_ACTIVITY_STATE_DEFER because conditions are no longer met", buf, 2u);
      }
    }
    if (!xpc_activity_set_state(v3, 3) && IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Error forcing xpc_activity_t to XPC_ACTIVITY_STATE_DEFER", v8, 2u);
      }
    }
  }

  return should_defer;
}

- (BOOL)_isCoreDuetSyncForMaxBatchCount:(int64_t)a3 activity:(id)a4
{
  return a3 == -1 && a4 != 0;
}

- (BOOL)_deviceConditionsAllowsMessageSyncForActivity:(id)a3 deviceConditionsToCheck:(unint64_t)a4 currentBatchCount:(int64_t)a5 maxBatchCount:(int64_t)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  int v10 = [(IMDCKMessageSyncController *)self _ckUtilitiesInstance];
  int v11 = [v10 cloudKitSyncingEnabled];

  __int16 v12 = [(IMDCKMessageSyncController *)self _ckUtilitiesInstance];
  int v13 = [v12 iCloudAccountMatchesiMessageAccount];

  if ((v11 & v13) == 1)
  {
    if ([(IMDCKMessageSyncController *)self _isCoreDuetSyncForMaxBatchCount:a6 activity:v9])
    {
      BOOL v14 = [(IMDCKMessageSyncController *)self _shouldDeferCoreDuetMessagesSyncWithActivity:v9];
      int v15 = IMOSLoggingEnabled();
      if (v14)
      {
        if (v15)
        {
          uint64_t v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            uint64_t v17 = [NSNumber numberWithInteger:a5];
            int v34 = 138412290;
            uint64_t v35 = v17;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "This is a coreduet sync at currentBatchCount %@, coreduet says to defer syncing", (uint8_t *)&v34, 0xCu);
          }
        }
        int v11 = 0;
        goto LABEL_44;
      }
      if (v15)
      {
        id v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = [NSNumber numberWithInteger:a5];
          int v34 = 138412290;
          uint64_t v35 = v25;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "This is a coreduet sync at currentBatchCount %@, coreduet says to continue syncing", (uint8_t *)&v34, 0xCu);
        }
LABEL_34:

        goto LABEL_44;
      }
      goto LABEL_44;
    }
    if ([(IMDCKMessageSyncController *)self _numberOfBatchesOfMessagesToFetchInInitialSync] >= a5)
    {
      int v26 = IMOSLoggingEnabled();
      if (a6 == -1)
      {
        if (v26)
        {
          id v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            id v28 = [NSNumber numberWithInteger:a5];
            int v34 = 138412546;
            uint64_t v35 = v28;
            __int16 v36 = 2112;
            v37 = @"NO";
            _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Message sync: Not checking device conditions for full sync at current batch count %@ isCoreDuetSync %@", (uint8_t *)&v34, 0x16u);
          }
          goto LABEL_34;
        }
      }
      else if (v26)
      {
        id v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          id v27 = [NSNumber numberWithInteger:a5];
          int v34 = 138412290;
          uint64_t v35 = v27;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Message sync: Not checking device conditions for initial sync at current batchCount %@", (uint8_t *)&v34, 0xCu);
        }
        goto LABEL_34;
      }
LABEL_44:
      LOBYTE(v11) = v11 != 0;
      goto LABEL_45;
    }
    unint64_t v21 = [(IMDCKMessageSyncController *)self deviceConditionsToCheck];
    if (v21 == 2)
    {
      id v22 = [(IMDCKMessageSyncController *)self _ckUtilitiesInstance];
      int v23 = [v22 isDeviceOnWifi];
    }
    else
    {
      if (v21 != 1) {
        goto LABEL_37;
      }
      id v22 = [(IMDCKMessageSyncController *)self _ckUtilitiesInstance];
      int v23 = [v22 deviceConditionsAllowPeriodicSync];
    }
    int v11 = v23;

LABEL_37:
    if (IMOSLoggingEnabled())
    {
      BOOL v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        if (v11) {
          v30 = @"YES";
        }
        else {
          v30 = @"NO";
        }
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IMDCKMessageSyncController deviceConditionsToCheck](self, "deviceConditionsToCheck"));
        uint64_t v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
        __int16 v32 = [NSNumber numberWithInteger:a5];
        int v34 = 138412802;
        uint64_t v35 = v30;
        __int16 v36 = 2112;
        v37 = v31;
        __int16 v38 = 2112;
        v39 = v32;
        _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Message sync: device conditions allow sync: %@ deviceConditionsToCheck %@ currentBatchCount %@", (uint8_t *)&v34, 0x20u);
      }
    }
    goto LABEL_44;
  }
  if (IMOSLoggingEnabled())
  {
    unint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      char v19 = @"NO";
      if (v11) {
        BOOL v20 = @"YES";
      }
      else {
        BOOL v20 = @"NO";
      }
      if (v13) {
        char v19 = @"YES";
      }
      int v34 = 138412546;
      uint64_t v35 = v20;
      __int16 v36 = 2112;
      v37 = v19;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Message sync: Stop syncing, feature enabled %@ hasMatchingAccounts %@.", (uint8_t *)&v34, 0x16u);
    }
  }
LABEL_45:

  return v11;
}

- (void)_migrateSyncTokens
{
  id v3 = [(IMDCKMessageSyncController *)self syncTokenStore];
  [v3 migrateKey:@"archivedMessagesChangeToken" fromDatabase:@"/var/mobile/Library/SMS/CloudKitMetaData/MessageSyncArchivedRecordMetaData.db"];

  id v4 = [(IMDCKMessageSyncController *)self syncTokenStore];
  [v4 migrateKey:@"messagesChangeToken" fromDatabase:@"/var/mobile/Library/SMS/CloudKitMetaData/MessageSyncZoneMetaData.db"];
}

- (void)setArchivedRecordSyncToken:(id)a3
{
  id v5 = (CKServerChangeToken *)a3;
  if (v5)
  {
    if (self->_archivedRecordSyncToken == v5) {
      goto LABEL_6;
    }
    id v9 = v5;
    objc_storeStrong((id *)&self->_archivedRecordSyncToken, a3);
    id v6 = [(IMDCKMessageSyncController *)self syncTokenStore];
    id v7 = v6;
    id v8 = v9;
  }
  else
  {
    id v9 = 0;
    id v6 = [(IMDCKMessageSyncController *)self syncTokenStore];
    id v7 = v6;
    id v8 = 0;
  }
  [v6 persistToken:v8 forKey:@"archivedMessagesChangeToken"];

  id v5 = v9;
LABEL_6:
}

- (CKServerChangeToken)archivedRecordSyncToken
{
  id v3 = [(IMDCKMessageSyncController *)self syncTokenStore];
  id v4 = [v3 tokenForKey:@"archivedMessagesChangeToken"];
  archivedRecordSyncToken = self->_archivedRecordSyncToken;
  self->_archivedRecordSyncToken = v4;

  id v6 = self->_archivedRecordSyncToken;

  return v6;
}

- (void)_resetArvchivedRecordSyncToken
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Resetting the archived message sync token to nil", buf, 2u);
    }
  }
  id v4 = [(IMDCKMessageSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97DB9E0;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (id)_changeTokenKey
{
  return @"messagesChangeToken";
}

- (void)setLatestSyncToken:(id)a3
{
  id v7 = a3;
  id v4 = [(IMDCKMessageSyncController *)self syncTokenStore];
  id v5 = [(IMDCKMessageSyncController *)self _changeTokenKey];
  if (v7) {
    id v6 = v7;
  }
  else {
    id v6 = 0;
  }
  [v4 persistToken:v6 forKey:v5];
}

- (CKServerChangeToken)latestSyncToken
{
  id v3 = [(IMDCKMessageSyncController *)self syncTokenStore];
  id v4 = [(IMDCKMessageSyncController *)self _changeTokenKey];
  id v5 = [v3 tokenForKey:v4];

  return (CKServerChangeToken *)v5;
}

- (void)_resetSyncToken
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Resetting the message sync token to nil", buf, 2u);
    }
  }
  id v4 = [(IMDCKMessageSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97DBBF0;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_processArchivedRecordsFetchCompletionZoneID:(id)a3 serverChangeToken:(id)a4 moreComing:(BOOL)a5 currentBatchCount:(int64_t)a6 maxNumberOfBatches:(int64_t)a7 activity:(id)a8 error:(id)a9 completionBlock:(id)a10
{
  id v15 = a4;
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  char v19 = [(IMDCKMessageSyncController *)self ckQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1D97DBDCC;
  v24[3] = &unk_1E6B76BC8;
  BOOL v32 = a5;
  id v25 = v15;
  id v26 = v17;
  int64_t v30 = a6;
  int64_t v31 = a7;
  id v27 = self;
  id v28 = v16;
  id v29 = v18;
  id v20 = v18;
  id v21 = v16;
  id v22 = v17;
  id v23 = v15;
  dispatch_sync(v19, v24);
}

- (void)_fetchArchivedRecordsIfNeeded:(BOOL)a3 currentBatchCount:(int64_t)a4 maxNumberOfBatches:(int64_t)a5 activity:(id)a6 withCompletionBlock:(id)a7
{
  BOOL v10 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  if (a5 < 0 || a4 < a5)
  {
    BOOL v15 = [(IMDCKMessageSyncController *)self _deviceConditionsAllowsMessageSyncForCurrentBatchCount:a4 maxBatchCount:a5 activity:v12];
    int v16 = IMOSLoggingEnabled();
    if (v15 && v10)
    {
      if (v16)
      {
        id v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v18 = [NSNumber numberWithInteger:a4];
          char v19 = [NSNumber numberWithInteger:a5];
          *(_DWORD *)buf = 138412546;
          v43 = v18;
          __int16 v44 = 2112;
          v45 = v19;
          _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Fetching archived currentBatchCount %@ maxNumberOfBatches %@", buf, 0x16u);
        }
      }
      [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToDownloading];
      if (IMOSLoggingEnabled())
      {
        id v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v21 = [(IMDCKMessageSyncController *)self archivedRecordSyncToken];
          *(_DWORD *)buf = 138412290;
          v43 = v21;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "******** Fetching archived records ***** sync token is %@", buf, 0xCu);
        }
      }
      id v22 = [(IMDCKMessageSyncController *)self CKOperationFactory];
      id v23 = [(IMDCKMessageSyncController *)self archivedRecordSyncToken];
      id v24 = [(IMDCKMessageSyncController *)self _messageZoneID];
      id v25 = [v22 fetchArchivedRecordsOperationWithSyncToken:v23 zoneID:v24 activity:v12];

      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = sub_1D97DC870;
      v41[3] = &unk_1E6B749D0;
      v41[4] = self;
      [v25 setRecordFetchedBlock:v41];
      [v25 setRecordZoneChangeTokensUpdatedBlock:&unk_1F33919C0];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = sub_1D97DCA64;
      v36[3] = &unk_1E6B76C10;
      v36[4] = self;
      int64_t v39 = a4;
      int64_t v40 = a5;
      id v37 = v12;
      id v26 = v13;
      id v38 = v26;
      [v25 setRecordZoneFetchCompletionBlock:v36];
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      BOOL v32 = sub_1D97DCAA8;
      __int16 v33 = &unk_1E6B74A68;
      int v34 = self;
      id v35 = v26;
      [v25 setFetchArchivedRecordsCompletionBlock:&v30];
      -[IMDCKMessageSyncController _scheduleOperation:](self, "_scheduleOperation:", v25, v30, v31, v32, v33, v34);
    }
    else if (v15)
    {
      if (v16)
      {
        id v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Did not fetch archived records from message zone as no archived hint present", buf, 2u);
        }
      }
      if (v13) {
        goto LABEL_8;
      }
    }
    else
    {
      if (v16)
      {
        id v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Did not fetch archived records from message zone as device condition does not allow sync", buf, 2u);
        }
      }
      if (v13)
      {
        id v29 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6D208] code:2 userInfo:0];
        (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v29);
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
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "****** We are done fetching archived messages as max batch attempt limit reached ********", buf, 2u);
      }
    }
    if (v13) {
LABEL_8:
    }
      (*((void (**)(id, uint64_t, uint64_t, void))v13 + 2))(v13, 1, 1, 0);
  }
}

- (void)_processFetchArchivedRecordCompletionWithError:(id)a3 WithCompletionBlock:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v5;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "*** Encountered error while fetching archived records %@", (uint8_t *)&v10, 0xCu);
      }
    }
    if (v6) {
      (*((void (**)(id, void, void, id))v6 + 2))(v6, 0, 0, v5);
    }
  }
  else if (v7)
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "*** Did not encounter error while fetching archived records", (uint8_t *)&v10, 2u);
    }
  }
}

- (void)_processRecordZoneFetchCompletionZoneID:(id)a3 serverChangeToken:(id)a4 clientChangeTokenData:(id)a5 moreComing:(BOOL)a6 NSError:(id)a7 syncType:(int64_t)a8 currentBatchCount:(int64_t)a9 maxNumberOfBatches:(int64_t)a10 shouldFetchArchivedRecords:(BOOL)a11 activity:(id)a12 completionBlock:(id)a13
{
  id v16 = a4;
  id v17 = a7;
  id v18 = a12;
  id v19 = a13;
  id v20 = [(IMDCKMessageSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97DCD84;
  block[3] = &unk_1E6B76C60;
  BOOL v35 = a6;
  id v27 = v16;
  id v28 = v17;
  BOOL v36 = a11;
  int64_t v33 = a10;
  int64_t v34 = a8;
  id v29 = self;
  id v30 = v18;
  id v31 = v19;
  int64_t v32 = a9;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  dispatch_sync(v20, block);
}

- (void)_processFetchRecordZoneChangesCompletionWithError:(id)a3 completionBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_5;
  }
  id v8 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
  if ([v8 errorIndicatesZoneNotCreated:v6])
  {

    goto LABEL_5;
  }
  id v9 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
  char v10 = [v9 errorIndicatesUserDeletedZone:v6];

  if (v10)
  {
LABEL_5:
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "_processFetchRecordZoneChangesCompletionWithError with no error", buf, 2u);
      }
    }
    goto LABEL_9;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Failed fetching messages %@", buf, 0xCu);
    }
  }
  if (v7)
  {
    id v13 = [(IMDCKMessageSyncController *)self ckQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1D97DD90C;
    v14[3] = &unk_1E6B73A10;
    id v16 = v7;
    id v15 = v6;
    dispatch_async(v13, v14);
  }
LABEL_9:
}

- (BOOL)_shouldFetchArchivedRecords:(id)a3
{
  id v4 = [a3 recordZoneIDsWithPendingArchivedRecords];
  LOBYTE(self) = -[IMDCKMessageSyncController _doesAnyRecordZoneIDHavePendingArchivedRecords:](self, "_doesAnyRecordZoneIDHavePendingArchivedRecords:", [v4 count]);

  return (char)self;
}

- (BOOL)_doesAnyRecordZoneIDHavePendingArchivedRecords:(int64_t)a3
{
  return a3 > 0;
}

- (BOOL)_isDiskSpaceAvailableForSyncType:(int64_t)a3 currentBatchCount:(int64_t)a4
{
  BOOL v6 = __ROR8__(0x8F5C28F5C28F5C29 * a4, 2) < 0x28F5C28F5C28F5DuLL;
  id v7 = +[IMDCKCacheDeleteManager sharedInstance];
  LOBYTE(a3) = objc_msgSend(v7, "canWriteFileOfEstimatedSize:refreshCachedValue:", 40960* -[IMDCKMessageSyncController _numberOfRecordsToFetchForSyncType:](self, "_numberOfRecordsToFetchForSyncType:", a3), v6);

  return a3;
}

- (void)_fetchMessageZoneChangesSyncType:(int64_t)a3 currentBatchCount:(int64_t)a4 maxNumberOfBatches:(int64_t)a5 activity:(id)a6 completionBlock:(id)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v47 = a6;
  id v12 = a7;
  if (a5 < 1 || a4 < a5)
  {
    int64_t v20 = [(IMDCKMessageSyncController *)self _numberOfBatchesOfMessagesToFetchInInitialSync];
    if (a5 == -1)
    {
      int64_t v21 = v20;
      if (v20 < a4)
      {
        id v22 = [MEMORY[0x1E4F1C9C8] date];
        if (IMOSLoggingEnabled())
        {
          id v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            id v24 = [NSNumber numberWithInteger:v21];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v24;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v22;
            _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "We completed fetching %@ batches of messages during a full sync, setting fullPartialSyncFirstCompletedDate to %@", buf, 0x16u);
          }
        }
        id v25 = [(IMDCKAbstractSyncController *)self syncState];
        [v25 setAnalyticSyncDatesDictionaryObject:v22 forKey:*MEMORY[0x1E4F6CFC8] shouldOverrideIfExists:0];
      }
    }
    BOOL v26 = [(IMDCKMessageSyncController *)self _isDiskSpaceAvailableForSyncType:a3 currentBatchCount:a4];
    BOOL v27 = [(IMDCKMessageSyncController *)self _deviceConditionsAllowsMessageSyncForCurrentBatchCount:a4 maxBatchCount:a5 activity:v47];
    int v28 = IMOSLoggingEnabled();
    if (v27 && v26)
    {
      if (v28)
      {
        id v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          id v30 = [NSNumber numberWithInteger:a4];
          id v31 = [NSNumber numberWithInteger:a5];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v31;
          _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Fetching live messages, currentBatchCount %@ maxNumberOfBatches %@", buf, 0x16u);
        }
      }
      [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToDownloading];
      int64_t v32 = [(IMDCKMessageSyncController *)self CKOperationFactory];
      int64_t v33 = [(IMDCKMessageSyncController *)self latestSyncToken];
      int64_t v34 = [(IMDCKMessageSyncController *)self _messageZoneID];
      unint64_t v35 = [(IMDCKMessageSyncController *)self _numberOfRecordsToFetchForSyncType:a3];
      BOOL v36 = [(IMDCKMessageSyncController *)self _syncOperationGroupName];
      id v37 = [v32 fetchMessageZoneChangesCKOperationUsingToken:v33 zoneID:v34 resultsLimit:v35 operationGroupName:v36 activity:v47];

      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = sub_1D97DE2E8;
      v57[3] = &unk_1E6B749D0;
      v57[4] = self;
      [v37 setRecordChangedBlock:v57];
      [v37 setRecordZoneChangeTokensUpdatedBlock:&unk_1F33919E0];
      [v37 setRecordWithIDWasDeletedBlock:&unk_1F3391A00];
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v61 = sub_1D97DE4B0;
      v62 = sub_1D97DE4C0;
      id v63 = 0;
      id v38 = v37;
      id v63 = v38;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = sub_1D97DE4C8;
      v50[3] = &unk_1E6B76CA8;
      v50[4] = self;
      v53 = buf;
      int64_t v54 = a3;
      int64_t v55 = a4;
      int64_t v56 = a5;
      id v51 = v47;
      id v39 = v12;
      id v52 = v39;
      [v38 setRecordZoneFetchCompletionBlock:v50];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = sub_1D97DE5AC;
      v48[3] = &unk_1E6B74A68;
      v48[4] = self;
      id v49 = v39;
      [v38 setFetchRecordZoneChangesCompletionBlock:v48];
      if (IMOSLoggingEnabled())
      {
        int64_t v40 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = [(IMDCKMessageSyncController *)self latestSyncToken];
          *(_DWORD *)v58 = 138412290;
          v59 = v41;
          _os_log_impl(&dword_1D967A000, v40, OS_LOG_TYPE_INFO, "Scheduling a fetch operation from message zone, using token %@", v58, 0xCu);
        }
      }
      [(IMDCKMessageSyncController *)self _scheduleOperation:v38];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (v28)
      {
        v43 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          __int16 v44 = @"NO";
          if (v27) {
            v45 = @"YES";
          }
          else {
            v45 = @"NO";
          }
          if (v26) {
            __int16 v44 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v45;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v44;
          _os_log_impl(&dword_1D967A000, v43, OS_LOG_TYPE_INFO, "Did not fetch changes from message zone. Device condition allows sync %@. Disk Space Available %@", buf, 0x16u);
        }
      }
      if (v12)
      {
        uint64_t v46 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6D208] code:2 userInfo:0];
        (*((void (**)(id, void, void, void, void *))v12 + 2))(v12, 0, 0, 0, v46);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "****** We are done fetching live messages as max batch attempt limit reached ********", buf, 2u);
      }
    }
    BOOL v14 = +[IMDCKUtilities sharedInstance];
    int v15 = [v14 shouldForceArchivedMessagesSync];

    if (v15)
    {
      uint64_t v16 = IMGetDomainBoolForKeyWithDefaultValue();
      if (v12)
      {
        uint64_t v17 = v16;
        if (IMOSLoggingEnabled())
        {
          id v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            uint64_t v19 = @"NO";
            if (v17) {
              uint64_t v19 = @"YES";
            }
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v19;
            _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "shouldForceArchivedMessagesSync is YES, fetched max live record batches but will also fetch initial sync archived records if needed: %@", buf, 0xCu);
          }
        }
        (*((void (**)(id, uint64_t, uint64_t, void, void))v12 + 2))(v12, 1, v17, 0, 0);
      }
    }
    else if (v12)
    {
      if (IMOSLoggingEnabled())
      {
        v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "Since we fetched max live batch records, we will not fetch archived records", buf, 2u);
        }
      }
      (*((void (**)(id, uint64_t, void, void, void))v12 + 2))(v12, 1, 0, 0, 0);
    }
  }
}

- (void)_noteSyncEnded
{
  [(IMDCKAbstractSyncController *)self setIsSyncing:0];
  [(IMDCKMessageSyncController *)self setDeviceConditionsToCheck:0];
  if ([(IMDCKMessageSyncController *)self encounteredIncompatibleMessage])
  {
    if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Need to kick off a sync of deletes because we had an incompatible message earlier.", v4, 2u);
      }
    }
    [(IMDCKMessageSyncController *)self setEncounteredIncompatibleMessage:0];
    [(IMDCKMessageSyncController *)self syncDeletedMessagesToCloudKitWithCompletion:&unk_1F3391A20];
  }
}

- (void)_markAllIncompatibleMessagesForDeletion
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "Mark all incompatible messages for deletion from cloudkit", v4, 2u);
    }
  }
  IMDAddIncompatibleGroupPhotoChangedMessagesToDeleteFromCloudKit();
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"__kCKRecordIMMessageIncompatibleDeleteNotification" object:0];
}

- (void)_needsToMarkAllMessagesAsNeedingSync
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v2 setBool:0 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF38]];
}

- (BOOL)_shouldMarkAllMessagesAsNeedingSync
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  char v3 = [v2 isUnderFirstDataProtectionLock];

  if (v3)
  {
    int v4 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F6E720] sharedInstance];
    int v4 = [v5 getBoolFromDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF38]] ^ 1;
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = @"NO";
      if (v4) {
        id v7 = @"YES";
      }
      int v9 = 138412290;
      char v10 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "_shouldMarkAllMessagesAsNeedingSync %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return v4;
}

- (void)_hasMarkedAllMessagesAsNeedingSync
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v2 setBool:1 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF38]];
}

- (void)_markAllUnsuccessFullSyncMessagesAsNeedingSync
{
}

- (void)_kickOffWriteOnCKQueueWithActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Kicking off a message write after fetching messages", buf, 2u);
    }
  }
  int v9 = [(IMDCKMessageSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97DEBA8;
  block[3] = &unk_1E6B73A60;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (BOOL)_kickOffWriteIfNeededForSyncType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  id v8 = a4;
  int v9 = (void (**)(id, uint64_t, void))a5;
  id v10 = [(IMDCKMessageSyncController *)self _ckUtilitiesInstance];
  LODWORD(a3) = [v10 shouldKickOffWriteForSyncType:a3];

  if (!a3)
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Not writing up messages as sync type does not allow it", buf, 2u);
      }
    }
    if (v9) {
      v9[2](v9, 1, 0);
    }
    goto LABEL_16;
  }
  id v11 = [(IMDCKMessageSyncController *)self _ckUtilitiesInstance];
  char v12 = [v11 isLocalCachedSaltPresent];

  if ((v12 & 1) == 0)
  {
    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        int v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Not kicking off a write because cachedSalt is not present.", buf, 2u);
        }
      }
      uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6D208] code:3 userInfo:0];
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v16);
    }
LABEL_16:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D97DF078;
    block[3] = &unk_1E6B73268;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    BOOL v13 = 0;
    goto LABEL_17;
  }
  [(IMDCKMessageSyncController *)self _kickOffWriteOnCKQueueWithActivity:v8 completion:v9];
  BOOL v13 = 1;
LABEL_17:

  return v13;
}

- (void)syncMessagesWithSyncType:(int64_t)a3 deviceConditionsToCheck:(unint64_t)a4 activity:(id)a5 completionBlock:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if (IMOSLoggingEnabled())
  {
    char v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      BOOL v13 = [NSNumber numberWithUnsignedInteger:a4];
      *(_DWORD *)buf = 134218242;
      int64_t v22 = a3;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "syncMessagesWithSyncType with type %ld deviceConditionsToCheck %@", buf, 0x16u);
    }
  }
  [(IMDCKAbstractSyncController *)self resetRecordCounts];
  [(IMDCKAbstractSyncController *)self setIsSyncing:1];
  [(IMDCKMessageSyncController *)self setDeviceConditionsToCheck:a4];
  id v14 = [(IMDCKMessageSyncController *)self ckQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1D97DF268;
  v17[3] = &unk_1E6B76D70;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  int64_t v20 = a3;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v14, v17);
}

- (void)deleteMessageSyncToken
{
  if (IMOSLoggingEnabled())
  {
    char v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Clearing local sync tokens for Messages", v5, 2u);
    }
  }
  id v4 = [(IMDCKMessageSyncController *)self latestSyncToken];
  [(IMDCKMessageSyncController *)self setLatestSyncToken:0];
  [(IMDCKMessageSyncController *)self setArchivedRecordSyncToken:0];
}

- (void)deleteChatBotMessageSyncToken
{
  id v2 = [(IMDCKMessageSyncController *)self syncTokenStore];
  [v2 persistToken:0 forKey:@"chatBotMessageChangeToken"];
}

- (void)deleteMessagesZone
{
  char v3 = [(IMDCKMessageSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97DFEF8;
  block[3] = &unk_1E6B73268;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)clearLocalSyncState:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Clearing local messages sync state, flags 0x%x", (uint8_t *)v7, 8u);
    }
  }
  if (v3)
  {
    [(IMDCKMessageSyncController *)self deleteMessageSyncToken];
    [(IMDCKMessageSyncController *)self deleteChatBotMessageSyncToken];
  }
  if ((v3 & 2) != 0)
  {
    id v6 = +[IMDMessageStore sharedInstance];
    [v6 markAllMessagesAsNeedingCloudKitSync];
  }
  else if ((v3 & 0x10) != 0)
  {
    [(IMDCKMessageSyncController *)self _needsToMarkAllMessagesAsNeedingSync];
  }
}

- (void)_processRecordDeletionCompletion:(id)a3 error:(id)a4 completionBlock:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v9;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Delete message callback with error %@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97E027C;
  block[3] = &unk_1E6B73BC8;
  id v12 = v8;
  id v19 = v12;
  id v13 = v9;
  id v20 = v13;
  int64_t v21 = self;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  if (v10)
  {
    id v14 = [(IMDCKMessageSyncController *)self ckQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1D97E05AC;
    v15[3] = &unk_1E6B73A10;
    id v17 = v10;
    id v16 = v13;
    dispatch_async(v14, v15);
  }
}

- (void)_deleteMessagesWithRecordIDs:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [(IMDCKMessageSyncController *)self CKOperationFactory];
    id v9 = [v8 deleteMessageCKOperationUsingRecordIDstoDelete:v6];

    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = sub_1D97E07EC;
    id v15 = &unk_1E6B73B28;
    id v16 = self;
    id v17 = v7;
    [v9 setModifyRecordsCompletionBlock:&v12];
    objc_msgSend(v9, "setPerRecordCompletionBlock:", &unk_1F3391A40, v12, v13, v14, v15, v16);
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v6;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Kicking off deleted of recordIDs %@", buf, 0xCu);
      }
    }
    [(IMDCKMessageSyncController *)self _scheduleOperation:v9];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "No GUIDs passed in to delete", buf, 2u);
      }
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (id)_sharedIMDMessageStore
{
  return +[IMDMessageStore sharedInstance];
}

- (id)_constructMessageRecordIDUsingTombStoneDictionary:(id)a3
{
  id v4 = [a3 valueForKey:@"recordID"];
  if ([v4 length])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    id v6 = [(IMDCKMessageSyncController *)self _messageZoneID];
    id v7 = (void *)[v5 initWithRecordName:v4 zoneID:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_copyRecordIDsToDeleteWithLimit:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = [(IMDCKMessageSyncController *)self _sharedIMDMessageStore];
  id v6 = (void *)[v5 copyMessagesThatNeedToBeDeletedInCloudKitWithLimit:a3];

  id v7 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = (void *)MEMORY[0x1E016A370]();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = -[IMDCKMessageSyncController _constructMessageRecordIDUsingTombStoneDictionary:](self, "_constructMessageRecordIDUsingTombStoneDictionary:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        id v15 = v14;
        if (v7 && v14) {
          CFArrayAppendValue(v7, v14);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v7;
}

- (void)syncDeletedMessagesToCloudKitWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDCKMessageSyncController *)self _ckUtilitiesInstance];
  char v6 = [v5 cloudKitSyncingEnabled];

  if (v6)
  {
    id v7 = [(IMDCKMessageSyncController *)self _copyRecordIDsToDeleteWithLimit:[(IMDCKMessageSyncController *)self _messageDeleteBatchSize]];
    id v8 = [(IMDCKMessageSyncController *)self _ckUtilitiesInstance];
    id v9 = (void *)[v8 newfilteredArrayRemovingCKRecordIDDupes:v7];

    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v19 = [v7 count];
        __int16 v20 = 2048;
        uint64_t v21 = [v9 count];
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Got %lu recordIDs to sync, filtered to %lu unique recordID", buf, 0x16u);
      }
    }
    if ([v9 count]) {
      goto LABEL_7;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "No pending messages to delete from CloudKit", buf, 2u);
      }
    }
    id v14 = [(IMDCKMessageSyncController *)self _sharedIMDMessageStore];
    [v14 clearMessagesTombStoneTable];

    if (!v4)
    {
LABEL_7:
      [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToDeleting];
      uint64_t v11 = [(IMDCKMessageSyncController *)self ckQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D97E0D34;
      block[3] = &unk_1E6B73A60;
      void block[4] = self;
      id v16 = v9;
      id v17 = v4;
      dispatch_async(v11, block);
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Not doing CloudKit message deletes as CK syncing is off", buf, 2u);
      }
    }
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

- (void)incompatibleMessageDeleteDetected:(id)a3
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

- (SyncTokenStoreProviding)syncTokenStore
{
  return self->_syncTokenStore;
}

- (void)setSyncTokenStore:(id)a3
{
}

- (IMDCKMessageSyncCKOperationFactory)CKOperationFactory
{
  return self->_CKOperationFactory;
}

- (void)setCKOperationFactory:(id)a3
{
}

- (unint64_t)deviceConditionsToCheck
{
  return self->_deviceConditionsToCheck;
}

- (void)setDeviceConditionsToCheck:(unint64_t)a3
{
  self->_deviceConditionsToCheck = a3;
}

- (NSMutableDictionary)visitedChats
{
  return self->_visitedChats;
}

- (void)setVisitedChats:(id)a3
{
}

- (BOOL)encounteredIncompatibleMessage
{
  return self->_encounteredIncompatibleMessage;
}

- (void)setEncounteredIncompatibleMessage:(BOOL)a3
{
  self->_encounteredIncompatibleMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitedChats, 0);
  objc_storeStrong((id *)&self->_CKOperationFactory, 0);
  objc_storeStrong((id *)&self->_syncTokenStore, 0);
  objc_storeStrong((id *)&self->_recordZoneManager, 0);
  objc_storeStrong((id *)&self->_ckQueue, 0);

  objc_storeStrong((id *)&self->_archivedRecordSyncToken, 0);
}

@end