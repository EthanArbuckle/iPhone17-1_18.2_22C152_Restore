@interface HAP2CoAPIO
+ (BOOL)isRunning;
+ (BOOL)setCoapAddressFromString:(id)a3 port:(unsigned __int16)a4 coapAddress:(coap_address_t *)a5;
+ (HAP2CoAPIOThread)thread;
+ (HAP2Lock)lock;
+ (NSMutableArray)consumers;
+ (id)new;
+ (void)queueSessionBlockForConsumer:(id)a3 sessionBlock:(id)a4 withTimeout:(double)a5 requiresCompletion:(BOOL)a6;
+ (void)queueSessionCompletionForConsumer:(id)a3;
+ (void)registerConsumer:(id)a3;
+ (void)setConsumers:(id)a3;
+ (void)setThread:(id)a3;
+ (void)unregisterConsumer:(id)a3;
- (HAP2CoAPIO)init;
@end

@implementation HAP2CoAPIO

+ (id)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)setCoapAddressFromString:(id)a3 port:(unsigned __int16)a4 coapAddress:(coap_address_t *)a5
{
  unsigned int v6 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = (const char *)[a3 UTF8String];
  if (v7)
  {
    v8 = v7;
    memset(&v11[4], 0, 24);
    *(_WORD *)v11 = 7708;
    __int16 v9 = __rev16(v6);
    *(_WORD *)&v11[2] = v9;
    if (inet_pton(30, v7, &v11[8]) == 1)
    {
      if (a5)
      {
        a5->size = v11[0];
        a5->addr.sa = *(sockaddr *)v11;
        *(in6_addr *)((char *)&a5->addr.sin6.sin6_addr + 4) = *(in6_addr *)&v11[12];
        LOBYTE(v7) = 1;
        return (char)v7;
      }
    }
    else
    {
      *(_WORD *)v11 = 528;
      *(_WORD *)&v11[2] = v9;
      *(_DWORD *)&v11[4] = 0;
      *(void *)&v11[8] = 0;
      LOBYTE(v7) = inet_pton(2, v8, &v11[4]) == 1;
      if (!(_BYTE)v7) {
        return (char)v7;
      }
      if (a5)
      {
        a5->addr.sin6.sin6_scope_id = 0;
        *(void *)&a5->addr.sin6.sin6_addr.__u6_addr32[2] = 0;
        a5->size = v11[0];
        a5->addr.sa = *(sockaddr *)v11;
        return (char)v7;
      }
    }
    __assert_rtn("coap_address_init", "address.c", 72, "addr");
  }
  return (char)v7;
}

+ (void)queueSessionCompletionForConsumer:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16877;
  v16 = __Block_byref_object_dispose__16878;
  id v17 = 0;
  v5 = [a1 lock];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__HAP2CoAPIO_queueSessionCompletionForConsumer___block_invoke;
  v8[3] = &unk_1E69F2DF0;
  id v11 = a1;
  id v6 = v4;
  id v9 = v6;
  v10 = &v12;
  [v5 performBlock:v8];

  id v7 = (void *)v13[5];
  if (v7) {
    [v7 queueSessionCompletionForConsumer:v6];
  }

  _Block_object_dispose(&v12, 8);
}

void __48__HAP2CoAPIO_queueSessionCompletionForConsumer___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 48) consumers];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__HAP2CoAPIO_queueSessionCompletionForConsumer___block_invoke_2;
  v3[3] = &unk_1E69F2DC8;
  id v4 = *(id *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v3];
}

void __48__HAP2CoAPIO_queueSessionCompletionForConsumer___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 consumer];
  if (v6 == *(void **)(a1 + 32))
  {
    id v10 = v6;
    uint64_t v7 = [*(id *)(a1 + 48) thread];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v6 = v10;
    *a4 = 1;
  }
}

+ (void)queueSessionBlockForConsumer:(id)a3 sessionBlock:(id)a4 withTimeout:(double)a5 requiresCompletion:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__16877;
  v23 = __Block_byref_object_dispose__16878;
  id v24 = 0;
  uint64_t v12 = [a1 lock];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__HAP2CoAPIO_queueSessionBlockForConsumer_sessionBlock_withTimeout_requiresCompletion___block_invoke;
  v15[3] = &unk_1E69F2DF0;
  id v18 = a1;
  id v13 = v10;
  id v16 = v13;
  id v17 = &v19;
  [v12 performBlock:v15];

  uint64_t v14 = (void *)v20[5];
  if (v14) {
    [v14 queueSessionBlockForConsumer:v13 sessionBlock:v11 withTimeout:v6 requiresCompletion:a5];
  }

  _Block_object_dispose(&v19, 8);
}

void __87__HAP2CoAPIO_queueSessionBlockForConsumer_sessionBlock_withTimeout_requiresCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 48) consumers];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__HAP2CoAPIO_queueSessionBlockForConsumer_sessionBlock_withTimeout_requiresCompletion___block_invoke_2;
  v3[3] = &unk_1E69F2DC8;
  id v4 = *(id *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v3];
}

void __87__HAP2CoAPIO_queueSessionBlockForConsumer_sessionBlock_withTimeout_requiresCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  BOOL v6 = [a2 consumer];
  if (v6 == *(void **)(a1 + 32))
  {
    id v10 = v6;
    uint64_t v7 = [*(id *)(a1 + 48) thread];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    BOOL v6 = v10;
    *a4 = 1;
  }
}

