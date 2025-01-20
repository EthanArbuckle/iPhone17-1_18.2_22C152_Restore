@interface BLNotificationManager
+ (BLNotificationManager)sharedInstance;
- (BLNotificationManager)init;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation BLNotificationManager

- (BLNotificationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)BLNotificationManager;
  v2 = [(BLNotificationManager *)&v10 init];
  if (v2)
  {
    v3 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.iBooks"];
    center = v2->_center;
    v2->_center = v3;

    v5 = +[UNNotificationCategory categoryWithIdentifier:@"books-notification-extension" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:1];
    v6 = v2->_center;
    v11 = v5;
    v7 = +[NSArray arrayWithObjects:&v11 count:1];
    v8 = +[NSSet setWithArray:v7];
    [(UNUserNotificationCenter *)v6 setNotificationCategories:v8];

    [(UNUserNotificationCenter *)v2->_center setDelegate:v2];
    [(UNUserNotificationCenter *)v2->_center setPrivateDelegate:v2];
    [(UNUserNotificationCenter *)v2->_center setWantsNotificationResponsesDelivered];
  }
  return v2;
}

+ (BLNotificationManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AEA0;
  block[3] = &unk_1001A11C8;
  block[4] = a1;
  if (qword_1001C8100 != -1) {
    dispatch_once(&qword_1001C8100, block);
  }
  v2 = (void *)qword_1001C80F8;

  return (BLNotificationManager *)v2;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  if (+[AMSUserNotification shouldHandleNotificationResponse:v6])
  {
    v8 = +[BUBag defaultBag];
    v9 = +[AMSUserNotification handleNotificationResponse:v6 bag:v8];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000AFF0;
    v11[3] = &unk_1001A11F0;
    id v12 = v7;
    [v9 addFinishBlock:v11];
  }
  else
  {
    id v10 = objc_retainBlock(v7);
    v9 = v10;
    if (v10) {
      (*((void (**)(id))v10 + 2))(v10);
    }
  }
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = +[BUBag defaultBag];
  id v7 = +[AMSUserNotification notificationCenter:v8 didChangeSettings:v5 bag:v6];
}

- (void).cxx_destruct
{
}

@end