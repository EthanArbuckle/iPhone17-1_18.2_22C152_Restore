@interface __NSCFURLLocalSessionConnection
- (__NSCFURLLocalSessionConnection)initWithTask:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (uint64_t)withDelegateAndPendingCompletion:(uint64_t)result;
- (uint64_t)withLoaderOnQueue:(uint64_t)result;
- (void)_ackBytes:(int64_t)a3;
- (void)_alternatePathAvailable:(int)a3;
- (void)_captureTransportConnection:(shared_ptr<TransportConnection>)a3 extraBytes:(id)a4;
- (void)_capturedSocketInputStream:(id)a3 outputStream:(id)a4;
- (void)_conditionalRequirementsChanged:(BOOL)a3;
- (void)_connectionIsWaitingWithReason:(int64_t)a3;
- (void)_didFinishWithError:(id)a3;
- (void)_didReceiveChallenge:(id)a3;
- (void)_didReceiveData:(id)a3;
- (void)_didReceiveInformationalResponse:(id)a3;
- (void)_didReceiveResponse:(id)a3 sniff:(BOOL)a4;
- (void)_didSendBodyData:(UploadProgressInfo *)a3;
- (void)_didUseCachedResponse;
- (void)_needNewBodyStream;
- (void)_needNewBodyStreamFromOffset:(int64_t)a3;
- (void)_redirectRequest:(id)a3 redirectResponse:(id)a4 completion:(id)a5;
- (void)_tick;
- (void)_tick_sniffNow;
- (void)_willSendRequestForEstablishedConnection:(id)a3 completion:(id)a4;
- (void)afterDelegateWithTick:(dispatch_queue_t *)a1;
- (void)cancel;
- (void)dealloc;
- (void)expectedProgressTargetChanged;
- (void)resume;
- (void)setBytesPerSecondLimit:(int64_t)a3;
- (void)setIsDownload:(BOOL)a3;
- (void)setPoolPriority:(int64_t)a3;
- (void)setPriorityHint:(float)a3 incremental:(BOOL)a4;
- (void)suspend;
- (void)withLoaderAsync:(id)a3;
@end

@implementation __NSCFURLLocalSessionConnection

- (uint64_t)withLoaderOnQueue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = *(void *)(result + 80);
    if (v3) {
      uint64_t v4 = v3 + 48;
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 136))(v4);
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v5);
    v6 = *(uint64_t (**)(uint64_t))(*(void *)v5 + 144);
    return v6(v5);
  }
  return result;
}

- (void)_didFinishWithError:(id)a3
{
  if (self->_state <= 1)
  {
    if (a3)
    {
      self->_state = 3;
      self->_pendingError = (NSError *)[a3 copy];
    }
    else
    {
      self->_state = 2;
    }
  }
  if (self->super._delegate && self->super._workQueue)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55____NSCFURLLocalSessionConnection__didFinishWithError___block_invoke;
    v4[3] = &unk_1E52536B8;
    v4[4] = self;
    -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v4);
  }
  -[__NSCFURLLocalSessionConnection _tick]((uint64_t)self);
}

- (void)_didReceiveData:(id)a3
{
  if (a3 && dispatch_data_get_size((dispatch_data_t)a3))
  {
    if (self->_sniffData)
    {
      conCatData((dispatch_object_t *)&self->_sniffData, (dispatch_object_t)a3);
    }
    else
    {
      conCatData((dispatch_object_t *)&self->_pendingData, (dispatch_object_t)a3);
      if (self->_maxDataSegmentCount)
      {
        uint64_t v12 = 0;
        v13 = &v12;
        uint64_t v14 = 0x2020000000;
        uint64_t v15 = 0;
        uint64_t v8 = 0;
        v9 = &v8;
        uint64_t v10 = 0x2020000000;
        uint64_t v11 = 0;
        pendingData = self->_pendingData;
        applier[0] = MEMORY[0x1E4F143A8];
        applier[1] = 3221225472;
        applier[2] = __51____NSCFURLLocalSessionConnection__didReceiveData___block_invoke;
        applier[3] = &unk_1E5257620;
        applier[4] = &v12;
        applier[5] = &v8;
        dispatch_data_apply(pendingData, applier);
        if (v13[3] > self->_maxDataSegmentCoalesceThreshhold && v9[3] > self->_maxDataSegmentCount)
        {
          alloc = dispatch_data_create_alloc();
          if (alloc) {
            dispatch_release(alloc);
          }
        }
        _Block_object_dispose(&v8, 8);
        _Block_object_dispose(&v12, 8);
      }
    }
    -[__NSCFURLLocalSessionConnection _tick]((uint64_t)self);
  }
}

