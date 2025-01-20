@interface NWURLSessionTask
- ($1C4110BDDF6CE1A35BD1F09FD54CA4C3)logDescription;
- (BOOL)_callCompletionHandlerInline;
- (BOOL)_isTopLevelNavigation;
- (BOOL)_keepDownloadTaskFile;
- (BOOL)_preconnect;
- (BOOL)createTimerWithTimeout:(uint64_t)a1;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)prefersIncrementalDelivery;
- (NSArray)_resolvedCNAMEChain;
- (NSDate)earliestBeginDate;
- (NSDictionary)_trailers;
- (NSProgress)progress;
- (NSString)_pathToDownloadTaskFile;
- (NSString)_storagePartitionIdentifier;
- (NSString)description;
- (NSString)taskDescription;
- (NSURL)_siteForCookies;
- (NSURLRequest)currentRequest;
- (NSURLRequest)originalRequest;
- (NSURLResponse)response;
- (NSURLSessionDataTask)loaderDataTask;
- (NSURLSessionTaskDelegate)_internalDelegate;
- (NSURLSessionTaskDelegate)delegate;
- (NSURLSessionTaskMetrics)_incompleteTaskMetrics;
- (NSURLSessionTaskTransactionMetrics)_incompleteCurrentTaskTransactionMetrics;
- (NWURLError)error;
- (OS_nw_activity)_nw_activity;
- (OS_nw_context)networkContext;
- (OS_nw_endpoint)_hostOverride;
- (OS_nw_protocol_metadata)clientMetadata;
- (__SecTrust)secTrust;
- (double)_timeoutIntervalForResource;
- (float)priority;
- (id)_cookieTransformCallback;
- (id)_timingData;
- (id)errorForErrorCode:(id *)a1;
- (id)errorWithResumeData:(id)a3;
- (id)initWithRequest:(int)a3 identifier:(void *)a4 session:;
- (int64_t)_bytesPerSecondLimit;
- (int64_t)_countOfBytesReceivedEncoded;
- (int64_t)countOfBytesClientExpectsToReceive;
- (int64_t)countOfBytesClientExpectsToSend;
- (int64_t)countOfBytesExpectedToReceive;
- (int64_t)countOfBytesExpectedToSend;
- (int64_t)countOfBytesReceived;
- (int64_t)countOfBytesSent;
- (int64_t)state;
- (unint64_t)taskIdentifier;
- (void)_adoptEffectiveConfiguration:(id)a3;
- (void)_setExplicitCookieStorage:(OpaqueCFHTTPCookieStorage *)a3;
- (void)cancel;
- (void)complete;
- (void)completeTaskWithError:(id)a3;
- (void)dealloc;
- (void)delegateWrapper;
- (void)finishProgressReporting;
- (void)getUnderlyingHTTPConnectionInfoWithCompletionHandler:(id)a3;
- (void)joiningContext;
- (void)loaderConnectedWithHTTPConnectionMetadata:(id)a3 CNAMEChain:(id)a4 unlistedTracker:(id)a5;
- (void)loaderDidReceiveChallenge:(id)a3 completionHandler:(id)a4;
- (void)loaderDidReceiveClientCertificateChallenge:(id)a3 completionHandler:(id)a4;
- (void)loaderDidReceiveInformationalResponse:(id)a3;
- (void)loaderDidReceiveServerTrustChallenge:(id)a3 secProtocolMetadata:(id)a4 completionHandler:(id)a5;
- (void)loaderDidSendBodyData:(int64_t)a3 totalBytesSent:(int64_t)a4 totalBytesExpectedToSend:(int64_t)a5 completionHandler:(id)a6;
- (void)loaderFailedToConnect:(id)a3;
- (void)loaderNeedsBodyProviderFromOffset:(unint64_t)a3 completionHandler:(id)a4;
- (void)loaderPreparingConnection;
- (void)loaderRunDelegateBlock:(id)a3;
- (void)loaderWaitingForConnectivity;
- (void)loaderWillPerformHSTSUpgrade:(BOOL)a3;
- (void)loaderWillPerformHTTPRedirection:(id)a3 newRequest:(id)a4;
- (void)loaderWillPerformHTTPRedirection:(id)a3 newRequest:(id)a4 completionHandler:(id)a5;
- (void)performNextServerTrustChallenge;
- (void)readResponseBody;
- (void)resume;
- (void)setClientMetadataForMetrics:(uint64_t)a1;
- (void)setConfiguration:(uint64_t)a1;
- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3;
- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3;
- (void)setCountOfBytesExpectedToReceive:(void *)result;
- (void)setCountOfBytesExpectedToSend:(void *)result;
- (void)setCountOfBytesReceived:(uint64_t)a1;
- (void)setDelegate:(id)a3;
- (void)setEarliestBeginDate:(id)a3;
- (void)setLoader:(uint64_t)a1;
- (void)setPrefersIncrementalDelivery:(BOOL)a3;
- (void)setPriority:(float)a3;
- (void)setSecTrust:(__SecTrust *)a3;
- (void)setTaskDescription:(id)a3;
- (void)set_bytesPerSecondLimit:(int64_t)a3;
- (void)set_callCompletionHandlerInline:(BOOL)a3;
- (void)set_cookieTransformCallback:(id)a3;
- (void)set_hostOverride:(id)a3;
- (void)set_internalDelegate:(id)a3;
- (void)set_isTopLevelNavigation:(BOOL)a3;
- (void)set_keepDownloadTaskFile:(BOOL)a3;
- (void)set_nw_activity:(id)a3;
- (void)set_pathToDownloadTaskFile:(id)a3;
- (void)set_preconnect:(BOOL)a3;
- (void)set_siteForCookies:(id)a3;
- (void)set_storagePartitionIdentifier:(id)a3;
- (void)set_timeoutIntervalForResource:(double)a3;
- (void)startNextLoad:(BOOL)a3;
- (void)startResourceTimer;
- (void)startStartTimer;
- (void)suspend;
- (void)updateResponse:(uint64_t)a1;
@end

@implementation NWURLSessionTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_cookieStorage, 0);
  objc_storeStrong((id *)&self->_responseConsumer, 0);
  objc_storeStrong((id *)&self->_requestBody, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_lastSecProtocolMetadata, 0);
  objc_storeStrong((id *)&self->_serverTrustCallbackQueue, 0);
  objc_storeStrong((id *)&self->_backtrace, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_uploadProgress, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_storeStrong(&self->_HTTPConnectionInfoHandler, 0);
  objc_storeStrong(&self->_pendingUpload, 0);
  objc_storeStrong((id *)&self->_multipartParser, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_clientMetadataForMetrics, 0);
  objc_storeStrong((id *)&self->_internalDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_publicDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->__trailers, 0);
  objc_storeStrong((id *)&self->__hostOverride, 0);
  objc_storeStrong((id *)&self->__resolvedCNAMEChain, 0);
  objc_storeStrong(&self->__cookieTransformCallback, 0);
  objc_storeStrong((id *)&self->__siteForCookies, 0);
  objc_storeStrong((id *)&self->__storagePartitionIdentifier, 0);
  objc_storeStrong((id *)&self->__pathToDownloadTaskFile, 0);
  objc_storeStrong((id *)&self->__nw_activity, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_taskDescription, 0);
  objc_storeStrong((id *)&self->_earliestBeginDate, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_appssoH1FallbackHeaders, 0);

  objc_storeStrong((id *)&self->_h1FallbackCache, 0);
}

- (NSDictionary)_trailers
{
  return (NSDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)set_hostOverride:(id)a3
{
}

- (OS_nw_endpoint)_hostOverride
{
  return self->__hostOverride;
}

- (void)set_timeoutIntervalForResource:(double)a3
{
  self->__timeoutIntervalForResource = a3;
}

- (double)_timeoutIntervalForResource
{
  return self->__timeoutIntervalForResource;
}

- (void)set_bytesPerSecondLimit:(int64_t)a3
{
  self->__bytesPerSecondLimit = a3;
}

- (int64_t)_bytesPerSecondLimit
{
  return self->__bytesPerSecondLimit;
}

- (NSArray)_resolvedCNAMEChain
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)set_cookieTransformCallback:(id)a3
{
}

- (id)_cookieTransformCallback
{
  return self->__cookieTransformCallback;
}

- (void)set_preconnect:(BOOL)a3
{
  self->__preconnect = a3;
}

- (BOOL)_preconnect
{
  return self->__preconnect;
}

- (void)set_isTopLevelNavigation:(BOOL)a3
{
  self->__isTopLevelNavigation = a3;
}

- (BOOL)_isTopLevelNavigation
{
  return self->__isTopLevelNavigation;
}

- (void)set_siteForCookies:(id)a3
{
}

- (NSURL)_siteForCookies
{
  return self->__siteForCookies;
}

- (void)set_storagePartitionIdentifier:(id)a3
{
}

- (NSString)_storagePartitionIdentifier
{
  return self->__storagePartitionIdentifier;
}

- (void)set_pathToDownloadTaskFile:(id)a3
{
}

- (NSString)_pathToDownloadTaskFile
{
  return self->__pathToDownloadTaskFile;
}

- (void)set_nw_activity:(id)a3
{
}

- (OS_nw_activity)_nw_activity
{
  return self->__nw_activity;
}

- (void)set_keepDownloadTaskFile:(BOOL)a3
{
  self->__keepDownloadTaskFile = a3;
}

- (BOOL)_keepDownloadTaskFile
{
  return self->__keepDownloadTaskFile;
}

- (void)set_callCompletionHandlerInline:(BOOL)a3
{
  self->__callCompletionHandlerInline = a3;
}

- (BOOL)_callCompletionHandlerInline
{
  return self->__callCompletionHandlerInline;
}

- (__SecTrust)secTrust
{
  return self->_secTrust;
}

- (NWURLError)error
{
  return (NWURLError *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTaskDescription:(id)a3
{
}

- (NSString)taskDescription
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (int64_t)countOfBytesExpectedToReceive
{
  return self->_countOfBytesExpectedToReceive;
}

- (int64_t)countOfBytesExpectedToSend
{
  return self->_countOfBytesExpectedToSend;
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3
{
  self->_countOfBytesClientExpectsToReceive = a3;
}

- (int64_t)countOfBytesClientExpectsToReceive
{
  return self->_countOfBytesClientExpectsToReceive;
}

- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3
{
  self->_countOfBytesClientExpectsToSend = a3;
}

- (int64_t)countOfBytesClientExpectsToSend
{
  return self->_countOfBytesClientExpectsToSend;
}

- (void)setEarliestBeginDate:(id)a3
{
}

- (NSDate)earliestBeginDate
{
  return self->_earliestBeginDate;
}

- (NSURLRequest)currentRequest
{
  return self->_currentRequest;
}

- (NSURLRequest)originalRequest
{
  return self->_originalRequest;
}

- ($1C4110BDDF6CE1A35BD1F09FD54CA4C3)logDescription
{
  *($045A7E745A1AC4122900FE6B13FDCB23 *)retstr = *($045A7E745A1AC4122900FE6B13FDCB23 *)((char *)self + 448);
  return self;
}

- (int64_t)_countOfBytesReceivedEncoded
{
  v2 = [(NWURLSessionTask *)self _incompleteCurrentTaskTransactionMetrics];
  int64_t v3 = [v2 countOfResponseBodyBytesReceived];

  return v3;
}

- (void)_adoptEffectiveConfiguration:(id)a3
{
  v4 = [a3 URLCredentialStorage];

  if (self)
  {
    if (!v4) {
      self->_disabledCredentialStorage = 1;
    }
  }
}

- (void)_setExplicitCookieStorage:(OpaqueCFHTTPCookieStorage *)a3
{
  if (!self)
  {
    if (!a3) {
      return;
    }
    goto LABEL_3;
  }
  self->_explicitlySetCookieStorage = 1;
  if (a3)
  {
LABEL_3:
    v7 = (NSHTTPCookieStorage *)(id)[objc_alloc(MEMORY[0x1E4F18D30]) _initWithCFHTTPCookieStorage:a3];
    v4 = objc_alloc_init(NWConcrete_nw_http_cookie_storage);
    cookieStorage = v4->cookieStorage;
    v4->cookieStorage = v7;

    if (self) {
      objc_storeStrong((id *)&self->_cookieStorage, v4);
    }

    v6 = (OS_nw_http_cookie_storage *)v7;
    goto LABEL_7;
  }
  v6 = self->_cookieStorage;
  self->_cookieStorage = 0;
LABEL_7:
}

- (id)_timingData
{
  return 0;
}

- (NSURLSessionTaskTransactionMetrics)_incompleteCurrentTaskTransactionMetrics
{
  if (self)
  {
    Property = (id *)objc_getProperty(self, a2, 440, 1);
    int64_t v3 = Property;
    if (Property)
    {
      id v4 = nw_http_client_metadata_copy_current_transaction_metadata(Property[2]);
      int64_t v3 = -[NWURLSessionTaskTransactionMetrics initWithTransactionMetadata:clientMetadata:]((id *)[NWURLSessionTaskTransactionMetrics alloc], v4, v3[2]);
    }
  }
  else
  {
    int64_t v3 = 0;
  }

  return (NSURLSessionTaskTransactionMetrics *)v3;
}

- (NSURLSessionTaskMetrics)_incompleteTaskMetrics
{
  if (self)
  {
    self = (NWURLSessionTask *)objc_getProperty(self, a2, 440, 1);
    uint64_t v2 = vars8;
  }
  return (NSURLSessionTaskMetrics *)self;
}

- (void)getUnderlyingHTTPConnectionInfoWithCompletionHandler:(id)a3
{
  if (self) {
    objc_setProperty_atomic_copy(self, a2, a3, 304);
  }
}

- (NSProgress)progress
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_progress)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
    progress = v2->_progress;
    v2->_progress = (NSProgress *)v3;

    if ([(NWURLSessionTask *)v2 countOfBytesExpectedToSend] <= 0)
    {
      uint64_t v6 = 0;
      v2->_defaultUploadProgressState = 1;
      uint64_t v5 = 100;
    }
    else
    {
      uint64_t v5 = [(NWURLSessionTask *)v2 countOfBytesExpectedToSend];
      uint64_t v6 = [(NWURLSessionTask *)v2 countOfBytesSent];
    }
    uint64_t v7 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v5];
    uploadProgress = v2->_uploadProgress;
    v2->_uploadProgress = (NSProgress *)v7;

    v9 = v2->_uploadProgress;
    [(NSProgress *)v9 setCompletedUnitCount:v6];

    if ([(NWURLSessionTask *)v2 countOfBytesExpectedToReceive] <= 0)
    {
      uint64_t v11 = 0;
      v2->_defaultDownloadProgressState = 1;
      uint64_t v10 = 100;
    }
    else
    {
      uint64_t v10 = [(NWURLSessionTask *)v2 countOfBytesExpectedToReceive];
      uint64_t v11 = [(NWURLSessionTask *)v2 countOfBytesReceived];
    }
    uint64_t v12 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v10];
    downloadProgress = v2->_downloadProgress;
    v2->_downloadProgress = (NSProgress *)v12;

    v14 = v2->_downloadProgress;
    [(NSProgress *)v14 setCompletedUnitCount:v11];

    v15 = [(NWURLSessionTask *)v2 originalRequest];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = [v15 HTTPBody];
      if (v16 || ([v15 HTTPBodyStream], (v16 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        v27 = [v15 HTTPMethod];
        if ([v27 caseInsensitiveCompare:@"POST"])
        {
          v28 = [v15 HTTPMethod];
          if ([v28 caseInsensitiveCompare:@"PUT"])
          {
            v29 = [v15 HTTPMethod];
            uint64_t v30 = [v29 caseInsensitiveCompare:@"PATCH"];

            if (v30)
            {
              uint64_t v17 = 95;
              uint64_t v18 = 5;
              goto LABEL_13;
            }
          }
          else
          {
          }
        }
        else
        {
        }
      }
    }
    uint64_t v17 = 5;
    uint64_t v18 = 95;
LABEL_13:
    v19 = v2->_progress;
    v20 = v2->_uploadProgress;
    [(NSProgress *)v19 addChild:v20 withPendingUnitCount:v18];

    v21 = v2->_progress;
    v22 = v2->_downloadProgress;
    [(NSProgress *)v21 addChild:v22 withPendingUnitCount:v17];

    [(NSProgress *)v2->_progress setKind:*MEMORY[0x1E4F28898]];
    [(NSProgress *)v2->_progress setFileTotalCount:&unk_1ECF96D38];
    if ([(NWURLSessionTask *)v2 countOfBytesReceived] < 1)
    {
      v24 = (void *)MEMORY[0x1E4F28880];
    }
    else
    {
      v23 = v2->_uploadProgress;
      [(NSProgress *)v2->_uploadProgress setCompletedUnitCount:[(NSProgress *)v23 totalUnitCount]];

      v24 = (void *)MEMORY[0x1E4F28858];
    }
    [(NSProgress *)v2->_progress setFileOperationKind:*v24];
    objc_initWeak(&location, v2);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __28__NWURLSessionTask_progress__block_invoke;
    v35[3] = &unk_1E5243FB0;
    objc_copyWeak(&v36, &location);
    [(NSProgress *)v2->_progress setCancellationHandler:v35];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __28__NWURLSessionTask_progress__block_invoke_2;
    v33[3] = &unk_1E5243FB0;
    objc_copyWeak(&v34, &location);
    [(NSProgress *)v2->_progress setPausingHandler:v33];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __28__NWURLSessionTask_progress__block_invoke_3;
    v31[3] = &unk_1E5243FB0;
    objc_copyWeak(&v32, &location);
    [(NSProgress *)v2->_progress setResumingHandler:v31];
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  v25 = v2->_progress;

  return v25;
}

void __28__NWURLSessionTask_progress__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

void __28__NWURLSessionTask_progress__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained suspend];
}

void __28__NWURLSessionTask_progress__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resume];
}

- (void)setPrefersIncrementalDelivery:(BOOL)a3
{
  if (self->_prefersIncrementalDelivery != a3) {
    self->_prefersIncrementalDelivery = a3;
  }
}

- (BOOL)prefersIncrementalDelivery
{
  return self->_prefersIncrementalDelivery;
}

- (void)setPriority:(float)a3
{
  if (a3 >= 0.0 && a3 <= 1.0 && self->_priority != a3) {
    self->_priority = a3;
  }
}

- (float)priority
{
  return self->_priority;
}

- (void)loaderDidSendBodyData:(int64_t)a3 totalBytesSent:(int64_t)a4 totalBytesExpectedToSend:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  if (self)
  {
    [(NWURLSessionTask *)self willChangeValueForKey:@"countOfBytesSent"];
    self->_countOfBytesSent = a4;
    [(NWURLSessionTask *)self didChangeValueForKey:@"countOfBytesSent"];
    if (self->_progress && !self->_progressReportingFinished)
    {
      v14 = [NSNumber numberWithLongLong:a4];
      v15 = [(NWURLSessionTask *)self progress];
      [v15 setByteCompletedCount:v14];

      uploadProgress = self->_uploadProgress;
      if (self->_defaultUploadProgressState)
      {
        uint64_t v17 = uploadProgress;
        uint64_t v18 = [(NSProgress *)v17 completedUnitCount];
        int64_t v19 = [(NSProgress *)self->_uploadProgress totalUnitCount] - 1;

        if (v18 < v19)
        {
          v20 = self->_uploadProgress;
          [(NSProgress *)v20 setCompletedUnitCount:[(NSProgress *)v20 completedUnitCount] + 1];
        }
      }
      else
      {
        [(NSProgress *)uploadProgress setCompletedUnitCount:a4];
      }
    }
    -[NWURLSessionTask setCountOfBytesExpectedToSend:](self, a5);
    double timeoutIntervalForRequest = self->_timeoutIntervalForRequest;
    if (timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        dispatch_time_t v13 = dispatch_time(0x8000000000000000, (uint64_t)(timeoutIntervalForRequest * 1000000000.0));
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)v13;
          requestTimeoutTimer[5] = (dispatch_source_t)-1;
          if (*((unsigned char *)requestTimeoutTimer + 48) && *((unsigned char *)requestTimeoutTimer + 49)) {
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer);
          }
        }
      }
      else
      {
        self->_requestTimeoutTimer = (void *)[(NWURLSessionTask *)(uint64_t)self createTimerWithTimeout:timeoutIntervalForRequest];
      }
    }
    uint64_t v21 = 248;
    if (!self->_internalDelegateWrapper) {
      uint64_t v21 = 240;
    }
    v22 = (id *)*(id *)((char *)&self->super.isa + v21);
  }
  else
  {
    -[NWURLSessionTask setCountOfBytesExpectedToSend:](0, a5);
    v22 = 0;
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v35 = __100__NWURLSessionTask_loaderDidSendBodyData_totalBytesSent_totalBytesExpectedToSend_completionHandler___block_invoke;
  id v36 = &unk_1E524B950;
  v37 = self;
  id v38 = v10;
  id v23 = v10;
  v24 = self;
  v26 = v34;
  if (v22)
  {
    v27 = [(NWURLSessionDelegateWrapper *)v22 delegateFor_didSendBodyData];
    if (v27)
    {
      id v28 = v22[4];
      id v29 = v22[5];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __110__NWURLSessionDelegateWrapper_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend_completionHandler___block_invoke;
      v39[3] = &unk_1E52499F8;
      id v40 = v27;
      id v41 = v28;
      uint64_t v30 = v24;
      int64_t v45 = a3;
      int64_t v46 = a4;
      int64_t v47 = a5;
      v42 = v30;
      id v43 = v29;
      v44 = v26;
      v31 = v22[6];
      id v32 = v29;
      id v33 = v28;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v31, v39);
    }
    else
    {
      ((void (*)(void *))v35)(v26);
    }
  }
}

- (void)setCountOfBytesExpectedToSend:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    [result willChangeValueForKey:@"countOfBytesExpectedToSend"];
    v3[14] = a2;
    result = (void *)[v3 didChangeValueForKey:@"countOfBytesExpectedToSend"];
    if (v3[8])
    {
      if (!*((unsigned char *)v3 + 15))
      {
        id v4 = [NSNumber numberWithLongLong:a2];
        uint64_t v5 = [v3 progress];
        [v5 setByteTotalCount:v4];

        if (a2 >= 1) {
          uint64_t v6 = a2;
        }
        else {
          uint64_t v6 = 100;
        }
        *((unsigned char *)v3 + 16) = a2 < 1;
        uint64_t v7 = (void *)v3[45];
        return (void *)[v7 setTotalUnitCount:v6];
      }
    }
  }
  return result;
}

