@interface ATXSigtermListener
+ (id)sharedInstance;
- (ATXSigtermListener)init;
- (void)_notifyObserversOfSigterm;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation ATXSigtermListener

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ATXSigtermListener_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;
  return v2;
}

void __36__ATXSigtermListener_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F3B80]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

- (ATXSigtermListener)init
{
  v12.receiver = self;
  v12.super_class = (Class)ATXSigtermListener;
  v2 = [(ATXSigtermListener *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    signal(15, (void (__cdecl *)(int))1);
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14480], 0xFuLL, 0, 0);
    v6 = (void *)init_sigterm_source;
    init_sigterm_source = (uint64_t)v5;

    objc_initWeak(&location, v2);
    v7 = init_sigterm_source;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __26__ATXSigtermListener_init__block_invoke;
    v9[3] = &unk_1E68A30E8;
    objc_copyWeak(&v10, &location);
    dispatch_source_set_event_handler(v7, v9);
    dispatch_activate((dispatch_object_t)init_sigterm_source);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __26__ATXSigtermListener_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyObserversOfSigterm];
}

- (void)_notifyObserversOfSigterm
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = v2->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "handleSigterm", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)registerObserver:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)unregisterObserver:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
}

@end