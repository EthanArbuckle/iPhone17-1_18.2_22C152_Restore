@interface NSURLSession
+ (BOOL)_backgroundServiceAvailable;
+ (NSURLSession)sessionWithConfiguration:(NSURLSessionConfiguration *)configuration;
+ (NSURLSession)sessionWithConfiguration:(NSURLSessionConfiguration *)configuration delegate:(id)delegate delegateQueue:(NSOperationQueue *)queue;
+ (NSURLSession)sharedSession;
+ (__NSURLSessionLocal)_sessionWithConfiguration:(uint64_t)a3 delegate:(uint64_t)a4 delegateQueue:(uint64_t)a5 delegateDispatchQueue:;
+ (id)_sessionWithConfiguration:(id)a3 delegate:(id)a4 delegateDispatchQueue:(id)a5;
+ (uint64_t)_errorFromError:(void *)a3 forTask:;
+ (uint64_t)_sharedSession;
+ (uint64_t)_sharedSessionForConnection;
+ (void)_disableATS;
+ (void)_disableAppSSO;
+ (void)_enumerateHTTPHeaderFieldsWithCFHTTPMessage:(__CFHTTPMessage *)a3 usingBlock:(id)a4;
+ (void)_enumerateHTTPHeaderFieldsWithRequest:(id)a3 usingBlock:(id)a4;
+ (void)_getActiveSessionIdentifiersWithCompletionHandler:(id)a3;
+ (void)_obliterateAllBackgroundSessionsWithCompletionHandler:(id)a3;
+ (void)_releaseProcessAssertionForSessionIdentifier:(id)a3;
+ (void)_sendPendingCallbacksForSessionIdentifier:(id)a3;
+ (void)_strictTrustEvaluate:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (NSOperationQueue)delegateQueue;
- (NSString)_tlsSessionCachePrefix;
- (NSString)sessionDescription;
- (NSURLSession)init;
- (NSURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 delegateDispatchQueue:(id)a6;
- (NSURLSessionConfiguration)_groupConfiguration;
- (NSURLSessionConfiguration)configuration;
- (NSURLSessionDataTask)dataTaskWithRequest:(NSURLRequest *)request;
- (NSURLSessionDataTask)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(void *)completionHandler;
- (NSURLSessionDataTask)dataTaskWithURL:(NSURL *)url;
- (NSURLSessionDataTask)dataTaskWithURL:(NSURL *)url completionHandler:(void *)completionHandler;
- (NSURLSessionDownloadTask)downloadTaskWithRequest:(NSURLRequest *)request;
- (NSURLSessionDownloadTask)downloadTaskWithRequest:(NSURLRequest *)request completionHandler:(void *)completionHandler;
- (NSURLSessionDownloadTask)downloadTaskWithResumeData:(NSData *)resumeData;
- (NSURLSessionDownloadTask)downloadTaskWithResumeData:(NSData *)resumeData completionHandler:(void *)completionHandler;
- (NSURLSessionDownloadTask)downloadTaskWithURL:(NSURL *)url;
- (NSURLSessionDownloadTask)downloadTaskWithURL:(NSURL *)url completionHandler:(void *)completionHandler;
- (NSURLSessionStreamTask)streamTaskWithHostName:(NSString *)hostname port:(NSInteger)port;
- (NSURLSessionStreamTask)streamTaskWithNetService:(NSNetService *)service;
- (NSURLSessionUploadTask)uploadTaskWithRequest:(NSURLRequest *)request fromData:(NSData *)bodyData;
- (NSURLSessionUploadTask)uploadTaskWithRequest:(NSURLRequest *)request fromData:(NSData *)bodyData completionHandler:(void *)completionHandler;
- (NSURLSessionUploadTask)uploadTaskWithRequest:(NSURLRequest *)request fromFile:(NSURL *)fileURL;
- (NSURLSessionUploadTask)uploadTaskWithRequest:(NSURLRequest *)request fromFile:(NSURL *)fileURL completionHandler:(void *)completionHandler;
- (NSURLSessionUploadTask)uploadTaskWithResumeData:(NSData *)resumeData;
- (NSURLSessionUploadTask)uploadTaskWithResumeData:(NSData *)resumeData completionHandler:(void *)completionHandler;
- (NSURLSessionUploadTask)uploadTaskWithStreamedRequest:(NSURLRequest *)request;
- (NSURLSessionWebSocketTask)webSocketTaskWithRequest:(NSURLRequest *)request;
- (NSURLSessionWebSocketTask)webSocketTaskWithURL:(NSURL *)url;
- (OS_nw_context)_networkContext;
- (id).cxx_construct;
- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4;
- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_dataTaskWithTaskForClass:(id)a3;
- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4;
- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_downloadTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_downloadTaskWithRequest:(id)a3 downloadFilePath:(id)a4;
- (id)_downloadTaskWithResumeData:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_downloadTaskWithTaskForClass:(id)a3;
- (id)_downloadTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_uploadTaskWithRequest:(id)a3 fromData:(id)a4 delegate:(id)a5 completionHandler:(id)a6;
- (id)_uploadTaskWithRequest:(id)a3 fromFile:(id)a4 delegate:(id)a5 completionHandler:(id)a6;
- (id)_uploadTaskWithResumeData:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (id)_uploadTaskWithTaskForClass:(id)a3;
- (id)assetDownloadTaskWithConfiguration:(id)a3;
- (id)assetDownloadTaskWithURLAsset:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6;
- (id)dataTaskWithRequest:(id)a3 uniqueIdentifier:(id)a4;
- (id)delegate;
- (id)taskGroupWithConfiguration:(id)a3;
- (uint64_t)_onqueue_didCompleteTask:(void *)a3 withError:;
- (uint64_t)addToHTTPFallbackHosts:(uint64_t)a3 forbiddenProtocols:;
- (uint64_t)delegateOptions;
- (void)_useTLSSessionCacheFromSession:(id)a3;
- (void)dealloc;
- (void)delegate_AVAggregateAssetDownloadTask:(long long *)a3 didLoadTimeRange:(uint64_t)a4 totalTimeRangesLoaded:(long long *)a5 timeRangeExpectedToLoad:(uint64_t)a6 forMediaSelection:;
- (void)delegate_AVAggregateAssetDownloadTask:(uint64_t)a3 didCompleteForMediaSelection:;
- (void)delegate_AVAggregateAssetDownloadTask:(uint64_t)a3 willDownloadToURL:;
- (void)delegate_AVAssetDownloadTask:(uint64_t)a3 didResolveMediaSelection:;
- (void)finalizeDelegateWithError:(uint64_t)a1;
- (void)finishTasksAndInvalidate;
- (void)flushWithCompletionHandler:(void *)completionHandler;
- (void)getAllTasksWithCompletionHandler:(void *)completionHandler;
- (void)getTasksWithCompletionHandler:(void *)completionHandler;
- (void)invalidateAndCancel;
- (void)resetWithCompletionHandler:(void *)completionHandler;
- (void)runDelegateBlock:(uint64_t)a1;
- (void)setSessionDescription:(NSString *)sessionDescription;
- (void)set_tlsSessionCachePrefix:(id)a3;
@end

@implementation NSURLSession

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (NSString)sessionDescription
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSURLSessionConfiguration)configuration
{
  v2 = (void *)[(NSURLSessionConfiguration *)self->_local_immutable_configuration_ivar mutableCopy];

  return (NSURLSessionConfiguration *)v2;
}

- (NSURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 delegateDispatchQueue:(id)a6
{
  v21.receiver = self;
  v21.super_class = (Class)NSURLSession;
  id v10 = [(NSURLSession *)&v21 init];
  if (!v10) {
    return (NSURLSession *)v10;
  }
  if (!a3) {
    a3 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  }
  *((void *)v10 + 14) = [a3 copyImmutableVariant:&__block_literal_global_122];
  *((void *)v10 + 10) = a5;
  *((void *)v10 + 12) = a4;
  if (a6)
  {
    *((void *)v10 + 11) = a6;
    v11 = a6;
  }
  else
  {
    if ((id)[MEMORY[0x1E4F28F08] mainQueue] != a5)
    {
      if (!a5)
      {
        v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        *((void *)v10 + 11) = dispatch_queue_create("com.apple.NSURLSession-delegate", v19);
      }
      goto LABEL_7;
    }
    v11 = MEMORY[0x1E4F14428];
    *((void *)v10 + 11) = MEMORY[0x1E4F14428];
  }
  dispatch_retain(v11);
LABEL_7:
  v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  *((void *)v10 + 15) = dispatch_queue_create("com.apple.NSURLSession-work", v12);
  id v13 = objc_alloc_init(MEMORY[0x1E4F29128]);
  *((void *)v10 + 16) = v13;
  *((void *)v10 + 17) = objc_msgSend((id)objc_msgSend(v13, "UUIDString"), "copy");
  self;
  if (+[__CFN_ConnectionContextManager sharedManager]::onceToken != -1) {
    dispatch_once(&+[__CFN_ConnectionContextManager sharedManager]::onceToken, &__block_literal_global_16208);
  }
  uint64_t v14 = _sharedManager;
  *((void *)v10 + 1) = _sharedManager;
  [(__CFN_ConnectionContextManager *)&v20 registerSession:(uint64_t)v10];
  v15 = (std::__shared_weak_count *)*((void *)v10 + 3);
  *((_OWORD *)v10 + 1) = v20;
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v15);
  }
  *((_DWORD *)v10 + 10) = 0;
  v16 = -[__NSCFURLSessionDelegateWrapper initWithSession:]((id *)[__NSCFURLSessionDelegateWrapper alloc], v10);
  *((void *)v10 + 9) = v16;
  if (v16) {
    objc_setProperty_atomic(v16, v17, a4, 32);
  }
  return (NSURLSession *)v10;
}

