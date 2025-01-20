@interface GEODataURLSessionTask
- ($C4D369C9F02205611300857CFD58F739)requestKind;
- (BOOL)didValidateEntityTagForData:(id *)a3 entityTag:(id *)a4;
- (BOOL)failedDueToCancel;
- (BOOL)finished;
- (BOOL)mptcpNegotiated;
- (BOOL)protocolBufferHasPreamble;
- (BOOL)receivedRNFNotification;
- (BOOL)validateContentLengthWithError:(id *)a3;
- (BOOL)validateNonEmptyResponseWithError:(id *)a3;
- (BOOL)validateTileResponse:(BOOL)a3 error:(id *)a4;
- (BOOL)validateTransportWithError:(id *)a3;
- (GEOClientMetrics)clientMetrics;
- (GEODataRequest)request;
- (GEODataURLSessionTask)init;
- (GEODataURLSessionTask)initWithSession:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 requestKind:(id)a6 priority:(float)a7;
- (GEODataURLSessionTaskDelegate)delegate;
- (GEORequestCounterTicket)requestCounterTicket;
- (NSData)cachedData;
- (NSData)receivedData;
- (NSError)error;
- (NSHTTPURLResponse)response;
- (NSString)contentLengthString;
- (NSString)entityTag;
- (NSString)remoteAddressAndPort;
- (NSURL)downloadedFileURL;
- (NSURL)originalRequestURL;
- (NSURLRequest)originalURLRequest;
- (NSURLSessionTask)backingTask;
- (NSURLSessionTaskMetrics)urlTaskMetrics;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)sessionIsolation;
- (OS_os_activity)activity;
- (double)elapsedTime;
- (double)loadTime;
- (double)loadTimeIncludingTask:(id)a3;
- (double)startTime;
- (float)priority;
- (id)_createBackingTaskWithRequest:(id)a3 session:(id)a4;
- (id)createURLRequest;
- (id)createURLSessionTaskWithSession:(id)a3 request:(id)a4;
- (id)debugDescription;
- (id)description;
- (int64_t)HTTPStatusCode;
- (unint64_t)contentLength;
- (unint64_t)incomingPayloadSize;
- (unint64_t)outgoingPayloadSize;
- (unint64_t)receivedDataLength;
- (unint64_t)requestedMultipathServiceType;
- (unsigned)sessionIdentifier;
- (void)_prepareForRestart;
- (void)_start;
- (void)backingTask:(id)a3 didBecomeDownloadTask:(id)a4;
- (void)cancel;
- (void)dataURLSession:(id)a3 didReceiveResponse:(id)a4 completionHandler:(id)a5;
- (void)dataURLSession:(id)a3 taskDidCompleteWithError:(id)a4;
- (void)dataURLSession:(id)a3 willSendRequestForEstablishedConnection:(id)a4 completionHandler:(id)a5;
- (void)delegateAsync:(id)a3;
- (void)didCollectMetrics:(id)a3;
- (void)didFinishDownloadingToURL:(id)a3;
- (void)didReceiveData:(id)a3;
- (void)notifyDelegateWithSession:(id)a3;
- (void)setCachedData:(id)a3;
- (void)setError:(id)a3;
- (void)setPriority:(float)a3;
- (void)setReceivedRNFNotification:(BOOL)a3;
- (void)setSessionIdentifier:(unsigned int)a3;
- (void)start;
- (void)updateRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation GEODataURLSessionTask

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (id)createURLSessionTaskWithSession:(id)a3 request:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v19.opaque[0] = 0;
  v19.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v19);
  objc_storeStrong((id *)&self->_request, a4);
  v8 = [(GEODataURLSessionTask *)self createURLRequest];
  v9 = [(GEODataURLSessionTask *)self _createBackingTaskWithRequest:v8 session:v6];
  backingTask = self->_backingTask;
  self->_backingTask = v9;

  *(float *)&double v11 = self->_priority;
  [(NSURLSessionTask *)self->_backingTask setPriority:v11];
  v12 = [v7 cachedData];
  [(GEODataURLSessionTask *)self setCachedData:v12];

  if (self->_backingTaskNeedsResume)
  {
    v13 = [v7 requestCounterTicket];
    [v13 startingRequestWithTask:self->_backingTask];

    [(NSURLSessionTask *)self->_backingTask resume];
  }
  v14 = GEOGetDataSessionURLLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = self->_backingTask;
    double priority = self->_priority;
    *(_DWORD *)buf = 138412802;
    v21 = v15;
    __int16 v22 = 2048;
    double v23 = priority;
    __int16 v24 = 2112;
    v25 = self;
    _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "Created backing task %@ (priority %4.2f) for task %@", buf, 0x20u);
  }

  v17 = self->_backingTask;
  os_activity_scope_leave(&v19);

  return v17;
}

