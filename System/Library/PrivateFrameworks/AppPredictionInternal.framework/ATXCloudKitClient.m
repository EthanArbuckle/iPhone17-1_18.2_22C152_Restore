@interface ATXCloudKitClient
+ (ATXCloudKitClient)clientWithContainerIdentifier:(id)a3 useManatee:(BOOL)a4 callbackQueue:(id)a5;
- (ATXCloudKitClient)initWithContainerIdentifier:(id)a3 useManatee:(BOOL)a4 callbackQueue:(id)a5;
- (ATXCloudKitClient)initWithDatabase:(id)a3 inContainer:(id)a4 callbackQueue:(id)a5;
- (CKContainer)container;
- (CKDatabase)database;
- (OS_dispatch_queue)callbackQueue;
- (void)deleteRecordZone:(id)a3 completionHandler:(id)a4;
- (void)fetchAccountInfoWithCompletionHandler:(id)a3;
- (void)fetchCurrentDeviceIDWithCompletionHandler:(id)a3;
- (void)fetchRecordZone:(id)a3 completionHandler:(id)a4;
- (void)fetchRecords:(id)a3 inZone:(id)a4 completionHandler:(id)a5;
- (void)saveRecord:(id)a3 completionHandler:(id)a4;
- (void)saveRecordZone:(id)a3 completionHandler:(id)a4;
- (void)scheduleDatabaseOperation:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDatabase:(id)a3;
@end

@implementation ATXCloudKitClient

+ (ATXCloudKitClient)clientWithContainerIdentifier:(id)a3 useManatee:(BOOL)a4 callbackQueue:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithContainerIdentifier:v9 useManatee:v5 callbackQueue:v8];

  return (ATXCloudKitClient *)v10;
}

- (ATXCloudKitClient)initWithContainerIdentifier:(id)a3 useManatee:(BOOL)a4 callbackQueue:(id)a5
{
  BOOL v5 = a4;
  id v8 = (objc_class *)MEMORY[0x1E4F19ED8];
  id v9 = a5;
  id v10 = a3;
  v11 = (void *)[[v8 alloc] initWithContainerIdentifier:v10 environment:2];

  if (v5)
  {
    v12 = objc_opt_new();
    [v12 setMmcsEncryptionSupport:2];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v11 options:v12];
  }
  else
  {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v11];
  }
  v14 = [v13 privateCloudDatabase];
  v15 = [(ATXCloudKitClient *)self initWithDatabase:v14 inContainer:v13 callbackQueue:v9];

  return v15;
}

- (ATXCloudKitClient)initWithDatabase:(id)a3 inContainer:(id)a4 callbackQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXCloudKitClient;
  v12 = [(ATXCloudKitClient *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_container, a4);
    objc_storeStrong((id *)&v13->_database, a3);
    if (v11)
    {
      v14 = (OS_dispatch_queue *)v11;
      callbackQueue = v13->_callbackQueue;
      v13->_callbackQueue = v14;
    }
    else
    {
      callbackQueue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v16 = dispatch_queue_create("com.apple.duetexpertd.atxcloudkit", callbackQueue);
      v17 = v13->_callbackQueue;
      v13->_callbackQueue = (OS_dispatch_queue *)v16;
    }
  }

  return v13;
}

- (void)scheduleDatabaseOperation:(id)a3
{
  id v6 = a3;
  [v6 setQueuePriority:0];
  [v6 setQualityOfService:17];
  if (self->_callbackQueue)
  {
    objc_msgSend(v6, "setCallbackQueue:");
  }
  else
  {
    v4 = [v6 callbackQueue];
    [v6 setCallbackQueue:v4];
  }
  BOOL v5 = [v6 configuration];
  [v5 setTimeoutIntervalForResource:3600.0];

  [(CKDatabase *)self->_database addOperation:v6];
}

- (void)fetchCurrentDeviceIDWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ATXCloudKitClient *)self container];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__ATXCloudKitClient_fetchCurrentDeviceIDWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E68AB7A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchCurrentDeviceIDWithCompletionHandler:v7];
}

void __63__ATXCloudKitClient_fetchCurrentDeviceIDWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__ATXCloudKitClient_fetchCurrentDeviceIDWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E68AF660;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __63__ATXCloudKitClient_fetchCurrentDeviceIDWithCompletionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchAccountInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXCloudKitClient *)self container];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ATXCloudKitClient_fetchAccountInfoWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E68AF688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 accountInfoWithCompletionHandler:v7];
}

