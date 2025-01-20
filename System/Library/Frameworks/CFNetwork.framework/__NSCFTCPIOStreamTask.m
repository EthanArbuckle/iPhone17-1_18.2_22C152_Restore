@interface __NSCFTCPIOStreamTask
- (BOOL)_onqueue_sendSessionChallenge:(id)a3 completionHandler:(id)a4;
- (BOOL)_onqueue_usingProxy;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)shouldDoWorkConsideringTlsState;
- (NSData)_initialDataPayload;
- (__NSCFTCPIOStreamTask)initWithHost:(id)a3 port:(int64_t)a4 taskGroup:(id)a5 disavow:(id)a6;
- (__NSCFTCPIOStreamTask)initWithTask:(id)a3 connection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5 disavow:(id)a6;
- (id).cxx_construct;
- (id)_onqueue_errorOrCancelError;
- (id)workQueue;
- (void)_onSessionQueue_cleanupAndBreakCycles;
- (void)_onSessionQueue_disavow;
- (void)_onqueue_addBlockOp:(id)a3 description:(const char *)a4;
- (void)_onqueue_addBlockOp:(id)a3 description:(const char *)a4 shouldWaitForTls:(BOOL)a5;
- (void)_onqueue_adjustLoadingPoolPriority;
- (void)_onqueue_adjustPoolPriority;
- (void)_onqueue_callbackCompletedWork;
- (void)_onqueue_cancel;
- (void)_onqueue_captureStreams;
- (void)_onqueue_checkForCompletion;
- (void)_onqueue_cleanUpConnectionEstablishmentState;
- (void)_onqueue_closeRead;
- (void)_onqueue_closeWrite;
- (void)_onqueue_connectionEstablishedWithError:(id)a3 callbackReferent:(id)a4;
- (void)_onqueue_dealWithSessionClientCertAuth:(int64_t)a3 credential:(id)a4 completionHandler:(id)a5;
- (void)_onqueue_dealWithSessionTrustAuth:(int64_t)a3 credential:(id)a4 completionHandler:(id)a5;
- (void)_onqueue_ioTick;
- (void)_onqueue_needClientCert:(id)a3 completionHandler:(id)a4;
- (void)_onqueue_needServerTrust:(id)a3 completionHandler:(id)a4;
- (void)_onqueue_postConnectConfiguration:(id)a3 parameters:(id)a4 completionHandler:(id)a5;
- (void)_onqueue_preConnectionConfiguration:(id)a3 parameters:(id)a4 completionHandler:(id)a5;
- (void)_onqueue_processReadWork:(id)a3;
- (void)_onqueue_processWriteWork:(id)a3;
- (void)_onqueue_resume;
- (void)_onqueue_setTransportConnection:(shared_ptr<TransportConnection>)a3;
- (void)_onqueue_startSecureConnection;
- (void)_onqueue_stopSecureConnection;
- (void)_onqueue_suspend;
- (void)_onqueue_timeoutOccured;
- (void)_onqueue_tlsCompletion;
- (void)_onqueue_tlsDisabled;
- (void)cancel;
- (void)captureStreams;
- (void)closeRead;
- (void)closeWrite;
- (void)copyStreamProperty:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)readDataOfMinLength:(unint64_t)a3 maxLength:(unint64_t)a4 timeout:(double)a5 completionHandler:(id)a6;
- (void)set_initialDataPayload:(id)a3;
- (void)startSecureConnection;
- (void)stopSecureConnection;
- (void)writeData:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
@end

@implementation __NSCFTCPIOStreamTask

- (id).cxx_construct
{
  *((void *)self + 96) = 0;
  *((void *)self + 97) = 0;
  *((void *)self + 98) = 0;
  *((void *)self + 99) = 0;
  *((void *)self + 102) = 0;
  *((void *)self + 103) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_httpProtocol.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_ios.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v4);
  }
  v5 = self->_establish.__cntrl_;
  if (v5)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v5);
  }
}

- (void)set_initialDataPayload:(id)a3
{
}

- (NSData)_initialDataPayload
{
  return (NSData *)objc_getProperty(self, a2, 808, 1);
}

- (void)_onSessionQueue_cleanupAndBreakCycles
{
  writeTimer = self->_writeTimer;
  if (writeTimer)
  {
    -[CFNetworkTimer cancelTimer]((uint64_t)writeTimer);

    self->_writeTimer = 0;
  }
  readTimer = self->_readTimer;
  if (readTimer)
  {
    -[CFNetworkTimer cancelTimer]((uint64_t)readTimer);

    self->_readTimer = 0;
  }
  objc_setProperty_nonatomic(self, a2, 0, 936);
  objc_setProperty_nonatomic(self, v5, 0, 928);
  v6.receiver = self;
  v6.super_class = (Class)__NSCFTCPIOStreamTask;
  [(NSURLSessionTask *)&v6 _onSessionQueue_cleanupAndBreakCycles];
}

- (void)_onSessionQueue_disavow
{
  disavow = (void (**)(id, __NSCFTCPIOStreamTask *))self->_disavow;
  if (disavow)
  {
    self->_disavow = 0;
    disavow[2](disavow, self);
    _Block_release(disavow);
  }
}

- (void)_onqueue_adjustLoadingPoolPriority
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    int v3 = 138412546;
    uint64_t v4 = objc_opt_class();
    __int16 v5 = 2080;
    Name = sel_getName(a2);
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%@ - %s - can only be used with -captureStreams", (uint8_t *)&v3, 0x16u);
  }
}

- (void)_onqueue_adjustPoolPriority
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    int v3 = 138412546;
    uint64_t v4 = objc_opt_class();
    __int16 v5 = 2080;
    Name = sel_getName(a2);
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%@ - %s - can only be used with -captureStreams", (uint8_t *)&v3, 0x16u);
  }
}

- (void)_onqueue_suspend
{
  self->_completedSuspendedWork = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];

  [(NSURLSessionTask *)self setState:1];
}

