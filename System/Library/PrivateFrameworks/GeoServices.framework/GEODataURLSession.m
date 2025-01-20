@interface GEODataURLSession
+ (GEODataURLSession)sharedDataURLSession;
+ (id)asynchronousGetURL:(id)a3 kind:(id)a4 auditToken:(id)a5 requestCounterTicket:(id)a6 queue:(id)a7 completionHandler:(id)a8;
- (BOOL)_wifiAssistRetryEnabled;
- (GEODataURLSession)init;
- (GEODataURLSessionList)urlSessions;
- (NSMutableDictionary)sessionTasks;
- (NSOperationQueue)sessionIsolationOperationQueue;
- (NSString)description;
- (OS_dispatch_queue)sessionIsolation;
- (double)_wifiAssistRetryDelay;
- (id)activeSessionIdentifiers;
- (id)asynchronousGetURL:(id)a3 kind:(id)a4 auditToken:(id)a5 requestCounterTicket:(id)a6 queue:(id)a7 completionHandler:(id)a8;
- (id)createNewURLSessionWithRequest:(id)a3;
- (id)downloadTaskWithRequest:(id)a3 priority:(float)a4 delegate:(id)a5 delegateQueue:(id)a6;
- (id)removeTaskForURLSession:(id)a3 task:(id)a4;
- (id)taskForURLSession:(id)a3 task:(id)a4;
- (id)taskWithRequest:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (id)taskWithRequest:(id)a3 priority:(float)a4 delegate:(id)a5 delegateQueue:(id)a6;
- (id)urlSessionForRequest:(id)a3;
- (unsigned)nextSessionIdentifier;
- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)_configureTask:(id)a3 withRequest:(id)a4;
- (void)_considerRetryingDueToAlternateAdvice;
- (void)configureTask:(id)a3 withRequest:(id)a4 delegate:(id)a5 delegateQueue:(id)a6;
- (void)dealloc;
- (void)finishTasksAndInvalidateForegroundSessions:(id)a3;
- (void)pruneInactiveSessions;
- (void)replaceBackingTask:(id)a3 withTask:(id)a4 forURLSession:(id)a5;
- (void)setNextSessionIdentifier:(unsigned int)a3;
- (void)systemCanSleep:(id)a3;
- (void)systemWillSleep:(id)a3;
@end

@implementation GEODataURLSession

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GEODataURLSession *)self urlSessions];
  [v8 URLSession:v7 didBecomeInvalidWithError:v6];
}

- (id)urlSessionForRequest:(id)a3
{
  id v4 = a3;
  v5 = [(GEODataURLSession *)self urlSessions];
  id v6 = [v5 urlSessionForRequest:v4];

  if (!v6)
  {
    id v7 = [(GEODataURLSession *)self urlSessions];
    id v8 = [(GEODataURLSession *)self activeSessionIdentifiers];
    [v7 pruneSessionsNotInIdentifierArray:v8 agressive:0];

    id v6 = [(GEODataURLSession *)self createNewURLSessionWithRequest:v4];
    v9 = [(GEODataURLSession *)self urlSessions];
    [v9 addSession:v6];
  }

  return v6;
}

- (GEODataURLSessionList)urlSessions
{
  return self->_urlSessions;
}