void __59__ATXCloudKitClient_fetchAccountInfoWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ATXCloudKitClient_fetchAccountInfoWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E68AF660;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __59__ATXCloudKitClient_fetchAccountInfoWithCompletionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchRecordZone:(id)a3 completionHandler:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1A090]);
  v19[0] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v10 = (void *)[v8 initWithRecordZoneIDs:v9];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __55__ATXCloudKitClient_fetchRecordZone_completionHandler___block_invoke;
  dispatch_queue_t v16 = &unk_1E68AF6B0;
  id v17 = v6;
  id v18 = v7;
  id v11 = v6;
  id v12 = v7;
  [v10 setFetchRecordZonesCompletionBlock:&v13];
  -[ATXCloudKitClient scheduleDatabaseOperation:](self, "scheduleDatabaseOperation:", v10, v13, v14, v15, v16);
}

void __55__ATXCloudKitClient_fetchRecordZone_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = a3;
  id v9 = [a2 objectForKeyedSubscript:v6];
  id v8 = [v7 CKItemErrorForID:*(void *)(a1 + 32)];

  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v9, v8);
}

- (void)saveRecordZone:(id)a3 completionHandler:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1A180]);
  v19[0] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v10 = (void *)[v8 initWithRecordZonesToSave:v9 recordZoneIDsToDelete:0];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __54__ATXCloudKitClient_saveRecordZone_completionHandler___block_invoke;
  dispatch_queue_t v16 = &unk_1E68AF6D8;
  id v17 = v6;
  id v18 = v7;
  id v11 = v6;
  id v12 = v7;
  [v10 setModifyRecordZonesCompletionBlock:&v13];
  -[ATXCloudKitClient scheduleDatabaseOperation:](self, "scheduleDatabaseOperation:", v10, v13, v14, v15, v16);
}

void __54__ATXCloudKitClient_saveRecordZone_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a4;
  id v10 = [a2 firstObject];
  id v8 = [*(id *)(a1 + 32) zoneID];
  id v9 = [v7 CKItemErrorForID:v8];

  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v10, v9);
}

- (void)deleteRecordZone:(id)a3 completionHandler:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 zoneID];
  id v8 = objc_alloc(MEMORY[0x1E4F1A180]);
  v19[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v10 = (void *)[v8 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v9];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __56__ATXCloudKitClient_deleteRecordZone_completionHandler___block_invoke;
  dispatch_queue_t v16 = &unk_1E68AF6D8;
  id v17 = v7;
  id v18 = v6;
  id v11 = v7;
  id v12 = v6;
  [v10 setModifyRecordZonesCompletionBlock:&v13];
  -[ATXCloudKitClient scheduleDatabaseOperation:](self, "scheduleDatabaseOperation:", v10, v13, v14, v15, v16);
}

void __56__ATXCloudKitClient_deleteRecordZone_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a4;
  id v9 = [a3 firstObject];
  id v8 = [v7 CKItemErrorForID:*(void *)(a1 + 32)];

  (*(void (**)(uint64_t, BOOL, void *))(v6 + 16))(v6, v9 != 0, v8);
}

- (void)fetchRecords:(id)a3 inZone:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1A2B8]) initWithQuery:v10];

  uint64_t v13 = [v9 zoneID];

  [v12 setZoneID:v13];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__ATXCloudKitClient_fetchRecords_inZone_completionHandler___block_invoke;
  v20[3] = &unk_1E68AF700;
  id v14 = v11;
  id v21 = v14;
  [v12 setRecordMatchedBlock:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__ATXCloudKitClient_fetchRecords_inZone_completionHandler___block_invoke_2;
  v17[3] = &unk_1E68AF728;
  id v18 = v14;
  id v19 = v8;
  id v15 = v14;
  id v16 = v8;
  [v12 setQueryCompletionBlock:v17];
  [(ATXCloudKitClient *)self scheduleDatabaseOperation:v12];
}

void __59__ATXCloudKitClient_fetchRecords_inZone_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    [*(id *)(a1 + 32) addObject:v7];
    objc_sync_exit(v9);
  }
}

uint64_t __59__ATXCloudKitClient_fetchRecords_inZone_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)saveRecord:(id)a3 completionHandler:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1A198]);
  v19[0] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v10 = (void *)[v8 initWithRecordsToSave:v9 recordIDsToDelete:0];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __50__ATXCloudKitClient_saveRecord_completionHandler___block_invoke;
  id v16 = &unk_1E68AF6D8;
  id v17 = v6;
  id v18 = v7;
  id v11 = v6;
  id v12 = v7;
  [v10 setModifyRecordsCompletionBlock:&v13];
  -[ATXCloudKitClient scheduleDatabaseOperation:](self, "scheduleDatabaseOperation:", v10, v13, v14, v15, v16);
}

void __50__ATXCloudKitClient_saveRecord_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a4;
  id v10 = [a2 firstObject];
  id v8 = [*(id *)(a1 + 32) recordID];
  id v9 = [v7 CKItemErrorForID:v8];

  (*(void (**)(uint64_t, BOOL, void *))(v6 + 16))(v6, v10 != 0, v9);
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end