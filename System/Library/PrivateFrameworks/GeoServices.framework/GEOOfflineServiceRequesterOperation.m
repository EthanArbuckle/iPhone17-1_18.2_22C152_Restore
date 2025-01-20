@interface GEOOfflineServiceRequesterOperation
- (GEOOfflineServiceRequesterOperation)initWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 willSendRequestHandler:(id)a9 validationHandler:(id)a10 completionHandler:(id)a11;
- (id)parseResponse:(id)a3 ofType:(Class)a4;
- (id)validateRequest:(id)a3 withAvailableRegions:(id)a4 returningResponseOrError:(id *)a5;
- (void)_cleanup;
- (void)_processRequestWithAvailableRegions:(id)a3 requestToSend:(id)a4;
- (void)_requestCompletedWithResponse:(id)a3 error:(id)a4;
- (void)_start;
- (void)cancel;
- (void)dealloc;
- (void)start;
@end

@implementation GEOOfflineServiceRequesterOperation

- (GEOOfflineServiceRequesterOperation)initWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 willSendRequestHandler:(id)a9 validationHandler:(id)a10 completionHandler:(id)a11
{
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v43 = a5;
  id v41 = a6;
  id v19 = a6;
  id v42 = a7;
  id v20 = a9;
  id v21 = a10;
  v22 = v20;
  id v23 = a11;
  v50.receiver = self;
  v50.super_class = (Class)GEOOfflineServiceRequesterOperation;
  v24 = [(GEOOfflineServiceRequesterOperation *)&v50 init];
  if (v24)
  {
    id v38 = v19;
    v39 = v17;
    v25 = [v19 debugRequestName];
    v26 = (void *)[v25 copy];

    objc_storeStrong((id *)&v24->_debugRequestName, v26);
    objc_storeStrong((id *)&v24->_request, a3);
    objc_storeStrong((id *)&v24->_auditToken, a5);
    objc_storeStrong((id *)&v24->_traits, obj);
    objc_storeStrong((id *)&v24->_config, v41);
    v24->_dataRequestKind = ($7466BF22B2A7275A1F5DB80FF4552E0B)[(GEOServiceRequestConfiguring *)v24->_config dataRequestKindForRequest:v24->_request traits:v18];
    objc_storeStrong((id *)&v24->_throttleToken, a7);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v27 = [(GEOServiceRequestConfiguring *)v24->_config offlineTaskQueue];
      taskQueue = v24->_taskQueue;
      v24->_taskQueue = (GEOTaskQueue *)v27;
    }
    uint64_t v29 = [v22 copy];
    id willSendRequestHandler = v24->_willSendRequestHandler;
    v24->_id willSendRequestHandler = (id)v29;

    uint64_t v31 = [v21 copy];
    id validationHandler = v24->_validationHandler;
    v24->_id validationHandler = (id)v31;

    objc_initWeak(&location, v24);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __161__GEOOfflineServiceRequesterOperation_initWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_validationHandler_completionHandler___block_invoke;
    v44[3] = &unk_1E53F6C10;
    objc_copyWeak(&v48, &location);
    id v45 = v39;
    id v46 = v26;
    id v47 = v23;
    id v33 = v26;
    id v17 = v39;
    id v34 = v33;
    uint64_t v35 = MEMORY[0x18C120660](v44);
    id completionHandler = v24->_completionHandler;
    v24->_id completionHandler = (id)v35;

    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
    id v19 = v38;
  }

  return v24;
}

void __161__GEOOfflineServiceRequesterOperation_initWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_validationHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v8 = GEOGetOfflineRequesterLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = *(void **)(a1 + 32);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    int v18 = 138413314;
    id v19 = v10;
    __int16 v20 = 2048;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 2048;
    id v25 = v5;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Completed request %@<%p> with response %@<%p> error: %@", (uint8_t *)&v18, 0x34u);
  }
  v14 = GEOFindOrCreateLog("com.apple.Maps.RequestResponse", (const char *)[*(id *)(a1 + 40) UTF8String]);
  v15 = v14;
  if (v6)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412546;
      id v19 = 0;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "Error for task %@ : %@", (uint8_t *)&v18, 0x16u);
    }
    _GEORequestResponseLogError((uint64_t)v15, 0, v6);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = [v5 data];
      int v17 = [v16 length];
      int v18 = 138412546;
      id v19 = 0;
      __int16 v20 = 1024;
      LODWORD(v21) = v17;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_INFO, "Response from task %@ - responseSize: %u", (uint8_t *)&v18, 0x12u);
    }
    _GEORequestResponseLogResponse(v15, 0, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained _recordAnalyticsDataForResponse:v5];
  }
  [WeakRetained[15] taskFinished:WeakRetained];
}