- (void)_onqueue_connectionEstablishedWithError:(id)a3 callbackReferent:(id)a4
{
  int var1 = a3.var1;
  int64_t var0 = a3.var0;
  $C9A20311543CE7131523B4F7AC24AF8E valuePtr = a3;
  if ([(NSURLSessionTask *)self error])
  {
    -[NSURLSession _onqueue_didCompleteTask:withError:]((uint64_t)[(NSURLSessionTask *)self session], self, [(NSURLSessionTask *)self error]);
    [(NSURLSessionTask *)self setState:3];
    return;
  }
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
  if (!-[__NSCFURLSessionDelegateWrapper didBecomeInputOutputStream]((uint64_t)internalDelegateWrapper, v8)|| !objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "_allowTCPIOConnectionStreamTask"))
  {
    if (var0 && var1)
    {
      [(NSURLSessionTask *)self setError:__cfnCreateCFErrorWithStreamError((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (int *)&valuePtr)];
      self->_connectionState = 4;
      self->_secure = 0;
      [(__NSCFTCPIOStreamTask *)self _onqueue_checkForCompletion];
    }
    else
    {
      self->_connectionState = 2;
    }
    [(__NSCFTCPIOStreamTask *)self _onqueue_ioTick];
    return;
  }
  if (!var0 || !var1)
  {
    std::allocate_shared[abi:nn180100]<TCPIO_Delegate,std::allocator<TCPIO_Delegate>,std::shared_ptr<TransportConnectionObjCPP> &,void>(&v27, (uint64_t)self->_ios.__ptr_, (std::__shared_weak_count *)self->_ios.__cntrl_);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3321888768;
    v22 = __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_3;
    v23 = &unk_1ECFA8ED8;
    uint64_t v14 = v27;
    v13 = v28;
    uint64_t v25 = v27;
    v26 = v28;
    if (v28) {
      atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v24 = a4;
    v10 = (void *)CFReadStreamCreate();
    v18[7] = MEMORY[0x1E4F143A8];
    v18[8] = 3321888768;
    v18[9] = __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_4;
    v18[10] = &unk_1ECFA8F10;
    v18[12] = v14;
    v19 = v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v18[11] = a4;
    v11 = (void *)CFWriteStreamCreate();
    if (v19) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v19);
    }
    if (v26) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v26);
    }
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v13);
    }
    [(NSURLSessionTask *)self setState:3];
    goto LABEL_31;
  }
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  v36 = __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke;
  v37 = &__block_descriptor_48_e26__v16__0____CFReadStream__8l;
  $C9A20311543CE7131523B4F7AC24AF8E v38 = valuePtr;
  v10 = (void *)CFReadStreamCreate();
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_2;
  v32 = &__block_descriptor_48_e27__v16__0____CFWriteStream__8l;
  $C9A20311543CE7131523B4F7AC24AF8E v33 = valuePtr;
  v11 = (void *)CFWriteStreamCreate();
  [(NSURLSessionTask *)self setState:3];
  if (self)
  {
LABEL_31:
    publicDelegateWrapper = self->super._internalDelegateWrapper;
    if (!publicDelegateWrapper) {
      publicDelegateWrapper = self->super._publicDelegateWrapper;
    }
    goto LABEL_33;
  }
  publicDelegateWrapper = 0;
LABEL_33:
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_5;
  v18[3] = &unk_1E5255EB0;
  v18[5] = v10;
  v18[6] = v11;
  v18[4] = self;
  -[__NSCFURLSessionDelegateWrapper streamTask:didBecomeInputStream:outputStream:completionHandler:]((uint64_t)publicDelegateWrapper, self, v10, v11, v18);
  if (v10) {
    CFRelease(v10);
  }
  if (v11) {
    CFRelease(v11);
  }
  ptr = self->_establish.__ptr_;
  if (ptr)
  {
    (*(void (**)(TCPIO_EstablishBase *))(*(void *)ptr + 32))(ptr);
    cntrl = self->_establish.__cntrl_;
    self->_establish.__ptr_ = 0;
    self->_establish.__cntrl_ = 0;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
    }
  }
  v17 = self->_ios.__cntrl_;
  self->_ios.__ptr_ = 0;
  self->_ios.__cntrl_ = 0;
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v17);
  }
}

- (void)_onqueue_cleanUpConnectionEstablishmentState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_receivedServerTrustChallenge)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    int v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      v13 = [(NSURLSessionTask *)self _loggableDescription];
      _os_log_impl(&dword_184085000, v3, OS_LOG_TYPE_DEFAULT, "Stream%{public}@ is complete and received server trust, marking as secure", (uint8_t *)&v12, 0xCu);
    }
    self->_goneSecure = 1;
  }
  p_httpProtocol = &self->_httpProtocol;
  if (self->_httpProtocol.__ptr_)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    __int16 v5 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v6 = [(NSURLSessionTask *)self _loggableDescription];
      int v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_184085000, v5, OS_LOG_TYPE_DEFAULT, "Stream%{public}@ has completed HTTP protocol connection establishment", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v7 = (std::__shared_weak_count *)*((void *)p_httpProtocol->__ptr_ + 102);
    *(_OWORD *)((char *)p_httpProtocol->__ptr_ + 808) = 0u;
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v7);
    }
    cntrl = self->_httpProtocol.__cntrl_;
    p_httpProtocol->__ptr_ = 0;
    self->_httpProtocol.__cntrl_ = 0;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
    }
  }
  ptr = self->_ios.__ptr_;
  if (ptr)
  {
    uint64_t v10 = *((void *)ptr + 3);
    v11 = *(std::__shared_weak_count **)(v10 + 152);
    *(void *)(v10 + 144) = 0;
    *(void *)(v10 + 152) = 0;
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v11);
    }
  }
}

- (void)_onqueue_tlsDisabled
{
  if ([(NSURLSessionTask *)self state] != NSURLSessionTaskStateCompleted
    && (objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "_allowTCPIOConnectionStreamTask") & 1) == 0)
  {
    self->_goneSecure = 0;
    [(__NSCFTCPIOStreamTask *)self _onqueue_ioTick];
  }
}

- (void)_onqueue_tlsCompletion
{
  if ([(NSURLSessionTask *)self state] != NSURLSessionTaskStateCompleted
    && (objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "_allowTCPIOConnectionStreamTask") & 1) == 0)
  {
    self->_goneSecure = 1;
    [(__NSCFTCPIOStreamTask *)self _onqueue_ioTick];
  }
}

