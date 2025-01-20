@interface NSCFURLLocalSessionConnection
@end

@implementation NSCFURLLocalSessionConnection

uint64_t __51____NSCFURLLocalSessionConnection_withLoaderAsync___block_invoke(uint64_t a1)
{
  return -[__NSCFURLLocalSessionConnection withLoaderOnQueue:](*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __45____NSCFURLLocalSessionConnection__ackBytes___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 152))(a2, *(void *)(result + 32));
  }
  return result;
}

void __43____NSCFURLLocalSessionConnection__cleanup__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43____NSCFURLLocalSessionConnection__cleanup__block_invoke_2;
  v8[3] = &unk_1E5258228;
  v8[4] = v2;
  std::allocate_shared[abi:nn180100]<CoreSchedulingSetOneOff,std::allocator<CoreSchedulingSetOneOff>,NSObject  {objcproto17OS_dispatch_queue}*&,void({block_pointer}&)(void),void>(&v9, v3, v8);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 80);
  v5 = v10;
  v6 = v9;
  v7 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, NSObject ***))(*(void *)v4 + 16))(v4, &v6);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v7);
  }
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v5);
  }
}

uint64_t __42____NSCFURLLocalSessionConnection_suspend__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  uint64_t v3 = *(void *)(v2 + 96);
  *(void *)(v2 + 96) = v3 + 1;
  if (!v3) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 32))(a2);
  }
  return result;
}

uint64_t __41____NSCFURLLocalSessionConnection_resume__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  uint64_t v3 = *(void *)(v2 + 96) - 1;
  *(void *)(v2 + 96) = v3;
  if (!v3) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  }
  return result;
}

void __51____NSCFURLLocalSessionConnection_setPoolPriority___block_invoke(uint64_t a1, uint64_t a2)
{
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, (const void *)(a1 + 32));
  (*(void (**)(uint64_t, CFNumberRef))(*(void *)a2 + 104))(a2, v3);
  if (v3)
  {
    CFRelease(v3);
  }
}

uint64_t __63____NSCFURLLocalSessionConnection_setPriorityHint_incremental___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, float))(*(void *)a2 + 112))(a2, *(unsigned __int8 *)(a1 + 36), *(float *)(a1 + 32));
}

uint64_t __58____NSCFURLLocalSessionConnection_setBytesPerSecondLimit___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 120))(a2, *(void *)(a1 + 32));
}

uint64_t __49____NSCFURLLocalSessionConnection_setIsDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 48))(a2, *(unsigned __int8 *)(a1 + 32));
}

void __43____NSCFURLLocalSessionConnection__cleanup__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = 0;
}

void __71____NSCFURLLocalSessionConnection_initWithTask_delegate_delegateQueue___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x18531D6D0]();
  -[__NSCFURLLocalSessionConnection _tick](*(void *)(a1 + 32));
}

void __48____NSCFURLLocalSessionConnection__tick_running__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if (nw_settings_get_signposts_enabled())
    {
      v5 = *(void **)(a1 + 32);
      if (v5) {
        objc_getProperty(v5, v4, 8, 1);
      }
      kdebug_trace();
    }
    LODWORD(v7) = *(_DWORD *)(a1 + 56);
    objc_msgSend(a2, "connection:didReceiveData:completion:", MEMORY[0x1E4F143A8], 3221225472, __48____NSCFURLLocalSessionConnection__tick_running__block_invoke_2, &unk_1E5253668, *(void *)(a1 + 32), a2, *(void *)(a1 + 48), v7);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      --*(void *)(v6 + 112);
      -[__NSCFURLLocalSessionConnection _tick](v6);
    }
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

void __55____NSCFURLLocalSessionConnection__didFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  [a2 connectionWillFinishLoading:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    --*(void *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }
}

void __51____NSCFURLLocalSessionConnection__task_sendFinish__block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  if (a2)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(__CFError **)(v5 + 128);
    if (v6)
    {
      uint64_t v7 = cfnTranslateCFError(v6, objc_msgSend(*(id *)(v5 + 8), "currentRequest_URL"));
      uint64_t v5 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v7 = 0;
    }
    [a2 connection:v5 didFinishLoadingWithError:v7];
  }
  v8 = *(dispatch_queue_t **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51____NSCFURLLocalSessionConnection__task_sendFinish__block_invoke_2;
  v9[3] = &unk_1E5258228;
  v9[4] = v8;
  -[__NSCFURLSessionConnection withWorkQueueAsync:](v8, (const char *)v9);
}

