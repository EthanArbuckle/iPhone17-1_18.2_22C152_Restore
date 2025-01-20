@interface __NSCFLocalSessionTask
- (BOOL)_needSendingMetrics;
- (_BYTE)_finishAllow;
- (__NSCFLocalSessionTask)initWithBackgroundTaskInfo:(id)a3 taskGroup:(id)a4;
- (__NSCFLocalSessionTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5;
- (__NSCFURLSessionConnection)cfConn;
- (id).cxx_construct;
- (id)_onqueue_strippedMutableRequest;
- (id)error:(id)a3 code:(int64_t)a4;
- (id)resourceTimeoutError;
- (uint64_t)_finishBecomeDownload:(uint64_t)result;
- (uint64_t)_finishBecomeStream:(void *)a3 forConnection:(uint64_t)a4 completionHandler:;
- (uint64_t)timeoutErrorWithStreamErrorCode:(void *)a1;
- (void)_didSendMetrics;
- (void)_onSessionQueue_disavow;
- (void)_onqueue_adjustBytesPerSecondLimit:(int64_t)a3;
- (void)_onqueue_adjustPoolPriority;
- (void)_onqueue_adjustPriorityHint:(float)a3 incremental:(BOOL)a4;
- (void)_onqueue_alternatePathAvailable:(int)a3;
- (void)_onqueue_cancel;
- (void)_onqueue_cancel_with_error:(id)a3;
- (void)_onqueue_completeInitialization;
- (void)_onqueue_conditionalRequirementsChanged:(BOOL)a3;
- (void)_onqueue_connectionWaitingWithReason:(int64_t)a3;
- (void)_onqueue_didFinishWithError:(id)a3;
- (void)_onqueue_didReceiveChallenge:(id)a3 request:(id)a4 withCompletion:(id)a5;
- (void)_onqueue_didReceiveDispatchData:(id)a3 completion:(id)a4;
- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4;
- (void)_onqueue_didReceiveResponse:(id)a3 redirectRequest:(id)a4 withCompletion:(id)a5;
- (void)_onqueue_didSendBodyBytes:(int64_t)a3 totalBytesSent:(int64_t)a4 totalBytesExpectedToSend:(int64_t)a5;
- (void)_onqueue_expectedProgressTargetChanged;
- (void)_onqueue_needNewBodyStream:(id)a3 fromOffset:(int64_t)a4 withCompletion:(id)a5;
- (void)_onqueue_needNewBodyStream:(id)a3 withCompletion:(id)a4;
- (void)_onqueue_resume;
- (void)_onqueue_setupNextEffectiveConfigurationWithCompletionHandler:(id)a3;
- (void)_onqueue_startResourceTimer:(uint64_t)a1;
- (void)_onqueue_startStartTimer;
- (void)_onqueue_startTimer:(int64_t)a3 withTimeoutInNanos:(int)a4 streamErrorCode:;
- (void)_onqueue_suspend;
- (void)_onqueue_willCacheResponse:(id)a3 withCompletion:(id)a4;
- (void)_onqueue_willSendRequestForEstablishedConnection:(id)a3 withCompletion:(id)a4;
- (void)_private_onqueue_didReceiveResponseDisposition:(int64_t)a3 completion:(id)a4;
- (void)_setConnectionCacheKey:(void *)a3;
- (void)_task_onqueue_didFinish;
- (void)_task_onqueue_didReceiveDispatchData:(id)a3 completionHandler:(id)a4;
- (void)cancel_with_error:(id)a3;
- (void)connection:(id)a3 _conditionalRequirementsChanged:(BOOL)a4;
- (void)connection:(id)a3 _willSendRequestForEstablishedConnection:(id)a4 completion:(id)a5;
- (void)connection:(id)a3 alternatePathAvailable:(int)a4;
- (void)connection:(id)a3 challenged:(id)a4 authCallback:(id)a5;
- (void)connection:(id)a3 didFinishLoadingWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4 completion:(id)a5;
- (void)connection:(id)a3 didReceiveInformationalResponse:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4 completion:(id)a5;
- (void)connection:(id)a3 didReceiveSocketInputStream:(id)a4 outputStream:(id)a5;
- (void)connection:(id)a3 didReceiveTCPConnection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5;
- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamCallback:(id)a5;
- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamFromOffset:(int64_t)a5 callback:(id)a6;
- (void)connection:(id)a3 sentBodyBytes:(id)a4 totalBytes:(id)a5 expectedBytes:(id)a6;
- (void)connection:(id)a3 waitingWithReason:(int64_t)a4;
- (void)connection:(id)a3 wasRedirected:(id)a4 newRequest:(id)a5 responseCallback:(id)a6;
- (void)connection:(id)a3 willCacheResponse:(id)a4 responseCallback:(id)a5;
- (void)connectionWillFinishLoading:(id)a3;
- (void)dealloc;
- (void)localSession;
- (void)setCfConn:(id)a3;
- (void)setConnection:(void *)a1;
- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3;
- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3;
- (void)set_timeoutIntervalForResource:(double)a3;
- (void)startResourceTimer;
@end

@implementation __NSCFLocalSessionTask

- (void)_onqueue_didReceiveDispatchData:(id)a3 completion:(id)a4
{
  if ([(NSURLSessionTask *)self state] < NSURLSessionTaskStateCanceling)
  {
    [(NSURLSessionTask *)self setCountOfBytesReceived:[(NSURLSessionTask *)self countOfBytesReceived]+ dispatch_data_get_size((dispatch_data_t)a3)];
    if (!self || !self->_pendingResponseDisposition)
    {
      [(__NSCFLocalSessionTask *)self _task_onqueue_didReceiveDispatchData:a3 completionHandler:a4];
      return;
    }
    pendingResponseBytes = self->_pendingResponseBytes;
    if (pendingResponseBytes)
    {
      self->_pendingResponseBytes = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)self->_pendingResponseBytes, (dispatch_data_t)a3);
      dispatch_release(pendingResponseBytes);
    }
    else
    {
      dispatch_retain((dispatch_object_t)a3);
      self->_pendingResponseBytes = (OS_dispatch_data *)a3;
    }
  }
  v8 = (void (*)(id))*((void *)a4 + 2);

  v8(a4);
}

- (void)_onqueue_resume
{
  if (self)
  {
    unint64_t v3 = self->_suspendCount - 1;
    self->_suspendCount = v3;
    if (!v3)
    {
      [(NSURLSessionTask *)self setState:0];
      if (objc_getProperty(self, v4, 808, 1))
      {
        [(__NSCFLocalSessionTask *)self _onqueue_completeInitialization];
      }
      else if ([(__NSCFLocalSessionTask *)self cfConn])
      {
        v5 = [(__NSCFLocalSessionTask *)self cfConn];
        [(__NSCFURLSessionConnection *)v5 resume];
      }
    }
  }
}

- (void)_onqueue_startResourceTimer:(uint64_t)a1
{
  [(id)a1 startTime];
  if (v4 != 0.0 && !*(void *)(a1 + 816))
  {
    if (*(double *)(a1 + 840) == 0.0)
    {
      if (a2 <= 0.0) {
        return;
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend((id)a1, "currentRequest"), "_payloadTransmissionTimeout");
      if (a2 <= 0.0 || v5 != 0.0) {
        return;
      }
    }
    [(id)a1 startTime];
    double v7 = v6 + a2;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v9 = v7 - v8;
    if (v9 <= 31536000.0)
    {
      int64_t v10 = (uint64_t)(v9 * 1000000000.0);
      if (v10 < 1)
      {
        uint64_t v13 = -[__NSCFLocalSessionTask timeoutErrorWithStreamErrorCode:]((void *)a1, 4294965193);
        objc_msgSend((id)a1, "_onqueue_cancel_with_error:", v13);
      }
      else
      {
        v11 = [(id)a1 workQueue];
        v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v11);
        *(void *)(a1 + 816) = v12;
        -[__NSCFLocalSessionTask _onqueue_startTimer:withTimeoutInNanos:streamErrorCode:]((void *)a1, v12, v10, -2103);
      }
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 111) = 0;
  *((void *)self + 112) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_connectionForUpgrade.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (__NSCFLocalSessionTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)__NSCFLocalSessionTask;
  double v6 = [(NSURLSessionTask *)&v10 initWithOriginalRequest:a3 ident:a4 taskGroup:a5];
  double v7 = v6;
  if (v6)
  {
    v6->_connKeyLock._os_unfair_lock_opaque = 0;
    v6->_suspendCount = 1;
    objc_msgSend((id)objc_msgSend(a3, "_startTimeoutDate"), "timeIntervalSinceReferenceDate");
    v7->_startTimeoutTime = v8;
    [(NSURLSessionTask *)v7 setState:1];
  }
  return v7;
}