- (void)_onqueue_setTransportConnection:(shared_ptr<TransportConnection>)a3
{
  ptr = a3.__ptr_;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  __int16 v5 = self->_ios.__ptr_;
  uint64_t v6 = *(void *)a3.__ptr_;
  uint64_t v7 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  if (v7)
  {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v8 = (std::__shared_weak_count *)*((void *)v5 + 4);
  *((void *)v5 + 3) = v6;
  *((void *)v5 + 4) = v7;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v8);
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v7);
  }

  uint64_t v9 = *((void *)self->_ios.__ptr_ + 3);
  uint64_t v10 = *(OS_dispatch_queue **)(v9 + 120);
  if (v10) {
    dispatch_retain(*(dispatch_object_t *)(v9 + 120));
  }
  self->_workQueueForStreamTask = v10;
  if (self->_secure)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v11 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      v13 = [(NSURLSessionTask *)self _loggableDescription];
      _os_log_impl(&dword_184085000, v11, OS_LOG_TYPE_DEFAULT, "Stream%{public}@ enabling TLS", (uint8_t *)&v12, 0xCu);
    }
    (*(void (**)(void, uint64_t))(**(void **)ptr + 24))(*(void *)ptr, 1);
  }
}

- (void)_onqueue_postConnectConfiguration:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
}

- (void)_onqueue_dealWithSessionClientCertAuth:(int64_t)a3 credential:(id)a4 completionHandler:(id)a5
{
  if ((unint64_t)(a3 - 2) < 2)
  {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
    [(__NSCFTCPIOStreamTask *)self _onqueue_cancel];
  }
  else
  {
    if (a3 != 1)
    {
      if (a3) {
        return;
      }
      if (a4)
      {
        CFMutableArrayRef Mutable = (CFMutableArrayRef)[a4 _CFURLCredential];
        if (!Mutable) {
          goto LABEL_22;
        }
        if (URLCredential::Class(void)::sOnce_URLCredential != -1) {
          dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_10148);
        }
        if (*((_DWORD *)Mutable + 12) == 3)
        {
          uint64_t v7 = (char *)Mutable + 16;
          v8 = (const void *)(*(uint64_t (**)(uint64_t))(*((void *)Mutable + 2) + 120))((uint64_t)Mutable + 16);
          if (v8)
          {
            CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
            CFArrayAppendValue(Mutable, v8);
            CFArrayRef v9 = (const __CFArray *)(*(uint64_t (**)(char *))(*(void *)v7 + 112))(v7);
            CFArrayRef v10 = v9;
            if (v9 && CFArrayGetCount(v9) >= 1)
            {
              CFContainerEnumeratorBase::setup((unint64_t)v14, v10, MEMORY[0x1E4F1C1E0], (uint64_t (*)(CFTypeRef, unint64_t))CFContainerEnumeratorBase::_claimArrayData);
              uint64_t v17 = 0;
              while (1)
              {
                uint64_t v11 = v17;
                if (v17 >= v15) {
                  break;
                }
                ++v17;
                CFArrayAppendValue(Mutable, *(const void **)(v16 + 8 * v11));
              }
              CFContainerEnumeratorBase::~CFContainerEnumeratorBase((CFContainerEnumeratorBase *)v14);
            }
            goto LABEL_22;
          }
        }
      }
      CFMutableArrayRef Mutable = 0;
LABEL_22:
      (*((void (**)(id, CFMutableArrayRef))a5 + 2))(a5, Mutable);
      if (Mutable) {
        CFRelease(Mutable);
      }
      return;
    }
    v13 = (void (*)(id, void))*((void *)a5 + 2);
    v13(a5, 0);
  }
}

- (void)_onqueue_needClientCert:(id)a3 completionHandler:(id)a4
{
  if ([(NSURLSessionTask *)self state] < NSURLSessionTaskStateCanceling)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67____NSCFTCPIOStreamTask__onqueue_needClientCert_completionHandler___block_invoke;
    v8[3] = &unk_1E52573F0;
    v8[4] = self;
    v8[5] = a3;
    v8[6] = a4;
    if (![(__NSCFTCPIOStreamTask *)self _onqueue_sendSessionChallenge:a3 completionHandler:v8])(*((void (**)(id, void))a4 + 2))(a4, 0); {
  }
    }
  else
  {
    uint64_t v7 = (void (*)(id, void))*((void *)a4 + 2);
    v7(a4, 0);
  }
}

- (void)_onqueue_needServerTrust:(id)a3 completionHandler:(id)a4
{
  self->_receivedServerTrustChallenge = 1;
  if ([(NSURLSessionTask *)self state] < NSURLSessionTaskStateCanceling)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68____NSCFTCPIOStreamTask__onqueue_needServerTrust_completionHandler___block_invoke;
    v8[3] = &unk_1E52573F0;
    v8[4] = self;
    v8[5] = a3;
    v8[6] = a4;
    if (![(__NSCFTCPIOStreamTask *)self _onqueue_sendSessionChallenge:a3 completionHandler:v8])(*((void (**)(id, void, void))a4 + 2))(a4, 0, 0); {
  }
    }
  else
  {
    uint64_t v7 = (void (*)(id, void, uint64_t))*((void *)a4 + 2);
    v7(a4, 0, 1);
  }
}

- (BOOL)_onqueue_sendSessionChallenge:(id)a3 completionHandler:(id)a4
{
  if (self)
  {
    internalDelegateWrapper = self->super._internalDelegateWrapper;
    if (!internalDelegateWrapper) {
      internalDelegateWrapper = self->super._publicDelegateWrapper;
    }
    int v9 = [(__NSCFURLSessionDelegateWrapper *)(uint64_t)internalDelegateWrapper sessionDidReceiveChallenge];
    CFArrayRef v10 = self->super._internalDelegateWrapper;
    if (v10)
    {
      if (!v9)
      {
LABEL_9:
        if ([(__NSCFURLSessionDelegateWrapper *)(uint64_t)v10 didReceiveChallenge])
        {
          publicDelegateWrapper = self->super._internalDelegateWrapper;
          if (!publicDelegateWrapper) {
            publicDelegateWrapper = self->super._publicDelegateWrapper;
          }
          goto LABEL_12;
        }
        return 0;
      }
    }
    else
    {
      CFArrayRef v10 = self->super._publicDelegateWrapper;
      if ((v9 & 1) == 0) {
        goto LABEL_9;
      }
    }
LABEL_8:
    -[__NSCFURLSessionDelegateWrapper didReceiveChallenge:completionHandler:]((uint64_t)v10, a3, a4);
    return 1;
  }
  char v14 = [(__NSCFURLSessionDelegateWrapper *)0 sessionDidReceiveChallenge];
  CFArrayRef v10 = 0;
  if (v14) {
    goto LABEL_8;
  }
  char v15 = [(__NSCFURLSessionDelegateWrapper *)0 didReceiveChallenge];
  publicDelegateWrapper = 0;
  if (v15)
  {
LABEL_12:
    -[__NSCFURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:]((uint64_t)publicDelegateWrapper, self, a3, a4);
    return 1;
  }
  return 0;
}

