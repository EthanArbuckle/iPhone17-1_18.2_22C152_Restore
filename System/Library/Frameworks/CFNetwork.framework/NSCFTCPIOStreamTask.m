@interface NSCFTCPIOStreamTask
@end

@implementation NSCFTCPIOStreamTask

__n128 __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke(__n128 *a1, uint64_t a2)
{
  v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 32, 0);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  __n128 result = a1[2];
  *(void *)v4 = &unk_1ECFA4858;
  *((void *)v4 + 1) = a2;
  v4[1] = result;
  return result;
}

__n128 __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_2(__n128 *a1, uint64_t a2)
{
  v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 32, 0);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  __n128 result = a1[2];
  *(void *)v4 = &unk_1ECFA4BA8;
  *((void *)v4 + 1) = a2;
  v4[1] = result;
  return result;
}

_OWORD *__82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 152, 0);
  v5 = v4;
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  v4[4] = 0u;
  v4[5] = 0u;
  v4[6] = 0u;
  v4[7] = 0u;
  v4[8] = 0u;
  *((void *)v4 + 18) = 0;
  v6 = *(std::__shared_weak_count **)(a1 + 48);
  v8[0] = *(void *)(a1 + 40);
  v8[1] = (uint64_t)v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  __NSCFTCPIOReadStream::__NSCFTCPIOReadStream((uint64_t)v4, a2, v8, *(void **)(a1 + 32));
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v6);
  }
  return v5;
}

_OWORD *__82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_4(uint64_t a1, uint64_t a2)
{
  v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 120, 0);
  v5 = v4;
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  v4[4] = 0u;
  v4[5] = 0u;
  v4[6] = 0u;
  *((void *)v4 + 14) = 0;
  v6 = *(std::__shared_weak_count **)(a1 + 48);
  v8[0] = *(void *)(a1 + 40);
  v8[1] = (uint64_t)v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  __NSCFTCPIOWriteStream::__NSCFTCPIOWriteStream((uint64_t)v4, a2, v8, *(void **)(a1 + 32));
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v6);
  }
  return v5;
}

uint64_t __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_disavow");
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_onSessionQueue_cleanupAndBreakCycles");
}

void __67____NSCFTCPIOStreamTask__onqueue_needClientCert_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67____NSCFTCPIOStreamTask__onqueue_needClientCert_completionHandler___block_invoke_2;
  block[3] = &unk_1E52573C8;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v10 = a2;
  block[4] = v7;
  block[5] = a3;
  long long v9 = *(_OWORD *)(a1 + 40);
  dispatch_async(v6, block);
}

uint64_t __67____NSCFTCPIOStreamTask__onqueue_needClientCert_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  v2 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) _loggableDescription];
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v3;
    __int16 v9 = 1024;
    int v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_184085000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ auth completion disp=%d cred=%p", (uint8_t *)&v7, 0x1Cu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_dealWithSessionClientCertAuth:credential:completionHandler:", *(void *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 56));
}

void __68____NSCFTCPIOStreamTask__onqueue_needServerTrust_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68____NSCFTCPIOStreamTask__onqueue_needServerTrust_completionHandler___block_invoke_2;
  block[3] = &unk_1E52573C8;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v10 = a2;
  block[4] = v7;
  block[5] = a3;
  long long v9 = *(_OWORD *)(a1 + 40);
  dispatch_async(v6, block);
}

uint64_t __68____NSCFTCPIOStreamTask__onqueue_needServerTrust_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  v2 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) _loggableDescription];
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v3;
    __int16 v9 = 1024;
    int v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_184085000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ auth completion disp=%d cred=%p", (uint8_t *)&v7, 0x1Cu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_dealWithSessionTrustAuth:credential:completionHandler:", *(void *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 56));
}

uint64_t __31____NSCFTCPIOStreamTask_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancel");
}

uint64_t __40____NSCFTCPIOStreamTask__onqueue_cancel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result <= 1)
  {
    [*(id *)(a1 + 32) setState:2];
    *(_DWORD *)(*(void *)(a1 + 32) + 852) = 3;
    objc_msgSend(*(id *)(a1 + 32), "setError:", objc_msgSend(MEMORY[0x1E4F290A8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F289A0], -999, 0));
    uint64_t v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_onqueue_checkForCompletion");
  }
  return result;
}