- (id)_createBackingTaskWithRequest:(id)a3 session:(id)a4
{
  return (id)[a4 dataTaskWithRequest:a3];
}

- (void)setSessionIdentifier:(unsigned int)a3
{
  self->_sessionIdentifier = a3;
}

- (void)setCachedData:(id)a3
{
}

uint64_t __51__GEODataURLSessionTask_notifyDelegateWithSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dataURLSession:*(void *)(a1 + 40) didCompleteTask:*(void *)(a1 + 48)];
}

- (void)dataURLSession:(id)a3 taskDidCompleteWithError:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (NSError *)a4;
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v18);
  GEOMachAbsoluteTimeGetCurrent();
  self->_endTime = v8;
  self->_finished = 1;
  if (v7) {
    goto LABEL_8;
  }
  if ([(GEODataURLSessionTask *)self HTTPStatusCode] >= 200
    && [(GEODataURLSessionTask *)self HTTPStatusCode] < 400)
  {
    goto LABEL_12;
  }
  v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = [(GEODataURLSessionTask *)self HTTPStatusCode] == 451 ? -6 : -7;
  double v23 = @"HTTPStatus";
  double v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[GEODataURLSessionTask HTTPStatusCode](self, "HTTPStatusCode"));
  v24[0] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  v13 = [v9 GEOErrorWithCode:v10 userInfo:v12];
  nonBackingTaskError = self->_nonBackingTaskError;
  self->_nonBackingTaskError = v13;

  id v7 = self->_nonBackingTaskError;
  if (v7)
  {
LABEL_8:
    v15 = GEOGetDataSessionURLLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412547;
      v20 = self;
      __int16 v21 = 2113;
      __int16 v22 = v7;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "Task %@ did fail: %{private}@", buf, 0x16u);
    }

    v16 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
    [v16 checkNetworkError:v7 sendingGeoDErrorIfApplicable:-1000];
  }
  else
  {
LABEL_12:
    v16 = GEOGetDataSessionURLLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEBUG, "Task %@ did succeed", buf, 0xCu);
    }
    id v7 = 0;
  }

  v17 = [(GEODataURLSessionTask *)self requestCounterTicket];
  [v17 requestCompleted:v7];

  [(GEODataURLSessionTask *)self notifyDelegateWithSession:v6];
  os_activity_scope_leave(&v18);
}

- (int64_t)HTTPStatusCode
{
  v2 = [(GEODataURLSessionTask *)self response];
  int64_t v3 = [v2 statusCode];

  return v3;
}

- (NSHTTPURLResponse)response
{
  v2 = [(NSURLSessionTask *)self->_backingTask response];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = v2;
  }
  else {
    int64_t v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (GEOClientMetrics)clientMetrics
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(NSURLSessionTaskMetrics *)self->_urlTaskMetrics _geo_clientMetrics];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }
  else {
    v5 = objc_alloc_init(GEOClientMetrics);
  }
  id v6 = v5;

  [(NSDate *)self->_originalStartDate timeIntervalSince1970];
  double v8 = v7;
  v9 = [(GEOClientMetrics *)v6 networkMetrics];
  [v9 setRequestStart:v8];

  uint64_t v10 = 1;
  if (![(GEODataURLSessionTask *)self failedDueToCancel])
  {
    double v11 = [(GEODataURLSessionTask *)self error];

    if (v11) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
  }
  [(GEOClientMetrics *)v6 setResponseSource:v10];
  int64_t v12 = [(NSURLSessionTask *)self->_backingTask countOfBytesSent];
  v13 = [(GEOClientMetrics *)v6 networkMetrics];
  [v13 setRequestDataSize:v12];

  uint64_t v14 = [(NSURLSessionTask *)self->_backingTask _countOfBytesReceivedEncoded];
  v15 = [(GEOClientMetrics *)v6 networkMetrics];
  [v15 setResponseDataSize:v14];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v16 = [(GEOClientMetrics *)v6 networkMetrics];
  v17 = [v16 transactionMetrics];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        __int16 v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        unint64_t v23 = [(GEODataRequest *)self->_request multipathServiceType] - 1;
        if (v23 < 3) {
          uint64_t v24 = (v23 + 1);
        }
        else {
          uint64_t v24 = 0;
        }
        [v22 setMultipathServiceType:v24];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v19);
  }

  BOOL v25 = [(GEODataURLSessionTask *)self receivedRNFNotification];
  uint64_t v26 = [(GEOClientMetrics *)v6 networkMetrics];
  [v26 setRnfTriggered:v25];

  return v6;
}

