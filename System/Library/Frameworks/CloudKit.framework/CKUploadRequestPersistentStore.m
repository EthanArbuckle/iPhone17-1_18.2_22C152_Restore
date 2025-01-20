@interface CKUploadRequestPersistentStore
+ (id)repairRecordToMetadata:(id)a3;
- (BOOL)firstInvocation;
- (CKUploadRequestPersistentStore)initWithDatabaseURL:(id)a3;
- (NSURL)databaseURL;
- (OS_dispatch_queue)stateQueue;
- (id)allData;
- (id)assetRepairMetadata;
- (id)currentUser;
- (id)delayedSyncDateForRecord:(id)a3;
- (id)delayedSyncRecordNamesAfterDate:(id)a3;
- (id)delayedSyncRecordNamesBeforeAndIncludingDate:(id)a3;
- (id)earliestDelayedSyncDateAfterDate:(id)a3;
- (id)lastFetchDate;
- (id)metadataForRecordName:(id)a3;
- (id)packageRepairMetadata;
- (id)sortedDelayedSyncRecordsForDatabase:(id)a3;
- (id)syncEngineMetadata;
- (id)unarchivedObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5;
- (int64_t)delayedSyncCountForRecordName:(id)a3;
- (void)clearDatabase;
- (void)clearDelayedSyncRecords;
- (void)clearRepairRecords;
- (void)deleteDatabase;
- (void)deleteDelayedSyncForRecordName:(id)a3;
- (void)deleteRepairRecord:(id)a3;
- (void)markRecordNameUnrecoverable:(id)a3;
- (void)persistDelayedSyncForRecordName:(id)a3 withDate:(id)a4 increasingCount:(BOOL)a5;
- (void)persistRepairRecord:(id)a3;
- (void)persistSyncEngineMetadata:(id)a3;
- (void)readDatabase:(id)a3 async:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)readWriteDatabase:(id)a3 async:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)setCurrentUser:(id)a3;
- (void)setFirstInvocation:(BOOL)a3;
- (void)setLastFetchDate:(id)a3;
@end

@implementation CKUploadRequestPersistentStore

- (CKUploadRequestPersistentStore)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKUploadRequestPersistentStore;
  v8 = [(CKUploadRequestPersistentStore *)&v15 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    v10 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v9;

    v8[8] = 1;
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.cloudkit.uploadrequest.database", v11);
    v13 = (void *)*((void *)v8 + 3);
    *((void *)v8 + 3) = v12;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v8 + 3), v8 + 24, (void *)1, 0);
  }

  return (CKUploadRequestPersistentStore *)v8;
}

- (id)lastFetchDate
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_18AF13A78;
  uint64_t v9 = sub_18AF13818;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_18B00C714;
  v4[3] = &unk_1E54601A8;
  v4[4] = &v5;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, a2, (uint64_t)v4, 0, &unk_1ED7EEE58);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)currentUser
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_18AF13A78;
  uint64_t v9 = sub_18AF13818;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_18B00C958;
  v4[3] = &unk_1E54601F0;
  v4[4] = self;
  void v4[5] = &v5;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, a2, (uint64_t)v4, 0, &unk_1ED7EFA38);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)assetRepairMetadata
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  dispatch_queue_t v12 = sub_18AF13A78;
  v13 = sub_18AF13818;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B00CD40;
  v8[3] = &unk_1E54601F0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, a2, (uint64_t)v8, 0, &unk_1ED7EFBD8);
  id v2 = (void *)v10[5];
  if (!v2)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v3 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_error_impl(&dword_18AF10000, v3, OS_LOG_TYPE_ERROR, "Failed to get asset repair metadata, return data is inexplicably nil", v7, 2u);
    }
    id v4 = (void *)v10[5];
    v10[5] = MEMORY[0x1E4F1CBF0];

    id v2 = (void *)v10[5];
  }
  id v5 = v2;
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)packageRepairMetadata
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  dispatch_queue_t v12 = sub_18AF13A78;
  v13 = sub_18AF13818;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B00D300;
  v8[3] = &unk_1E54601F0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, a2, (uint64_t)v8, 0, &unk_1ED7EFCF8);
  id v2 = (void *)v10[5];
  if (!v2)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v3 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_error_impl(&dword_18AF10000, v3, OS_LOG_TYPE_ERROR, "Failed to get package repair metadata, return data is inexplicably nil", v7, 2u);
    }
    id v4 = (void *)v10[5];
    v10[5] = MEMORY[0x1E4F1CBF0];

    id v2 = (void *)v10[5];
  }
  id v5 = v2;
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)metadataForRecordName:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_18AF13A78;
  v19 = sub_18AF13818;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B00D820;
  v11[3] = &unk_1E5460218;
  id v12 = v4;
  v13 = self;
  id v14 = &v15;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B00DA74;
  v9[3] = &unk_1E5460240;
  id v5 = v12;
  id v10 = v5;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v11, 0, v9);
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v7;
}

