@interface __NSURLBackgroundSession
- (NSString)appWakeUUID;
- (__NSURLBackgroundSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 delegateDispatchQueue:(id)a6;
- (id).cxx_construct;
- (id)AVAggregateAssetDownloadTaskForURLAsset:(id)a3 mediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7;
- (id)AVAssetDownloadTaskForURLAsset:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6 downloadConfiguration:(id)a7;
- (id)AVAssetDownloadTaskForURLAsset:(id)a3 destinationURL:(id)a4 options:(id)a5;
- (id)_AVAssetDownloadTaskForURL:(id)a3 destinationURL:(id)a4 options:(id)a5;
- (id)_dataTaskWithTaskForClass:(id)a3;
- (id)_downloadTaskWithTaskForClass:(id)a3;
- (id)_onqueue_AVAssetDownloadTaskForURLAsset:(uint64_t)a3 URL:(uint64_t)a4 destinationURL:(uint64_t)a5 assetTitle:(uint64_t)a6 assetArtworkData:(void *)a7 options:(uint64_t)a8 downloadConfiguration:(char)a9 enableSPIDelegateCallbacks:;
- (id)_onqueue_dummyTaskForClass:(void *)a1 withRequest:(Class)a2 error:(void *)a3;
- (id)_uploadTaskWithTaskForClass:(id)a3;
- (id)taskForIdentifier:(id *)result;
- (id)webSocketTaskForRequest:(id)a3;
- (id)webSocketTaskForURL:(id)a3 protocols:(id)a4;
- (uint64_t)doesAVAssetDownloadSessionSupportMultipleDownloads;
- (uint64_t)ensureRemoteSession;
- (uint64_t)setupXPCConnection;
- (uint64_t)validateSerializabilityForRequest:(uint64_t)result completion:(uint64_t)a2;
- (void)_onqueue_completeInvalidation:(BOOL)a3;
- (void)_onqueue_flushWithCompletionHandler:(id)a3;
- (void)_onqueue_getTasksWithCompletionHandler:(id)a3;
- (void)_onqueue_invokeInvalidateCallback;
- (void)_onqueue_resetStorageWithCompletionHandler:(id)a3;
- (void)_onqueue_retryDataTaskWithIdentifier:(uint64_t)a1;
- (void)_useTLSSessionCacheFromSession:(id)a3;
- (void)appWasLaunchedForBackgroundSession:(id)a3;
- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didFinishDownloadForMediaSelectionPropertyList:(id)a4;
- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didLoadTimeRange:(id)a4 totalTimeRangesLoaded:(id)a5 timeRangeExpectedToLoad:(id)a6 forMediaSelectionPropertyList:(id)a7;
- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didReceiveDownloadToken:(unint64_t)a4;
- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didResolveMediaSelectionProperyList:(id)a4 reply:(id)a5;
- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 willDownloadToURL:(id)a4;
- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 willDownloadVariants:(id)a4 reply:(id)a5;
- (void)backgroundAVAssetDownloadTaskDidUpdateProgress:(unint64_t)a3 totalBytesWritten:(unint64_t)a4 totalBytesExpectedToWrite:(unint64_t)a5;
- (void)backgroundDataTask:(unint64_t)a3 didReceiveData:(id)a4 withReply:(id)a5;
- (void)backgroundDataTaskDidBecomeDownloadTask:(unint64_t)a3;
- (void)backgroundDownloadTask:(unint64_t)a3 didFinishDownloadingToURL:(id)a4 response:(id)a5 reply:(id)a6;
- (void)backgroundDownloadTask:(unint64_t)a3 didResumeAtOffset:(int64_t)a4 expectedTotalBytes:(int64_t)a5;
- (void)backgroundDownloadTask:(unint64_t)a3 didWriteData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6;
- (void)backgroundDownloadsDirectory;
- (void)backgroundSessionDidFinishAppWake:(id)a3 reply:(id)a4;
- (void)backgroundSessionDidStartAppWake:(id)a3 reply:(id)a4;
- (void)backgroundTask:(unint64_t)a3 _willSendRequestForEstablishedConnection:(id)a4 reply:(id)a5;
- (void)backgroundTask:(unint64_t)a3 didCompleteWithError:(id)a4 taskMetrics:(id)a5 info:(id)a6 reply:(id)a7;
- (void)backgroundTask:(unint64_t)a3 didReceiveChallenge:(id)a4 reply:(id)a5;
- (void)backgroundTask:(unint64_t)a3 didReceiveInformationalResponse:(id)a4;
- (void)backgroundTask:(unint64_t)a3 didReceiveResponse:(id)a4 transactionMetrics:(id)a5;
- (void)backgroundTask:(unint64_t)a3 didReceiveResponse:(id)a4 transactionMetrics:(id)a5 reply:(id)a6;
- (void)backgroundTask:(unint64_t)a3 didSendBodyData:(int64_t)a4 totalBytesSent:(int64_t)a5 totalBytesExpectedToSend:(int64_t)a6;
- (void)backgroundTask:(unint64_t)a3 getAuthHeadersForResponse:(id)a4 reply:(id)a5;
- (void)backgroundTask:(unint64_t)a3 hasConnectionWaitingWithError:(id)a4;
- (void)backgroundTask:(unint64_t)a3 hasConnectionWaitingWithReason:(int64_t)a4;
- (void)backgroundTask:(unint64_t)a3 needNewBodyStream:(BOOL)a4 withReply:(id)a5;
- (void)backgroundTask:(unint64_t)a3 willBeginDelayedRequest:(id)a4 reply:(id)a5;
- (void)backgroundTask:(unint64_t)a3 willPerformHTTPRedirection:(id)a4 withNewRequest:(id)a5 reply:(id)a6;
- (void)backgroundTaskDidResume:(unint64_t)a3;
- (void)backgroundTaskDidSuspend:(unint64_t)a3;
- (void)backgroundTaskHasConnectionWaiting:(unint64_t)a3;
- (void)cameIntoForeground:(id)a3;
- (void)credStorage_allCredentialsWithReply:(id)a3;
- (void)credStorage_credentialsForProtectionSpace:(id)a3 reply:(id)a4;
- (void)credStorage_defaultCredentialForProtectionSpace:(id)a3 reply:(id)a4;
- (void)credStorage_getInitialCredentialDictionariesWithReply:(id)a3;
- (void)credStorage_removeCredential:(id)a3 forProtectionSpace:(id)a4;
- (void)credStorage_setCredential:(id)a3 forProtectionSpace:(id)a4;
- (void)credStorage_setDefaultCredential:(id)a3 forProtectionSpace:(id)a4;
- (void)dealloc;
- (void)moveFileForResumeData:(void *)a3 fromDirectory:(void *)a4 toDirectory:;
- (void)moveFileToTempForBackgroundResumeData:(uint64_t)a1;
- (void)openFileAtPath:(id)a3 mode:(int)a4 withReply:(id)a5;
- (void)performBlockOnQueueAndRethrowExceptions:(uint64_t)a1;
- (void)sendInvalidationRequest;
- (void)serializableAVAssetDownloadTaskOptionsFromOptions:(void *)a1 mediaSelections:(void *)a2 downloadConfiguration:(uint64_t)a3;
- (void)setAppWakeUUID:(id)a3;
- (void)setCookiesFromResponse:(void *)a3 forCurrentRequest:(uint64_t)a4 partitionIdentifier:;
- (void)setupBackgroundSession;
- (void)wentToBackground:(id)a3;
- (void)willRetryBackgroundDataTask:(unint64_t)a3 withError:(id)a4 transactionMetrics:(id)a5;
@end

@implementation __NSURLBackgroundSession

- (id)taskForIdentifier:(id *)result
{
  if (result)
  {
    id v2 = (id)objc_msgSend(result[23], "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a2));
    return (id *)v2;
  }
  return result;
}

- (void)setCookiesFromResponse:(void *)a3 forCurrentRequest:(uint64_t)a4 partitionIdentifier:
{
  if (a1)
  {
    if ([*(id *)(a1 + 112) HTTPCookieStorage])
    {
      int v8 = [*(id *)(a1 + 112) HTTPShouldSetCookies];
      if (a2)
      {
        if (v8)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v9 = [a2 allHeaderFields];
            [*(id *)(a1 + 112) HTTPCookieStorage];
            if ((objc_opt_respondsToSelector() & 1) != 0
              && (uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 112), "HTTPCookieStorage"), "_cookieStorage")) != 0)
            {
              uint64_t v11 = v10;
              v12 = (void *)[a2 _CFURLResponse];
              if (v12)
              {
                uint64_t v13 = *(void *)([v12 _inner] + 88);
                CFURLRef v14 = (const __CFURL *)[a2 URL];
                v15 = (const void *)[a3 mainDocumentURL];
                int v16 = [*(id *)(a1 + 112) HTTPCookieAcceptPolicy];
                if (v14)
                {
                  int v17 = v16;
                  CFAllocatorRef v18 = CFGetAllocator((CFTypeRef)v11);
                  CFArrayRef CookiesWithResponseMessage = _CFHTTPCookieCreateCookiesWithResponseMessage(v18, v13 - 16, v14, a4);
                  if (CookiesWithResponseMessage)
                  {
                    CFArrayRef v20 = CookiesWithResponseMessage;
                    if (CFArrayGetCount(CookiesWithResponseMessage) >= 1)
                    {
                      HTTPCookieStoragePolicy::HTTPCookieStoragePolicy((uint64_t)v25, v14, v15, a4, v17, 1, 0, 0);
                      if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
                        dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
                      }
                      HTTPCookieStorage::setCookiesWithPolicy((HTTPCookieStorage *)(v11 + 16), v20, (const HTTPCookieStoragePolicy *)v25);
                      HTTPCookieStoragePolicy::~HTTPCookieStoragePolicy((HTTPCookieStoragePolicy *)v25);
                    }
                    CFRelease(v20);
                  }
                }
              }
            }
            else
            {
              v21 = +[NSHTTPCookie cookiesWithResponseHeaderFields:forURL:](NSHTTPCookie, "cookiesWithResponseHeaderFields:forURL:", v9, [a2 URL]);
              v22 = (void *)[*(id *)(a1 + 112) HTTPCookieStorage];
              uint64_t v23 = [a2 URL];
              uint64_t v24 = [a3 mainDocumentURL];
              [v22 setCookies:v21 forURL:v23 mainDocumentURL:v24];
            }
          }
        }
      }
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 28) = 0;
  *((void *)self + 29) = 0;
  return self;
}