- (BOOL)failedDueToCancel
{
  v2 = [(GEODataURLSessionTask *)self error];
  int64_t v3 = v2;
  if (v2)
  {
    v4 = [v2 domain];
    if ([v4 isEqualToString:*MEMORY[0x1E4F289A0]]) {
      BOOL v5 = [v3 code] == -999;
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSError)error
{
  nonBackingTaskError = [(NSURLSessionTask *)self->_backingTask error];
  v4 = nonBackingTaskError;
  if (!nonBackingTaskError) {
    nonBackingTaskError = self->_nonBackingTaskError;
  }
  BOOL v5 = nonBackingTaskError;

  return v5;
}

- (BOOL)receivedRNFNotification
{
  return self->_receivedRNFNotification;
}

- (GEORequestCounterTicket)requestCounterTicket
{
  return [(GEODataRequest *)self->_request requestCounterTicket];
}

- (void)cancel
{
  sessionIsolation = self->_sessionIsolation;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__GEODataURLSessionTask_cancel__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(sessionIsolation, block);
}

- (void)_start
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int64_t v3 = self->_voucher;
  voucher_adopt();
  v4 = GEOGetDataSessionURLLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    id v6 = [(GEODataRequest *)self->_request additionalHTTPHeaders];
    double v7 = (void *)[v6 mutableCopy];

    [v7 removeObjectForKey:@"Maps-Auth-Token"];
    [v7 removeObjectForKey:@"Proxy-Authorization"];
    [v7 removeObjectForKey:@"X-Env-Sec-Mat"];
  }
  else
  {
    double v7 = 0;
  }
  backingTask = self->_backingTask;
  uint64_t v9 = [v7 count];
  uint64_t v10 = GEOGetDataSessionURLLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!backingTask)
  {
    if (v9)
    {
      if (v11)
      {
        int v21 = 138412547;
        __int16 v22 = self;
        __int16 v23 = 2113;
        uint64_t v24 = v7;
        v15 = "Will resume task upon creation %@ %{private}@";
        v16 = v10;
        uint32_t v17 = 22;
LABEL_17:
        _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v21, v17);
      }
    }
    else if (v11)
    {
      int v21 = 138412290;
      __int16 v22 = self;
      v15 = "Will resume task upon creation %@";
      v16 = v10;
      uint32_t v17 = 12;
      goto LABEL_17;
    }

    self->_backingTaskNeedsResume = 1;
    goto LABEL_19;
  }
  if (v9)
  {
    if (v11)
    {
      int v21 = 138412547;
      __int16 v22 = self;
      __int16 v23 = 2113;
      uint64_t v24 = v7;
      int64_t v12 = "Starting task %@ %{private}@";
      v13 = v10;
      uint32_t v14 = 22;
LABEL_13:
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v21, v14);
    }
  }
  else if (v11)
  {
    int v21 = 138412290;
    __int16 v22 = self;
    int64_t v12 = "Starting task %@";
    v13 = v10;
    uint32_t v14 = 12;
    goto LABEL_13;
  }

  uint64_t v18 = [(GEODataRequest *)self->_request requestCounterTicket];
  [v18 startingRequestWithTask:self->_backingTask];

  [(NSURLSessionTask *)self->_backingTask resume];
LABEL_19:
  uint64_t v19 = (OS_voucher *)voucher_adopt();
  voucher = self->_voucher;
  self->_voucher = v19;
}

- (void)didFinishDownloadingToURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = a3;
  id v6 = NSTemporaryDirectory();
  double v7 = [v4 fileURLWithPath:v6];
  double v8 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v9 = [v8 UUIDString];
  uint64_t v10 = [v7 URLByAppendingPathComponent:v9];

  BOOL v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = 0;
  LODWORD(v7) = [v11 moveItemAtURL:v5 toURL:v10 error:&v15];

  id v12 = v15;
  if (v7)
  {
    v13 = v10;
    p_super = &self->_downloadedFileURL->super;
    self->_downloadedFileURL = v13;
  }
  else
  {
    p_super = GEOGetDataSessionURLLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v12;
      _os_log_impl(&dword_188D96000, p_super, OS_LOG_TYPE_ERROR, "Failed to move downloaded data to temporary URL: %{public}@", buf, 0xCu);
    }
  }
}

