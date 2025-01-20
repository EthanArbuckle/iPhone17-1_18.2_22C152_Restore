@interface AVApplicationStateMonitor
+ (id)sharedApplicationStateMonitor;
+ (void)initialize;
- (AVApplicationStateMonitor)init;
- (BOOL)_hostApplicationHasForegroundExemption;
- (BOOL)isHostApplicationInForeground;
- (void)_didEnterBackground:(id)a3;
- (void)_willEnterForeground:(id)a3;
- (void)dealloc;
- (void)setHostApplicationInForeground:(BOOL)a3;
@end

@implementation AVApplicationStateMonitor

+ (id)sharedApplicationStateMonitor
{
  if (sharedApplicationStateMonitor_gAVApplicationStateMonitor_Once != -1) {
    dispatch_once(&sharedApplicationStateMonitor_gAVApplicationStateMonitor_Once, &__block_literal_global_24);
  }
  MEMORY[0x199715030](sharedApplicationStateMonitor__mutex);
  WeakRetained = (AVApplicationStateMonitor *)objc_loadWeakRetained(&sharedApplicationStateMonitor__weakApplicationStateMonitor);
  if (!WeakRetained)
  {
    WeakRetained = objc_alloc_init(AVApplicationStateMonitor);
    objc_storeWeak(&sharedApplicationStateMonitor__weakApplicationStateMonitor, WeakRetained);
  }
  MEMORY[0x199715040](sharedApplicationStateMonitor__mutex);
  return WeakRetained;
}

uint64_t __58__AVApplicationStateMonitor_isHostApplicationInForeground__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

uint64_t __58__AVApplicationStateMonitor_sharedApplicationStateMonitor__block_invoke()
{
  uint64_t result = FigSimpleMutexCreate();
  sharedApplicationStateMonitor__mutex = result;
  return result;
}

- (BOOL)isHostApplicationInForeground
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVApplicationStateMonitor_isHostApplicationInForeground__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (AVApplicationStateMonitor)init
{
  v17.receiver = self;
  v17.super_class = (Class)AVApplicationStateMonitor;
  v2 = [(AVApplicationStateMonitor *)&v17 init];
  if (v2)
  {
    v2->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avapplicationutilities.ivars");
    char v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F963E8], "currentProcess"), "currentState");
    if (v3)
    {
      v4 = v3;
      BOOL v5 = [v3 taskState] == 4 || objc_msgSend(v4, "taskState") == 2;
      uint64_t v6 = (void *)[v4 endowmentNamespaces];
      char v7 = [v6 containsObject:*MEMORY[0x1E4F62718]];
      if (v5 && (v7 & 1) != 0) {
        char v8 = 1;
      }
      else {
        char v8 = [(AVApplicationStateMonitor *)v2 _hostApplicationHasForegroundExemption];
      }
      v2->_hostApplicationInForeground = v8;
    }
    else
    {
      v2->_hostApplicationInForeground = 1;
    }
    objc_initWeak(&location, v2);
    char v9 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __33__AVApplicationStateMonitor_init__block_invoke;
    v14[3] = &unk_1E57B1EA8;
    objc_copyWeak(&v15, &location);
    v2->_didEnterBackgroundNotificationToken = (id)[v9 addObserverForName:@"UIApplicationDidEnterBackgroundNotification" object:0 queue:0 usingBlock:v14];
    v10 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __33__AVApplicationStateMonitor_init__block_invoke_2;
    v12[3] = &unk_1E57B1EA8;
    objc_copyWeak(&v13, &location);
    v2->_willEnterForegroundNotificationToken = (id)[v10 addObserverForName:@"UIApplicationWillEnterForegroundNotification" object:0 queue:0 usingBlock:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

uint64_t __33__AVApplicationStateMonitor_init__block_invoke(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _didEnterBackground:a2];
}

uint64_t __33__AVApplicationStateMonitor_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _willEnterForeground:a2];
}

- (void)dealloc
{
  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue) {
    dispatch_release(ivarAccessQueue);
  }
  if (self->_didEnterBackgroundNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_didEnterBackgroundNotificationToken);
  }
  if (self->_willEnterForegroundNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_willEnterForegroundNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVApplicationStateMonitor;
  [(AVApplicationStateMonitor *)&v4 dealloc];
}

- (void)setHostApplicationInForeground:(BOOL)a3
{
  ivarAccessQueue = self->_ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__AVApplicationStateMonitor_setHostApplicationInForeground___block_invoke;
  v4[3] = &unk_1E57B20E8;
  v4[4] = self;
  BOOL v5 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __60__AVApplicationStateMonitor_setHostApplicationInForeground___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)_hostApplicationHasForegroundExemption
{
  if (_hostApplicationHasForegroundExemption_onceToken != -1) {
    dispatch_once(&_hostApplicationHasForegroundExemption_onceToken, &__block_literal_global_12_0);
  }
  return _hostApplicationHasForegroundExemption_applicationHasForegroundExemption;
}

void __67__AVApplicationStateMonitor__hostApplicationHasForegroundExemption__block_invoke()
{
  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v0)
  {
    v1 = v0;
    CFBooleanRef v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v0, @"com.apple.avfoundation.tool-has-foreground-exemption", 0);
    if (v2)
    {
      CFBooleanRef v3 = v2;
      CFTypeID v4 = CFGetTypeID(v2);
      if (v4 == CFBooleanGetTypeID()) {
        _hostApplicationHasForegroundExemption_applicationHasForegroundExemption = CFBooleanGetValue(v3) != 0;
      }
      CFRelease(v3);
    }
    CFRelease(v1);
  }
}

- (void)_didEnterBackground:(id)a3
{
}

- (void)_willEnterForeground:(id)a3
{
}

@end