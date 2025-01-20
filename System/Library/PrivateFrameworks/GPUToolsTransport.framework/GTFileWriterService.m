@interface GTFileWriterService
- (BOOL)_finishSession:(unint64_t)a3 error:(id *)a4;
- (GTFileWriterService)initWithConnectionProvider:(id)a3 deviceUDID:(id)a4 urlAccessProvider:(id)a5;
- (void)beginTransferSessionWithFileEntries:(id)a3 basePath:(id)a4 toDevice:(id)a5 options:(id)a6 sessionID:(unint64_t)a7 completionHandler:(id)a8;
- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 toURL:(id)a6 options:(id)a7 completionHandler:(id)a8;
- (void)startTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)writeFileData:(id)a3 sessionID:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation GTFileWriterService

- (GTFileWriterService)initWithConnectionProvider:(id)a3 deviceUDID:(id)a4 urlAccessProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)GTFileWriterService;
  v12 = [(GTFileWriterService *)&v24 init];
  if (v12)
  {
    v13 = NSTemporaryDirectory();
    DeleteAllArchives(v13);

    v14 = GTTransportArchiveDirectory();
    DeleteAllArchives(v14);

    os_log_t v15 = os_log_create("com.apple.gputools.transport", "FileWriterService");
    log = v12->_log;
    v12->_log = (OS_os_log *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    sessions = v12->_sessions;
    v12->_sessions = v17;

    objc_storeStrong((id *)&v12->_connectionProvider, a3);
    objc_storeStrong((id *)&v12->_deviceUDID, a4);
    objc_storeStrong((id *)&v12->_urlAccessProvider, a5);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.gputools.filetransfer", 0);
    fileTransferQueue = v12->_fileTransferQueue;
    v12->_fileTransferQueue = (OS_dispatch_queue *)v19;

    dispatch_semaphore_t v21 = dispatch_semaphore_create(1);
    writeSem = v12->_writeSem;
    v12->_writeSem = (OS_dispatch_semaphore *)v21;
  }
  return v12;
}

- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  v12 = NSURL;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = GTTransportArchiveDirectory();
  dispatch_queue_t v19 = [v18 stringByAppendingPathComponent:v16];
  id v20 = [v12 fileURLWithPath:v19 isDirectory:1];

  [(GTFileWriterService *)self initiateTransfer:v17 basePath:v16 fromDevice:v15 toURL:v20 options:v14 completionHandler:v13];
}

- (void)startTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a7;
  v26 = NSURL;
  ++LocalArchivePath_downloadNumber;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = [v11 lastPathComponent];
  id v17 = [v16 stringByDeletingPathExtension];

  v18 = [v11 pathExtension];
  dispatch_queue_t v19 = objc_msgSend(v17, "stringByAppendingFormat:", @"-%04u", LocalArchivePath_downloadNumber);
  id v20 = [v19 stringByAppendingPathExtension:v18];

  dispatch_semaphore_t v21 = NSTemporaryDirectory();
  v22 = [v21 stringByAppendingPathComponent:v20];

  v23 = [v26 fileURLWithPath:v22 isDirectory:1];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __83__GTFileWriterService_startTransfer_basePath_fromDevice_options_completionHandler___block_invoke;
  v28[3] = &unk_264E28C28;
  id v29 = v23;
  id v30 = v12;
  v28[4] = self;
  id v24 = v23;
  id v25 = v12;
  [(GTFileWriterService *)self initiateTransfer:v15 basePath:v11 fromDevice:v14 toURL:v24 options:v13 completionHandler:v28];
}