- (id)activeSessionIdentifiers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:10];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(GEODataURLSession *)self sessionTasks];
  v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) sessionIdentifier];
        if (v10)
        {
          v11 = [NSNumber numberWithUnsignedInt:v10];
          [v3 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)createNewURLSessionWithRequest:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 backgroundSessionIdentifier];

  uint64_t v6 = (void *)MEMORY[0x1E4F290F0];
  if (v5)
  {
    uint64_t v7 = [v4 backgroundSessionIdentifier];
    uint64_t v8 = [v6 backgroundSessionConfigurationWithIdentifier:v7];

    [v8 setDiscretionary:1];
    [v8 setSessionSendsLaunchEvents:1];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
    if (+[GEOPlatform isRunningInGeod]
      && GEOConfigGetBOOL(GeoServicesConfig_DisableAPWakeOnIdleConnections, (uint64_t)off_1E9114EB8))
    {
      v9 = GEOGetDataSessionURLLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "Disable AP wake on idle connections", buf, 2u);
      }

      objc_msgSend(v8, "set_disableAPWakeOnIdleConnections:", 1);
    }
    objc_msgSend(v8, "setTimeoutIntervalForResource:", GEOConfigGetDouble(GeoServicesConfig_MaximumRequestDuration, (uint64_t)off_1E9114F38));
  }
  [v8 setURLCache:0];
  [v8 setHTTPCookieStorage:0];
  objc_msgSend(v8, "geo_configureWithRequest:", v4);
  uint64_t v10 = (void *)MEMORY[0x1E4F290E0];
  v11 = [(GEODataURLSession *)self sessionIsolationOperationQueue];
  v12 = [v10 sessionWithConfiguration:v8 delegate:self delegateQueue:v11];

  [(GEODataURLSession *)self setNextSessionIdentifier:[(GEODataURLSession *)self nextSessionIdentifier] + 1];
  uint64_t v13 = [(GEODataURLSession *)self nextSessionIdentifier];
  long long v14 = (void *)MEMORY[0x1E4F1CA48];
  id v15 = v12;
  long long v16 = [v14 array];
  v17 = [v15 configuration];

  if ([v17 _allowsTLSSessionTickets]) {
    [v16 addObject:@"TLS-Session-Tickets"];
  }
  if ([v17 _allowsExpensiveAccess]) {
    [v16 addObject:@"Expensive-Access"];
  }
  if ([v17 _requiresPowerPluggedIn]) {
    [v16 addObject:@"Requires-Power"];
  }
  if ([v17 multipathServiceType])
  {
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"multipath:%llu", objc_msgSend(v17, "multipathServiceType"));
    [v16 addObject:v18];
  }
  v19 = [v17 _sourceApplicationBundleIdentifier];
  if (v19)
  {
    v20 = [@"source:" stringByAppendingString:v19];
    [v16 addObject:v20];
  }
  v21 = [v17 _sourceApplicationAuditTokenData];
  if ([v21 length])
  {
    [v21 getBytes:buf length:2];
    v22 = objc_msgSend(NSString, "stringWithFormat:", @"source:%02x%02x", (char)buf[0], (char)buf[1]);
    [v16 addObject:v22];
  }
  v23 = NSString;
  v24 = [v16 componentsJoinedByString:@" "];
  v25 = [v23 stringWithFormat:@"[%u] %@", v13, v24];

  [v15 setSessionDescription:v25];
  v26 = GEOGetDataSessionURLLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = [v15 sessionDescription];
    *(_DWORD *)buf = 134218242;
    id v30 = v15;
    __int16 v31 = 2112;
    v32 = v27;
    _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_INFO, "Created new underlying session %p %@", buf, 0x16u);
  }

  return v15;
}

- (unsigned)nextSessionIdentifier
{
  return self->_nextSessionIdentifier;
}

- (void)setNextSessionIdentifier:(unsigned int)a3
{
  self->_nextSessionIdentifier = a3;
}

- (NSOperationQueue)sessionIsolationOperationQueue
{
  return self->_sessionIsolationOperationQueue;
}

uint64_t __76__GEODataURLSession_Task__configureTask_withRequest_delegate_delegateQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureTask:*(void *)(a1 + 40) withRequest:*(void *)(a1 + 48)];
}

