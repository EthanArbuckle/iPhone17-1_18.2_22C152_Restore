@interface UserProvider
+ (NSString)previousLocalApprovalUsername;
+ (id)_authenticateWithUsername:(id)a3 authenticationType:(int64_t)a4;
+ (id)localApprovalUser;
+ (id)primaryiCloudUserWithAction:(int64_t)a3 keychainError:(id *)a4;
+ (void)setPreviousLocalApprovalUsername:(id)a3;
@end

@implementation UserProvider

+ (NSString)previousLocalApprovalUsername
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 stringForKey:@"previousLocalApprovalUsername"];

  return (NSString *)v3;
}

+ (void)setPreviousLocalApprovalUsername:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setObject:v3 forKey:@"previousLocalApprovalUsername"];
}

+ (id)localApprovalUser
{
  id v3 = +[APLogConfig sharedDaemonConfig];
  if (!v3)
  {
    id v3 = +[APLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v5 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Getting local approval user", buf, 0xCu);
  }
  v6 = [a1 previousLocalApprovalUsername];
  v7 = [a1 _authenticateWithUsername:v6 authenticationType:0];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002019C;
  v10[3] = &unk_100038D10;
  v10[4] = a1;
  v8 = [v7 thenWithBlock:v10];

  return v8;
}

+ (id)primaryiCloudUserWithAction:(int64_t)a3 keychainError:(id *)a4
{
  v7 = +[APLogConfig sharedDaemonConfig];
  if (!v7)
  {
    v7 = +[APLogConfig sharedConfig];
  }
  v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v39 = (id)objc_opt_class();
    __int16 v40 = 2050;
    int64_t v41 = a3;
    id v9 = v39;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Getting primary iCloud user. Action: %{public}ld", buf, 0x16u);
  }
  v10 = +[ACAccountStore ams_sharedAccountStore];
  v11 = objc_msgSend(v10, "ams_activeiCloudAccount");
  id v12 = v11;
  if (v11)
  {
    v35 = a4;
    v13 = objc_msgSend(v11, "ams_DSID");
    v14 = [v13 stringValue];

    v15 = [v12 username];
    v16 = +[BiometricsHandler retreiveTokenWithAction:a3];
    id v37 = 0;
    v17 = [v16 resultWithError:&v37];
    id v36 = v37;
    uint64_t v18 = +[APLogConfig sharedDaemonConfig];
    v19 = (void *)v18;
    if (v17)
    {
      if (!v18)
      {
        v19 = +[APLogConfig sharedConfig];
      }
      v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v39 = v21;
        id v22 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrieved active iCloud user with biometrics token.", buf, 0xCu);
      }
      v23 = [[User alloc] initWithDSID:v14 username:v15 password:0 biometricsToken:v17];
      v24 = +[AMSPromise promiseWithResult:v23];

      v25 = v36;
    }
    else
    {
      if (!v18)
      {
        v19 = +[APLogConfig sharedConfig];
      }
      v30 = [v19 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v39 = v31;
        __int16 v40 = 2114;
        int64_t v41 = (int64_t)v36;
        id v34 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retreive biometrics token. Error: %{public}@", buf, 0x16u);
      }
      v25 = v36;
      if (v35) {
        id *v35 = v36;
      }
      if (a3) {
        uint64_t v32 = 2;
      }
      else {
        uint64_t v32 = 1;
      }
      v24 = objc_msgSend(a1, "_authenticateWithUsername:authenticationType:", v15, v32, v34);
    }
  }
  else
  {
    v26 = +[APLogConfig sharedDaemonConfig];
    if (!v26)
    {
      v26 = +[APLogConfig sharedConfig];
    }
    v27 = [v26 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v39 = v28;
      id v29 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}@: No active iCloud account", buf, 0xCu);
    }
    v14 = APError();
    v24 = +[AMSPromise promiseWithError:v14];
  }

  return v24;
}

+ (id)_authenticateWithUsername:(id)a3 authenticationType:(int64_t)a4
{
  id v5 = a3;
  v6 = +[APLogConfig sharedDaemonConfig];
  if (!v6)
  {
    v6 = +[APLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543874;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2050;
    int64_t v17 = a4;
    id v8 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Authenticating user. Username: %@, authentication type: %{public}ld", (uint8_t *)&v12, 0x20u);
  }
  id v9 = objc_alloc_init((Class)AMSMutablePromise);
  v10 = [v9 completionHandlerAdapter];
  +[UserAuthenticator authenticateWithUsername:v5 authenticationType:a4 completion:v10];

  return v9;
}

@end