- (void)connection:(id)a3 didReceiveData:(id)a4 completion:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63____NSCFLocalSessionTask_connection_didReceiveData_completion___block_invoke;
  v5[3] = &unk_1E52581A0;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      [(NSOperationQueue *)self->_connectionWorkQueue addOperationWithBlock:v5];
    }
    else {
      [(__NSCFLocalSessionTask *)self _onqueue_didReceiveDispatchData:a4 completion:a5];
    }
  }
}

- (void)_task_onqueue_didReceiveDispatchData:(id)a3 completionHandler:(id)a4
{
  if (self)
  {
    double v6 = self;
    if (objc_getProperty(self, a2, 784, 1))
    {
      dataTaskData = v6->_dataTaskData;
      if (dataTaskData)
      {
        v6->_dataTaskData = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)v6->_dataTaskData, (dispatch_data_t)a3);
        dispatch_release(dataTaskData);
      }
      else
      {
        if (a3) {
          dispatch_retain((dispatch_object_t)a3);
        }
        v6->_dataTaskData = (OS_dispatch_data *)a3;
      }
      double v9 = (void (*)(id))*((void *)a4 + 2);
      v9(a4);
      return;
    }
    self = (__NSCFLocalSessionTask *)v6->super._internalDelegateWrapper;
    if (!self) {
      self = (__NSCFLocalSessionTask *)v6->super._publicDelegateWrapper;
    }
    double v8 = v6;
  }
  else
  {
    double v8 = 0;
  }

  -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveData:completionHandler:]((uint64_t)self, v8, a3, a4);
}

- (void)connectionWillFinishLoading:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54____NSCFLocalSessionTask_connectionWillFinishLoading___block_invoke;
  v3[3] = &unk_1E5258228;
  v3[4] = self;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      [(NSOperationQueue *)self->_connectionWorkQueue addOperationWithBlock:v3];
    }
    else {
      [(NSURLSessionTask *)self _releasePreventIdleSleepAssertionIfAppropriate];
    }
  }
}

- (void)connection:(id)a3 didFinishLoadingWithError:(id)a4
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  double v6 = __63____NSCFLocalSessionTask_connection_didFinishLoadingWithError___block_invoke;
  double v7 = &unk_1E5257FB0;
  double v8 = self;
  id v9 = a4;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      [(NSOperationQueue *)self->_connectionWorkQueue addOperationWithBlock:&v4];
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_didFinishWithError:](self, "_onqueue_didFinishWithError:", a4, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)_onqueue_didFinishWithError:(id)a3
{
  if (![(NSURLSessionTask *)self error])
  {
    [(NSURLSessionTask *)self setError:a3];
    [(__NSCFLocalSessionTask *)self _task_onqueue_didFinish];
  }
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4 completion:(id)a5
{
  if (!self->_didCheckMixedReplace)
  {
    self->_didCheckMixedReplace = 1;
    uint64_t v9 = *(void *)(objc_msgSend(a4, "_inner", a3) + 88);
    if (v9)
    {
      if ((*(_WORD *)(v9 + 297) & 0x8000) != 0)
      {
        objc_super v10 = (NSOperationQueue *)objc_opt_new();
        self->_connectionWorkQueue = v10;
        [(NSOperationQueue *)v10 setMaxConcurrentOperationCount:1];
        v11 = [(NSURLSessionTask *)self session];
        if (v11) {
          workQueue = v11->_workQueue;
        }
        else {
          workQueue = 0;
        }
        [(NSOperationQueue *)self->_connectionWorkQueue setUnderlyingQueue:workQueue];
      }
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67____NSCFLocalSessionTask_connection_didReceiveResponse_completion___block_invoke;
  v13[3] = &unk_1E52581A0;
  v13[4] = self;
  v13[5] = a4;
  v13[6] = a5;
  connectionWorkQueue = self->_connectionWorkQueue;
  if (connectionWorkQueue) {
    [(NSOperationQueue *)connectionWorkQueue addOperationWithBlock:v13];
  }
  else {
    __67____NSCFLocalSessionTask_connection_didReceiveResponse_completion___block_invoke(v13);
  }
}

- (void)_task_onqueue_didFinish
{
  unint64_t v3 = [(NSError *)[(NSURLSessionTask *)self error] domain];
  if ([(NSString *)v3 isEqualToString:*MEMORY[0x1E4F289A0]]
    && [(NSError *)[(NSURLSessionTask *)self error] code] == -999)
  {
    os_unfair_lock_lock(&self->_connKeyLock);
    connKey = self->_connKey;
    if (connKey)
    {
      (*(void (**)(void *))(*(void *)connKey + 40))(self->_connKey);
      os_unfair_lock_unlock(&self->_connKeyLock);
      uint64_t v5 = -[__NSCFLocalSessionTask localSession](self);
      if (v5)
      {
        uint64_t v6 = v5[21];
        if (v6)
        {
          pthread_mutex_lock((pthread_mutex_t *)(v6 + 40));
          context[0] = MEMORY[0x1E4F143A8];
          context[1] = 3221225472;
          context[2] = ___ZN12XTubeManager38invalidateUnpurgeableConnectionsForKeyEP22HTTPConnectionCacheKey_block_invoke;
          context[3] = &__block_descriptor_40_e136_v24__0r__CoreSchedulingSet________CFAllocator_i______opaque_pthread_t_i____CFSet___os_unfair_lock_s_I_____CFRunLoop_____CFString_i_8_v16l;
          context[4] = connKey;
          CFDictionaryApplyFunction(*(CFDictionaryRef *)(v6 + 32), (CFDictionaryApplierFunction)RetainableTypedDict<CoreSchedulingSet const*,GlueTubeManager *>::_visit, context);
          pthread_mutex_unlock((pthread_mutex_t *)(v6 + 40));
        }
      }
      (*(void (**)(void *))(*(void *)connKey + 48))(connKey);
    }
    else
    {
      os_unfair_lock_unlock(&self->_connKeyLock);
    }
    [(NSURLSessionTask *)self _finishProgressReporting];
  }
  else
  {
    [(NSURLSessionTask *)self _finishProgressReporting];
    if (!self) {
      goto LABEL_13;
    }
  }
  if (self->_pendingResponseDisposition)
  {
    self->_pendingResponseDisposition_didFinish = 1;
    return;
  }
LABEL_13:
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  objc_super v10 = __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke;
  v11 = &unk_1E5258228;
  v12 = self;
  -[__CFN_TaskMetrics completeWithError:]((uint64_t)[(NSURLSessionTask *)self _metrics], [(NSURLSessionTask *)self error]);
  if ([(__NSCFLocalSessionTask *)self _needSendingMetrics])
  {
    [(__NSCFLocalSessionTask *)self _didSendMetrics];
    double v7 = -[NSURLSessionTaskMetrics initWithMetrics:]((id *)[NSURLSessionTaskMetrics alloc], [(NSURLSessionTask *)self _metrics]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke_3;
    v8[3] = &unk_1E52581A0;
    v8[4] = self;
    v8[5] = v7;
    v8[6] = v9;
    -[NSURLSessionTaskMetrics collectWithCompletionHandler:queue:]((uint64_t)v7, v8, [(NSURLSessionTask *)self workQueue]);
  }
  else
  {
    ((void (*)(void *))v10)(v9);
  }
  [(NSURLSessionTask *)self setState:3];
}

- (BOOL)_needSendingMetrics
{
  return !self->_sentDidFinishCollectingMetrics;
}

- (void)_didSendMetrics
{
  self->_sentDidFinishCollectingMetrics = 1;
}

- (void)connection:(id)a3 willCacheResponse:(id)a4 responseCallback:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72____NSCFLocalSessionTask_connection_willCacheResponse_responseCallback___block_invoke;
  v5[3] = &unk_1E52581A0;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      [(NSOperationQueue *)self->_connectionWorkQueue addOperationWithBlock:v5];
    }
    else {
      [(__NSCFLocalSessionTask *)self _onqueue_willCacheResponse:a4 withCompletion:a5];
    }
  }
}

- (void)_onqueue_willCacheResponse:(id)a3 withCompletion:(id)a4
{
  if (self)
  {
    uint64_t v6 = self;
    if (objc_getProperty(self, a2, 784, 1))
    {
      double v7 = (void (*)(id, id))*((void *)a4 + 2);
      v7(a4, a3);
      return;
    }
    self = (__NSCFLocalSessionTask *)v6->super._internalDelegateWrapper;
    if (!self) {
      self = (__NSCFLocalSessionTask *)v6->super._publicDelegateWrapper;
    }
    double v8 = v6;
  }
  else
  {
    double v8 = 0;
  }

  -[__NSCFURLSessionDelegateWrapper dataTask:willCacheResponse:completionHandler:]((uint64_t)self, v8, a3, a4);
}

- (uint64_t)_finishBecomeDownload:(uint64_t)result
{
  if (result)
  {
    unint64_t v3 = (unsigned char *)result;
    result = objc_msgSend(a2, "_onqueue_resume");
    if (v3[925])
    {
      v3[925] = 0;
      objc_msgSend(a2, "setError:", objc_msgSend(v3, "error"));
      return objc_msgSend(a2, "_task_onqueue_didFinish");
    }
  }
  return result;
}

- (void)connection:(id)a3 _willSendRequestForEstablishedConnection:(id)a4 completion:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89____NSCFLocalSessionTask_connection__willSendRequestForEstablishedConnection_completion___block_invoke;
  v5[3] = &unk_1E52581A0;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      [(NSOperationQueue *)self->_connectionWorkQueue addOperationWithBlock:v5];
    }
    else {
      [(__NSCFLocalSessionTask *)self _onqueue_willSendRequestForEstablishedConnection:a4 withCompletion:a5];
    }
  }
}