uint64_t __51____NSCFURLLocalSessionConnection__tick_initialize__block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 8, 1);
  }
  uint64_t v6 = [Property _metrics];
  id v7 = *(id *)(a1 + 32);
  if (v7) {
    id v7 = objc_getProperty(v7, v5, 8, 1);
  }
  -[__CFN_TaskMetrics nextTransaction:withNewRequest:](v6, 1025, (void *)[v7 currentRequest]);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(uint64_t (**)(const char *, uint64_t))(*(void *)a2 + 16);

  return v9(a2, v8);
}

void __59____NSCFURLLocalSessionConnection__sendResponseToDelegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(a2, "connection:didReceiveResponse:completion:");
  }
  else if (v2)
  {
    --*(void *)(v2 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v2);
  }
}

uint64_t __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (a2) {
    return objc_msgSend(a2, "connection:willCacheResponse:responseCallback:");
  }
  if (v2)
  {
    --*(void *)(v2 + 112);
    return -[__NSCFURLLocalSessionConnection _tick](v2);
  }
  return result;
}

void __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(dispatch_queue_t **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke_3;
  v3[3] = &unk_1E5257FB0;
  v3[4] = v2;
  v3[5] = a2;
  -[__NSCFURLLocalSessionConnection afterDelegateWithTick:](v2, (uint64_t)v3);
}

void __59____NSCFURLLocalSessionConnection__sendResponseToDelegate___block_invoke_2(uint64_t a1, long long *a2)
{
  id v4 = *(unsigned char **)(a1 + 32);
  if (v4[168])
  {
    [v4 resume];
    id v4 = *(unsigned char **)(a1 + 32);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59____NSCFURLLocalSessionConnection__sendResponseToDelegate___block_invoke_3;
  v5[3] = &unk_1E52568D0;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v7 = v4;
  long long v8 = *a2;
  uint64_t v9 = *((void *)a2 + 2);
  -[__NSCFURLLocalSessionConnection afterDelegateWithTick:]((dispatch_queue_t *)v4, (uint64_t)v5);
}

void __48____NSCFURLLocalSessionConnection__tick_running__block_invoke_2(int8x16_t *a1, const char *a2)
{
  id Property = (id)a1[2].i64[0];
  if (Property) {
    id Property = objc_getProperty(Property, a2, 8, 1);
  }
  [Property _consumePendingBytesReceivedEncoded];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48____NSCFURLLocalSessionConnection__tick_running__block_invoke_3;
  v5[3] = &unk_1E5253668;
  __int32 v8 = a1[3].i32[2];
  uint64_t v7 = a1[3].i64[0];
  int8x16_t v4 = a1[2];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  -[__NSCFURLLocalSessionConnection afterDelegateWithTick:]((dispatch_queue_t *)v4.i64[0], (uint64_t)v5);
}

uint64_t __51____NSCFURLLocalSessionConnection__didReceiveData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += a5;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return 1;
}

void __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v5 = [*(id *)(v3 + 8) currentRequest];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_3;
    v6[3] = &unk_1E52542E8;
    long long v7 = *(_OWORD *)(a1 + 32);
    objc_msgSend(a2, "connection:_willSendRequestForEstablishedConnection:completion:", v3, v5, v6);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_2;
    v8[3] = &unk_1E5257FD8;
    v8[4] = *(void *)(a1 + 40);
    -[__NSCFURLLocalSessionConnection afterDelegateWithTick:]((dispatch_queue_t *)v3, (uint64_t)v8);
  }
}

uint64_t __57____NSCFURLLocalSessionConnection_afterDelegateWithTick___block_invoke(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 112);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(a1 + 32);

  return -[__NSCFURLLocalSessionConnection _tick](v3);
}

uint64_t __48____NSCFURLLocalSessionConnection__tick_running__block_invoke_3(uint64_t a1)
{
  if (nw_settings_get_signposts_enabled())
  {
    uint64_t v3 = *(void **)(a1 + 40);
    if (v3) {
      objc_getProperty(v3, v2, 8, 1);
    }
    kdebug_trace();
  }
  int8x16_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);

  return [v4 _ackBytes:v5];
}