- (void)_configureTask:(id)a3 withRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v15 = [(GEODataURLSession *)self urlSessionForRequest:v6];
  uint64_t v8 = [v7 createURLSessionTaskWithSession:v15 request:v6];
  [v7 setSessionIdentifier:GEODataURLSessionGetIdentifierFromSession(v15)];
  v9 = NSString;
  uint64_t v10 = [v6 kind];
  unint64_t v11 = [v6 kind];

  v12 = objc_msgSend(v9, "stringWithFormat:", @"%x.%i", v10, HIDWORD(v11));
  [v8 setTaskDescription:v12];

  uint64_t v13 = [[GEODataURLSessionTaskIdentifier alloc] initWithSession:v15 task:v8];
  long long v14 = [(GEODataURLSession *)self sessionTasks];
  [v14 setObject:v7 forKeyedSubscript:v13];
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x18C1203C0]();
  unint64_t v11 = [(GEODataURLSession *)self taskForURLSession:v13 task:v8];
  v12 = v11;
  if (v11) {
    [v11 didFinishDownloadingToURL:v9];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(GEODataURLSession *)self taskForURLSession:v12 task:v8];
  unint64_t v11 = v10;
  if (v10)
  {
    [v10 backingTask:v8 didBecomeDownloadTask:v9];
    [(GEODataURLSession *)self replaceBackingTask:v8 withTask:v9 forURLSession:v12];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x18C1203C0]();
  unint64_t v11 = [(GEODataURLSession *)self removeTaskForURLSession:v13 task:v8];
  id v12 = v11;
  if (v11) {
    [v11 dataURLSession:self taskDidCompleteWithError:v9];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x18C1203C0]();
  unint64_t v11 = [(GEODataURLSession *)self taskForURLSession:v13 task:v8];
  id v12 = v11;
  if (v11) {
    [v11 didReceiveData:v9];
  }
}

- (void)replaceBackingTask:(id)a3 withTask:(id)a4 forURLSession:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  unint64_t v11 = [[GEODataURLSessionTaskIdentifier alloc] initWithSession:v9 task:v10];

  id v12 = [(GEODataURLSession *)self sessionTasks];
  id v13 = [v12 objectForKeyedSubscript:v11];

  if (v13)
  {
    long long v14 = [(GEODataURLSession *)self sessionTasks];
    [v14 setObject:0 forKeyedSubscript:v11];

    id v15 = [[GEODataURLSessionTaskIdentifier alloc] initWithSession:v9 task:v8];
    long long v16 = [(GEODataURLSession *)self sessionTasks];
    [v16 setObject:v13 forKeyedSubscript:v15];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: dataTask != ((void *)0)", v17, 2u);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  long long v14 = (void *)MEMORY[0x18C1203C0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = [v12 valueForHTTPHeaderField:@"Date"];
    if (qword_1EB29FBB8 != -1) {
      dispatch_once(&qword_1EB29FBB8, &__block_literal_global_479);
    }
    GEOGetMonotonicTime();
    double v17 = v16;
    if (v16 >= *(double *)&qword_1EB29FBA8)
    {
      uint64_t v18 = [(id)qword_1EB29FBB0 dateFromString:v15];
      if (v18)
      {
        v29 = v14;
        *(double *)&qword_1EB29FBA8 = v17 + 600.0;
        v19 = [MEMORY[0x1E4F1C9C8] date];
        [v19 timeIntervalSinceDate:v18];
        double v21 = v20;
        [v19 timeIntervalSinceDate:v18];
        if (v21 >= 0.0) {
          double v23 = v22;
        }
        else {
          double v23 = -v22;
        }
        if (checkSystemClockAgainstHTTPResponse_clockLooksFine == v23 < 120.0)
        {
          os_log_type_t v24 = OS_LOG_TYPE_DEBUG;
        }
        else
        {
          if (v23 >= 120.0) {
            os_log_type_t v24 = OS_LOG_TYPE_FAULT;
          }
          else {
            os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
          }
          checkSystemClockAgainstHTTPResponse_clockLooksFine = v23 < 120.0;
        }
        v25 = GEOGetDataSessionURLLog();
        if (os_log_type_enabled(v25, v24))
        {
          v26 = "is NOT";
          if (v23 < 120.0) {
            v26 = "is";
          }
          *(_DWORD *)buf = 136315394;
          __int16 v31 = v26;
          __int16 v32 = 2112;
          id v33 = v15;
          _os_log_impl(&dword_188D96000, v25, v24, "System clock %s in sync with the server (%@)", buf, 0x16u);
        }

        long long v14 = v29;
      }
    }
  }
  v27 = [(GEODataURLSession *)self taskForURLSession:v10 task:v11];
  v28 = v27;
  if (v27) {
    [v27 dataURLSession:self didReceiveResponse:v12 completionHandler:v13];
  }
  else {
    v13[2](v13, 0);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x18C1203C0]();
  id v11 = [(GEODataURLSession *)self taskForURLSession:v13 task:v8];
  id v12 = v11;
  if (v11) {
    [v11 didCollectMetrics:v9];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v13 = a5;
  id v10 = (void (**)(id, void))a6;
  id v11 = [(GEODataURLSession *)self taskForURLSession:a3 task:a4];
  id v12 = v11;
  if (v11) {
    [v11 dataURLSession:self willSendRequestForEstablishedConnection:v13 completionHandler:v10];
  }
  else {
    v10[2](v10, 0);
  }
}