- (NSURLSessionConfiguration)_groupConfiguration
{
  return self->_local_immutable_configuration_ivar;
}

- (NSString)_tlsSessionCachePrefix
{
  return self->_tlsSessionCachePrefix;
}

uint64_t __83__NSURLSession_initWithConfiguration_delegate_delegateQueue_delegateDispatchQueue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _appleIDContext];
  if (result)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "_appleIDContext"), "relevantHTTPStatusCodes");
    return objc_msgSend(a2, "set_authenticatorStatusCodes:", v4);
  }
  return result;
}

+ (NSURLSession)sessionWithConfiguration:(NSURLSessionConfiguration *)configuration delegate:(id)delegate delegateQueue:(NSOperationQueue *)queue
{
  return (NSURLSession *)+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]((uint64_t)NSURLSession, configuration, (uint64_t)delegate, (uint64_t)queue, 0);
}

void __42__NSURLSession_finalizeDelegateWithError___block_invoke(uint64_t a1)
{
}

- (void)runDelegateBlock:(uint64_t)a1
{
  if (a1)
  {
    if (*(void *)(a1 + 88)) {
      dispatch_async(*(dispatch_queue_t *)(a1 + 88), a2);
    }
    else {
      [*(id *)(a1 + 80) addOperationWithBlock:a2];
    }
  }
}

uint64_t __35__NSURLSession_invalidateAndCancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_completeInvalidation:", 1);
}

void __51__NSURLSession__onqueue_didCompleteTask_withError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_disavow");
  objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_cleanupAndBreakCycles");
  uint64_t v3 = *(void *)(a1 + 32);

  [(NSURLSessionTask *)v3 _resetTaskDelegate];
}

- (uint64_t)_onqueue_didCompleteTask:(void *)a3 withError:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v4 = (void *)+[NSURLSession _errorFromError:forTask:]((uint64_t)NSURLSession, a3, a2);
  [a2 setState:3];
  if (!v4)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v5 = CFNLog::logger;
    if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = [a2 _loggableDescription];
    v6 = "%{public}@ finished successfully";
LABEL_18:
    v11 = v5;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    uint32_t v13 = 12;
LABEL_22:
    _os_log_impl(&dword_184085000, v11, v12, v6, buf, v13);
    goto LABEL_23;
  }
  if ([a2 _cacheOnly] && objc_msgSend(v4, "code") == -2000)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v5 = CFNLog::logger;
    if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = [a2 _loggableDescription];
    v6 = "%{public}@ finished - cache miss";
    goto LABEL_18;
  }
  os_log_type_t v7 = 16 * ([v4 code] != -999);
  int v8 = objc_msgSend((id)objc_msgSend(a2, "_effectiveConfiguration"), "_loggingPrivacyLevel");
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  uint64_t v9 = CFNLog::logger;
  BOOL v10 = os_log_type_enabled((os_log_t)CFNLog::logger, v7);
  if (v8 > 2)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543875;
      uint64_t v17 = [a2 _loggableDescription];
      __int16 v18 = 2048;
      uint64_t v19 = [v4 code];
      __int16 v20 = 2117;
      objc_super v21 = v4;
      v6 = "%{public}@ finished with error [%ld] %{sensitive}@";
      goto LABEL_21;
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v17 = [a2 _loggableDescription];
    __int16 v18 = 2048;
    uint64_t v19 = [v4 code];
    __int16 v20 = 2112;
    objc_super v21 = v4;
    v6 = "%{public}@ finished with error [%ld] %@";
LABEL_21:
    v11 = v9;
    os_log_type_t v12 = v7;
    uint32_t v13 = 32;
    goto LABEL_22;
  }
LABEL_23:
  if (a2)
  {
    uint64_t v14 = a2[88];
    if (!v14) {
      uint64_t v14 = a2[87];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__NSURLSession__onqueue_didCompleteTask_withError___block_invoke;
  v15[3] = &unk_1E5258228;
  v15[4] = a2;
  -[__NSCFURLSessionDelegateWrapper task:didCompleteWithError:completionHandler:](v14, a2, v4, v15);
  return +[__NSURLSessionStatistics reportMetricsToSymptoms:a2];
}

+ (uint64_t)_errorFromError:(void *)a3 forTask:
{
  self;
  if (!a2) {
    return 0;
  }
  if ([a2 userInfo]) {
    id v5 = (id)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "mutableCopy");
  }
  else {
    id v5 = (id)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  }
  os_log_type_t v7 = v5;
  if ([v5 objectForKeyedSubscript:@"_NSURLErrorRelatedURLSessionTaskErrorKey"]) {
    id v8 = (id)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"_NSURLErrorRelatedURLSessionTaskErrorKey"), "mutableCopy");
  }
  else {
    id v8 = (id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  }
  uint64_t v9 = v8;
  objc_msgSend(v8, "insertObject:atIndex:", objc_msgSend(a3, "_description"), 0);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", (id)objc_msgSend(v9, "copy"), @"_NSURLErrorRelatedURLSessionTaskErrorKey");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "_description"), @"_NSURLErrorFailingURLSessionTaskErrorKey");
  BOOL v10 = (void *)MEMORY[0x1E4F290A8];
  uint64_t v11 = [a2 domain];
  uint64_t v12 = [a2 code];

  return [v10 errorWithDomain:v11 code:v12 userInfo:v7];
}

- (void).cxx_destruct
{
  cntrl = self->_nwContext.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

+ (id)_sessionWithConfiguration:(id)a3 delegate:(id)a4 delegateDispatchQueue:(id)a5
{
  return +[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]((uint64_t)NSURLSession, (NSURLSessionConfiguration *)a3, (uint64_t)a4, 0, (uint64_t)a5);
}

+ (uint64_t)_sharedSessionForConnection
{
  self;
  uint64_t v0 = +[NSURLSession _sharedSession]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (+[NSURLSession _sharedSessionForConnection]::sOnce != -1) {
      dispatch_once(&+[NSURLSession _sharedSessionForConnection]::sOnce, &__block_literal_global_45);
    }
    return +[NSURLSession _sharedSessionForConnection]::sSharedSession;
  }
  return v0;
}

+ (uint64_t)_sharedSession
{
  uint64_t v0 = self;
  if ([v0 isEqual:objc_opt_class()])
  {
    v1 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v2 = *MEMORY[0x1E4F1C3C8];
    Name = sel_getName(sel__sharedSession);
    uint64_t v4 = (objc_class *)objc_opt_class();
    objc_msgSend(v1, "raise:format:", v2, @"*** -%s is not supported by %s", Name, class_getName(v4));
  }
  if (+[NSURLSession _sharedSession]::sOnce != -1) {
    dispatch_once(&+[NSURLSession _sharedSession]::sOnce, &__block_literal_global_40_15158);
  }
  return +[NSURLSession _sharedSession]::sSharedSession;
}

- (NSURLSessionUploadTask)uploadTaskWithRequest:(NSURLRequest *)request fromData:(NSData *)bodyData completionHandler:(void *)completionHandler
{
  uint64_t v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  uint64_t v11 = v9;
  if (v9)
  {
    objc_setProperty_atomic(v9, v10, request, 16);
    objc_setProperty_atomic(v11, v12, bodyData, 40);
    objc_setProperty_atomic_copy(v11, v13, completionHandler, 48);
  }
  id v14 = v11;

  return (NSURLSessionUploadTask *)[(NSURLSession *)self _uploadTaskWithTaskForClass:v14];
}

- (NSURLSessionUploadTask)uploadTaskWithRequest:(NSURLRequest *)request fromData:(NSData *)bodyData
{
  os_log_type_t v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  uint64_t v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, request, 16);
    objc_setProperty_atomic(v9, v10, bodyData, 40);
  }
  id v11 = v9;

  return (NSURLSessionUploadTask *)[(NSURLSession *)self _uploadTaskWithTaskForClass:v11];
}

- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  uint64_t v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  SEL v10 = +[NSURLRequest requestWithURL:a3];
  if (v9)
  {
    objc_setProperty_atomic(v9, v11, v10, 16);
    objc_setProperty_atomic_copy(v9, v12, a5, 48);
    objc_setProperty_atomic(v9, v13, a4, 80);
  }
  id v14 = v9;

  return [(NSURLSession *)self _dataTaskWithTaskForClass:v14];
}

- (NSURLSessionDataTask)dataTaskWithURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  os_log_type_t v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  id v8 = +[NSURLRequest requestWithURL:url];
  if (v7)
  {
    objc_setProperty_atomic(v7, v9, v8, 16);
    objc_setProperty_atomic_copy(v7, v10, completionHandler, 48);
  }
  id v11 = v7;

  return (NSURLSessionDataTask *)[(NSURLSession *)self _dataTaskWithTaskForClass:v11];
}

- (NSURLSessionDataTask)dataTaskWithURL:(NSURL *)url
{
  id v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  v6 = +[NSURLRequest requestWithURL:url];
  if (v5) {
    objc_setProperty_atomic(v5, v7, v6, 16);
  }
  id v8 = v5;

  return (NSURLSessionDataTask *)[(NSURLSession *)self _dataTaskWithTaskForClass:v8];
}

- (NSURLSessionUploadTask)uploadTaskWithRequest:(NSURLRequest *)request fromFile:(NSURL *)fileURL
{
  os_log_type_t v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  uint64_t v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, request, 16);
    objc_setProperty_atomic(v9, v10, fileURL, 32);
  }
  id v11 = v9;

  return (NSURLSessionUploadTask *)[(NSURLSession *)self _uploadTaskWithTaskForClass:v11];
}

- (NSURLSessionDownloadTask)downloadTaskWithRequest:(NSURLRequest *)request
{
  id v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  os_log_type_t v7 = v5;
  if (v5) {
    objc_setProperty_atomic(v5, v6, request, 16);
  }
  id v8 = v7;

  return (NSURLSessionDownloadTask *)[(NSURLSession *)self _downloadTaskWithTaskForClass:v8];
}

- (id)_downloadTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  uint64_t v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  SEL v10 = +[NSURLRequest requestWithURL:a3];
  if (v9)
  {
    objc_setProperty_atomic(v9, v11, v10, 16);
    objc_setProperty_atomic_copy(v9, v12, a5, 72);
    objc_setProperty_atomic(v9, v13, a4, 80);
  }
  id v14 = v9;

  return [(NSURLSession *)self _downloadTaskWithTaskForClass:v14];
}

- (NSURLSessionDataTask)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(void *)completionHandler
{
  os_log_type_t v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  uint64_t v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, request, 16);
    objc_setProperty_atomic_copy(v9, v10, completionHandler, 48);
  }
  id v11 = v9;

  return (NSURLSessionDataTask *)[(NSURLSession *)self _dataTaskWithTaskForClass:v11];
}

- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  uint64_t v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  id v11 = v9;
  if (v9)
  {
    objc_setProperty_atomic(v9, v10, a3, 16);
    objc_setProperty_atomic_copy(v11, v12, a5, 48);
    objc_setProperty_atomic(v11, v13, a4, 80);
  }
  id v14 = v11;

  return [(NSURLSession *)self _dataTaskWithTaskForClass:v14];
}

- (NSURLSessionDataTask)dataTaskWithRequest:(NSURLRequest *)request
{
  id v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  os_log_type_t v7 = v5;
  if (v5) {
    objc_setProperty_atomic(v5, v6, request, 16);
  }
  id v8 = v7;

  return (NSURLSessionDataTask *)[(NSURLSession *)self _dataTaskWithTaskForClass:v8];
}

+ (void)_obliterateAllBackgroundSessionsWithCompletionHandler:(id)a3
{
  if (+[NSURLSession _backgroundServiceAvailable])
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nsurlsessiond" options:0];
    objc_msgSend(v4, "setRemoteObjectInterface:", +[__NSCFURLSessionXPC bgSessionManagerInterface](__NSCFURLSessionXPC, "bgSessionManagerInterface"));
    [v4 resume];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__NSURLSession__obliterateAllBackgroundSessionsWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E5256880;
    v8[4] = v4;
    v8[5] = a3;
    id v5 = (void *)[v4 remoteObjectProxyWithErrorHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__NSURLSession__obliterateAllBackgroundSessionsWithCompletionHandler___block_invoke_55;
    v7[3] = &unk_1E5258028;
    v7[4] = v4;
    v7[5] = a3;
    [v5 obliterateAllSessionsWithReply:v7];
  }
  else
  {
    v6 = (void (*)(id))*((void *)a3 + 2);
    v6(a3);
  }
}

+ (BOOL)_backgroundServiceAvailable
{
  if (+[NSURLSession _backgroundServiceAvailable]::onceToken != -1) {
    dispatch_once(&+[NSURLSession _backgroundServiceAvailable]::onceToken, &__block_literal_global_15161);
  }
  return +[NSURLSession _backgroundServiceAvailable]::available;
}

uint64_t __49__NSURLSession_getAllTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_getTasksWithCompletionHandler:", *(void *)(a1 + 40));
}

- (void)setSessionDescription:(NSString *)sessionDescription
{
}

+ (NSURLSession)sharedSession
{
  return (NSURLSession *)+[NSURLSession _sharedSession]();
}

uint64_t __87__NSURLSession__sessionWithConfiguration_delegate_delegateQueue_delegateDispatchQueue___block_invoke()
{
  uint64_t result = objc_opt_new();
  gBackgroundSessions = result;
  return result;
}

uint64_t __30__NSURLSession__sharedSession__block_invoke()
{
  +[NSURLSession _sharedSession]::sSharedSession = +[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]((uint64_t)NSURLSession, (NSURLSessionConfiguration *)+[NSURLSessionConfiguration sessionConfigurationForSharedSession], 0, 0, 0);
  objc_getClass("NWURLSession");
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
  {
    if (+[NSURLSession _sharedSession]::sSharedSession) {
      *(unsigned char *)(+[NSURLSession _sharedSession]::sSharedSession + 68) = 1;
    }
  }
  return result;
}

- (uint64_t)delegateOptions
{
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[__NSCFURLSessionDelegateWrapper _willSendRequestForEstablishedConnection](*(void *)(a1 + 72), a2));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[__NSCFURLSessionDelegateWrapper sessionDidReceiveChallenge](*(void *)(a1 + 72), v4));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[__NSCFURLSessionDelegateWrapper didReceiveChallenge](*(void *)(a1 + 72), v6));
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[__NSCFURLSessionDelegateWrapper willBeginDelayedRequest](*(void *)(a1 + 72), v8));
  id v11 = NSNumber;
  uint64_t v12 = *(void *)(a1 + 72);
  if (v12)
  {
    if ([(__NSCFURLSessionDelegateWrapper *)*(unsigned __int8 **)(a1 + 72) check_willPerformHTTPRedirection]) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = [(__NSCFURLSessionDelegateWrapper *)*(unsigned __int8 **)(v12 + 24) check_willPerformHTTPRedirection];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v15 = [v11 numberWithBool:v14];
  return objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v3, @"NSURLSessionDelegateImplementsWillSendRequestForEstablishedConnectionKey", v5, @"NSURLSessionDelegateImplementsSessionAuthChallengeKey", v7, @"NSURLSessionDelegateImplementsTaskAuthChallengeKey", v10, @"NSURLSessionDelegateImplementsWillBeginDelayedRequestKey", v15, @"NSURLSessionDelegateImplementsWillPerformRedirectionKey", objc_msgSend(NSNumber, "numberWithBool:", -[__NSCFURLSessionDelegateWrapper didReceiveResponse](*(void *)(a1 + 72), v16)), @"NSURLSessionDelegateImplementsDidReceiveResponseKey", 0);
}