uint64_t __59____NSCFURLLocalSessionConnection__sendResponseToDelegate___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 48) + 176) = *(void *)(a1 + 64);
  *(void *)(*(void *)(a1 + 48) + 184) = *(void *)(a1 + 72);
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = [MEMORY[0x1E4F290A8] errorWithDomain:*MEMORY[0x1E4F289A0] code:-999 userInfo:0];
    uint64_t v3 = *(void **)(a1 + 48);
    return [v3 _didFinishWithError:v2];
  }
  else
  {
    *(void *)(*(void *)(a1 + 48) + 144) = 0;
    uint64_t result = [*(id *)(a1 + 40) expectedContentLength];
    uint64_t v5 = result;
    int v6 = *(unsigned __int8 *)(a1 + 57);
    if (*(unsigned char *)(a1 + 57))
    {
      uint64_t result = [*(id *)(a1 + 40) _inner];
      if (*(_DWORD *)(result + 72) == 2)
      {
        int v6 = 0;
      }
      else
      {
        uint64_t result = objc_opt_respondsToSelector();
        if (result)
        {
          uint64_t result = [*(id *)(a1 + 40) statusCode];
          int v6 = result != 206;
        }
        else
        {
          int v6 = 1;
        }
      }
    }
    if (*(unsigned char *)(a1 + 59)) {
      *(void *)(*(void *)(a1 + 48) + 144) = v5;
    }
    if (v6) {
      uint64_t result = -[__NSCFURLSessionConnection _setupForCache:expectedLength:response:](*(void *)(a1 + 48), v5, *(void **)(a1 + 40));
    }
    if (*(unsigned char *)(a1 + 60))
    {
      *(_DWORD *)(*(void *)(a1 + 48) + 136) = 4;
      uint64_t result = *(void *)(a1 + 48);
      if (result)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __43____NSCFURLLocalSessionConnection__cleanup__block_invoke;
        v7[3] = &unk_1E5253600;
        v7[4] = result;
        return [(id)result withLoaderAsync:v7];
      }
    }
  }
  return result;
}

uint64_t __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke_3(uint64_t a1)
{
  return -[__NSCFURLSessionConnection _storeCachedResponse:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

void *__51____NSCFURLLocalSessionConnection__task_sendFinish__block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __43____NSCFURLLocalSessionConnection__cleanup__block_invoke;
    v2[3] = &unk_1E5253600;
    v2[4] = result;
    return (void *)[result withLoaderAsync:v2];
  }
  return result;
}

uint64_t __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_65(int8x16_t *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_2_66;
  v3[3] = &unk_1E5253898;
  v3[4] = a1[2].i64[1];
  uint64_t v5 = a1[4].i64[0];
  int8x16_t v1 = a1[3];
  int8x16_t v4 = vextq_s8(v1, v1, 8uLL);
  return -[__NSCFURLLocalSessionConnection withLoaderOnQueue:](v1.i64[0], (uint64_t)v3);
}

uint64_t __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __41____NSCFURLLocalSessionConnection_cancel__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F290A8] errorWithDomain:*MEMORY[0x1E4F289A0] code:-999 userInfo:0];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 _didFinishWithError:v2];
}

void __52____NSCFURLLocalSessionConnection__didSendBodyData___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = [NSNumber numberWithLongLong:a1[5]];
    uint64_t v6 = [NSNumber numberWithLongLong:a1[6]];
    objc_msgSend(a2, "connection:sentBodyBytes:totalBytes:expectedBytes:", v4, v5, v6, objc_msgSend(NSNumber, "numberWithLongLong:", a1[7]));
  }
  uint64_t v7 = a1[4];
  if (v7)
  {
    --*(void *)(v7 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v7);
  }
}

void __41____NSCFURLLocalSessionConnection_cancel__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(int *)(v2 + 136) <= 1)
  {
    uint64_t v4 = *(NSObject **)(v2 + 16);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41____NSCFURLLocalSessionConnection_cancel__block_invoke_2;
    v8[3] = &unk_1E5258228;
    v8[4] = v2;
    std::allocate_shared[abi:nn180100]<CoreSchedulingSetOneOff,std::allocator<CoreSchedulingSetOneOff>,NSObject  {objcproto17OS_dispatch_queue}*&,void({block_pointer}&)(void),void>(&v9, v4, v8);
    uint64_t v5 = v10;
    uint64_t v6 = v9;
    uint64_t v7 = v10;
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    (*(void (**)(uint64_t, NSObject ***))(*(void *)a2 + 24))(a2, &v6);
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v7);
    }
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v5);
    }
  }
}

