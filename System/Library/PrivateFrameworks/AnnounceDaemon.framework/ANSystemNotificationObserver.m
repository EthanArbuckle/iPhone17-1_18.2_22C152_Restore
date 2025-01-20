@interface ANSystemNotificationObserver
+ (id)observer:(id)a3;
- (ANSystemNotificationObserver)init;
- (ANSystemNotificationObserver)initWithHandler:(id)a3;
- (id)observerHandler;
- (void)_languageDidChange;
- (void)dealloc;
- (void)removeNotificationObservers;
- (void)setObserverHandler:(id)a3;
- (void)startObservingNotifications;
@end

@implementation ANSystemNotificationObserver

- (ANSystemNotificationObserver)init
{
  v3.receiver = self;
  v3.super_class = (Class)ANSystemNotificationObserver;
  return [(ANSystemNotificationObserver *)&v3 init];
}

- (ANSystemNotificationObserver)initWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [(ANSystemNotificationObserver *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id observerHandler = v5->_observerHandler;
    v5->_id observerHandler = (id)v6;

    [(ANSystemNotificationObserver *)v5 startObservingNotifications];
  }

  return v5;
}

+ (id)observer:(id)a3
{
  id v3 = a3;
  id v4 = [[ANSystemNotificationObserver alloc] initWithHandler:v3];

  return v4;
}

- (void)dealloc
{
  [(ANSystemNotificationObserver *)self removeNotificationObservers];
  v3.receiver = self;
  v3.super_class = (Class)ANSystemNotificationObserver;
  [(ANSystemNotificationObserver *)&v3 dealloc];
}

- (void)startObservingNotifications
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = ANLogHandleSystemNotificationObserver();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "%@SystemNotificationObserver start observing System Notifications.", (uint8_t *)&v5, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_LanguageChanged, @"AppleLanguagePreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)removeNotificationObservers
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"AppleLanguagePreferencesChangedNotification", 0);
}

- (void)_languageDidChange
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(ANSystemNotificationObserver *)self removeNotificationObservers];
  objc_super v3 = ANLogHandleSystemNotificationObserver();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "%@SystemNotificationObserver language did change.", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(ANSystemNotificationObserver *)self observerHandler];
  v4[2](v4, 1);
}

- (id)observerHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setObserverHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end