- (void)backgroundTask:(unint64_t)a3 didCompleteWithError:(id)a4 taskMetrics:(id)a5 info:(id)a6 reply:(id)a7
{
  v7 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87____NSURLBackgroundSession_backgroundTask_didCompleteWithError_taskMetrics_info_reply___block_invoke;
  v8[3] = &unk_1E5254360;
  v8[4] = v7;
  v8[5] = a4;
  v8[8] = a7;
  v8[9] = a3;
  v8[6] = a5;
  v8[7] = a6;
  dispatch_async(&self->super.super, v8);
}

- (uint64_t)ensureRemoteSession
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 168))
    {
      int v2 = *(unsigned __int8 *)(result + 280);
      int v3 = [*(id *)(result + 112) _isProxySession];
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v4 = CFNLog::logger;
      BOOL v5 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
      if (v2)
      {
        if (v3)
        {
          if (v5)
          {
            uint64_t v6 = *(void *)(v1 + 128);
            int v12 = 138543362;
            uint64_t v13 = v6;
            v7 = "ProxySession <%{public}@> attempting to reconnect to background transfer daemon";
LABEL_14:
            _os_log_impl(&dword_184085000, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, 0xCu);
          }
        }
        else if (v5)
        {
          uint64_t v10 = *(void *)(v1 + 128);
          int v12 = 138543362;
          uint64_t v13 = v10;
          v7 = "BackgroundSession <%{public}@> attempting to reconnect to background transfer daemon";
          goto LABEL_14;
        }
        -[__NSURLBackgroundSession setupXPCConnection](v1);
        -[__NSURLBackgroundSession setupBackgroundSession](v1);
        return *(void *)(v1 + 168);
      }
      if (!v3)
      {
        if (!v5) {
          return *(void *)(v1 + 168);
        }
        uint64_t v11 = *(void *)(v1 + 128);
        int v12 = 138543362;
        uint64_t v13 = v11;
        uint64_t v9 = "BackgroundSession <%{public}@> no connection to background transfer daemon, and will not try to reconnect";
LABEL_18:
        _os_log_impl(&dword_184085000, v4, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0xCu);
        return *(void *)(v1 + 168);
      }
      if (v5)
      {
        uint64_t v8 = *(void *)(v1 + 128);
        int v12 = 138543362;
        uint64_t v13 = v8;
        uint64_t v9 = "ProxySession <%{public}@> no connection to background transfer daemon, and will not try to reconnect";
        goto LABEL_18;
      }
    }
    return *(void *)(v1 + 168);
  }
  return result;
}

- (__NSURLBackgroundSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 delegateDispatchQueue:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)__NSURLBackgroundSession;
  v7 = [(NSURLSession *)&v20 initWithConfiguration:a3 delegate:a4 delegateQueue:a5 delegateDispatchQueue:a6];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_identSeed = 1;
    v7->_tasks = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionary];
    v8->_taskIDsToFailOnReconnection = (NSMutableArray *)objc_opt_new();
    v8->_taskIDsGettingAuthHeaders = (NSMutableSet *)objc_opt_new();
    v8->_downloadDirectory = (NSURL *)[a3 _directoryForDownloadedFiles];
    v8->_companionAvailable = [a3 _isProxySession];
    uint64_t v9 = [(NSDictionary *)[(NSURLSessionConfiguration *)v8->super._local_immutable_configuration_ivar HTTPAdditionalHeaders] objectForKeyedSubscript:0x1EC0A2B28];
    uint64_t v10 = [(NSDictionary *)[(NSURLSessionConfiguration *)v8->super._local_immutable_configuration_ivar HTTPAdditionalHeaders] objectForKeyedSubscript:0x1EC0A1E40];
    uint64_t v11 = v10;
    if (!v9 || !v10)
    {
      pthread_once(&initControl, initializeUserAgentString);
      uint64_t v12 = sUserAgentString;
      CFTypeRef v13 = (id)_CFNetworkCopyPreferredLanguageCode();
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v22 = __41____NSURLBackgroundSession_cleanupConfig__block_invoke;
      uint64_t v23 = &unk_1E5253FC8;
      uint64_t v24 = v12;
      CFTypeRef v25 = v13;
      uint64_t v26 = v9;
      uint64_t v27 = v11;
      local_immutable_configuration_ivar = v8->super._local_immutable_configuration_ivar;
      v8->super._local_immutable_configuration_ivar = (NSURLSessionConfiguration *)[(NSURLSessionConfiguration *)local_immutable_configuration_ivar copyImmutableVariant:&buf];
    }
    -[__NSURLBackgroundSession setupXPCConnection]((uint64_t)v8);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v8, sel_wentToBackground_, @"UIApplicationDidEnterBackgroundNotification", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v8, sel_cameIntoForeground_, @"UIApplicationWillEnterForegroundNotification", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v8, sel_appWasLaunchedForBackgroundSession_, @"NSURLSessionAppWasResumedForBackgroundSessionNotification", 0);
    -[__NSURLBackgroundSession setupBackgroundSession]((uint64_t)v8);
    if (([a3 _isProxySession] & 1) == 0)
    {
      v8->_notifyToken = 0;
      workQueue = v8->super._workQueue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __95____NSURLBackgroundSession_initWithConfiguration_delegate_delegateQueue_delegateDispatchQueue___block_invoke;
      handler[3] = &unk_1E5256400;
      handler[4] = v8;
      notify_register_dispatch("com.apple.nsurlsessiond.started", &v8->_notifyToken, workQueue, handler);
    }
    if ([a3 isDiscretionary]
      && [a3 _xpcActivityBudgeted] == 2)
    {
      if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
        dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_10_5521);
      }
      int v16 = __CFNAPIMisuseFaultLogHandle::logger;
      if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
      {
        uint64_t v18 = [a3 identifier];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v18;
        _os_log_fault_impl(&dword_184085000, v16, OS_LOG_TYPE_FAULT, "Discretionary background URLSessionConfiguration (%@) is inconsistent with xpc activity configuration. If this is intended, please reach out to cfnetwork / duetactivityscheduler", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  return v8;
}

- (uint64_t)setupXPCConnection
{
  if (result)
  {
    uint64_t v1 = result;
    if ([*(id *)(result + 112) _isProxySession]) {
      int v2 = @"com.apple.nsurlsessiond.NSURLSessionProxyService";
    }
    else {
      int v2 = @"com.apple.nsurlsessiond";
    }
    *(void *)(v1 + 176) = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v2 options:0];
    objc_msgSend(*(id *)(v1 + 176), "setRemoteObjectInterface:", +[__NSCFURLSessionXPC bgSessionManagerInterface](__NSCFURLSessionXPC, "bgSessionManagerInterface"));
    int v3 = *(void **)(v1 + 176);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46____NSURLBackgroundSession_setupXPCConnection__block_invoke;
    v6[3] = &unk_1E5258228;
    v6[4] = v1;
    [v3 setInterruptionHandler:v6];
    v4 = *(void **)(v1 + 176);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_2_23;
    v5[3] = &unk_1E5258228;
    v5[4] = v1;
    [v4 setInvalidationHandler:v5];
    *(unsigned char *)(v1 + 281) = 0;
    return [*(id *)(v1 + 176) resume];
  }
  return result;
}