- (void)_onqueue_willSendRequestForEstablishedConnection:(id)a3 withCompletion:(id)a4
{
  startTimeoutTimer = self->_startTimeoutTimer;
  if (startTimeoutTimer)
  {
    self->_startTimeoutTimer = 0;
    dispatch_source_cancel(startTimeoutTimer);
    dispatch_release(startTimeoutTimer);
  }
  [(NSURLRequest *)[(NSURLSessionTask *)self currentRequest] _payloadTransmissionTimeout];
  if (v9 > 0.0 && !self->_payloadTransmissionTimer)
  {
    double v10 = v9;
    v11 = [(NSURLSessionTask *)self workQueue];
    v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v11);
    self->_payloadTransmissionTimer = v12;
    -[__NSCFLocalSessionTask _onqueue_startTimer:withTimeoutInNanos:streamErrorCode:](self, v12, (uint64_t)(v10 * 1000000000.0), -2107);
  }
  internalDelegateWrapper = self->super._internalDelegateWrapper;
  if (!internalDelegateWrapper) {
    internalDelegateWrapper = self->super._publicDelegateWrapper;
  }
  if ([(__NSCFURLSessionDelegateWrapper *)(uint64_t)internalDelegateWrapper _willSendRequestForEstablishedConnection])
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3052000000;
    v24[3] = __Block_byref_object_copy__474;
    v24[4] = __Block_byref_object_dispose__475;
    v25 = 0;
    v25 = _Block_copy(a4);
    v14 = [(NSURLSessionTask *)self session];
    if (v14) {
      workQueue = v14->_workQueue;
    }
    else {
      workQueue = 0;
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke;
    v23[3] = &unk_1E5252BD8;
    v23[4] = workQueue;
    v23[5] = self;
    v23[6] = v24;
    if (!self->_willSendRequestTimer)
    {
      v16 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, workQueue);
      self->_willSendRequestTimer = v16;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_2;
      handler[3] = &unk_1E5258028;
      handler[4] = self;
      handler[5] = v23;
      dispatch_source_set_event_handler((dispatch_source_t)v16, handler);
      willSendRequestTimer = self->_willSendRequestTimer;
      dispatch_time_t v18 = dispatch_time(0, 180000000000);
      dispatch_source_set_timer(willSendRequestTimer, v18, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_resume((dispatch_object_t)self->_willSendRequestTimer);
    }
    publicDelegateWrapper = self->super._internalDelegateWrapper;
    if (!publicDelegateWrapper) {
      publicDelegateWrapper = self->super._publicDelegateWrapper;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_104;
    v21[3] = &unk_1E5254F60;
    v21[4] = v23;
    -[__NSCFURLSessionDelegateWrapper task:_willSendRequestForEstablishedConnection:completionHandler:]((uint64_t)publicDelegateWrapper, self, a3, v21);
    _Block_object_dispose(v24, 8);
  }
  else
  {
    v20 = (void (*)(id, id))*((void *)a4 + 2);
    v20(a4, a3);
  }
}

- (void)_onqueue_adjustBytesPerSecondLimit:(int64_t)a3
{
  if ([(__NSCFLocalSessionTask *)self cfConn])
  {
    uint64_t v5 = [(__NSCFLocalSessionTask *)self cfConn];
    [(__NSCFURLSessionConnection *)v5 setBytesPerSecondLimit:a3];
  }
}

- (void)_onqueue_adjustPriorityHint:(float)a3 incremental:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(__NSCFLocalSessionTask *)self cfConn])
  {
    double v7 = [(__NSCFLocalSessionTask *)self cfConn];
    *(float *)&double v8 = a3;
    [(__NSCFURLSessionConnection *)v7 setPriorityHint:v4 incremental:v8];
  }
}

- (void)_onqueue_cancel_with_error:(id)a3
{
  if ([(NSURLSessionTask *)self state] <= NSURLSessionTaskStateCanceling
    && ![(NSURLSessionTask *)self error])
  {
    [(NSURLSessionTask *)self setState:2];
    if (self && objc_getProperty(self, v5, 808, 1))
    {
      id Property = objc_getProperty(self, v6, 808, 1);
      double v8 = (void (**)(void *, __NSCFLocalSessionTask *, void))_Block_copy(Property);
      objc_setProperty_atomic_copy(self, v9, 0, 808);
      v8[2](v8, self, 0);
      _Block_release(v8);
    }
    else if ([(__NSCFLocalSessionTask *)self cfConn])
    {
      [(__NSCFURLSessionConnection *)[(__NSCFLocalSessionTask *)self cfConn] cancel];
    }
    [(__NSCFLocalSessionTask *)self _onqueue_didFinishWithError:a3];
  }
}

- (void)_onqueue_suspend
{
  if (!self || (unint64_t suspendCount = self->_suspendCount, self->_unint64_t suspendCount = suspendCount + 1, !suspendCount))
  {
    [(NSURLSessionTask *)self setState:1];
    if ([(__NSCFLocalSessionTask *)self cfConn])
    {
      BOOL v4 = [(__NSCFLocalSessionTask *)self cfConn];
      [(__NSCFURLSessionConnection *)v4 suspend];
    }
  }
}

