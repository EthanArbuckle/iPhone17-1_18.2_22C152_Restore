@interface IMDCKRecoverableMessageSyncController
+ (id)_fetchOperationFactory:(id)a3 token:(id)a4 batchSize:(unint64_t)a5 activity:(id)a6;
+ (id)_fetchRecoverableMessagesCKConfiguration:(id)a3;
+ (id)_zoneChangesOptionsDictionaryUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5;
+ (id)sharedInstance;
- (BOOL)_zoneCreated;
- (IMDCKMessageSyncCKOperationFactory)CKOperationFactory;
- (IMDCKRecoverableMessageSyncController)init;
- (IMDCKRecoverableMessageSyncController)initWithSyncTokenStore:(id)a3;
- (IMDRecordZoneManager)recordZoneManager;
- (OS_dispatch_queue)ckQueue;
- (SyncTokenStoreProviding)syncTokenStore;
- (id)_constructRecoverableMessageRecordIDUsingTombStoneDictionary:(id)a3;
- (id)_copyRecordIDsToDeleteWithLimit:(unint64_t)a3;
- (id)_fetchRecordsOperationWithActivity:(id)a3;
- (id)_saveRecordsOperationWithMap:(id)a3 activity:(id)a4;
- (id)_saveRecoverableMessagesOperationFactory:(id)a3 token:(id)a4 batchSize:(unint64_t)a5 recordNameToPartIndexAndRowID:(id)a6 activity:(id)a7;
- (id)_syncTokenKey;
- (id)_syncTokenStore;
- (id)_writeRecoverableMessagesCKConfiguration:(id)a3;
- (id)createCKRecordforRecoverableMessageMetadata:(id)a3 zoneID:(id)a4 recordNameToPartIndexAndRowID:(id)a5;
- (id)recoverableGUIDFromMessageGUID:(id)a3 chatGUID:(id)a4 partIndex:(int64_t)a5;
- (int64_t)syncControllerRecordType;
- (unint64_t)_deleteBatchSize;
- (void)_deleteRecoverableMessagesWithRecordIDs:(id)a3 completion:(id)a4;
- (void)_onChangeTokenUpdated:(id)a3 token:(id)a4 data:(id)a5;
- (void)_onReadComplete:(int64_t)a3 error:(id)a4 activity:(id)a5 completion:(id)a6;
- (void)_onRecordDeleted:(id)a3 type:(id)a4;
- (void)_onRecordRead:(id)a3;
- (void)_onRecordWrite:(id)a3 error:(id)a4 recordNameToPartIndexAndRowID:(id)a5;
- (void)_onRecordZoneFetchComplete:(id)a3 token:(id)a4 tokenData:(id)a5 moreComing:(BOOL)a6 error:(id)a7;
- (void)_onRecoverableMessagePartRecordReadWithDeleteDate:(id)a3 messageGUID:(id)a4 partBody:(id)a5;
- (void)_onWriteComplete:(int64_t)a3 error:(id)a4 shouldWriteMore:(BOOL)a5 activity:(id)a6 completion:(id)a7;
- (void)_processRecordDeletionCompletion:(id)a3 error:(id)a4 completionBlock:(id)a5;
- (void)_readRecordsWithType:(int64_t)a3 attemptCount:(unint64_t)a4 activity:(id)a5 completion:(id)a6;
- (void)_scheduleOperation:(id)a3;
- (void)_writeRecordsWithType:(int64_t)a3 activity:(id)a4 completion:(id)a5;
- (void)clearLocalSyncState:(unint64_t)a3;
- (void)deleteChatBotRecoverableMessageSyncToken;
- (void)deleteRecoverableMessageZone;
- (void)setCKOperationFactory:(id)a3;
- (void)setCkQueue:(id)a3;
- (void)setRecordZoneManager:(id)a3;
- (void)setSyncTokenStore:(id)a3;
- (void)syncRemovedRecoverableMessagesToCloudKitWithCompletion:(id)a3;
- (void)syncWithType:(int64_t)a3 withActivity:(id)a4 withCompletion:(id)a5;
@end

