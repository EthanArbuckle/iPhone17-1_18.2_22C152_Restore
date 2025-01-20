@interface ATXWifiStateMonitor
+ (id)sharedInstance;
- (ATXWifiStateMonitor)init;
- (NSString)SSID;
- (void)SSID;
- (void)_start;
- (void)dealloc;
@end

@implementation ATXWifiStateMonitor

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken3 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken3, &__block_literal_global_57);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_8;
  return v2;
}

void __37__ATXWifiStateMonitor_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_8;
  sharedInstance__pasExprOnceResult_8 = v1;
}

- (ATXWifiStateMonitor)init
{
  v13.receiver = self;
  v13.super_class = (Class)ATXWifiStateMonitor;
  v2 = [(ATXWifiStateMonitor *)&v13 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__ATXWifiStateMonitor_init__block_invoke;
    block[3] = &unk_1E68AB818;
    v12 = v2;
    dispatch_async(v9, block);
  }
  return v2;
}

uint64_t __27__ATXWifiStateMonitor_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (void)_start
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Could not get WiFi device list", v1, 2u);
}

- (NSString)SSID
{
  uint64_t v7 = 0;
  v8[0] = &v7;
  v8[1] = 0x3032000000;
  v8[2] = __Block_byref_object_copy__27;
  v8[3] = __Block_byref_object_dispose__27;
  id v9 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__ATXWifiStateMonitor_SSID__block_invoke;
  v6[3] = &unk_1E68AB898;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(ATXWifiStateMonitor *)(uint64_t)v8 SSID];
  }

  id v4 = *(id *)(v8[0] + 40);
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __27__ATXWifiStateMonitor_SSID__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 48))
  {
    v5 = *(void **)(v2 + 40);
    if (!v5) {
      return;
    }
    [v5 timeIntervalSinceNow];
    if (v6 <= -1800.0) {
      return;
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  v3 = *(void **)(v2 + 32);
  id v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v4, v3);
}

- (void)dealloc
{
  if (self->_device)
  {
    WiFiDeviceClientRegisterExtendedLinkCallback();
    CFRelease(self->_device);
  }
  if (self->_manager)
  {
    CFRunLoopGetMain();
    v3 = (const void *)*MEMORY[0x1E4F1D410];
    WiFiManagerClientUnscheduleFromRunLoop();
    manager = self->_manager;
    Main = CFRunLoopGetMain();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__ATXWifiStateMonitor_dealloc__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = manager;
    CFRunLoopPerformBlock(Main, v3, block);
    double v6 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)ATXWifiStateMonitor;
  [(ATXWifiStateMonitor *)&v7 dealloc];
}

void __30__ATXWifiStateMonitor_dealloc__block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
  objc_storeStrong((id *)&self->_lastSeenSSID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)SSID
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Current SSID: %@", (uint8_t *)&v3, 0xCu);
}

@end