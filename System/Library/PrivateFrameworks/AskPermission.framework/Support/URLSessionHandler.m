@interface URLSessionHandler
+ (URLSessionHandler)sharedHandler;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
@end

@implementation URLSessionHandler

+ (URLSessionHandler)sharedHandler
{
  if (qword_100042B40 != -1) {
    dispatch_once(&qword_100042B40, &stru_100038CF0);
  }
  v2 = (void *)qword_100042B48;
  return (URLSessionHandler *)v2;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v7 = a5;
  id v8 = a6;
  v9 = +[APLogConfig sharedDaemonConfig];
  if (!v9)
  {
    v9 = +[APLogConfig sharedConfig];
  }
  v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v7;
    id v11 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling dialog request: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  +[DialogPresenter presentDialogRequest:v7 completion:v8];
}

@end