@interface BRCUploadBatchOperation
- (BRCUploadBatchOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4 clientZone:(id)a5;
- (id)actionPrettyName;
- (id)createActivity;
- (id)perUploadCompletionBlock;
- (void)_publishUploadProgress:(id)a3;
- (void)_uploadRecordsByID:(id)a3;
- (void)addItem:(id)a3 stageID:(id)a4 record:(id)a5 transferSize:(unint64_t)a6;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)mainWithTransfers:(id)a3;
- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4;
- (void)setPerUploadCompletionBlock:(id)a3;
@end

@implementation BRCUploadBatchOperation

- (BRCUploadBatchOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4 clientZone:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 contextIdentifier];
  v12 = [@"upload" stringByAppendingPathComponent:v11];

  v13 = [v8 session];
  v14 = [v13 fsUploader];
  v15 = [v14 hasWorkGroup];

  v23.receiver = self;
  v23.super_class = (Class)BRCUploadBatchOperation;
  v16 = [(BRCTransferBatchOperation *)&v23 initWithName:v12 syncContext:v8 sessionContext:v10 group:v15];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_clientZone, a5);
    v17 = [(_BRCOperation *)v16 callbackQueue];
    v18 = [v8 session];
    v19 = [v18 fsUploader];
    v20 = [v19 uploadsDeadlineScheduler];
    v21 = [v20 workloop];
    dispatch_set_target_queue(v17, v21);
  }
  return v16;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "upload", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)addItem:(id)a3 stageID:(id)a4 record:(id)a5 transferSize:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[BRCUpload alloc] initWithDocument:v12 stageID:v11 transferSize:a6];

  [(BRCUpload *)v13 setRecord:v10];
  [(BRCTransferBatchOperation *)self addTransfer:v13];
}

- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BRCUploadBatchOperation *)self perUploadCompletionBlock];
  id v9 = [(BRCSyncContext *)self->super.super._syncContext session];
  id v10 = v9;
  if (v8)
  {
    id v11 = [v9 clientDB];
    id v12 = [v11 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__BRCUploadBatchOperation_sendTransferCompletionCallBack_error___block_invoke;
    block[3] = &unk_1E6996948;
    id v18 = v8;
    id v16 = v6;
    id v17 = v7;
    dispatch_sync(v12, block);

    v13 = v18;
  }
  else
  {
    v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 2112;
      v24 = v13;
      _os_log_error_impl(&dword_1D353B000, v14, (os_log_type_t)0x90u, "[ERROR] No per upload completion block for %@, error %@%@", buf, 0x20u);
    }
  }
}

uint64_t __64__BRCUploadBatchOperation_sendTransferCompletionCallBack_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_publishUploadProgress:(id)a3
{
  id v3 = a3;
  v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BRCUploadBatchOperation _publishUploadProgress:]();
  }

  id v6 = [v3 progress];
  objc_msgSend(v6, "brc_publish");

  id v7 = [v3 progress];
  objc_msgSend(v3, "setProgressPublished:", objc_msgSend(v7, "isPublished"));
}

- (void)mainWithTransfers:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[BRCTransferBatchOperation itemsCount](self, "itemsCount"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v11 = [v10 record];
        id v12 = [v10 record];
        v13 = [v12 recordID];
        [v5 setObject:v11 forKeyedSubscript:v13];

        [(BRCUploadBatchOperation *)self _publishUploadProgress:v10];
        v14 = [(BRCClientZone *)self->_clientZone session];
        v15 = [v14 analyticsReporter];
        id v16 = [v10 itemID];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke;
        v24[3] = &unk_1E6996B40;
        v24[4] = self;
        [v15 lookupFSEventToSyncUpEventByItemID:v16 accessor:v24];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  [(BRCUploadBatchOperation *)self hash];
  kdebug_trace();
  id v17 = [(BRCClientZone *)self->_clientZone serverZone];
  if ([v17 hasFetchedServerZoneState])
  {

LABEL_12:
    [(BRCUploadBatchOperation *)self _uploadRecordsByID:v5];
    goto LABEL_13;
  }
  BOOL v18 = [(BRCClientZone *)self->_clientZone isPrivateZone];

  if (!v18) {
    goto LABEL_12;
  }
  v19 = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
  id v20 = [(_BRCOperation *)self group];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke_2;
  v22[3] = &unk_1E69944C0;
  v22[4] = self;
  id v23 = v5;
  [v19 createCloudKitZoneWithGroup:v20 completion:v22];

LABEL_13:
}

uint64_t __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) associateCKOperationsToEventMetric:a2];
}

uint64_t __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 completedWithResult:0 error:a2];
  }
  else {
    return [v3 _uploadRecordsByID:*(void *)(a1 + 40)];
  }
}