+ (__NSURLSessionLocal)_sessionWithConfiguration:(uint64_t)a3 delegate:(uint64_t)a4 delegateQueue:(uint64_t)a5 delegateDispatchQueue:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (id *)self;
  if ([v9 isEqual:objc_opt_class()])
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    Name = sel_getName(sel__sessionWithConfiguration_delegate_delegateQueue_delegateDispatchQueue_);
    SEL v13 = (objc_class *)objc_opt_class();
    objc_msgSend(v10, "raise:format:", v11, @"*** -%s is not supported by %s", Name, class_getName(v13));
  }
  self;
  if ([(NSString *)[(NSURLSessionConfiguration *)a2 disposition] isEqualToString:0x1EC0A58A8]|| [(NSURLSessionConfiguration *)a2 _disablesNWLoader])
  {
    goto LABEL_9;
  }
  if (__CFNUseNWLoader::onceToken != -1) {
    dispatch_once(&__CFNUseNWLoader::onceToken, &__block_literal_global_47);
  }
  if (__CFNUseNWLoader::useNWLoader == 1
    || __CFNUseNWLoader::useNWLoader != 2
    && ([(NSURLSessionConfiguration *)a2 _usesNWLoader]
     || [(NSURLSessionConfiguration *)a2 proxiesRequireNWLoader]
     || (self, gotLoadHelper_x21__OBJC_CLASS___PrivacyProxyClient(v38), objc_opt_class())
     && ([v9[41] currentProcessShouldUseOpaqueProxying] & 1) != 0))
  {
    int v14 = 1;
  }
  else
  {
LABEL_9:
    int v14 = 0;
  }
  if (+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]::onceToken != -1) {
    dispatch_once(&+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]::onceToken, &__block_literal_global_61);
  }
  uint64_t v15 = (void *)MEMORY[0x18531D6D0]();
  if (!a2)
  {
    if (v14)
    {
LABEL_33:
      return (__NSURLSessionLocal *)(id)[objc_alloc(objc_getClass("NWURLSession")) initWithConfiguration:a2 delegate:a3 delegateQueue:a4];
    }
    a2 = +[NSURLSessionConfiguration defaultSessionConfiguration];
LABEL_34:
    v29 = [[__NSURLSessionLocal alloc] initWithConfiguration:a2 delegate:a3 delegateQueue:a4 delegateDispatchQueue:a5];
    if ([(NSURLSessionConfiguration *)a2 _disableAPWakeOnIdleConnections])
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v30 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_184085000, v30, OS_LOG_TYPE_DEFAULT, "Session opted-in for _disableAPWakeOnIdleConnections", (uint8_t *)&buf, 2u);
      }
      v31 = v29;
      if (v29)
      {
        *((_DWORD *)v29 + 13) = 0;
        *((_DWORD *)v29 + 12) = 0;
        *((unsigned char *)v29 + 69) = 0;
        io_connect_t v32 = IORegisterForSystemPower(v29, (IONotificationPortRef *)v29 + 7, (IOServiceInterestCallback)_systemPowerNotificationsCallback, (io_object_t *)v29 + 16);
        *((_DWORD *)v29 + 13) = v32;
        if (v32)
        {
          IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v29 + 7), *((dispatch_queue_t *)v29 + 15));
        }
        else
        {
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
          }
          v40 = CFNLog::logger;
          if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_error_impl(&dword_184085000, v40, OS_LOG_TYPE_ERROR, "Failed to IORegisterForSystemPower", (uint8_t *)&buf, 2u);
          }
        }
      }
    }
    goto LABEL_67;
  }
  if (!CFEqual([(NSURLSessionConfiguration *)a2 disposition], &unk_1EC0A58A8))
  {
    if (v14) {
      goto LABEL_33;
    }
    goto LABEL_34;
  }
  if (![(NSURLSessionConfiguration *)a2 _isProxySession]
    && MKBDeviceUnlockedSinceBoot_delayInitStub(v16) != 1)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v17 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_184085000, v17, OS_LOG_TYPE_ERROR, "Attempting to create a background session before first device unlock!", (uint8_t *)&buf, 2u);
    }
    if (MKBDeviceFormattedForContentProtection_delayInitStub(v18)
      && MKBDeviceUnlockedSinceBoot_delayInitStub(v19) != 1)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      __int16 v20 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_184085000, v20, OS_LOG_TYPE_DEFAULT, "Waiting for first unlock", (uint8_t *)&buf, 2u);
      }
      uint64_t v50 = 0;
      v51 = (int *)&v50;
      uint64_t v52 = 0x2020000000;
      int v53 = 0;
      objc_super v21 = dispatch_semaphore_create(0);
      uint64_t v22 = dispatch_queue_create("com.apple.nsurlsession.wait-unlock", 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___ZL28CFNWaitUntilDeviceIsUnlockedv_block_invoke;
      block[3] = &unk_1E5258228;
      gotLoadHelper_x9__kMobileKeyBagLockStatusNotifyToken(v23);
      v25 = *(const char ***)(v24 + 352);
      block[4] = v21;
      v26 = *v25;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v55 = ___ZL28CFNWaitUntilDeviceIsUnlockedv_block_invoke_386;
      v56 = &unk_1E5256A30;
      uint64_t v57 = v27;
      v58 = &v50;
      if (notify_register_dispatch(v26, v51 + 6, v22, &buf))
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v43 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v44 = 0;
          _os_log_error_impl(&dword_184085000, v43, OS_LOG_TYPE_ERROR, "Failed to regsiter for lock status notification! Calling abort()", v44, 2u);
        }
        abort();
      }
      dispatch_async(v22, block);
      dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
      *(void *)v44 = MEMORY[0x1E4F143A8];
      uint64_t v45 = 3221225472;
      v46 = ___ZL28CFNWaitUntilDeviceIsUnlockedv_block_invoke_387;
      v47 = &unk_1E5257868;
      v48 = &v50;
      dispatch_sync(v22, v44);
      dispatch_release(v22);
      dispatch_release(v21);
      _Block_object_dispose(&v50, 8);
    }
  }
  if ([(NSURLSessionConfiguration *)a2 _isProxySession])
  {
    v29 = [[__NSURLBackgroundSession alloc] initWithConfiguration:a2 delegate:a3 delegateQueue:a4 delegateDispatchQueue:a5];
    goto LABEL_60;
  }
  if (__CFNIsInDevelopmentEnvironment::onceToken != -1) {
    dispatch_once(&__CFNIsInDevelopmentEnvironment::onceToken, &__block_literal_global_30);
  }
  if (__CFNIsInDevelopmentEnvironment::ok)
  {
    gotLoadHelper_x8__CPCopyBundleIdentifierAndTeamFromSecTaskRef(v28);
    if (*(void *)(v33 + 3424))
    {
      if (+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]::onceToken != -1) {
        dispatch_once(&+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]::onceToken, &__block_literal_global_66_15117);
      }
    }
  }
  v34 = objc_opt_class();
  objc_sync_enter(v34);
  if (!objc_msgSend((id)gBackgroundSessions, "objectForKey:", -[NSURLSessionConfiguration identifier](a2, "identifier")))
  {
    v29 = [[__NSURLBackgroundSession alloc] initWithConfiguration:a2 delegate:a3 delegateQueue:a4 delegateDispatchQueue:a5];
    objc_msgSend((id)gBackgroundSessions, "setObject:forKey:", v29, -[NSURLSessionConfiguration identifier](a2, "identifier"));
    objc_sync_exit(v34);
LABEL_60:
    if (v14) {
      return (__NSURLSessionLocal *)(id)[objc_alloc(objc_getClass("NWURLSession")) initWithConfiguration:a2 delegate:a3 delegateQueue:a4];
    }
LABEL_67:
    if ([(NSURLSession *)v29 delegate]) {
      v41 = v29;
    }
    return v29;
  }
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  v35 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = [(NSURLSessionConfiguration *)a2 identifier];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v36;
    _os_log_impl(&dword_184085000, v35, OS_LOG_TYPE_DEFAULT, "A background URLSession with identifier %@ already exists!", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v37 = objc_msgSend((id)gBackgroundSessions, "objectForKey:", -[NSURLSessionConfiguration identifier](a2, "identifier"));
  objc_sync_exit(v34);
  return (__NSURLSessionLocal *)v37;
}

- (id)delegate
{
  return objc_getProperty(self, a2, 96, 1);
}

+ (void)_getActiveSessionIdentifiersWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nsurlsessiond" options:0];
  objc_msgSend(v4, "setRemoteObjectInterface:", +[__NSCFURLSessionXPC bgSessionManagerInterface](__NSCFURLSessionXPC, "bgSessionManagerInterface"));
  [v4 resume];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__NSURLSession__getActiveSessionIdentifiersWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5256880;
  v7[4] = v4;
  v7[5] = a3;
  uint64_t v5 = (void *)[v4 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__NSURLSession__getActiveSessionIdentifiersWithCompletionHandler___block_invoke_53;
  v6[3] = &unk_1E5256858;
  v6[4] = v4;
  v6[5] = a3;
  [v5 getActiveSessionIdentifiersWithReply:v6];
}

+ (NSURLSession)sessionWithConfiguration:(NSURLSessionConfiguration *)configuration
{
  if ([a1 isEqual:objc_opt_class()])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    Name = sel_getName(a2);
    id v8 = (objc_class *)objc_opt_class();
    objc_msgSend(v5, "raise:format:", v6, @"*** -%s is not supported by %s", Name, class_getName(v8));
  }

  return +[NSURLSession sessionWithConfiguration:configuration delegate:0 delegateQueue:0];
}

- (void)invalidateAndCancel
{
  if (self->_isSharedSession_ivar)
  {
    NSLog(&cfstr_NsurlsessionSh.isa, a2);
  }
  else
  {
    objc_sync_enter(self);
    BOOL invalid_ivar = self->_invalid_ivar;
    self->_BOOL invalid_ivar = 1;
    objc_sync_exit(self);
    if (!invalid_ivar)
    {
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __35__NSURLSession_invalidateAndCancel__block_invoke;
      block[3] = &unk_1E5258228;
      block[4] = self;
      dispatch_async(workQueue, block);
    }
  }
}

