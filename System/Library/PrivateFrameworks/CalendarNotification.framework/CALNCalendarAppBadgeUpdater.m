@interface CALNCalendarAppBadgeUpdater
- (CALNCalendarAppBadgeUpdater)initWithInboxNotificationMonitor:(id)a3;
- (CALNInboxNotificationMonitor)inboxNotificationMonitor;
- (UISApplicationState)applicationState;
- (void)handleNotificationsChangedNotification:(id)a3;
@end

@implementation CALNCalendarAppBadgeUpdater

- (CALNCalendarAppBadgeUpdater)initWithInboxNotificationMonitor:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CALNCalendarAppBadgeUpdater;
  v6 = [(CALNCalendarAppBadgeUpdater *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inboxNotificationMonitor, a3);
    id v8 = objc_alloc(MEMORY[0x263F83E50]);
    uint64_t v9 = [v8 initWithBundleIdentifier:*MEMORY[0x263F300B0]];
    applicationState = v7->_applicationState;
    v7->_applicationState = (UISApplicationState *)v9;

    [v5 addNotificationsChangedObserver:v7 selector:sel_handleNotificationsChangedNotification_];
  }

  return v7;
}

- (void)handleNotificationsChangedNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = [(CALNCalendarAppBadgeUpdater *)self inboxNotificationMonitor];
  uint64_t v5 = [v4 eventNotificationCount];

  v6 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67240192;
    v9[1] = v5;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Update calendar app badge count to %{public}d", (uint8_t *)v9, 8u);
  }

  v7 = [NSNumber numberWithUnsignedInteger:v5];
  id v8 = [(CALNCalendarAppBadgeUpdater *)self applicationState];
  [v8 setBadgeValue:v7];
}

- (CALNInboxNotificationMonitor)inboxNotificationMonitor
{
  return self->_inboxNotificationMonitor;
}

- (UISApplicationState)applicationState
{
  return self->_applicationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationState, 0);
  objc_storeStrong((id *)&self->_inboxNotificationMonitor, 0);
}

@end