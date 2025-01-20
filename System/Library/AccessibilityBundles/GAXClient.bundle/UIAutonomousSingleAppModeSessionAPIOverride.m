@interface UIAutonomousSingleAppModeSessionAPIOverride
+ (Class)safeCategoryBaseClass;
+ (id)__gaxTrampoline_currentlyActiveSession;
+ (id)safeCategoryTargetClassName;
+ (void)__gaxTrampoline_requestSessionWithConfiguration:(id)a3 completion:(id)a4;
+ (void)_gaxClientLoaded:(id)a3;
+ (void)_gaxStatusDidChange:(id)a3;
+ (void)initialize;
- (void)__gaxTrampoline_endSessionWithCompletion:(id)a3;
@end

@implementation UIAutonomousSingleAppModeSessionAPIOverride

+ (id)safeCategoryTargetClassName
{
  return @"UIAutonomousSingleAppModeSession";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:a1 selector:"_gaxClientLoaded:" name:@"GAXClientLoadedNotification" object:0];

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:a1 selector:"_gaxStatusDidChange:" name:UIAccessibilityGuidedAccessStatusDidChangeNotification object:0];
  }
}

+ (void)_gaxClientLoaded:(id)a3
{
  if (UIAccessibilityIsGuidedAccessEnabled())
  {
    v3 = GAXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "GAX is active. fetching configuration.", v5, 2u);
    }

    id v4 = +[GAXClient sharedInstance];
    [v4 fetchASAMConfigurationWithCompletion:&stru_14AD8];
  }
}

+ (void)_gaxStatusDidChange:(id)a3
{
  BOOL IsGuidedAccessEnabled = UIAccessibilityIsGuidedAccessEnabled();
  id v4 = GAXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = IsGuidedAccessEnabled;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "got GAX status change notification. on: %d", (uint8_t *)v15, 8u);
  }

  v5 = GAXLogCommon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (!IsGuidedAccessEnabled)
  {
    if (v6) {
      sub_B614(v5);
    }

    v14 = (void *)currentlyActiveSession;
    currentlyActiveSession = 0;
    goto LABEL_11;
  }
  if (v6) {
    sub_B59C(v5, v7, v8, v9, v10, v11, v12, v13);
  }

  if (!currentlyActiveSession)
  {
    v14 = +[GAXClient sharedInstance];
    [v14 fetchASAMConfigurationWithCompletion:&stru_14AF8];
LABEL_11:
  }
}

+ (id)__gaxTrampoline_currentlyActiveSession
{
  return (id)currentlyActiveSession;
}

+ (void)__gaxTrampoline_requestSessionWithConfiguration:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = GAXLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = [v5 style];
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v6 != 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Request session with style: %lu (has completion: %i)", buf, 0x12u);
  }

  id v8 = [v5 copy];
  uint64_t v9 = +[AXBackBoardServer server];
  id v10 = v8;
  v25[0] = &off_17D00;
  id v11 = [v10 style];
  if ((unint64_t)v11 >= 4)
  {
    uint64_t v12 = GAXLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_B318((int)v11, v12);
    }

    id v11 = &dword_0 + 2;
  }
  uint64_t v13 = +[NSNumber numberWithInteger:v11];
  *(void *)buf = v13;
  v25[1] = &off_17D18;
  v14 = GAXProfileOverridesFromConfiguration(v10);
  *(void *)&buf[8] = v14;
  v15 = +[NSDictionary dictionaryWithObjects:buf forKeys:v25 count:2];

  v16 = [v10 managedConfigurationSettings];

  if (v16)
  {
    id v17 = [v15 mutableCopy];
    v18 = [v10 managedConfigurationSettings];
    [v17 setObject:v18 forKeyedSubscript:&off_17D30];

    v15 = v17;
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_63FC;
  v21[3] = &unk_14B48;
  id v22 = v10;
  id v23 = v6;
  id v19 = v6;
  id v20 = v10;
  [v9 requestGuidedAccessSessionStartWithConfigurationDictionary:v15 completion:v21];
}

- (void)__gaxTrampoline_endSessionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = GAXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(UIAutonomousSingleAppModeSessionAPIOverride *)v5 effectiveConfiguration];
    *(_DWORD *)buf = 134218240;
    id v20 = (UIAutonomousSingleAppModeSessionAPIOverride *)[v7 style];
    __int16 v21 = 1024;
    BOOL v22 = v4 != 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "End session with style: %lu (has completion: %i)", buf, 0x12u);
  }
  if ((UIAutonomousSingleAppModeSessionAPIOverride *)currentlyActiveSession == v5)
  {
    uint64_t v13 = +[AXBackBoardServer server];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_6A30;
    v14[3] = &unk_14B48;
    v14[4] = v5;
    id v15 = v4;
    [v13 requestGuidedAccessSessionEndWithCompletion:v14];

    uint64_t v12 = v15;
LABEL_9:

    goto LABEL_10;
  }
  if (v4)
  {
    id v8 = GAXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = [(UIAutonomousSingleAppModeSessionAPIOverride *)v5 isActive];
      uint64_t v10 = currentlyActiveSession;
      unsigned int v11 = [(id)currentlyActiveSession isActive];
      *(_DWORD *)buf = 138413058;
      id v20 = v5;
      __int16 v21 = 1024;
      BOOL v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v10;
      __int16 v25 = 1024;
      unsigned int v26 = v11;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Session(self) does not match cached currently active session\nSession:%@\nDoes it think it's active?:%d\nCached currently active session:%@\nDoes it think it's active?:%d", buf, 0x22u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_68F0;
    block[3] = &unk_14B70;
    uint64_t v18 = 1;
    id v17 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    uint64_t v12 = v17;
    goto LABEL_9;
  }
LABEL_10:
}

@end