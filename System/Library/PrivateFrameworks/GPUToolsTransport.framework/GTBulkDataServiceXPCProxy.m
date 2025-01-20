@interface GTBulkDataServiceXPCProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)uploadChunk:(id)a3 forHandle:(unint64_t)a4 isFinalChunk:(BOOL)a5 error:(id *)a6;
- (GTBulkDataServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (id)downloadData:(unint64_t)a3 error:(id *)a4;
- (id)downloadData:(unint64_t)a3 usingTransferOptions:(id)a4 error:(id *)a5;
- (id)transferOptions;
- (unint64_t)newUploadWithDescriptor:(id)a3 error:(id *)a4;
- (unint64_t)uploadData:(id)a3 error:(id *)a4;
- (unint64_t)uploadData:(id)a3 usingTransferOptions:(id)a4 error:(id *)a5;
- (void)downloadData:(unint64_t)a3 completionHandler:(id)a4;
- (void)downloadData:(unint64_t)a3 usingTransferOptions:(id)a4 chunkHandler:(id)a5;
- (void)downloadData:(unint64_t)a3 usingTransferOptions:(id)a4 completionHandler:(id)a5;
- (void)uploadData:(id)a3 completionHandler:(id)a4;
- (void)uploadData:(id)a3 usingTransferOptions:(id)a4 completionHandler:(id)a5;
@end

@implementation GTBulkDataServiceXPCProxy

- (GTBulkDataServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)GTBulkDataServiceXPCProxy;
  v8 = [(GTBulkDataServiceXPCProxy *)&v25 init];
  if (v8)
  {
    os_log_t v9 = os_log_create("com.apple.gputools.transport", "BulkDataProxy");
    log = v8->_log;
    v8->_log = (OS_os_log *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.gputools.bulk-data-proxy", 0);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v11;

    v13 = [GTServiceConnection alloc];
    v14 = [v7 deviceUDID];
    uint64_t v15 = -[GTServiceConnection initWithConnection:device:port:](v13, "initWithConnection:device:port:", v6, v14, [v7 servicePort]);
    connection = v8->_connection;
    v8->_connection = (GTServiceConnection *)v15;

    uint64_t v17 = objc_opt_new();
    defaultTransferOptions = v8->_defaultTransferOptions;
    v8->_defaultTransferOptions = (GTBulkDataTransferOptions *)v17;

    v19 = [v7 deviceUDID];
    [(GTBulkDataTransferOptions *)v8->_defaultTransferOptions setChunkSize:0x400000];

    [(GTBulkDataTransferOptions *)v8->_defaultTransferOptions setCompressionAlgorithm:0];
    v20 = +[GTServiceProperties protocolMethods:&unk_26EFBAD90];
    v21 = [v7 protocolMethods];
    uint64_t v22 = newSetWithArrayMinusArray(v20, v21);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v22;
  }
  return v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  ignoreMethods = self->_ignoreMethods;
  id v6 = NSStringFromSelector(a3);
  if ([(NSSet *)ignoreMethods containsObject:v6])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GTBulkDataServiceXPCProxy;
    BOOL v7 = [(GTBulkDataServiceXPCProxy *)&v9 respondsToSelector:a3];
  }

  return v7;
}

- (id)transferOptions
{
  v2 = (void *)[(GTBulkDataTransferOptions *)self->_defaultTransferOptions copy];
  return v2;
}

- (void)downloadData:(unint64_t)a3 usingTransferOptions:(id)a4 chunkHandler:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "handle", a3);
  xpc_dictionary_set_nsobject(xdict, "transferOptions", (uint64_t)v10);

  v12 = [[GTBulkDataReplyStream alloc] initWithCallback:v9];
  unint64_t v13 = [(GTServiceConnection *)self->_connection registerDispatcher:v12];
  [(GTBulkDataReplyStream *)v12 setDispatcherId:v13];
  [(GTServiceConnection *)self->_connection sendMessage:xdict withReplyStreamId:v13];
}

- (void)downloadData:(unint64_t)a3 completionHandler:(id)a4
{
}

- (id)downloadData:(unint64_t)a3 error:(id *)a4
{
  return [(GTBulkDataServiceXPCProxy *)self downloadData:a3 usingTransferOptions:self->_defaultTransferOptions error:a4];
}

- (void)downloadData:(unint64_t)a3 usingTransferOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  id v17 = objc_alloc_init(MEMORY[0x263EFF990]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__GTBulkDataServiceXPCProxy_downloadData_usingTransferOptions_completionHandler___block_invoke;
  v12[3] = &unk_264E28908;
  id v14 = v9;
  uint64_t v15 = v16;
  id v13 = v8;
  id v10 = v9;
  id v11 = v8;
  [(GTBulkDataServiceXPCProxy *)self downloadData:a3 usingTransferOptions:v11 chunkHandler:v12];

  _Block_object_dispose(v16, 8);
}

void __81__GTBulkDataServiceXPCProxy_downloadData_usingTransferOptions_completionHandler___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  if (v7)
  {
    [v10 appendData:v7];
    if (!v8 && !a3) {
      goto LABEL_9;
    }
  }
  else
  {
    *(void *)(v9 + 40) = 0;
  }
  id v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v11)
  {
    uint64_t v12 = [*(id *)(a1 + 32) compressionAlgorithm];
    id v14 = v8;
    id v11 = GTBulkDataDecompress(v11, v12, &v14);
    id v13 = v14;

    id v8 = v13;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_9:
}