- (void)start
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = GEOGetOfflineRequesterLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    request = self->_request;
    int v12 = 138412546;
    v13 = v5;
    __int16 v14 = 2048;
    v15 = request;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Issuing request %@<%p>", (uint8_t *)&v12, 0x16u);
  }
  v7 = GEOFindOrCreateLog("com.apple.Maps.RequestResponse", [(NSString *)self->_debugRequestName UTF8String]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (PBRequest *)objc_claimAutoreleasedReturnValue();
    v10 = [0 publicLogDescription];
    int v12 = 138412802;
    v13 = 0;
    __int16 v14 = 2114;
    v15 = v9;
    __int16 v16 = 2114;
    int v17 = v10;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_INFO, "Request with task %@, RequestType: %{public}@, dataRequest: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  _GEORequestResponseLogRequest(v7, 0, 0, self->_request);

  taskQueue = self->_taskQueue;
  if (taskQueue) {
    [(GEOTaskQueue *)taskQueue addTask:self];
  }
  else {
    [(GEOOfflineServiceRequesterOperation *)self _start];
  }
}

- (void)_start
{
  v3 = +[GEOOfflineDataAccess sharedInstance];
  v4 = offlineServiceQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__GEOOfflineServiceRequesterOperation__start__block_invoke;
  v5[3] = &unk_1E53DA9B0;
  v5[4] = self;
  [v3 getFullyDownloadedRegionsWithCallbackQueue:v4 callback:v5];
}

void __45__GEOOfflineServiceRequesterOperation__start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v5 || !v6)
  {
    uint64_t v8 = v7[5];
    if (v8)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __45__GEOOfflineServiceRequesterOperation__start__block_invoke_2;
      v9[3] = &unk_1E53F6C38;
      v9[4] = v7;
      id v10 = v5;
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
    else
    {
      [v7 _processRequestWithAvailableRegions:v5 requestToSend:v7[3]];
    }
  }
  else
  {
    (*(void (**)(void))(v7[7] + 16))();
  }
}

void __45__GEOOfflineServiceRequesterOperation__start__block_invoke_2(uint64_t a1, void *a2)
{
  v4 = a2;
  if (!a2) {
    v4 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  id v5 = v4;
  id v6 = a2;
  v7 = offlineServiceQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__GEOOfflineServiceRequesterOperation__start__block_invoke_3;
  block[3] = &unk_1E53D99F0;
  uint64_t v8 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v11 = v8;
  id v12 = v5;
  id v9 = v5;
  dispatch_async(v7, block);
}

uint64_t __45__GEOOfflineServiceRequesterOperation__start__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processRequestWithAvailableRegions:*(void *)(a1 + 40) requestToSend:*(void *)(a1 + 48)];
}

