@interface BWMemoryPool
+ (BWMemoryPool)sharedMemoryPool;
+ (void)initialize;
- (BOOL)getInUseFootprint:(unint64_t *)a3 andOutOfUseFootprint:(unint64_t *)a4;
- (BWMemoryPool)init;
- (id)newFlushAssertion:(id)a3;
- (id)newMTLBufferWithLength:(unint64_t)a3 forDevice:(id)a4;
- (int)disableForCaptureDevice:(id)a3;
- (int)disableForCaptureStream:(id)a3;
- (int)enableForCaptureDevice:(id)a3;
- (int)enableForCaptureStream:(id)a3;
- (uint64_t)_createMemoryPoolWithMaximizeSystemMemory:(uint64_t)result;
- (uint64_t)_ensureMemoryWithSize:(int)a3 withMaximizeSystemMemory:(int)a4 useOptimizedMemorySizeDistributionsIfAvailable:;
- (uint64_t)_maximizeAvailableSystemMemory;
- (uint64_t)_sizesDistributionWithTotalSize:(int)a3 useOptimizedMemorySizeDistributionsIfAvailable:;
- (unint64_t)poolIdentifier;
- (void)_addFlushAssertion;
- (void)_disable;
- (void)_removeFlushAssertion;
- (void)dealloc;
- (void)disable;
- (void)disableWithCompletionHandler:(id)a3;
- (void)enableForPixelBufferAttributes:(id)a3;
- (void)ensureMemoryAsyncWithSize:(unint64_t)a3 withMaximizeSystemMemory:(BOOL)a4 useOptimizedMemorySizeDistributionsIfAvailable:(BOOL)a5;
- (void)flush;
@end

@implementation BWMemoryPool

- (int)enableForCaptureDevice:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__BWMemoryPool_enableForCaptureDevice___block_invoke;
  block[3] = &unk_1E5C25210;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(queue, block);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (unint64_t)poolIdentifier
{
  return [(IOSurfaceMemoryPool *)self->_pool poolId];
}

+ (BWMemoryPool)sharedMemoryPool
{
  if (sharedMemoryPool_initMemoryPool != -1) {
    dispatch_once(&sharedMemoryPool_initMemoryPool, &__block_literal_global_86_0);
  }
  return (BWMemoryPool *)sharedMemoryPool_sMemoryPool;
}

- (void)enableForPixelBufferAttributes:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__BWMemoryPool_enableForPixelBufferAttributes___block_invoke;
  v4[3] = &unk_1E5C24458;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (int)enableForCaptureStream:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__BWMemoryPool_enableForCaptureStream___block_invoke;
  block[3] = &unk_1E5C25210;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(queue, block);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_addFlushAssertion
{
  p_flushAssertionLock = &self->_flushAssertionLock;
  os_unfair_lock_lock(&self->_flushAssertionLock);
  ++self->_flushAssertionCount;
  os_unfair_lock_unlock(p_flushAssertionLock);
}

- (id)newFlushAssertion:(id)a3
{
  v5 = [BWMemoryPoolFlushAssertion alloc];
  return -[BWMemoryPoolFlushAssertion initWithIdentifier:pool:](v5, a3, self);
}

void *__39__BWMemoryPool_enableForCaptureStream___block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 16);
  if (result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "setProperty:value:", *MEMORY[0x1E4F54AD0], objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(result, "poolId")));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    int v4 = *(_DWORD *)(v3 + 24);
    if (v4 == -12784 || v4 == -12787) {
      *(_DWORD *)(v3 + 24) = 0;
    }
  }
  return result;
}

void __114__BWMemoryPool_ensureMemoryAsyncWithSize_withMaximizeSystemMemory_useOptimizedMemorySizeDistributionsIfAvailable___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1A6272C70]();
  -[BWMemoryPool _ensureMemoryWithSize:withMaximizeSystemMemory:useOptimizedMemorySizeDistributionsIfAvailable:](*(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
}

- (uint64_t)_ensureMemoryWithSize:(int)a3 withMaximizeSystemMemory:(int)a4 useOptimizedMemorySizeDistributionsIfAvailable:
{
  uint64_t v4 = a1;
  v21[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2)
    {
      if (*(void *)(a1 + 16) || -[BWMemoryPool _createMemoryPoolWithMaximizeSystemMemory:](a1, a3))
      {
        uint64_t v7 = (void *)-[BWMemoryPool _sizesDistributionWithTotalSize:useOptimizedMemorySizeDistributionsIfAvailable:](v4, a2, a4);
        v8 = *(void **)(v4 + 16);
        uint64_t v20 = *MEMORY[0x1E4F2F110];
        v21[0] = v7;
        long long v15 = 0u;
        long long v16 = 0u;
        uint64_t v4 = objc_msgSend(v8, "ensureMemory:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1)) == 0;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v16;
          uint64_t v12 = *MEMORY[0x1E4F2EFB8];
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v7);
              }
              objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "valueForKey:", v12, (void)v15), "intValue");
            }
            uint64_t v10 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v10);
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return v4;
}

