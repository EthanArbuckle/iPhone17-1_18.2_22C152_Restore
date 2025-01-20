@interface IMDCKUpdateSyncController
+ (id)_fetchUpdatesCKConfiguration:(id)a3;
+ (id)_zoneChangesOptionsDictionaryUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5;
+ (id)fetchOperationFactory:(id)a3 token:(id)a4 batchSize:(unint64_t)a5 activity:(id)a6;
+ (id)messageUpdateV1RecordType;
+ (id)sharedInstance;
+ (int64_t)stepAfter:(int64_t)a3;
- (BOOL)_zoneCreated;
- (BOOL)fetchedChatsDuringLastSync;
- (IMDCKUpdateSyncController)init;
- (IMDCKUpdateSyncController)initWithSyncTokenStore:(id)a3;
- (IMDRecordZoneManager)recordZoneManager;
- (NSMutableDictionary)writeMsgIDToRowIDMap;
- (OS_dispatch_queue)ckQueue;
- (SyncTokenStoreProviding)syncTokenStore;
- (id)_fetchRecordsOperationWithActivity:(id)a3;
- (id)_saveRecordsT1OperationWithMap:(id)a3 activity:(id)a4;
- (id)_saveRecordsT2OperationWithMap:(id)a3 activity:(id)a4;
- (id)_syncTokenKey;
- (id)_syncTokenStore;
- (id)_writeUpdatesCKConfiguration:(id)a3;
- (id)saveT1UpdatesOperationFactory:(id)a3 token:(id)a4 batchSize:(unint64_t)a5 recordNameToRowIDMap:(id)a6 activity:(id)a7;
- (id)saveT2UpdatesOperationFactory:(id)a3 token:(id)a4 batchSize:(unint64_t)a5 recordNameToRowIDMap:(id)a6 activity:(id)a7;
- (unint64_t)_numberOfRecordsToFetchPerBatch;
- (void)_onChangeTokenUpdated:(id)a3 token:(id)a4 data:(id)a5;
- (void)_onReadComplete:(int64_t)a3 error:(id)a4 activity:(id)a5 completion:(id)a6;
- (void)_onRecordDeleted:(id)a3 type:(id)a4;
- (void)_onRecordRead:(id)a3;
- (void)_onRecordT1Write:(id)a3 error:(id)a4 recordNameToRowIDMap:(id)a5;
- (void)_onRecordT2Write:(id)a3 error:(id)a4 recordNameToItemMap:(id)a5;
- (void)_onRecordZoneFetchComplete:(id)a3 token:(id)a4 tokenData:(id)a5 moreComing:(BOOL)a6 error:(id)a7;
- (void)_onWriteT1Complete:(int64_t)a3 error:(id)a4 shouldWriteMore:(BOOL)a5 activity:(id)a6 completion:(id)a7;
- (void)_onWriteT2Complete:(int64_t)a3 error:(id)a4 shouldWriteMore:(BOOL)a5 activity:(id)a6 completion:(id)a7;
- (void)_readRecordsWithType:(int64_t)a3 attemptCount:(unint64_t)a4 activity:(id)a5 completion:(id)a6;
- (void)_scheduleOperation:(id)a3;
- (void)_writeRecordsWithType:(int64_t)a3 activity:(id)a4 completion:(id)a5;
- (void)_writeT1RecordUpdatesWithType:(int64_t)a3 activity:(id)a4 completion:(id)a5;
- (void)_writeT2RecordUpdatesWithType:(int64_t)a3 activity:(id)a4 completion:(id)a5;
- (void)_writeUpdatesWithType:(int64_t)a3 updateStep:(int64_t)a4 activity:(id)a5 completion:(id)a6;
- (void)clearLocalSyncState:(unint64_t)a3;
- (void)deleteUpdateSyncToken;
- (void)deleteUpdateZone;
- (void)setCkQueue:(id)a3;
- (void)setFetchedChatsDuringLastSync:(BOOL)a3;
- (void)setRecordZoneManager:(id)a3;
- (void)setSyncTokenStore:(id)a3;
- (void)setWriteMsgIDToRowIDMap:(id)a3;
- (void)syncWithType:(int64_t)a3 withActivity:(id)a4 withCompletion:(id)a5;
@end

@implementation IMDCKUpdateSyncController

