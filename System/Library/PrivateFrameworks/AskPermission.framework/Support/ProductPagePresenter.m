@interface ProductPagePresenter
+ (BOOL)presentRequest:(id)a3 withError:(id *)a4;
@end

@implementation ProductPagePresenter

+ (BOOL)presentRequest:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.AskPermissionUI" viewControllerClassName:@"RemoteProductViewController"];
  id v7 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  v8 = [v5 compile];
  [v7 setUserInfo:v8];

  id v9 = +[SBSRemoteAlertHandle newHandleWithDefinition:v6 configurationContext:v7];
  uint64_t v10 = +[APLogConfig sharedDaemonConfig];
  v11 = (void *)v10;
  if (v9)
  {
    if (!v10)
    {
      v11 = +[APLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543618;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2114;
      id v21 = v5;
      id v13 = v19;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Presented request successfully. Request: %{public}@", (uint8_t *)&v18, 0x16u);
    }
    [v9 activateWithContext:0];
    v14 = 0;
    if (a4) {
LABEL_7:
    }
      *a4 = v14;
  }
  else
  {
    if (!v10)
    {
      v11 = +[APLogConfig sharedConfig];
    }
    v16 = [v11 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543618;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2114;
      id v21 = v5;
      id v17 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@: Could not present request. Request: %{public}@", (uint8_t *)&v18, 0x16u);
    }
    v14 = APError();
    if (a4) {
      goto LABEL_7;
    }
  }

  return v14 == 0;
}

@end