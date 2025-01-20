@interface CoreDAVTask
+ (id)stringFromDepth:(int)a3;
+ (unsigned)uniqueQueryID;
- (BOOL)_canAuthenticateAgainstProtectionSpace:(id)a3;
- (BOOL)_handleUnauthorizedAccessError:(id)a3;
- (BOOL)_includeGeneralHeaders;
- (BOOL)_shouldCreateCredentialForBasicOrDigestAuthChallenge:(id)a3;
- (BOOL)_shouldHandleStatusCode:(int64_t)a3;
- (BOOL)allowAutomaticRedirects;
- (BOOL)ignoresGuardianRestrictions;
- (BOOL)isFinished;
- (BOOL)markAsFinished;
- (BOOL)shouldLogResponseBody;
- (BOOL)simulated;
- (BOOL)totalBytesWasProcessedAsAbnormallyLarge;
- (BOOL)validate:(id *)a3;
- (CoreDAVAccountInfoProvider)accountInfoProvider;
- (CoreDAVItem)rootElement;
- (CoreDAVItem)simulatedRootElement;
- (CoreDAVResponseBodyParser)responseBodyParser;
- (CoreDAVTask)initWithURL:(id)a3;
- (CoreDAVTaskDelegate)delegate;
- (CoreDAVTaskManager)taskManager;
- (NSDictionary)requestProperties;
- (NSDictionary)responseHeaders;
- (NSError)error;
- (NSMutableDictionary)simulatedResponseHeaders;
- (NSRunLoop)workRunLoop;
- (NSString)description;
- (NSURL)url;
- (double)timeoutInterval;
- (id)_applyAuthenticationChain:(__CFArray *)a3 toRequest:(id)a4;
- (id)_applyStorageSession:(__CFURLStorageSession *)a3 toRequest:(id)a4;
- (id)_compressBodyData:(id)a3;
- (id)_createBodyData;
- (id)_requestForLogging;
- (id)_sessionForLogging;
- (id)additionalHeaderValues;
- (id)completionBlock;
- (id)context;
- (id)copyDefaultParserForContentType:(id)a3;
- (id)credentialForClientCertificateChallenge:(id)a3;
- (id)credentialForOAuthChallenge:(id)a3;
- (id)httpMethod;
- (id)lastRedirectURL;
- (id)redactedDescription;
- (id)requestBody;
- (id)requestBodyStream;
- (id)requestProgressBlock;
- (id)responseProgressBlock;
- (int)depth;
- (int64_t)numDownloadedElements;
- (int64_t)responseStatusCode;
- (int64_t)simulatedStatusCode;
- (unint64_t)cachePolicy;
- (unint64_t)totalBytesReceived;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_assignConnectionProperties:(id)a3 toSessionConfiguration:(id)a4;
- (void)_didReceiveAuthenticationChallenge:(id)a3 forTask:(id)a4 completionHandler:(id)a5;
- (void)_failImmediately;
- (void)_handleAuthenticationChallenge:(id)a3 task:(id)a4 completionHandler:(id)a5;
- (void)_handleBadPasswordResponse;
- (void)_logSantizedRequest:(id)a3 withTaskID:(id)a4;
- (void)_runOnCallbackThread:(id)a3;
- (void)_runOnThisThread:(id)a3;
- (void)_sendTimeSpentInNetworkingToProvider;
- (void)_session:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)_session:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)_session:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_task:(id)a3 didFailWithError:(id)a4;
- (void)_taskFinishedLoading:(id)a3;
- (void)dealloc;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)finishEarlyWithError:(id)a3;
- (void)handleWebLoginRequestWithCompletionBlock:(id)a3;
- (void)loadRequest:(id)a3;
- (void)overrideRequestHeader:(id)a3 withValue:(id)a4;
- (void)performCoreDAVTask;
- (void)reportStatusWithError:(id)a3;
- (void)reset;
- (void)setAccountInfoProvider:(id)a3;
- (void)setAllowAutomaticRedirects:(BOOL)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDepth:(int)a3;
- (void)setError:(id)a3;
- (void)setIgnoresGuardianRestrictions:(BOOL)a3;
- (void)setRequestProgressBlock:(id)a3;
- (void)setRequestProperties:(id)a3;
- (void)setResponseBodyParser:(id)a3;
- (void)setResponseProgressBlock:(id)a3;
- (void)setResponseStatusCode:(int64_t)a3;
- (void)setSimulated:(BOOL)a3;
- (void)setSimulatedResponseHeaders:(id)a3;
- (void)setSimulatedRootElement:(id)a3;
- (void)setSimulatedStatusCode:(int64_t)a3;
- (void)setTaskManager:(id)a3;
- (void)setTimeoutInterval:(double)a3;
- (void)setTotalBytesReceived:(unint64_t)a3;
- (void)setTotalBytesWasProcessedAsAbnormallyLarge:(BOOL)a3;
- (void)submitWithTaskManager:(id)a3;
- (void)tearDownResources;
@end

@implementation CoreDAVTask

+ (unsigned)uniqueQueryID
{
  return ++uniqueQueryID_uniqueQueryID;
}

- (CoreDAVTask)initWithURL:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CoreDAVTask;
  v6 = [(CoreDAVTask *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v7->_depth = 0;
    v7->_timeoutInterval = 240.0;
    v7->_responseStatusCode = -1;
    v7->_allowAutomaticRedirects = 1;
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", +[CoreDAVTask uniqueQueryID](CoreDAVTask, "uniqueQueryID"));
    uniqueID = v7->_uniqueID;
    v7->_uniqueID = (NSString *)v8;

    v10 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&v7->_accountInfoProvider);
    v12 = [v10 logHandleForAccountInfoProvider:WeakRetained];

    if (v12)
    {
      v13 = v12;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        v16 = [(CoreDAVTask *)v7 _sessionForLogging];
        v17 = [(CoreDAVTask *)v7 _requestForLogging];
        v18 = v7->_uniqueID;
        *(_DWORD *)buf = 138413570;
        v22 = v15;
        __int16 v23 = 2048;
        v24 = v7;
        __int16 v25 = 2048;
        v26 = v16;
        __int16 v27 = 2048;
        v28 = v17;
        __int16 v29 = 2112;
        v30 = v7;
        __int16 v31 = 2114;
        v32 = v18;
        _os_log_impl(&dword_213BFC000, v13, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Task initting %@ with ID %{public}@", buf, 0x3Eu);
      }
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v4 = +[CoreDAVLogging sharedLogging];
  id v5 = [v4 logHandleForAccountInfoProvider:0];
  v6 = v5;
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 134218242;
    objc_super v20 = self;
    __int16 v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_213BFC000, v6, OS_LOG_TYPE_INFO, "Task %p of class %{public}@ deallocing", buf, 0x16u);
  }
  if (!self->_finished)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"CoreDAVTask.m", 193, @"<%@ %p>: Tasks must be finished before deallocation", v11, self object file lineNumber description];
  }
  if (self->_session)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"CoreDAVTask.m", 194, @"<%@ %p>: Connection better have been nil in our dealloc: %p", v14, self, self->_session object file lineNumber description];
  }
  if (self->_error)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    [v15 handleFailureInMethod:a2, self, @"CoreDAVTask.m", 195, @"<%@ %p>: Error better have been nil in our dealloc: %p", v17, self, self->_error object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)CoreDAVTask;
  [(CoreDAVTask *)&v18 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v12.receiver = self;
  v12.super_class = (Class)CoreDAVTask;
  v4 = [(CoreDAVTask *)&v12 description];
  [v3 appendFormat:@"[%@ ", v4];

  if (self->_request) {
    [v3 appendFormat:@"| Request: [%@]", self->_request];
  }
  if (self->_session) {
    [v3 appendFormat:@"| Connection: [%@]", self->_session];
  }
  if (self->_task) {
    [v3 appendFormat:@"| Connection: [%@]", self->_task];
  }
  if (self->_response) {
    [v3 appendFormat:@"| Response: [%@]", self->_response];
  }
  if (self->_error) {
    [v3 appendFormat:@"| Error: [%@]", self->_error];
  }
  id v5 = "[RequestSent]";
  v6 = "";
  if (!self->_didSendRequest) {
    id v5 = "";
  }
  if (self->_didReceiveResponse) {
    v7 = "[ReceivedResponse]";
  }
  else {
    v7 = "";
  }
  uint64_t v8 = "[ReceivedData]";
  if (!self->_didReceiveData) {
    uint64_t v8 = "";
  }
  if (self->_didFinishLoading) {
    v9 = "[FinishedLoading]";
  }
  else {
    v9 = "";
  }
  if (self->_didFailWithError) {
    v10 = "[FailedWithError]";
  }
  else {
    v10 = "";
  }
  if (self->_didCancel) {
    v6 = "[Cancelled]";
  }
  objc_msgSend(v3, "appendFormat:", @"| Status: [%s%s%s%s%s%s]", v5, v7, v8, v9, v10, v6);
  [v3 appendFormat:@"]"];
  return (NSString *)v3;
}

- (id)redactedDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v13.receiver = self;
  v13.super_class = (Class)CoreDAVTask;
  v4 = [(CoreDAVTask *)&v13 description];
  [v3 appendFormat:@"[%@ ", v4];

  response = self->_response;
  if (response) {
    objc_msgSend(v3, "appendFormat:", @"| Response Status Code: [%ld]", -[NSHTTPURLResponse statusCode](response, "statusCode"));
  }
  if (self->_error) {
    [v3 appendFormat:@"| Error: [%@]", self->_error];
  }
  v6 = @"[RequestSent]";
  v7 = &stru_26C4B7900;
  if (!self->_didSendRequest) {
    v6 = &stru_26C4B7900;
  }
  if (self->_didReceiveResponse) {
    uint64_t v8 = @"[ReceivedResponse]";
  }
  else {
    uint64_t v8 = &stru_26C4B7900;
  }
  v9 = @"[ReceivedData]";
  if (!self->_didReceiveData) {
    v9 = &stru_26C4B7900;
  }
  if (self->_didFinishLoading) {
    v10 = @"[FinishedLoading]";
  }
  else {
    v10 = &stru_26C4B7900;
  }
  if (self->_didFailWithError) {
    v11 = @"[FailedWithError]";
  }
  else {
    v11 = &stru_26C4B7900;
  }
  if (self->_didCancel) {
    v7 = @"[Cancelled]";
  }
  [v3 appendFormat:@"| Status: [%@%@%@%@%@%@]", v6, v8, v9, v10, v11, v7];
  [v3 appendFormat:@"]"];
  return v3;
}

- (NSRunLoop)workRunLoop
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(CoreDAVTask *)self taskManager];

  if (v3)
  {
    v4 = [(CoreDAVTask *)self taskManager];
    id v5 = [v4 workRunLoop];
  }
  else
  {
    v6 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    uint64_t v8 = [v6 logHandleForAccountInfoProvider:WeakRetained];

    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        objc_super v12 = [(CoreDAVTask *)self _sessionForLogging];
        objc_super v13 = [(CoreDAVTask *)self _requestForLogging];
        int v15 = 138413058;
        v16 = v11;
        __int16 v17 = 2048;
        objc_super v18 = self;
        __int16 v19 = 2048;
        objc_super v20 = v12;
        __int16 v21 = 2048;
        v22 = v13;
        _os_log_impl(&dword_213BFC000, v9, OS_LOG_TYPE_ERROR, "[%@ %p, sess %p, request %p] Could not get the Task Manager's work run loop because the task manager is nil. Defaulting to current run loop.", (uint8_t *)&v15, 0x2Au);
      }
    }

    id v5 = [MEMORY[0x263EFF9F0] currentRunLoop];
  }
  return (NSRunLoop *)v5;
}

- (id)httpMethod
{
  return @"REPORT";
}

- (BOOL)_includeGeneralHeaders
{
  v2 = [(CoreDAVTask *)self httpMethod];
  char v3 = [v2 isEqualToString:@"OPTIONS"] ^ 1;

  return v3;
}

- (id)requestBodyStream
{
  return 0;
}

- (id)requestBody
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  char v3 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v5 = [v3 logHandleForAccountInfoProvider:WeakRetained];

  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      v9 = [(CoreDAVTask *)self _sessionForLogging];
      v10 = [(CoreDAVTask *)self _requestForLogging];
      int v12 = 138413058;
      objc_super v13 = v8;
      __int16 v14 = 2048;
      int v15 = self;
      __int16 v16 = 2048;
      __int16 v17 = v9;
      __int16 v18 = 2048;
      __int16 v19 = v10;
      _os_log_impl(&dword_213BFC000, v6, OS_LOG_TYPE_ERROR, "[%@ %p, sess %p, request %p] requestBody to be implemented by subclass", (uint8_t *)&v12, 0x2Au);
    }
  }

  return 0;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  return 0;
}

- (BOOL)shouldLogResponseBody
{
  return 1;
}

- (void)loadRequest:(id)a3
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(CoreDAVTask *)self tearDownResources];
  v78 = v5;
  if (!v5)
  {
    v70 = [MEMORY[0x263F08690] currentHandler];
    [v70 handleFailureInMethod:a2 object:self file:@"CoreDAVTask.m" lineNumber:282 description:&stru_26C4B7900];
  }
  if (self->_session)
  {
    v71 = [MEMORY[0x263F08690] currentHandler];
    [v71 handleFailureInMethod:a2 object:self file:@"CoreDAVTask.m" lineNumber:283 description:&stru_26C4B7900];
  }
  if (self->_task)
  {
    v72 = [MEMORY[0x263F08690] currentHandler];
    [v72 handleFailureInMethod:a2 object:self file:@"CoreDAVTask.m" lineNumber:284 description:&stru_26C4B7900];
  }
  if (self->_response)
  {
    v73 = [MEMORY[0x263F08690] currentHandler];
    [v73 handleFailureInMethod:a2 object:self file:@"CoreDAVTask.m" lineNumber:285 description:&stru_26C4B7900];
  }
  v76 = [MEMORY[0x263F08B88] currentThread];
  if ([v76 isMainThread])
  {
    v74 = [MEMORY[0x263F08A48] mainQueue];
    v77 = 0;
  }
  else
  {
    v77 = v76;
    v74 = 0;
  }
  if (!self->_callbackThreadSet)
  {
    self->_callbackThreadSet = 1;
    v7 = v77;
    callbackThread = self->_callbackThread;
    self->_callbackThread = v7;
    goto LABEL_16;
  }
  if (v77 != self->_callbackThread)
  {
    callbackThread = [MEMORY[0x263F08690] currentHandler];
    [callbackThread handleFailureInMethod:a2, self, @"CoreDAVTask.m", 306, @"_callbackThread (%@) doesn't match current thread (%@)", self->_callbackThread, v77 object file lineNumber description];
LABEL_16:
  }
  uint64_t v8 = [(CoreDAVTask *)self accountInfoProvider];
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0
    && ([(CoreDAVTask *)self accountInfoProvider],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 getAppleIDSession],
        v75 = objc_claimAutoreleasedReturnValue(),
        v10,
        v75))
  {
    v11 = (void *)[v78 mutableCopy];
    int v12 = [v75 appleIDHeadersForRequest:v11];
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __27__CoreDAVTask_loadRequest___block_invoke;
    v81[3] = &unk_2641DFE98;
    id v82 = v11;
    id v13 = v11;
    [v12 enumerateKeysAndObjectsUsingBlock:v81];
    objc_msgSend(v13, "ak_addDeviceUDIDHeader");
    objc_msgSend(v13, "ak_addClientInfoHeader");
    __int16 v14 = (NSURLRequest *)[v13 copy];
    request = self->_request;
    self->_request = v14;
  }
  else
  {
    __int16 v16 = (NSURLRequest *)[v78 copy];
    __int16 v17 = self->_request;
    self->_request = v16;

    v75 = 0;
  }
  __int16 v18 = [CoreDAVRequestLogger alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  uint64_t v20 = [(CoreDAVRequestLogger *)v18 initWithProvider:WeakRetained];
  logger = self->_logger;
  self->_logger = v20;

  [(CoreDAVTask *)self setResponseBodyParser:0];
  v22 = [(NSURLRequest *)self->_request URL];
  uint64_t v23 = [v22 absoluteString];
  uint64_t v24 = [v23 length];

  __int16 v25 = [(NSURLRequest *)self->_request HTTPBody];
  uint64_t v26 = [v25 length];

  __int16 v27 = +[CoreDAVLogging sharedLogging];
  id v28 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  __int16 v29 = [v27 logHandleForAccountInfoProvider:v28];

  if (v29)
  {
    v30 = v29;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      __int16 v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      uint64_t v33 = [(CoreDAVTask *)self _sessionForLogging];
      v34 = [(CoreDAVTask *)self _requestForLogging];
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v32;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2048;
      v88 = v33;
      *(_WORD *)v89 = 2048;
      *(void *)&v89[2] = v34;
      __int16 v90 = 2048;
      v91 = (NSURLRequest *)(v26 + v24);
      _os_log_impl(&dword_213BFC000, v30, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Size of outgoing, unencrypted request: %ld", buf, 0x34u);
    }
  }

  [(CoreDAVRequestLogger *)self->_logger logCoreDAVRequest:self->_request withTaskIdentifier:self->_uniqueID];
  [(CoreDAVTask *)self _logSantizedRequest:self->_request withTaskID:self->_uniqueID];
  v35 = [(CoreDAVTask *)self url];
  v36 = [v35 host];
  if ([v36 hasSuffix:@"simulated.calendar.apple.com"])
  {
    BOOL v37 = CalDAVServerSimulatorLibraryCore() == 0;

    if (!v37)
    {
      self->_simulated = 1;
      uint64_t v83 = 0;
      v84 = &v83;
      uint64_t v85 = 0x2050000000;
      v38 = (void *)getCalDAVServerSimulatorClass_softClass;
      uint64_t v86 = getCalDAVServerSimulatorClass_softClass;
      if (!getCalDAVServerSimulatorClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCalDAVServerSimulatorClass_block_invoke;
        v88 = &unk_2641E0028;
        *(void *)v89 = &v83;
        __getCalDAVServerSimulatorClass_block_invoke((uint64_t)buf);
        v38 = (void *)v84[3];
      }
      id v39 = v38;
      _Block_object_dispose(&v83, 8);
      v40 = [v39 simulatorForTask:self];
      v41 = [v78 URL];
      v42 = [v41 user];
      -[CoreDAVTask setResponseStatusCode:](self, "setResponseStatusCode:", [v40 simulateTask:self as:v42]);

      if ([(CoreDAVTask *)self responseStatusCode] >= 200
        && [(CoreDAVTask *)self responseStatusCode] < 300)
      {
        v43 = 0;
      }
      else
      {
        v43 = objc_msgSend(objc_alloc(MEMORY[0x263F087E8]), "initWithDomain:code:userInfo:", @"CoreDAVHTTPStatusErrorDomain", -[CoreDAVTask responseStatusCode](self, "responseStatusCode"), 0);
      }
      v67 = [(CoreDAVTask *)self workRunLoop];
      v68 = [(CoreDAVTask *)self workRunLoop];
      v69 = CDVRunLoopModesToPerformDelayedSelectorsInFromRunLoop(v68);
      v79[0] = MEMORY[0x263EF8330];
      v79[1] = 3221225472;
      v79[2] = __27__CoreDAVTask_loadRequest___block_invoke_106;
      v79[3] = &unk_2641DFC88;
      v79[4] = self;
      id v80 = v43;
      id v66 = v43;
      [v67 performInModes:v69 block:v79];

LABEL_47:
      goto LABEL_48;
    }
  }
  else
  {
  }
  v40 = [MEMORY[0x263EFC648] defaultSessionConfiguration];
  [v40 setURLCache:0];
  id v44 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  char v45 = objc_opt_respondsToSelector();

  if (v45)
  {
    id v46 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v47 = [v46 customConnectionProperties];
    [(CoreDAVTask *)self _assignConnectionProperties:v47 toSessionConfiguration:v40];
  }
  id v48 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  if (objc_opt_respondsToSelector())
  {
    id v49 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    char v50 = [v49 handleShouldUseCredentialStorage];

    if ((v50 & 1) == 0) {
      [v40 setURLCredentialStorage:0];
    }
  }
  else
  {
  }
  v51 = [MEMORY[0x263EFC640] sessionWithConfiguration:v40 delegate:self delegateQueue:v74];
  session = self->_session;
  self->_session = v51;

  v53 = [(NSURLSession *)self->_session dataTaskWithRequest:self->_request];
  task = self->_task;
  self->_task = v53;

  v55 = [MEMORY[0x263EFF910] date];
  dateConnectionWentOut = self->_dateConnectionWentOut;
  self->_dateConnectionWentOut = v55;

  [(NSURLSessionDataTask *)self->_task resume];
  if (!self->_task)
  {
    v57 = +[CoreDAVLogging sharedLogging];
    id v58 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v59 = [v57 logHandleForAccountInfoProvider:v58];

    if (v59)
    {
      v60 = v59;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = (objc_class *)objc_opt_class();
        v62 = NSStringFromClass(v61);
        v63 = [(CoreDAVTask *)self _sessionForLogging];
        v64 = [(CoreDAVTask *)self _requestForLogging];
        v65 = self->_request;
        *(_DWORD *)buf = 138413314;
        *(void *)&uint8_t buf[4] = v62;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2048;
        v88 = v63;
        *(_WORD *)v89 = 2048;
        *(void *)&v89[2] = v64;
        __int16 v90 = 2112;
        v91 = v65;
        _os_log_impl(&dword_213BFC000, v60, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Error creating task with request %@", buf, 0x34u);
      }
    }

    id v66 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-1 userInfo:0];
    [(CoreDAVTask *)self finishCoreDAVTaskWithError:v66];
    goto LABEL_47;
  }
LABEL_48:
}

uint64_t __27__CoreDAVTask_loadRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

uint64_t __27__CoreDAVTask_loadRequest___block_invoke_106(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishCoreDAVTaskWithError:*(void *)(a1 + 40)];
}

