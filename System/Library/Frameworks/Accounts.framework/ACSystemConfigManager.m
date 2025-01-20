@interface ACSystemConfigManager
+ (id)_livingInstance;
+ (id)sharedInstance;
+ (unint64_t)_timeoutInterval;
+ (void)_scheduleSharedInstanceTeardown;
+ (void)_tearDown;
- (ACSystemConfigManager)init;
- (int)accountsWithAccountTypeIdentifierExist:(id)a3;
- (int64_t)countOfAccountsWithAccountTypeIdentifier:(id)a3;
- (void)_createSCPreferencesSession;
- (void)_destroySCPreferencesSession;
- (void)_getValueForKey:(id)a3;
- (void)_handleSCPreferencesSessionNotification:(unsigned int)a3;
- (void)_setValue:(void *)a3 forKey:(id)a4;
- (void)dealloc;
- (void)setAccountsWithAccountTypeIdentifier:(id)a3 exist:(BOOL)a4;
- (void)setCountOfAccounts:(int64_t)a3 withAccountTypeIdentifier:(id)a4;
@end

@implementation ACSystemConfigManager

+ (id)sharedInstance
{
  pthread_mutex_lock(&__SystemConfigManagerMutex);
  if (!__sharedACSystemConfigManager)
  {
    v3 = objc_alloc_init(ACSystemConfigManager);
    v4 = (void *)__sharedACSystemConfigManager;
    __sharedACSystemConfigManager = (uint64_t)v3;
  }
  [a1 _scheduleSharedInstanceTeardown];
  id v5 = (id)__sharedACSystemConfigManager;
  pthread_mutex_unlock(&__SystemConfigManagerMutex);

  return v5;
}

+ (id)_livingInstance
{
  return (id)__sharedACSystemConfigManager;
}

+ (unint64_t)_timeoutInterval
{
  return 5;
}

+ (void)_scheduleSharedInstanceTeardown
{
  if (__timerSource)
  {
    dispatch_source_cancel((dispatch_source_t)__timerSource);
    v2 = (void *)__timerSource;
    __timerSource = 0;
  }
  v3 = __timerQueue;
  if (!__timerQueue)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("ACSysConfigManagerTimerQueue", v4);
    v6 = (void *)__timerQueue;
    __timerQueue = (uint64_t)v5;

    v3 = __timerQueue;
  }
  dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3);
  v8 = (void *)__timerSource;
  __timerSource = (uint64_t)v7;

  dispatch_source_set_event_handler((dispatch_source_t)__timerSource, &__block_literal_global_10);
  dispatch_resume((dispatch_object_t)__timerSource);
  unint64_t v9 = +[ACSystemConfigManager _timeoutInterval];
  v10 = __timerSource;
  dispatch_time_t v11 = dispatch_time(0, 1000000000 * v9);

  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
}

uint64_t __56__ACSystemConfigManager__scheduleSharedInstanceTeardown__block_invoke()
{
  return +[ACSystemConfigManager _tearDown];
}

+ (void)_tearDown
{
  pthread_mutex_lock(&__SystemConfigManagerMutex);
  v2 = (void *)__sharedACSystemConfigManager;
  __sharedACSystemConfigManager = 0;

  pthread_mutex_unlock(&__SystemConfigManagerMutex);
}

- (ACSystemConfigManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)ACSystemConfigManager;
  v2 = [(ACSystemConfigManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ACSysConfigManagerSCPeferencesQueue", v3);
    preferencesQueue = v2->_preferencesQueue;
    v2->_preferencesQueue = (OS_dispatch_queue *)v4;

    [(ACSystemConfigManager *)v2 _createSCPreferencesSession];
  }
  return v2;
}

- (void)dealloc
{
  [(ACSystemConfigManager *)self _destroySCPreferencesSession];
  v3.receiver = self;
  v3.super_class = (Class)ACSystemConfigManager;
  [(ACSystemConfigManager *)&v3 dealloc];
}

- (int)accountsWithAccountTypeIdentifierExist:(id)a3
{
  dispatch_queue_t v4 = [NSString stringWithFormat:@"%@.exists", a3];
  dispatch_queue_t v5 = [(ACSystemConfigManager *)self _getValueForKey:v4];
  int v6 = [v5 intValue];

  return v6;
}