- (BOOL)createTimerWithTimeout:(uint64_t)a1
{
  if (a2 > 31536000.0) {
    return 0;
  }
  id v4 = *(void **)(a1 + 312);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__NWURLSessionTask_createTimerWithTimeout___block_invoke;
  v7[3] = &unk_1E524BAA8;
  v7[4] = a1;
  BOOL source = nw_queue_context_create_source(v4, 2, 3, 0, v7, 0);
  dispatch_time_t v5 = dispatch_time(0x8000000000000000, (uint64_t)(a2 * 1000000000.0));
  nw_queue_set_timer_values(source, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  nw_queue_activate_source(source);
  return source;
}

void __100__NWURLSessionTask_loaderDidSendBodyData_totalBytesSent_totalBytesExpectedToSend_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (v3 && (v3[13] & 1) != 0) {
    objc_setProperty_nonatomic_copy(v3, a2, *(id *)(a1 + 40), 296);
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __43__NWURLSessionTask_createTimerWithTimeout___block_invoke(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = [NWURLError alloc];
    id v3 = v1[33];
    id v4 = v1;
    if (v2
      && (uint64_t v5 = *MEMORY[0x1E4F289A0],
          v8.receiver = v2,
          v8.super_class = (Class)NWURLError,
          (id v6 = objc_msgSendSuper2(&v8, sel_initWithDomain_code_userInfo_, v5, -1001, 0)) != 0))
    {
      id v7 = v6;
      [v6 fillErrorForLoader:v3 andTask:v4];
    }
    else
    {
      id v7 = 0;
    }

    [v1 completeTaskWithError:v7];
  }
  else
  {
    id v7 = 0;
    [0 completeTaskWithError:0];
  }
}

- (void)loaderDidReceiveChallenge:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  objc_super v8 = (id)gurlLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [(NWURLSessionTask *)self logDescription];
    [(NWURLSessionTask *)self logDescription];
    int v9 = v28;
    id v10 = [v6 protectionSpace];
    uint64_t v11 = [v10 authenticationMethod];
    uint64_t v12 = [v6 proposedCredential];
    *(_DWORD *)buf = 68289794;
    int v31 = 16;
    __int16 v32 = 2098;
    id v33 = &v29;
    __int16 v34 = 1024;
    int v35 = v9;
    __int16 v36 = 2114;
    v37 = v11;
    __int16 v38 = 1024;
    BOOL v39 = v12 != 0;
    _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> received auth challenge {method=\"%{public}@\", proposed=%{BOOL}d}", buf, 0x28u);
  }
  dispatch_time_t v13 = [v6 protectionSpace];
  if ([v13 isProxy]) {
    goto LABEL_6;
  }
  uint64_t v14 = [v6 previousFailureCount];

  if (v14) {
    goto LABEL_8;
  }
  uint64_t v18 = [(NWURLSessionTask *)self currentRequest];
  dispatch_time_t v13 = [v18 URL];

  int64_t v19 = [v13 user];
  v20 = [v13 password];
  uint64_t v21 = v20;
  if (!v19 || !v20)
  {

LABEL_6:
LABEL_8:
    if (self)
    {
      if (self->_timeoutIntervalForRequest > 0.0)
      {
        requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
        if (requestTimeoutTimer)
        {
          if (*requestTimeoutTimer)
          {
            dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
          }
          else
          {
            requestTimeoutTimer[4] = (dispatch_source_t)-1;
            requestTimeoutTimer[5] = (dispatch_source_t)-1;
            if (*((unsigned char *)requestTimeoutTimer + 48) && *((unsigned char *)requestTimeoutTimer + 49)) {
              nw_queue_source_run_timer((uint64_t)requestTimeoutTimer);
            }
          }
        }
      }
      uint64_t v16 = 248;
      if (!self->_internalDelegateWrapper) {
        uint64_t v16 = 240;
      }
      id v17 = *(id *)((char *)&self->super.isa + v16);
    }
    else
    {
      id v17 = 0;
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __64__NWURLSessionTask_loaderDidReceiveChallenge_completionHandler___block_invoke;
    v24[3] = &unk_1E52426D0;
    v24[4] = self;
    id v25 = v7;
    -[NWURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:]((uint64_t)v17, self, v6, v24);

    goto LABEL_17;
  }
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  v22 = (id)gurlLogObj;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    [(NWURLSessionTask *)self logDescription];
    [(NWURLSessionTask *)self logDescription];
    *(_DWORD *)buf = 68289282;
    int v31 = 16;
    __int16 v32 = 2098;
    id v33 = &v27;
    __int16 v34 = 1024;
    int v35 = v26;
    _os_log_impl(&dword_1830D4000, v22, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> responding to auth challenge using URL credential", buf, 0x18u);
  }

  id v23 = [MEMORY[0x1E4F18D88] credentialWithUser:v19 password:v21 persistence:1];
  (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v23);

LABEL_17:
}

void __64__NWURLSessionTask_loaderDidReceiveChallenge_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  id v6 = (id)gurlLogObj;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = *(void **)(a1 + 32);
    if (v7)
    {
      [v7 logDescription];
      objc_super v8 = *(void **)(a1 + 32);
      if (v8)
      {
        [v8 logDescription];
        int v9 = v17;
LABEL_9:
        *(_DWORD *)buf = 68289794;
        int v21 = 16;
        __int16 v22 = 2098;
        id v23 = v18;
        __int16 v24 = 1024;
        int v25 = v9;
        __int16 v26 = 2048;
        uint64_t v27 = a2;
        __int16 v28 = 1024;
        BOOL v29 = v5 != 0;
        _os_log_impl(&dword_1830D4000, v6, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> responding to auth challenge {disposition=%ld, credential=%{BOOL}d}", buf, 0x28u);
        goto LABEL_10;
      }
    }
    else
    {
      v18[0] = 0;
      v18[1] = 0;
      int v19 = 0;
    }
    int v9 = 0;
    goto LABEL_9;
  }
LABEL_10:

  uint64_t v13 = *(void *)(a1 + 32);
  if (v13)
  {
    double v14 = *(double *)(v13 + 328);
    if (v14 > 0.0)
    {
      uint64_t v15 = *(void *)(v13 + 336);
      if (v15)
      {
        dispatch_time_t v16 = dispatch_time(0x8000000000000000, (uint64_t)(v14 * 1000000000.0));
        if (*(void *)v15)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          *(void *)(v15 + 32) = v16;
          *(void *)(v15 + 40) = -1;
          if (*(unsigned char *)(v15 + 48) && *(unsigned char *)(v15 + 49)) {
            nw_queue_source_run_timer(v15);
          }
        }
      }
    }
  }
  (*(void (**)(void, uint64_t, id, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, v5, v10, v11, v12);
}

- (void)loaderDidReceiveClientCertificateChallenge:(id)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  objc_super v8 = (id)gurlLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [(NWURLSessionTask *)self logDescription];
    [(NWURLSessionTask *)self logDescription];
    *(_DWORD *)buf = 68289282;
    int v28 = 16;
    __int16 v29 = 2098;
    uint64_t v30 = &v26;
    __int16 v31 = 1024;
    int v32 = v25;
    _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> received client cert challenge", buf, 0x18u);
  }

  int v9 = [(NWURLSessionTask *)self currentRequest];
  uint64_t v10 = [v9 URL];
  uint64_t v11 = [v10 host];

  uint64_t v12 = [(NWURLSessionTask *)self currentRequest];
  uint64_t v13 = [v12 URL];
  double v14 = [v13 port];

  id v15 = objc_alloc(MEMORY[0x1E4F18D98]);
  if (v14) {
    uint64_t v16 = [v14 integerValue];
  }
  else {
    uint64_t v16 = 443;
  }
  int v17 = (void *)[v15 initWithHost:v11 port:v16 protocol:*MEMORY[0x1E4F18CD8] realm:0 authenticationMethod:*MEMORY[0x1E4F18C78]];
  [v17 _setDistinguishedNames:v7];

  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F18D70]) initWithProtectionSpace:v17 proposedCredential:0 previousFailureCount:0 failureResponse:0 error:0 sender:0];
  if (self)
  {
    if (self->_timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)-1;
          requestTimeoutTimer[5] = (dispatch_source_t)-1;
          if (*((unsigned char *)requestTimeoutTimer + 48) && *((unsigned char *)requestTimeoutTimer + 49)) {
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer);
          }
        }
      }
    }
    uint64_t v20 = 248;
    if (!self->_internalDelegateWrapper) {
      uint64_t v20 = 240;
    }
    id v21 = *(id *)((char *)&self->super.isa + v20);
  }
  else
  {
    id v21 = 0;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__NWURLSessionTask_loaderDidReceiveClientCertificateChallenge_completionHandler___block_invoke;
  v23[3] = &unk_1E52426D0;
  v23[4] = self;
  id v24 = v6;
  id v22 = v6;
  -[NWURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:]((uint64_t)v21, self, v18, v23);
}

void __81__NWURLSessionTask_loaderDidReceiveClientCertificateChallenge_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  id v6 = (id)gurlLogObj;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = *(void **)(a1 + 32);
    if (v7)
    {
      [v7 logDescription];
      objc_super v8 = *(void **)(a1 + 32);
      if (v8)
      {
        [v8 logDescription];
        int v9 = v28;
        if (!a2)
        {
LABEL_7:
          BOOL v10 = objc_msgSend(v5, "identity", v26, v27, v28, v29, v30, v31) != 0;
LABEL_11:
          *(_DWORD *)buf = 68289538;
          *(_DWORD *)&uint8_t buf[4] = 16;
          *(_WORD *)uint64_t v33 = 2098;
          *(void *)&v33[2] = &v29;
          __int16 v34 = 1024;
          int v35 = v9;
          __int16 v36 = 1024;
          BOOL v37 = v10;
          _os_log_impl(&dword_1830D4000, v6, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> responding to client cert challenge {credential=%{BOOL}d}", buf, 0x1Eu);
          goto LABEL_12;
        }
LABEL_10:
        BOOL v10 = 0;
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      LODWORD(v31) = 0;
    }
    int v9 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    LODWORD(v28) = 0;
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
LABEL_12:

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    double v12 = *(double *)(v11 + 328);
    if (v12 > 0.0)
    {
      uint64_t v13 = *(void *)(v11 + 336);
      if (v13)
      {
        dispatch_time_t v14 = dispatch_time(0x8000000000000000, (uint64_t)(v12 * 1000000000.0));
        if (*(void *)v13)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          *(void *)(v13 + 32) = v14;
          *(void *)(v13 + 40) = -1;
          if (*(unsigned char *)(v13 + 48) && *(unsigned char *)(v13 + 49)) {
            nw_queue_source_run_timer(v13);
          }
        }
      }
    }
  }
  switch(a2)
  {
    case 0:
      if (![v5 identity]) {
        goto LABEL_27;
      }
      id v15 = (__SecIdentity *)[v5 identity];
      CFArrayRef v16 = [v5 certificates];
      sec_identity_t v17 = sec_identity_create_with_certificates(v15, v16);

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      break;
    case 1:
    case 3:
      goto LABEL_27;
    case 2:
      uint64_t v18 = *(id **)(a1 + 32);
      if (v18)
      {
        int v19 = [NWURLError alloc];
        id v20 = v18[33];
        id v21 = v18;
        if (v19)
        {
          uint64_t v22 = *MEMORY[0x1E4F289A0];
          *(void *)buf = v19;
          *(void *)uint64_t v33 = NWURLError;
          id v23 = [(uint8_t *)(objc_super *)buf initWithDomain:v22 code:-999 userInfo:0];
          int v19 = (NWURLError *)v23;
          if (v23) {
            [(uint8_t *)v23 fillErrorForLoader:v20 andTask:v21];
          }
        }

        int v25 = *(void **)(a1 + 32);
        if (v25) {
          objc_setProperty_atomic_copy(v25, v24, v19, 136);
        }
      }
      else
      {
        int v19 = 0;
      }

LABEL_27:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      break;
    default:
      break;
  }
}

