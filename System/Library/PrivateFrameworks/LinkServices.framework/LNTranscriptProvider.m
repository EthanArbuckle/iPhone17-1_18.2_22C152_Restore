@interface LNTranscriptProvider
+ (id)createStreamsWithStreamURL:(id)a3;
+ (id)publisherForStream:(id)a3 fromDate:(id)a4 toDate:(id)a5 maxEvents:(id)a6 reversed:(BOOL)a7;
- (LNTranscriptProvider)init;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)transcriptPublisherFromDate:(id)a3 error:(id *)a4;
- (id)transcriptPublisherFromDate:(id)a3 toDate:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6 error:(id *)a7;
- (void)configureConnection:(id)a3;
- (void)dealloc;
- (void)deleteAllRecordsWithReply:(id)a3;
- (void)deleteRecordsWithMatchingPredicate:(id)a3 reply:(id)a4;
- (void)donateActionRecordData:(id)a3 writeImmediately:(BOOL)a4 reply:(id)a5;
- (void)donateWithActionRecord:(id)a3 reply:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation LNTranscriptProvider

- (NSXPCConnection)connection
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7233;
  v11 = __Block_byref_object_dispose__7234;
  id v12 = 0;
  v3 = [(LNTranscriptProvider *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__LNTranscriptProvider_connection__block_invoke;
  v6[3] = &unk_1E5B39400;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

+ (id)publisherForStream:(id)a3 fromDate:(id)a4 toDate:(id)a5 maxEvents:(id)a6 reversed:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  [v11 startAccessingSecurityScopedResource];
  v15 = [(id)objc_opt_class() createStreamsWithStreamURL:v11];
  id v16 = objc_alloc(MEMORY[0x1E4F503E8]);
  uint64_t v17 = [v12 unsignedLongLongValue];

  v18 = (void *)[v16 initWithStartDate:v14 endDate:v13 maxEvents:v17 lastN:0 reversed:v7];
  v19 = [v15 publisherWithOptions:v18];
  v20 = [LNDeallocationHandler alloc];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __78__LNTranscriptProvider_publisherForStream_fromDate_toDate_maxEvents_reversed___block_invoke;
  v23[3] = &unk_1E5B3A0B0;
  id v24 = v11;
  id v21 = v11;

  return v19;
}

+ (id)createStreamsWithStreamURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 URLByDeletingLastPathComponent];
  v5 = [v4 path];

  v6 = [v3 lastPathComponent];
  if ([v6 isEqualToString:@"Special"])
  {
    BOOL v7 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_1A4419000, v7, OS_LOG_TYPE_INFO, "Using class D protection for special stream.", v14, 2u);
    }

    uint64_t v8 = 4;
  }
  else
  {
    uint64_t v8 = 3;
  }
  uint64_t v9 = (void *)[MEMORY[0x1E4F50278] newPrivateStreamDefaultConfigurationWithStoreBasePath:v5 protectionClass:v8];
  id v10 = objc_alloc(MEMORY[0x1E4F50490]);
  id v11 = [v3 lastPathComponent];
  id v12 = (void *)[v10 initWithPrivateStreamIdentifier:v11 storeConfig:v9 eventDataClass:0];

  return v12;
}

void __34__LNTranscriptProvider_connection__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.linkd.transcript" options:0];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    [*(id *)(a1 + 32) configureConnection:*(void *)(*(void *)(a1 + 32) + 8)];
    [*(id *)(*(void *)(a1 + 32) + 8) resume];
    v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v2);
}

- (void)configureConnection:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() xpcInterface];
  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v5];

  objc_initWeak(&location, self);
  connection = self->_connection;
  BOOL v7 = [(LNTranscriptProvider *)self queue];
  [(NSXPCConnection *)connection _setQueue:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__LNTranscriptProvider_configureConnection___block_invoke;
  v10[3] = &unk_1E5B3A1D0;
  objc_copyWeak(&v11, &location);
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__LNTranscriptProvider_configureConnection___block_invoke_17;
  v8[3] = &unk_1E5B3A1D0;
  objc_copyWeak(&v9, &location);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

uint64_t __78__LNTranscriptProvider_publisherForStream_fromDate_toDate_maxEvents_reversed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)LNTranscriptProvider;
  [(LNTranscriptProvider *)&v3 dealloc];
}

