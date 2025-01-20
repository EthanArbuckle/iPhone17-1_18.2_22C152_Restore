@interface LCSFirstUnlockManager
- (BOOL)hasUnlockedSinceBoot;
- (LCSFirstUnlockManager)init;
- (id)postFirstUnlockHandler;
- (void)dealloc;
- (void)endObservingForFirstUnlock;
- (void)setHasUnlockedSinceBoot:(BOOL)a3;
- (void)setPostFirstUnlockHandler:(id)a3;
@end

@implementation LCSFirstUnlockManager

- (LCSFirstUnlockManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)LCSFirstUnlockManager;
  v2 = [(LCSFirstUnlockManager *)&v9 init];
  if (v2)
  {
    int v3 = MKBDeviceUnlockedSinceBoot();
    v2->_hasUnlockedSinceBoot = v3 > 0;
    if (v3 <= 0)
    {
      uint64_t v4 = BSDispatchQueueCreateWithQualityOfService();
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v4;

      objc_initWeak(&location, v2);
      objc_copyWeak(&v7, &location);
      v2->_aksEvent = (_AKSEvent *)AKSEventsRegister();
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

void __29__LCSFirstUnlockManager_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a2)
  {
    id v6 = WeakRetained;
    [WeakRetained setHasUnlockedSinceBoot:1];
    uint64_t v4 = [v6 postFirstUnlockHandler];
    v5 = (void *)v4;
    if (v4)
    {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
      [v6 setPostFirstUnlockHandler:0];
    }
    [v6 endObservingForFirstUnlock];

    id WeakRetained = v6;
  }
}

- (void)endObservingForFirstUnlock
{
  if (self->_aksEvent)
  {
    AKSEventsUnregister();
    self->_aksEvent = 0;
  }
}

- (void)setPostFirstUnlockHandler:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  id v5 = (id)v4;
  v8 = (uint64_t (**)(void))v4;
  if (v4 && (uint64_t v4 = [(LCSFirstUnlockManager *)self hasUnlockedSinceBoot], v5 = v8, v4))
  {
    uint64_t v4 = v8[2](v8);
  }
  else
  {
    if (self->_postFirstUnlockHandler == v5) {
      goto LABEL_7;
    }
    id v6 = (void *)[v5 copy];
    id postFirstUnlockHandler = self->_postFirstUnlockHandler;
    self->_id postFirstUnlockHandler = v6;
  }
  id v5 = v8;
LABEL_7:
  MEMORY[0x270F9A758](v4, v5);
}

- (void)dealloc
{
  [(LCSFirstUnlockManager *)self endObservingForFirstUnlock];
  v3.receiver = self;
  v3.super_class = (Class)LCSFirstUnlockManager;
  [(LCSFirstUnlockManager *)&v3 dealloc];
}

- (BOOL)hasUnlockedSinceBoot
{
  return self->_hasUnlockedSinceBoot;
}

- (void)setHasUnlockedSinceBoot:(BOOL)a3
{
  self->_hasUnlockedSinceBoot = a3;
}

- (id)postFirstUnlockHandler
{
  return self->_postFirstUnlockHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_postFirstUnlockHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end