- (id)sortedDelayedSyncRecordsForDatabase:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"Scheduler", v5);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_18B00DCF4;
  v31[3] = &unk_1E5460268;
  id v7 = v3;
  id v32 = v7;
  id v10 = objc_msgSend_CKFilter_(v6, v8, (uint64_t)v31, v9);

  id v14 = objc_msgSend_allKeys(v10, v11, v12, v13);
  v18 = objc_msgSend_mutableCopy(v14, v15, v16, v17);
  v22 = v18;
  if (v18)
  {
    id v23 = v18;
  }
  else
  {
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v19, v20, v21);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_18B00DD64;
  v29[3] = &unk_1E5460290;
  id v30 = v10;
  id v25 = v10;
  objc_msgSend_sortUsingComparator_(v24, v26, (uint64_t)v29, v27);

  return v24;
}

- (id)delayedSyncRecordNamesBeforeAndIncludingDate:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_18AF13A78;
  uint64_t v20 = sub_18AF13818;
  id v21 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B00DFB8;
  v13[3] = &unk_1E5460218;
  v13[4] = self;
  id v5 = v4;
  id v14 = v5;
  uint64_t v15 = &v16;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v13, 0, &unk_1ED7EFEB8);
  id v7 = (void *)v17[5];
  if (!v7)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v8 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_error_impl(&dword_18AF10000, v8, OS_LOG_TYPE_ERROR, "Failed to get record names, return array is inexplicably nil", v12, 2u);
    }
    uint64_t v9 = (void *)v17[5];
    v17[5] = MEMORY[0x1E4F1CBF0];

    id v7 = (void *)v17[5];
  }
  id v10 = v7;

  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)delayedSyncRecordNamesAfterDate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_18AF13A78;
  uint64_t v16 = sub_18AF13818;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B00E2E8;
  v9[3] = &unk_1E5460218;
  void v9[4] = self;
  id v5 = v4;
  id v10 = v5;
  uint64_t v11 = &v12;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v9, 0, &unk_1ED7EFF38);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)earliestDelayedSyncDateAfterDate:(id)a3
{
  id v5 = objc_msgSend_delayedSyncRecordNamesAfterDate_(self, a2, (uint64_t)a3, v3);
  uint64_t v9 = v5;
  if (v5)
  {
    id v10 = objc_msgSend_firstObject(v5, v6, v7, v8);
    uint64_t v13 = objc_msgSend_delayedSyncDateForRecord_(self, v11, (uint64_t)v10, v12);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)delayedSyncDateForRecord:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_18AF13A78;
  uint64_t v16 = sub_18AF13818;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B00E69C;
  v9[3] = &unk_1E54601F0;
  id v5 = v4;
  id v10 = v5;
  uint64_t v11 = &v12;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v9, 0, &unk_1ED7EFF98);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (int64_t)delayedSyncCountForRecordName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B00E928;
  v9[3] = &unk_1E54601F0;
  id v5 = v4;
  id v10 = v5;
  uint64_t v11 = &v12;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v9, 0, &unk_1ED7F0058);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)syncEngineMetadata
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_18AF13A78;
  uint64_t v9 = sub_18AF13818;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_18B00EBD4;
  v4[3] = &unk_1E54601A8;
  v4[4] = &v5;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, a2, (uint64_t)v4, 0, &unk_1ED7F0138);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)setLastFetchDate:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B00EDAC;
  v7[3] = &unk_1E54602B8;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v7, 0, &unk_1ED7F01F8);
}

