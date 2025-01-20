@interface AlertControllerFactory
+ (id)_actionForErrorType:(int64_t)a3 completion:(id)a4;
+ (id)_messageForErrorType:(int64_t)a3;
+ (id)_titleForErrorType:(int64_t)a3;
+ (id)alertControllerWithBiometryType:(int64_t)a3 forCarrier:(id)a4 completion:(id)a5;
+ (id)alertControllerWithError:(int64_t)a3 completion:(id)a4;
@end

@implementation AlertControllerFactory

+ (id)_actionForErrorType:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  if ((unint64_t)(a3 - 1) > 1)
  {
    v8 = 0;
  }
  else
  {
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"OK" value:&stru_10000C9B8 table:@"Localizable"];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100002AA0;
    v10[3] = &unk_10000C378;
    id v11 = v5;
    v8 = +[UIAlertAction actionWithTitle:v7 style:0 handler:v10];
  }

  return v8;
}

+ (id)_messageForErrorType:(int64_t)a3
{
  if (a3 == 2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = v3;
    CFStringRef v5 = @"USER_AUTHENTICATION_FAILURE_MESSAGE";
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = v3;
    CFStringRef v5 = @"CONNECTION_LOST_MESSAGE";
LABEL_5:
    v6 = [v3 localizedStringForKey:v5 value:&stru_10000C9B8 table:@"Localizable"];

    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)_titleForErrorType:(int64_t)a3
{
  if (a3 == 2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = v3;
    CFStringRef v5 = @"AUTHENTICATION_FAILURE_TITLE";
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = v3;
    CFStringRef v5 = @"CONNECTION_FAILURE_TITLE";
LABEL_5:
    v6 = [v3 localizedStringForKey:v5 value:&stru_10000C9B8 table:@"Localizable"];

    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (id)alertControllerWithError:(int64_t)a3 completion:(id)a4
{
  v6 = [a1 _actionForErrorType:a3 completion:a4];
  if (v6)
  {
    v7 = [a1 _messageForErrorType:a3];
    v8 = [a1 _titleForErrorType:a3];
    v9 = +[UIAlertController alertControllerWithTitle:v8 message:v7 preferredStyle:1];
    [v9 addAction:v6];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)alertControllerWithBiometryType:(int64_t)a3 forCarrier:(id)a4 completion:(id)a5
{
  id v31 = a5;
  id v7 = a4;
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"USE_TOUCH_ID" value:&stru_10000C9B8 table:@"Localizable"];

  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"ENABLE_TOUCH_ID" value:&stru_10000C9B8 table:@"Localizable"];

  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"TOUCH_ID_LOGIN_ENABLE_MESSAGE" value:&stru_10000C9B8 table:@"Localizable"];

  if (a3 == 2)
  {
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 localizedStringForKey:@"USE_FACE_ID" value:&stru_10000C9B8 table:@"Localizable"];

    v16 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v17 = [v16 localizedStringForKey:@"ENABLE_FACE_ID" value:&stru_10000C9B8 table:@"Localizable"];

    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v19 = [v18 localizedStringForKey:@"FACE_ID_LOGIN_ENABLE_MESSAGE" value:&stru_10000C9B8 table:@"Localizable"];

    v13 = (void *)v19;
    id v11 = (void *)v17;
    v9 = (void *)v15;
  }
  v30 = v13;
  v20 = [v11 stringByReplacingOccurrencesOfString:@"%@" withString:v7];
  v21 = [v13 stringByReplacingOccurrencesOfString:@"%@" withString:v7];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000310C;
  v34[3] = &unk_10000C378;
  id v22 = v31;
  id v35 = v22;
  v23 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v34];
  v24 = +[NSBundle bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"NOT_NOW" value:&stru_10000C9B8 table:@"Localizable"];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100003120;
  v32[3] = &unk_10000C378;
  id v33 = v22;
  id v26 = v22;
  v27 = +[UIAlertAction actionWithTitle:v25 style:0 handler:v32];

  v28 = +[UIAlertController alertControllerWithTitle:v20 message:v21 preferredStyle:1];
  [v28 addAction:v27];
  [v28 addAction:v23];

  return v28;
}

@end