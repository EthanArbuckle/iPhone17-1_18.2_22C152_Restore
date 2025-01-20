@interface __NSCFBackgroundSessionTask
- (__NSCFBackgroundSessionTask)initWithBackgroundTask:(id)a3;
- (__NSCFBackgroundSessionTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5;
- (__NSCFBackgroundSessionTask)initWithTaskInfo:(id)a3 taskGroup:(id)a4 ident:(unint64_t)a5;
- (id)_timingData;
- (id)cookiesForCurrentRequest;
- (id)requestWithCookiesApplied:(id)a3;
- (uint64_t)cookiesForRequest:(void *)a1;
- (void)_onSessionQueue_disavow;
- (void)_onqueue_adjustBytesPerSecondLimit:(int64_t)a3;
- (void)_onqueue_adjustLoadingPoolPriority;
- (void)_onqueue_adjustPoolPriority;
- (void)_onqueue_cancel;
- (void)_onqueue_connectionWaitingWithReason:(void *)a1;
- (void)_onqueue_didFinishWithError:(id)a3;
- (void)_onqueue_didReceiveInformationalResponse:(id)a3;
- (void)_onqueue_didReceiveResponse:(id)a3;
- (void)_onqueue_resume;
- (void)_onqueue_suspend;
- (void)_onqueue_willSendRequestForEstablishedConnection:(id)a3 withCompletion:(id)a4;
- (void)addSecKeyProxy:(id)a3;
- (void)dealloc;
- (void)removeSecKeyProxy:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTaskDescription:(id)a3;
- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3;
- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3;
- (void)set_discretionaryOverride:(int64_t)a3;
@end

@implementation __NSCFBackgroundSessionTask

- (void)_onSessionQueue_disavow
{
  v3 = [(NSURLSessionTask *)self session];
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](self, "taskIdentifier"));
    cntrl = v4[1]._nwContext.__cntrl_;
    [(__shared_weak_count *)cntrl removeObjectForKey:v5];
  }
}

- (void)_onqueue_didFinishWithError:(id)a3
{
  if (!self->_sentDidFinish)
  {
    self->_sentDidFinish = 1;
    [(NSURLSessionTask *)self setError:a3];
    [(NSURLSessionTask *)self setState:3];
    v4 = [(NSURLSessionTask *)self session];
    uint64_t v5 = [(NSURLSessionTask *)self error];
    -[NSURLSession _onqueue_didCompleteTask:withError:]((uint64_t)v4, self, v5);
  }
}

- (__NSCFBackgroundSessionTask)initWithTaskInfo:(id)a3 taskGroup:(id)a4 ident:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)__NSCFBackgroundSessionTask;
  v6 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:](&v11, sel_initWithOriginalRequest_ident_taskGroup_, [a3 originalRequest], a5, a4);
  if (v6)
  {
    -[NSURLSessionTask updateCurrentRequest:](v6, "updateCurrentRequest:", [a3 currentRequest]);
    -[NSURLSessionTask setResponse:](v6, "setResponse:", [a3 response]);
    -[NSURLSessionTask setEarliestBeginDate:](v6, "setEarliestBeginDate:", [a3 earliestBeginDate]);
    -[NSURLSessionTask setCountOfBytesClientExpectsToSend:](v6, "setCountOfBytesClientExpectsToSend:", [a3 countOfBytesClientExpectsToSend]);
    -[NSURLSessionTask setCountOfBytesClientExpectsToReceive:](v6, "setCountOfBytesClientExpectsToReceive:", [a3 countOfBytesClientExpectsToReceive]);
    -[NSURLSessionTask setCountOfBytesReceived:](v6, "setCountOfBytesReceived:", [a3 countOfBytesReceived]);
    -[NSURLSessionTask setCountOfBytesSent:](v6, "setCountOfBytesSent:", [a3 countOfBytesSent]);
    -[NSURLSessionTask setCountOfBytesExpectedToSend:](v6, "setCountOfBytesExpectedToSend:", [a3 countOfBytesExpectedToSend]);
    -[NSURLSessionTask setCountOfBytesExpectedToReceive:](v6, "setCountOfBytesExpectedToReceive:", [a3 countOfBytesExpectedToReceive]);
    -[NSURLSessionTask setState:](v6, "setState:", [a3 state]);
    -[NSURLSessionTask setError:](v6, "setError:", [a3 error]);
    -[__NSCFBackgroundSessionTask setTaskDescription:](v6, "setTaskDescription:", [a3 taskDescription]);
    -[NSURLSessionTask set_uniqueIdentifier:](v6, "set_uniqueIdentifier:", [a3 uniqueIdentifier]);
    -[NSURLSessionTask set_metrics:](v6, "set_metrics:", [a3 taskMetrics]);
    v7 = (void *)[a3 taskMetrics];
    if (v7) {
      id Property = objc_getProperty(v7, v8, 96, 1);
    }
    else {
      id Property = 0;
    }
    [(NSURLSessionTask *)v6 set_backgroundTransactionMetrics:Property];
    -[NSURLSessionTask set_trailers:](v6, "set_trailers:", [a3 _backgroundTrailers]);
    [(NSURLSessionTask *)v6 set_extractor:0];
    -[NSURLSessionTask set_doesSZExtractorConsumeExtractedData:](v6, "set_doesSZExtractorConsumeExtractedData:", [a3 _doesSZExtractorConsumeExtractedData]);
    -[NSURLSessionTask set_hasSZExtractor:](v6, "set_hasSZExtractor:", [a3 _hasSZExtractor]);
  }
  return v6;
}