- (void)_assignConnectionProperties:(id)a3 toSessionConfiguration:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = [v6 allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v26;
    uint64_t v13 = *MEMORY[0x263EFC740];
    uint64_t v24 = *MEMORY[0x263EFC810];
    *(void *)&long long v10 = 138543362;
    long long v21 = v10;
    uint64_t v22 = *MEMORY[0x263EFC740];
    uint64_t v23 = v8;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        int v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        __int16 v16 = objc_msgSend(v6, "objectForKeyedSubscript:", v15, v21);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(CoreDAVTask *)self _assignConnectionProperties:v16 toSessionConfiguration:v7];
        }
        else if ([v15 isEqualToString:v13])
        {
          objc_msgSend(v7, "set_sourceApplicationSecondaryIdentifier:", v16);
        }
        else if ([v15 isEqualToString:v24])
        {
          objc_msgSend(v7, "set_sourceApplicationBundleIdentifier:", v16);
        }
        else
        {
          __int16 v17 = self;
          __int16 v18 = +[CoreDAVLogging sharedLogging];
          __int16 v19 = [v18 logHandleForAccountInfoProvider:0];
          uint64_t v20 = v19;
          if (v19 && os_log_type_enabled(v19, (os_log_type_t)6u))
          {
            *(_DWORD *)buf = v21;
            v30 = v15;
            _os_log_impl(&dword_213BFC000, v20, (os_log_type_t)6u, "Connection property: %{public}@ is not set", buf, 0xCu);
          }

          self = v17;
          uint64_t v13 = v22;
          uint64_t v8 = v23;
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v11);
  }
}

- (void)_logSantizedRequest:(id)a3 withTaskID:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  uint64_t v8 = [v6 logHandleForAccountInfoProvider:WeakRetained];

  if (v8)
  {
    uint64_t v9 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v10 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v10);
      __int16 v19 = [(CoreDAVTask *)self _sessionForLogging];
      uint64_t v11 = [(CoreDAVTask *)self _requestForLogging];
      uniqueID = self->_uniqueID;
      __int16 v16 = [v5 HTTPMethod];
      uint64_t v12 = NSString;
      long long v21 = [v5 URL];
      uint64_t v13 = [v21 scheme];
      __int16 v18 = [v5 URL];
      __int16 v14 = [v18 host];
      [v12 stringWithFormat:@"%@://%@", v13, v14];
      *(_DWORD *)buf = 138413826;
      uint64_t v23 = v20;
      __int16 v24 = 2048;
      long long v25 = self;
      __int16 v26 = 2048;
      long long v27 = v19;
      __int16 v28 = 2048;
      __int16 v29 = v11;
      __int16 v30 = 2114;
      __int16 v31 = uniqueID;
      __int16 v32 = 2114;
      uint64_t v33 = v16;
      v35 = __int16 v34 = 2114;
      int v15 = (void *)v35;
      _os_log_impl(&dword_213BFC000, v9, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Performing Task with ID %{public}@. Method:: %{public}@ RequestURL:: %{public}@", buf, 0x48u);
    }
  }
}

- (void)tearDownResources
{
  session = self->_session;
  if (session)
  {
    self->_didCancel = 1;
    [(NSURLSession *)session invalidateAndCancel];
    v4 = self->_session;
    self->_session = 0;
  }
  task = self->_task;
  self->_task = 0;

  response = self->_response;
  self->_response = 0;

  request = self->_request;
  self->_request = 0;

  error = self->_error;
  self->_error = 0;
}

- (id)_compressBodyData:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  memset(&v9, 0, sizeof(v9));
  v4 = 0;
  if (!deflateInit2_(&v9, -1, 8, 31, 8, 0, "1.2.12", 112))
  {
    v4 = [MEMORY[0x263EFF990] data];
    id v5 = v3;
    v9.avail_in = objc_msgSend(v5, "length", objc_msgSend(v5, "bytes"));
    do
    {
      v9.avail_out = 0x2000;
      v9.next_out = v10;
      int v6 = deflate(&v9, 4);
      if (v6 == -2) {
        -[CoreDAVTask _compressBodyData:]();
      }
      int v7 = v6;
      [v4 appendBytes:v10 length:0x2000 - v9.avail_out];
    }
    while (!v9.avail_out);
    if (v9.avail_in) {
      -[CoreDAVTask _compressBodyData:]();
    }
    if (v7 != 1) {
      -[CoreDAVTask _compressBodyData:]();
    }
    deflateEnd(&v9);
  }

  return v4;
}

- (id)_createBodyData
{
  id v3 = [(CoreDAVTask *)self requestBody];
  self->_requestIsCompressed = 0;
  if (!self->_compressedRequestFailed)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_8;
    }
    id v5 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    if (![v5 shouldCompressRequests])
    {
LABEL_7:

      goto LABEL_8;
    }
    uint64_t v6 = [v3 length];

    if (v6)
    {
      int v7 = [(CoreDAVTask *)self _compressBodyData:v3];
      id WeakRetained = v7;
      if (v7)
      {
        self->_requestIsCompressed = 1;
        id WeakRetained = v7;
        id v5 = v3;
        id v3 = WeakRetained;
        goto LABEL_7;
      }
LABEL_8:
    }
  }
  return v3;
}

- (void)_failImmediately
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v5 = [v3 logHandleForAccountInfoProvider:WeakRetained];

  if (v5)
  {
    uint64_t v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      z_stream v9 = [(CoreDAVTask *)self _sessionForLogging];
      long long v10 = [(CoreDAVTask *)self _requestForLogging];
      int v12 = 138413058;
      uint64_t v13 = v8;
      __int16 v14 = 2048;
      int v15 = self;
      __int16 v16 = 2048;
      __int16 v17 = v9;
      __int16 v18 = 2048;
      __int16 v19 = v10;
      _os_log_impl(&dword_213BFC000, v6, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Account says we should fail now, finishing with error", (uint8_t *)&v12, 0x2Au);
    }
  }

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"CoreDAVErrorDomain" code:0 userInfo:0];
  [(CoreDAVTask *)self finishCoreDAVTaskWithError:v11];
}

- (id)additionalHeaderValues
{
  return 0;
}

- (void)overrideRequestHeader:(id)a3 withValue:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    overriddenHeaders = self->_overriddenHeaders;
    if (!overriddenHeaders)
    {
      z_stream v9 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
      long long v10 = self->_overriddenHeaders;
      self->_overriddenHeaders = v9;

      overriddenHeaders = self->_overriddenHeaders;
    }
    [(NSMutableDictionary *)overriddenHeaders setValue:v7 forKey:v6];
  }
  else
  {
    uint64_t v11 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    uint64_t v13 = [v11 logHandleForAccountInfoProvider:WeakRetained];

    if (v13)
    {
      __int16 v14 = v13;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = (objc_class *)objc_opt_class();
        __int16 v16 = NSStringFromClass(v15);
        __int16 v17 = [(CoreDAVTask *)self _sessionForLogging];
        __int16 v18 = [(CoreDAVTask *)self _requestForLogging];
        int v19 = 138413314;
        uint64_t v20 = v16;
        __int16 v21 = 2048;
        uint64_t v22 = self;
        __int16 v23 = 2048;
        __int16 v24 = v17;
        __int16 v25 = 2048;
        __int16 v26 = v18;
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_impl(&dword_213BFC000, v14, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring nil value for header: %@", (uint8_t *)&v19, 0x34u);
      }
    }
  }
}

- (unint64_t)cachePolicy
{
  return 1;
}

+ (id)stringFromDepth:(int)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return (id)qword_2641E0048[a3];
  }
}

- (void)performCoreDAVTask
{
  uint64_t v231 = *MEMORY[0x263EF8340];
  id v217 = 0;
  BOOL v3 = [(CoreDAVTask *)self validate:&v217];
  v4 = v217;
  if (v3)
  {
    id v5 = [(CoreDAVTask *)self url];
    id v6 = [v5 user];
    uint64_t v7 = [v6 length];

    if (v7) {
      goto LABEL_26;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    z_stream v9 = [WeakRetained user];
    uint64_t v10 = [v9 length];

    uint64_t v11 = +[CoreDAVLogging sharedLogging];
    id v12 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    uint64_t v13 = [v11 logHandleForAccountInfoProvider:v12];

    if (v10)
    {
      if (v13)
      {
        __int16 v14 = v13;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          [(CoreDAVTask *)self _sessionForLogging];
          v207 = v5;
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          id v18 = [(CoreDAVTask *)self _requestForLogging];
          id v19 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          [v19 user];
          uint64_t v20 = v195 = v4;
          *(_DWORD *)buf = 138413570;
          id v220 = v16;
          __int16 v221 = 2048;
          v222 = self;
          __int16 v223 = 2048;
          id v224 = v17;
          __int16 v225 = 2048;
          id v226 = v18;
          __int16 v227 = 2112;
          v228 = v20;
          __int16 v229 = 2112;
          v230 = self;
          _os_log_impl(&dword_213BFC000, v14, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] No user on task, adding user %@: %@", buf, 0x3Eu);

          v4 = v195;
          id v5 = v207;
        }
      }

      __int16 v21 = [v5 host];
      if ([v21 length])
      {
        uint64_t v22 = [v5 scheme];
        uint64_t v23 = [v22 length];

        unint64_t v24 = 0x2641DF000;
        if (v23)
        {
          uint64_t v11 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          uint64_t v13 = [v11 user];
          [v5 CDVURLWithUser:v13];
          id v5 = v25 = v5;
LABEL_24:

          goto LABEL_25;
        }
      }
      else
      {

        unint64_t v24 = 0x2641DF000uLL;
      }
      uint64_t v11 = [*(id *)(v24 + 2264) sharedLogging];
      id v39 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      uint64_t v13 = [v11 logHandleForAccountInfoProvider:v39];

      if (v13)
      {
        __int16 v25 = v13;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v40 = (objc_class *)objc_opt_class();
          NSStringFromClass(v40);
          id v41 = (id)objc_claimAutoreleasedReturnValue();
          id v42 = [(CoreDAVTask *)self _sessionForLogging];
          id v43 = [(CoreDAVTask *)self _requestForLogging];
          *(_DWORD *)buf = 138413314;
          id v220 = v41;
          __int16 v221 = 2048;
          v222 = self;
          __int16 v223 = 2048;
          id v224 = v42;
          __int16 v225 = 2048;
          id v226 = v43;
          __int16 v227 = 2112;
          v228 = v5;
          _os_log_impl(&dword_213BFC000, v25, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] URL is invalid (%@)", buf, 0x34u);
        }
LABEL_23:
        uint64_t v13 = v25;
        goto LABEL_24;
      }
    }
    else if (v13)
    {
      __int16 v25 = v13;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        __int16 v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        id v36 = [(CoreDAVTask *)self _sessionForLogging];
        id v37 = [(CoreDAVTask *)self _requestForLogging];
        v38 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        *(_DWORD *)buf = 138413570;
        id v220 = v35;
        __int16 v221 = 2048;
        v222 = self;
        __int16 v223 = 2048;
        id v224 = v36;
        __int16 v225 = 2048;
        id v226 = v37;
        __int16 v227 = 2112;
        v228 = v38;
        __int16 v229 = 2112;
        v230 = self;
        _os_log_impl(&dword_213BFC000, v25, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] accountInfoProvider [%@] had no username, task was: %@", buf, 0x3Eu);
      }
      goto LABEL_23;
    }
LABEL_25:

LABEL_26:
    id v44 = +[CoreDAVLogging sharedLogging];
    id v45 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    id v46 = [v44 logHandleForAccountInfoProvider:v45];

    if (v46)
    {
      v47 = v46;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        id v48 = (objc_class *)objc_opt_class();
        NSStringFromClass(v48);
        id v49 = (id)objc_claimAutoreleasedReturnValue();
        id v50 = [(CoreDAVTask *)self _sessionForLogging];
        id v51 = [(CoreDAVTask *)self _requestForLogging];
        *(_DWORD *)buf = 138413314;
        id v220 = v49;
        __int16 v221 = 2048;
        v222 = self;
        __int16 v223 = 2048;
        id v224 = v50;
        __int16 v225 = 2048;
        id v226 = v51;
        __int16 v227 = 2112;
        v228 = v5;
        _os_log_impl(&dword_213BFC000, v47, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] URL: %@", buf, 0x34u);
      }
    }

    id v52 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    int v53 = [v52 shouldFailAllTasks];

    if (v53)
    {
      [(CoreDAVTask *)self _failImmediately];
LABEL_136:

      goto LABEL_137;
    }
    v216[0] = MEMORY[0x263EF8330];
    v216[1] = 3221225472;
    v216[2] = __33__CoreDAVTask_performCoreDAVTask__block_invoke;
    v216[3] = &unk_2641DFC10;
    v216[4] = self;
    v54 = v216;
    if (performCoreDAVTask_forcedTimeoutPredicate != -1) {
      dispatch_once(&performCoreDAVTask_forcedTimeoutPredicate, v54);
    }

    double v55 = *(double *)&performCoreDAVTask_forcedTimeoutInterval;
    if (*(double *)&performCoreDAVTask_forcedTimeoutInterval >= 1.0) {
      [(CoreDAVTask *)self setTimeoutInterval:*(double *)&performCoreDAVTask_forcedTimeoutInterval];
    }
    v56 = +[CoreDAVLogging sharedLogging];
    id v57 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    id v58 = [v56 logHandleForAccountInfoProvider:v57];

    if (v58)
    {
      v59 = v58;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      {
        v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        id v61 = (id)objc_claimAutoreleasedReturnValue();
        id v62 = [(CoreDAVTask *)self _sessionForLogging];
        id v63 = [(CoreDAVTask *)self _requestForLogging];
        [(CoreDAVTask *)self timeoutInterval];
        *(_DWORD *)buf = 138413314;
        id v220 = v61;
        __int16 v221 = 2048;
        v222 = self;
        __int16 v223 = 2048;
        id v224 = v62;
        __int16 v225 = 2048;
        id v226 = v63;
        __int16 v227 = 2048;
        v228 = v64;
        _os_log_impl(&dword_213BFC000, v59, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] Using timeout of %lf", buf, 0x34u);
      }
    }

    v209 = [(CoreDAVTask *)self httpMethod];
    id v65 = objc_alloc(MEMORY[0x263EFC5E8]);
    unint64_t v66 = [(CoreDAVTask *)self cachePolicy];
    [(CoreDAVTask *)self timeoutInterval];
    v67 = objc_msgSend(v65, "initWithURL:cachePolicy:timeoutInterval:", v5, v66);
    id v68 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v208 = v5;
    if (objc_opt_respondsToSelector())
    {
      id v69 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      int v70 = [v69 shouldUseOpportunisticSockets];

      if (v70)
      {
        v71 = +[CoreDAVLogging sharedLogging];
        id v72 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        v73 = [v71 logHandleForAccountInfoProvider:v72];

        if (v73)
        {
          v74 = v73;
          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          {
            v75 = (objc_class *)objc_opt_class();
            NSStringFromClass(v75);
            id v76 = (id)objc_claimAutoreleasedReturnValue();
            id v77 = [(CoreDAVTask *)self _sessionForLogging];
            id v78 = [(CoreDAVTask *)self _requestForLogging];
            *(_DWORD *)buf = 138413058;
            id v220 = v76;
            __int16 v221 = 2048;
            v222 = self;
            __int16 v223 = 2048;
            id v224 = v77;
            __int16 v225 = 2048;
            id v226 = v78;
            _os_log_impl(&dword_213BFC000, v74, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Account requested an opportunistic socket.  Doing that", buf, 0x2Au);
          }
        }

        [v67 setNetworkServiceType:5];
        goto LABEL_53;
      }
    }
    else
    {
    }
    v79 = +[CoreDAVLogging sharedLogging];
    id v80 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v81 = [v79 logHandleForAccountInfoProvider:v80];

    if (v81)
    {
      id v82 = v81;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        uint64_t v83 = (objc_class *)objc_opt_class();
        NSStringFromClass(v83);
        id v84 = (id)objc_claimAutoreleasedReturnValue();
        id v85 = [(CoreDAVTask *)self _sessionForLogging];
        id v86 = [(CoreDAVTask *)self _requestForLogging];
        *(_DWORD *)buf = 138413058;
        id v220 = v84;
        __int16 v221 = 2048;
        v222 = self;
        __int16 v223 = 2048;
        id v224 = v85;
        __int16 v225 = 2048;
        id v226 = v86;
        _os_log_impl(&dword_213BFC000, v82, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Not using opportunistic sockets for task", buf, 0x2Au);
      }
    }

LABEL_53:
    id v87 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v88 = [v87 password];
    uint64_t v89 = [v88 length];

    if (!v89) {
      [v67 _setProperty:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263EFC8A8]];
    }
    long long v214 = 0u;
    long long v215 = 0u;
    long long v212 = 0u;
    long long v213 = 0u;
    __int16 v90 = self->_requestProperties;
    uint64_t v91 = [(NSDictionary *)v90 countByEnumeratingWithState:&v212 objects:v218 count:16];
    if (v91)
    {
      uint64_t v92 = v91;
      uint64_t v93 = *(void *)v213;
      do
      {
        for (uint64_t i = 0; i != v92; ++i)
        {
          if (*(void *)v213 != v93) {
            objc_enumerationMutation(v90);
          }
          uint64_t v95 = *(void *)(*((void *)&v212 + 1) + 8 * i);
          v96 = [(NSDictionary *)self->_requestProperties objectForKey:v95];
          [v67 _setProperty:v96 forKey:v95];
        }
        uint64_t v92 = [(NSDictionary *)v90 countByEnumeratingWithState:&v212 objects:v218 count:16];
      }
      while (v92);
    }

    [v67 setHTTPMethod:v209];
    uint64_t v97 = [(CoreDAVTask *)self requestBodyStream];
    if (v97)
    {
      [v67 setHTTPBodyStream:v97];
      id v98 = 0;
      id v5 = v208;
      unint64_t v99 = 0x2641DF000;
    }
    else
    {
      id v98 = [(CoreDAVTask *)self _createBodyData];
      [v67 setHTTPBody:v98];
      id v5 = v208;
      unint64_t v99 = 0x2641DF000uLL;
      if (-[CoreDAVTask _includeGeneralHeaders](self, "_includeGeneralHeaders") || [v98 length])
      {
        v100 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v98, "length"));
        [v67 setValue:v100 forHTTPHeaderField:@"Content-Length"];
      }
      if (!v98)
      {
LABEL_69:
        v205 = (void *)v97;
        if ([(CoreDAVTask *)self _includeGeneralHeaders])
        {
          v101 = objc_msgSend((id)objc_opt_class(), "stringFromDepth:", -[CoreDAVTask depth](self, "depth"));
          if (v101) {
            [v67 setValue:v101 forHTTPHeaderField:@"Depth"];
          }
          v102 = [v5 scheme];
          int v103 = [v102 isEqualToString:@"https"];

          if (v103)
          {
            id v104 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
            char v105 = objc_opt_respondsToSelector();

            if (v105)
            {
              id v106 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
              int v107 = [v106 shouldSendClientInfoHeaderForURL:v5];

              if (v107)
              {
                v108 = CDVAppleClientInfoString();
                [v67 setValue:v108 forHTTPHeaderField:@"X-Apple-Client-Info"];
              }
            }
          }
        }
        id v109 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        v110 = [v109 userAgentHeader];

        id v206 = v98;
        if (v110)
        {
          v111 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          v112 = [v111 userAgentHeader];
          [v67 setValue:v112 forHTTPHeaderField:@"User-Agent"];
        }
        else
        {
          v111 = CDVDefaultUserAgent();
          [v67 setValue:v111 forHTTPHeaderField:@"User-Agent"];
        }

        v210[0] = MEMORY[0x263EF8330];
        v210[1] = 3221225472;
        v210[2] = __33__CoreDAVTask_performCoreDAVTask__block_invoke_148;
        v210[3] = &unk_2641DFEC0;
        id v113 = v67;
        id v211 = v113;
        v114 = (void *)MEMORY[0x216694110](v210);
        v115 = [(CoreDAVTask *)self additionalHeaderValues];
        [v115 enumerateKeysAndObjectsUsingBlock:v114];

        id v116 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        char v117 = objc_opt_respondsToSelector();

        if (v117)
        {
          id v118 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          v119 = [v118 additionalHeaderValues];
          [v119 enumerateKeysAndObjectsUsingBlock:v114];
        }
        id v120 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        char v121 = objc_opt_respondsToSelector();

        if (v121)
        {
          id v122 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          v123 = [v122 clientToken];

          if ([v123 length]) {
            [v113 setValue:v123 forHTTPHeaderField:@"X-ClientToken"];
          }
        }
        if (self->_ignoresGuardianRestrictions) {
          [v113 setValue:@"true" forHTTPHeaderField:@"X-mme-guardian-restricted-relaxed"];
        }
        id v124 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        char v125 = objc_opt_respondsToSelector();

        if (v125)
        {
          id v126 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          v127 = [v126 oauthInfoProvider];

          if ((objc_opt_respondsToSelector() & 1) != 0 && [v127 oauthVariant] == 1)
          {
            v201 = v114;
            v128 = [*(id *)(v99 + 2264) sharedLogging];
            id v129 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
            v130 = [v128 logHandleForAccountInfoProvider:v129];

            if (v130)
            {
              v131 = v4;
              v132 = v130;
              if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
              {
                v133 = (objc_class *)objc_opt_class();
                NSStringFromClass(v133);
                v198 = v127;
                id v134 = (id)objc_claimAutoreleasedReturnValue();
                id v135 = [(CoreDAVTask *)self _sessionForLogging];
                id v136 = [(CoreDAVTask *)self _requestForLogging];
                *(_DWORD *)buf = 138413058;
                id v220 = v134;
                __int16 v221 = 2048;
                v222 = self;
                __int16 v223 = 2048;
                id v224 = v135;
                __int16 v225 = 2048;
                id v226 = v136;
                _os_log_impl(&dword_213BFC000, v132, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Pre-authing with Bearer + OAuth2 token", buf, 0x2Au);

                v127 = v198;
              }

              v4 = v131;
              id v5 = v208;
            }

            v137 = [v127 oauth2Token];
            if ([v137 length])
            {
              v138 = [NSString stringWithFormat:@"Bearer %@", v137];
              [v113 setValue:v138 forHTTPHeaderField:@"Authorization"];
            }
            unint64_t v99 = 0x2641DF000;
            v114 = v201;
          }
        }
        else
        {
          v127 = 0;
        }
        if (self->_requestIsCompressed)
        {
          [v113 setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
          [v113 setValue:@"no-transform" forHTTPHeaderField:@"Cache-Control"];
        }
        [(NSMutableDictionary *)self->_overriddenHeaders enumerateKeysAndObjectsUsingBlock:v114];
        id v139 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        v140 = [v139 identityPersist];

        v204 = v140;
        if (v140)
        {
          v199 = v127;
          v202 = v114;
          v141 = v4;
          v142 = [*(id *)(v99 + 2264) sharedLogging];
          id v143 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          v144 = [v142 logHandleForAccountInfoProvider:v143];

          if (v144)
          {
            v145 = v144;
            if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
            {
              v146 = (objc_class *)objc_opt_class();
              NSStringFromClass(v146);
              id v147 = (id)objc_claimAutoreleasedReturnValue();
              id v148 = [(CoreDAVTask *)self _sessionForLogging];
              id v149 = [(CoreDAVTask *)self _requestForLogging];
              *(_DWORD *)buf = 138413058;
              id v220 = v147;
              __int16 v221 = 2048;
              v222 = self;
              __int16 v223 = 2048;
              id v224 = v148;
              __int16 v225 = 2048;
              id v226 = v149;
              _os_log_impl(&dword_213BFC000, v145, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Found identity, attaching client certificate", buf, 0x2Au);

              id v5 = v208;
              v140 = v204;
            }
          }
          v150 = _CoreDAVSecCopyIdentityFromPersist(v140);
          if (v150)
          {
            v151 = v150;
            v152 = _CoreDAVSecIdentityCopySSLClientAuthenticationChain(v150);
            v127 = v199;
            if (v152)
            {
              v153 = v152;
              v4 = v141;
              uint64_t v154 = [(CoreDAVTask *)self _applyAuthenticationChain:v152 toRequest:v113];

              CFRelease(v153);
              id v113 = (id)v154;
            }
            else
            {
              v155 = +[CoreDAVLogging sharedLogging];
              id v156 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
              v196 = v155;
              v157 = [v155 logHandleForAccountInfoProvider:v156];

              if (v157)
              {
                v158 = v157;
                if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
                {
                  v159 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v159);
                  id v160 = (id)objc_claimAutoreleasedReturnValue();
                  id v161 = [(CoreDAVTask *)self _sessionForLogging];
                  [(CoreDAVTask *)self _requestForLogging];
                  log = v158;
                  id v162 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413314;
                  id v220 = v160;
                  __int16 v221 = 2048;
                  v222 = self;
                  __int16 v223 = 2048;
                  id v224 = v161;
                  __int16 v225 = 2048;
                  id v226 = v162;
                  __int16 v227 = 2112;
                  v228 = v151;
                  _os_log_impl(&dword_213BFC000, log, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] No auth chain for sec identity %@", buf, 0x34u);

                  v158 = log;
                  v127 = v199;
                }
              }
              v4 = v141;
            }
            CFRelease(v151);
            unint64_t v99 = 0x2641DF000uLL;
            v114 = v202;
          }
          else
          {
            v4 = v141;
            unint64_t v99 = 0x2641DF000;
            v127 = v199;
            v114 = v202;
          }
        }
        id v163 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        char v164 = objc_opt_respondsToSelector();

        if (v164)
        {
          id v165 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          uint64_t v166 = [v165 shouldHandleHTTPCookiesForURL:v5];

          [v113 setHTTPShouldHandleCookies:v166];
          if (v166)
          {
            id v167 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
            char v168 = objc_opt_respondsToSelector();

            if (v168)
            {
              id v169 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
              v170 = (const void *)[v169 copyStorageSession];

              if (v170)
              {
                v203 = v114;
                v197 = v4;
                v171 = +[CoreDAVLogging sharedLogging];
                id v172 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
                v173 = v171;
                v174 = [v171 logHandleForAccountInfoProvider:v172];

                v175 = v205;
                if (v174)
                {
                  v200 = v127;
                  v176 = v174;
                  if (os_log_type_enabled(v176, OS_LOG_TYPE_INFO))
                  {
                    v177 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v177);
                    id v178 = (id)objc_claimAutoreleasedReturnValue();
                    id v179 = [(CoreDAVTask *)self _sessionForLogging];
                    id v180 = [(CoreDAVTask *)self _requestForLogging];
                    *(_DWORD *)buf = 138413058;
                    id v220 = v178;
                    __int16 v221 = 2048;
                    v222 = self;
                    __int16 v223 = 2048;
                    id v224 = v179;
                    __int16 v225 = 2048;
                    id v226 = v180;
                    _os_log_impl(&dword_213BFC000, v176, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Account requested custom storage session.  Doing that", buf, 0x2Au);

                    id v5 = v208;
                    v175 = v205;
                  }

                  v127 = v200;
                }

                uint64_t v181 = [(CoreDAVTask *)self _applyStorageSession:v170 toRequest:v113];

                CFRelease(v170);
                id v113 = (id)v181;
                v4 = v197;
                unint64_t v99 = 0x2641DF000;
                v114 = v203;
LABEL_127:
                if (v175)
                {
                  v182 = [*(id *)(v99 + 2264) sharedLogging];
                  id v183 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
                  v184 = [v182 logHandleForAccountInfoProvider:v183];

                  if (v184)
                  {
                    v184 = v184;
                    if (!os_log_type_enabled(v184, OS_LOG_TYPE_DEBUG))
                    {
LABEL_132:

                      goto LABEL_133;
                    }
                    v185 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v185);
                    id v186 = (id)objc_claimAutoreleasedReturnValue();
                    id v187 = [(CoreDAVTask *)self _sessionForLogging];
                    [(CoreDAVTask *)self _requestForLogging];
                    v188 = v4;
                    v189 = v127;
                    id v190 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413058;
                    id v220 = v186;
                    __int16 v221 = 2048;
                    v222 = self;
                    __int16 v223 = 2048;
                    id v224 = v187;
                    __int16 v225 = 2048;
                    id v226 = v190;
                    v191 = "[%@ %p, sess %p, request %p] Outgoing request body is streamed";
LABEL_131:
                    _os_log_impl(&dword_213BFC000, v184, OS_LOG_TYPE_DEBUG, v191, buf, 0x2Au);

                    v127 = v189;
                    v4 = v188;
                    id v5 = v208;

                    v175 = v205;
                    goto LABEL_132;
                  }
                }
                else
                {
                  if ([v206 bytes]) {
                    goto LABEL_135;
                  }
                  v182 = [*(id *)(v99 + 2264) sharedLogging];
                  id v192 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
                  v184 = [v182 logHandleForAccountInfoProvider:v192];

                  if (v184)
                  {
                    v184 = v184;
                    if (!os_log_type_enabled(v184, OS_LOG_TYPE_DEBUG)) {
                      goto LABEL_132;
                    }
                    v193 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v193);
                    id v186 = (id)objc_claimAutoreleasedReturnValue();
                    id v187 = [(CoreDAVTask *)self _sessionForLogging];
                    [(CoreDAVTask *)self _requestForLogging];
                    v188 = v4;
                    v189 = v127;
                    id v190 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413058;
                    id v220 = v186;
                    __int16 v221 = 2048;
                    v222 = self;
                    __int16 v223 = 2048;
                    id v224 = v187;
                    __int16 v225 = 2048;
                    id v226 = v190;
                    v191 = "[%@ %p, sess %p, request %p] Outgoing request body is empty";
                    goto LABEL_131;
                  }
                }
LABEL_133:

LABEL_135:
                [v113 _setNonAppInitiated:1];
                [(CoreDAVTask *)self loadRequest:v113];

                goto LABEL_136;
              }
              unint64_t v99 = 0x2641DF000;
            }
          }
        }
        else
        {
          [v113 setHTTPShouldHandleCookies:0];
        }
        v175 = v205;
        goto LABEL_127;
      }
    }
    [v67 setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    goto LABEL_69;
  }
  __int16 v26 = +[CoreDAVLogging sharedLogging];
  id v27 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v28 = [v26 logHandleForAccountInfoProvider:v27];

  if (v28)
  {
    uint64_t v29 = v28;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      __int16 v30 = (objc_class *)objc_opt_class();
      __int16 v31 = NSStringFromClass(v30);
      __int16 v32 = [(CoreDAVTask *)self _sessionForLogging];
      uint64_t v33 = [(CoreDAVTask *)self _requestForLogging];
      *(_DWORD *)buf = 138413570;
      id v220 = v31;
      __int16 v221 = 2048;
      v222 = self;
      __int16 v223 = 2048;
      id v224 = v32;
      __int16 v225 = 2048;
      id v226 = v33;
      __int16 v227 = 2112;
      v228 = v4;
      __int16 v229 = 2112;
      v230 = self;
      _os_log_impl(&dword_213BFC000, v29, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Validation error: [%@], task: [%@]", buf, 0x3Eu);
    }
  }

  [(CoreDAVTask *)self finishCoreDAVTaskWithError:v4];
