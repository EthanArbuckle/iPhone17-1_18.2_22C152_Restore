@interface GTBulkDataService
- (BOOL)uploadChunk:(id)a3 forHandle:(unint64_t)a4 isFinalChunk:(BOOL)a5 error:(id *)a6;
- (GTBulkDataService)init;
- (GTBulkDataService)initWithDownloadHighWaterMark:(unint64_t)a3;
- (id)takeDownloadDataForHandle:(unint64_t)a3;
- (id)takeUploadedDataForHandle:(unint64_t)a3;
- (unint64_t)handoverDataForDownload:(id)a3;
- (unint64_t)newUploadWithDescriptor:(id)a3 error:(id *)a4;
- (void)downloadData:(unint64_t)a3 usingTransferOptions:(id)a4 chunkHandler:(id)a5;
- (void)waitUntilDownloadCapacity;
@end

@implementation GTBulkDataService

- (GTBulkDataService)init
{
  return [(GTBulkDataService *)self initWithDownloadHighWaterMark:52428800];
}

- (GTBulkDataService)initWithDownloadHighWaterMark:(unint64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)GTBulkDataService;
  v4 = [(GTBulkDataService *)&v22 init];
  if (v4)
  {
    os_log_t v5 = os_log_create("com.apple.gputools.transport", "BulkData");
    log = v4->_log;
    v4->_log = (OS_os_log *)v5;

    v4->_nextDownloadHandle = 1;
    v4->_nextUploadHandle = 1;
    uint64_t v7 = objc_opt_new();
    dataDownloadStore = v4->_dataDownloadStore;
    v4->_dataDownloadStore = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    dataUploadingStore = v4->_dataUploadingStore;
    v4->_dataUploadingStore = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    dataUploadedStore = v4->_dataUploadedStore;
    v4->_dataUploadedStore = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    dataUploadCompressionAlgorithm = v4->_dataUploadCompressionAlgorithm;
    v4->_dataUploadCompressionAlgorithm = (NSMutableDictionary *)v13;

    v4->_downloadHighWaterMarkBytes = a3;
    v4->_downloadStoreBytes = 0;
    v4->_downloadTransmitState = 1;
    dispatch_group_t v15 = dispatch_group_create();
    downloadTransmitOff = v4->_downloadTransmitOff;
    v4->_downloadTransmitOff = (OS_dispatch_group *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.gputools.bulk-data.access", 0);
    dataAccessQueue = v4->_dataAccessQueue;
    v4->_dataAccessQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.gputools.bulk-data.transfer", 0);
    dataTransferQueue = v4->_dataTransferQueue;
    v4->_dataTransferQueue = (OS_dispatch_queue *)v19;
  }
  return v4;
}

- (void)waitUntilDownloadCapacity
{
}

- (id)takeDownloadDataForHandle:(unint64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  dataAccessQueue = self->_dataAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__GTBulkDataService_takeDownloadDataForHandle___block_invoke;
  block[3] = &unk_264E28868;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dataAccessQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __47__GTBulkDataService_takeDownloadDataForHandle___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 24);
  v3 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void **)(a1[4] + 24);
  v8 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  [v7 removeObjectForKey:v8];

  *(void *)(a1[4] + 40) -= [*(id *)(*(void *)(a1[5] + 8) + 40) length];
  uint64_t v9 = a1[4];
  if (!*(unsigned char *)(v9 + 48) && *(void *)(v9 + 40) <= *(void *)(v9 + 32))
  {
    *(unsigned char *)(v9 + 48) = 1;
    v10 = *(NSObject **)(a1[4] + 56);
    dispatch_group_leave(v10);
  }
}

- (void)downloadData:(unint64_t)a3 usingTransferOptions:(id)a4 chunkHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dataTransferQueue = self->_dataTransferQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke;
  v13[3] = &unk_264E28890;
  id v14 = v8;
  dispatch_group_t v15 = self;
  id v16 = v9;
  unint64_t v17 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dataTransferQueue, v13);
}