+ (void)unregisterConsumer:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__16877;
  v26 = __Block_byref_object_dispose__16878;
  id v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  long long v5 = [a1 lock];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__HAP2CoAPIO_unregisterConsumer___block_invoke;
  v8[3] = &unk_1E69F2DA0;
  id v13 = a1;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v18;
  id v11 = &v22;
  uint64_t v12 = &v14;
  [v5 performBlock:v8];

  uint64_t v7 = (void *)v23[5];
  if (v7)
  {
    if (*((unsigned char *)v19 + 24)) {
      [v7 unregisterConsumer:v6];
    }
    if (*((unsigned char *)v15 + 24)) {
      [(id)v23[5] cancel];
    }
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

void __33__HAP2CoAPIO_unregisterConsumer___block_invoke(uint64_t a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__16877;
  uint64_t v19 = __Block_byref_object_dispose__16878;
  id v20 = 0;
  v2 = [*(id *)(a1 + 64) consumers];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33__HAP2CoAPIO_unregisterConsumer___block_invoke_2;
  v11[3] = &unk_1E69F2D78;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v12 = v3;
  uint64_t v13 = v4;
  uint64_t v14 = &v15;
  [v2 enumerateObjectsUsingBlock:v11];

  if (v16[5])
  {
    uint64_t v5 = [*(id *)(a1 + 64) thread];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = [*(id *)(a1 + 64) consumers];
    [v8 removeObjectsAtIndexes:v16[5]];

    id v9 = [*(id *)(a1 + 64) consumers];
    uint64_t v10 = [v9 count];

    if (!v10)
    {
      [*(id *)(a1 + 64) setConsumers:0];
      [*(id *)(a1 + 64) setThread:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __33__HAP2CoAPIO_unregisterConsumer___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 consumer];
  uint64_t v6 = v5;
  if (v5 == a1[4])
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    if (!v5)
    {
LABEL_6:
      uint64_t v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
      uint64_t v12 = v6;
      if (v7)
      {
        uint64_t v5 = [v7 addIndex:a3];
      }
      else
      {
        uint64_t v8 = [MEMORY[0x1E4F28E60] indexSetWithIndex:a3];
        uint64_t v9 = *(void *)(a1[6] + 8);
        uint64_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;
      }
      uint64_t v6 = v12;
      goto LABEL_10;
    }
  }
  else if (!v5)
  {
    goto LABEL_6;
  }
  if (v5 == a1[4]) {
    goto LABEL_6;
  }
LABEL_10:

  return MEMORY[0x1F41817F8](v5, v6);
}

+ (void)registerConsumer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[HAP2CoAPIOConsumerWeakHolder alloc] initWithConsumer:v4];
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__16877;
  uint64_t v24 = __Block_byref_object_dispose__16878;
  id v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v6 = [a1 lock];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __31__HAP2CoAPIO_registerConsumer___block_invoke;
  v10[3] = &unk_1E69F2D50;
  id v15 = a1;
  id v7 = v4;
  id v11 = v7;
  uint64_t v8 = v5;
  uint64_t v12 = v8;
  uint64_t v13 = &v20;
  uint64_t v14 = &v16;
  [v6 performBlock:v10];

  uint64_t v9 = (void *)v21[5];
  if (v9)
  {
    [v9 registerConsumer:v7];
    if (*((unsigned char *)v17 + 24)) {
      [(id)v21[5] start];
    }
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
}

void __31__HAP2CoAPIO_registerConsumer___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 64) consumers];

  if (v2)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    id v3 = [*(id *)(a1 + 64) consumers];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __31__HAP2CoAPIO_registerConsumer___block_invoke_2;
    v14[3] = &unk_1E69F2D28;
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = &v17;
    [v3 enumerateObjectsUsingBlock:v14];

    if (*((unsigned char *)v18 + 24))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v4 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_error_impl(&dword_1D4758000, v4, OS_LOG_TYPE_ERROR, "Registering the same consumer twice", v13, 2u);
      }
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 64) consumers];
      [v9 addObject:*(void *)(a1 + 40)];

      uint64_t v10 = [*(id *)(a1 + 64) thread];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 64) setConsumers:v5];

    uint64_t v6 = objc_opt_new();
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [*(id *)(a1 + 64) setThread:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __31__HAP2CoAPIO_registerConsumer___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 consumer];
  uint64_t v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (BOOL)isRunning
{
  id v2 = a1;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [a1 lock];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__HAP2CoAPIO_isRunning__block_invoke;
  v5[3] = &unk_1E69F2D00;
  v5[4] = &v6;
  v5[5] = v2;
  [v3 performBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __23__HAP2CoAPIO_isRunning__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) thread];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2 != 0;
}

+ (void)setThread:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 lock];
  [v5 assertOwner];

  uint64_t v6 = (void *)_thread;
  _thread = (uint64_t)v4;
}

+ (HAP2CoAPIOThread)thread
{
  id v2 = [a1 lock];
  [v2 assertOwner];

  id v3 = (void *)_thread;

  return (HAP2CoAPIOThread *)v3;
}

+ (void)setConsumers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 lock];
  [v5 assertOwner];

  uint64_t v6 = (void *)_consumers;
  _consumers = (uint64_t)v4;
}

+ (NSMutableArray)consumers
{
  id v2 = [a1 lock];
  [v2 assertOwner];

  id v3 = (void *)_consumers;

  return (NSMutableArray *)v3;
}

+ (HAP2Lock)lock
{
  if (lock_onceToken != -1) {
    dispatch_once(&lock_onceToken, &__block_literal_global_16886);
  }
  id v2 = (void *)lock_lock;

  return (HAP2Lock *)v2;
}

uint64_t __18__HAP2CoAPIO_lock__block_invoke()
{
  uint64_t v0 = +[HAP2Lock lockWithName:@"HAP2CoAPIOThread.lock"];
  uint64_t v1 = lock_lock;
  lock_lock = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (HAP2CoAPIO)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end