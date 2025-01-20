@interface IMDCKChatSyncController
+ (id)sharedInstance;
- (BOOL)_chatZoneCreated;
- (BOOL)_eligibleForTruthZone;
- (BOOL)_lockRecordHadConflict:(id)a3;
- (BOOL)_shouldMarkAllChatsAsNeedingSync;
- (BOOL)_shouldResyncChatsForError:(id)a3;
- (BOOL)fetchedChatsDuringLastSync;
- (CKRecord)lockRecord;
- (CKServerChangeToken)latestSyncToken;
- (IMDCKChatSyncCKOperationFactory)CKOperationFactory;
- (IMDCKChatSyncController)init;
- (IMDCKChatSyncController)initWithSyncTokenStore:(id)a3;
- (IMDChatRegistry)chatRegistry;
- (IMDRecordZoneManager)recordZoneManager;
- (OS_dispatch_queue)ckQueue;
- (SyncTokenStoreProviding)syncTokenStore;
- (id)_changeTokenKey;
- (id)_chatZoneID;
- (id)_copyChatsToUploadWithLimit:(unint64_t)a3;
- (id)_copyRecordIDsToDelete;
- (id)_fetchChatRecordOperationWithActivity:(id)a3;
- (id)_generateLockRecord;
- (id)_newckRecordsFromChats:(id)a3;
- (id)_randomSalt;
- (id)_recordKeyManagerSharedInstance;
- (id)recordStore;
- (int64_t)syncControllerRecordType;
- (unint64_t)_numberOfChatsToFetch;
- (unint64_t)_numberOfChatsToWrite;
- (void)__syncChatsWithCloudKit:(int64_t)a3 attemptCount:(unint64_t)a4 activity:(id)a5 withCompletion:(id)a6;
- (void)_anyChatExistsOnServerWithResultsLimit:(int)a3 changeToken:(id)a4 activity:(id)a5 completion:(id)a6;
- (void)_deleteChatRecordsWithRecordIDs:(id)a3 completion:(id)a4;
- (void)_filterRecordIDsToChatsWithNoRecentModifications:(id)a3 completion:(id)a4;
- (void)_handleChatDeletionCompletionForRecordIDs:(id)a3 error:(id)a4;
- (void)_hasMarkedAllChatsAsNeedingSync;
- (void)_kickOffWriteIfNeededForSyncType:(int64_t)a3 activity:(id)a4 completion:(id)a5;
- (void)_kickOffWriteOnCKQueueWithActivity:(id)a3 completion:(id)a4;
- (void)_logGreenTeaLogsForChats:(id)a3;
- (void)_markChatAsDefferedForSyncingUsingRecord:(id)a3;
- (void)_migrateServerChangeToken;
- (void)_needsToMarkAllChatsAsNeedingSync;
- (void)_processFetchRecordChangesCompleted:(id)a3 activity:(id)a4 completion:(id)a5 syncType:(int64_t)a6;
- (void)_processModifyPerRecordCallBack:(id)a3 error:(id)a4 recordIDtoGUIDmap:(id)a5;
- (void)_processModifyRecordCompletion:(id)a3 deletedRecordIDs:(id)a4 error:(id)a5 completionBlock:(id)a6;
- (void)_processRecordChanged:(id)a3;
- (void)_processRecordDeletion:(id)a3;
- (void)_processRecordZoneChangeTokenUpdated:(id)a3 zoneID:(id)a4 clienChangeToken:(id)a5;
- (void)_processRecordZoneFetchCompletion:(id)a3 zoneID:(id)a4 clientChangeTokenData:(id)a5 moreComing:(BOOL)a6 error:(id)a7;
- (void)_resolveChatConflictUsingCKRecord:(id)a3 localGUID:(id)a4;
- (void)_scheduleOperation:(id)a3;
- (void)_syncChatsWithCloudKitWithCompletionType:(int64_t)a3 activity:(id)a4 syncChatsCompletionBlock:(id)a5;
- (void)_updateChatUsingCKRecord:(id)a3 onRead:(BOOL)a4 didSucceed:(BOOL)a5 dispatchToMain:(BOOL)a6;
- (void)_writeCKRecordsToChatZone:(id)a3 activity:(id)a4 withCompletion:(id)a5;
- (void)_writeDirtyChatsToCloudKitWithActivity:(id)a3 completion:(id)a4;
- (void)anyChatExistsOnServerWithActivity:(id)a3 completion:(id)a4;
- (void)clearLocalSyncState:(unint64_t)a3;
- (void)deleteChat1SyncToken;
- (void)deleteChatSyncToken;
- (void)deleteChatZone;
- (void)setCKOperationFactory:(id)a3;
- (void)setChatRegistry:(id)a3;
- (void)setCkQueue:(id)a3;
- (void)setFetchedChatsDuringLastSync:(BOOL)a3;
- (void)setLatestSyncToken:(id)a3;
- (void)setLockRecord:(id)a3;
- (void)setRecordZoneManager:(id)a3;
- (void)setSyncTokenStore:(id)a3;
- (void)syncChatsWithType:(int64_t)a3 withActivity:(id)a4 completion:(id)a5;
- (void)syncPendingDeletionWithCompletion:(id)a3;
@end

@implementation IMDCKChatSyncController

+ (id)sharedInstance
{
  if (qword_1EBE2B8E0 != -1) {
    dispatch_once(&qword_1EBE2B8E0, &unk_1F3392100);
  }
  v2 = (void *)qword_1EBE2BA20;

  return v2;
}

