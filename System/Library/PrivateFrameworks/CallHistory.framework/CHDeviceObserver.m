@interface CHDeviceObserver
- (BOOL)isBootLockEnabled;
- (CHDeviceDataSource)dataSource;
- (CHDeviceObserver)init;
- (CHDeviceObserver)initWithQueue:(id)a3;
- (CHDeviceObserver)initWithQueue:(id)a3 dataSource:(id)a4;
- (CHNotifyObserver)firstUnlockNotifyObserver;
- (OS_dispatch_queue)queue;
- (void)performDelegateSelector:(SEL)a3 withDelegate:(id)a4;
- (void)setBootLockEnabled:(BOOL)a3;
- (void)setFirstUnlockNotifyObserver:(id)a3;
@end

@implementation CHDeviceObserver

void __45__CHDeviceObserver_initWithQueue_dataSource___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isBootLockEnabled])
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 24) = 1;
    objc_initWeak(&location, *(id *)(a1 + 40));
    v2 = [CHNotifyObserver alloc];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 48);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__CHDeviceObserver_initWithQueue_dataSource___block_invoke_2;
    v5[3] = &unk_1E61C7430;
    objc_copyWeak(&v7, &location);
    id v6 = *(id *)(a1 + 32);
    v4 = [(CHNotifyObserver *)v2 initWithName:@"com.apple.mobile.keybagd.first_unlock" queue:v3 callback:v5];
    [*(id *)(a1 + 40) setFirstUnlockNotifyObserver:v4];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (BOOL)isBootLockEnabled
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(CHDeviceObserver *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__CHDeviceObserver_isBootLockEnabled__block_invoke;
  v5[3] = &unk_1E61C79C8;
  void v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CHDeviceObserver)init
{
  id v3 = [NSString stringWithFormat:@"com.apple.CallHistory.queue.%@.%p", objc_opt_class(), self];
  v4 = (const char *)[v3 UTF8String];
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create(v4, v5);

  id v7 = [(CHDeviceObserver *)self initWithQueue:v6];
  return v7;
}

- (CHDeviceObserver)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CHDeviceDataSource);
  dispatch_queue_t v6 = [(CHDeviceObserver *)self initWithQueue:v4 dataSource:v5];

  return v6;
}

- (CHDeviceObserver)initWithQueue:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CHDeviceObserver;
  char v9 = [(CHDelegateManager *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
    queue = v10->_queue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__CHDeviceObserver_initWithQueue_dataSource___block_invoke;
    v13[3] = &unk_1E61C7568;
    id v14 = v8;
    v15 = v10;
    dispatch_async(queue, v13);
  }
  return v10;
}

uint64_t __37__CHDeviceObserver_isBootLockEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_firstUnlockNotifyObserver, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __45__CHDeviceObserver_initWithQueue_dataSource___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "setBootLockEnabled:", objc_msgSend(*(id *)(a1 + 32), "isBootLockEnabled"));
  }
}

- (void)setBootLockEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CHDeviceObserver *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_bootLockEnabled != v3)
  {
    self->_bootLockEnabled = v3;
    [(CHDelegateManager *)self performDelegateSelector:sel_didChangeBootLockEnabledForDeviceObserver_];
  }
}

- (void)performDelegateSelector:(SEL)a3 withDelegate:(id)a4
{
  id v7 = a4;
  if ([v7 conformsToProtocol:&unk_1F12AE580]) {
    BOOL v6 = sel_didChangeBootLockEnabledForDeviceObserver_ == a3;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    [v7 didChangeBootLockEnabledForDeviceObserver:self];
  }
}

- (CHDeviceDataSource)dataSource
{
  return self->_dataSource;
}

- (CHNotifyObserver)firstUnlockNotifyObserver
{
  return self->_firstUnlockNotifyObserver;
}

- (void)setFirstUnlockNotifyObserver:(id)a3
{
}

@end