@implementation IMDCKRecoverableMessageSyncController

+ (id)sharedInstance
{
  if (qword_1EBE2B8B8 != -1) {
    dispatch_once(&qword_1EBE2B8B8, &unk_1F3391A60);
  }
  v2 = (void *)qword_1EBE2B9F0;

  return v2;
}

- (IMDCKRecoverableMessageSyncController)init
{
  v3 = objc_alloc_init(IMDCKSyncTokenStore);
  v4 = [(IMDCKRecoverableMessageSyncController *)self initWithSyncTokenStore:v3];

  return v4;
}

- (IMDCKRecoverableMessageSyncController)initWithSyncTokenStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMDCKRecoverableMessageSyncController;
  v6 = [(IMDCKRecoverableMessageSyncController *)&v14 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.private.IMDCKRecoverableMessageSyncController", 0);
    ckQueue = v6->_ckQueue;
    v6->_ckQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[IMDRecordZoneManager sharedInstance];
    recordZoneManager = v6->_recordZoneManager;
    v6->_recordZoneManager = (IMDRecordZoneManager *)v9;

    objc_storeStrong((id *)&v6->_syncTokenStore, a3);
    v11 = objc_alloc_init(IMDCKMessageSyncCKOperationFactory);
    CKOperationFactory = v6->_CKOperationFactory;
    v6->_CKOperationFactory = v11;
  }
  return v6;
}

- (void)syncWithType:(int64_t)a3 withActivity:(id)a4 withCompletion:(id)a5
{
}

- (void)_readRecordsWithType:(int64_t)a3 attemptCount:(unint64_t)a4 activity:(id)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  v11 = [(IMDCKRecoverableMessageSyncController *)self _fetchRecordsOperationWithActivity:v9];
  v12 = v11;
  if (v11)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1D97E1698;
    v25[3] = &unk_1E6B749D0;
    v25[4] = self;
    [v11 setRecordChangedBlock:v25];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1D97E16A4;
    v24[3] = &unk_1E6B74A18;
    v24[4] = self;
    [v12 setRecordWithIDWasDeletedBlock:v24];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1D97E16B4;
    v23[3] = &unk_1E6B76DC8;
    v23[4] = self;
    [v12 setRecordZoneChangeTokensUpdatedBlock:v23];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1D97E16C8;
    v22[3] = &unk_1E6B76DF0;
    v22[4] = self;
    [v12 setRecordZoneFetchCompletionBlock:v22];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = sub_1D97E16E4;
    v17 = &unk_1E6B76E18;
    v18 = self;
    int64_t v21 = a3;
    id v19 = v9;
    id v20 = v10;
    [v12 setFetchRecordZoneChangesCompletionBlock:&v14];
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v12;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Scheduling a fetch recoverable message zone changes operation %@", buf, 0xCu);
      }
    }
    -[IMDCKRecoverableMessageSyncController _scheduleOperation:](self, "_scheduleOperation:", v12, v14, v15, v16, v17, v18);
  }
  else if (v10)
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

- (void)_onRecordRead:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [v4 recordID];
      dispatch_queue_t v7 = [v6 recordName];
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Recently Deleted | Reading recoverable message record: %@", buf, 0xCu);
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D97E1870;
  v9[3] = &unk_1E6B73218;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(MEMORY[0x1E4F14428], v9);
}

