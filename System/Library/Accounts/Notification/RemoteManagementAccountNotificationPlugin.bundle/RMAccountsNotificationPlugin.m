@interface RMAccountsNotificationPlugin
- (BOOL)_changeIsSignificantForAccount:(id)a3 oldAccount:(id)a4;
- (BOOL)_shouldNotifyForAccount:(id)a3;
- (void)_postNotification;
- (void)_sendStatusNotificationIfNeededForAccount:(id)a3 oldAccount:(id)a4 changeType:(int)a5;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation RMAccountsNotificationPlugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
}

- (void)_sendStatusNotificationIfNeededForAccount:(id)a3 oldAccount:(id)a4 changeType:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(RMAccountsNotificationPlugin *)self _shouldNotifyForAccount:v8]
    || [(RMAccountsNotificationPlugin *)self _shouldNotifyForAccount:v9])
  {
    switch(a5)
    {
      case 3:
        v10 = +[RMLog accountsNotificationPlugin];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_63CC(v9);
        }
        goto LABEL_15;
      case 2:
        v11 = +[RMLog accountsNotificationPlugin];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_6558(v8);
        }

        unsigned int v12 = [(RMAccountsNotificationPlugin *)self _changeIsSignificantForAccount:v8 oldAccount:v9];
        v10 = +[RMLog accountsNotificationPlugin];
        BOOL v13 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
        if (v12)
        {
          if (v13) {
            sub_6450(v8);
          }
          goto LABEL_15;
        }
        if (v13) {
          sub_64D4(v8);
        }

        break;
      case 1:
        v10 = +[RMLog accountsNotificationPlugin];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_6348(v8);
        }
LABEL_15:

        [(RMAccountsNotificationPlugin *)self _postNotification];
        break;
      default:
        v14 = +[RMLog accountsNotificationPlugin];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          sub_62D0(a5, v14);
        }

        break;
    }
  }
}

- (void)_postNotification
{
  v2 = +[RMLog accountsNotificationPlugin];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    CFStringRef v5 = @"com.apple.remotemanagement.status.account.notification";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Posting notification: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  notify_post((const char *)[@"com.apple.remotemanagement.status.account.notification" UTF8String]);
  v3 = +[RMLog accountsNotificationPlugin];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_65DC(v3);
  }
}

- (BOOL)_shouldNotifyForAccount:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = [a3 objectForKeyedSubscript:@"RemoteManagementConfigurationIdentifier"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_changeIsSignificantForAccount:(id)a3 oldAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[AccountStatusHandler handlerForAccount:v5];
  id v8 = v7;
  if (v7) {
    unsigned __int8 v9 = [v7 statusHasChangedForAccount:v5 oldAccount:v6];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

@end