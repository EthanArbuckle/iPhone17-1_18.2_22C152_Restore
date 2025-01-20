@interface MADComputeService
+ (id)allowedClasses;
+ (id)serverProtocol;
+ (id)service;
+ (id)serviceName;
+ (void)configureClientInterface:(id)a3;
+ (void)configureServerInterface:(id)a3;
- (BOOL)_validFileURL:(id)a3 toRequestID:(id)a4;
- (BOOL)pauseWithRequestID:(id)a3 error:(id *)a4;
- (BOOL)purgeResultsWithRequestID:(id)a3 error:(id *)a4;
- (BOOL)removeRequest:(id)a3 error:(id *)a4;
- (MADComputeService)init;
- (id)connection;
- (id)extensionDataForResultDirectoryURL:(id *)a3 error:(id *)a4;
- (id)extensionDataFromAssetURLs:(id)a3 error:(id *)a4;
- (id)fetchResultsWithRequestID:(id)a3;
- (id)initInternal;
- (id)performRequests:(id)a3 assetURLs:(id)a4 options:(id)a5 progressHandler:(id)a6 resultsHandler:(id)a7 completionHandler:(id)a8;
- (id)performRequests:(id)a3 pixelBuffer:(__CVBuffer *)a4 options:(id)a5 progressHandler:(id)a6 resultsHandler:(id)a7 completionHandler:(id)a8;
- (id)resultDirectoryURL;
- (id)scheduleRequests:(id)a3 assetURLs:(id)a4 options:(id)a5 error:(id *)a6;
- (int)deregisterProgressHandlerForRequestID:(id)a3;
- (int)deregisterResultsHandlerForRequestID:(id)a3;
- (int)registerProgressHandler:(id)a3 requestID:(id)a4;
- (int)registerResultsHandler:(id)a3 requestID:(id)a4;
- (void)cancelAllRequests;
- (void)cancelWithRequestID:(id)a3;
- (void)dealloc;
- (void)handleResults:(id)a3 assetRepresentation:(id)a4 requestID:(id)a5 error:(id)a6 acknowledgement:(id)a7;
- (void)init;
- (void)reportProgress:(double)a3 requestID:(id)a4;
- (void)resumeWithRequestID:(id)a3 progressHandler:(id)a4 resultsHandler:(id)a5 completionHandler:(id)a6;
@end

@implementation MADComputeService

- (MADComputeService)init
{
  BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v3) {
    [(MADComputeService *)v3 init];
  }

  return 0;
}

- (id)initInternal
{
  v16.receiver = self;
  v16.super_class = (Class)MADComputeService;
  v2 = [(MADComputeService *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MAD.connectionQueue", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("MAD.progressHandlerQueue", v5);
    progressHandlerQueue = v2->_progressHandlerQueue;
    v2->_progressHandlerQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    progressHandlers = v2->_progressHandlers;
    v2->_progressHandlers = (NSMutableDictionary *)v8;

    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("MAD.resultsHandlerQueue", v10);
    resultsHandlerQueue = v2->_resultsHandlerQueue;
    v2->_resultsHandlerQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    resultsHandlers = v2->_resultsHandlers;
    v2->_resultsHandlers = (NSMutableDictionary *)v13;
  }
  return v2;
}

+ (id)service
{
  v2 = (void *)[objc_alloc((Class)a1) initInternal];
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MADComputeService;
  [(MADComputeService *)&v3 dealloc];
}

+ (id)serviceName
{
  return @"com.apple.mediaanalysisd.computeservice";
}

+ (id)serverProtocol
{
  return &unk_1F3833A98;
}

+ (id)allowedClasses
{
  v6[12] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  v6[8] = objc_opt_class();
  v6[9] = objc_opt_class();
  v6[10] = objc_opt_class();
  v6[11] = objc_opt_class();
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:12];
  uint64_t v4 = [v2 setWithArray:v3];

  return v4;
}

+ (void)configureServerInterface:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [a1 allowedClasses];
  [v10 setClasses:v4 forSelector:sel_requestProcessing_assetURLs_extensionData_resultDirectoryURL_resultExtensionData_requestID_reply_ argumentIndex:0 ofReply:0];

  uint64_t v5 = [a1 allowedClasses];
  [v10 setClasses:v5 forSelector:sel_requestProcessing_assetURLs_extensionData_resultDirectoryURL_resultExtensionData_requestID_reply_ argumentIndex:1 ofReply:0];

  dispatch_queue_t v6 = [a1 allowedClasses];
  [v10 setClasses:v6 forSelector:sel_requestProcessing_localIdentifiers_photoLibraryURL_resultDirectoryURL_resultExtensionData_requestID_reply_ argumentIndex:0 ofReply:0];

  uint64_t v7 = [a1 allowedClasses];
  [v10 setClasses:v7 forSelector:sel_scheduleProcessing_assetURLs_extensionData_resultDirectoryURL_resultExtensionData_requestID_reply_ argumentIndex:0 ofReply:0];

  uint64_t v8 = [a1 allowedClasses];
  [v10 setClasses:v8 forSelector:sel_scheduleProcessing_assetURLs_extensionData_resultDirectoryURL_resultExtensionData_requestID_reply_ argumentIndex:1 ofReply:0];

  uint64_t v9 = [a1 allowedClasses];
  [v10 setClasses:v9 forSelector:sel_scheduleProcessing_localIdentifiers_photoLibraryURL_resultDirectoryURL_resultExtensionData_requestID_reply_ argumentIndex:0 ofReply:0];
}