- (void)_onRecoverableMessagePartRecordReadWithDeleteDate:(id)a3 messageGUID:(id)a4 partBody:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Recently Deleted | Reading recoverable message part record", (uint8_t *)&buf, 2u);
    }
  }
  v11 = +[IMDMessageStore sharedInstance];
  v12 = [v11 messageWithGUID:v8];

  uint64_t v13 = [v12 body];
  uint64_t v14 = *MEMORY[0x1E4F6C1F8];
  uint64_t v15 = [v9 attribute:*MEMORY[0x1E4F6C1F8] atIndex:0 effectiveRange:0];
  uint64_t v16 = [v15 integerValue];

  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = [NSNumber numberWithInteger:v16];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Recently Deleted | Found stored part number %@", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v43 = 0x3032000000;
  v44 = sub_1D97E1F54;
  v45 = sub_1D97E1F64;
  id v46 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_1D97E1F54;
  v32 = sub_1D97E1F64;
  id v33 = 0;
  uint64_t v19 = [v13 length];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1D97E1F6C;
  v27[3] = &unk_1E6B76E40;
  v27[4] = &v34;
  v27[5] = &buf;
  v27[6] = &v28;
  v27[7] = v16;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v14, 0, v19, 0, v27);
  if (*((unsigned char *)v35 + 24))
  {
    id v20 = [MEMORY[0x1E4F6E850] _messageItemWithIndexesDeleted:*(void *)(*((void *)&buf + 1) + 40) subRangesToDeleteMapping:v29[5] deleteSubject:0 deleteTransferCallback:0 createItemCallback:0 fromMessageItem:v12];
    if (v20)
    {
      int64_t v21 = +[IMDBroadcastController sharedProvider];
      v22 = [v21 broadcasterForChatListeners];
      v23 = [v20 accountID];
      [v22 account:v23 chat:0 style:0 chatProperties:0 messageUpdated:v20];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = [NSNumber numberWithInteger:v16];
      *(_DWORD *)v38 = 138412546;
      v39 = v25;
      __int16 v40 = 2112;
      id v41 = v8;
      _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Did not find partIndex: %@ in message GUID: %@", v38, 0x16u);
    }
  }
  v26 = [MEMORY[0x1E4F6BF48] database];
  [v26 storeRecoverableMessagePartWithBody:v9 forMessageWithGUID:v8 deleteDate:v7];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v34, 8);
}

- (void)_onRecordDeleted:(id)a3 type:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Delete record operation unsupported.", v8, 2u);
    }
  }
}

- (void)_onChangeTokenUpdated:(id)a3 token:(id)a4 data:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "recordZoneChangeTokensUpdatedBlock recordZoneID %@ serverChangeToken %@ clientChangeToken %@", buf, 0x20u);
    }
  }
  v12 = [(IMDCKRecoverableMessageSyncController *)self ckQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1D97E229C;
  v14[3] = &unk_1E6B73218;
  v14[4] = self;
  id v15 = v9;
  id v13 = v9;
  dispatch_sync(v12, v14);
}

- (void)_onRecordZoneFetchComplete:(id)a3 token:(id)a4 tokenData:(id)a5 moreComing:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = 138413314;
      id v18 = v12;
      __int16 v19 = 2112;
      id v20 = v13;
      __int16 v21 = 2112;
      id v22 = v14;
      __int16 v23 = 1024;
      BOOL v24 = v8;
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Record Zone fetch complete zoneID %@ changeToken %@ tokenData %@ moreComing %d error %@", (uint8_t *)&v17, 0x30u);
    }
  }
  [(IMDCKRecoverableMessageSyncController *)self _onChangeTokenUpdated:v12 token:v13 data:v14];
}

