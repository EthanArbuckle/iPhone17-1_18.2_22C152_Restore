@interface GEOResourceLoadOperation
- (BOOL)preferDirectNetworking;
- (BOOL)requiresWiFi;
- (GEOResourceLoadOperation)initWithResource:(id)a3 eTag:(id)a4 auditToken:(id)a5 baseURL:(id)a6 alternateURLs:(id)a7 proxyURL:(id)a8 log:(id)a9;
- (NSProgress)progress;
- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)cancel;
- (void)dealloc;
- (void)setPreferDirectNetworking:(BOOL)a3;
- (void)setRequiresWiFi:(BOOL)a3;
- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4;
@end

@implementation GEOResourceLoadOperation

- (void)setRequiresWiFi:(BOOL)a3
{
  self->_requiresWiFi = a3;
}

- (void)dealloc
{
  [(NSURLSession *)self->_session invalidateAndCancel];
  v3.receiver = self;
  v3.super_class = (Class)GEOResourceLoadOperation;
  [(GEOResourceLoadOperation *)&v3 dealloc];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = (void (**)(id, void))a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    -[GEOReportedProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", [v10 expectedContentLength]);
    uint64_t v11 = [v10 statusCode];
    if (v11 != 200)
    {
      BOOL v12 = v11 == 304 && [(NSString *)self->_eTag length] != 0;
      ((void (**)(id, BOOL))v9)[2](v9, v12);
      os_unfair_lock_lock_with_options();
      v26 = self->_session;
      session = self->_session;
      self->_session = 0;

      task = self->_task;
      self->_task = 0;

      v29 = (void *)MEMORY[0x18C120660](self->_completionHandler);
      id completionHandler = self->_completionHandler;
      self->_id completionHandler = 0;

      os_unfair_lock_unlock(&self->_lock);
      if (v12) {
        [(NSURLSession *)v26 finishTasksAndInvalidate];
      }
      else {
        [(NSURLSession *)v26 invalidateAndCancel];
      }
      data = self->_data;
      self->_data = 0;

      if ([(GEOReportedProgress *)self->_progress totalUnitCount] < 1) {
        int64_t v32 = 1;
      }
      else {
        int64_t v32 = [(GEOReportedProgress *)self->_progress totalUnitCount];
      }
      [(GEOReportedProgress *)self->_progress setTotalUnitCount:v32];
      [(GEOReportedProgress *)self->_progress setCompletedUnitCount:[(GEOReportedProgress *)self->_progress totalUnitCount]];
      if (v12)
      {
        v33 = 0;
        if (!v29) {
          goto LABEL_24;
        }
      }
      else
      {
        v63 = v29;
        v64 = v26;
        v34 = NSString;
        uint64_t v35 = [v10 statusCode];
        v36 = [v10 URL];
        v37 = [v34 stringWithFormat:@"Manifest server returned HTTP error %ld for URL %@", v35, v36];

        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v37;
          _os_log_impl(&dword_188D96000, log, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }
        id v39 = (id)*MEMORY[0x1E4F1D138];
        v69[0] = v37;
        v68[0] = v39;
        v68[1] = @"HTTPStatus";
        v40 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "statusCode"));
        v69[1] = v40;
        v68[2] = *MEMORY[0x1E4F289C0];
        [v10 URL];
        v42 = id v41 = v10;
        v43 = [v42 absoluteString];
        v69[2] = v43;
        v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:3];

        id v10 = v41;
        v33 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-7 userInfo:v44];

        v29 = v63;
        v26 = v64;
        if (!v63) {
          goto LABEL_24;
        }
      }
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__GEOResourceLoadOperation_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
      block[3] = &unk_1E53D95B8;
      id v67 = v29;
      block[4] = self;
      id v66 = v33;
      dispatch_async(callbackQueue, block);

