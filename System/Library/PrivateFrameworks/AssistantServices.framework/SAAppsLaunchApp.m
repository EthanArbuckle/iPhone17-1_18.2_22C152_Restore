@interface SAAppsLaunchApp
- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4;
@end

@implementation SAAppsLaunchApp

- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [off_1005814E8() serviceWithDefaultShellEndpoint];
  if (v8)
  {
    v9 = [v6 _turnId];
    if (v9)
    {
      id v10 = objc_alloc_init((Class)SISchemaUEIUUFRReady);
      v11 = +[AFAnalytics sharedAnalytics];
      [v11 logInstrumentation:v10 machAbsoluteTime:mach_absolute_time() turnIdentifier:v9];

      v12 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[SAAppsLaunchApp(ADSiriAppLaunchRequestHandler) _ad_handleAppLaunchCommandWithRequest:completion:]";
        __int16 v21 = 2112;
        v22 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Logging UUFR ready for app launch with turnid: %@", buf, 0x16u);
      }
    }
    else
    {
      v13 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[SAAppsLaunchApp(ADSiriAppLaunchRequestHandler) _ad_handleAppLaunchCommandWithRequest:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Failed to find turnId for app launch UUFR", buf, 0xCu);
      }
    }
    v14 = [(SAAppsLaunchApp *)self launchId];
    v15 = [off_1005814F0() optionsWithDictionary:&__NSDictionary0__struct];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10012DB90;
    v16[3] = &unk_100502EF0;
    id v18 = v7;
    id v17 = v6;
    [v8 openApplication:v14 withOptions:v15 completion:v16];

    goto LABEL_11;
  }
  if (v7)
  {
    v9 = +[AFError errorWithCode:13];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v9);
LABEL_11:
  }
}

@end