- (void)setAccountsWithAccountTypeIdentifier:(id)a3 exist:(BOOL)a4
{
  if (a4) {
    dispatch_queue_t v5 = &unk_1EFA156E8;
  }
  else {
    dispatch_queue_t v5 = &unk_1EFA15700;
  }
  id v6 = [NSString stringWithFormat:@"%@.exists", a3];
  [(ACSystemConfigManager *)self _setValue:v5 forKey:v6];
}

- (int64_t)countOfAccountsWithAccountTypeIdentifier:(id)a3
{
  dispatch_queue_t v4 = [NSString stringWithFormat:@"%@.count", a3];
  dispatch_queue_t v5 = [(ACSystemConfigManager *)self _getValueForKey:v4];
  id v6 = v5;
  if (v5) {
    int64_t v7 = [v5 integerValue];
  }
  else {
    int64_t v7 = -1;
  }

  return v7;
}

- (void)setCountOfAccounts:(int64_t)a3 withAccountTypeIdentifier:(id)a4
{
  id v6 = [NSString stringWithFormat:@"%@.count", a4];
  -[ACSystemConfigManager _setValue:forKey:](self, "_setValue:forKey:", [NSNumber numberWithInteger:a3], v6);
}

- (void)_createSCPreferencesSession
{
  objc_super v3 = [MEMORY[0x1E4F28B50] mainBundle];
  dispatch_queue_t v4 = [v3 bundleIdentifier];

  if (!v4)
  {
    dispatch_queue_t v5 = [MEMORY[0x1E4F28F80] processInfo];
    dispatch_queue_t v4 = [v5 processName];
  }
  preferencesQueue = self->_preferencesQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__ACSystemConfigManager__createSCPreferencesSession__block_invoke;
  v8[3] = &unk_1E5BCCD58;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(preferencesQueue, v8);
}

uint64_t __52__ACSystemConfigManager__createSCPreferencesSession__block_invoke(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 40);
  SCPreferencesRef v3 = SCPreferencesCreateWithAuthorization((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFStringRef *)(a1 + 40), @"com.apple.accounts.exists.plist", 0);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = a1 + 32;
  *(void *)(v5 + 16) = v3;
  id v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __52__ACSystemConfigManager__createSCPreferencesSession__block_invoke_cold_1(v4, v2, v6);
  }

  id v7 = *(const __SCPreferences **)(*(void *)v4 + 16);
  Main = CFRunLoopGetMain();
  SCPreferencesScheduleWithRunLoop(v7, Main, (CFStringRef)*MEMORY[0x1E4F1D418]);
  memset(&v10, 0, sizeof(v10));
  return SCPreferencesSetCallback(*(SCPreferencesRef *)(*(void *)v4 + 16), (SCPreferencesCallBack)__ACSystemConfigManagerPreferencesCallback, &v10);
}

- (void)_destroySCPreferencesSession
{
  preferencesQueue = self->_preferencesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ACSystemConfigManager__destroySCPreferencesSession__block_invoke;
  block[3] = &unk_1E5BCD220;
  block[4] = self;
  dispatch_sync(preferencesQueue, block);
}

void __53__ACSystemConfigManager__destroySCPreferencesSession__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = _ACLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __53__ACSystemConfigManager__destroySCPreferencesSession__block_invoke_cold_1(v1, v2);
    }

    SCPreferencesRef v3 = *(const __SCPreferences **)(*(void *)v1 + 16);
    Main = CFRunLoopGetMain();
    SCPreferencesUnscheduleFromRunLoop(v3, Main, (CFStringRef)*MEMORY[0x1E4F1D418]);
    SCPreferencesSetCallback(*(SCPreferencesRef *)(*(void *)v1 + 16), 0, 0);
    uint64_t v5 = *(const void **)(*(void *)v1 + 16);
    if (v5)
    {
      *(void *)(*(void *)v1 + 16) = 0;
      CFRelease(v5);
    }
  }
}

- (void)_handleSCPreferencesSessionNotification:(unsigned int)a3
{
  preferencesQueue = self->_preferencesQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__ACSystemConfigManager__handleSCPreferencesSessionNotification___block_invoke;
  v4[3] = &unk_1E5BCEAE8;
  unsigned int v5 = a3;
  v4[4] = self;
  dispatch_sync(preferencesQueue, v4);
}

