@interface BuddyLanguageChangeObserver
- (BOOL)isObserving;
- (BuddyLanguageChangeObserverDelegate)delegate;
- (NSTimer)localeTimer;
- (void)dealloc;
- (void)languageDidChange;
- (void)localeDidChange;
- (void)localeTimerFired:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocaleTimer:(id)a3;
- (void)setObserving:(BOOL)a3;
- (void)startLocaleTimer;
- (void)startObservingLanguageChanges;
- (void)stopObservingLanguageChanges;
- (void)subscribeToLanguageChangeNotification;
- (void)subscribeToLocaleChangeNotification;
- (void)unsubscribeFromLanguageChangeNotification;
- (void)unsubscribeFromLocaleChangeNotification;
@end

@implementation BuddyLanguageChangeObserver

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(BuddyLanguageChangeObserver *)self stopObservingLanguageChanges];
  v2.receiver = v4;
  v2.super_class = (Class)BuddyLanguageChangeObserver;
  [(BuddyLanguageChangeObserver *)&v2 dealloc];
}

- (void)startObservingLanguageChanges
{
  if (![(BuddyLanguageChangeObserver *)self isObserving])
  {
    [(BuddyLanguageChangeObserver *)self subscribeToLanguageChangeNotification];
    [(BuddyLanguageChangeObserver *)self subscribeToLocaleChangeNotification];
    [(BuddyLanguageChangeObserver *)self setObserving:1];
  }
}

- (void)stopObservingLanguageChanges
{
  if ([(BuddyLanguageChangeObserver *)self isObserving])
  {
    [(BuddyLanguageChangeObserver *)self unsubscribeFromLanguageChangeNotification];
    [(BuddyLanguageChangeObserver *)self unsubscribeFromLocaleChangeNotification];
    objc_super v2 = [(BuddyLanguageChangeObserver *)self localeTimer];
    [(NSTimer *)v2 invalidate];

    [(BuddyLanguageChangeObserver *)self setLocaleTimer:0];
    [(BuddyLanguageChangeObserver *)self setObserving:0];
  }
}

- (void)subscribeToLanguageChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100128EC8, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)unsubscribeFromLanguageChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.language.changed", 0);
}

- (void)languageDidChange
{
  v12 = self;
  SEL v11 = a2;
  objc_super v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [(NSUserDefaults *)v2 objectForKey:@"LockdownSetLanguage"];
  BOOL v4 = v3 != 0;

  BOOL v10 = v4;
  if (v4)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = oslog;
      os_log_type_t v6 = v8;
      sub_10004B24C(v7);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Language observer: Lockdown changed the language", (uint8_t *)v7, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(BuddyLanguageChangeObserver *)v12 startLocaleTimer];
  }
}

- (void)startLocaleTimer
{
  v15 = self;
  oslog[1] = (os_log_t)a2;
  objc_super v2 = [(BuddyLanguageChangeObserver *)self localeTimer];

  if (v2)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = oslog[0];
      os_log_type_t v4 = v13;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Language observer: Restarting locale timer", buf, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    v5 = [(BuddyLanguageChangeObserver *)v15 localeTimer];
    [(NSTimer *)v5 invalidate];

    [(BuddyLanguageChangeObserver *)v15 setLocaleTimer:0];
  }
  else
  {
    os_log_t v11 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v6 = v11;
      os_log_type_t v7 = v10;
      sub_10004B24C(v9);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Language observer: Starting locale timer", (uint8_t *)v9, 2u);
    }
    objc_storeStrong((id *)&v11, 0);
  }
  os_log_type_t v8 = +[NSTimer scheduledTimerWithTimeInterval:v15 target:"localeTimerFired:" selector:0 userInfo:0 repeats:8.0];
  [(BuddyLanguageChangeObserver *)v15 setLocaleTimer:v8];
}

- (void)localeTimerFired:(id)a3
{
  os_log_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = oslog;
    os_log_type_t v4 = v8;
    sub_10004B24C(v7);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Language observer: Locale didn't change in time, reporting only a language change to our delegate", (uint8_t *)v7, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v5 = [(BuddyLanguageChangeObserver *)v11 localeTimer];
  [(NSTimer *)v5 invalidate];

  [(BuddyLanguageChangeObserver *)v11 setLocaleTimer:0];
  os_log_type_t v6 = [(BuddyLanguageChangeObserver *)v11 delegate];
  [(BuddyLanguageChangeObserverDelegate *)v6 observer:v11 didObserveLanguageChange:1 localeChange:0];

  objc_storeStrong(location, 0);
}

- (void)subscribeToLocaleChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1001293C4, @"AppleDatePreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)unsubscribeFromLocaleChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"AppleDatePreferencesChangedNotification", 0);
}

- (void)localeDidChange
{
  v17 = self;
  SEL v16 = a2;
  objc_super v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [(NSUserDefaults *)v2 objectForKey:@"LockdownSetLocale"];
  BOOL v4 = v3 != 0;

  BOOL v15 = v4;
  if (v4)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = oslog;
      os_log_type_t v6 = v13;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Language observer: Lockdown changed the locale", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    os_log_type_t v7 = [(BuddyLanguageChangeObserver *)v17 localeTimer];
    BOOL v8 = v7 != 0;

    BOOL v11 = v8;
    v9 = [(BuddyLanguageChangeObserver *)v17 localeTimer];
    [(NSTimer *)v9 invalidate];

    [(BuddyLanguageChangeObserver *)v17 setLocaleTimer:0];
    os_log_type_t v10 = [(BuddyLanguageChangeObserver *)v17 delegate];
    [(BuddyLanguageChangeObserverDelegate *)v10 observer:v17 didObserveLanguageChange:v11 localeChange:1];
  }
}

- (BuddyLanguageChangeObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BuddyLanguageChangeObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (NSTimer)localeTimer
{
  return self->_localeTimer;
}

- (void)setLocaleTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end