- (void)_onqueue_dealWithSessionTrustAuth:(int64_t)a3 credential:(id)a4 completionHandler:(id)a5
{
  if ((unint64_t)(a3 - 2) < 2)
  {
    (*((void (**)(id, uint64_t, uint64_t, id))a5 + 2))(a5, 2, 1, a4);
    [(__NSCFTCPIOStreamTask *)self _onqueue_cancel];
  }
  else
  {
    if (a3 == 1)
    {
      uint64_t v6 = (void (*)(id, uint64_t, void))*((void *)a5 + 2);
      id v7 = a5;
      uint64_t v5 = 0;
    }
    else
    {
      if (a3) {
        return;
      }
      if (a4) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = 2;
      }
      uint64_t v6 = (void (*)(id, uint64_t, void))*((void *)a5 + 2);
      id v7 = a5;
    }
    v6(v7, v5, 0);
  }
}

- (void)_onqueue_preConnectionConfiguration:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (__CFNUseNWHTTPSProxies::useProxyOnce != -1) {
    dispatch_once(&__CFNUseNWHTTPSProxies::useProxyOnce, &__block_literal_global_16_5533);
  }
  if (__CFNUseNWHTTPSProxies::useNWHTTPSProxy)
  {
    int v9 = [(NSURLRequest *)[(NSURLSessionTask *)self originalRequest] URL];
    if (v9) {
      ProxyConnectionEstablishment::SetProxyURL((const __CFURL *)v9, (uint64_t)a3, (uint64_t)a4);
    }
    if ([(NSURLSessionTask *)self _proxySettings])
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      CFArrayRef v10 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138543362;
        int v12 = [(NSURLSessionTask *)self _loggableDescription];
        _os_log_debug_impl(&dword_184085000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ has custom proxy settings", (uint8_t *)&v11, 0xCu);
      }
      ProxyConnectionEstablishment::SetProxies((uint64_t)a3, (uint64_t)a4, (uint64_t)[(NSURLSessionTask *)self _proxySettings]);
    }
  }
  (*((void (**)(id))a5 + 2))(a5);
}

- (void)cancel
{
  int v3 = [(__NSCFTCPIOStreamTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31____NSCFTCPIOStreamTask_cancel__block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_onqueue_checkForCompletion
{
  if ([(NSURLSessionTask *)self state] <= NSURLSessionTaskStateCanceling)
  {
    p_ios = &self->_ios;
    if (self->_ios.__ptr_)
    {
      if ([(NSURLSessionTask *)self state] <= NSURLSessionTaskStateSuspended) {
        [(NSURLSessionTask *)self setState:2];
      }
      ptr = p_ios->__ptr_;
      if (p_ios->__ptr_)
      {
        if (self->_secure)
        {
          (*(void (**)(TCPIO_EstablishBase *))(*(void *)self->_establish.__ptr_ + 56))(self->_establish.__ptr_);
          self->_secure = 0;
          self->_goneSecure = 0;
          ptr = p_ios->__ptr_;
        }
        uint64_t v6 = *((void *)ptr + 3);
        if (v6 && !*((unsigned char *)ptr + 40))
        {
          *((unsigned char *)ptr + 40) = 1;
          (*(void (**)(uint64_t, void))(*(void *)v6 + 152))(v6, 0);
        }
        self->_connectionState = 4;
        cntrl = self->_ios.__cntrl_;
        p_ios->__ptr_ = 0;
        self->_ios.__cntrl_ = 0;
        if (cntrl) {
          std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
        }
      }
      if (self->_captureStreamsUponCompletion)
      {
        [(NSURLSessionTask *)(uint64_t)self _resetTaskDelegate];
      }
      else
      {
        -[NSURLSession _onqueue_didCompleteTask:withError:]((uint64_t)[(NSURLSessionTask *)self session], self, [(NSURLSessionTask *)self error]);
        -[__NSURLSessionLocal removeUnresumedTask:]((uint64_t)[(NSURLSessionTask *)self session], (uint64_t)self);
      }
      [(NSURLSessionTask *)self setState:3];
      [(__NSCFTCPIOStreamTask *)self _onqueue_ioTick];
    }
  }
}

- (void)_onqueue_cancel
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40____NSCFTCPIOStreamTask__onqueue_cancel__block_invoke;
  v4[3] = &unk_1E5258228;
  v4[4] = self;
  if (self->_connectionState > 1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __40____NSCFTCPIOStreamTask__onqueue_cancel__block_invoke_2;
    v3[3] = &unk_1E5257FD8;
    v3[4] = v4;
    [(__NSCFTCPIOStreamTask *)self _onqueue_addBlockOp:v3 description:"Cancel"];
    [(__NSCFTCPIOStreamTask *)self _onqueue_ioTick];
  }
  else
  {
    __40____NSCFTCPIOStreamTask__onqueue_cancel__block_invoke((uint64_t)v4);
  }
}

- (void)_onqueue_resume
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NSURLSessionTask *)self state] == NSURLSessionTaskStateCompleted)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    int v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl(&dword_184085000, v3, OS_LOG_TYPE_ERROR, "[API MISUSE]: Resuming URLSessionStreamTaskk after task has completed", (uint8_t *)&v14, 2u);
    }
    return;
  }
  if (self->_establish.__ptr_)
  {
    if (![(NSURLSessionTask *)self _TCPConnectionMetadata]) {
      goto LABEL_20;
    }
    ptr = self->_ios.__ptr_;
    cntrl = self->_ios.__cntrl_;
    if (cntrl)
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
      std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
      if (!ptr) {
        goto LABEL_20;
      }
      ptr = self->_ios.__ptr_;
      uint64_t v6 = self->_ios.__cntrl_;
      if (v6)
      {
        char v7 = 0;
        atomic_fetch_add_explicit((atomic_ullong *volatile)v6 + 1, 1uLL, memory_order_relaxed);
        goto LABEL_18;
      }
    }
    else
    {
      if (!ptr) {
        goto LABEL_20;
      }
      uint64_t v6 = 0;
    }
    char v7 = 1;
