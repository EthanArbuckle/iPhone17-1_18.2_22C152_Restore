@interface ASCRebootstrapNotifier
+ (ASCRebootstrapNotifier)sharedNotifier;
- (id)_initSingleton;
- (int)token;
- (unint64_t)rebootstrapCounterSnapshot;
- (void)_initSingleton;
- (void)dealloc;
- (void)postLocalNotification;
- (void)postLocalNotificationIfNeeded;
- (void)setRebootstrapCounterSnapshot:(unint64_t)a3;
@end

@implementation ASCRebootstrapNotifier

+ (ASCRebootstrapNotifier)sharedNotifier
{
  if (sharedNotifier_onceToken != -1) {
    dispatch_once(&sharedNotifier_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)sharedNotifier_sharedObserver;

  return (ASCRebootstrapNotifier *)v2;
}

uint64_t __40__ASCRebootstrapNotifier_sharedNotifier__block_invoke()
{
  sharedNotifier_sharedObserver = [[ASCRebootstrapNotifier alloc] _initSingleton];

  return MEMORY[0x1F41817F8]();
}

- (id)_initSingleton
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)ASCRebootstrapNotifier;
  v2 = [(ASCRebootstrapNotifier *)&v21 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    id v3 = MEMORY[0x1E4F14428];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __40__ASCRebootstrapNotifier__initSingleton__block_invoke;
    v18 = &unk_1E645EB10;
    objc_copyWeak(&v19, &location);
    uint64_t v4 = notify_register_dispatch("com.apple.appstorecomponentsd.rebootstrap", &v2->_token, MEMORY[0x1E4F14428], &v15);

    if (v4)
    {
      v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = ASCStringFromNotifyStatus(v4);
        [(ASCRebootstrapNotifier *)v7 _initSingleton];
      }

      v2->_token = -1;
    }
    else
    {
      uint64_t state = notify_get_state(v2->_token, &v2->_rebootstrapCounterSnapshot);
      if (state)
      {
        v9 = MEMORY[0x1E4F14500];
        id v10 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v11 = ASCStringFromNotifyStatus(state);
          [(ASCRebootstrapNotifier *)v11 _initSingleton];
        }
      }
    }
    v12 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v15, v16, v17, v18);
    [v12 addObserver:v2 selector:sel_postLocalNotificationIfNeeded name:*MEMORY[0x1E4FB2628] object:0];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v2 selector:sel_postLocalNotificationIfNeeded name:*MEMORY[0x1E4F28270] object:0];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __40__ASCRebootstrapNotifier__initSingleton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained postLocalNotification];
}

- (void)dealloc
{
  int token = self->_token;
  if (token != -1) {
    notify_cancel(token);
  }
  v4.receiver = self;
  v4.super_class = (Class)ASCRebootstrapNotifier;
  [(ASCRebootstrapNotifier *)&v4 dealloc];
}

- (void)setRebootstrapCounterSnapshot:(unint64_t)a3
{
  if (self->_rebootstrapCounterSnapshot != a3)
  {
    self->_rebootstrapCounterSnapshot = a3;
    [(ASCRebootstrapNotifier *)self postLocalNotification];
  }
}

- (void)postLocalNotificationIfNeeded
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = ASCStringFromNotifyStatus(a1);
  int v2 = 136446466;
  id v3 = "-[ASCRebootstrapNotifier postLocalNotificationIfNeeded]";
  __int16 v4 = 2114;
  v5 = v1;
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s/notify_get_state failed: %{public}@", (uint8_t *)&v2, 0x16u);
}

- (void)postLocalNotification
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int16 v4 = 0;
    _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Daemon re-bootstrap detected", v4, 2u);
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"ASCRebootstrapDidStartNotification" object:self];
}

- (int)token
{
  return self->_token;
}

- (unint64_t)rebootstrapCounterSnapshot
{
  return self->_rebootstrapCounterSnapshot;
}

- (void)_initSingleton
{
  *a2 = 136446466;
  OUTLINED_FUNCTION_0_4((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[ASCRebootstrapNotifier _initSingleton]");
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s/notify_register_dispatch failed: %{public}@", v3, 0x16u);
}

@end