@interface AVCallbackContextRegistry
+ (id)sharedCallbackContextRegistry;
+ (void)initialize;
- (AVCallbackContextRegistry)init;
- (id)callbackContextForToken:(void *)a3;
- (void)dealloc;
- (void)registerCallbackContextObject:(id)a3;
- (void)unregisterCallbackContextForToken:(void *)a3;
@end

@implementation AVCallbackContextRegistry

uint64_t __59__AVCallbackContextRegistry_registerCallbackContextObject___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(v2 + 16) + 1;
  *(void *)(v2 + 16) = v3;
  *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  uint64_t v4 = [MEMORY[0x1E4F29238] valueWithPointer:*(void *)(*(void *)(a1[6] + 8) + 24)];
  uint64_t v5 = a1[5];
  v6 = *(void **)(a1[4] + 8);
  return [v6 setObject:v5 forKey:v4];
}

+ (id)sharedCallbackContextRegistry
{
  return (id)_sSharedCallbackContextRegistry;
}

id __53__AVCallbackContextRegistry_callbackContextForToken___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 8) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  *(void *)(*(void *)(a1[7] + 8) + 24) = *(void *)(a1[4] + 16);
  return result;
}

- (void)registerCallbackContextObject:(id)a3
{
  if (!a3)
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"callbackContext != nil"), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  v9 = [[AVWeakReference alloc] initWithReferencedObject:a3];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AVCallbackContextRegistry_registerCallbackContextObject___block_invoke;
  block[3] = &unk_1E57B3270;
  block[5] = v9;
  block[6] = &v15;
  block[4] = self;
  av_readwrite_dispatch_queue_write(readWriteQueue, block);

  v11 = (void *)v16[3];
  _Block_object_dispose(&v15, 8);
  return v11;
}

- (id)callbackContextForToken:(void *)a3
{
  if (!a3)
  {
    v21 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"callbackContextToken != AVCallbackContextTokenInvalid"), 0 reason userInfo];
    objc_exception_throw(v21);
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:");
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__31;
  v31 = __Block_byref_object_dispose__31;
  uint64_t v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AVCallbackContextRegistry_callbackContextForToken___block_invoke;
  block[3] = &unk_1E57B6680;
  block[4] = self;
  block[5] = v11;
  block[6] = &v27;
  void block[7] = &v23;
  av_readwrite_dispatch_queue_read(readWriteQueue, block);
  if (v24[3] < (unint64_t)a3)
  {
    uint64_t v18 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot look up token %p that was not vended by %@.  Break on AVCallbackContextRegistryUnrecognizedTokenBreak() to debug.", v13, v14, v15, v16, v17, (uint64_t)a3);
    NSLog(&stru_1EE596A18.isa, v18, self);
  }
  v19 = (void *)[(id)v28[5] referencedObject];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  return v19;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _sSharedCallbackContextRegistry = objc_alloc_init(AVCallbackContextRegistry);
  }
}

- (AVCallbackContextRegistry)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCallbackContextRegistry;
  uint64_t v2 = [(AVCallbackContextRegistry *)&v5 init];
  if (v2)
  {
    v2->_contextsForTokens = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dispatch_queue_t v3 = av_readwrite_dispatch_queue_create((const char *)[(id)objc_msgSend(NSString stringWithFormat:@"%@ read/write queue", v2), "UTF8String"]);
    v2->_currentToken = 0;
    v2->_readWriteQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  readWriteQueue = self->_readWriteQueue;
  if (readWriteQueue) {
    dispatch_release(readWriteQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVCallbackContextRegistry;
  [(AVCallbackContextRegistry *)&v4 dealloc];
}

- (void)unregisterCallbackContextForToken:(void *)a3
{
  if (!a3)
  {
    v19 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"callbackContextToken != AVCallbackContextTokenInvalid"), 0 reason userInfo];
    objc_exception_throw(v19);
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:");
  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AVCallbackContextRegistry_unregisterCallbackContextForToken___block_invoke;
  block[3] = &unk_1E57B21B0;
  block[4] = self;
  block[5] = v11;
  block[6] = &v21;
  av_readwrite_dispatch_queue_write(readWriteQueue, block);
  if (v22[3] < (unint64_t)a3)
  {
    uint64_t v18 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot unregister token %p that was not vended by %@.  Break on AVCallbackContextRegistryUnrecognizedTokenBreak() to debug.", v13, v14, v15, v16, v17, (uint64_t)a3);
    NSLog(&stru_1EE596A18.isa, v18, self);
  }
  _Block_object_dispose(&v21, 8);
}

uint64_t __63__AVCallbackContextRegistry_unregisterCallbackContextForToken___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 16);
  return result;
}

@end