- (id)removeTaskForURLSession:(id)a3 task:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[GEODataURLSessionTaskIdentifier alloc] initWithSession:v7 task:v6];

  id v9 = [(GEODataURLSession *)self sessionTasks];
  id v10 = [v9 objectForKeyedSubscript:v8];

  id v11 = [(GEODataURLSession *)self sessionTasks];
  [v11 setObject:0 forKeyedSubscript:v8];

  return v10;
}

- (id)taskForURLSession:(id)a3 task:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[GEODataURLSessionTaskIdentifier alloc] initWithSession:v7 task:v6];

  id v9 = [(GEODataURLSession *)self sessionTasks];
  id v10 = [v9 objectForKeyedSubscript:v8];

  return v10;
}

- (NSMutableDictionary)sessionTasks
{
  return self->_sessionTasks;
}

- (id)taskWithRequest:(id)a3 priority:(float)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 URL];

  if (v13)
  {
    long long v14 = [GEODataURLSessionTask alloc];
    uint64_t v15 = [v10 kind];
    *(float *)&double v16 = a4;
    id v13 = [(GEODataURLSessionTask *)v14 initWithSession:self delegate:v11 delegateQueue:v12 requestKind:v15 priority:v16];
    [(GEODataURLSession *)self configureTask:v13 withRequest:v10 delegate:v11 delegateQueue:v12];
  }

  return v13;
}

- (void)configureTask:(id)a3 withRequest:(id)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(GEODataURLSession *)self sessionIsolation];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__GEODataURLSession_Task__configureTask_withRequest_delegate_delegateQueue___block_invoke;
  block[3] = &unk_1E53D99F0;
  block[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

- (OS_dispatch_queue)sessionIsolation
{
  return self->_sessionIsolation;
}

- (id)taskWithRequest:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  LODWORD(v5) = *MEMORY[0x1E4F28A00];
  return [(GEODataURLSession *)self taskWithRequest:a3 priority:a4 delegate:a5 delegateQueue:v5];
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void (**)(id, uint64_t, void))a6;
  id v11 = [v9 protectionSpace];
  id v12 = [v11 proxyType];
  if (v12 != (void *)*MEMORY[0x1E4F289F0]) {
    goto LABEL_4;
  }
  dispatch_block_t v13 = [v9 protectionSpace];
  long long v14 = [v13 authenticationMethod];
  id v15 = v14;
  if (v14 != (void *)*MEMORY[0x1E4F28978])
  {

LABEL_4:
    goto LABEL_5;
  }
  id v16 = [v8 configuration];
  int v17 = [v16 _requiresSecureHTTPSProxyConnection];

  if (!v17) {
    goto LABEL_6;
  }
  uint64_t v18 = GEOGetDataSessionURLLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_DEBUG, "Received a secure proxy challenge", v19, 2u);
  }

  id v11 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
  [v11 handleSecureProxyChallenge:v9];
LABEL_5:

LABEL_6:
  v10[2](v10, 1, 0);
}