- (void)dealloc
{
  if (self->_resourceTimeout) {
    __assert_rtn("-[__NSCFLocalSessionTask dealloc]", "LocalSessionTask.mm", 384, "_resourceTimeout == NULL");
  }
  unint64_t v3 = -[__NSCFLocalSessionTask localSession](self);
  -[__NSURLSessionLocal removeUnresumedTask:]((uint64_t)v3, (uint64_t)self);

  id dataTaskCompletion = self->_dataTaskCompletion;
  if (dataTaskCompletion) {
    _Block_release(dataTaskCompletion);
  }
  dataTaskData = self->_dataTaskData;
  if (dataTaskData) {
    dispatch_release(dataTaskData);
  }
  pendingResponseBytes = self->_pendingResponseBytes;
  if (pendingResponseBytes) {
    dispatch_release(pendingResponseBytes);
  }
  id async_initialization = self->_async_initialization;
  if (async_initialization) {
    _Block_release(async_initialization);
  }
  connKey = self->_connKey;
  if (connKey) {
    (*(void (**)(void *))(*(void *)connKey + 48))(connKey);
  }
  socketReadStreamForUpgrade = self->_socketReadStreamForUpgrade;
  if (socketReadStreamForUpgrade)
  {
    [(NSInputStream *)socketReadStreamForUpgrade close];

    self->_socketReadStreamForUpgrade = 0;
  }
  socketWriteStreamForUpgrade = self->_socketWriteStreamForUpgrade;
  if (socketWriteStreamForUpgrade)
  {
    [(NSOutputStream *)socketWriteStreamForUpgrade close];

    self->_socketWriteStreamForUpgrade = 0;
  }
  connectionWorkQueue = self->_connectionWorkQueue;
  if (connectionWorkQueue)
  {

    self->_connectionWorkQueue = 0;
  }
  extraBytes = self->_extraBytes;
  if (extraBytes)
  {
    dispatch_release(extraBytes);
    self->_extraBytes = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)__NSCFLocalSessionTask;
  [(NSURLSessionTask *)&v13 dealloc];
}

- (void)_onSessionQueue_disavow
{
  unint64_t v3 = (void *)MEMORY[0x18531D6D0](self, a2);
  [(__NSCFLocalSessionTask *)self cfConn];
  -[__NSCFLocalSessionTask setConnection:](self, 0);
  BOOL v4 = -[__NSCFLocalSessionTask localSession](self);
  -[__NSURLSessionLocal task:terminatedConnection:]((uint64_t)v4, (uint64_t)self);
}

- (__NSCFURLSessionConnection)cfConn
{
  return (__NSCFURLSessionConnection *)objc_getProperty(self, a2, 760, 1);
}

- (void)localSession
{
  if (result)
  {
    v1 = result;
    [result session];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "local tasks should have local sessions", v2, 2u);
    }
    return (void *)[v1 session];
  }
  return result;
}

- (void)setConnection:(void *)a1
{
  if (a1)
  {
    [a1 setCfConn:a2];
    if (a2)
    {
      [a1 _timeoutIntervalForResource];
      -[__NSCFLocalSessionTask _onqueue_startResourceTimer:]((uint64_t)a1, v4);
      -[__NSCFLocalSessionTask _onqueue_startStartTimer]((uint64_t)a1);
    }
    else
    {
      uint64_t v5 = a1[102];
      if (v5)
      {
        a1[102] = 0;
        dispatch_source_cancel(v5);
        dispatch_release(v5);
      }
      uint64_t v6 = a1[106];
      if (v6)
      {
        a1[106] = 0;
        dispatch_source_cancel(v6);
        dispatch_release(v6);
      }
      double v7 = a1[107];
      if (v7)
      {
        a1[107] = 0;
        dispatch_source_cancel(v7);
        dispatch_release(v7);
      }
      double v8 = a1[108];
      if (v8)
      {
        a1[108] = 0;
        dispatch_source_cancel(v8);
        dispatch_release(v8);
      }
    }
  }
}

- (void)setCfConn:(id)a3
{
}

- (void)_onqueue_startStartTimer
{
  if (a1)
  {
    if (*(double *)(a1 + 840) > 0.0)
    {
      [(id)a1 startTime];
      if (v2 != 0.0 && !*(void *)(a1 + 848))
      {
        double v3 = *(double *)(a1 + 840);
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        int64_t v5 = (uint64_t)((v3 - v4) * 1000000000.0);
        if (v5 < 1)
        {
          uint64_t v8 = -[__NSCFLocalSessionTask timeoutErrorWithStreamErrorCode:]((void *)a1, 4294965191);
          objc_msgSend((id)a1, "_onqueue_cancel_with_error:", v8);
        }
        else
        {
          uint64_t v6 = [(id)a1 workQueue];
          double v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v6);
          *(void *)(a1 + 848) = v7;
          -[__NSCFLocalSessionTask _onqueue_startTimer:withTimeoutInNanos:streamErrorCode:]((void *)a1, v7, v5, -2105);
        }
      }
    }
  }
}

- (void)_onqueue_startTimer:(int64_t)a3 withTimeoutInNanos:(int)a4 streamErrorCode:
{
  id v8 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81____NSCFLocalSessionTask__onqueue_startTimer_withTimeoutInNanos_streamErrorCode___block_invoke;
  block[3] = &unk_1E5258058;
  block[4] = a1;
  int v13 = a4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_source_set_event_handler(a2, v9);
  _Block_release(v9);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __81____NSCFLocalSessionTask__onqueue_startTimer_withTimeoutInNanos_streamErrorCode___block_invoke_2;
  handler[3] = &unk_1E5258228;
  handler[4] = a1;
  dispatch_source_set_cancel_handler(a2, handler);
  dispatch_time_t v10 = dispatch_time(0x8000000000000000, a3);
  dispatch_source_set_timer(a2, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume(a2);
}

- (void)connection:(id)a3 sentBodyBytes:(id)a4 totalBytes:(id)a5 expectedBytes:(id)a6
{
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  dispatch_time_t v10 = __76____NSCFLocalSessionTask_connection_sentBodyBytes_totalBytes_expectedBytes___block_invoke;
  v11 = &unk_1E5256948;
  v12 = self;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (self)
  {
    connectionWorkQueue = self->_connectionWorkQueue;
    if (connectionWorkQueue) {
      [(NSOperationQueue *)connectionWorkQueue addOperationWithBlock:&v8];
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_didSendBodyBytes:totalBytesSent:totalBytesExpectedToSend:](self, "_onqueue_didSendBodyBytes:totalBytesSent:totalBytesExpectedToSend:", objc_msgSend(a4, "longLongValue", a3, v8, v9, v10, v11, v12, v13), objc_msgSend(v14, "longLongValue"), objc_msgSend(v15, "longLongValue"));
    }
  }
}

- (void)_onqueue_adjustPoolPriority
{
  if ([(__NSCFLocalSessionTask *)self cfConn])
  {
    double v3 = [(__NSCFLocalSessionTask *)self cfConn];
    int64_t v4 = [(NSURLSessionTask *)self computeAdjustedPoolPriority];
    [(__NSCFURLSessionConnection *)v3 setPoolPriority:v4];
  }
}

- (void)_onqueue_didSendBodyBytes:(int64_t)a3 totalBytesSent:(int64_t)a4 totalBytesExpectedToSend:(int64_t)a5
{
  [(NSURLSessionTask *)self setCountOfBytesSent:a4];
  [(NSURLSessionTask *)self setCountOfBytesExpectedToSend:a5];
  if (self)
  {
    internalDelegateWrapper = self->super._internalDelegateWrapper;
    if (!internalDelegateWrapper) {
      internalDelegateWrapper = self->super._publicDelegateWrapper;
    }
  }
  else
  {
    internalDelegateWrapper = 0;
  }

  -[__NSCFURLSessionDelegateWrapper task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:]((uint64_t)internalDelegateWrapper, self, a3, a4, a5);
}

