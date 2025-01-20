@interface CKDOperationInfoCache
+ (id)cacheDatabaseSchema;
+ (id)dbFileName;
+ (id)sharedCache;
- (CKDOperationInfoCache)initWithCacheDir:(id)a3;
- (NSMutableDictionary)delegateWrappersByOperationID;
- (OS_dispatch_queue)cacheDelegateQueue;
- (OS_dispatch_queue)cacheQueue;
- (id)_locked_operationInfoForID:(id)a3;
- (id)allOutstandingOperationIDsForAppContainerAccountTuple:(id)a3;
- (id)operationInfoMetadataForOperationWithID:(id)a3;
- (id)outstandingOperationInfosForIDs:(id)a3;
- (id)resumableOperationInfosByAppContainerAccountTuplesWithProgressPurged:(BOOL)a3;
- (void)_lockedArchiveCallback:(id)a3 forOperationID:(id)a4;
- (void)_lockedSetOperationInfo:(id)a3 forOperationID:(id)a4 appContainerAccountTuple:(id)a5;
- (void)_locked_enumerateCallbacksForOperationWithID:(id)a3 usingBlock:(id)a4;
- (void)archiveCallback:(id)a3 forOperationID:(id)a4;
- (void)deleteAllInfoForOperationWithID:(id)a3;
- (void)enumerateCallbacksForOperationWithID:(id)a3 usingBlock:(id)a4;
- (void)expungeOperationInfoForDeletedAccountID:(id)a3;
- (void)registerAttemptForOperationWithID:(id)a3;
- (void)registerCacheEvictionActivity;
- (void)registerDelegate:(id)a3 forOperationWithID:(id)a4;
- (void)setCacheDelegateQueue:(id)a3;
- (void)setCacheQueue:(id)a3;
- (void)setDelegateWrappersByOperationID:(id)a3;
- (void)setOperationInfo:(id)a3 forOperationID:(id)a4 appContainerAccountTuple:(id)a5;
- (void)unregisterDelegate:(id)a3 forOperationWithID:(id)a4;
@end

@implementation CKDOperationInfoCache

+ (id)sharedCache
{
  v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, a1, @"CKDOperationInfoCache.m", 123, @"Use -initWithDeviceContext:");

  return 0;
}

+ (id)dbFileName
{
  return @"CloudKitOperationInfo";
}

+ (id)cacheDatabaseSchema
{
  return @"create table if not exists OperationInfo (\n    operationID                   text primary key,\n    applicationID                 text,\n    personaID                     text,\n    containerID                   text,\n    accountID                     text,\n    operationInfo                 blob,\n    operationIsComplete           integer default 0,\n    expirationDate                real,\n    lastAttemptDate               real,\n    retryNumber                   integer default 0\n);\ncreate index if not exists AppIDPersonaIDContainerIDAccountID on OperationInfo (applicationID, personaID, containerID, accountID);\n\ncreate trigger if not exists DeleteOperationCallback\nbefore delete on OperationInfo\nfor each row begin\n  delete from Callback where operationID = OLD.operationID;\nend;\n\ncreate table if not exists Callback (\n    operationID           text,\n    callback              blob\n);\ncreate index if not exists OperationUUID on Callback (operationID);\n";
}

- (CKDOperationInfoCache)initWithCacheDir:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CKDOperationInfoCache;
  v3 = [(CKDSQLiteCache *)&v16 initWithCacheDir:a3];
  v5 = v3;
  if (v3)
  {
    objc_msgSend_setUserVersion_(v3, v4, 1556947966);
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.cloudkit.operationInfoCache", v6);
    cacheQueue = v5->_cacheQueue;
    v5->_cacheQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.cloudkit.operationInfoCacheDelegate", v9);
    cacheDelegateQueue = v5->_cacheDelegateQueue;
    v5->_cacheDelegateQueue = (OS_dispatch_queue *)v10;

    objc_msgSend_setObjectClassPrefix_(v5, v12, @"CKD");
    uint64_t v13 = objc_opt_new();
    delegateWrappersByOperationID = v5->_delegateWrappersByOperationID;
    v5->_delegateWrappersByOperationID = (NSMutableDictionary *)v13;
  }
  return v5;
}

- (void)registerDelegate:(id)a3 forOperationWithID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11 = objc_msgSend_cacheQueue(self, v9, v10);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4F61170;
  v14[3] = &unk_1E64F6DE8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v7;
  SEL v17 = a2;
  id v12 = v7;
  id v13 = v8;
  dispatch_sync(v11, v14);
}

- (void)unregisterDelegate:(id)a3 forOperationWithID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_cacheDelegateQueue(self, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F616EC;
  block[3] = &unk_1E64F0120;
  block[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v10, block);
}

- (id)operationInfoMetadataForOperationWithID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  SEL v17 = sub_1C4F618D8;
  v18 = sub_1C4F618E8;
  id v19 = 0;
  id v7 = objc_msgSend_cacheQueue(self, v5, v6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F618F0;
  block[3] = &unk_1E64F28C8;
  block[4] = self;
  id v12 = v4;
  id v13 = &v14;
  id v8 = v4;
  dispatch_sync(v7, block);

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)_locked_enumerateCallbacksForOperationWithID:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = objc_msgSend_stringWithFormat_(NSString, v8, @"%@ = ?", @"operationID");
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C4F61C8C;
  v15[3] = &unk_1E64F6E38;
  id v16 = v9;
  id v17 = v6;
  id v18 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v9;
  id v14 = (id)objc_msgSend_performDatabaseOperation_(self, v13, (uint64_t)v15);
}

- (void)enumerateCallbacksForOperationWithID:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_cacheQueue(self, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F61F34;
  block[3] = &unk_1E64F0FA0;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_sync(v10, block);
}