- (void)loaderDidReceiveServerTrustChallenge:(id)a3 secProtocolMetadata:(id)a4 completionHandler:(id)a5
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  objc_super v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = sec_trust_copy_ref(v8);
  double v12 = [(NWURLSessionTask *)self currentRequest];
  uint64_t v13 = [v12 URL];
  dispatch_time_t v14 = [v13 host];

  if (self && (configuration = self->_configuration) != 0 && (CFArrayRef v16 = configuration->_atsState) != 0)
  {
    v80 = v16;
    v82 = [MEMORY[0x1E4F28F98] propertyListWithData:v16 options:0 format:0 error:0];
  }
  else
  {
    v80 = 0;
    v82 = 0;
  }
  CFArrayRef policies = 0;
  v81 = v11;
  OSStatus v17 = SecTrustCopyPolicies(v11, &policies);
  if (v17)
  {
    OSStatus v18 = v17;
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    id v19 = (id)gurlLogObj;
    *(_DWORD *)buf = 136446466;
    v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
    __int16 v95 = 1024;
    *(_DWORD *)v96 = v18;
    LODWORD(v77) = 18;
    v76 = buf;
    id v20 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t v91 = OS_LOG_TYPE_ERROR;
    char v90 = 0;
    if (__nwlog_fault((const char *)v20, &v91, &v90))
    {
      if (v91 == OS_LOG_TYPE_FAULT)
      {
        if (__nwlog_url_log::onceToken != -1) {
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
        }
        id v21 = (id)gurlLogObj;
        os_log_type_t v22 = v91;
        if (os_log_type_enabled(v21, v91))
        {
          *(_DWORD *)buf = 136446466;
          v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
          __int16 v95 = 1024;
          *(_DWORD *)v96 = v18;
          id v23 = "%{public}s SecTrustCopyPolicies failed %d";
LABEL_64:
          _os_log_impl(&dword_1830D4000, v21, v22, v23, buf, 0x12u);
          goto LABEL_65;
        }
        goto LABEL_65;
      }
      if (!v90)
      {
        if (__nwlog_url_log::onceToken != -1) {
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
        }
        id v21 = (id)gurlLogObj;
        os_log_type_t v22 = v91;
        if (os_log_type_enabled(v21, v91))
        {
          *(_DWORD *)buf = 136446466;
          v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
          __int16 v95 = 1024;
          *(_DWORD *)v96 = v18;
          id v23 = "%{public}s SecTrustCopyPolicies failed %d, backtrace limit exceeded";
          goto LABEL_64;
        }
LABEL_65:

        if (!v20)
        {
LABEL_34:
          uint64_t v33 = v81;
          if (self) {
            goto LABEL_35;
          }
LABEL_129:
          objc_msgSend(0, "setSecTrust:", v33, v76, v77);
          int v35 = 0;
          goto LABEL_130;
        }
LABEL_33:
        free(v20);
        goto LABEL_34;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      id v21 = (id)gurlLogObj;
      os_log_type_t v22 = v91;
      BOOL v32 = os_log_type_enabled(v21, v91);
      if (!backtrace_string)
      {
        if (!v32) {
          goto LABEL_65;
        }
        *(_DWORD *)buf = 136446466;
        v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
        __int16 v95 = 1024;
        *(_DWORD *)v96 = v18;
        id v23 = "%{public}s SecTrustCopyPolicies failed %d, no backtrace";
        goto LABEL_64;
      }
      if (v32)
      {
        *(_DWORD *)buf = 136446722;
        v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
        __int16 v95 = 1024;
        *(_DWORD *)v96 = v18;
        *(_WORD *)&v96[4] = 2082;
        *(void *)&v96[6] = backtrace_string;
        _os_log_impl(&dword_1830D4000, v21, v22, "%{public}s SecTrustCopyPolicies failed %d, dumping backtrace:%{public}s", buf, 0x1Cu);
      }

      free(backtrace_string);
    }
    if (!v20) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  CFArrayRef v24 = policies;
  if ([(__CFArray *)policies count] != 1)
  {
    v78 = v8;
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    id v40 = (id)gurlLogObj;
    uint64_t v41 = [(__CFArray *)v24 count];
    *(_DWORD *)buf = 136446466;
    v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
    __int16 v95 = 2048;
    *(void *)v96 = v41;
    LODWORD(v77) = 22;
    v76 = buf;
    v42 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t v91 = OS_LOG_TYPE_ERROR;
    char v90 = 0;
    if (!__nwlog_fault((const char *)v42, &v91, &v90))
    {
LABEL_81:
      if (!v42)
      {
LABEL_83:
        objc_super v8 = v78;
        goto LABEL_128;
      }
LABEL_82:
      free(v42);
      goto LABEL_83;
    }
    if (v91 == OS_LOG_TYPE_FAULT)
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      id v43 = (id)gurlLogObj;
      os_log_type_t v44 = v91;
      if (!os_log_type_enabled(v43, v91)) {
        goto LABEL_80;
      }
      uint64_t v45 = [(__CFArray *)v24 count];
      *(_DWORD *)buf = 136446466;
      v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
      __int16 v95 = 2048;
      *(void *)v96 = v45;
      int64_t v46 = "%{public}s SecTrust has an unexpected number of policies %lu";
    }
    else
    {
      if (v90)
      {
        int64_t v47 = (char *)__nw_create_backtrace_string();
        CFArrayRef v48 = v24;
        if (__nwlog_url_log::onceToken != -1) {
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
        }
        v49 = (id)gurlLogObj;
        os_log_type_t v50 = v91;
        BOOL v51 = os_log_type_enabled(v49, v91);
        if (v47)
        {
          if (v51)
          {
            uint64_t v52 = [(__CFArray *)v48 count];
            *(_DWORD *)buf = 136446722;
            v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
            __int16 v95 = 2048;
            *(void *)v96 = v52;
            *(_WORD *)&v96[8] = 2082;
            *(void *)&v96[10] = v47;
            _os_log_impl(&dword_1830D4000, v49, v50, "%{public}s SecTrust has an unexpected number of policies %lu, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(v47);
        }
        else
        {
          if (v51)
          {
            uint64_t v58 = [(__CFArray *)v48 count];
            *(_DWORD *)buf = 136446466;
            v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
            __int16 v95 = 2048;
            *(void *)v96 = v58;
            _os_log_impl(&dword_1830D4000, v49, v50, "%{public}s SecTrust has an unexpected number of policies %lu, no backtrace", buf, 0x16u);
          }
        }
        CFArrayRef v24 = v48;
        if (!v42) {
          goto LABEL_83;
        }
        goto LABEL_82;
      }
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      id v43 = (id)gurlLogObj;
      os_log_type_t v44 = v91;
      if (!os_log_type_enabled(v43, v91)) {
        goto LABEL_80;
      }
      uint64_t v57 = [(__CFArray *)v24 count];
      *(_DWORD *)buf = 136446466;
      v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
      __int16 v95 = 2048;
      *(void *)v96 = v57;
      int64_t v46 = "%{public}s SecTrust has an unexpected number of policies %lu, backtrace limit exceeded";
    }
    _os_log_impl(&dword_1830D4000, v43, v44, v46, buf, 0x16u);
LABEL_80:

    goto LABEL_81;
  }
  [(__CFArray *)v24 firstObject];

  if ((SecPolicySetSSLHostname() & 1) == 0)
  {
    id v79 = v10;
    CFArrayRef v25 = v24;
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    id v26 = (id)gurlLogObj;
    *(_DWORD *)buf = 136446210;
    v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
    LODWORD(v77) = 12;
    v76 = buf;
    uint64_t v27 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t v91 = OS_LOG_TYPE_ERROR;
    char v90 = 0;
    if (!__nwlog_fault((const char *)v27, &v91, &v90))
    {
LABEL_95:
      if (!v27)
      {
LABEL_97:
        id v10 = v79;
        goto LABEL_98;
      }
LABEL_96:
      free(v27);
      goto LABEL_97;
    }
    if (v91 == OS_LOG_TYPE_FAULT)
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      uint64_t v28 = (id)gurlLogObj;
      os_log_type_t v29 = v91;
      if (!os_log_type_enabled(v28, v91)) {
        goto LABEL_94;
      }
      *(_DWORD *)buf = 136446210;
      v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
      uint64_t v30 = "%{public}s SecPolicySetSSLHostname failed";
    }
    else
    {
      if (v90)
      {
        v53 = (char *)__nw_create_backtrace_string();
        if (__nwlog_url_log::onceToken != -1) {
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
        }
        v54 = (id)gurlLogObj;
        os_log_type_t v55 = v91;
        BOOL v56 = os_log_type_enabled(v54, v91);
        if (v53)
        {
          if (v56)
          {
            *(_DWORD *)buf = 136446466;
            v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
            __int16 v95 = 2082;
            *(void *)v96 = v53;
            _os_log_impl(&dword_1830D4000, v54, v55, "%{public}s SecPolicySetSSLHostname failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v53);
          CFArrayRef v24 = v25;
          if (!v27) {
            goto LABEL_97;
          }
        }
        else
        {
          if (v56)
          {
            *(_DWORD *)buf = 136446210;
            v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
            _os_log_impl(&dword_1830D4000, v54, v55, "%{public}s SecPolicySetSSLHostname failed, no backtrace", buf, 0xCu);
          }

          CFArrayRef v24 = v25;
          if (!v27) {
            goto LABEL_97;
          }
        }
        goto LABEL_96;
      }
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      uint64_t v28 = (id)gurlLogObj;
      os_log_type_t v29 = v91;
      if (!os_log_type_enabled(v28, v91)) {
        goto LABEL_94;
      }
      *(_DWORD *)buf = 136446210;
      v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
      uint64_t v30 = "%{public}s SecPolicySetSSLHostname failed, backtrace limit exceeded";
    }
    _os_log_impl(&dword_1830D4000, v28, v29, v30, buf, 0xCu);
LABEL_94:

    goto LABEL_95;
  }
LABEL_98:
  if (!v82 || (SecPolicySetATSPinning() & 1) != 0) {
    goto LABEL_128;
  }
  CFArrayRef v59 = v24;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  id v60 = (id)gurlLogObj;
  *(_DWORD *)buf = 136446210;
  v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
  LODWORD(v77) = 12;
  v76 = buf;
  v61 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t v91 = OS_LOG_TYPE_ERROR;
  char v90 = 0;
  if (!__nwlog_fault(v61, &v91, &v90))
  {
LABEL_126:
    if (!v61) {
      goto LABEL_128;
    }
    goto LABEL_127;
  }
  if (v91 == OS_LOG_TYPE_FAULT)
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    v62 = (id)gurlLogObj;
    os_log_type_t v63 = v91;
    if (!os_log_type_enabled(v62, v91)) {
      goto LABEL_125;
    }
    *(_DWORD *)buf = 136446210;
    v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
    v64 = "%{public}s SecPolicySetATSPinning failed";
LABEL_124:
    _os_log_impl(&dword_1830D4000, v62, v63, v64, buf, 0xCu);
LABEL_125:

    goto LABEL_126;
  }
  if (!v90)
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    v62 = (id)gurlLogObj;
    os_log_type_t v63 = v91;
    if (!os_log_type_enabled(v62, v91)) {
      goto LABEL_125;
    }
    *(_DWORD *)buf = 136446210;
    v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
    v64 = "%{public}s SecPolicySetATSPinning failed, backtrace limit exceeded";
    goto LABEL_124;
  }
  v65 = (char *)__nw_create_backtrace_string();
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  v66 = (id)gurlLogObj;
  os_log_type_t v67 = v91;
  BOOL v68 = os_log_type_enabled(v66, v91);
  if (v65)
  {
    if (v68)
    {
      *(_DWORD *)buf = 136446466;
      v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
      __int16 v95 = 2082;
      *(void *)v96 = v65;
      _os_log_impl(&dword_1830D4000, v66, v67, "%{public}s SecPolicySetATSPinning failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(v65);
    CFArrayRef v24 = v59;
    if (!v61) {
      goto LABEL_128;
    }
LABEL_127:
    free(v61);
    goto LABEL_128;
  }
  if (v68)
  {
    *(_DWORD *)buf = 136446210;
    v94 = "-[NWURLSessionTask loaderDidReceiveServerTrustChallenge:secProtocolMetadata:completionHandler:]";
    _os_log_impl(&dword_1830D4000, v66, v67, "%{public}s SecPolicySetATSPinning failed, no backtrace", buf, 0xCu);
  }

  CFArrayRef v24 = v59;
  if (v61) {
    goto LABEL_127;
  }
LABEL_128:

  uint64_t v33 = v81;
  if (!self) {
    goto LABEL_129;
  }
LABEL_35:
  __int16 v34 = self->_configuration;
  if (v34)
  {
    int v35 = [(NSURLSessionConfiguration *)v34->_configuration _tlsTrustPinningPolicyName];
    if (v35) {
      SecTrustSetPinningPolicyName();
    }
  }
  else
  {
    int v35 = 0;
  }
  -[NWURLSessionTask setSecTrust:](self, "setSecTrust:", v33, v76, v77);
  __int16 v36 = self->_configuration;
  if (v36
    && [(NSURLSessionConfiguration *)v36->_configuration _alwaysPerformDefaultTrustEvaluation])
  {
    queue = self->_queue;
    result[0] = MEMORY[0x1E4F143A8];
    result[1] = 3221225472;
    result[2] = __95__NWURLSessionTask_loaderDidReceiveServerTrustChallenge_secProtocolMetadata_completionHandler___block_invoke;
    result[3] = &unk_1E5242658;
    uint64_t v38 = (void (**)(id, void))v10;
    id v89 = v38;
    if (SecTrustEvaluateAsyncWithError(v33, queue, result)) {
      v38[2](v38, 0);
    }
    BOOL v39 = v89;
    goto LABEL_137;
  }
LABEL_130:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__NWURLSessionTask_loaderDidReceiveServerTrustChallenge_secProtocolMetadata_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E5243390;
  aBlock[4] = self;
  id v87 = v10;
  id v84 = v9;
  v85 = v8;
  id v86 = v14;
  v69 = _Block_copy(aBlock);
  v70 = v69;
  if (self && self->_performingServerTrustCallback)
  {
    serverTrustCallbackQueue = self->_serverTrustCallbackQueue;
    if (!serverTrustCallbackQueue)
    {
      v72 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v73 = self->_serverTrustCallbackQueue;
      self->_serverTrustCallbackQueue = v72;

      serverTrustCallbackQueue = self->_serverTrustCallbackQueue;
    }
    v74 = serverTrustCallbackQueue;
    v75 = _Block_copy(v70);
    [(NSMutableArray *)v74 addObject:v75];
  }
  else
  {
    (*((void (**)(void *))v69 + 2))(v69);
  }

  BOOL v39 = v87;
LABEL_137:

  CFRelease(v33);
}

uint64_t __95__NWURLSessionTask_loaderDidReceiveServerTrustChallenge_secProtocolMetadata_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95__NWURLSessionTask_loaderDidReceiveServerTrustChallenge_secProtocolMetadata_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_75;
  }
  if (*(void *)(v2 + 288) == 2)
  {
    objc_super v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_8;
  }
  id v3 = *(id *)(v2 + 392);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = v5 ? *(NSObject **)(v5 + 392) : 0;
    BOOL v7 = sec_protocol_metadata_peers_are_equal(v6, *(sec_protocol_metadata_t *)(a1 + 40));

    if (v7)
    {
      objc_super v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_8:
      v8();
      uint64_t v9 = *(void *)(a1 + 32);
      -[NWURLSessionTask performNextServerTrustChallenge](v9);
      return;
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    *(unsigned char *)(v10 + 18) = 1;
    uint64_t v11 = *(void **)(a1 + 32);
  }
  else
  {
LABEL_75:
    uint64_t v11 = 0;
  }
  double v12 = [v11 currentRequest];
  uint64_t v13 = [v12 URL];
  dispatch_time_t v14 = [v13 port];

  id v15 = [*(id *)(a1 + 32) clientMetadata];
  CFArrayRef v16 = *(void **)(a1 + 40);
  id v17 = v15;
  id v18 = v16;
  if (!v17)
  {
    id v43 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = "nw_http_client_metadata_set_sec_metadata";
    LODWORD(v58) = 12;
    uint64_t v57 = buf;
    os_log_type_t v44 = (char *)_os_log_send_and_compose_impl();

    v71[0] = OS_LOG_TYPE_ERROR;
    v69[0] = 0;
    if (!__nwlog_fault(v44, v71, v69)) {
      goto LABEL_73;
    }
    if (v71[0] == OS_LOG_TYPE_FAULT)
    {
      uint64_t v45 = __nwlog_obj();
      os_log_type_t v46 = v71[0];
      if (os_log_type_enabled(v45, v71[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "nw_http_client_metadata_set_sec_metadata";
        _os_log_impl(&dword_1830D4000, v45, v46, "%{public}s called with null metadata", buf, 0xCu);
      }
    }
    else if (v69[0])
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      uint64_t v45 = __nwlog_obj();
      os_log_type_t v50 = v71[0];
      BOOL v51 = os_log_type_enabled(v45, v71[0]);
      if (backtrace_string)
      {
        if (v51)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "nw_http_client_metadata_set_sec_metadata";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = backtrace_string;
          _os_log_impl(&dword_1830D4000, v45, v50, "%{public}s called with null metadata, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_73;
      }
      if (v51)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "nw_http_client_metadata_set_sec_metadata";
        _os_log_impl(&dword_1830D4000, v45, v50, "%{public}s called with null metadata, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v45 = __nwlog_obj();
      os_log_type_t v55 = v71[0];
      if (os_log_type_enabled(v45, v71[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "nw_http_client_metadata_set_sec_metadata";
        _os_log_impl(&dword_1830D4000, v45, v55, "%{public}s called with null metadata, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_72:

    goto LABEL_73;
  }
  id v19 = v17;
  id v20 = *((id *)v19 + 1);

  if (nw_protocol_copy_http_client_definition_onceToken != -1) {
    dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_72_75798);
  }
  BOOL is_equal_unsafe = nw_protocol_definition_is_equal_unsafe((uint64_t)v20, nw_protocol_copy_http_client_definition_definition);

  if (is_equal_unsafe)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&buf[16] = __nw_http_client_metadata_set_sec_metadata_block_invoke;
    os_log_type_t v63 = &unk_1E5248F68;
    id v22 = v18;
    id v64 = v22;
    uint64_t v23 = *((void *)v19 + 4);
    if (v23)
    {
      __nw_http_client_metadata_set_sec_metadata_block_invoke((uint64_t)buf, v23);
      id v22 = v64;
    }

    goto LABEL_20;
  }
  int64_t v47 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  *(void *)&uint8_t buf[4] = "nw_http_client_metadata_set_sec_metadata";
  LODWORD(v58) = 12;
  uint64_t v57 = buf;
  os_log_type_t v44 = (char *)_os_log_send_and_compose_impl();

  v71[0] = OS_LOG_TYPE_ERROR;
  v69[0] = 0;
  if (__nwlog_fault(v44, v71, v69))
  {
    if (v71[0] == OS_LOG_TYPE_FAULT)
    {
      uint64_t v45 = __nwlog_obj();
      os_log_type_t v48 = v71[0];
      if (os_log_type_enabled(v45, v71[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "nw_http_client_metadata_set_sec_metadata";
        _os_log_impl(&dword_1830D4000, v45, v48, "%{public}s metadata must be http_client", buf, 0xCu);
      }
    }
    else if (v69[0])
    {
      uint64_t v52 = (char *)__nw_create_backtrace_string();
      uint64_t v45 = __nwlog_obj();
      os_log_type_t v53 = v71[0];
      BOOL v54 = os_log_type_enabled(v45, v71[0]);
      if (v52)
      {
        if (v54)
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = "nw_http_client_metadata_set_sec_metadata";
          *(_WORD *)&buf[12] = 2082;
          *(void *)&buf[14] = v52;
          _os_log_impl(&dword_1830D4000, v45, v53, "%{public}s metadata must be http_client, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v52);
        if (!v44) {
          goto LABEL_20;
        }
        goto LABEL_74;
      }
      if (v54)
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "nw_http_client_metadata_set_sec_metadata";
        _os_log_impl(&dword_1830D4000, v45, v53, "%{public}s metadata must be http_client, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v45 = __nwlog_obj();
      os_log_type_t v56 = v71[0];
      if (os_log_type_enabled(v45, v71[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "nw_http_client_metadata_set_sec_metadata";
        _os_log_impl(&dword_1830D4000, v45, v56, "%{public}s metadata must be http_client, backtrace limit exceeded", buf, 0xCu);
      }
    }
    goto LABEL_72;
  }
LABEL_73:
  if (v44) {
LABEL_74:
  }
    free(v44);
LABEL_20:

  uint64_t v24 = *(void *)(a1 + 32);
  CFArrayRef v25 = *(void **)(a1 + 48);
  id v26 = *(void **)(a1 + 56);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __95__NWURLSessionTask_loaderDidReceiveServerTrustChallenge_secProtocolMetadata_completionHandler___block_invoke_3;
  v59[3] = &unk_1E52426A8;
  id v27 = *(id *)(a1 + 64);
  uint64_t v28 = *(void *)(a1 + 32);
  os_log_type_t v29 = *(void **)(a1 + 40);
  id v61 = v27;
  v59[4] = v28;
  id v60 = v29;
  uint64_t v30 = v25;
  id v31 = v26;
  id v32 = v14;
  uint64_t v33 = v59;
  if (v24)
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    __int16 v34 = (id)gurlLogObj;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      [(id)v24 logDescription];
      [(id)v24 logDescription];
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 16;
      *(_WORD *)&uint8_t buf[8] = 2098;
      *(void *)&buf[10] = v71;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v70;
      _os_log_impl(&dword_1830D4000, v34, OS_LOG_TYPE_INFO, "Task <%{public,uuid_t}.16P>.<%u> received server trust challenge", buf, 0x18u);
    }

    id v35 = objc_alloc(MEMORY[0x1E4F18D98]);
    if (v32) {
      uint64_t v36 = [v32 integerValue];
    }
    else {
      uint64_t v36 = 443;
    }
    BOOL v37 = objc_msgSend(v35, "initWithHost:port:protocol:realm:authenticationMethod:", v31, v36, *MEMORY[0x1E4F18CD8], 0, *MEMORY[0x1E4F18CB8], v57, v58);
    SecTrustRef v38 = sec_trust_copy_ref(v30);
    [v37 _setServerTrust:v38];
    CFRelease(v38);
    BOOL v39 = (void *)[objc_alloc(MEMORY[0x1E4F18D70]) initWithProtectionSpace:v37 proposedCredential:0 previousFailureCount:0 failureResponse:0 error:0 sender:0];
    if (*(double *)(v24 + 328) > 0.0)
    {
      uint64_t v40 = *(void *)(v24 + 336);
      if (v40)
      {
        if (*(void *)v40)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v40, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          *(void *)(v40 + 32) = -1;
          *(void *)(v40 + 40) = -1;
          if (*(unsigned char *)(v40 + 48) && *(unsigned char *)(v40 + 49)) {
            nw_queue_source_run_timer(v40);
          }
        }
      }
    }
    uint64_t v41 = 248;
    if (!*(void *)(v24 + 248)) {
      uint64_t v41 = 240;
    }
    uint64_t v42 = *(void *)(v24 + v41);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&buf[16] = __80__NWURLSessionTask_challengeDelegateForServerTrust_host_port_completionHandler___block_invoke;
    os_log_type_t v63 = &unk_1E5242680;
    id v64 = (id)v24;
    v65 = v30;
    id v66 = v31;
    id v67 = v32;
    BOOL v68 = v33;
    -[NWURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:](v42, (void *)v24, v39, buf);
  }
}

- (void)performNextServerTrustChallenge
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 18))
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      id v2 = (id)gurlLogObj;
      *(_DWORD *)buf = 136446466;
      id v17 = "-[NWURLSessionTask performNextServerTrustChallenge]";
      __int16 v18 = 2112;
      uint64_t v19 = a1;
      id v3 = (void *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v14 = 0;
      if (__nwlog_fault((const char *)v3, &type, &v14))
      {
        if (type == OS_LOG_TYPE_FAULT)
        {
          if (__nwlog_url_log::onceToken != -1) {
            dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
          }
          id v4 = (id)gurlLogObj;
          os_log_type_t v5 = type;
          if (os_log_type_enabled(v4, type))
          {
            *(_DWORD *)buf = 136446466;
            id v17 = "-[NWURLSessionTask performNextServerTrustChallenge]";
            __int16 v18 = 2112;
            uint64_t v19 = a1;
            id v6 = "%{public}s Already performing server trust challenge %@";
LABEL_30:
            uint64_t v11 = v4;
            os_log_type_t v12 = v5;
LABEL_31:
            _os_log_impl(&dword_1830D4000, v11, v12, v6, buf, 0x16u);
            goto LABEL_32;
          }
          goto LABEL_32;
        }
        if (!v14)
        {
          if (__nwlog_url_log::onceToken != -1) {
            dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
          }
          id v4 = (id)gurlLogObj;
          os_log_type_t v5 = type;
          if (os_log_type_enabled(v4, type))
          {
            *(_DWORD *)buf = 136446466;
            id v17 = "-[NWURLSessionTask performNextServerTrustChallenge]";
            __int16 v18 = 2112;
            uint64_t v19 = a1;
            id v6 = "%{public}s Already performing server trust challenge %@, backtrace limit exceeded";
            goto LABEL_30;
          }
LABEL_32:

          if (!v3) {
            return;
          }
LABEL_24:
          free(v3);
          return;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        if (__nwlog_url_log::onceToken != -1) {
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
        }
        id v4 = (id)gurlLogObj;
        os_log_type_t v9 = type;
        BOOL v10 = os_log_type_enabled(v4, type);
        if (!backtrace_string)
        {
          if (v10)
          {
            *(_DWORD *)buf = 136446466;
            id v17 = "-[NWURLSessionTask performNextServerTrustChallenge]";
            __int16 v18 = 2112;
            uint64_t v19 = a1;
            id v6 = "%{public}s Already performing server trust challenge %@, no backtrace";
            uint64_t v11 = v4;
            os_log_type_t v12 = v9;
            goto LABEL_31;
          }
          goto LABEL_32;
        }
        if (v10)
        {
          *(_DWORD *)buf = 136446722;
          id v17 = "-[NWURLSessionTask performNextServerTrustChallenge]";
          __int16 v18 = 2112;
          uint64_t v19 = a1;
          __int16 v20 = 2082;
          id v21 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v4, v9, "%{public}s Already performing server trust challenge %@, dumping backtrace:%{public}s", buf, 0x20u);
        }

        free(backtrace_string);
      }
      if (!v3) {
        return;
      }
      goto LABEL_24;
    }
    BOOL v7 = [*(id *)(a1 + 384) firstObject];
    if (v7)
    {
      uint64_t v13 = v7;
      [*(id *)(a1 + 384) removeObjectAtIndex:0];
      v13[2](v13);
      BOOL v7 = v13;
    }
  }
}

void __95__NWURLSessionTask_loaderDidReceiveServerTrustChallenge_secProtocolMetadata_completionHandler___block_invoke_3(uint64_t a1, char a2)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4
    && (objc_storeStrong((id *)(v4 + 392), *(id *)(a1 + 40)), (uint64_t v5 = *(void *)(a1 + 32)) != 0)
    && (*(unsigned char *)(v5 + 19) = a2, (uint64_t v6 = *(void *)(a1 + 32)) != 0))
  {
    *(unsigned char *)(v6 + 18) = 0;
    uint64_t v7 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v7 = 0;
  }

  -[NWURLSessionTask performNextServerTrustChallenge](v7);
}

void __80__NWURLSessionTask_challengeDelegateForServerTrust_host_port_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  uint64_t v6 = (id)gurlLogObj;
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    goto LABEL_10;
  }
  uint64_t v7 = *(void **)(a1 + 32);
  if (!v7)
  {
    v41[0] = 0;
    v41[1] = 0;
    int v42 = 0;
    goto LABEL_8;
  }
  [v7 logDescription];
  objc_super v8 = *(void **)(a1 + 32);
  if (!v8)
  {
LABEL_8:
    int v9 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    int v40 = 0;
    goto LABEL_9;
  }
  [v8 logDescription];
  int v9 = v40;
LABEL_9:
  *(_DWORD *)buf = 68289794;
  *(_DWORD *)&uint8_t buf[4] = 16;
  *(_WORD *)os_log_type_t v44 = 2098;
  *(void *)&v44[2] = v41;
  __int16 v45 = 1024;
  int v46 = v9;
  __int16 v47 = 2048;
  uint64_t v48 = a2;
  __int16 v49 = 1024;
  BOOL v50 = v5 != 0;
  _os_log_impl(&dword_1830D4000, v6, OS_LOG_TYPE_INFO, "Task <%{public,uuid_t}.16P>.<%u> responding to server trust challenge {disposition=%ld, credential=%{BOOL}d}", buf, 0x28u);
LABEL_10:

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10)
  {
    double v11 = *(double *)(v10 + 328);
    if (v11 > 0.0)
    {
      uint64_t v12 = *(void *)(v10 + 336);
      if (v12)
      {
        dispatch_time_t v13 = dispatch_time(0x8000000000000000, (uint64_t)(v11 * 1000000000.0));
        if (*(void *)v12)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          *(void *)(v12 + 32) = v13;
          *(void *)(v12 + 40) = -1;
          if (*(unsigned char *)(v12 + 48) && *(unsigned char *)(v12 + 49)) {
            nw_queue_source_run_timer(v12);
          }
        }
      }
    }
  }
  switch(a2)
  {
    case 0:
      if (!v5) {
        goto LABEL_16;
      }
      char v14 = sec_trust_copy_ref(*(sec_trust_t *)(a1 + 40));
      CFDataRef v20 = SecTrustCopyExceptions(v14);
      CFArrayRef v16 = (id *)v20;
      if (v20)
      {
        uint64_t v21 = *(void *)(a1 + 32);
        if (v21)
        {
          uint64_t v22 = *(void *)(v21 + 400);
          if (v22)
          {
            uint64_t v24 = *(void *)(a1 + 48);
            uint64_t v23 = *(void *)(a1 + 56);
            CFArrayRef v25 = NSString;
            CFDataRef v26 = v20;
            id v27 = [v25 stringWithFormat:@"%@ %@", v24, v23];
            [*(id *)(v22 + 120) setObject:v26 forKeyedSubscript:v27];
          }
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      goto LABEL_31;
    case 1:
    case 3:
LABEL_16:
      char v14 = sec_trust_copy_ref(*(sec_trust_t *)(a1 + 40));
      uint64_t v15 = *(void *)(a1 + 32);
      if (v15)
      {
        CFArrayRef v16 = *(id **)(v15 + 400);
        if (v16)
        {
          id v17 = [NSString stringWithFormat:@"%@ %@", *(void *)(a1 + 48), *(void *)(a1 + 56)];
          CFArrayRef v16 = [v16[15] objectForKeyedSubscript:v17];

          if (v16) {
            SecTrustSetExceptions(v14, (CFDataRef)v16);
          }
        }
        uint64_t v18 = *(void *)(a1 + 32);
        if (v18) {
          goto LABEL_21;
        }
      }
      else
      {
        CFArrayRef v16 = 0;
        uint64_t v18 = *(void *)(a1 + 32);
        if (v18)
        {
LABEL_21:
          uint64_t v19 = *(NSObject **)(v18 + 232);
          goto LABEL_22;
        }
      }
      uint64_t v19 = 0;
LABEL_22:
      result[0] = MEMORY[0x1E4F143A8];
      result[1] = 3221225472;
      result[2] = __80__NWURLSessionTask_challengeDelegateForServerTrust_host_port_completionHandler___block_invoke_38;
      result[3] = &unk_1E5242658;
      id v37 = *(id *)(a1 + 64);
      if (SecTrustEvaluateAsyncWithError(v14, v19, result)) {
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }

LABEL_31:
      CFRelease(v14);

LABEL_39:
      return;
    case 2:
      uint64_t v28 = *(id **)(a1 + 32);
      if (v28)
      {
        os_log_type_t v29 = [NWURLError alloc];
        id v30 = v28[33];
        id v31 = v28;
        if (v29)
        {
          uint64_t v32 = *MEMORY[0x1E4F289A0];
          *(void *)buf = v29;
          *(void *)os_log_type_t v44 = NWURLError;
          uint64_t v33 = [(uint8_t *)(objc_super *)buf initWithDomain:v32 code:-999 userInfo:0];
          os_log_type_t v29 = (NWURLError *)v33;
          if (v33) {
            [(uint8_t *)v33 fillErrorForLoader:v30 andTask:v31];
          }
        }

        id v35 = *(void **)(a1 + 32);
        if (v35) {
          objc_setProperty_atomic_copy(v35, v34, v29, 136);
        }
      }
      else
      {
        os_log_type_t v29 = 0;
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      goto LABEL_39;
    default:
      goto LABEL_39;
  }
}

uint64_t __80__NWURLSessionTask_challengeDelegateForServerTrust_host_port_completionHandler___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loaderDidReceiveInformationalResponse:(id)a3
{
  if (self)
  {
    uint64_t v5 = 248;
    if (!self->_internalDelegateWrapper) {
      uint64_t v5 = 240;
    }
    id v6 = *(id *)((char *)&self->super.isa + v5);
    -[NWURLSessionDelegateWrapper task:didReceiveInformationalResponse:]((uint64_t)v6, self, a3);
  }
  else
  {
    -[NWURLSessionDelegateWrapper task:didReceiveInformationalResponse:](0, 0, a3);
    id v6 = 0;
  }
}

- (void)loaderWillPerformHTTPRedirection:(id)a3 newRequest:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  double v11 = (id)gurlLogObj;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    [(NWURLSessionTask *)self logDescription];
    [(NWURLSessionTask *)self logDescription];
    int v12 = (unsigned __int16)[v8 statusCode];
    if (self) {
      unint64_t redirectCount = self->_redirectCount;
    }
    else {
      unint64_t redirectCount = 0;
    }
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&uint8_t buf[4] = 16;
    *(_WORD *)uint64_t v28 = 2098;
    *(void *)&v28[2] = &v26;
    __int16 v29 = 1024;
    int v30 = v25;
    __int16 v31 = 1024;
    int v32 = v12;
    __int16 v33 = 2048;
    unint64_t v34 = redirectCount;
    _os_log_impl(&dword_1830D4000, v11, OS_LOG_TYPE_INFO, "Task <%{public,uuid_t}.16P>.<%u> will perform redirect {status=%hu, previous_redirects=%zu}", buf, 0x28u);
  }

  if (!self)
  {
    id v22 = 0;
LABEL_20:
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __82__NWURLSessionTask_loaderWillPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
    v23[3] = &unk_1E5248BB0;
    v23[4] = self;
    id v24 = v10;
    -[NWURLSessionDelegateWrapper task:willPerformHTTPRedirection:newRequest:completionHandler:]((uint64_t)v22, self, v8, v9, v23);

    goto LABEL_21;
  }
  unint64_t v14 = self->_redirectCount + 1;
  self->_unint64_t redirectCount = v14;
  if (v14 < 0x15)
  {
    if (self->_timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)-1;
          requestTimeoutTimer[5] = (dispatch_source_t)-1;
          if (*((unsigned char *)requestTimeoutTimer + 48) && *((unsigned char *)requestTimeoutTimer + 49)) {
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer);
          }
        }
      }
    }
    uint64_t v21 = 248;
    if (!self->_internalDelegateWrapper) {
      uint64_t v21 = 240;
    }
    id v22 = *(id *)((char *)&self->super.isa + v21);
    goto LABEL_20;
  }
  uint64_t v15 = [NWURLError alloc];
  CFArrayRef v16 = self->_loader;
  id v17 = self;
  if (v15)
  {
    uint64_t v18 = *MEMORY[0x1E4F289A0];
    *(void *)buf = v15;
    *(void *)uint64_t v28 = NWURLError;
    uint64_t v19 = [(uint8_t *)(objc_super *)buf initWithDomain:v18 code:-1007 userInfo:0];
    uint64_t v15 = (NWURLError *)v19;
    if (v19) {
      [(uint8_t *)v19 fillErrorForLoader:v16 andTask:v17];
    }
  }

  [(NWURLSessionTask *)v17 completeTaskWithError:v15];
  (*((void (**)(id, void))v10 + 2))(v10, 0);