- (IMDCKChatSyncController)initWithSyncTokenStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMDCKChatSyncController;
  v6 = [(IMDCKChatSyncController *)&v14 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.private.IMDCKChatSyncController", 0);
    ckQueue = v6->_ckQueue;
    v6->_ckQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[IMDRecordZoneManager sharedInstance];
    recordZoneManager = v6->_recordZoneManager;
    v6->_recordZoneManager = (IMDRecordZoneManager *)v9;

    objc_storeStrong((id *)&v6->_syncTokenStore, a3);
    v11 = objc_alloc_init(IMDCKChatSyncCKOperationFactory);
    CKOperationFactory = v6->_CKOperationFactory;
    v6->_CKOperationFactory = v11;

    [(IMDCKChatSyncController *)v6 _migrateServerChangeToken];
  }

  return v6;
}

- (IMDCKChatSyncController)init
{
  v3 = objc_alloc_init(IMDCKSyncTokenStore);
  v4 = [(IMDCKChatSyncController *)self initWithSyncTokenStore:v3];

  return v4;
}

- (int64_t)syncControllerRecordType
{
  return 2;
}

- (IMDChatRegistry)chatRegistry
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D9841B48;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  if (qword_1EBE2BFE0 != -1) {
    dispatch_once(&qword_1EBE2BFE0, block);
  }
  return self->_chatRegistry;
}

- (id)recordStore
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_1D9841CB8;
  uint64_t v9 = sub_1D9841CC8;
  id v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D9841CD0;
  block[3] = &unk_1E6B73480;
  block[4] = &v5;
  if (qword_1EA8CA668 != -1) {
    dispatch_once(&qword_1EA8CA668, block);
  }
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)_generateLockRecord
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "************ CREATING CHAT LOCK RECORD **************** OH BOY **************", v11, 2u);
    }
  }
  id v4 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  uint64_t v5 = [(IMDCKChatSyncController *)self recordZoneManager];
  v6 = [v5 chatRecordZoneID];
  uint64_t v7 = (void *)[v4 initWithRecordName:@"chatLockRecordName" zoneID:v6];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"chatLockRecordType" recordID:v7];
  uint64_t v9 = [NSString stringGUID];
  [v8 setValue:v9 forKey:@"lRKey"];

  return v8;
}

- (void)_migrateServerChangeToken
{
  id v2 = [(IMDCKChatSyncController *)self syncTokenStore];
  [v2 migrateKey:@"changeToken" fromDatabase:@"/var/mobile/Library/SMS/CloudKitMetaData/ChatSyncZoneMetaData.db"];
}

- (id)_changeTokenKey
{
  return @"changeToken";
}

- (void)setLatestSyncToken:(id)a3
{
  id v7 = a3;
  id v4 = [(IMDCKChatSyncController *)self syncTokenStore];
  uint64_t v5 = [(IMDCKChatSyncController *)self _changeTokenKey];
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
  v3 = [(IMDCKChatSyncController *)self syncTokenStore];
  id v4 = [(IMDCKChatSyncController *)self _changeTokenKey];
  uint64_t v5 = [v3 tokenForKey:v4];

  return (CKServerChangeToken *)v5;
}

- (id)_copyChatsToUploadWithLimit:(unint64_t)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_1D9841CB8;
  objc_super v14 = sub_1D9841CC8;
  id v15 = 0;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "**** Do not call -[IMDCKChatSyncController _chatsToUpload] on main thread *******", v8, 2u);
      }
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D9842154;
    block[3] = &unk_1E6B77BC0;
    block[4] = self;
    void block[5] = &v10;
    block[6] = a3;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)_randomSalt
{
  return (id)[NSString stringGUID];
}

- (id)_newckRecordsFromChats:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1D9841CB8;
  v16 = sub_1D9841CC8;
  id v17 = 0;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D98422E8;
  block[3] = &unk_1E6B77BE8;
  id v9 = v4;
  uint64_t v10 = self;
  v11 = &v12;
  id v5 = v4;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (id)_chatZoneID
{
  id v2 = [(IMDCKChatSyncController *)self recordZoneManager];
  v3 = [v2 chatRecordZoneID];

  return v3;
}

- (void)_scheduleOperation:(id)a3
{
  id v3 = a3;
  id v5 = +[IMDCKDatabaseManager sharedInstance];
  id v4 = [v5 truthDatabase];
  [v4 addOperation:v3];
}

- (void)_updateChatUsingCKRecord:(id)a3 onRead:(BOOL)a4 didSucceed:(BOOL)a5 dispatchToMain:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D9842780;
  aBlock[3] = &unk_1E6B77C10;
  aBlock[4] = self;
  id v15 = v10;
  BOOL v16 = a4;
  BOOL v17 = a5;
  id v11 = v10;
  uint64_t v12 = (void (**)(void))_Block_copy(aBlock);
  v13 = v12;
  if (v6) {
    dispatch_sync(MEMORY[0x1E4F14428], v12);
  }
  else {
    v12[2](v12);
  }
}

- (void)_resolveChatConflictUsingCKRecord:(id)a3 localGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D984289C;
  block[3] = &unk_1E6B73BC8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_sync(MEMORY[0x1E4F14428], block);
}

- (void)_markChatAsDefferedForSyncingUsingRecord:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D9842988;
  v6[3] = &unk_1E6B73218;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_sync(MEMORY[0x1E4F14428], v6);
}