- (void)setCurrentUser:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B00EF80;
  v7[3] = &unk_1E54602B8;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v7, 0, &unk_1ED7F0318);
}

- (void)persistRepairRecord:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B00F2BC;
  v9[3] = &unk_1E54602E0;
  id v10 = v4;
  uint64_t v11 = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B00F6E0;
  v7[3] = &unk_1E5460240;
  id v8 = v10;
  id v5 = v10;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v9, 0, v7);
}

- (void)deleteRepairRecord:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B00F8F0;
  v9[3] = &unk_1E54602B8;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B00FD04;
  v7[3] = &unk_1E5460240;
  id v8 = v10;
  id v5 = v10;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v9, 0, v7);
}

- (void)clearRepairRecords
{
}

- (void)persistDelayedSyncForRecordName:(id)a3 withDate:(id)a4 increasingCount:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B0100C8;
  v15[3] = &unk_1E5460328;
  id v16 = v8;
  id v17 = v9;
  BOOL v18 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B010344;
  v13[3] = &unk_1E5460240;
  id v14 = v16;
  id v10 = v16;
  id v11 = v9;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v12, (uint64_t)v15, 0, v13);
}

- (void)deleteDelayedSyncForRecordName:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B010534;
  v9[3] = &unk_1E54602B8;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B010730;
  v7[3] = &unk_1E5460240;
  id v8 = v10;
  id v5 = v10;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v9, 0, v7);
}

- (void)clearDelayedSyncRecords
{
}

- (void)markRecordNameUnrecoverable:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B010A7C;
  v9[3] = &unk_1E54602B8;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B010B38;
  v7[3] = &unk_1E5460240;
  id v8 = v10;
  id v5 = v10;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v9, 0, v7);
}

- (void)persistSyncEngineMetadata:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B010CD8;
  v7[3] = &unk_1E54602B8;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v6, (uint64_t)v7, 0, &unk_1ED7F0638);
}

- (void)clearDatabase
{
}

- (void)deleteDatabase
{
  id v5 = objc_msgSend_stateQueue(self, a2, v2, v3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B01101C;
  block[3] = &unk_1E5460350;
  block[4] = self;
  dispatch_sync(v5, block);
}

- (void)readDatabase:(id)a3 async:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B011230;
  v11[3] = &unk_1E5460378;
  id v12 = v8;
  id v9 = v8;
  objc_msgSend_readWriteDatabase_async_withCompletionHandler_(self, v10, (uint64_t)v11, v6, a5);
}

- (id)unarchivedObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5
{
  v13[6] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a4;
  v13[0] = 0;
  id v9 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(MEMORY[0x1E4F28DC0], v8, (uint64_t)a3, (uint64_t)v7, v13);
  id v10 = v13[0];
  id v11 = v10;
  if (a5) {
    *a5 = v10;
  }

  return v9;
}

- (void)readWriteDatabase:(id)a3 async:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v12 = a5;
  if (v6) {
    uint64_t v13 = (void (*)(void *, void *))MEMORY[0x1E4F14768];
  }
  else {
    uint64_t v13 = (void (*)(void *, void *))MEMORY[0x1E4F147E8];
  }
  id v14 = objc_msgSend_stateQueue(self, v9, v10, v11);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_18B0115E0;
  v17[3] = &unk_1E54603A0;
  v17[4] = self;
  id v18 = v12;
  id v19 = v8;
  id v15 = v8;
  id v16 = v12;
  v13(v14, v17);
}