void __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke(uint64_t a1)
{
  v52[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x23ECD9F60]();
  v3 = (id *)(a1 + 32);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = v4;
  if (!v4 || ![v4 chunkSize])
  {

    goto LABEL_13;
  }
  unint64_t v6 = [v5 compressionAlgorithm];

  if (v6 >= 5)
  {
LABEL_13:
    dispatch_queue_t v19 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke_cold_1(a1 + 32, v19, v20, v21, v22, v23, v24, v25);
    }
    v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v51 = *MEMORY[0x263F08320];
    v27 = NSString;
    v28 = [*(id *)(a1 + 32) debugDescription];
    v29 = [v27 stringWithFormat:@"Invalid options sent to downloadData: %@", v28];
    v52[0] = v29;
    v30 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
    v10 = [v26 errorWithDomain:@"com.apple.gputools.bulkdataservice" code:0 userInfo:v30];

    goto LABEL_16;
  }
  uint64_t v7 = [*(id *)(a1 + 40) takeDownloadDataForHandle:*(void *)(a1 + 56)];
  if (!v7)
  {
    v31 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke_cold_2(a1 + 56, v31, v32, v33, v34, v35, v36, v37);
    }
    v38 = (void *)MEMORY[0x263F087E8];
    uint64_t v49 = *MEMORY[0x263F08320];
    v39 = objc_msgSend(NSString, "stringWithFormat:", @"Handle (%lld) has no data associated to it", *(void *)(a1 + 56));
    v50 = v39;
    v40 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    v10 = [v38 errorWithDomain:@"com.apple.gputools.bulkdataservice" code:2 userInfo:v40];

LABEL_16:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_17;
  }
  id v8 = (void *)v7;
  [*v3 compressionAlgorithm];
  uint64_t v9 = [*v3 compressionAlgorithm];
  id v48 = 0;
  v10 = GTBulkDataCompress(v8, v9, &v48);
  id v11 = v48;

  if (v10)
  {
    [*v3 compressionAlgorithm];
    if ([v10 length])
    {
      unint64_t v12 = 0;
      do
      {
        uint64_t v13 = (void *)MEMORY[0x23ECD9F60]();
        unint64_t v14 = [*(id *)(a1 + 32) chunkSize];
        uint64_t v15 = [v10 length];
        if (v14 >= v15 - v12) {
          unint64_t v14 = v15 - v12;
        }
        id v16 = (void *)MEMORY[0x263EFF8F8];
        id v17 = v10;
        v18 = objc_msgSend(v16, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v17, "bytes") + v12, v14, 0);
        [v17 length];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        v12 += [*(id *)(a1 + 32) chunkSize];
      }
      while (v12 < [v17 length]);
    }
  }
  else
  {
    v41 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke_cold_3((uint64_t)v11, v41, v42, v43, v44, v45, v46, v47);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

LABEL_17:
}

- (unint64_t)handoverDataForDownload:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  dataAccessQueue = self->_dataAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__GTBulkDataService_handoverDataForDownload___block_invoke;
  block[3] = &unk_264E288B8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dataAccessQueue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__GTBulkDataService_handoverDataForDownload___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v2 + 16) = v3 + 1;
  *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  uint64_t v4 = a1[5];
  uint64_t v5 = *(void **)(a1[4] + 24);
  id v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1[6] + 8) + 24)];
  [v5 setObject:v4 forKeyedSubscript:v6];

  *(void *)(a1[4] + 40) += [(id)a1[5] length];
  uint64_t v7 = a1[4];
  if (*(unsigned char *)(v7 + 48) && *(void *)(v7 + 40) > *(void *)(v7 + 32))
  {
    *(unsigned char *)(v7 + 48) = 0;
    id v8 = *(NSObject **)(a1[4] + 56);
    dispatch_group_enter(v8);
  }
}

- (unint64_t)newUploadWithDescriptor:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6 && (unint64_t)[v6 compressionAlgorithm] < 5)
  {
    uint64_t v18 = 0;
    dispatch_queue_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    dataAccessQueue = self->_dataAccessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__GTBulkDataService_newUploadWithDescriptor_error___block_invoke;
    block[3] = &unk_264E288B8;
    id v17 = &v18;
    block[4] = self;
    id v16 = v7;
    dispatch_sync(dataAccessQueue, block);
    a4 = (id *)v19[3];

    _Block_object_dispose(&v18, 8);
  }
  else if (a4)
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08320];
    id v10 = NSString;
    id v11 = [v7 debugDescription];
    uint64_t v12 = [v10 stringWithFormat:@"Invalid upload descriptor: %@", v11];
    v23[0] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    *a4 = [v9 errorWithDomain:@"com.apple.gputools.bulkdataservice" code:1 userInfo:v13];

    a4 = 0;
  }

  return (unint64_t)a4;
}