- (uint64_t)_sizesDistributionWithTotalSize:(int)a3 useOptimizedMemorySizeDistributionsIfAvailable:
{
  v26[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    double v3 = (double)(unint64_t)(a2 << 20);
    unint64_t v4 = (unint64_t)((v3 + v3) / 6.0);
    unint64_t v5 = (unint64_t)(v3 / 6.0);
    unint64_t v6 = (unint64_t)(v3 * 3.0 / 6.0);
    if (a3)
    {
      uint64_t v7 = objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "commonSettings");
      if ((int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "memoryPoolSizeDistributions"), "objectForKeyedSubscript:", @"Default"), "intValue") >= 1)unint64_t v4 = (int)(objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "memoryPoolSizeDistributions"), "objectForKeyedSubscript:", @"Default"), "intValue") << 20); {
      if ((int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "memoryPoolSizeDistributions"), "objectForKeyedSubscript:", @"WriteCombine"), "intValue") >= 1)unint64_t v5 = (int)(objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "memoryPoolSizeDistributions"), "objectForKeyedSubscript:", @"WriteCombine"), "intValue") << 20);
      }
      if ((MEMORY[0xFFFFFC021] & 8) != 0)
      {
        if ((int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "memoryPoolSizeDistributions"), "objectForKeyedSubscript:", @"RealTime"), "intValue") >= 1)unint64_t v6 = (int)(objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "memoryPoolSizeDistributions"), "objectForKeyedSubscript:", @"RealTime"), "intValue") << 20); {
        goto LABEL_12;
        }
      }
    }
    else if ((MEMORY[0xFFFFFC021] & 8) != 0)
    {
LABEL_12:
      uint64_t v14 = *MEMORY[0x1E4F2EFB8];
      v24[0] = *MEMORY[0x1E4F2EFE8];
      uint64_t v13 = v24[0];
      v24[1] = v14;
      v25[0] = &unk_1EFB01130;
      v25[1] = [NSNumber numberWithUnsignedLong:v6];
      v26[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
      v22[1] = v14;
      v23[0] = &unk_1EFB01118;
      v22[0] = v13;
      v23[1] = [NSNumber numberWithUnsignedLong:v4];
      v26[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
      v20[1] = v14;
      v21[0] = &unk_1EFB01148;
      v20[0] = v13;
      v21[1] = [NSNumber numberWithUnsignedLong:v5];
      v26[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v11 = v26;
      uint64_t v12 = 3;
      return [v10 arrayWithObjects:v11 count:v12];
    }
    uint64_t v9 = *MEMORY[0x1E4F2EFB8];
    v17[0] = *MEMORY[0x1E4F2EFE8];
    uint64_t v8 = v17[0];
    v17[1] = v9;
    v18[0] = &unk_1EFB01118;
    v18[1] = [NSNumber numberWithUnsignedLong:v4];
    v19[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    v16[1] = objc_msgSend(NSNumber, "numberWithUnsignedLong:", v5, v8, v9, &unk_1EFB01148);
    v19[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:2];
    uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v11 = v19;
    uint64_t v12 = 2;
    return [v10 arrayWithObjects:v11 count:v12];
  }
  return result;
}

- (uint64_t)_createMemoryPoolWithMaximizeSystemMemory:(uint64_t)result
{
  v10[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v8 = v2;
      LODWORD(v7) = 0;
      FigDebugAssert3();
    }
    if (*(void *)(v4 + 16)) {
      return 1;
    }
    if (a2) {
      -[BWMemoryPool _maximizeAvailableSystemMemory](v4);
    }
    v9[0] = *MEMORY[0x1E4F2F118];
    v10[0] = objc_msgSend(NSNumber, "numberWithBool:", 1, v7, v8);
    v9[1] = *MEMORY[0x1E4F2F108];
    v9[2] = @"IOSurfaceMemoryPoolEntitlement";
    v10[1] = [NSNumber numberWithBool:1];
    v10[2] = @"com.apple.private.cameracapture.memorypool";
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
    unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F2EF88]) initWithProperties:v5];
    *(void *)(v4 + 16) = v6;
    result = [v6 poolId];
    if (result) {
      return 1;
    }
  }
  return result;
}

