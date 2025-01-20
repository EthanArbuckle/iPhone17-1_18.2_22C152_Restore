@interface IDSUserNotificationsCenter
+ (IDSUserNotificationsCenter)sharedInstance;
- (IDSUserNotificationsCenter)init;
- (UNUserNotificationCenter)notificationCenter;
- (void)postNotificationWithTitle:(id)a3 body:(id)a4 iconIdentifier:(id)a5 shouldShowSubordinateIcon:(BOOL)a6 actionURL:(id)a7;
- (void)setNotificationCenter:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation IDSUserNotificationsCenter

+ (IDSUserNotificationsCenter)sharedInstance
{
  if (qword_100A4A948 != -1) {
    dispatch_once(&qword_100A4A948, &stru_100984CC0);
  }
  v2 = (void *)qword_100A4A950;

  return (IDSUserNotificationsCenter *)v2;
}

- (IDSUserNotificationsCenter)init
{
  uint64_t v3 = IMWeakLinkClass();
  if (v3)
  {
    v4 = (objc_class *)v3;
    v12.receiver = self;
    v12.super_class = (Class)IDSUserNotificationsCenter;
    v5 = [(IDSUserNotificationsCenter *)&v12 init];
    if (v5)
    {
      id v6 = [v4 alloc];
      v7 = (UNUserNotificationCenter *)[v6 initWithBundleIdentifier:kIDSDaemonFirewallNotificationBundleIdentifier];
      notificationCenter = v5->_notificationCenter;
      v5->_notificationCenter = v7;

      [(UNUserNotificationCenter *)v5->_notificationCenter setDelegate:v5];
      [(UNUserNotificationCenter *)v5->_notificationCenter setWantsNotificationResponsesDelivered];
    }
    self = v5;
    v9 = self;
  }
  else
  {
    v10 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100715E84(v10);
    }

    v9 = 0;
  }

  return v9;
}

- (void)postNotificationWithTitle:(id)a3 body:(id)a4 iconIdentifier:(id)a5 shouldShowSubordinateIcon:(BOOL)a6 actionURL:(id)a7
{
  uint64_t v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (qword_100A4A970 != -1) {
    dispatch_once(&qword_100A4A970, &stru_100984CE0);
  }
  if (qword_100A4A958
    && qword_100A4A960
    && qword_100A4A968
    && ([(IDSUserNotificationsCenter *)self notificationCenter],
        v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v16))
  {
    if ([v14 hasPrefix:@"com.apple."])
    {
      v17 = [(id)qword_100A4A968 iconForApplicationIdentifier:v14];
    }
    else
    {
      unsigned int v30 = v8;
      v29 = +[NSString stringWithFormat:v14, @"@2x.png"];
      v18 = +[NSString stringWithFormat:@"%@/%@", @"/System/Library/UserNotifications/Bundles/com.apple.identityservicesd.firewall.bundle", v29];
      v19 = +[NSFileManager defaultManager];
      unsigned int v20 = [v19 fileExistsAtPath:v18];

      v21 = +[IDSFoundationLog delivery];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v22 = @"NO";
        if (v20) {
          CFStringRef v22 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v32 = v18;
        __int16 v33 = 2112;
        CFStringRef v34 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Loading image from %@, Does exist %@", buf, 0x16u);
      }

      if (v20) {
        [(id)qword_100A4A968 iconAtPath:v18];
      }
      else {
      v17 = [(id)qword_100A4A968 iconForApplicationIdentifier:@"com.apple.Preferences"];
      }
      uint64_t v8 = v30;
    }
    id v23 = objc_alloc_init((Class)qword_100A4A960);
    [v23 setTitle:v12];
    [v23 setBody:v13];
    [v23 setIcon:v17];
    [v23 setShouldShowSubordinateIcon:v8];
    if (v15) {
      [v23 setDefaultActionURL:v15];
    }
    [v23 setHasDefaultAction:v15 != 0];
    v24 = (void *)qword_100A4A958;
    v25 = +[NSUUID UUID];
    v26 = [v25 UUIDString];
    v27 = [v24 requestWithIdentifier:v26 content:v23 trigger:0];

    v28 = [(IDSUserNotificationsCenter *)self notificationCenter];
    [v28 addNotificationRequest:v27 withCompletionHandler:&stru_100984D00];
  }
  else
  {
    v17 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_100715EC8((uint64_t)v12, v17);
    }
  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a4;
  v7 = (void (**)(id, uint64_t))a5;
  uint64_t v8 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Will present ids notification %@", (uint8_t *)&v9, 0xCu);
  }

  v7[2](v7, 16);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a4;
  v7 = (void (**)(void))a5;
  uint64_t v8 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Did receive ids notification response %@", (uint8_t *)&v9, 0xCu);
  }

  v7[2](v7);
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
}

@end