- (void)_onReadComplete:(int64_t)a3 error:(id)a4 activity:(id)a5 completion:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, uint64_t))a6;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_1D97E1F54;
  id v33 = sub_1D97E1F64;
  id v34 = 0;
  id v13 = v10;
  id v34 = v13;
  id v14 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
  int v15 = [v14 errorIndicatesZoneNotCreated:v30[5]];

  uint64_t v16 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
  int v17 = [v16 errorIndicatesUserDeletedZone:v30[5]];

  if ((v15 | v17) == 1)
  {
    if (IMOSLoggingEnabled())
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        __int16 v19 = @"zone not created";
        if (v17) {
          __int16 v19 = @"user deleted zone";
        }
        *(_DWORD *)long long buf = 138412546;
        uint64_t v36 = v19;
        __int16 v37 = 2112;
        id v38 = v13;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "We got a %@ error while fetching recoverable messages. %@", buf, 0x16u);
      }
    }
    id v20 = [(IMDCKRecoverableMessageSyncController *)self ckQueue];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1D97E2880;
    v28[3] = &unk_1E6B76E68;
    v28[4] = self;
    v28[5] = &v29;
    dispatch_sync(v20, v28);
  }
  if (v30[5])
  {
    __int16 v21 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
    int v22 = [v21 CKPartialError:v30[5] hasErrorCode:&unk_1F33C5DC0];

    if (v22)
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          BOOL v24 = (__CFString *)v30[5];
          *(_DWORD *)long long buf = 138412290;
          uint64_t v36 = v24;
          _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "We got an expired server change token back so resetting local sync state, and fetching the recoverable messages again %@", buf, 0xCu);
        }
      }
      [(IMDCKRecoverableMessageSyncController *)self clearLocalSyncState:17];
    }
    else if (IMOSLoggingEnabled())
    {
      id v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = (__CFString *)v30[5];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v36 = v27;
        _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "********* We got an error fetching changes from recoverable messages zone %@", buf, 0xCu);
      }
    }
    if (v12) {
      v12[2](v12, 0, v30[5]);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "We completed fetching changes from recoverable message zone with no error", buf, 2u);
      }
    }
    [(IMDCKRecoverableMessageSyncController *)self _writeRecordsWithType:a3 activity:v11 completion:v12];
  }
  _Block_object_dispose(&v29, 8);
}

- (void)clearLocalSyncState:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109120;
      int v9 = v3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Recently Deleted | Clearing local recoverable sync state, flags 0x%x", buf, 8u);
    }
  }
  if (v3)
  {
    id v6 = [(IMDCKRecoverableMessageSyncController *)self ckQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D97E2B14;
    block[3] = &unk_1E6B73268;
    block[4] = self;
    dispatch_async(v6, block);
  }
}

- (id)_syncTokenKey
{
  return @"recoverableMessageChangeToken";
}

- (id)_syncTokenStore
{
  return self->_syncTokenStore;
}

- (BOOL)_zoneCreated
{
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(IMDCKRecoverableMessageSyncController *)self recordZoneManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D97E2D7C;
  v11[3] = &unk_1E6B73B50;
  id v13 = &v14;
  id v5 = v3;
  id v12 = v5;
  [v4 createRecoverableMessageZoneIfNeededWithCompletionBlock:v11];

  dispatch_time_t v6 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    *((unsigned char *)v15 + 24) = 0;
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "***** Timed out creating recoverable message zone *******", v10, 2u);
      }
    }
  }
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)_writeRecordsWithType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  __int16 v23 = sub_1D97E1F54;
  BOOL v24 = sub_1D97E1F64;
  id v25 = 0;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = [(IMDCKRecoverableMessageSyncController *)self _saveRecordsOperationWithMap:v21[5] activity:v8];
  id v11 = v10;
  if (v10)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1D97E3154;
    v19[3] = &unk_1E6B76E90;
    v19[4] = self;
    v19[5] = &v20;
    [v10 setPerRecordCompletionBlock:v19];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1D97E3170;
    v14[3] = &unk_1E6B76EB8;
    char v17 = &v20;
    int64_t v18 = a3;
    v14[4] = self;
    id v15 = v8;
    id v12 = v9;
    id v16 = v12;
    [v11 setModifyRecordsCompletionBlock:v14];
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v27 = v11;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Scheduling write recoverable message operation %@", buf, 0xCu);
      }
    }
    [(IMDCKRecoverableMessageSyncController *)self _scheduleOperation:v11];
    if (v12) {
      (*((void (**)(id, uint64_t, void))v12 + 2))(v12, 1, 0);
    }
  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
  }

  _Block_object_dispose(&v20, 8);
}