+ (id)sharedInstance
{
  if (qword_1EBE2B8F8 != -1) {
    dispatch_once(&qword_1EBE2B8F8, &unk_1F3392240);
  }
  v2 = (void *)qword_1EBE2BA38;

  return v2;
}

- (IMDCKUpdateSyncController)initWithSyncTokenStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMDCKUpdateSyncController;
  v6 = [(IMDCKUpdateSyncController *)&v12 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.private.IMDCKUpdateSyncController", 0);
    ckQueue = v6->_ckQueue;
    v6->_ckQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[IMDRecordZoneManager sharedInstance];
    recordZoneManager = v6->_recordZoneManager;
    v6->_recordZoneManager = (IMDRecordZoneManager *)v9;

    objc_storeStrong((id *)&v6->_syncTokenStore, a3);
  }

  return v6;
}

- (IMDCKUpdateSyncController)init
{
  v3 = objc_alloc_init(IMDCKSyncTokenStore);
  v4 = [(IMDCKUpdateSyncController *)self initWithSyncTokenStore:v3];

  return v4;
}

- (void)deleteUpdateZone
{
  v3 = [(IMDCKUpdateSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D9851F30;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)clearLocalSyncState:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Clearing local updates sync state, flags 0x%x", (uint8_t *)v6, 8u);
    }
  }
  if (v3) {
    [(IMDCKUpdateSyncController *)self deleteUpdateSyncToken];
  }
}

- (void)deleteUpdateSyncToken
{
  int v3 = [(IMDCKUpdateSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D98520F0;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  dispatch_async(v3, block);
}

+ (id)messageUpdateV1RecordType
{
  return @"messageUpdateV1";
}

- (void)syncWithType:(int64_t)a3 withActivity:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t, void))a5;
  v10 = [MEMORY[0x1E4F6E720] sharedInstance];
  int v11 = [v10 getBoolFromDomain:@"com.apple.madrid" forKey:@"mic-delete-update-zone"];

  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      objc_super v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Deleting zone based on default, and skipping Update syncs", v14, 2u);
      }
    }
    v13 = +[IMDRecordZoneManager sharedInstance];
    [v13 deleteUpdateZone];

    if (v9) {
      v9[2](v9, 1, 0);
    }
  }
  else
  {
    [(IMDCKUpdateSyncController *)self _readRecordsWithType:a3 attemptCount:0 activity:v8 completion:v9];
  }
}

- (void)_readRecordsWithType:(int64_t)a3 attemptCount:(unint64_t)a4 activity:(id)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  int v11 = [(IMDCKUpdateSyncController *)self _fetchRecordsOperationWithActivity:v9];
  objc_super v12 = v11;
  if (v11)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1D98525DC;
    v25[3] = &unk_1E6B749D0;
    v25[4] = self;
    [v11 setRecordChangedBlock:v25];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1D98525E8;
    v24[3] = &unk_1E6B74A18;
    v24[4] = self;
    [v12 setRecordWithIDWasDeletedBlock:v24];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1D98525F8;
    v23[3] = &unk_1E6B76DC8;
    v23[4] = self;
    [v12 setRecordZoneChangeTokensUpdatedBlock:v23];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1D985260C;
    v22[3] = &unk_1E6B76DF0;
    v22[4] = self;
    [v12 setRecordZoneFetchCompletionBlock:v22];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = sub_1D9852628;
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
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Scheduling a fetch update zone changes operation %@", buf, 0xCu);
      }
    }
    -[IMDCKUpdateSyncController _scheduleOperation:](self, "_scheduleOperation:", v12, v14, v15, v16, v17, v18);
  }
  else if (v10)
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

- (void)_onRecordRead:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [v3 _stringForKey:@"ut"];
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Fetched update record with type %@", buf, 0xCu);
    }
  }
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v6 = +[IMDChatRegistry sharedInstance];
    [v6 handleMessageUpdate:v3];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D98527CC;
    block[3] = &unk_1E6B73268;
    id v8 = v3;
    dispatch_sync(MEMORY[0x1E4F14428], block);
    v6 = v8;
  }
}

- (void)_onRecordDeleted:(id)a3 type:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
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
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "recordZoneChangeTokensUpdatedBlock recordZoneID %@ serverChangeToken %@ clientChangeToken %@", buf, 0x20u);
    }
  }
  objc_super v12 = [(IMDCKUpdateSyncController *)self ckQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1D9852A70;
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
    v16 = OSLogHandleForIMFoundationCategory();
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
  [(IMDCKUpdateSyncController *)self _onChangeTokenUpdated:v12 token:v13 data:v14];
}

