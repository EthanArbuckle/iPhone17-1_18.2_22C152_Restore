@interface ASKRebootstrapCoordinator
+ (ASKRebootstrapCoordinator)sharedCoordinator;
- (ASKRebootstrapCoordinator)init;
- (ASKStorefrontChangeProvider)changeObserver;
- (BOOL)hasPendingNotification;
- (NSHashTable)handlerTokens;
- (id)appBootstrapHandler;
- (id)registerCleanupHandler:(id)a3;
- (int64_t)delayCount;
- (void)beginDelayingNotifications;
- (void)endDelayingNotifications;
- (void)notify;
- (void)scheduleNotification;
- (void)setAppBootstrapHandler:(id)a3;
- (void)setDelayCount:(int64_t)a3;
- (void)setHasPendingNotification:(BOOL)a3;
@end

@implementation ASKRebootstrapCoordinator

+ (ASKRebootstrapCoordinator)sharedCoordinator
{
  if (sharedCoordinator_onceToken != -1) {
    dispatch_once(&sharedCoordinator_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedCoordinator_sharedCoordinator;
  return (ASKRebootstrapCoordinator *)v2;
}

- (id)registerCleanupHandler:(id)a3
{
  id v4 = a3;
  v5 = [[ASKStorefrontChangeHandlerToken alloc] initWithHandler:v4];

  v6 = [(ASKRebootstrapCoordinator *)self handlerTokens];
  [v6 addObject:v5];

  return v5;
}

- (NSHashTable)handlerTokens
{
  return self->_handlerTokens;
}

- (void)setAppBootstrapHandler:(id)a3
{
}

void __46__ASKRebootstrapCoordinator_sharedCoordinator__block_invoke()
{
  v0 = objc_alloc_init(ASKRebootstrapCoordinator);
  v1 = (void *)sharedCoordinator_sharedCoordinator;
  sharedCoordinator_sharedCoordinator = (uint64_t)v0;
}

- (ASKRebootstrapCoordinator)init
{
  v15.receiver = self;
  v15.super_class = (Class)ASKRebootstrapCoordinator;
  v2 = [(ASKRebootstrapCoordinator *)&v15 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = [ASKStorefrontChangeProvider alloc];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __33__ASKRebootstrapCoordinator_init__block_invoke;
    v12 = &unk_1E6DA8AF8;
    objc_copyWeak(&v13, &location);
    uint64_t v4 = [(ASKStorefrontChangeProvider *)v3 initWithBlock:&v9];
    changeObserver = v2->_changeObserver;
    v2->_changeObserver = (ASKStorefrontChangeProvider *)v4;

    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28D30], "weakObjectsHashTable", v9, v10, v11, v12);
    handlerTokens = v2->_handlerTokens;
    v2->_handlerTokens = (NSHashTable *)v6;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __33__ASKRebootstrapCoordinator_init__block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4F4DCE8], "ask_generalLogConfig");
  if (!v2)
  {
    v2 = [MEMORY[0x1E4F4DCE8] sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1E157D000, v3, OS_LOG_TYPE_DEBUG, "Storefront change detected", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performSelectorOnMainThread:sel_scheduleNotification withObject:0 waitUntilDone:0];
}

- (void)scheduleNotification
{
  v7[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_notify object:0];
  if ([(ASKRebootstrapCoordinator *)self delayCount])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F4DCE8], "ask_generalLogConfig");
    if (!v3)
    {
      v3 = [MEMORY[0x1E4F4DCE8] sharedConfig];
    }
    uint64_t v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1E157D000, v4, OS_LOG_TYPE_DEBUG, "Deferring storefront change notification", v6, 2u);
    }

    [(ASKRebootstrapCoordinator *)self setHasPendingNotification:1];
  }
  else
  {
    v7[0] = *MEMORY[0x1E4F1C4B0];
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(ASKRebootstrapCoordinator *)self performSelector:sel_notify withObject:0 afterDelay:v5 inModes:1.0];
  }
}

- (void)notify
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(ASKRebootstrapCoordinator *)self handlerTokens];
  uint64_t v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) handler];
        v9[2]();

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [(ASKRebootstrapCoordinator *)self appBootstrapHandler];

  if (v10)
  {
    v11 = [(ASKRebootstrapCoordinator *)self appBootstrapHandler];
    v11[2]();
  }
}

- (void)beginDelayingNotifications
{
  int64_t v3 = [(ASKRebootstrapCoordinator *)self delayCount] + 1;
  [(ASKRebootstrapCoordinator *)self setDelayCount:v3];
}

- (void)endDelayingNotifications
{
  if ([(ASKRebootstrapCoordinator *)self delayCount])
  {
    [(ASKRebootstrapCoordinator *)self setDelayCount:[(ASKRebootstrapCoordinator *)self delayCount] - 1];
    if (![(ASKRebootstrapCoordinator *)self delayCount])
    {
      if ([(ASKRebootstrapCoordinator *)self hasPendingNotification])
      {
        int64_t v3 = objc_msgSend(MEMORY[0x1E4F4DCE8], "ask_generalLogConfig");
        if (!v3)
        {
          int64_t v3 = [MEMORY[0x1E4F4DCE8] sharedConfig];
        }
        uint64_t v4 = [v3 OSLogObject];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)uint64_t v5 = 0;
          _os_log_impl(&dword_1E157D000, v4, OS_LOG_TYPE_DEBUG, "Flushing deferred storefront change notification", v5, 2u);
        }

        [(ASKRebootstrapCoordinator *)self performSelector:sel_notify withObject:0 afterDelay:0.0];
        [(ASKRebootstrapCoordinator *)self setHasPendingNotification:0];
      }
    }
  }
}

- (ASKStorefrontChangeProvider)changeObserver
{
  return self->_changeObserver;
}

- (id)appBootstrapHandler
{
  return self->_appBootstrapHandler;
}

- (int64_t)delayCount
{
  return self->_delayCount;
}

- (void)setDelayCount:(int64_t)a3
{
  self->_delayCount = a3;
}

- (BOOL)hasPendingNotification
{
  return self->_hasPendingNotification;
}

- (void)setHasPendingNotification:(BOOL)a3
{
  self->_hasPendingNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appBootstrapHandler, 0);
  objc_storeStrong((id *)&self->_handlerTokens, 0);
  objc_storeStrong((id *)&self->_changeObserver, 0);
}

@end