LABEL_137:
}

void __33__CoreDAVTask_performCoreDAVTask__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 doubleForKey:@"CoreDAVForcedTaskTimeoutInterval"];
  performCoreDAVTask_forcedTimeoutInterval = v3;

  v4 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

  if (v6)
  {
    uint64_t v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      z_stream v9 = NSStringFromClass(v8);
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = [v10 _sessionForLogging];
      id v12 = [*(id *)(a1 + 32) _requestForLogging];
      int v13 = 138413314;
      __int16 v14 = v9;
      __int16 v15 = 2048;
      id v16 = v10;
      __int16 v17 = 2048;
      id v18 = v11;
      __int16 v19 = 2048;
      uint64_t v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = performCoreDAVTask_forcedTimeoutInterval;
      _os_log_impl(&dword_213BFC000, v7, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] Attempting to force a permanent CoreDAVTask timeout of [%lf]", (uint8_t *)&v13, 0x34u);
    }
  }
}

uint64_t __33__CoreDAVTask_performCoreDAVTask__block_invoke_148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (BOOL)validate:(id *)a3
{
  return 1;
}

- (void)_sendTimeSpentInNetworkingToProvider
{
  if (!self->_dateConnectionWentOut) {
    return;
  }
  p_accountInfoProvider = &self->_accountInfoProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  char v5 = objc_opt_respondsToSelector();

  id v6 = objc_loadWeakRetained((id *)p_accountInfoProvider);
  if (v5)
  {
    uint64_t v7 = [MEMORY[0x263EFF910] date];
    [v7 timeIntervalSinceDate:self->_dateConnectionWentOut];
    objc_msgSend(v6, "noteTimeSpentInNetworking:forTask:", self);
LABEL_7:

    goto LABEL_8;
  }
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v6 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    uint64_t v7 = [MEMORY[0x263EFF910] date];
    [v7 timeIntervalSinceDate:self->_dateConnectionWentOut];
    objc_msgSend(v6, "noteTimeSpentInNetworking:");
    goto LABEL_7;
  }
LABEL_8:
  dateConnectionWentOut = self->_dateConnectionWentOut;
  self->_dateConnectionWentOut = 0;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(CoreDAVTask *)self markAsFinished]) {
    goto LABEL_16;
  }
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_performCoreDAVTask object:0];
  [(CoreDAVTask *)self reportStatusWithError:v4];
  if (!self->_didFinishLoading) {
    [(CoreDAVRequestLogger *)self->_logger finishCoreDAVResponse];
  }
  [(CoreDAVTask *)self setError:v4];
  session = self->_session;
  if (session)
  {
    self->_didCancel = 1;
    [(NSURLSession *)session invalidateAndCancel];
    id v6 = self->_session;
    self->_session = 0;
  }
  task = self->_task;
  self->_task = 0;

  request = self->_request;
  self->_request = 0;

  z_stream v9 = [(CoreDAVTask *)self completionBlock];

  if (v9)
  {
    uint64_t v10 = [(CoreDAVTask *)self completionBlock];
    v10[2]();
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v11 = [(CoreDAVTask *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    uint64_t v10 = [(CoreDAVTask *)self delegate];
    [v10 task:self didFinishWithError:v4];
    goto LABEL_10;
  }
LABEL_11:
  [(CoreDAVTask *)self tearDownResources];
  int v13 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  __int16 v15 = [v13 logHandleForAccountInfoProvider:WeakRetained];

  if (v15)
  {
    id v16 = v15;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      __int16 v19 = [(CoreDAVTask *)self _sessionForLogging];
      uint64_t v20 = [(CoreDAVTask *)self _requestForLogging];
      uniqueID = self->_uniqueID;
      int v23 = 138413570;
      unint64_t v24 = v18;
      __int16 v25 = 2048;
      __int16 v26 = self;
      __int16 v27 = 2048;
      id v28 = v19;
      __int16 v29 = 2048;
      __int16 v30 = v20;
      __int16 v31 = 2114;
      __int16 v32 = uniqueID;
      __int16 v33 = 2112;
      id v34 = v4;
      _os_log_impl(&dword_213BFC000, v16, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] FinishCoreDAVTaskWithError [ID=%{public}@, error=%@]", (uint8_t *)&v23, 0x3Eu);
    }
  }

  [(CoreDAVTask *)self _sendTimeSpentInNetworkingToProvider];
  id v22 = objc_loadWeakRetained((id *)&self->_taskManager);
  [v22 coreDAVTaskDidFinish:self];

LABEL_16:
}

- (BOOL)isFinished
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL finished = v2->_finished;
  objc_sync_exit(v2);

  return finished;
}

- (BOOL)markAsFinished
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = !v2->_finished;
  v2->_BOOL finished = 1;
  objc_sync_exit(v2);

  return v3;
}

- (id)credentialForClientCertificateChallenge:(id)a3
{
  p_accountInfoProvider = &self->_accountInfoProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v6 = 0;
    z_stream v9 = 0;
    goto LABEL_6;
  }
  id v5 = objc_loadWeakRetained((id *)p_accountInfoProvider);
  id v6 = [v5 clientCertificateInfoProvider];

  if (v6)
  {
    uint64_t v7 = [v6 copySecIdentity];
    if (v7)
    {
      char v8 = (const void *)v7;
      id WeakRetained = [v6 secCertificates];
      z_stream v9 = (void *)[objc_alloc(MEMORY[0x263EFC610]) initWithIdentity:v8 certificates:WeakRetained persistence:1];
      CFRelease(v8);
LABEL_6:

      goto LABEL_8;
    }
  }
  z_stream v9 = 0;
LABEL_8:

  return v9;
}

- (id)credentialForOAuthChallenge:(id)a3
{
  id v4 = a3;
  p_accountInfoProvider = &self->_accountInfoProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_accountInfoProvider);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    z_stream v9 = [v8 oauthInfoProvider];
  }
  else
  {
    z_stream v9 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    [v9 oauth2Token];
    uint64_t v10 = [v4 protectionSpace];
    [v10 realm];
    OAuth2 = (const void *)_CFURLCredentialCreateOAuth2();
  }
  else
  {
    OAuth2 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && !OAuth2) {
    OAuth2 = (const void *)[v9 newOAuth1CredentialForChallenge:v4];
  }
  if (OAuth2)
  {
    char v12 = (void *)[objc_alloc(MEMORY[0x263EFC610]) _initWithCFURLCredential:OAuth2];
    CFRelease(OAuth2);
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)_applyAuthenticationChain:(__CFArray *)a3 toRequest:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  char v7 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  z_stream v9 = [v7 logHandleForAccountInfoProvider:WeakRetained];

  if (v9)
  {
    uint64_t v10 = v9;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      char v12 = NSStringFromClass(v11);
      int v13 = [(CoreDAVTask *)self _sessionForLogging];
      __int16 v14 = [(CoreDAVTask *)self _requestForLogging];
      int v23 = 138413570;
      unint64_t v24 = v12;
      __int16 v25 = 2048;
      __int16 v26 = self;
      __int16 v27 = 2048;
      id v28 = v13;
      __int16 v29 = 2048;
      __int16 v30 = v14;
      __int16 v31 = 2112;
      __int16 v32 = a3;
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_impl(&dword_213BFC000, v10, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Applying authentication chain %@ to request %@", (uint8_t *)&v23, 0x3Eu);
    }
  }

  id v15 = v6;
  [v15 _CFURLRequest];
  MutableCopy = (const void *)CFURLRequestCreateMutableCopy();
  __int16 v17 = (const void *)*MEMORY[0x263EFC830];
  CFDictionaryRef SSLProperties = (const __CFDictionary *)CFURLRequestGetSSLProperties();
  if (SSLProperties) {
    Mutable = CFDictionaryCreateMutableCopy(0, 0, SSLProperties);
  }
  else {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  uint64_t v20 = Mutable;
  CFDictionarySetValue(Mutable, v17, a3);
  CFURLRequestSetSSLProperties();
  CFRelease(v20);
  __int16 v21 = (void *)[objc_alloc(MEMORY[0x263EFC5E8]) _initWithCFURLRequest:MutableCopy];

  CFRelease(MutableCopy);
  return v21;
}

- (id)_applyStorageSession:(__CFURLStorageSession *)a3 toRequest:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  char v7 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  z_stream v9 = [v7 logHandleForAccountInfoProvider:WeakRetained];

  if (v9)
  {
    uint64_t v10 = v9;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      char v12 = NSStringFromClass(v11);
      int v13 = [(CoreDAVTask *)self _sessionForLogging];
      __int16 v14 = [(CoreDAVTask *)self _requestForLogging];
      int v19 = 138413570;
      uint64_t v20 = v12;
      __int16 v21 = 2048;
      id v22 = self;
      __int16 v23 = 2048;
      unint64_t v24 = v13;
      __int16 v25 = 2048;
      __int16 v26 = v14;
      __int16 v27 = 2112;
      id v28 = a3;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl(&dword_213BFC000, v10, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] Applying storage session %@ to request %@", (uint8_t *)&v19, 0x3Eu);
    }
  }

  id v15 = v6;
  [v15 _CFURLRequest];
  MutableCopy = (const void *)CFURLRequestCreateMutableCopy();
  _CFURLRequestSetStorageSession();
  __int16 v17 = (void *)[objc_alloc(MEMORY[0x263EFC5E8]) _initWithCFURLRequest:MutableCopy];

  CFRelease(MutableCopy);
  return v17;
}

- (void)_handleBadPasswordResponse
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __41__CoreDAVTask__handleBadPasswordResponse__block_invoke;
  v33[3] = &unk_2641DFEE8;
  v33[4] = self;
  BOOL v3 = (void *)MEMORY[0x216694110](v33, a2);
  id v4 = [(CoreDAVTask *)self responseHeaders];
  uint64_t v5 = [v4 CDVObjectForKeyCaseInsensitive:@"X-Web-Login-Required"];
  if (v5)
  {
    id v6 = (void *)v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      z_stream v9 = +[CoreDAVLogging sharedLogging];
      id v10 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      uint64_t v11 = [v9 logHandleForAccountInfoProvider:v10];

      if (v11)
      {
        char v12 = v11;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v13 = (objc_class *)objc_opt_class();
          __int16 v14 = NSStringFromClass(v13);
          id v15 = [(CoreDAVTask *)self _sessionForLogging];
          id v16 = [(CoreDAVTask *)self _requestForLogging];
          id v17 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          id v18 = (objc_class *)objc_opt_class();
          int v19 = NSStringFromClass(v18);
          *(_DWORD *)buf = 138413314;
          uint64_t v35 = v14;
          __int16 v36 = 2048;
          id v37 = self;
          __int16 v38 = 2048;
          id v39 = v15;
          __int16 v40 = 2048;
          id v41 = v16;
          __int16 v42 = 2114;
          id v43 = v19;
          _os_log_impl(&dword_213BFC000, v12, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] XWebLoginRequired header defined. Invoking _accountInfoProvider - %{public}@ HandleWebLogin delegate", buf, 0x34u);
        }
      }

      [(CoreDAVTask *)self handleWebLoginRequestWithCompletionBlock:v3];
      goto LABEL_14;
    }
  }
  else
  {
  }
  uint64_t v20 = +[CoreDAVLogging sharedLogging];
  id v21 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v22 = [v20 logHandleForAccountInfoProvider:v21];

  if (v22)
  {
    __int16 v23 = v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      unint64_t v24 = (objc_class *)objc_opt_class();
      __int16 v25 = NSStringFromClass(v24);
      [(CoreDAVTask *)self _sessionForLogging];
      __int16 v26 = v32 = v3;
      __int16 v27 = [(CoreDAVTask *)self _requestForLogging];
      id v28 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      __int16 v29 = (objc_class *)objc_opt_class();
      id v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138413314;
      uint64_t v35 = v25;
      __int16 v36 = 2048;
      id v37 = self;
      __int16 v38 = 2048;
      id v39 = v26;
      __int16 v40 = 2048;
      id v41 = v27;
      __int16 v42 = 2114;
      id v43 = v30;
      _os_log_impl(&dword_213BFC000, v23, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] _accountInfoProvider - %{public}@ Prompting User for Password. This may result in renewCredentials call.", buf, 0x34u);

      BOOL v3 = v32;
    }
  }
  id v31 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  [v31 promptUserForNewCoreDAVPasswordWithCompletionBlock:v3];

LABEL_14:
}