- (void)setTaskDescription:(id)a3
{
  if ([(NSURLSessionTask *)self session])
  {
    uint64_t v5 = [(NSURLSessionTask *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50____NSCFBackgroundSessionTask_setTaskDescription___block_invoke;
    block[3] = &unk_1E5257FB0;
    block[4] = self;
    block[5] = a3;
    dispatch_async((dispatch_queue_t)v5, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundSessionTask;
  [(NSURLSessionTask *)&v6 setTaskDescription:a3];
}

- (uint64_t)cookiesForRequest:(void *)a1
{
  v19[3] = *MEMORY[0x1E4F143B8];
  if (!a1
    || ![a2 URL]
    || [a2 valueForHTTPHeaderField:0x1EC0A2188]
    || !objc_msgSend((id)objc_msgSend(a1, "_effectiveConfiguration"), "HTTPCookieStorage")
    || !objc_msgSend((id)objc_msgSend(a1, "_effectiveConfiguration"), "HTTPShouldSetCookies")
    || ![a2 HTTPShouldHandleCookies])
  {
    return 0;
  }
  if ([a1 _siteForCookies])
  {
    v18[0] = @"_kCFHTTPCookiePolicyPropertySiteForCookies";
    v19[0] = [a1 _siteForCookies];
    v18[1] = @"_kCFHTTPCookiePolicyPropertyIsTopLevelNavigation";
    v19[1] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_isTopLevelNavigation"));
    v18[2] = @"_kCFHTTPCookiePolicyPropertyIsSafeRequest";
    v19[2] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a2, "_isIdempotent"));
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__7856;
  v16 = __Block_byref_object_dispose__7857;
  uint64_t v17 = 0;
  v7 = objc_msgSend((id)objc_msgSend(a1, "_effectiveConfiguration"), "HTTPCookieStorage");
  uint64_t v8 = [a2 URL];
  uint64_t v9 = [a2 mainDocumentURL];
  uint64_t v10 = [a1 _storagePartitionIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49____NSCFBackgroundSessionTask_cookiesForRequest___block_invoke;
  v11[3] = &unk_1E52583B8;
  v11[4] = &v12;
  [v7 _getCookiesForURL:v8 mainDocumentURL:v9 partition:v10 policyProperties:v6 completionHandler:v11];
  uint64_t v4 = [(id)v13[5] objectForKeyedSubscript:0x1EC0A2188];
  _Block_object_dispose(&v12, 8);
  return v4;
}

- (void)_onqueue_resume
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (self->_immediateError)
  {
    -[__NSCFBackgroundSessionTask _onqueue_didFinishWithError:](self, "_onqueue_didFinishWithError:");
  }
  else
  {
    v3 = (void *)-[__NSURLBackgroundSession ensureRemoteSession]((uint64_t)[(NSURLSessionTask *)self session]);
    NSUInteger v4 = [(NSURLSessionTask *)self taskIdentifier];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([(NSURLSessionTask *)self _authenticatorConfiguredViaTaskProperty]
      && [(NSURLSessionTaskHTTPAuthenticator *)[(NSURLSessionTask *)self authenticator] statusCodes])
    {
      objc_msgSend(v5, "setObject:forKey:", -[NSURLSessionTaskHTTPAuthenticator statusCodes](-[NSURLSessionTask authenticator](self, "authenticator"), "statusCodes"), @"StatusCodes");
    }
    if ([(NSURLSessionTask *)self _publishingURL]) {
      objc_msgSend(v5, "setObject:forKey:", -[NSURLSessionTask _publishingURL](self, "_publishingURL"), @"PublishingURL");
    }
    if ([(NSURLSessionTask *)self earliestBeginDate]) {
      objc_msgSend(v5, "setObject:forKey:", -[NSURLSessionTask earliestBeginDate](self, "earliestBeginDate"), @"EarliestBeginDate");
    }
    if ([(NSURLSessionTask *)self countOfBytesClientExpectsToSend] != -1) {
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", -[NSURLSessionTask countOfBytesClientExpectsToSend](self, "countOfBytesClientExpectsToSend")), @"CountOfBytesClientExpectsToSend");
    }
    if ([(NSURLSessionTask *)self countOfBytesClientExpectsToReceive] != -1) {
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", -[NSURLSessionTask countOfBytesClientExpectsToReceive](self, "countOfBytesClientExpectsToReceive")), @"CountOfBytesClientExpectsToReceive");
    }
    if ([(NSURLSessionTask *)self _extractor])
    {
      uint64_t v6 = [(NSURLSessionTask *)self _extractor];
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0), @"SZExtractor");
      objc_msgSend(v5, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[NSURLSessionTask _hasSZExtractor](self, "_hasSZExtractor")), @"HasSZExtractor");
      objc_msgSend(v5, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[NSURLSessionTask _doesSZExtractorConsumeExtractedData](self, "_doesSZExtractorConsumeExtractedData")), @"DoesSZExtractorConsumeExtractedData");
    }
    if ([(NSURLSessionTask *)self _pathToDownloadTaskFile]) {
      objc_msgSend(v5, "setObject:forKey:", -[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile"), @"pathToDownloadTaskFile");
    }
    [(NSURLSessionTask *)self _timeoutIntervalForResource];
    if (v7 != 0.0)
    {
      uint64_t v8 = NSNumber;
      [(NSURLSessionTask *)self _timeoutIntervalForResource];
      objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v8, "numberWithDouble:"), @"TimeoutIntervalForResource");
    }
    if ([(NSURLSessionTask *)self _private_nw_activity])
    {
      v11[0] = 0;
      v11[1] = 0;
      [(NSURLSessionTask *)self _private_nw_activity];
      nw_activity_get_token();
      objc_msgSend(v5, "setObject:forKey:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", v11), @"nw_activityUUID");
    }
    if (![(NSURLSessionTask *)self _isAVAssetTask] && (objc_opt_respondsToSelector() & 1) != 0) {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", -[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration"), @"effectiveConfig");
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", -[NSURLSessionTask _sourceApplicationBundleIdentifierForMobileAsset](self, "_sourceApplicationBundleIdentifierForMobileAsset"), @"sourceApplicationBundleIdentifierForMobileAsset");
    if ([(NSURLSessionTask *)self _preconnect]) {
      [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"preconnect"];
    }
    id v9 = [(__NSCFBackgroundSessionTask *)self cookiesForCurrentRequest];
    if (v9) {
      [v5 setObject:v9 forKeyedSubscript:@"cookies"];
    }
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v5];
    [v3 resumeTaskWithIdentifier:v4 withProperties:v10];
  }
}

