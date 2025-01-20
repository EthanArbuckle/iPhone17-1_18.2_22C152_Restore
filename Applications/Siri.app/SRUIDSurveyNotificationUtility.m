@interface SRUIDSurveyNotificationUtility
+ (id)_createNotificationRequest:(id)a3 body:(id)a4 footer:(id)a5 identifier:(id)a6 categoryIdentifier:(id)a7 suppressDefaultAction:(BOOL)a8 expirationDate:(id)a9 userInfo:(id)a10;
+ (id)notificationCenter;
+ (id)notificationRequestWithUserInfo:(id)a3;
+ (void)postSiriInternalUIDSurveyNotification:(unint64_t)a3 activationHistory:(id)a4 requestSource:(int64_t)a5 dismissalReason:(int64_t)a6;
+ (void)setupUserNotificationCenterDelegateIfNeeded:(id)a3;
@end

@implementation SRUIDSurveyNotificationUtility

+ (id)notificationCenter
{
  return +[UNUserNotificationCenter currentNotificationCenter];
}

+ (void)setupUserNotificationCenterDelegateIfNeeded:(id)a3
{
  id v5 = a3;
  if (AFIsInternalInstall())
  {
    v4 = [a1 notificationCenter];
    [v4 setDelegate:v5];
  }
}

+ (id)notificationRequestWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate date];
  v6 = [v5 dateByAddingTimeInterval:120.0];

  v7 = [a1 _createNotificationRequest:@"Did you mean to activate Siri?" body:@"(Internal-Only) Select an option below to provide input about activating Siri." footer:@"Tap here to provide feedback." identifier:@"com.apple.siri.notification.uid-internal-survey" categoryIdentifier:@"SiriUIDSurveyCategory" suppressDefaultAction:1 expirationDate:v6 userInfo:v4];

  return v7;
}

+ (id)_createNotificationRequest:(id)a3 body:(id)a4 footer:(id)a5 identifier:(id)a6 categoryIdentifier:(id)a7 suppressDefaultAction:(BOOL)a8 expirationDate:(id)a9 userInfo:(id)a10
{
  BOOL v10 = a8;
  id v16 = a10;
  id v17 = a9;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = objc_alloc_init((Class)UNMutableNotificationContent);
  [v23 setTitle:v22];

  [v23 setBody:v21];
  [v23 setShouldSuppressDefaultAction:v10];
  [v23 setCategoryIdentifier:v18];

  [v23 setUserInfo:v16];
  [v23 setExpirationDate:v17];

  [v23 setFooter:v20];
  v24 = +[UNNotificationRequest requestWithIdentifier:v19 content:v23 trigger:0];

  return v24;
}

+ (void)postSiriInternalUIDSurveyNotification:(unint64_t)a3 activationHistory:(id)a4 requestSource:(int64_t)a5 dismissalReason:(int64_t)a6
{
  id v9 = a4;
  BOOL v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "+[SRUIDSurveyNotificationUtility postSiriInternalUIDSurveyNotification:activationHistory:requestSource:dismissalReason:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Request is eligible for survey notification", buf, 0xCu);
  }
  v34[0] = @"dismissalReason";
  v11 = SASDismissalReasonGetName();
  v35[0] = v11;
  v34[1] = @"requestSource";
  v12 = +[NSNumber numberWithInteger:a5];
  v35[1] = v12;
  v34[2] = @"deviceHasSideButton";
  v13 = +[NSNumber numberWithBool:SiriUIDeviceHasSideButton()];
  v35[2] = v13;
  v34[3] = @"countOfTotalEvents";
  v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 countOfTotalActivations]);
  v35[3] = v14;
  v34[4] = @"countOfUnintendedEvents";
  v30 = v9;
  v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 countOfUnintendedActivations]);
  v35[4] = v15;
  v34[5] = @"countOfUnintendedEventsSinceLastIntendedEvent";
  id v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 countOfUnintendedActivationsSinceLastIntendedActivation]);
  v35[5] = v16;
  v29 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:6];

  id v17 = [a1 notificationCenter];
  id v18 = [a1 notificationRequestWithUserInfo:v29];
  [v18 setDestinations:a3];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100008154;
  v31[3] = &unk_100142D98;
  id v32 = v18;
  id v28 = v18;
  [v17 addNotificationRequest:v28 withCompletionHandler:v31];
  id v19 = +[UNNotificationAction actionWithIdentifier:@"intendedButton" title:@"Yes, I meant to activate Siri" options:0];
  id v20 = +[UNNotificationAction actionWithIdentifier:@"intendedFileARadarButton" title:@"Yes + File a Radar with Feedback" options:4];
  id v21 = +[UNNotificationAction actionWithIdentifier:@"unintendedButton" title:@"No, I didn't mean to activate Siri" options:0];
  id v22 = +[UNNotificationAction actionWithIdentifier:@"unintendedFileARadarButton" title:@"No + File a Radar with Feedback" options:4];
  id v23 = +[UNNotificationAction actionWithIdentifier:@"turnOffNotification" title:@"Turn off this notification" options:0];
  v24 = +[UNNotificationAction actionWithIdentifier:@"notNow" title:@"Dismiss" options:0];
  v33[0] = v19;
  v33[1] = v20;
  v33[2] = v21;
  v33[3] = v22;
  v33[4] = v23;
  v33[5] = v24;
  v25 = +[NSArray arrayWithObjects:v33 count:6];
  v26 = +[UNNotificationCategory categoryWithIdentifier:@"SiriUIDSurveyCategory" actions:v25 intentIdentifiers:&__NSArray0__struct options:0];
  v27 = +[NSSet setWithObject:v26];
  [v17 setNotificationCategories:v27];
}

@end