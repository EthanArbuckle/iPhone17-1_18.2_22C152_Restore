@interface BiometricsHandler
+ (BOOL)isSupported;
+ (OS_dispatch_queue)storeQueue;
+ (id)retreiveTokenWithAction:(int64_t)a3;
+ (int64_t)_biometryType;
+ (int64_t)state;
+ (void)_presentBiometricsDialogWithCompletion:(id)a3;
+ (void)_removeToken;
+ (void)_retreiveTokenWithAction:(int64_t)a3 completion:(id)a4;
+ (void)_storeToken:(id)a3;
+ (void)removeToken;
+ (void)reset;
+ (void)setState:(int64_t)a3;
+ (void)storeToken:(id)a3;
@end

@implementation BiometricsHandler

+ (int64_t)state
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:@"biometricsState"];

  return (int64_t)v3;
}

+ (OS_dispatch_queue)storeQueue
{
  if (qword_100042AC0 != -1) {
    dispatch_once(&qword_100042AC0, &stru_100038710);
  }
  v2 = (void *)qword_100042AC8;
  return (OS_dispatch_queue *)v2;
}

+ (BOOL)isSupported
{
  id v2 = objc_alloc_init((Class)LAContext);
  id v10 = 0;
  unsigned __int8 v3 = [v2 canEvaluatePolicy:1 error:&v10];
  id v4 = v10;
  if (v4)
  {
    v5 = +[APLogConfig sharedDaemonConfig];
    if (!v5)
    {
      v5 = +[APLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      __int16 v13 = 2114;
      id v14 = v4;
      id v8 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@: Biometrics context error. Error: %{public}@", buf, 0x16u);
    }
  }

  return v3;
}

+ (void)setState:(int64_t)a3
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setInteger:a3 forKey:@"biometricsState"];
}

+ (void)removeToken
{
}

+ (void)reset
{
  [a1 setState:0];
  [a1 removeToken];
}