- (void)set_tlsSessionCachePrefix:(id)a3
{
  tlsSessionCachePrefix = self->_tlsSessionCachePrefix;
  -[__CFN_ConnectionContextManager unregisterSession:]((uint64_t)self->_nwContextManager, (uint64_t)self);
  if (a3) {
    uint64_t v6 = (NSString *)a3;
  }
  else {
    uint64_t v6 = (NSString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), "copy");
  }
  self->_tlsSessionCachePrefix = v6;

  [(__CFN_ConnectionContextManager *)&v8 registerSession:(uint64_t)self];
  cntrl = self->_nwContext.__cntrl_;
  self->_nwContext = v8;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)_useTLSSessionCacheFromSession:(id)a3
{
  uint64_t v4 = [a3 _tlsSessionCachePrefix];

  [(NSURLSession *)self set_tlsSessionCachePrefix:v4];
}

- (void)dealloc
{
  if (self->_isSharedSession_ivar) {
    __assert_rtn("-[NSURLSession dealloc]", "Session.mm", 542, "! _isSharedSession_ivar");
  }
  -[__CFN_ConnectionContextManager unregisterSession:]((uint64_t)self->_nwContextManager, (uint64_t)self);
  workQueue = self->_workQueue;
  if (workQueue)
  {
    dispatch_release(workQueue);
    self->_workQueue = 0;
  }

  self->_uuid_ivar = 0;
  self->_tlsSessionCachePrefix = 0;
  cntrl = self->_nwContext.__cntrl_;
  self->_nwContext.__ptr_ = 0;
  self->_nwContext.__cntrl_ = 0;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  self->_nwContextManager = 0;
  objc_setProperty_atomic(self, v4, 0, 144);
  objc_setProperty_atomic(self, v6, 0, 152);

  self->_sessionDescription_ivar = 0;
  self->_atsState_ivar = 0;

  delegateDispatchQueue = self->_delegateDispatchQueue;
  if (delegateDispatchQueue) {
    dispatch_release(delegateDispatchQueue);
  }

  self->_delegate_ivar = 0;
  self->_local_immutable_configuration_ivar = 0;
  v8.receiver = self;
  v8.super_class = (Class)NSURLSession;
  [(NSURLSession *)&v8 dealloc];
}

- (void)finalizeDelegateWithError:(uint64_t)a1
{
  if (a1)
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 112), "disposition"), "isEqualToString:", 0x1EC0A58A8)&& (objc_msgSend(*(id *)(a1 + 112), "_isProxySession") & 1) == 0)
    {
      uint64_t v3 = objc_opt_class();
      objc_sync_enter(v3);
      uint64_t v4 = [*(id *)(a1 + 112) identifier];
      if (v4 && gBackgroundSessions && [(id)gBackgroundSessions objectForKey:v4]) {
        [(id)gBackgroundSessions removeObjectForKey:v4];
      }
      objc_sync_exit(v3);
    }
    uint64_t v5 = *(void **)(a1 + 96);
    if (v5)
    {
      *(void *)(a1 + 96) = 0;
      -[__NSCFURLSessionDelegateWrapper didBecomeInvalidWithError:](*(void *)(a1 + 72), v2);

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__NSURLSession_finalizeDelegateWithError___block_invoke;
      block[3] = &unk_1E5258228;
      block[4] = a1;
      SEL v6 = *(NSObject **)(a1 + 88);
      if (v6) {
        dispatch_async(v6, block);
      }
      else {
        [*(id *)(a1 + 80) addOperationWithBlock:block];
      }
    }
  }
}

- (NSOperationQueue)delegateQueue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_delegateQueue_ivar)
  {
    uint64_t v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    self->_delegateQueue_ivar = v4;
    [(NSOperationQueue *)v4 setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)self->_delegateQueue_ivar setUnderlyingQueue:self->_delegateDispatchQueue];
  }
  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = self->_delegateQueue_ivar;

  return v5;
}

- (void)getAllTasksWithCompletionHandler:(void *)completionHandler
{
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__NSURLSession_getAllTasksWithCompletionHandler___block_invoke;
  v4[3] = &unk_1E5258028;
  v4[4] = self;
  v4[5] = completionHandler;
  dispatch_async(workQueue, v4);
}

uint64_t __40__NSURLSession_finishTasksAndInvalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_completeInvalidation:", 0);
}

+ (void)_disableAppSSO
{
  AppSSO::AppSSODisabled = 1;
}

void __66__NSURLSession__getActiveSessionIdentifiersWithCompletionHandler___block_invoke_53(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
  uint64_t v2 = *(void **)(a1 + 32);
}

void __70__NSURLSession__obliterateAllBackgroundSessionsWithCompletionHandler___block_invoke_55(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
  uint64_t v2 = *(void **)(a1 + 32);
}

void __87__NSURLSession__sessionWithConfiguration_delegate_delegateQueue_delegateDispatchQueue___block_invoke_64()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  MainBundle = CFBundleGetMainBundle();
  if (CFBundleGetIdentifier(MainBundle))
  {
    SecTaskRef v1 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    if (v1)
    {
      SecTaskRef v3 = v1;
      CPCopyBundleIdentifierAndTeamFromSecTaskRef_delayInitStub(v2);
      CFRelease(v3);
    }
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_10_5521);
    }
    uint64_t v4 = __CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v10 = @"application-identifier";
      uint64_t v5 = "Background URLSession adopters are required to have %{public}@ entitlement.";
      SEL v6 = v4;
      uint32_t v7 = 12;
LABEL_13:
      _os_log_fault_impl(&dword_184085000, v6, OS_LOG_TYPE_FAULT, v5, buf, v7);
    }
  }
  else
  {
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_10_5521);
    }
    uint64_t v8 = __CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v5 = "Background URLSession adopters are required to have a bundle identifier. If you are developing a daemon, plea"
           "se enable CREATE_INFOPLIST_SECTION_IN_BINARY build setting.";
      SEL v6 = v8;
      uint32_t v7 = 2;
      goto LABEL_13;
    }
  }
}

uint64_t __43__NSURLSession__backgroundServiceAvailable__block_invoke()
{
  uint64_t result = __CFNIsMachServiceReachable((char *)[@"com.apple.nsurlsessiond" UTF8String]);
  +[NSURLSession _backgroundServiceAvailable]::available = result;
  return result;
}

- (void)finishTasksAndInvalidate
{
  if (self->_isSharedSession_ivar)
  {
    NSLog(&cfstr_NsurlsessionSh.isa, a2);
  }
  else
  {
    objc_sync_enter(self);
    BOOL invalid_ivar = self->_invalid_ivar;
    self->_BOOL invalid_ivar = 1;
    objc_sync_exit(self);
    if (!invalid_ivar)
    {
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__NSURLSession_finishTasksAndInvalidate__block_invoke;
      block[3] = &unk_1E5258228;
      block[4] = self;
      dispatch_async(workQueue, block);
    }
  }
}

- (id)_downloadTaskWithRequest:(id)a3 downloadFilePath:(id)a4
{
  uint32_t v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  uint64_t v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, a3, 16);
    objc_setProperty_atomic(v9, v10, a4, 56);
  }
  id v11 = v9;

  return [(NSURLSession *)self _downloadTaskWithTaskForClass:v11];
}

- (id)taskGroupWithConfiguration:(id)a3
{
  uint64_t v5 = [__NSCFURLSessionTaskGroup alloc];
  if (v5)
  {
    v8.receiver = v5;
    v8.super_class = (Class)__NSCFURLSessionTaskGroup;
    SEL v6 = [(NSURLSession *)&v8 init];
    if (v6)
    {
      v6->_nwContext.__ptr_ = (OS_nw_context *)self;
      v6->_nwContextManager = (__CFN_ConnectionContextManager *)[a3 copyImmutableVariant:0];
    }
  }
  else
  {
    SEL v6 = 0;
  }

  return v6;
}

- (NSURLSessionStreamTask)streamTaskWithNetService:(NSNetService *)service
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Stream tasks are not supported in background sessions" userInfo:0]);
  }
  uint64_t v5 = [__NSCFURLLocalStreamTask alloc];
  id v6 = [(NSURLSession *)self defaultTaskGroup];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__NSURLSession_streamTaskWithNetService___block_invoke;
  v10[3] = &unk_1E52569C0;
  v10[4] = self;
  uint32_t v7 = [(__NSCFURLLocalStreamTask *)v5 initWithNetService:service taskGroup:v6 disavow:v10];
  -[__NSURLSessionLocal addUnresumedTask:]((uint64_t)self, (uint64_t)v7);
  if (v7)
  {
    uint64_t internalDelegateWrapper = (uint64_t)v7->super.super._internalDelegateWrapper;
    if (!internalDelegateWrapper) {
      uint64_t internalDelegateWrapper = (uint64_t)v7->super.super._publicDelegateWrapper;
    }
  }
  else
  {
    uint64_t internalDelegateWrapper = 0;
  }
  -[__NSCFURLSessionDelegateWrapper didCreateTask:](internalDelegateWrapper, v7);
  return (NSURLSessionStreamTask *)v7;
}