uint64_t __40____NSCFTCPIOStreamTask__onqueue_cancel__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50____NSCFTCPIOStreamTask__onqueue_processReadWork___block_invoke(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  uint64_t v8 = (void *)MEMORY[0x1E4F28798];
  if (a5)
  {
    __int16 v9 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:a5 userInfo:0];
    if (a3)
    {
LABEL_3:
      BOOL v10 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    __int16 v9 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  BOOL v10 = [v9 domain] == *v8 && objc_msgSend(v9, "code") == 57;
LABEL_8:
  *(unsigned char *)(*(void *)(a1 + 32) + 908) = v10;
  uint64_t v11 = *(void *)(a1 + 32);
  if (!a2 && *(unsigned char *)(v11 + 908)) {
    __int16 v9 = 0;
  }
  -[CFNetworkTimer setTimer:](*(void *)(v11 + 920), 0.0);
  uint64_t v12 = [*(id *)(a1 + 32) state];
  uint64_t v14 = *(void *)(a1 + 40);
  if (v12 == 1)
  {
    *(void *)(v14 + 64) = a2;
    *(void *)(*(void *)(a1 + 40) + 32) = v9;
    [*(id *)(*(void *)(a1 + 32) + 840) addObject:*(void *)(a1 + 40)];
  }
  else if (!*(unsigned char *)(v14 + 40))
  {
    (*(void (**)(void))(*(void *)(v14 + 56) + 16))();
  }
  objc_setProperty_nonatomic(*(id *)(a1 + 32), v13, 0, 936);
  *(unsigned char *)(*(void *)(a1 + 32) + 880) = 0;
  v15 = *(void **)(a1 + 32);

  return objc_msgSend(v15, "_onqueue_ioTick");
}

uint64_t __51____NSCFTCPIOStreamTask__onqueue_processWriteWork___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:a3 userInfo:0];
  }
  else {
    uint64_t v4 = 0;
  }
  -[CFNetworkTimer setTimer:](*(void *)(*(void *)(a1 + 32) + 912), 0.0);
  uint64_t v5 = [*(id *)(a1 + 32) state];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v5 == 1)
  {
    *(void *)(v7 + 32) = v4;
    [*(id *)(*(void *)(a1 + 32) + 840) addObject:*(void *)(a1 + 40)];
  }
  else if (!*(unsigned char *)(v7 + 40))
  {
    (*(void (**)(void))(*(void *)(v7 + 64) + 16))();
  }
  objc_setProperty_nonatomic(*(id *)(a1 + 32), v6, 0, 928);
  *(unsigned char *)(*(void *)(a1 + 32) + 905) = 0;
  uint64_t v8 = *(void **)(a1 + 32);

  return objc_msgSend(v8, "_onqueue_ioTick");
}

uint64_t __40____NSCFTCPIOStreamTask__onqueue_ioTick__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_ioTick");
}

uint64_t __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 857) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_ioTick");
}