- (uint64_t)timeoutErrorWithStreamErrorCode:(void *)a1
{
  double v2 = a1;
  if (!a1) {
    return (uint64_t)v2;
  }
  if ([a1 _proxySettings]
    && [v2 _proxyHandshakePending]
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "currentRequest_URL"), "scheme"), "caseInsensitiveCompare:", @"https"))
  {
    int64_t v5 = &kCFErrorDomainCFNetwork;
    uint64_t v4 = 310;
  }
  else
  {
    uint64_t v4 = -1001;
    int64_t v5 = (const CFStringRef *)MEMORY[0x1E4F289A0];
  }
  double v2 = (void *)[v2 error:*v5 code:v4];
  uint64_t v6 = [v2 userInfo];
  if (v6)
  {
    double v7 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 4), @"_kCFStreamErrorDomainKey");
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", a2), @"_kCFStreamErrorCodeKey");
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v10 = [NSNumber numberWithInt:4];
    uint64_t v8 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"_kCFStreamErrorDomainKey", objc_msgSend(NSNumber, "numberWithInt:", a2), @"_kCFStreamErrorCodeKey", 0);
  }
  uint64_t v11 = v8;
  if (!v8) {
    return (uint64_t)v2;
  }
  v12 = (void *)MEMORY[0x1E4F290A8];
  uint64_t v13 = [v2 domain];
  uint64_t v14 = [v2 code];

  return [v12 errorWithDomain:v13 code:v14 userInfo:v11];
}

- (id)error:(id)a3 code:(int64_t)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F290A8];
  double v7 = [(NSURLSessionTask *)self currentRequest_URL];

  return (id)objc_msgSend(v6, "_web_errorWithDomain:code:URL:", a3, a4, v7);
}

- (void)_setConnectionCacheKey:(void *)a3
{
  if (a3) {
    (*(void (**)(void *, SEL))(*(void *)a3 + 40))(a3, a2);
  }
  os_unfair_lock_lock(&self->_connKeyLock);
  connKey = self->_connKey;
  self->_connKey = a3;
  os_unfair_lock_unlock(&self->_connKeyLock);
  if (connKey)
  {
    uint64_t v6 = *(void (**)(void *))(*(void *)connKey + 48);
    v6(connKey);
  }
}

- (void)_private_onqueue_didReceiveResponseDisposition:(int64_t)a3 completion:(id)a4
{
  switch(a3)
  {
    case 0:
      goto LABEL_2;
    case 1:
      if (self) {
        goto LABEL_18;
      }
      goto LABEL_19;
    case 2:
      if (!self) {
        goto LABEL_2;
      }
      internalDelegateWrapper = self->super._internalDelegateWrapper;
      if (!internalDelegateWrapper)
      {
        internalDelegateWrapper = self->super._publicDelegateWrapper;
        if (!internalDelegateWrapper) {
          goto LABEL_2;
        }
      }
      if (([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)internalDelegateWrapper check_didBecomeDownloadTask] & 1) == 0&& ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)internalDelegateWrapper->_fallbackDelegateWrapper check_didBecomeDownloadTask] & 1) == 0)
      {
        goto LABEL_2;
      }
      uint64_t v9 = [(__NSCFLocalSessionTask *)self cfConn];
      -[__NSCFLocalSessionTask setConnection:](self, 0);
      uint64_t v10 = [__NSCFLocalDownloadTask alloc];
      if (!v10) {
        goto LABEL_45;
      }
      v10->_initialResumeSize = -1;
      v37.receiver = v10;
      v37.super_class = (Class)__NSCFLocalSessionTask;
      uint64_t v11 = [(NSURLSessionTask *)&v37 initWithTask:self];
      v12 = v11;
      if (v11)
      {
        v11->_connKeyLock._os_unfair_lock_opaque = 0;
        v11->_unint64_t suspendCount = 1;
        -[__NSCFLocalSessionTask setConnection:](v11, (uint64_t)[(__NSCFLocalSessionTask *)self cfConn]);
        [(NSURLSessionTask *)v12 setState:1];
        [(__NSCFLocalSessionTask *)v12 setCfConn:v9];
        uint64_t v13 = [(__NSCFLocalSessionTask *)v12 cfConn];
        if (v13) {
          objc_setProperty_atomic_copy(v13, v14, v12, 8);
        }
        id v15 = [(__NSCFLocalSessionTask *)v12 cfConn];
        if (v15) {
          objc_setProperty_atomic(v15, v16, v12, 24);
        }
        [(__NSCFURLSessionConnection *)[(__NSCFLocalSessionTask *)v12 cfConn] setIsDownload:1];
        [(NSURLSessionTask *)v12 setPrefersIncrementalDelivery:0];
        if (-[__NSCFLocalDownloadTask setupForNewDownload:](v12, 0))
        {
          v12->_unint64_t suspendCount = 1;
          [(NSURLSessionTask *)v12 setState:1];
        }
        else
        {

LABEL_45:
          v12 = 0;
        }
      }

      v31 = (id *)-[__NSCFLocalSessionTask localSession](self);
      -[__NSURLSessionLocal replaceTask:withTask:](v31, self, v12);
      publicDelegateWrapper = self->super._internalDelegateWrapper;
      if (!publicDelegateWrapper) {
        publicDelegateWrapper = self->super._publicDelegateWrapper;
      }
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke_2;
      v35[3] = &unk_1E5257FB0;
      v35[4] = self;
      v35[5] = v12;
      -[__NSCFURLSessionDelegateWrapper dataTask:didBecomeDownloadTask:completionHandler:]((uint64_t)publicDelegateWrapper, self, v12, v35);
      goto LABEL_49;
    case 3:
      if (self
        && ((dispatch_time_t v18 = self->super._internalDelegateWrapper) != 0 || (dispatch_time_t v18 = self->super._publicDelegateWrapper) != 0)
        && (([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)v18 check_didBecomeStreamTask] & 1) != 0
         || ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)v18->_fallbackDelegateWrapper check_didBecomeStreamTask] & 1) != 0))
      {
        v20 = (id *)-[__NSCFLocalSessionTask localSession](self);
        v21 = [(__NSCFLocalSessionTask *)self cfConn];
        if (self->_connectionForUpgrade.__ptr_)
        {
          if (self->_pendingResponseBytes) {
            __assert_rtn("-[__NSCFLocalSessionTask _private_onqueue_becomeStreamTaskWithCompletionHandler:]", "LocalSessionTask.mm", 525, "_pendingResponseBytes == nil");
          }
          v22 = [__NSCFURLLocalTCPIOStreamTaskFromDataTask alloc];
          cntrl = self->_connectionForUpgrade.__cntrl_;
          ptr = self->_connectionForUpgrade.__ptr_;
          v51 = cntrl;
          if (cntrl) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
          }
          extraBytes = self->_extraBytes;
          uint64_t v44 = MEMORY[0x1E4F143A8];
          uint64_t v45 = 3221225472;
          v46 = __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke;
          v47 = &unk_1E5252B88;
          v48 = v20;
          v49 = v21;
          v25 = [(__NSCFURLLocalTCPIOStreamTaskFromDataTask *)v22 initWithTask:self connection:&ptr extraBytes:extraBytes disavow:&v44];
          if (v51) {
            std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v51);
          }
        }
        else
        {
          v26 = [__NSCFURLLocalStreamTaskFromDataTask alloc];
          uint64_t v44 = MEMORY[0x1E4F143A8];
          uint64_t v45 = 3221225472;
          v46 = __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_2;
          v47 = &unk_1E5252B88;
          v48 = v20;
          v49 = v21;
          v25 = [(__NSCFURLLocalStreamTaskFromDataTask *)v26 initWithTask:self disavow:&v44];
        }
        uint64_t v27 = objc_opt_class();
        if (v27 == objc_opt_class() || (uint64_t v29 = objc_opt_class(), v29 == objc_opt_class()))
        {
          if (v21) {
            objc_setProperty_atomic(v21, v28, v25, 24);
          }
        }
        -[__NSCFLocalSessionTask setConnection:](self, 0);
        -[__NSURLSessionLocal replaceTask:withTask:](v20, self, v25);
        v30 = self->super._internalDelegateWrapper;
        if (!v30) {
          v30 = self->super._publicDelegateWrapper;
        }
        v37.receiver = (id)MEMORY[0x1E4F143A8];
        v37.super_class = (Class)3221225472;
        v38 = __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_3;
        v39 = &unk_1E52571D8;
        v40 = self;
        v41 = v25;
        v42 = v21;
        id v43 = a4;
        -[__NSCFURLSessionDelegateWrapper dataTask:didBecomeStreamTask:completionHandler:]((uint64_t)v30, self, v25, &v37);
      }
      else
      {
LABEL_2:
        [(__NSCFLocalSessionTask *)self _onqueue_cancel];
        uint64_t v6 = self->_connectionForUpgrade.__ptr_;
        if (v6) {
          (*(void (**)(TransportConnection *, void))(*(void *)v6 + 152))(v6, 0);
        }
LABEL_18:
        self->_pendingResponseDisposition = 0;
LABEL_19:
        pendingResponseBytes = self->_pendingResponseBytes;
        if (pendingResponseBytes)
        {
          self->_pendingResponseBytes = 0;
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke;
          v36[3] = &unk_1E5258228;
          v36[4] = self;
          [(__NSCFLocalSessionTask *)self _task_onqueue_didReceiveDispatchData:pendingResponseBytes completionHandler:v36];
          dispatch_release(pendingResponseBytes);
        }
        else
        {
          if (self->_suspendedForDisposition) {
            [(__NSCFLocalSessionTask *)self _onqueue_resume];
          }
          if (self->_pendingResponseDisposition_didFinish)
          {
            self->_pendingResponseDisposition_didFinish = 0;
            [(__NSCFLocalSessionTask *)self _task_onqueue_didFinish];
          }
        }
LABEL_49:
        uint64_t v34 = 0;
        long long v33 = xmmword_18430B9E0;
        (*((void (**)(id, long long *))a4 + 2))(a4, &v33);
      }
      return;
    default:
      goto LABEL_49;
  }
}