LABEL_24:
      goto LABEL_25;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_25:

      goto LABEL_26;
    }
    v16 = [v10 allHeaderFields];
    v17 = [v16 objectForKeyedSubscript:@"ETag"];
    eTag = self->_eTag;
    self->_eTag = v17;

    v19 = [v10 allHeaderFields];
    v20 = [v19 objectForKeyedSubscript:@"Content-Length"];

    if (v20)
    {
      v21 = newlocale(63, 0, 0);
      *(void *)buf = 0;
      id v22 = v20;
      int v23 = sscanf_l((const char *)[v22 UTF8String], v21, "%zu", buf);
      freelocale(v21);
      if (v23 == 1)
      {
        unint64_t v24 = *(void *)buf;

        int v25 = 1;
        goto LABEL_31;
      }
    }
    if (GEOConfigGetBOOL(GeoServicesConfig_ResourceLoaderMissingContentLengthShouldDownloadToFile, (uint64_t)off_1E9114D68))
    {
      v9[2](v9, 2);
      goto LABEL_35;
    }
    int v25 = 0;
    unint64_t v24 = 0;
LABEL_31:
    unint64_t UInteger = GEOConfigGetUInteger(GeoServicesConfig_ResourceLoaderInMemoryDownloadSizeThreshold, (uint64_t)off_1E9114D78);
    v47 = v9[2];
    if (v24 <= UInteger)
    {
      v47(v9, 1);
      char v58 = v25 ^ 1;
      if (self->_data) {
        char v58 = 1;
      }
      if ((v58 & 1) == 0 && v24)
      {
        v59 = (NSMutableData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v24];
        v60 = self->_data;
        self->_data = v59;
      }
      v61 = self->_log;
      if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_25;
      }
      v62 = self->_task;
      v50 = v61;
      v51 = [(NSURLSessionTask *)v62 originalRequest];
      v52 = [v51 URL];
      *(_DWORD *)buf = 138478083;
      *(void *)&buf[4] = v52;
      __int16 v71 = 1025;
      int v72 = v24;
      v53 = "Resource at %{private}@ (%{private}u bytes) does not exceed threshold";
LABEL_44:
      _os_log_impl(&dword_188D96000, v50, OS_LOG_TYPE_DEBUG, v53, buf, 0x12u);

      goto LABEL_45;
    }
    v47(v9, 2);
    if (v25)
    {
      v48 = self->_log;
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_25;
      }
      v49 = self->_task;
      v50 = v48;
      v51 = [(NSURLSessionTask *)v49 originalRequest];
      v52 = [v51 URL];
      *(_DWORD *)buf = 138478083;
      *(void *)&buf[4] = v52;
      __int16 v71 = 1025;
      int v72 = v24;
      v53 = "Resource at %{private}@ (%{private}u bytes) exceeds threshold, converting to download";
      goto LABEL_44;
    }
LABEL_35:
    v54 = self->_log;
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_25;
    }
    v55 = self->_task;
    v56 = v54;
    v51 = [(NSURLSessionTask *)v55 originalRequest];
    v57 = [v51 URL];
    *(_DWORD *)buf = 138477827;
    *(void *)&buf[4] = v57;
    _os_log_impl(&dword_188D96000, v56, OS_LOG_TYPE_DEBUG, "Resource at %{private}@ is missing content-length header, converting to download", buf, 0xCu);

LABEL_45:
    goto LABEL_25;
  }
  v9[2](v9, 0);
  os_unfair_lock_lock_with_options();
  v13 = self->_session;
  self->_session = 0;
  v14 = v13;

  v15 = self->_task;
  self->_task = 0;

  os_unfair_lock_unlock(&self->_lock);
  [(NSURLSession *)v14 invalidateAndCancel];

LABEL_26:
}