void __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 768) + 64))(*(void *)(*(void *)(a1 + 32) + 768));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 784);
  if (v4)
  {
    std::allocate_shared[abi:nn180100]<TCPIO_Delegate,std::allocator<TCPIO_Delegate>,std::shared_ptr<TransportConnectionObjCPP> &,void>(v51, v4, *(std::__shared_weak_count **)(v3 + 792));
    v6 = (TCPIO_Delegate *)v51[0];
    uint64_t v5 = (std::__shared_weak_count *)v51[1];
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else
  {
    v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = [(id)v3 error];
  uint64_t v8 = *(unsigned char **)(a1 + 32);
  if (v7 || v8[881])
  {
    uint64_t v9 = [v8 error];
    BOOL v10 = *(void **)(a1 + 32);
    if (v9)
    {
      uint64_t v11 = _CFStreamErrorFromCFError((__CFError *)[v10 error]);
    }
    else
    {
      uint64_t v13 = v10 + 108;
      uint64_t v11 = v10[108];
      uint64_t v12 = v13[1];
    }
    uint64_t v45 = MEMORY[0x1E4F143A8];
    uint64_t v46 = 3221225472;
    v47 = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_3;
    v48 = &__block_descriptor_48_e26__v16__0____CFReadStream__8l;
    uint64_t v49 = v11;
    uint64_t v50 = v12;
    uint64_t v14 = (void *)CFReadStreamCreate();
    if (v6) {
      TCPIO_Delegate::closeReadSide(v6);
    }
  }
  else
  {
    uint64_t v38 = MEMORY[0x1E4F143A8];
    uint64_t v39 = 3321888768;
    v40 = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_4;
    v41 = &unk_1ECFA8ED8;
    v43 = v6;
    v44 = v5;
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v42 = v2;
    uint64_t v14 = (void *)CFReadStreamCreate();
    if (v44) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v44);
    }
  }
  uint64_t v15 = [*(id *)(a1 + 32) error];
  v16 = *(unsigned char **)(a1 + 32);
  if (v15 || v16[906])
  {
    uint64_t v17 = [v16 error];
    v18 = *(void **)(a1 + 32);
    if (v17)
    {
      uint64_t v19 = _CFStreamErrorFromCFError((__CFError *)[v18 error]);
    }
    else
    {
      v21 = v18 + 111;
      uint64_t v19 = v18[111];
      uint64_t v20 = v21[1];
    }
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_36;
    v35 = &__block_descriptor_48_e27__v16__0____CFWriteStream__8l;
    uint64_t v36 = v19;
    uint64_t v37 = v20;
    v22 = (void *)CFWriteStreamCreate();
    if (v6) {
      TCPIO_Delegate::closeWriteSide(v6);
    }
  }
  else
  {
    v30[7] = MEMORY[0x1E4F143A8];
    v30[8] = 3321888768;
    v30[9] = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_2_39;
    v30[10] = &unk_1ECFA8F10;
    v30[12] = v6;
    v31 = v5;
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v30[11] = v2;
    v22 = (void *)CFWriteStreamCreate();
    if (v31) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v31);
    }
  }
  [*(id *)(a1 + 32) setState:3];
  v23 = *(void **)(a1 + 32);
  if (v23)
  {
    uint64_t v24 = v23[88];
    if (!v24) {
      uint64_t v24 = v23[87];
    }
  }
  else
  {
    uint64_t v24 = 0;
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_42;
  v30[3] = &unk_1E5255EB0;
  v30[5] = v14;
  v30[6] = v22;
  v30[4] = v23;
  -[__NSCFURLSessionDelegateWrapper streamTask:didBecomeInputStream:outputStream:completionHandler:](v24, v23, v14, v22, v30);
  if (v14) {
    CFRelease(v14);
  }
  if (v22) {
    CFRelease(v22);
  }
  uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 768);
  if (v25)
  {
    (*(void (**)(uint64_t))(*(void *)v25 + 32))(v25);
    v26 = (void *)(*(void *)(a1 + 32) + 768);
    v27 = *(std::__shared_weak_count **)(*(void *)(a1 + 32) + 776);
    void *v26 = 0;
    v26[1] = 0;
    if (v27) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v27);
    }
  }
  v28 = (void *)(*(void *)(a1 + 32) + 784);
  v29 = *(std::__shared_weak_count **)(*(void *)(a1 + 32) + 792);
  void *v28 = 0;
  v28[1] = 0;
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v29);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v5);
  }
}

__n128 __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_3(__n128 *a1, uint64_t a2)
{
  uint64_t v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 32, 0);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  __n128 result = a1[2];
  *(void *)uint64_t v4 = &unk_1ECFA4858;
  *((void *)v4 + 1) = a2;
  v4[1] = result;
  return result;
}

_OWORD *__48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 152, 0);
  uint64_t v5 = v4;
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  v4[4] = 0u;
  v4[5] = 0u;
  v4[6] = 0u;
  v4[7] = 0u;
  v4[8] = 0u;
  *((void *)v4 + 18) = 0;
  v6 = *(std::__shared_weak_count **)(a1 + 48);
  v8[0] = *(void *)(a1 + 40);
  v8[1] = (uint64_t)v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  __NSCFTCPIOReadStream::__NSCFTCPIOReadStream((uint64_t)v4, a2, v8, *(void **)(a1 + 32));
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v6);
  }
  return v5;
}

__n128 __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_36(__n128 *a1, uint64_t a2)
{
  uint64_t v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 32, 0);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  __n128 result = a1[2];
  *(void *)uint64_t v4 = &unk_1ECFA4BA8;
  *((void *)v4 + 1) = a2;
  v4[1] = result;
  return result;
}

_OWORD *__48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_2_39(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 120, 0);
  uint64_t v5 = v4;
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  v4[4] = 0u;
  v4[5] = 0u;
  v4[6] = 0u;
  *((void *)v4 + 14) = 0;
  v6 = *(std::__shared_weak_count **)(a1 + 48);
  v8[0] = *(void *)(a1 + 40);
  v8[1] = (uint64_t)v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  __NSCFTCPIOWriteStream::__NSCFTCPIOWriteStream((uint64_t)v4, a2, v8, *(void **)(a1 + 32));
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v6);
  }
  return v5;
}

uint64_t __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_42(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_disavow");
  uint64_t v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_onSessionQueue_cleanupAndBreakCycles");
}