void __83__GTFileWriterService_startTransfer_basePath_fromDevice_options_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void (**)(void))(a1[6] + 16);
    v3();
  }
  else
  {
    id v4 = [*(id *)(a1[4] + 56) makeURL:a1[5]];
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 toURL:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v51 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    v43 = log;
    uint64_t v44 = [v17 chunkSize];
    unint64_t v45 = [v17 compressionAlgorithm];
    if (v45 > 5) {
      v46 = "<UNKNOWN>";
    }
    else {
      v46 = off_264E28D30[v45];
    }
    *(_DWORD *)buf = 138413314;
    id v63 = v51;
    __int16 v64 = 2112;
    id v65 = v15;
    __int16 v66 = 2112;
    id v67 = v16;
    __int16 v68 = 2048;
    uint64_t v69 = v44;
    __int16 v70 = 2080;
    v71 = v46;
    _os_log_debug_impl(&dword_23C048000, v43, OS_LOG_TYPE_DEBUG, "Initiate transfer basePath:%@ device:%@ toURL:%@ chunkSize:%lu compression:%s", buf, 0x34u);
  }
  if (GTFileTransferOptionsValidate(v17))
  {
    id v55 = 0;
    id v20 = +[GTFileWriterSession sessionWithFileEntries:v14 relativeToURL:v16 options:v17 error:&v55];
    id v21 = v55;
    if (v20)
    {
      id v49 = v16;
      id v50 = v14;
      unint64_t v22 = self->_sessionCounts + 1;
      self->_sessionCounts = v22;
      sessions = self->_sessions;
      id v24 = [NSNumber numberWithUnsignedLongLong:v22];
      [(NSMutableDictionary *)sessions setObject:v20 forKeyedSubscript:v24];

      id v25 = [(GTConnectionProvider *)self->_connectionProvider connectionForDeviceUDID:v15];
      v26 = v25;
      if (v25)
      {
        v27 = FindRemoteGTFileWriterService(v25, v15, self->_connectionProvider);
        if (v27)
        {
          v28 = [GTFileWriterServiceXPCProxy alloc];
          [v27 serviceProperties];
          id v29 = v47 = v15;
          id v30 = [(GTFileWriterServiceXPCProxy *)v28 initWithConnection:v26 remoteProperties:v29];

          deviceUDID = self->_deviceUDID;
          v52[0] = MEMORY[0x263EF8330];
          v52[1] = 3221225472;
          v52[2] = __92__GTFileWriterService_initiateTransfer_basePath_fromDevice_toURL_options_completionHandler___block_invoke;
          v52[3] = &unk_264E28C50;
          v52[4] = self;
          unint64_t v54 = v22;
          id v53 = v18;
          v32 = v51;
          v33 = deviceUDID;
          id v15 = v47;
          [(GTFileWriterServiceXPCProxy *)v30 beginTransferSessionWithFileEntries:v50 basePath:v51 toDevice:v33 options:v17 sessionID:v22 completionHandler:v52];
        }
        else
        {
          v48 = (void *)MEMORY[0x263F087E8];
          uint64_t v56 = *MEMORY[0x263F08320];
          v41 = [NSString stringWithFormat:@"Service is unavailable: \"%@\", @"GTFileWriterService""];
          v57 = v41;
          v42 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
          id v30 = [v48 errorWithDomain:@"com.apple.gputools.transport" code:1 userInfo:v42];

          (*((void (**)(id, GTFileWriterServiceXPCProxy *))v18 + 2))(v18, v30);
          v32 = v51;
        }
      }
      else
      {
        v38 = (void *)MEMORY[0x263F087E8];
        uint64_t v58 = *MEMORY[0x263F08320];
        v39 = [NSString stringWithFormat:@"Unable to find remote connection"];
        v59 = v39;
        v40 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        v27 = [v38 errorWithDomain:@"com.apple.gputools.transport" code:5 userInfo:v40];

        (*((void (**)(id, void *))v18 + 2))(v18, v27);
        v32 = v51;
      }

      id v16 = v49;
      id v14 = v50;
    }
    else
    {
      (*((void (**)(id, id))v18 + 2))(v18, v21);
      v32 = v51;
    }
  }
  else
  {
    v34 = (void *)MEMORY[0x263F087E8];
    uint64_t v60 = *MEMORY[0x263F08320];
    [NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterService", @"options sent to initiateTransfer are invalid."];
    v36 = id v35 = v16;
    v61 = v36;
    v37 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    id v21 = [v34 errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v37];

    id v16 = v35;
    (*((void (**)(id, id))v18 + 2))(v18, v21);
    v32 = v51;
  }
}