- (void)_tick
{
  if (!a1) {
    return;
  }
  int v2 = *(_DWORD *)(a1 + 136);
  if ((v2 - 1) >= 2)
  {
    if (v2 != 3)
    {
      if (!v2)
      {
        *(_DWORD *)(a1 + 136) = 1;
        uint64_t v17 = MEMORY[0x1E4F143A8];
        uint64_t v18 = 3221225472;
        v19 = (void (*)(uint64_t *, uint64_t))__51____NSCFURLLocalSessionConnection__tick_initialize__block_invoke;
        v20 = &unk_1E5253600;
        uint64_t v21 = a1;
        uint64_t v3 = *(void *)(a1 + 80);
        if (v3) {
          uint64_t v4 = v3 + 48;
        }
        else {
          uint64_t v4 = 0;
        }
        uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 136))(v4);
        v19(&v17, v5);
        (*(void (**)(uint64_t))(*(void *)v5 + 144))(v5);
      }
      return;
    }
    if (*(uint64_t *)(a1 + 112) > 0) {
      return;
    }
    if (*(void *)(a1 + 128))
    {
      -[__NSCFURLSessionConnection _tossCache](a1);
      uint64_t v8 = *(NSObject **)(a1 + 152);
      if (v8)
      {
        dispatch_release(v8);
        *(void *)(a1 + 152) = 0;
      }
      v9 = *(void **)(a1 + 160);
      if (v9)
      {

        *(void *)(a1 + 160) = 0;
      }
    }
    if (*(void *)(a1 + 152)) {
      __assert_rtn("-[__NSCFURLLocalSessionConnection _tick_finishing]", "SessionConnection.mm", 892, "_sniffData == NULL");
    }
    uint64_t v10 = -[__NSCFURLSessionConnection _cachedResponse](a1);
    if (v10)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = (void (*)(uint64_t *, uint64_t))__50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke;
      v20 = &unk_1E5253708;
      uint64_t v21 = a1;
      v22 = v10;
LABEL_40:
      -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:](a1, (uint64_t)&v17);
      return;
    }
    *(_DWORD *)(a1 + 136) = 4;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = (void (*)(uint64_t *, uint64_t))__51____NSCFURLLocalSessionConnection__task_sendFinish__block_invoke;
    v20 = &unk_1E52536B8;
LABEL_39:
    uint64_t v21 = a1;
    goto LABEL_40;
  }
  if (*(uint64_t *)(a1 + 112) >= 1 && !*(unsigned char *)(a1 + 168)) {
    return;
  }
  v6 = *(NSObject **)(a1 + 152);
  if (v6)
  {
    if (dispatch_data_get_size(v6) > 0x1FF || v2 != 1) {
      -[__NSCFURLLocalSessionConnection _tick_sniffNow]((void *)a1);
    }
  }
  else
  {
    uint64_t v11 = *(NSObject **)(a1 + 104);
    if (v11)
    {
      if (v2 == 2)
      {
        uint64_t v12 = 0;
        *(void *)(a1 + 144) = 0;
        uint64_t v11 = *(NSObject **)(a1 + 104);
      }
      else
      {
        uint64_t v12 = *(void *)(a1 + 144);
      }
      size_t size = dispatch_data_get_size(v11);
      if (v12 >= 1 && size < v12) {
        return;
      }
      size_t v15 = size;
      *(void *)(a1 + 104) = 0;
      -[__NSCFURLSessionConnection _appendDataToCache:](a1, v11);
      int v16 = *(_DWORD *)(a1 + 192);
      *(_DWORD *)(a1 + 192) = v16 + 1;
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = (void (*)(uint64_t *, uint64_t))__48____NSCFURLLocalSessionConnection__tick_running__block_invoke;
      v20 = &unk_1E5253690;
      int v24 = v16;
      v22 = (NSCachedURLResponse *)v11;
      size_t v23 = v15;
      goto LABEL_39;
    }
    if (v2 == 2)
    {
      *(_DWORD *)(a1 + 136) = 3;
      -[__NSCFURLLocalSessionConnection _tick](a1);
    }
  }
}

