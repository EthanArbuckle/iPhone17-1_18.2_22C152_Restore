@interface IDSTemporaryPhoneAlertManager
+ (id)_controller;
+ (id)_notificationsCenter;
+ (id)serviceString;
+ (void)attemptPresentationOfExpirationAlertForUser:(id)a3;
+ (void)attemptPresentationOfNearExpirationAlertForUser:(id)a3;
+ (void)clearFollowups;
+ (void)presentSuccessAlertForUser:(id)a3;
@end

@implementation IDSTemporaryPhoneAlertManager

+ (id)_controller
{
  id v2 = [objc_alloc((Class)IMWeakLinkClass()) initWithClientIdentifier:@"com.apple.identityservicesd"];

  return v2;
}

+ (id)_notificationsCenter
{
  return +[IDSUserNotificationsCenter sharedInstance];
}

+ (void)presentSuccessAlertForUser:(id)a3
{
  id v4 = a3;
  v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Presenting Home Number success alert for user %@", buf, 0xCu);
  }

  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = IMLocalizedStringFromTableInBundle();
  v8 = IMLocalizedStringFromTableInBundle();
  v9 = [a1 serviceString];
  v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);
  v11 = [v4 phoneNumber];
  v12 = IMFormattedDisplayStringForID();
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v12, v9);

  v14 = [a1 _notificationsCenter];
  v15 = +[NSURL URLWithString:@"prefs:root=MESSAGES&path=MADRID_ACCOUNTS_BUTTON"];
  [v14 postNotificationWithTitle:v10 body:v13 iconIdentifier:@"com.apple.Preferences" shouldShowSubordinateIcon:0 actionURL:v15];
}

+ (void)attemptPresentationOfNearExpirationAlertForUser:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 finishedRegistration];
  v6 = +[IMRGLog registration];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Presenting Home Number near expiration alert for user %@", buf, 0xCu);
    }

    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = IMLocalizedStringFromTableInBundle();
    v9 = IMLocalizedStringFromTableInBundle();
    v10 = [a1 serviceString];
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v10);
    v12 = [v4 phoneNumber];
    v13 = IMFormattedDisplayStringForID();
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v13, v10);

    v15 = [a1 _notificationsCenter];
    v16 = +[NSURL URLWithString:@"prefs:root=MESSAGES&path=MADRID_ACCOUNTS_BUTTON"];
    [v15 postNotificationWithTitle:v11 body:v14 iconIdentifier:@"com.apple.Preferences" shouldShowSubordinateIcon:0 actionURL:v16];
  }
  else if (v7)
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not presenting Home Number near expiration alert for user %@", buf, 0xCu);
  }
}

+ (void)attemptPresentationOfExpirationAlertForUser:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 finishedRegistration];
  v6 = +[IMRGLog registration];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Presenting Home Number expiration alert for user %@", buf, 0xCu);
    }

    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = IMLocalizedStringFromTableInBundle();
    v9 = IMLocalizedStringFromTableInBundle();
    v10 = [a1 serviceString];
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v10);
    v12 = [v4 phoneNumber];
    v13 = IMFormattedDisplayStringForID();
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v13, v10);

    v15 = [a1 _notificationsCenter];
    v16 = +[NSURL URLWithString:@"prefs:root=MESSAGES&path=MADRID_ACCOUNTS_BUTTON"];
    [v15 postNotificationWithTitle:v11 body:v14 iconIdentifier:@"com.apple.Preferences" shouldShowSubordinateIcon:0 actionURL:v16];
  }
  else if (v7)
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not presenting Home Number expiration alert for user %@", buf, 0xCu);
  }
}

+ (void)clearFollowups
{
  v3 = +[IMUserDefaults sharedDefaults];
  id v4 = [v3 appValueForKey:@"HomeNumberFollowUpMigration"];

  if (!v4)
  {
    unsigned __int8 v5 = [a1 _controller];
    v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Purging success and near expiration followups", v9, 2u);
    }

    v10[0] = @"com.apple.identityservicesd.HomeNumberSuccess";
    v10[1] = @"com.apple.identityservicesd.HomeNumberNearExpiration";
    v10[2] = @"com.apple.identityservicesd.HomeNumberExpiration";
    BOOL v7 = +[NSArray arrayWithObjects:v10 count:3];
    [v5 clearPendingFollowUpItemsWithUniqueIdentifiers:v7 error:0];
    v8 = +[IMUserDefaults sharedDefaults];
    [v8 setAppValue:&__kCFBooleanTrue forKey:@"HomeNumberFollowUpMigration"];
  }
}

+ (id)serviceString
{
  id v2 = +[IDSDServiceController sharedInstance];
  v3 = [v2 serviceWithPushTopic:@"com.apple.madrid"];

  id v4 = +[IDSDAccountController sharedInstance];
  unsigned __int8 v5 = [v4 enabledAccountsOnService:v3];
  id v6 = [v5 count];

  BOOL v7 = +[IDSDServiceController sharedInstance];
  v8 = [v7 serviceWithPushTopic:@"com.apple.ess"];

  v9 = +[IDSDAccountController sharedInstance];
  v10 = [v9 enabledAccountsOnService:v8];
  unint64_t v11 = (unint64_t)[v10 count];

  v12 = +[IDSDServiceController sharedInstance];
  v13 = [v12 serviceWithPushTopic:@"com.apple.private.ac"];

  v14 = +[IDSDAccountController sharedInstance];
  v15 = [v14 enabledAccountsOnService:v13];
  unint64_t v16 = v11 | (unint64_t)[v15 count];

  id v17 = +[NSBundle bundleForClass:objc_opt_class()];
  IMLocalizedStringFromTableInBundle();
  if ((v6 != 0) == (v16 != 0)) {
    id v18 = {;
  }
    v19 = IMLocalizedStringFromTableInBundle();
    v20 = IMLocalizedStringFromTableInBundle();
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19, v20);
  }
  else {
    v21 = {;
  }
  }

  return v21;
}

@end