void __41__NSURLSession_streamTaskWithNetService___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (NSURLSessionStreamTask)streamTaskWithHostName:(NSString *)hostname port:(NSInteger)port
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Stream tasks are not supported in background sessions" userInfo:0]);
  }
  uint32_t v7 = [__NSCFTCPIOStreamTask alloc];
  id v8 = [(NSURLSession *)self defaultTaskGroup];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__NSURLSession_streamTaskWithHostName_port___block_invoke;
  v12[3] = &unk_1E52569C0;
  v12[4] = self;
  uint64_t v9 = [(__NSCFTCPIOStreamTask *)v7 initWithHost:hostname port:port taskGroup:v8 disavow:v12];
  -[__NSURLSessionLocal addUnresumedTask:]((uint64_t)self, (uint64_t)v9);
  if (v9)
  {
    uint64_t internalDelegateWrapper = (uint64_t)v9->super._internalDelegateWrapper;
    if (!internalDelegateWrapper) {
      uint64_t internalDelegateWrapper = (uint64_t)v9->super._publicDelegateWrapper;
    }
  }
  else
  {
    uint64_t internalDelegateWrapper = 0;
  }
  -[__NSCFURLSessionDelegateWrapper didCreateTask:](internalDelegateWrapper, v9);
  return (NSURLSessionStreamTask *)v9;
}

void __44__NSURLSession_streamTaskWithHostName_port___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)assetDownloadTaskWithConfiguration:(id)a3
{
  uint64_t v5 = [a3 _asset];
  uint64_t v6 = [a3 _assetTitle];
  uint64_t v7 = [a3 artworkData];

  return (id)[(NSURLSession *)self AVAssetDownloadTaskForURLAsset:v5 assetTitle:v6 assetArtworkData:v7 options:0 downloadConfiguration:a3];
}

- (id)assetDownloadTaskWithURLAsset:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6
{
  return (id)[(NSURLSession *)self AVAssetDownloadTaskForURLAsset:a3 assetTitle:a4 assetArtworkData:a5 options:a6 downloadConfiguration:0];
}

- (id)_downloadTaskWithResumeData:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  uint64_t v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  id v11 = v9;
  if (v9)
  {
    objc_setProperty_atomic(v9, v10, a3, 64);
    objc_setProperty_atomic_copy(v11, v12, a5, 72);
    objc_setProperty_atomic(v11, v13, a4, 80);
  }
  id v14 = v11;

  return [(NSURLSession *)self _downloadTaskWithTaskForClass:v14];
}

- (id)_downloadTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  uint64_t v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  id v11 = v9;
  if (v9)
  {
    objc_setProperty_atomic(v9, v10, a3, 16);
    objc_setProperty_atomic_copy(v11, v12, a5, 72);
    objc_setProperty_atomic(v11, v13, a4, 80);
  }
  id v14 = v11;

  return [(NSURLSession *)self _downloadTaskWithTaskForClass:v14];
}

- (NSURLSessionDownloadTask)downloadTaskWithResumeData:(NSData *)resumeData completionHandler:(void *)completionHandler
{
  uint64_t v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  uint64_t v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, resumeData, 64);
    objc_setProperty_atomic_copy(v9, v10, completionHandler, 72);
  }
  id v11 = v9;

  return (NSURLSessionDownloadTask *)[(NSURLSession *)self _downloadTaskWithTaskForClass:v11];
}

- (NSURLSessionDownloadTask)downloadTaskWithURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  uint64_t v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  id v8 = +[NSURLRequest requestWithURL:url];
  if (v7)
  {
    objc_setProperty_atomic(v7, v9, v8, 16);
    objc_setProperty_atomic_copy(v7, v10, completionHandler, 72);
  }
  id v11 = v7;

  return (NSURLSessionDownloadTask *)[(NSURLSession *)self _downloadTaskWithTaskForClass:v11];
}

- (NSURLSessionDownloadTask)downloadTaskWithRequest:(NSURLRequest *)request completionHandler:(void *)completionHandler
{
  uint64_t v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  uint64_t v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, request, 16);
    objc_setProperty_atomic_copy(v9, v10, completionHandler, 72);
  }
  id v11 = v9;

  return (NSURLSessionDownloadTask *)[(NSURLSession *)self _downloadTaskWithTaskForClass:v11];
}

- (NSURLSessionDownloadTask)downloadTaskWithResumeData:(NSData *)resumeData
{
  uint64_t v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  uint64_t v7 = v5;
  if (v5) {
    objc_setProperty_atomic(v5, v6, resumeData, 64);
  }
  id v8 = v7;

  return (NSURLSessionDownloadTask *)[(NSURLSession *)self _downloadTaskWithTaskForClass:v8];
}

- (NSURLSessionDownloadTask)downloadTaskWithURL:(NSURL *)url
{
  uint64_t v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  uint64_t v6 = +[NSURLRequest requestWithURL:url];
  if (v5) {
    objc_setProperty_atomic(v5, v7, v6, 16);
  }
  id v8 = v5;

  return (NSURLSessionDownloadTask *)[(NSURLSession *)self _downloadTaskWithTaskForClass:v8];
}

- (id)_downloadTaskWithTaskForClass:(id)a3
{
}

- (id)_uploadTaskWithResumeData:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  uint64_t v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  id v11 = v9;
  if (v9)
  {
    objc_setProperty_atomic(v9, v10, a3, 64);
    objc_setProperty_atomic_copy(v11, v12, a5, 48);
    objc_setProperty_atomic(v11, v13, a4, 80);
  }
  id v14 = v11;

  return [(NSURLSession *)self _uploadTaskWithTaskForClass:v14];
}

- (id)_uploadTaskWithRequest:(id)a3 fromData:(id)a4 delegate:(id)a5 completionHandler:(id)a6
{
  id v11 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  SEL v13 = v11;
  if (v11)
  {
    objc_setProperty_atomic(v11, v12, a3, 16);
    objc_setProperty_atomic(v13, v14, a4, 40);
    objc_setProperty_atomic_copy(v13, v15, a6, 48);
    objc_setProperty_atomic(v13, v16, a5, 80);
  }
  id v17 = v13;

  return [(NSURLSession *)self _uploadTaskWithTaskForClass:v17];
}

- (id)_uploadTaskWithRequest:(id)a3 fromFile:(id)a4 delegate:(id)a5 completionHandler:(id)a6
{
  id v11 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  SEL v13 = v11;
  if (v11)
  {
    objc_setProperty_atomic(v11, v12, a3, 16);
    objc_setProperty_atomic(v13, v14, a4, 32);
    objc_setProperty_atomic_copy(v13, v15, a6, 48);
    objc_setProperty_atomic(v13, v16, a5, 80);
  }
  id v17 = v13;

  return [(NSURLSession *)self _uploadTaskWithTaskForClass:v17];
}

- (NSURLSessionUploadTask)uploadTaskWithResumeData:(NSData *)resumeData completionHandler:(void *)completionHandler
{
  uint64_t v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  uint64_t v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, resumeData, 64);
    objc_setProperty_atomic_copy(v9, v10, completionHandler, 48);
  }
  id v11 = v9;

  return (NSURLSessionUploadTask *)[(NSURLSession *)self _uploadTaskWithTaskForClass:v11];
}

- (NSURLSessionUploadTask)uploadTaskWithRequest:(NSURLRequest *)request fromFile:(NSURL *)fileURL completionHandler:(void *)completionHandler
{
  uint64_t v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  id v11 = v9;
  if (v9)
  {
    objc_setProperty_atomic(v9, v10, request, 16);
    objc_setProperty_atomic(v11, v12, fileURL, 32);
    objc_setProperty_atomic_copy(v11, v13, completionHandler, 48);
  }
  id v14 = v11;

  return (NSURLSessionUploadTask *)[(NSURLSession *)self _uploadTaskWithTaskForClass:v14];
}

- (NSURLSessionUploadTask)uploadTaskWithResumeData:(NSData *)resumeData
{
  uint64_t v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  uint64_t v7 = v5;
  if (v5) {
    objc_setProperty_atomic(v5, v6, resumeData, 64);
  }
  id v8 = v7;

  return (NSURLSessionUploadTask *)[(NSURLSession *)self _uploadTaskWithTaskForClass:v8];
}

- (NSURLSessionUploadTask)uploadTaskWithStreamedRequest:(NSURLRequest *)request
{
  uint64_t v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  uint64_t v7 = v5;
  if (v5) {
    objc_setProperty_atomic(v5, v6, request, 16);
  }
  id v8 = v7;

  return (NSURLSessionUploadTask *)[(NSURLSession *)self _uploadTaskWithTaskForClass:v8];
}