void __44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 906) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 784);
  if (v3)
  {
    (*(void (**)(void))(**(void **)(v3 + 24) + 144))(*(void *)(v3 + 24));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v4 = v2 + 888;
  *(void *)uint64_t v4 = 1;
  *(_DWORD *)(v4 + 8) = 57;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = v5[88];
    if (!v6) {
      uint64_t v6 = v5[87];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke_2;
  v7[3] = &unk_1E5258228;
  v7[4] = v5;
  -[__NSCFURLSessionDelegateWrapper writeClosedForStreamTask:completionHandler:](v6, v5, v7);
}

uint64_t __44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

unsigned char *__44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke_2(uint64_t a1)
{
  __n128 result = *(unsigned char **)(a1 + 32);
  if (result[881]) {
    return (unsigned char *)objc_msgSend(result, "_onqueue_checkForCompletion");
  }
  return result;
}

void __43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 881) = 1;
  uint64_t v1 = *(void *)(a1 + 32) + 864;
  *(void *)uint64_t v1 = 1;
  *(_DWORD *)(v1 + 8) = 57;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = v2[88];
    if (!v3) {
      uint64_t v3 = v2[87];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke_2;
  v4[3] = &unk_1E5258228;
  v4[4] = v2;
  -[__NSCFURLSessionDelegateWrapper readClosedForStreamTask:completionHandler:](v3, v2, v4);
}

uint64_t __43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

unsigned char *__43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke_2(uint64_t a1)
{
  __n128 result = *(unsigned char **)(a1 + 32);
  if (result[906]) {
    return (unsigned char *)objc_msgSend(result, "_onqueue_checkForCompletion");
  }
  return result;
}

uint64_t __55____NSCFTCPIOStreamTask__onqueue_startSecureConnection__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 856) && *(int *)(v1 + 852) <= 2) {
    return (*(uint64_t (**)(void))(**(void **)(v1 + 768) + 48))();
  }
  return result;
}

uint64_t __54____NSCFTCPIOStreamTask__onqueue_stopSecureConnection__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 768) + 56))();
}

uint64_t __45____NSCFTCPIOStreamTask_stopSecureConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_stopSecureConnection");
}

uint64_t __46____NSCFTCPIOStreamTask_startSecureConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_startSecureConnection");
}

uint64_t __62____NSCFTCPIOStreamTask_copyStreamProperty_completionHandler___block_invoke(void *a1)
{
  if (a1[4])
  {
    uint64_t v2 = *(void *)(*(void *)(a1[5] + 784) + 24);
    (*(void (**)(uint64_t))(*(void *)v2 + 216))(v2);
  }
  uint64_t v3 = *(uint64_t (**)(void))(a1[6] + 16);

  return v3();
}

uint64_t __34____NSCFTCPIOStreamTask_closeRead__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_closeRead");
}

uint64_t __35____NSCFTCPIOStreamTask_closeWrite__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_closeWrite");
}

uint64_t __39____NSCFTCPIOStreamTask_captureStreams__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_captureStreams");
}