LABEL_21:
}

void __82__NWURLSessionTask_loaderWillPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  uint64_t v4 = (id)gurlLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5)
    {
      [v5 logDescription];
      id v6 = *(void **)(a1 + 32);
      if (v6)
      {
        [v6 logDescription];
        int v7 = v36;
LABEL_9:
        *(_DWORD *)buf = 68289538;
        int v41 = 16;
        __int16 v42 = 2098;
        id v43 = &v37;
        __int16 v44 = 1024;
        int v45 = v7;
        __int16 v46 = 1024;
        BOOL v47 = v3 != 0;
        _os_log_impl(&dword_1830D4000, v4, OS_LOG_TYPE_INFO, "Task <%{public,uuid_t}.16P>.<%u> performing redirect {take=%{BOOL}d}", buf, 0x1Eu);
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      LODWORD(v39) = 0;
    }
    int v7 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    LODWORD(v36) = 0;
    goto LABEL_9;
  }
LABEL_10:

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    if (*(void *)(v12 + 288) == 2)
    {
LABEL_29:
      (*(void (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v8, v9, v10, v11);
      goto LABEL_30;
    }
    double v13 = *(double *)(v12 + 328);
    if (v13 > 0.0)
    {
      uint64_t v14 = *(void *)(v12 + 336);
      if (v14)
      {
        dispatch_time_t v15 = dispatch_time(0x8000000000000000, (uint64_t)(v13 * 1000000000.0));
        if (*(void *)v14)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          *(void *)(v14 + 32) = v15;
          *(void *)(v14 + 40) = -1;
          if (*(unsigned char *)(v14 + 48) && *(unsigned char *)(v14 + 49)) {
            nw_queue_source_run_timer(v14);
          }
        }
      }
    }
  }
  if (!v3) {
    goto LABEL_29;
  }
  CFArrayRef v16 = *(void **)(a1 + 32);
  if (v16) {
    CFArrayRef v16 = (void *)v16[33];
  }
  uint64_t v21 = v16;
  uint64_t v22 = *(void *)(a1 + 32);
  if (v22)
  {
    uint64_t v23 = *(void **)(v22 + 264);
    *(void *)(v22 + 264) = 0;
  }
  (*(void (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v17, v18, v19, v20);
  [v21 stop];
  int v25 = *(void **)(a1 + 32);
  if (v25) {
    objc_setProperty_nonatomic_copy(v25, v24, v3, 56);
  }
  char v26 = objc_msgSend(v3, "HTTPMethod", v34, v35, v36, v37, v38, v39);
  uint64_t v27 = [v26 caseInsensitiveCompare:@"GET"];

  if (!v27
    || ([v3 HTTPMethod],
        int v32 = objc_claimAutoreleasedReturnValue(),
        uint64_t v33 = [v32 caseInsensitiveCompare:@"HEAD"],
        v32,
        !v33))
  {
    uint64_t v28 = *(void *)(a1 + 32);
    if (!v28)
    {
LABEL_36:
      __int16 v31 = 0;
      goto LABEL_28;
    }
    __int16 v29 = *(void **)(v28 + 416);
    *(void *)(v28 + 416) = 0;
  }
  uint64_t v30 = *(void *)(a1 + 32);
  if (!v30) {
    goto LABEL_36;
  }
  __int16 v31 = *(void **)(v30 + 256);
LABEL_28:
  nw_http_client_metadata_create_next_transaction(v31, 1);
  [*(id *)(a1 + 32) startNextLoad:0];

LABEL_30:
}

- (void)loaderWillPerformHTTPRedirection:(id)a3 newRequest:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  uint64_t v8 = (id)gurlLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    [(NWURLSessionTask *)self logDescription];
    [(NWURLSessionTask *)self logDescription];
    int v9 = (unsigned __int16)[v6 statusCode];
    if (self) {
      unint64_t redirectCount = self->_redirectCount;
    }
    else {
      unint64_t redirectCount = 0;
    }
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&uint8_t buf[4] = 16;
    *(_WORD *)id v24 = 2098;
    *(void *)&v24[2] = &v22;
    __int16 v25 = 1024;
    int v26 = v21;
    __int16 v27 = 1024;
    int v28 = v9;
    __int16 v29 = 2048;
    unint64_t v30 = redirectCount;
    _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_INFO, "Task <%{public,uuid_t}.16P>.<%u> will perform redirect {status=%hu, previous_redirects=%zu}", buf, 0x28u);
  }

  if (!self)
  {
    id v19 = 0;
LABEL_20:
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __64__NWURLSessionTask_loaderWillPerformHTTPRedirection_newRequest___block_invoke;
    v20[3] = &unk_1E5242630;
    v20[4] = self;
    -[NWURLSessionDelegateWrapper task:willPerformHTTPRedirection:newRequest:completionHandler:]((uint64_t)v19, self, v6, v7, v20);

    goto LABEL_21;
  }
  unint64_t v11 = self->_redirectCount + 1;
  self->_unint64_t redirectCount = v11;
  if (v11 < 0x15)
  {
    if (self->_timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)-1;
          requestTimeoutTimer[5] = (dispatch_source_t)-1;
          if (*((unsigned char *)requestTimeoutTimer + 48) && *((unsigned char *)requestTimeoutTimer + 49)) {
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer);
          }
        }
      }
    }
    uint64_t v18 = 248;
    if (!self->_internalDelegateWrapper) {
      uint64_t v18 = 240;
    }
    id v19 = *(id *)((char *)&self->super.isa + v18);
    goto LABEL_20;
  }
  uint64_t v12 = [NWURLError alloc];
  double v13 = self->_loader;
  uint64_t v14 = self;
  if (v12)
  {
    uint64_t v15 = *MEMORY[0x1E4F289A0];
    *(void *)buf = v12;
    *(void *)id v24 = NWURLError;
    CFArrayRef v16 = [(uint8_t *)(objc_super *)buf initWithDomain:v15 code:-1007 userInfo:0];
    uint64_t v12 = (NWURLError *)v16;
    if (v16) {
      [(uint8_t *)v16 fillErrorForLoader:v13 andTask:v14];
    }
  }

  [(NWURLSessionTask *)v14 completeTaskWithError:v12];
LABEL_21:
}

void __64__NWURLSessionTask_loaderWillPerformHTTPRedirection_newRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  uint64_t v4 = (id)gurlLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5)
    {
      [v5 logDescription];
      id v6 = *(void **)(a1 + 32);
      if (v6)
      {
        [v6 logDescription];
        int v7 = v26;
LABEL_9:
        *(_DWORD *)buf = 68289538;
        int v31 = 16;
        __int16 v32 = 2098;
        uint64_t v33 = &v27;
        __int16 v34 = 1024;
        int v35 = v7;
        __int16 v36 = 1024;
        BOOL v37 = v3 != 0;
        _os_log_impl(&dword_1830D4000, v4, OS_LOG_TYPE_INFO, "Task <%{public,uuid_t}.16P>.<%u> performing redirect {take=%{BOOL}d}", buf, 0x1Eu);
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      LODWORD(v29) = 0;
    }
    int v7 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    LODWORD(v26) = 0;
    goto LABEL_9;
  }
LABEL_10:

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    if (*(void *)(v8 + 288) == 2) {
      goto LABEL_28;
    }
    double v9 = *(double *)(v8 + 328);
    if (v9 > 0.0)
    {
      uint64_t v10 = *(void *)(v8 + 336);
      if (v10)
      {
        dispatch_time_t v11 = dispatch_time(0x8000000000000000, (uint64_t)(v9 * 1000000000.0));
        if (*(void *)v10)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          *(void *)(v10 + 32) = v11;
          *(void *)(v10 + 40) = -1;
          if (*(unsigned char *)(v10 + 48) && *(unsigned char *)(v10 + 49)) {
            nw_queue_source_run_timer(v10);
          }
        }
      }
    }
  }
  if (v3)
  {
    uint64_t v12 = *(void **)(a1 + 32);
    if (v12) {
      uint64_t v12 = (void *)v12[33];
    }
    double v13 = v12;
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14)
    {
      uint64_t v15 = *(void **)(v14 + 264);
      *(void *)(v14 + 264) = 0;
    }
    objc_msgSend(v13, "stop", v24, v25, v26, v27, v28, v29);
    uint64_t v17 = *(void **)(a1 + 32);
    if (v17) {
      objc_setProperty_nonatomic_copy(v17, v16, v3, 56);
    }
    uint64_t v18 = [v3 HTTPMethod];
    uint64_t v19 = [v18 caseInsensitiveCompare:@"GET"];

    if (v19)
    {
      char v22 = [v3 HTTPMethod];
      uint64_t v23 = [v22 caseInsensitiveCompare:@"HEAD"];

      uint64_t v20 = *(void **)(a1 + 32);
      if (v23)
      {
LABEL_27:
        [v20 startNextLoad:0];

        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v20 = *(void **)(a1 + 32);
    }
    if (v20)
    {
      int v21 = (void *)v20[52];
      v20[52] = 0;

      uint64_t v20 = *(void **)(a1 + 32);
    }
    goto LABEL_27;
  }
LABEL_28:
}

- (void)loaderWillPerformHSTSUpgrade:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  uint64_t v5 = (id)gurlLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [(NWURLSessionTask *)self logDescription];
    [(NWURLSessionTask *)self logDescription];
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)&uint8_t buf[4] = 16;
    LOWORD(v42) = 2098;
    *(void *)((char *)&v42 + 2) = &v40;
    WORD5(v42) = 1024;
    HIDWORD(v42) = v39;
    LOWORD(v43) = 1024;
    *(_DWORD *)((char *)&v43 + 2) = v3;
    _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> scheme upgraded to https by HSTS {preload=%{BOOL}d}", buf, 0x1Eu);
  }

  id v6 = [(NWURLSessionTask *)self currentRequest];
  int v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = (void *)MEMORY[0x1E4F29088];
  double v9 = [v7 URL];
  uint64_t v10 = [v8 componentsWithURL:v9 resolvingAgainstBaseURL:0];

  [v10 setScheme:@"https"];
  dispatch_time_t v11 = [v10 URL];
  [v7 setURL:v11];

  [v7 _setSchemeWasUpgradedDueToDynamicHSTS:!v3];
  if (self)
  {
    uint64_t v12 = self->_loader;
    loader = self->_loader;
    self->_loader = 0;

    [(NWURLLoader *)v12 stop];
    if (self->_timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)-1;
          requestTimeoutTimer[5] = (dispatch_source_t)-1;
          if (*((unsigned char *)requestTimeoutTimer + 48) && *((unsigned char *)requestTimeoutTimer + 49)) {
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer);
          }
        }
      }
    }
    uint64_t v15 = 248;
    if (!self->_internalDelegateWrapper) {
      uint64_t v15 = 240;
    }
    CFArrayRef v16 = (id *)*(id *)((char *)&self->super.isa + v15);
  }
  else
  {
    [0 stop];
    uint64_t v12 = 0;
    CFArrayRef v16 = 0;
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  __int16 v36 = __49__NWURLSessionTask_loaderWillPerformHSTSUpgrade___block_invoke;
  BOOL v37 = &unk_1E5242630;
  uint64_t v38 = self;
  uint64_t v17 = self;
  id v18 = v7;
  uint64_t v20 = v35;
  if (v16)
  {
    int v21 = [(NWURLSessionDelegateWrapper *)v16 delegateFor__schemeUpgraded];
    if (v21)
    {
      uint64_t v33 = v12;
      __int16 v34 = v10;
      id v22 = v16[4];
      id v23 = v16[5];
      uint64_t v24 = [NWURLSessionDelegateDeallocBomb alloc];
      id v25 = v21;
      if (v24)
      {
        *(void *)buf = v24;
        *(void *)&long long v42 = NWURLSessionDelegateDeallocBomb;
        id v26 = [(uint8_t *)(objc_super *)buf init];
        uint64_t v27 = v26;
        if (v26)
        {
          objc_storeStrong((id *)v26 + 2, v21);
          if (sel_task__schemeUpgraded_completionHandler_) {
            uint64_t v28 = sel_task__schemeUpgraded_completionHandler_;
          }
          else {
            uint64_t v28 = 0;
          }
          v27[3] = v28;
        }
      }
      else
      {
        uint64_t v27 = 0;
      }

      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&long long v42 = 3221225472;
      *((void *)&v42 + 1) = __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke;
      id v43 = &unk_1E52498E0;
      id v44 = v25;
      id v45 = v22;
      __int16 v46 = v17;
      id v47 = v18;
      id v48 = v27;
      id v49 = v23;
      BOOL v50 = v20;
      uint64_t v29 = v16[6];
      id v30 = v23;
      int v31 = v27;
      id v32 = v22;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v29, buf);

      uint64_t v12 = v33;
      uint64_t v10 = v34;
    }
    else
    {
      v36((uint64_t)v20, v18);
    }
  }
}

void __49__NWURLSessionTask_loaderWillPerformHSTSUpgrade___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id newValue = v3;
  if (v5)
  {
    if (*(void *)(v5 + 288) == 2) {
      goto LABEL_29;
    }
    double v6 = *(double *)(v5 + 328);
    if (v6 > 0.0)
    {
      uint64_t v7 = *(void *)(v5 + 336);
      if (v7)
      {
        uint64_t v4 = (const char *)dispatch_time(0x8000000000000000, (uint64_t)(v6 * 1000000000.0));
        if (*(void *)v7)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v7, (dispatch_time_t)v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
LABEL_7:
          id v3 = newValue;
          goto LABEL_8;
        }
        *(void *)(v7 + 32) = v4;
        *(void *)(v7 + 40) = -1;
        id v3 = newValue;
        if (*(unsigned char *)(v7 + 48) && *(unsigned char *)(v7 + 49))
        {
          nw_queue_source_run_timer(v7);
          goto LABEL_7;
        }
      }
    }
LABEL_8:
    uint64_t v8 = *(id **)(a1 + 32);
    if (v3) {
      goto LABEL_9;
    }
LABEL_22:
    if (v8)
    {
      uint64_t v15 = [NWURLError alloc];
      id v16 = v8[33];
      uint64_t v17 = v8;
      if (v15)
      {
        uint64_t v18 = *MEMORY[0x1E4F289A0];
        v21.receiver = v15;
        v21.super_class = (Class)NWURLError;
        uint64_t v19 = (NWURLError *)objc_msgSendSuper2(&v21, sel_initWithDomain_code_userInfo_, v18, -999, 0);
        uint64_t v15 = v19;
        if (v19) {
          [(NWURLError *)v19 fillErrorForLoader:v16 andTask:v17];
        }
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    [v8 completeTaskWithError:v15];

    goto LABEL_28;
  }
  uint64_t v8 = 0;
  if (!v3) {
    goto LABEL_22;
  }
LABEL_9:
  if (v8)
  {
    objc_setProperty_nonatomic_copy(v8, v4, newValue, 56);
    id v3 = newValue;
  }
  double v9 = [v3 HTTPMethod];
  uint64_t v10 = [v9 caseInsensitiveCompare:@"GET"];

  if (!v10)
  {
    dispatch_time_t v11 = *(void **)(a1 + 32);
    goto LABEL_13;
  }
  double v13 = [newValue HTTPMethod];
  uint64_t v14 = [v13 caseInsensitiveCompare:@"HEAD"];

  dispatch_time_t v11 = *(void **)(a1 + 32);
  if (!v14)
  {
LABEL_13:
    if (v11)
    {
      uint64_t v12 = (void *)v11[52];
      v11[52] = 0;

      dispatch_time_t v11 = *(void **)(a1 + 32);
    }
  }
  [v11 startNextLoad:0];
LABEL_28:
  id v3 = newValue;
LABEL_29:
}

- (void)loaderFailedToConnect:(id)a3
{
  id v5 = a3;
  if (self)
  {
    configuration = self->_configuration;
    if (configuration)
    {
      if ([(NWURLSessionTask *)configuration->_task _preconnect]) {
        [(NWURLSessionTask *)self completeTaskWithError:v5];
      }
    }
  }
}

- (void)loaderConnectedWithHTTPConnectionMetadata:(id)a3 CNAMEChain:(id)a4 unlistedTracker:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self)
  {
    startTimeoutTimer = self->_startTimeoutTimer;
    if (startTimeoutTimer)
    {
      self->_startTimeoutTimer = 0;
      nw_queue_cancel_source((uint64_t)startTimeoutTimer);
    }
    double v13 = [(NWURLSessionTask *)self currentRequest];
    [v13 _payloadTransmissionTimeout];
    double v15 = v14;

    if (v15 > 0.0 && !self->_payloadTimeoutTimer) {
      self->_payloadTimeoutTimer = (void *)-[NWURLSessionTask createTimerWithTimeout:]((uint64_t)self, v15);
    }
    if (objc_getProperty(self, v16, 304, 1))
    {
      uint64_t v18 = [_NWHTTPConnectionInfo alloc];
      uint64_t v19 = 248;
      if (!self->_internalDelegateWrapper) {
        uint64_t v19 = 240;
      }
      uint64_t v20 = *(Class *)((char *)&self->super.isa + v19);
      id v21 = v20;
      id v22 = v9;
      id v23 = v21;
      if (v18)
      {
        v33.receiver = v18;
        v33.super_class = (Class)_NWHTTPConnectionInfo;
        id v24 = [(NWURLSessionTask *)&v33 init];
        uint64_t v18 = (_NWHTTPConnectionInfo *)v24;
        if (v24)
        {
          objc_storeStrong((id *)v24 + 1, a3);
          objc_storeStrong((id *)&v18->_delegateWrapper, v20);
        }
      }

      Property = (void (**)(id, _NWHTTPConnectionInfo *))objc_getProperty(self, v25, 304, 1);
      Property[2](Property, v18);
    }
    objc_setProperty_atomic(self, v17, v10, 192);
    if (v11)
    {
      backtrace = self->_backtrace;
      if (backtrace)
      {
        uint64_t v28 = backtrace;
        id v29 = v11;
        [v29 UTF8String];
        [(NSData *)v28 bytes];
        [(NSData *)v28 length];
        ne_tracker_create_xcode_issue();
      }
    }
    configuration = self->_configuration;
    if (configuration && [(NWURLSessionTask *)configuration->_task _preconnect])
    {
      responseConsumer = self->_responseConsumer;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __89__NWURLSessionTask_loaderConnectedWithHTTPConnectionMetadata_CNAMEChain_unlistedTracker___block_invoke;
      v32[3] = &unk_1E5242A48;
      v32[4] = self;
      [(NWURLSessionResponseConsumer *)responseConsumer task:self deliverData:0 complete:1 error:0 completionHandler:v32];
    }
  }
}

void __89__NWURLSessionTask_loaderConnectedWithHTTPConnectionMetadata_CNAMEChain_unlistedTracker___block_invoke(uint64_t a1)
{
}