- (void)_onRecordWrite:(id)a3 error:(id)a4 recordNameToPartIndexAndRowID:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412546;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Wrote recoverable message record %@ with error %@", (uint8_t *)&v24, 0x16u);
    }
  }
  if (v9)
  {
    [(IMDCKAbstractSyncController *)self setRecordsWriteFailed:[(IMDCKAbstractSyncController *)self recordsWriteFailed] + 1];
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412546;
        id v25 = v8;
        __int16 v26 = 2112;
        id v27 = v9;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "IMDCKRecoverableMessageSyncController | Recently Deleted: could not write record: %@ encountered error: %@", (uint8_t *)&v24, 0x16u);
      }
    }
  }
  else
  {
    [(IMDCKAbstractSyncController *)self setRecordsWritten:[(IMDCKAbstractSyncController *)self recordsWritten] + 1];
    id v13 = [v8 recordID];
    uint64_t v14 = [v13 recordName];

    id v15 = [v10 objectForKey:v14];
    id v16 = [v15 objectForKeyedSubscript:@"messageRowID"];
    uint64_t v17 = [v16 longLongValue];

    int64_t v18 = [v15 objectForKeyedSubscript:@"partIndex"];
    uint64_t v19 = [v18 longLongValue];

    if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        __int16 v21 = [NSNumber numberWithLongLong:v17];
        uint64_t v22 = [NSNumber numberWithLongLong:v19];
        int v24 = 138412802;
        id v25 = v21;
        __int16 v26 = 2112;
        id v27 = v22;
        __int16 v28 = 2112;
        uint64_t v29 = v14;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Recently Deleted | Marking row %@ with partIndex: %@ for %@ as clean", (uint8_t *)&v24, 0x20u);
      }
    }
    __int16 v23 = +[IMDChatRegistry sharedInstance];
    [v23 updateRecoverableMessageSyncState:1 forMessageRowID:v17 onPartIndex:v19];
  }
}

- (void)_onWriteComplete:(int64_t)a3 error:(id)a4 shouldWriteMore:(BOOL)a5 activity:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, void, id))a7;
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = @"NO";
      if (!v12) {
        id v16 = @"YES";
      }
      int v17 = 138412546;
      int64_t v18 = v16;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Recoverable messages writes completed sucess: %@ error %@", (uint8_t *)&v17, 0x16u);
    }
  }
  if (v12)
  {
    if (v14) {
      v14[2](v14, 0, v12);
    }
  }
  else if (v9)
  {
    [(IMDCKRecoverableMessageSyncController *)self _writeRecordsWithType:a3 activity:v13 completion:v14];
  }
  else if (v14)
  {
    v14[2](v14, 1, 0);
  }
}

- (void)syncRemovedRecoverableMessagesToCloudKitWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IMDCKUtilities sharedInstance];
  char v6 = [v5 cloudKitSyncingEnabled];

  if (v6)
  {
    id v7 = [(IMDCKRecoverableMessageSyncController *)self _copyRecordIDsToDeleteWithLimit:[(IMDCKRecoverableMessageSyncController *)self _deleteBatchSize]];
    id v8 = +[IMDCKUtilities sharedInstance];
    BOOL v9 = (void *)[v8 newfilteredArrayRemovingCKRecordIDDupes:v7];

    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134218240;
        uint64_t v19 = [v7 count];
        __int16 v20 = 2048;
        uint64_t v21 = [v9 count];
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Recently Deleted | Got %lu recordIDs to sync, filtered to %lu unique recordID", buf, 0x16u);
      }
    }
    if ([v9 count])
    {
      [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToDeleting];
      id v11 = [(IMDCKRecoverableMessageSyncController *)self ckQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D97E39F4;
      block[3] = &unk_1E6B73A60;
      block[4] = self;
      id v16 = v9;
      id v17 = v4;
      dispatch_async(v11, block);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Recently Deleted | No pending recoverable messages to delete from CloudKit", buf, 2u);
        }
      }
      uint64_t v14 = +[IMDChatRegistry sharedInstance];
      [v14 clearRecoverableMessageTombStones];

      if (v4) {
        (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Recently Deleted | Not performing CloudKit recoverable message deletes as CK syncing is off", buf, 2u);
      }
    }
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