+ (void)configureClientInterface:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [a1 allowedClasses];
  [v6 setClasses:v4 forSelector:sel_handleResults_assetRepresentation_requestID_error_acknowledgement_ argumentIndex:0 ofReply:0];

  uint64_t v5 = [a1 allowedClasses];
  [v6 setClasses:v5 forSelector:sel_handleResults_assetRepresentation_requestID_error_acknowledgement_ argumentIndex:1 ofReply:0];
}

- (id)connection
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  connectionQueue = self->_connectionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__MADComputeService_connection__block_invoke;
  v5[3] = &unk_1E6CAD260;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__MADComputeService_connection__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v4 = [(id)objc_opt_class() serviceName];
    uint64_t v5 = [v3 initWithMachServiceName:v4 options:0];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v5;

    uint64_t v8 = [[MADComputeServiceProxy alloc] initWithCoordinator:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 32) + 16) setExportedObject:v8];

    uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F38305D8];
    [*(id *)(*(void *)(a1 + 32) + 16) setExportedInterface:v9];

    id v10 = objc_opt_class();
    id v11 = [*(id *)(*(void *)(a1 + 32) + 16) exportedInterface];
    [v10 configureClientInterface:v11];

    v12 = (void *)MEMORY[0x1E4F29280];
    uint64_t v13 = [(id)objc_opt_class() serverProtocol];
    v14 = [v12 interfaceWithProtocol:v13];

    [(id)objc_opt_class() configureServerInterface:v14];
    [*(id *)(*(void *)(a1 + 32) + 16) setRemoteObjectInterface:v14];
    [*(id *)(*(void *)(a1 + 32) + 16) setInterruptionHandler:&__block_literal_global_1];
    objc_initWeak(&location, *(id *)(a1 + 32));
    v15 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __31__MADComputeService_connection__block_invoke_61;
    v19 = &unk_1E6CAD238;
    objc_copyWeak(&v20, &location);
    [v15 setInvalidationHandler:&v16];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "resume", v16, v17, v18, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void __31__MADComputeService_connection__block_invoke_2()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __31__MADComputeService_connection__block_invoke_2_cold_1();
  }
}

void __31__MADComputeService_connection__block_invoke_61(uint64_t a1)
{
  BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v2) {
    __31__MADComputeService_connection__block_invoke_61_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__MADComputeService_connection__block_invoke_62;
    block[3] = &unk_1E6CAD210;
    block[4] = v11;
    dispatch_async(v12, block);
  }
}

void __31__MADComputeService_connection__block_invoke_62(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (id)performRequests:(id)a3 assetURLs:(id)a4 options:(id)a5 progressHandler:(id)a6 resultsHandler:(id)a7 completionHandler:(id)a8
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v51 = a4;
  id v49 = a6;
  id v48 = a7;
  uint64_t v13 = (void (**)(id, void, void *))a8;
  v14 = NSString;
  v15 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "hash"));
  v18 = [v17 stringValue];
  v19 = [v14 stringWithFormat:@"OnDemand-%@", v18];

  uint64_t v20 = [NSString stringWithFormat:@"Request: %@ %@ with assets %@", v19, v50, v51];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v70 = v20;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADComputeService] %@", buf, 0xCu);
  }
  id v61 = 0;
  id v62 = 0;
  v47 = (void *)v20;
  v21 = [(MADComputeService *)self extensionDataForResultDirectoryURL:&v62 error:&v61];
  id v22 = v62;
  id v23 = v61;
  v24 = v23;
  if (v21 && v22)
  {
    id v60 = v23;
    v25 = [(MADComputeService *)self extensionDataFromAssetURLs:v51 error:&v60];
    id v26 = v60;

    if (![v25 count])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:]();
      }
      v32 = (void *)[v26 copy];
      v13[2](v13, 0, v32);

      goto LABEL_20;
    }
    uint64_t v27 = [(MADComputeService *)self registerProgressHandler:v49 requestID:v19];
    if (v27)
    {
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"[MADComputeService] Failed to register progressHandler (%d)", v27);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:]();
      }
      uint64_t v67 = *MEMORY[0x1E4F28568];
      v68 = v28;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      v30 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:(int)v27 userInfo:v29];
      v13[2](v13, 0, v30);

