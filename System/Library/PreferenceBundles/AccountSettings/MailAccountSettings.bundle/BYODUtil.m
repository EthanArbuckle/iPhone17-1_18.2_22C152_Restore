@interface BYODUtil
+ (void)showErrorForPresenter:(id)a3 withError:(id)a4 callback:(id)a5;
@end

@implementation BYODUtil

+ (void)showErrorForPresenter:(id)a3 withError:(id)a4 callback:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v31 = +[NSAssertionHandler currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"BYODUtil.m", 19, @"Invalid parameter not satisfying: %@", @"presenter" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v32 = +[NSAssertionHandler currentHandler];
  [v32 handleFailureInMethod:a2, a1, @"BYODUtil.m", 20, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

LABEL_3:
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"BYOD_GENERIC_ERROR_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  v14 = +[UIAlertController alertControllerWithTitle:0 message:v13 preferredStyle:1];

  v15 = [v10 userInfo];

  if (v15)
  {
    v16 = [v10 userInfo];
    v17 = [v16 objectForKeyedSubscript:@"errorTitle"];

    if (v17)
    {
      v18 = [v10 userInfo];
      v19 = [v18 objectForKeyedSubscript:@"errorTitle"];
      [v14 setTitle:v19];
    }
    v20 = [v10 userInfo];
    v21 = [v20 objectForKeyedSubscript:@"errorDescription"];

    if (v21)
    {
      v22 = [v10 userInfo];
      v23 = [v22 objectForKeyedSubscript:@"errorDescription"];
      [v14 setMessage:v23];
    }
  }
  v24 = +[NSBundle bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_6B158;
  v36[3] = &unk_B8CD0;
  id v26 = v11;
  id v37 = v26;
  v27 = +[UIAlertAction actionWithTitle:v25 style:1 handler:v36];

  [v14 addAction:v27];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_6B170;
  v33[3] = &unk_B9010;
  id v28 = v9;
  id v34 = v28;
  id v29 = v14;
  id v35 = v29;
  v30 = +[EFScheduler mainThreadScheduler];
  [v30 performBlock:v33];
}

@end