@interface _CNUILikenessImageCache
- (CNCache)cache;
- (CNQueue)evictionQueue;
- (CNUnfairLock)lock;
- (OS_dispatch_source)memoryMonitoringSource;
- (_CNUILikenessImageCache)initWithCapacity:(unint64_t)a3 hasContactStore:(BOOL)a4;
- (void)emptyCache:(id)a3;
- (void)invalidateCacheEntriesContainingIdentifiers:(id)a3;
- (void)setCache:(id)a3;
- (void)setEvictionQueue:(id)a3;
- (void)setLock:(id)a3;
- (void)setMemoryMonitoringSource:(id)a3;
- (void)touchCacheKey:(id)a3;
@end

@implementation _CNUILikenessImageCache

- (CNCache)cache
{
  return self->_cache;
}

- (void)touchCacheKey:(id)a3
{
  id v4 = a3;
  v5 = [(_CNUILikenessImageCache *)self evictionQueue];
  [v5 dequeueObject:v4];

  id v6 = [(_CNUILikenessImageCache *)self evictionQueue];
  [v6 enqueue:v4];
}

- (CNQueue)evictionQueue
{
  return self->_evictionQueue;
}

- (CNUnfairLock)lock
{
  return self->_lock;
}

- (_CNUILikenessImageCache)initWithCapacity:(unint64_t)a3 hasContactStore:(BOOL)a4
{
  v26.receiver = self;
  v26.super_class = (Class)_CNUILikenessImageCache;
  id v6 = [(_CNUILikenessImageCache *)&v26 init];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F33568]);
    v8 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v7;

    id v9 = objc_alloc_init(MEMORY[0x263F33690]);
    v10 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v9;

    objc_initWeak(&location, v6);
    v11 = (void *)MEMORY[0x263F33640];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __60___CNUILikenessImageCache_initWithCapacity_hasContactStore___block_invoke;
    v23[3] = &unk_2640194B0;
    objc_copyWeak(&v24, &location);
    uint64_t v12 = [v11 boundedQueueWithCapacity:a3 overflowHandler:v23];
    v13 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v12;

    if (!a4)
    {
      v14 = +[CNUICoreLogProvider likenesses_os_log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20B704000, v14, OS_LOG_TYPE_INFO, "No contact store provided, will empty cache on CNContactStoreDidChangeNotification", buf, 2u);
      }

      v15 = [MEMORY[0x263F08A00] defaultCenter];
      [v15 addObserver:v6 selector:sel_emptyCache_ name:*MEMORY[0x263EFE118] object:0];
    }
    dispatch_source_t v16 = dispatch_source_create(MEMORY[0x263EF83D8], 0, 6uLL, MEMORY[0x263EF83A0]);
    v17 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v16;

    v18 = *((void *)v6 + 4);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __60___CNUILikenessImageCache_initWithCapacity_hasContactStore___block_invoke_7;
    handler[3] = &unk_2640177E8;
    objc_copyWeak(&v21, &location);
    dispatch_source_set_event_handler(v18, handler);
    dispatch_resume(*((dispatch_object_t *)v6 + 4));
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return (_CNUILikenessImageCache *)v6;
}

- (void)emptyCache:(id)a3
{
  v3 = [(_CNUILikenessImageCache *)self lock];
  CNRunWithLock();
}

- (void)invalidateCacheEntriesContainingIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [(_CNUILikenessImageCache *)self lock];
  id v6 = v4;
  CNRunWithLock();
}

- (void)setCache:(id)a3
{
}

- (void)setEvictionQueue:(id)a3
{
}

- (void)setLock:(id)a3
{
}

- (OS_dispatch_source)memoryMonitoringSource
{
  return self->_memoryMonitoringSource;
}

- (void)setMemoryMonitoringSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryMonitoringSource, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_evictionQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end