- (uint64_t)withDelegateAndPendingCompletion:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = (void *)result;
    uint64_t v4 = *(NSObject **)(result + 16);
    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "_workQueue is NULL", v5, 2u);
        uint64_t v4 = v3[2];
      }
      else
      {
        uint64_t v4 = 0;
      }
    }
    dispatch_assert_queue_V2(v4);
    ++v3[14];
    return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, v3[3]);
  }
  return result;
}

- (void)_didReceiveResponse:(id)a3 sniff:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_didCheckMixedReplace)
  {
    if (!self->_isMixedReplace) {
      goto LABEL_11;
    }
  }
  else
  {
    self->_didCheckMixedReplace = 1;
    uint64_t v7 = *(void *)([a3 _inner] + 88);
    BOOL v8 = v7 && (*(_WORD *)(v7 + 297) & 0x8000) != 0;
    self->_isMixedReplace = v8;
    if (!v8) {
      goto LABEL_11;
    }
  }
  -[__NSCFURLSessionConnection _tossCache]((uint64_t)self);
  if (self->_sniffResponse) {
    -[__NSCFURLLocalSessionConnection _tick_sniffNow](self);
  }
LABEL_11:
  if (v4
    && !self->super._isFromCache
    && (v9 = [(NSURLSessionTask *)self->super._task currentRequest],
        HTTPSniffing::checkRequestAndUpdateResponseForSniffingPurposes((HTTPSniffing *)v9, (_CFURLRequest *)a3, v10)))
  {
    self->_sniffData = (OS_dispatch_data *)dispatch_data_create("", 0, 0, 0);
    self->_sniffResponse = (NSURLResponse *)[a3 copy];
  }
  else
  {
    if (self->_isMixedReplace) {
      [(__NSCFURLLocalSessionConnection *)self suspend];
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59____NSCFURLLocalSessionConnection__sendResponseToDelegate___block_invoke;
    v11[3] = &unk_1E5253708;
    v11[4] = a3;
    v11[5] = self;
    -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v11);
  }
}

- (void)afterDelegateWithTick:(dispatch_queue_t *)a1
{
  if (a1)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke;
    v2[3] = &unk_1E5258028;
    v2[4] = a1;
    v2[5] = a2;
    -[__NSCFURLSessionConnection withWorkQueueAsync:](a1, (const char *)v2);
  }
}

- (void)setPriorityHint:(float)a3 incremental:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63____NSCFURLLocalSessionConnection_setPriorityHint_incremental___block_invoke;
  v4[3] = &__block_descriptor_37_e29_v16__0__LoaderInterface_____8l;
  float v5 = a3;
  BOOL v6 = a4;
  [(__NSCFURLLocalSessionConnection *)self withLoaderAsync:v4];
}

- (void)setBytesPerSecondLimit:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58____NSCFURLLocalSessionConnection_setBytesPerSecondLimit___block_invoke;
  v3[3] = &__block_descriptor_40_e29_v16__0__LoaderInterface_____8l;
  v3[4] = a3;
  [(__NSCFURLLocalSessionConnection *)self withLoaderAsync:v3];
}

- (void)setPoolPriority:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51____NSCFURLLocalSessionConnection_setPoolPriority___block_invoke;
  v3[3] = &__block_descriptor_40_e29_v16__0__LoaderInterface_____8l;
  v3[4] = a3;
  [(__NSCFURLLocalSessionConnection *)self withLoaderAsync:v3];
}

- (void)_ackBytes:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45____NSCFURLLocalSessionConnection__ackBytes___block_invoke;
  v3[3] = &__block_descriptor_40_e29_v16__0__LoaderInterface_____8l;
  v3[4] = a3;
  -[__NSCFURLLocalSessionConnection withLoaderOnQueue:]((uint64_t)self, (uint64_t)v3);
}

- (void)cancel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41____NSCFURLLocalSessionConnection_cancel__block_invoke;
  v2[3] = &unk_1E5253600;
  v2[4] = self;
  [(__NSCFURLLocalSessionConnection *)self withLoaderAsync:v2];
}