- (id)_uploadTaskWithTaskForClass:(id)a3
{
}

- (NSURLSessionWebSocketTask)webSocketTaskWithRequest:(NSURLRequest *)request
{
  id v4 = (id)[(NSURLRequest *)request mutableCopy];

  return (NSURLSessionWebSocketTask *)[(NSURLSession *)self webSocketTaskForRequest:v4];
}

- (NSURLSessionWebSocketTask)webSocketTaskWithURL:(NSURL *)url
{
  return (NSURLSessionWebSocketTask *)[(NSURLSession *)self webSocketTaskForURL:url protocols:0];
}

- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4
{
  uint64_t v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  id v8 = +[NSURLRequest requestWithURL:a3];
  if (v7)
  {
    objc_setProperty_atomic(v7, v9, v8, 16);
    objc_setProperty_atomic(v7, v10, a4, 80);
  }
  id v11 = v7;

  return [(NSURLSession *)self _dataTaskWithTaskForClass:v11];
}

- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4
{
  uint64_t v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  uint64_t v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, a3, 16);
    objc_setProperty_atomic(v9, v10, a4, 80);
  }
  id v11 = v9;

  return [(NSURLSession *)self _dataTaskWithTaskForClass:v11];
}

- (id)dataTaskWithRequest:(id)a3 uniqueIdentifier:(id)a4
{
  uint64_t v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], [(NSURLSession *)self defaultTaskGroup]);
  uint64_t v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, a3, 16);
    objc_setProperty_atomic(v9, v10, a4, 24);
  }
  id v11 = v9;

  return [(NSURLSession *)self _dataTaskWithTaskForClass:v11];
}

- (id)_dataTaskWithTaskForClass:(id)a3
{
}

- (void)getTasksWithCompletionHandler:(void *)completionHandler
{
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__NSURLSession_getTasksWithCompletionHandler___block_invoke;
  v4[3] = &unk_1E5258028;
  v4[4] = self;
  v4[5] = completionHandler;
  dispatch_async(workQueue, v4);
}

void __46__NSURLSession_getTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x18531D6D0]();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__NSURLSession_getTasksWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5257018;
  SecTaskRef v3 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  objc_msgSend(v3, "_onqueue_getTasksWithCompletionHandler:", v4);
}

void __46__NSURLSession_getTasksWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__NSURLSession_getTasksWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E5256998;
  v7[4] = v5;
  v7[5] = v4;
  void v7[6] = v6;
  [a2 enumerateObjectsUsingBlock:v7];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__NSURLSession_getTasksWithCompletionHandler___block_invoke_3(void **a1, uint64_t a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = a1 + 4;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = a1 + 5;
    }
    else
    {
      objc_opt_class();
      uint64_t result = objc_opt_isKindOfClass();
      if ((result & 1) == 0) {
        return result;
      }
      id v4 = a1 + 6;
    }
  }
  uint64_t v6 = *v4;

  return [v6 addObject:a2];
}

- (void)flushWithCompletionHandler:(void *)completionHandler
{
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__NSURLSession_flushWithCompletionHandler___block_invoke;
  v4[3] = &unk_1E5258028;
  v4[4] = self;
  void v4[5] = completionHandler;
  dispatch_async(workQueue, v4);
}

uint64_t __43__NSURLSession_flushWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_flushWithCompletionHandler:", *(void *)(a1 + 40));
}

- (void)resetWithCompletionHandler:(void *)completionHandler
{
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__NSURLSession_resetWithCompletionHandler___block_invoke;
  v4[3] = &unk_1E5258028;
  v4[4] = self;
  void v4[5] = completionHandler;
  dispatch_async(workQueue, v4);
}

uint64_t __43__NSURLSession_resetWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_resetStorageWithCompletionHandler:", *(void *)(a1 + 40));
}

- (OS_nw_context)_networkContext
{
  double v2 = self->_nwContext.__ptr_;

  return v2;
}

- (NSURLSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLSession;
  return [(NSURLSession *)&v3 init];
}

uint64_t __52__NSURLSession_handleSystemHasPoweredOnNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_markConnectionsReusedAfterAPSleepWake");
}

+ (void)_enumerateHTTPHeaderFieldsWithRequest:(id)a3 usingBlock:(id)a4
{
  uint64_t v4 = *(void *)([a3 _inner] + 56);
  if (v4)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)v4 + 56);
    v5();
  }
}

+ (void)_enumerateHTTPHeaderFieldsWithCFHTTPMessage:(__CFHTTPMessage *)a3 usingBlock:(id)a4
{
  if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
    dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
  }
  if (a3) {
    uint64_t v5 = (char *)a3 + 16;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(void))(*(void *)v5 + 56);

  v6();
}

+ (void)_disableATS
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, @"NSAllowsArbitraryLoads", (const void *)*MEMORY[0x1E4F1CFD0]);
  CFDataRef Data = CFPropertyListCreateData(v2, Mutable, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  CFDataRef v5 = Data;
  if (Data)
  {
    _CFNetworkSetATSContext(Data);
    CFRelease(v5);
  }
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

+ (void)_strictTrustEvaluate:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = (void *)[a3 protectionSpace];
  uint64_t v9 = (const void *)objc_msgSend((id)objc_msgSend(a3, "protectionSpace"), "serverTrust");
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  SEL v10 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_184085000, v10, OS_LOG_TYPE_INFO, "strict trust evaluate %p", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v11 = [v8 _CFURLProtectionSpace];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__NSURLSession__strictTrustEvaluate_queue_completionHandler___block_invoke;
  v18[3] = &unk_1E52568A8;
  v18[5] = a5;
  v18[6] = v9;
  v18[4] = a3;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1) {
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_10309);
  }
  uint64_t v12 = v11 + 16;
  if (!v11) {
    uint64_t v12 = 0;
  }
  uint64_t v14 = *(void *)(v12 + 88);
  uint64_t v13 = *(void *)(v12 + 96);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x4012000000;
  uint64_t v22 = __Block_byref_object_copy__129;
  double v23 = __Block_byref_object_dispose__130;
  uint64_t v24 = &unk_18441BEED;
  SEL v15 = (std::__shared_weak_count *)operator new(0x48uLL);
  v15->__shared_owners_ = 0;
  v15->__shared_weak_owners_ = 0;
  v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_1ECFA6720;
  CFNetworkTrust::CFNetworkTrust((CFNetworkTrust *)&v15[1], v9);
  uint64_t v25 = v16;
  v26 = v15;
  uint64_t v17 = *(void *)(*((void *)&buf + 1) + 48);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __performStrictTrustEvaluationAsync_block_invoke;
  v19[3] = &unk_1E5256A30;
  v19[4] = v18;
  v19[5] = &buf;
  CFNetworkTrust::strictEvaluateAsync(v17, v13, v14 & 1, (uint64_t)a4, (uint64_t)v19);
  _Block_object_dispose(&buf, 8);
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v26);
  }
}

uint64_t __61__NSURLSession__strictTrustEvaluate_queue_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  uint64_t v4 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl(&dword_184085000, v4, OS_LOG_TYPE_INFO, "strict trust evaluate %p complete %d", (uint8_t *)&v7, 0x12u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __70__NSURLSession__obliterateAllBackgroundSessionsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  uint64_t v4 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    uint64_t v6 = a2;
    _os_log_error_impl(&dword_184085000, v4, OS_LOG_TYPE_ERROR, "obliterateAllSessionsWithReply error handler called with error %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

uint64_t __66__NSURLSession__getActiveSessionIdentifiersWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  uint64_t v4 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    uint64_t v7 = a2;
    _os_log_error_impl(&dword_184085000, v4, OS_LOG_TYPE_ERROR, "getActiveSessionIdentifiersWithReply error handler called with error %@", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(a1 + 32) invalidate];

  return +[NSURLSession _getActiveSessionIdentifiersWithCompletionHandler:*(void *)(a1 + 40)];
}

+ (void)_releaseProcessAssertionForSessionIdentifier:(id)a3
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nsurlsessiond" options:0];
  objc_msgSend(v4, "setRemoteObjectInterface:", +[__NSCFURLSessionXPC bgSessionManagerInterface](__NSCFURLSessionXPC, "bgSessionManagerInterface"));
  [v4 resume];
  int v5 = (void *)[v4 remoteObjectProxy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__NSURLSession__releaseProcessAssertionForSessionIdentifier___block_invoke;
  v6[3] = &unk_1E5258228;
  v6[4] = v4;
  [v5 releaseAssertionForSession:a3 reply:v6];
}

void __61__NSURLSession__releaseProcessAssertionForSessionIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  CFAllocatorRef v2 = *(void **)(a1 + 32);
}