+ (GEODataURLSession)sharedDataURLSession
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__GEODataURLSession_sharedDataURLSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB29FB98 != -1) {
    dispatch_once(&qword_1EB29FB98, block);
  }
  v2 = (void *)qword_1EB29FBA0;

  return (GEODataURLSession *)v2;
}

- (void)pruneInactiveSessions
{
  id v4 = [(GEODataURLSession *)self urlSessions];
  v3 = [(GEODataURLSession *)self activeSessionIdentifiers];
  [v4 pruneSessionsNotInIdentifierArray:v3 agressive:1];
}

- (void)finishTasksAndInvalidateForegroundSessions:(id)a3
{
  id v4 = a3;
  group = dispatch_group_create();
  double v5 = [(GEODataURLSession *)self urlSessions];
  [v5 finishTasksAndInvalidateSessionsMatching:&__block_literal_global_71 group:group];

  id v6 = [(GEODataURLSession *)self sessionIsolation];
  dispatch_group_notify(group, v6, v4);
}

BOOL __76__GEODataURLSession_URLSession__finishTasksAndInvalidateForegroundSessions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 configuration];
  if ([v3 isDiscretionary])
  {
    BOOL v4 = 0;
LABEL_6:

    goto LABEL_7;
  }
  double v5 = [v2 configuration];
  char v6 = [v5 waitsForConnectivity];

  if ((v6 & 1) == 0)
  {
    v3 = [v2 configuration];
    id v7 = [v3 identifier];
    BOOL v4 = v7 == 0;

    goto LABEL_6;
  }
  BOOL v4 = 0;
LABEL_7:

  return v4;
}

void __41__GEODataURLSession_sharedDataURLSession__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_1EB29FBA0;
  qword_1EB29FBA0 = (uint64_t)v1;
}

- (GEODataURLSession)init
{
  v24.receiver = self;
  v24.super_class = (Class)GEODataURLSession;
  id v2 = [(GEODataURLSession *)&v24 init];
  if (v2)
  {
    v3 = objc_alloc_init(GEODataURLSessionList);
    BOOL v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    uint64_t v5 = geo_dispatch_queue_create_with_workloop_qos();
    char v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    id v7 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v8 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v7;

    [*((id *)v2 + 3) setName:@"GEODataURLSession.sessionIsolation"];
    [*((id *)v2 + 3) setMaxConcurrentOperationCount:1];
    [*((id *)v2 + 3) setUnderlyingQueue:*((void *)v2 + 2)];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v10 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v9;

    objc_initWeak(&location, v2);
    *((_DWORD *)v2 + 13) = -1;
    id v11 = *((void *)v2 + 2);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __25__GEODataURLSession_init__block_invoke;
    handler[3] = &unk_1E53DD2C0;
    objc_copyWeak(&v22, &location);
    notify_register_dispatch("com.apple.symptoms.hasAlternateAdvice", (int *)v2 + 13, v11, handler);
    dispatch_source_t v12 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 2uLL, *((dispatch_queue_t *)v2 + 2));
    dispatch_block_t v13 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v12;

    long long v14 = *((void *)v2 + 5);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __25__GEODataURLSession_init__block_invoke_2;
    v19[3] = &unk_1E53D7B90;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v14, v19);
    dispatch_activate(*((dispatch_object_t *)v2 + 5));
    if (+[GEOPlatform isRunningInGeod]
      && GEOConfigGetBOOL(GeoServicesConfig_CloseOpenNetworkConnectionsOnDeviceSleep, (uint64_t)off_1E9114BF8))
    {
      id v15 = GEOGetDataSessionURLLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_INFO, "Registering for device sleep notifications", v18, 2u);
      }

      id v16 = +[GEOSystemMonitor sharedInstance];
      [v16 addSystemSleepObserver:v2 queue:*((void *)v2 + 2)];
    }
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return (GEODataURLSession *)v2;
}