- (void)complete
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 312));
    uint64_t v2 = *(void *)(a1 + 336);
    if (v2)
    {
      *(void *)(a1 + 336) = 0;
      nw_queue_cancel_source(v2);
    }
    uint64_t v3 = *(void *)(a1 + 320);
    if (v3)
    {
      *(void *)(a1 + 320) = 0;
      nw_queue_cancel_source(v3);
    }
    uint64_t v4 = *(void *)(a1 + 352);
    if (v4)
    {
      *(void *)(a1 + 352) = 0;
      nw_queue_cancel_source(v4);
    }
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5)
    {
      *(void *)(a1 + 344) = 0;
      nw_queue_cancel_source(v5);
    }
    -[NWURLSessionTask finishProgressReporting](a1);
    *(void *)(a1 + 288) = 2;
    [*(id *)(a1 + 264) stop];
    double v6 = *(void **)(a1 + 264);
    *(void *)(a1 + 264) = 0;

    uint64_t v7 = [(id)a1 error];
    v107 = v7;
    if (v7)
    {
      os_log_type_t v8 = 16 * ([v7 code] != -999);
      uint64_t v9 = *(void *)(a1 + 408);
      if (v9) {
        unsigned int v10 = [*(id *)(v9 + 16) _loggingPrivacyLevel];
      }
      else {
        unsigned int v10 = 0;
      }
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      id v11 = (id)gurlLogObj;
      BOOL v12 = os_log_type_enabled(v11, v8);
      if (v10 > 2)
      {
        if (v12)
        {
          [(id)a1 logDescription];
          [(id)a1 logDescription];
          uint64_t v18 = [v107 code];
          *(_DWORD *)buf = 68289795;
          *(_DWORD *)&uint8_t buf[4] = 16;
          *(_WORD *)&uint8_t buf[8] = 2098;
          *(void *)&buf[10] = &v120;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v119;
          *(_WORD *)v126 = 2048;
          *(void *)&v126[2] = v18;
          *(_WORD *)&v126[10] = 2117;
          *(void *)&v126[12] = v107;
          double v14 = "Task <%{public,uuid_t}.16P>.<%u> finished with error [%ld] %{sensitive}@";
          goto LABEL_24;
        }
      }
      else if (v12)
      {
        [(id)a1 logDescription];
        [(id)a1 logDescription];
        uint64_t v13 = [v107 code];
        *(_DWORD *)buf = 68289794;
        *(_DWORD *)&uint8_t buf[4] = 16;
        *(_WORD *)&uint8_t buf[8] = 2098;
        *(void *)&buf[10] = &v122;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v121;
        *(_WORD *)v126 = 2048;
        *(void *)&v126[2] = v13;
        *(_WORD *)&v126[10] = 2112;
        *(void *)&v126[12] = v107;
        double v14 = "Task <%{public,uuid_t}.16P>.<%u> finished with error [%ld] %@";
LABEL_24:
        double v15 = v11;
        os_log_type_t v16 = v8;
        uint32_t v17 = 44;
        goto LABEL_25;
      }
    }
    else
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      id v11 = (id)gurlLogObj;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        [(id)a1 logDescription];
        [(id)a1 logDescription];
        *(_DWORD *)buf = 68289282;
        *(_DWORD *)&uint8_t buf[4] = 16;
        *(_WORD *)&uint8_t buf[8] = 2098;
        *(void *)&buf[10] = &v124;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v123;
        double v14 = "Task <%{public,uuid_t}.16P>.<%u> finished successfully";
        double v15 = v11;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        uint32_t v17 = 24;
LABEL_25:
        _os_log_impl(&dword_1830D4000, v15, v16, v14, buf, v17);
      }
    }

    uint64_t v20 = -[NWURLSessionTaskConfiguration activity](*(void *)(a1 + 408));
    uint64_t v21 = *(void *)(a1 + 408);
    if (v21)
    {
      id v22 = -[NWURLSessionTaskConfiguration activity](*(void *)(a1 + 408));
      id v23 = objc_msgSend(*(id *)(v21 + 24), "_nw_activity");
      BOOL v24 = v22 == v23;

      if (!v24)
      {
        if (v107)
        {
          if ([v107 code] == -999) {
            uint32_t v25 = 4;
          }
          else {
            uint32_t v25 = 3;
          }
        }
        else
        {
          uint32_t v25 = 2;
        }
        nw_activity_complete_with_reason_and_underlying_error(v20, v25, 1, [v107 code]);
      }
    }
    Property = (id *)objc_getProperty((id)a1, v19, 440, 1);
    self = (os_unfair_lock_s **)(id)a1;
    id v27 = v20;
    uint64_t v28 = v27;
    if (!Property || !nw_activity_is_selected_for_reporting(v27)) {
      goto LABEL_105;
    }
    id v29 = Property[2];
    id v30 = v29;
    v106 = v28;
    if (v29)
    {
      int v31 = nw_protocol_metadata_copy_definition(v29);
      if (nw_protocol_copy_http_client_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_72_75798);
      }
      BOOL is_equal = nw_protocol_definition_is_equal(v31, (nw_protocol_definition_t)nw_protocol_copy_http_client_definition_definition);

      if (is_equal)
      {
        *(void *)uuid_string_t out = 0;
        *(void *)&out[8] = out;
        *(void *)&out[16] = 0x2020000000;
        *(void *)&out[24] = 0;
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&buf[16] = __nw_http_client_metadata_get_transaction_count_block_invoke;
        *(void *)v126 = &unk_1E5248E90;
        *(void *)&v126[8] = out;
        uint64_t isa = (uint64_t)v30[4].isa;
        if (isa)
        {
          __nw_http_client_metadata_get_transaction_count_block_invoke((uint64_t)buf, isa);
          uint64_t v103 = *(void *)(*(void *)&out[8] + 24);
        }
        else
        {
          uint64_t v103 = 0;
        }
        _Block_object_dispose(out, 8);

        size_t v34 = 120 * v103 + 104;
        if (120 * v103 == -104)
        {
          id v86 = __nwlog_obj();
          os_log_type_enabled(v86, OS_LOG_TYPE_ERROR);
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = "strict_calloc";
          LODWORD(v101) = 12;
          v100 = buf;
          id v87 = (void *)_os_log_send_and_compose_impl();

          if (__nwlog_abort((uint64_t)v87)) {
            goto LABEL_148;
          }
          free(v87);
          size_t v34 = 0;
        }
LABEL_44:
        int v35 = (char *)malloc_type_calloc(1uLL, v34, 0xEAFB8F1AuLL);
        if (v35) {
          goto LABEL_45;
        }
        v88 = __nwlog_obj();
        os_log_type_enabled(v88, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "strict_calloc";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = 1;
        *(_WORD *)&buf[22] = 2048;
        *(void *)v126 = v34;
        LODWORD(v101) = 32;
        v100 = buf;
        id v89 = (void *)_os_log_send_and_compose_impl();

        if (!__nwlog_abort((uint64_t)v89))
        {
          free(v89);
LABEL_45:
          uint64_t start_time = nw_http_client_metadata_get_start_time(Property[2]);
          unsigned int v37 = dword_1EB267624;
          if (!dword_1EB267624)
          {
            mach_timebase_info((mach_timebase_info_t)&time_base);
            unsigned int v37 = dword_1EB267624;
          }
          uint64_t v38 = time_base;
          *(void *)int v35 = 0;
          uint64_t end_time = nw_http_client_metadata_get_end_time(Property[2]);
          unint64_t v40 = (start_time * v38 / (unint64_t)v37 * (unsigned __int128)0x431BDE82D7B634DBuLL) >> 64;
          if (!end_time)
          {
            uint64_t v41 = mach_continuous_time();
            if (v41 <= 1) {
              uint64_t end_time = 1;
            }
            else {
              uint64_t end_time = v41;
            }
          }
          unint64_t v42 = v40 >> 18;
          unsigned int v43 = dword_1EB267624;
          if (!dword_1EB267624)
          {
            mach_timebase_info((mach_timebase_info_t)&time_base);
            unsigned int v43 = dword_1EB267624;
          }
          *((void *)v35 + 1) = end_time * (unint64_t)time_base / v43 / 0xF4240 - v42;
          id v44 = objc_msgSend(self, "error", v100, v101);
          *((void *)v35 + 3) = [v44 code];
          id v45 = [v44 userInfo];
          v105 = [v45 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

          *((void *)v35 + 4) = [v105 code];
          nw_activity_get_token(v106, (_OWORD *)v35 + 4);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            __int16 v46 = v44;
            int v47 = 3;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              __int16 v46 = v44;
              int v47 = 2;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                __int16 v46 = v44;
                int v47 = 4;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  __int16 v46 = v44;
                  int v47 = 5;
                }
                else
                {
                  objc_opt_class();
                  __int16 v46 = v44;
                  if (objc_opt_isKindOfClass()) {
                    int v47 = 6;
                  }
                  else {
                    int v47 = 1;
                  }
                }
              }
            }
          }
          *((_DWORD *)v35 + 24) = v47;
          *((_WORD *)v35 + 50) = 256;
          v35[102] = 0;
          uint64_t v115 = 0;
          v116 = &v115;
          uint64_t v117 = 0x2020000000;
          uint64_t v118 = 0;
          uint64_t v111 = 0;
          v112 = &v111;
          uint64_t v113 = 0x2020000000;
          uint64_t v114 = 0;
          v110[0] = 0;
          v110[1] = v110;
          v110[2] = 0x2020000000;
          v110[3] = 0;
          id v48 = Property[2];
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&uint8_t buf[8] = 3221225472;
          *(void *)&buf[16] = __53__NWURLSessionTaskMetrics_reportToSymptoms_activity___block_invoke;
          *(void *)v126 = &unk_1E523EEB0;
          *(void *)&v126[16] = v110;
          v127 = &v115;
          v128 = &v111;
          v129 = v35;
          unint64_t v130 = v42;
          id v49 = self;
          *(void *)&v126[8] = v49;
          nw_http_client_metadata_enumerate_transactions(v48, buf);

          BOOL v50 = v46;
          *((void *)v35 + 2) = v112[3];
          *((void *)v35 + 6) = v116[3];
          *((void *)v35 + 7) = v103;
          if (reportToSymptoms_activity__onceToken != -1) {
            dispatch_once(&reportToSymptoms_activity__onceToken, &__block_literal_global_28592);
          }
          symptom_new();
          symptom_set_qualifier();
          symptom_set_additional_qualifier();
          if (!os_variant_has_internal_diagnostics()
            || !networkd_settings_get_BOOL((const char *)nw_setting_activity_write_metric_stream_to_log))
          {
            symptom_send();
LABEL_104:
            free(v35);

            _Block_object_dispose(v110, 8);
            _Block_object_dispose(&v111, 8);
            _Block_object_dispose(&v115, 8);

            uint64_t v28 = v106;
LABEL_105:

            v80 = *(void **)(a1 + 408);
            *(void *)(a1 + 408) = 0;

            [self setSecTrust:0];
            objc_setProperty_atomic_copy(self, v81, 0, 304);
            -[NWURLSession taskCompleted:](self[50], self);

            return;
          }
          v109 = 0;
          uint64_t v51 = v49;
          id v104 = v106;
          xpc_object_t v52 = xpc_dictionary_create(0, 0, 0);
          memset(out, 0, sizeof(out));
          uuid_unparse((const unsigned __int8 *)v35 + 64, out);
          xpc_dictionary_set_string(v52, "activityUUID", out);
          unsigned int label = nw_activity_get_label(v104);
          xpc_dictionary_set_uint64(v52, "activityLabel", label);
          unsigned int domain = nw_activity_get_domain(v104);
          xpc_dictionary_set_uint64(v52, "activityDomain", domain);
          uint64_t investigation_identifier = nw_activity_get_investigation_identifier(v104);
          xpc_dictionary_set_uint64(v52, "identifier", investigation_identifier);
          v102 = [v51 description];
          xpc_dictionary_set_string(v52, "taskUUID", (const char *)[v102 UTF8String]);
          xpc_dictionary_set_uint64(v52, "didCompleteWithError", *((void *)v35 + 1));
          xpc_dictionary_set_uint64(v52, "numberOfRetries", *((void *)v35 + 2));
          xpc_dictionary_set_uint64(v52, "numberOfRedirects", *((void *)v35 + 6));
          xpc_dictionary_set_int64(v52, "error", *((void *)v35 + 3));
          xpc_dictionary_set_int64(v52, "underlyingError", *((void *)v35 + 4));
          xpc_dictionary_set_int64(v52, "underlyingErrorDomain", *((void *)v35 + 5));
          unsigned int v56 = *((_DWORD *)v35 + 24) - 1;
          if (v56 > 5) {
            uint64_t v57 = "UNKNOWN";
          }
          else {
            uint64_t v57 = off_1E523EED0[v56];
          }
          xpc_dictionary_set_string(v52, "taskType", v57);
          xpc_dictionary_set_BOOL(v52, "isBackground", v35[100]);
          xpc_dictionary_set_BOOL(v52, "usedUnifiedStack", 1);
          xpc_dictionary_set_BOOL(v52, "apSleepWakeMonitored", v35[102]);
          xpc_object_t empty = xpc_array_create_empty();
          if (*((void *)v35 + 7))
          {
            unint64_t v59 = 0;
            id v60 = (BOOL *)(v35 + 216);
            do
            {
              xpc_object_t v61 = xpc_dictionary_create(0, 0, 0);
              xpc_dictionary_set_uint64(v61, "requestStart", *((void *)v60 - 14));
              xpc_dictionary_set_uint64(v61, "requestEnd", *((void *)v60 - 13));
              xpc_dictionary_set_uint64(v61, "responseStart", *((void *)v60 - 12));
              xpc_dictionary_set_uint64(v61, "responseEnd", *((void *)v60 - 11));
              xpc_dictionary_set_uint64(v61, "totalBytesWritten", *((void *)v60 - 10));
              xpc_dictionary_set_uint64(v61, "totalBytesRead", *((void *)v60 - 9));
              memset(string, 0, 37);
              uuid_unparse((const unsigned __int8 *)v60 - 64, (char *)string);
              xpc_dictionary_set_string(v61, "connectionUUID", (const char *)string);
              unint64_t v62 = *((void *)v60 - 6) - 1;
              os_log_type_t v63 = "UNKNOWN";
              if (v62 <= 2) {
                os_log_type_t v63 = off_1E523EF00[v62];
              }
              xpc_dictionary_set_string(v61, "networkLoadType", v63);
              unint64_t v64 = *((void *)v60 - 5) - 1;
              v65 = "UNKNOWN";
              if (v64 <= 4) {
                v65 = off_1E523EF18[v64];
              }
              xpc_dictionary_set_string(v61, "schedulingTier", v65);
              unint64_t v66 = *((void *)v60 - 4) - 1;
              id v67 = "UNKNOWN";
              if (v66 <= 4) {
                id v67 = off_1E523EF40[v66];
              }
              xpc_dictionary_set_string(v61, "http3Status", v67);
              unsigned int v68 = *((_DWORD *)v60 - 6) - 1;
              v69 = "UNKNOWN";
              if (v68 <= 4) {
                v69 = off_1E523EF68[v68];
              }
              xpc_dictionary_set_string(v61, "networkProtocolName", v69);
              xpc_dictionary_set_BOOL(v61, "reusedConnection", *(v60 - 20));
              xpc_dictionary_set_BOOL(v61, "isRedirected", *(v60 - 19));
              xpc_dictionary_set_BOOL(v61, "proxied", *(v60 - 18));
              unint64_t v70 = *((void *)v60 - 2) - 1;
              v71 = "UNKNOWN";
              if (v70 <= 0xC) {
                v71 = off_1E523EF90[v70];
              }
              xpc_dictionary_set_string(v61, "httpServerType", v71);
              uint64_t v72 = [v51 response];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                int v73 = [v72 statusCode];
              }
              else {
                int v73 = 0;
              }
              xpc_dictionary_set_int64(v61, "statusCode", v73);

              xpc_dictionary_set_uint64(v61, "reusedAfterTime", *((void *)v60 - 1));
              xpc_dictionary_set_BOOL(v61, "reusedAfterSleepWake", *v60);
              xpc_array_append_value(empty, v61);

              ++v59;
              v60 += 120;
            }
            while (v59 < *((void *)v35 + 7));
          }
          xpc_dictionary_set_value(v52, "transactionMetrics", empty);

          BOOL is_valid = nw_activity_metric_object_is_valid(v52, 0, (const char **)&v109);
          if (v109) {
            BOOL v75 = is_valid;
          }
          else {
            BOOL v75 = 0;
          }
          if (v75)
          {
            if (__nwlog_metricstream_log::onceToken != -1) {
              dispatch_once(&__nwlog_metricstream_log::onceToken, &__block_literal_global_64);
            }
            v76 = (id)gmetricstreamLogObj;
            if (!os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_101;
            }
            *(_DWORD *)uuid_string_t out = 136446210;
            *(void *)&out[4] = v109;
            uint64_t v77 = "%{public}s";
            v78 = v76;
            uint32_t v79 = 12;
          }
          else
          {
            if (__nwlog_url_log::onceToken != -1) {
              dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
            }
            v76 = (id)gurlLogObj;
            if (!os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_101;
            }
            *(_WORD *)uuid_string_t out = 0;
            uint64_t v77 = "There was an issue with either validating the dictionary or the description being null";
            v78 = v76;
            uint32_t v79 = 2;
          }
          _os_log_impl(&dword_1830D4000, v78, OS_LOG_TYPE_DEFAULT, v77, (uint8_t *)out, v79);
LABEL_101:

          if (v109)
          {
            free(v109);
            v109 = 0;
          }

          goto LABEL_104;
        }
LABEL_148:
        __break(1u);
        return;
      }
      char v90 = __nwlog_obj();
      *(_DWORD *)uuid_string_t out = 136446210;
      *(void *)&out[4] = "nw_http_client_metadata_get_transaction_count";
      LODWORD(v101) = 12;
      v100 = out;
      v83 = (char *)_os_log_send_and_compose_impl();

      string[0] = OS_LOG_TYPE_ERROR;
      LOBYTE(v115) = 0;
      if (__nwlog_fault(v83, string, &v115))
      {
        if (string[0] == OS_LOG_TYPE_FAULT)
        {
          id v84 = __nwlog_obj();
          os_log_type_t v91 = string[0];
          if (os_log_type_enabled(v84, string[0]))
          {
            *(_DWORD *)uuid_string_t out = 136446210;
            *(void *)&out[4] = "nw_http_client_metadata_get_transaction_count";
            _os_log_impl(&dword_1830D4000, v84, v91, "%{public}s metadata must be http_client", (uint8_t *)out, 0xCu);
          }
        }
        else if ((_BYTE)v115)
        {
          backtrace_string = (char *)__nw_create_backtrace_string();
          id v84 = __nwlog_obj();
          os_log_type_t v96 = string[0];
          BOOL v97 = os_log_type_enabled(v84, string[0]);
          if (backtrace_string)
          {
            if (v97)
            {
              *(_DWORD *)uuid_string_t out = 136446466;
              *(void *)&out[4] = "nw_http_client_metadata_get_transaction_count";
              *(_WORD *)&out[12] = 2082;
              *(void *)&out[14] = backtrace_string;
              _os_log_impl(&dword_1830D4000, v84, v96, "%{public}s metadata must be http_client, dumping backtrace:%{public}s", (uint8_t *)out, 0x16u);
            }

            free(backtrace_string);
            if (!v83) {
              goto LABEL_146;
            }
            goto LABEL_145;
          }
          if (v97)
          {
            *(_DWORD *)uuid_string_t out = 136446210;
            *(void *)&out[4] = "nw_http_client_metadata_get_transaction_count";
            _os_log_impl(&dword_1830D4000, v84, v96, "%{public}s metadata must be http_client, no backtrace", (uint8_t *)out, 0xCu);
          }
        }
        else
        {
          id v84 = __nwlog_obj();
          os_log_type_t v99 = string[0];
          if (os_log_type_enabled(v84, string[0]))
          {
            *(_DWORD *)uuid_string_t out = 136446210;
            *(void *)&out[4] = "nw_http_client_metadata_get_transaction_count";
            _os_log_impl(&dword_1830D4000, v84, v99, "%{public}s metadata must be http_client, backtrace limit exceeded", (uint8_t *)out, 0xCu);
          }
        }
        goto LABEL_143;
      }
LABEL_144:
      if (!v83)
      {
LABEL_146:

        uint64_t v103 = 0;
        size_t v34 = 104;
        goto LABEL_44;
      }
LABEL_145:
      free(v83);
      goto LABEL_146;
    }
    v82 = __nwlog_obj();
    *(_DWORD *)uuid_string_t out = 136446210;
    *(void *)&out[4] = "nw_http_client_metadata_get_transaction_count";
    LODWORD(v101) = 12;
    v100 = out;
    v83 = (char *)_os_log_send_and_compose_impl();

    string[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v115) = 0;
    if (!__nwlog_fault(v83, string, &v115)) {
      goto LABEL_144;
    }
    if (string[0] == OS_LOG_TYPE_FAULT)
    {
      id v84 = __nwlog_obj();
      os_log_type_t v85 = string[0];
      if (os_log_type_enabled(v84, string[0]))
      {
        *(_DWORD *)uuid_string_t out = 136446210;
        *(void *)&out[4] = "nw_http_client_metadata_get_transaction_count";
        _os_log_impl(&dword_1830D4000, v84, v85, "%{public}s called with null metadata", (uint8_t *)out, 0xCu);
      }
    }
    else if ((_BYTE)v115)
    {
      v92 = (char *)__nw_create_backtrace_string();
      id v84 = __nwlog_obj();
      os_log_type_t v93 = string[0];
      BOOL v94 = os_log_type_enabled(v84, string[0]);
      if (v92)
      {
        if (v94)
        {
          *(_DWORD *)uuid_string_t out = 136446466;
          *(void *)&out[4] = "nw_http_client_metadata_get_transaction_count";
          *(_WORD *)&out[12] = 2082;
          *(void *)&out[14] = v92;
          _os_log_impl(&dword_1830D4000, v84, v93, "%{public}s called with null metadata, dumping backtrace:%{public}s", (uint8_t *)out, 0x16u);
        }

        free(v92);
        goto LABEL_144;
      }
      if (v94)
      {
        *(_DWORD *)uuid_string_t out = 136446210;
        *(void *)&out[4] = "nw_http_client_metadata_get_transaction_count";
        _os_log_impl(&dword_1830D4000, v84, v93, "%{public}s called with null metadata, no backtrace", (uint8_t *)out, 0xCu);
      }
    }
    else
    {
      id v84 = __nwlog_obj();
      os_log_type_t v98 = string[0];
      if (os_log_type_enabled(v84, string[0]))
      {
        *(_DWORD *)uuid_string_t out = 136446210;
        *(void *)&out[4] = "nw_http_client_metadata_get_transaction_count";
        _os_log_impl(&dword_1830D4000, v84, v98, "%{public}s called with null metadata, backtrace limit exceeded", (uint8_t *)out, 0xCu);
      }
    }
LABEL_143:

    goto LABEL_144;
  }
}

- (void)finishProgressReporting
{
  if (a1 && !*(unsigned char *)(a1 + 15))
  {
    *(unsigned char *)(a1 + 15) = 1;
    uint64_t v2 = [(id)a1 error];

    if (!v2)
    {
      id v3 = *(id *)(a1 + 360);
      objc_msgSend(*(id *)(a1 + 360), "setCompletedUnitCount:", objc_msgSend(v3, "totalUnitCount"));

      id v4 = *(id *)(a1 + 368);
      objc_msgSend(*(id *)(a1 + 368), "setCompletedUnitCount:", objc_msgSend(v4, "totalUnitCount"));
    }
    obj = (id *)(id)a1;
    objc_sync_enter(obj);
    [obj[8] setCancellationHandler:0];
    [obj[8] setPausingHandler:0];
    [obj[8] setResumingHandler:0];
    objc_sync_exit(obj);
  }
}