- (void)_processRequestWithAvailableRegions:(id)a3 requestToSend:(id)a4
{
  v57[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = offlineServiceQueue();
  dispatch_assert_queue_V2(v8);

  if (!self->_canceled)
  {
    id v11 = objc_alloc_init(GEOPBOfflineRequestMetadata);
    requestMetadata = self->_requestMetadata;
    self->_requestMetadata = v11;

    uint64_t add = atomic_fetch_add(_requestCounter, 1u);
    __int16 v14 = NSString;
    v15 = (objc_class *)objc_opt_class();
    __int16 v16 = NSStringFromClass(v15);
    int v17 = [v14 stringWithFormat:@"%@<%p>:%u", v16, self->_request, add];
    [(GEOPBOfflineRequestMetadata *)self->_requestMetadata setRequestIdentifier:v17];

    if (GEOConfigGetBOOL(GeoOfflineConfig_DebugLogsEnabled, (uint64_t)off_1E9115668)) {
      [(GEOPBOfflineRequestMetadata *)self->_requestMetadata setDebugLog:1];
    }
    uint64_t v18 = (void *)[v6 mutableCopy];
    [(GEOPBOfflineRequestMetadata *)self->_requestMetadata setDownloadedRegions:v18];

    int type = self->_dataRequestKind.type;
    if (type > 767)
    {
      uint64_t v20 = 1;
      if (type != 768 && type != 1792)
      {
        if (type != 2857) {
          goto LABEL_17;
        }
        uint64_t v20 = 5;
      }
    }
    else
    {
      switch(type)
      {
        case 512:
          uint64_t v20 = 2;
          break;
        case 672:
          uint64_t v20 = 3;
          break;
        case 673:
          uint64_t v20 = 4;
          break;
        default:
          goto LABEL_17;
      }
    }
    [(GEOPBOfflineRequestMetadata *)self->_requestMetadata setMessageType:v20];
LABEL_17:
    if (![(GEOPBOfflineRequestMetadata *)self->_requestMetadata hasMessageType])
    {
      uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
      id v32 = (id)*MEMORY[0x1E4F1D138];
      v57[0] = @"Offline request not implemented (yet?)";
      v56[0] = v32;
      v56[1] = @"GEORequestClass";
      id v33 = (objc_class *)objc_opt_class();
      id v34 = NSStringFromClass(v33);
      v57[1] = v34;
      v56[2] = @"GEODataRequestKind";
      uint64_t v35 = [NSNumber numberWithInt:(self->_dataRequestKind.subtype.raw | self->_dataRequestKind.type)];
      v57[2] = v35;
      v56[3] = @"GEODataRequestKindString";
      v36 = GEODataRequestKindAsString(*(void *)&self->_dataRequestKind);
      v57[3] = v36;
      v56[4] = @"GEOServiceRequestConfiguring";
      v37 = [(GEOServiceRequestConfiguring *)self->_config description];
      v57[4] = v37;
      id v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:5];
      v39 = [v31 GEOErrorWithCode:-10 userInfo:v38];

      (*((void (**)(void))self->_completionHandler + 2))();
      [(GEOOfflineServiceRequesterOperation *)self _cleanup];

      goto LABEL_37;
    }
    id v21 = +[GEORequestCounter sharedCounter];
    __int16 v22 = objc_msgSend(v21, "requestCounterTicketForType:auditToken:traits:", -[GEOServiceRequestConfiguring dataRequestKindForRequest:traits:](self->_config, "dataRequestKindForRequest:traits:", self->_request, self->_traits), self->_auditToken, self->_traits);

    [v22 startingRequestWithExplicitInterfaces:256];
    id v51 = 0;
    uint64_t v23 = [(GEOOfflineServiceRequesterOperation *)self validateRequest:v7 withAvailableRegions:v6 returningResponseOrError:&v51];
    id v24 = v51;
    if (!(v23 | (unint64_t)v24))
    {
      id v25 = [[GEOOfflineServiceRequest alloc] initWithTraits:self->_traits auditToken:self->_auditToken throttleToken:self->_throttleToken];
      v40 = [v7 data];
      [(GEOOfflineServiceRequest *)v25 setRequest:v40];

      id v41 = [(GEOPBOfflineRequestMetadata *)self->_requestMetadata data];
      [(GEOOfflineServiceRequest *)v25 setRequestMetadata:v41];

      id v42 = [(GEOOfflineServiceRequest *)v25 request];
      uint64_t v43 = [v42 length];
      v44 = [(GEOOfflineServiceRequest *)v25 requestMetadata];
      uint64_t v45 = [v44 length] + v43;

      id v46 = offlineServiceConnection();
      id v47 = offlineServiceQueue();
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __89__GEOOfflineServiceRequesterOperation__processRequestWithAvailableRegions_requestToSend___block_invoke;
      v48[3] = &unk_1E53F6C60;
      v48[4] = self;
      id v49 = v22;
      uint64_t v50 = v45;
      [(GEOXPCRequest *)v25 send:v46 withReply:v47 handler:v48];

LABEL_36:
      goto LABEL_37;
    }
    id v25 = (GEOOfflineServiceRequest *)v24;
    NSUInteger v26 = [(NSString *)self->_debugRequestName length];
    if (v23)
    {
      if (v26)
      {
        id v27 = GEOFindOrCreateLog("com.apple.Maps.RequestResponse", [(NSString *)self->_debugRequestName UTF8String]);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = [(id)v23 data];
          int v29 = [v28 length];
          *(_DWORD *)buf = 138412546;
          uint64_t v53 = 0;
          __int16 v54 = 1024;
          LODWORD(v55) = v29;
          _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_INFO, "Response from task %@ - responseSize: %u", buf, 0x12u);
        }
        _GEORequestResponseLogResponse(v27, 0, (void *)v23);
      }
      uint64_t v30 = (*((void (**)(void))self->_validationHandler + 2))();

      if (!v30)
      {
        id v25 = 0;
        goto LABEL_35;
      }
      id v25 = (GEOOfflineServiceRequest *)v30;
    }
    else
    {
      if (!v26)
      {
LABEL_33:
        uint64_t v23 = 0;
LABEL_35:
        [v22 explicitInterfaceRequestCompleted:v25 xmitBytes:0 recvBytes:0];
        [(GEOOfflineServiceRequesterOperation *)self _requestCompletedWithResponse:v23 error:v25];

        goto LABEL_36;
      }
      uint64_t v23 = GEOFindOrCreateLog("com.apple.Maps.RequestResponse", [(NSString *)self->_debugRequestName UTF8String]);
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v53 = 0;
        __int16 v54 = 2112;
        v55 = v25;
        _os_log_impl(&dword_188D96000, (os_log_t)v23, OS_LOG_TYPE_ERROR, "Error for task %@ : %@", buf, 0x16u);
      }
      _GEORequestResponseLogError(v23, 0, v25);
    }

    goto LABEL_33;
  }
  id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
  id v10 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2];
  completionHandler[2](completionHandler, 0, v10);

  [(GEOOfflineServiceRequesterOperation *)self _cleanup];