- (BOOL)_chatZoneCreated
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(IMDCKChatSyncController *)self recordZoneManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D9842B80;
  v11[3] = &unk_1E6B73B50;
  v13 = &v14;
  id v5 = v3;
  id v12 = v5;
  [v4 createChatZoneIfNeededWithCompletionBlock:v11];

  dispatch_time_t v6 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    *((unsigned char *)v15 + 24) = 0;
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "***** Timed out creating chat zone *******", v10, 2u);
      }
    }
  }
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)_processModifyPerRecordCallBack:(id)a3 error:(id)a4 recordIDtoGUIDmap:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [v8 recordID];
      v13 = [v8 recordChangeTag];
      *(_DWORD *)buf = 138412802;
      id v24 = v12;
      __int16 v25 = 2112;
      v26 = v13;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "per record completion block record %@ changeTag %@ error %@", buf, 0x20u);
    }
  }
  uint64_t v14 = [(IMDCKChatSyncController *)self ckQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1D9842E88;
  v18[3] = &unk_1E6B75928;
  id v19 = v9;
  id v20 = v8;
  v21 = self;
  id v22 = v10;
  id v15 = v10;
  id v16 = v8;
  id v17 = v9;
  dispatch_sync(v14, v18);
}

- (BOOL)_lockRecordHadConflict:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 code] == 2)
  {
    id v4 = [v3 userInfo];
    id v5 = [v4 valueForKey:*MEMORY[0x1E4F19CD8]];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    dispatch_time_t v6 = objc_msgSend(v5, "allKeys", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v11 = [v10 recordName];
          int v12 = [v11 isEqualToString:@"chatLockRecordName"];

          if (v12)
          {
            v13 = [v5 objectForKey:v10];
            if ([v13 code] == 14)
            {
              if (IMOSLoggingEnabled())
              {
                id v15 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v22 = v10;
                  _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Got a conflict while fetching lock record %@", buf, 0xCu);
                }
              }
              BOOL v14 = 1;
              goto LABEL_19;
            }
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 0;
LABEL_19:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)_processModifyRecordCompletion:(id)a3 deletedRecordIDs:(id)a4 error:(id)a5 completionBlock:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled())
  {
    BOOL v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v12;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "modifyRecordsCompletionBlock error %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      *(_DWORD *)buf = 138412290;
      id v28 = v16;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Number of records saved %@", buf, 0xCu);
    }
  }
  id v17 = v12;
  long long v18 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
  int v19 = [v18 errorIndicatesQuotaExceeded:v17];

  if (v19)
  {
    long long v20 = v17;
    if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "We got back that we have exceeded quota in chat sync -- failing to continue writes", buf, 2u);
      }

      long long v20 = v17;
    }
  }
  else
  {
    long long v20 = v17;
    if ([v17 code] == 2)
    {
      if (IMOSLoggingEnabled())
      {
        id v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "We only had partial error and the whole batch failed ", buf, 2u);
        }
      }
      long long v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6D1F0] code:2 userInfo:0];
    }
  }
  if (v13)
  {
    v23 = [(IMDCKChatSyncController *)self ckQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1D9843878;
    v24[3] = &unk_1E6B73A10;
    id v26 = v13;
    id v25 = v20;
    dispatch_async(v23, v24);
  }
}

- (void)_writeCKRecordsToChatZone:(id)a3 activity:(id)a4 withCompletion:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v26 = a4;
  id v28 = a5;
  uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v9)
  {
    char v10 = 0;
    uint64_t v11 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        BOOL v14 = [v13 recordType];
        int v15 = [v14 isEqualToString:@"chatLockRecordType"];

        if (v15)
        {
          if (IMOSLoggingEnabled())
          {
            id v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "lock record is present amongst chats", buf, 2u);
            }
          }
          char v10 = 1;
        }
        else
        {
          id v17 = [v13 _stringForKey:@"guid"];
          long long v18 = [v13 recordID];
          int v19 = [v18 recordName];
          [v29 setObject:v17 forKey:v19];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v9);

    if (v10)
    {
      long long v20 = [(IMDCKChatSyncController *)self CKOperationFactory];
      v21 = [v20 saveChatsCKOperationUsingRecordsToSave:v8 activity:v26];

      [v21 setPerRecordProgressBlock:&unk_1F3392120];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = sub_1D9843E0C;
      v32[3] = &unk_1E6B77C38;
      v32[4] = self;
      id v33 = v29;
      [v21 setPerRecordCompletionBlock:v32];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = sub_1D9843E20;
      v30[3] = &unk_1E6B73B28;
      v30[4] = self;
      id v31 = v28;
      [v21 setModifyRecordsCompletionBlock:v30];
      if (IMOSLoggingEnabled())
      {
        id v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
          *(_DWORD *)buf = 138412290;
          v41 = v23;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Attempting to write %@ records to truth zone ", buf, 0xCu);
        }
      }
      [(IMDCKChatSyncController *)self _scheduleOperation:v21];

      goto LABEL_28;
    }
  }
  else
  {
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "******** LOCK RECORD IS NOT PRESENT ******", buf, 2u);
    }
  }
  if (v28)
  {
    id v25 = [(IMDCKChatSyncController *)self ckQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D9843D90;
    block[3] = &unk_1E6B731C8;
    id v35 = v28;
    dispatch_async(v25, block);

    v21 = v35;
LABEL_28:
  }
}

- (unint64_t)_numberOfChatsToFetch
{
  id v2 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int64_t v3 = [v2 overrideNumberOfChatsToFetch];

  if (v3 <= 0) {
    return 200;
  }
  else {
    return v3;
  }
}

- (unint64_t)_numberOfChatsToWrite
{
  id v2 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int64_t v3 = [v2 overrideNumberOfChatsToWrite];

  if (v3 <= 0) {
    return 200;
  }
  else {
    return v3;
  }
}