- (void)_onqueue_completeInitialization
{
  if (self)
  {
    id Property = objc_getProperty(self, a2, 808, 1);
    uint64_t v4 = (void (**)(void *, __NSCFLocalSessionTask *, uint64_t))_Block_copy(Property);
    objc_setProperty_atomic_copy(self, v5, 0, 808);
  }
  else
  {
    uint64_t v4 = (void (**)(void *, __NSCFLocalSessionTask *, uint64_t))_Block_copy(0);
  }
  v4[2](v4, self, 1);

  _Block_release(v4);
}

- (id)_onqueue_strippedMutableRequest
{
  double v3 = (void *)[(NSURLRequest *)[(NSURLSessionTask *)self currentRequest] mutableCopy];
  [v3 setHTTPBody:0];
  [v3 setHTTPBodyStream:0];
  [v3 setValue:0 forHTTPHeaderField:@"Transfer-Encoding"];
  [(NSURLSessionTask *)self updateCurrentRequest:v3];

  return v3;
}

- (void)_onqueue_setupNextEffectiveConfigurationWithCompletionHandler:(id)a3
{
  SEL v5 = [(NSURLSessionTask *)self _effectiveConfiguration];
  if (self)
  {
    internalDelegateWrapper = self->super._internalDelegateWrapper;
    if (!internalDelegateWrapper) {
      internalDelegateWrapper = self->super._publicDelegateWrapper;
    }
  }
  else
  {
    internalDelegateWrapper = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88____NSCFLocalSessionTask__onqueue_setupNextEffectiveConfigurationWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5252BB0;
  v7[4] = self;
  v7[5] = v5;
  v7[6] = a3;
  -[__NSCFURLSessionDelegateWrapper task:_willUseEffectiveConfiguration:completionHandler:]((uint64_t)internalDelegateWrapper, self, v5, v7);
}

- (void)_onqueue_cancel
{
  if (self) {
    id v3 = [(__NSCFLocalSessionTask *)self error:*MEMORY[0x1E4F289A0] code:-999];
  }
  else {
    id v3 = 0;
  }

  [(__NSCFLocalSessionTask *)self _onqueue_cancel_with_error:v3];
}

- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3
{
  v8.receiver = self;
  v8.super_class = (Class)__NSCFLocalSessionTask;
  -[NSURLSessionTask set_TLSMinimumSupportedProtocolVersion:](&v8, sel_set_TLSMinimumSupportedProtocolVersion_);
  if ([(NSURLSessionTask *)self session])
  {
    SEL v5 = [(NSURLSessionTask *)self workQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65____NSCFLocalSessionTask_set_TLSMinimumSupportedProtocolVersion___block_invoke;
    v6[3] = &unk_1E5258278;
    v6[4] = self;
    unsigned __int16 v7 = a3;
    dispatch_async((dispatch_queue_t)v5, v6);
  }
}

- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3
{
  v8.receiver = self;
  v8.super_class = (Class)__NSCFLocalSessionTask;
  -[NSURLSessionTask set_TLSMaximumSupportedProtocolVersion:](&v8, sel_set_TLSMaximumSupportedProtocolVersion_);
  if ([(NSURLSessionTask *)self session])
  {
    SEL v5 = [(NSURLSessionTask *)self workQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65____NSCFLocalSessionTask_set_TLSMaximumSupportedProtocolVersion___block_invoke;
    v6[3] = &unk_1E5258278;
    v6[4] = self;
    unsigned __int16 v7 = a3;
    dispatch_async((dispatch_queue_t)v5, v6);
  }
}

- (void)connection:(id)a3 challenged:(id)a4 authCallback:(id)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61____NSCFLocalSessionTask_connection_challenged_authCallback___block_invoke;
  v7[3] = &unk_1E52581A0;
  v7[4] = self;
  v7[5] = a4;
  id v8 = a5;
  if (self)
  {
    connectionWorkQueue = self->_connectionWorkQueue;
    if (connectionWorkQueue) {
      [(NSOperationQueue *)connectionWorkQueue addOperationWithBlock:v7];
    }
    else {
      [(__NSCFLocalSessionTask *)self _onqueue_didReceiveChallenge:a4 request:[(NSURLSessionTask *)self currentRequest] withCompletion:v8];
    }
  }
}

- (void)_onqueue_didReceiveChallenge:(id)a3 request:(id)a4 withCompletion:(id)a5
{
  if (isSessionChallenge((NSURLAuthenticationChallenge *)a3))
  {
    if (self)
    {
      internalDelegateWrapper = self->super._internalDelegateWrapper;
      if (!internalDelegateWrapper) {
        internalDelegateWrapper = self->super._publicDelegateWrapper;
      }
      if ([(__NSCFURLSessionDelegateWrapper *)(uint64_t)internalDelegateWrapper sessionDidReceiveChallenge])
      {
        publicDelegateWrapper = self->super._internalDelegateWrapper;
        if (!publicDelegateWrapper) {
          publicDelegateWrapper = self->super._publicDelegateWrapper;
        }
        goto LABEL_8;
      }
      goto LABEL_12;
    }
    char v12 = [(__NSCFURLSessionDelegateWrapper *)0 sessionDidReceiveChallenge];
    publicDelegateWrapper = 0;
    uint64_t v11 = 0;
    if (v12)
    {
LABEL_8:
      -[__NSCFURLSessionDelegateWrapper didReceiveChallenge:completionHandler:]((uint64_t)publicDelegateWrapper, a3, a5);
      return;
    }
  }
  else
  {
    if (self)
    {
LABEL_12:
      uint64_t v11 = self->super._internalDelegateWrapper;
      if (!v11) {
        uint64_t v11 = self->super._publicDelegateWrapper;
      }
      goto LABEL_14;
    }
    uint64_t v11 = 0;
  }
LABEL_14:

  -[__NSCFURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:]((uint64_t)v11, self, a3, a5);
}

- (void)startResourceTimer
{
  id v3 = [(NSURLSessionTask *)self session];
  if (v3) {
    id v3 = (NSURLSession *)v3->_workQueue;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44____NSCFLocalSessionTask_startResourceTimer__block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(&v3->super, block);
}

- (void)set_timeoutIntervalForResource:(double)a3
{
  [(NSURLSessionTask *)self _timeoutIntervalForResource];
  if (v5 != a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)__NSCFLocalSessionTask;
    [(NSURLSessionTask *)&v9 set_timeoutIntervalForResource:a3];
    if ([(NSURLSessionTask *)self session])
    {
      uint64_t v6 = [(NSURLSessionTask *)self session];
      if (v6)
      {
        if (v6->_workQueue)
        {
          unsigned __int16 v7 = [(NSURLSessionTask *)self session];
          if (v7) {
            unsigned __int16 v7 = (NSURLSession *)v7->_workQueue;
          }
          v8[0] = MEMORY[0x1E4F143A8];
          v8[1] = 3221225472;
          v8[2] = __57____NSCFLocalSessionTask_set_timeoutIntervalForResource___block_invoke;
          v8[3] = &unk_1E5258250;
          v8[4] = self;
          *(double *)&v8[5] = a3;
          dispatch_async(&v7->super, v8);
        }
      }
    }
  }
}

- (void)connection:(id)a3 didReceiveTCPConnection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  objc_super v9 = __72____NSCFLocalSessionTask_connection_didReceiveTCPConnection_extraBytes___block_invoke;
  uint64_t v10 = &unk_1ECFA9C68;
  uint64_t v6 = *(void *)a4.__ptr_;
  double v5 = (std::__shared_weak_count *)*((void *)a4.__ptr_ + 1);
  uint64_t v11 = self;
  uint64_t v13 = v6;
  uint64_t v14 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  cntrl = a4.__cntrl_;
  if (self)
  {
    connectionWorkQueue = self->_connectionWorkQueue;
    if (connectionWorkQueue) {
      [(NSOperationQueue *)connectionWorkQueue addOperationWithBlock:v8];
    }
    else {
      ((void (*)(void *, SEL, id))v9)(v8, a2, a3);
    }
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v14);
  }
}