LABEL_37:
}

void __89__GEOOfflineServiceRequesterOperation__processRequestWithAvailableRegions_requestToSend___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 response];
  uint64_t v8 = [v7 length];
  id v9 = [v5 responseMetadata];
  uint64_t v10 = [v9 length] + v8;

  if (*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    id v11 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2];
    [*(id *)(a1 + 40) explicitInterfaceRequestCompleted:v11 xmitBytes:*(void *)(a1 + 48) recvBytes:v10];
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 56) + 16))();
    [*(id *)(a1 + 32) _cleanup];

    id v12 = v6;
    goto LABEL_34;
  }
  if (!v6)
  {
    id v6 = [v5 error];
  }
  v13 = [v5 response];
  uint64_t v14 = [v13 length];

  if (!v14)
  {
    if (!v6)
    {
      int v17 = 0;
      goto LABEL_27;
    }
    if ([*(id *)(*(void *)(a1 + 32) + 32) length])
    {
      id v21 = GEOFindOrCreateLog("com.apple.Maps.RequestResponse", (const char *)[*(id *)(*(void *)(a1 + 32) + 32) UTF8String]);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v29 = 138412546;
        uint64_t v30 = 0;
        __int16 v31 = 2112;
        id v32 = v6;
        _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "Error for task %@ : %@", (uint8_t *)&v29, 0x16u);
      }
      _GEORequestResponseLogError((uint64_t)v21, 0, v6);
    }
    int v17 = 0;
