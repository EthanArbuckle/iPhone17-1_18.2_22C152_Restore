@interface FLTAppDelegate
+ (BOOL)isFaceTimeApplicationInstalled;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4;
- (BOOL)transferUserActivity:(id)a3;
- (TUFeatureFlags)featureFlags;
- (void)setFeatureFlags:(id)a3;
@end

@implementation FLTAppDelegate

- (TUFeatureFlags)featureFlags
{
  featureFlags = self->_featureFlags;
  if (!featureFlags)
  {
    v4 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    v5 = self->_featureFlags;
    self->_featureFlags = v4;

    featureFlags = self->_featureFlags;
  }

  return featureFlags;
}

+ (BOOL)isFaceTimeApplicationInstalled
{
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  v3 = TUPreferredFaceTimeBundleIdentifier();
  unsigned __int8 v4 = [v2 applicationIsInstalled:v3];

  return v4;
}

- (BOOL)transferUserActivity:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)LSApplicationRecord);
  id v10 = 0;
  id v5 = [v4 initWithBundleIdentifier:TUBundleIdentifierInCallServiceApplication allowPlaceholder:0 error:&v10];
  id v6 = v10;
  if (v5)
  {
    v7 = objc_opt_new();
    v8 = +[LSApplicationWorkspace defaultWorkspace];
    [v8 openUserActivity:v3 usingApplicationRecord:v5 configuration:v7 completionHandler:&stru_100004180];
  }
  else
  {
    v7 = sub_100001E34();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100001F40();
    }
  }

  return v5 != 0;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4 = a4;
  id v5 = sub_100001E34();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Finished launching: %@", (uint8_t *)&v7, 0xCu);
  }

  return 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_100001E34();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "open url %@ with options %@", buf, 0x16u);
  }

  v12 = [(FLTAppDelegate *)self featureFlags];
  if ([v12 ftAppDeletionEnabled])
  {
    unsigned __int8 v13 = [(id)objc_opt_class() isFaceTimeApplicationInstalled];

    if ((v13 & 1) == 0)
    {
      v14 = sub_100001E34();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FaceTime application is not installed - just opening url", buf, 2u);
      }

      [v8 openURL:v9 options:&__NSDictionary0__struct completionHandler:0];
      goto LABEL_17;
    }
  }
  else
  {
  }
  v15 = [v9 scheme];
  unsigned int v16 = [v15 isEqualToString:@"facetime-open-link"];

  if (!v16)
  {
LABEL_17:
    BOOL v24 = 0;
    goto LABEL_18;
  }
  id v17 = [objc_alloc((Class)NSURLComponents) initWithURL:v9 resolvingAgainstBaseURL:0];
  [v17 setScheme:@"incallservice-open-link"];
  v18 = sub_100001E34();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [v17 URL];
    *(_DWORD *)buf = 138412546;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "rewrote the original url: %@ to %@", buf, 0x16u);
  }
  v20 = +[LSApplicationWorkspace defaultWorkspace];
  v21 = [v17 URL];
  id v26 = 0;
  [v20 openSensitiveURL:v21 withOptions:0 error:&v26];
  id v22 = v26;

  if (v22)
  {
    v23 = sub_100001E34();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100002010();
    }
  }
  BOOL v24 = 1;
LABEL_18:

  return v24;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v7 = a3;
  id v8 = (__CFString *)a4;
  id v9 = sub_100001E34();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    CFStringRef v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Continue user activity %@", (uint8_t *)&v27, 0xCu);
  }

  id v10 = [(__CFString *)v8 activityType];
  if ([v10 isEqual:NSUserActivityTypeBrowsingWeb])
  {
    v11 = [(__CFString *)v8 webpageURL];

    if (v11)
    {
      v12 = [(__CFString *)v8 webpageURL];
      unsigned __int8 v13 = [(FLTAppDelegate *)self featureFlags];
      if ([v13 ftAppDeletionEnabled])
      {
        unsigned __int8 v14 = [(id)objc_opt_class() isFaceTimeApplicationInstalled];

        if ((v14 & 1) == 0) {
          goto LABEL_21;
        }
      }
      else
      {
      }
      uint64_t v19 = +[TUConversationLink conversationLinkForURL:v12];
      if (v19)
      {
        v20 = (void *)v19;
        unsigned __int8 v21 = [(FLTAppDelegate *)self transferUserActivity:v8];

        if (v21)
        {
          BOOL v18 = 1;
LABEL_24:

          goto LABEL_25;
        }
      }
      else
      {
        id v22 = sub_100001E34();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100002078();
        }
      }
LABEL_21:
      v23 = sub_100001E34();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138412290;
        CFStringRef v28 = v12;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received user activity with URL %@, but URL was not recognized, diiverting user back to browser", (uint8_t *)&v27, 0xCu);
      }

      [v7 openURL:v12 options:&__NSDictionary0__struct completionHandler:0];
      BOOL v18 = 0;
      goto LABEL_24;
    }
  }
  else
  {
  }
  v15 = [(FLTAppDelegate *)self featureFlags];
  if ([v15 conversationHandoffEnabled])
  {
    unsigned int v16 = [(__CFString *)v8 activityType];
    unsigned int v17 = [v16 isEqualToString:TUUserActivityTypeConversationHandoff];

    if (v17)
    {
      BOOL v18 = [(FLTAppDelegate *)self transferUserActivity:v8];
      goto LABEL_25;
    }
  }
  else
  {
  }
  BOOL v18 = 0;
LABEL_25:
  BOOL v24 = sub_100001E34();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v25 = @"NO";
    if (v18) {
      CFStringRef v25 = @"YES";
    }
    int v27 = 138412290;
    CFStringRef v28 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Link trampoline did continue user activity: %@", (uint8_t *)&v27, 0xCu);
  }

  return v18;
}

- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v4 = a4;
  id v5 = sub_100001E34();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will continue activity %@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (void)setFeatureFlags:(id)a3
{
}

- (void).cxx_destruct
{
}

@end