void __41__CoreDAVTask__handleBadPasswordResponse__block_invoke(uint64_t a1, int a2)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  char v4 = [*(id *)(a1 + 32) isFinished];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    id v6 = *(void **)(v5 + 120);
    *(void *)(v5 + 120) = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
    [WeakRetained coreDAVTaskEndModal:*(void *)(a1 + 32)];

    if ((a2 - 1) >= 3)
    {
      if (!a2)
      {
        uint64_t v22 = *(void *)(a1 + 32);
        __int16 v23 = *(void **)(v22 + 120);
        *(void *)(v22 + 120) = 0;

        unint64_t v24 = +[CoreDAVLogging sharedLogging];
        id v25 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
        __int16 v26 = [v24 logHandleForAccountInfoProvider:v25];

        if (v26)
        {
          __int16 v27 = v26;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            id v28 = (objc_class *)objc_opt_class();
            __int16 v29 = NSStringFromClass(v28);
            id v30 = *(void **)(a1 + 32);
            id v31 = [v30 _sessionForLogging];
            __int16 v32 = [*(id *)(a1 + 32) _requestForLogging];
            id v33 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
            id v34 = (objc_class *)objc_opt_class();
            uint64_t v35 = NSStringFromClass(v34);
            *(_DWORD *)buf = 138413314;
            __int16 v40 = v29;
            __int16 v41 = 2048;
            __int16 v42 = v30;
            __int16 v43 = 2048;
            uint64_t v44 = v31;
            __int16 v45 = 2048;
            id v46 = v32;
            __int16 v47 = 2114;
            id v48 = v35;
            _os_log_impl(&dword_213BFC000, v27, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] _accountInfoProvider %{public}@ User Entered New Password. Retrying Task.", buf, 0x34u);
          }
        }

        __int16 v36 = *(void **)(a1 + 32);
        id v37 = CDVRunLoopModesToPerformDelayedSelectorsIn();
        [v36 performSelector:sel_performCoreDAVTask withObject:0 afterDelay:v37 inModes:0.0];
      }
    }
    else
    {
      id v8 = *(id *)(*(void *)(a1 + 32) + 120);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 120);
      *(void *)(v9 + 120) = 0;

      uint64_t v11 = +[CoreDAVLogging sharedLogging];
      id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      int v13 = [v11 logHandleForAccountInfoProvider:v12];

      if (v13)
      {
        __int16 v14 = v13;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v15 = (objc_class *)objc_opt_class();
          id v16 = NSStringFromClass(v15);
          id v17 = *(void **)(a1 + 32);
          __int16 v38 = [v17 _sessionForLogging];
          id v18 = [*(id *)(a1 + 32) _requestForLogging];
          id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
          uint64_t v20 = (objc_class *)objc_opt_class();
          id v21 = NSStringFromClass(v20);
          *(_DWORD *)buf = 138413314;
          __int16 v40 = v16;
          __int16 v41 = 2048;
          __int16 v42 = v17;
          __int16 v43 = 2048;
          uint64_t v44 = v38;
          __int16 v45 = 2048;
          id v46 = v18;
          __int16 v47 = 2114;
          id v48 = v21;
          _os_log_impl(&dword_213BFC000, v14, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] _accountInfoProvider %{public}@ User either Cancelled/Rejected prompt or System can not prompt for password. Finishing Task.", buf, 0x34u);
        }
      }

      [*(id *)(a1 + 32) finishCoreDAVTaskWithError:v8];
    }
  }
}

- (void)_runOnThisThread:(id)a3
{
}

- (void)_runOnCallbackThread:(id)a3
{
  callbackThread = self->_callbackThread;
  if (callbackThread)
  {
    id v6 = (id)MEMORY[0x216694110](a3, a2);
    [(CoreDAVTask *)self performSelector:sel__runOnThisThread_ onThread:callbackThread withObject:v6 waitUntilDone:0];
  }
  else
  {
    uint64_t v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (v5)
  {
    id v6 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    id v8 = [v6 logHandleForAccountInfoProvider:WeakRetained];

    if (v8)
    {
      uint64_t v9 = v8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v10);
        id v12 = [(CoreDAVTask *)self _sessionForLogging];
        int v13 = [(CoreDAVTask *)self _requestForLogging];
        int v14 = 138413314;
        id v15 = v11;
        __int16 v16 = 2048;
        id v17 = self;
        __int16 v18 = 2048;
        id v19 = v12;
        __int16 v20 = 2048;
        id v21 = v13;
        __int16 v22 = 2112;
        id v23 = v5;
        _os_log_impl(&dword_213BFC000, v9, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] session invalidated with error %@", (uint8_t *)&v14, 0x34u);
      }
    }
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__CoreDAVTask_URLSession_didReceiveChallenge_completionHandler___block_invoke;
  v11[3] = &unk_2641DFF10;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(CoreDAVTask *)self _runOnCallbackThread:v11];
}

uint64_t __64__CoreDAVTask_URLSession_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAuthenticationChallenge:*(void *)(a1 + 40) task:0 completionHandler:*(void *)(a1 + 48)];
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v10 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__CoreDAVTask_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke;
  v12[3] = &unk_2641DFF38;
  id v13 = v10;
  int v14 = self;
  int64_t v15 = a6;
  int64_t v16 = a7;
  id v11 = v10;
  [(CoreDAVTask *)self _runOnCallbackThread:v12];
}

void __87__CoreDAVTask_URLSession_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3 == v2[7])
  {
    int64_t v15 = [v2 requestProgressBlock];
    if (v15 && (*(void *)(a1 + 48) & 0x8000000000000000) == 0)
    {
      uint64_t v16 = *(void *)(a1 + 56);

      if (v16 < 0) {
        return;
      }
      uint64_t v17 = [*(id *)(a1 + 40) requestProgressBlock];
      (*(void (**)(uint64_t, void, void, uint64_t))(v17 + 16))(v17, *(void *)(a1 + 48), *(void *)(a1 + 56), 1);
      int64_t v15 = (void *)v17;
    }
  }
  else
  {
    char v4 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    id v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

    if (v6)
    {
      id v7 = v6;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        id v10 = *(void **)(a1 + 40);
        id v11 = [v10 _sessionForLogging];
        id v12 = [*(id *)(a1 + 40) _requestForLogging];
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 56);
        *(_DWORD *)buf = 138413570;
        id v19 = v9;
        __int16 v20 = 2048;
        id v21 = v10;
        __int16 v22 = 2048;
        id v23 = v11;
        __int16 v24 = 2048;
        id v25 = v12;
        __int16 v26 = 2048;
        uint64_t v27 = v13;
        __int16 v28 = 2048;
        uint64_t v29 = v14;
        _os_log_impl(&dword_213BFC000, v7, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring -URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend: callback for task %p because it doesn't match our current task, %p", buf, 0x3Eu);
      }
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__CoreDAVTask_URLSession_task_didReceiveChallenge_completionHandler___block_invoke;
  v15[3] = &unk_2641DFF60;
  id v16 = v9;
  uint64_t v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v10;
  id v13 = v11;
  id v14 = v9;
  [(CoreDAVTask *)self _runOnCallbackThread:v15];
}

uint64_t __69__CoreDAVTask_URLSession_task_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3 == v2[7])
  {
    uint64_t v16 = *(void *)(a1 + 48);
    return objc_msgSend(v2, "_handleAuthenticationChallenge:task:completionHandler:", v16);
  }
  else
  {
    char v4 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    id v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

    if (v6)
    {
      id v7 = v6;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        id v10 = *(void **)(a1 + 40);
        id v11 = [v10 _sessionForLogging];
        id v12 = [*(id *)(a1 + 40) _requestForLogging];
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 56);
        int v17 = 138413570;
        id v18 = v9;
        __int16 v19 = 2048;
        __int16 v20 = v10;
        __int16 v21 = 2048;
        __int16 v22 = v11;
        __int16 v23 = 2048;
        __int16 v24 = v12;
        __int16 v25 = 2048;
        uint64_t v26 = v13;
        __int16 v27 = 2048;
        uint64_t v28 = v14;
        _os_log_impl(&dword_213BFC000, v7, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring -URLSession:task:didReceiveChallenge:completionHandler: callback for task %p because it doesn't match our current task, %p", (uint8_t *)&v17, 0x3Eu);
      }
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__CoreDAVTask_URLSession_dataTask_didReceiveData___block_invoke;
  v14[3] = &unk_2641DFF88;
  id v15 = v9;
  uint64_t v16 = self;
  id v17 = v8;
  id v18 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  [(CoreDAVTask *)self _runOnCallbackThread:v14];
}

void __50__CoreDAVTask_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3 == v2[7])
  {
    uint64_t v15 = *(void *)(a1 + 48);
    objc_msgSend(v2, "_session:dataTask:didReceiveData:", v15);
  }
  else
  {
    char v4 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    id v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

    if (v6)
    {
      id v7 = v6;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        id v10 = *(void **)(a1 + 40);
        id v11 = [v10 _sessionForLogging];
        id v12 = [*(id *)(a1 + 40) _requestForLogging];
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 56);
        int v16 = 138413570;
        id v17 = v9;
        __int16 v18 = 2048;
        __int16 v19 = v10;
        __int16 v20 = 2048;
        __int16 v21 = v11;
        __int16 v22 = 2048;
        __int16 v23 = v12;
        __int16 v24 = 2048;
        uint64_t v25 = v13;
        __int16 v26 = 2048;
        uint64_t v27 = v14;
        _os_log_impl(&dword_213BFC000, v7, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring -URLSession:dataTask:didReceiveData: callback for task %p because it doesn't match our current task, %p", (uint8_t *)&v16, 0x3Eu);
      }
    }
  }
}

- (void)_session:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = (NSURLSessionDataTask *)a4;
  v102 = (NSData *)a5;
  fakeResponseData = self->_fakeResponseData;
  if (!fakeResponseData)
  {
LABEL_4:
    self->_didReceiveData = 1;
    uint64_t v13 = +[CoreDAVLogging sharedLogging];
    int v14 = [v13 shouldLogAtLevel:7 forAccountInfoProvider:0];

    v101 = v10;
    if (v14)
    {
      uint64_t v15 = +[CoreDAVLogging sharedLogging];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      id v17 = [v15 logHandleForAccountInfoProvider:WeakRetained];

      if (v17)
      {
        __int16 v18 = v17;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          __int16 v19 = (objc_class *)objc_opt_class();
          __int16 v20 = NSStringFromClass(v19);
          __int16 v21 = [(CoreDAVTask *)self _sessionForLogging];
          __int16 v22 = [(CoreDAVTask *)self _requestForLogging];
          *(_DWORD *)buf = 138413058;
          id v104 = v20;
          __int16 v105 = 2048;
          id v106 = self;
          __int16 v107 = 2048;
          v108 = v21;
          __int16 v109 = 2048;
          v110 = v22;
          _os_log_impl(&dword_213BFC000, v18, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] didReceiveData", buf, 0x2Au);

          id v10 = v101;
        }
      }
      __int16 v23 = (void *)[[NSString alloc] initWithData:v102 encoding:4];
      __int16 v24 = +[CoreDAVLogging sharedLogging];
      id v25 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      __int16 v26 = [v24 logHandleForAccountInfoProvider:v25];

      if (v26)
      {
        uint64_t v27 = v26;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v28 = (objc_class *)objc_opt_class();
          uint64_t v29 = NSStringFromClass(v28);
          uint64_t v30 = [(CoreDAVTask *)self _sessionForLogging];
          id v31 = [(CoreDAVTask *)self _requestForLogging];
          *(_DWORD *)buf = 138413314;
          id v104 = v29;
          __int16 v105 = 2048;
          id v106 = self;
          __int16 v107 = 2048;
          v108 = v30;
          __int16 v109 = 2048;
          v110 = v31;
          __int16 v111 = 2112;
          uint64_t v112 = (uint64_t)v23;
          _os_log_impl(&dword_213BFC000, v27, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] That data is %@", buf, 0x34u);

          id v10 = v101;
        }
      }
    }
    [(CoreDAVTask *)self setTotalBytesReceived:[(CoreDAVTask *)self totalBytesReceived] + [(NSData *)v102 length]];
    unint64_t v32 = [(NSHTTPURLResponse *)self->_response expectedContentLength];
    id v33 = [(CoreDAVTask *)self responseProgressBlock];
    if (v33)
    {
      if (v32 == -1)
      {

        unint64_t v34 = 0;
      }
      else
      {

        unint64_t v34 = v32;
        if ((v32 & 0x8000000000000000) != 0) {
          goto LABEL_21;
        }
      }
      uint64_t v35 = [(CoreDAVTask *)self responseProgressBlock];
      ((void (**)(void, unint64_t, unint64_t, BOOL))v35)[2](v35, [(CoreDAVTask *)self totalBytesReceived], v34, v32 != -1);
    }
    if (v32 == -1)
    {
      __int16 v36 = +[CoreDAVLogging sharedLogging];
      id v45 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      __int16 v38 = [v36 logHandleForAccountInfoProvider:v45];

      if (v38)
      {
        __int16 v38 = v38;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          id v46 = (objc_class *)objc_opt_class();
          __int16 v40 = NSStringFromClass(v46);
          __int16 v41 = [(CoreDAVTask *)self _sessionForLogging];
          __int16 v47 = [(CoreDAVTask *)self _requestForLogging];
          uint64_t v48 = [(NSData *)v102 length];
          unint64_t v49 = [(CoreDAVTask *)self totalBytesReceived];
          *(_DWORD *)buf = 138413570;
          id v104 = v40;
          __int16 v105 = 2048;
          id v106 = self;
          __int16 v107 = 2048;
          v108 = v41;
          __int16 v109 = 2048;
          v110 = v47;
          __int16 v111 = 2048;
          uint64_t v112 = v48;
          id v10 = v101;
          __int16 v113 = 2048;
          unint64_t v114 = v49;
          _os_log_impl(&dword_213BFC000, v38, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] didReceiveData: %lu new bytes, have received a total of %lld, no information on expected total", buf, 0x3Eu);

          goto LABEL_28;
        }
LABEL_29:
      }
LABEL_30:

LABEL_31:
      if (self->_task != v10)
      {
        v96 = [MEMORY[0x263F08690] currentHandler];
        [v96 handleFailureInMethod:a2 object:self file:@"CoreDAVTask.m" lineNumber:1067 description:@"Incoming task should be what we're expecting"];
      }
      if ([(CoreDAVTask *)self shouldLogResponseBody]) {
        [(CoreDAVRequestLogger *)self->_logger logCoreDAVResponseSnippet:v102 withTaskIdentifier:0 isBody:1];
      }
      id v50 = [(NSHTTPURLResponse *)self->_response allHeaderFields];
      id v51 = [v50 valueForKey:@"Content-Type"];

      if ([(CoreDAVTask *)self _shouldHandleStatusCode:[(NSHTTPURLResponse *)self->_response statusCode]])
      {
        BOOL v52 = +[CoreDAVXMLParser canHandleContentType:v51];
      }
      else
      {
        BOOL v52 = 0;
      }
      int v53 = [(CoreDAVTask *)self responseBodyParser];

      if (!v53)
      {
        v54 = [(CoreDAVTask *)self copyDefaultParserForContentType:v51];
        [(CoreDAVTask *)self setResponseBodyParser:v54];
        double v55 = [(CoreDAVTask *)self responseBodyParser];

        if (!v55)
        {
          if (v52) {
            v56 = [[CoreDAVXMLParser alloc] initWithRootElementNameSpace:0 name:0 parseClass:0 baseURL:0];
          }
          else {
            v56 = objc_alloc_init(CoreDAVNullParser);
          }
          id v57 = v56;

          [(CoreDAVTask *)self setResponseBodyParser:v57];
          v54 = v57;
        }
      }
      id v58 = [(CoreDAVTask *)self responseBodyParser];
      char v59 = v58 != 0;

      uint64_t v98 = MEMORY[0x216693F10]();
      unint64_t v60 = [(NSData *)v102 length];
      unint64_t v61 = v60;
      unint64_t v99 = v51;
      BOOL v100 = v52;
      if (v60 > 0x1000 && v58)
      {
        id v97 = v9;
        uint64_t v62 = 0;
        uint64_t v63 = -4096;
        do
        {
          v64 = (void *)MEMORY[0x216693F10]();
          id v65 = objc_alloc(MEMORY[0x263EFF8F8]);
          unint64_t v66 = v102;
          v67 = objc_msgSend(v65, "initWithBytesNoCopy:length:freeWhenDone:", -[NSData bytes](v66, "bytes") + v62, 4096, 0);
          if (AnalyticsIsEventUsed()
            && ![(CoreDAVTask *)self totalBytesWasProcessedAsAbnormallyLarge]
            && [(CoreDAVTask *)self totalBytesReceived] >= 0x40000001)
          {
            AnalyticsSendEventLazy();
            [(CoreDAVTask *)self setTotalBytesWasProcessedAsAbnormallyLarge:1];
          }
          id v68 = [(CoreDAVTask *)self responseBodyParser];
          char v59 = [v68 processData:v67 forTask:self];

          v62 += 4096;
          if (v61 + v63 <= 0x1000) {
            break;
          }
          v63 -= 4096;
        }
        while ((v59 & 1) != 0);
        uint64_t v69 = v61 - v62;
        if (v61 == v62) {
          char v70 = 0;
        }
        else {
          char v70 = v59;
        }
        id v9 = v97;
        v71 = (void *)v98;
        id v10 = v101;
        id v51 = v99;
        if (v70)
        {
          if (v62)
          {
            id v72 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytesNoCopy:length:freeWhenDone:", -[NSData bytes](v66, "bytes") + v62, v69, 0);
            v73 = [(CoreDAVTask *)self responseBodyParser];
            char v59 = [v73 processData:v72 forTask:self];

LABEL_63:
            goto LABEL_65;
          }
LABEL_62:
          id v72 = [(CoreDAVTask *)self responseBodyParser];
          char v59 = [v72 processData:v102 forTask:self];
          goto LABEL_63;
        }
      }
      else
      {
        if (!v60)
        {
          v71 = (void *)v98;
          goto LABEL_65;
        }
        v71 = (void *)v98;
        if (v58) {
          goto LABEL_62;
        }
      }
LABEL_65:
      if (v100
        && ([(CoreDAVTask *)self responseBodyParser],
            v74 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v74,
            (isKindOfClass & 1) != 0))
      {
        if ((v59 & 1) == 0)
        {
          id v76 = +[CoreDAVLogging sharedLogging];
          id v77 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          id v78 = [v76 logHandleForAccountInfoProvider:v77];

          if (v78)
          {
            v79 = v78;
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
            {
              id v80 = (objc_class *)objc_opt_class();
              v81 = NSStringFromClass(v80);
              id v82 = [(CoreDAVTask *)self _sessionForLogging];
              uint64_t v83 = [(CoreDAVTask *)self _requestForLogging];
              id v84 = [(CoreDAVTask *)self responseBodyParser];
              id v85 = [v84 parserError];
              *(_DWORD *)buf = 138413314;
              id v104 = v81;
              __int16 v105 = 2048;
              id v106 = self;
              __int16 v107 = 2048;
              v108 = v82;
              __int16 v109 = 2048;
              v110 = v83;
              __int16 v111 = 2112;
              uint64_t v112 = (uint64_t)v85;
              _os_log_impl(&dword_213BFC000, v79, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Parser failed to parse XML body of response %@", buf, 0x34u);

              id v10 = v101;
            }
          }
LABEL_79:

          id v51 = v99;
        }
      }
      else if ((v59 & 1) == 0)
      {
        id v86 = +[CoreDAVLogging sharedLogging];
        id v87 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        v88 = [v86 logHandleForAccountInfoProvider:v87];

        if (v88)
        {
          uint64_t v89 = v88;
          if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v90 = (objc_class *)objc_opt_class();
            uint64_t v91 = NSStringFromClass(v90);
            uint64_t v92 = [(CoreDAVTask *)self _sessionForLogging];
            uint64_t v93 = [(CoreDAVTask *)self _requestForLogging];
            v94 = [(CoreDAVTask *)self responseBodyParser];
            uint64_t v95 = [v94 parserError];
            *(_DWORD *)buf = 138413314;
            id v104 = v91;
            __int16 v105 = 2048;
            id v106 = self;
            __int16 v107 = 2048;
            v108 = v92;
            __int16 v109 = 2048;
            v110 = v93;
            __int16 v111 = 2112;
            uint64_t v112 = (uint64_t)v95;
            _os_log_impl(&dword_213BFC000, v89, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Parser failed to parse with error %@", buf, 0x34u);

            id v10 = v101;
          }
        }
        id v76 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:3 userInfo:0];
        [(CoreDAVTask *)self finishCoreDAVTaskWithError:v76];
        goto LABEL_79;
      }

      goto LABEL_81;
    }
LABEL_21:
    if ([(NSData *)v102 length] >= v32) {
      goto LABEL_31;
    }
    __int16 v36 = +[CoreDAVLogging sharedLogging];
    id v37 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    __int16 v38 = [v36 logHandleForAccountInfoProvider:v37];

    if (v38)
    {
      __int16 v38 = v38;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        id v39 = (objc_class *)objc_opt_class();
        __int16 v40 = NSStringFromClass(v39);
        __int16 v41 = [(CoreDAVTask *)self _sessionForLogging];
        __int16 v42 = [(CoreDAVTask *)self _requestForLogging];
        uint64_t v43 = [(NSData *)v102 length];
        unint64_t v44 = [(CoreDAVTask *)self totalBytesReceived];
        *(_DWORD *)buf = 138413826;
        id v104 = v40;
        __int16 v105 = 2048;
        id v106 = self;
        __int16 v107 = 2048;
        v108 = v41;
        __int16 v109 = 2048;
        v110 = v42;
        __int16 v111 = 2048;
        uint64_t v112 = v43;
        __int16 v113 = 2048;
        unint64_t v114 = v44;
        __int16 v115 = 2048;
        unint64_t v116 = v32;
        _os_log_impl(&dword_213BFC000, v38, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] didReceiveData: %lu new bytes, now received %lu/%lld total", buf, 0x48u);

        id v10 = v101;
LABEL_28:

        goto LABEL_29;
      }
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  if (!self->_haveParsedFakeResponseData)
  {
    id v12 = fakeResponseData;

    self->_haveParsedFakeResponseData = 1;
    v102 = v12;
    goto LABEL_4;
  }
LABEL_81:
}

id __48__CoreDAVTask__session_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  uint64_t v3 = [*(id *)(a1 + 32) responseHeaders];
  char v4 = [v3 objectForKeyedSubscript:@"Host"];
  [v2 setObject:v4 forKeyedSubscript:@"Host"];

  id v5 = [*(id *)(a1 + 32) url];
  id v6 = [v5 absoluteString];
  [v2 setObject:v6 forKeyedSubscript:@"URL"];

  return v2;
}

- (BOOL)_shouldHandleStatusCode:(int64_t)a3
{
  BOOL v4 = a3 > 499 && a3 != 503;
  return a3 == 403 || v4;
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__CoreDAVTask_URLSession_task_needNewBodyStream___block_invoke;
  v11[3] = &unk_2641DFF10;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  [(CoreDAVTask *)self _runOnCallbackThread:v11];
}