- (void)setupBackgroundSession
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  *(unsigned char *)(a1 + 280) = 0;
  if (([*(id *)(a1 + 112) _isProxySession] & 1) == 0
    && MKBDeviceUnlockedSinceBoot_delayInitStub(v2) != 1)
  {
    int v3 = [*(id *)(a1 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v4 = CFNLog::logger;
    BOOL v5 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      if (!v5) {
        goto LABEL_10;
      }
      uint64_t v6 = *(void *)(a1 + 128);
      LODWORD(v49) = 138543362;
      *(void *)((char *)&v49 + 4) = v6;
      v7 = "ProxySession <%{public}@> attempting to setup a background session before first device unlock!";
    }
    else
    {
      if (!v5) {
        goto LABEL_10;
      }
      uint64_t v36 = *(void *)(a1 + 128);
      LODWORD(v49) = 138543362;
      *(void *)((char *)&v49 + 4) = v36;
      v7 = "BackgroundSession <%{public}@> attempting to setup a background session before first device unlock!";
    }
    _os_log_error_impl(&dword_184085000, v4, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v49, 0xCu);
  }
LABEL_10:
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  *(void *)&long long v49 = 0;
  *((void *)&v49 + 1) = &v49;
  uint64_t v50 = 0x3052000000;
  v51 = __Block_byref_object_copy__5091;
  v52 = __Block_byref_object_dispose__5092;
  uint64_t v53 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "remoteObjectProxy"), "boost");
  uint64_t v8 = *(void **)(a1 + 176);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke;
  v40[3] = &unk_1E5255010;
  v40[4] = a1;
  uint64_t v9 = (void *)[v8 synchronousRemoteObjectProxyWithErrorHandler:v40];
  uint64_t v10 = (void *)[*(id *)(a1 + 112) _overriddenDelegateOptions];
  if (!v10) {
    uint64_t v10 = (void *)[(NSURLSession *)a1 delegateOptions];
  }
  id v12 = (id)[v10 mutableCopy];
  [v12 setObject:*(void *)(a1 + 128) forKeyedSubscript:@"NDBackgroundSessionManagerKeySessionUUID"];
  if ([*(id *)(a1 + 112) _isProxySession])
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    CFTypeRef v13 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 128);
      uint64_t v15 = [*(id *)(a1 + 112) identifier];
      *(_DWORD *)long long buf = 138543874;
      *(void *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2112;
      v55 = (void *)v15;
      int v16 = "ProxySession <%{public}@> background session setup will wait for reply: session %@ with identifier %@";
LABEL_21:
      _os_log_impl(&dword_184085000, v13, OS_LOG_TYPE_DEFAULT, v16, buf, 0x20u);
    }
  }
  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    CFTypeRef v13 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 128);
      uint64_t v18 = [*(id *)(a1 + 112) identifier];
      *(_DWORD *)long long buf = 138543874;
      *(void *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2112;
      v55 = (void *)v18;
      int v16 = "BackgroundSession <%{public}@> background session setup will wait for reply: session %@ with identifier %@";
      goto LABEL_21;
    }
  }
  uint64_t v19 = *(void *)(a1 + 112);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke_57;
  v39[3] = &unk_1E5253FF0;
  v39[4] = a1;
  v39[5] = &v45;
  v39[6] = &v41;
  v39[7] = &v49;
  [v9 createSessionWithConfiguration:v19 clientProxy:a1 cachesDirectory:0 options:v12 reply:v39];
  if (*((unsigned char *)v42 + 24)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Creating an AVAssetDownloadURLSession requires the com.apple.developer.media-asset-download entitlement" userInfo:0]);
  }
  if (*((unsigned char *)v46 + 24))
  {
    if ([*(id *)(a1 + 112) _isProxySession])
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      objc_super v20 = CFNLog::logger;
      if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      uint64_t v21 = *(void *)(a1 + 128);
      *(_DWORD *)long long buf = 138543362;
      *(void *)&buf[4] = v21;
      v22 = "ProxySession <%{public}@> will reconnect to existing state by requesting pending callbacks";
    }
    else
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      objc_super v20 = CFNLog::logger;
      if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      uint64_t v24 = *(void *)(a1 + 128);
      *(_DWORD *)long long buf = 138543362;
      *(void *)&buf[4] = v24;
      v22 = "BackgroundSession <%{public}@> will reconnect to existing state by requesting pending callbacks";
    }
    _os_log_impl(&dword_184085000, v20, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
LABEL_36:
    CFTypeRef v25 = *(void **)(a1 + 176);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke_75;
    v38[3] = &unk_1E5255010;
    v38[4] = a1;
    uint64_t v26 = (void *)[v25 remoteObjectProxyWithErrorHandler:v38];
    uint64_t v27 = [*(id *)(a1 + 112) identifier];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke_76;
    v37[3] = &unk_1E5258228;
    v37[4] = a1;
    [v26 sendPendingCallbacksForIdentifier:v27 reply:v37];
    goto LABEL_37;
  }
  if ([*(id *)(a1 + 192) count])
  {
    uint64_t v23 = *(NSObject **)(a1 + 120);
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __49____NSURLBackgroundSession_failDisconnectedTasks__block_invoke;
    v55 = &unk_1E5258228;
    uint64_t v56 = a1;
    dispatch_async(v23, buf);
  }
LABEL_37:
  if (!*(void *)(a1 + 272)) {
    goto LABEL_47;
  }
  if ([*(id *)(a1 + 112) _isProxySession])
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v28 = CFNLog::logger;
    if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    uint64_t v29 = *(void *)(a1 + 128);
    uint64_t v30 = *(void *)(a1 + 272);
    *(_DWORD *)long long buf = 138543618;
    *(void *)&buf[4] = v29;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v30;
    v31 = "ProxySession <%{public}@> received invalidation error %@ when attempting to connect to background transfer daemon";
  }
  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v28 = CFNLog::logger;
    if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    uint64_t v34 = *(void *)(a1 + 128);
    uint64_t v35 = *(void *)(a1 + 272);
    *(_DWORD *)long long buf = 138543618;
    *(void *)&buf[4] = v34;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v35;
    v31 = "BackgroundSession <%{public}@> received invalidation error %@ when attempting to connect to background transfer daemon";
  }
  _os_log_error_impl(&dword_184085000, v28, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);
LABEL_46:

  *(void *)(a1 + 272) = 0;
LABEL_47:
  if (*(void *)(*((void *)&v49 + 1) + 40))
  {
    [*(id *)(a1 + 176) invalidate];

    *(void *)(a1 + 176) = 0;
    *(void *)(a1 + 168) = 0;
    id v32 = *(id *)(*((void *)&v49 + 1) + 40);
    *(void *)(a1 + 272) = v32;
    v33 = (void *)[v32 domain];
    if ([v33 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      if ([*(id *)(a1 + 272) code] == -996 || objc_msgSend(*(id *)(a1 + 272), "code") == -1009) {
        *(unsigned char *)(a1 + 280) = 1;
      }
    }
  }
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v45, 8);
}

- (void)credStorage_getInitialCredentialDictionariesWithReply:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionary];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionary];
  uint64_t v6 = (void (*)(id, uint64_t, uint64_t))*((void *)a3 + 2);

  v6(a3, v4, v5);
}

- (uint64_t)validateSerializabilityForRequest:(uint64_t)result completion:(uint64_t)a2
{
  if (result)
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) == 0)
    {
      objc_opt_class();
      result = objc_opt_isKindOfClass();
      if ((result & 1) == 0)
      {
        uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v7 = *MEMORY[0x1E4F1C3C8];
        uint64_t v5 = (__CFString *)[NSString stringWithFormat:@"Custom subclasses of NSURLRequest are not supported in background sessions. Attempted to use a request of class %@", objc_opt_class()];
        int v3 = v6;
        uint64_t v4 = v7;
LABEL_7:
        objc_exception_throw((id)[v3 exceptionWithName:v4 reason:v5 userInfo:0]);
      }
    }
  }
  if (a2)
  {
    int v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3A8];
    uint64_t v5 = @"Completion handler blocks are not supported in background sessions. Use a delegate instead.";
    goto LABEL_7;
  }
  return result;
}

- (void)_onqueue_getTasksWithCompletionHandler:(id)a3
{
  uint64_t v4 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)objc_msgSend((id)-[NSMutableDictionary allValues](self->_tasks, "allValues"), "copy");
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67____NSURLBackgroundSession__onqueue_getTasksWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E5258028;
  v5[4] = self;
  void v5[5] = a3;
  -[NSURLSession runDelegateBlock:]((uint64_t)v4, v5);
}

- (void)backgroundTaskDidResume:(unint64_t)a3
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52____NSURLBackgroundSession_backgroundTaskDidResume___block_invoke;
  v4[3] = &unk_1E5258250;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)cameIntoForeground:(id)a3
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47____NSURLBackgroundSession_cameIntoForeground___block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (id)_dataTaskWithTaskForClass:(id)a3
{
  uint64_t v4 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  if ([(__NSURLBackgroundSession *)self _supportsAVAssetDownloads]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"AVAssetDownloadURLSession does not support NSURLSessionDataTask" userInfo:0]);
  }
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__5091;
  id v12 = __Block_byref_object_dispose__5092;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54____NSURLBackgroundSession__dataTaskWithTaskForClass___block_invoke;
  v7[3] = &unk_1E5257BC8;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = v4;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)v4, (uint64_t)v7);
  uint64_t v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)_uploadTaskWithTaskForClass:(id)a3
{
  uint64_t v4 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  if ([(__NSURLBackgroundSession *)self _supportsAVAssetDownloads]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"AVAssetDownloadURLSession does not support NSURLSessionUploadTask" userInfo:0]);
  }
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__5091;
  id v12 = __Block_byref_object_dispose__5092;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56____NSURLBackgroundSession__uploadTaskWithTaskForClass___block_invoke;
  v7[3] = &unk_1E5257BC8;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = v4;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)v4, (uint64_t)v7);
  uint64_t v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)performBlockOnQueueAndRethrowExceptions:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x3052000000;
    uint64_t v8 = __Block_byref_object_copy__5091;
    uint64_t v9 = __Block_byref_object_dispose__5092;
    uint64_t v10 = 0;
    double v2 = *(NSObject **)(a1 + 120);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68____NSURLBackgroundSession_performBlockOnQueueAndRethrowExceptions___block_invoke;
    block[3] = &unk_1E5254068;
    block[4] = a1;
    void block[5] = a2;
    block[6] = &v5;
    dispatch_sync(v2, block);
    int v3 = (void *)v6[5];
    if (v3) {
      objc_exception_throw(v3);
    }
    _Block_object_dispose(&v5, 8);
  }
}