- (BOOL)_shouldResyncChatsForError:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 domain];
  if (![v4 isEqualToString:*MEMORY[0x1E4F6D1F0]])
  {

    goto LABEL_9;
  }
  uint64_t v5 = [v3 code];

  if (v5 != 2)
  {
LABEL_9:
    BOOL v7 = 0;
    goto LABEL_10;
  }
  if (IMOSLoggingEnabled())
  {
    dispatch_time_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "We failed to sync Chats due to op lock Not doing ABC %@", (uint8_t *)&v9, 0xCu);
    }
  }
  BOOL v7 = 1;
LABEL_10:

  return v7;
}

- (void)_logGreenTeaLogsForChats:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v4)
  {

    goto LABEL_23;
  }
  uint64_t v5 = v4;
  char v6 = 0;
  char v7 = 0;
  uint64_t v8 = *(void *)v18;
  int v9 = (void *)MEMORY[0x1E4F6E1A0];
  while (2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v3);
      }
      uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      id v12 = objc_msgSend(v11, "serviceName", (void)v17);
      char v13 = [v12 isEqualToString:*v9];

      if (v13)
      {
        char v6 = 1;
        if ((v7 & 1) == 0) {
          continue;
        }
      }
      else
      {
        BOOL v14 = [v11 serviceName];
        if ([v14 isEqualToString:*MEMORY[0x1E4F6E1B0]])
        {
          int v15 = [v11 lastAddressedLocalHandle];
          char v16 = MEMORY[0x1E0169B60]();
        }
        else
        {
          char v16 = 0;
        }

        v7 |= v16;
        if ((v7 & 1) == 0) {
          continue;
        }
      }
      if (v6)
      {

        IMGreenTeaMessageTransmitLog();
LABEL_21:
        IMGreenTeaPhoneNumberTransmitLog();
        goto LABEL_23;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5) {
      continue;
    }
    break;
  }

  if (v6) {
    IMGreenTeaMessageTransmitLog();
  }
  if (v7) {
    goto LABEL_21;
  }
LABEL_23:
}

- (void)_writeDirtyChatsToCloudKitWithActivity:(id)a3 completion:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v6 = a4;
  id v7 = [(IMDCKChatSyncController *)self _copyChatsToUploadWithLimit:[(IMDCKChatSyncController *)self _numberOfChatsToWrite]];
  long long v38 = v6;
  long long v36 = v7;
  if ([v7 count])
  {
    -[IMDCKChatSyncController _logGreenTeaLogsForChats:](self, "_logGreenTeaLogsForChats:", v7, v7);
    long long v39 = self;
    [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToUploading];
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
        *(_DWORD *)buf = 138412290;
        unint64_t v51 = (unint64_t)v9;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Number of chats to write up %@", buf, 0xCu);
      }
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(v10);
          }
          BOOL v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if (IMOSLoggingEnabled())
          {
            int v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              char v16 = [v14 cloudKitDebugDescription];
              *(_DWORD *)buf = 138412290;
              unint64_t v51 = (unint64_t)v16;
              _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Chat to sync up %@", buf, 0xCu);
            }
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v11);
    }

    id v17 = [(IMDCKChatSyncController *)v39 _newckRecordsFromChats:v10];
    unint64_t v18 = [v17 count];
    long long v19 = [(IMDCKAbstractSyncController *)v39 ckUtilities];
    long long v20 = (void *)[v19 newfilteredArrayRemovingCKRecordDupes:v17];

    if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = [v20 count];
        *(_DWORD *)buf = 134218240;
        unint64_t v51 = v18;
        __int16 v52 = 2048;
        uint64_t v53 = v22;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Got %lu records to sync, filtered to %lu unique records", buf, 0x16u);
      }
    }
    [v17 removeAllObjects];
    [v17 addObjectsFromArray:v20];
    unint64_t v23 = [(IMDCKChatSyncController *)v39 _numberOfChatsToWrite];
    if (v18 < v23 && IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "This is the last batch of chats to write up", buf, 2u);
      }
    }
    id v25 = [(IMDCKChatSyncController *)v39 lockRecord];
    BOOL v26 = v25 == 0;

    if (v26)
    {
      __int16 v27 = [(IMDCKChatSyncController *)v39 _generateLockRecord];
      [(IMDCKChatSyncController *)v39 setLockRecord:v27];
    }
    if (IMOSLoggingEnabled())
    {
      id v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        uint64_t v29 = [(IMDCKChatSyncController *)v39 lockRecord];
        *(_DWORD *)buf = 138412290;
        unint64_t v51 = (unint64_t)v29;
        _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Adding lock record %@", buf, 0xCu);
      }
    }
    if (v17)
    {
      v30 = [(IMDCKChatSyncController *)v39 lockRecord];
      BOOL v31 = v30 == 0;

      if (!v31)
      {
        v32 = [(IMDCKChatSyncController *)v39 lockRecord];
        CFArrayAppendValue((CFMutableArrayRef)v17, v32);
      }
    }
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = sub_1D9844858;
    v40[3] = &unk_1E6B77C60;
    BOOL v45 = v18 < v23;
    id v41 = v17;
    v42 = v39;
    id v43 = v37;
    id v44 = v38;
    id v33 = v17;
    [(IMDCKChatSyncController *)v39 _writeCKRecordsToChatZone:v33 activity:v43 withCompletion:v40];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "No chats to sync up at this moment", buf, 2u);
      }
    }
    if (v6)
    {
      (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
    }
    else if (IMOSLoggingEnabled())
    {
      id v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "No completion block to call", buf, 2u);
      }
    }
  }
}