- (void)_onReadComplete:(int64_t)a3 error:(id)a4 activity:(id)a5 completion:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, uint64_t))a6;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_1D9853054;
  v33 = sub_1D9853064;
  id v34 = 0;
  id v13 = v10;
  id v34 = v13;
  id v14 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
  int v15 = [v14 errorIndicatesZoneNotCreated:v30[5]];

  v16 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
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
        *(_DWORD *)buf = 138412546;
        v36 = v19;
        __int16 v37 = 2112;
        id v38 = v13;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "We got a %@ error while fetching updates. %@", buf, 0x16u);
      }
    }
    id v20 = [(IMDCKUpdateSyncController *)self ckQueue];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1D985306C;
    v28[3] = &unk_1E6B76E68;
    v28[4] = self;
    v28[5] = &v29;
    dispatch_sync(v20, v28);
  }
  if (v30[5])
  {
    __int16 v21 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
    int v22 = [v21 CKPartialError:v30[5] hasErrorCode:&unk_1F33C5EF8];

    if (v22)
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          BOOL v24 = (__CFString *)v30[5];
          *(_DWORD *)buf = 138412290;
          v36 = v24;
          _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "We got an expired server change token back so resetting local sync state, and fetching the updates again %@", buf, 0xCu);
        }
      }
      [(IMDCKUpdateSyncController *)self clearLocalSyncState:17];
    }
    else if (IMOSLoggingEnabled())
    {
      id v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = (__CFString *)v30[5];
        *(_DWORD *)buf = 138412290;
        v36 = v27;
        _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "********* We got an error fetching changes from update zone %@", buf, 0xCu);
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
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "We completed fetching changes from update zone with no error", buf, 2u);
      }
    }
    [(IMDCKUpdateSyncController *)self _writeRecordsWithType:a3 activity:v11 completion:v12];
  }
  _Block_object_dispose(&v29, 8);
}

- (unint64_t)_numberOfRecordsToFetchPerBatch
{
  return 50;
}

- (id)_syncTokenKey
{
  return @"updateChangeToken";
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
  v4 = [(IMDCKUpdateSyncController *)self recordZoneManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D9853384;
  v11[3] = &unk_1E6B73B50;
  id v13 = &v14;
  id v5 = v3;
  id v12 = v5;
  [v4 createUpdateZoneIfNeededWithCompletionBlock:v11];

  dispatch_time_t v6 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    *((unsigned char *)v15 + 24) = 0;
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "***** Timed out creating update zone *******", v10, 2u);
      }
    }
  }
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)_writeRecordsWithType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
}

+ (int64_t)stepAfter:(int64_t)a3
{
  int64_t v3 = 3;
  if (a3 != 2) {
    int64_t v3 = 0;
  }
  if (a3 == 1) {
    return 2;
  }
  else {
    return v3;
  }
}

- (void)_writeUpdatesWithType:(int64_t)a3 updateStep:(int64_t)a4 activity:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D98535FC;
  aBlock[3] = &unk_1E6B77D28;
  int64_t v18 = a4;
  int64_t v19 = a3;
  aBlock[4] = self;
  id v12 = v10;
  id v16 = v12;
  id v13 = v11;
  id v17 = v13;
  uint64_t v14 = _Block_copy(aBlock);
  if (a4 == 3) {
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    [(IMDCKUpdateSyncController *)self _writeT2RecordUpdatesWithType:a3 activity:v12 completion:v14];
    goto LABEL_8;
  }
  if (a4 != 1)
  {
LABEL_5:
    if (v13) {
      (*((void (**)(id, uint64_t, void))v13 + 2))(v13, 1, 0);
    }
  }
  else
  {
    [(IMDCKUpdateSyncController *)self _writeT1RecordUpdatesWithType:a3 activity:v12 completion:v14];
  }
LABEL_8:
}