void __49__CoreDAVTask_URLSession_task_needNewBodyStream___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 56);
  BOOL v4 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  id v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

  if (v2 == v3)
  {
    if (v6)
    {
      uint64_t v15 = v6;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = (objc_class *)objc_opt_class();
        id v17 = NSStringFromClass(v16);
        __int16 v18 = *(void **)(a1 + 40);
        __int16 v19 = [v18 _sessionForLogging];
        __int16 v20 = [*(id *)(a1 + 40) _requestForLogging];
        uint64_t v21 = *(void *)(a1 + 40);
        int v23 = 138413314;
        __int16 v24 = v17;
        __int16 v25 = 2048;
        __int16 v26 = v18;
        __int16 v27 = 2048;
        uint64_t v28 = v19;
        __int16 v29 = 2048;
        uint64_t v30 = v20;
        __int16 v31 = 2112;
        uint64_t v32 = v21;
        _os_log_impl(&dword_213BFC000, v15, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Connection needs a new body stream, self %@", (uint8_t *)&v23, 0x34u);
      }
    }

    __int16 v22 = [*(id *)(a1 + 40) requestBodyStream];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v6)
    {
      id v7 = v6;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        id v10 = *(void **)(a1 + 40);
        id v11 = [v10 _sessionForLogging];
        id v12 = [*(id *)(a1 + 40) _requestForLogging];
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 56);
        int v23 = 138413570;
        __int16 v24 = v9;
        __int16 v25 = 2048;
        __int16 v26 = v10;
        __int16 v27 = 2048;
        uint64_t v28 = v11;
        __int16 v29 = 2048;
        uint64_t v30 = v12;
        __int16 v31 = 2048;
        uint64_t v32 = v13;
        __int16 v33 = 2048;
        uint64_t v34 = v14;
        _os_log_impl(&dword_213BFC000, v7, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring -URLSession:task:needNewBodyStream: callback for task %p because it doesn't match our current task, %p", (uint8_t *)&v23, 0x3Eu);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)lastRedirectURL
{
  return (id)[(NSMutableArray *)self->_redirectHistory lastObject];
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __87__CoreDAVTask_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  v22[3] = &unk_2641DFFD8;
  id v23 = v13;
  __int16 v24 = self;
  id v25 = v12;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v17 = v15;
  id v18 = v14;
  id v19 = v12;
  id v20 = v16;
  id v21 = v13;
  [(CoreDAVTask *)self _runOnCallbackThread:v22];
}

uint64_t __87__CoreDAVTask_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v3 == v2[7])
  {
    uint64_t v16 = *(void *)(a1 + 48);
    return objc_msgSend(v2, "_session:task:willPerformHTTPRedirection:newRequest:completionHandler:", v16);
  }
  else
  {
    BOOL v4 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    id v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

    if (v6)
    {
      id v7 = v6;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        id v10 = *(void **)(a1 + 40);
        id v11 = [v10 _sessionForLogging];
        id v12 = [*(id *)(a1 + 40) _requestForLogging];
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 56);
        int v17 = 138413570;
        id v18 = v9;
        __int16 v19 = 2048;
        id v20 = v10;
        __int16 v21 = 2048;
        __int16 v22 = v11;
        __int16 v23 = 2048;
        __int16 v24 = v12;
        __int16 v25 = 2048;
        uint64_t v26 = v13;
        __int16 v27 = 2048;
        uint64_t v28 = v14;
        _os_log_impl(&dword_213BFC000, v7, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring -URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler: callback for task %p because it doesn't match our current task, %p", (uint8_t *)&v17, 0x3Eu);
      }
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

- (void)_session:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  unint64_t v14 = (unint64_t)a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void))a7;
  self->_didSendRequest = 1;
  if (!v14 || [(CoreDAVTask *)self allowAutomaticRedirects])
  {
    id v96 = v13;
    p_request = &self->_request;
    id v18 = [(NSURLRequest *)self->_request URL];
    __int16 v19 = [v18 scheme];
    if ([v19 hasPrefix:@"https"])
    {
      id v20 = [v15 URL];
      [v20 scheme];
      unint64_t v21 = v14;
      id v22 = v15;
      id v23 = v12;
      __int16 v25 = v24 = v16;
      char loga = [v25 hasPrefix:@"https"];

      uint64_t v16 = v24;
      id v12 = v23;
      id v15 = v22;
      unint64_t v14 = v21;
      p_request = &self->_request;

      if ((loga & 1) == 0)
      {
        v16[2](v16, 0);
LABEL_41:
        id v13 = v96;
        goto LABEL_42;
      }
    }
    else
    {
    }
    uint64_t v91 = v16;
    uint64_t v26 = (void *)[v15 mutableCopy];
    __int16 v27 = [v15 URL];
    uint64_t v28 = [v27 host];
    uint64_t v29 = [v28 length];

    if (v29)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      __int16 v31 = [WeakRetained user];
      uint64_t v32 = [v27 CDVURLWithUser:v31];

      uint64_t v33 = [v32 CDVURLWithPassword:0];

      os_log_t log = (os_log_t)v33;
      [v26 setURL:v33];
    }
    else
    {
      uint64_t v43 = +[CoreDAVLogging sharedLogging];
      id v44 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      id v45 = [v43 logHandleForAccountInfoProvider:v44];

      if (v45)
      {
        id v46 = v45;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          __int16 v47 = (objc_class *)objc_opt_class();
          NSStringFromClass(v47);
          uint64_t v89 = logb = v46;
          id v85 = [(CoreDAVTask *)self _sessionForLogging];
          uint64_t v48 = [(CoreDAVTask *)self _requestForLogging];
          [(CoreDAVTask *)self url];
          unint64_t v49 = v87 = v27;
          redirectHistory = self->_redirectHistory;
          *(_DWORD *)buf = 138413826;
          unint64_t v99 = v89;
          __int16 v100 = 2048;
          v101 = self;
          __int16 v102 = 2048;
          int v103 = v85;
          __int16 v104 = 2048;
          uint64_t v105 = (uint64_t)v48;
          __int16 v106 = 2112;
          id v107 = v49;
          __int16 v108 = 2112;
          __int16 v109 = redirectHistory;
          __int16 v110 = 2112;
          id v111 = v87;
          _os_log_impl(&dword_213BFC000, logb, OS_LOG_TYPE_ERROR, "[%@ %p, sess %p, request %p] Received redirect where request.url.host is empty, not setting user on the redirected URL. \nOriginal URL: %@\nRedirect history: %@\nRedirected to:%@  ", buf, 0x48u);

          __int16 v27 = v87;
          id v46 = logb;
        }
      }
      os_log_t log = v27;
    }
    id v51 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    char v52 = objc_opt_respondsToSelector();

    if (v52)
    {
      id v53 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      uint64_t v54 = [v53 shouldHandleHTTPCookiesForURL:log];
    }
    else
    {
      uint64_t v54 = 0;
    }
    [v26 setHTTPShouldHandleCookies:v54];
    uint64_t v55 = [(NSURLRequest *)*p_request HTTPBodyStream];
    __int16 v90 = (void *)v55;
    if (v55)
    {
      [v26 setHTTPBodyStream:v55];
    }
    else
    {
      v56 = [(NSURLRequest *)*p_request HTTPBody];
      [v26 setHTTPBody:v56];
    }
    id v57 = [(NSURLRequest *)*p_request HTTPMethod];
    [v26 setHTTPMethod:v57];

    id v58 = [(NSURLRequest *)*p_request allHTTPHeaderFields];
    [v26 setAllHTTPHeaderFields:v58];

    if (v14)
    {
      v88 = v27;
      char v59 = +[CoreDAVLogging sharedLogging];
      id v60 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      unint64_t v61 = [v59 logHandleForAccountInfoProvider:v60];

      id v86 = v12;
      if (v61)
      {
        uint64_t v62 = v61;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          uint64_t v63 = (objc_class *)objc_opt_class();
          id v84 = NSStringFromClass(v63);
          v64 = [(CoreDAVTask *)self _sessionForLogging];
          uint64_t v65 = [(CoreDAVTask *)self _requestForLogging];
          request = self->_request;
          *(_DWORD *)buf = 138414338;
          unint64_t v99 = v84;
          __int16 v100 = 2048;
          v101 = self;
          __int16 v102 = 2048;
          int v103 = v64;
          __int16 v104 = 2048;
          uint64_t v105 = v65;
          v67 = (void *)v65;
          __int16 v106 = 2112;
          id v107 = v86;
          __int16 v108 = 2112;
          __int16 v109 = request;
          __int16 v110 = 2112;
          id v111 = v15;
          __int16 v112 = 2112;
          unint64_t v113 = (unint64_t)v26;
          __int16 v114 = 2112;
          unint64_t v115 = v14;
          _os_log_impl(&dword_213BFC000, v62, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Connection is getting redirected: [%@]\nInitial request: [%@]\nProposed request: [%@]\nReconstructed request: [%@]\nRedirect response: [%@]", buf, 0x5Cu);
        }
      }

      logger = self->_logger;
      uint64_t v69 = NSString;
      char v70 = [v26 URL];
      v71 = [v69 stringWithFormat:@"REDIRECT: %@\n\n", v70];
      id v72 = [v71 dataUsingEncoding:4];
      [(CoreDAVRequestLogger *)logger logCoreDAVResponseSnippet:v72 withTaskIdentifier:self->_uniqueID];

      if ([(id)v14 statusCode] == 301)
      {
        v73 = self->_redirectHistory;
        if (!v73)
        {
          v74 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
          v75 = self->_redirectHistory;
          self->_redirectHistory = v74;

          v73 = self->_redirectHistory;
        }
        [(NSMutableArray *)v73 addObject:log];
      }
      id v76 = [v15 URL];
      id v77 = [v76 host];
      id v78 = [(NSURLRequest *)*p_request URL];
      v79 = [v78 host];
      char v80 = [v77 isEqualToString:v79];

      id v12 = v86;
      __int16 v27 = v88;
      if ((v80 & 1) == 0) {
        *(_WORD *)&self->_justTriedTokenAuth = 0;
      }
    }
    [(CoreDAVRequestLogger *)self->_logger finishCoreDAVResponse];
    objc_storeStrong((id *)p_request, v26);
    uint64_t v81 = [v15 HTTPBodyStream];
    unint64_t v82 = v14 | v81;

    uint64_t v16 = v91;
    if (!v82)
    {
      uint64_t v83 = [(CoreDAVTask *)self requestBodyStream];
      if (v83) {
        [v26 setHTTPBodyStream:v83];
      }
    }
    ((void (**)(id, void *))v91)[2](v91, v26);

    goto LABEL_41;
  }
  uint64_t v34 = +[CoreDAVLogging sharedLogging];
  id v35 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  __int16 v36 = [v34 logHandleForAccountInfoProvider:v35];

  if (v36)
  {
    id v37 = v36;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      __int16 v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      id v39 = v97 = v13;
      [(CoreDAVTask *)self _sessionForLogging];
      v40 = uint64_t v92 = v16;
      __int16 v41 = [(CoreDAVTask *)self _requestForLogging];
      __int16 v42 = self->_request;
      *(_DWORD *)buf = 138414082;
      unint64_t v99 = v39;
      __int16 v100 = 2048;
      v101 = self;
      __int16 v102 = 2048;
      int v103 = v40;
      __int16 v104 = 2048;
      uint64_t v105 = (uint64_t)v41;
      __int16 v106 = 2112;
      id v107 = v12;
      __int16 v108 = 2112;
      __int16 v109 = v42;
      __int16 v110 = 2112;
      id v111 = v15;
      __int16 v112 = 2112;
      unint64_t v113 = v14;
      _os_log_impl(&dword_213BFC000, v37, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Connection is getting redirected but automatic redirections are disabled.  Connection: [%@]\nInitial request: [%@]\nProposed request: [%@]\nRedirect response: [%@]", buf, 0x52u);

      uint64_t v16 = v92;
      id v13 = v97;
    }
  }
  v16[2](v16, 0);
LABEL_42:
}

- (BOOL)_canAuthenticateAgainstProtectionSpace:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v7 = [v5 logHandleForAccountInfoProvider:WeakRetained];

  if (v7)
  {
    id v8 = v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      id v11 = [(CoreDAVTask *)self _sessionForLogging];
      id v12 = [(CoreDAVTask *)self _requestForLogging];
      *(_DWORD *)buf = 138413058;
      id v35 = v10;
      __int16 v36 = 2048;
      id v37 = self;
      __int16 v38 = 2048;
      id v39 = v11;
      __int16 v40 = 2048;
      __int16 v41 = v12;
      _os_log_impl(&dword_213BFC000, v8, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] _canAuthenticateAgainstProtectionSpace:", buf, 0x2Au);
    }
  }

  id v13 = [v4 authenticationMethod];
  id v14 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    char v17 = [v16 handleAuthenticateAgainstProtectionSpace:v4];
LABEL_9:
    char v18 = v17;

    goto LABEL_14;
  }
  if ([v13 isEqualToString:*MEMORY[0x263EFC598]])
  {
    id v16 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    char v17 = objc_opt_respondsToSelector();
    goto LABEL_9;
  }
  if (([v13 isEqualToString:*MEMORY[0x263EFC5A0]] & 1) != 0
    || ([v13 isEqualToString:*MEMORY[0x263EFC580]] & 1) != 0)
  {
    char v18 = 1;
  }
  else
  {
    char v18 = [v13 isEqualToString:*MEMORY[0x263EFC588]];
  }
LABEL_14:
  __int16 v19 = +[CoreDAVLogging sharedLogging];
  id v20 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  unint64_t v21 = [v19 logHandleForAccountInfoProvider:v20];

  if (v21)
  {
    id v22 = v21;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = (objc_class *)objc_opt_class();
      __int16 v24 = NSStringFromClass(v23);
      __int16 v31 = [(CoreDAVTask *)self _sessionForLogging];
      [(CoreDAVTask *)self _requestForLogging];
      __int16 v25 = v33 = v18;
      id v26 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      __int16 v27 = (objc_class *)objc_opt_class();
      uint64_t v28 = NSStringFromClass(v27);
      [NSNumber numberWithBool:v33 & 1];
      uint64_t v29 = v32 = v4;
      *(_DWORD *)buf = 138413826;
      id v35 = v24;
      __int16 v36 = 2048;
      id v37 = self;
      __int16 v38 = 2048;
      id v39 = v31;
      __int16 v40 = 2048;
      __int16 v41 = v25;
      __int16 v42 = 2114;
      uint64_t v43 = v28;
      __int16 v44 = 2114;
      id v45 = v13;
      __int16 v46 = 2114;
      __int16 v47 = v29;
      _os_log_impl(&dword_213BFC000, v22, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] _accountInfoProvider: (%{public}@) Can authenticate against protection space %{public}@? %{public}@", buf, 0x48u);

      id v4 = v32;
      char v18 = v33;
    }
  }

  return v18 & 1;
}

- (void)_didReceiveAuthenticationChallenge:(id)a3 forTask:(id)a4 completionHandler:(id)a5
{
  uint64_t v140 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v125 = a4;
  id v9 = a5;
  v123 = [v8 protectionSpace];
  id v126 = [v123 authenticationMethod];
  unint64_t v10 = 0x2641DF000uLL;
  id v11 = +[CoreDAVLogging sharedLogging];
  id v124 = self;
  location = (id *)&self->_accountInfoProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v13 = [v11 logHandleForAccountInfoProvider:WeakRetained];

  if (v13)
  {
    id v14 = v13;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      char v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      [(CoreDAVTask *)self _sessionForLogging];
      char v18 = v17 = v9;
      [(CoreDAVTask *)self _requestForLogging];
      id v20 = v19 = v8;
      *(_DWORD *)buf = 138413570;
      id v129 = v16;
      __int16 v130 = 2048;
      v131 = v124;
      unint64_t v10 = 0x2641DF000uLL;
      __int16 v132 = 2048;
      v133 = v18;
      __int16 v134 = 2048;
      id v135 = v20;
      __int16 v136 = 2114;
      id v137 = v126;
      __int16 v138 = 2048;
      uint64_t v139 = [v19 previousFailureCount];
      _os_log_impl(&dword_213BFC000, v14, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Received authentication challenge for method %{public}@, previous failure count %ld", buf, 0x3Eu);

      id v8 = v19;
      id v9 = v17;
    }
  }

  unint64_t v21 = [v8 failureResponse];
  id v22 = [v21 allHeaderFields];
  uint64_t v23 = [v22 CDVObjectForKeyCaseInsensitive:@"X-ClientToken-Request"];
  if (!v23) {
    goto LABEL_13;
  }
  __int16 v24 = (void *)v23;
  id v25 = objc_loadWeakRetained(location);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  id v26 = v9;
  id v27 = objc_loadWeakRetained(location);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    id v9 = v26;
    goto LABEL_12;
  }
  id v28 = v8;
  id v29 = objc_loadWeakRetained(location);
  uint64_t v30 = [v29 clientToken];
  uint64_t v121 = [v30 length];

  id v8 = v28;
  id v9 = v26;
  if (v121) {
    goto LABEL_14;
  }
  id v31 = objc_loadWeakRetained(location);
  [v31 clientTokenRequestedByServer];

  id v32 = objc_loadWeakRetained(location);
  char v33 = [v32 clientToken];
  uint64_t v34 = [v33 length];

  if (!v34)
  {
LABEL_14:
    if ([v8 previousFailureCount])
    {
      id v37 = +[CoreDAVLogging sharedLogging];
      id v38 = objc_loadWeakRetained(location);
      id v39 = [v37 logHandleForAccountInfoProvider:v38];

      if (!v39)
      {
LABEL_20:

        __int16 v36 = v126;
LABEL_21:

LABEL_22:
        id v45 = [*(id *)(v10 + 2264) sharedLogging];
        id v46 = objc_loadWeakRetained(location);
        __int16 v47 = [v45 logHandleForAccountInfoProvider:v46];

        if (v47)
        {
          uint64_t v48 = v47;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            unint64_t v49 = (objc_class *)objc_opt_class();
            id v50 = NSStringFromClass(v49);
            id v51 = [(CoreDAVTask *)v124 _sessionForLogging];
            char v52 = [(CoreDAVTask *)v124 _requestForLogging];
            *(_DWORD *)buf = 138413058;
            id v129 = v50;
            __int16 v130 = 2048;
            v131 = v124;
            __int16 v132 = 2048;
            v133 = v51;
            __int16 v134 = 2048;
            id v135 = v52;
            _os_log_impl(&dword_213BFC000, v48, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] continuing without credential for challenge", buf, 0x2Au);
          }
        }

        (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
LABEL_27:
        id v35 = v123;
        goto LABEL_28;
      }
      __int16 v40 = v39;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        __int16 v41 = (objc_class *)objc_opt_class();
        __int16 v42 = NSStringFromClass(v41);
        uint64_t v43 = [(CoreDAVTask *)v124 _sessionForLogging];
        __int16 v44 = [(CoreDAVTask *)v124 _requestForLogging];
        *(_DWORD *)buf = 138413315;
        id v129 = v42;
        __int16 v130 = 2048;
        v131 = v124;
        __int16 v132 = 2048;
        v133 = v43;
        __int16 v134 = 2048;
        id v135 = v44;
        __int16 v136 = 2113;
        id v137 = v8;
        _os_log_impl(&dword_213BFC000, v40, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] ignoring challenge %{private}@ because it's already failed", buf, 0x34u);
      }
      id v39 = v40;
LABEL_19:

      goto LABEL_20;
    }
    id v53 = v9;
    uint64_t v54 = [v125 currentRequest];
    id v37 = [v54 URL];

    uint64_t v55 = [v37 scheme];
    int v56 = [v55 isEqualToString:@"http"];
    id v57 = (uint64_t *)MEMORY[0x263EFC580];
    if (v56)
    {
      uint64_t v58 = *MEMORY[0x263EFC580];
      __int16 v36 = v126;
      int v59 = [v126 isEqualToString:*MEMORY[0x263EFC580]];

      if (v59)
      {
        id v60 = +[CoreDAVLogging sharedLogging];
        id v61 = objc_loadWeakRetained(location);
        uint64_t v62 = [v60 logHandleForAccountInfoProvider:v61];

        id v9 = v53;
        if (!v62)
        {
          unint64_t v10 = 0x2641DF000uLL;
          goto LABEL_61;
        }
        uint64_t v62 = v62;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          uint64_t v63 = (objc_class *)objc_opt_class();
          v64 = NSStringFromClass(v63);
          uint64_t v65 = [(CoreDAVTask *)v124 _sessionForLogging];
          unint64_t v66 = [(CoreDAVTask *)v124 _requestForLogging];
          *(_DWORD *)buf = 138413314;
          id v129 = v64;
          __int16 v130 = 2048;
          v131 = v124;
          __int16 v132 = 2048;
          v133 = v65;
          __int16 v134 = 2048;
          id v135 = v66;
          __int16 v136 = 2112;
          id v137 = v37;
          _os_log_impl(&dword_213BFC000, v62, OS_LOG_TYPE_ERROR, "[%@ %p, sess %p, request %p] Cancelling authentication challenge for insecure connection using basic authentication for URL %@", buf, 0x34u);
        }
        unint64_t v10 = 0x2641DF000;
LABEL_35:

LABEL_61:
        v94 = [*(id *)(v10 + 2264) sharedLogging];
        id v95 = objc_loadWeakRetained(location);
        id v96 = [v94 logHandleForAccountInfoProvider:v95];

        __int16 v36 = v126;
        if (v96)
        {
          id v97 = v96;
          if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
          {
            uint64_t v98 = (objc_class *)objc_opt_class();
            unint64_t v99 = NSStringFromClass(v98);
            __int16 v100 = [(CoreDAVTask *)v124 _sessionForLogging];
            v101 = [(CoreDAVTask *)v124 _requestForLogging];
            *(_DWORD *)buf = 138413058;
            id v129 = v99;
            __int16 v130 = 2048;
            v131 = v124;
            __int16 v132 = 2048;
            v133 = v100;
            __int16 v134 = 2048;
            id v135 = v101;
            _os_log_impl(&dword_213BFC000, v97, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Cancelling auth challenge", buf, 0x2Au);
          }
        }

        (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 2, 0);
        goto LABEL_27;
      }
    }
    else
    {

      uint64_t v58 = *v57;
      __int16 v36 = v126;
    }
    if (([v36 isEqualToString:v58] & 1) != 0
      || [v36 isEqualToString:*MEMORY[0x263EFC588]])
    {
      if (![(CoreDAVTask *)v124 _shouldCreateCredentialForBasicOrDigestAuthChallenge:v8])
      {
        uint64_t v83 = [v8 proposedCredential];
        id v84 = [v83 password];
        uint64_t v85 = [v84 length];

        id v9 = v53;
        if (v85)
        {
          unint64_t v10 = 0x2641DF000;
          goto LABEL_21;
        }
        id v39 = +[CoreDAVLogging sharedLogging];
        id v88 = objc_loadWeakRetained(location);
        __int16 v40 = [v39 logHandleForAccountInfoProvider:v88];

        if (v40)
        {
          uint64_t v89 = v40;
          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          {
            __int16 v90 = (objc_class *)objc_opt_class();
            uint64_t v91 = NSStringFromClass(v90);
            id v120 = [(CoreDAVTask *)v124 _sessionForLogging];
            uint64_t v92 = [(CoreDAVTask *)v124 _requestForLogging];
            id v122 = objc_loadWeakRetained(location);
            uint64_t v93 = [v122 accountID];
            *(_DWORD *)buf = 138413314;
            id v129 = v91;
            __int16 v130 = 2048;
            v131 = v124;
            __int16 v132 = 2048;
            v133 = v120;
            __int16 v134 = 2048;
            id v135 = v92;
            __int16 v136 = 2114;
            id v137 = v93;
            _os_log_impl(&dword_213BFC000, v89, OS_LOG_TYPE_ERROR, "[%@ %p, sess %p, request %p] Got a credential challenge, but we don't have any credentials. This request will likely fail. accountID = %{public}@", buf, 0x34u);

            id v9 = v53;
          }
        }
        unint64_t v10 = 0x2641DF000;
        goto LABEL_19;
      }
      v67 = (void *)MEMORY[0x263EFC610];
      id v68 = objc_loadWeakRetained(location);
      uint64_t v69 = [v68 user];
      char v70 = [v69 CDVStringByRemovingPercentEscapesForHREF];
      id v71 = v8;
      id v72 = objc_loadWeakRetained(location);
      v73 = [v72 password];
      v74 = [v67 credentialWithUser:v70 password:v73 persistence:1];

      __int16 v36 = v126;
      id v8 = v71;

      id v9 = v53;
    }
    else
    {
      id v9 = v53;
      if (![v36 isEqualToString:*MEMORY[0x263EFC598]]
        || (id v86 = objc_loadWeakRetained(location), v87 = objc_opt_respondsToSelector(),
                                                   v86,
                                                   (v87 & 1) == 0))
      {
        unint64_t v10 = 0x2641DF000uLL;
        if (![v36 isEqualToString:*MEMORY[0x263EFC568]])
        {
          id v102 = objc_loadWeakRetained(location);
          char v103 = objc_opt_respondsToSelector();

          if (v103)
          {
            id v104 = objc_loadWeakRetained(location);
            int v105 = [v104 handleTrustChallenge:v8 completionHandler:v9];

            if (v105)
            {
              __int16 v106 = CDVRunLoopModesToPerformDelayedSelectorsIn();
              [(CoreDAVTask *)v124 performSelector:sel_performCoreDAVTask withObject:0 afterDelay:v106 inModes:0.0];
            }
            id v107 = +[CoreDAVLogging sharedLogging];
            id v108 = objc_loadWeakRetained(location);
            __int16 v109 = [v107 logHandleForAccountInfoProvider:v108];

            if (v109)
            {
              __int16 v110 = v109;
              if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
              {
                id v111 = (objc_class *)objc_opt_class();
                __int16 v112 = NSStringFromClass(v111);
                unint64_t v113 = [(CoreDAVTask *)v124 _sessionForLogging];
                __int16 v114 = [(CoreDAVTask *)v124 _requestForLogging];
                *(_DWORD *)buf = 138413058;
                id v129 = v112;
                __int16 v130 = 2048;
                v131 = v124;
                __int16 v132 = 2048;
                v133 = v113;
                __int16 v134 = 2048;
                id v135 = v114;
                _os_log_impl(&dword_213BFC000, v110, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Waiting for runloop callback to decide what to do", buf, 0x2Au);
              }
            }

            goto LABEL_27;
          }
          id v60 = +[CoreDAVLogging sharedLogging];
          id v115 = objc_loadWeakRetained(location);
          uint64_t v62 = [v60 logHandleForAccountInfoProvider:v115];

          if (!v62) {
            goto LABEL_61;
          }
          uint64_t v62 = v62;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            uint64_t v116 = (objc_class *)objc_opt_class();
            uint64_t v117 = NSStringFromClass(v116);
            id v118 = [(CoreDAVTask *)v124 _sessionForLogging];
            v119 = [(CoreDAVTask *)v124 _requestForLogging];
            *(_DWORD *)buf = 138413058;
            id v129 = v117;
            __int16 v130 = 2048;
            v131 = v124;
            unint64_t v10 = 0x2641DF000;
            __int16 v132 = 2048;
            v133 = v118;
            __int16 v134 = 2048;
            id v135 = v119;
            _os_log_impl(&dword_213BFC000, v62, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] AccountInfoProvider doesn't know how to handle a trust challenge, so we're just going to have to cancel.", buf, 0x2Au);
          }
          goto LABEL_35;
        }
        v74 = [(CoreDAVTask *)v124 credentialForClientCertificateChallenge:v8];
LABEL_42:

        if (v74)
        {
          v75 = +[CoreDAVLogging sharedLogging];
          id v76 = objc_loadWeakRetained(location);
          id v77 = [v75 logHandleForAccountInfoProvider:v76];

          if (v77)
          {
            id v78 = v77;
            if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
            {
              v79 = (objc_class *)objc_opt_class();
              char v80 = NSStringFromClass(v79);
              uint64_t v81 = [(CoreDAVTask *)v124 _sessionForLogging];
              unint64_t v82 = [(CoreDAVTask *)v124 _requestForLogging];
              *(_DWORD *)buf = 138413315;
              id v129 = v80;
              __int16 v130 = 2048;
              v131 = v124;
              __int16 v132 = 2048;
              v133 = v81;
              __int16 v134 = 2048;
              id v135 = v82;
              __int16 v136 = 2113;
              id v137 = v74;
              _os_log_impl(&dword_213BFC000, v78, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Using credential %{private}@ for challenge", buf, 0x34u);
            }
            __int16 v36 = v126;
          }

          (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v74);
          goto LABEL_27;
        }
        goto LABEL_22;
      }
      v74 = [(CoreDAVTask *)v124 credentialForOAuthChallenge:v8];
    }
    unint64_t v10 = 0x2641DF000uLL;
    goto LABEL_42;
  }
  v124->_shouldRetryWithClientToken = 1;
  (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 2, 0);
  id v35 = v123;
  __int16 v36 = v126;