- (id)_fetchChatRecordOperationWithActivity:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [(IMDCKChatSyncController *)self latestSyncToken];
      id v7 = [(IMDCKChatSyncController *)self _chatZoneID];
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IMDCKChatSyncController _numberOfChatsToFetch](self, "_numberOfChatsToFetch"));
      int v14 = 138412802;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      long long v19 = v8;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Creating a fetch chat record operation using sync token %@ for zone %@ limit %@", (uint8_t *)&v14, 0x20u);
    }
  }
  int v9 = [(IMDCKChatSyncController *)self CKOperationFactory];
  id v10 = [(IMDCKChatSyncController *)self latestSyncToken];
  uint64_t v11 = [(IMDCKChatSyncController *)self _chatZoneID];
  uint64_t v12 = objc_msgSend(v9, "fetchChatZoneChangesCKOperationUsingToken:zone:resultsLimit:activity:", v10, v11, -[IMDCKChatSyncController _numberOfChatsToFetch](self, "_numberOfChatsToFetch"), v4);

  return v12;
}

- (void)_processRecordDeletion:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "**** _processRecordDeletion:Dropping delete as IDS syncs it real time. ***", v5, 2u);
    }
  }
}

- (void)_processRecordChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMDCKChatSyncController *)self ckQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D9844E00;
  v7[3] = &unk_1E6B73218;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_processRecordZoneChangeTokenUpdated:(id)a3 zoneID:(id)a4 clienChangeToken:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "recordZoneChangeTokensUpdatedBlock recordZoneID %@ serverChangeToken %@ clientChangeToken %@", buf, 0x20u);
    }
  }
  uint64_t v12 = [(IMDCKChatSyncController *)self ckQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1D98451B8;
  v14[3] = &unk_1E6B73218;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  dispatch_sync(v12, v14);
}

- (void)_processRecordZoneFetchCompletion:(id)a3 zoneID:(id)a4 clientChangeTokenData:(id)a5 moreComing:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (IMOSLoggingEnabled())
  {
    __int16 v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v24 = v13;
      __int16 v25 = 2112;
      if (v8) {
        id v17 = @"YES";
      }
      id v26 = v12;
      __int16 v27 = 2112;
      id v28 = v14;
      __int16 v29 = 2112;
      v30 = v17;
      __int16 v31 = 2112;
      id v32 = v15;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "recordZoneChangeTokensUpdatedBlock recordZoneID %@ serverChangeToken %@ clientChangeToken %@ moreComing %@ recordZoneError %@", buf, 0x34u);
    }
  }
  if (v15)
  {
    __int16 v18 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
    int v19 = [v18 CKPartialError:v15 hasErrorCode:&unk_1F33C5EE0];

    if (v19) {
      [(IMDCKChatSyncController *)self deleteChatSyncToken];
    }
  }
  else
  {
    __int16 v20 = [(IMDCKChatSyncController *)self ckQueue];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1D98453DC;
    v21[3] = &unk_1E6B73218;
    v21[4] = self;
    id v22 = v12;
    dispatch_sync(v20, v21);
  }
}

- (void)_kickOffWriteOnCKQueueWithActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    BOOL v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Kicking off chat write", buf, 2u);
    }
  }
  id v9 = [(IMDCKChatSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D984552C;
  block[3] = &unk_1E6B73A60;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)_kickOffWriteIfNeededForSyncType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t, void))a5;
  id v10 = +[IMDCKUtilities sharedInstance];
  LODWORD(a3) = [v10 shouldKickOffWriteForSyncType:a3];

  if (a3)
  {
    [(IMDCKChatSyncController *)self _kickOffWriteOnCKQueueWithActivity:v8 completion:v9];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Not writing up chats as sync type does not allow it", v12, 2u);
      }
    }
    if (v9) {
      v9[2](v9, 1, 0);
    }
  }
}

- (void)_processFetchRecordChangesCompleted:(id)a3 activity:(id)a4 completion:(id)a5 syncType:(int64_t)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, uint64_t))a5;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_1D9841CB8;
  long long v36 = sub_1D9841CC8;
  id v37 = 0;
  id v13 = v10;
  id v37 = v13;
  id v14 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
  int v15 = [v14 errorIndicatesZoneNotCreated:v33[5]];

  __int16 v16 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
  int v17 = [v16 errorIndicatesUserDeletedZone:v33[5]];

  if ((v15 | v17) == 1)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = @"zone not created";
        if (v17) {
          int v19 = @"user deleted zone";
        }
        *(_DWORD *)buf = 138412546;
        long long v39 = v19;
        __int16 v40 = 2112;
        id v41 = v13;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "We got a %@ error while fetching chats. %@", buf, 0x16u);
      }
    }
    __int16 v20 = [(IMDCKChatSyncController *)self ckQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D9845B04;
    block[3] = &unk_1E6B77C88;
    char v30 = v17;
    char v31 = v15;
    void block[4] = self;
    void block[5] = &v32;
    dispatch_sync(v20, block);
  }
  if (v33[5])
  {
    id v21 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
    int v22 = [v21 CKPartialError:v33[5] hasErrorCode:&unk_1F33C5EE0];

    if (v22)
    {
      if (IMOSLoggingEnabled())
      {
        unint64_t v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          id v24 = (__CFString *)v33[5];
          *(_DWORD *)buf = 138412290;
          long long v39 = v24;
          _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "We got an expired server change token back so resetting local sync state, and fetching the chats again %@", buf, 0xCu);
        }
      }
      [(IMDCKChatSyncController *)self clearLocalSyncState:17];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          __int16 v27 = (__CFString *)v33[5];
          *(_DWORD *)buf = 138412290;
          long long v39 = v27;
          _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "********* We got an error fetching changes from chat zone %@", buf, 0xCu);
        }
      }
      id v28 = [MEMORY[0x1E4F6E890] sharedInstance];
      [v28 autoBugCaptureWithSubType:@"ChatSync" errorPayload:v33[5]];
    }
    if (v12) {
      v12[2](v12, 0, v33[5]);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "We completed fetching changes from chat zone with no error", buf, 2u);
      }
    }
    [(IMDCKChatSyncController *)self _kickOffWriteIfNeededForSyncType:a6 activity:v11 completion:v12];
  }
  _Block_object_dispose(&v32, 8);
}

