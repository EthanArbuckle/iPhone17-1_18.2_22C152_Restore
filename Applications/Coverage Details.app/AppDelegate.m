@interface AppDelegate
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)handleUniversalLinkInUserActivity:(id)a3;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  return [(AppDelegate *)self handleUniversalLinkInUserActivity:a4];
}

- (BOOL)handleUniversalLinkInUserActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 activityType];
  unsigned __int8 v5 = [v4 isEqual:NSUserActivityTypeBrowsingWeb];

  if (v5)
  {
    v6 = [v3 webpageURL];
    v7 = _NDOLogSystem();
    v8 = v7;
    if (!v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000021C8(v8, v26, v27, v28, v29, v30, v31, v32);
      }
      BOOL v18 = 0;
      goto LABEL_31;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v59 = "-[AppDelegate handleUniversalLinkInUserActivity:]";
      __int16 v60 = 2112;
      v61 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: found url: %@", buf, 0x16u);
    }

    v9 = [objc_alloc((Class)NSURLComponents) initWithURL:v6 resolvingAgainstBaseURL:1];
    v8 = v9;
    if (!v9)
    {
      v12 = _NDOLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100002240(v12, v33, v34, v35, v36, v37, v38, v39);
      }
      BOOL v18 = 0;
      goto LABEL_30;
    }
    v10 = [v9 path];
    unsigned __int8 v11 = [v10 isEqualToString:@"/launch"];

    if (v11)
    {
      v12 = @"prefs:";
LABEL_8:
      v13 = +[NSURL URLWithString:v12];
      v14 = _NDOLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [v8 path];
        *(_DWORD *)buf = 136446722;
        v59 = "-[AppDelegate handleUniversalLinkInUserActivity:]";
        __int16 v60 = 2112;
        v61 = v13;
        __int16 v62 = 2114;
        v63 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: launching: %@ with path: %{public}@", buf, 0x20u);
      }
      v16 = +[LSApplicationWorkspace defaultWorkspace];
      v56[0] = FBSOpenApplicationOptionKeyUnlockDevice;
      v56[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
      v57[0] = &__kCFBooleanTrue;
      v57[1] = &__kCFBooleanTrue;
      v17 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];
      [v16 openSensitiveURL:v13 withOptions:v17];

      BOOL v18 = 1;
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
    uint64_t v40 = [v6 lastPathComponent];
    if (v40)
    {
      v41 = (void *)v40;
      v42 = [v6 lastPathComponent];
      if ([v42 length])
      {
        v43 = [v6 lastPathComponent];
        unsigned __int8 v44 = [v43 isEqual:@"/"];

        if ((v44 & 1) == 0)
        {
          uint64_t v45 = [v6 lastPathComponent];
          v46 = (void *)v45;
          CFStringRef v47 = &stru_1000041E0;
          if (v45) {
            CFStringRef v47 = (const __CFString *)v45;
          }
          v12 = +[NSString stringWithFormat:@"%@%@", @"prefs:root=General&path=COVERAGE/", v47];

          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    v48 = _NDOLogSystem();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v59 = "-[AppDelegate handleUniversalLinkInUserActivity:]";
      __int16 v60 = 2112;
      v61 = v6;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%{public}s: unable to handle deeplink url: %@", buf, 0x16u);
    }

    v49 = +[UIApplication sharedApplication];
    v54[0] = FBSOpenApplicationOptionKeyUnlockDevice;
    v54[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    v55[0] = &__kCFBooleanTrue;
    v55[1] = &__kCFBooleanTrue;
    v50 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10000204C;
    v52[3] = &unk_100004120;
    v53 = v6;
    [v49 openURL:v53 options:v50 completionHandler:v52];

    BOOL v18 = 0;
    v12 = v53;
    goto LABEL_30;
  }
  v6 = _NDOLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1000022B8(v6, v19, v20, v21, v22, v23, v24, v25);
  }
  BOOL v18 = 0;
LABEL_32:

  return v18;
}

@end