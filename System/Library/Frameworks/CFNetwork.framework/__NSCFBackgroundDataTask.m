@interface __NSCFBackgroundDataTask
- (BOOL)isKindOfClass:(Class)a3;
- (__NSCFBackgroundDataTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5;
- (id).cxx_construct;
- (void)_onqueue_captureStream:(void *)a1;
- (void)_onqueue_didFinishWithError:(id)a3;
- (void)_onqueue_didReceiveData:(void *)a3 withCompletion:;
- (void)_onqueue_finishStream:(uint64_t)a1;
- (void)_onqueue_needNewBodyStream:(uint64_t)a3 withCompletion:;
- (void)_onqueue_startReadingFromStream;
- (void)_onqueue_willSendRequestForEstablishedConnection:(id)a3 withCompletion:(id)a4;
- (void)dealloc;
@end

@implementation __NSCFBackgroundDataTask

- (id).cxx_construct
{
  *((void *)self + 98) = 0;
  *((void *)self + 99) = 0;
  return self;
}

- (__NSCFBackgroundDataTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)__NSCFBackgroundDataTask;
  v6 = [(__NSCFBackgroundSessionTask *)&v8 initWithOriginalRequest:a3 ident:a4 taskGroup:a5];
  if (v6) {
    v6->_initialStream = (NSInputStream *)(id)[a3 HTTPBodyStream];
  }
  return v6;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)__NSCFBackgroundDataTask;
  if (-[__NSCFBackgroundDataTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

- (void).cxx_destruct
{
  cntrl = self->_requestBody.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)dealloc
{
  ptr = self->_requestBody.__ptr_;
  if (ptr) {
    (*(void (**)(RequestBody *, SEL))(*(void *)ptr + 64))(ptr, a2);
  }

  v4.receiver = self;
  v4.super_class = (Class)__NSCFBackgroundDataTask;
  [(__NSCFBackgroundSessionTask *)&v4 dealloc];
}

- (void)_onqueue_didFinishWithError:(id)a3
{
  -[__NSCFBackgroundDataTask _onqueue_finishStream:]((uint64_t)self, 1u);
  v5.receiver = self;
  v5.super_class = (Class)__NSCFBackgroundDataTask;
  [(__NSCFBackgroundSessionTask *)&v5 _onqueue_didFinishWithError:a3];
}

- (void)_onqueue_finishStream:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)[(id)a1 workQueue]);
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  objc_super v4 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412546;
    uint64_t v20 = a1;
    __int16 v21 = 1024;
    LODWORD(v22) = a2;
    _os_log_debug_impl(&dword_184085000, v4, OS_LOG_TYPE_DEBUG, "%@ finish reading from stream (force stop: %{BOOL}d)", (uint8_t *)&v19, 0x12u);
  }
  if (*(void *)(a1 + 784))
  {
    if (!*(void *)(a1 + 824)) {
      goto LABEL_19;
    }
    objc_super v5 = (void *)[*(id *)(a1 + 800) propertyForKey:0x1EC09F718];
    if (!v5) {
      goto LABEL_19;
    }
    v6 = v5;
    if (![v5 count]) {
      goto LABEL_19;
    }
    uint64_t v7 = [(id)a1 session];
    uint64_t v8 = [(id)a1 taskIdentifier];
    if (!v7) {
      goto LABEL_19;
    }
    uint64_t v9 = v8;
    if (-[__NSURLBackgroundSession taskForIdentifier:]((id *)v7, v8))
    {
      [*(id *)(v7 + 168) setPropertyOnStreamWithIdentifier:v9 propDict:v6 propKey:0x1EC09F718 withReply:&__block_literal_global_221];
LABEL_19:
      if (*(unsigned char *)(a1 + 841))
      {
        *(unsigned char *)(a1 + 841) = 0;
        (*(void (**)(void))(**(void **)(a1 + 784) + 24))(*(void *)(a1 + 784));
      }
      (*(void (**)(void))(**(void **)(a1 + 784) + 64))(*(void *)(a1 + 784));
      v15 = *(std::__shared_weak_count **)(a1 + 792);
      *(void *)(a1 + 784) = 0;
      *(void *)(a1 + 792) = 0;
      if (v15) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v15);
      }

      *(void *)(a1 + 800) = 0;
      goto LABEL_24;
    }
    int v10 = [*(id *)(v7 + 112) _isProxySession];
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v11 = CFNLog::logger;
    BOOL v12 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (!v12) {
        goto LABEL_19;
      }
      uint64_t v13 = *(void *)(v7 + 128);
      int v19 = 138543618;
      uint64_t v20 = v13;
      __int16 v21 = 2048;
      uint64_t v22 = v9;
      v14 = "ProxySession <%{public}@> Cannot set property on data task with identifier %lu because there is no such task";
    }
    else
    {
      if (!v12) {
        goto LABEL_19;
      }
      uint64_t v18 = *(void *)(v7 + 128);
      int v19 = 138543618;
      uint64_t v20 = v18;
      __int16 v21 = 2048;
      uint64_t v22 = v9;
      v14 = "BackgroundSession <%{public}@> Cannot set property on data task with identifier %lu because there is no such task";
    }
    _os_log_debug_impl(&dword_184085000, v11, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v19, 0x16u);
    goto LABEL_19;
  }