- (id)cookiesForCurrentRequest
{
  v3 = [(NSURLSessionTask *)self currentRequest];

  return (id)-[__NSCFBackgroundSessionTask cookiesForRequest:](self, v3);
}

- (__NSCFBackgroundSessionTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)__NSCFBackgroundSessionTask;
  id v5 = [(NSURLSessionTask *)&v8 initWithOriginalRequest:a3 ident:a4 taskGroup:a5];
  uint64_t v6 = v5;
  if (v5) {
    [(NSURLSessionTask *)v5 setState:1];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self) {
    objc_setProperty_atomic(self, a2, 0, 776);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  secKeyProxies = self->_secKeyProxies;
  uint64_t v4 = [(NSMutableSet *)secKeyProxies countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(secKeyProxies);
        }
        objc_super v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v8 invalidate];
        [v8 setClientDisconnectionHandler:0];
      }
      uint64_t v5 = [(NSMutableSet *)secKeyProxies countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)__NSCFBackgroundSessionTask;
  [(NSURLSessionTask *)&v9 dealloc];
}

- (void)set_discretionaryOverride:(int64_t)a3
{
  if ([(NSURLSessionTask *)self session])
  {
    uint64_t v5 = [(NSURLSessionTask *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57____NSCFBackgroundSessionTask_set_discretionaryOverride___block_invoke;
    block[3] = &unk_1E5258250;
    block[4] = self;
    block[5] = a3;
    dispatch_async((dispatch_queue_t)v5, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundSessionTask;
  [(NSURLSessionTask *)&v6 set_discretionaryOverride:a3];
}

- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if ([(NSURLSessionTask *)self session])
  {
    uint64_t v5 = [(NSURLSessionTask *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70____NSCFBackgroundSessionTask_set_TLSMaximumSupportedProtocolVersion___block_invoke;
    block[3] = &unk_1E5258278;
    block[4] = self;
    __int16 v8 = v3;
    dispatch_async((dispatch_queue_t)v5, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundSessionTask;
  [(NSURLSessionTask *)&v6 set_TLSMaximumSupportedProtocolVersion:v3];
}

- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if ([(NSURLSessionTask *)self session])
  {
    uint64_t v5 = [(NSURLSessionTask *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70____NSCFBackgroundSessionTask_set_TLSMinimumSupportedProtocolVersion___block_invoke;
    block[3] = &unk_1E5258278;
    block[4] = self;
    __int16 v8 = v3;
    dispatch_async((dispatch_queue_t)v5, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundSessionTask;
  [(NSURLSessionTask *)&v6 set_TLSMinimumSupportedProtocolVersion:v3];
}

- (id)_timingData
{
  v2 = [(NSURLSessionTask *)self _backgroundTransactionMetrics];

  return -[__CFN_TransactionMetrics legacyStaticMetrics]((uint64_t)v2);
}

- (void)setDelegate:(id)a3
{
}

- (void)_onqueue_adjustBytesPerSecondLimit:(int64_t)a3
{
  uint64_t v5 = (void *)-[__NSURLBackgroundSession ensureRemoteSession]((uint64_t)[(NSURLSessionTask *)self session]);
  NSUInteger v6 = [(NSURLSessionTask *)self taskIdentifier];

  [v5 setBytesPerSecondLimit:a3 forTaskWithIdentifier:v6];
}

- (void)_onqueue_adjustLoadingPoolPriority
{
  uint64_t v3 = (void *)-[__NSURLBackgroundSession ensureRemoteSession]((uint64_t)[(NSURLSessionTask *)self session]);
  [(NSURLSessionTask *)self _loadingPriorityValue];
  double v5 = v4;
  NSUInteger v6 = [(NSURLSessionTask *)self taskIdentifier];

  [v3 setLoadingPoolPriority:v6 forTaskWithIdentifier:v5];
}

- (void)_onqueue_adjustPoolPriority
{
  uint64_t v3 = (void *)-[__NSURLBackgroundSession ensureRemoteSession]((uint64_t)[(NSURLSessionTask *)self session]);
  int64_t v4 = [(NSURLSessionTask *)self _priorityValue];
  NSUInteger v5 = [(NSURLSessionTask *)self taskIdentifier];

  [v3 setPriority:v4 forTaskWithIdentifier:v5];
}

- (void)_onqueue_cancel
{
  if ([(NSURLSessionTask *)self state] <= NSURLSessionTaskStateCanceling && !self->_sentCancel)
  {
    self->_sentCancel = 1;
    [(NSURLSessionTask *)self setState:2];
    uint64_t v3 = (void *)-[__NSURLBackgroundSession ensureRemoteSession]((uint64_t)[(NSURLSessionTask *)self session]);
    NSUInteger v4 = [(NSURLSessionTask *)self taskIdentifier];
    [v3 cancelTaskWithIdentifier:v4];
  }
}

- (void)_onqueue_suspend
{
  uint64_t v3 = (void *)-[__NSURLBackgroundSession ensureRemoteSession]((uint64_t)[(NSURLSessionTask *)self session]);
  NSUInteger v4 = [(NSURLSessionTask *)self taskIdentifier];

  [v3 suspendTaskWithIdentifier:v4];
}

- (void)_onqueue_didReceiveResponse:(id)a3
{
  -[NSURLSessionTask setResponse:](self, "setResponse:");
  if (![(NSURLSessionTask *)self countOfBytesExpectedToReceive])
  {
    uint64_t v5 = [a3 expectedContentLength];
    [(NSURLSessionTask *)self setCountOfBytesExpectedToReceive:v5];
  }
}

- (void)_onqueue_didReceiveInformationalResponse:(id)a3
{
  uint64_t v3 = (__NSCFBackgroundSessionTask **)self;
  if (self)
  {
    self = (__NSCFBackgroundSessionTask *)self->super._internalDelegateWrapper;
    if (!self) {
      self = v3[87];
    }
  }
  -[__NSCFURLSessionDelegateWrapper task:didReceiveInformationalResponse:]((uint64_t)self, v3, a3);
}

- (void)_onqueue_willSendRequestForEstablishedConnection:(id)a3 withCompletion:(id)a4
{
  NSUInteger v4 = (__NSCFBackgroundSessionTask **)self;
  if (self)
  {
    self = (__NSCFBackgroundSessionTask *)self->super._internalDelegateWrapper;
    if (!self) {
      self = v4[87];
    }
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95____NSCFBackgroundSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke;
  v5[3] = &unk_1E5254F60;
  v5[4] = a4;
  -[__NSCFURLSessionDelegateWrapper task:_willSendRequestForEstablishedConnection:completionHandler:]((uint64_t)self, v4, a3, v5);
}

- (void)removeSecKeyProxy:(id)a3
{
  p_proxyLock = &self->_proxyLock;
  os_unfair_lock_lock(&self->_proxyLock);
  [(NSMutableSet *)self->_secKeyProxies removeObject:a3];

  os_unfair_lock_unlock(p_proxyLock);
}

- (void)addSecKeyProxy:(id)a3
{
  p_proxyLock = &self->_proxyLock;
  os_unfair_lock_lock(&self->_proxyLock);
  secKeyProxies = self->_secKeyProxies;
  if (!secKeyProxies)
  {
    secKeyProxies = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    self->_secKeyProxies = secKeyProxies;
  }
  [(NSMutableSet *)secKeyProxies addObject:a3];

  os_unfair_lock_unlock(p_proxyLock);
}

- (id)requestWithCookiesApplied:(id)a3
{
  uint64_t v4 = -[__NSCFBackgroundSessionTask cookiesForRequest:](self, a3);
  if (!v4) {
    return a3;
  }
  uint64_t v5 = v4;
  NSUInteger v6 = (void *)[a3 mutableCopy];
  [v6 setValue:v5 forHTTPHeaderField:0x1EC0A2188];

  return v6;
}

- (__NSCFBackgroundSessionTask)initWithBackgroundTask:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundSessionTask;
  uint64_t v3 = [(NSURLSessionTask *)&v6 initWithTask:a3];
  uint64_t v4 = v3;
  if (v3) {
    [(NSURLSessionTask *)v3 setState:0];
  }
  return v4;
}

- (void)_onqueue_connectionWaitingWithReason:(void *)a1
{
  if (a1)
  {
    uint64_t v3 = a1[88];
    if (!v3) {
      uint64_t v3 = a1[87];
    }
    uint64_t v4 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"NSTCPConnectionConditionsUnmetReasonErrorDomain" code:a2 userInfo:0];
    -[__NSCFURLSessionDelegateWrapper task:_isWaitingForConnectionWithError:](v3, a1, v4);
  }
}

@end