void __25__GEODataURLSession_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    notify_get_state(a2, &state64);
    if (state64 == 1) {
      [WeakRetained _considerRetryingDueToAlternateAdvice];
    }
  }
}

void __25__GEODataURLSession_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didReceiveMemoryPressureWarning];
}

- (void)dealloc
{
  int symptomsAlternateAdviceToken = self->_symptomsAlternateAdviceToken;
  if (symptomsAlternateAdviceToken != -1) {
    notify_cancel(symptomsAlternateAdviceToken);
  }
  memoryNotificationEventSource = self->_memoryNotificationEventSource;
  if (memoryNotificationEventSource) {
    dispatch_source_cancel(memoryNotificationEventSource);
  }
  v5.receiver = self;
  v5.super_class = (Class)GEODataURLSession;
  [(GEODataURLSession *)&v5 dealloc];
}

- (void)systemCanSleep:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t))a3;
  if ((GEOConfigGetBOOL(GeoServicesConfig_CloseOpenNetworkConnectionsOnDeviceSleep, (uint64_t)off_1E9114BF8) & 1) == 0)
  {
LABEL_9:
    v4[2](v4, 1);
    goto LABEL_10;
  }
  unint64_t v5 = [(GEODataURLSessionList *)self->_urlSessions count];
  char v6 = GEOGetDataSessionURLLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (!v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "System may sleep. No open NSURLSessions, so nothing to do", buf, 2u);
    }

    goto LABEL_9;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "System may sleep. Invalidating open foreground NSURLSessions", buf, 2u);
  }

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  *(void *)buf = 0;
  double v23 = buf;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__42;
  v26 = __Block_byref_object_dispose__42;
  id v27 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  int v17 = __36__GEODataURLSession_systemCanSleep___block_invoke;
  uint64_t v18 = &unk_1E53E2EE8;
  id v20 = v28;
  id v8 = v4;
  v19 = v8;
  double v21 = buf;
  uint64_t v9 = geo_dispatch_timer_create_on_queue();
  id v10 = (void *)*((void *)v23 + 5);
  *((void *)v23 + 5) = v9;

  dispatch_resume(*((dispatch_object_t *)v23 + 5));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__GEODataURLSession_systemCanSleep___block_invoke_16;
  v11[3] = &unk_1E53E2F10;
  dispatch_block_t v13 = buf;
  long long v14 = v28;
  v11[4] = self;
  dispatch_source_t v12 = v8;
  [(GEODataURLSession *)self finishTasksAndInvalidateForegroundSessions:v11];

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v28, 8);
LABEL_10:
}