- (id)_downloadTaskWithTaskForClass:(id)a3
{
  uint64_t v4 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  if ([(__NSURLBackgroundSession *)self _supportsAVAssetDownloads]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"AVAssetDownloadURLSession does not support NSURLSessionDownloadTask" userInfo:0]);
  }
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__5091;
  id v12 = __Block_byref_object_dispose__5092;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58____NSURLBackgroundSession__downloadTaskWithTaskForClass___block_invoke;
  v7[3] = &unk_1E5257BC8;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = v4;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)v4, (uint64_t)v7);
  uint64_t v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void).cxx_destruct
{
  cntrl = self->_backgroundSessionDidFinishAppWakeBlock.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setAppWakeUUID:(id)a3
{
}

- (NSString)appWakeUUID
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)_onqueue_completeInvalidation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58____NSURLBackgroundSession__onqueue_completeInvalidation___block_invoke;
  aBlock[3] = &unk_1E5254428;
  aBlock[4] = self;
  if (self)
  {
    if (self->_invalidateCallback)
    {
      __58____NSURLBackgroundSession__onqueue_completeInvalidation___block_invoke((uint64_t)aBlock, 0);
    }
    else
    {
      self->_invalidateCallback = _Block_copy(aBlock);
      self->_invalidateQueue = workQueue;
      if (workQueue) {
        dispatch_retain((dispatch_object_t)workQueue);
      }
      if (v3)
      {
        uint64_t v6 = objc_msgSend((id)-[NSMutableDictionary allValues](self->_tasks, "allValues"), "copy");
        long long v12 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v13;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v13 != v9) {
                objc_enumerationMutation(v6);
              }
              [*(id *)(*((void *)&v12 + 1) + 8 * i) cancel];
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
          }
          while (v8);
        }
      }
      -[__NSURLBackgroundSession sendInvalidationRequest]((uint64_t)self);
    }
  }
}

- (void)sendInvalidationRequest
{
  if (a1)
  {
    double v2 = *(void **)(a1 + 168);
    if (v2
      || *(unsigned char *)(a1 + 280)
      && (-[__NSURLBackgroundSession setupXPCConnection](a1),
          -[__NSURLBackgroundSession setupBackgroundSession](a1),
          (double v2 = *(void **)(a1 + 168)) != 0))
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __51____NSURLBackgroundSession_sendInvalidationRequest__block_invoke;
      v3[3] = &unk_1E5258228;
      v3[4] = a1;
      [v2 invalidateWithReply:v3];
    }
    else
    {
      -[__NSURLBackgroundSession _onqueue_invokeInvalidateCallback](a1);
    }
  }
}

- (void)_onqueue_invokeInvalidateCallback
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 216);
    if (v1)
    {
      if (*(void *)(a1 + 208))
      {
        *(void *)(a1 + 216) = 0;
        double v2 = *(NSObject **)(a1 + 208);
        *(void *)(a1 + 208) = 0;
        v3[0] = MEMORY[0x1E4F143A8];
        v3[1] = 3221225472;
        v3[2] = __61____NSURLBackgroundSession__onqueue_invokeInvalidateCallback__block_invoke;
        v3[3] = &unk_1E5258028;
        v3[4] = a1;
        void v3[5] = v1;
        dispatch_async(v2, v3);
        dispatch_release(v2);
      }
    }
  }
}

- (void)_onqueue_retryDataTaskWithIdentifier:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = -[__NSURLBackgroundSession taskForIdentifier:]((id *)a1, a2);
    if (!v4)
    {
      int v13 = [*(id *)(a1 + 112) _isProxySession];
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      long long v14 = CFNLog::logger;
      BOOL v15 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
      if (v13)
      {
        if (!v15) {
          return;
        }
        uint64_t v16 = *(void *)(a1 + 128);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v21 = v16;
        __int16 v22 = 2048;
        uint64_t v23 = a2;
        uint64_t v17 = "ProxySession <%{public}@> cannot retry background data task with identifier %lu because there is no such task";
      }
      else
      {
        if (!v15) {
          return;
        }
        uint64_t v18 = *(void *)(a1 + 128);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v21 = v18;
        __int16 v22 = 2048;
        uint64_t v23 = a2;
        uint64_t v17 = "BackgroundSession <%{public}@> cannot retry background data task with identifier %lu because there is no such task";
      }
      _os_log_error_impl(&dword_184085000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x16u);
      return;
    }
    uint64_t v5 = v4;
    -[__NSCFBackgroundDataTask _onqueue_finishStream:]((uint64_t)v4, 1u);
    uint64_t v6 = (uint64_t)v5[88];
    if (!v6) {
      uint64_t v6 = (uint64_t)v5[87];
    }
    uint64_t v7 = objc_msgSend((id)objc_msgSend(v5, "currentRequest"), "URL");
    -[__NSCFURLSessionDelegateWrapper _willRetryBackgroundDataTask:withError:](v6, v5, objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1005, v7));
    id v8 = (id)objc_msgSend((id)objc_msgSend(v5, "currentRequest"), "mutableCopy");
    uint64_t v9 = NSNumber;
    [v5 startTime];
    +[NSURLProtocol setProperty:forKey:inRequest:](NSURLProtocol, "setProperty:forKey:inRequest:", objc_msgSend(v9, "numberWithDouble:"), @"NSURLSessionTaskOriginalStartTimeKey", v8);
    uint64_t v10 = *(void **)(a1 + 168);
    uint64_t v11 = [v5 originalRequest];
    uint64_t v12 = [v5 _uniqueIdentifier];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __65____NSURLBackgroundSession__onqueue_retryDataTaskWithIdentifier___block_invoke;
    v19[3] = &unk_1E5254250;
    v19[4] = a1;
    v19[5] = a2;
    [v10 dataTaskWithRequest:v8 originalRequest:v11 identifier:a2 uniqueIdentifier:v12 reply:v19];
    if ([v5 _priorityValue]) {
      objc_msgSend(*(id *)(a1 + 168), "setPriority:forTaskWithIdentifier:", objc_msgSend(v5, "_priorityValue"), a2);
    }
    if ([v5 _bytesPerSecondLimit]) {
      objc_msgSend(*(id *)(a1 + 168), "setBytesPerSecondLimit:forTaskWithIdentifier:", objc_msgSend(v5, "_bytesPerSecondLimit"), a2);
    }
    if ([v5 _expectedProgressTarget]) {
      objc_msgSend(*(id *)(a1 + 168), "setExpectedProgressTarget:forTaskWithIdentifier:", objc_msgSend(v5, "_expectedProgressTarget"), a2);
    }
    if ([v5 _TLSMinimumSupportedProtocolVersion]) {
      objc_msgSend(*(id *)(a1 + 168), "setTLSMinimumSupportedProtocolVersion:forTaskWithIdentifier:", objc_msgSend(v5, "_TLSMinimumSupportedProtocolVersion"), a2);
    }
    if ([v5 _TLSMaximumSupportedProtocolVersion]) {
      objc_msgSend(*(id *)(a1 + 168), "setTLSMaximumSupportedProtocolVersion:forTaskWithIdentifier:", objc_msgSend(v5, "_TLSMaximumSupportedProtocolVersion"), a2);
    }
    [*(id *)(a1 + 168) resumeTaskWithIdentifier:a2 withProperties:0];
  }
}

- (void)credStorage_setDefaultCredential:(id)a3 forProtectionSpace:(id)a4
{
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  uint64_t v6 = (void *)[(__NSURLBackgroundSession *)self URLCredentialStorage];

  [v6 setDefaultCredential:a3 forProtectionSpace:a4];
}

- (void)credStorage_defaultCredentialForProtectionSpace:(id)a3 reply:(id)a4
{
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  uint64_t v5 = objc_msgSend((id)-[__NSURLBackgroundSession URLCredentialStorage](self, "URLCredentialStorage"), "defaultCredentialForProtectionSpace:", a3);
  if ([v5 hasPassword]) {
    [v5 password];
  }
  uint64_t v6 = (void (*)(id, void *))*((void *)a4 + 2);

  v6(a4, v5);
}

- (void)credStorage_removeCredential:(id)a3 forProtectionSpace:(id)a4
{
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  uint64_t v6 = (void *)[(__NSURLBackgroundSession *)self URLCredentialStorage];

  [v6 removeCredential:a3 forProtectionSpace:a4];
}

- (void)credStorage_setCredential:(id)a3 forProtectionSpace:(id)a4
{
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  uint64_t v6 = (void *)[(__NSURLBackgroundSession *)self URLCredentialStorage];

  [v6 setCredential:a3 forProtectionSpace:a4];
}