LABEL_18:
    (*(void (**)(void, uint64_t, NSData *))(**((void **)ptr + 3) + 200))(*((void *)ptr + 3), 0x1EC09FF30, [(NSURLSessionTask *)self _TCPConnectionMetadata]);
    if ((v7 & 1) == 0) {
      std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v6);
    }
LABEL_20:
    if (self->__initialDataPayload)
    {
      int v9 = self->_ios.__ptr_;
      v8 = self->_ios.__cntrl_;
      if (v8)
      {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v8 + 1, 1uLL, memory_order_relaxed);
        std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v8);
        if (v9)
        {
          int v9 = self->_ios.__ptr_;
          CFArrayRef v10 = self->_ios.__cntrl_;
          if (v10)
          {
            char v11 = 0;
            atomic_fetch_add_explicit((atomic_ullong *volatile)v10 + 1, 1uLL, memory_order_relaxed);
            goto LABEL_28;
          }
LABEL_27:
          char v11 = 1;
LABEL_28:
          (*(void (**)(void, uint64_t, NSData *))(**((void **)v9 + 3) + 200))(*((void *)v9 + 3), 0x1EC09F788, self->__initialDataPayload);
          if ((v11 & 1) == 0) {
            std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v10);
          }
        }
      }
      else if (v9)
      {
        CFArrayRef v10 = 0;
        goto LABEL_27;
      }
    }
    if ([(__NSCFTCPIOStreamTask *)self _onqueue_usingProxy])
    {
      uint64_t v12 = HTTPProtocol::_instantiateProtocol(*MEMORY[0x1E4F1CF80], &self->super, 0, 1);
      if (v12)
      {
        uint64_t v13 = (const void *)v12;
        if (TCFObject<URLProtocol>::Class(void)::sOnce != -1) {
          dispatch_once(&TCFObject<URLProtocol>::Class(void)::sOnce, &__block_literal_global_328);
        }
        CFRetain(v13);
        operator new();
      }
    }
    if (self->_connectionState == 2)
    {
      [(__NSCFTCPIOStreamTask *)self _onqueue_ioTick];
    }
    else
    {
      -[__NSURLSessionLocal addConnectionlessTask:]((uint64_t)[(NSURLSessionTask *)self session], (uint64_t)self);
      (*(void (**)(TCPIO_EstablishBase *, BOOL))(*(void *)self->_establish.__ptr_ + 24))(self->_establish.__ptr_, self->_secure != 0);
      self->_connectionState = 1;
    }
    if (self->_completedSuspendedWork) {
      [(__NSCFTCPIOStreamTask *)self _onqueue_callbackCompletedWork];
    }
    return;
  }

  [(__NSCFTCPIOStreamTask *)self _onqueue_cancel];
}

- (BOOL)_onqueue_usingProxy
{
  if (__CFNUseNWHTTPSProxies::useProxyOnce != -1) {
    dispatch_once(&__CFNUseNWHTTPSProxies::useProxyOnce, &__block_literal_global_16_5533);
  }
  if (__CFNUseNWHTTPSProxies::useNWHTTPSProxy) {
    return 0;
  }
  if ([(NSURLSessionTask *)self _proxySettings])
  {
    uint64_t v4 = [(NSURLSessionTask *)self _proxySettings];
    if (!v4)
    {
      uint64_t v6 = 0;
      goto LABEL_13;
    }
    uint64_t v5 = (__CFDictionary *)CFRetain(v4);
    goto LABEL_11;
  }
  if (!__sProxyOverrideDict || (uint64_t v6 = (__CFDictionary *)CFRetain((CFTypeRef)__sProxyOverrideDict)) == 0)
  {
    uint64_t v5 = CFNetworkCopySystemProxySettings();
LABEL_11:
    uint64_t v6 = v5;
  }
LABEL_13:
  char v7 = [(NSURLRequest *)[(NSURLSessionTask *)self originalRequest] URL];
  if (v6 && v7)
  {
    CFArrayRef v8 = (const __CFArray *)__CFNetworkCopyProxiesForURLWithInterface((const __CFURL *)v7, v6, 0);
    CFArrayRef v9 = v8;
    if (v8)
    {
      if (CFArrayGetCount(v8) >= 1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v9, 0);
        if (ValueAtIndex)
        {
          CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"kCFProxyTypeKey");
          CFStringRef v12 = Value;
          if (!Value)
          {
LABEL_28:
            CFRelease(v9);
            goto LABEL_29;
          }
          if (CFEqual(Value, @"kCFProxyTypeHTTPS")
            || CFEqual(v12, @"kCFProxyTypeAutoConfigurationURL")
            || CFEqual(v12, @"kCFProxyTypeAutoConfigurationJavaScript")
            || CFEqual(v12, @"kCFProxyTypeSOCKS"))
          {
            LOBYTE(v12) = 1;
            goto LABEL_28;
          }
        }
      }
      LOBYTE(v12) = 0;
      goto LABEL_28;
    }
    LOBYTE(v12) = 0;
LABEL_29:
    CFRelease(v6);
    return (char)v12;
  }
  LOBYTE(v12) = 0;
  BOOL result = 0;
  if (v6) {
    goto LABEL_29;
  }
  return result;
}

- (id)_onqueue_errorOrCancelError
{
  if (![(NSURLSessionTask *)self error]) {
    -[NSURLSessionTask setError:](self, "setError:", [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-999 userInfo:0]);
  }

  return [(NSURLSessionTask *)self error];
}

