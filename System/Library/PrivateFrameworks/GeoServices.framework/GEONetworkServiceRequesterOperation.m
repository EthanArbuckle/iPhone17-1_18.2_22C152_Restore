@interface GEONetworkServiceRequesterOperation
- (GEONetworkServiceRequesterOperation)initWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 willSendRequestHandler:(id)a9 validationHandler:(id)a10 completionHandler:(id)a11;
- (id)_fullURL;
- (id)protobufSession:(id)a3 validateResponse:(id)a4;
- (void)_cleanup;
- (void)_recordNetworkEventDataForTask;
- (void)cancel;
- (void)dealloc;
- (void)protobufSession:(id)a3 didCompleteTask:(id)a4;
- (void)protobufSession:(id)a3 willSendRequest:(id)a4 forTask:(id)a5 completionHandler:(id)a6;
- (void)start;
@end

@implementation GEONetworkServiceRequesterOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleToken, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_validationHandler, 0);
  objc_storeStrong(&self->_willSendRequestHandler, 0);
  objc_storeStrong((id *)&self->_debugRequestName, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_task, 0);
}

- (void)dealloc
{
  [(GEONetworkServiceRequesterOperation *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)GEONetworkServiceRequesterOperation;
  [(GEONetworkServiceRequesterOperation *)&v3 dealloc];
}

- (void)protobufSession:(id)a3 didCompleteTask:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 completedAsCancelled])
  {
    completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    if (completionHandler)
    {
      v7 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2];
      completionHandler[2](completionHandler, 0, v7);
LABEL_15:
    }
  }
  else
  {
    if ([(NSString *)self->_debugRequestName length])
    {
      v8 = [v5 response];

      if (v8)
      {
        v9 = GEOFindOrCreateLog("com.apple.Maps.RequestResponse", [(NSString *)self->_debugRequestName UTF8String]);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = [v5 response];
          v11 = [v10 data];
          int v19 = 138412546;
          id v20 = v5;
          __int16 v21 = 1024;
          LODWORD(v22) = [v11 length];
          _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "Response from task %@ - responseSize: %u", (uint8_t *)&v19, 0x12u);
        }
        v12 = [v5 response];
        _GEORequestResponseLogResponse(v9, v5, v12);
      }
      v13 = [v5 error];

      if (v13)
      {
        v14 = GEOFindOrCreateLog("com.apple.Maps.RequestResponse", [(NSString *)self->_debugRequestName UTF8String]);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = [v5 error];
          int v19 = 138412546;
          id v20 = v5;
          __int16 v21 = 2112;
          v22 = v15;
          _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "Error for task %@ : %@", (uint8_t *)&v19, 0x16u);
        }
        v16 = [v5 error];
        _GEORequestResponseLogError((uint64_t)v14, v5, v16);
      }
    }
    [(GEONetworkServiceRequesterOperation *)self _recordNetworkEventDataForTask];
    v17 = (void (**)(id, void *, void *))self->_completionHandler;
    if (v17)
    {
      v7 = [v5 response];
      v18 = [v5 error];
      v17[2](v17, v7, v18);

      goto LABEL_15;
    }
  }
  [(GEONetworkServiceRequesterOperation *)self _cleanup];
}

- (void)_cleanup
{
  [(GEOProtobufSessionTask *)self->_task cancel];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  task = self->_task;
  self->_task = 0;
}