LABEL_20:
      id v31 = 0;
      goto LABEL_21;
    }
    uint64_t v33 = [(MADComputeService *)self registerResultsHandler:v48 requestID:v19];
    if (v33)
    {
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"[MADComputeService] Failed to register resultsHandler (%d)", v33);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:]();
      }
      uint64_t v65 = *MEMORY[0x1E4F28568];
      v66 = v34;
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      v36 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:(int)v33 userInfo:v35];
      v13[2](v13, 0, v36);

      goto LABEL_20;
    }
    v38 = [(MADComputeService *)self connection];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __104__MADComputeService_performRequests_assetURLs_options_progressHandler_resultsHandler_completionHandler___block_invoke;
    v57[3] = &unk_1E6CAD740;
    v57[4] = self;
    id v31 = v19;
    id v58 = v31;
    v45 = v13;
    id v59 = v45;
    v46 = [v38 remoteObjectProxyWithErrorHandler:v57];

    if (v46)
    {
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __104__MADComputeService_performRequests_assetURLs_options_progressHandler_resultsHandler_completionHandler___block_invoke_77;
      v52[3] = &unk_1E6CAD768;
      id v53 = v47;
      v54 = self;
      id v39 = v31;
      id v55 = v39;
      v56 = v45;
      [v46 requestProcessing:v50 assetURLs:v51 extensionData:v25 resultDirectoryURL:v22 resultExtensionData:v21 requestID:v39 reply:v52];

      id v40 = v39;
    }
    else
    {
      v44 = objc_msgSend(NSString, "stringWithFormat:", @"[MADComputeService] Failed to connect to analysis service during %s", "-[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:]");
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:]();
      }
      uint64_t v63 = *MEMORY[0x1E4F28568];
      v64 = v44;
      v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      [(MADComputeService *)self deregisterProgressHandlerForRequestID:v31];
      [(MADComputeService *)self deregisterResultsHandlerForRequestID:v31];
      v42 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v41];
      ((void (**)(id, id, void *))v45)[2](v45, v31, v42);

      id v43 = v31;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:].cold.5();
    }
    v25 = (void *)[v24 copy];
    id v31 = 0;
    v13[2](v13, 0, v25);
    id v26 = v24;
  }
LABEL_21:

  return v31;
}

void __104__MADComputeService_performRequests_assetURLs_options_progressHandler_resultsHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __104__MADComputeService_performRequests_assetURLs_options_progressHandler_resultsHandler_completionHandler___block_invoke_cold_1();
  }
  [*(id *)(a1 + 32) deregisterProgressHandlerForRequestID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) deregisterResultsHandlerForRequestID:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v6 = (void *)[v3 copy];
  (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v6);
}

void __104__MADComputeService_performRequests_assetURLs_options_progressHandler_resultsHandler_completionHandler___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADComputeService][Finish] %@", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 40) deregisterProgressHandlerForRequestID:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) deregisterResultsHandlerForRequestID:*(void *)(a1 + 48)];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v7 = (void *)[v3 copy];
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);
}

- (id)performRequests:(id)a3 pixelBuffer:(__CVBuffer *)a4 options:(id)a5 progressHandler:(id)a6 resultsHandler:(id)a7 completionHandler:(id)a8
{
  v20[1] = *MEMORY[0x1E4F143B8];
  int v8 = (void (**)(id, void *, void *))a8;
  uint64_t v9 = NSString;
  uint64_t v10 = (void *)MEMORY[0x1E4F28ED0];
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "hash"));
  uint64_t v13 = [v12 stringValue];
  v14 = [v9 stringWithFormat:@"OnDemand-%@", v13];

  v15 = objc_msgSend(NSString, "stringWithFormat:", @"[MADComputeService] Unimplemented method %s", "-[MADComputeService performRequests:pixelBuffer:options:progressHandler:resultsHandler:completionHandler:]");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:]();
  }
  uint64_t v19 = *MEMORY[0x1E4F28568];
  v20[0] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v16];
  v8[2](v8, v14, v17);

  return 0;
}

- (id)scheduleRequests:(id)a3 assetURLs:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v9 = a4;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  uint64_t v10 = NSString;
  id v11 = (void *)MEMORY[0x1E4F28ED0];
  v12 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
  v14 = [v13 stringValue];
  id v48 = [v10 stringWithFormat:@"Offline-%@", v14];

  v15 = [NSString stringWithFormat:@"Schedule: %@ %@ with assets %@", v44[5], v30, v9];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v52 = @"[MADComputeService]";
    __int16 v53 = 2112;
    v54 = v15;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%@[Start] %@", buf, 0x16u);
  }
  id v41 = 0;
  id v42 = 0;
  uint64_t v16 = [(MADComputeService *)self extensionDataForResultDirectoryURL:&v42 error:&v41];
  id v17 = v42;
  id v18 = v41;
  uint64_t v19 = v18;
  if (v16 && v17)
  {
    id v40 = v18;
    uint64_t v20 = [(MADComputeService *)self extensionDataFromAssetURLs:v9 error:&v40];
    id v29 = v40;

    if ([v20 count])
    {
      v21 = [(MADComputeService *)self connection];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __62__MADComputeService_scheduleRequests_assetURLs_options_error___block_invoke;
      v36[3] = &unk_1E6CAD790;
      v37 = @"[MADComputeService]";
      v38 = &v43;
      id v39 = a6;
      id v22 = [v21 synchronousRemoteObjectProxyWithErrorHandler:v36];

      if (v22)
      {
        uint64_t v23 = v44[5];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __62__MADComputeService_scheduleRequests_assetURLs_options_error___block_invoke_93;
        v31[3] = &unk_1E6CAD7B8;
        v32 = @"[MADComputeService]";
        id v33 = v15;
        v34 = &v43;
        v35 = a6;
        [v22 scheduleProcessing:v30 assetURLs:v9 extensionData:v20 resultDirectoryURL:v17 resultExtensionData:v16 requestID:v23 reply:v31];

        v24 = v32;
      }
      else
      {
        v24 = [NSString stringWithFormat:@"%@ Failed to connect to compute service", @"[MADComputeService]"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:]();
        }
        if (a6)
        {
          uint64_t v49 = *MEMORY[0x1E4F28568];
          id v50 = v24;
          id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v26];
        }
        uint64_t v27 = (void *)v44[5];
        v44[5] = 0;
      }
      id v25 = (id)v44[5];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[MADComputeService scheduleRequests:assetURLs:options:error:]();
      }
      id v25 = 0;
      if (a6) {
        *a6 = (id)[v29 copy];
      }
    }

    uint64_t v19 = v29;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[MADComputeService scheduleRequests:assetURLs:options:error:]();
    }
    id v25 = 0;
    if (a6) {
      *a6 = (id)[v19 copy];
    }
  }

  _Block_object_dispose(&v43, 8);
  return v25;
}

