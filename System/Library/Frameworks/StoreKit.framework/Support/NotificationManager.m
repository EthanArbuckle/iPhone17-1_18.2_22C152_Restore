@interface NotificationManager
+ (id)_notificationCategories;
+ (id)sharedManager;
+ (unint64_t)_authorizationOptions;
- (NotificationManager)init;
- (void)postNotificationRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)removeNotificationRequestWithIdentifier:(id)a3;
@end

@implementation NotificationManager

- (NotificationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)NotificationManager;
  v2 = [(NotificationManager *)&v8 init];
  if (v2)
  {
    v3 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.AppStore"];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = v3;

    [(UNUserNotificationCenter *)v2->_notificationCenter setWantsNotificationResponsesDelivered];
    v5 = v2->_notificationCenter;
    v6 = +[NotificationManager _notificationCategories];
    [(UNUserNotificationCenter *)v5 setNotificationCategories:v6];

    [(UNUserNotificationCenter *)v2->_notificationCenter requestAuthorizationWithOptions:+[NotificationManager _authorizationOptions] completionHandler:&stru_10035A230];
  }
  return v2;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100086E24;
  block[3] = &unk_1003572F0;
  block[4] = a1;
  if (qword_1003A0380 != -1) {
    dispatch_once(&qword_1003A0380, block);
  }
  v2 = (void *)qword_1003A0378;

  return v2;
}

- (void)postNotificationRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  notificationCenter = self->_notificationCenter;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100086F78;
  v11[3] = &unk_10035A258;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(UNUserNotificationCenter *)notificationCenter addNotificationRequest:v9 withCompletionHandler:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)removeNotificationRequestWithIdentifier:(id)a3
{
  notificationCenter = self->_notificationCenter;
  id v6 = a3;
  id v4 = a3;
  v5 = +[NSArray arrayWithObjects:&v6 count:1];
  -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](notificationCenter, "removeDeliveredNotificationsWithIdentifiers:", v5, v6);
}

+ (id)_notificationCategories
{
  id v2 = objc_alloc_init((Class)NSMutableSet);
  v3 = +[UNNotificationCategory categoryWithIdentifier:@"sk-notification-category-purchase-intent" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:1];
  [v2 addObject:v3];

  id v4 = +[NSString localizedUserNotificationStringForKey:@"VIEW_IN_APP_STORE" arguments:0];
  v5 = +[UNNotificationAction actionWithIdentifier:@"sk-notification-action-view-in-app-store" title:v4 options:0];

  id v9 = v5;
  id v6 = +[NSArray arrayWithObjects:&v9 count:1];
  id v7 = +[UNNotificationCategory categoryWithIdentifier:@"sk-notification-category-app-terminate" actions:v6 intentIdentifiers:&__NSArray0__struct options:1];
  [v2 addObject:v7];

  return v2;
}

+ (unint64_t)_authorizationOptions
{
  return 6;
}

- (void).cxx_destruct
{
}

@end