+ (void)_sendPendingCallbacksForSessionIdentifier:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"NSURLSessionAppWasResumedForBackgroundSessionNotification", 0);
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nsurlsessiond" options:0];
  objc_msgSend(v4, "setRemoteObjectInterface:", +[__NSCFURLSessionXPC bgSessionManagerInterface](__NSCFURLSessionXPC, "bgSessionManagerInterface"));
  [v4 resume];
  int v5 = (void *)[v4 remoteObjectProxy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__NSURLSession__sendPendingCallbacksForSessionIdentifier___block_invoke;
  v6[3] = &unk_1E5258228;
  v6[4] = v4;
  [v5 okayToSendPendingCallbacksForIdentifier:a3 reply:v6];
}

void __58__NSURLSession__sendPendingCallbacksForSessionIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  CFAllocatorRef v2 = *(void **)(a1 + 32);
}

__NSURLSessionLocal *__43__NSURLSession__sharedSessionForConnection__block_invoke()
{
  uint64_t v0 = +[NSURLSessionConfiguration sessionConfigurationForSharedSession];
  [(NSURLSessionConfiguration *)v0 set_disablesUseOfProxySession:1];
  [(NSURLSessionConfiguration *)v0 set_disablesNWLoader:1];
  uint64_t result = +[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]((uint64_t)NSURLSession, v0, 0, 0, 0);
  +[NSURLSession _sharedSessionForConnection]::sSharedSession = (uint64_t)result;
  if (result) {
    *((unsigned char *)result + 68) = 1;
  }
  return result;
}

uint64_t __102__NSURLSession_delegate_AVAssetDownloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) avAssetDownloadTask:*(void *)(a1 + 48) didWriteData:*(void *)(a1 + 56) totalBytesWritten:*(void *)(a1 + 64) totalBytesExpectedToWrite:*(void *)(a1 + 72)];
}

uint64_t __69__NSURLSession_delegate_AVAssetDownloadTask_didReceiveDownloadToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) avAssetDownloadTask:*(void *)(a1 + 48) didReceiveAVAssetDownloadToken:*(void *)(a1 + 56)];
}

uint64_t __108__NSURLSession_delegate_AVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad___block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 80);
  v11[0] = *(_OWORD *)(a1 + 64);
  v11[1] = v1;
  long long v2 = *(_OWORD *)(a1 + 112);
  v11[2] = *(_OWORD *)(a1 + 96);
  long long v3 = *(_OWORD *)(a1 + 128);
  long long v4 = *(_OWORD *)(a1 + 144);
  v10[0] = v2;
  v10[1] = v3;
  int v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  v10[2] = v4;
  return [v6 URLSession:v5 assetDownloadTask:v7 didLoadTimeRange:v11 totalTimeRangesLoaded:v8 timeRangeExpectedToLoad:v10];
}

uint64_t __66__NSURLSession_delegate_AVAssetDownloadTask_willDownloadVariants___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) assetDownloadTask:*(void *)(a1 + 48) willDownloadVariants:*(void *)(a1 + 56)];
}

- (void)delegate_AVAssetDownloadTask:(uint64_t)a3 didResolveMediaSelection:
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 96);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __70__NSURLSession_delegate_AVAssetDownloadTask_didResolveMediaSelection___block_invoke;
    v4[3] = &unk_1E5256948;
    v4[4] = v3;
    void v4[5] = a1;
    void v4[6] = a2;
    v4[7] = a3;
    if (*(void *)(a1 + 88)) {
      dispatch_async(*(dispatch_queue_t *)(a1 + 88), v4);
    }
    else {
      [*(id *)(a1 + 80) addOperationWithBlock:v4];
    }
  }
}

uint64_t __70__NSURLSession_delegate_AVAssetDownloadTask_didResolveMediaSelection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) assetDownloadTask:*(void *)(a1 + 48) didResolveMediaSelection:*(void *)(a1 + 56)];
}

uint64_t __89__NSURLSession_delegate_AVAssetDownloadTask_didFinishDownloadingToURL_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) assetDownloadTask:*(void *)(a1 + 48) didFinishDownloadingToURL:*(void *)(a1 + 56)];
  long long v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v2();
}

uint64_t __63__NSURLSession_delegate_AVAssetDownloadTask_willDownloadToURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) assetDownloadTask:*(void *)(a1 + 48) willDownloadToURL:*(void *)(a1 + 56)];
}

- (void)delegate_AVAggregateAssetDownloadTask:(uint64_t)a3 willDownloadToURL:
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 96);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __72__NSURLSession_delegate_AVAggregateAssetDownloadTask_willDownloadToURL___block_invoke;
    v4[3] = &unk_1E5256948;
    v4[4] = v3;
    void v4[5] = a1;
    void v4[6] = a2;
    v4[7] = a3;
    if (*(void *)(a1 + 88)) {
      dispatch_async(*(dispatch_queue_t *)(a1 + 88), v4);
    }
    else {
      [*(id *)(a1 + 80) addOperationWithBlock:v4];
    }
  }
}

uint64_t __72__NSURLSession_delegate_AVAggregateAssetDownloadTask_willDownloadToURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) aggregateAssetDownloadTask:*(void *)(a1 + 48) willDownloadToURL:*(void *)(a1 + 56)];
}

- (void)delegate_AVAggregateAssetDownloadTask:(uint64_t)a3 didCompleteForMediaSelection:
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 96);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __83__NSURLSession_delegate_AVAggregateAssetDownloadTask_didCompleteForMediaSelection___block_invoke;
    v4[3] = &unk_1E5256948;
    v4[4] = v3;
    void v4[5] = a1;
    void v4[6] = a2;
    v4[7] = a3;
    if (*(void *)(a1 + 88)) {
      dispatch_async(*(dispatch_queue_t *)(a1 + 88), v4);
    }
    else {
      [*(id *)(a1 + 80) addOperationWithBlock:v4];
    }
  }
}

uint64_t __83__NSURLSession_delegate_AVAggregateAssetDownloadTask_didCompleteForMediaSelection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) URLSession:*(void *)(a1 + 40) aggregateAssetDownloadTask:*(void *)(a1 + 48) didCompleteForMediaSelection:*(void *)(a1 + 56)];
}

- (void)delegate_AVAggregateAssetDownloadTask:(long long *)a3 didLoadTimeRange:(uint64_t)a4 totalTimeRangesLoaded:(long long *)a5 timeRangeExpectedToLoad:(uint64_t)a6 forMediaSelection:
{
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __135__NSURLSession_delegate_AVAggregateAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelection___block_invoke;
    block[3] = &unk_1E5256970;
    block[4] = v6;
    void block[5] = a1;
    long long v7 = a3[1];
    long long v12 = *a3;
    long long v13 = v7;
    long long v8 = a3[2];
    block[6] = a2;
    block[7] = a4;
    long long v9 = *a5;
    long long v10 = a5[1];
    long long v17 = a5[2];
    long long v16 = v10;
    long long v14 = v8;
    long long v15 = v9;
    block[8] = a6;
    if (*(void *)(a1 + 88)) {
      dispatch_async(*(dispatch_queue_t *)(a1 + 88), block);
    }
    else {
      [*(id *)(a1 + 80) addOperationWithBlock:block];
    }
  }
}

uint64_t __135__NSURLSession_delegate_AVAggregateAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelection___block_invoke(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 88);
  v9[0] = *(_OWORD *)(a1 + 72);
  v9[1] = v3;
  v9[2] = *(_OWORD *)(a1 + 104);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 136);
  v8[0] = *(_OWORD *)(a1 + 120);
  v8[1] = v6;
  v8[2] = *(_OWORD *)(a1 + 152);
  return [v2 URLSession:v1 aggregateAssetDownloadTask:v4 didLoadTimeRange:v9 totalTimeRangesLoaded:v5 timeRangeExpectedToLoad:v8 forMediaSelection:*(void *)(a1 + 64)];
}

- (uint64_t)addToHTTPFallbackHosts:(uint64_t)a3 forbiddenProtocols:
{
  if (result)
  {
    uint64_t v5 = (void *)result;
    os_unfair_lock_lock((os_unfair_lock_t)&_httpFallbackHostsLock);
    id Property = objc_getProperty(v5, v6, 144, 1);
    if (!Property)
    {
      id Property = (id)[MEMORY[0x1E4F1CA60] dictionary];
      objc_setProperty_atomic(v5, v8, Property, 144);
    }
    objc_msgSend(Property, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", a3), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)&_httpFallbackHostsLock);
    uint64_t result = [a2 isEqualToString:@"localhost"];
    if ((result & 1) == 0) {
      return AnalyticsSendEventLazy_delayInitStub(COERCE_DOUBLE(3221225472));
    }
  }
  return result;
}

uint64_t __58__NSURLSession_addToHTTPFallbackHosts_forbiddenProtocols___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = @"domain";
  v4[1] = @"forbiddenProtocols";
  v5[0] = v2;
  v5[1] = [NSNumber numberWithUnsignedLong:v1];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
}

@end