void __51__GTBulkDataService_newUploadWithDescriptor_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 64);
  *(void *)(v2 + 64) = v3 + 1;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  if ([*(id *)(a1 + 40) sizeHint]) {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "sizeHint"));
  }
  else {
    uint64_t v4 = objc_opt_new();
  }
  uint64_t v5 = (void *)v4;
  id v6 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [v6 setObject:v5 forKeyedSubscript:v7];

  objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "compressionAlgorithm"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = *(void **)(*(void *)(a1 + 32) + 88);
  uint64_t v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [v8 setObject:v10 forKeyedSubscript:v9];
}

- (BOOL)uploadChunk:(id)a3 forHandle:(unint64_t)a4 isFinalChunk:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  dataAccessQueue = self->_dataAccessQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__GTBulkDataService_uploadChunk_forHandle_isFinalChunk_error___block_invoke;
  v15[3] = &unk_264E288E0;
  unint64_t v18 = a4;
  dispatch_queue_t v19 = a6;
  v15[4] = self;
  id v16 = v10;
  BOOL v20 = a5;
  id v17 = &v21;
  id v12 = v10;
  dispatch_sync(dataAccessQueue, v15);
  char v13 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __62__GTBulkDataService_uploadChunk_forHandle_isFinalChunk_error___block_invoke(uint64_t a1)
{
  v29[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 56;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    [v5 appendData:*(void *)(a1 + 40)];
    if (!*(unsigned char *)(a1 + 72))
    {
LABEL_5:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_10;
    }
    id v6 = *(void **)(*(void *)(a1 + 32) + 72);
    uint64_t v7 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
    [v6 removeObjectForKey:v7];

    id v8 = *(void **)(*(void *)(a1 + 32) + 88);
    uint64_t v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
    id v10 = [v8 objectForKeyedSubscript:v9];
    uint64_t v11 = [v10 integerValue];

    id v12 = *(void **)(*(void *)(a1 + 32) + 88);
    char v13 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
    [v12 removeObjectForKey:v13];

    uint64_t v14 = GTBulkDataDecompress(v5, v11, *(void **)(a1 + 64));
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      id v16 = *(void **)(*(void *)(a1 + 32) + 80);
      id v17 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
      [v16 setObject:v15 forKeyedSubscript:v17];

      goto LABEL_5;
    }
  }
  else
  {
    unint64_t v18 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __62__GTBulkDataService_uploadChunk_forHandle_isFinalChunk_error___block_invoke_cold_1(v2, v18, v19, v20, v21, v22, v23, v24);
    }
    if (*(void *)(a1 + 64))
    {
      uint64_t v25 = (void *)MEMORY[0x263F087E8];
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"Handle (%lld) has no data associated to it", *(void *)(a1 + 56), *MEMORY[0x263F08320]);
      v29[0] = v26;
      v27 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
      **(void **)(a1 + 64) = [v25 errorWithDomain:@"com.apple.gputools.bulkdataservice" code:2 userInfo:v27];
    }
  }
LABEL_10:
}

- (id)takeUploadedDataForHandle:(unint64_t)a3
{
  uint64_t v17 = 0;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  dataAccessQueue = self->_dataAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__GTBulkDataService_takeUploadedDataForHandle___block_invoke;
  block[3] = &unk_264E28868;
  block[4] = self;
  void block[5] = &v17;
  block[6] = a3;
  dispatch_sync(dataAccessQueue, block);
  id v6 = (void *)v18[5];
  if (!v6)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[GTBulkDataService takeUploadedDataForHandle:](a3, log, v8, v9, v10, v11, v12, v13);
    }
    id v6 = (void *)v18[5];
  }
  id v14 = v6;
  _Block_object_dispose(&v17, 8);

  return v14;
}

void __47__GTBulkDataService_takeUploadedDataForHandle___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 80);
  uint64_t v3 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void **)(a1[4] + 80);
  id v8 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  [v7 removeObjectForKey:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTransferQueue, 0);
  objc_storeStrong((id *)&self->_dataAccessQueue, 0);
  objc_storeStrong((id *)&self->_dataUploadCompressionAlgorithm, 0);
  objc_storeStrong((id *)&self->_dataUploadedStore, 0);
  objc_storeStrong((id *)&self->_dataUploadingStore, 0);
  objc_storeStrong((id *)&self->_downloadTransmitOff, 0);
  objc_storeStrong((id *)&self->_dataDownloadStore, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __62__GTBulkDataService_uploadChunk_forHandle_isFinalChunk_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)takeUploadedDataForHandle:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end