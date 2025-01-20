@interface SPUIAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (UIWindow)window;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)applicationWillTerminate:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation SPUIAppDelegate

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5 = a4;
  v6 = [v5 configuration];
  v7 = [v5 persistentIdentifier];

  [v7 hasPrefix:@"searchBar"];
  [v6 setDelegateClass:objc_opt_class()];

  return v6;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = spuiLogHandles[4];
  if (!v7)
  {
    SPUIInitLogging();
    v7 = spuiLogHandles[4];
  }
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  v9 = (void *)spuiLogHandles[4];
  if (!v9)
  {
    SPUIInitLogging();
    v9 = (void *)spuiLogHandles[4];
  }
  v10 = v9;
  v11 = v10;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v8, "searchVCinit", "", buf, 2u);
  }

  id v12 = +[SPUISearchViewControllerHolder sharedInstance];
  v13 = (void *)spuiLogHandles[4];
  if (!v13)
  {
    SPUIInitLogging();
    v13 = (void *)spuiLogHandles[4];
  }
  v14 = v13;
  v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v8, "searchVCinit", " enableTelemetry=YES ", v17, 2u);
  }

  return 1;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)applicationWillTerminate:(id)a3
{
  id v3 = a3;
  v4 = spuiLogHandles[0];
  if (!spuiLogHandles[0])
  {
    SPUIInitLogging();
    v4 = spuiLogHandles[0];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100006548(v4);
  }
  id v5 = +[SPUIFeedbackManager feedbackListener];
  id v6 = [objc_alloc((Class)SFSearchViewDisappearFeedback) initWithEvent:1];
  [v5 searchViewDidDisappear:v6];

  +[SPUIFeedbackManager flushFeedbackWithCompletion:&stru_10000C428];
}

- (void)buildMenuWithBuilder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SPUIAppDelegate;
  id v3 = a3;
  [(SPUIAppDelegate *)&v8 buildMenuWithBuilder:v3];
  v4 = +[SPUISearchViewControllerHolder sharedInstance];
  id v5 = [v4 searchViewController];
  id v6 = +[UIFocusSystem focusSystemForEnvironment:v5];
  v7 = [v6 focusedItem];
  +[SPUIHomeScreenIconUtility addMenusToBuilder:v3 forFocusEnvironment:v7];
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end