- (void)_recordNetworkEventDataForTask
{
  objc_super v3 = [(GEOServiceRequestConfiguring *)self->_config serviceTypeNumber];

  if (v3)
  {
    if (objc_opt_respondsToSelector())
    {
      id v13 = [(GEOServiceRequestConfiguring *)self->_config additionalStatesForNetworkEvent];
    }
    else
    {
      id v13 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      v4 = objc_msgSend(NSNumber, "numberWithBool:", -[GEOServiceRequestConfiguring usesBackgroundURL](self->_config, "usesBackgroundURL"));
    }
    else
    {
      v4 = 0;
    }
    uint64_t v5 = [(GEOServiceRequestConfiguring *)self->_config dataRequestKindForRequest:self->_request traits:self->_traits];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [(GEOServiceRequestConfiguring *)self->_config analyticNetworkServiceTypeForRequest:self->_request traits:self->_traits];
      appIdentifier = self->_appIdentifier;
      v8 = [(GEOMapServiceTraits *)self->_traits appMajorVersion];
      v9 = [(GEOMapServiceTraits *)self->_traits appMinorVersion];
      v10 = [(GEOProtobufSessionTask *)self->_task error];
      v11 = [(GEOProtobufSessionTask *)self->_task clientMetrics];
      +[GEONetworkEventDataRecorder recordNetworkEventDataForDataRequestKind:v5 networkService:v6 usedBackgroundURL:v4 requestAppIdentifier:appIdentifier appMajorVersion:v8 appMinorVersion:v9 error:v10 clientMetrics:v11 additionalStates:v13];
    }
    else
    {
      v12 = self->_appIdentifier;
      v8 = [(GEOMapServiceTraits *)self->_traits appMajorVersion];
      v9 = [(GEOMapServiceTraits *)self->_traits appMinorVersion];
      v10 = [(GEOProtobufSessionTask *)self->_task error];
      v11 = [(GEOProtobufSessionTask *)self->_task clientMetrics];
      +[GEONetworkEventDataRecorder recordNetworkEventDataForDataRequestKind:v5 usedBackgroundURL:v4 requestAppIdentifier:v12 appMajorVersion:v8 appMinorVersion:v9 error:v10 clientMetrics:v11 additionalStates:v13];
    }
  }
}

- (GEONetworkServiceRequesterOperation)initWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 willSendRequestHandler:(id)a9 validationHandler:(id)a10 completionHandler:(id)a11
{
  id v44 = a3;
  id v45 = a4;
  id v43 = a5;
  id v17 = a6;
  id obj = a7;
  id v18 = a7;
  id v19 = a9;
  id v42 = a10;
  id v20 = a11;
  double v21 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v17 timeout];
    double v21 = v22;
  }
  uint64_t v23 = [v17 dataRequestKindForRequest:v44 traits:v45];
  if (v23)
  {
    v46.receiver = self;
    v46.super_class = (Class)GEONetworkServiceRequesterOperation;
    v24 = [(GEONetworkServiceRequesterOperation *)&v46 init];
    if (v24)
    {
      v39 = v20;
      v25 = [v17 debugRequestName];
      uint64_t v26 = [v25 copy];
      debugRequestName = v24->_debugRequestName;
      v24->_debugRequestName = (NSString *)v26;

      v28 = [v43 bundleId];
      if ([v28 length]) {
        [v43 bundleId];
      }
      else {
      uint64_t v29 = [v45 appIdentifier];
      }
      appIdentifier = v24->_appIdentifier;
      v24->_appIdentifier = (NSString *)v29;

      objc_storeStrong((id *)&v24->_request, a3);
      objc_storeStrong((id *)&v24->_auditToken, a5);
      v24->_timeout = v21;
      v24->_dataRequestKind = ($7466BF22B2A7275A1F5DB80FF4552E0B)v23;
      objc_storeStrong((id *)&v24->_traits, a4);
      objc_storeStrong((id *)&v24->_config, a6);
      objc_storeStrong((id *)&v24->_throttleToken, obj);
      v24->_requestOptions = a8;
      uint64_t v31 = [v19 copy];
      id willSendRequestHandler = v24->_willSendRequestHandler;
      v24->_id willSendRequestHandler = (id)v31;

      uint64_t v33 = [v42 copy];
      id validationHandler = v24->_validationHandler;
      v24->_id validationHandler = (id)v33;

      id v20 = v39;
      uint64_t v35 = [v39 copy];
      id completionHandler = v24->_completionHandler;
      v24->_id completionHandler = (id)v35;
    }
    self = v24;
    v37 = self;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (id)_fullURL
{
  url = self->_url;
  if (url)
  {
    objc_super v3 = url;
  }
  else
  {
    uint64_t v5 = GEOGetURLWithSource([(GEOServiceRequestConfiguring *)self->_config urlType], 0);
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F29088] componentsWithURL:v5 resolvingAgainstBaseURL:1];
      v7 = [(GEOServiceRequestConfiguring *)self->_config additionalURLQueryItems];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        v9 = [(GEOServiceRequestConfiguring *)self->_config additionalURLQueryItems];
        v10 = (void *)[v9 mutableCopy];

        v11 = [v6 queryItems];
        uint64_t v12 = [v11 count];

        if (v12)
        {
          id v13 = [v6 queryItems];
          [v10 addObjectsFromArray:v13];
        }
        [v6 setQueryItems:v10];
      }
      uint64_t v14 = [(GEOServiceRequestConfiguring *)self->_config dataRequestKindForRequest:self->_request traits:self->_traits];
      v15 = +[GEOExperimentConfiguration sharedConfiguration];
      [v15 updateURLComponents:v6 forRequestKind:v14];

      v16 = [v6 URL];
      id v17 = self->_url;
      self->_url = v16;

      objc_super v3 = self->_url;
    }
    else
    {
      objc_super v3 = 0;
    }
  }

  return v3;
}