void __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_2_66(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (const void *)[*(id *)(a1 + 32) _createCFAuthChallenge];
  switch(*(void *)(a1 + 56))
  {
    case 0:
      (*(void (**)(uint64_t, uint64_t, const void *))(*(void *)a2 + 80))(a2, [*(id *)(a1 + 40) _CFURLCredential], v5);
      if (v5) {
        goto LABEL_10;
      }
      return;
    case 1:
      (*(void (**)(uint64_t, const void *))(*(void *)a2 + 72))(a2, v5);
      if (v5) {
        goto LABEL_10;
      }
      return;
    case 2:
      id Property = *(id *)(a1 + 48);
      if (Property) {
        id Property = objc_getProperty(Property, v4, 8, 1);
      }
      [Property cancel];
      goto LABEL_9;
    case 3:
      (*(void (**)(uint64_t, const void *))(*(void *)a2 + 88))(a2, v5);
      if (!v5) {
        return;
      }
      goto LABEL_10;
    default:
LABEL_9:
      if (v5)
      {
LABEL_10:
        CFRelease(v5);
      }
      return;
  }
}

void __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(a2, "connection:challenged:authCallback:");
  }
  else if (v2)
  {
    --*(void *)(v2 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v2);
  }
}

void __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  uint64_t v6 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) _loggableDescription];
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = v7;
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 2048;
    uint64_t v19 = a3;
    _os_log_impl(&dword_184085000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ auth completion disp=%d cred=%p", buf, 0x1Cu);
  }
  if (a2 == 1)
  {
    if ([*(id *)(a1 + 40) previousFailureCount] < 1) {
      a2 = 1;
    }
    else {
      a2 = 3;
    }
  }
  __int32 v8 = *(dispatch_queue_t **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_65;
  v9[3] = &unk_1E52538C0;
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  uint64_t v12 = a3;
  uint64_t v13 = a2;
  v11 = v8;
  -[__NSCFURLLocalSessionConnection afterDelegateWithTick:](v8, (uint64_t)v9);
}

void __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_4;
  v4[3] = &unk_1E5258028;
  uint64_t v2 = *(dispatch_queue_t **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  v4[5] = v3;
  -[__NSCFURLLocalSessionConnection afterDelegateWithTick:](v2, (uint64_t)v4);
}

void __74____NSCFURLLocalSessionConnection__captureTransportConnection_extraBytes___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = (std::__shared_weak_count *)a1[7];
    uint64_t v6 = a1[6];
    uint64_t v7 = v4;
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [a2 connection:v3 didReceiveTCPConnection:&v6 extraBytes:a1[5]];
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v7);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)a1[6] + 152))(a1[6]);
  }
  uint64_t v5 = a1[4];
  if (v5)
  {
    --*(void *)(v5 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v5);
  }
}

void __75____NSCFURLLocalSessionConnection__capturedSocketInputStream_outputStream___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    [a2 connection:*(void *)(a1 + 32) didReceiveSocketInputStream:*(void *)(a1 + 40) outputStream:*(void *)(a1 + 48)];
  }
  else
  {
    [*(id *)(a1 + 40) close];
    [*(id *)(a1 + 48) close];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    --*(void *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }
}

void __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v5 = [*(id *)(v2 + 8) currentRequest];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_2;
    v7[3] = &unk_1E5253910;
    uint64_t v6 = *(void *)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    void v7[5] = a2;
    [a2 connection:v2 request:v5 needsNewBodyStreamFromOffset:v6 callback:v7];
  }
  else if (v2)
  {
    --*(void *)(v2 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v2);
  }
}

void __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_3;
  v2[3] = &unk_1E52582F0;
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = a2;
  -[__NSCFURLLocalSessionConnection afterDelegateWithTick:]((dispatch_queue_t *)v3, (uint64_t)v2);
}

uint64_t __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_4;
  v3[3] = &unk_1E5253870;
  long long v4 = *(_OWORD *)(a1 + 40);
  return -[__NSCFURLLocalSessionConnection withLoaderOnQueue:](v1, (uint64_t)v3);
}

uint64_t __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 56))(a2, *(void *)(a1 + 40));
}

void __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v5 = [*(id *)(v2 + 8) currentRequest];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_2;
    v6[3] = &unk_1E5253910;
    void v6[4] = *(void *)(a1 + 32);
    v6[5] = a2;
    [a2 connection:v2 request:v5 needsNewBodyStreamCallback:v6];
  }
  else if (v2)
  {
    --*(void *)(v2 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v2);
  }
}