- (void)loaderWaitingForConnectivity
{
  if (self)
  {
    configuration = self->_configuration;
    if (configuration)
    {
      if ([(NSURLSessionConfiguration *)configuration->_configuration waitsForConnectivity])
      {
        if (self->_timeoutIntervalForRequest > 0.0)
        {
          requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
          if (requestTimeoutTimer)
          {
            if (*requestTimeoutTimer)
            {
              dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
            }
            else
            {
              requestTimeoutTimer[4] = (dispatch_source_t)-1;
              requestTimeoutTimer[5] = (dispatch_source_t)-1;
              if (*((unsigned char *)requestTimeoutTimer + 48) && *((unsigned char *)requestTimeoutTimer + 49)) {
                nw_queue_source_run_timer((uint64_t)requestTimeoutTimer);
              }
            }
          }
        }
        uint64_t v5 = 248;
        if (!self->_internalDelegateWrapper) {
          uint64_t v5 = 240;
        }
        BOOL v12 = (id *)*(id *)((char *)&self->super.isa + v5);
        uint64_t v7 = self;
        if (v12)
        {
          os_log_type_t v8 = [(NWURLSessionDelegateWrapper *)v12 delegateFor_isWaitingForConnectivity];
          if (v8)
          {
            id v9 = v12[4];
            v13[0] = MEMORY[0x1E4F143A8];
            v13[1] = 3221225472;
            v13[2] = __60__NWURLSessionDelegateWrapper_taskIsWaitingForConnectivity___block_invoke;
            v13[3] = &unk_1E5249868;
            id v14 = v8;
            id v15 = v9;
            os_log_type_t v16 = v7;
            unsigned int v10 = v12[6];
            id v11 = v9;
            -[NWURLSessionDelegateQueue runDelegateBlock:](v10, v13);
          }
        }
      }
    }
  }
}

- (void)loaderPreparingConnection
{
  if (self)
  {
    double timeoutIntervalForRequest = self->_timeoutIntervalForRequest;
    if (timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (NSObject **)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        dispatch_time_t v4 = dispatch_time(0x8000000000000000, (uint64_t)(timeoutIntervalForRequest * 1000000000.0));
        uint64_t v5 = *requestTimeoutTimer;
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(v5, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          requestTimeoutTimer[4] = v4;
          requestTimeoutTimer[5] = -1;
          if (*((unsigned char *)requestTimeoutTimer + 48) && *((unsigned char *)requestTimeoutTimer + 49))
          {
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer);
          }
        }
      }
      else
      {
        self->_requestTimeoutTimer = (void *)[(NWURLSessionTask *)(uint64_t)self createTimerWithTimeout:timeoutIntervalForRequest];
      }
    }
  }
}

- (void)loaderNeedsBodyProviderFromOffset:(unint64_t)a3 completionHandler:(id)a4
{
  double v6 = (void (**)(id, void *))a4;
  if (!self || (requestBody = self->_requestBody) == 0)
  {
    id v9 = 0;
    goto LABEL_7;
  }
  os_log_type_t v8 = requestBody->_data;
  if (v8 || requestBody->_fileURL)
  {

LABEL_6:
    id v9 = self->_requestBody;
LABEL_7:
    unsigned int v10 = v9;
    id v11 = -[NWURLSessionRequestBodyInfo bodyProviderFromOffset:](v10, (void *)a3);
    v6[2](v6, v11);

    goto LABEL_8;
  }
  if (requestBody->_stream && requestBody->_streamOffset == a3) {
    goto LABEL_6;
  }
  if (self->_timeoutIntervalForRequest > 0.0)
  {
    requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
    if (requestTimeoutTimer)
    {
      if (*requestTimeoutTimer)
      {
        dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      }
      else
      {
        requestTimeoutTimer[4] = (dispatch_source_t)-1;
        requestTimeoutTimer[5] = (dispatch_source_t)-1;
        if (*((unsigned char *)requestTimeoutTimer + 48) && *((unsigned char *)requestTimeoutTimer + 49)) {
          nw_queue_source_run_timer((uint64_t)requestTimeoutTimer);
        }
      }
    }
  }
  uint64_t v13 = 248;
  if (!self->_internalDelegateWrapper) {
    uint64_t v13 = 240;
  }
  id v14 = (id *)*(id *)((char *)&self->super.isa + v13);
  uint64_t v41 = MEMORY[0x1E4F143A8];
  uint64_t v42 = 3221225472;
  unsigned int v43 = __72__NWURLSessionTask_loaderNeedsBodyProviderFromOffset_completionHandler___block_invoke;
  id v44 = &unk_1E5242608;
  id v45 = self;
  __int16 v46 = v6;
  unint64_t v47 = a3;
  unint64_t v40 = self;
  os_log_type_t v16 = &v41;
  if (v14)
  {
    uint64_t v18 = [(NWURLSessionDelegateWrapper *)v14 delegateFor_needNewBodyStreamFromOffset];
    if (v18)
    {
      id v19 = v14[4];
      id v20 = v14[5];
      uint64_t v21 = [NWURLSessionDelegateDeallocBomb alloc];
      id v22 = v18;
      if (v21)
      {
        v48.receiver = v21;
        v48.super_class = (Class)NWURLSessionDelegateDeallocBomb;
        id v23 = [(NWURLSessionTask *)&v48 init];
        uint64_t v21 = (NWURLSessionDelegateDeallocBomb *)v23;
        if (v23)
        {
          objc_storeStrong((id *)v23 + 2, v18);
          if (sel_task_needNewBodyStreamFromOffset_completionHandler_) {
            BOOL v24 = sel_task_needNewBodyStreamFromOffset_completionHandler_;
          }
          else {
            BOOL v24 = 0;
          }
          v21->__method = v24;
        }
      }

      v48.receiver = (id)MEMORY[0x1E4F143A8];
      v48.super_class = (Class)3221225472;
      id v49 = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke;
      BOOL v50 = &unk_1E52499D0;
      id v51 = v22;
      id v52 = v19;
      os_log_type_t v53 = v40;
      BOOL v54 = v21;
      unint64_t v57 = a3;
      id v55 = v20;
      unsigned int v56 = v16;
      uint32_t v25 = v14[6];
      id v26 = v20;
      id v27 = v21;
      id v28 = v19;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v25, &v48);
    }
    else if (a3)
    {
      v43(v16, 0);
    }
    else
    {
      id v29 = [(NWURLSessionDelegateWrapper *)v14 delegateFor_needNewBodyStream];
      if (v29)
      {
        id v30 = v14[4];
        id v31 = v14[5];
        id v32 = [NWURLSessionDelegateDeallocBomb alloc];
        id v33 = v29;
        if (v32)
        {
          v48.receiver = v32;
          v48.super_class = (Class)NWURLSessionDelegateDeallocBomb;
          id v34 = [(NWURLSessionTask *)&v48 init];
          id v32 = (NWURLSessionDelegateDeallocBomb *)v34;
          if (v34)
          {
            objc_storeStrong((id *)v34 + 2, v29);
            if (sel_task_needNewBodyStreamFromOffset_completionHandler_) {
              int v35 = sel_task_needNewBodyStreamFromOffset_completionHandler_;
            }
            else {
              int v35 = 0;
            }
            v32->__method = v35;
          }
        }

        v48.receiver = (id)MEMORY[0x1E4F143A8];
        v48.super_class = (Class)3221225472;
        id v49 = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_4;
        BOOL v50 = &unk_1E5249980;
        id v51 = v33;
        id v52 = v30;
        os_log_type_t v53 = v40;
        BOOL v54 = v32;
        id v55 = v31;
        unsigned int v56 = v16;
        __int16 v36 = v14[6];
        id v37 = v31;
        uint64_t v38 = v32;
        id v39 = v30;
        -[NWURLSessionDelegateQueue runDelegateBlock:](v36, &v48);
      }
      else
      {
        v43(v16, 0);
      }
    }
  }
LABEL_8:
}

void __72__NWURLSessionTask_loaderNeedsBodyProviderFromOffset_completionHandler___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = a1[4];
  id v18 = v4;
  if (v5)
  {
    double v6 = *(double *)(v5 + 328);
    if (v6 > 0.0)
    {
      uint64_t v7 = *(void *)(v5 + 336);
      if (v7)
      {
        dispatch_time_t v8 = dispatch_time(0x8000000000000000, (uint64_t)(v6 * 1000000000.0));
        if (*(void *)v7)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
LABEL_6:
          id v4 = v18;
          goto LABEL_7;
        }
        *(void *)(v7 + 32) = v8;
        *(void *)(v7 + 40) = -1;
        id v4 = v18;
        if (*(unsigned char *)(v7 + 48) && *(unsigned char *)(v7 + 49))
        {
          nw_queue_source_run_timer(v7);
          goto LABEL_6;
        }
      }
    }
  }
LABEL_7:
  if (v4)
  {
    uint64_t v9 = a1[4];
    if (v9)
    {
      uint64_t v10 = *(void *)(v9 + 416);
      id v11 = v4;
      if (v10)
      {
        objc_storeStrong((id *)(v10 + 32), a2);
        *(void *)(v10 + 48) = 0;
      }
    }
    else
    {
      id v17 = v4;
    }

    BOOL v12 = (void *)a1[4];
    uint64_t v13 = a1[5];
    if (v12) {
      BOOL v12 = (void *)v12[52];
    }
    id v14 = (void *)a1[6];
    id v15 = v12;
    os_log_type_t v16 = -[NWURLSessionRequestBodyInfo bodyProviderFromOffset:](v15, v14);
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v16);
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (void)loaderRunDelegateBlock:(id)a3
{
  if (!self) {
    goto LABEL_9;
  }
  uint64_t v4 = 248;
  if (!self->_internalDelegateWrapper) {
    uint64_t v4 = 240;
  }
  id v5 = *(id *)((char *)&self->super.isa + v4);
  if (v5)
  {
    id v6 = v5;
    -[NWURLSessionDelegateQueue runDelegateBlock:](*((void **)v5 + 6), a3);
  }
  else
  {
LABEL_9:
    id v6 = 0;
  }
}

- (OS_nw_context)networkContext
{
  if (self) {
    self = (NWURLSessionTask *)self->_sessionContext;
  }
  return (OS_nw_context *)self;
}

- (void)joiningContext
{
  if (self) {
    return (void *)*((void *)self + 50);
  }
  return self;
}

- (OS_nw_protocol_metadata)clientMetadata
{
  if (self) {
    self = (NWURLSessionTask *)self->_clientMetadataForMetrics;
  }
  return (OS_nw_protocol_metadata *)self;
}

- (NSURLSessionDataTask)loaderDataTask
{
  return 0;
}

- (id)errorWithResumeData:(id)a3
{
  id v3 = a3;

  return v3;
}

- (NSString)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14[23] = 0;
  long long v15 = unk_183D5D270;
  long long v16 = xmmword_183D5D280;
  strcpy((char *)v14, "Task <00000000-0000-0000-0000-000000000000>.<");
  if (self) {
    session = self->_session;
  }
  else {
    session = 0;
  }
  uint64_t v4 = session;
  [(NWURLSessionTask *)self logDescription];
  uuid_unparse(uu, (char *)&v14[3]);
  LOBYTE(v14[21]) = 62;
  [(NWURLSessionTask *)self logDescription];
  uint64_t v5 = 0;
  unsigned int v6 = v12;
  unsigned int v7 = v12;
  do
  {
    int v8 = v5++;
    BOOL v9 = v7 > 9;
    v7 /= 0xAu;
  }
  while (v9);
  do
  {
    *((unsigned char *)&v14[22] + v5--) = (v6 % 0xA) | 0x30;
    v6 /= 0xAu;
  }
  while (v5 > 0);
  *((unsigned char *)v14 + (v8 + 46)) = 62;
  uint64_t v10 = [NSString stringWithCString:v14 encoding:1];

  return (NSString *)v10;
}

- (void)completeTaskWithError:(id)a3
{
  id v4 = a3;
  if (self)
  {
    nw_context_assert_queue(self->_sessionContext);
    if (self->_internalState == 2)
    {
      uint64_t v5 = v4;
      goto LABEL_12;
    }
  }
  else
  {
    nw_context_assert_queue(0);
  }
  id newValue = [(NWURLSessionTask *)self errorWithResumeData:v4];

  unsigned int v6 = [(NWURLSessionTask *)self error];

  if (v6)
  {
    if (!self) {
      goto LABEL_15;
    }
  }
  else
  {
    if (!self)
    {
LABEL_15:
      responseConsumer = 0;
      goto LABEL_11;
    }
    objc_setProperty_atomic_copy(self, v7, newValue, 136);
  }
  responseConsumer = self->_responseConsumer;
LABEL_11:
  [(NWURLSessionResponseConsumer *)responseConsumer task:self deliverData:0 complete:1 error:newValue completionHandler:&__block_literal_global_46144];
  -[NWURLSessionTask complete]((uint64_t)self);
  uint64_t v5 = newValue;
LABEL_12:
}

- (void)startNextLoad:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    nw_context_assert_queue(self->_sessionContext);
    configuration = self->_configuration;
  }
  else
  {
    nw_context_assert_queue(0);
    configuration = 0;
  }
  unsigned int v6 = configuration;
  unsigned int v7 = [(NWURLSessionTask *)self currentRequest];
  id v8 = v7;
  if (v6) {
    objc_storeStrong(v6 + 4, v7);
  }

  if (self)
  {
    BOOL v9 = self->_configuration;
    p_uint64_t isa = (id *)&v9->super.isa;
    if (v9)
    {
      if ([(NSURLRequest *)v9->_request _explicitlySetTimeoutInterval]) {
        [p_isa[4] timeoutInterval];
      }
      else {
        [p_isa[2] timeoutIntervalForRequest];
      }
    }
    else
    {
      double v11 = 0.0;
    }
    self->_double timeoutIntervalForRequest = v11;

    if (!v3) {
      goto LABEL_12;
    }
  }
  else
  {

    if (!v3) {
      goto LABEL_12;
    }
  }
  -[NWURLSessionTask startStartTimer]((uint64_t)self);
  -[NWURLSessionTask startResourceTimer](self);
LABEL_12:
  if (self && (unsigned int v12 = self->_configuration) != 0)
  {
    uint64_t v13 = [(NSURLSessionConfiguration *)v12->_configuration protocolClasses];
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v72 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        if (([v20 isSubclassOfClass:NSClassFromString((NSString *)@"_NSCFURLProtocol")] & 1) == 0) {
          [v14 addObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v71 objects:v79 count:16];
    }
    while (v17);
  }

  if (self)
  {
    uint64_t v21 = self->_requestBody;
    id v22 = v21;
    if (v21) {
      uint64_t knownSize = v21->_knownSize;
    }
    else {
      uint64_t knownSize = 0;
    }
    -[NWURLSessionTask setCountOfBytesExpectedToSend:](self, knownSize);
  }
  else
  {
    id v22 = 0;
  }

  BOOL v24 = [(NWURLSessionTask *)self currentRequest];
  if (self)
  {
    uint32_t v25 = self->_requestBody;
    v65 = v25;
    if (v25) {
      unint64_t v26 = v25->_knownSize;
    }
    else {
      unint64_t v26 = 0;
    }
    id v27 = self->_configuration;
    queue = self->_queue;
  }
  else
  {
    unint64_t v26 = 0;
    v65 = 0;
    id v27 = 0;
    queue = 0;
  }
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  unsigned int v68 = __34__NWURLSessionTask_startNextLoad___block_invoke;
  v69 = &unk_1E52424D0;
  unint64_t v70 = self;
  id v29 = v24;
  id v30 = v27;
  unint64_t v66 = queue;
  id v31 = self;
  id v32 = v14;
  id v33 = v67;
  self;
  id v34 = [v29 URL];
  int v35 = [v34 scheme];

  if (!v35)
  {
    v68((uint64_t)v33, 0);
    __int16 v36 = v66;
    goto LABEL_53;
  }
  if (![v35 caseInsensitiveCompare:@"http"]
    || ![v35 caseInsensitiveCompare:@"https"])
  {
    __int16 v36 = v66;
    id v37 = -[NWURLLoaderHTTP initWithRequest:bodyKnownSize:configuration:queue:client:]((id *)[NWURLLoaderHTTP alloc], v29, v26, v30, v66, v31);
    goto LABEL_36;
  }
  unint64_t v64 = v35;
  unint64_t v47 = [v29 URL];
  int v48 = [v47 isFileURL];

  __int16 v36 = v66;
  if (!v48)
  {
    if ([v64 caseInsensitiveCompare:@"data"])
    {
      if ([v64 caseInsensitiveCompare:@"about"])
      {
        id v37 = 0;
        goto LABEL_64;
      }
      uint64_t v58 = [NWURLLoaderAbout alloc];
      unsigned int v56 = [v29 URL];
      unint64_t v57 = -[NWURLLoaderAbout initWithURL:]((id *)&v58->super.isa, v56);
    }
    else
    {
      id v55 = [NWURLLoaderData alloc];
      unsigned int v56 = [v29 URL];
      unint64_t v57 = -[NWURLLoaderData initWithURL:]((id *)&v55->super.isa, v56);
    }
    id v37 = v57;

    goto LABEL_64;
  }
  id v37 = -[NWURLLoaderFile initWithRequest:queue:]((id *)[NWURLLoaderFile alloc], v29, v66);
LABEL_64:
  int v35 = v64;
LABEL_36:
  if (isWebKitNetworking_onceToken[0] != -1) {
    dispatch_once(isWebKitNetworking_onceToken, &__block_literal_global_202);
  }
  if (isWebKitNetworking_result == 1)
  {
    id v62 = v32;
    os_log_type_t v63 = v35;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v38 = v32;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v75 objects:v80 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      unint64_t v59 = v33;
      id v60 = v30;
      xpc_object_t v61 = v29;
      uint64_t v41 = *(void *)v76;
      while (2)
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v76 != v41) {
            objc_enumerationMutation(v38);
          }
          unsigned int v43 = *(void **)(*((void *)&v75 + 1) + 8 * j);
          id v44 = [(NWURLSessionTask *)v31 loaderTask];
          int v45 = [v43 canInitWithTask:v44];

          if (v45)
          {
            id v30 = v60;
            id v29 = v61;
            __int16 v36 = v66;
            __int16 v46 = -[NWURLLoader initWithRequest:configuration:queue:client:protocolClass:]((id *)[NWURLLoader alloc], v61, v60, v66, v31, v43);

            id v37 = v46;
            goto LABEL_51;
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v75 objects:v80 count:16];
        if (v40) {
          continue;
        }
        break;
      }
      id v30 = v60;
      id v29 = v61;
      __int16 v36 = v66;
LABEL_51:
      id v33 = v59;
    }

    v68((uint64_t)v33, v37);
    id v32 = v62;
    int v35 = v63;
  }
  else if ([v32 count])
  {
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __111__NWURLLoader_makeLoaderForRequest_bodyKnownSize_configuration_queue_client_protocolClasses_completionHandler___block_invoke;
    v80[3] = &unk_1E52498E0;
    SEL v81 = v37;
    id v82 = v32;
    id v49 = v31;
    v83 = v49;
    id v84 = v29;
    os_log_type_t v85 = v30;
    id v86 = v36;
    id v87 = v33;
    BOOL v50 = v37;
    id v51 = v35;
    id v52 = v33;
    os_log_type_t v53 = v30;
    BOOL v54 = v50;
    [(NWURLSessionTask *)v49 loaderRunDelegateBlock:v80];

    id v30 = v53;
    id v33 = v52;
    int v35 = v51;
  }
  else
  {
    v68((uint64_t)v33, v37);
  }
LABEL_53:
}

- (void)startStartTimer
{
  if (a1)
  {
    uint64_t v2 = [(id)a1 currentRequest];
    BOOL v3 = [v2 _startTimeoutDate];

    if (v3)
    {
      id v4 = [(id)a1 currentRequest];
      uint64_t v5 = [v4 _startTimeoutDate];
      [v5 timeIntervalSinceNow];
      double v7 = v6;

      if (v7 <= 0.0)
      {
        id v8 = [NWURLError alloc];
        id v9 = *(id *)(a1 + 264);
        id v10 = (id)a1;
        if (v8
          && (uint64_t v11 = *MEMORY[0x1E4F289A0],
              v14.receiver = v8,
              v14.super_class = (Class)NWURLError,
              (id v12 = objc_msgSendSuper2(&v14, sel_initWithDomain_code_userInfo_, v11, -1001, 0)) != 0))
        {
          id v13 = v12;
          [v12 fillErrorForLoader:v9 andTask:v10];
        }
        else
        {
          id v13 = 0;
        }

        [v10 completeTaskWithError:v13];
      }
      else if (!*(void *)(a1 + 344))
      {
        *(void *)(a1 + 344) = -[NWURLSessionTask createTimerWithTimeout:](a1, v7);
      }
    }
  }
}

- (void)startResourceTimer
{
  if (a1)
  {
    uint64_t v2 = [a1 currentRequest];
    uint64_t v3 = [v2 _startTimeoutDate];
    if (v3)
    {
      id v4 = (void *)v3;
      uint64_t v5 = [a1 currentRequest];
      [v5 _payloadTransmissionTimeout];
      double v7 = v6;

      if (v7 != 0.0) {
        return;
      }
    }
    else
    {
    }
    uint64_t v8 = a1[51];
    if (v8)
    {
      [*(id *)(v8 + 24) _timeoutIntervalForResource];
      if (v9 == 0.0)
      {
        [*(id *)(v8 + 16) timeoutIntervalForResource];
        if (v10 <= 0.0) {
          return;
        }
      }
      else
      {
        [*(id *)(v8 + 24) _timeoutIntervalForResource];
        if (v10 <= 0.0) {
          return;
        }
      }
      if (!a1[40]) {
        a1[40] = -[NWURLSessionTask createTimerWithTimeout:]((uint64_t)a1, v10);
      }
    }
  }
}

void __34__NWURLSessionTask_startNextLoad___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v6)
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    if (v4) {
      goto LABEL_5;
    }
    goto LABEL_8;
  }
  if (*(void *)(v6 + 288) != 2)
  {
    if (v4)
    {
      objc_storeStrong((id *)(v6 + 264), a2);
      uint64_t v7 = *(void *)(a1 + 32);
LABEL_5:
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __34__NWURLSessionTask_startNextLoad___block_invoke_2;
      v9[3] = &unk_1E524BAA8;
      v9[4] = v7;
      [v5 start:v9];
      goto LABEL_6;
    }
    uint64_t v8 = -[NWURLSessionTask errorForErrorCode:](*(id **)(a1 + 32), -1002);
LABEL_8:
    [(id)v6 completeTaskWithError:v8];
  }