- (void)_writeT1RecordUpdatesWithType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1D9853054;
  __int16 v23 = sub_1D9853064;
  id v24 = 0;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = [(IMDCKUpdateSyncController *)self _saveRecordsT1OperationWithMap:v20[5] activity:v8];
  id v11 = v10;
  if (v10)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1D9853940;
    v18[3] = &unk_1E6B76E90;
    v18[4] = self;
    v18[5] = &v19;
    [v10 setPerRecordCompletionBlock:v18];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1D9853A20;
    v13[3] = &unk_1E6B76EB8;
    id v16 = &v19;
    int64_t v17 = a3;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    [v11 setModifyRecordsCompletionBlock:v13];
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v11;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Scheduling write updates T1 operation %@", buf, 0xCu);
      }
    }
    [(IMDCKUpdateSyncController *)self _scheduleOperation:v11];
  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
  }

  _Block_object_dispose(&v19, 8);
}

- (void)_onRecordT1Write:(id)a3 error:(id)a4 recordNameToRowIDMap:(id)a5
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
      int v25 = 138412546;
      uint64_t v26 = (uint64_t)v8;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Wrote T1 update record %@ with error %@", (uint8_t *)&v25, 0x16u);
    }
  }
  if (!v9)
  {
    int v22 = [v8 recordID];
    id v14 = [v22 recordName];

    int64_t v17 = [v10 objectForKey:v14];
    uint64_t v23 = [v17 longLongValue];
    if (IMOSLoggingEnabled())
    {
      id v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v25 = 134218242;
        uint64_t v26 = v23;
        __int16 v27 = 2112;
        id v28 = v14;
        _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Marking row %lld for %@ as clean", (uint8_t *)&v25, 0x16u);
      }
    }
    uint64_t v21 = +[IMDMessageStore sharedInstance];
    [v21 markMessageAsCleanWithROWID:v23];
    goto LABEL_21;
  }
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412546;
      uint64_t v26 = (uint64_t)v9;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Error %@ while writing up record %@ ", (uint8_t *)&v25, 0x16u);
    }
  }
  id v13 = [(IMDCKAbstractSyncController *)self ckUtilities];
  id v14 = [v13 extractServerRecordFromCKServerErrorRecordChanged:v9];

  id v15 = [v14 recordID];
  id v16 = [v15 recordName];
  int64_t v17 = [v10 objectForKey:v16];

  uint64_t v18 = [v17 longLongValue];
  if (v14)
  {
    uint64_t v19 = v18;
    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v25 = 138412290;
        uint64_t v26 = (uint64_t)v14;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Extracted record from server error%@ ", (uint8_t *)&v25, 0xCu);
      }
    }
    uint64_t v21 = +[IMDChatRegistry sharedInstance];
    [v21 handleMessageUpdateConflictType:@"UT1" serverRecord:v14 localRowID:v19];
LABEL_21:
  }
}

- (void)_onWriteT1Complete:(int64_t)a3 error:(id)a4 shouldWriteMore:(BOOL)a5 activity:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  id v14 = (void (**)(id, void, id))a7;
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
      uint64_t v18 = v16;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Update T1 writes completed sucess: %@ error %@", (uint8_t *)&v17, 0x16u);
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
    [(IMDCKUpdateSyncController *)self _writeRecordsWithType:a3 activity:v13 completion:v14];
  }
  else if (v14)
  {
    v14[2](v14, 1, 0);
  }
}

- (void)_writeT2RecordUpdatesWithType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1D9853054;
  uint64_t v23 = sub_1D9853064;
  id v24 = 0;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = [(IMDCKUpdateSyncController *)self _saveRecordsT2OperationWithMap:v20[5] activity:v8];
  id v11 = v10;
  if (v10)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1D9854328;
    v18[3] = &unk_1E6B76E90;
    v18[4] = self;
    v18[5] = &v19;
    [v10 setPerRecordCompletionBlock:v18];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1D9854408;
    v13[3] = &unk_1E6B76EB8;
    id v16 = &v19;
    int64_t v17 = a3;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    [v11 setModifyRecordsCompletionBlock:v13];
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v11;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Scheduling write updates T2 operation %@", buf, 0xCu);
      }
    }
    [(IMDCKUpdateSyncController *)self _scheduleOperation:v11];
  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
  }

  _Block_object_dispose(&v19, 8);
}