- (void)_onqueue_processReadWork:(id)a3
{
  if (self) {
    objc_setProperty_nonatomic(self, a2, a3, 936);
  }
  if ([(NSURLSessionTask *)self error])
  {
    (*(void (**)(void, void, void, NSError *))(*((void *)a3 + 7) + 16))(*((void *)a3 + 7), 0, 0, [(NSURLSessionTask *)self error]);
    goto LABEL_8;
  }
  if ([(NSURLSessionTask *)self state] == NSURLSessionTaskStateCompleted || self->_receivedEof)
  {
    (*(void (**)(void, void, uint64_t, void))(*((void *)a3 + 7) + 16))(*((void *)a3 + 7), 0, 1, 0);
    goto LABEL_8;
  }
  if (!*((_DWORD *)a3 + 11) && !*((_DWORD *)a3 + 12))
  {
    (*(void (**)(void, uint64_t, void, void))(*((void *)a3 + 7) + 16))(*((void *)a3 + 7), [MEMORY[0x1E4F1C9B8] data], 0, 0);
LABEL_8:
    if (!*((unsigned char *)a3 + 40))
    {
      [(__NSCFTCPIOStreamTask *)self _onqueue_ioTick];
    }
    return;
  }
  double v5 = *((double *)a3 + 2);
  self->_readInProgress = v5 != 0.0;
  if (!*((unsigned char *)a3 + 41)) {
    -[CFNetworkTimer setTimer:]((uint64_t)self->_readTimer, v5);
  }
  ptr = self->_ios.__ptr_;
  uint64_t v7 = *((unsigned int *)a3 + 11);
  uint64_t v8 = *((unsigned int *)a3 + 12);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50____NSCFTCPIOStreamTask__onqueue_processReadWork___block_invoke;
  v9[3] = &unk_1E5254BB0;
  v9[4] = self;
  v9[5] = a3;
  TransportConnectionObjCPP::read((uint64_t)ptr, v7, v8, (uint64_t)v9);
}

- (void)_onqueue_processWriteWork:(id)a3
{
  if (self) {
    objc_setProperty_nonatomic(self, a2, a3, 928);
  }
  if ([(NSURLSessionTask *)self error]
    || [(NSURLSessionTask *)self state] == NSURLSessionTaskStateCompleted)
  {
    if (!*((unsigned char *)a3 + 40)) {
      (*(void (**)(void, NSError *))(*((void *)a3 + 8) + 16))(*((void *)a3 + 8), [(NSURLSessionTask *)self error]);
    }
    goto LABEL_7;
  }
  size_t v5 = [*((id *)a3 + 6) length];
  uint64_t v6 = (void *)*((void *)a3 + 6);
  if (!v5)
  {

    (*(void (**)(void, void))(*((void *)a3 + 8) + 16))(*((void *)a3 + 8), 0);
LABEL_7:
    [(__NSCFTCPIOStreamTask *)self _onqueue_ioTick];
    return;
  }
  uint64_t v7 = dispatch_data_create((const void *)[v6 bytes], v5, 0, 0);

  double v8 = *((double *)a3 + 2);
  self->_writeInProgress = v8 != 0.0;
  if (!*((unsigned char *)a3 + 41)) {
    -[CFNetworkTimer setTimer:]((uint64_t)self->_writeTimer, v8);
  }
  ptr = self->_ios.__ptr_;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51____NSCFTCPIOStreamTask__onqueue_processWriteWork___block_invoke;
  v10[3] = &unk_1E5254B88;
  v10[4] = self;
  v10[5] = a3;
  TransportConnectionObjCPP::write((uint64_t)ptr, (uint64_t)v7, (uint64_t)v10);
  dispatch_release(v7);
}

- (void)_onqueue_callbackCompletedWork
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  completedSuspendedWork = self->_completedSuspendedWork;
  uint64_t v3 = [(NSMutableArray *)completedSuspendedWork countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(completedSuspendedWork);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = objc_opt_class();
        if (v8 == objc_opt_class())
        {
          (*(void (**)(void))(*(void *)(v7 + 64) + 16))();
        }
        else
        {
          CFArrayRef v9 = *(void **)(v7 + 64);
          (*(void (**)(void))(*(void *)(v7 + 56) + 16))();
        }
      }
      uint64_t v4 = [(NSMutableArray *)completedSuspendedWork countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  self->_completedSuspendedWork = 0;
}

- (void)_onqueue_timeoutOccured
{
  self->_writeError.domain = 1;
  self->_writeError.error = 60;
  self->_readError.domain = 1;
  self->_readError.error = 60;
  [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:self->_writeError.error userInfo:0];
  currentWriteTask = self->_currentWriteTask;
  if (currentWriteTask)
  {
    (*((void (**)(void))currentWriteTask->_completion + 2))();
    self->_currentWriteTask->super._hasBeenCalledBack = 1;
    objc_setProperty_nonatomic(self, v4, 0, 928);
  }
  currentReadTask = self->_currentReadTask;
  if (currentReadTask)
  {
    (*((void (**)(void))currentReadTask->_completion + 2))();
    self->_currentReadTask->super._hasBeenCalledBack = 1;
    objc_setProperty_nonatomic(self, v6, 0, 936);
  }
  self->_writeInProgress = 0;
  self->_readInProgress = 0;
  -[CFNetworkTimer setTimer:]((uint64_t)self->_writeTimer, 0.0);
  readTimer = self->_readTimer;

  -[CFNetworkTimer setTimer:]((uint64_t)readTimer, 0.0);
}

- (void)_onqueue_ioTick
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_doingWorkOnThisQueue)
  {
    uint64_t v3 = [(__NSCFTCPIOStreamTask *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40____NSCFTCPIOStreamTask__onqueue_ioTick__block_invoke;
    block[3] = &unk_1E5258228;
    block[4] = self;
    dispatch_async(v3, block);
    return;
  }
  if ([(NSURLSessionTask *)self state] != NSURLSessionTaskStateSuspended && self->_connectionState >= 2)
  {
    if (self->_doingWorkOnThisQueue) {
      __assert_rtn("-[__NSCFTCPIOStreamTask _onqueue_ioTick]", "LocalTCPIOStreamTask.mm", 1916, "_doingWorkOnThisQueue == false");
    }
    self->_doingWorkOnThisQueue = 1;
    if ([(NSURLSessionTask *)self state] != NSURLSessionTaskStateSuspended)
    {
      pendingWork = self->_pendingWork;
      self->_pendingWork = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v5 = [(NSMutableArray *)pendingWork countByEnumeratingWithState:&v13 objects:v22 count:16];
      if (!v5) {
        goto LABEL_31;
      }
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (1)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(pendingWork);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = objc_opt_class();
          if (v10 == objc_opt_class())
          {
            if (!self->_writeInProgress
              && [(__NSCFTCPIOStreamTask *)self shouldDoWorkConsideringTlsState])
            {
              [(__NSCFTCPIOStreamTask *)self _onqueue_processWriteWork:v9];
              continue;
            }
            goto LABEL_28;
          }
          if (v10 == objc_opt_class())
          {
            if (!self->_readInProgress
              && [(__NSCFTCPIOStreamTask *)self shouldDoWorkConsideringTlsState])
            {
              [(__NSCFTCPIOStreamTask *)self _onqueue_processReadWork:v9];
              continue;
            }
            goto LABEL_28;
          }
          if (v10 != objc_opt_class())
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              uint64_t v11 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              uint64_t v19 = v11;
              __int16 v20 = 2112;
              uint64_t v21 = v9;
              _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "class %@ not  known for %@", buf, 0x16u);
            }
LABEL_28:
            [(NSMutableArray *)self->_pendingWork addObject:v9];
            continue;
          }
          if (!v9) {
            continue;
          }
          if (*(unsigned char *)(v9 + 56)
            && ![(__NSCFTCPIOStreamTask *)self shouldDoWorkConsideringTlsState])
          {
            goto LABEL_28;
          }
          uint64_t v12 = *(void *)(v9 + 48);
          if (v12) {
            (*(void (**)(void))(v12 + 16))();
          }
        }
        uint64_t v6 = [(NSMutableArray *)pendingWork countByEnumeratingWithState:&v13 objects:v22 count:16];
        if (!v6)
        {
LABEL_31:

          break;
        }
      }
    }
    self->_doingWorkOnThisQueue = 0;
  }
}

