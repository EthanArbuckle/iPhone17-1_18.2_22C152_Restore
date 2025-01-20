@interface ANNotificationProvider
- (ANNotificationProvider)init;
- (ANNotificationProviderDelegate)delegate;
- (UNUserNotificationCenter)notificationCenter;
- (id)_defaultNotificationCategories;
- (id)_notificationContent:(id)a3;
- (id)initForSectionWithID:(id)a3;
- (void)_notifyDelegateOfAction:(id)a3 forNotification:(id)a4;
- (void)deliveredNotifications:(id)a3;
- (void)postNotification:(id)a3 completion:(id)a4;
- (void)removeNotificationWithIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation ANNotificationProvider

- (id)initForSectionWithID:(id)a3
{
  return [(ANNotificationProvider *)self init];
}

- (ANNotificationProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)ANNotificationProvider;
  v2 = [(ANNotificationProvider *)&v8 init];
  if (v2)
  {
    v3 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.accountnotifications"];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = v3;

    [(UNUserNotificationCenter *)v2->_notificationCenter setDelegate:v2];
    [(UNUserNotificationCenter *)v2->_notificationCenter setWantsNotificationResponsesDelivered];
    v5 = v2->_notificationCenter;
    v6 = [(ANNotificationProvider *)v2 _defaultNotificationCategories];
    [(UNUserNotificationCenter *)v5 setNotificationCategories:v6];
  }
  return v2;
}

- (id)_defaultNotificationCategories
{
  id v2 = [objc_alloc((Class)NSMutableSet) initWithCapacity:1];
  v3 = +[UNNotificationCategory categoryWithIdentifier:@"com.apple.accountnotification.default" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:1];
  [v2 addObject:v3];

  return v2;
}

- (void)postNotification:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(ANNotificationProvider *)self _notificationContent:v7];
  v9 = [v7 identifier];

  v10 = +[UNNotificationRequest requestWithIdentifier:v9 content:v8 trigger:0];

  v11 = _ANLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[ANNotificationProvider postNotification:completion:]";
    __int16 v18 = 1024;
    int v19 = 71;
    __int16 v20 = 2112;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Posting notification request %@\"", buf, 0x1Cu);
  }

  notificationCenter = self->_notificationCenter;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000053D0;
  v14[3] = &unk_10000C3F8;
  id v15 = v6;
  id v13 = v6;
  [(UNUserNotificationCenter *)notificationCenter addNotificationRequest:v10 withCompletionHandler:v14];
}

- (id)_notificationContent:(id)a3
{
  id v3 = a3;
  v4 = _ANLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[ANNotificationProvider _notificationContent:]";
    __int16 v17 = 1024;
    int v18 = 83;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Generating notification content\"", buf, 0x12u);
  }

  id v5 = objc_alloc_init((Class)UNMutableNotificationContent);
  id v6 = [v3 title];
  [v5 setTitle:v6];

  id v7 = [v3 message];
  [v5 setBody:v7];

  objc_super v8 = [v3 date];
  [v5 setDate:v8];

  v9 = +[UNNotificationSound defaultSound];
  [v5 setSound:v9];

  [v5 setShouldPreventNotificationDismissalAfterDefaultAction:1];
  [v5 setShouldBackgroundDefaultAction:1];
  [v5 setCategoryIdentifier:@"com.apple.accountnotification.default"];
  v10 = objc_msgSend(v3, "dictionaryRepresentation", @"ANAccountNotificationDictionaryRepresentationKey");

  v14 = v10;
  v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [v5 setUserInfo:v11];

  return v5;
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = _ANLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v4;
    id v6 = +[NSArray arrayWithObjects:&v13 count:1];
    *(_DWORD *)buf = 136315650;
    id v15 = "-[ANNotificationProvider removeNotificationWithIdentifier:]";
    __int16 v16 = 1024;
    int v17 = 104;
    __int16 v18 = 2112;
    int v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Removing notification %@\"", buf, 0x1Cu);
  }
  notificationCenter = self->_notificationCenter;
  id v12 = v4;
  objc_super v8 = +[NSArray arrayWithObjects:&v12 count:1];
  [(UNUserNotificationCenter *)notificationCenter removePendingNotificationRequestsWithIdentifiers:v8];

  v9 = self->_notificationCenter;
  id v11 = v4;
  v10 = +[NSArray arrayWithObjects:&v11 count:1];
  [(UNUserNotificationCenter *)v9 removeDeliveredNotificationsWithIdentifiers:v10];
}

- (void)deliveredNotifications:(id)a3
{
  id v4 = a3;
  id v5 = _ANLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[ANNotificationProvider deliveredNotifications:]";
    __int16 v12 = 1024;
    int v13 = 112;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Fetching delivered notifications\"", buf, 0x12u);
  }

  notificationCenter = self->_notificationCenter;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000058E0;
  v8[3] = &unk_10000C460;
  id v9 = v4;
  id v7 = v4;
  [(UNUserNotificationCenter *)notificationCenter getDeliveredNotificationsWithCompletionHandler:v8];
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  objc_super v8 = (void (**)(void))a5;
  id v9 = _ANLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315650;
    int v19 = "-[ANNotificationProvider userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    __int16 v20 = 1024;
    int v21 = 137;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Recieved notification response %@\"", (uint8_t *)&v18, 0x1Cu);
  }

  v10 = [v7 notification];
  id v11 = [v10 request];
  __int16 v12 = [v11 content];

  int v13 = [v12 userInfo];

  if (v13)
  {
    v14 = [v12 userInfo];
    id v15 = [v14 objectForKeyedSubscript:@"ANAccountNotificationDictionaryRepresentationKey"];

    if (v15)
    {
      __int16 v16 = [objc_alloc((Class)ANAccountNotification) initWithDictionaryRepresentation:v15];
      if (v16)
      {
        int v17 = [v7 actionIdentifier];
        [(ANNotificationProvider *)self _notifyDelegateOfAction:v17 forNotification:v16];
      }
      else
      {
        int v17 = _ANLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100007AE8();
        }
      }
    }
    else
    {
      __int16 v16 = _ANLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100007A6C();
      }
    }
  }
  else
  {
    id v15 = _ANLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000079F0();
    }
  }

  v8[2](v8);
}

- (void)_notifyDelegateOfAction:(id)a3 forNotification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = _ANLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    __int16 v12 = "-[ANNotificationProvider _notifyDelegateOfAction:forNotification:]";
    __int16 v13 = 1024;
    int v14 = 165;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Attempting to notify delegate of action %@\"", (uint8_t *)&v11, 0x1Cu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    if ([v6 isEqualToString:UNNotificationDefaultActionIdentifier])
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 notificationProvider:self didActivateNotification:v7];
    }
    else if ([v6 isEqualToString:UNNotificationDismissActionIdentifier])
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 notificationProvider:self didDismissNotification:v7];
    }
    else
    {
      v10 = _ANLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100007B64();
      }
    }
  }
  else
  {
    v10 = _ANLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      __int16 v12 = "-[ANNotificationProvider _notifyDelegateOfAction:forNotification:]";
      __int16 v13 = 1024;
      int v14 = 176;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s (%d) \"No delegate, nothing to pass back\"", (uint8_t *)&v11, 0x12u);
    }
  }
}

- (ANNotificationProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ANNotificationProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end