- (id)resumableOperationInfosByAppContainerAccountTuplesWithProgressPurged:(BOOL)a3
{
  v5 = objc_opt_new();
  id v8 = objc_msgSend_cacheQueue(self, v6, v7);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F6201C;
  block[3] = &unk_1E64F1D90;
  block[4] = self;
  id v9 = v5;
  id v14 = v9;
  BOOL v15 = a3;
  dispatch_sync(v8, block);

  id v10 = v14;
  id v11 = v9;

  return v11;
}

- (id)outstandingOperationInfosForIDs:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v8 = objc_msgSend_cacheQueue(self, v6, v7);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F62A28;
  block[3] = &unk_1E64F0120;
  id v15 = v4;
  id v16 = self;
  id v9 = v5;
  id v17 = v9;
  id v10 = v4;
  dispatch_sync(v8, block);

  id v11 = v17;
  id v12 = v9;

  return v12;
}

- (id)allOutstandingOperationIDsForAppContainerAccountTuple:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_1C4F618D8;
  id v19 = sub_1C4F618E8;
  id v20 = 0;
  uint64_t v7 = objc_msgSend_cacheQueue(self, v5, v6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F62EB0;
  block[3] = &unk_1E64F28C8;
  id v12 = v4;
  id v13 = self;
  id v14 = &v15;
  id v8 = v4;
  dispatch_sync(v7, block);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)expungeOperationInfoForDeletedAccountID:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_cacheQueue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4F632AC;
  v9[3] = &unk_1E64F0948;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)deleteAllInfoForOperationWithID:(id)a3
{
}

- (void)_lockedSetOperationInfo:(id)a3 forOperationID:(id)a4 appContainerAccountTuple:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v13 = objc_msgSend_cacheQueue(self, v11, v12);
  dispatch_assert_queue_V2(v13);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C4F6364C;
  v19[3] = &unk_1E64F6EA8;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  id v18 = (id)objc_msgSend_performDatabaseOperation_(self, v17, (uint64_t)v19);
}

- (void)setOperationInfo:(id)a3 forOperationID:(id)a4 appContainerAccountTuple:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v13 = objc_msgSend_cacheQueue(self, v11, v12);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4F63974;
  v17[3] = &unk_1E64F0DF0;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_sync(v13, v17);
}

- (void)_lockedArchiveCallback:(id)a3 forOperationID:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_cacheQueue(self, v8, v9);
  dispatch_assert_queue_V2(v10);

  id v14 = objc_msgSend__locked_operationInfoForID_(self, v11, (uint64_t)v7);
  if (v14)
  {
    id v15 = objc_msgSend_cacheDelegateQueue(self, v12, v13);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4F63C4C;
    block[3] = &unk_1E64F0120;
    void block[4] = self;
    id v16 = v7;
    id v35 = v16;
    id v17 = v6;
    id v36 = v17;
    dispatch_sync(v15, block);

    id v19 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v18, (uint64_t)v17, 1, 0);
    id v22 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v20, v21, 86400.0);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1C4F63D30;
    v28[3] = &unk_1E64F6EF8;
    id v29 = v16;
    id v30 = v19;
    id v31 = v14;
    id v32 = v17;
    id v33 = v22;
    id v23 = v22;
    id v24 = v19;
    id v26 = (id)objc_msgSend_performDatabaseOperation_(self, v25, (uint64_t)v28);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v27 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v38 = v7;
      _os_log_error_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_ERROR, "Couldn't find an operation with ID %{public}@ to set the result", buf, 0xCu);
    }
  }
}

- (void)archiveCallback:(id)a3 forOperationID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_cacheQueue(self, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4F64030;
  block[3] = &unk_1E64F0120;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_sync(v10, block);
}

- (void)registerAttemptForOperationWithID:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_cacheQueue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4F640F4;
  v9[3] = &unk_1E64F0948;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(v7, v9);
}

- (id)_locked_operationInfoForID:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = NSString;
  id v5 = a3;
  id v7 = objc_msgSend_stringWithFormat_(v4, v6, @"%@ = ?", @"operationID");
  v16[0] = v5;
  uint64_t v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v16, 1);

  id v11 = objc_msgSend_selectAllFrom_where_bindings_(self, v10, @"OperationInfo", v7, v9);

  id v14 = objc_msgSend_firstObject(v11, v12, v13);

  return v14;
}

- (void)registerCacheEvictionActivity
{
  id v5 = objc_msgSend_deviceContext(self, a2, v2);
  id v8 = objc_msgSend_testDeviceReference(v5, v6, v7);

  if (v8)
  {
    id v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, self, @"CKDOperationInfoCache.m", 489, @"Only the default device context may register for operation info cache eviction");
  }
  os_activity_t v13 = _os_activity_create(&dword_1C4CFF000, "operationInfoCacheEviction", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  CKRegisterRepeatingXPCActivity("com.apple.cloudkit.operationInfoCacheEviction", v13, *MEMORY[0x1E4F141E8], *MEMORY[0x1E4F14218], 0, &unk_1F2044450);
}

- (OS_dispatch_queue)cacheQueue
{
  return self->_cacheQueue;
}

- (void)setCacheQueue:(id)a3
{
}

- (OS_dispatch_queue)cacheDelegateQueue
{
  return self->_cacheDelegateQueue;
}

- (void)setCacheDelegateQueue:(id)a3
{
}

- (NSMutableDictionary)delegateWrappersByOperationID
{
  return self->_delegateWrappersByOperationID;
}

- (void)setDelegateWrappersByOperationID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateWrappersByOperationID, 0);
  objc_storeStrong((id *)&self->_cacheDelegateQueue, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

@end