+ (id)repairRecordToMetadata:(id)a3
{
  id v3 = a3;
  id v7 = objc_msgSend_recordType(v3, v4, v5, v6);
  int isEqualToString = objc_msgSend_isEqualToString_(v7, v8, @"MissingAsset", v9);

  if (isEqualToString)
  {
    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v3, v11, @"zone", v13);
    uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v3, v15, @"affectedRecordID", v16);
    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v3, v18, @"affectedRecordType", v19);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v3, v21, @"fieldName", v22);
    uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v3, v24, @"fileSignature", v25);
    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v3, v27, @"referenceSignature", v28);
    id v32 = objc_msgSend_objectForKeyedSubscript_(v3, v30, @"listIndex", v31);
    v33 = [CKRecordZoneID alloc];
    v89 = (void *)v14;
    v35 = objc_msgSend_initWithZoneName_ownerName_(v33, v34, v14, @"__defaultOwner__");
    v36 = [CKRecordID alloc];
    v88 = (void *)v17;
    v38 = objc_msgSend_initWithRecordName_zoneID_(v36, v37, v17, (uint64_t)v35);
    v39 = [CKAssetUploadRequestMetadata alloc];
    v46 = objc_msgSend_recordID(v3, v40, v41, v42);
    v90 = (void *)v29;
    if (v32)
    {
      uint64_t v47 = objc_msgSend_integerValue(v32, v43, v44, v45);
      uint64_t v86 = v29;
      v48 = (void *)v20;
      uint64_t v49 = v20;
      v50 = (void *)v26;
      uint64_t v52 = objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignature_referenceSignature_listIndex_(v39, v51, (uint64_t)v46, 2, v38, v49, v23, v26, v86, v47);
    }
    else
    {
      uint64_t v87 = v29;
      v48 = (void *)v20;
      uint64_t v84 = v20;
      v50 = (void *)v26;
      uint64_t v52 = objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignature_referenceSignature_(v39, v43, (uint64_t)v46, 2, v38, v84, v23, v26, v87);
    }
    v83 = (void *)v52;
    v67 = (void *)v23;

    v76 = v88;
    v73 = v89;
  }
  else
  {
    v53 = objc_msgSend_recordType(v3, v11, v12, v13);
    int v56 = objc_msgSend_isEqualToString_(v53, v54, @"MissingPackage", v55);

    if (!v56)
    {
      v83 = 0;
      goto LABEL_10;
    }
    uint64_t v59 = objc_msgSend_objectForKeyedSubscript_(v3, v57, @"zone", v58);
    uint64_t v62 = objc_msgSend_objectForKeyedSubscript_(v3, v60, @"affectedRecordID", v61);
    v48 = objc_msgSend_objectForKeyedSubscript_(v3, v63, @"affectedRecordType", v64);
    v67 = objc_msgSend_objectForKeyedSubscript_(v3, v65, @"fieldName", v66);
    v50 = objc_msgSend_objectForKeyedSubscript_(v3, v68, @"fileSignature", v69);
    v90 = objc_msgSend_objectForKeyedSubscript_(v3, v70, @"referenceSignature", v71);
    v72 = [CKRecordZoneID alloc];
    v73 = (void *)v59;
    id v32 = objc_msgSend_initWithZoneName_ownerName_(v72, v74, v59, @"__defaultOwner__");
    v75 = [CKRecordID alloc];
    v76 = (void *)v62;
    v35 = objc_msgSend_initWithRecordName_zoneID_(v75, v77, v62, (uint64_t)v32);
    v78 = [CKPackageUploadRequestMetadata alloc];
    v38 = objc_msgSend_recordID(v3, v79, v80, v81);
    v83 = objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignatures_referenceSignatures_(v78, v82, (uint64_t)v38, 2, v35, v48, v67, v50, v90);
  }

LABEL_10:

  return v83;
}

- (id)allData
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_18AF13A78;
  uint64_t v13 = sub_18AF13818;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B011FF4;
  v8[3] = &unk_1E54601A8;
  v8[4] = &v9;
  objc_msgSend_readDatabase_async_withCompletionHandler_(self, a2, (uint64_t)v8, 0, &unk_1ED7EF838);
  uint64_t v2 = (void *)v10[5];
  if (!v2)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v3 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl(&dword_18AF10000, v3, OS_LOG_TYPE_ERROR, "Data is inexplicably nil", v7, 2u);
    }
    id v4 = (void *)v10[5];
    v10[5] = MEMORY[0x1E4F1CC08];

    uint64_t v2 = (void *)v10[5];
  }
  id v5 = v2;
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (BOOL)firstInvocation
{
  return self->_firstInvocation;
}

- (void)setFirstInvocation:(BOOL)a3
{
  self->_firstInvocation = a3;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);

  objc_storeStrong((id *)&self->_databaseURL, 0);
}

@end