- (BOOL)shouldDoWorkConsideringTlsState
{
  return !self->_secure || self->_goneSecure;
}

- (void)_onqueue_addBlockOp:(id)a3 description:(const char *)a4 shouldWaitForTls:(BOOL)a5
{
  uint64_t v7 = +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, a3, (uint64_t)a4);
  uint64_t v8 = v7;
  if (v7) {
    *((unsigned char *)v7 + 56) = a5;
  }
  pendingWork = self->_pendingWork;

  [(NSMutableArray *)pendingWork addObject:v8];
}

- (void)_onqueue_addBlockOp:(id)a3 description:(const char *)a4
{
  uint64_t v5 = +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, a3, (uint64_t)a4);
  pendingWork = self->_pendingWork;

  [(NSMutableArray *)pendingWork addObject:v5];
}

- (void)_onqueue_captureStreams
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke;
  v4[3] = &unk_1E5258228;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_2;
  v3[3] = &unk_1E5258028;
  v3[4] = self;
  void v3[5] = v4;
  [(__NSCFTCPIOStreamTask *)self _onqueue_addBlockOp:v3 description:"captureStreams" shouldWaitForTls:1];
  [(__NSCFTCPIOStreamTask *)self _onqueue_ioTick];
}

- (void)_onqueue_closeWrite
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke;
  v4[3] = &unk_1E5258228;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke_3;
  v3[3] = &unk_1E5257FD8;
  v3[4] = v4;
  [(__NSCFTCPIOStreamTask *)self _onqueue_addBlockOp:v3 description:"closeWrite"];
  [(__NSCFTCPIOStreamTask *)self _onqueue_ioTick];
}

- (void)_onqueue_closeRead
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke;
  v4[3] = &unk_1E5258228;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke_3;
  v3[3] = &unk_1E5257FD8;
  v3[4] = v4;
  [(__NSCFTCPIOStreamTask *)self _onqueue_addBlockOp:v3 description:"closeRead"];
  [(__NSCFTCPIOStreamTask *)self _onqueue_ioTick];
}

- (void)_onqueue_startSecureConnection
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55____NSCFTCPIOStreamTask__onqueue_startSecureConnection__block_invoke;
  v3[3] = &unk_1E5258228;
  v3[4] = self;
  [(__NSCFTCPIOStreamTask *)self _onqueue_addBlockOp:v3 description:"startSecureConnection"];
  [(__NSCFTCPIOStreamTask *)self _onqueue_ioTick];
  self->_secure = 1;
}

- (void)_onqueue_stopSecureConnection
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54____NSCFTCPIOStreamTask__onqueue_stopSecureConnection__block_invoke;
  v3[3] = &unk_1E5258228;
  v3[4] = self;
  [(__NSCFTCPIOStreamTask *)self _onqueue_addBlockOp:v3 description:"stopSecureConnection"];
  [(__NSCFTCPIOStreamTask *)self _onqueue_ioTick];
  self->_secure = 0;
}