- (void)resume
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41____NSCFURLLocalSessionConnection_resume__block_invoke;
  v2[3] = &unk_1E5253600;
  v2[4] = self;
  [(__NSCFURLLocalSessionConnection *)self withLoaderAsync:v2];
}

- (void)suspend
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42____NSCFURLLocalSessionConnection_suspend__block_invoke;
  v2[3] = &unk_1E5253600;
  v2[4] = self;
  [(__NSCFURLLocalSessionConnection *)self withLoaderAsync:v2];
}

- (void)withLoaderAsync:(id)a3
{
  workQueue = self->super._workQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51____NSCFURLLocalSessionConnection_withLoaderAsync___block_invoke;
  v4[3] = &unk_1E5258028;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)dealloc
{
  loader = self->_loader;
  if (loader)
  {
    (*((void (**)(URLConnectionLoader *, SEL))loader->var0 + 1))(loader, a2);
    self->_loader = 0;
  }
  loaderClient = self->_loaderClient;
  if (loaderClient)
  {
    (*((void (**)(SessionConnectionLoadable *, SEL))loaderClient->var0 + 1))(loaderClient, a2);
    self->_loaderClient = 0;
  }
  pendingError = self->_pendingError;
  if (pendingError)
  {

    self->_pendingError = 0;
  }
  pendingData = self->_pendingData;
  if (pendingData)
  {
    dispatch_release(pendingData);
    self->_pendingData = 0;
  }
  sniffData = self->_sniffData;
  if (sniffData)
  {
    dispatch_release(sniffData);
    self->_sniffData = 0;
  }
  sniffResponse = self->_sniffResponse;
  if (sniffResponse)
  {

    self->_sniffResponse = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)__NSCFURLLocalSessionConnection;
  [(__NSCFURLSessionConnection *)&v9 dealloc];
}

- (__NSCFURLLocalSessionConnection)initWithTask:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  *(void *)&v20[1] = self;
  *(void *)&v20[9] = __NSCFURLLocalSessionConnection;
  float v5 = objc_msgSendSuper2((objc_super *)&v20[1], sel_initWithTask_delegate_delegateQueue_, a3, a4, a5);
  uint64_t v7 = v5;
  if (v5)
  {
    v5[15] = 0;
    uint64_t v8 = v5[1];
    if (v8)
    {
      uint64_t v9 = *(void *)(v8 + 704);
      if (!v9) {
        uint64_t v9 = *(void *)(v8 + 696);
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    [(__NSCFURLSessionDelegateWrapper *)v9 _willSendRequestForEstablishedConnection];
    uint64_t v11 = v7[1];
    if (!v11) {
LABEL_27:
    }
      operator new();
    uint64_t v12 = *(void *)(v11 + 704);
    if (v12 || (uint64_t v12 = *(void *)(v11 + 696)) != 0)
    {
      if ([(__NSCFURLSessionDelegateWrapper *)(unsigned char *)v12 check__isWaitingForConnection_withError] & 1) != 0|| ([(__NSCFURLSessionDelegateWrapper *)*(unsigned char **)(v12 + 24) check__isWaitingForConnection_withError] & 1) != 0|| ([(__NSCFURLSessionDelegateWrapper *)(unsigned char *)v12 check__isWaitingForConnection_withoutError] & 1) != 0|| ([(__NSCFURLSessionDelegateWrapper *)*(unsigned char **)(v12 + 24) check__isWaitingForConnection_withoutError])
      {
LABEL_17:
        uint64_t v14 = v7[1];
        if (v14)
        {
          uint64_t v15 = *(void *)(v14 + 704);
          if ((v15 || (uint64_t v15 = *(void *)(v14 + 696)) != 0)
            && ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)v15 check__conditionalRequirementsChanged] & 1) == 0)
          {
            [(__NSCFURLSessionDelegateWrapper *)*(unsigned __int8 **)(v15 + 24) check__conditionalRequirementsChanged];
          }
          uint64_t v16 = v7[1];
          if (v16)
          {
            uint64_t v17 = *(void *)(v16 + 704);
            if ((v17 || (uint64_t v17 = *(void *)(v16 + 696)) != 0)
              && ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)v17 check__alternatePathAvailable] & 1) == 0)
            {
              [(__NSCFURLSessionDelegateWrapper *)*(unsigned __int8 **)(v17 + 24) check__alternatePathAvailable];
            }
          }
        }
        goto LABEL_27;
      }
      uint64_t v11 = v7[1];
      if (!v11) {
        goto LABEL_27;
      }
    }
    uint64_t v13 = *(void *)(v11 + 704);
    if ((v13 || (uint64_t v13 = *(void *)(v11 + 696)) != 0)
      && ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)v13 check_isWaitingForConnectivity] & 1) == 0)
    {
      [(__NSCFURLSessionDelegateWrapper *)*(unsigned __int8 **)(v13 + 24) check_isWaitingForConnectivity];
    }
    goto LABEL_17;
  }
  return 0;
}