- (void)connection:(id)a3 didReceiveSocketInputStream:(id)a4 outputStream:(id)a5
{
  if (*(_OWORD *)&self->_socketReadStreamForUpgrade != 0
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "already have socket is and os", buf, 2u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __78____NSCFLocalSessionTask_connection_didReceiveSocketInputStream_outputStream___block_invoke;
  v9[3] = &unk_1E52582F0;
  uint64_t v10 = self;
  id v11 = a4;
  id v12 = a5;
  connectionWorkQueue = self->_connectionWorkQueue;
  if (connectionWorkQueue)
  {
    [(NSOperationQueue *)connectionWorkQueue addOperationWithBlock:v9];
  }
  else
  {
    v10->_socketReadStreamForUpgrade = (NSInputStream *)a4;
    v10->_socketWriteStreamForUpgrade = (NSOutputStream *)v12;
  }
}

- (void)connection:(id)a3 alternatePathAvailable:(int)a4
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __60____NSCFLocalSessionTask_connection_alternatePathAvailable___block_invoke;
  unsigned __int16 v7 = &unk_1E5258058;
  id v8 = self;
  LODWORD(v9) = a4;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      [(NSOperationQueue *)self->_connectionWorkQueue addOperationWithBlock:&v4];
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_alternatePathAvailable:](self, "_onqueue_alternatePathAvailable:", *(void *)&a4, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)connection:(id)a3 _conditionalRequirementsChanged:(BOOL)a4
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __69____NSCFLocalSessionTask_connection__conditionalRequirementsChanged___block_invoke;
  unsigned __int16 v7 = &unk_1E5258080;
  id v8 = self;
  LOBYTE(v9) = a4;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      [(NSOperationQueue *)self->_connectionWorkQueue addOperationWithBlock:&v4];
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_conditionalRequirementsChanged:](self, "_onqueue_conditionalRequirementsChanged:", a4, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)connection:(id)a3 waitingWithReason:(int64_t)a4
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __55____NSCFLocalSessionTask_connection_waitingWithReason___block_invoke;
  unsigned __int16 v7 = &unk_1E5258250;
  id v8 = self;
  int64_t v9 = a4;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      [(NSOperationQueue *)self->_connectionWorkQueue addOperationWithBlock:&v4];
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_connectionWaitingWithReason:](self, "_onqueue_connectionWaitingWithReason:", a4, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamFromOffset:(int64_t)a5 callback:(id)a6
{
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __83____NSCFLocalSessionTask_connection_request_needsNewBodyStreamFromOffset_callback___block_invoke;
  int64_t v9 = &unk_1E52573A0;
  uint64_t v10 = self;
  id v11 = a4;
  id v12 = a6;
  int64_t v13 = a5;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      [(NSOperationQueue *)self->_connectionWorkQueue addOperationWithBlock:&v6];
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_needNewBodyStream:fromOffset:withCompletion:](self, "_onqueue_needNewBodyStream:fromOffset:withCompletion:", a4, a5, a6, v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamCallback:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72____NSCFLocalSessionTask_connection_request_needsNewBodyStreamCallback___block_invoke;
  v5[3] = &unk_1E52581A0;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      [(NSOperationQueue *)self->_connectionWorkQueue addOperationWithBlock:v5];
    }
    else {
      [(__NSCFLocalSessionTask *)self _onqueue_needNewBodyStream:a4 withCompletion:a5];
    }
  }
}

- (void)connection:(id)a3 didReceiveInformationalResponse:(id)a4
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69____NSCFLocalSessionTask_connection_didReceiveInformationalResponse___block_invoke;
  v7[3] = &unk_1E5257FB0;
  v7[4] = self;
  v7[5] = a4;
  if (self)
  {
    connectionWorkQueue = self->_connectionWorkQueue;
    if (connectionWorkQueue)
    {
      [(NSOperationQueue *)connectionWorkQueue addOperationWithBlock:v7];
    }
    else
    {
      internalDelegateWrapper = self->super._internalDelegateWrapper;
      if (!internalDelegateWrapper) {
        internalDelegateWrapper = self->super._publicDelegateWrapper;
      }
      -[__NSCFURLSessionDelegateWrapper task:didReceiveInformationalResponse:]((uint64_t)internalDelegateWrapper, self, a4);
    }
  }
}