- (void)_uploadRecordsByID:(id)a3
{
  id v4 = a3;
  v5 = [(BRCSyncContext *)self->super.super._syncContext session];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__18;
  v22[4] = __Block_byref_object_dispose__18;
  id v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__18;
  v20[4] = __Block_byref_object_dispose__18;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = objc_alloc(MEMORY[0x1E4F1A198]);
  uint64_t v7 = [v4 allValues];
  uint64_t v8 = (void *)[v6 initWithRecordsToSave:v7 recordIDsToDelete:0];

  [v8 setShouldOnlySaveAssetContent:1];
  id v9 = [(_BRCOperation *)self callbackQueue];
  [v8 setCallbackQueue:v9];

  [v8 setSavePolicy:0];
  [v8 setAtomic:0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke;
  v19[3] = &unk_1E6996B68;
  v19[4] = self;
  [v8 setPerRecordProgressBlock:v19];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_103;
  v13[3] = &unk_1E6996B90;
  id v10 = v5;
  id v14 = v10;
  id v17 = v22;
  BOOL v18 = v20;
  id v11 = v4;
  id v15 = v11;
  id v16 = self;
  [v8 setPerRecordCompletionBlock:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_105;
  v12[3] = &unk_1E6996BB8;
  v12[4] = self;
  v12[5] = v22;
  v12[6] = v20;
  [v8 setModifyRecordsCompletionBlock:v12];
  [(_BRCOperation *)self addSubOperation:v8];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke(uint64_t a1, void *a2, double a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3 < 0.0)
  {
    id v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218242;
      double v11 = a3;
      __int16 v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Upload: Received negative progress from CK. progress [%f]%@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = [v5 recordID];
  [v8 setProgress:v9 forRecordID:a3];
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_103(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1D9438760]();
  uint64_t v8 = [v5 recordID];
  id v9 = [v8 zoneID];

  int v10 = (void *)a1[4];
  double v11 = [v9 zoneName];
  __int16 v12 = [v9 ownerName];
  v13 = [v10 serverZoneByName:v11 ownerName:v12];

  if (v6 && [v13 shouldRecreateServerZoneAfterError:v6])
  {
    uint64_t v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_103_cold_1(v5, (uint64_t)v14, v15);
    }

    id v16 = [v5 recordID];
    uint64_t v17 = [v16 zoneID];
    uint64_t v18 = *(void *)(a1[7] + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    id v20 = (void *)a1[5];
    id v21 = [v5 recordID];
    id v22 = [v20 objectForKeyedSubscript:v21];
    id v23 = *(void **)(*(void *)(a1[8] + 8) + 40);
    v24 = [v5 recordID];
    [v23 setObject:v22 forKeyedSubscript:v24];
  }
  else
  {
    long long v25 = (void *)a1[6];
    long long v26 = [v5 recordID];
    [v25 finishedTransferForRecord:v5 recordID:v26 error:v6];
  }
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_105(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = v9;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if (!v9)
    {
      v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_105_cold_1((uint64_t)v13, v14);
      }
    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    double v11 = [*(id *)(*(void *)(a1 + 32) + 576) asPrivateClientZone];
    __int16 v12 = [*(id *)(a1 + 32) group];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_106;
    v15[3] = &unk_1E69959E0;
    objc_copyWeak(&v16, &location);
    v15[4] = *(void *)(a1 + 48);
    [v11 createCloudKitZoneWithGroup:v12 completion:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    [*(id *)(a1 + 32) completedWithResult:0 error:v9];
  }
  [*(id *)(a1 + 32) hash];
  kdebug_trace();
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_106(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v3)
  {
    [WeakRetained completedWithResult:0 error:v3];
  }
  else
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_106_cold_1((uint64_t)v6, v7);
    }

    [v5 _uploadRecordsByID:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  }
}

- (id)actionPrettyName
{
  return @"uploading";
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BRCUploadBatchOperation;
  [(BRCTransferBatchOperation *)&v5 finishWithResult:a3 error:a4];
  [(BRCUploadBatchOperation *)self setPerUploadCompletionBlock:0];
}

- (id)perUploadCompletionBlock
{
  return objc_getProperty(self, a2, 584, 1);
}

- (void)setPerUploadCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_perUploadCompletionBlock, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

- (void)_publishUploadProgress:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_1D353B000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] Publishing upload progress for %@%@", v2, 0x16u);
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_103_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [a1 recordID];
  OUTLINED_FUNCTION_2_1();
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring zone not found error for %@ - we'll create at the end of the operation%@", v6, 0x16u);
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_105_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: modifyError%@", (uint8_t *)&v2, 0xCu);
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_106_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] zone was recreated, reuploading records%@", (uint8_t *)&v2, 0xCu);
}

@end