void __44__GEONetworkServiceRequesterOperation_start__block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[16])
  {
    objc_super v3 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2];
    v2 = *(unsigned char **)(a1 + 32);
  }
  else
  {
    objc_super v3 = 0;
  }
  v4 = [v2 _fullURL];
  if (v4)
  {
    if (v3)
    {
LABEL_6:
      [*(id *)(a1 + 40) requestCompleted:v3];
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = v5[7];
      if (v6)
      {
        (*(void (**)(void, void, void *))(v6 + 16))(v5[7], 0, v3);
        uint64_t v5 = *(void **)(a1 + 32);
      }
      [v5 _cleanup];
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-4];

    objc_super v3 = (void *)v7;
    if (v7) {
      goto LABEL_6;
    }
  }
  int v8 = GEOURLNeedsAuthForURLType([*(id *)(*(void *)(a1 + 32) + 72) urlType]);
  if (GEOURLSupportsMPTCP([*(id *)(*(void *)(a1 + 32) + 72) urlType])
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v38 = [*(id *)(*(void *)(a1 + 32) + 72) multipathServiceType];
  }
  else
  {
    uint64_t v38 = 0;
  }
  v9 = (void *)(a1 + 32);
  if (v8) {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 128) | 8;
  }
  else {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 128);
  }
  v11 = [GEODataRequest alloc];
  uint64_t v12 = *v9;
  uint64_t v13 = *(void *)(*v9 + 24);
  uint64_t v14 = [*(id *)(*v9 + 72) additionalHTTPHeaders];
  v39 = v4;
  v15 = (uint64_t *)(v12 + 96);
  uint64_t v16 = *(void *)(*v9 + 88);
  double v17 = *(double *)(*v9 + 112);
  uint64_t v18 = *(void *)(*v9 + 104);
  uint64_t v19 = *(void *)(a1 + 40);
  uint64_t v20 = GEOURLMultipathAlternatePort([*(id *)(*v9 + 72) urlType]);
  uint64_t v21 = *v15;
  v4 = v39;
  double v22 = [(GEODataRequest *)v11 initWithKind:v21 protobufRequest:v13 URL:v39 additionalHTTPHeaders:v14 auditToken:v16 timeoutInterval:v18 traits:v17 requestCounterTicket:v19 multipathServiceType:v38 multipathAlternatePort:v20 throttleToken:*(void *)(*v9 + 120) options:v10];

  uint64_t v23 = +[GEOProtobufSession sharedProtobufSession];
  v24 = +[GEOProtobufSession sharedDelegateQueue];
  uint64_t v25 = objc_msgSend(v23, "taskWithRequest:requestTypeCode:responseClass:delegate:delegateQueue:", v22, objc_msgSend(*(id *)(*v9 + 24), "requestTypeCode"), objc_msgSend(*(id *)(*v9 + 24), "responseClass"), *v9, v24);
  uint64_t v26 = *(void *)(a1 + 32);
  v27 = *(void **)(v26 + 8);
  *(void *)(v26 + 8) = v25;

  if ([*(id *)(*(void *)(a1 + 32) + 32) length])
  {
    v28 = GEOFindOrCreateLog("com.apple.Maps.RequestResponse", (const char *)[*(id *)(*(void *)(a1 + 32) + 32) UTF8String]);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 8);
      v30 = (objc_class *)objc_opt_class();
      uint64_t v31 = NSStringFromClass(v30);
      v32 = [(GEODataRequest *)v22 publicLogDescription];
      *(_DWORD *)buf = 138412802;
      uint64_t v41 = v29;
      __int16 v42 = 2114;
      id v43 = v31;
      __int16 v44 = 2114;
      id v45 = v32;
      _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_INFO, "Request with task %@, RequestType: %{public}@, dataRequest: %{public}@", buf, 0x20u);
    }
    uint64_t v33 = *(void **)(*(void *)(a1 + 32) + 8);
    v34 = [(GEODataRequest *)v22 URL];
    _GEORequestResponseLogRequest(v28, v33, v34, *(void **)(*(void *)(a1 + 32) + 24));
  }
  uint64_t v35 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v35)
  {
    [v35 start];
    objc_super v3 = 0;
  }
  else
  {
    objc_super v3 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13];
    [*(id *)(a1 + 40) requestCompleted:v3];
    v36 = *(void **)(a1 + 32);
    uint64_t v37 = v36[7];
    if (v37)
    {
      (*(void (**)(void, void, void *))(v37 + 16))(v36[7], 0, v3);
      v36 = *(void **)(a1 + 32);
    }
    [v36 _cleanup];
  }

