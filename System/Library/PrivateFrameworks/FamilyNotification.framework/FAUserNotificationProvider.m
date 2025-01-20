@interface FAUserNotificationProvider
- (BOOL)customCategoryForNotification:(id)a3;
- (FAUserNotificationProvider)init;
- (FAUserNotificationProviderDelegate)delegate;
- (NSLock)categoryLock;
- (UNUserNotificationCenter)notificationCenter;
- (id)_actionsForNotification:(id)a3;
- (id)_categoryForNotification:(id)a3;
- (id)_customCategoryIdentifierForNotification:(id)a3;
- (id)_defaultNotificationCategories;
- (id)_notificationContent:(id)a3;
- (void)_addCategoryForNotification:(id)a3;
- (void)_notifyDelegateOfAction:(id)a3 forNote:(id)a4;
- (void)deliveredNotifications:(id)a3;
- (void)postNotification:(id)a3;
- (void)setCategoryLock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)tearDownNotificationWithIdentifier:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation FAUserNotificationProvider

- (FAUserNotificationProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)FAUserNotificationProvider;
  v2 = [(FAUserNotificationProvider *)&v10 init];
  if (v2)
  {
    v3 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.familynotifications"];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = v3;

    [(UNUserNotificationCenter *)v2->_notificationCenter setDelegate:v2];
    [(UNUserNotificationCenter *)v2->_notificationCenter setWantsNotificationResponsesDelivered];
    v5 = v2->_notificationCenter;
    v6 = [(FAUserNotificationProvider *)v2 _defaultNotificationCategories];
    [(UNUserNotificationCenter *)v5 setNotificationCategories:v6];

    v7 = (NSLock *)objc_alloc_init((Class)NSLock);
    categoryLock = v2->_categoryLock;
    v2->_categoryLock = v7;
  }
  return v2;
}

- (id)_defaultNotificationCategories
{
  id v2 = [objc_alloc((Class)NSMutableSet) initWithCapacity:1];
  v3 = +[UNNotificationCategory categoryWithIdentifier:@"com.apple.familynotifications.default" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:1];
  [v2 addObject:v3];

  return v2;
}

- (void)postNotification:(id)a3
{
  id v4 = a3;
  v5 = [(FAUserNotificationProvider *)self _notificationContent:v4];
  v6 = [v4 identifier];

  v7 = +[UNNotificationRequest requestWithIdentifier:v6 content:v5 trigger:0];

  v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    objc_super v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Posting notification request %@", (uint8_t *)&v9, 0xCu);
  }

  [(UNUserNotificationCenter *)self->_notificationCenter addNotificationRequest:v7 withCompletionHandler:&stru_1000083F8];
}

- (id)_notificationContent:(id)a3
{
  id v4 = a3;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Generating notification content", v19, 2u);
  }

  id v6 = objc_alloc_init((Class)UNMutableNotificationContent);
  v7 = +[NSString localizedUserNotificationStringForKey:@"FAFamilyHeader" arguments:0];
  [v6 setHeader:v7];

  v8 = [v4 title];
  [v6 setTitle:v8];

  int v9 = [v4 informativeText];
  [v6 setBody:v9];

  objc_super v10 = [v4 relevanceDate];
  [v6 setDate:v10];

  v11 = [v4 expiryDate];
  [v6 setExpirationDate:v11];

  v12 = +[UNNotificationSound defaultSound];
  [v6 setSound:v12];

  [v6 setShouldBackgroundDefaultAction:1];
  objc_msgSend(v6, "setShouldPreventNotificationDismissalAfterDefaultAction:", objc_msgSend(v4, "shouldPersistWhenActivated"));
  if ([(FAUserNotificationProvider *)self customCategoryForNotification:v4])
  {
    v13 = _FALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notification calls for custom action buttons", v19, 2u);
    }

    v14 = [(FAUserNotificationProvider *)self _customCategoryIdentifierForNotification:v4];
    [v6 setCategoryIdentifier:v14];

    [(FAUserNotificationProvider *)self _addCategoryForNotification:v4];
  }
  else
  {
    [v6 setCategoryIdentifier:@"com.apple.familynotifications.default"];
  }
  v20[0] = @"FAFamilyNotificationUUIDKey";
  v15 = [v4 uuid];
  v20[1] = @"FAFamilyNotificationAsDictionaryKey";
  v21[0] = v15;
  v16 = [v4 cacheDictionaryRepresentation];
  v21[1] = v16;
  v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v6 setUserInfo:v17];

  return v6;
}