void __36__GEODataURLSession_systemCanSleep___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[5] + 8);
  if (!*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 1;
    v3 = GEOGetDataSessionURLLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v6 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "Timed out waiting for open foreground NSURLSessions to invalidate. Allowing sleep", v6, 2u);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1[6] + 8) + 40));
  uint64_t v4 = *(void *)(a1[6] + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void __36__GEODataURLSession_systemCanSleep___block_invoke_16(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    unint64_t v5 = GEOGetDataSessionURLLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Finished invalidating open foreground NSURLSessions, but timed out waiting. Sleep was already allowed", buf, 2u);
    }
  }
  else
  {
    double Double = GEOConfigGetDouble(GeoServicesConfig_CloseOpenNetworkConnectionsOnDeviceSleepDelay, (uint64_t)off_1E9114C08);
    BOOL v7 = GEOGetDataSessionURLLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (Double >= 0.000001)
    {
      if (v8)
      {
        *(_DWORD *)buf = 134349056;
        double v14 = Double;
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Finished invalidating open foreground NSURLSessions. Allowing sleep in %{public}.1f seconds", buf, 0xCu);
      }

      dispatch_time_t v9 = dispatch_time(0, (uint64_t)(Double * 1000000000.0));
      id v10 = *(NSObject **)(*(void *)(a1 + 32) + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__GEODataURLSession_systemCanSleep___block_invoke_17;
      block[3] = &unk_1E53DA028;
      id v12 = *(id *)(a1 + 40);
      dispatch_after(v9, v10, block);
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Finished invalidating open foreground NSURLSessions. Allowing sleep", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

uint64_t __36__GEODataURLSession_systemCanSleep___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)systemWillSleep:(id)a3
{
}

- (id)downloadTaskWithRequest:(id)a3 priority:(float)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_block_t v13 = [v10 URL];

  if (v13)
  {
    double v14 = [GEODataURLSessionDownloadTask alloc];
    uint64_t v15 = [v10 kind];
    *(float *)&double v16 = a4;
    dispatch_block_t v13 = [(GEODataURLSessionTask *)v14 initWithSession:self delegate:v11 delegateQueue:v12 requestKind:v15 priority:v16];
    [(GEODataURLSession *)self configureTask:v13 withRequest:v10 delegate:v11 delegateQueue:v12];
  }

  return v13;
}

- (NSString)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" %lu sessions", -[GEODataURLSessionList count](self->_urlSessions, "count"));
  objc_msgSend(v3, "appendFormat:", @" %lu tasks", -[NSMutableDictionary count](self->_sessionTasks, "count"));
  if ([(NSMutableDictionary *)self->_sessionTasks count])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v5 = [(NSMutableDictionary *)self->_sessionTasks allKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) description];
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 appendString:@" {"];
    id v11 = [v4 componentsJoinedByString:@", "];
    [v3 appendString:v11];

    [v3 appendString:@"}"];
  }
  else
  {
    [v3 appendString:@" {}"];
  }

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryNotificationEventSource, 0);
  objc_storeStrong((id *)&self->_sessionTasks, 0);
  objc_storeStrong((id *)&self->_sessionIsolationOperationQueue, 0);
  objc_storeStrong((id *)&self->_sessionIsolation, 0);

  objc_storeStrong((id *)&self->_urlSessions, 0);
}

- (BOOL)_wifiAssistRetryEnabled
{
  return GEOConfigGetBOOL(GeoServicesConfig_SymptomsAlternateAdviceShouldRetry, (uint64_t)off_1E9113C38);
}

- (double)_wifiAssistRetryDelay
{
  return GEOConfigGetDouble(GeoServicesConfig_SymptomsAlternateAdviceRetryDelay, (uint64_t)off_1E9113C48);
}

- (void)_considerRetryingDueToAlternateAdvice
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = GEOGetDataSessionURLLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    long long v13 = self;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "%{public}p Symptoms framework told us it has alternate advice.", buf, 0xCu);
  }

  if ([(GEODataURLSession *)self _wifiAssistRetryEnabled])
  {
    [(GEODataURLSession *)self _wifiAssistRetryDelay];
    double v5 = v4;
    uint64_t v6 = GEOGetDataSessionURLLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      long long v13 = self;
      __int16 v14 = 2048;
      double v15 = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "%p Symptoms framework has informed us of potential connectivity trouble. Will re-issue requests if our request doesn't complete in %f seconds.", buf, 0x16u);
    }

    GEOMachAbsoluteTimeGetCurrent();
    uint64_t v8 = v7;
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    sessionIsolation = self->_sessionIsolation;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__GEODataURLSession_WiFiAssist___considerRetryingDueToAlternateAdvice__block_invoke;
    v11[3] = &unk_1E53D79B0;
    v11[4] = self;
    void v11[5] = v8;
    dispatch_after(v9, sessionIsolation, v11);
  }
}

