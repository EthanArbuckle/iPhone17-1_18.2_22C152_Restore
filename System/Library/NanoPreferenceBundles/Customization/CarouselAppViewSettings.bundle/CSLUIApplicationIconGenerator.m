@interface CSLUIApplicationIconGenerator
+ (void)_calendarIconImageOnCallbackQueue:(id)a3 completion:(id)a4;
+ (void)iconImageForApplication:(id)a3 callbackQueue:(id)a4 completion:(id)a5;
@end

@implementation CSLUIApplicationIconGenerator

+ (void)iconImageForApplication:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isEqualToString:kCalendarBundleIdentifier])
  {
    [a1 _calendarIconImageOnCallbackQueue:v9 completion:v10];
  }
  else
  {
    id v11 = [objc_alloc((Class)ISIcon) initWithBundleIdentifier:v8];
    +[CSLUIIconView centerIconDiameter];
    double v13 = v12;
    v14 = +[UIScreen mainScreen];
    [v14 scale];
    double v16 = v15;

    id v17 = objc_msgSend(objc_alloc((Class)ISImageDescriptor), "initWithSize:scale:", v13, v13, v16);
    [v17 setShape:2];
    v18 = cslprf_icon_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v8;
      __int16 v26 = 2048;
      double v27 = v13;
      _os_log_impl(&def_1AB14, v18, OS_LOG_TYPE_DEFAULT, "iconImageForApplication fetching icon using Icon Services getCGImageForImageDescriptor bundleID=%@ size=%lf", buf, 0x16u);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_30AC;
    v19[3] = &unk_3C948;
    double v23 = v16;
    id v20 = v8;
    id v21 = v9;
    id v22 = v10;
    [v11 getCGImageForImageDescriptor:v17 completion:v19];
  }
}

+ (void)_calendarIconImageOnCallbackQueue:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_46D50 != -1) {
    dispatch_once(&qword_46D50, &stru_3C968);
  }
  v7 = qword_46D48;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_3358;
  v10[3] = &unk_3C990;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

@end