- (void)deleteChatSyncToken
{
  id v3 = [(IMDCKChatSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D9845E40;
  block[3] = &unk_1E6B73268;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)deleteChat1SyncToken
{
  id v2 = [(IMDCKChatSyncController *)self syncTokenStore];
  [v2 persistToken:0 forKey:@"chat1ChangeToken"];
}

- (void)_syncChatsWithCloudKitWithCompletionType:(int64_t)a3 activity:(id)a4 syncChatsCompletionBlock:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToDownloading];
  id v10 = [(IMDCKChatSyncController *)self _fetchChatRecordOperationWithActivity:v8];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1D9846204;
  v25[3] = &unk_1E6B749D0;
  v25[4] = self;
  [v10 setRecordChangedBlock:v25];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1D9846210;
  v24[3] = &unk_1E6B74A18;
  void v24[4] = self;
  [v10 setRecordWithIDWasDeletedBlock:v24];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1D984621C;
  v23[3] = &unk_1E6B76DC8;
  v23[4] = self;
  [v10 setRecordZoneChangeTokensUpdatedBlock:v23];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1D984622C;
  v22[3] = &unk_1E6B76DF0;
  v22[4] = self;
  [v10 setRecordZoneFetchCompletionBlock:v22];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  __int16 v16 = sub_1D9846244;
  int v17 = &unk_1E6B76E18;
  __int16 v18 = self;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  int64_t v21 = a3;
  [v10 setFetchRecordZoneChangesCompletionBlock:&v14];
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v27 = v10;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Scheduling a fetch chat zone changes operation %@", buf, 0xCu);
    }
  }
  -[IMDCKChatSyncController _scheduleOperation:](self, "_scheduleOperation:", v10, v14, v15, v16, v17, v18);
}

- (void)_anyChatExistsOnServerWithResultsLimit:(int)a3 changeToken:(id)a4 activity:(id)a5 completion:(id)a6
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v26 = a6;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "chatExistsWithCompletion (batch size %d)", buf, 8u);
    }
  }
  id v12 = [(IMDCKChatSyncController *)self _chatZoneID];
  if (v12)
  {
    id v13 = [(IMDCKChatSyncController *)self CKOperationFactory];
    uint64_t v14 = [v13 fetchChatZoneChangesCKOperationUsingToken:v9 zone:v12 resultsLimit:a3 groupName:@"ChatsExistCheck" activity:v10];

    [v14 setFetchAllChanges:0];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1A060]);
    [v15 setResultsLimit:a3];
    [v15 setDesiredKeys:MEMORY[0x1E4F1CBF0]];
    long long v47 = v12;
    v48[0] = v15;
    __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    [v14 setConfigurationsByRecordZoneID:v16];

    id v17 = objc_alloc_init(MEMORY[0x1E4F1A208]);
    [v17 setQualityOfService:17];
    [v17 setAllowsCellularAccess:1];
    objc_msgSend(v17, "im_setActivity:", v10);
    [v14 setConfiguration:v17];
    __int16 v18 = [v14 operationID];
    id v24 = v9;
    *(void *)buf = 0;
    id v44 = buf;
    uint64_t v45 = 0x2020000000;
    char v46 = 0;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = sub_1D9846718;
    v35[3] = &unk_1E6B77CB0;
    id v19 = v12;
    id v36 = v19;
    long long v38 = buf;
    id v20 = v26;
    id v37 = v20;
    [v14 setRecordChangedBlock:v35];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1D984686C;
    v27[3] = &unk_1E6B77CD8;
    id v21 = v18;
    id v28 = v21;
    uint64_t v33 = buf;
    id v29 = v19;
    char v30 = self;
    int v34 = a3;
    id v31 = v10;
    id v32 = v20;
    [v14 setRecordZoneFetchCompletionBlock:v27];
    [(IMDCKChatSyncController *)self _scheduleOperation:v14];
    id v9 = v24;
    if (IMOSLoggingEnabled())
    {
      int v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        unint64_t v23 = [v14 operationID];
        *(_DWORD *)long long v39 = 138412546;
        __int16 v40 = v23;
        __int16 v41 = 1024;
        int v42 = a3;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Scheduled fetch changes operation to check for the existence of a single chat with identifier: %@ (batch size %d)", v39, 0x12u);
      }
    }

    _Block_object_dispose(buf, 8);
    goto LABEL_13;
  }
  if (v26)
  {
    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6D1F0] code:1 userInfo:0];
    (*((void (**)(id, void, void *))v26 + 2))(v26, 0, v14);
LABEL_13:
  }
}

- (void)anyChatExistsOnServerWithActivity:(id)a3 completion:(id)a4
{
}