- (GEOResourceLoadOperation)initWithResource:(id)a3 eTag:(id)a4 auditToken:(id)a5 baseURL:(id)a6 alternateURLs:(id)a7 proxyURL:(id)a8 log:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id obj = a5;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v71.receiver = self;
  v71.super_class = (Class)GEOResourceLoadOperation;
  id v22 = [(GEOResourceLoadOperation *)&v71 init];
  if (v22)
  {
    id v66 = v21;
    int v23 = [v15 resource];
    int v24 = [v23 hasAlternateResourceURLIndex];

    if (v24)
    {
      int v25 = [v15 resource];
      unsigned int v26 = [v25 alternateResourceURLIndex];
      unint64_t v27 = [v19 count];

      if (v27 <= v26)
      {
        v42 = 0;
        id v21 = v66;
        goto LABEL_21;
      }
      v28 = [v15 resource];
      uint64_t v29 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v28, "alternateResourceURLIndex"));

      id v18 = (id)v29;
    }
    id v30 = v18;
    id v31 = v15;
    int64_t v32 = v31;
    v33 = 0;
    if (v31 && v30)
    {
      v34 = v30;
      uint64_t v35 = [v31 name];

      if (v35)
      {
        id v64 = v15;
        id v36 = v20;
        id v37 = v19;
        id v38 = v17;
        unsigned int v39 = [v32 type];
        id v40 = v16;
        if (v39 > 7) {
          id v41 = &stru_1ED51F370;
        }
        else {
          id v41 = off_1E53E3430[v39];
        }
        id v30 = v34;
        v43 = [v34 URLByAppendingPathComponent:v41];
        v44 = [v32 name];
        v33 = [v43 URLByAppendingPathComponent:v44];

        id v16 = v40;
        id v17 = v38;
        id v19 = v37;
        id v20 = v36;
        id v15 = v64;
      }
      else
      {
        v33 = 0;
        id v30 = v34;
      }
    }

    id v65 = v30;
    eTag = [v32 resource];
    if ([eTag hasUpdateMethod])
    {
      v46 = [v32 resource];
      id v47 = v15;
      id v48 = v20;
      id v49 = v19;
      id v50 = v17;
      id v51 = v16;
      int v52 = [v46 updateMethod];

      BOOL v53 = v52 == 1;
      id v16 = v51;
      id v17 = v50;
      id v19 = v49;
      id v20 = v48;
      id v15 = v47;
      id v21 = v66;
      if (!v53) {
        goto LABEL_19;
      }
      uint64_t v54 = [v16 copy];
      eTag = v22->_eTag;
      v22->_eTag = (NSString *)v54;
    }
    else
    {
      id v21 = v66;
    }

LABEL_19:
    v55 = GEOURLAuthenticationGenerateURL((uint64_t)v33);
    uint64_t v56 = [v55 copy];
    url = v22->_url;
    v22->_url = (NSURL *)v56;

    uint64_t v58 = [v20 copy];
    proxyURL = v22->_proxyURL;
    v22->_proxyURL = (NSURL *)v58;

    objc_storeStrong((id *)&v22->_auditToken, obj);
    objc_storeStrong((id *)&v22->_log, a9);
    v22->_lock._os_unfair_lock_opaque = 0;
    uint64_t v60 = +[GEOReportedProgress progressWithTotalUnitCount:-1];
    progress = v22->_progress;
    v22->_progress = (GEOReportedProgress *)v60;

    [(GEOReportedProgress *)v22->_progress setKind:*MEMORY[0x1E4F28898]];
    [(GEOReportedProgress *)v22->_progress setUserInfoObject:*MEMORY[0x1E4F28858] forKey:*MEMORY[0x1E4F28868]];
    objc_initWeak(&location, v22);
    v62 = v22->_progress;
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __96__GEOResourceLoadOperation_initWithResource_eTag_auditToken_baseURL_alternateURLs_proxyURL_log___block_invoke;
    void v68[3] = &unk_1E53D7B90;
    objc_copyWeak(&v69, &location);
    [(GEOReportedProgress *)v62 setCancellationHandler:v68];
    v42 = v22;
    objc_destroyWeak(&v69);
    objc_destroyWeak(&location);

    id v18 = v65;
    goto LABEL_21;
  }
  v42 = 0;
