@interface AppDelegate
- (BOOL)_handleUniversalLinkInUserActivity:(id)a3;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (NSHashTable)viewControllers;
- (void)setViewControllers:(id)a3;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = +[NSHashTable weakObjectsHashTable];
  [(AppDelegate *)self setViewControllers:v5];

  return 1;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  return [(AppDelegate *)self _handleUniversalLinkInUserActivity:a4];
}

- (BOOL)_handleUniversalLinkInUserActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 activityType];
  unsigned int v5 = [v4 isEqual:NSUserActivityTypeBrowsingWeb];

  if (v5)
  {
    v6 = [v3 webpageURL];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 cps_fallbackBundleIdentifier];
      BOOL v9 = v8 != 0;
      v10 = sub_1000039A4();
      v11 = v10;
      if (v8)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138739971;
          *(void *)((char *)&buf + 4) = v7;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Received out-of-box app clip URL: %{sensitive}@", (uint8_t *)&buf, 0xCu);
        }
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v21 = 0x3032000000;
        v22 = sub_100003890;
        v23 = sub_1000038A0;
        id v12 = objc_alloc((Class)CPSClipRequest);
        v13 = [v7 _wp_urlByRemovingTrackingInformation];
        id v24 = [v12 initWithURL:v13];

        v14 = [*(id *)(*((void *)&buf + 1) + 40) sessionProxy];
        v15 = [v14 configuration];

        v16 = [v3 _sourceApplication];
        [v15 setReferrerBundleID:v16];

        [v15 setLaunchReason:CPSSessionLaunchReasonInApp];
        v17 = *(void **)(*((void *)&buf + 1) + 40);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000038A8;
        v19[3] = &unk_100008268;
        v19[4] = &buf;
        [v17 requestClipWithCompletion:v19];

        _Block_object_dispose(&buf, 8);
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        sub_100004D2C((uint64_t)v7, v11);
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSHashTable)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end