- (id)downloadData:(unint64_t)a3 usingTransferOptions:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v24 = 0;
  objc_super v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = objc_alloc_init(MEMORY[0x263EFF990]);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__GTBulkDataServiceXPCProxy_downloadData_usingTransferOptions_error___block_invoke;
  v14[3] = &unk_264E28930;
  v16 = &v24;
  id v17 = &v18;
  id v10 = v9;
  uint64_t v15 = v10;
  [(GTBulkDataServiceXPCProxy *)self downloadData:a3 usingTransferOptions:v8 chunkHandler:v14];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a5) {
    *a5 = (id) v19[5];
  }
  id v11 = (void *)v25[5];
  if (v11)
  {
    uint64_t v12 = GTBulkDataDecompress(v11, [v8 compressionAlgorithm], a5);
  }
  else
  {
    uint64_t v12 = 0;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __69__GTBulkDataServiceXPCProxy_downloadData_usingTransferOptions_error___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v10 = a2;
  id v7 = a4;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v9 = *(void **)(v8 + 40);
  if (!v10)
  {
    *(void *)(v8 + 40) = 0;

LABEL_6:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_7;
  }
  objc_msgSend(v9, "appendData:");
  if (v7 || a3) {
    goto LABEL_6;
  }
LABEL_7:
}

- (unint64_t)newUploadWithDescriptor:(id)a3 error:(id *)a4
{
  id v7 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "descriptor", (uint64_t)v7);

  id v10 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:a4];
  id v11 = v10;
  if (v10)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v10, "result");
    if (a4) {
      *a4 = (id)xpc_dictionary_get_nserror(v11, "error");
    }
  }
  else
  {
    uint64_t uint64 = 0;
  }

  return uint64;
}

- (BOOL)uploadChunk:(id)a3 forHandle:(unint64_t)a4 isFinalChunk:(BOOL)a5 error:(id *)a6
{
  id v11 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsdata(empty, "chunk", v11);

  xpc_dictionary_set_uint64(empty, "handle", a4);
  xpc_dictionary_set_BOOL(empty, "isFinalChunk", a5);
  id v14 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:a6];
  uint64_t v15 = v14;
  if (v14)
  {
    BOOL v16 = xpc_dictionary_get_BOOL(v14, "result");
    if (a6) {
      *a6 = (id)xpc_dictionary_get_nserror(v15, "error");
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)uploadData:(id)a3 completionHandler:(id)a4
{
}

- (unint64_t)uploadData:(id)a3 error:(id *)a4
{
  return [(GTBulkDataServiceXPCProxy *)self uploadData:a3 usingTransferOptions:self->_defaultTransferOptions error:a4];
}

- (void)uploadData:(id)a3 usingTransferOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__GTBulkDataServiceXPCProxy_uploadData_usingTransferOptions_completionHandler___block_invoke;
  v15[3] = &unk_264E28958;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(serialQueue, v15);
}

void __79__GTBulkDataServiceXPCProxy_uploadData_usingTransferOptions_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  id v7 = 0;
  uint64_t v5 = [v2 uploadData:v1 usingTransferOptions:v3 error:&v7];
  id v6 = v7;
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v5);
}

- (unint64_t)uploadData:(id)a3 usingTransferOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_new();
  objc_msgSend(v10, "setSizeHint:", objc_msgSend(v8, "length"));
  objc_msgSend(v10, "setCompressionAlgorithm:", objc_msgSend(v9, "compressionAlgorithm"));
  unint64_t v11 = [(GTBulkDataServiceXPCProxy *)self newUploadWithDescriptor:v10 error:a5];
  if (v11)
  {
    unint64_t v12 = v11;
    id v13 = GTBulkDataCompress(v8, [v9 compressionAlgorithm], a5);
    id v14 = v13;
    if (v13)
    {
      if ([v13 length])
      {
        id v32 = v8;
        unint64_t v15 = 0;
        while (1)
        {
          unint64_t v16 = [v9 chunkSize];
          uint64_t v17 = [v14 length];
          unint64_t v18 = v16 >= v17 - v15 ? v17 - v15 : v16;
          v19 = (void *)MEMORY[0x263EFF8F8];
          id v20 = v14;
          v21 = objc_msgSend(v19, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v20, "bytes") + v15, v18, 0);
          if (!-[GTBulkDataServiceXPCProxy uploadChunk:forHandle:isFinalChunk:error:](self, "uploadChunk:forHandle:isFinalChunk:error:", v21, v12, [v9 chunkSize] + v15 >= objc_msgSend(v20, "length"), a5))break; {

          }
          v15 += [v9 chunkSize];
          if (v15 >= [v20 length]) {
            goto LABEL_20;
          }
        }
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          -[GTBulkDataServiceXPCProxy uploadData:usingTransferOptions:error:](v12, log, v25, v26, v27, v28, v29, v30);
        }

        unint64_t v12 = 0;
LABEL_20:
        id v8 = v32;
      }
    }
    else
    {
      id v23 = self->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[GTBulkDataServiceXPCProxy uploadData:usingTransferOptions:error:](v23);
      }
      unint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v22 = self->_log;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[GTBulkDataServiceXPCProxy uploadData:usingTransferOptions:error:](v22);
    }
    unint64_t v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_defaultTransferOptions, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)uploadData:(os_log_t)log usingTransferOptions:error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_23C048000, log, OS_LOG_TYPE_ERROR, "uploadData failed to start upload", v1, 2u);
}

- (void)uploadData:(os_log_t)log usingTransferOptions:error:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_23C048000, log, OS_LOG_TYPE_ERROR, "uploadData compression failed", v1, 2u);
}

- (void)uploadData:(uint64_t)a3 usingTransferOptions:(uint64_t)a4 error:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end