void __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2 > 1 || *(int *)(v3 + 852) > 2 || *(unsigned char *)(v3 + 857))
  {
    uint64_t v4 = [(id)v3 session];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_2;
    v19[3] = &unk_1E5258028;
    uint64_t v5 = *(void *)(a1 + 48);
    v19[4] = *(void *)(a1 + 32);
    v19[5] = v5;
    -[NSURLSession runDelegateBlock:](v4, v19);
  }
  else
  {
    uint64_t v6 = *(int *)(v3 + 896);
    if (v6)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:v6 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      uint64_t v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "_onqueue_ioTick");
    }
    else
    {
      uint64_t v8 = [__NSCFURLLocalStreamTaskWorkWrite alloc];
      if (v8)
      {
        uint64_t v9 = [(__NSCFURLLocalStreamTaskWorkWrite *)v8 init];
        uint64_t v10 = v9;
        if (v9) {
          *(void *)(v9 + 8) = "writeData";
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
      *(void *)(v10 + 48) = *(id *)(a1 + 40);
      *(void *)(v10 + 16) = *(void *)(a1 + 56);
      *(void *)(v10 + 24) = 0;
      uint64_t v11 = *(uint64_t **)(a1 + 32);
      uint64_t v12 = v11[114];
      if (!v12 || !*(_DWORD *)(v12 + 48))
      {
        -[CFNetworkTimer setTimer:](v11[114], *(double *)(a1 + 56));
        uint64_t v14 = *(void **)(a1 + 32);
        if (v14) {
          objc_setProperty_nonatomic(v14, v13, (id)v10, 928);
        }
        *(unsigned char *)(v10 + 41) = 1;
        uint64_t v11 = *(uint64_t **)(a1 + 32);
      }
      objc_initWeak(&location, (id)[v11 session]);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_3;
      aBlock[3] = &unk_1E5257378;
      objc_copyWeak(&v17, &location);
      aBlock[4] = *(void *)(a1 + 48);
      *(void *)(v10 + 64) = _Block_copy(aBlock);
      [*(id *)(*(void *)(a1 + 32) + 832) addObject:v10];

      if ([*(id *)(a1 + 32) state] != 1)
      {
        uint64_t v15 = *(_DWORD **)(a1 + 32);
        if (v15[213] == 2) {
          objc_msgSend(v15, "_onqueue_ioTick");
        }
      }
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_errorOrCancelError");
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

void __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_4;
  v6[3] = &unk_1E5258028;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  -[NSURLSession runDelegateBlock:]((uint64_t)Weak, v6);
}

uint64_t __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2 > 1 || *(int *)(v3 + 852) > 2 || *(unsigned char *)(v3 + 857))
  {
    uint64_t v4 = [(id)v3 session];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_2;
    v16[3] = &unk_1E5258028;
    long long v17 = *(_OWORD *)(a1 + 32);
    -[NSURLSession runDelegateBlock:](v4, v16);
  }
  else
  {
    uint64_t v5 = *(int *)(v3 + 872);
    if (v5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:v5 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      uint64_t v6 = *(void **)(a1 + 32);
      objc_msgSend(v6, "_onqueue_ioTick");
    }
    else
    {
      uint64_t v7 = [[__NSCFURLLocalStreamTaskWorkRead alloc] init];
      v7->super._static_description = "readData";
      *(_DWORD *)(&v7->super._timerStarted + 3) = *(void *)(a1 + 48);
      v7->_minBytes = *(void *)(a1 + 56);
      v7->super._timeout = *(double *)(a1 + 64);
      v7->super._timeoutTime = 0.0;
      uint64_t v8 = *(uint64_t **)(a1 + 32);
      uint64_t v9 = v8[115];
      if (!v9 || !*(_DWORD *)(v9 + 48))
      {
        -[CFNetworkTimer setTimer:](v8[115], *(double *)(a1 + 64));
        uint64_t v11 = *(void **)(a1 + 32);
        if (v11) {
          objc_setProperty_nonatomic(v11, v10, v7, 936);
        }
        v7->super._timerStarted = 1;
        uint64_t v8 = *(uint64_t **)(a1 + 32);
      }
      objc_initWeak(&location, (id)[v8 session]);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_3;
      aBlock[3] = &unk_1E5257328;
      objc_copyWeak(&v14, &location);
      aBlock[4] = *(void *)(a1 + 40);
      v7->_completion = _Block_copy(aBlock);
      [*(id *)(*(void *)(a1 + 32) + 832) addObject:v7];

      if ([*(id *)(a1 + 32) state] != 1)
      {
        uint64_t v12 = *(_DWORD **)(a1 + 32);
        if (v12[213] == 2) {
          objc_msgSend(v12, "_onqueue_ioTick");
        }
      }
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_errorOrCancelError");
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(v1 + 16);

  return v3(v1, 0, 0, v2);
}

void __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_4;
  v10[3] = &unk_1E5257300;
  uint64_t v9 = *(void *)(a1 + 32);
  v10[5] = a4;
  v10[6] = v9;
  char v11 = a3;
  v10[4] = a2;
  -[NSURLSession runDelegateBlock:]((uint64_t)Weak, v10);
}

uint64_t __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

uint64_t __68____NSCFTCPIOStreamTask_initWithTask_connection_extraBytes_disavow___block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  return objc_msgSend(Weak, "_onqueue_timeoutOccured");
}

uint64_t __68____NSCFTCPIOStreamTask_initWithTask_connection_extraBytes_disavow___block_invoke_2(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  return objc_msgSend(Weak, "_onqueue_timeoutOccured");
}

uint64_t __61____NSCFTCPIOStreamTask_initWithHost_port_taskGroup_disavow___block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  return objc_msgSend(Weak, "_onqueue_timeoutOccured");
}

uint64_t __61____NSCFTCPIOStreamTask_initWithHost_port_taskGroup_disavow___block_invoke_2(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  return objc_msgSend(Weak, "_onqueue_timeoutOccured");
}

@end