- (void)backingTask:(id)a3 didBecomeDownloadTask:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = (NSURLSessionTask *)a3;
  id v7 = a4;
  if (self->_backingTask == v6)
  {
    double v8 = GEOGetDataSessionURLLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412802;
      uint64_t v10 = self;
      __int16 v11 = 2112;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Task %@'s backing task did change: %@ -> %@", (uint8_t *)&v9, 0x20u);
    }

    objc_storeStrong((id *)&self->_backingTask, a4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    LOWORD(v9) = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: dataTask == _backingTask", (uint8_t *)&v9, 2u);
  }
}

- (void)didReceiveData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v7);
  id v5 = GEOGetDataSessionURLLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v4 length];
    *(_DWORD *)buf = 138412546;
    int v9 = self;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Task %@ received %{bytes}zu", buf, 0x16u);
  }

  [(NSMutableData *)self->_receivedData appendData:v4];
  os_activity_scope_leave(&v7);
}

- (void)didCollectMetrics:(id)a3
{
}

- (void)dataURLSession:(id)a3 didReceiveResponse:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  uint64_t v12 = bodySizeEstimateFromResponse(v11);
  __int16 v13 = [(NSURLSessionTask *)self->_backingTask _incompleteTaskMetrics];
  id v14 = [v13 transactionMetrics];
  uint64_t v15 = [v14 lastObject];
  self->_mptcpNegotiated = [v15 isMultipath];

  v16 = [(GEODataURLSessionTask *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __93__GEODataURLSessionTask_URLSessionTask__dataURLSession_didReceiveResponse_completionHandler___block_invoke;
    v19[3] = &unk_1E53D9950;
    id v20 = v16;
    id v21 = v8;
    __int16 v22 = self;
    uint64_t v25 = v12;
    id v23 = v11;
    id v24 = v10;
    [(GEODataURLSessionTask *)self delegateAsync:v19];
  }
  else
  {
    id v17 = (NSMutableData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:bodySizeEstimateFromResponse(v11)];
    receivedData = self->_receivedData;
    self->_receivedData = v17;

    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }
}

- (void)dataURLSession:(id)a3 willSendRequestForEstablishedConnection:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(GEODataURLSessionTask *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [(GEODataURLSessionTask *)self request];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __114__GEODataURLSessionTask_URLSessionTask__dataURLSession_willSendRequestForEstablishedConnection_completionHandler___block_invoke;
    v13[3] = &unk_1E53E2F88;
    id v14 = v11;
    id v15 = v8;
    v16 = v12;
    id v17 = self;
    id v19 = v10;
    id v18 = v9;
    [(GEODataURLSessionTask *)self delegateAsync:v13];
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v9);
  }
}

- (GEODataURLSessionTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEODataURLSessionTaskDelegate *)WeakRetained;
}

- (id)createURLRequest
{
  v2 = [(GEODataURLSessionTask *)self request];
  int64_t v3 = (void *)[v2 newURLRequest];

  return v3;
}

- (GEODataRequest)request
{
  return self->_request;
}

- (void)notifyDelegateWithSession:(id)a3
{
  id v4 = a3;
  id v5 = [(GEODataURLSessionTask *)self delegate];
  uint64_t v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__GEODataURLSessionTask_notifyDelegateWithSession___block_invoke;
    v7[3] = &unk_1E53D99F0;
    id v8 = v5;
    id v9 = v4;
    id v10 = self;
    [(GEODataURLSessionTask *)self delegateAsync:v7];
  }
}

- (void)delegateAsync:(id)a3
{
  id v4 = a3;
  queue = [(GEODataURLSessionTask *)self delegateQueue];
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)self->_qos, 0, v4);

  dispatch_async(queue, v5);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

void __30__GEODataURLSessionTask_start__block_invoke(uint64_t a1)
{
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 128), &v6);
  *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 136))
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v4 = *(void *)(a1 + 32);
    dispatch_block_t v5 = *(void **)(v4 + 136);
    *(void *)(v4 + 136) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(_DWORD *)(v2 + 120) = *(_DWORD *)(a1 + 48);
  [*(id *)(a1 + 32) _start];
  os_activity_scope_leave(&v6);
}

