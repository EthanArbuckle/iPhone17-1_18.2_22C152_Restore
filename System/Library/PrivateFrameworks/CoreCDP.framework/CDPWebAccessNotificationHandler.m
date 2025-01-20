@interface CDPWebAccessNotificationHandler
+ (id)sharedInstance;
- (void)_stopObservingWebAccessStateChangeNotification;
- (void)dealloc;
- (void)startObservingWebAccessStateChangeNotification;
@end

@implementation CDPWebAccessNotificationHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_handler_0;
  return v2;
}

uint64_t __49__CDPWebAccessNotificationHandler_sharedInstance__block_invoke()
{
  sharedInstance_handler_0 = objc_alloc_init(CDPWebAccessNotificationHandler);
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  [(CDPWebAccessNotificationHandler *)self _stopObservingWebAccessStateChangeNotification];
  v3.receiver = self;
  v3.super_class = (Class)CDPWebAccessNotificationHandler;
  [(CDPWebAccessNotificationHandler *)&v3 dealloc];
}

- (void)startObservingWebAccessStateChangeNotification
{
  BOOL isObservingWebAccessStatus = self->_isObservingWebAccessStatus;
  v4 = _CDPLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isObservingWebAccessStatus)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v4, OS_LOG_TYPE_DEFAULT, "Already observing web access state change notification.", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2182AE000, v4, OS_LOG_TYPE_DEFAULT, "Starting to observe web access state change notification.", v7, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)HandleWebAccessStateChangedNotification, @"_CDPWebAccessStateChangeDarwinNotification", 0, (CFNotificationSuspensionBehavior)0);
    self->_BOOL isObservingWebAccessStatus = 1;
  }
}

- (void)_stopObservingWebAccessStateChangeNotification
{
  BOOL isObservingWebAccessStatus = self->_isObservingWebAccessStatus;
  v4 = _CDPLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isObservingWebAccessStatus)
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2182AE000, v4, OS_LOG_TYPE_DEFAULT, "Stopping to observe web access state change notification.", v7, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"_CDPWebAccessStateChangeDarwinNotification", 0);
    self->_BOOL isObservingWebAccessStatus = 0;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v4, OS_LOG_TYPE_DEFAULT, "Not yet started to observe web access state change notification.", buf, 2u);
    }
  }
}

@end