void __62__MADComputeService_scheduleRequests_assetURLs_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __62__MADComputeService_scheduleRequests_assetURLs_options_error___block_invoke_cold_1();
  }
  if (*(void *)(a1 + 48)) {
    **(void **)(a1 + 48) = (id)[v3 copy];
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void __62__MADComputeService_scheduleRequests_assetURLs_options_error___block_invoke_93(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v10 = 138412546;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%@[Finish] %@", (uint8_t *)&v10, 0x16u);
  }
  if ((a2 & 1) == 0)
  {
    if (*(void *)(a1 + 56)) {
      **(void **)(a1 + 56) = (id)[v5 copy];
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

- (BOOL)pauseWithRequestID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v7 = [(MADComputeService *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__MADComputeService_pauseWithRequestID_error___block_invoke;
  v11[3] = &unk_1E6CAD3E0;
  v11[4] = &v18;
  v11[5] = &v12;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v11];
  [v8 cancelWithRequestID:v6];

  if (a4) {
    *a4 = (id)[(id)v13[5] copy];
  }
  char v9 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __46__MADComputeService_pauseWithRequestID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __46__MADComputeService_pauseWithRequestID_error___block_invoke_cold_1();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)resumeWithRequestID:(id)a3 progressHandler:(id)a4 resultsHandler:(id)a5 completionHandler:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, void *))a6;
  uint64_t v14 = [NSString stringWithFormat:@"ResumeRequest: %@", v10];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v45 = v14;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADComputeService][Resume] %@", buf, 0xCu);
  }
  uint64_t v15 = [(MADComputeService *)self registerProgressHandler:v11 requestID:v10];
  if (v15)
  {
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"[MADComputeService][Resume] Failed to register progressHandler (%d)", v15);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:]();
    }
    uint64_t v42 = *MEMORY[0x1E4F28568];
    uint64_t v43 = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:(int)v15 userInfo:v17];
    v13[2](v13, 0, v18);
  }
  else
  {
    uint64_t v19 = [(MADComputeService *)self registerResultsHandler:v12 requestID:v10];
    if (v19)
    {
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"[MADComputeService][Resume] Failed to register resultsHandler (%d)", v19);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:]();
      }
      uint64_t v40 = *MEMORY[0x1E4F28568];
      id v41 = v20;
      char v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:(int)v19 userInfo:v21];
      v13[2](v13, 0, v22);
    }
    else
    {
      uint64_t v23 = [(MADComputeService *)self connection];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __90__MADComputeService_resumeWithRequestID_progressHandler_resultsHandler_completionHandler___block_invoke;
      v35[3] = &unk_1E6CAD740;
      v35[4] = self;
      id v24 = v10;
      id v36 = v24;
      id v25 = v13;
      id v37 = v25;
      id v29 = [v23 remoteObjectProxyWithErrorHandler:v35];

      if (v29)
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __90__MADComputeService_resumeWithRequestID_progressHandler_resultsHandler_completionHandler___block_invoke_107;
        v30[3] = &unk_1E6CAD768;
        id v31 = v14;
        v32 = self;
        id v33 = v24;
        v34 = v25;
        [v29 resumeWithRequestID:v33 reply:v30];

        id v26 = v31;
      }
      else
      {
        id v26 = objc_msgSend(NSString, "stringWithFormat:", @"[MADComputeService][Resume] Failed to connect to analysis service during %s", "-[MADComputeService resumeWithRequestID:progressHandler:resultsHandler:completionHandler:]");
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:]();
        }
        uint64_t v38 = *MEMORY[0x1E4F28568];
        id v39 = v26;
        uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        [(MADComputeService *)self deregisterProgressHandlerForRequestID:v24];
        [(MADComputeService *)self deregisterResultsHandlerForRequestID:v24];
        v28 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v27];
        ((void (**)(id, id, void *))v25)[2](v25, v24, v28);
      }
    }
  }
}

void __90__MADComputeService_resumeWithRequestID_progressHandler_resultsHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __90__MADComputeService_resumeWithRequestID_progressHandler_resultsHandler_completionHandler___block_invoke_cold_1();
  }
  [*(id *)(a1 + 32) deregisterProgressHandlerForRequestID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) deregisterResultsHandlerForRequestID:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = (void *)[v3 copy];
  (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v6);
}

void __90__MADComputeService_resumeWithRequestID_progressHandler_resultsHandler_completionHandler___block_invoke_107(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADComputeService][Resume][Finish] %@", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 40) deregisterProgressHandlerForRequestID:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) deregisterResultsHandlerForRequestID:*(void *)(a1 + 48)];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v7 = (void *)[v3 copy];
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);
}