- (void)start
{
  GEOMachAbsoluteTimeGetCurrent();
  uint64_t v4 = v3;
  qos_class_t v5 = qos_class_self();
  os_activity_scope_state_s v6 = (OS_voucher *)voucher_copy();
  voucher = self->_voucher;
  self->_voucher = v6;

  sessionIsolation = self->_sessionIsolation;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__GEODataURLSessionTask_start__block_invoke;
  block[3] = &unk_1E53E2F38;
  block[4] = self;
  void block[5] = v4;
  qos_class_t v11 = v5;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(sessionIsolation, v9);
}

- (GEODataURLSessionTask)initWithSession:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 requestKind:(id)a6 priority:(float)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v24.receiver = self;
  v24.super_class = (Class)GEODataURLSessionTask;
  id v15 = [(GEODataURLSessionTask *)&v24 init];
  v16 = v15;
  if (v15)
  {
    v15->_double priority = a7;
    uint64_t v17 = [v12 sessionIsolation];
    sessionIsolation = v16->_sessionIsolation;
    v16->_sessionIsolation = (OS_dispatch_queue *)v17;

    objc_storeWeak((id *)&v16->_delegate, v13);
    objc_storeStrong((id *)&v16->_delegateQueue, a5);
    v16->_requestKind = ($7466BF22B2A7275A1F5DB80FF4552E0B)a6;
    *(int64x2_t *)&v16->_startTime = vdupq_n_s64(0x10000000000000uLL);
    os_activity_t v19 = _os_activity_create(&dword_188D96000, "URL Task", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    activity = v16->_activity;
    v16->_activity = (OS_os_activity *)v19;

    v23.opaque[0] = 0;
    v23.opaque[1] = 0;
    os_activity_scope_enter((os_activity_t)v16->_activity, &v23);
    id v21 = GEOGetDataSessionURLLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v16;
      _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_DEBUG, "Created task %@", buf, 0xCu);
    }

    os_activity_scope_leave(&v23);
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedFileURL, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_originalStartDate, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_urlTaskMetrics, 0);
  objc_storeStrong((id *)&self->_receivedData, 0);
  objc_storeStrong((id *)&self->_cachedData, 0);
  objc_storeStrong((id *)&self->_nonBackingTaskError, 0);
  objc_storeStrong((id *)&self->_backingTask, 0);
  objc_storeStrong((id *)&self->_sessionIsolation, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __114__GEODataURLSessionTask_URLSessionTask__dataURLSession_willSendRequestForEstablishedConnection_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __114__GEODataURLSessionTask_URLSessionTask__dataURLSession_willSendRequestForEstablishedConnection_completionHandler___block_invoke_2;
  v8[3] = &unk_1E53E2F60;
  v8[4] = v4;
  id v11 = *(id *)(a1 + 72);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 56);
  id v9 = v6;
  uint64_t v10 = v7;
  [v2 dataURLSession:v3 willSendRequest:v4 forTask:v5 completionHandler:v8];
}

void __114__GEODataURLSessionTask_URLSessionTask__dataURLSession_willSendRequestForEstablishedConnection_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(id *)(a1 + 32) == v3)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_10:
    v7();
    goto LABEL_11;
  }
  uint64_t v4 = GEOGetDataSessionURLLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (!v3)
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a1 + 48);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Cancelling task %@ -- willSendRequestForEstablishedConnection returned nil.", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_10;
  }
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Updating task %@ request -- willSendRequestForEstablishedConnection returned new object.", (uint8_t *)&v9, 0xCu);
  }

  [*(id *)(a1 + 48) updateRequest:v3 completionHandler:*(void *)(a1 + 56)];
LABEL_11:
}

void __31__GEODataURLSessionTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 117))
  {
    v5.opaque[0] = 0;
    v5.opaque[1] = 0;
    os_activity_scope_enter(*(os_activity_t *)(v1 + 128), &v5);
    *(unsigned char *)(*(void *)(a1 + 32) + 117) = 1;
    id v3 = GEOGetDataSessionURLLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Cancelled task %@", buf, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 40) cancel];
    os_activity_scope_leave(&v5);
  }
}

- (BOOL)didValidateEntityTagForData:(id *)a3 entityTag:(id *)a4
{
  int64_t v7 = [(GEODataURLSessionTask *)self HTTPStatusCode];
  if (v7 == 304)
  {
    uint64_t v8 = [(GEODataURLSessionTask *)self entityTag];
    int v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      uint64_t v11 = [(GEODataURLSessionTask *)self originalURLRequest];
      id v12 = [v11 allHTTPHeaderFields];
      id v10 = [v12 objectForKeyedSubscript:@"If-None-Match"];
    }
    *a3 = [(GEODataURLSessionTask *)self cachedData];
    id v13 = v10;
    *a4 = v13;
  }
  return v7 == 304;
}