- (void)_deleteRecoverableMessagesWithRecordIDs:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [(IMDCKRecoverableMessageSyncController *)self CKOperationFactory];
    BOOL v9 = [v8 deleteRecoverableMessageCKOperationUsingRecordIDstoDelete:v6];

    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = sub_1D97E3F24;
    id v15 = &unk_1E6B73B28;
    id v16 = self;
    id v17 = v7;
    [v9 setModifyRecordsCompletionBlock:&v12];
    objc_msgSend(v9, "setPerRecordCompletionBlock:", &unk_1F3391A80, v12, v13, v14, v15, v16);
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v19 = v6;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Recently Deleted | Kicking off recoverable delete of recordIDs %@", buf, 0xCu);
      }
    }
    [(IMDCKRecoverableMessageSyncController *)self _scheduleOperation:v9];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Recently Deleted | No GUIDs passed in to delete", buf, 2u);
      }
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (id)_copyRecordIDsToDeleteWithLimit:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = +[IMDChatRegistry sharedInstance];
  id v6 = [v5 recoverableMessagesMetadataPendingCloudKitDeleteWithLimit:a3];

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
        id v14 = -[IMDCKRecoverableMessageSyncController _constructRecoverableMessageRecordIDUsingTombStoneDictionary:](self, "_constructRecoverableMessageRecordIDUsingTombStoneDictionary:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
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

- (id)_constructRecoverableMessageRecordIDUsingTombStoneDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"messageGUID"];
  id v6 = [v4 objectForKeyedSubscript:@"chatGUID"];
  id v7 = [v4 objectForKeyedSubscript:@"partIndex"];

  uint64_t v8 = (int)[v7 intValue];
  id v9 = +[IMDCKRecordSaltManager sharedInstance];
  uint64_t v10 = [v9 cachedSalt];

  uint64_t v11 = [(IMDCKRecoverableMessageSyncController *)self recoverableGUIDFromMessageGUID:v5 chatGUID:v6 partIndex:v8];
  uint64_t v12 = [(IMDCKRecoverableMessageSyncController *)self recordZoneManager];
  uint64_t v13 = [v12 recoverableMessageRecordZoneID];

  id v14 = +[CKRecordUtilities recordIDUsingSalt:v10 zoneID:v13 guid:v11];

  return v14;
}

- (unint64_t)_deleteBatchSize
{
  v2 = +[IMDCKUtilities sharedInstance];
  int v3 = [v2 isInCloudKitDemoMode];

  if (v3) {
    return 5;
  }
  else {
    return 20;
  }
}

- (id)_fetchRecordsOperationWithActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDCKRecoverableMessageSyncController *)self recordZoneManager];
  id v6 = [v5 recoverableMessageRecordZoneID];
  id v7 = [(IMDCKAbstractSyncController *)self latestSyncToken];
  uint64_t v8 = +[IMDCKRecoverableMessageSyncController _fetchOperationFactory:v6 token:v7 batchSize:200 activity:v4];

  return v8;
}

- (id)_saveRecordsOperationWithMap:(id)a3 activity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(IMDCKRecoverableMessageSyncController *)self recordZoneManager];
  id v9 = [v8 recoverableMessageRecordZoneID];
  uint64_t v10 = [(IMDCKAbstractSyncController *)self latestSyncToken];
  uint64_t v11 = [(IMDCKRecoverableMessageSyncController *)self _saveRecoverableMessagesOperationFactory:v9 token:v10 batchSize:200 recordNameToPartIndexAndRowID:v7 activity:v6];

  return v11;
}

