@interface UserNotificationManager
- (UserNotificationManager)init;
- (void)_handleWatchAuthenticationMessage:(id)a3 fromDevice:(id)a4;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation UserNotificationManager

- (UserNotificationManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)UserNotificationManager;
  v2 = [(UserNotificationManager *)&v11 init];
  if (v2)
  {
    v3 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.AppStore"];
    center = v2->_center;
    v2->_center = v3;

    v5 = +[UNNotificationCategory categoryWithIdentifier:@"asd-notification-default" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:1];
    v6 = v2->_center;
    v12 = v5;
    v7 = +[NSArray arrayWithObjects:&v12 count:1];
    v8 = +[NSSet setWithArray:v7];
    [(UNUserNotificationCenter *)v6 setNotificationCategories:v8];

    [(UNUserNotificationCenter *)v2->_center setDelegate:v2];
    [(UNUserNotificationCenter *)v2->_center setPrivateDelegate:v2];
    [(UNUserNotificationCenter *)v2->_center setWantsNotificationResponsesDelivered];
    v9 = sub_1003177EC();
    sub_100317B58((uint64_t)v9, v2, (uint64_t)"_handleWatchAuthenticationMessage:fromDevice:", 7);
  }
  return v2;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  v6 = (void (**)(void))a5;
  id v7 = a4;
  if (+[AMSUserNotification shouldHandleNotificationResponse:v7])
  {
    v8 = sub_10030B11C();
    v9 = +[AMSUserNotification handleNotificationResponse:v7 bag:v8];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1004069EC;
    v12[3] = &unk_1005230F0;
    v13 = v6;
    [v9 addFinishBlock:v12];
  }
  else
  {
    v10 = [v7 notification];
    objc_super v11 = [v10 request];
    v9 = sub_10032ECA0((uint64_t)Bulletin, v11);

    sub_10032F024((uint64_t)v9, v7);
    v6[2](v6);
  }
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = (id)objc_opt_class();
    id v8 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Settings did change", (uint8_t *)&v11, 0xCu);
  }
  v9 = sub_10030B11C();
  id v10 = +[AMSUserNotification notificationCenter:v5 didChangeSettings:v6 bag:v9];
}

- (void)_handleWatchAuthenticationMessage:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9 = [XDCPingMessage alloc];
  if (v6) {
    id Property = objc_getProperty(v6, v8, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v11 = Property;
  id v12 = [(XDCPingMessage *)v9 initWithData:v11];

  v13 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_opt_class();
    id v15 = v14;
    if (v12) {
      uuid = v12->_uuid;
    }
    else {
      uuid = 0;
    }
    v17 = uuid;
    int v32 = 138543874;
    v33 = v14;
    __int16 v34 = 2114;
    v35 = v17;
    __int16 v36 = 2114;
    id v37 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]: [%{public}@] Received request to show auth notification from %{public}@", (uint8_t *)&v32, 0x20u);
  }
  v18 = objc_alloc_init(XDCPingMessage);
  if (v12) {
    v19 = v12->_uuid;
  }
  else {
    v19 = 0;
  }
  v20 = v19;
  sub_1002974E0((uint64_t)v18, v20);

  v21 = sub_10036927C((uint64_t)v6, v18, 7);
  uint64_t v22 = sub_1003177EC();
  v23 = (void *)v22;
  if (v22) {
    sub_100317CB4(v22, v21, v7, 0, 0);
  }

  v24 = ASDLocalizedString();
  v25 = ASDLocalizedString();
  v26 = sub_10032EF98((uint64_t)Bulletin, v24, v25);

  if (v26) {
    objc_setProperty_nonatomic_copy(v26, v27, @"com.apple.Bridge", 72);
  }
  v28 = +[NSURL URLWithString:@"bridge:root=com.apple.BridgeAppStoreDaemonSettings"];
  v30 = v28;
  if (v26)
  {
    objc_setProperty_nonatomic_copy(v26, v29, v28, 24);

    objc_setProperty_nonatomic_copy(v26, v31, @"com.apple.appstored.authenticate.watch", 56);
  }
  else
  {
  }
  sub_100406680(self, v26);
}

- (void).cxx_destruct
{
}

@end