+ (id)retreiveTokenWithAction:(int64_t)a3
{
  id v5 = objc_alloc_init((Class)AMSMutablePromise);
  if ([a1 isSupported])
  {
    if ([a1 state] == (id)2)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100009CE0;
      v12[3] = &unk_100038738;
      id v13 = v5;
      [a1 _retreiveTokenWithAction:a3 completion:v12];
      v6 = v13;
      goto LABEL_14;
    }
    v7 = +[APLogConfig sharedDaemonConfig];
    if (!v7)
    {
      v7 = +[APLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve token as biometrics are not enabled", buf, 0xCu);
    }
  }
  else
  {
    v7 = +[APLogConfig sharedDaemonConfig];
    if (!v7)
    {
      v7 = +[APLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = (id)objc_opt_class();
      id v9 = v15;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve token as biometrics are not supported", buf, 0xCu);
    }
  }

  v6 = APError();
  [v5 finishWithError:v6];
LABEL_14:

  return v5;
}

+ (void)storeToken:(id)a3
{
  id v4 = a3;
  if (([a1 isSupported] & 1) == 0)
  {
    id v5 = +[APLogConfig sharedDaemonConfig];
    if (!v5)
    {
      id v5 = +[APLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v7 = v13;
    id v8 = "%{public}@: Failed to store token as biometrics are not supported";
    goto LABEL_14;
  }
  if (![a1 state])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100009F04;
    v9[3] = &unk_100038760;
    id v11 = a1;
    id v10 = v4;
    [a1 _presentBiometricsDialogWithCompletion:v9];

    goto LABEL_16;
  }
  if ([a1 state] != (id)2)
  {
    id v5 = +[APLogConfig sharedDaemonConfig];
    if (!v5)
    {
      id v5 = +[APLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v7 = v13;
    id v8 = "%{public}@: Failed to store token as biometrics are not enabled";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);

LABEL_15:
    goto LABEL_16;
  }
  [a1 _storeToken:v4];
LABEL_16:
}

+ (void)_presentBiometricsDialogWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = +[APLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[APLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = (id)objc_opt_class();
    id v7 = v26;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Presenting biometrics dialog", buf, 0xCu);
  }
  id v8 = [a1 _biometryType];
  if (v8 == (id)4)
  {
    CFStringRef v10 = @"AUTHENTICATION_OPTIN_DIALOG_BODY_OPTICID";
    CFStringRef v11 = @"AUTHENTICATION_OPTIN_DIALOG_TITLE_OPTICID";
  }
  else
  {
    id v9 = v8;
    if (v8 == (id)2)
    {
      CFStringRef v10 = @"AUTHENTICATION_OPTIN_DIALOG_BODY_FACEID";
      CFStringRef v11 = @"AUTHENTICATION_OPTIN_DIALOG_TITLE_FACEID";
    }
    else
    {
      if (v8 != (id)1)
      {
        v17 = +[APLogConfig sharedDaemonConfig];
        if (!v17)
        {
          v17 = +[APLogConfig sharedConfig];
        }
        v18 = [v17 OSLogObject];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v26 = v19;
          __int16 v27 = 2048;
          id v28 = v9;
          id v20 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@: Could not present biometrics dialog, unsupported biometry type. Biometry type: %ld", buf, 0x16u);
        }
        id v13 = 0;
        v12 = 0;
        goto LABEL_19;
      }
      CFStringRef v10 = @"AUTHENTICATION_OPTIN_DIALOG_BODY_TOUCHID";
      CFStringRef v11 = @"AUTHENTICATION_OPTIN_DIALOG_TITLE_TOUCHID";
    }
  }
  v12 = +[Localizations stringWithKey:v11];
  id v13 = +[Localizations stringWithKey:v10];
  if (!v13 || !v12)
  {
LABEL_19:
    v4[2](v4, 0);
    goto LABEL_20;
  }
  id v14 = +[Localizations stringWithKey:@"AUTHENTICATION_OPTIN_DIALOG_BUTTON_APPROVE"];
  id v15 = +[Localizations stringWithKey:@"AUTHENTICATION_OPTIN_DIALOG_BUTTON_DECLINE"];
  v24[0] = v15;
  v24[1] = v14;
  v16 = +[NSArray arrayWithObjects:v24 count:2];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000A28C;
  v21[3] = &unk_100038788;
  id v23 = a1;
  v22 = v4;
  +[DialogPresenter presentDialogWithTitle:v12 body:v13 buttons:v16 completion:v21];

LABEL_20:
}

+ (int64_t)_biometryType
{
  id v2 = objc_alloc_init((Class)LAContext);
  id v11 = 0;
  unsigned int v3 = [v2 canEvaluatePolicy:1 error:&v11];
  id v4 = v11;
  id v5 = 0;
  if (v3) {
    id v5 = [v2 biometryType];
  }
  v6 = +[APLogConfig sharedDaemonConfig];
  if (!v6)
  {
    v6 = +[APLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v13 = v8;
    __int16 v14 = 2048;
    id v15 = v5;
    id v9 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Biometry type: %ld", buf, 0x16u);
  }
  return (int64_t)v5;
}

+ (void)_removeToken
{
  unsigned int v3 = +[APLogConfig sharedUIServiceConfig];
  if (!v3)
  {
    unsigned int v3 = +[APLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing biometrics token", (uint8_t *)&v7, 0xCu);
  }
  v6 = [a1 storeQueue];
  dispatch_async(v6, &stru_1000387A8);
}

+ (void)_retreiveTokenWithAction:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  int v7 = +[APLogConfig sharedUIServiceConfig];
  if (!v7)
  {
    int v7 = +[APLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2050;
    int64_t v18 = a3;
    id v9 = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Retreiving biometrics token. Action: %{public}ld", buf, 0x16u);
  }
  CFStringRef v10 = [a1 storeQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000A8E0;
  v12[3] = &unk_1000387D0;
  id v13 = v6;
  int64_t v14 = a3;
  id v11 = v6;
  dispatch_async(v10, v12);
}

+ (void)_storeToken:(id)a3
{
  id v4 = a3;
  id v5 = +[APLogConfig sharedUIServiceConfig];
  if (!v5)
  {
    id v5 = +[APLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2112;
    id v15 = v4;
    id v7 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Storing biometrics token. Token: %@", buf, 0x16u);
  }
  id v8 = [a1 storeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AAE4;
  block[3] = &unk_1000385F0;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, block);
}

@end