void __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_3;
  v2[3] = &unk_1E52582F0;
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = a2;
  -[__NSCFURLLocalSessionConnection afterDelegateWithTick:]((dispatch_queue_t *)v3, (uint64_t)v2);
}

uint64_t __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_4;
  v3[3] = &unk_1E5253870;
  long long v4 = *(_OWORD *)(a1 + 40);
  return -[__NSCFURLLocalSessionConnection withLoaderOnQueue:](v1, (uint64_t)v3);
}

uint64_t __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 56))(a2, *(void *)(a1 + 40));
}

uint64_t __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_2;
  v3[3] = &unk_1E5253870;
  long long v4 = *(_OWORD *)(a1 + 40);
  return -[__NSCFURLLocalSessionConnection withLoaderOnQueue:](v1, (uint64_t)v3);
}

void __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_2(uint64_t a1, uint64_t a2)
{
  long long v4 = (const void *)[*(id *)(a1 + 32) _createCFAuthChallenge];
  (*(void (**)(uint64_t, uint64_t, const void *))(*(void *)a2 + 80))(a2, [*(id *)(a1 + 40) _CFURLCredential], v4);
  if (v4)
  {
    CFRelease(v4);
  }
}

void __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v2 = (dispatch_queue_t *)a1[6];
  if (a2)
  {
    objc_msgSend(a2, "connection:wasRedirected:newRequest:responseCallback:", MEMORY[0x1E4F143A8], 3221225472, __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_3, &unk_1E5253820, v2, a2, a1[4], a1[5], a1[7]);
  }
  else
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_2;
    v3[3] = &unk_1E5257FD8;
    void v3[4] = a1[7];
    -[__NSCFURLLocalSessionConnection afterDelegateWithTick:](v2, (uint64_t)v3);
  }
}

uint64_t __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_3(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_opt_class();
    id v4 = a2;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F29088], "componentsWithURL:resolvingAgainstBaseURL:", objc_msgSend(a2, "URL"), 0);
      if (objc_msgSend((id)objc_msgSend(v5, "scheme"), "isEqualToString:", 0x1EC0A5E90))
      {
        uint64_t v6 = &kCFURLSchemeHTTPS;
LABEL_7:
        [v5 setScheme:*v6];
        id v4 = (id)[a2 mutableCopy];
        objc_msgSend(v4, "setURL:", objc_msgSend(v5, "URL"));
        goto LABEL_8;
      }
      id v4 = a2;
      if (objc_msgSend((id)objc_msgSend(v5, "scheme"), "isEqualToString:", 0x1EC0A5E58))
      {
        uint64_t v6 = &kCFURLSchemeHTTP;
        goto LABEL_7;
      }
    }
LABEL_8:
    [*(id *)(*(void *)(a1 + 32) + 8) updateCurrentRequest:v4];
  }
  uint64_t v7 = *(dispatch_queue_t **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_4;
  v10[3] = &unk_1E5257F80;
  long long v11 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v13 = a2;
  uint64_t v14 = v9;
  uint64_t v12 = v8;
  -[__NSCFURLLocalSessionConnection afterDelegateWithTick:](v7, (uint64_t)v10);
}

uint64_t __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(void *)(a1 + 56));
}

void __59____NSCFURLLocalSessionConnection__alternatePathAvailable___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    [a2 connection:*(void *)(a1 + 32) alternatePathAvailable:*(unsigned int *)(a1 + 40)];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    --*(void *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }
}

void __67____NSCFURLLocalSessionConnection__conditionalRequirementsChanged___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    objc_msgSend(a2, "connection:_conditionalRequirementsChanged:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    --*(void *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }
}

void __66____NSCFURLLocalSessionConnection__connectionIsWaitingWithReason___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    [a2 connection:*(void *)(a1 + 32) waitingWithReason:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    --*(void *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }
}

uint64_t __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51____NSCFURLLocalSessionConnection__didReceiveData___block_invoke_2(uint64_t a1, int a2, uint64_t a3, void *__src, size_t __n)
{
  return 1;
}

void __68____NSCFURLLocalSessionConnection__didReceiveInformationalResponse___block_invoke(uint64_t a1, void *a2)
{
  [a2 connection:*(void *)(a1 + 40) didReceiveInformationalResponse:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    --*(void *)(v3 + 112);
    -[__NSCFURLLocalSessionConnection _tick](v3);
  }
}

uint64_t __64____NSCFURLLocalSessionConnection_expectedProgressTargetChanged__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 128))(a2);
}

@end