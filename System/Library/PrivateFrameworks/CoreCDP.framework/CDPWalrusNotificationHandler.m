@interface CDPWalrusNotificationHandler
+ (id)sharedInstance;
- (BOOL)isObservingWalrusStatus;
- (CDPWalrusNotificationHandler)init;
- (void)_stopObservingWalrusStateChangeNotification;
- (void)dealloc;
- (void)startObservingWalrusStateChangeNotification;
@end

@implementation CDPWalrusNotificationHandler

- (void)startObservingWalrusStateChangeNotification
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2182AE000, log, OS_LOG_TYPE_DEBUG, "Already observing walrus state change notification.", v1, 2u);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_handler;
  return v2;
}

uint64_t __46__CDPWalrusNotificationHandler_sharedInstance__block_invoke()
{
  sharedInstance_handler = objc_alloc_init(CDPWalrusNotificationHandler);
  return MEMORY[0x270F9A758]();
}

- (CDPWalrusNotificationHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)CDPWalrusNotificationHandler;
  result = [(CDPWalrusNotificationHandler *)&v3 init];
  if (result)
  {
    result->_observerLock._os_unfair_lock_opaque = 0;
    result->_isObservingWalrusStatus = 0;
  }
  return result;
}

- (BOOL)isObservingWalrusStatus
{
  v2 = self;
  p_observerLock = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  LOBYTE(v2) = v2->_isObservingWalrusStatus;
  os_unfair_lock_unlock(p_observerLock);
  return (char)v2;
}

- (void)dealloc
{
  [(CDPWalrusNotificationHandler *)self _stopObservingWalrusStateChangeNotification];
  v3.receiver = self;
  v3.super_class = (Class)CDPWalrusNotificationHandler;
  [(CDPWalrusNotificationHandler *)&v3 dealloc];
}

- (void)_stopObservingWalrusStateChangeNotification
{
  p_observerLock = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  BOOL isObservingWalrusStatus = self->_isObservingWalrusStatus;
  v5 = _CDPLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (isObservingWalrusStatus)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "Stopping to observe walrus state change notification.", buf, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"_CDPWalrusStateChangeDarwinNotification", 0);
    v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "Stopping to observe OT peer change notification.", v10, 2u);
    }

    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v9, self, @"com.apple.security.octagon.peer-changed", 0);
    self->_BOOL isObservingWalrusStatus = 0;
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "Not yet started to observe walrus state change notification.", v12, 2u);
    }
  }
  os_unfair_lock_unlock(p_observerLock);
}

@end