LABEL_20:
    id v12 = v6;
    goto LABEL_28;
  }
  v15 = *(void **)(a1 + 32);
  __int16 v16 = [v5 response];
  int v17 = objc_msgSend(v15, "parseResponse:ofType:", v16, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "responseClass"));

  if (!v17)
  {
    id v12 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11];

    if ([*(id *)(*(void *)(a1 + 32) + 32) length])
    {
      __int16 v22 = GEOFindOrCreateLog("com.apple.Maps.RequestResponse", (const char *)[*(id *)(*(void *)(a1 + 32) + 32) UTF8String]);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v29 = 138412546;
        uint64_t v30 = 0;
        __int16 v31 = 2112;
        id v32 = v12;
        _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_ERROR, "Error for task %@ : %@", (uint8_t *)&v29, 0x16u);
      }
      _GEORequestResponseLogError((uint64_t)v22, 0, v12);
    }
    int v17 = 0;
    goto LABEL_28;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 32) length])
  {
    uint64_t v18 = GEOFindOrCreateLog("com.apple.Maps.RequestResponse", (const char *)[*(id *)(*(void *)(a1 + 32) + 32) UTF8String]);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = [v17 data];
      int v29 = 138412546;
      uint64_t v30 = 0;
      __int16 v31 = 1024;
      LODWORD(v32) = [v19 length];
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_INFO, "Response from task %@ - responseSize: %u", (uint8_t *)&v29, 0x12u);
    }
    _GEORequestResponseLogResponse(v18, 0, v17);
  }
  if (v6) {
    goto LABEL_20;
  }
  uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 48);
  if (!v20)
  {
LABEL_27:
    id v12 = 0;
    goto LABEL_28;
  }
  id v12 = (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v17);
LABEL_28:
  uint64_t v23 = [v5 responseMetadata];
  uint64_t v24 = [v23 length];

  if (v24)
  {
    id v25 = *(void **)(a1 + 32);
    NSUInteger v26 = [v5 responseMetadata];
    id v27 = [v25 parseResponse:v26 ofType:objc_opt_class()];

    uint64_t v28 = GEOGetOfflineRequesterLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      int v29 = 138412290;
      uint64_t v30 = v27;
      _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_DEBUG, "Got response metadata: %@", (uint8_t *)&v29, 0xCu);
    }
  }
  else
  {
    id v27 = 0;
  }
  [*(id *)(a1 + 40) explicitInterfaceRequestCompleted:v12 xmitBytes:*(void *)(a1 + 48) recvBytes:v10];
  [*(id *)(a1 + 32) _requestCompletedWithResponse:v17 error:v12];

LABEL_34:
}

- (void)_requestCompletedWithResponse:(id)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = (void (*)(void))*((void *)self->_completionHandler + 2);
LABEL_8:
    v8();
    goto LABEL_9;
  }
  if ([(GEOMapServiceTraits *)self->_traits requestMode] != 1)
  {
    uint64_t v8 = (void (*)(void))*((void *)self->_completionHandler + 2);
    goto LABEL_8;
  }
  id v9 = [(GEOApplicationAuditToken *)self->_auditToken offlineCohortId];
  objc_initWeak(&location, self);
  uint64_t v10 = GEOGetOfflineRequesterLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v22 = v9;
    _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_INFO, "ONLINE_OFFLINE_FAILOVER request succeeded offline. Waiting for cohort %{public}@ to enter offline mode...", buf, 0xCu);
  }

  id v11 = +[GEOOfflineStateManager shared];
  double Double = GEOConfigGetDouble(GeoOfflineConfig_OnlineOfflineFailoverTimeout, (uint64_t)off_1E91158D8);
  qos_class_self();
  global_queue = (void *)geo_get_global_queue();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__GEOOfflineServiceRequesterOperation__requestCompletedWithResponse_error___block_invoke_35;
  v15[3] = &unk_1E53F6CA8;
  objc_copyWeak(&v19, &location);
  id v14 = v9;
  id v16 = v14;
  id v17 = v6;
  id v18 = 0;
  [v11 waitForTransitionToActiveState:&__block_literal_global_213 forCohortId:v14 timeout:global_queue callbackQueue:v15 callback:Double];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

LABEL_9:
}

BOOL __75__GEOOfflineServiceRequesterOperation__requestCompletedWithResponse_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = a2;
  if (a2 < 2u) {
    return 0;
  }
  if (a2 == 2)
  {
    if (BYTE2(a2) == 1) {
      return 1;
    }
    id v5 = GEOGetOfflineRequesterLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      id v6 = GEOOfflineStateAsString(a2 & 0xFF00FFFF | (BYTE2(a2) << 16));
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_FAULT, "Waiting to transition to Offline:?:Local but got: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    return 0;
  }
  BOOL result = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
  if (result)
  {
    int v7 = 67109120;
    LODWORD(v8) = v3;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v7, 8u);
    return 0;
  }
  return result;
}