LABEL_21:

  return v42;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  data = self->_data;
  if (!data)
  {
    uint64_t v11 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    BOOL v12 = self->_data;
    self->_data = v11;

    data = self->_data;
  }
  [(NSMutableData *)data appendData:v9];
  if ([(GEOReportedProgress *)self->_progress totalUnitCount] >= 1) {
    -[GEOReportedProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", -[GEOReportedProgress completedUnitCount](self->_progress, "completedUnitCount") + [v9 length]);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  starttime = self->_starttime;
  self->_starttime = 0;

  os_unfair_lock_lock_with_options();
  id v10 = self->_session;
  session = self->_session;
  self->_session = 0;

  task = self->_task;
  self->_task = 0;

  id v13 = (void *)MEMORY[0x18C120660](self->_completionHandler);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  os_unfair_lock_unlock(&self->_lock);
  [(NSURLSession *)v10 finishTasksAndInvalidate];
  if ([(GEOReportedProgress *)self->_progress totalUnitCount] < 1) {
    int64_t v15 = 1;
  }
  else {
    int64_t v15 = [(GEOReportedProgress *)self->_progress totalUnitCount];
  }
  [(GEOReportedProgress *)self->_progress setTotalUnitCount:v15];
  [(GEOReportedProgress *)self->_progress setCompletedUnitCount:[(GEOReportedProgress *)self->_progress totalUnitCount]];
  data = self->_data;
  if (data && ![(NSMutableData *)data length])
  {
    id v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", self->_url, *MEMORY[0x1E4F289C0], 0);
    uint64_t v18 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 userInfo:v17];

    id v19 = self->_data;
    self->_data = 0;

    id v8 = (id)v18;
  }
  [(GEORequestCounterTicket *)self->_requestCounterTicket requestCompleted:v8];
  eTag = self->_eTag;
  if (v8)
  {
    self->_eTag = 0;
LABEL_9:

    goto LABEL_13;
  }
  if (!eTag)
  {
    id v21 = [v7 response];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      eTag = [v7 response];
      int v23 = [eTag allHeaderFields];
      int v24 = [v23 objectForKeyedSubscript:@"ETag"];
      int v25 = self->_eTag;
      self->_eTag = v24;

      goto LABEL_9;
    }
  }
LABEL_13:
  if (v13)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__GEOResourceLoadOperation_URLSession_task_didCompleteWithError___block_invoke;
    block[3] = &unk_1E53D95B8;
    id v29 = v13;
    block[4] = self;
    id v28 = v8;
    dispatch_async(callbackQueue, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_downloadedFileURL, 0);
  objc_storeStrong((id *)&self->_starttime, 0);
  objc_storeStrong((id *)&self->_serviceAddress, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_authProxyURL, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_eTag, 0);
  objc_storeStrong((id *)&self->_requestCounterTicket, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_proxyURL, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, uint64_t, void))a6;
  BOOL v12 = [v10 protectionSpace];
  id v13 = [v12 proxyType];
  if (v13 != (void *)*MEMORY[0x1E4F289F0]) {
    goto LABEL_4;
  }
  v14 = [v10 protectionSpace];
  int64_t v15 = [v14 authenticationMethod];
  id v16 = v15;
  if (v15 != (void *)*MEMORY[0x1E4F28978])
  {

LABEL_4:
    goto LABEL_5;
  }
  id v17 = [v9 configuration];
  int v18 = [v17 _requiresSecureHTTPSProxyConnection];

  if (v18)
  {
    id v19 = GEOGetMapsProxyAuthLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v22 = 0;
      _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_DEBUG, "Received a secure proxy challenge", v22, 2u);
    }

    data = self->_data;
    self->_data = 0;

    id v21 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
    [v21 handleSecureProxyChallenge:v10];
  }
