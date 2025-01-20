@interface FMNSXPCConnectionCache
+ (FMNSXPCConnectionCache)sharedCache;
- (FMNSXPCConnectionCache)init;
- (NSMutableDictionary)connectionsByServiceName;
- (OS_dispatch_queue)modsSerialQueue;
- (id)resumeConnectionWithConfiguration:(id)a3;
- (void)dealloc;
- (void)setConnectionsByServiceName:(id)a3;
- (void)setModsSerialQueue:(id)a3;
@end

@implementation FMNSXPCConnectionCache

uint64_t __37__FMNSXPCConnectionCache_sharedCache__block_invoke()
{
  sharedCache__instance = objc_alloc_init(FMNSXPCConnectionCache);

  return MEMORY[0x1F41817F8]();
}

- (FMNSXPCConnectionCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)FMNSXPCConnectionCache;
  v2 = [(FMNSXPCConnectionCache *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("FMD-NSXPC-Mods-Queue", 0);
    modsSerialQueue = v2->_modsSerialQueue;
    v2->_modsSerialQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    connectionsByServiceName = v2->_connectionsByServiceName;
    v2->_connectionsByServiceName = (NSMutableDictionary *)v5;
  }
  return v2;
}

void __60__FMNSXPCConnectionCache_resumeConnectionWithConfiguration___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connectionsByServiceName];
  dispatch_queue_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3 || [v3 state] != 1)
  {
    v4 = [[FMNSXPCConnection alloc] initWithConfiguration:*(void *)(a1 + 48)];

    uint64_t v5 = [*(id *)(a1 + 32) connectionsByServiceName];
    [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

    objc_initWeak(&location, *(id *)(a1 + 32));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__FMNSXPCConnectionCache_resumeConnectionWithConfiguration___block_invoke_2;
    v9[3] = &unk_1E689BF50;
    objc_copyWeak(&v11, &location);
    id v10 = *(id *)(a1 + 40);
    [(FMNSXPCConnection *)v4 addFailureBlock:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    dispatch_queue_t v3 = v4;
  }
  v6 = [[FMNSXPCCachedConnection alloc] initWithFMNSXPCConnection:v3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  objc_super v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (NSMutableDictionary)connectionsByServiceName
{
  return self->_connectionsByServiceName;
}

- (id)resumeConnectionWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v5 = [v4 serviceName];
  if (v5)
  {
    v6 = [(FMNSXPCConnectionCache *)self modsSerialQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__FMNSXPCConnectionCache_resumeConnectionWithConfiguration___block_invoke;
    v10[3] = &unk_1E689BF78;
    v10[4] = self;
    id v11 = v5;
    id v12 = v4;
    v13 = &v14;
    dispatch_sync(v6, v10);

    id v7 = (id)v15[5];
  }
  else
  {
    objc_super v8 = LogCategory_Unspecified();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FMNSXPCConnectionCache resumeConnectionWithConfiguration:](v8);
    }

    id v7 = 0;
  }

  _Block_object_dispose(&v14, 8);

  return v7;
}

- (OS_dispatch_queue)modsSerialQueue
{
  return self->_modsSerialQueue;
}

+ (FMNSXPCConnectionCache)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedCache__instance;

  return (FMNSXPCConnectionCache *)v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = [(FMNSXPCConnectionCache *)self modsSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__FMNSXPCConnectionCache_dealloc__block_invoke;
  block[3] = &unk_1E689BF00;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)FMNSXPCConnectionCache;
  [(FMNSXPCConnectionCache *)&v4 dealloc];
}

void __33__FMNSXPCConnectionCache_dealloc__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connectionsByServiceName];
  v1 = [v2 allValues];
  [v1 enumerateObjectsUsingBlock:&__block_literal_global_5];
}

uint64_t __33__FMNSXPCConnectionCache_dealloc__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

void __60__FMNSXPCConnectionCache_resumeConnectionWithConfiguration___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_queue_t v3 = [WeakRetained modsSerialQueue];
  if (v3)
  {
    objc_initWeak(&location, WeakRetained);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__FMNSXPCConnectionCache_resumeConnectionWithConfiguration___block_invoke_3;
    block[3] = &unk_1E689BF28;
    objc_copyWeak(&v6, &location);
    id v5 = *(id *)(a1 + 32);
    dispatch_async(v3, block);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __60__FMNSXPCConnectionCache_resumeConnectionWithConfiguration___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained connectionsByServiceName];
  [v2 removeObjectForKey:*(void *)(a1 + 32)];
}

- (void)setModsSerialQueue:(id)a3
{
}

- (void)setConnectionsByServiceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionsByServiceName, 0);

  objc_storeStrong((id *)&self->_modsSerialQueue, 0);
}

- (void)resumeConnectionWithConfiguration:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0E93000, log, OS_LOG_TYPE_ERROR, "FMDNSXPCConnectionCache Invalid configuration", v1, 2u);
}

@end