- (void)credStorage_credentialsForProtectionSpace:(id)a3 reply:(id)a4
{
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  uint64_t v5 = objc_msgSend((id)-[__NSURLBackgroundSession URLCredentialStorage](self, "URLCredentialStorage"), "credentialsForProtectionSpace:", a3);
  uint64_t v6 = (void (*)(id, uint64_t))*((void *)a4 + 2);

  v6(a4, v5);
}

- (void)credStorage_allCredentialsWithReply:(id)a3
{
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  uint64_t v4 = objc_msgSend((id)-[__NSURLBackgroundSession URLCredentialStorage](self, "URLCredentialStorage"), "allCredentials");
  uint64_t v5 = (void (*)(id, uint64_t))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)backgroundSessionDidFinishAppWake:(id)a3 reply:(id)a4
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68____NSURLBackgroundSession_backgroundSessionDidFinishAppWake_reply___block_invoke;
  block[3] = &unk_1E52581A0;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(workQueue, block);
}

- (void)backgroundSessionDidStartAppWake:(id)a3 reply:(id)a4
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67____NSURLBackgroundSession_backgroundSessionDidStartAppWake_reply___block_invoke;
  block[3] = &unk_1E52581A0;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(workQueue, block);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didFinishDownloadForMediaSelectionPropertyList:(id)a4
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didFinishDownloadForMediaSelectionPropertyList___block_invoke;
  block[3] = &unk_1E5257B78;
  void block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 willDownloadVariants:(id)a4 reply:(id)a5
{
  uint64_t v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85____NSURLBackgroundSession_backgroundAVAssetDownloadTask_willDownloadVariants_reply___block_invoke;
  v6[3] = &unk_1E52573A0;
  v6[4] = v5;
  void v6[5] = a4;
  v6[6] = a5;
  v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 willDownloadToURL:(id)a4
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76____NSURLBackgroundSession_backgroundAVAssetDownloadTask_willDownloadToURL___block_invoke;
  block[3] = &unk_1E5257B78;
  void block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didResolveMediaSelectionProperyList:(id)a4 reply:(id)a5
{
  uint64_t v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __100____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didResolveMediaSelectionProperyList_reply___block_invoke;
  v6[3] = &unk_1E52573A0;
  v6[4] = v5;
  void v6[5] = a4;
  v6[6] = a5;
  v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didLoadTimeRange:(id)a4 totalTimeRangesLoaded:(id)a5 timeRangeExpectedToLoad:(id)a6 forMediaSelectionPropertyList:(id)a7
{
  uint64_t v7 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __151____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelectionPropertyList___block_invoke;
  v8[3] = &unk_1E52543D8;
  v8[4] = v7;
  v8[5] = a4;
  v8[6] = a5;
  v8[7] = a6;
  v8[8] = a7;
  v8[9] = a3;
  dispatch_async(&self->super.super, v8);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didReceiveDownloadToken:(unint64_t)a4
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didReceiveDownloadToken___block_invoke;
  block[3] = &unk_1E5255EB0;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(workQueue, block);
}

- (void)backgroundAVAssetDownloadTaskDidUpdateProgress:(unint64_t)a3 totalBytesWritten:(unint64_t)a4 totalBytesExpectedToWrite:(unint64_t)a5
{
  uint64_t v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __119____NSURLBackgroundSession_backgroundAVAssetDownloadTaskDidUpdateProgress_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
  v6[3] = &unk_1E5255E40;
  v6[4] = v5;
  void v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(&self->super.super, v6);
}

- (void)openFileAtPath:(id)a3 mode:(int)a4 withReply:(id)a5
{
}

- (void)backgroundDownloadTask:(unint64_t)a3 didResumeAtOffset:(int64_t)a4 expectedTotalBytes:(int64_t)a5
{
  uint64_t v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88____NSURLBackgroundSession_backgroundDownloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke;
  v6[3] = &unk_1E5255E40;
  v6[4] = v5;
  void v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundDownloadTask:(unint64_t)a3 didWriteData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  uint64_t v6 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108____NSURLBackgroundSession_backgroundDownloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
  block[3] = &unk_1E52563B0;
  block[4] = v6;
  void block[5] = a3;
  block[6] = a4;
  void block[7] = a5;
  block[8] = a6;
  dispatch_async(&self->super.super, block);
}

- (void)backgroundDownloadTask:(unint64_t)a3 didFinishDownloadingToURL:(id)a4 response:(id)a5 reply:(id)a6
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92____NSURLBackgroundSession_backgroundDownloadTask_didFinishDownloadingToURL_response_reply___block_invoke;
  block[3] = &unk_1E52573C8;
  void block[7] = a6;
  block[8] = a3;
  block[4] = self;
  void block[5] = a5;
  block[6] = a4;
  dispatch_async(workQueue, block);
}

- (void)willRetryBackgroundDataTask:(unint64_t)a3 withError:(id)a4 transactionMetrics:(id)a5
{
  uint64_t v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85____NSURLBackgroundSession_willRetryBackgroundDataTask_withError_transactionMetrics___block_invoke;
  v6[3] = &unk_1E52568F8;
  v6[4] = v5;
  void v6[5] = a5;
  v6[6] = a4;
  v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundDataTaskDidBecomeDownloadTask:(unint64_t)a3
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68____NSURLBackgroundSession_backgroundDataTaskDidBecomeDownloadTask___block_invoke;
  v4[3] = &unk_1E5258250;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)backgroundTask:(unint64_t)a3 getAuthHeadersForResponse:(id)a4 reply:(id)a5
{
  uint64_t v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke;
  v6[3] = &unk_1E52573A0;
  v6[4] = v5;
  void v6[5] = a4;
  v6[6] = a5;
  v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundDataTask:(unint64_t)a3 didReceiveData:(id)a4 withReply:(id)a5
{
  uint64_t v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72____NSURLBackgroundSession_backgroundDataTask_didReceiveData_withReply___block_invoke;
  v6[3] = &unk_1E52573A0;
  v6[4] = v5;
  void v6[5] = a4;
  v6[6] = a5;
  v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundTask:(unint64_t)a3 needNewBodyStream:(BOOL)a4 withReply:(id)a5
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71____NSURLBackgroundSession_backgroundTask_needNewBodyStream_withReply___block_invoke;
  v6[3] = &unk_1E5254338;
  void v6[5] = a5;
  v6[6] = a3;
  BOOL v7 = a4;
  v6[4] = self;
  dispatch_async(workQueue, v6);
}

- (void)backgroundTask:(unint64_t)a3 didSendBodyData:(int64_t)a4 totalBytesSent:(int64_t)a5 totalBytesExpectedToSend:(int64_t)a6
{
  uint64_t v6 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99____NSURLBackgroundSession_backgroundTask_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke;
  block[3] = &unk_1E52563B0;
  block[4] = v6;
  void block[5] = a3;
  block[6] = a4;
  void block[7] = a5;
  block[8] = a6;
  dispatch_async(&self->super.super, block);
}

- (void)backgroundTask:(unint64_t)a3 didReceiveResponse:(id)a4 transactionMetrics:(id)a5 reply:(id)a6
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87____NSURLBackgroundSession_backgroundTask_didReceiveResponse_transactionMetrics_reply___block_invoke;
  block[3] = &unk_1E52573C8;
  void block[7] = a6;
  block[8] = a3;
  block[4] = self;
  void block[5] = a5;
  block[6] = a4;
  dispatch_async(workQueue, block);
}

- (void)backgroundTask:(unint64_t)a3 didReceiveResponse:(id)a4 transactionMetrics:(id)a5
{
  uint64_t v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81____NSURLBackgroundSession_backgroundTask_didReceiveResponse_transactionMetrics___block_invoke;
  v6[3] = &unk_1E52568F8;
  v6[4] = v5;
  void v6[5] = a5;
  v6[6] = a4;
  void v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundTask:(unint64_t)a3 didReceiveInformationalResponse:(id)a4
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75____NSURLBackgroundSession_backgroundTask_didReceiveInformationalResponse___block_invoke;
  block[3] = &unk_1E5257B78;
  void block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)backgroundTask:(unint64_t)a3 hasConnectionWaitingWithError:(id)a4
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73____NSURLBackgroundSession_backgroundTask_hasConnectionWaitingWithError___block_invoke;
  block[3] = &unk_1E5257B78;
  void block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)backgroundTask:(unint64_t)a3 hasConnectionWaitingWithReason:(int64_t)a4
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74____NSURLBackgroundSession_backgroundTask_hasConnectionWaitingWithReason___block_invoke;
  block[3] = &unk_1E5255EB0;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(workQueue, block);
}

- (void)backgroundTaskHasConnectionWaiting:(unint64_t)a3
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63____NSURLBackgroundSession_backgroundTaskHasConnectionWaiting___block_invoke;
  v4[3] = &unk_1E5258250;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)backgroundTask:(unint64_t)a3 _willSendRequestForEstablishedConnection:(id)a4 reply:(id)a5
{
  uint64_t v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90____NSURLBackgroundSession_backgroundTask__willSendRequestForEstablishedConnection_reply___block_invoke;
  v6[3] = &unk_1E52573A0;
  v6[4] = v5;
  void v6[5] = a4;
  v6[6] = a5;
  void v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundTask:(unint64_t)a3 willPerformHTTPRedirection:(id)a4 withNewRequest:(id)a5 reply:(id)a6
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91____NSURLBackgroundSession_backgroundTask_willPerformHTTPRedirection_withNewRequest_reply___block_invoke;
  block[3] = &unk_1E52573C8;
  void block[7] = a6;
  block[8] = a3;
  block[4] = self;
  void block[5] = a4;
  block[6] = a5;
  dispatch_async(workQueue, block);
}