void *__39__BWMemoryPool_enableForCaptureDevice___block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 16);
  if (result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "setProperty:value:", *MEMORY[0x1E4F52D88], objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(result, "poolId")));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    int v4 = *(_DWORD *)(v3 + 24);
    if (v4 == -12784 || v4 == -12787) {
      *(_DWORD *)(v3 + 24) = 0;
    }
  }
  return result;
}

void __47__BWMemoryPool_enableForPixelBufferAttributes___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v3 = *MEMORY[0x1E4F24D20];
    id v5 = (id)objc_msgSend(v2, "initWithDictionary:", objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E4F24D20]));
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "poolId"));
    [v5 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F2EFC0]];
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v3];
  }
}

- (uint64_t)_maximizeAvailableSystemMemory
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 32))
    {
      if (dword_1EB4C56B0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F78DB8]) initWithPolicy:@"Camera" description:@"com.apple.cameracapture"];
      *(void *)(v1 + 32) = v3;
      return [v3 acquireWithCompletionHandler:&__block_literal_global_94];
    }
  }
  return result;
}

- (void)ensureMemoryAsyncWithSize:(unint64_t)a3 withMaximizeSystemMemory:(BOOL)a4 useOptimizedMemorySizeDistributionsIfAvailable:(BOOL)a5
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__BWMemoryPool_ensureMemoryAsyncWithSize_withMaximizeSystemMemory_useOptimizedMemorySizeDistributionsIfAvailable___block_invoke;
  block[3] = &unk_1E5C2B028;
  block[4] = self;
  block[5] = a3;
  BOOL v7 = a4;
  BOOL v8 = a5;
  dispatch_async(queue, block);
}

BWMemoryPool *__32__BWMemoryPool_sharedMemoryPool__block_invoke()
{
  result = objc_alloc_init(BWMemoryPool);
  sharedMemoryPool_sMemoryPool = (uint64_t)result;
  return result;
}

- (BWMemoryPool)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWMemoryPool;
  id v2 = [(BWMemoryPool *)&v5 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.memorypool", v3);
    *(void *)&v2->_flushAssertionCount = 0;
  }
  return v2;
}

void __21__BWMemoryPool_flush__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1A6272C70]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    [*(id *)(v3 + 16) flush:MEMORY[0x1E4F1CC08]];
  }
}

- (void)_removeFlushAssertion
{
  p_flushAssertionLock = &self->_flushAssertionLock;
  os_unfair_lock_lock(&self->_flushAssertionLock);
  unsigned int v4 = self->_flushAssertionCount - 1;
  self->_flushAssertionCount = v4;
  os_unfair_lock_unlock(p_flushAssertionLock);
  if (!v4)
  {
    [(BWMemoryPool *)self flush];
  }
}

- (void)flush
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__BWMemoryPool_flush__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(queue, block);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

void __46__BWMemoryPool__maximizeAvailableSystemMemory__block_invoke()
{
  if (dword_1EB4C56B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)dealloc
{
  -[BWMemoryPool _disable]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWMemoryPool;
  [(BWMemoryPool *)&v3 dealloc];
}

- (void)_disable
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {

    *(void *)(a1 + 16) = 0;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 28));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 28));
    id v2 = *(void **)(a1 + 32);
    if (v2)
    {
      if (dword_1EB4C56B0)
      {
        int v7 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        id v2 = *(void **)(a1 + 32);
      }
      id v4 = v2;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __24__BWMemoryPool__disable__block_invoke;
      v5[3] = &unk_1E5C24430;
      v5[4] = v4;
      [v4 invalidateWithCompletionHandler:v5];

      *(void *)(a1 + 32) = 0;
    }
  }
}

- (void)disable
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__BWMemoryPool_disable__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __23__BWMemoryPool_disable__block_invoke(uint64_t a1)
{
}

- (void)disableWithCompletionHandler:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__BWMemoryPool_disableWithCompletionHandler___block_invoke;
  v4[3] = &unk_1E5C24E50;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __45__BWMemoryPool_disableWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1A6272C70]();
  -[BWMemoryPool _disable](*(void *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

- (int)disableForCaptureStream:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__BWMemoryPool_disableForCaptureStream___block_invoke;
  v6[3] = &unk_1E5C246B8;
  v6[4] = a3;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__BWMemoryPool_disableForCaptureStream___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setProperty:*MEMORY[0x1E4F52D88] value:&unk_1EFB01118];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(_DWORD *)(v3 + 24);
  if (v4 == -12784 || v4 == -12787) {
    *(_DWORD *)(v3 + 24) = 0;
  }
  return result;
}