LABEL_6:
}

- (id)errorForErrorCode:(id *)a1
{
  if (a1)
  {
    id v4 = [NWURLError alloc];
    id v5 = a1[33];
    uint64_t v6 = a1;
    if (v4)
    {
      uint64_t v7 = *MEMORY[0x1E4F289A0];
      v11.receiver = v4;
      v11.super_class = (Class)NWURLError;
      id v8 = objc_msgSendSuper2(&v11, sel_initWithDomain_code_userInfo_, v7, a2, 0);
      double v9 = v8;
      if (v8) {
        [v8 fillErrorForLoader:v5 andTask:v6];
      }
    }
    else
    {
      double v9 = 0;
    }
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

void __34__NWURLSessionTask_startNextLoad___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 408);
    if (!v2 || ([*(id *)(v2 + 24) _preconnect] & 1) == 0 && (uint64_t v1 = *(void *)(a1 + 32)) != 0)
    {
      nw_context_assert_queue(*(void **)(v1 + 312));
      id v4 = *(id *)(v1 + 264);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __32__NWURLSessionTask_readResponse__block_invoke;
      v6[3] = &unk_1E5242520;
      v6[4] = v1;
      id v7 = v4;
      id v5 = v4;
      [v5 readResponse:v6];
    }
  }
}

void __32__NWURLSessionTask_readResponse__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    if (v7[33] != *(void *)(a1 + 40) || v7[36] == 2) {
      goto LABEL_18;
    }
  }
  else if (*(void *)(a1 + 40))
  {
    goto LABEL_18;
  }
  if (v6)
  {
    id v8 = [v7 error];

    id v7 = *(void **)(a1 + 32);
    if (!v8)
    {
      if (v7)
      {
        objc_setProperty_atomic_copy(v7, v9, v6, 136);
        id v7 = *(void **)(a1 + 32);
      }
    }
  }
  double v10 = [v7 error];

  uint64_t v11 = *(void *)(a1 + 32);
  if (v10)
  {
    uint64_t v17 = [*(id *)(a1 + 32) error];
    [(id)v11 completeTaskWithError:v17];
  }
  else
  {
    if (v11)
    {
      double v12 = *(double *)(v11 + 328);
      if (v12 > 0.0)
      {
        uint64_t v13 = *(void *)(v11 + 336);
        if (v13)
        {
          dispatch_time_t v14 = dispatch_time(0x8000000000000000, (uint64_t)(v12 * 1000000000.0));
          if (*(void *)v13)
          {
            dispatch_source_set_timer(*(dispatch_source_t *)v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
          }
          else
          {
            *(void *)(v13 + 32) = v14;
            *(void *)(v13 + 40) = -1;
            if (*(unsigned char *)(v13 + 48) && *(unsigned char *)(v13 + 49)) {
              nw_queue_source_run_timer(v13);
            }
          }
        }
        else
        {
          *(void *)(v11 + 336) = -[NWURLSessionTask createTimerWithTimeout:](*(void *)(a1 + 32), v12);
        }
      }
    }
    -[NWURLSessionTask updateResponse:](*(void *)(a1 + 32), v5);
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      uint64_t v16 = *(void **)(v15 + 424);
    }
    else {
      uint64_t v16 = 0;
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __32__NWURLSessionTask_readResponse__block_invoke_2;
    v18[3] = &unk_1E52424F8;
    v18[4] = v15;
    id v19 = v5;
    [v16 task:v15 deliverResponse:v19 completionHandler:v18];
  }
LABEL_18:
}

- (void)updateResponse:(uint64_t)a1
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [*(id *)(a1 + 264) peerTrust];
    id v5 = v4;
    if (v4)
    {
      uint64_t v8 = *MEMORY[0x1E4F19108];
      SecTrustRef v6 = sec_trust_copy_ref(v4);
      v9[0] = v6;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      [v3 _setSSLCertificateContext:v7];
    }
  }
}

void __32__NWURLSessionTask_readResponse__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!a3)
  {
    id v5 = *(id *)(a1 + 40);
    if (!v3) {
      goto LABEL_22;
    }
    nw_context_assert_queue(*(void **)(v3 + 312));
    if (*(void *)(v3 + 288) == 2) {
      goto LABEL_22;
    }
    if (a2 != 1)
    {
      switch(a2)
      {
        case 3:
          id v38 = [NWURLSessionStreamTask alloc];
          id v39 = *(id *)(v3 + 264);
          [(id)v3 logDescription];
          uint64_t v40 = -[NWURLSessionStreamTask initWithLoader:identifier:session:]((id *)&v38->super.super.isa, v39, v92, *(void **)(v3 + 400));

          -[NWURLSessionTask setConfiguration:]((uint64_t)v40, *(void **)(v3 + 408));
          uint64_t v42 = [(id)v3 originalRequest];
          if (v40) {
            objc_setProperty_nonatomic_copy(v40, v41, v42, 48);
          }

          unsigned int v43 = [(id)v3 currentRequest];
          int v45 = v43;
          if (v40)
          {
            objc_setProperty_nonatomic_copy(v40, v44, v43, 56);

            objc_storeStrong(v40 + 30, *(id *)(v3 + 240));
            objc_storeStrong(v40 + 31, *(id *)(v3 + 248));
          }
          else
          {
          }
          [(id)v3 priority];
          objc_msgSend(v40, "setPriority:");
          objc_msgSend(v40, "setPrefersIncrementalDelivery:", objc_msgSend((id)v3, "prefersIncrementalDelivery"));
          -[NWURLSessionTask setClientMetadataForMetrics:]((uint64_t)v40, *(void **)(v3 + 256));
          id Property = objc_getProperty((id)v3, v46, 440, 1);
          if (v40)
          {
            objc_setProperty_atomic(v40, v48, Property, 440);
            *((unsigned char *)v40 + 13) = 0;
            v40[36] = (id)1;
            id v49 = [(id)v3 response];
            objc_setProperty_nonatomic_copy(v40, v50, v49, 472);
          }
          else
          {
            id v49 = [(id)v3 response];
          }

          [*(id *)(v3 + 264) updateClient:v40];
          -[NWURLSessionTask setLoader:](v3);
          id v51 = -[NWURLSessionTask delegateWrapper]((void *)v3);
          *(void *)id v86 = MEMORY[0x1E4F143A8];
          *(void *)&v86[8] = 3221225472;
          *(void *)&v86[16] = __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke_3;
          id v87 = &unk_1E524B9A0;
          uint64_t v88 = v3;
          id v89 = v40;
          id v52 = v40;
          -[NWURLSessionDelegateWrapper dataTask:didBecomeStreamTask:completionHandler:]((uint64_t)v51, (void *)v3, v52, v86);

          break;
        case 2:
          os_log_type_t v53 = [NWURLSessionDownloadTask alloc];
          id v54 = *(id *)(v3 + 264);
          [(id)v3 logDescription];
          id v55 = -[NWURLSessionDownloadTask initWithLoader:identifier:session:]((id *)&v53->super.super.isa, v54, v96, *(void **)(v3 + 400));

          -[NWURLSessionTask setConfiguration:]((uint64_t)v55, *(void **)(v3 + 408));
          unint64_t v57 = [(id)v3 originalRequest];
          if (v55) {
            objc_setProperty_nonatomic_copy(v55, v56, v57, 48);
          }

          uint64_t v58 = [(id)v3 currentRequest];
          id v60 = v58;
          if (v55)
          {
            objc_setProperty_nonatomic_copy(v55, v59, v58, 56);

            objc_storeStrong(v55 + 30, *(id *)(v3 + 240));
            objc_storeStrong(v55 + 31, *(id *)(v3 + 248));
          }
          else
          {
          }
          [(id)v3 priority];
          objc_msgSend(v55, "setPriority:");
          [v55 setPrefersIncrementalDelivery:0];
          -[NWURLSessionTask setClientMetadataForMetrics:]((uint64_t)v55, *(void **)(v3 + 256));
          id v62 = objc_getProperty((id)v3, v61, 440, 1);
          if (v55)
          {
            objc_setProperty_atomic(v55, v63, v62, 440);
            unint64_t v64 = objc_alloc_init(NWURLSessionResponseConsumerDownload);
            objc_storeStrong(v55 + 53, v64);
          }
          else
          {
            unint64_t v64 = objc_alloc_init(NWURLSessionResponseConsumerDownload);
          }

          v91.receiver = 0;
          v91.super_class = (Class)&v91;
          uint64_t v92 = 0x3032000000;
          os_log_type_t v93 = __Block_byref_object_copy__46156;
          BOOL v94 = __Block_byref_object_dispose__46157;
          id v95 = 0;
          if (v55) {
            id v65 = v55[53];
          }
          else {
            id v65 = 0;
          }
          id v66 = v65;
          id v67 = [(id)v3 response];
          v82.receiver = (id)MEMORY[0x1E4F143A8];
          v82.super_class = (Class)3221225472;
          v83 = __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke;
          id v84 = &unk_1E5242548;
          os_log_type_t v85 = &v91;
          [v66 task:v55 deliverResponse:v67 completionHandler:&v82];

          if (v55)
          {
            *((unsigned char *)v55 + 13) = 0;
            v55[36] = (id)1;
          }
          id v68 = *(id *)(v3 + 264);
          [v68 updateClient:v55];

          -[NWURLSessionTask setLoader:](v3);
          v69 = -[NWURLSessionTask delegateWrapper]((void *)v3);
          *(void *)id v86 = MEMORY[0x1E4F143A8];
          *(void *)&v86[8] = 3221225472;
          *(void *)&v86[16] = __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke_2;
          id v87 = &unk_1E5242570;
          uint64_t v88 = v3;
          unint64_t v70 = v55;
          id v89 = v70;
          char v90 = &v91;
          -[NWURLSessionDelegateWrapper dataTask:didBecomeDownloadTask:completionHandler:]((uint64_t)v69, (void *)v3, v70, v86);

          _Block_object_dispose(&v91, 8);
          break;
        case 0:
          __int16 v36 = -[NWURLSessionTask errorForErrorCode:]((id *)v3, -999);
          [(id)v3 completeTaskWithError:v36];

          break;
      }
      goto LABEL_22;
    }
    SecTrustRef v6 = [*(id *)(v3 + 264) multipartMixedReplaceBoundary];
    if (!v6)
    {
LABEL_21:
      -[NWURLSessionTask readResponseBody](v3);

LABEL_22:
      return;
    }
    id v7 = [NWURLSessionMultipartParser alloc];
    uint64_t v8 = *(void **)(v3 + 424);
    double v9 = *(void **)(v3 + 232);
    id v10 = v9;
    id v11 = v8;
    id v81 = v6;
    id v12 = v11;
    id v13 = v10;
    if (!v7
      || (v82.receiver = v7,
          v82.super_class = (Class)NWURLSessionMultipartParser,
          dispatch_time_t v14 = (NWURLSessionMultipartParser *)objc_msgSendSuper2(&v82, sel_init),
          (id v7 = v14) == 0))
    {
LABEL_20:

      int v35 = *(void **)(v3 + 272);
      *(void *)(v3 + 272) = v7;

      goto LABEL_21;
    }
    v14->_parserState = 0;
    v14->_dispositionState = 0;
    objc_storeStrong((id *)&v14->_responseConsumer, v8);
    p_boundary = (id *)&v7->_boundary;
    objc_storeStrong((id *)&v7->_boundary, v6);
    objc_storeStrong((id *)&v7->_data, MEMORY[0x1E4F14410]);
    uint64_t v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    headers = v7->_headers;
    v7->_headers = v16;

    uint64_t v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    parts = v7->_parts;
    v7->_parts = v18;

    objc_storeStrong((id *)&v7->_queue, v9);
    id v20 = (void *)[(NSString *)v7->_boundary mutableCopy];
    if ([(NSString *)v7->_boundary length] < 3
      || [*p_boundary characterAtIndex:0] != 45
      || [*p_boundary characterAtIndex:1] != 45)
    {
      [v20 insertString:@"--" atIndex:0];
    }
    v7->_boundaryPatternSize = [v20 lengthOfBytesUsingEncoding:5];
    uint64_t v21 = [NWURLSessionMultipartBoundaryRecognizer alloc];
    id v22 = v20;
    if (!v21)
    {
      id v23 = 0;
      goto LABEL_19;
    }
    v91.receiver = v21;
    v91.super_class = (Class)NWURLSessionMultipartBoundaryRecognizer;
    id v23 = (NWURLSessionMultipartBoundaryRecognizer *)objc_msgSendSuper2(&v91, sel_init);
    if (!v23)
    {
LABEL_19:

      boundaryRecognizer = v7->_boundaryRecognizer;
      v7->_boundaryRecognizer = v23;

      id v31 = objc_alloc_init(NWURLSessionMultipartPartBoundarySuffixRecognizer);
      boundarySuffixRecognizer = v7->_boundarySuffixRecognizer;
      v7->_boundarySuffixRecognizer = v31;

      id v33 = objc_alloc_init(NWURLSessionMultipartHeaderRecognizer);
      headerRecognizer = v7->_headerRecognizer;
      v7->_headerRecognizer = v33;

      *(_WORD *)&v7->_isFirstBoundary = 1;
      goto LABEL_20;
    }
    uint64_t v24 = [v22 lengthOfBytesUsingEncoding:1];
    v23->_patternLength = v24;
    size_t v25 = v24 + 1;
    if (v24 == -1)
    {
      long long v77 = __nwlog_obj();
      os_log_type_enabled(v77, OS_LOG_TYPE_ERROR);
      *(_DWORD *)id v86 = 136446210;
      *(void *)&v86[4] = "strict_malloc";
      LODWORD(v74) = 12;
      long long v73 = v86;
      long long v71 = (void *)_os_log_send_and_compose_impl();

      if (__nwlog_abort((uint64_t)v71)) {
        goto LABEL_62;
      }
      free(v71);
    }
    unint64_t v26 = (char *)malloc_type_malloc(v25, 0xF2B69DE5uLL);
    if (!v26)
    {
      long long v78 = __nwlog_obj();
      os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);
      *(_DWORD *)id v86 = 136446466;
      *(void *)&v86[4] = "strict_malloc";
      *(_WORD *)&v86[12] = 2048;
      *(void *)&v86[14] = v25;
      LODWORD(v74) = 22;
      long long v73 = v86;
      long long v75 = (void *)_os_log_send_and_compose_impl();

      if (__nwlog_abort((uint64_t)v75)) {
        goto LABEL_62;
      }
      free(v75);
    }
    v23->_pattern = v26;
    objc_msgSend(v22, "getCString:maxLength:encoding:", v26, v23->_patternLength + 1, 1, v73, v74);
    uint64_t v27 = [v22 lengthOfBytesUsingEncoding:1];
    size_t v28 = v27 + 1;
    v23->_rollbackBufferCapacity = v27 + 1;
    if (v27 != -1)
    {
LABEL_17:
      id v29 = (char *)malloc_type_malloc(v28, 0xF2B69DE5uLL);
      if (v29)
      {
LABEL_18:
        v23->_rollbackBuffer = v29;
        goto LABEL_19;
      }
      v80 = __nwlog_obj();
      os_log_type_enabled(v80, OS_LOG_TYPE_ERROR);
      *(_DWORD *)id v86 = 136446466;
      *(void *)&v86[4] = "strict_malloc";
      *(_WORD *)&v86[12] = 2048;
      *(void *)&v86[14] = v28;
      long long v76 = (void *)_os_log_send_and_compose_impl();

      if (!__nwlog_abort((uint64_t)v76))
      {
        free(v76);
        goto LABEL_18;
      }
      goto LABEL_62;
    }
    uint32_t v79 = __nwlog_obj();
    os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);
    *(_DWORD *)id v86 = 136446210;
    *(void *)&v86[4] = "strict_malloc";
    long long v72 = (void *)_os_log_send_and_compose_impl();

    if (!__nwlog_abort((uint64_t)v72))
    {
      free(v72);
      goto LABEL_17;
    }
LABEL_62:
    __break(1u);
    return;
  }
  id v37 = *(void **)(a1 + 32);

  objc_msgSend(v37, "completeTaskWithError:");
}

- (void)readResponseBody
{
  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 312));
    if (*(void *)(a1 + 288) != 2)
    {
      if (*(unsigned char *)(a1 + 13))
      {
        *(unsigned char *)(a1 + 14) = 1;
      }
      else
      {
        id v2 = *(id *)(a1 + 264);
        v4[0] = MEMORY[0x1E4F143A8];
        v4[1] = 3221225472;
        v4[2] = __36__NWURLSessionTask_readResponseBody__block_invoke;
        v4[3] = &unk_1E5248D70;
        v4[4] = a1;
        id v5 = v2;
        id v3 = v2;
        [v3 readDataOfMinimumIncompleteLength:1 maximumLength:0x100000 completionHandler:v4];
      }
    }
  }
}

- (void)setConfiguration:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 408), a2);
  }
}

- (void)setClientMetadataForMetrics:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 256), a2);
  }
}

void __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (void)setLoader:(uint64_t)a1
{
}

- (void)delegateWrapper
{
  if (a1)
  {
    uint64_t v2 = 31;
    if (!a1[31]) {
      uint64_t v2 = 30;
    }
    a1 = (id)a1[v2];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (*(void *)(v2 + 288) = 2, (uint64_t v3 = *(void *)(a1 + 32)) != 0)) {
    id v4 = *(os_unfair_lock_s **)(v3 + 400);
  }
  else {
    id v4 = 0;
  }
  -[NWURLSession taskStarted:](v4, *(void **)(a1 + 40));
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    SecTrustRef v6 = (os_unfair_lock_s *)v5[50];
  }
  else {
    SecTrustRef v6 = 0;
  }
  -[NWURLSession taskCompleted:](v6, v5);
  id v7 = *(void **)(a1 + 40);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(v7, "completeTaskWithError:");
  }
  else
  {
    -[NWURLSessionTask readResponseBody]((uint64_t)v7);
  }
}

void __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (*(void *)(v2 + 288) = 2, (uint64_t v3 = *(void *)(a1 + 32)) != 0)) {
    id v4 = *(os_unfair_lock_s **)(v3 + 400);
  }
  else {
    id v4 = 0;
  }
  -[NWURLSession taskStarted:](v4, *(void **)(a1 + 40));
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    SecTrustRef v6 = (os_unfair_lock_s *)v5[50];
  }
  else {
    SecTrustRef v6 = 0;
  }

  -[NWURLSession taskCompleted:](v6, v5);
}

- (id)initWithRequest:(int)a3 identifier:(void *)a4 session:
{
  id v8 = a2;
  double v9 = a4;
  if (!a1) {
    goto LABEL_31;
  }
  v48.receiver = a1;
  v48.super_class = (Class)NWURLSessionTask;
  id v10 = (id *)objc_msgSendSuper2(&v48, sel_init);
  a1 = v10;
  if (!v10) {
    goto LABEL_31;
  }
  id v11 = v9 + 8;
  if (!v9) {
    id v11 = 0;
  }
  *((_OWORD *)v10 + 28) = *v11;
  *((_DWORD *)v10 + 116) = a3;
  objc_storeStrong(v10 + 6, a2);
  objc_storeStrong(a1 + 7, a2);
  id v12 = (void *)*MEMORY[0x1E4F18D08];
  a1[10] = (id)*MEMORY[0x1E4F18D08];
  a1[11] = v12;
  a1[14] = v12;
  a1[15] = v12;
  objc_storeStrong(a1 + 50, a4);
  id v13 = [NWURLSessionTaskConfiguration alloc];
  p_uint64_t isa = (id *)&v13->super.isa;
  if (v9)
  {
    id v15 = *((id *)v9 + 12);
    uint64_t v16 = -[NWURLSessionTaskConfiguration initWithConfiguration:task:request:](p_isa, v15, a1, v8);
    id v17 = a1[51];
    a1[51] = v16;

    uint64_t v18 = (void *)*((void *)v9 + 18);
  }
  else
  {
    id v44 = -[NWURLSessionTaskConfiguration initWithConfiguration:task:request:]((id *)&v13->super.isa, 0, a1, v8);
    id v45 = a1[51];
    a1[51] = v44;

    uint64_t v18 = 0;
  }
  objc_storeStrong(a1 + 29, v18);
  if (v9) {
    id v19 = (void *)*((void *)v9 + 20);
  }
  else {
    id v19 = 0;
  }
  objc_storeStrong(a1 + 39, v19);
  *((_DWORD *)a1 + 6) = *MEMORY[0x1E4F18CF0];
  *((unsigned char *)a1 + 8) = 1;
  if (v8)
  {
    id v20 = [NWURLSessionDelegateWrapper alloc];
    if (v9) {
      uint64_t v21 = (void *)*((void *)v9 + 19);
    }
    else {
      uint64_t v21 = 0;
    }
    id v22 = v21;
    id v23 = -[NWURLSessionDelegateWrapper initWithFallbackDelegateWrapper:]((id *)&v20->super.isa, v22);
    id v24 = a1[30];
    a1[30] = v23;

    if (nw_protocol_copy_http_client_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_72_75798);
    }
    singleton = nw_protocol_metadata_create_singleton((void *)nw_protocol_copy_http_client_definition_definition);
    id v26 = a1[32];
    a1[32] = singleton;

    nw_http_client_metadata_create_next_transaction(a1[32], 0);
    uint64_t v27 = [v8 URL];
    size_t v28 = v27;
    if (v27)
    {
      id v29 = [v27 scheme];
      unint64_t v30 = [v29 length] - 2;
      if (v30 >= 4)
      {
      }
      else
      {
        uint64_t v31 = [v29 caseInsensitiveCompare:off_1E523C670[v30]];

        if (v31) {
          goto LABEL_20;
        }
        size_t v28 = (void *)_nw_http_request_create_from_url_request(v8);
        nw_http_client_metadata_set_initial_request(a1[32], v28);
        objc_initWeak(&location.receiver, a1);
        id v32 = a1[32];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __55__NWURLSessionTask_initWithRequest_identifier_session___block_invoke;
        v46[3] = &unk_1E5243FB0;
        objc_copyWeak(&v47, &location.receiver);
        nw_http_client_metadata_set_prevent_timeout_callback(v32, v46);
        objc_destroyWeak(&v47);
        objc_destroyWeak(&location.receiver);
      }
    }

LABEL_20:
    id v33 = [NWURLSessionTaskMetrics alloc];
    id v34 = a1[32];
    id v35 = v34;
    if (v33)
    {
      location.receiver = v33;
      location.super_class = (Class)NWURLSessionTaskMetrics;
      __int16 v36 = (NWURLSessionTaskMetrics *)objc_msgSendSuper2(&location, sel_init);
      id v33 = v36;
      if (v36) {
        objc_storeStrong((id *)&v36->_clientMetadata, v34);
      }
    }

    id v37 = a1[55];
    a1[55] = v33;
  }
  if (ne_tracker_should_save_stacktrace())
  {
    if (v9) {
      id v38 = *((id *)v9 + 12);
    }
    else {
      id v38 = 0;
    }
    char v39 = [v38 _skipsStackTraceCapture];

    if ((v39 & 1) == 0)
    {
      location.receiver = 0;
      uint64_t v40 = ne_tracker_copy_current_stacktrace();
      if (v40)
      {
        uint64_t v41 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v40 length:location.receiver];
        id v42 = a1[47];
        a1[47] = (id)v41;
      }
    }
  }
  *((unsigned char *)a1 + 13) = 1;
  a1[36] = 0;