void __44__LNTranscriptProvider_configureConnection___block_invoke_17(uint64_t a1)
{
  v2 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A4419000, v2, OS_LOG_TYPE_INFO, "XPC connection has been invalidated", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((void *)WeakRetained + 1);
    *((void *)WeakRetained + 1) = 0;
  }
}

- (LNTranscriptProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)LNTranscriptProvider;
  v2 = [(LNTranscriptProvider *)&v9 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.link.LNTranscript.internal-queue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    BOOL v7 = v2;
  }

  return v2;
}

- (void)setConnection:(id)a3
{
}

- (void)deleteAllRecordsWithReply:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(LNTranscriptProvider *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__LNTranscriptProvider_deleteAllRecordsWithReply___block_invoke;
  v11[3] = &unk_1E5B3A550;
  id v6 = v4;
  id v12 = v6;
  BOOL v7 = [v5 remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__LNTranscriptProvider_deleteAllRecordsWithReply___block_invoke_28;
  v9[3] = &unk_1E5B3A148;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 deleteAllRecordsWithReply:v9];
}

void __50__LNTranscriptProvider_deleteAllRecordsWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_INFO, "XPC Error when executing deleteAllRecordsWithReply. error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__LNTranscriptProvider_deleteAllRecordsWithReply___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_INFO, "Error when executing deleteAllRecordsWithReply. error: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteRecordsWithMatchingPredicate:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNTranscriptProvider *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__LNTranscriptProvider_deleteRecordsWithMatchingPredicate_reply___block_invoke;
  v14[3] = &unk_1E5B3A550;
  id v9 = v6;
  id v15 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__LNTranscriptProvider_deleteRecordsWithMatchingPredicate_reply___block_invoke_26;
  v12[3] = &unk_1E5B39360;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 deleteRecordsWithMatchingPredicate:v7 reply:v12];
}

void __65__LNTranscriptProvider_deleteRecordsWithMatchingPredicate_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_INFO, "XPC Error when executing deleteRecordsWithMatchingPredicate. error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__LNTranscriptProvider_deleteRecordsWithMatchingPredicate_reply___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1A4419000, v7, OS_LOG_TYPE_INFO, "Error when executing deleteRecordsWithMatchingPredicate. error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)transcriptPublisherFromDate:(id)a3 toDate:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__7233;
  v33 = __Block_byref_object_dispose__7234;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__7233;
  v27 = __Block_byref_object_dispose__7234;
  id v28 = 0;
  id v15 = [(LNTranscriptProvider *)self connection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __84__LNTranscriptProvider_transcriptPublisherFromDate_toDate_maxEvents_reversed_error___block_invoke;
  v22[3] = &unk_1E5B3A3E8;
  v22[4] = &v23;
  id v16 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__LNTranscriptProvider_transcriptPublisherFromDate_toDate_maxEvents_reversed_error___block_invoke_25;
  v21[3] = &unk_1E5B3A410;
  v21[4] = &v23;
  v21[5] = &v29;
  [v16 requestReadAccessWithReply:v21];

  if (a7)
  {
    uint64_t v17 = (void *)v24[5];
    if (v17) {
      *a7 = v17;
    }
  }
  v18 = [(id)v30[5] url];
  v19 = +[LNTranscriptProvider publisherForStream:v18 fromDate:v12 toDate:v13 maxEvents:v14 reversed:v8];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v19;
}