void __65__ACSystemConfigManager__handleSCPreferencesSessionNotification___block_invoke(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 40) & 2) != 0)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = *(_DWORD *)(v2 + 24);
    if (!v3)
    {
      SCPreferencesSynchronize(*(SCPreferencesRef *)(v2 + 16));
      uint64_t v2 = *(void *)(a1 + 32);
      int v3 = *(_DWORD *)(v2 + 24);
    }
    BOOL v4 = __OFSUB__(v3, 1);
    int v5 = v3 - 1;
    if (v5 < 0 == v4) {
      *(_DWORD *)(v2 + 24) = v5;
    }
  }
}

- (void)_getValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  preferencesQueue = self->_preferencesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ACSystemConfigManager__getValueForKey___block_invoke;
  block[3] = &unk_1E5BCEA20;
  id v10 = v4;
  dispatch_time_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(preferencesQueue, block);
  id v7 = (void *)v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

CFPropertyListRef __41__ACSystemConfigManager__getValueForKey___block_invoke(uint64_t a1)
{
  CFPropertyListRef result = SCPreferencesGetValue(*(SCPreferencesRef *)(*(void *)(a1 + 32) + 16), *(CFStringRef *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_setValue:(void *)a3 forKey:(id)a4
{
  id v6 = a4;
  preferencesQueue = self->_preferencesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__ACSystemConfigManager__setValue_forKey___block_invoke;
  block[3] = &unk_1E5BCEB10;
  block[4] = self;
  id v10 = v6;
  dispatch_time_t v11 = a3;
  id v8 = v6;
  dispatch_sync(preferencesQueue, block);
}

void __42__ACSystemConfigManager__setValue_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (SCPreferencesLock(*(SCPreferencesRef *)(*(void *)(a1 + 32) + 16), 1u)) {
    goto LABEL_17;
  }
  if (SCError() == 3005) {
    SCPreferencesSynchronize(*(SCPreferencesRef *)(*(void *)v2 + 16));
  }
  if (SCPreferencesLock(*(SCPreferencesRef *)(*(void *)v2 + 16), 1u))
  {
LABEL_17:
    if (SCPreferencesSetValue(*(SCPreferencesRef *)(*(void *)(a1 + 32) + 16), *(CFStringRef *)(a1 + 40), *(CFPropertyListRef *)(a1 + 48))&& SCPreferencesCommitChanges(*(SCPreferencesRef *)(*(void *)v2 + 16))&& SCPreferencesApplyChanges(*(SCPreferencesRef *)(*(void *)v2 + 16)))
    {
      ++*(_DWORD *)(*(void *)v2 + 24);
      SCPreferencesSynchronize(*(SCPreferencesRef *)(*(void *)v2 + 16));
    }
    int v3 = *(const __SCPreferences **)(*(void *)v2 + 16);
    SCPreferencesUnlock(v3);
  }
  else
  {
    uint64_t v4 = SCError();
    int v5 = _ACLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __42__ACSystemConfigManager__setValue_forKey___block_invoke_cold_1(v2, v4, v5);
    }
  }
}

- (void).cxx_destruct
{
}

void __52__ACSystemConfigManager__createSCPreferencesSession__block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  uint64_t v4 = *a2;
  int v5 = 134218242;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_1A57C5000, log, OS_LOG_TYPE_DEBUG, "\"ACSystemConfigManager: new SCPreferencesRef %p created for process %@.\"", (uint8_t *)&v5, 0x16u);
}

void __53__ACSystemConfigManager__destroySCPreferencesSession__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 16);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A57C5000, a2, OS_LOG_TYPE_DEBUG, "\"ACSystemConfigManager: tearing down SCPreferencesRef %p\"", (uint8_t *)&v3, 0xCu);
}

void __42__ACSystemConfigManager__setValue_forKey___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(*(void *)a1 + 16);
  uint64_t v5 = [NSNumber numberWithInt:a2];
  int v6 = 134218242;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1A57C5000, a3, OS_LOG_TYPE_ERROR, "\"ACSystemConfigManager: failed to acquire SCPreferencesLock for %p due to error %@\"", (uint8_t *)&v6, 0x16u);
}

@end