- (void)backgroundTask:(unint64_t)a3 willBeginDelayedRequest:(id)a4 reply:(id)a5
{
  uint64_t v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73____NSURLBackgroundSession_backgroundTask_willBeginDelayedRequest_reply___block_invoke;
  v6[3] = &unk_1E52573A0;
  v6[4] = v5;
  void v6[5] = a4;
  v6[6] = a5;
  void v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundTask:(unint64_t)a3 didReceiveChallenge:(id)a4 reply:(id)a5
{
  uint64_t v5 = self;
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke;
  v6[3] = &unk_1E52573A0;
  v6[4] = v5;
  void v6[5] = a4;
  v6[6] = a5;
  void v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundTaskDidSuspend:(unint64_t)a3
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53____NSURLBackgroundSession_backgroundTaskDidSuspend___block_invoke;
  v4[3] = &unk_1E5258250;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)_onqueue_resetStorageWithCompletionHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x18531D6D0](self, a2);
  if (self)
  {
    uint64_t v6 = [(NSURLSessionConfiguration *)self->super._local_immutable_configuration_ivar HTTPCookieStorage];
    local_immutable_configuration_ivar = self->super._local_immutable_configuration_ivar;
  }
  else
  {
    uint64_t v6 = (NSHTTPCookieStorage *)[0 HTTPCookieStorage];
    local_immutable_configuration_ivar = 0;
  }
  id v8 = [(NSURLSessionConfiguration *)local_immutable_configuration_ivar URLCredentialStorage];
  uint64_t v9 = [(NSHTTPCookieStorage *)v6 cookies];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        [(NSHTTPCookieStorage *)v6 deleteCookie:*(void *)(*((void *)&v21 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }
  [(NSHTTPCookieStorage *)v6 _saveCookies];
  long long v14 = [(NSURLCredentialStorage *)v8 allCredentials];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E5254200;
  v20[4] = v8;
  [(NSDictionary *)v14 enumerateKeysAndObjectsUsingBlock:v20];
  remoteSession = self->_remoteSession;
  if (remoteSession)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_3;
    v19[3] = &unk_1E5254228;
    v19[4] = a3;
    uint64_t v16 = (void *)[(NDBackgroundSessionProtocol *)remoteSession remoteObjectProxyWithErrorHandler:v19];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_4;
    v18[3] = &unk_1E5257FD8;
    v18[4] = a3;
    [v16 resetStorageWithReply:v18];
  }
  else
  {
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_async(global_queue, a3);
  }
}

- (void)_onqueue_flushWithCompletionHandler:(id)a3
{
  if (self) {
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  }
  objc_msgSend((id)-[__NSURLBackgroundSession HTTPCookieStorage](self, "HTTPCookieStorage"), "_saveCookies");
  global_queue = dispatch_get_global_queue(0, 0);

  dispatch_async(global_queue, a3);
}

- (id)AVAggregateAssetDownloadTaskForURLAsset:(id)a3 mediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy__5091;
  long long v14 = __Block_byref_object_dispose__5092;
  uint64_t v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __120____NSURLBackgroundSession_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke;
  v9[3] = &unk_1E5254160;
  v9[9] = a7;
  v9[10] = &v10;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  v9[7] = a5;
  v9[8] = a6;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)self, (uint64_t)v9);
  BOOL v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (uint64_t)doesAVAssetDownloadSessionSupportMultipleDownloads
{
  gotLoadHelper_x19__OBJC_CLASS___AVAssetDownloadSession(a1);
  if (objc_opt_class()) {
    return objc_opt_respondsToSelector() & 1;
  }
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

- (void)serializableAVAssetDownloadTaskOptionsFromOptions:(void *)a1 mediaSelections:(void *)a2 downloadConfiguration:(uint64_t)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a1) {
    id v6 = (id)[a1 mutableCopy];
  }
  else {
    id v6 = (id)[MEMORY[0x1E4F1CA60] dictionary];
  }
  id v8 = v6;
  if (!-[__NSURLBackgroundSession doesAVAssetDownloadSessionSupportMultipleDownloads](v7))
  {
    if (![v8 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionKey"]) {
      goto LABEL_29;
    }
    uint64_t v16 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"AVAssetDownloadTaskMediaSelectionKey"), "propertyList");
    uint64_t v17 = v8;
    uint64_t v18 = @"AVAssetDownloadTaskMediaSelectionKey";
    goto LABEL_28;
  }
  if (a2)
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v10 = [a2 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(a2);
          }
          objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "propertyList"));
        }
        uint64_t v11 = [a2 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v11);
    }
    long long v14 = v8;
    uint64_t v15 = (uint64_t)v9;
    goto LABEL_18;
  }
  if ([v8 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionKey"])
  {
    uint64_t v19 = (void *)[v8 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionKey"];
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_msgSend(v19, "propertyList"));
    long long v14 = v8;
LABEL_18:
    [v14 setObject:v15 forKeyedSubscript:@"AVAssetDownloadSessionMediaSelectionArrayKey"];
  }
  uint64_t v20 = [a1 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionsForMultichannelKey"];
  if (!v20) {
    goto LABEL_29;
  }
  long long v21 = (void *)v20;
  long long v22 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend(v22, "addObject:", objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "propertyList"));
      }
      uint64_t v24 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v24);
  }
  uint64_t v18 = @"AVAssetDownloadTaskMediaSelectionsForMultichannelKey";
  uint64_t v17 = v8;
  uint64_t v16 = (uint64_t)v22;
LABEL_28:
  [v17 setObject:v16 forKeyedSubscript:v18];
LABEL_29:
  if (a3) {
    [v8 setObject:a3 forKeyedSubscript:@"AVAssetDownloadTaskDownloadConfigurationKey"];
  }
  uint64_t v27 = (void *)[v8 objectForKey:@"AVAssetDownloadTaskMinimumRequiredPresentationSizeKey"];
  if (v27)
  {
    uint64_t v28 = v27;
    if (!strncmp((const char *)[v27 objCType], "{CGSize=dd}", 0x10uLL))
    {
      [v28 getValue:&v32];
      DictionaryRepresentation_delayInitStub = (const void *)CGSizeCreateDictionaryRepresentation_delayInitStub(v32);
      CFTypeRef v29 = (id)CFMakeCollectable(DictionaryRepresentation_delayInitStub);
    }
    else
    {
      CFTypeRef v29 = 0;
    }
    [v8 setObject:v29 forKeyedSubscript:@"AVAssetDownloadTaskMinimumRequiredPresentationSizeKey"];
  }
  objc_msgSend(v8, "removeObjectsForKeys:", objc_msgSend((id)objc_msgSend(v8, "keysOfEntriesPassingTest:", &__block_literal_global_197), "allObjects"));
  return v8;
}