- (NSString)entityTag
{
  uint64_t v2 = [(GEODataURLSessionTask *)self response];
  id v3 = [v2 allHeaderFields];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"ETag"];

  return (NSString *)v4;
}

- (NSData)cachedData
{
  return self->_cachedData;
}

void __93__GEODataURLSessionTask_URLSessionTask__dataURLSession_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 72);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__GEODataURLSessionTask_URLSessionTask__dataURLSession_didReceiveResponse_completionHandler___block_invoke_2;
  v6[3] = &unk_1E53E2FD8;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  [v2 dataURLSession:v3 shouldConvertDataTask:v4 toDownloadTaskForEstimatedResponseSize:v5 completionHandler:v6];
}

void __93__GEODataURLSessionTask_URLSessionTask__dataURLSession_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93__GEODataURLSessionTask_URLSessionTask__dataURLSession_didReceiveResponse_completionHandler___block_invoke_3;
  v5[3] = &unk_1E53E2FB0;
  char v8 = a2;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, v5);
}

- (NSData)receivedData
{
  return (NSData *)self->_receivedData;
}

- (BOOL)protocolBufferHasPreamble
{
  return 1;
}

uint64_t __93__GEODataURLSessionTask_URLSessionTask__dataURLSession_didReceiveResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = GEOGetDataSessionURLLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v3;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "Converting task %@ to download task", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:bodySizeEstimateFromResponse(*(void **)(a1 + 40))];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v4;
  }
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v7);
}

- (GEODataURLSessionTask)init
{
  result = (GEODataURLSessionTask *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (void)_prepareForRestart
{
  [(NSURLSessionTask *)self->_backingTask cancel];
  backingTask = self->_backingTask;
  self->_backingTask = 0;

  self->_startTime = 0.0;
  self->_finished = 0;
  nonBackingTaskError = self->_nonBackingTaskError;
  self->_nonBackingTaskError = 0;

  receivedData = self->_receivedData;
  self->_receivedData = 0;

  urlTaskMetrics = self->_urlTaskMetrics;
  self->_urlTaskMetrics = 0;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(GEODataURLSessionTask *)self originalRequestURL];
  uint64_t v5 = [(GEODataURLSessionTask *)self backingTask];
  id v6 = [(GEODataURLSessionTask *)self requestCounterTicket];
  uint64_t v7 = [v3 stringWithFormat:@"<DUT %p URL: %@ Backing: %@ ticket: %@>", self, v4, v5, v6];

  return v7;
}

- (id)debugDescription
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  uint64_t v4 = [(GEODataURLSessionTask *)self originalRequestURL];

  if (v4)
  {
    uint64_t v5 = [(GEODataURLSessionTask *)self originalRequestURL];
    [v3 appendFormat:@" \"%@\"", v5];
  }
  id v6 = [(GEODataURLSessionTask *)self delegate];
  objc_msgSend(v3, "appendFormat:", @" delegate: %p", v6);

  [v3 appendFormat:@", underlying: <%@: %p>", objc_opt_class(), self->_backingTask];
  NSURLSessionTaskState v7 = [(NSURLSessionTask *)self->_backingTask state];
  if ((unint64_t)v7 <= NSURLSessionTaskStateCompleted) {
    [v3 appendString:off_1E53E2FF8[v7]];
  }
  char v8 = [(GEODataURLSessionTask *)self response];
  int v9 = v8;
  if (v8) {
    [v3 appendFormat:@", status code: %u", objc_msgSend(v8, "statusCode")];
  }
  receivedData = self->_receivedData;
  if (receivedData) {
    [v3 appendFormat:@", data: %zu", -[NSMutableData length](receivedData, "length")];
  }

  return v3;
}

