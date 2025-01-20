@interface UserAuthenticator
+ (void)authenticateWithUsername:(id)a3 authenticationType:(int64_t)a4 completion:(id)a5;
@end

@implementation UserAuthenticator

+ (void)authenticateWithUsername:(id)a3 authenticationType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[APLogConfig sharedDaemonConfig];
  if (!v10)
  {
    v10 = +[APLogConfig sharedConfig];
  }
  v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v25 = (id)objc_opt_class();
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2050;
    int64_t v29 = a4;
    id v12 = v25;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Authenticating user. Username: %@, authenticationType: %{public}ld.", buf, 0x20u);
  }
  id v13 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  [v13 setAuthenticationType:2];
  [v13 setIsEphemeral:1];
  [v13 _setProxyingForApp:1];
  [v13 setIsUsernameEditable:a4 == 0];
  [v13 setServiceType:1];
  [v13 setShouldAllowAppleIDCreation:0];
  [v13 setUsername:v8];
  if (a4 == 2)
  {
    CFStringRef v16 = @"AUTHENTICATION_PROMPT_TITLE_DECLINE_REMOTE";
LABEL_11:
    v14 = +[Localizations stringWithKey:v16];
    CFStringRef v15 = @"AUTHENTICATION_PROMPT_BODY_REMOTE";
    goto LABEL_12;
  }
  if (a4 == 1)
  {
    CFStringRef v16 = @"AUTHENTICATION_PROMPT_TITLE_APPROVE_REMOTE";
    goto LABEL_11;
  }
  if (a4)
  {
    v18 = 0;
    v14 = 0;
    goto LABEL_17;
  }
  v14 = +[Localizations stringWithKey:@"AUTHENTICATION_PROMPT_TITLE_APPROVE_LOCAL"];
  CFStringRef v15 = @"AUTHENTICATION_PROMPT_BODY_LOCAL";
LABEL_12:
  v17 = +[Localizations stringWithKey:v15];
  if (v17)
  {
    v18 = +[NSString stringWithValidatedFormat:v17, @"%@", 0, v8 validFormatSpecifiers error];
  }
  else
  {
    v18 = 0;
  }

LABEL_17:
  [v13 set_passwordPromptTitle:v14];
  [v13 setReason:v18];
  id v19 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000F5AC;
  v21[3] = &unk_100018720;
  id v22 = v9;
  id v23 = a1;
  id v20 = v9;
  [v19 authenticateWithContext:v13 completion:v21];
}

@end