- (id)AVAssetDownloadTaskForURLAsset:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6 downloadConfiguration:(id)a7
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy__5091;
  long long v14 = __Block_byref_object_dispose__5092;
  uint64_t v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __117____NSURLBackgroundSession_AVAssetDownloadTaskForURLAsset_assetTitle_assetArtworkData_options_downloadConfiguration___block_invoke;
  v9[3] = &unk_1E5254160;
  v9[9] = a6;
  v9[10] = &v10;
  v9[4] = a7;
  v9[5] = self;
  v9[6] = a3;
  v9[7] = a4;
  v9[8] = a5;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)self, (uint64_t)v9);
  double v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)_onqueue_AVAssetDownloadTaskForURLAsset:(uint64_t)a3 URL:(uint64_t)a4 destinationURL:(uint64_t)a5 assetTitle:(uint64_t)a6 assetArtworkData:(void *)a7 options:(uint64_t)a8 downloadConfiguration:(char)a9 enableSPIDelegateCallbacks:
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v9 = (uint64_t)result;
  if (*((unsigned char *)result + 265))
  {
    int v10 = [result[14] _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v11 = CFNLog::logger;
    BOOL v12 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v12)
      {
        uint64_t v13 = *(void *)(v9 + 128);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v70 = v13;
        long long v14 = "ProxySession <%{public}@> attempted to create an AVAssetDownloadTask in a session that has been invalidated";
LABEL_52:
        _os_log_error_impl(&dword_184085000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
      }
    }
    else if (v12)
    {
      uint64_t v58 = *(void *)(v9 + 128);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v70 = v58;
      long long v14 = "BackgroundSession <%{public}@> attempted to create an AVAssetDownloadTask in a session that has been invalidated";
      goto LABEL_52;
    }
    uint64_t v26 = (NSString *)dyld_program_sdk_at_least();
    if (v26) {
      __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v26);
    }
    return 0;
  }
  if (!result[34])
  {
    if (a7) {
      id v28 = (id)[a7 mutableCopy];
    }
    else {
      id v28 = (id)[MEMORY[0x1E4F1CA60] dictionary];
    }
    CFTypeRef v29 = v28;
    uint64_t v65 = a4;
    if (a4)
    {
      if (a2)
      {
LABEL_23:
        uint64_t v30 = [a2 downloadToken];
        uint64_t v31 = 0;
        uint64_t v64 = v30;
        if (!a8 && v65 && a4)
        {
          uint64_t v32 = [NSString stringWithFormat:@"CFNetworkAVDownload_%@.movpkg", destinationURLFragment(a2, objc_msgSend(NSString, "stringWithFormat:", @"%llu", v30))];
          uint64_t v31 = [-[__NSURLBackgroundSession backgroundDownloadsDirectory](v9) URLByAppendingPathComponent:v32 isDirectory:0];
          if (objc_msgSend((id)objc_msgSend(a2, "URL"), "isFileURL")) {
            [v29 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"AVAssetDownloadSessionLinkAssetURLToDestinationURLKey"];
          }
          [v29 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"AVAssetDownloadSessionDeleteDownloadWhenAssetFinalizesKey"];
          a3 = 0;
        }
        else
        {
          a3 = 0;
        }
LABEL_32:
        long long v33 = -[__NSURLBackgroundSession serializableAVAssetDownloadTaskOptionsFromOptions:mediaSelections:downloadConfiguration:](v29, 0, a8);
        long long v34 = [__NSCFBackgroundAVAssetDownloadTask alloc];
        uint64_t v35 = [(id)v9 defaultTaskGroup];
        uint64_t v36 = *(void *)(v9 + 160);
        *(void *)(v9 + 160) = v36 + 1;
        LOBYTE(v61) = a9;
        long long v37 = [(__NSCFBackgroundAVAssetDownloadTask *)v34 initWithTaskGroup:v35 URLAsset:a2 URL:a3 destinationURL:v65 temporaryDestinationURL:v31 assetTitle:a5 assetArtworkData:a6 ident:v36 enableSPIDelegateCallbacks:v61];
        long long v38 = *(void **)(v9 + 168);
        if (v38)
        {
          v68[0] = MEMORY[0x1E4F143A8];
          v68[1] = 3221225472;
          v68[2] = __172____NSURLBackgroundSession__onqueue_AVAssetDownloadTaskForURLAsset_URL_destinationURL_assetTitle_assetArtworkData_options_downloadConfiguration_enableSPIDelegateCallbacks___block_invoke;
          v68[3] = &unk_1E5254090;
          v68[4] = v9;
          v68[5] = v37;
          v68[6] = a3;
          uint64_t v39 = [v38 synchronousRemoteObjectProxyWithErrorHandler:v68];
          id newValue = 0;
          if (a2)
          {
            uint64_t v40 = [a2 propertyListForNSURLSessionAssetReturningError:&newValue];
            if (!v40)
            {
              int v41 = [*(id *)(v9 + 112) _isProxySession];
              if (CFNLog::onceToken != -1) {
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
              }
              v42 = CFNLog::logger;
              BOOL v43 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
              if (v41)
              {
                if (v43)
                {
                  uint64_t v45 = *(void *)(v9 + 128);
                  *(_DWORD *)long long buf = 138543362;
                  uint64_t v70 = v45;
                  v46 = "ProxySession <%{public}@> failed to create a background AVAssetDownloadTask, as URLAsset Propert"
                        "yList could not be serialized.";
                  goto LABEL_62;
                }
              }
              else if (v43)
              {
                uint64_t v60 = *(void *)(v9 + 128);
                *(_DWORD *)long long buf = 138543362;
                uint64_t v70 = v60;
                v46 = "BackgroundSession <%{public}@> failed to create a background AVAssetDownloadTask, as URLAsset Prop"
                      "ertyList could not be serialized.";
LABEL_62:
                _os_log_error_impl(&dword_184085000, v42, OS_LOG_TYPE_ERROR, v46, buf, 0xCu);
                if (!v37) {
                  return (id *)v37;
                }
                goto LABEL_55;
              }
              if (v37)
              {
LABEL_55:
                id v57 = newValue;
                goto LABEL_56;
              }
              return (id *)v37;
            }
          }
          else
          {
            uint64_t v40 = MEMORY[0x1E4F1CC08];
          }
          uint64_t v63 = v31;
          v52 = (void *)v39;
          uint64_t v53 = v33;
          uint64_t v54 = [(NSURLSessionTask *)v37 taskIdentifier];
          uint64_t v55 = [(NSURLSessionTask *)v37 _uniqueIdentifier];
          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = __172____NSURLBackgroundSession__onqueue_AVAssetDownloadTaskForURLAsset_URL_destinationURL_assetTitle_assetArtworkData_options_downloadConfiguration_enableSPIDelegateCallbacks___block_invoke_214;
          v66[3] = &unk_1E52540B8;
          v66[4] = v37;
          v66[5] = v9;
          v66[6] = a3;
          LOBYTE(v62) = a9;
          [v52 avAssetDownloadTaskWithDownloadToken:v64 URL:a3 destinationURL:v65 temporaryDestinationURL:v63 assetTitle:a5 assetArtworkData:a6 options:v53 assetOptions:v40 identifier:v54 uniqueIdentifier:v55 taskKind:3 enableSPIDelegateCallbacks:v62 reply:v66];
          if (!v37) {
            return (id *)v37;
          }
          goto LABEL_57;
        }
        int v47 = [*(id *)(v9 + 112) _isProxySession];
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        char v48 = CFNLog::logger;
        BOOL v49 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
        if (v47)
        {
          if (!v49) {
            goto LABEL_49;
          }
          uint64_t v50 = *(void *)(v9 + 128);
          *(_DWORD *)long long buf = 138543362;
          uint64_t v70 = v50;
          v51 = "ProxySession <%{public}@> failed to create a background AVAssetDownloadTask, as remote session is unavailable";
        }
        else
        {
          if (!v49) {
            goto LABEL_49;
          }
          uint64_t v59 = *(void *)(v9 + 128);
          *(_DWORD *)long long buf = 138543362;
          uint64_t v70 = v59;
          v51 = "BackgroundSession <%{public}@> failed to create a background AVAssetDownloadTask, as remote session is unavailable";
        }
        _os_log_error_impl(&dword_184085000, v48, OS_LOG_TYPE_ERROR, v51, buf, 0xCu);
LABEL_49:
        uint64_t v56 = objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E4F289A0], -1, a3);
        if (v37)
        {
          id v57 = (id)v56;
LABEL_56:
          objc_setProperty_atomic(v37, v44, v57, 776);
LABEL_57:
          objc_msgSend(*(id *)(v9 + 184), "setObject:forKeyedSubscript:", v37, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](v37, "taskIdentifier")));
          return (id *)v37;
        }
        return (id *)v37;
      }
    }
    else
    {
      uint64_t v65 = [v28 objectForKeyedSubscript:@"AVAssetDownloadTaskDestinationURLKey"];
      if (a2) {
        goto LABEL_23;
      }
    }
    uint64_t v64 = 0;
    uint64_t v31 = 0;
    goto LABEL_32;
  }
  uint64_t v20 = [__NSCFBackgroundAVAssetDownloadTask alloc];
  uint64_t v21 = [(id)v9 defaultTaskGroup];
  uint64_t v22 = *(void *)(v9 + 160);
  *(void *)(v9 + 160) = v22 + 1;
  LOBYTE(v61) = a9;
  uint64_t v23 = [(__NSCFBackgroundAVAssetDownloadTask *)v20 initWithTaskGroup:v21 URLAsset:a2 URL:a3 destinationURL:a4 temporaryDestinationURL:0 assetTitle:a5 assetArtworkData:a6 ident:v22 enableSPIDelegateCallbacks:v61];
  uint64_t v25 = v23;
  if (v23) {
    objc_setProperty_atomic(v23, v24, *(id *)(v9 + 272), 776);
  }

  return (id *)v25;
}