- (float)priority
{
  uint64_t v6 = 0;
  NSURLSessionTaskState v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  sessionIsolation = self->_sessionIsolation;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__GEODataURLSessionTask_priority__block_invoke;
  v5[3] = &unk_1E53D89C0;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_async_and_wait(sessionIsolation, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __33__GEODataURLSessionTask_priority__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 108);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setPriority:(float)a3
{
  sessionIsolation = self->_sessionIsolation;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__GEODataURLSessionTask_setPriority___block_invoke;
  v4[3] = &unk_1E53D7EA8;
  v4[4] = self;
  float v5 = a3;
  dispatch_async_and_wait(sessionIsolation, v4);
}

void __37__GEODataURLSessionTask_setPriority___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 128), &v8);
  *(_DWORD *)(*(void *)(a1 + 32) + 108) = *(_DWORD *)(a1 + 40);
  float v3 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v3)
  {
    LODWORD(v2) = *(_DWORD *)(a1 + 40);
    [v3 setPriority:v2];
    uint64_t v4 = GEOGetDataSessionURLLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 40);
      double v7 = *(float *)(v5 + 108);
      *(_DWORD *)buf = 138412802;
      uint64_t v10 = v6;
      __int16 v11 = 2048;
      double v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Changed backing task %@ priority to %4.2f for task %@", buf, 0x20u);
    }
  }
  os_activity_scope_leave(&v8);
}

- (NSURLSessionTaskMetrics)urlTaskMetrics
{
  urlTaskMetrics = self->_urlTaskMetrics;
  if (urlTaskMetrics)
  {
    float v3 = urlTaskMetrics;
  }
  else
  {
    float v3 = [(NSURLSessionTask *)self->_backingTask _incompleteTaskMetrics];
  }

  return v3;
}

- (unint64_t)receivedDataLength
{
  receivedData = self->_receivedData;
  if (receivedData)
  {
    return [(NSMutableData *)receivedData length];
  }
  else if (self->_downloadedFileURL)
  {
    unint64_t result = self->_cachedDownloadFileSize;
    if (!result)
    {
      uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v6 = [(NSURL *)self->_downloadedFileURL path];
      double v7 = [v5 attributesOfItemAtPath:v6 error:0];
      self->_cachedDownloadFileSize = [v7 fileSize];

      return self->_cachedDownloadFileSize;
    }
  }
  else
  {
    return 0;
  }
  return result;
}

- (NSURL)downloadedFileURL
{
  return self->_downloadedFileURL;
}

- (void)setError:(id)a3
{
}

- (NSURLRequest)originalURLRequest
{
  return [(NSURLSessionTask *)self->_backingTask originalRequest];
}

- (unint64_t)outgoingPayloadSize
{
  double v2 = [(NSURLSessionTask *)self->_backingTask originalRequest];
  float v3 = [v2 HTTPBody];
  unint64_t v4 = [v3 length];

  return v4;
}

- (unint64_t)incomingPayloadSize
{
  return [(NSURLSessionTask *)self->_backingTask countOfBytesReceived];
}

- (NSString)remoteAddressAndPort
{
  return (NSString *)[(NSURLSessionTaskMetrics *)self->_urlTaskMetrics _geo_remoteAddressAndPort];
}

- (unint64_t)requestedMultipathServiceType
{
  return [(GEODataRequest *)self->_request multipathServiceType];
}

- (BOOL)validateTransportWithError:(id *)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(GEODataURLSessionTask *)self error];
  uint64_t v6 = v5;
  if (!v5)
  {
    if ([(GEODataURLSessionTask *)self HTTPStatusCode] == 200)
    {
      BOOL v7 = 1;
      goto LABEL_12;
    }
    if (a3)
    {
      v19[0] = @"HTTPStatus";
      os_activity_scope_state_s v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[GEODataURLSessionTask HTTPStatusCode](self, "HTTPStatusCode"));
      v20[0] = v8;
      v19[1] = *MEMORY[0x1E4F289B0];
      int v9 = [(GEODataURLSessionTask *)self response];
      uint64_t v10 = [v9 URL];
      v20[1] = v10;
      v19[2] = *MEMORY[0x1E4F289C0];
      __int16 v11 = [(GEODataURLSessionTask *)self response];
      double v12 = [v11 URL];
      __int16 v13 = [v12 absoluteString];
      v20[2] = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

      id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
      v16 = GEOErrorDomain();
      if ([(GEODataURLSessionTask *)self HTTPStatusCode] == 451) {
        uint64_t v17 = -6;
      }
      else {
        uint64_t v17 = -7;
      }
      *a3 = (id)[v15 initWithDomain:v16 code:v17 userInfo:v14];
    }
LABEL_11:
    BOOL v7 = 0;
    goto LABEL_12;
  }
  if (!a3) {
    goto LABEL_11;
  }
  BOOL v7 = 0;
  *a3 = v5;
LABEL_12:

  return v7;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (OS_dispatch_queue)sessionIsolation
{
  return self->_sessionIsolation;
}