- (void)stopSecureConnection
{
  if ([(NSURLSessionTask *)self state] == NSURLSessionTaskStateCompleted)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_184085000, v3, OS_LOG_TYPE_ERROR, "[API MISUSE]: Attempting to stopSecureConnection on a URLSessionStreamTask after task has completed", buf, 2u);
    }
  }
  else
  {
    SEL v4 = [(__NSCFTCPIOStreamTask *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45____NSCFTCPIOStreamTask_stopSecureConnection__block_invoke;
    block[3] = &unk_1E5258228;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (void)startSecureConnection
{
  if ([(NSURLSessionTask *)self state] == NSURLSessionTaskStateCompleted)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_184085000, v3, OS_LOG_TYPE_ERROR, "[API MISUSE]: Attempting to startSecureConnection on a URLSessionStreamTask after task has completed", buf, 2u);
    }
  }
  else if ((objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "_allowTCPIOConnectionStreamTask") & 1) != 0|| !self->_ios.__ptr_)
  {
    self->_secure = 1;
  }
  else
  {
    SEL v4 = [(__NSCFTCPIOStreamTask *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46____NSCFTCPIOStreamTask_startSecureConnection__block_invoke;
    block[3] = &unk_1E5258228;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (void)copyStreamProperty:(id)a3 completionHandler:(id)a4
{
  uint64_t v7 = [(__NSCFTCPIOStreamTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62____NSCFTCPIOStreamTask_copyStreamProperty_completionHandler___block_invoke;
  block[3] = &unk_1E52581A0;
  block[4] = a3;
  void block[5] = self;
  block[6] = a4;
  dispatch_async(v7, block);
}

- (void)closeRead
{
  if ([(NSURLSessionTask *)self state] == NSURLSessionTaskStateCompleted)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_184085000, v3, OS_LOG_TYPE_ERROR, "[API MISUSE]: Attempting to closeRead on a URLSessionStreamTask after task has completed", buf, 2u);
    }
  }
  else
  {
    SEL v4 = [(__NSCFTCPIOStreamTask *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34____NSCFTCPIOStreamTask_closeRead__block_invoke;
    block[3] = &unk_1E5258228;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (void)closeWrite
{
  if ([(NSURLSessionTask *)self state] == NSURLSessionTaskStateCompleted)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_184085000, v3, OS_LOG_TYPE_ERROR, "[API MISUSE]: Attempting to closeWrite on a URLSessionStreamTask after task has completed", buf, 2u);
    }
  }
  else
  {
    SEL v4 = [(__NSCFTCPIOStreamTask *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35____NSCFTCPIOStreamTask_closeWrite__block_invoke;
    block[3] = &unk_1E5258228;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (void)captureStreams
{
  self->_captureStreamsUponCompletion = 1;
  if ((objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "_allowTCPIOConnectionStreamTask") & 1) == 0)
  {
    if ([(NSURLSessionTask *)self state] == NSURLSessionTaskStateCompleted)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      uint64_t v3 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_184085000, v3, OS_LOG_TYPE_ERROR, "[API MISUSE]: Capture streams called on a URLSessionStreamTask after task has completed", buf, 2u);
      }
    }
    else
    {
      SEL v4 = [(__NSCFTCPIOStreamTask *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39____NSCFTCPIOStreamTask_captureStreams__block_invoke;
      block[3] = &unk_1E5258228;
      block[4] = self;
      dispatch_async(v4, block);
    }
  }
}

- (void)writeData:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  uint64_t v9 = [(__NSCFTCPIOStreamTask *)self workQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke;
  v10[3] = &unk_1E52573A0;
  v10[5] = a3;
  void v10[6] = a5;
  v10[4] = self;
  *(double *)&v10[7] = a4;
  dispatch_async(v9, v10);
}

- (void)readDataOfMinLength:(unint64_t)a3 maxLength:(unint64_t)a4 timeout:(double)a5 completionHandler:(id)a6
{
  uint64_t v11 = [(__NSCFTCPIOStreamTask *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke;
  block[3] = &unk_1E5257350;
  block[4] = self;
  void block[5] = a6;
  block[6] = a3;
  void block[7] = a4;
  *(double *)&block[8] = a5;
  dispatch_async(v11, block);
}

- (void)dealloc
{
  p_establish = &self->_establish;
  -[__NSURLSessionLocal removeUnresumedTask:]((uint64_t)[(NSURLSessionTask *)self session], (uint64_t)self);
  if (p_establish->__ptr_)
  {
    (*(void (**)(TCPIO_EstablishBase *))(*(void *)p_establish->__ptr_ + 32))(p_establish->__ptr_);
    cntrl = (std::__shared_weak_count *)p_establish->__cntrl_;
    p_establish->__ptr_ = 0;
    p_establish->__cntrl_ = 0;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
    }
  }
  workQueueForStreamTask = self->_workQueueForStreamTask;
  if (workQueueForStreamTask)
  {
    dispatch_release(workQueueForStreamTask);
    self->_workQueueForStreamTask = 0;
  }

  self->_pendingWork = 0;
  self->__initialDataPayload = 0;

  self->_currentWriteTask = 0;
  self->_currentReadTask = 0;
  v6.receiver = self;
  v6.super_class = (Class)__NSCFTCPIOStreamTask;
  [(NSURLSessionTask *)&v6 dealloc];
}

- (__NSCFTCPIOStreamTask)initWithTask:(id)a3 connection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5 disavow:(id)a6
{
  ptr = a4.__ptr_;
  v13.receiver = self;
  v13.super_class = (Class)__NSCFTCPIOStreamTask;
  uint64_t v8 = [(NSURLSessionTask *)&v13 initWithTask:a3];
  if (v8)
  {
    uint64_t v9 = *(OS_dispatch_queue **)(*(void *)ptr + 120);
    if (v9) {
      dispatch_retain(*(dispatch_object_t *)(*(void *)ptr + 120));
    }
    v8->_workQueueForStreamTask = v9;
    v8->_disavow = _Block_copy(a5);
    uint64_t v10 = [(__NSCFTCPIOStreamTask *)v8 workQueue];
    uint64_t v11 = (char *)operator new(0x50uLL);
    *((void *)v11 + 1) = 0;
    *((void *)v11 + 2) = 0;
    *(void *)uint64_t v11 = &unk_1ECFA6BF0;
    TransportConnectionObjCPP::TransportConnectionObjCPP((TransportConnectionObjCPP *)(v11 + 24), v10);
  }
  return 0;
}

- (id)workQueue
{
  id result = self->_workQueueForStreamTask;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)__NSCFTCPIOStreamTask;
    return [(NSURLSessionTask *)&v4 workQueue];
  }
  return result;
}

- (__NSCFTCPIOStreamTask)initWithHost:(id)a3 port:(int64_t)a4 taskGroup:(id)a5 disavow:(id)a6
{
  id v11 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v11 setScheme:0x1EC0A5D78];
  [v11 setHost:a3];
  objc_msgSend(v11, "setPort:", objc_msgSend(NSNumber, "numberWithInteger:", a4));
  uint64_t v12 = -[NSURLRequest initWithURL:]([NSURLRequest alloc], "initWithURL:", [v11 URL]);
  v18.receiver = self;
  v18.super_class = (Class)__NSCFTCPIOStreamTask;
  objc_super v13 = [(NSURLSessionTask *)&v18 initWithOriginalRequest:v12 ident:0 taskGroup:a5];
  long long v14 = v13;
  if (v13)
  {
    [(NSURLSessionTask *)v13 updateCurrentRequest:v12];
    v14->_disavow = _Block_copy(a6);
    v14->_workQueueForStreamTask = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CFNetwork.StreamTaskConnection", 0);
    long long v15 = (void *)nw_context_copy_implicit_context();
    nw_queue_context_target_dispatch_queue();
    nw_release(v15);
    long long v16 = (char *)operator new(0x50uLL);
    *((void *)v16 + 1) = 0;
    *((void *)v16 + 2) = 0;
    *(void *)long long v16 = &unk_1ECFA6BF0;
    TransportConnectionObjCPP::TransportConnectionObjCPP((TransportConnectionObjCPP *)(v16 + 24), v14->_workQueueForStreamTask);
  }
  return 0;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)__NSCFTCPIOStreamTask;
  if (-[__NSCFTCPIOStreamTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

@end