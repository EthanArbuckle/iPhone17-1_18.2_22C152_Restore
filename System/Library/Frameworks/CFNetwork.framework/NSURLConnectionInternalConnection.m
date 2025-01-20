@interface NSURLConnectionInternalConnection
- (NSURLConnectionInternalConnection)initWithInfo:(const InternalInit *)a3;
- (id)_timingData;
- (uint64_t)_retainCFURLConnection;
- (void)_invalidate;
- (void)_resumeLoading;
- (void)_setDelegateQueue:(id)a3;
- (void)_setShouldSkipCancelOnRelease:(BOOL)a3;
- (void)_suspendLoading;
- (void)cancel;
- (void)cancelAuthenticationChallenge:(id)a3;
- (void)cleanupChallenges;
- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3;
- (void)dealloc;
- (void)invokeForDelegate:(id)a3;
- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3;
- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)sendCFChallenge:(uint64_t)a3 toSelector:;
- (void)start;
- (void)unscheduleFromRunLoop:(id)a3 forMode:(id)a4;
- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4;
@end

@implementation NSURLConnectionInternalConnection

- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3
{
  uint64_t v5 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v5)
  {
    v6 = (const void *)v5;
    if (self->_currCFChallenge == a3)
    {
      CFURLConnectionRejectChallenge(v5, (uint64_t)self->_cfConn);
      -[NSURLConnectionInternalConnection cleanupChallenges]((uint64_t)self);
    }
    CFRelease(v6);
  }
}

- (uint64_t)_retainCFURLConnection
{
  if (!a1) {
    return 0;
  }
  _os_nospin_lock_lock();
  uint64_t v2 = *(void *)(a1 + 72);
  if (v2) {
    CFRetain(*(CFTypeRef *)(a1 + 72));
  }
  _os_nospin_lock_unlock();
  return v2;
}

- (void)cleanupChallenges
{
  if (a1)
  {

    *(void *)(a1 + 88) = 0;
    *(void *)(a1 + 80) = 0;
  }
}

- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3
{
  uint64_t v5 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v5)
  {
    v6 = (const void *)v5;
    if (self->_currCFChallenge == a3)
    {
      CFURLConnectionPerformDefaultHandlingForChallenge(v5, (uint64_t)self->_cfConn);
      -[NSURLConnectionInternalConnection cleanupChallenges]((uint64_t)self);
    }
    CFRelease(v6);
  }
}

- (void)cancelAuthenticationChallenge:(id)a3
{
  uint64_t v4 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v4)
  {
    uint64_t v5 = (const void *)v4;
    if (objc_opt_respondsToSelector())
    {
      id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v7 = (id)objc_msgSend(v6, "_web_initWithDomain_nowarn:code:URL:", *MEMORY[0x1E4F289A0], -1012, self->super._url);
      id v8 = v7;
      if (self->super._delegateQueue)
      {
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __67__NSURLConnectionInternalConnection_cancelAuthenticationChallenge___block_invoke_2;
        block[3] = &unk_1E5257FB0;
        block[4] = self;
        block[5] = v8;
        dispatch_async(global_queue, block);
      }
      else
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __67__NSURLConnectionInternalConnection_cancelAuthenticationChallenge___block_invoke;
        v12[3] = &unk_1E5258408;
        v12[4] = v7;
        v10 = (void *)MEMORY[0x18531D6D0]();
        -[NSURLConnectionInternal _withConnectionAndDelegate:onlyActive:]((uint64_t)self, (uint64_t)v12, 0);
      }
    }
    -[NSURLConnectionInternalConnection cleanupChallenges]((uint64_t)self);
    self->super._connectionActive = 0;
    CFURLConnectionCancel((uint64_t)v5);
    CFRelease(v5);
  }
}

uint64_t __67__NSURLConnectionInternalConnection_cancelAuthenticationChallenge___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 connection:a2 didFailWithError:*(void *)(a1 + 32)];
}

void __67__NSURLConnectionInternalConnection_cancelAuthenticationChallenge___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __67__NSURLConnectionInternalConnection_cancelAuthenticationChallenge___block_invoke_3;
  v2[3] = &unk_1E5258408;
  uint64_t v1 = *(void *)(a1 + 32);
  v2[4] = *(void *)(a1 + 40);
  -[NSURLConnectionInternal _withConnectionAndDelegate:](v1, (uint64_t)v2);
}

uint64_t __67__NSURLConnectionInternalConnection_cancelAuthenticationChallenge___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 connection:a2 didFailWithError:*(void *)(a1 + 32)];
}

- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3
{
  uint64_t v5 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v5)
  {
    id v6 = (const void *)v5;
    if (self->_currCFChallenge == a3)
    {
      CFURLConnectionUseCredential(v5, 0, (uint64_t)self->_cfConn);
      -[NSURLConnectionInternalConnection cleanupChallenges]((uint64_t)self);
    }
    CFRelease(v6);
  }
}

- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4
{
  uint64_t v7 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v7)
  {
    id v8 = (const void *)v7;
    if (self->_currCFChallenge == a4)
    {
      CFURLConnectionUseCredential(v7, [a3 _cfurlcredential], (uint64_t)self->_cfConn);
      -[NSURLConnectionInternalConnection cleanupChallenges]((uint64_t)self);
    }
    CFRelease(v8);
  }
}

- (void)_setShouldSkipCancelOnRelease:(BOOL)a3
{
  LOBYTE(self->_fileName) = a3;
}

- (void)_resumeLoading
{
  uint64_t v2 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v2)
  {
    v3 = (const void *)v2;
    CFURLConnectionResume(v2);
    CFRelease(v3);
  }
}

- (void)_suspendLoading
{
  uint64_t v2 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v2)
  {
    v3 = (const void *)v2;
    CFURLConnectionHalt(v2);
    CFRelease(v3);
  }
}

- (void)unscheduleFromRunLoop:(id)a3 forMode:(id)a4
{
  uint64_t v6 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v6)
  {
    uint64_t v7 = (const void *)v6;
    CFURLConnectionUnscheduleFromRunLoop(v6, [a3 getCFRunLoop], (uint64_t)a4);
    CFRelease(v7);
  }
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  uint64_t v7 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v7)
  {
    id v8 = (const void *)v7;
    CFURLConnectionScheduleWithRunLoop(v7, [a3 getCFRunLoop], (uint64_t)a4);
    if (self) {
      self->super._connectionActive = 1;
    }
    CFRelease(v8);
  }
}

- (void)cancel
{
  if (self) {
    self->super._connectionActive = 0;
  }
  uint64_t v2 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v2)
  {
    v3 = (const void *)v2;
    CFURLConnectionCancel(v2);
    CFRelease(v3);
  }
}

- (void)start
{
  uint64_t v3 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v3)
  {
    uint64_t v4 = (const void *)v3;
    if (self) {
      self->super._connectionActive = 1;
    }
    CFURLConnectionStart(v3);
    CFRelease(v4);
  }
}

- (void)invokeForDelegate:(id)a3
{
  if (self->super._delegateQueue)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B48] blockOperationWithBlock:a3];
    [(NSOperationQueue *)self->super._delegateQueue addOperation:v4];
    [v4 waitUntilFinished];
  }
  else
  {
    uint64_t v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
}

- (void)_invalidate
{
  uint64_t v3 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v3)
  {
    uint64_t v4 = (const void *)v3;
    if (!LOBYTE(self->_fileName))
    {
      self->super._connectionActive = 0;
      CFURLConnectionCancel(v3);
    }
    CFRelease(v4);
  }
  currNSChallenge = self->_currNSChallenge;
  if (currNSChallenge)
  {
    CFRelease(currNSChallenge);
    self->_currNSChallenge = 0;
  }

  self->_currCFChallenge = 0;
  self->_cfConn = 0;
  _os_nospin_lock_lock();
  uint64_t v6 = *(void **)&self->_cfConnLock;
  if (v6)
  {

    *(void *)&self->_cfConnLock = 0;
  }
  _os_nospin_lock_unlock();
  v7.receiver = self;
  v7.super_class = (Class)NSURLConnectionInternalConnection;
  [(NSURLConnectionInternal *)&v7 _invalidate];
}