- (void)_onRecordT2Write:(id)a3 error:(id)a4 recordNameToItemMap:(id)a5
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
      int v26 = 138412546;
      id v27 = v8;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Wrote T2 update record %@ with error %@", (uint8_t *)&v26, 0x16u);
    }
  }
  if (!v9)
  {
    uint64_t v23 = [v8 recordID];
    id v14 = [v23 recordName];

    int64_t v17 = [v10 objectForKey:v14];
    uint64_t v18 = [v17 objectForKey:@"MID"];
    int v22 = [v17 objectForKey:@"SR"];
    if (IMOSLoggingEnabled())
    {
      id v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v26 = 138412290;
        id v27 = v18;
        _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Successful write of T2 update to the server, updating syncedSyndicationRanges for message guid %@ ", (uint8_t *)&v26, 0xCu);
      }
    }
    int v25 = +[IMDChatRegistry sharedInstance];
    [v25 updateSyncedSyndicationRanges:v22 forGUID:v18];

    goto LABEL_21;
  }
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v26 = 138412546;
      id v27 = v9;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Error %@ while writing up record %@ ", (uint8_t *)&v26, 0x16u);
    }
  }
  id v13 = [(IMDCKAbstractSyncController *)self ckUtilities];
  id v14 = [v13 extractServerRecordFromCKServerErrorRecordChanged:v9];

  id v15 = [v14 recordID];
  id v16 = [v15 recordName];
  int64_t v17 = [v10 objectForKey:v16];

  uint64_t v18 = [v17 objectForKey:@"ROWID"];
  uint64_t v19 = [v18 longLongValue];
  if (v14)
  {
    uint64_t v20 = v19;
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v26 = 138412290;
        id v27 = v14;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Extracted record from server error%@ ", (uint8_t *)&v26, 0xCu);
      }
    }
    int v22 = +[IMDChatRegistry sharedInstance];
    [v22 handleMessageUpdateConflictType:@"UT2" serverRecord:v14 localRowID:v20];
LABEL_21:
  }
}

- (void)_onWriteT2Complete:(int64_t)a3 error:(id)a4 shouldWriteMore:(BOOL)a5 activity:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  id v14 = (void (**)(id, void, id))a7;
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
      uint64_t v18 = v16;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Update T2 writes completed sucess: %@ error %@", (uint8_t *)&v17, 0x16u);
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
    [(IMDCKUpdateSyncController *)self _writeRecordsWithType:a3 activity:v13 completion:v14];
  }
  else if (v14)
  {
    v14[2](v14, 1, 0);
  }
}

- (id)_fetchRecordsOperationWithActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDCKUpdateSyncController *)self recordZoneManager];
  dispatch_time_t v6 = [v5 updateRecordZoneID];
  uint64_t v7 = [(IMDCKAbstractSyncController *)self latestSyncToken];
  id v8 = +[IMDCKUpdateSyncController fetchOperationFactory:v6 token:v7 batchSize:[(IMDCKUpdateSyncController *)self _numberOfRecordsToFetchPerBatch] activity:v4];

  return v8;
}

- (id)_saveRecordsT1OperationWithMap:(id)a3 activity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IMDCKUpdateSyncController *)self recordZoneManager];
  BOOL v9 = [v8 updateRecordZoneID];
  id v10 = [(IMDCKAbstractSyncController *)self latestSyncToken];
  id v11 = [(IMDCKUpdateSyncController *)self saveT1UpdatesOperationFactory:v9 token:v10 batchSize:[(IMDCKUpdateSyncController *)self _numberOfRecordsToFetchPerBatch] recordNameToRowIDMap:v7 activity:v6];

  return v11;
}

- (id)_saveRecordsT2OperationWithMap:(id)a3 activity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IMDCKUpdateSyncController *)self recordZoneManager];
  BOOL v9 = [v8 updateRecordZoneID];
  id v10 = [(IMDCKAbstractSyncController *)self latestSyncToken];
  id v11 = [(IMDCKUpdateSyncController *)self saveT2UpdatesOperationFactory:v9 token:v10 batchSize:[(IMDCKUpdateSyncController *)self _numberOfRecordsToFetchPerBatch] recordNameToRowIDMap:v7 activity:v6];

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

+ (id)_fetchUpdatesCKConfiguration:(id)a3
{
  int64_t v3 = (objc_class *)MEMORY[0x1E4F1A208];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setQualityOfService:17];
  [v5 setAllowsCellularAccess:1];
  objc_msgSend(v5, "im_setActivity:", v4);

  return v5;
}