LABEL_27:
}

- (void)start
{
  objc_super v3 = +[GEORequestCounter sharedCounter];
  v4 = objc_msgSend(v3, "requestCounterTicketForType:auditToken:traits:", -[GEOServiceRequestConfiguring dataRequestKindForRequest:traits:](self->_config, "dataRequestKindForRequest:traits:", self->_request, self->_traits), self->_auditToken, self->_traits);

  uint64_t v5 = +[GEOProtobufSession sharedDelegateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__GEONetworkServiceRequesterOperation_start__block_invoke;
  v7[3] = &unk_1E53EBAA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  GEOWaitForURLsFromManifestAndThenOnQueue(v5, v7);
}

- (void)protobufSession:(id)a3 willSendRequest:(id)a4 forTask:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = +[GEOProtobufSession sharedDelegateQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __97__GEONetworkServiceRequesterOperation_protobufSession_willSendRequest_forTask_completionHandler___block_invoke;
  v16[3] = &unk_1E53DE528;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, v16);
}

void __97__GEONetworkServiceRequesterOperation_protobufSession_willSendRequest_forTask_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __97__GEONetworkServiceRequesterOperation_protobufSession_willSendRequest_forTask_completionHandler___block_invoke_2;
    v6[3] = &unk_1E53EBAC8;
    id v10 = *(id *)(a1 + 56);
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    id v7 = v3;
    uint64_t v8 = v4;
    id v9 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
}

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  self->_canceled = 1;
  if ([(NSString *)self->_debugRequestName length])
  {
    id v3 = self->_task;
    uint64_t v4 = GEOFindOrCreateLog("com.apple.Maps.RequestResponse", [(NSString *)self->_debugRequestName UTF8String]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Canceled for task %@", (uint8_t *)&v5, 0xCu);
    }
    _GEORequestResponseLogError((uint64_t)v4, v3, 0);
  }
  [(GEOProtobufSessionTask *)self->_task cancel];
}

- (id)protobufSession:(id)a3 validateResponse:(id)a4
{
  return (id)(*((uint64_t (**)(void))self->_validationHandler + 2))();
}

void __97__GEONetworkServiceRequesterOperation_protobufSession_willSendRequest_forTask_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) updatedRequestWithNewProtobufRequest:v3];
    int v5 = GEOURLLogFacility([*(id *)(*(void *)(a1 + 40) + 72) urlType]);
    if ([v5 length])
    {
      id v6 = GEOFindOrCreateLog("com.apple.Maps.RequestResponse", (const char *)[v5 UTF8String]);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        uint64_t v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        id v10 = [v4 publicLogDescription];
        int v17 = 138412802;
        uint64_t v18 = v7;
        __int16 v19 = 2114;
        uint64_t v20 = (uint64_t)v9;
        __int16 v21 = 2114;
        id v22 = v10;
        _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "Request with task %@, RequestType: %{public}@, dataRequest: %{public}@", (uint8_t *)&v17, 0x20u);
      }
      id v11 = *(void **)(a1 + 48);
      uint64_t v12 = [*(id *)(a1 + 40) _fullURL];
      _GEORequestResponseLogRequest(v6, v11, v12, v3);
    }
    id v13 = v5;
    id v14 = GEOFindOrCreateLog("com.apple.GeoServices", (const char *)[v13 UTF8String]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = objc_opt_class();
      int v17 = 134218498;
      uint64_t v18 = v15;
      __int16 v19 = 2114;
      uint64_t v20 = v16;
      __int16 v21 = 2048;
      id v22 = v3;
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_INFO, "Sending request for task for provider %p with updated PB request <%{public}@: %p>.", (uint8_t *)&v17, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

@end