- (void)_setDelegateQueue:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    if (a3)
    {
      if (objc_msgSend(-[NSDictionary objectForKey:](self->super._connectionProperties, "objectForKey:", @"kCFURLConnectionSocketStreamProperties"), "objectForKey:", @"_WebKitSynchronousRequest"))
      {
        objc_super v7 = dispatch_queue_create("NSURLConnection-WebKitSync", 0);
        CFURLConnectionSetDelegateDispatchQueue((uint64_t)v6, (uint64_t)v7);
        if (v7) {
          dispatch_release(v7);
        }
        goto LABEL_13;
      }
      pthread_mutex_lock(&-[NSURLConnectionInternalConnection _setDelegateQueue:]::sLock);
      unsigned int v9 = -[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueueSlot;
      if (-[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueueSlot >= 0x1E)
      {
        unsigned int v9 = 0;
        -[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueueSlot = 0;
      }
      dispatch_queue_t v10 = (dispatch_queue_t)-[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueues[v9];
      if (!v10)
      {
        snprintf(__str, 0x100uLL, "NSURLConnection-%d", v9);
        dispatch_queue_t v10 = dispatch_queue_create(__str, 0);
        unsigned int v9 = -[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueueSlot;
        -[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueues[-[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueueSlot] = v10;
      }
      -[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueueSlot = v9 + 1;
      pthread_mutex_unlock(&-[NSURLConnectionInternalConnection _setDelegateQueue:]::sLock);
      uint64_t v5 = (uint64_t)v6;
      uint64_t v8 = (uint64_t)v10;
    }
    else
    {
      uint64_t v8 = 0;
    }
    CFURLConnectionSetDelegateDispatchQueue(v5, v8);
LABEL_13:
    v11.receiver = self;
    v11.super_class = (Class)NSURLConnectionInternalConnection;
    [(NSURLConnectionInternal *)&v11 _setDelegateQueue:a3];
    CFRelease(v6);
  }
}

- (void)dealloc
{
  if (self)
  {
    _os_nospin_lock_lock();
    uint64_t v3 = *(void *)&self->_cfConnLock;
    _os_nospin_lock_unlock();
    if (v3)
    {
      NSLog(&cfstr_ShouldVeBeenIn.isa);
      [(NSURLConnectionInternalConnection *)self _invalidate];
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NSURLConnectionInternalConnection;
  [(NSURLConnectionInternal *)&v4 dealloc];
}

- (id)_timingData
{
  id result = (id)-[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (result)
  {
    id v3 = result;
    objc_super v4 = _CFURLConnectionCopyTimingData(result);
    CFTypeRef v5 = (id)CFMakeCollectable(v4);
    CFRelease(v3);
    return (id)v5;
  }
  return result;
}

- (NSURLConnectionInternalConnection)initWithInfo:(const InternalInit *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)NSURLConnectionInternalConnection;
  id v4 = -[NSURLConnectionInternal initWithInfo:](&v27, sel_initWithInfo_);
  if (!v4) {
    return (NSURLConnectionInternalConnection *)v4;
  }
  CFRequest = createCFRequest(a3);
  if (!CFRequest)
  {

    return 0;
  }
  uint64_t v6 = CFRequest;
  uint64_t v7 = 0;
  v31 = sel_connection_willSendRequest_redirectResponse_;
  v32 = sel_connection_willSendRequestForEstablishedConnection_properties_;
  v33 = sel_connectionWaiting_;
  v34 = sel_connection_didReceiveResponse_;
  v35 = sel_connection_didWriteData_totalBytesWritten_expectedTotalBytes_;
  v36 = sel_connection_didReceiveData_lengthReceived_;
  v37 = sel_connection_didReceiveData_;
  v38 = sel_connectionDidFinishLoading_;
  v39 = sel_connection_didFailWithError_;
  v40 = sel_connection_willCacheResponse_;
  v41 = sel_connection_didReceiveAuthenticationChallenge_;
  v42 = sel_connection_didSendBodyData_totalBytesWritten_totalBytesExpectedToWrite_;
  v43 = sel_connectionShouldUseCredentialStorage_;
  v44 = sel_connection_needNewBodyStream_;
  v45 = sel_connection_conditionalRequirementsChanged_;
  v46 = sel_connection_canAuthenticateAgainstProtectionSpace_;
  v47 = sel_connection_willSendRequestForAuthenticationChallenge_;
  v48 = sel_connection_didReceiveDataArray_;
  v49 = sel_connectionDidResumeDownloading_totalBytesWritten_expectedTotalBytes_;
  v50 = sel_connectionDidFinishDownloading_destinationURL_;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  int v30 = 0;
  do
    *((unsigned char *)&v28 + v7++) = objc_opt_respondsToSelector() & 1;
  while (v7 != 20);
  v26 = 0;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  v16[0] = 9;
  v16[1] = v4;
  v16[2] = 0;
  v16[3] = _NSURLConnectionReleaseClient;
  v16[4] = MEMORY[0x1E4F1C220];
  if ((_BYTE)v28) {
    *(void *)&long long v17 = _NSURLConnectionWillSendRequest;
  }
  if (BYTE1(v28)) {
    *(void *)&long long v25 = _NSURLConnectionWillSendRequestForEstablishedConnection;
  }
  if (BYTE2(v28)) {
    v26 = _NSURLConnectionConnectionWaiting;
  }
  if (BYTE6(v29)) {
    *((void *)&v25 + 1) = _NSURLConnectionConditionalRequirementsChanged;
  }
  if (HIBYTE(v30))
  {
    uint64_t v8 = _NSURLConnectionDidReceiveResponse_Download;
    if (!BYTE3(v28)) {
      uint64_t v8 = _NSURLConnectionDidReceiveResponse_Download_NoDelegate;
    }
    *((void *)&v17 + 1) = v8;
    unsigned int v9 = _NSURLConnectionDidFinishLoading_Download;
    if (BYTE4(v28))
    {
      *(void *)&long long v18 = _NSURLConnectionDidReceiveData_Download;
      unsigned int v9 = _NSURLConnectionDidFinishLoading_Download;
    }
    goto LABEL_29;
  }
  dispatch_queue_t v10 = _NSURLConnectionDidReceiveResponse;
  if (!BYTE3(v28)) {
    dispatch_queue_t v10 = (void (*)(_CFURLConnection *, _CFURLResponse *, uint64_t))_NSURLConnectionDidReceiveResponse_noSelector;
  }
  *((void *)&v17 + 1) = v10;
  if (BYTE1(v30))
  {
    *((void *)&v23 + 1) = _NSURLConnectionDidReceiveDataArray;
    goto LABEL_28;
  }
  if (BYTE5(v28))
  {
    objc_super v11 = _NSURLConnectionDidReceiveData_LengthReceived;
  }
  else
  {
    if (!BYTE6(v28)) {
      goto LABEL_28;
    }
    objc_super v11 = _NSURLConnectionDidReceiveData;
  }
  *(void *)&long long v18 = v11;
LABEL_28:
  unsigned int v9 = _NSURLConnectionDidFinishLoading;
  if (HIBYTE(v28)) {
LABEL_29:
  }
    *(void *)&long long v19 = v9;
  if ((_BYTE)v29) {
    *((void *)&v19 + 1) = _NSURLConnectionDidFail;
  }
  v12 = (const _CFCachedURLResponse *(*)(_CFURLConnection *, const _CFCachedURLResponse *, uint64_t))_NSURLConnectionWillCacheResponse_noCache;
  if (!a3->var4 || (v12 = _NSURLConnectionWillCacheResponse, BYTE1(v29))) {
    *(void *)&long long v20 = v12;
  }
  if (BYTE3(v29)) {
    *(void *)&long long v21 = _NSURLConnectionDidSendBodyData;
  }
  uint64_t v13 = _NSURLConnectionDidReceiveAuthenticationChallenge;
  if (!BYTE2(v29)) {
    uint64_t v13 = _NSURLConnectionDidReceiveAuthenticationChallenge_noSelector;
  }
  *((void *)&v20 + 1) = v13;
  if (BYTE4(v29)) {
    *((void *)&v21 + 1) = _NSURLConnectionShouldUseCredentialStorage;
  }
  if (HIBYTE(v29)) {
    *((void *)&v22 + 1) = _NSURLConnectionCanRespondToProtectionSpace;
  }
  if (BYTE5(v29)) {
    *(void *)&long long v22 = _NSURLConnectionNeedNewBodyStream;
  }
  if ((_BYTE)v30) {
    *(void *)&long long v23 = _NSURLConnectionWillSendRequestForAuthenticationChallenge;
  }
  v14 = CFURLConnectionCreateWithProperties(0, v6, v16, *((const __CFDictionary **)v4 + 7));
  *((void *)v4 + 9) = v14;
  CFMakeCollectable(v14);
  CFRelease(v6);
  return (NSURLConnectionInternalConnection *)v4;
}

- (void)sendCFChallenge:(uint64_t)a3 toSelector:
{
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __74__NSURLConnectionInternalConnection_Internal__sendCFChallenge_toSelector___block_invoke;
    v5[3] = &unk_1E5257678;
    v5[4] = a1;
    v5[5] = a2;
    v5[6] = a3;
    id v4 = (void *)MEMORY[0x18531D6D0]();
    -[NSURLConnectionInternal _withConnectionAndDelegate:onlyActive:](a1, (uint64_t)v5, 1);
  }
}

uint64_t __74__NSURLConnectionInternalConnection_Internal__sendCFChallenge_toSelector___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  CFRetain(*(CFTypeRef *)(a1 + 40));
  *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(a1 + 40);
  CFMakeCollectable(*(CFTypeRef *)(a1 + 40));
  *(void *)(*(void *)(a1 + 32) + 88) = +[NSURLAuthenticationChallenge _authenticationChallengeForCFAuthChallenge:*(void *)(a1 + 40) sender:a2];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 88);

  return [a3 performSelector:v6 withObject:a2 withObject:v7];
}

@end