- (void)setIsDownload:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49____NSCFURLLocalSessionConnection_setIsDownload___block_invoke;
  v3[3] = &__block_descriptor_33_e29_v16__0__LoaderInterface_____8l;
  BOOL v4 = a3;
  [(__NSCFURLLocalSessionConnection *)self withLoaderAsync:v3];
}

- (void)_didUseCachedResponse
{
  self->super._isFromCache = 1;
}

- (void)_didSendBodyData:(UploadProgressInfo *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52____NSCFURLLocalSessionConnection__didSendBodyData___block_invoke;
  v3[3] = &unk_1E5253758;
  void v3[4] = self;
  UploadProgressInfo v4 = *a3;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_didReceiveChallenge:(id)a3
{
  uint64_t v3 = (NSURLAuthenticationChallenge *)a3;
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "protectionSpace"), "_CFURLProtectionSpace");
  if (!v5)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v12 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_184085000, v12, OS_LOG_TYPE_ERROR, "_isPasswordBasedChallenge called with nil protection space", buf, 2u);
    }
    goto LABEL_14;
  }
  uint64_t v6 = v5;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1) {
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_10309);
  }
  if ((*(_DWORD *)(v6 + 72) - 1) > 5 || self->_didCheckCredentialsSuppliedInURL)
  {
LABEL_14:
    char v10 = 0;
    goto LABEL_15;
  }
  self->_didCheckCredentialsSuppliedInURL = 1;
  uint64_t v7 = [(NSURLSessionTask *)self->super._task currentRequest_URL];
  uint64_t v8 = [(NSURL *)v7 user];
  uint64_t v9 = [(NSURL *)v7 password];
  char v10 = 0;
  if (v8 && v9)
  {
    char v10 = 1;
    uint64_t v11 = +[NSURLCredential credentialWithUser:v8 password:v9 persistence:1];
    self->_actuallyTriedCredentialsSuppliedInURL = 1;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke;
    v14[3] = &unk_1E52582F0;
    v14[4] = self;
    v14[5] = v3;
    v14[6] = v11;
    -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v14);
  }
LABEL_15:
  if (self->_actuallyTriedCredentialsSuppliedInURL
    && [(NSURLAuthenticationChallenge *)v3 previousFailureCount] == 1
    && [(NSURLAuthenticationChallenge *)v3 proposedCredential]
    && [(NSString *)[(NSURLCredential *)[(NSURLAuthenticationChallenge *)v3 proposedCredential] user] isEqualToString:[[(NSURLSessionTask *)self->super._task currentRequest_URL] user]]&& [(NSString *)[(NSURLCredential *)[(NSURLAuthenticationChallenge *)v3 proposedCredential] password] isEqualToString:[[(NSURLSessionTask *)self->super._task currentRequest_URL] password]])
  {
    uint64_t v3 = [[NSURLAuthenticationChallenge alloc] initWithProtectionSpace:[(NSURLAuthenticationChallenge *)v3 protectionSpace] proposedCredential:0 previousFailureCount:1 failureResponse:[(NSURLAuthenticationChallenge *)v3 failureResponse] error:[(NSURLAuthenticationChallenge *)v3 error] sender:[(NSURLAuthenticationChallenge *)v3 sender]];
  }
  if ((v10 & 1) == 0)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_3;
    v13[3] = &unk_1E5253708;
    v13[4] = v3;
    v13[5] = self;
    -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v13);
  }
}

- (void)_willSendRequestForEstablishedConnection:(id)a3 completion:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke;
  v4[3] = &unk_1E5253780;
  void v4[4] = self;
  void v4[5] = a4;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v4);
}