void __75__GEOOfflineServiceRequesterOperation__requestCompletedWithResponse_error___block_invoke_35(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 16))
  {
    id v6 = (void (**)(void, void, void))MEMORY[0x18C120660](*((void *)WeakRetained + 7));
    if (v6)
    {
      int v7 = GEOGetOfflineRequesterLog();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
      if (a2)
      {
        if (v8)
        {
          uint64_t v9 = *(void *)(a1 + 32);
          int v12 = 138543362;
          uint64_t v13 = v9;
        }

        v6[2](v6, *(void *)(a1 + 40), *(void *)(a1 + 48));
      }
      else
      {
        if (v8)
        {
          uint64_t v10 = *(void *)(a1 + 32);
          int v12 = 138543362;
          uint64_t v13 = v10;
          _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_INFO, "Timed out waiting for cohort '%{public}@' failed to transition to offline mode. Returning error.", (uint8_t *)&v12, 0xCu);
        }

        id v11 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-7];
        ((void (**)(void, void, void *))v6)[2](v6, 0, v11);
      }
    }
  }
}

- (id)parseResponse:(id)a3 ofType:(Class)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v6];
  if ([v6 length] && (-[objc_class isValid:](a4, "isValid:", v7) & 1) != 0)
  {
    id v8 = objc_alloc_init(a4);
    [v8 readFrom:v7];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_16;
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = objc_msgSend(v8, "mapsResults", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) place];
          [v14 forceUncacheable];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  else
  {
    uint64_t v9 = GEOGetOfflineRequesterLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      Class v22 = a4;
      __int16 v23 = 1040;
      int v24 = 8;
      __int16 v25 = 2098;
      p_dataRequestKind = &self->_dataRequestKind;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_FAULT, "Failed to decode protobuf response of type %@ for %{public, geo:DataRequestKind}.*P", buf, 0x1Cu);
    }
    id v8 = 0;
  }

LABEL_16:

  return v8;
}

- (id)validateRequest:(id)a3 withAvailableRegions:(id)a4 returningResponseOrError:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  return 0;
}

- (void)dealloc
{
  [(GEOOfflineServiceRequesterOperation *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)GEOOfflineServiceRequesterOperation;
  [(GEOOfflineServiceRequesterOperation *)&v3 dealloc];
}

- (void)_cleanup
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;
}

- (void)cancel
{
  objc_super v3 = offlineServiceQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__GEOOfflineServiceRequesterOperation_cancel__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __45__GEOOfflineServiceRequesterOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 120);
  if (v3)
  {
    int v4 = objc_msgSend(v3, "removeTaskIfPending:");
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    int v4 = 0;
  }
  if (*(void *)(v2 + 112))
  {
    id v5 = [[GEOOfflineServiceRequestCancel alloc] initWithTraits:*(void *)(*(void *)(a1 + 32) + 88) auditToken:*(void *)(*(void *)(a1 + 32) + 72) throttleToken:*(void *)(*(void *)(a1 + 32) + 104)];
    id v6 = [*(id *)(*(void *)(a1 + 32) + 112) data];
    [(GEOOfflineServiceRequestCancel *)v5 setRequestMetadata:v6];

    int v7 = offlineServiceConnection();
    [(GEOXPCRequest *)v5 send:v7];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v2 + 16) = 1;
  if ([*(id *)(*(void *)(a1 + 32) + 32) length])
  {
    id v8 = GEOFindOrCreateLog("com.apple.Maps.RequestResponse", (const char *)[*(id *)(*(void *)(a1 + 32) + 32) UTF8String]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      uint64_t v12 = 0;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, "Canceled for task %@", (uint8_t *)&v11, 0xCu);
    }
    _GEORequestResponseLogError((uint64_t)v8, 0, 0);
  }
  if (v4)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 56);
    uint64_t v10 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);

    [*(id *)(a1 + 32) _cleanup];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_requestMetadata, 0);
  objc_storeStrong((id *)&self->_throttleToken, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_validationHandler, 0);
  objc_storeStrong(&self->_willSendRequestHandler, 0);
  objc_storeStrong((id *)&self->_debugRequestName, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end