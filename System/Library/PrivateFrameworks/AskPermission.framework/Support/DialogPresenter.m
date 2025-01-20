@interface DialogPresenter
+ (void)_presentDialogRequest:(id)a3 completion:(id)a4;
+ (void)presentDialogRequest:(id)a3 completion:(id)a4;
+ (void)presentDialogWithTitle:(id)a3 body:(id)a4 buttons:(id)a5 completion:(id)a6;
+ (void)presentRequest:(id)a3;
@end

@implementation DialogPresenter

+ (void)presentDialogRequest:(id)a3 completion:(id)a4
{
}

+ (void)presentDialogWithTitle:(id)a3 body:(id)a4 buttons:(id)a5 completion:(id)a6
{
  id v19 = a1;
  id v21 = a3;
  id v20 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  if ([v9 count])
  {
    unint64_t v12 = 0;
    do
    {
      v13 = objc_msgSend(v9, "objectAtIndexedSubscript:", v12, v19);
      v14 = +[AMSDialogAction actionWithTitle:v13];
      v15 = +[NSNumber numberWithInt:v12];
      v16 = [v15 stringValue];
      [v14 setIdentifier:v16];

      [v11 addObject:v14];
      ++v12;
    }
    while ((unint64_t)[v9 count] > v12);
  }
  id v17 = [objc_alloc((Class)AMSDialogRequest) initWithTitle:v21 message:v20];
  [v17 setButtonActions:v11];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000E44C;
  v22[3] = &unk_1000388D8;
  id v23 = v10;
  id v18 = v10;
  [v19 presentDialogRequest:v17 completion:v22];
}

+ (void)presentRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 localizations];
  v6 = [v5 title];

  v7 = [v4 localizations];
  v8 = [v7 body];

  id v9 = +[Localizations stringWithKey:@"ACTION_OK"];
  id v19 = v9;
  id v10 = +[NSArray arrayWithObjects:&v19 count:1];
  id v11 = +[APLogConfig sharedDaemonConfig];
  if (!v11)
  {
    id v11 = +[APLogConfig sharedConfig];
  }
  unint64_t v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2114;
    id v18 = v4;
    id v13 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Presenting request. Request: %{public}@", buf, 0x16u);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000E6D0;
  v14[3] = &unk_1000388F8;
  v14[4] = a1;
  [a1 presentDialogWithTitle:v6 body:v8 buttons:v10 completion:v14];
}

+ (void)_presentDialogRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[APLogConfig sharedDaemonConfig];
  if (!v8)
  {
    v8 = +[APLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = (id)objc_opt_class();
    __int16 v19 = 2114;
    id v20 = v6;
    id v10 = v18;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Presenting dialog request. Request: %{public}@", buf, 0x16u);
  }
  id v11 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v6];
  unint64_t v12 = [v11 present];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000E9EC;
  v14[3] = &unk_100038920;
  id v15 = v7;
  id v16 = a1;
  id v13 = v7;
  [v12 addFinishBlock:v14];
}

@end