- ($C4D369C9F02205611300857CFD58F739)requestKind
{
  return ($C4D369C9F02205611300857CFD58F739)self->_requestKind;
}

- (double)startTime
{
  return self->_startTime;
}

- (NSURLSessionTask)backingTask
{
  return self->_backingTask;
}

- (BOOL)finished
{
  return self->_finished;
}

- (BOOL)mptcpNegotiated
{
  return self->_mptcpNegotiated;
}

- (void)setReceivedRNFNotification:(BOOL)a3
{
  self->_receivedRNFNotification = a3;
}

- (void)updateRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sessionIsolation = self->_sessionIsolation;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__GEODataURLSessionTask_URLSessionTask__updateRequest_completionHandler___block_invoke;
  block[3] = &unk_1E53D7F70;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sessionIsolation, block);
}

void __73__GEODataURLSessionTask_URLSessionTask__updateRequest_completionHandler___block_invoke(uint64_t a1)
{
  double v2 = GEOGetDataSessionURLLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "", v4, 2u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  float v3 = [*(id *)(a1 + 32) createURLRequest];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (double)elapsedTime
{
  double result = 0.0;
  if (self->_startTime != 2.22507386e-308)
  {
    GEOMachAbsoluteTimeGetCurrent();
    return v4 - self->_startTime;
  }
  return result;
}

- (double)loadTime
{
  double startTime = self->_startTime;
  double result = 0.0;
  if (startTime != 2.22507386e-308)
  {
    double endTime = self->_endTime;
    if (endTime != 2.22507386e-308) {
      return endTime - startTime;
    }
  }
  return result;
}

- (double)loadTimeIncludingTask:(id)a3
{
  double v4 = (double *)a3;
  double startTime = self->_startTime;
  double v6 = 0.0;
  if (startTime != 2.22507386e-308)
  {
    if (v4)
    {
      double endTime = self->_endTime;
      if (endTime != 2.22507386e-308)
      {
        double v9 = v4[10];
        if (v9 != 2.22507386e-308)
        {
          double v10 = v4[11];
          if (v10 != 2.22507386e-308)
          {
            if (endTime <= v10) {
              double endTime = v4[11];
            }
            if (startTime >= v9) {
              double startTime = v4[10];
            }
            double v6 = endTime - startTime;
          }
        }
      }
    }
  }

  return v6;
}

- (BOOL)validateTileResponse:(BOOL)a3 error:(id *)a4
{
  if (a3
    || (BOOL v4 = [(GEODataURLSessionTask *)self validateNonEmptyResponseWithError:a4]))
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)validateNonEmptyResponseWithError:(id *)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(GEODataURLSessionTask *)self receivedDataLength]
    || ![(GEODataURLSessionTask *)self contentLength])
  {
    return 1;
  }
  double v6 = NSString;
  id v7 = [(GEODataURLSessionTask *)self originalRequestURL];
  os_activity_scope_state_s v8 = [v6 stringWithFormat:@"Connection closed without receiving any data for url: %@", v7];

  double v10 = @"requester msg";
  v11[0] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  if (a3)
  {
    *a3 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-1 userInfo:v9];
  }

  return 0;
}

- (BOOL)validateContentLengthWithError:(id *)a3
{
  unint64_t v5 = [(GEODataURLSessionTask *)self receivedDataLength];
  if ([(GEODataURLSessionTask *)self contentLength] == 0x7FFFFFFFFFFFFFFFLL
    || [(GEODataURLSessionTask *)self contentLength] == v5)
  {
    return 1;
  }
  id v7 = (void *)[[NSString alloc] initWithFormat:@"Content-Length: %lu, Actual data read: %lu", -[GEODataURLSessionTask contentLength](self, "contentLength"), v5];
  os_activity_scope_state_s v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"requester msg", 0);
  if (a3)
  {
    *a3 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-7 userInfo:v8];
  }

  return 0;
}

- (NSString)contentLengthString
{
  double v2 = [(GEODataURLSessionTask *)self response];
  float v3 = [v2 allHeaderFields];
  BOOL v4 = [v3 objectForKeyedSubscript:@"Content-Length"];

  return (NSString *)v4;
}

- (unint64_t)contentLength
{
  double v2 = [(GEODataURLSessionTask *)self contentLengthString];
  float v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 integerValue];
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (NSURL)originalRequestURL
{
  double v2 = [(GEODataURLSessionTask *)self originalURLRequest];
  float v3 = [v2 URL];

  return (NSURL *)v3;
}

@end