- (void)connection:(id)a3 wasRedirected:(id)a4 newRequest:(id)a5 responseCallback:(id)a6
{
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __79____NSCFLocalSessionTask_connection_wasRedirected_newRequest_responseCallback___block_invoke;
  int64_t v9 = &unk_1E52571D8;
  uint64_t v10 = self;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self)
  {
    if (self->_connectionWorkQueue) {
      [(NSOperationQueue *)self->_connectionWorkQueue addOperationWithBlock:&v6];
    }
    else {
      -[__NSCFLocalSessionTask _onqueue_didReceiveResponse:redirectRequest:withCompletion:](self, "_onqueue_didReceiveResponse:redirectRequest:withCompletion:", a4, a5, a6, v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (id)resourceTimeoutError
{
  return (id)-[__NSCFLocalSessionTask timeoutErrorWithStreamErrorCode:](self, 4294965193);
}

- (void)cancel_with_error:(id)a3
{
  uint64_t v5 = [(NSURLSessionTask *)self session];
  if (v5) {
    uint64_t v5 = (NSURLSession *)v5->_workQueue;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44____NSCFLocalSessionTask_cancel_with_error___block_invoke;
  v6[3] = &unk_1E5257FB0;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_async(&v5->super, v6);
}

- (void)_onqueue_expectedProgressTargetChanged
{
  if ([(__NSCFLocalSessionTask *)self cfConn])
  {
    id v3 = [(__NSCFLocalSessionTask *)self cfConn];
    [(__NSCFURLSessionConnection *)v3 expectedProgressTargetChanged];
  }
}

- (void)_onqueue_alternatePathAvailable:(int)a3
{
  id v3 = (__NSCFLocalSessionTask **)self;
  if (self)
  {
    self = (__NSCFLocalSessionTask *)self->super._internalDelegateWrapper;
    if (!self) {
      self = v3[87];
    }
  }
  -[__NSCFURLSessionDelegateWrapper task:_alternatePathAvailable:]((uint64_t)self, v3, *(uint64_t *)&a3);
}

- (void)_onqueue_conditionalRequirementsChanged:(BOOL)a3
{
  id v3 = (__NSCFLocalSessionTask **)self;
  if (self)
  {
    self = (__NSCFLocalSessionTask *)self->super._internalDelegateWrapper;
    if (!self) {
      self = v3[87];
    }
  }
  -[__NSCFURLSessionDelegateWrapper task:_conditionalRequirementsChanged:]((uint64_t)self, v3, a3);
}

- (void)_onqueue_connectionWaitingWithReason:(int64_t)a3
{
  [(NSURLSessionTask *)self _releasePreventIdleSleepAssertionIfAppropriate];
  if (self)
  {
    internalDelegateWrapper = self->super._internalDelegateWrapper;
    if (!internalDelegateWrapper) {
      internalDelegateWrapper = self->super._publicDelegateWrapper;
    }
  }
  else
  {
    internalDelegateWrapper = 0;
  }
  -[__NSCFURLSessionDelegateWrapper task:_isWaitingForConnectionWithError:]((uint64_t)internalDelegateWrapper, self, (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"NSTCPConnectionConditionsUnmetReasonErrorDomain" code:a3 userInfo:0]);
  if (objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "waitsForConnectivity"))
  {
    if (self)
    {
      if (!self->_didIssueWaitingForConnectivity)
      {
        self->_didIssueWaitingForConnectivity = 1;
        publicDelegateWrapper = self->super._internalDelegateWrapper;
        if (!publicDelegateWrapper) {
          publicDelegateWrapper = self->super._publicDelegateWrapper;
        }
        -[__NSCFURLSessionDelegateWrapper taskIsWaitingForConnectivity:]((uint64_t)publicDelegateWrapper, self);
      }
    }
    else
    {
    }
  }
}

- (void)_onqueue_needNewBodyStream:(id)a3 fromOffset:(int64_t)a4 withCompletion:(id)a5
{
  uint64_t v5 = (__NSCFLocalSessionTask **)self;
  if (self)
  {
    self = (__NSCFLocalSessionTask *)self->super._internalDelegateWrapper;
    if (!self) {
      self = v5[87];
    }
  }
  -[__NSCFURLSessionDelegateWrapper task:needNewBodyStreamFromOffset:completionHandler:]((uint64_t)self, v5, a4, a5);
}

- (void)_onqueue_needNewBodyStream:(id)a3 withCompletion:(id)a4
{
  uint64_t v4 = (__NSCFLocalSessionTask **)self;
  if (self)
  {
    self = (__NSCFLocalSessionTask *)self->super._internalDelegateWrapper;
    if (!self) {
      self = v4[87];
    }
  }
  -[__NSCFURLSessionDelegateWrapper task:needNewBodyStream:]((uint64_t)self, v4, a4);
}

- (void)_onqueue_didReceiveResponse:(id)a3 redirectRequest:(id)a4 withCompletion:(id)a5
{
  uint64_t v5 = (__NSCFLocalSessionTask **)self;
  if (self)
  {
    self = (__NSCFLocalSessionTask *)self->super._internalDelegateWrapper;
    if (!self) {
      self = v5[87];
    }
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85____NSCFLocalSessionTask__onqueue_didReceiveResponse_redirectRequest_withCompletion___block_invoke;
  v6[3] = &unk_1E52542E8;
  v6[4] = v5;
  void v6[5] = a5;
  -[__NSCFURLSessionDelegateWrapper task:willPerformHTTPRedirection:newRequest:completionHandler:]((uint64_t)self, v5, a3, a4, v6);
}

- (_BYTE)_finishAllow
{
  if (result)
  {
    v1 = result;
    if (result[928]) {
      result = (unsigned char *)objc_msgSend(result, "_onqueue_resume");
    }
    if (v1[925])
    {
      v1[925] = 0;
      return (unsigned char *)objc_msgSend(v1, "_task_onqueue_didFinish");
    }
  }
  return result;
}

- (uint64_t)_finishBecomeStream:(void *)a3 forConnection:(uint64_t)a4 completionHandler:
{
  if (result)
  {
    uint64_t v6 = (unsigned char *)result;
    uint64_t v8 = 0;
    long long v7 = xmmword_18430B9E0;
    (*(void (**)(uint64_t, long long *))(a4 + 16))(a4, &v7);
    [a2 resume];
    result = [a3 resume];
    if (v6[925])
    {
      v6[925] = 0;
      objc_msgSend(a2, "setError:", objc_msgSend(v6, "error"));
      return objc_msgSend(a2, "_task_onqueue_didFinish");
    }
  }
  return result;
}

- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4
{
}

- (__NSCFLocalSessionTask)initWithBackgroundTaskInfo:(id)a3 taskGroup:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)__NSCFLocalSessionTask;
  uint64_t v5 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:](&v9, sel_initWithOriginalRequest_ident_taskGroup_, [a3 originalRequest], objc_msgSend(a3, "identifier"), a4);
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_connKeyLock._os_unfair_lock_opaque = 0;
    -[NSURLSessionTask updateCurrentRequest:](v5, "updateCurrentRequest:", [a3 currentRequest]);
    -[NSURLSessionTask setResponse:](v6, "setResponse:", [a3 response]);
    -[NSURLSessionTask setState:](v6, "setState:", [a3 state]);
    -[NSURLSessionTask setError:](v6, "setError:", [a3 error]);
    -[NSURLSessionTask setTaskIdentifier:](v6, "setTaskIdentifier:", [a3 identifier]);
    -[NSURLSessionTask setTaskDescription:](v6, "setTaskDescription:", [a3 taskDescription]);
    -[NSURLSessionTask setEarliestBeginDate:](v6, "setEarliestBeginDate:", [a3 earliestBeginDate]);
    -[NSURLSessionTask setCountOfBytesClientExpectsToSend:](v6, "setCountOfBytesClientExpectsToSend:", [a3 countOfBytesClientExpectsToSend]);
    -[NSURLSessionTask setCountOfBytesClientExpectsToReceive:](v6, "setCountOfBytesClientExpectsToReceive:", [a3 countOfBytesClientExpectsToReceive]);
    -[NSURLSessionTask set_uniqueIdentifier:](v6, "set_uniqueIdentifier:", [a3 uniqueIdentifier]);
    -[NSURLSessionTask set_storagePartitionIdentifier:](v6, "set_storagePartitionIdentifier:", [a3 storagePartitionIdentifier]);
    -[NSURLSessionTask set_pathToDownloadTaskFile:](v6, "set_pathToDownloadTaskFile:", [a3 pathToDownloadTaskFile]);
    if ([a3 taskKind] == 1)
    {
      id v7 = +[__NSCFResumableUploadState rusWithResumeData:originalRequest:](__NSCFResumableUploadState, "rusWithResumeData:originalRequest:", [a3 resumableUploadData], objc_msgSend(a3, "originalRequest"));
      if (v7) {
        [(NSURLSessionTask *)v6 setResumableUploadState:v7];
      }
    }
  }
  return v6;
}

@end