- (void)cancelWithRequestID:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(MADComputeService *)self connection];
  uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_112];
  [v5 cancelWithRequestID:v6];
}

void __41__MADComputeService_cancelWithRequestID___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __46__MADComputeService_pauseWithRequestID_error___block_invoke_cold_1();
  }
}

- (void)cancelAllRequests
{
  id v3 = [(MADComputeService *)self connection];
  BOOL v2 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_114];
  [v2 cancelAllRequests];
}

void __38__MADComputeService_cancelAllRequests__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __38__MADComputeService_cancelAllRequests__block_invoke_cold_1();
  }
}

- (void)reportProgress:(double)a3 requestID:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__115;
  id v17 = __Block_byref_object_dispose__116;
  id v18 = 0;
  progressHandlerQueue = self->_progressHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MADComputeService_reportProgress_requestID___block_invoke;
  block[3] = &unk_1E6CAD7E0;
  id v12 = &v13;
  block[4] = self;
  id v8 = v6;
  id v11 = v8;
  dispatch_sync(progressHandlerQueue, block);
  uint64_t v9 = v14[5];
  if (v9)
  {
    (*(void (**)(uint64_t, id, double))(v9 + 16))(v9, v8, a3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[MADComputeService reportProgress:requestID:]();
  }

  _Block_object_dispose(&v13, 8);
}

void __46__MADComputeService_reportProgress_requestID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int)registerProgressHandler:(id)a3 requestID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  progressHandlerQueue = self->_progressHandlerQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__MADComputeService_registerProgressHandler_requestID___block_invoke;
  v12[3] = &unk_1E6CAD808;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  uint64_t v15 = &v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(progressHandlerQueue, v12);
  LODWORD(v6) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return (int)v6;
}

void __55__MADComputeService_registerProgressHandler_requestID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];

  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __55__MADComputeService_registerProgressHandler_requestID___block_invoke_cold_2();
    }
    uint64_t v3 = *(void *)(a1[7] + 8);
    int v4 = -18;
LABEL_5:
    *(_DWORD *)(v3 + 24) = v4;
    return;
  }
  if (!a1[6])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __55__MADComputeService_registerProgressHandler_requestID___block_invoke_cold_1();
    }
    uint64_t v3 = *(void *)(a1[7] + 8);
    int v4 = -50;
    goto LABEL_5;
  }
  id v5 = (id)MEMORY[0x1E01AAEE0]();
  objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:");
}

- (int)deregisterProgressHandlerForRequestID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  progressHandlerQueue = self->_progressHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MADComputeService_deregisterProgressHandlerForRequestID___block_invoke;
  block[3] = &unk_1E6CAD830;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(progressHandlerQueue, block);
  LODWORD(progressHandlerQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)progressHandlerQueue;
}

void __59__MADComputeService_deregisterProgressHandlerForRequestID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];

  if (v2)
  {
    uint64_t v3 = a1[5];
    id v4 = *(void **)(a1[4] + 32);
    [v4 removeObjectForKey:v3];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __59__MADComputeService_deregisterProgressHandlerForRequestID___block_invoke_cold_1();
    }
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = -18;
  }
}

- (void)handleResults:(id)a3 assetRepresentation:(id)a4 requestID:(id)a5 error:(id)a6 acknowledgement:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, uint64_t))a7;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__115;
  uint64_t v27 = __Block_byref_object_dispose__116;
  id v28 = 0;
  resultsHandlerQueue = self->_resultsHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__MADComputeService_handleResults_assetRepresentation_requestID_error_acknowledgement___block_invoke;
  block[3] = &unk_1E6CAD7E0;
  id v22 = &v23;
  block[4] = self;
  id v18 = v14;
  id v21 = v18;
  dispatch_sync(resultsHandlerQueue, block);
  if (v24[5])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v18;
      _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADComputeService] Calling resultsHandler for %@", buf, 0xCu);
    }
    (*(void (**)(void))(v24[5] + 16))();
    v16[2](v16, 1);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v19 = (void *)MEMORY[0x1E01AAEE0](v16);
      *(_DWORD *)buf = 138412290;
      id v30 = v19;
      _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADComputeService] ACK sent %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[MADComputeService handleResults:assetRepresentation:requestID:error:acknowledgement:]();
    }
    v16[2](v16, 0);
  }

  _Block_object_dispose(&v23, 8);
}

void __87__MADComputeService_handleResults_assetRepresentation_requestID_error_acknowledgement___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int)registerResultsHandler:(id)a3 requestID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  resultsHandlerQueue = self->_resultsHandlerQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__MADComputeService_registerResultsHandler_requestID___block_invoke;
  v12[3] = &unk_1E6CAD808;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v15 = &v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(resultsHandlerQueue, v12);
  LODWORD(v6) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return (int)v6;
}

void __54__MADComputeService_registerResultsHandler_requestID___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 5;
  uint64_t v3 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:a1[5]];

  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __54__MADComputeService_registerResultsHandler_requestID___block_invoke_cold_2();
    }
    uint64_t v4 = *(void *)(a1[7] + 8);
    int v5 = -18;