LABEL_5:
  v11[2](v11, 1, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  objc_msgSend(a5, "transactionMetrics", a3, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [v9 firstObject];
  id v7 = [v6 remoteAddress];
  serviceAddress = self->_serviceAddress;
  self->_serviceAddress = v7;
}

void __65__GEOResourceLoadOperation_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18C1203C0]();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4
{
  id v7 = a4;
  id v8 = (void *)[a3 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v8;

  objc_storeStrong((id *)&self->_callbackQueue, a4);
  id v10 = (void *)MEMORY[0x1E4F290D0];
  uint64_t v11 = +[GEOPlatform sharedPlatform];
  if ([v11 isInternalInstall]) {
    uint64_t BOOL = GEOConfigGetBOOL(GeoServicesConfig_AllowNonEVCerts, (uint64_t)off_1E9113CB8);
  }
  else {
    uint64_t BOOL = 0;
  }

  id v13 = [(NSURL *)self->_url host];
  [v10 setAllowsAnyHTTPSCertificate:BOOL forHost:v13];

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:self->_url];
  [v14 setHTTPShouldHandleCookies:0];
  eTag = self->_eTag;
  if (eTag) {
    [v14 setValue:eTag forHTTPHeaderField:@"If-None-Match"];
  }
  id v16 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
  objc_msgSend(v16, "geo_setApplicationAttribution:", self->_auditToken);
  if (self->_proxyURL)
  {
    id v17 = [MEMORY[0x1E4F1CA60] dictionary];
    int v18 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
    [v18 addProxyAuthHeaderOrReAuth:v17 authProxyURL:self->_proxyURL];

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __69__GEOResourceLoadOperation_startWithCompletionHandler_callbackQueue___block_invoke;
    v34[3] = &unk_1E53DFD80;
    id v19 = v14;
    id v35 = v19;
    [v17 enumerateKeysAndObjectsUsingBlock:v34];
    id v20 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
    id v21 = [v19 URL];
    [v20 setConnectionProxyDictionary:v16 url:v21 proxyURL:self->_proxyURL];
  }
  [v16 setAllowsExpensiveNetworkAccess:!self->_requiresWiFi];
  id v22 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v16 delegate:self delegateQueue:0];
  int v23 = [(NSURLSession *)v22 dataTaskWithRequest:v14];
  int v24 = +[GEORequestCounter sharedCounter];
  int v25 = [v24 requestCounterTicketForType:4 auditToken:self->_auditToken traits:0];

  os_unfair_lock_lock_with_options();
  session = self->_session;
  self->_session = v22;
  unint64_t v27 = v22;

  task = self->_task;
  self->_task = v23;
  id v29 = v23;

  requestCounterTicket = self->_requestCounterTicket;
  self->_requestCounterTicket = v25;
  id v31 = v25;

  os_unfair_lock_unlock(&self->_lock);
  [(GEORequestCounterTicket *)v31 startingRequestWithTask:self->_task];
  [(NSURLSessionTask *)v29 resume];
  int64_t v32 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  starttime = self->_starttime;
  self->_starttime = v32;
}

void __96__GEOResourceLoadOperation_initWithResource_eTag_auditToken_baseURL_alternateURLs_proxyURL_log___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

- (NSProgress)progress
{
  return [(GEOReportedProgress *)self->_progress progress];
}

uint64_t __69__GEOResourceLoadOperation_startWithCompletionHandler_callbackQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  session = self->_session;
  task = self->_task;
  self->_session = 0;
  v6 = task;
  id v9 = session;

  id v7 = self->_task;
  self->_task = 0;

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  os_unfair_lock_unlock(p_lock);
  [(NSURLSessionTask *)v6 cancel];
  [(NSURLSession *)v9 invalidateAndCancel];
  [(GEOReportedProgress *)self->_progress cancel];
}

void __85__GEOResourceLoadOperation_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18C1203C0]();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  id v7 = (NSURLSessionTask *)a4;
  id v8 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_session)
  {
    task = self->_task;
    p_task = &self->_task;
    id v10 = task;
    if (task)
    {
      if (v10 == v7)
      {
        objc_storeStrong((id *)p_task, a5);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        v13[0] = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _task == dataTask", (uint8_t *)v13, 2u);
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = a5;
  id v8 = NSTemporaryDirectory();
  id v9 = [v6 fileURLWithPath:v8];
  id v10 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v11 = [v10 UUIDString];
  BOOL v12 = [v9 URLByAppendingPathComponent:v11];

  id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v24 = 0;
  LODWORD(v9) = [v13 moveItemAtURL:v7 toURL:v12 error:&v24];

  id v14 = v24;
  if (v9)
  {
    int64_t v15 = [v12 path];
    id v23 = v14;
    id v16 = v14;
    if (v15)
    {
      id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v18 = *MEMORY[0x1E4F28370];
      v25[0] = *MEMORY[0x1E4F28330];
      v25[1] = v18;
      uint64_t v19 = *MEMORY[0x1E4F28378];
      *(void *)&long long buf = &unk_1ED73DD98;
      *((void *)&buf + 1) = v19;
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:v25 count:2];
      [v17 setAttributes:v20 ofItemAtPath:v15 error:&v23];

      id v16 = v23;
    }
    id v21 = v16;

    objc_storeStrong((id *)&self->_downloadedFileURL, v12);
    id v14 = v21;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_188D96000, log, OS_LOG_TYPE_ERROR, "Failed to move downloaded data to temporary URL: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (BOOL)requiresWiFi
{
  return self->_requiresWiFi;
}

- (BOOL)preferDirectNetworking
{
  return self->_preferDirectNetworking;
}

- (void)setPreferDirectNetworking:(BOOL)a3
{
  self->_preferDirectNetworking = a3;
}

@end