- (void)deleteChatZone
{
  id v3 = [(IMDCKChatSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D9846B38;
  block[3] = &unk_1E6B73268;
  void block[4] = self;
  dispatch_async(v3, block);

  [(IMDCKChatSyncController *)self clearLocalSyncState:3];
}

- (BOOL)_eligibleForTruthZone
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "chat sync controller checking eligibility", buf, 2u);
    }
  }
  uint64_t v5 = [(IMDCKAbstractSyncController *)self ckUtilities];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D9846EAC;
  v15[3] = &unk_1E6B77D00;
  id v17 = &v18;
  v15[4] = self;
  id v6 = v3;
  __int16 v16 = v6;
  [v5 fetchCloudKitAccountStatusAndUpdateEligibilityAndNeedsRepairStatusWithCompletion:v15];

  dispatch_time_t v7 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    id v8 = [(IMDCKAbstractSyncController *)self syncState];
    char v9 = [v8 isEligibleForTruthZone];
    *((unsigned char *)v19 + 24) = v9;

    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "***** Timed out checking truth zone eligibility *******", buf, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        if (*((unsigned char *)v19 + 24)) {
          id v12 = @"YES";
        }
        else {
          id v12 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        unint64_t v23 = v12;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Returning cached value: %@", buf, 0xCu);
      }
    }
  }
  BOOL v13 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (id)_recordKeyManagerSharedInstance
{
  return +[IMDCKRecordSaltManager sharedInstance];
}

- (void)_needsToMarkAllChatsAsNeedingSync
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v2 setBool:0 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF28]];
}

- (BOOL)_shouldMarkAllChatsAsNeedingSync
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
    uint64_t v5 = [MEMORY[0x1E4F6E720] sharedInstance];
    int v4 = [v5 getBoolFromDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF28]] ^ 1;
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      dispatch_time_t v7 = @"NO";
      if (v4) {
        dispatch_time_t v7 = @"YES";
      }
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "_shouldMarkAllChatsAsNeedingSync %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return v4;
}

- (void)_hasMarkedAllChatsAsNeedingSync
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v2 setBool:1 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF28]];
}

- (void)syncChatsWithType:(int64_t)a3 withActivity:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  IMSetDomainValueForKey();

  if (!a3)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Resetting fetched chats BOOL to NO", buf, 2u);
      }
    }
    [(IMDCKChatSyncController *)self setFetchedChatsDuringLastSync:0];
  }
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v12 = [(IMDCKChatSyncController *)self recordStore];
    [v12 resetLocalSyncStateIfAppropriate];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D98474B0;
    block[3] = &unk_1E6B73268;
    void block[4] = self;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  [(IMDCKChatSyncController *)self __syncChatsWithCloudKit:a3 attemptCount:0 activity:v8 withCompletion:v9];
}

- (void)__syncChatsWithCloudKit:(int64_t)a3 attemptCount:(unint64_t)a4 activity:(id)a5 withCompletion:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      BOOL v13 = [NSNumber numberWithUnsignedInteger:a4];
      *(_DWORD *)buf = 138412290;
      int v34 = v13;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Starting chat sync attempt count %@", buf, 0xCu);
    }
  }
  [(IMDCKAbstractSyncController *)self resetRecordCounts];
  [(IMDCKAbstractSyncController *)self setIsSyncing:1];
  if (a4 < 0x65)
  {
    id v15 = [(IMDCKAbstractSyncController *)self ckUtilities];
    int v16 = [v15 cloudKitSyncingEnabled];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D9847984;
    aBlock[3] = &unk_1E6B73030;
    aBlock[4] = self;
    id v30 = v11;
    id v17 = _Block_copy(aBlock);
    if (v16)
    {
      uint64_t v18 = [(IMDCKChatSyncController *)self ckQueue];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = sub_1D9847A3C;
      v24[3] = &unk_1E6B76BA0;
      void v24[4] = self;
      int64_t v27 = a3;
      unint64_t v28 = a4;
      id v25 = v10;
      id v26 = v17;
      id v19 = v17;
      dispatch_async(v18, v24);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Not syncing chats due to missing defaults. Please do following as mobile and try again - defaults write com.apple.madrid enableCKSyncingV2 YES", buf, 2u);
        }
      }
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = sub_1D9847EB4;
      v22[3] = &unk_1E6B731C8;
      id v23 = v17;
      id v21 = v17;
      dispatch_async(MEMORY[0x1E4F14428], v22);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Exceeded number of chat sync attempts", buf, 2u);
      }
    }
    if (v11)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D9847908;
      block[3] = &unk_1E6B731C8;
      id v32 = v11;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    [(IMDCKAbstractSyncController *)self setIsSyncing:0];
  }
}

- (void)clearLocalSyncState:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v22 = v3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Clearing local chat sync state, flags 0x%x", buf, 8u);
    }
  }
  if (v3)
  {
    id v6 = [(IMDCKAbstractSyncController *)self ckUtilities];
    dispatch_time_t v7 = [v6 logCollectorAddress];

    id v8 = [(IMDCKAbstractSyncController *)self ckUtilities];
    [v8 reportMOCDebuggingErrorWithString:@"ResetSyncDate" internalOnly:1 initialSync:0 sendToHandle:v7 reasonString:@"ResetSyncDate"];

    id v9 = [(IMDCKAbstractSyncController *)self syncState];
    [v9 setLastSyncDate:0];

    [(IMDCKChatSyncController *)self deleteChatSyncToken];
    [(IMDCKChatSyncController *)self setLockRecord:0];
  }
  if ((v3 & 2) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Marking all chats as dirty", buf, 2u);
      }
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = +[IMDChatRegistry sharedInstance];
    id v12 = [v11 chats];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v15++) resetCKSyncState];
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
  else if ((v3 & 0x10) != 0)
  {
    [(IMDCKChatSyncController *)self _needsToMarkAllChatsAsNeedingSync];
  }
}