LABEL_5:
    *(_DWORD *)(v4 + 24) = v5;
    return;
  }
  if (!a1[6])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __54__MADComputeService_registerResultsHandler_requestID___block_invoke_cold_1();
    }
    uint64_t v4 = *(void *)(a1[7] + 8);
    int v5 = -50;
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *v2;
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADComputeService] Registering resultsHandler for %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = (void *)MEMORY[0x1E01AAEE0](a1[6]);
  [*(id *)(a1[4] + 48) setObject:v7 forKeyedSubscript:a1[5]];
}

- (int)deregisterResultsHandlerForRequestID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  resultsHandlerQueue = self->_resultsHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MADComputeService_deregisterResultsHandlerForRequestID___block_invoke;
  block[3] = &unk_1E6CAD830;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v6 = v4;
  dispatch_sync(resultsHandlerQueue, block);
  LODWORD(resultsHandlerQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)resultsHandlerQueue;
}

void __58__MADComputeService_deregisterResultsHandlerForRequestID___block_invoke(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 5;
  uint64_t v3 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:a1[5]];

  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *v2;
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADComputeService] Deregister resultsHandler for %@", (uint8_t *)&v5, 0xCu);
    }
    [*(id *)(a1[4] + 48) removeObjectForKey:a1[5]];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __58__MADComputeService_deregisterResultsHandlerForRequestID___block_invoke_cold_1();
    }
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = -18;
  }
}

- (id)resultDirectoryURL
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = 0;
  uint64_t v3 = [v2 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v16];
  id v4 = v16;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v3;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADComputeService] applicationSupportURL %@", buf, 0xCu);
  }
  int v5 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v6 = [v5 bundleIdentifier];

  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v7 = [MEMORY[0x1E4F28B50] mainBundle];
  int v8 = [v7 resourceURL];
  id v9 = [v8 path];
  int v10 = [v9 isEqualToString:@"/usr/local/bin"];

  if (!v10)
  {
    uint64_t v13 = [v3 URLByAppendingPathComponent:v6];
  }
  else
  {
LABEL_5:
    uint64_t v11 = (void *)MEMORY[0x1E4F1CB10];
    id v12 = NSTemporaryDirectory();
    uint64_t v13 = [v11 fileURLWithPath:v12];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v13;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADComputeService] resultDirectoryURL %@", buf, 0xCu);
  }
  int v14 = [v13 URLByAppendingPathComponent:@"madcs"];

  return v14;
}

- (id)extensionDataForResultDirectoryURL:(id *)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    *a3 = [(MADComputeService *)self resultDirectoryURL];
    uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v7 = *a3;
    id v24 = 0;
    char v8 = [v6 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v24];
    id v9 = v24;

    if ((v8 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[MADComputeService extensionDataForResultDirectoryURL:error:]();
      }
      uint64_t v20 = 0;
      if (a4) {
        *a4 = (id)[v9 copy];
      }
      goto LABEL_27;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v10 = *a3;
      *(_DWORD *)buf = 138412546;
      id v28 = @"[MADComputeService][URLExtensionDataResultDirectory]";
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%@ Preparing extension data for URL at %@", buf, 0x16u);
    }
    id v11 = [*a3 path];
    [v11 UTF8String];
    id v12 = (void *)sandbox_extension_issue_file();

    if (v12)
    {
      uint64_t v13 = [NSString stringWithUTF8String:v12];
      free(v12);
      if ([v13 length])
      {
        int v14 = (void *)MEMORY[0x1E4F1C9B8];
        id v15 = v13;
        uint64_t v16 = [v15 UTF8String];
        id v17 = v15;
        uint64_t v18 = objc_msgSend(v14, "dataWithBytes:length:", v16, strlen((const char *)objc_msgSend(v17, "UTF8String")) + 1);
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = v19;
          goto LABEL_23;
        }
      }
    }
    id v19 = [NSString stringWithFormat:@"%@ Failed to generate extension data", @"[MADComputeService][URLExtensionDataResultDirectory]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:]();
    }
    if (!a4)
    {
      uint64_t v20 = 0;
      goto LABEL_26;
    }
    uint64_t v25 = *MEMORY[0x1E4F28568];
    id v26 = v19;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v17];
    uint64_t v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

LABEL_26:
LABEL_27:
    id v21 = v9;
    goto LABEL_28;
  }
  id v21 = [NSString stringWithFormat:@"%@ Missing directoryURL", @"[MADComputeService][URLExtensionDataResultDirectory]"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:]();
  }
  if (a4)
  {
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = v21;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v22];
  }
  uint64_t v20 = 0;
LABEL_28:

  return v20;
}