+ (id)_zoneChangesOptionsDictionaryUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5
{
  id v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1A060]);
  [v11 setDesiredKeys:0];
  [v11 setPreviousServerChangeToken:v9];

  [v11 setResultsLimit:a5];
  [v10 setObject:v11 forKey:v8];

  return v10;
}

+ (id)_fetchRecoverableMessagesCKConfiguration:(id)a3
{
  int v3 = (objc_class *)MEMORY[0x1E4F1A208];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setQualityOfService:17];
  [v5 setAllowsCellularAccess:1];
  objc_msgSend(v5, "im_setActivity:", v4);

  return v5;
}

+ (id)_fetchOperationFactory:(id)a3 token:(id)a4 batchSize:(unint64_t)a5 activity:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1A070]);
    id v14 = IMSingleObjectArray();
    id v15 = [a1 _zoneChangesOptionsDictionaryUsingToken:v11 zoneID:v10 resultsLimit:a5];
    id v16 = (void *)[v13 initWithRecordZoneIDs:v14 configurationsByRecordZoneID:v15];

    long long v17 = [a1 _fetchRecoverableMessagesCKConfiguration:v12];
    [v16 setConfiguration:v17];

    [v16 setFetchAllChanges:1];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v20 = 0;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "_fetchOperationFactory was passed in a nil zone", v20, 2u);
      }
    }
    id v16 = 0;
  }

  return v16;
}

- (id)_writeRecoverableMessagesCKConfiguration:(id)a3
{
  int v3 = (objc_class *)MEMORY[0x1E4F1A208];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setQualityOfService:17];
  [v5 setAllowsCellularAccess:1];
  objc_msgSend(v5, "im_setActivity:", v4);

  return v5;
}

- (id)_saveRecoverableMessagesOperationFactory:(id)a3 token:(id)a4 batchSize:(unint64_t)a5 recordNameToPartIndexAndRowID:(id)a6 activity:(id)a7
{
  int v9 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v12)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    __int16 v28 = sub_1D97E4990;
    uint64_t v29 = &unk_1E6B75928;
    uint64_t v30 = self;
    id v31 = v12;
    id v32 = v14;
    id v17 = v16;
    id v33 = v17;
    dispatch_sync(MEMORY[0x1E4F14428], &v26);
    long long v18 = +[IMDCKUtilities sharedInstance];
    long long v19 = (void *)[v18 newfilteredArrayRemovingCKRecordDupes:v17];

    if (IMOSLoggingEnabled())
    {
      long long v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = [v19 count];
        *(_DWORD *)long long buf = 134218240;
        uint64_t v35 = v21;
        __int16 v36 = 1024;
        int v37 = v9;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Found %lu of %u max recoverable messages to write up", buf, 0x12u);
      }
    }
    if ([v19 count])
    {
      uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:v19 recordIDsToDelete:0];
      [v22 setSavePolicy:1];
      __int16 v23 = [(IMDCKRecoverableMessageSyncController *)self _writeRecoverableMessagesCKConfiguration:v15];
      [v22 setConfiguration:v23];
    }
    else
    {
      uint64_t v22 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "_saveRecoverableMessagesOperationFactory was passed in a nil zone", buf, 2u);
      }
    }
    uint64_t v22 = 0;
  }

  return v22;
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
      *(_DWORD *)long long buf = 138412290;
      id v23 = v9;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Delete recoverable message callback with error %@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97E4EA0;
  block[3] = &unk_1E6B73BC8;
  id v12 = v8;
  id v19 = v12;
  id v13 = v9;
  id v20 = v13;
  uint64_t v21 = self;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  if (v10)
  {
    id v14 = [(IMDCKRecoverableMessageSyncController *)self ckQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1D97E51D0;
    v15[3] = &unk_1E6B73A10;
    id v17 = v10;
    id v16 = v13;
    dispatch_async(v14, v15);
  }
}