void __92__GTFileWriterService_initiateTransfer_basePath_fromDevice_toURL_options_completionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[6];
  v5 = (void *)a1[4];
  id v17 = 0;
  char v6 = [v5 _finishSession:v4 error:&v17];
  id v7 = v17;
  v8 = *(NSObject **)(a1[4] + 8);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v9) {
      __92__GTFileWriterService_initiateTransfer_basePath_fromDevice_toURL_options_completionHandler___block_invoke_cold_2((uint64_t)(a1 + 6), v8, v3);
    }
    id v16 = *(void (**)(void))(a1[5] + 16);
  }
  else if (v6)
  {
    if (v9) {
      __92__GTFileWriterService_initiateTransfer_basePath_fromDevice_toURL_options_completionHandler___block_invoke_cold_1((uint64_t)(a1 + 6), v8, v10, v11, v12, v13, v14, v15);
    }
    id v16 = *(void (**)(void))(a1[5] + 16);
  }
  else
  {
    if (v9) {
      __92__GTFileWriterService_initiateTransfer_basePath_fromDevice_toURL_options_completionHandler___block_invoke_cold_2((uint64_t)(a1 + 6), v8, v7);
    }
    id v16 = *(void (**)(void))(a1[5] + 16);
  }
  v16();
}

- (void)beginTransferSessionWithFileEntries:(id)a3 basePath:(id)a4 toDevice:(id)a5 options:(id)a6 sessionID:(unint64_t)a7 completionHandler:(id)a8
{
  v60[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  dispatch_queue_t v19 = [(GTURLAccessProvider *)self->_urlAccessProvider urlForPath:v15];
  if (![v14 count])
  {
    id v30 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08438];
    uint64_t v59 = *MEMORY[0x263F08320];
    v60[0] = @"No files specified";
    id v21 = [NSDictionary dictionaryWithObjects:v60 forKeys:&v59 count:1];
    unint64_t v22 = [v30 errorWithDomain:v31 code:2 userInfo:v21];
    goto LABEL_9;
  }
  if (GTFileTransferOptionsValidate(v17))
  {
    id v20 = [(GTConnectionProvider *)self->_connectionProvider connectionForDeviceUDID:v16];
    id v21 = v20;
    if (v20)
    {
      unint64_t v22 = FindRemoteGTFileWriterService(v20, v16, self->_connectionProvider);
      if (v22)
      {
        v39 = v22;
        v23 = [GTFileWriterServiceXPCProxy alloc];
        [v39 serviceProperties];
        id v24 = v41 = v19;
        id v25 = [(GTFileWriterServiceXPCProxy *)v23 initWithConnection:v21 remoteProperties:v24];

        [v41 startAccessingSecurityScopedResource];
        v26 = [NSURL fileURLWithPath:v15 isDirectory:1];
        queue = self->_fileTransferQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __113__GTFileWriterService_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke;
        block[3] = &unk_264E28CC8;
        id v45 = v14;
        id v46 = v26;
        id v47 = v17;
        v48 = self;
        id v49 = v25;
        unint64_t v52 = a7;
        id v50 = v41;
        id v51 = v18;
        v27 = v25;
        id v28 = v26;
        unint64_t v22 = v39;
        dispatch_queue_t v19 = v41;
        id v29 = v28;
        dispatch_async(queue, block);
      }
      else
      {
        v43 = (void *)MEMORY[0x263F087E8];
        uint64_t v53 = *MEMORY[0x263F08320];
        v40 = [NSString stringWithFormat:@"Service is unavailable: \"%@\", @"GTFileWriterService""];
        unint64_t v54 = v40;
        v37 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        id v29 = [v43 errorWithDomain:@"com.apple.gputools.transport" code:1 userInfo:v37];

        (*((void (**)(id, id))v18 + 2))(v18, v29);
      }

      goto LABEL_12;
    }
    v42 = (void *)MEMORY[0x263F087E8];
    uint64_t v55 = *MEMORY[0x263F08320];
    id v35 = [NSString stringWithFormat:@"Unable to find remote connection"];
    uint64_t v56 = v35;
    v36 = [NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    unint64_t v22 = [v42 errorWithDomain:@"com.apple.gputools.transport" code:5 userInfo:v36];

LABEL_9:
    (*((void (**)(id, void *))v18 + 2))(v18, v22);
LABEL_12:

    goto LABEL_13;
  }
  v32 = (void *)MEMORY[0x263F087E8];
  uint64_t v57 = *MEMORY[0x263F08320];
  v33 = [NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterService", @"options sent to beginTransferSessionWithFileEntries is invalid"];
  uint64_t v58 = v33;
  v34 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  id v21 = [v32 errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v34];

  (*((void (**)(id, void *))v18 + 2))(v18, v21);
LABEL_13:
}

void __113__GTFileWriterService_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke(uint64_t a1)
{
  v31[1] = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  id v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v23 = 0;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  id v17 = __113__GTFileWriterService_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke_340;
  id v18 = &unk_264E28CA0;
  uint64_t v4 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 64);
  uint64_t v19 = *(void *)(a1 + 56);
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 88);
  id v21 = &v24;
  uint64_t v22 = v7;
  id v20 = v6;
  LOBYTE(v3) = GTFileWriterTransferFileEntries(v2, v3, v4, &v23, &v15);
  id v8 = v23;
  if ((v3 & 1) == 0) {
    goto LABEL_4;
  }
  dispatch_time_t v9 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000);
  if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 56) + 64), v9))
  {
    if (!v25[5])
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 56) + 64));
      [*(id *)(a1 + 72) stopAccessingSecurityScopedResource];
      id v14 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
      goto LABEL_5;
    }