- (void)tearDownNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Tearing down notification %@:", buf, 0xCu);
  }

  notificationCenter = self->_notificationCenter;
  id v11 = v4;
  v7 = +[NSArray arrayWithObjects:&v11 count:1];
  [(UNUserNotificationCenter *)notificationCenter removePendingNotificationRequestsWithIdentifiers:v7];

  v8 = self->_notificationCenter;
  id v10 = v4;
  int v9 = +[NSArray arrayWithObjects:&v10 count:1];
  [(UNUserNotificationCenter *)v8 removeDeliveredNotificationsWithIdentifiers:v9];
}

- (void)deliveredNotifications:(id)a3
{
  id v4 = a3;
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching delivered notifications", buf, 2u);
  }

  notificationCenter = self->_notificationCenter;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004B0C;
  v8[3] = &unk_100008298;
  id v9 = v4;
  id v7 = v4;
  [(UNUserNotificationCenter *)notificationCenter getDeliveredNotificationsWithCompletionHandler:v8];
}

- (id)_categoryForNotification:(id)a3
{
  id v4 = a3;
  v5 = [(FAUserNotificationProvider *)self _customCategoryIdentifierForNotification:v4];
  id v6 = [(FAUserNotificationProvider *)self _actionsForNotification:v4];

  id v7 = +[UNNotificationCategory categoryWithIdentifier:v5 actions:v6 intentIdentifiers:&__NSArray0__struct options:1];

  return v7;
}

- (id)_customCategoryIdentifierForNotification:(id)a3
{
  v3 = [a3 uuid];
  id v4 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.familynotifications", v3];

  return v4;
}

- (void)_addCategoryForNotification:(id)a3
{
  categoryLock = self->_categoryLock;
  id v5 = a3;
  [(NSLock *)categoryLock lock];
  id v6 = [(UNUserNotificationCenter *)self->_notificationCenter notificationCategories];
  id v8 = [v6 mutableCopy];

  id v7 = [(FAUserNotificationProvider *)self _categoryForNotification:v5];

  [v8 addObject:v7];
  [(UNUserNotificationCenter *)self->_notificationCenter setNotificationCategories:v8];
  [(NSLock *)self->_categoryLock unlock];
}

- (BOOL)customCategoryForNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 actionButtonLabel];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v3 otherButtonLabel];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (id)_actionsForNotification:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  BOOL v5 = [v3 actionButtonLabel];

  if (v5)
  {
    id v6 = [v3 actionButtonLabel];
    id v7 = +[UNNotificationAction actionWithIdentifier:UNNotificationDefaultActionIdentifier title:v6 options:0];

    [v4 addObject:v7];
  }
  id v8 = [v3 otherButtonLabel];

  if (v8)
  {
    id v9 = [v3 otherButtonLabel];
    id v10 = +[UNNotificationAction actionWithIdentifier:UNNotificationDismissActionIdentifier title:v9 options:0];

    [v4 addObject:v10];
  }

  return v4;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  id v9 = _FALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received notification response - %@", (uint8_t *)&v18, 0xCu);
  }

  id v10 = [v7 notification];
  id v11 = [v10 request];
  v12 = [v11 content];

  id v13 = [v12 userInfo];

  if (v13)
  {
    v14 = [v12 userInfo];
    v15 = [v14 objectForKeyedSubscript:@"FAFamilyNotificationAsDictionaryKey"];

    id v16 = [objc_alloc((Class)FAFamilyNotification) initWithCacheDictionaryRepresentation:v15];
    if (v16)
    {
      v17 = [v7 actionIdentifier];
      [(FAUserNotificationProvider *)self _notifyDelegateOfAction:v17 forNote:v16];
    }
    else
    {
      v17 = _FALogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100005478(v17);
      }
    }
  }
  v8[2](v8);
}

- (void)_notifyDelegateOfAction:(id)a3 forNote:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to notifying delegate of action %@", (uint8_t *)&v10, 0xCu);
  }

  if ([v6 isEqualToString:UNNotificationDefaultActionIdentifier])
  {
    id v9 = [(FAUserNotificationProvider *)self delegate];
    [v9 provider:self didActivateNotification:v7];
  }
  else if ([v6 isEqualToString:UNNotificationDismissActionIdentifier])
  {
    id v9 = [(FAUserNotificationProvider *)self delegate];
    [v9 provider:self didDismissNotification:v7];
  }
  else
  {
    id v9 = _FALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000054BC(v9);
    }
  }
}

- (FAUserNotificationProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FAUserNotificationProviderDelegate *)WeakRetained;
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

- (NSLock)categoryLock
{
  return self->_categoryLock;
}

- (void)setCategoryLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryLock, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end