void __70__GEODataURLSession_WiFiAssist___considerRetryingDueToAlternateAdvice__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) sessionTasks];
  uint64_t v3 = [v2 allKeys];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v31;
    *(void *)&long long v6 = 134218498;
    long long v28 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * v8);
        id v10 = objc_msgSend(*(id *)(a1 + 32), "sessionTasks", v28);
        id v11 = [v10 objectForKeyedSubscript:v9];

        state.opaque[0] = 0;
        state.opaque[1] = 0;
        id v12 = [v11 activity];
        os_activity_scope_enter(v12, &state);

        [v11 setReceivedRNFNotification:1];
        if (v11
          && ([v11 startTime], v13 != 2.22507386e-308)
          && ([v11 startTime], v14 <= *(double *)(a1 + 40)))
        {
          int v15 = [v11 finished] ^ 1;
        }
        else
        {
          int v15 = 0;
        }
        uint64_t v16 = [v11 request];
        BOOL v17 = [v16 multipathServiceType] == 0;

        if (v17)
        {
          if (!v15) {
            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v18 = [v11 response];
          if (!v18) {
            goto LABEL_18;
          }
          int v19 = [v11 mptcpNegotiated];

          if ((v15 & (v19 ^ 1) & 1) == 0) {
            goto LABEL_18;
          }
        }
        id v20 = GEOGetDataSessionURLLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v21 = *(void *)(a1 + 32);
          [v11 startTime];
          double v23 = v22 - *(double *)(a1 + 40);
          *(_DWORD *)buf = v28;
          uint64_t v35 = v21;
          __int16 v36 = 2112;
          v37 = v11;
          __int16 v38 = 2048;
          double v39 = v23;
          _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_DEBUG, "%p restarting task %@ that was originally started %fs ago", buf, 0x20u);
        }

        uint64_t v24 = [*(id *)(a1 + 32) sessionTasks];
        [v24 setObject:0 forKeyedSubscript:v9];

        [v11 _prepareForRestart];
        v25 = *(void **)(a1 + 32);
        v26 = [v11 request];
        [v25 _configureTask:v11 withRequest:v26];

        [v11 start];
LABEL_18:
        os_activity_scope_leave(&state);

        ++v8;
      }
      while (v5 != v8);
      uint64_t v27 = [v4 countByEnumeratingWithState:&v30 objects:v40 count:16];
      uint64_t v5 = v27;
    }
    while (v27);
  }
}

+ (id)asynchronousGetURL:(id)a3 kind:(id)a4 auditToken:(id)a5 requestCounterTicket:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  int v19 = [a1 sharedDataURLSession];
  id v20 = [v19 asynchronousGetURL:v18 kind:a4 auditToken:v17 requestCounterTicket:v16 queue:v15 completionHandler:v14];

  return v20;
}

- (id)asynchronousGetURL:(id)a3 kind:(id)a4 auditToken:(id)a5 requestCounterTicket:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a7;
  uint64_t v34 = v14;
  int v19 = [[GEODataRequest alloc] initWithKind:a4 URL:v14 auditToken:v15 timeoutInterval:0 additionalHTTPHeaders:0 bodyData:0 userAgent:0.0 entityTag:0 cachedData:0 requestCounterTicket:v16 multipathServiceType:0 multipathAlternatePort:0 throttleToken:0 options:2];
  id v20 = [GEODataURLSessionWaiter alloc];
  uint64_t v21 = self;
  double v22 = v19;
  id v23 = v18;
  id v24 = v17;
  v25 = v24;
  v26 = 0;
  if (v20 && v24 && v23 && v21 && v22)
  {
    v35.receiver = v20;
    v35.super_class = (Class)GEODataURLSessionWaiter;
    uint64_t v27 = [(GEODataURLSession *)&v35 init];
    long long v28 = v27;
    if (v27)
    {
      objc_storeStrong((id *)&v27->_urlSessions, self);
      objc_setProperty_nonatomic_copy(v28, v29, v25, 24);
      uint64_t v30 = [(GEODataURLSession *)v21 taskWithRequest:v22 delegate:v28 delegateQueue:v23];
      sessionIsolation = v28->_sessionIsolation;
      v28->_sessionIsolation = (OS_dispatch_queue *)v30;

      objc_storeStrong((id *)&v28->_sessionTasks, v28);
    }
    id v20 = v28;
    v26 = v20;
  }

  if (v26) {
    task = v26->_task;
  }
  else {
    task = 0;
  }
  [(GEODataURLSessionTask *)task start];

  return v26;
}

@end