LABEL_31:

  return a1;
}

void __55__NWURLSessionTask_initWithRequest_identifier_session___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v2 = *((double *)WeakRetained + 41);
    if (v2 > 0.0)
    {
      uint64_t v3 = *((void *)WeakRetained + 42);
      id v5 = WeakRetained;
      if (!v3)
      {
        *((void *)WeakRetained + 42) = -[NWURLSessionTask createTimerWithTimeout:]((uint64_t)WeakRetained, v2);
        goto LABEL_10;
      }
      dispatch_time_t v4 = dispatch_time(0x8000000000000000, (uint64_t)(v2 * 1000000000.0));
      if (*(void *)v3)
      {
        dispatch_source_set_timer(*(dispatch_source_t *)v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
LABEL_10:
        id WeakRetained = v5;
        goto LABEL_11;
      }
      *(void *)(v3 + 32) = v4;
      *(void *)(v3 + 40) = -1;
      id WeakRetained = v5;
      if (*(unsigned char *)(v3 + 48) && *(unsigned char *)(v3 + 49))
      {
        nw_queue_source_run_timer(v3);
        goto LABEL_10;
      }
    }
  }
LABEL_11:
}

void __36__NWURLSessionTask_readResponseBody__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    id v10 = *(void **)(v9 + 264);
    id v11 = (id *)(a1 + 40);
    if (v10 == *(void **)(a1 + 40) && *(void *)(v9 + 288) != 2)
    {
      if (!a3) {
        goto LABEL_15;
      }
LABEL_5:
      id v12 = [v10 trailerFields];
      if (v12)
      {
        id v13 = objc_alloc(MEMORY[0x1E4F1CA60]);
        id v14 = v12;
        uint64_t count = _nw_http_fields_get_count();

        uint64_t v16 = (void *)[v13 initWithCapacity:count];
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_2;
        v48[3] = &unk_1E5242598;
        id v17 = v16;
        id v49 = v17;
        id v18 = v14;
        id v19 = v48;
        _nw_http_fields_enumerate((uint64_t)v18, v19);

        uint64_t v21 = (void *)[v17 copy];
        id v22 = *(void **)(a1 + 32);
        if (v22) {
          objc_setProperty_atomic(v22, v20, v21, 224);
        }
      }
      if ([*v11 requestComplete])
      {
        BOOL v23 = 1;
        uint64_t v24 = *(void *)(a1 + 32);
        if (!v8) {
          goto LABEL_11;
        }
        goto LABEL_16;
      }
LABEL_15:
      BOOL v23 = v8 != 0;
      uint64_t v24 = *(void *)(a1 + 32);
      if (!v8)
      {
LABEL_11:
        size_t v25 = 0;
        if (!v24)
        {
LABEL_36:
          id v32 = 0;
          goto LABEL_37;
        }
LABEL_21:
        double v29 = *(double *)(v24 + 328);
        if (v29 > 0.0)
        {
          uint64_t v30 = *(void *)(v24 + 336);
          if (v30)
          {
            dispatch_time_t v31 = dispatch_time(0x8000000000000000, (uint64_t)(v29 * 1000000000.0));
            if (*(void *)v30)
            {
              dispatch_source_set_timer(*(dispatch_source_t *)v30, v31, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
            }
            else
            {
              *(void *)(v30 + 32) = v31;
              *(void *)(v30 + 40) = -1;
              if (*(unsigned char *)(v30 + 48) && *(unsigned char *)(v30 + 49)) {
                nw_queue_source_run_timer(v30);
              }
            }
          }
          else
          {
            *(void *)(v24 + 336) = -[NWURLSessionTask createTimerWithTimeout:](v24, v29);
          }
        }
        id v32 = *(void **)(a1 + 32);
        if (v32)
        {
          id v33 = (void *)v32[34];
          if (v33)
          {
            id v34 = v33;
            id v35 = [v32 error];
            v44[0] = MEMORY[0x1E4F143A8];
            v44[1] = 3221225472;
            v44[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_3;
            v44[3] = &unk_1E52425C0;
            __int16 v36 = *(void **)(a1 + 40);
            v44[4] = *(void *)(a1 + 32);
            BOOL v46 = v23;
            char v47 = a3;
            id v37 = &v45;
            id v45 = v36;
            -[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]((uint64_t)v34, v32, v7, v23, v35, v44);
LABEL_31:

            id v8 = v25;
            goto LABEL_32;
          }
          id v38 = (void *)v32[53];
LABEL_30:
          id v34 = v38;
          id v35 = [v32 error];
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_6;
          v40[3] = &unk_1E52425C0;
          char v39 = *(void **)(a1 + 40);
          v40[4] = *(void *)(a1 + 32);
          BOOL v42 = v23;
          char v43 = a3;
          id v37 = &v41;
          id v41 = v39;
          [v34 task:v32 deliverData:v7 complete:v23 error:v35 completionHandler:v40];
          goto LABEL_31;
        }
LABEL_37:
        id v38 = 0;
        goto LABEL_30;
      }
LABEL_16:
      id v26 = [(id)v24 error];

      uint64_t v24 = *(void *)(a1 + 32);
      if (v26)
      {
        size_t v25 = v8;
        if (!v24) {
          goto LABEL_36;
        }
      }
      else
      {
        size_t v25 = [*(id *)(a1 + 32) errorWithResumeData:v8];

        size_t v28 = *(void **)(a1 + 32);
        if (!v28) {
          goto LABEL_36;
        }
        objc_setProperty_atomic_copy(v28, v27, v25, 136);
        uint64_t v24 = *(void *)(a1 + 32);
        if (!v24) {
          goto LABEL_36;
        }
      }
      goto LABEL_21;
    }
  }
  else
  {
    id v11 = (id *)(a1 + 40);
    if (!*(void *)(a1 + 40))
    {
      id v10 = 0;
      if (!a3) {
        goto LABEL_15;
      }
      goto LABEL_5;
    }
  }
LABEL_32:
}

uint64_t __36__NWURLSessionTask_readResponseBody__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  SecTrustRef v6 = [NSString stringWithUTF8String:a2];
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  if (v7) {
    [NSString stringWithFormat:@"%@, %s", v7, a4];
  }
  else {
  id v8 = [NSString stringWithUTF8String:a4];
  }
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v6];

  return 1;
}

void __36__NWURLSessionTask_readResponseBody__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = *(void **)(a1 + 32);
  if (!v4 || v4[36] != 2)
  {
    if (v3)
    {
      SecTrustRef v6 = [v4 error];

      dispatch_time_t v4 = *(void **)(a1 + 32);
      if (!v6 && v4)
      {
        objc_setProperty_atomic_copy(v4, v7, v3, 136);
        dispatch_time_t v4 = *(void **)(a1 + 32);
      }
      if (!*(unsigned char *)(a1 + 48))
      {
        [v4 completeTaskWithError:v3];
        goto LABEL_9;
      }
      goto LABEL_5;
    }
    if (*(unsigned char *)(a1 + 48))
    {
LABEL_5:
      -[NWURLSessionTask complete]((uint64_t)v4);
      goto LABEL_9;
    }
    if (*(unsigned char *)(a1 + 49))
    {
      id v5 = *(void **)(a1 + 40);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_4;
      v8[3] = &unk_1E524BAA8;
      v8[4] = v4;
      [v5 notifyRequestCompletion:v8];
    }
    else
    {
      -[NWURLSessionTask readResponseBody]();
    }
  }
LABEL_9:
}

void __36__NWURLSessionTask_readResponseBody__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = *(void **)(a1 + 32);
  if (!v4 || v4[36] != 2)
  {
    if (v3)
    {
      SecTrustRef v6 = [v4 error];

      dispatch_time_t v4 = *(void **)(a1 + 32);
      if (!v6 && v4)
      {
        objc_setProperty_atomic_copy(v4, v7, v3, 136);
        dispatch_time_t v4 = *(void **)(a1 + 32);
      }
      if (!*(unsigned char *)(a1 + 48))
      {
        [v4 completeTaskWithError:v3];
        goto LABEL_9;
      }
      goto LABEL_5;
    }
    if (*(unsigned char *)(a1 + 48))
    {
LABEL_5:
      -[NWURLSessionTask complete]((uint64_t)v4);
      goto LABEL_9;
    }
    if (*(unsigned char *)(a1 + 49))
    {
      id v5 = *(void **)(a1 + 40);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_7;
      v8[3] = &unk_1E524BAA8;
      v8[4] = v4;
      [v5 notifyRequestCompletion:v8];
    }
    else
    {
      -[NWURLSessionTask readResponseBody]();
    }
  }
LABEL_9:
}

uint64_t __36__NWURLSessionTask_readResponseBody__block_invoke_7(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    if (*(void *)(v1 + 288) == 2) {
      return result;
    }
    double v2 = *(void **)(v1 + 424);
  }
  else
  {
    double v2 = 0;
  }
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  id v5 = __36__NWURLSessionTask_readResponseBody__block_invoke_8;
  SecTrustRef v6 = &unk_1E5242A48;
  uint64_t v7 = v1;
  return objc_msgSend(v2, "task:deliverData:complete:error:completionHandler:");
}

void __36__NWURLSessionTask_readResponseBody__block_invoke_8(uint64_t a1, void *a2)
{
  id newValue = a2;
  if (newValue)
  {
    uint64_t v3 = [*(id *)(a1 + 32) error];

    if (!v3)
    {
      id v5 = *(void **)(a1 + 32);
      if (v5) {
        objc_setProperty_atomic_copy(v5, v4, newValue, 136);
      }
    }
  }
  -[NWURLSessionTask complete](*(void *)(a1 + 32));
}

void __36__NWURLSessionTask_readResponseBody__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    if (v1[36] == 2) {
      return;
    }
    uint64_t v2 = v1[34];
  }
  else
  {
    uint64_t v2 = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_5;
  v3[3] = &unk_1E5242A48;
  v3[4] = v1;
  -[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:](v2, v1, 0, 1, 0, v3);
}

void __36__NWURLSessionTask_readResponseBody__block_invoke_5(uint64_t a1, void *a2)
{
  id newValue = a2;
  if (newValue)
  {
    uint64_t v3 = [*(id *)(a1 + 32) error];

    if (!v3)
    {
      id v5 = *(void **)(a1 + 32);
      if (v5) {
        objc_setProperty_atomic_copy(v5, v4, newValue, 136);
      }
    }
  }
  -[NWURLSessionTask complete](*(void *)(a1 + 32));
}

- (int64_t)state
{
  if (self)
  {
    int64_t internalState = self->_internalState;
    if (internalState == 2) {
      return 3;
    }
    if (internalState == 1) {
      return self->_suspended;
    }
  }
  return 1;
}

- (void)setSecTrust:(__SecTrust *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  secTrust = self->_secTrust;
  if (secTrust) {
    CFRelease(secTrust);
  }
  self->_secTrust = a3;
}

- (void)set_internalDelegate:(id)a3
{
  id newValue = a3;
  if (newValue)
  {
    if (self)
    {
      internalDelegateWrapper = self->_internalDelegateWrapper;
      if (internalDelegateWrapper)
      {
LABEL_7:
        objc_setProperty_atomic(internalDelegateWrapper, v4, newValue, 16);
        goto LABEL_10;
      }
      SecTrustRef v6 = [NWURLSessionDelegateWrapper alloc];
      publicDelegateWrapper = self->_publicDelegateWrapper;
    }
    else
    {
      SecTrustRef v6 = [NWURLSessionDelegateWrapper alloc];
      publicDelegateWrapper = 0;
    }
    id v8 = publicDelegateWrapper;
    uint64_t v9 = -[NWURLSessionDelegateWrapper initWithFallbackDelegateWrapper:]((id *)&v6->super.isa, v8);
    id v10 = v9;
    if (!self)
    {

      goto LABEL_10;
    }
    objc_storeStrong((id *)&self->_internalDelegateWrapper, v9);

    internalDelegateWrapper = self->_internalDelegateWrapper;
    uint64_t v4 = (char *)newValue;
    if (!internalDelegateWrapper) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  uint64_t v4 = 0;
  if (!self) {
    goto LABEL_11;
  }
  id v11 = self->_internalDelegateWrapper;
  self->_internalDelegateWrapper = 0;

LABEL_10:
  uint64_t v4 = (char *)newValue;
LABEL_11:
}

- (NSURLSessionTaskDelegate)_internalDelegate
{
  if (self && (internalDelegateWrapper = self->_internalDelegateWrapper) != 0) {
    return (NSURLSessionTaskDelegate *)objc_getProperty(internalDelegateWrapper, a2, 16, 1);
  }
  else {
    return 0;
  }
}

- (void)setDelegate:(id)a3
{
  if (self)
  {
    publicDelegateWrapper = self->_publicDelegateWrapper;
    if (publicDelegateWrapper) {
      objc_setProperty_atomic(publicDelegateWrapper, a2, a3, 16);
    }
  }
}

- (NSURLSessionTaskDelegate)delegate
{
  if (self && (publicDelegateWrapper = self->_publicDelegateWrapper) != 0) {
    return (NSURLSessionTaskDelegate *)objc_getProperty(publicDelegateWrapper, a2, 16, 1);
  }
  else {
    return 0;
  }
}

- (NSURLResponse)response
{
  if (self) {
    self = (NWURLSessionTask *)self->_responseConsumer;
  }
  return [(NWURLSessionTask *)self response];
}

- (unint64_t)taskIdentifier
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(NWURLSessionTask *)self logDescription];
  return v3;
}

- (void)cancel
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  unsigned int v3 = (id)gurlLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [(NWURLSessionTask *)self logDescription];
    [(NWURLSessionTask *)self logDescription];
    *(_DWORD *)buf = 68289282;
    int v9 = 16;
    __int16 v10 = 2098;
    id v11 = &v7;
    __int16 v12 = 1024;
    int v13 = v6;
    _os_log_impl(&dword_1830D4000, v3, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> cancelling", buf, 0x18u);
  }

  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__NWURLSessionTask_cancel__block_invoke;
  v5[3] = &unk_1E524BAA8;
  v5[4] = self;
  dispatch_async(queue, v5);
}

void __26__NWURLSessionTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = [NWURLError alloc];
    id v3 = v1[33];
    uint64_t v4 = v1;
    if (v2
      && (uint64_t v5 = *MEMORY[0x1E4F289A0],
          v8.receiver = v2,
          v8.super_class = (Class)NWURLError,
          (id v6 = objc_msgSendSuper2(&v8, sel_initWithDomain_code_userInfo_, v5, -999, 0)) != 0))
    {
      id v7 = v6;
      [v6 fillErrorForLoader:v3 andTask:v4];
    }
    else
    {
      id v7 = 0;
    }

    [v1 completeTaskWithError:v7];
  }
  else
  {
    id v7 = 0;
    [0 completeTaskWithError:0];
  }
}

- (void)suspend
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  id v3 = (id)gurlLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [(NWURLSessionTask *)self logDescription];
    [(NWURLSessionTask *)self logDescription];
    *(_DWORD *)buf = 68289282;
    int v9 = 16;
    __int16 v10 = 2098;
    id v11 = &v7;
    __int16 v12 = 1024;
    int v13 = v6;
    _os_log_impl(&dword_1830D4000, v3, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> suspending", buf, 0x18u);
  }

  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__NWURLSessionTask_suspend__block_invoke;
  v5[3] = &unk_1E524BAA8;
  v5[4] = self;
  dispatch_async(queue, v5);
}

uint64_t __27__NWURLSessionTask_suspend__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    *(unsigned char *)(v1 + 13) = 1;
  }
  return result;
}

- (void)resume
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v35 = 0uLL;
  id v3 = [(NWURLSessionTask *)self _nw_activity];
  uint64_t v4 = v3;
  if (v3)
  {
    nw_activity_activate(v3);
    nw_activity_get_token(v4, &v35);
  }
  if (__nwlog_url_log::onceToken != -1) {
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
  }
  uint64_t v5 = (id)gurlLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [(NWURLSessionTask *)self logDescription];
    [(NWURLSessionTask *)self logDescription];
    if (self)
    {
      int v6 = self->_configuration;
      p_uint64_t isa = (id *)&v6->super.isa;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      if (v6)
      {
        if ([(NSURLRequest *)v6->_request _explicitlySetTimeoutInterval]) {
          [p_isa[4] timeoutInterval];
        }
        else {
          [p_isa[2] timeoutIntervalForRequest];
        }
        uint64_t v9 = v10;
      }
      configuration = self->_configuration;
      if (configuration)
      {
        [(NWURLSessionTask *)configuration->_task _timeoutIntervalForResource];
        if (v12 == 0.0) {
          [(NSURLSessionConfiguration *)configuration->_configuration timeoutIntervalForResource];
        }
        else {
          [(NWURLSessionTask *)configuration->_task _timeoutIntervalForResource];
        }
        uint64_t v8 = v13;
      }
    }
    else
    {
      p_uint64_t isa = 0;
      uint64_t v9 = 0;
      uint64_t v8 = 0;
    }
    qos_class_t v14 = qos_class_self();
    *(_DWORD *)buf = 68290562;
    int v20 = 16;
    __int16 v21 = 2098;
    id v22 = &v18;
    __int16 v23 = 1024;
    int v24 = v17;
    __int16 v25 = 2048;
    uint64_t v26 = v9;
    __int16 v27 = 2048;
    uint64_t v28 = v8;
    __int16 v29 = 1024;
    qos_class_t v30 = v14;
    __int16 v31 = 1042;
    int v32 = 16;
    __int16 v33 = 2098;
    id v34 = &v35;
    _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> resuming, timeouts(%.1f, %.1f), qos(0x%x), activity(%{public,uuid_t}.16P)", buf, 0x42u);
  }
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __26__NWURLSessionTask_resume__block_invoke;
  v16[3] = &unk_1E524BAA8;
  v16[4] = self;
  dispatch_async(queue, v16);
}

void __26__NWURLSessionTask_resume__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1 || (*(unsigned char *)(v1 + 13) & 1) == 0) {
    return;
  }
  *(unsigned char *)(v1 + 13) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3)
  {
    char v7 = 0;
LABEL_13:
    uint64_t v8 = (os_unfair_lock_s *)(id)v3;
    -[NWURLSession taskStarted:](v8, v7);
    [*(id *)(a1 + 32) startNextLoad:1];
LABEL_14:

    return;
  }
  if (!*(void *)(v3 + 288))
  {
    *(void *)(v3 + 288) = 1;
    char v7 = *(void **)(a1 + 32);
    if (v7) {
      uint64_t v3 = v7[50];
    }
    else {
      uint64_t v3 = 0;
    }
    goto LABEL_13;
  }
  if (!*(unsigned char *)(v3 + 14)
    || (*(unsigned char *)(v3 + 14) = 0,
        -[NWURLSessionTask readResponseBody](*(void *)(a1 + 32)),
        (uint64_t v3 = *(void *)(a1 + 32)) != 0))
  {
    uint64_t v4 = (os_unfair_lock_s *)*(id *)(v3 + 296);
    if (v4)
    {
      uint64_t v8 = v4;
      int v6 = *(void **)(a1 + 32);
      if (v6) {
        objc_setProperty_nonatomic_copy(v6, v5, 0, 296);
      }
      (*(void (**)(void))&v8[4]._os_unfair_lock_opaque)();
      goto LABEL_14;
    }
  }
}

- (void)dealloc
{
  [(NWURLSessionTask *)self setSecTrust:0];
  v3.receiver = self;
  v3.super_class = (Class)NWURLSessionTask;
  [(NWURLSessionTask *)&v3 dealloc];
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NWURLSessionTask;
  if (-[NWURLSessionTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

- (void)setCountOfBytesExpectedToReceive:(void *)result
{
  if (result)
  {
    objc_super v3 = result;
    [result willChangeValueForKey:@"countOfBytesExpectedToReceive"];
    *((void *)v3 + 15) = a2;
    result = (void *)[v3 didChangeValueForKey:@"countOfBytesExpectedToReceive"];
    if (*((void *)v3 + 8))
    {
      if (!*((unsigned char *)v3 + 15))
      {
        id v4 = *((id *)v3 + 45);
        objc_msgSend(*((id *)v3 + 45), "setCompletedUnitCount:", objc_msgSend(v4, "totalUnitCount"));

        uint64_t v5 = *MEMORY[0x1E4F28858];
        int v6 = [v3 progress];
        [v6 setFileOperationKind:v5];

        char v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "countOfBytesReceived"));
        uint64_t v8 = [v3 progress];
        [v8 setByteCompletedCount:v7];

        uint64_t v9 = [NSNumber numberWithLongLong:a2];
        uint64_t v10 = [v3 progress];
        [v10 setByteTotalCount:v9];

        if (a2 >= 1) {
          uint64_t v11 = a2;
        }
        else {
          uint64_t v11 = 100;
        }
        *((unsigned char *)v3 + 17) = a2 < 1;
        double v12 = (void *)*((void *)v3 + 46);
        return (void *)[v12 setTotalUnitCount:v11];
      }
    }
  }
  return result;
}

- (void)setCountOfBytesReceived:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 willChangeValueForKey:@"countOfBytesReceived"];
    *(void *)(a1 + 104) = a2;
    [(id)a1 didChangeValueForKey:@"countOfBytesReceived"];
    if (*(void *)(a1 + 64))
    {
      if (!*(unsigned char *)(a1 + 15))
      {
        id v4 = [NSNumber numberWithLongLong:a2];
        uint64_t v5 = [(id)a1 progress];
        [v5 setByteCompletedCount:v4];

        int v6 = *(void **)(a1 + 368);
        if (*(unsigned char *)(a1 + 17))
        {
          id v7 = v6;
          uint64_t v8 = [v7 completedUnitCount];
          uint64_t v9 = [*(id *)(a1 + 368) totalUnitCount] - 1;

          if (v8 < v9)
          {
            id v10 = *(id *)(a1 + 368);
            objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
          }
        }
        else
        {
          [v6 setCompletedUnitCount:a2];
        }
      }
    }
  }
}

@end