- (id)newMTLBufferWithLength:(unint64_t)a3 forDevice:(id)a4
{
  v19[4] = *MEMORY[0x1E4F143B8];
  pool = self->_pool;
  if (!pool) {
    return (id)objc_msgSend(a4, "newBufferWithLength:options:", a3, 0, v16, v17);
  }
  v18[0] = *MEMORY[0x1E4F2EFC0];
  v19[0] = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[IOSurfaceMemoryPool poolId](pool, "poolId"));
  v18[1] = *MEMORY[0x1E4F2EFB8];
  uint64_t v8 = [NSNumber numberWithUnsignedLong:a3];
  uint64_t v9 = *MEMORY[0x1E4F2EFE8];
  v19[1] = v8;
  void v19[2] = &unk_1EFB01118;
  uint64_t v10 = *MEMORY[0x1E4F2F130];
  void v18[2] = v9;
  v18[3] = v10;
  v19[3] = MEMORY[0x1E4F1CC38];
  IOSurfaceRef v11 = IOSurfaceCreate((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4]);
  if (!v11)
  {
    uint64_t v17 = v4;
    LODWORD(v16) = 0;
    FigDebugAssert3();
    return (id)objc_msgSend(a4, "newBufferWithLength:options:", a3, 0, v16, v17);
  }
  IOSurfaceRef v12 = v11;
  uint64_t v13 = [a4 newBufferWithIOSurface:v11];
  if (!v13)
  {
    uint64_t v17 = v4;
    LODWORD(v16) = 0;
    FigDebugAssert3();
    CFRelease(v12);
    return (id)objc_msgSend(a4, "newBufferWithLength:options:", a3, 0, v16, v17);
  }
  uint64_t v14 = (void *)v13;
  CFRelease(v12);
  return v14;
}

- (int)disableForCaptureDevice:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__BWMemoryPool_disableForCaptureDevice___block_invoke;
  v6[3] = &unk_1E5C246B8;
  v6[4] = a3;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__BWMemoryPool_disableForCaptureDevice___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setProperty:*MEMORY[0x1E4F52D88] value:&unk_1EFB01118];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(_DWORD *)(v3 + 24);
  if (v4 == -12784 || v4 == -12787) {
    *(_DWORD *)(v3 + 24) = 0;
  }
  return result;
}

void __24__BWMemoryPool__disable__block_invoke(uint64_t a1)
{
  if (dword_1EB4C56B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (BOOL)getInUseFootprint:(unint64_t *)a3 andOutOfUseFootprint:(unint64_t *)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__BWMemoryPool_getInUseFootprint_andOutOfUseFootprint___block_invoke;
  v7[3] = &unk_1E5C2B050;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(queue, v7);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __55__BWMemoryPool_getInUseFootprint_andOutOfUseFootprint___block_invoke(void *a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1[4] + 16);
  if (v1)
  {
    id v2 = (void *)[v1 copyDebugInfo];
    obuint64_t j = (id)[v2 objectForKeyedSubscript:@"InUse"];
    uint64_t v3 = (void *)[v2 objectForKeyedSubscript:@"OutOfUse"];
    if ([v3 count] == 1)
    {
      v28 = v2;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      int v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", 0), "objectForKeyedSubscript:", @"Buckets");
      uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = 0;
        uint64_t v8 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v40 != v8) {
              objc_enumerationMutation(v4);
            }
            uint64_t v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            char v11 = (void *)[v10 objectForKeyedSubscript:@"Bucket buffer size"];
            IOSurfaceRef v12 = (void *)[v10 objectForKeyedSubscript:@"Descriptors"];
            uint64_t v13 = [v11 integerValue];
            v7 += [v12 count] * v13;
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v6);
      }
      else
      {
        uint64_t v7 = 0;
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = 0;
        uint64_t v17 = *(void *)v36;
        while (2)
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v36 != v17) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v35 + 1) + 8 * j);
            uint64_t v20 = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", @"Pool Id"), "unsignedLongLongValue");
            if (v20 != [*(id *)(a1[4] + 16) poolId])
            {
              *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
              goto LABEL_35;
            }
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            v21 = (void *)[v19 objectForKeyedSubscript:@"Components"];
            uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v43 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v32;
              do
              {
                for (uint64_t k = 0; k != v23; ++k)
                {
                  if (*(void *)v32 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  v16 += objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * k), "objectForKeyedSubscript:", @"Length"), "unsignedLongLongValue");
                }
                uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v43 count:16];
              }
              while (v23);
            }
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
      else
      {
        uint64_t v16 = 0;
      }
      v26 = (void *)a1[6];
      if (v26) {
        void *v26 = v16;
      }
      v27 = (void *)a1[7];
      if (v27) {
        void *v27 = v7;
      }
LABEL_35:
      id v2 = v28;
    }
    else
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
}

@end