+ (id)fetchOperationFactory:(id)a3 token:(id)a4 batchSize:(unint64_t)a5 activity:(id)a6
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

    int v17 = [a1 _fetchUpdatesCKConfiguration:v12];
    [v16 setConfiguration:v17];

    [v16 setFetchAllChanges:1];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "fetchOperationFactory was passed in a nil zone", v20, 2u);
      }
    }
    id v16 = 0;
  }

  return v16;
}

- (id)_writeUpdatesCKConfiguration:(id)a3
{
  int64_t v3 = (objc_class *)MEMORY[0x1E4F1A208];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setQualityOfService:17];
  [v5 setAllowsCellularAccess:1];
  objc_msgSend(v5, "im_setActivity:", v4);

  return v5;
}

- (id)saveT1UpdatesOperationFactory:(id)a3 token:(id)a4 batchSize:(unint64_t)a5 recordNameToRowIDMap:(id)a6 activity:(id)a7
{
  int v9 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v12)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D9855308;
    aBlock[3] = &unk_1E6B73BC8;
    aBlock[4] = self;
    id v28 = v14;
    id v17 = v16;
    id v29 = v17;
    uint64_t v18 = (void (**)(void))_Block_copy(aBlock);
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v18[2](v18);
    }
    else {
      dispatch_sync(MEMORY[0x1E4F14428], v18);
    }
    uint64_t v21 = +[IMDCKUtilities sharedInstance];
    int v22 = (void *)[v21 newfilteredArrayRemovingCKRecordDupes:v17];

    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = [v22 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v31 = v24;
        __int16 v32 = 1024;
        int v33 = v9;
        _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Found %lu of %u max T1 updates to write up", buf, 0x12u);
      }
    }
    if ([v22 count])
    {
      id v20 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:v22 recordIDsToDelete:0];
      [v20 setSavePolicy:1];
      int v25 = [(IMDCKUpdateSyncController *)self _writeUpdatesCKConfiguration:v15];
      [v20 setConfiguration:v25];
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "saveT1OperationFactory was passed in a nil zone", buf, 2u);
      }
    }
    id v20 = 0;
  }

  return v20;
}

- (id)saveT2UpdatesOperationFactory:(id)a3 token:(id)a4 batchSize:(unint64_t)a5 recordNameToRowIDMap:(id)a6 activity:(id)a7
{
  int v9 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v12)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D98558F4;
    aBlock[3] = &unk_1E6B73BC8;
    aBlock[4] = self;
    id v28 = v14;
    id v17 = v16;
    id v29 = v17;
    uint64_t v18 = (void (**)(void))_Block_copy(aBlock);
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v18[2](v18);
    }
    else {
      dispatch_sync(MEMORY[0x1E4F14428], v18);
    }
    uint64_t v21 = +[IMDCKUtilities sharedInstance];
    int v22 = (void *)[v21 newfilteredArrayRemovingCKRecordDupes:v17];

    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = [v22 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v31 = v24;
        __int16 v32 = 1024;
        int v33 = v9;
        _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Found %lu of %u max T2 updates to write up", buf, 0x12u);
      }
    }
    if ([v22 count])
    {
      id v20 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:v22 recordIDsToDelete:0];
      [v20 setSavePolicy:1];
      int v25 = [(IMDCKUpdateSyncController *)self _writeUpdatesCKConfiguration:v15];
      [v20 setConfiguration:v25];
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "saveT2OperationFactory was passed in a nil zone", buf, 2u);
      }
    }
    id v20 = 0;
  }

  return v20;
}

- (void)_scheduleOperation:(id)a3
{
  id v3 = a3;
  id v5 = +[IMDCKDatabaseManager sharedInstance];
  id v4 = [v5 truthDatabase];
  [v4 addOperation:v3];
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

- (BOOL)fetchedChatsDuringLastSync
{
  return self->_fetchedChatsDuringLastSync;
}

- (void)setFetchedChatsDuringLastSync:(BOOL)a3
{
  self->_fetchedChatsDuringLastSync = a3;
}

- (NSMutableDictionary)writeMsgIDToRowIDMap
{
  return self->_writeMsgIDToRowIDMap;
}

- (void)setWriteMsgIDToRowIDMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeMsgIDToRowIDMap, 0);
  objc_storeStrong((id *)&self->_syncTokenStore, 0);
  objc_storeStrong((id *)&self->_recordZoneManager, 0);

  objc_storeStrong((id *)&self->_ckQueue, 0);
}

@end