LABEL_24:
  v16 = *(void **)(a1 + 816);
  if (v16)
  {

    *(void *)(a1 + 816) = 0;
  }
  v17 = *(NSObject **)(a1 + 824);
  if (v17)
  {
    *(void *)(a1 + 824) = 0;
    dispatch_io_close(v17, a2);
    dispatch_release(v17);
  }
}

- (void)_onqueue_willSendRequestForEstablishedConnection:(id)a3 withCompletion:(id)a4
{
  [(NSURLSessionTask *)self setCountOfBytesReceived:0];
  [(NSURLSessionTask *)self setCountOfBytesExpectedToReceive:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92____NSCFBackgroundDataTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke;
  v8[3] = &unk_1E5258340;
  v8[4] = a3;
  v8[5] = self;
  v8[6] = a4;
  if (self)
  {
    internalDelegateWrapper = self->super.super._internalDelegateWrapper;
    if (!internalDelegateWrapper) {
      internalDelegateWrapper = self->super.super._publicDelegateWrapper;
    }
  }
  else
  {
    internalDelegateWrapper = 0;
  }
  -[__NSCFURLSessionDelegateWrapper task:_willSendRequestForEstablishedConnection:completionHandler:]((uint64_t)internalDelegateWrapper, self, a3, v8);
}

- (void)_onqueue_captureStream:(void *)a1
{
  if (a1)
  {
    -[__NSCFBackgroundDataTask _onqueue_finishStream:]((uint64_t)a1, 1u);
    if (a2)
    {
      objc_super v4 = (void *)[MEMORY[0x1E4F28F48] pipe];
      a1[102] = (id)[v4 fileHandleForReading];
      id v5 = (id)[v4 fileHandleForWriting];
      dispatch_fd_t v6 = [v5 fileDescriptor];
      uint64_t v7 = [a1 workQueue];
      cleanup_handler[0] = MEMORY[0x1E4F143A8];
      cleanup_handler[1] = 3221225472;
      cleanup_handler[2] = __51____NSCFBackgroundDataTask__onqueue_captureStream___block_invoke;
      cleanup_handler[3] = &unk_1E5256400;
      cleanup_handler[4] = v5;
      uint64_t v8 = dispatch_io_create(0, v6, v7, cleanup_handler);
      a1[103] = v8;
      dispatch_io_set_low_water(v8, 0xFFFFFFFFFFFFFFFFLL);
      a1[100] = a2;
      CFRetain(a2);
      operator new();
    }
  }
}

- (void)_onqueue_needNewBodyStream:(uint64_t)a3 withCompletion:
{
  if (a1)
  {
    uint64_t v4 = a1[88];
    if (!v4) {
      uint64_t v4 = a1[87];
    }
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __70____NSCFBackgroundDataTask__onqueue_needNewBodyStream_withCompletion___block_invoke;
    v5[3] = &unk_1E5254EB8;
    char v6 = a2;
    v5[4] = a1;
    v5[5] = a3;
    -[__NSCFURLSessionDelegateWrapper task:needNewBodyStream:](v4, a1, v5);
  }
}

- (void)_onqueue_startReadingFromStream
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)[(id)a1 workQueue]);
    uint64_t v3 = *(void *)(a1 + 784);
    v2 = *(std::__shared_weak_count **)(a1 + 792);
    if (v2) {
      atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v3 && !*(unsigned char *)(a1 + 841))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      uint64_t v4 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v7 = a1;
        _os_log_debug_impl(&dword_184085000, v4, OS_LOG_TYPE_DEBUG, "%@ start reading from stream", buf, 0xCu);
      }
      *(unsigned char *)(a1 + 841) = 1;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __59____NSCFBackgroundDataTask__onqueue_startReadingFromStream__block_invoke;
      v5[3] = &unk_1E5254EE0;
      v5[4] = a1;
      (*(void (**)(uint64_t, void *))(*(void *)v3 + 16))(v3, v5);
    }
    if (v2) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v2);
    }
  }
}

- (void)_onqueue_didReceiveData:(void *)a3 withCompletion:
{
  if (a1)
  {
    objc_msgSend(a1, "setCountOfBytesReceived:", objc_msgSend(a1, "countOfBytesReceived") + objc_msgSend(a2, "length"));
    uint64_t v6 = a1[88];
    if (!v6) {
      uint64_t v6 = a1[87];
    }
    -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveData:completionHandler:](v6, a1, a2, a3);
  }
}

@end