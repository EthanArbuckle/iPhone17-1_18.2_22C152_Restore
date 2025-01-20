@interface AAPCommandLaunch
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4 executionInfo:(id)a5;
@end

@implementation AAPCommandLaunch

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4 executionInfo:(id)a5
{
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v25 = sub_5D7C;
  v26 = &unk_20750;
  v27 = self;
  id v28 = a3;
  v7 = (FBSOpenApplicationOptions *)[(AAPCommandLaunch *)self launchId];
  id v8 = [a5 turnId];
  v9 = AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[AAPCommandLaunch performWithCompletion:serviceHelper:executionInfo:]";
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)a5;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: ExecutionInfo: %@", buf, 0x16u);
  }
  if (!v7)
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_138A4();
    }
    goto LABEL_22;
  }
  id v10 = [(AAPCommandLaunch *)self executionEnvironment];
  if ([v10 isEqualToString:SAAppsLaunchAppSTARK_EXECUTION_ENVValue])
  {
    v11 = (FBSOpenApplicationService *)+[FBSOpenApplicationService dashboardService];
    v12 = (NSDictionary *)&__NSDictionary0__struct;
  }
  else
  {
    v11 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
    if (AFDeviceSupportsSystemAssistantExperience() && _os_feature_enabled_impl())
    {
      v13 = AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
        sub_13AF4(v13);
      }
      [(AAPCommandLaunch *)self setDoNotDismissSiri:1];
    }
    v37[0] = FBSOpenApplicationOptionKeyUnlockDevice;
    v37[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    v38[0] = &__kCFBooleanTrue;
    v38[1] = &__kCFBooleanTrue;
    v37[2] = SBSOpenApplicationOptionKeyDoNotDismissSiri;
    v38[2] = +[NSNumber numberWithBool:[(AAPCommandLaunch *)self doNotDismissSiri]];
    v12 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
  }
  v14 = +[FBSOpenApplicationOptions optionsWithDictionary:v12];
  v15 = AFSiriLogContextPlugin;
  if (!v11)
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_13940();
    }
LABEL_22:
    id v18 = objc_alloc_init((Class)SACommandFailed);
    v25((uint64_t)v24, (uint64_t)[v18 dictionary]);

    return;
  }
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = objc_opt_class();
    *(_DWORD *)buf = 136315906;
    v30 = "-[AAPCommandLaunch performWithCompletion:serviceHelper:executionInfo:]";
    __int16 v31 = 2114;
    uint64_t v32 = v16;
    __int16 v33 = 2048;
    v34 = self;
    __int16 v35 = 2112;
    v36 = v7;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> processing command for app (%@)", buf, 0x2Au);
  }
  if (v8)
  {
    id v17 = objc_alloc_init((Class)SISchemaUEIUUFRReady);
    objc_msgSend(+[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics"), "logInstrumentation:machAbsoluteTime:turnIdentifier:", v17, mach_absolute_time(), v8);

    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_13A74();
    }
  }
  else
  {
    v19 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_139F0(v19);
    }
  }
  v20 = v11;
  v21 = AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = objc_opt_class();
    *(_DWORD *)buf = 136315906;
    v30 = "-[AAPCommandLaunch performWithCompletion:serviceHelper:executionInfo:]";
    __int16 v31 = 2114;
    uint64_t v32 = v22;
    __int16 v33 = 2048;
    v34 = self;
    __int16 v35 = 2112;
    v36 = v14;
    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: <%{public}@:%p> launchOptions (%@)", buf, 0x2Au);
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_5EF8;
  v23[3] = &unk_20778;
  v23[4] = self;
  v23[5] = v7;
  v23[6] = v11;
  v23[7] = v24;
  [(FBSOpenApplicationService *)v11 openApplication:v7 withOptions:v14 completion:v23];
}

@end