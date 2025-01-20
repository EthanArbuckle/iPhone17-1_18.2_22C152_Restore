@interface AAUICommandQueueRegistry
+ (id)sharedRegistry;
- (AAUICommandQueueRegistry)init;
- (id)commandQueue;
- (id)sharedDevice;
- (void)_appDidBecomeActive;
- (void)_appWillBecomeInactive;
- (void)_locked_cacheCommandQueueIfNeeded;
- (void)addCommandQueueTransaction:(id)a3;
- (void)removeCommandQueueTransaction:(id)a3;
@end

@implementation AAUICommandQueueRegistry

- (void)addCommandQueueTransaction:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_transactions addObject:v5];

  [(AAUICommandQueueRegistry *)self _locked_cacheCommandQueueIfNeeded];
  os_unfair_lock_unlock(p_lock);
}

- (void)_locked_cacheCommandQueueIfNeeded
{
  if (!self->_cachedCommandQueue && [(NSHashTable *)self->_transactions count])
  {
    v3 = ACHLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_229290000, v3, OS_LOG_TYPE_DEFAULT, "[AAUICommandQueueRegistry] Creating new command queue", v6, 2u);
    }

    v4 = (MTLCommandQueue *)[(MTLDevice *)self->_device newCommandQueue];
    cachedCommandQueue = self->_cachedCommandQueue;
    self->_cachedCommandQueue = v4;
  }
}

+ (id)sharedRegistry
{
  if (sharedRegistry_onceToken != -1) {
    dispatch_once(&sharedRegistry_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedRegistry_registry;
  return v2;
}

- (id)sharedDevice
{
  return self->_device;
}

- (id)commandQueue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(AAUICommandQueueRegistry *)self _locked_cacheCommandQueueIfNeeded];
  v4 = self->_cachedCommandQueue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

uint64_t __42__AAUICommandQueueRegistry_sharedRegistry__block_invoke()
{
  sharedRegistry_registry = objc_alloc_init(AAUICommandQueueRegistry);
  return MEMORY[0x270F9A758]();
}

- (AAUICommandQueueRegistry)init
{
  v10.receiver = self;
  v10.super_class = (Class)AAUICommandQueueRegistry;
  v2 = [(AAUICommandQueueRegistry *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    transactions = v2->_transactions;
    v2->_transactions = (NSHashTable *)v3;

    id v5 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v2->_device;
    v2->_device = v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel__appDidBecomeActive name:*MEMORY[0x263F833B8] object:0];

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v2 selector:sel__appWillBecomeInactive name:*MEMORY[0x263F83330] object:0];
  }
  return v2;
}

- (void)_appDidBecomeActive
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(AAUICommandQueueRegistry *)self _locked_cacheCommandQueueIfNeeded];
  v4 = ACHLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    cachedCommandQueue = self->_cachedCommandQueue;
    int v6 = 138412290;
    v7 = cachedCommandQueue;
    _os_log_impl(&dword_229290000, v4, OS_LOG_TYPE_DEFAULT, "[AAUICommandQueueRegistry] App entered foreground with command queue: %@", (uint8_t *)&v6, 0xCu);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)removeCommandQueueTransaction:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_transactions removeObject:v5];

  if (![(NSHashTable *)self->_transactions count])
  {
    int v6 = ACHLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_229290000, v6, OS_LOG_TYPE_DEFAULT, "[AAUICommandQueueRegistry] Removed last command queue transaction, clearing command queue", v8, 2u);
    }

    cachedCommandQueue = self->_cachedCommandQueue;
    self->_cachedCommandQueue = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_appWillBecomeInactive
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_cachedCommandQueue)
  {
    v4 = ACHLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_229290000, v4, OS_LOG_TYPE_DEFAULT, "[AAUICommandQueueRegistry] App backgrounded, clearing command queue", v6, 2u);
    }

    cachedCommandQueue = self->_cachedCommandQueue;
    self->_cachedCommandQueue = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_cachedCommandQueue, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
}

@end