- (void)_tick_sniffNow
{
  if (a1)
  {
    int v2 = (_CFURLResponse *)a1[20];
    uint64_t v3 = a1[19];
    a1[20] = 0;
    a1[19] = 0;
    if (v3) {
      CFRetain(v3);
    }
    uint64_t v4 = *(void *)([(_CFURLResponse *)v2 _inner] + 88);
    CFDataRef v5 = (const __CFData *)v3;
    if (v4)
    {
      CFDataRef v5 = (const __CFData *)v3;
      if (((*(unsigned __int16 *)(v4 + 297) | (*(unsigned __int8 *)(v4 + 299) << 16)) & 0x10000) != 0)
      {
        uint64_t v6 = CFURLDataDecoderCreateWithResponse((const __CFAllocator *)*MEMORY[0x1E4F1CF80], v2);
        CFDataRef v5 = (const __CFData *)v3;
        if (v6)
        {
          uint64_t v7 = v6;
          char v11 = 0;
          uint64_t v8 = CFURLDataDecoderDecodeData((uint64_t)v6, (uint64_t)v3, (uint64_t)&v11);
          if (v8) {
            CFDataRef v5 = (const __CFData *)v8;
          }
          else {
            CFDataRef v5 = (const __CFData *)v3;
          }
          if (v3) {
            BOOL v9 = v8 == 0;
          }
          else {
            BOOL v9 = 1;
          }
          if (!v9)
          {
            CFDataRef v10 = (const __CFData *)v8;
            CFRelease(v3);
            CFDataRef v5 = v10;
          }
          CFRelease(v7);
        }
      }
    }
    URLResponse::guessMIMEType((URLResponse *)[(_CFURLResponse *)v2 _inner], v5);
    if (v5) {
      CFRelease(v5);
    }
    [a1 _didReceiveResponse:v2 sniff:0];
    [a1 _didReceiveData:v3];

    dispatch_release(v3);
  }
}

- (void)_captureTransportConnection:(shared_ptr<TransportConnection>)a3 extraBytes:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3321888768;
  v6[2] = __74____NSCFURLLocalSessionConnection__captureTransportConnection_extraBytes___block_invoke;
  v6[3] = &unk_1ECFA9C30;
  uint64_t v5 = *(void *)a3.__ptr_;
  uint64_t v4 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  v6[4] = self;
  v6[6] = v5;
  uint64_t v7 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v6[5] = a3.__cntrl_;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v6);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v7);
  }
}

- (void)_capturedSocketInputStream:(id)a3 outputStream:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75____NSCFURLLocalSessionConnection__capturedSocketInputStream_outputStream___block_invoke;
  v4[3] = &unk_1E5253938;
  void v4[4] = self;
  void v4[5] = a3;
  void v4[6] = a4;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v4);
}

- (void)_needNewBodyStreamFromOffset:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke;
  v3[3] = &unk_1E52537A8;
  void v3[4] = self;
  void v3[5] = a3;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_needNewBodyStream
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke;
  v2[3] = &unk_1E52536B8;
  v2[4] = self;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v2);
}

- (void)_redirectRequest:(id)a3 redirectResponse:(id)a4 completion:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke;
  v5[3] = &unk_1E5253848;
  v5[4] = a4;
  v5[5] = a3;
  v5[6] = self;
  v5[7] = a5;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v5);
}

- (void)_alternatePathAvailable:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59____NSCFURLLocalSessionConnection__alternatePathAvailable___block_invoke;
  v3[3] = &unk_1E52537F8;
  void v3[4] = self;
  int v4 = a3;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_conditionalRequirementsChanged:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67____NSCFURLLocalSessionConnection__conditionalRequirementsChanged___block_invoke;
  v3[3] = &unk_1E52537D0;
  BOOL v4 = a3;
  void v3[4] = self;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_connectionIsWaitingWithReason:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66____NSCFURLLocalSessionConnection__connectionIsWaitingWithReason___block_invoke;
  v3[3] = &unk_1E52537A8;
  void v3[4] = self;
  void v3[5] = a3;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_didReceiveInformationalResponse:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68____NSCFURLLocalSessionConnection__didReceiveInformationalResponse___block_invoke;
  v3[3] = &unk_1E5253708;
  void v3[4] = a3;
  void v3[5] = self;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)expectedProgressTargetChanged
{
}

@end