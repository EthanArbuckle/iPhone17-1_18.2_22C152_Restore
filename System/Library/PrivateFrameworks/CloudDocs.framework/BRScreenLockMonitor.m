@interface BRScreenLockMonitor
+ (id)sharedScreenLockMonitor;
- (BOOL)_getScreenLockedStateFromToken;
- (BRScreenLockMonitor)init;
- (int)screenLockedUnlockedNotifyToken;
- (void)_getScreenLockedStateFromToken;
- (void)_invalidateScreenLockManager;
- (void)_setScreenLocked:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)init;
- (void)removeObserver:(id)a3;
@end

@implementation BRScreenLockMonitor

+ (id)sharedScreenLockMonitor
{
  if (sharedScreenLockMonitor_onceToken != -1) {
    dispatch_once(&sharedScreenLockMonitor_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)sharedScreenLockMonitor_monitor;

  return v2;
}

uint64_t __46__BRScreenLockMonitor_sharedScreenLockMonitor__block_invoke()
{
  sharedScreenLockMonitor_monitor = objc_alloc_init(BRScreenLockMonitor);

  return MEMORY[0x1F41817F8]();
}

- (BRScreenLockMonitor)init
{
  v19.receiver = self;
  v19.super_class = (Class)BRScreenLockMonitor;
  v2 = [(BRScreenLockMonitor *)&v19 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.br.screen-lock-monitor", v4);

    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    v2->_screenLockedUnlockedNotifyToken = -1;
    v7 = (const char *)[@"com.apple.springboard.lockstate" UTF8String];
    v8 = v2->_notificationQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __27__BRScreenLockMonitor_init__block_invoke;
    handler[3] = &unk_1E59AEBC8;
    v9 = v2;
    v18 = v9;
    uint32_t v10 = notify_register_dispatch(v7, &v2->_screenLockedUnlockedNotifyToken, v8, handler);
    if (v10)
    {
      int v11 = v10;
      v12 = brc_bread_crumbs((uint64_t)"-[BRScreenLockMonitor init]", 66);
      v13 = brc_default_log(0);
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
        [(BRScreenLockMonitor *)(uint64_t)v12 init];
      }
    }
    v9->_screenLocked = [(BRScreenLockMonitor *)v9 _getScreenLockedStateFromToken];
    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    screenLockObservers = v9->_screenLockObservers;
    v9->_screenLockObservers = (NSHashTable *)v14;
  }
  return v2;
}

uint64_t __27__BRScreenLockMonitor_init__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 _getScreenLockedStateFromToken];

  return [v1 _setScreenLocked:v2];
}

- (BOOL)_getScreenLockedStateFromToken
{
  uint64_t v5 = 0;
  if (brc_notify_get_state(self->_screenLockedUnlockedNotifyToken, &v5, [@"com.apple.springboard.lockstate" UTF8String]))
  {
    uint64_t v2 = brc_bread_crumbs((uint64_t)"-[BRScreenLockMonitor _getScreenLockedStateFromToken]", 111);
    v3 = brc_default_log(0);
    if (os_log_type_enabled(v3, (os_log_type_t)0x90u)) {
      [(BRScreenLockMonitor *)(uint64_t)v2 _getScreenLockedStateFromToken];
    }
  }
  return v5 != 0;
}

- (void)_invalidateScreenLockManager
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = brc_bread_crumbs((uint64_t)"-[BRScreenLockMonitor _invalidateScreenLockManager]", 124);
  v4 = brc_default_log(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = [@"com.apple.springboard.lockstate" UTF8String];
    __int16 v9 = 2112;
    uint32_t v10 = v3;
    _os_log_impl(&dword_19ED3F000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Unregister for %s%@", (uint8_t *)&v7, 0x16u);
  }

  int screenLockedUnlockedNotifyToken = self->_screenLockedUnlockedNotifyToken;
  if (screenLockedUnlockedNotifyToken != -1)
  {
    notify_cancel(screenLockedUnlockedNotifyToken);
    self->_int screenLockedUnlockedNotifyToken = -1;
  }
  screenLockObservers = self->_screenLockObservers;
  self->_screenLockObservers = 0;
}

- (void)_setScreenLocked:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__BRScreenLockMonitor__setScreenLocked___block_invoke;
  v5[3] = &unk_1E59AE420;
  v5[4] = self;
  BOOL v6 = a3;
  v4 = (void (**)(void))MEMORY[0x19F3C48D0](v5, a2);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  v4[2](v4);
}

void __40__BRScreenLockMonitor__setScreenLocked___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 20) != v2)
  {
    *(unsigned char *)(v1 + 20) = v2;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 24);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "screenLockChanged:", *(unsigned __int8 *)(a1 + 40), (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__BRScreenLockMonitor_addObserver___block_invoke;
  v7[3] = &unk_1E59AD648;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(notificationQueue, v7);
}

uint64_t __35__BRScreenLockMonitor_addObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  int v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 20);

  return [v2 screenLockChanged:v3];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__BRScreenLockMonitor_removeObserver___block_invoke;
  v7[3] = &unk_1E59AD648;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(notificationQueue, v7);
}

uint64_t __38__BRScreenLockMonitor_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (int)screenLockedUnlockedNotifyToken
{
  return self->_screenLockedUnlockedNotifyToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenLockObservers, 0);

  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

- (void)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_19ED3F000, log, (os_log_type_t)0x90u, "[ERROR] can't register to screen lock/unlock changes. error: %d%@", (uint8_t *)v3, 0x12u);
}

- (void)_getScreenLockedStateFromToken
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19ED3F000, a2, (os_log_type_t)0x90u, "[ERROR] Failed to query whether screen is locked%@", (uint8_t *)&v2, 0xCu);
}

@end