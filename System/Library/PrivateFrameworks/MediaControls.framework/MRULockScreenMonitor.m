@interface MRULockScreenMonitor
+ (id)sharedMonitor;
- (BOOL)isDeviceLocked;
- (NSArray)observers;
- (NSHashTable)weakObservers;
- (id)_init;
- (int)mobileKeyBagLockStatusNotifyToken;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setDeviceLocked:(BOOL)a3;
- (void)setMobileKeyBagLockStatusNotifyToken:(int)a3;
- (void)setWeakObservers:(id)a3;
- (void)updateDeviceLocked;
@end

@implementation MRULockScreenMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)sharedMonitor_monitor;

  return v2;
}

void __37__MRULockScreenMonitor_sharedMonitor__block_invoke()
{
  id v0 = [[MRULockScreenMonitor alloc] _init];
  v1 = (void *)sharedMonitor_monitor;
  sharedMonitor_monitor = (uint64_t)v0;
}

- (id)_init
{
  v16.receiver = self;
  v16.super_class = (Class)MRULockScreenMonitor;
  v2 = [(MRULockScreenMonitor *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    weakObservers = v2->_weakObservers;
    v2->_weakObservers = (NSHashTable *)v3;

    objc_initWeak(&location, v2);
    v5 = (const char *)*MEMORY[0x1E4F78160];
    v6 = MEMORY[0x1E4F14428];
    id v7 = MEMORY[0x1E4F14428];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __29__MRULockScreenMonitor__init__block_invoke;
    v13 = &unk_1E5F0E8B0;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch(v5, &v2->_mobileKeyBagLockStatusNotifyToken, v6, &v10);

    id v8 = objc_loadWeakRetained(&location);
    objc_msgSend(v8, "updateDeviceLocked", v10, v11, v12, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__MRULockScreenMonitor__init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateDeviceLocked];
}

- (void)dealloc
{
  notify_cancel(self->_mobileKeyBagLockStatusNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)MRULockScreenMonitor;
  [(MRULockScreenMonitor *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_weakObservers addObject:v5];
  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_weakObservers removeObject:v5];
  objc_sync_exit(v4);
}

- (NSArray)observers
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = [(NSHashTable *)v2->_weakObservers allObjects];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setDeviceLocked:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_deviceLocked != a3)
  {
    BOOL v3 = a3;
    self->_deviceLocked = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(MRULockScreenMonitor *)self observers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 lockscreenMonitor:self didUpdateDeviceLocked:v3];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)updateDeviceLocked
{
  if (updateDeviceLocked_onceToken != -1) {
    dispatch_once(&updateDeviceLocked_onceToken, &__block_literal_global_8);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MRULockScreenMonitor_updateDeviceLocked__block_invoke_2;
  block[3] = &unk_1E5F0D7F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)updateDeviceLocked_queue, block);
}

void __42__MRULockScreenMonitor_updateDeviceLocked__block_invoke()
{
  BOOL v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.mediaremote.MRULockScreenMonitor.lockStateWorkerQueue", v0);
  v2 = (void *)updateDeviceLocked_queue;
  updateDeviceLocked_queue = (uint64_t)v1;
}

void __42__MRULockScreenMonitor_updateDeviceLocked__block_invoke_2(uint64_t a1)
{
  char v4 = 0;
  SBSGetScreenLockStatus();
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__MRULockScreenMonitor_updateDeviceLocked__block_invoke_3;
  v2[3] = &unk_1E5F0D8C0;
  v2[4] = *(void *)(a1 + 32);
  char v3 = 0;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __42__MRULockScreenMonitor_updateDeviceLocked__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeviceLocked:*(unsigned char *)(a1 + 40) != 0];
}

- (BOOL)isDeviceLocked
{
  return self->_deviceLocked;
}

- (int)mobileKeyBagLockStatusNotifyToken
{
  return self->_mobileKeyBagLockStatusNotifyToken;
}

- (void)setMobileKeyBagLockStatusNotifyToken:(int)a3
{
  self->_mobileKeyBagLockStatusNotifyToken = a3;
}

- (NSHashTable)weakObservers
{
  return self->_weakObservers;
}

- (void)setWeakObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end