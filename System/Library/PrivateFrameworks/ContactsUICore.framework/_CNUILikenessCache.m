@interface _CNUILikenessCache
+ (id)log;
- (CNCache)cache;
- (CNUnfairLock)lock;
- (OS_dispatch_queue)backgroundQueue;
- (OS_dispatch_source)memoryMonitoringSource;
- (_CNUILikenessCache)initWithCapacity:(unint64_t)a3;
- (id)objectForKey:(id)a3 onCacheMiss:(id)a4;
- (void)emptyCache:(id)a3;
- (void)receiveDatabaseChangeNotification:(id)a3;
- (void)receiveMemoryPressureSignal;
- (void)setBackgroundQueue:(id)a3;
- (void)setCache:(id)a3;
- (void)setLock:(id)a3;
- (void)setMemoryMonitoringSource:(id)a3;
- (void)setUpDatabaseChangeNotificationHandler;
- (void)setUpEvictionHandler;
- (void)setUpIvarsWithCacheCapacity:(unint64_t)a3;
- (void)setUpMemoryPressureWatcher;
@end

@implementation _CNUILikenessCache

+ (id)log
{
  if (log_cn_once_token_1_1 != -1) {
    dispatch_once(&log_cn_once_token_1_1, &__block_literal_global_30);
  }
  v2 = (void *)log_cn_once_object_1_1;
  return v2;
}

- (_CNUILikenessCache)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_CNUILikenessCache;
  v4 = [(_CNUILikenessCache *)&v8 init];
  v5 = v4;
  if (v4)
  {
    [(_CNUILikenessCache *)v4 setUpIvarsWithCacheCapacity:a3];
    [(_CNUILikenessCache *)v5 setUpEvictionHandler];
    [(_CNUILikenessCache *)v5 setUpDatabaseChangeNotificationHandler];
    [(_CNUILikenessCache *)v5 setUpMemoryPressureWatcher];
    v6 = v5;
  }

  return v5;
}

- (void)setUpIvarsWithCacheCapacity:(unint64_t)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = objc_alloc(MEMORY[0x263F33568]);
  v6 = [MEMORY[0x263F33568] boundingStrategyWithCapacity:a3];
  v16[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  objc_super v8 = [MEMORY[0x263F33568] nonatomicCacheScheduler];
  v9 = (CNCache *)[v5 initWithBoundingStrategies:v7 resourceScheduler:v8];
  cache = self->_cache;
  self->_cache = v9;

  v11 = (CNUnfairLock *)objc_alloc_init(MEMORY[0x263F33690]);
  lock = self->_lock;
  self->_lock = v11;

  v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.contacts.ui.likeness-cache.deallocator", v13);
  backgroundQueue = self->_backgroundQueue;
  self->_backgroundQueue = v14;
}

- (void)setUpEvictionHandler
{
  objc_initWeak(&location, self);
  cache = self->_cache;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42___CNUILikenessCache_setUpEvictionHandler__block_invoke;
  v4[3] = &unk_264018390;
  objc_copyWeak(&v5, &location);
  [(CNCache *)cache addDidEvictHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setUpDatabaseChangeNotificationHandler
{
  id v4 = [MEMORY[0x263F335C8] currentEnvironment];
  v3 = [v4 notificationCenter];
  [v3 addObserver:self selector:sel_receiveDatabaseChangeNotification_ name:*MEMORY[0x263EFE118] object:0];
}

- (void)setUpMemoryPressureWatcher
{
  v3 = [(_CNUILikenessCache *)self backgroundQueue];
  id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83D8], 0, 6uLL, v3);
  memoryMonitoringSource = self->_memoryMonitoringSource;
  self->_memoryMonitoringSource = v4;

  objc_initWeak(&location, self);
  v6 = self->_memoryMonitoringSource;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48___CNUILikenessCache_setUpMemoryPressureWatcher__block_invoke;
  v7[3] = &unk_2640177E8;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_memoryMonitoringSource);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)objectForKey:(id)a3 onCacheMiss:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_CNUILikenessCache *)self lock];
  v13 = v6;
  v14 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = CNResultWithLock();

  return v11;
}

- (void)receiveDatabaseChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_20B704000, v5, OS_LOG_TYPE_DEFAULT, "Database change notification received", v6, 2u);
  }

  [(_CNUILikenessCache *)self emptyCache:v4];
}

- (void)receiveMemoryPressureSignal
{
  v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_20B704000, v3, OS_LOG_TYPE_DEFAULT, "Memory pressure signal received", v4, 2u);
  }

  [(_CNUILikenessCache *)self emptyCache:0];
}

- (void)emptyCache:(id)a3
{
  v3 = [(_CNUILikenessCache *)self lock];
  CNRunWithLock();
}

- (OS_dispatch_source)memoryMonitoringSource
{
  return self->_memoryMonitoringSource;
}

- (void)setMemoryMonitoringSource:(id)a3
{
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (void)setBackgroundQueue:(id)a3
{
}

- (CNCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (CNUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_memoryMonitoringSource, 0);
}

@end