LABEL_28:
}

- (BOOL)_shouldCreateCredentialForBasicOrDigestAuthChallenge:(id)a3
{
  id v4 = a3;
  p_accountInfoProvider = &self->_accountInfoProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v7 = [WeakRetained password];
  if ([v7 length])
  {
    id v8 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    id v9 = [v8 user];
    uint64_t v10 = [v9 length];

    if (!v10)
    {
      LOBYTE(v15) = 0;
      goto LABEL_7;
    }
    id v11 = [v4 proposedCredential];
    int v12 = [v11 hasPassword];

    id WeakRetained = [v4 proposedCredential];
    id v7 = [WeakRetained password];
    id v13 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    id v14 = [v13 password];
    int v15 = v12 & [v7 isEqualToString:v14] ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

LABEL_7:
  return v15;
}

- (void)_handleAuthenticationChallenge:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = [v8 protectionSpace];
  int v12 = [v11 authenticationMethod];
  id v13 = +[CoreDAVLogging sharedLogging];
  p_accountInfoProvider = &self->_accountInfoProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v16 = [v13 logHandleForAccountInfoProvider:WeakRetained];

  if (v16)
  {
    id v17 = v16;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      char v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      uint64_t v89 = v10;
      __int16 v19 = v94 = v9;
      [(CoreDAVTask *)self _sessionForLogging];
      v21 = id v20 = v12;
      [(CoreDAVTask *)self _requestForLogging];
      id v22 = v11;
      v24 = id v23 = v8;
      *(_DWORD *)buf = 138413314;
      uint64_t v98 = v19;
      __int16 v99 = 2048;
      __int16 v100 = self;
      __int16 v101 = 2048;
      id v102 = v21;
      __int16 v103 = 2048;
      uint64_t v104 = (uint64_t)v24;
      __int16 v105 = 2114;
      __int16 v106 = v20;
      _os_log_impl(&dword_213BFC000, v17, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] _handleAuthenticationChallenge:task:completionHandler: for auth mechanism %{public}@", buf, 0x34u);

      id v8 = v23;
      id v11 = v22;
      p_accountInfoProvider = &self->_accountInfoProvider;

      int v12 = v20;
      id v9 = v94;
      uint64_t v10 = v89;
    }
  }
  if (![(__CFString *)v12 isEqualToString:*MEMORY[0x263EFC5A8]])
  {
    self->_justTriedTokenAuth = 0;
    if ([(CoreDAVTask *)self _canAuthenticateAgainstProtectionSpace:v11])
    {
      [(CoreDAVTask *)self _didReceiveAuthenticationChallenge:v8 forTask:v9 completionHandler:v10];
      goto LABEL_22;
    }
    if (([(__CFString *)v12 isEqualToString:*MEMORY[0x263EFC5A0]] & 1) != 0
      || [(__CFString *)v12 isEqualToString:*MEMORY[0x263EFC568]])
    {
      v10[2](v10, 1, 0);
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  uint64_t v93 = v12;
  id v25 = +[CoreDAVLogging sharedLogging];
  id v26 = objc_loadWeakRetained((id *)p_accountInfoProvider);
  id v27 = [v25 logHandleForAccountInfoProvider:v26];

  if (v27)
  {
    id v28 = v27;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v29 = (objc_class *)objc_opt_class();
      uint64_t v30 = NSStringFromClass(v29);
      [(CoreDAVTask *)self _sessionForLogging];
      __int16 v90 = v10;
      id v31 = v95 = v9;
      [(CoreDAVTask *)self _requestForLogging];
      id v32 = p_accountInfoProvider;
      char v33 = v11;
      v35 = id v34 = v8;
      *(_DWORD *)buf = 138413058;
      uint64_t v98 = v30;
      __int16 v99 = 2048;
      __int16 v100 = self;
      __int16 v101 = 2048;
      id v102 = v31;
      __int16 v103 = 2048;
      uint64_t v104 = (uint64_t)v35;
      _os_log_impl(&dword_213BFC000, v28, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] MobileMeAuth requested", buf, 0x2Au);

      id v8 = v34;
      id v11 = v33;
      p_accountInfoProvider = v32;

      id v9 = v95;
      uint64_t v10 = v90;
    }
  }

  if (self->_everTriedTokenAuth)
  {
    __int16 v36 = +[CoreDAVLogging sharedLogging];
    id v37 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    id v38 = [v36 logHandleForAccountInfoProvider:v37];

    int v12 = v93;
    if (v38)
    {
      id v39 = v38;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        __int16 v40 = (objc_class *)objc_opt_class();
        __int16 v41 = NSStringFromClass(v40);
        [(CoreDAVTask *)self _sessionForLogging];
        uint64_t v91 = v10;
        v43 = id v42 = v9;
        [(CoreDAVTask *)self _requestForLogging];
        __int16 v44 = v11;
        v46 = id v45 = v8;
        *(_DWORD *)buf = 138413058;
        uint64_t v98 = v41;
        __int16 v99 = 2048;
        __int16 v100 = self;
        __int16 v101 = 2048;
        id v102 = v43;
        __int16 v103 = 2048;
        uint64_t v104 = (uint64_t)v46;
        _os_log_impl(&dword_213BFC000, v39, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Rejecting token auth because we've already tried it.", buf, 0x2Au);

        id v8 = v45;
        id v11 = v44;

        id v9 = v42;
        uint64_t v10 = v91;

        int v12 = v93;
      }
    }
LABEL_16:
    v10[2](v10, 3, 0);
    goto LABEL_22;
  }
  id v88 = v8;
  uint64_t v92 = v11;
  id v96 = v9;
  *(_WORD *)&self->_justTriedTokenAuth = 257;
  id v47 = objc_loadWeakRetained((id *)p_accountInfoProvider);
  uint64_t v48 = [v47 user];
  uint64_t v49 = [v48 length];

  if (v49)
  {
    id v50 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    id v51 = [v50 user];

    id v52 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    id v53 = [v52 password];

    uint64_t v54 = [v92 realm];
    uint64_t v55 = +[CoreDAVLogging sharedLogging];
    id v56 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    id v57 = [v55 logHandleForAccountInfoProvider:v56];

    id v9 = v96;
    id v86 = v53;
    char v87 = (void *)v54;
    if (v57)
    {
      uint64_t v58 = v51;
      int v59 = v57;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        id v60 = (objc_class *)objc_opt_class();
        id v61 = NSStringFromClass(v60);
        uint64_t v62 = [(CoreDAVTask *)self _sessionForLogging];
        uint64_t v63 = [(CoreDAVTask *)self _requestForLogging];
        *(_DWORD *)buf = 138413058;
        uint64_t v98 = v61;
        __int16 v99 = 2048;
        __int16 v100 = self;
        __int16 v101 = 2048;
        id v102 = v62;
        __int16 v103 = 2048;
        uint64_t v104 = (uint64_t)v63;
        _os_log_impl(&dword_213BFC000, v59, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Creating mme token", buf, 0x2Au);

        id v9 = v96;
      }

      id v51 = v58;
      id v53 = v86;
    }

    XMobileMeAuthToken = (const void *)_CFURLCredentialCreateXMobileMeAuthToken();
    uint64_t v65 = (void *)[objc_alloc(MEMORY[0x263EFC610]) _initWithCFURLCredential:XMobileMeAuthToken];
    CFRelease(XMobileMeAuthToken);
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v65);
    unint64_t v66 = +[CoreDAVLogging sharedLogging];
    id v67 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    id v68 = [v66 logHandleForAccountInfoProvider:v67];

    id v8 = v88;
    int v12 = v93;
    if (v68)
    {
      uint64_t v85 = v51;
      uint64_t v69 = v68;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        char v70 = (objc_class *)objc_opt_class();
        id v71 = NSStringFromClass(v70);
        id v72 = [(CoreDAVTask *)self _sessionForLogging];
        uint64_t v73 = [(CoreDAVTask *)self _requestForLogging];
        v74 = (void *)v73;
        *(_DWORD *)buf = 138413314;
        v75 = @"Valid";
        uint64_t v98 = v71;
        if (!v65) {
          v75 = @"InValid";
        }
        __int16 v99 = 2048;
        __int16 v100 = self;
        __int16 v101 = 2048;
        id v102 = v72;
        __int16 v103 = 2048;
        uint64_t v104 = v73;
        __int16 v105 = 2114;
        __int16 v106 = v75;
        _os_log_impl(&dword_213BFC000, v69, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Responded to authChallenge with a %{public}@ mme token", buf, 0x34u);

        id v9 = v96;
        int v12 = v93;
      }
      id v51 = v85;
      id v53 = v86;
    }

    id v11 = v92;
  }
  else
  {
    id v76 = +[CoreDAVLogging sharedLogging];
    id v77 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    id v78 = [v76 logHandleForAccountInfoProvider:v77];

    id v8 = v88;
    id v9 = v96;
    if (v78)
    {
      v79 = v78;
      if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
      {
        char v80 = (objc_class *)objc_opt_class();
        uint64_t v81 = NSStringFromClass(v80);
        unint64_t v82 = [(CoreDAVTask *)self _sessionForLogging];
        uint64_t v83 = [(CoreDAVTask *)self _requestForLogging];
        *(_DWORD *)buf = 138413058;
        uint64_t v98 = v81;
        __int16 v99 = 2048;
        __int16 v100 = self;
        __int16 v101 = 2048;
        id v102 = v82;
        __int16 v103 = 2048;
        uint64_t v104 = (uint64_t)v83;
        _os_log_impl(&dword_213BFC000, v79, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Using existing token because no user was provided.", buf, 0x2Au);

        id v8 = v88;
        id v9 = v96;
      }
    }

    id v84 = [v8 proposedCredential];
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v84);

    int v12 = v93;
  }
LABEL_22:
}

- (void)handleWebLoginRequestWithCompletionBlock:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = [(CoreDAVTask *)self responseHeaders];
  id v6 = [v5 CDVObjectForKeyCaseInsensitive:@"X-Web-Login-Required"];

  if ([v6 length])
  {
    id v7 = CDVExtractValuesFromRedirectString(v6);
    id v8 = [v7 objectForKey:@"kCDVRedirectReasonKey"];
    id v9 = [v7 objectForKey:@"kCDVRedirectURLKey"];
    if (v9)
    {
      uint64_t v10 = [(NSURLRequest *)self->_request URL];
      int v11 = [v9 CDVIsSafeRedirectForRequestURL:v10];

      if (v11)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        [WeakRetained webLoginRequestedAtURL:v9 reasonString:v8 inQueue:MEMORY[0x263EF83A0] completionBlock:v4];

LABEL_16:
        goto LABEL_17;
      }
      id v13 = +[CoreDAVLogging sharedLogging];
      id v16 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      id v17 = [v13 logHandleForAccountInfoProvider:v16];

      if (v17)
      {
        char v18 = v17;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          __int16 v24 = [v9 scheme];
          id v23 = [v9 host];
          id v22 = [(NSURLRequest *)self->_request URL];
          unint64_t v21 = [v22 scheme];
          __int16 v19 = [(NSURLRequest *)self->_request URL];
          [v19 host];
          *(_DWORD *)buf = 138413058;
          id v26 = v24;
          __int16 v27 = 2112;
          id v28 = v23;
          __int16 v29 = 2112;
          uint64_t v30 = v21;
          v32 = __int16 v31 = 2112;
          id v20 = (void *)v32;
          _os_log_impl(&dword_213BFC000, v18, OS_LOG_TYPE_ERROR, "Web login URL (%@://%@) does not match our current host URL (%@://%@). Ignoring request.", buf, 0x2Au);
        }
      }
    }
    else
    {
      id v13 = +[CoreDAVLogging sharedLogging];
      id v14 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      int v15 = [v13 logHandleForAccountInfoProvider:v14];

      if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v6;
        _os_log_impl(&dword_213BFC000, v15, OS_LOG_TYPE_ERROR, "Couldn't parse a valid URL from \"%@\". Failing this task.", buf, 0xCu);
      }
    }
    v4[2](v4, 3);
    goto LABEL_16;
  }
  v4[2](v4, 3);
LABEL_17:
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__CoreDAVTask_URLSession_task_didCompleteWithError___block_invoke;
  v11[3] = &unk_2641DFCB0;
  id v12 = v7;
  id v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  [(CoreDAVTask *)self _runOnCallbackThread:v11];
}

void __52__CoreDAVTask_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v3 == v2[7])
  {
    if (*(void *)(a1 + 48))
    {
      objc_msgSend(v2, "_task:didFailWithError:");
    }
    else
    {
      objc_msgSend(v2, "_taskFinishedLoading:");
    }
  }
  else
  {
    id v4 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    id v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

    if (v6)
    {
      id v7 = v6;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        id v10 = *(void **)(a1 + 40);
        int v11 = [v10 _sessionForLogging];
        id v12 = [*(id *)(a1 + 40) _requestForLogging];
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 56);
        int v15 = 138413570;
        id v16 = v9;
        __int16 v17 = 2048;
        char v18 = v10;
        __int16 v19 = 2048;
        id v20 = v11;
        __int16 v21 = 2048;
        id v22 = v12;
        __int16 v23 = 2048;
        uint64_t v24 = v13;
        __int16 v25 = 2048;
        uint64_t v26 = v14;
        _os_log_impl(&dword_213BFC000, v7, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring -URLSession:task:didCompleteWithError: callback for task %p because it doesn't match our current task, %p", (uint8_t *)&v15, 0x3Eu);
      }
    }
  }
}

- (void)_taskFinishedLoading:(id)a3
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v5 = (NSURLSessionDataTask *)a3;
  id v6 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v8 = [v6 logHandleForAccountInfoProvider:WeakRetained];

  if (v8)
  {
    id v9 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = (objc_class *)objc_opt_class();
      int v11 = NSStringFromClass(v10);
      id v12 = [(CoreDAVTask *)self _sessionForLogging];
      [(CoreDAVTask *)self _requestForLogging];
      v14 = uint64_t v13 = (CoreDAVTask *)v5;
      int v96 = 138413314;
      id v97 = v11;
      __int16 v98 = 2048;
      __int16 v99 = self;
      __int16 v100 = 2048;
      __int16 v101 = v12;
      __int16 v102 = 2048;
      __int16 v103 = v14;
      __int16 v104 = 2112;
      __int16 v105 = v13;
      _os_log_impl(&dword_213BFC000, v9, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] Connection did finish loading %@", (uint8_t *)&v96, 0x34u);

      id v5 = (NSURLSessionDataTask *)v13;
    }
  }
  self->_didFinishLoading = 1;
  [(CoreDAVRequestLogger *)self->_logger finishCoreDAVResponse];
  [(CoreDAVTask *)self _sendTimeSpentInNetworkingToProvider];
  int v15 = [(CoreDAVTask *)self responseHeaders];
  uint64_t v16 = [v15 CDVObjectForKeyCaseInsensitive:@"X-ClientToken-Request"];
  if (v16)
  {
    __int16 v17 = (void *)v16;
    id v18 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    char v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) == 0) {
      goto LABEL_9;
    }
    int v15 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    [v15 clientTokenRequestedByServer];
  }