- (id)createCKRecordforRecoverableMessageMetadata:(id)a3 zoneID:(id)a4 recordNameToPartIndexAndRowID:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v32 = a4;
  id v29 = a5;
  uint64_t v35 = [v8 objectForKeyedSubscript:@"messageGUID"];
  id v33 = [v8 objectForKeyedSubscript:@"chatGUID"];
  id v34 = [v8 objectForKeyedSubscript:@"deleteDateInterval"];
  if ((![v35 length] || !objc_msgSend(v33, "length") || !v34) && IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v39 = v35;
      __int16 v40 = 2112;
      id v41 = v34;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "IMDCKRecoverableMessageSyncController | Recently Deleted: returning nil record. messageGUID: %@, deleteDateNanosecondIntervalNumber: %@", buf, 0x16u);
    }
  }
  uint64_t v10 = [v34 unsignedLongLongValue];
  uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v10);
  id v11 = [v8 objectForKeyedSubscript:@"partBody"];
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 attributesAtIndex:0 effectiveRange:0];
    id v14 = [v13 objectForKey:*MEMORY[0x1E4F6C1F8]];
    uint64_t v15 = [v14 integerValue];
  }
  else
  {
    uint64_t v15 = -1;
  }
  id v16 = +[IMDCKRecordSaltManager sharedInstance];
  id v31 = [v16 cachedSalt];

  id v17 = [(IMDCKRecoverableMessageSyncController *)self recoverableGUIDFromMessageGUID:v35 chatGUID:v33 partIndex:v15];
  long long v18 = +[CKRecordUtilities recordIDUsingSalt:v31 zoneID:v32 guid:v17];
  if (v18)
  {
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"recoverableMessage" recordID:v18];
    [v19 _setCKRecordString:v35 forKey:@"guid"];
    [v19 _setCKRecordDate:v30 forKey:@"deleteDate"];
    if (v12)
    {
      id v20 = JWEncodeCodableObject();
      [v19 _setCKRecordData:v20 forKey:@"partBody"];
    }
    if (v19)
    {
      v36[0] = @"messageRowID";
      uint64_t v21 = objc_msgSend(v8, "objectForKeyedSubscript:");
      v36[1] = @"partIndex";
      v37[0] = v21;
      uint64_t v22 = [NSNumber numberWithInteger:v15];
      v37[1] = v22;
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
      uint64_t v24 = [v19 recordID];
      id v25 = [v24 recordName];
      [v29 setObject:v23 forKeyedSubscript:v25];
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Recently Delete | Was not able to construct CKRecord with given data. This is bad.", buf, 2u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v39 = v8;
        _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "IMDCKRecoverableMessageSyncController | Recently Deleted: returning nil record. recordID nil for metadata: %@", buf, 0xCu);
      }
    }
    id v19 = 0;
  }

  return v19;
}

- (void)_scheduleOperation:(id)a3
{
  id v3 = a3;
  id v5 = +[IMDCKDatabaseManager sharedInstance];
  id v4 = [v5 truthDatabase];
  [v4 addOperation:v3];
}

- (int64_t)syncControllerRecordType
{
  return 4;
}

- (void)deleteRecoverableMessageZone
{
  id v3 = [(IMDCKRecoverableMessageSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97E57C0;
  block[3] = &unk_1E6B73268;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)deleteChatBotRecoverableMessageSyncToken
{
  id v2 = [(IMDCKRecoverableMessageSyncController *)self syncTokenStore];
  [v2 persistToken:0 forKey:@"chatBotRecoverableMessageChangeToken"];
}

- (id)recoverableGUIDFromMessageGUID:(id)a3 chatGUID:(id)a4 partIndex:(int64_t)a5
{
  return (id)[NSString stringWithFormat:@"%@+%@+%ld", a3, a4, a5, 0];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CKOperationFactory, 0);
  objc_storeStrong((id *)&self->_syncTokenStore, 0);
  objc_storeStrong((id *)&self->_recordZoneManager, 0);

  objc_storeStrong((id *)&self->_ckQueue, 0);
}

@end