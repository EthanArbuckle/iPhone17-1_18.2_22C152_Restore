@interface CellularPlanUserNotificationDelegate
- (void)publishUserNotificationWithBundleIdentifier:(id)a3 requestIdentifier:(id)a4 title:(id)a5 body:(id)a6 actionUrl:(id)a7 destinations:(unint64_t)a8;
- (void)publishUserNotificationWithBundleIdentifier:(id)a3 title:(id)a4 body:(id)a5 csn:(id)a6;
- (void)removeNotificationWithBundleIdentifier:(id)a3 requestIdentifier:(id)a4;
@end

@implementation CellularPlanUserNotificationDelegate

- (void)publishUserNotificationWithBundleIdentifier:(id)a3 title:(id)a4 body:(id)a5 csn:(id)a6
{
  id v21 = a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = objc_opt_new();
  v13 = +[NSString localizedUserNotificationStringForKey:v21 arguments:0];
  [v12 setTitle:v13];

  v14 = +[NSString localizedUserNotificationStringForKey:v10 arguments:0];

  [v12 setBody:v14];
  v15 = +[UNNotificationSound defaultSound];
  [v12 setSound:v15];

  [v12 setInterruptionLevel:2];
  v16 = +[NSMutableString stringWithString:@"bridge:root=CELLULAR_ID"];
  if (v9)
  {
    v17 = +[NSString stringWithFormat:@"&csn=%@", v9];
    [v16 appendString:v17];
  }
  v18 = +[NSURL URLWithString:v16];
  [v12 setDefaultActionURL:v18];

  v19 = +[UNNotificationRequest requestWithIdentifier:v21 content:v12 trigger:0];
  id v20 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:v11];

  [v20 addNotificationRequest:v19 withCompletionHandler:0];
}

- (void)publishUserNotificationWithBundleIdentifier:(id)a3 requestIdentifier:(id)a4 title:(id)a5 body:(id)a6 actionUrl:(id)a7 destinations:(unint64_t)a8
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v24 = (id)objc_opt_new();
  v18 = +[NSString localizedUserNotificationStringForKey:v15 arguments:0];

  [v24 setTitle:v18];
  v19 = +[NSString localizedUserNotificationStringForKey:v14 arguments:0];

  [v24 setBody:v19];
  id v20 = +[UNNotificationSound defaultSound];
  [v24 setSound:v20];

  id v21 = +[NSURL URLWithString:v13];

  [v24 setDefaultActionURL:v21];
  v22 = +[UNNotificationRequest requestWithIdentifier:v16 content:v24 trigger:0 destinations:a8];

  id v23 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:v17];
  [v23 addNotificationRequest:v22 withCompletionHandler:0];
}

- (void)removeNotificationWithBundleIdentifier:(id)a3 requestIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:v6];

  id v11 = v5;
  v8 = +[NSArray arrayWithObjects:&v11 count:1];
  [v7 removePendingNotificationRequestsWithIdentifiers:v8];

  id v10 = v5;
  id v9 = +[NSArray arrayWithObjects:&v10 count:1];

  [v7 removeDeliveredNotificationsWithIdentifiers:v9];
}

@end