- (void)backgroundDownloadsDirectory
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  double v2 = *(void **)(a1 + 248);
  uint64_t v41 = 0;
  if (v2) {
    goto LABEL_2;
  }
  uint64_t v42 = 0;
  if (![*(id *)(a1 + 112) sharedContainerIdentifier]) {
    goto LABEL_34;
  }
  int v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "containerURLForSecurityApplicationGroupIdentifier:", objc_msgSend(*(id *)(a1 + 112), "sharedContainerIdentifier"));
  if (!v10)
  {
    int v18 = [*(id *)(a1 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v19 = CFNLog::logger;
    BOOL v20 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (!v20) {
        goto LABEL_34;
      }
      uint64_t v21 = *(void *)(a1 + 128);
      uint64_t v22 = [*(id *)(a1 + 112) sharedContainerIdentifier];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v44 = v21;
      __int16 v45 = 2112;
      uint64_t v46 = v22;
      uint64_t v23 = "ProxySession <%{public}@> failed to get URL for container with identifier %@";
    }
    else
    {
      if (!v20) {
        goto LABEL_34;
      }
      uint64_t v39 = *(void *)(a1 + 128);
      uint64_t v40 = [*(id *)(a1 + 112) sharedContainerIdentifier];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v44 = v39;
      __int16 v45 = 2112;
      uint64_t v46 = v40;
      uint64_t v23 = "BackgroundSession <%{public}@> failed to get URL for container with identifier %@";
    }
    _os_log_error_impl(&dword_184085000, v19, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
LABEL_34:
    uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v41), "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v42);
    if (v42)
    {
      int v24 = [*(id *)(a1 + 112) _isProxySession];
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      uint64_t v25 = CFNLog::logger;
      BOOL v26 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
      if (v24)
      {
        if (v26)
        {
          uint64_t v27 = *(void *)(a1 + 128);
          *(_DWORD *)long long buf = 138543618;
          uint64_t v44 = v27;
          __int16 v45 = 2112;
          uint64_t v46 = v42;
          id v28 = "ProxySession <%{public}@> failed to get caches directory for app, error: %@";
          goto LABEL_47;
        }
      }
      else if (v26)
      {
        uint64_t v31 = *(void *)(a1 + 128);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v44 = v31;
        __int16 v45 = 2112;
        uint64_t v46 = v42;
        id v28 = "BackgroundSession <%{public}@> failed to get caches directory for app, error: %@";
LABEL_47:
        _os_log_error_impl(&dword_184085000, v25, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);
        if (!v11) {
          goto LABEL_48;
        }
        goto LABEL_42;
      }
    }
    if (!v11) {
      goto LABEL_48;
    }
    goto LABEL_42;
  }
  uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", @"Library"), "URLByAppendingPathComponent:", @"Caches");
  if (!v11)
  {
LABEL_48:
    int v32 = objc_msgSend(*(id *)(a1 + 112), "_isProxySession", v41);
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    long long v33 = CFNLog::logger;
    BOOL v34 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v34)
      {
        uint64_t v35 = *(void *)(a1 + 128);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v44 = v35;
        uint64_t v36 = "ProxySession <%{public}@> failed to obtain the Caches directory for this user-context. We will not be able to download.";
LABEL_57:
        _os_log_error_impl(&dword_184085000, v33, OS_LOG_TYPE_ERROR, v36, buf, 0xCu);
      }
    }
    else if (v34)
    {
      uint64_t v38 = *(void *)(a1 + 128);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v44 = v38;
      uint64_t v36 = "BackgroundSession <%{public}@> failed to obtain the Caches directory for this user-context. We will not be a"
            "ble to download.";
      goto LABEL_57;
    }
    return 0;
  }
LABEL_42:
  double v2 = objc_msgSend(v11, "URLByAppendingPathComponent:", @"com.apple.nsurlsessiond/Downloads", v41);
  uint64_t v29 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  if (v29) {
    double v2 = (void *)[v2 URLByAppendingPathComponent:v29 isDirectory:1];
  }
LABEL_2:
  LOBYTE(v42) = 0;
  int v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v41), "fileExistsAtPath:isDirectory:", objc_msgSend(v2, "path"), &v42);
  if (v3) {
    BOOL v4 = v42 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", v2, &v41)) {
      goto LABEL_19;
    }
    int v5 = [*(id *)(a1 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    id v6 = CFNLog::logger;
    BOOL v7 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (!v7) {
        goto LABEL_19;
      }
      uint64_t v8 = *(void *)(a1 + 128);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v44 = v8;
      __int16 v45 = 2112;
      uint64_t v46 = v41;
      uint64_t v9 = "ProxySession <%{public}@> error removing file at location of downloads directory: %@";
    }
    else
    {
      if (!v7) {
        goto LABEL_19;
      }
      uint64_t v30 = *(void *)(a1 + 128);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v44 = v30;
      __int16 v45 = 2112;
      uint64_t v46 = v41;
      uint64_t v9 = "BackgroundSession <%{public}@> error removing file at location of downloads directory: %@";
    }
    _os_log_error_impl(&dword_184085000, v6, OS_LOG_TYPE_ERROR, v9, buf, 0x16u);
  }
  else if (v3)
  {
    return v2;
  }
LABEL_19:
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v41) & 1) == 0)
  {
    int v12 = [*(id *)(a1 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v13 = CFNLog::logger;
    BOOL v14 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v14)
      {
        uint64_t v15 = *(void *)(a1 + 128);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v44 = v15;
        __int16 v45 = 2112;
        uint64_t v46 = v41;
        uint64_t v16 = "ProxySession <%{public}@> error creating background downloads directory: %@";
LABEL_27:
        _os_log_error_impl(&dword_184085000, v13, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);
      }
    }
    else if (v14)
    {
      uint64_t v17 = *(void *)(a1 + 128);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v44 = v17;
      __int16 v45 = 2112;
      uint64_t v46 = v41;
      uint64_t v16 = "BackgroundSession <%{public}@> error creating background downloads directory: %@";
      goto LABEL_27;
    }
  }
  return v2;
}

- (id)AVAssetDownloadTaskForURLAsset:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__5091;
  int v12 = __Block_byref_object_dispose__5092;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82____NSURLBackgroundSession_AVAssetDownloadTaskForURLAsset_destinationURL_options___block_invoke;
  v7[3] = &unk_1E5254118;
  void v7[7] = a5;
  v7[8] = &v8;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)self, (uint64_t)v7);
  int v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)_AVAssetDownloadTaskForURL:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__5091;
  int v12 = __Block_byref_object_dispose__5092;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78____NSURLBackgroundSession__AVAssetDownloadTaskForURL_destinationURL_options___block_invoke;
  v7[3] = &unk_1E5254118;
  void v7[7] = a5;
  v7[8] = &v8;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)self, (uint64_t)v7);
  int v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)webSocketTaskForURL:(id)a3 protocols:(id)a4
{
}

- (id)webSocketTaskForRequest:(id)a3
{
}

- (id)_onqueue_dummyTaskForClass:(void *)a1 withRequest:(Class)a2 error:(void *)a3
{
  id v5 = [a2 alloc];
  uint64_t v6 = a1[20];
  a1[20] = v6 + 1;
  BOOL v7 = objc_msgSend(v5, "initWithOriginalRequest:ident:taskGroup:", 0, v6, objc_msgSend(a1, "defaultTaskGroup"));
  uint64_t v9 = v7;
  if (v7) {
    objc_setProperty_atomic(v7, v8, a3, 776);
  }

  return v9;
}

- (void)moveFileForResumeData:(void *)a3 fromDirectory:(void *)a4 toDirectory:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = copyDecodedResumeData(a2);
  uint64_t v8 = [v7 objectForKeyedSubscript:@"NSURLSessionResumeInfoTempFileName"];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = [a3 stringByAppendingPathComponent:v8];
    uint64_t v11 = [a4 stringByAppendingPathComponent:v9];
    uint64_t v19 = 0;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "moveItemAtPath:toPath:error:", v10, v11, &v19) & 1) == 0)
    {
      if (a1) {
        int v12 = *(void **)(a1 + 112);
      }
      else {
        int v12 = 0;
      }
      int v13 = [v12 _isProxySession];
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      BOOL v14 = CFNLog::logger;
      BOOL v15 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG);
      if (v13)
      {
        if (v15)
        {
          if (a1) {
            uint64_t v16 = *(void *)(a1 + 128);
          }
          else {
            uint64_t v16 = 0;
          }
          *(_DWORD *)long long buf = 138543618;
          uint64_t v21 = v16;
          __int16 v22 = 2112;
          uint64_t v23 = v19;
          uint64_t v17 = "ProxySession <%{public}@> error moving resume file: %@";
LABEL_17:
          _os_log_debug_impl(&dword_184085000, v14, OS_LOG_TYPE_DEBUG, v17, buf, 0x16u);
        }
      }
      else if (v15)
      {
        if (a1) {
          uint64_t v18 = *(void *)(a1 + 128);
        }
        else {
          uint64_t v18 = 0;
        }
        *(_DWORD *)long long buf = 138543618;
        uint64_t v21 = v18;
        __int16 v22 = 2112;
        uint64_t v23 = v19;
        uint64_t v17 = "BackgroundSession <%{public}@> error moving resume file: %@";
        goto LABEL_17;
      }
    }
  }
}

- (void)_useTLSSessionCacheFromSession:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)__NSURLBackgroundSession;
  [(NSURLSession *)&v6 _useTLSSessionCacheFromSession:a3];
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59____NSURLBackgroundSession__useTLSSessionCacheFromSession___block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  [(NSXPCConnection *)self->_xpcConn invalidate];

  v3.receiver = self;
  v3.super_class = (Class)__NSURLBackgroundSession;
  [(NSURLSession *)&v3 dealloc];
}

- (void)appWasLaunchedForBackgroundSession:(id)a3
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63____NSURLBackgroundSession_appWasLaunchedForBackgroundSession___block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)wentToBackground:(id)a3
{
  if (self) {
    workQueue = self->super._workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45____NSURLBackgroundSession_wentToBackground___block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)moveFileToTempForBackgroundResumeData:(uint64_t)a1
{
  if (a1)
  {
    if (![*(id *)(a1 + 112) _directoryForDownloadedFiles])
    {
      BOOL v4 = -[__NSURLBackgroundSession backgroundDownloadsDirectory](a1);
      if (v4)
      {
        id v5 = (void *)[v4 path];
        objc_super v6 = NSTemporaryDirectory();
        -[__NSURLBackgroundSession moveFileForResumeData:fromDirectory:toDirectory:](a1, a2, v5, v6);
      }
    }
  }
}

@end