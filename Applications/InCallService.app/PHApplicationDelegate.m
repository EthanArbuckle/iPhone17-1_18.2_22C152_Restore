@interface PHApplicationDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (CNKFeatures)features;
- (PHApplicationDelegate)init;
- (TUFeatureFlags)featureFlags;
- (UIWindow)window;
- (void)setWindow:(id)a3;
@end

@implementation PHApplicationDelegate

- (PHApplicationDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)PHApplicationDelegate;
  v2 = [(PHApplicationDelegate *)&v8 init];
  if (v2)
  {
    v3 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = v3;

    uint64_t v5 = +[CNKFeatures sharedInstance];
    features = v2->_features;
    v2->_features = (CNKFeatures *)v5;
  }
  return v2;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@, %@", (uint8_t *)&v9, 0x16u);
  }

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1002CF488);
  return 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_1000D5130();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@, %@ %@", (uint8_t *)&v13, 0x20u);
  }

  __int16 v11 = sub_1000D5130();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring unknown URL format.", (uint8_t *)&v13, 2u);
  }

  return 0;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CNKFeatures)features
{
  return self->_features;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_features, 0);

  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end