- (id)extensionDataFromAssetURLs:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v21;
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        char v8 = (void *)MEMORY[0x1E01AAD10]();
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v32 = @"[MADComputeService][URLExtensionData]";
          __int16 v33 = 2112;
          v34 = v7;
          _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%@ Preparing extension data for URL at %@", buf, 0x16u);
        }
        id v9 = [v7 path];
        [v9 UTF8String];
        id v10 = (void *)sandbox_extension_issue_file();

        if (v10)
        {
          id v11 = [NSString stringWithUTF8String:v10];
          free(v10);
          if ([v11 length])
          {
            id v12 = (void *)MEMORY[0x1E4F1C9B8];
            id v13 = v11;
            int v14 = objc_msgSend(v12, "dataWithBytes:length:", objc_msgSend(v13, "UTF8String"), strlen((const char *)objc_msgSend(v13, "UTF8String")) + 1);
            if (v14) {
              [v23 addObject:v14];
            }
          }
          else
          {
            int v14 = 0;
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v4);
  }

  uint64_t v15 = [obj count];
  if (v15 == [v23 count])
  {
    uint64_t v16 = v23;
    id v17 = v23;
  }
  else
  {
    uint64_t v18 = [NSString stringWithFormat:@"%@ Failed to prepare extension data to all assets (%lu, expected: %lu)", @"[MADComputeService][URLExtensionData]", objc_msgSend(v23, "count"), objc_msgSend(obj, "count")];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:]();
    }
    if (a4)
    {
      uint64_t v29 = *MEMORY[0x1E4F28568];
      id v30 = v18;
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v19];
    }
    id v17 = 0;
    uint64_t v16 = v23;
  }

  return v17;
}

- (BOOL)_validFileURL:(id)a3 toRequestID:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADComputeService] Checking file %@ comfining to %@", (uint8_t *)&v14, 0x16u);
  }
  id v7 = [v6 componentsSeparatedByString:@"-"];
  char v8 = [v5 lastPathComponent];
  id v9 = [v8 componentsSeparatedByString:@"-"];

  if ((unint64_t)[v9 count] < 3)
  {
    char v12 = 0;
  }
  else
  {
    id v10 = [v9 objectAtIndexedSubscript:2];
    id v11 = [v7 objectAtIndexedSubscript:1];
    char v12 = [v10 isEqualToString:v11];
  }
  return v12;
}

- (id)fetchResultsWithRequestID:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v21 = [NSString stringWithFormat:@"result-%@", v4];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [(MADComputeService *)self resultDirectoryURL];
  id v22 = [v5 enumeratorAtURL:v6 includingPropertiesForKeys:0 options:0 errorHandler:0];

  id v23 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v22;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        char v12 = (void *)MEMORY[0x1E01AAD10]();
        if ([(MADComputeService *)self _validFileURL:v11 toRequestID:v4])
        {
          id v13 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v11];
          int v14 = (void *)MEMORY[0x1E4F28DC0];
          uint64_t v15 = objc_opt_class();
          id v24 = 0;
          __int16 v16 = [v14 unarchivedObjectOfClass:v15 fromData:v13 error:&v24];
          id v17 = v24;
          uint64_t v18 = v17;
          if (v16) {
            BOOL v19 = v17 == 0;
          }
          else {
            BOOL v19 = 0;
          }
          if (v19)
          {
            [v23 addObject:v16];
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v30 = @"[MADComputeService][FetchResults]";
            __int16 v31 = 2112;
            v32 = v18;
            _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%@ Failed to load result data %@", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v8);
  }

  return v23;
}

- (BOOL)purgeResultsWithRequestID:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v24 = [NSString stringWithFormat:@"result-%@", v5];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = [(MADComputeService *)self resultDirectoryURL];
  uint64_t v8 = [v6 enumeratorAtURL:v7 includingPropertiesForKeys:0 options:0 errorHandler:0];

  long long v25 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v32;
    uint64_t v26 = *MEMORY[0x1E4F28760];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * v11);
        id v13 = (void *)MEMORY[0x1E01AAD10]();
        if ([(MADComputeService *)self _validFileURL:v12 toRequestID:v5])
        {
          int v14 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v30 = 0;
          int v15 = [v14 removeItemAtURL:v12 error:&v30];
          id v16 = v30;

          if (!(v15 & 1 | (a4 == 0)))
          {
            id v17 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v39 = v27;
            uint64_t v18 = [NSString stringWithFormat:@"Failed to purge result %@ - %@", v5, v16];
            uint64_t v40 = v18;
            BOOL v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
            *a4 = [v17 errorWithDomain:v26 code:-50 userInfo:v19];

            int v15 = 0;
          }
        }
        else
        {
          int v15 = 1;
        }
        if (!v15)
        {
          id v21 = obj;
          goto LABEL_19;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = @"[MADComputeService][PurgeResults]";
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%@ Result does not exist!", buf, 0xCu);
  }
  if (a4)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    id v21 = [NSString stringWithFormat:@"Result for %@ is not available", v5];
    uint64_t v36 = v21;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    *a4 = [v20 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v22];

LABEL_19:
  }

  return 0;
}