LABEL_9:
  if (self->_task != v5)
  {
    id v95 = [MEMORY[0x263F08690] currentHandler];
    [v95 handleFailureInMethod:a2 object:self file:@"CoreDAVTask.m" lineNumber:1485 description:@"Incoming connection should be what we're expecting"];
  }
  id v20 = +[CoreDAVLogging sharedLogging];
  id v21 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v22 = [v20 logHandleForAccountInfoProvider:v21];

  if (v22)
  {
    __int16 v23 = v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = (objc_class *)objc_opt_class();
      __int16 v25 = NSStringFromClass(v24);
      uint64_t v26 = [(CoreDAVTask *)self _sessionForLogging];
      uint64_t v27 = [(CoreDAVTask *)self _requestForLogging];
      int v96 = 138413058;
      id v97 = v25;
      __int16 v98 = 2048;
      __int16 v99 = self;
      __int16 v100 = 2048;
      __int16 v101 = v26;
      __int16 v102 = 2048;
      __int16 v103 = v27;
      _os_log_impl(&dword_213BFC000, v23, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] connection finished loading", (uint8_t *)&v96, 0x2Au);
    }
  }

  id v28 = [(CoreDAVTask *)self responseBodyParser];
  [v28 processData:0 forTask:self];

  response = self->_response;
  if (response)
  {
    [(CoreDAVTask *)self setResponseStatusCode:[(NSHTTPURLResponse *)response statusCode]];
    if ([(CoreDAVTask *)self responseStatusCode] < 200
      || [(CoreDAVTask *)self responseStatusCode] >= 300)
    {
      uint64_t v30 = +[CoreDAVLogging sharedLogging];
      id v31 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      uint64_t v32 = [v30 logHandleForAccountInfoProvider:v31];

      if (v32)
      {
        uint64_t v33 = v32;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          id v34 = (objc_class *)objc_opt_class();
          id v35 = NSStringFromClass(v34);
          __int16 v36 = [(CoreDAVTask *)self _sessionForLogging];
          id v37 = [(CoreDAVTask *)self _requestForLogging];
          int64_t v38 = [(CoreDAVTask *)self responseStatusCode];
          int v96 = 138413314;
          id v97 = v35;
          __int16 v98 = 2048;
          __int16 v99 = self;
          __int16 v100 = 2048;
          __int16 v101 = v36;
          __int16 v102 = 2048;
          __int16 v103 = v37;
          __int16 v104 = 2048;
          __int16 v105 = (CoreDAVTask *)v38;
          _os_log_impl(&dword_213BFC000, v33, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Received a successful finish, but had http status of %ld", (uint8_t *)&v96, 0x34u);
        }
      }

      if ([(CoreDAVTask *)self responseStatusCode] == 401)
      {
        id v39 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        if (objc_opt_respondsToSelector())
        {
          id v40 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          int v41 = [v40 shouldRetryUnauthorizedTask:v5];

          if (v41)
          {
            id v42 = +[CoreDAVLogging sharedLogging];
            id v43 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
            __int16 v44 = [v42 logHandleForAccountInfoProvider:v43];

            if (v44)
            {
              id v45 = v44;
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                id v46 = (objc_class *)objc_opt_class();
                id v47 = NSStringFromClass(v46);
                uint64_t v48 = [(CoreDAVTask *)self _sessionForLogging];
                uint64_t v49 = [(CoreDAVTask *)self _requestForLogging];
                int v96 = 138413314;
                id v97 = v47;
                __int16 v98 = 2048;
                __int16 v99 = self;
                __int16 v100 = 2048;
                __int16 v101 = v48;
                __int16 v102 = 2048;
                __int16 v103 = v49;
                __int16 v104 = 1024;
                LODWORD(v105) = 401;
                _os_log_impl(&dword_213BFC000, v45, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Received %d; retrying task because [_accountInfoProvider shouldRetryUnaut"
                  "horizedConnection] returned YES.",
                  (uint8_t *)&v96,
                  0x30u);
              }
            }

            goto LABEL_50;
          }
        }
        else
        {
        }
      }
      if ([(CoreDAVTask *)self responseStatusCode] != 501 || !self->_requestIsCompressed)
      {
        id v82 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v83 = [(NSHTTPURLResponse *)self->_response allHeaderFields];

        if (v83)
        {
          id v84 = [(NSHTTPURLResponse *)self->_response allHeaderFields];
          [v82 setObject:v84 forKey:@"CoreDAVHTTPHeaders"];
        }
        uint64_t v85 = objc_msgSend(objc_alloc(MEMORY[0x263F087E8]), "initWithDomain:code:userInfo:", @"CoreDAVHTTPStatusErrorDomain", -[CoreDAVTask responseStatusCode](self, "responseStatusCode"), v82);
        if ([(CoreDAVTask *)self responseStatusCode] == 401
          && [(CoreDAVTask *)self _handleUnauthorizedAccessError:v85])
        {
          id v86 = +[CoreDAVLogging sharedLogging];
          id v87 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
          id v88 = [v86 logHandleForAccountInfoProvider:v87];

          if (v88)
          {
            uint64_t v89 = v88;
            if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
            {
              __int16 v90 = (objc_class *)objc_opt_class();
              uint64_t v91 = NSStringFromClass(v90);
              uint64_t v92 = [(CoreDAVTask *)self _sessionForLogging];
              [(CoreDAVTask *)self _requestForLogging];
              v94 = uint64_t v93 = v5;
              int v96 = 138413058;
              id v97 = v91;
              __int16 v98 = 2048;
              __int16 v99 = self;
              __int16 v100 = 2048;
              __int16 v101 = v92;
              __int16 v102 = 2048;
              __int16 v103 = v94;
              _os_log_impl(&dword_213BFC000, v89, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Received a HTTP 401 - unauthorized error And we handled it. Finishing task.", (uint8_t *)&v96, 0x2Au);

              id v5 = v93;
            }
          }
        }
        else
        {
          [(CoreDAVTask *)self finishCoreDAVTaskWithError:v85];
        }

        goto LABEL_62;
      }
      v74 = +[CoreDAVLogging sharedLogging];
      id v75 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      id v76 = [v74 logHandleForAccountInfoProvider:v75];

      if (v76)
      {
        id v77 = v76;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          id v78 = (objc_class *)objc_opt_class();
          v79 = NSStringFromClass(v78);
          char v80 = [(CoreDAVTask *)self _sessionForLogging];
          uint64_t v81 = [(CoreDAVTask *)self _requestForLogging];
          int v96 = 138413058;
          id v97 = v79;
          __int16 v98 = 2048;
          __int16 v99 = self;
          __int16 v100 = 2048;
          __int16 v101 = v80;
          __int16 v102 = 2048;
          __int16 v103 = v81;
          _os_log_impl(&dword_213BFC000, v77, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] The server rejected our compressed request. Attempting an uncompressed request before giving up.", (uint8_t *)&v96, 0x2Au);
        }
      }

      self->_compressedRequestFailed = 1;
LABEL_50:
      CDVRunLoopModesToPerformDelayedSelectorsIn();
      id v82 = (id)objc_claimAutoreleasedReturnValue();
      [(CoreDAVTask *)self performSelector:sel_performCoreDAVTask withObject:0 afterDelay:v82 inModes:0.0];
LABEL_62:

      goto LABEL_63;
    }
    id v60 = [(CoreDAVTask *)self responseBodyParser];
    id v61 = [v60 parserError];

    if (!v61)
    {
      [(CoreDAVTask *)self finishCoreDAVTaskWithError:0];
      goto LABEL_63;
    }
    uint64_t v62 = +[CoreDAVLogging sharedLogging];
    id v63 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    v64 = [v62 logHandleForAccountInfoProvider:v63];

    if (v64)
    {
      uint64_t v65 = v64;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        unint64_t v66 = (objc_class *)objc_opt_class();
        id v67 = NSStringFromClass(v66);
        id v68 = [(CoreDAVTask *)self _sessionForLogging];
        uint64_t v69 = [(CoreDAVTask *)self _requestForLogging];
        char v70 = [(CoreDAVTask *)self responseBodyParser];
        [v70 parserError];
        id v71 = v5;
        id v72 = (CoreDAVTask *)objc_claimAutoreleasedReturnValue();
        int v96 = 138413314;
        id v97 = v67;
        __int16 v98 = 2048;
        __int16 v99 = self;
        __int16 v100 = 2048;
        __int16 v101 = v68;
        __int16 v102 = 2048;
        __int16 v103 = v69;
        __int16 v104 = 2112;
        __int16 v105 = v72;
        _os_log_impl(&dword_213BFC000, v65, OS_LOG_TYPE_ERROR, "[%@ %p, sess %p, request %p] Parser failed to parse with error %@", (uint8_t *)&v96, 0x34u);

        id v5 = v71;
      }
    }
    uint64_t v58 = (void *)MEMORY[0x263F087E8];
    uint64_t v59 = 3;
  }
  else
  {
    id v50 = +[CoreDAVLogging sharedLogging];
    id v51 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    id v52 = [v50 logHandleForAccountInfoProvider:v51];

    if (v52)
    {
      id v53 = v52;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        uint64_t v54 = (objc_class *)objc_opt_class();
        uint64_t v55 = NSStringFromClass(v54);
        id v56 = [(CoreDAVTask *)self _sessionForLogging];
        id v57 = [(CoreDAVTask *)self _requestForLogging];
        int v96 = 138413570;
        id v97 = v55;
        __int16 v98 = 2048;
        __int16 v99 = self;
        __int16 v100 = 2048;
        __int16 v101 = v56;
        __int16 v102 = 2048;
        __int16 v103 = v57;
        __int16 v104 = 2112;
        __int16 v105 = self;
        __int16 v106 = 2112;
        uint64_t v107 = v5;
        _os_log_impl(&dword_213BFC000, v53, OS_LOG_TYPE_ERROR, "[%@ %p, sess %p, request %p] Received a didFinishLoading without receiving a response from the server.  Treating the following task as an unknown error: %@ %@", (uint8_t *)&v96, 0x3Eu);
      }
    }

    uint64_t v58 = (void *)MEMORY[0x263F087E8];
    uint64_t v59 = 6;
  }
  uint64_t v73 = [v58 errorWithDomain:@"CoreDAVErrorDomain" code:v59 userInfo:0];
  [(CoreDAVTask *)self finishCoreDAVTaskWithError:v73];

LABEL_63:
}

- (BOOL)_handleUnauthorizedAccessError:(id)a3
{
  id v3 = a3;
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v89 = a3;
  id v5 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v7 = [v5 logHandleForAccountInfoProvider:WeakRetained];

  if (v7)
  {
    id v8 = v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v11 = id v10 = v3;
      id v12 = [(CoreDAVTask *)self _sessionForLogging];
      uint64_t v13 = [(CoreDAVTask *)self _requestForLogging];
      *(_DWORD *)buf = 138413570;
      uint64_t v91 = v11;
      __int16 v92 = 2048;
      uint64_t v93 = self;
      __int16 v94 = 2048;
      id v95 = v12;
      __int16 v96 = 2048;
      id v97 = v13;
      __int16 v98 = 2112;
      id v99 = v89;
      __int16 v100 = 2112;
      __int16 v101 = self;
      _os_log_impl(&dword_213BFC000, v8, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Figuring out if we should handle unauthorized access error %@ Self = %@", buf, 0x3Eu);

      id v3 = v10;
    }
  }
  id v14 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    BOOL triedRenewingCredential = self->_triedRenewingCredential;
    __int16 v17 = +[CoreDAVLogging sharedLogging];
    id v18 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    char v19 = [v17 logHandleForAccountInfoProvider:v18];

    if (triedRenewingCredential)
    {
      if (v19)
      {
        char v19 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = (objc_class *)objc_opt_class();
          id v21 = NSStringFromClass(v20);
          id v22 = [(CoreDAVTask *)self _sessionForLogging];
          __int16 v23 = [(CoreDAVTask *)self _requestForLogging];
          *(_DWORD *)buf = 138413058;
          uint64_t v91 = v21;
          __int16 v92 = 2048;
          uint64_t v93 = self;
          __int16 v94 = 2048;
          id v95 = v22;
          __int16 v96 = 2048;
          id v97 = v23;
          uint64_t v24 = "[%@ %p, sess %p, request %p] Already tried renewing credential";
LABEL_45:
          _os_log_impl(&dword_213BFC000, v19, OS_LOG_TYPE_INFO, v24, buf, 0x2Au);

          goto LABEL_46;
        }
        goto LABEL_46;
      }
      goto LABEL_47;
    }
    if (v19)
    {
      id v57 = v19;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        uint64_t v58 = (objc_class *)objc_opt_class();
        uint64_t v59 = NSStringFromClass(v58);
        id v60 = [(CoreDAVTask *)self _sessionForLogging];
        id v61 = [(CoreDAVTask *)self _requestForLogging];
        *(_DWORD *)buf = 138413058;
        uint64_t v91 = v59;
        __int16 v92 = 2048;
        uint64_t v93 = self;
        __int16 v94 = 2048;
        id v95 = v60;
        __int16 v96 = 2048;
        id v97 = v61;
        _os_log_impl(&dword_213BFC000, v57, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Attempting to renew credential", buf, 0x2Au);
      }
    }

    self->_BOOL triedRenewingCredential = 1;
    id v62 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    int v63 = [v62 renewCredential];

    __int16 v17 = +[CoreDAVLogging sharedLogging];
    id v64 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    char v19 = [v17 logHandleForAccountInfoProvider:v64];

    if (!v63)
    {
      if (v19)
      {
        char v19 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v79 = (objc_class *)objc_opt_class();
          id v21 = NSStringFromClass(v79);
          id v22 = [(CoreDAVTask *)self _sessionForLogging];
          __int16 v23 = [(CoreDAVTask *)self _requestForLogging];
          *(_DWORD *)buf = 138413058;
          uint64_t v91 = v21;
          __int16 v92 = 2048;
          uint64_t v93 = self;
          __int16 v94 = 2048;
          id v95 = v22;
          __int16 v96 = 2048;
          id v97 = v23;
          uint64_t v24 = "[%@ %p, sess %p, request %p] Unable to renew credential";
          goto LABEL_45;
        }
LABEL_46:
      }
LABEL_47:

LABEL_48:
      uint64_t v49 = +[CoreDAVLogging sharedLogging];
      id v80 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      uint64_t v81 = [v49 logHandleForAccountInfoProvider:v80];

      if (v81)
      {
        id v82 = v81;
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v83 = (objc_class *)objc_opt_class();
          id v84 = NSStringFromClass(v83);
          uint64_t v85 = [(CoreDAVTask *)self _sessionForLogging];
          id v86 = [(CoreDAVTask *)self _requestForLogging];
          *(_DWORD *)buf = 138413570;
          uint64_t v91 = v84;
          __int16 v92 = 2048;
          uint64_t v93 = self;
          __int16 v94 = 2048;
          id v95 = v85;
          __int16 v96 = 2048;
          id v97 = v86;
          __int16 v98 = 2112;
          id v99 = v89;
          __int16 v100 = 2112;
          __int16 v101 = self;
          _os_log_impl(&dword_213BFC000, v82, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Unable to handle unauthorized access error %@ Self = %@", buf, 0x3Eu);
        }
      }

      BOOL v70 = 0;
      goto LABEL_53;
    }
    if (v19)
    {
      uint64_t v65 = v19;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        unint64_t v66 = (objc_class *)objc_opt_class();
        id v67 = NSStringFromClass(v66);
        id v68 = [(CoreDAVTask *)self _sessionForLogging];
        uint64_t v69 = [(CoreDAVTask *)self _requestForLogging];
        *(_DWORD *)buf = 138413058;
        uint64_t v91 = v67;
        __int16 v92 = 2048;
        uint64_t v93 = self;
        __int16 v94 = 2048;
        id v95 = v68;
        __int16 v96 = 2048;
        id v97 = v69;
        _os_log_impl(&dword_213BFC000, v65, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Renewed credential.  Retrying task", buf, 0x2Au);
      }
    }

    uint64_t v49 = CDVRunLoopModesToPerformDelayedSelectorsIn();
    [(CoreDAVTask *)self performSelector:sel_performCoreDAVTask withObject:0 afterDelay:v49 inModes:0.0];
LABEL_36:
    BOOL v70 = 1;
    goto LABEL_53;
  }
  __int16 v25 = +[CoreDAVLogging sharedLogging];
  id v26 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  uint64_t v27 = [v25 logHandleForAccountInfoProvider:v26];

  if (v27)
  {
    id v28 = v27;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      __int16 v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      uint64_t v30 = v88 = v3;
      id v31 = [(CoreDAVTask *)self _sessionForLogging];
      uint64_t v32 = [(CoreDAVTask *)self _requestForLogging];
      id v33 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      id v34 = (objc_class *)objc_opt_class();
      id v35 = NSStringFromClass(v34);
      *(_DWORD *)buf = 138413314;
      uint64_t v91 = v30;
      __int16 v92 = 2048;
      uint64_t v93 = self;
      __int16 v94 = 2048;
      id v95 = v31;
      __int16 v96 = 2048;
      id v97 = v32;
      __int16 v98 = 2114;
      id v99 = v35;
      _os_log_impl(&dword_213BFC000, v28, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Received bad password (and %{public}@ doesn't respond to shouldTryRenewingCredential)", buf, 0x34u);

      id v3 = v88;
    }
  }
  id v36 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  char v37 = objc_opt_respondsToSelector();

  if (v37)
  {
    id v38 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    int v39 = [v38 shouldTurnModalOnBadPassword];

    if (!v39) {
      goto LABEL_48;
    }
  }
  id v40 = +[CoreDAVLogging sharedLogging];
  id v41 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v42 = [v40 logHandleForAccountInfoProvider:v41];

  if (v42)
  {
    id v43 = v42;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v44 = (objc_class *)objc_opt_class();
      id v45 = NSStringFromClass(v44);
      id v46 = [(CoreDAVTask *)self _sessionForLogging];
      id v47 = [(CoreDAVTask *)self _requestForLogging];
      *(_DWORD *)buf = 138413058;
      uint64_t v91 = v45;
      __int16 v92 = 2048;
      uint64_t v93 = self;
      __int16 v94 = 2048;
      id v95 = v46;
      __int16 v96 = 2048;
      id v97 = v47;
      _os_log_impl(&dword_213BFC000, v43, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Bad password error received.", buf, 0x2Au);
    }
  }

  if (self->_receivedBadPasswordResponse)
  {
    objc_storeStrong((id *)&self->_passwordNotificationError, v3);
    id v48 = objc_loadWeakRetained((id *)&self->_taskManager);
    [v48 coreDAVTaskRequestModal:self];

    uint64_t v49 = +[CoreDAVLogging sharedLogging];
    id v50 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    id v51 = [v49 logHandleForAccountInfoProvider:v50];

    if (v51)
    {
      id v52 = v51;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        id v53 = (objc_class *)objc_opt_class();
        uint64_t v54 = NSStringFromClass(v53);
        uint64_t v55 = [(CoreDAVTask *)self _sessionForLogging];
        id v56 = [(CoreDAVTask *)self _requestForLogging];
        *(_DWORD *)buf = 138413058;
        uint64_t v91 = v54;
        __int16 v92 = 2048;
        uint64_t v93 = self;
        __int16 v94 = 2048;
        id v95 = v55;
        __int16 v96 = 2048;
        id v97 = v56;
        _os_log_impl(&dword_213BFC000, v52, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Starting Modal to handle Unauthorized Error.", buf, 0x2Au);
      }
    }

    goto LABEL_36;
  }
  id v71 = +[CoreDAVLogging sharedLogging];
  id v72 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  uint64_t v73 = [v71 logHandleForAccountInfoProvider:v72];

  if (v73)
  {
    v74 = v73;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      id v75 = (objc_class *)objc_opt_class();
      id v76 = NSStringFromClass(v75);
      id v77 = [(CoreDAVTask *)self _sessionForLogging];
      id v78 = [(CoreDAVTask *)self _requestForLogging];
      *(_DWORD *)buf = 138413058;
      uint64_t v91 = v76;
      __int16 v92 = 2048;
      uint64_t v93 = self;
      __int16 v94 = 2048;
      id v95 = v77;
      __int16 v96 = 2048;
      id v97 = v78;
      _os_log_impl(&dword_213BFC000, v74, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Received bad password response.  Optimistically trying one more time", buf, 0x2Au);
    }
  }

  BOOL v70 = 1;
  self->_receivedBadPasswordResponse = 1;
  uint64_t v49 = CDVRunLoopModesToPerformDelayedSelectorsIn();
  [(CoreDAVTask *)self performSelector:sel_performCoreDAVTask withObject:0 afterDelay:v49 inModes:0.0];
LABEL_53:

  return v70;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __72__CoreDAVTask_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v18[3] = &unk_2641E0000;
  id v19 = v11;
  id v20 = self;
  id v22 = v12;
  id v23 = v13;
  id v21 = v10;
  id v14 = v12;
  id v15 = v10;
  id v16 = v13;
  id v17 = v11;
  [(CoreDAVTask *)self _runOnCallbackThread:v18];
}