LABEL_4:
    [*(id *)(a1 + 72) stopAccessingSecurityScopedResource];
    id v14 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
LABEL_5:
    v14();
    goto LABEL_6;
  }
  uint64_t v10 = (void *)MEMORY[0x263F087E8];
  uint64_t v30 = *MEMORY[0x263F08320];
  uint64_t v11 = [NSString stringWithFormat:@"%@ hit a timeout: %@", @"GTFileWriterService", @"beginTransferSessionWithFileEntires timed out waiting for final write to complete", v15, v16, v17, v18, v19];
  v31[0] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
  uint64_t v13 = [v10 errorWithDomain:@"com.apple.gputools.transport" code:6 userInfo:v12];

  [*(id *)(a1 + 72) stopAccessingSecurityScopedResource];
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();

LABEL_6:
  _Block_object_dispose(&v24, 8);
}

BOOL __113__GTFileWriterService_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke_340(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:a2 length:a3 freeWhenDone:0];
  dispatch_time_t v7 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000);
  intptr_t v8 = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1[4] + 64), v7);
  if (v8)
  {
    if (a4)
    {
      dispatch_time_t v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F08320];
      uint64_t v10 = [NSString stringWithFormat:@"%@ hit a timeout: %@", @"GTFileWriterService", @"beginTransferSessionWithFileEntires timed out waiting for transfer to complete"];
      v19[0] = v10;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      *a4 = [v9 errorWithDomain:@"com.apple.gputools.transport" code:6 userInfo:v11];
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x23ECD9F60]();
    uint64_t v13 = a1[7];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __113__GTFileWriterService_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke_2;
    v17[3] = &unk_264E28C78;
    id v14 = (void *)a1[5];
    uint64_t v15 = a1[6];
    v17[4] = a1[4];
    v17[5] = v15;
    [v14 writeFileData:v6 sessionID:v13 completionHandler:v17];
  }

  return v8 == 0;
}

void __113__GTFileWriterService_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void *)(v4 + 40);
  v5 = (id *)(v4 + 40);
  if (!v6) {
    objc_storeStrong(v5, a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 64));
}

- (void)writeFileData:(id)a3 sessionID:(unint64_t)a4 completionHandler:(id)a5
{
  sessions = self->_sessions;
  intptr_t v8 = NSNumber;
  id v9 = a5;
  id v10 = a3;
  id v12 = [v8 numberWithUnsignedLongLong:a4];
  uint64_t v11 = [(NSMutableDictionary *)sessions objectForKeyedSubscript:v12];
  [v11 writeFileData:v10 completionHandler:v9];
}

- (BOOL)_finishSession:(unint64_t)a3 error:(id *)a4
{
  sessions = self->_sessions;
  intptr_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  id v9 = [(NSMutableDictionary *)sessions objectForKeyedSubscript:v8];

  id v10 = self->_sessions;
  uint64_t v11 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)v10 removeObjectForKey:v11];

  LOBYTE(a4) = [v9 finish:a4];
  return (char)a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeSem, 0);
  objc_storeStrong((id *)&self->_urlAccessProvider, 0);
  objc_storeStrong((id *)&self->_fileTransferQueue, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __92__GTFileWriterService_initiateTransfer_basePath_fromDevice_toURL_options_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __92__GTFileWriterService_initiateTransfer_basePath_fromDevice_toURL_options_completionHandler___block_invoke_cold_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 localizedDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C048000, v6, v7, "Transfer session %llu failed with error \"%@\"", v8, v9, v10, v11, v12);
}

@end