void __84__LNTranscriptProvider_transcriptPublisherFromDate_toDate_maxEvents_reversed_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_ERROR, "Error when executing requestReadAccessWithReply. error: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"LNTranscriptErrorDomain" code:1004 userInfo:0];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __84__LNTranscriptProvider_transcriptPublisherFromDate_toDate_maxEvents_reversed_error___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)transcriptPublisherFromDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__7233;
  uint64_t v25 = __Block_byref_object_dispose__7234;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7233;
  v19 = __Block_byref_object_dispose__7234;
  id v20 = 0;
  uint64_t v7 = [(LNTranscriptProvider *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__LNTranscriptProvider_transcriptPublisherFromDate_error___block_invoke;
  v14[3] = &unk_1E5B3A3E8;
  void v14[4] = &v15;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__LNTranscriptProvider_transcriptPublisherFromDate_error___block_invoke_22;
  v13[3] = &unk_1E5B3A410;
  v13[4] = &v15;
  v13[5] = &v21;
  [v8 requestReadAccessWithReply:v13];

  if (a4)
  {
    id v9 = (void *)v16[5];
    if (v9) {
      *a4 = v9;
    }
  }
  uint64_t v10 = [(id)v22[5] url];
  id v11 = +[LNTranscriptProvider publisherForStream:v10 fromDate:v6 toDate:0 maxEvents:0 reversed:0];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __58__LNTranscriptProvider_transcriptPublisherFromDate_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_ERROR, "Error when executing requestReadAccessWithReply. error: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"LNTranscriptErrorDomain" code:1004 userInfo:0];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __58__LNTranscriptProvider_transcriptPublisherFromDate_error___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)donateActionRecordData:(id)a3 writeImmediately:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = getLNLogCategoryExecution();
  id v11 = v10;
  if ((unint64_t)a3 + 1 >= 2 && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)a3, "donating", "", buf, 2u);
  }

  id v12 = [(LNTranscriptProvider *)self connection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__LNTranscriptProvider_donateActionRecordData_writeImmediately_reply___block_invoke;
  v19[3] = &unk_1E5B3A578;
  id v13 = v8;
  id v20 = v13;
  id v21 = a3;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v19];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__LNTranscriptProvider_donateActionRecordData_writeImmediately_reply___block_invoke_20;
  v16[3] = &unk_1E5B39338;
  id v17 = v13;
  id v18 = a3;
  v16[4] = self;
  id v15 = v13;
  [v14 donateActionRecordData:v9 writeImmediately:v5 reply:v16];
}

void __70__LNTranscriptProvider_donateActionRecordData_writeImmediately_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_INFO, "XPC Error when executing donateActionRecordData. error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  BOOL v5 = getLNLogCategoryExecution();
  uint64_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v6, OS_SIGNPOST_INTERVAL_END, v7, "donating", "", (uint8_t *)&v8, 2u);
  }
}

void __70__LNTranscriptProvider_donateActionRecordData_writeImmediately_reply___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_INFO, "Error when executing donateActionRecordData. error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  BOOL v5 = getLNLogCategoryExecution();
  uint64_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v6, OS_SIGNPOST_INTERVAL_END, v7, "donating", "", (uint8_t *)&v8, 2u);
  }
}

- (void)donateWithActionRecord:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = getLNLogCategoryExecution();
  id v9 = v8;
  if ((unint64_t)a3 + 1 >= 2 && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)a3, "donating", "", buf, 2u);
  }

  uint64_t v10 = [(LNTranscriptProvider *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__LNTranscriptProvider_donateWithActionRecord_reply___block_invoke;
  v17[3] = &unk_1E5B3A578;
  id v11 = v6;
  id v18 = v11;
  id v19 = a3;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:v17];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__LNTranscriptProvider_donateWithActionRecord_reply___block_invoke_19;
  v14[3] = &unk_1E5B39338;
  id v15 = v11;
  id v16 = a3;
  void v14[4] = self;
  id v13 = v11;
  [v12 donateWithActionRecord:v7 reply:v14];
}

void __53__LNTranscriptProvider_donateWithActionRecord_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_INFO, "XPC Error when executing donateWithActionRecord. error: %@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  BOOL v5 = getLNLogCategoryExecution();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v6, OS_SIGNPOST_INTERVAL_END, v7, "donating", "", (uint8_t *)&v8, 2u);
  }
}

void __53__LNTranscriptProvider_donateWithActionRecord_reply___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_INFO, "Error when executing donateWithActionRecord. error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  BOOL v5 = getLNLogCategoryExecution();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4419000, v6, OS_SIGNPOST_INTERVAL_END, v7, "donating", "", (uint8_t *)&v8, 2u);
  }
}

void __44__LNTranscriptProvider_configureConnection___block_invoke(uint64_t a1)
{
  v2 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A4419000, v2, OS_LOG_TYPE_ERROR, "XPC connection has been interrupted", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 1) invalidate];
    BOOL v5 = (void *)v4[1];
    v4[1] = 0;
  }
}

@end