- (id)_copyRecordIDsToDelete
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v3 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v4 = [(IMDCKChatSyncController *)self chatRegistry];
  uint64_t v5 = (void *)[v4 copyRecordIDsAndGUIDsPendingCloudKitDelete];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
        id v11 = objc_alloc(MEMORY[0x1E4F1A2F8]);
        id v12 = [v10 valueForKey:@"recordID"];
        uint64_t v13 = [(IMDCKChatSyncController *)self _chatZoneID];
        uint64_t v14 = (void *)[v11 initWithRecordName:v12 zoneID:v13];

        if (v3 && v14) {
          CFArrayAppendValue(v3, v14);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)_handleChatDeletionCompletionForRecordIDs:(id)a3 error:(id)a4
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
      id v16 = v7;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "_handleChatDeletionCompletionForRecordIDs error %@", buf, 0xCu);
    }
  }
  uint64_t v9 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
  int v10 = [v9 acceptableErrorCodeWhileDeleting:v7];

  if (v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1D984856C;
    v12[3] = &unk_1E6B73218;
    id v13 = v6;
    uint64_t v14 = self;
    dispatch_sync(MEMORY[0x1E4F14428], v12);
  }
  else if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Error deleteing chats from CloudKit %@", buf, 0xCu);
    }
  }
}

- (void)syncPendingDeletionWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(IMDCKAbstractSyncController *)self ckUtilities];
  char v6 = [v5 cloudKitSyncingEnabled];

  if (v6)
  {
    id v7 = [(IMDCKChatSyncController *)self _copyRecordIDsToDelete];
    uint64_t v8 = [(IMDCKAbstractSyncController *)self ckUtilities];
    uint64_t v9 = (void *)[v8 newfilteredArrayRemovingCKRecordIDDupes:v7];

    if (IMOSLoggingEnabled())
    {
      int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v15 = [v7 count];
        __int16 v16 = 2048;
        uint64_t v17 = [v9 count];
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Got %lu recordIDs to sync, filtered to %lu unique recordIDs", buf, 0x16u);
      }
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1D9848988;
    v12[3] = &unk_1E6B747A0;
    void v12[4] = self;
    id v13 = v4;
    [(IMDCKChatSyncController *)self _filterRecordIDsToChatsWithNoRecentModifications:v9 completion:v12];

    goto LABEL_13;
  }
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "CloudKit Syncing is disable", buf, 2u);
    }
  }
  if (v4)
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.IMDCKChatSyncController" code:2 userInfo:0];
    (*((void (**)(id, id))v4 + 2))(v4, v7);
LABEL_13:
  }
}

- (void)_deleteChatRecordsWithRecordIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToDeleting];
    uint64_t v8 = [(IMDCKChatSyncController *)self CKOperationFactory];
    uint64_t v9 = [v8 deleteChatCKOperationUsingRecordIDstoDelete:v6];

    [v9 setPerRecordCompletionBlock:&unk_1F3392140];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = sub_1D9848CF4;
    uint64_t v14 = &unk_1E6B73B28;
    uint64_t v15 = self;
    id v16 = v7;
    [v9 setModifyRecordsCompletionBlock:&v11];
    -[IMDCKChatSyncController _scheduleOperation:](self, "_scheduleOperation:", v9, v11, v12, v13, v14, v15);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "No pending chats at this moment", buf, 2u);
      }
    }
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)_filterRecordIDsToChatsWithNoRecentModifications:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v9 = objc_msgSend(v8, "__im_dateByAddingDays:", -14);

  if (IMOSLoggingEnabled())
  {
    int v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v9;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Filtering chat recordIDs to those with modification date after %@", buf, 0xCu);
    }
  }
  uint64_t v11 = [(IMDCKChatSyncController *)self CKOperationFactory];
  uint64_t v12 = [v11 fetchChatCKOperationUsingRecordIDs:v6];

  [v12 setDesiredKeys:MEMORY[0x1E4F1CBF0]];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_1D9848FC4;
  uint64_t v18 = &unk_1E6B73B00;
  id v19 = v9;
  id v20 = v7;
  id v13 = v7;
  id v14 = v9;
  [v12 setFetchRecordsCompletionBlock:&v15];
  -[IMDCKChatSyncController _scheduleOperation:](self, "_scheduleOperation:", v12, v15, v16, v17, v18);
}

- (BOOL)fetchedChatsDuringLastSync
{
  return self->_fetchedChatsDuringLastSync;
}

- (void)setFetchedChatsDuringLastSync:(BOOL)a3
{
  self->_fetchedChatsDuringLastSync = a3;
}

- (OS_dispatch_queue)ckQueue
{
  return self->_ckQueue;
}

- (void)setCkQueue:(id)a3
{
}

- (void)setChatRegistry:(id)a3
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

- (IMDCKChatSyncCKOperationFactory)CKOperationFactory
{
  return self->_CKOperationFactory;
}

- (void)setCKOperationFactory:(id)a3
{
}

- (CKRecord)lockRecord
{
  return self->_lockRecord;
}

- (void)setLockRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockRecord, 0);
  objc_storeStrong((id *)&self->_CKOperationFactory, 0);
  objc_storeStrong((id *)&self->_syncTokenStore, 0);
  objc_storeStrong((id *)&self->_recordZoneManager, 0);
  objc_storeStrong((id *)&self->_chatRegistry, 0);
  objc_storeStrong((id *)&self->_ckQueue, 0);

  objc_storeStrong((id *)&self->_latestSyncToken, 0);
}

@end