- (BOOL)removeRequest:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = @"[MADComputeService][RemoveRequest]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%@ Start removing %@ ...", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v32 = 0;
  id v7 = [(MADComputeService *)self connection];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __41__MADComputeService_removeRequest_error___block_invoke;
  v24[3] = &unk_1E6CAD858;
  long long v25 = @"[MADComputeService][RemoveRequest]";
  uint64_t v26 = a4;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v24];

  if (v8)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __41__MADComputeService_removeRequest_error___block_invoke_163;
    v19[3] = &unk_1E6CAD7B8;
    uint64_t v20 = @"[MADComputeService][RemoveRequest]";
    id v21 = v6;
    id v22 = buf;
    id v23 = a4;
    [v8 removeWithRequestID:v21 reply:v19];

    uint64_t v9 = v20;
  }
  else
  {
    uint64_t v9 = [NSString stringWithFormat:@"%@ Failed to connect to compute service", @"[MADComputeService][RemoveRequest]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[MADComputeService performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:]();
    }
    if (a4)
    {
      uint64_t v29 = *MEMORY[0x1E4F28568];
      id v30 = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v10];
    }
  }

  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    id v18 = 0;
    BOOL v11 = [(MADComputeService *)self purgeResultsWithRequestID:v6 error:&v18];
    id v12 = v18;
    if (v11)
    {
      if (a4)
      {
        id v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        int v14 = [NSString stringWithFormat:@"Task removed, but result purging is incomplete - %@", v12];
        long long v28 = v14;
        int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        *a4 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v15];
      }
      *(unsigned char *)(*(void *)&buf[8] + 24) = 0;
    }

    BOOL v16 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  }
  else
  {
    BOOL v16 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v16;
}

void __41__MADComputeService_removeRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __62__MADComputeService_scheduleRequests_assetURLs_options_error___block_invoke_cold_1();
  }
  if (*(void *)(a1 + 40)) {
    **(void **)(a1 + 40) = (id)[v3 copy];
  }
}

void __41__MADComputeService_removeRequest_error___block_invoke_163(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%@ Finished removing %@", (uint8_t *)&v8, 0x16u);
  }
  if ((a2 & 1) == 0 && *(void *)(a1 + 56)) {
    **(void **)(a1 + 56) = (id)[v5 copy];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsHandlers, 0);
  objc_storeStrong((id *)&self->_resultsHandlerQueue, 0);
  objc_storeStrong((id *)&self->_progressHandlers, 0);
  objc_storeStrong((id *)&self->_progressHandlerQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

- (void)init
{
    a5,
    a6,
    a7,
    a8,
    0);
}

void __31__MADComputeService_connection__block_invoke_2_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[MADComputeService] Client XPC connection interrupted", v0, 2u);
}

void __31__MADComputeService_connection__block_invoke_61_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADComputeService] Failed to get sandbox extension data for assetURLs - %@", v1, v2, v3, v4, v5);
}

- (void)performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "%@", v1, v2, v3, v4, v5);
}

- (void)performRequests:assetURLs:options:progressHandler:resultsHandler:completionHandler:.cold.5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADComputeService] Failed to get extension data for resultDirectoryURL - %@", v1, v2, v3, v4, v5);
}

void __104__MADComputeService_performRequests_assetURLs_options_progressHandler_resultsHandler_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADComputeService] Error connecting to analysis service - %@", v1, v2, v3, v4, v5);
}

- (void)scheduleRequests:assetURLs:options:error:.cold.1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "%@ Failed to get extension data for assetURLs - %@", v1, v2, v3, v4, 2u);
}

- (void)scheduleRequests:assetURLs:options:error:.cold.3()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "%@ Failed to get extension data for resultDirectoryURL - %@", v1, v2, v3, v4, 2u);
}

void __62__MADComputeService_scheduleRequests_assetURLs_options_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_0(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "%@ Error connecting to analysis service - %@", v1, v2, v3, v4, v5);
}

void __46__MADComputeService_pauseWithRequestID_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADComputeService] Error connecting to service to cancelRequestID %@", v1, v2, v3, v4, v5);
}

void __90__MADComputeService_resumeWithRequestID_progressHandler_resultsHandler_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADComputeService][Resume] Error connecting to analysis service - %@", v1, v2, v3, v4, v5);
}

void __38__MADComputeService_cancelAllRequests__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADComputeService] Error connecting to service to cancelAllRequests %@", v1, v2, v3, v4, v5);
}

- (void)reportProgress:requestID:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADComputeService] No progressHandler for %@; cannot report",
    v1,
    v2,
    v3,
    v4,
    v5);
}

void __55__MADComputeService_registerProgressHandler_requestID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADComputeService] No progressHandler defined for %@", v1, v2, v3, v4, v5);
}

void __55__MADComputeService_registerProgressHandler_requestID___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADComputeService] ProgressHandler already set for %@", v1, v2, v3, v4, v5);
}

void __59__MADComputeService_deregisterProgressHandlerForRequestID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADComputeService] ProgressHandler NOT set for %@", v1, v2, v3, v4, v5);
}

- (void)handleResults:assetRepresentation:requestID:error:acknowledgement:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADComputeService] No resultsHandler for %@; cannot report",
    v1,
    v2,
    v3,
    v4,
    v5);
}

void __54__MADComputeService_registerResultsHandler_requestID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADComputeService] No resultsHandler defined for %@", v1, v2, v3, v4, v5);
}

void __54__MADComputeService_registerResultsHandler_requestID___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADComputeService] ResultsHandler already set for %@", v1, v2, v3, v4, v5);
}

void __58__MADComputeService_deregisterResultsHandlerForRequestID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "[MADComputeService] ResultsHandler NOT set for %@", v1, v2, v3, v4, v5);
}

- (void)extensionDataForResultDirectoryURL:error:.cold.3()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  int v2 = 138412802;
  uint64_t v3 = @"[MADComputeService][URLExtensionDataResultDirectory]";
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_error_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@ Failed to create URL at %@ - %@", (uint8_t *)&v2, 0x20u);
}

@end