uint64_t __72__CoreDAVTask_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v3 == v2[7])
  {
    uint64_t v16 = *(void *)(a1 + 48);
    return objc_msgSend(v2, "_session:dataTask:didReceiveResponse:completionHandler:", v16);
  }
  else
  {
    id v4 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
    id v6 = [v4 logHandleForAccountInfoProvider:WeakRetained];

    if (v6)
    {
      id v7 = v6;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        id v10 = *(void **)(a1 + 40);
        id v11 = [v10 _sessionForLogging];
        id v12 = [*(id *)(a1 + 40) _requestForLogging];
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 56);
        int v17 = 138413570;
        id v18 = v9;
        __int16 v19 = 2048;
        id v20 = v10;
        __int16 v21 = 2048;
        id v22 = v11;
        __int16 v23 = 2048;
        uint64_t v24 = v12;
        __int16 v25 = 2048;
        uint64_t v26 = v13;
        __int16 v27 = 2048;
        uint64_t v28 = v14;
        _os_log_impl(&dword_213BFC000, v7, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Ignoring -URLSession:dataTask:didReceiveResponse:completionHandler: callback for task %p because it doesn't match our current task, %p", (uint8_t *)&v17, 0x3Eu);
      }
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)_session:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, uint64_t))a6;
  char v65 = 0;
  id v12 = [(CoreDAVTask *)self accountInfoProvider];
  char v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0
    && ([(CoreDAVTask *)self accountInfoProvider],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        [v14 getAppleIDSession],
        id v15 = objc_claimAutoreleasedReturnValue(),
        v14,
        v15))
  {
    uint64_t v16 = [v9 currentRequest];
    [v15 handleResponse:v10 forRequest:v16 shouldRetry:&v65];

    if (v65)
    {
      int v17 = CDVRunLoopModesToPerformDelayedSelectorsIn();
      [(CoreDAVTask *)self performSelector:sel_performCoreDAVTask withObject:0 afterDelay:v17 inModes:0.0];
      uint64_t v18 = 0;
      goto LABEL_23;
    }
    id v62 = v15;
    int v63 = v11;
  }
  else
  {
    id v62 = 0;
    int v63 = v11;
  }
  self->_didReceiveResponse = 1;
  __int16 v19 = +[CoreDAVLogging sharedLogging];
  p_accountInfoProvider = &self->_accountInfoProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v22 = [v19 logHandleForAccountInfoProvider:WeakRetained];

  id v64 = v10;
  if (v22)
  {
    __int16 v23 = v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = (objc_class *)objc_opt_class();
      __int16 v25 = NSStringFromClass(v24);
      uint64_t v26 = [(CoreDAVTask *)self _sessionForLogging];
      __int16 v27 = [(CoreDAVTask *)self _requestForLogging];
      uint64_t v28 = [v64 statusCode];
      *(_DWORD *)buf = 138413314;
      id v67 = v25;
      __int16 v68 = 2048;
      uint64_t v69 = self;
      __int16 v70 = 2048;
      id v71 = v26;
      __int16 v72 = 2048;
      uint64_t v73 = v27;
      __int16 v74 = 2048;
      id v75 = (__CFString *)v28;
      _os_log_impl(&dword_213BFC000, v23, OS_LOG_TYPE_DEBUG, "[%@ %p, sess %p, request %p] received response with status %ld", buf, 0x34u);
    }
    id v10 = v64;
  }

  objc_storeStrong((id *)&self->_response, a5);
  [(CoreDAVTask *)self setTotalBytesReceived:0];
  [(CoreDAVTask *)self setTotalBytesWasProcessedAsAbnormallyLarge:0];
  logger = self->_logger;
  uint64_t v30 = [v10 allHeaderFields];
  -[CoreDAVRequestLogger logCoreDAVResponseHeaders:andStatusCode:withTaskIdentifier:](logger, "logCoreDAVResponseHeaders:andStatusCode:withTaskIdentifier:", v30, [v10 statusCode], self->_uniqueID);

  id v31 = +[CoreDAVLogging sharedLogging];
  id v32 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v33 = [v31 logHandleForAccountInfoProvider:v32];

  if (v33)
  {
    id v34 = v33;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      id v35 = (objc_class *)objc_opt_class();
      id v36 = NSStringFromClass(v35);
      char v37 = [(CoreDAVTask *)self _sessionForLogging];
      id v38 = [(CoreDAVTask *)self _requestForLogging];
      id v39 = v9;
      uniqueID = self->_uniqueID;
      uint64_t v41 = [v64 statusCode];
      *(_DWORD *)buf = 138413570;
      id v67 = v36;
      __int16 v68 = 2048;
      uint64_t v69 = self;
      __int16 v70 = 2048;
      id v71 = v37;
      __int16 v72 = 2048;
      uint64_t v73 = v38;
      __int16 v74 = 2114;
      id v75 = (__CFString *)uniqueID;
      id v9 = v39;
      id v10 = v64;
      __int16 v76 = 2048;
      uint64_t v77 = v41;
      _os_log_impl(&dword_213BFC000, v34, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Task ID %{public}@ Connection Received Status [%ld]", buf, 0x3Eu);
    }
  }

  id v42 = +[CoreDAVLogging sharedLogging];
  id v43 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  __int16 v44 = [v42 logHandleForAccountInfoProvider:v43];

  if (v44)
  {
    id v45 = v44;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      id v46 = (objc_class *)objc_opt_class();
      id v47 = NSStringFromClass(v46);
      id v48 = [(CoreDAVTask *)self _sessionForLogging];
      uint64_t v49 = [(CoreDAVTask *)self _requestForLogging];
      id v50 = [v10 allHeaderFields];
      id v51 = [v50 objectForKeyedSubscript:@"X-Apple-Jingle-Correlation-Key"];
      *(_DWORD *)buf = 138413570;
      id v67 = v47;
      __int16 v68 = 2048;
      uint64_t v69 = self;
      __int16 v70 = 2048;
      id v71 = v48;
      __int16 v72 = 2048;
      uint64_t v73 = v49;
      __int16 v74 = 2114;
      id v75 = @"X-Apple-Jingle-Correlation-Key";
      __int16 v76 = 2114;
      uint64_t v77 = (uint64_t)v51;
      _os_log_impl(&dword_213BFC000, v45, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Response Header %{public}@ = %{public}@", buf, 0x3Eu);

      id v10 = v64;
      p_accountInfoProvider = &self->_accountInfoProvider;
    }
  }

  int v17 = +[CoreDAVLogging sharedLogging];
  id v52 = objc_loadWeakRetained((id *)p_accountInfoProvider);
  id v53 = [v17 logHandleForAccountInfoProvider:v52];

  if (v53)
  {
    uint64_t v54 = v53;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      uint64_t v55 = (objc_class *)objc_opt_class();
      id v56 = NSStringFromClass(v55);
      id v57 = [(CoreDAVTask *)self _sessionForLogging];
      uint64_t v58 = [(CoreDAVTask *)self _requestForLogging];
      [v10 allHeaderFields];
      v59 = id v61 = v9;
      id v60 = [v59 objectForKeyedSubscript:@"X-Apple-Request-UUID"];
      *(_DWORD *)buf = 138413570;
      id v67 = v56;
      __int16 v68 = 2048;
      uint64_t v69 = self;
      __int16 v70 = 2048;
      id v71 = v57;
      __int16 v72 = 2048;
      uint64_t v73 = v58;
      __int16 v74 = 2114;
      id v75 = @"X-Apple-Request-UUID";
      __int16 v76 = 2114;
      uint64_t v77 = (uint64_t)v60;
      _os_log_impl(&dword_213BFC000, v54, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Response Header %{public}@ = %{public}@", buf, 0x3Eu);

      id v10 = v64;
      id v9 = v61;
    }
  }

  uint64_t v18 = 1;
  id v15 = v62;
  id v11 = v63;
LABEL_23:

  v11[2](v11, v18);
}

- (void)_task:(id)a3 didFailWithError:(id)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v7 = (NSURLSessionDataTask *)a3;
  id v8 = a4;
  self->_didFailWithError = 1;
  id v9 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v11 = [v9 logHandleForAccountInfoProvider:WeakRetained];

  if (v11)
  {
    id v12 = v11;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      char v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      __int16 v68 = a2;
      id v15 = v14 = v7;
      uint64_t v16 = [(CoreDAVTask *)self _sessionForLogging];
      int v17 = [(CoreDAVTask *)self _requestForLogging];
      *(_DWORD *)buf = 138413314;
      __int16 v70 = v15;
      __int16 v71 = 2048;
      __int16 v72 = self;
      __int16 v73 = 2048;
      __int16 v74 = v16;
      __int16 v75 = 2048;
      __int16 v76 = v17;
      __int16 v77 = 2112;
      id v78 = v8;
      _os_log_impl(&dword_213BFC000, v12, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] connection died with error %@", buf, 0x34u);

      id v7 = v14;
      a2 = v68;
    }
  }
  [(CoreDAVTask *)self _sendTimeSpentInNetworkingToProvider];
  if (self->_task != v7)
  {
    id v67 = [MEMORY[0x263F08690] currentHandler];
    [v67 handleFailureInMethod:a2 object:self file:@"CoreDAVTask.m" lineNumber:1642 description:@"Incoming task should be what we're expecting"];
  }
  uint64_t v18 = [(CoreDAVTask *)self responseHeaders];
  uint64_t v19 = [v18 CDVObjectForKeyCaseInsensitive:@"X-ClientToken-Request"];
  if (!v19) {
    goto LABEL_10;
  }
  id v20 = (void *)v19;
  id v21 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    uint64_t v18 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    [v18 clientTokenRequestedByServer];
LABEL_10:
  }
  if (self->_shouldRetryWithClientToken && !self->_didRetryWithClientToken)
  {
    self->_didRetryWithClientToken = 1;
LABEL_36:
    id v47 = CDVRunLoopModesToPerformDelayedSelectorsIn();
    [(CoreDAVTask *)self performSelector:sel_performCoreDAVTask withObject:0 afterDelay:v47 inModes:0.0];

    goto LABEL_37;
  }
  if ([v8 code] == 401)
  {
    id v23 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    if (objc_opt_respondsToSelector())
    {
      id v24 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      int v25 = [v24 shouldRetryUnauthorizedTask:v7];

      if (v25)
      {
        uint64_t v26 = +[CoreDAVLogging sharedLogging];
        id v27 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
        uint64_t v28 = [v26 logHandleForAccountInfoProvider:v27];

        if (v28)
        {
          uint64_t v29 = v28;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v30 = (objc_class *)objc_opt_class();
            id v31 = NSStringFromClass(v30);
            id v32 = [(CoreDAVTask *)self _sessionForLogging];
            id v33 = [(CoreDAVTask *)self _requestForLogging];
            *(_DWORD *)buf = 138413314;
            __int16 v70 = v31;
            __int16 v71 = 2048;
            __int16 v72 = self;
            __int16 v73 = 2048;
            __int16 v74 = v32;
            __int16 v75 = 2048;
            __int16 v76 = v33;
            __int16 v77 = 1024;
            LODWORD(v78) = 401;
            id v34 = "[%@ %p, sess %p, request %p] Received %d; retrying task because [_accountInfoProvider shouldRetryUnaut"
                  "horizedConnection] returned YES.";
            id v35 = v29;
            uint32_t v36 = 48;
LABEL_33:
            _os_log_impl(&dword_213BFC000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);

            goto LABEL_34;
          }
          goto LABEL_34;
        }
        goto LABEL_35;
      }
    }
    else
    {
    }
  }
  if ([v8 code] == 501 && self->_requestIsCompressed)
  {
    char v37 = +[CoreDAVLogging sharedLogging];
    id v38 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    id v39 = [v37 logHandleForAccountInfoProvider:v38];

    if (v39)
    {
      id v40 = v39;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = (objc_class *)objc_opt_class();
        id v42 = NSStringFromClass(v41);
        id v43 = [(CoreDAVTask *)self _sessionForLogging];
        __int16 v44 = [(CoreDAVTask *)self _requestForLogging];
        *(_DWORD *)buf = 138413058;
        __int16 v70 = v42;
        __int16 v71 = 2048;
        __int16 v72 = self;
        __int16 v73 = 2048;
        __int16 v74 = v43;
        __int16 v75 = 2048;
        __int16 v76 = v44;
        _os_log_impl(&dword_213BFC000, v40, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] The server rejected our compressed request. Attempting an uncompressed request before giving up.", buf, 0x2Au);
      }
    }

    self->_compressedRequestFailed = 1;
    goto LABEL_36;
  }
  if ([v8 code] == 401 && self->_justTriedTokenAuth)
  {
    uint64_t v26 = +[CoreDAVLogging sharedLogging];
    id v45 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    uint64_t v28 = [v26 logHandleForAccountInfoProvider:v45];

    if (v28)
    {
      uint64_t v29 = v28;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v46 = (objc_class *)objc_opt_class();
        id v31 = NSStringFromClass(v46);
        id v32 = [(CoreDAVTask *)self _sessionForLogging];
        id v33 = [(CoreDAVTask *)self _requestForLogging];
        *(_DWORD *)buf = 138413058;
        __int16 v70 = v31;
        __int16 v71 = 2048;
        __int16 v72 = self;
        __int16 v73 = 2048;
        __int16 v74 = v32;
        __int16 v75 = 2048;
        __int16 v76 = v33;
        id v34 = "[%@ %p, sess %p, request %p] Tried token auth but got unauthorized response. Trying without token-auth.";
        id v35 = v29;
        uint32_t v36 = 42;
        goto LABEL_33;
      }
LABEL_34:
    }
LABEL_35:

    goto LABEL_36;
  }
  if ([v8 code] == 401)
  {
    id v48 = +[CoreDAVLogging sharedLogging];
    id v49 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    id v50 = [v48 logHandleForAccountInfoProvider:v49];

    if (v50)
    {
      id v51 = v50;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        id v52 = (objc_class *)objc_opt_class();
        id v53 = NSStringFromClass(v52);
        uint64_t v54 = [(CoreDAVTask *)self _sessionForLogging];
        uint64_t v55 = [(CoreDAVTask *)self _requestForLogging];
        *(_DWORD *)buf = 138413058;
        __int16 v70 = v53;
        __int16 v71 = 2048;
        __int16 v72 = self;
        __int16 v73 = 2048;
        __int16 v74 = v54;
        __int16 v75 = 2048;
        __int16 v76 = v55;
        _os_log_impl(&dword_213BFC000, v51, OS_LOG_TYPE_DEFAULT, "[%@ %p, sess %p, request %p] Bad password error received.", buf, 0x2Au);
      }
    }

    [(CoreDAVTask *)self _handleUnauthorizedAccessError:v8];
  }
  else
  {
    id v56 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    char v57 = [v56 handleCertificateError:v8];

    if (v57)
    {
      uint64_t v58 = CDVRunLoopModesToPerformDelayedSelectorsIn();
      [(CoreDAVTask *)self performSelector:sel_performCoreDAVTask withObject:0 afterDelay:v58 inModes:0.0];

      uint64_t v59 = +[CoreDAVLogging sharedLogging];
      id v60 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
      id v61 = [v59 logHandleForAccountInfoProvider:v60];

      if (v61)
      {
        id v62 = v61;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          int v63 = (objc_class *)objc_opt_class();
          id v64 = NSStringFromClass(v63);
          char v65 = [(CoreDAVTask *)self _sessionForLogging];
          unint64_t v66 = [(CoreDAVTask *)self _requestForLogging];
          *(_DWORD *)buf = 138413058;
          __int16 v70 = v64;
          __int16 v71 = 2048;
          __int16 v72 = self;
          __int16 v73 = 2048;
          __int16 v74 = v65;
          __int16 v75 = 2048;
          __int16 v76 = v66;
          _os_log_impl(&dword_213BFC000, v62, OS_LOG_TYPE_INFO, "[%@ %p, sess %p, request %p] Handled client certificate request and re-issued NSURLRequest.", buf, 0x2Au);
        }
      }
    }
    else
    {
      [(CoreDAVTask *)self finishCoreDAVTaskWithError:v8];
    }
  }
LABEL_37:
}

- (NSDictionary)responseHeaders
{
  if (self->_simulated)
  {
    uint64_t v2 = self->_simulatedResponseHeaders;
  }
  else
  {
    uint64_t v2 = [(NSHTTPURLResponse *)self->_response allHeaderFields];
  }
  return (NSDictionary *)v2;
}

- (void)finishEarlyWithError:(id)a3
{
  [(CoreDAVTask *)self finishCoreDAVTaskWithError:a3];
  [(CoreDAVTask *)self setDelegate:0];
}

- (void)submitWithTaskManager:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3)
  {
    -[CoreDAVTask setTaskManager:](self, "setTaskManager:");
    id v8 = [(CoreDAVTask *)self taskManager];
    [v8 submitQueuedCoreDAVTask:self];
  }
  else
  {
    id v4 = +[CoreDAVLogging sharedLogging];
    id v5 = [v4 logHandleForAccountInfoProvider:0];
    id v6 = v5;
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = self;
      _os_log_impl(&dword_213BFC000, v6, OS_LOG_TYPE_ERROR, "Task %@ submitted with no taskManager, returning immediately", buf, 0xCu);
    }

    id v7 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
    [(CoreDAVTask *)self finishEarlyWithError:v7];
  }
}

- (void)reset
{
  if ([(CoreDAVTask *)self isFinished])
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"CoreDAVTask.m", 1716, @"Getting reset, but why was I finished?" object file lineNumber description];
  }
  *(_WORD *)&self->_didReceiveData = 0;
  *(_DWORD *)&self->_didSendRequest = 0;
}

- (int64_t)numDownloadedElements
{
  return self->_numDownloadedElements;
}

- (void)reportStatusWithError:(id)a3
{
  id v4 = a3;
  id v30 = v4;
  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    char v7 = objc_opt_respondsToSelector();

    id v8 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    if (v7)
    {
      int64_t v9 = [(CoreDAVTask *)self numDownloadedElements];
      id v10 = v8;
LABEL_6:
      [v10 noteSuccessfulRequestWithNumDownloadedElements:v9 forTask:self];
LABEL_26:

      goto LABEL_27;
    }
    char v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0) {
      goto LABEL_27;
    }
    id v8 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    int64_t v19 = [(CoreDAVTask *)self numDownloadedElements];
    id v20 = v8;
LABEL_14:
    [v20 noteSuccessfulRequestWithNumDownloadedElements:v19];
    goto LABEL_26;
  }
  id v5 = [v4 domain];
  if ([v5 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"])
  {

    goto LABEL_8;
  }
  uint64_t v11 = [v30 domain];
  int v12 = [v11 isEqualToString:*MEMORY[0x263F08570]];

  if (v12)
  {
LABEL_8:
    uint64_t v13 = [v30 code];
    p_accountInfoProvider = &self->_accountInfoProvider;
    id v15 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    if (v13 == 500) {
      goto LABEL_9;
    }
LABEL_22:
    char v26 = objc_opt_respondsToSelector();

    id v27 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    id v8 = v27;
    if (v26)
    {
      [v27 noteFailedNetworkRequestForTask:self];
    }
    else
    {
      char v28 = objc_opt_respondsToSelector();

      if ((v28 & 1) == 0) {
        goto LABEL_27;
      }
      id v8 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      [v8 noteFailedNetworkRequest];
    }
    goto LABEL_26;
  }
  id v21 = [v30 domain];
  int v22 = [v21 isEqualToString:@"CoreDAVErrorDomain"];

  if (!v22)
  {
    p_accountInfoProvider = &self->_accountInfoProvider;
    id v15 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
    goto LABEL_22;
  }
  uint64_t v23 = [v30 code];
  p_accountInfoProvider = &self->_accountInfoProvider;
  id v15 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  if (v23 != 1)
  {
LABEL_9:
    char v16 = objc_opt_respondsToSelector();

    id v17 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    id v8 = v17;
    if (v16)
    {
      [v17 noteFailedProtocolRequestForTask:self];
    }
    else
    {
      char v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) == 0) {
        goto LABEL_27;
      }
      id v8 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      [v8 noteFailedProtocolRequest];
    }
    goto LABEL_26;
  }
  char v24 = objc_opt_respondsToSelector();

  id v10 = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  id v8 = v10;
  if (v24)
  {
    int64_t v9 = 0;
    goto LABEL_6;
  }
  char v29 = objc_opt_respondsToSelector();

  if (v29)
  {
    id v20 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    id v8 = v20;
    int64_t v19 = 0;
    goto LABEL_14;
  }
LABEL_27:
}

- (id)_sessionForLogging
{
  return self->_session;
}

- (id)_requestForLogging
{
  return self->_request;
}

- (CoreDAVItem)rootElement
{
  if (self->_simulated)
  {
    uint64_t v3 = [(CoreDAVTask *)self simulatedRootElement];
  }
  else
  {
    id v4 = [(CoreDAVTask *)self responseBodyParser];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v6 = [(CoreDAVTask *)self responseBodyParser];
      uint64_t v3 = [v6 rootElement];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return (CoreDAVItem *)v3;
}

- (CoreDAVTaskManager)taskManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_taskManager);
  return (CoreDAVTaskManager *)WeakRetained;
}

- (void)setTaskManager:(id)a3
{
}

- (CoreDAVAccountInfoProvider)accountInfoProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountInfoProvider);
  return (CoreDAVAccountInfoProvider *)WeakRetained;
}

- (void)setAccountInfoProvider:(id)a3
{
}

- (CoreDAVTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CoreDAVTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (int)depth
{
  return self->_depth;
}

- (void)setDepth:(int)a3
{
  self->_depth = a3;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (CoreDAVResponseBodyParser)responseBodyParser
{
  return self->_responseBodyParser;
}

- (void)setResponseBodyParser:(id)a3
{
}

- (int64_t)responseStatusCode
{
  return self->_responseStatusCode;
}

- (void)setResponseStatusCode:(int64_t)a3
{
  self->_responseStatusCode = a3;
}

- (id)requestProgressBlock
{
  return self->_requestProgressBlock;
}

- (void)setRequestProgressBlock:(id)a3
{
}

- (id)responseProgressBlock
{
  return self->_responseProgressBlock;
}

- (void)setResponseProgressBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unint64_t)totalBytesReceived
{
  return self->_totalBytesReceived;
}

- (void)setTotalBytesReceived:(unint64_t)a3
{
  self->_totalBytesReceived = a3;
}

- (BOOL)allowAutomaticRedirects
{
  return self->_allowAutomaticRedirects;
}

- (void)setAllowAutomaticRedirects:(BOOL)a3
{
  self->_allowAutomaticRedirects = a3;
}

- (NSDictionary)requestProperties
{
  return self->_requestProperties;
}

- (void)setRequestProperties:(id)a3
{
}

- (BOOL)ignoresGuardianRestrictions
{
  return self->_ignoresGuardianRestrictions;
}

- (void)setIgnoresGuardianRestrictions:(BOOL)a3
{
  self->_ignoresGuardianRestrictions = a3;
}

- (BOOL)simulated
{
  return self->_simulated;
}

- (void)setSimulated:(BOOL)a3
{
  self->_simulated = a3;
}

- (NSMutableDictionary)simulatedResponseHeaders
{
  return self->_simulatedResponseHeaders;
}

- (void)setSimulatedResponseHeaders:(id)a3
{
}

- (int64_t)simulatedStatusCode
{
  return self->_simulatedStatusCode;
}

- (void)setSimulatedStatusCode:(int64_t)a3
{
  self->_simulatedStatusCode = a3;
}

- (CoreDAVItem)simulatedRootElement
{
  return self->_simulatedRootElement;
}

- (void)setSimulatedRootElement:(id)a3
{
}

- (BOOL)totalBytesWasProcessedAsAbnormallyLarge
{
  return self->_totalBytesWasProcessedAsAbnormallyLarge;
}

- (void)setTotalBytesWasProcessedAsAbnormallyLarge:(BOOL)a3
{
  self->_totalBytesWasProcessedAsAbnormallyLarge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedRootElement, 0);
  objc_storeStrong((id *)&self->_simulatedResponseHeaders, 0);
  objc_storeStrong((id *)&self->_callbackThread, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_fakeResponseData, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_redirectHistory, 0);
  objc_storeStrong((id *)&self->_overriddenHeaders, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_responseProgressBlock, 0);
  objc_storeStrong(&self->_requestProgressBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_responseBodyParser, 0);
  objc_storeStrong((id *)&self->_passwordNotificationError, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_dateConnectionWentOut, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_destroyWeak((id *)&self->_accountInfoProvider);
  objc_destroyWeak((id *)&self->_taskManager);
}

- (void)_compressBodyData:.cold.1()
{
  __assert_rtn("-[CoreDAVTask _compressBodyData:]", "CoreDAVTask.m", 474, "ret != Z_STREAM_ERROR");
}

- (void)_compressBodyData:.cold.2()
{
  __assert_rtn("-[CoreDAVTask _compressBodyData:]", "CoreDAVTask.m", 480, "ret == Z_STREAM_END");
}

- (void)_compressBodyData:.cold.3()
{
  __assert_rtn("-[CoreDAVTask _compressBodyData:]", "CoreDAVTask.m", 478, "strm.avail_in == 0");
}

@end