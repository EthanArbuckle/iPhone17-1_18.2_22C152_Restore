@interface CBSceneManager
+ (double)windowLevel:(unint64_t)a3;
+ (id)rootViewController:(unint64_t)a3;
+ (id)sceneIdentifier:(unint64_t)a3;
+ (id)sharedInstance;
- (CBSceneManager)init;
- (NSMutableDictionary)windowDict;
- (UIEdgeInsets)_additionalSafeAreaInsets;
- (id)_rootStatusBarViewController;
- (id)presentViewController:(id)a3 completion:(id)a4;
- (void)_removeAllScenes;
- (void)_showSceneStatusBar:(BOOL)a3;
- (void)addScene:(unint64_t)a3;
- (void)hideSceneStatusBar;
- (void)setWindowDict:(id)a3;
- (void)showSceneStatusBar;
- (void)statusBarStyle:(int64_t)a3;
@end

@implementation CBSceneManager

+ (id)sharedInstance
{
  if (qword_10008FEA8 != -1) {
    dispatch_once(&qword_10008FEA8, &stru_10007A2C0);
  }
  v2 = (void *)qword_10008FEA0;

  return v2;
}

- (CBSceneManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)CBSceneManager;
  v2 = [(CBSceneManager *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    windowDict = v2->_windowDict;
    v2->_windowDict = v3;

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_removeAllScenes" name:@"AppManagerPrimaryAppDidExit" object:0];
  }
  return v2;
}

- (void)addScene:(unint64_t)a3
{
  v5 = +[CBSceneManager sceneIdentifier:](CBSceneManager, "sceneIdentifier:");
  v6 = [(CBSceneManager *)self windowDict];
  objc_super v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    v8 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CBSceneManager: %@ already exists", buf, 0xCu);
    }
  }
  else
  {
    +[CBSceneManager windowLevel:a3];
    uint64_t v10 = v9;
    v8 = +[CBSceneManager rootViewController:a3];
    v11 = +[FBSMutableSceneDefinition definition];
    v12 = +[FBSSceneIdentity identityForIdentifier:v5];
    [v11 setIdentity:v12];

    v13 = +[FBSSceneClientIdentity localIdentity];
    [v11 setClientIdentity:v13];

    v14 = +[UIWindowSceneSpecification specification];
    [v11 setSpecification:v14];

    v15 = [v11 specification];
    v16 = +[FBSMutableSceneParameters parametersForSpecification:v15];

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10002D364;
    v37[3] = &unk_100079BF8;
    v37[4] = v10;
    [v16 updateSettingsWithBlock:v37];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10002D42C;
    v35[3] = &unk_10007A2E8;
    id v17 = v16;
    id v36 = v17;
    [v17 updateClientSettingsWithBlock:v35];
    v18 = +[FBSceneManager sharedInstance];
    v19 = [v18 createSceneWithDefinition:v11 initialParameters:v17];

    v20 = +[FBLocalSynchronousSceneClientProvider sharedInstance];
    v34 = v19;
    v21 = [v19 identifier];
    v22 = [v20 fbsSceneWithIdentifier:v21];

    v23 = +[FBLocalSynchronousSceneClientProvider sharedInstance];
    v24 = [v22 identifier];
    v25 = [v23 fbsSceneWithIdentifier:v24];
    v26 = +[UIWindowScene _sceneForFBSScene:v25];

    v27 = [CBSceneWindow alloc];
    v28 = +[UIScreen mainScreen];
    [v28 _referenceBounds];
    id v29 = -[CBSceneWindow _initWithFrame:debugName:scene:attached:](v27, "_initWithFrame:debugName:scene:attached:", v5, v22, 1);

    [v29 setWindowScene:v26];
    [v29 setHidden:0];
    [v29 setLevel:1.0];
    v30 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Creating CBRecordingIndicatorManager for scene status bar", buf, 2u);
    }

    v31 = [[CBRecordingIndicatorManager alloc] initWithWindowScene:v26];
    [v29 setRecordingIndicatorManager:v31];
    [v29 setRootViewController:v8];
    v32 = [(CBSceneManager *)self windowDict];
    [v32 setObject:v29 forKeyedSubscript:v5];

    v33 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v5;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "CBSceneManager: created scene %@", buf, 0xCu);
    }
  }
}

- (id)presentViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CBSceneManager: presenting %@", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v9 = +[CBSceneManager sceneIdentifier:0];
  uint64_t v10 = [(CBSceneManager *)self windowDict];
  v11 = [v10 objectForKeyedSubscript:v9];

  if (!v11) {
    [(CBSceneManager *)self addScene:0];
  }
  [v6 setModalPresentationStyle:0];
  [(CBSceneManager *)self _additionalSafeAreaInsets];
  [v6 setAdditionalSafeAreaInsets:];
  v12 = [(CBSceneManager *)self windowDict];
  v13 = [v12 objectForKeyedSubscript:v9];

  [v13 presentViewController:v6 animated:1 completion:v7];

  return v13;
}

- (void)statusBarStyle:(int64_t)a3
{
  v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    int64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CBSceneManager: statusBarStyle %li", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(CBSceneManager *)self _rootStatusBarViewController];
  id v7 = v6;
  if (v6) {
    [v6 statusBarStyle:a3];
  }
}

- (void)showSceneStatusBar
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CBSceneManager: showSceneStatusBar", v4, 2u);
  }

  [(CBSceneManager *)self _showSceneStatusBar:1];
}

- (void)hideSceneStatusBar
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CBSceneManager: hideSceneStatusBar", v4, 2u);
  }

  [(CBSceneManager *)self _showSceneStatusBar:0];
}

- (void)_showSceneStatusBar:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(CBSceneManager *)self _rootStatusBarViewController];
  if (v4)
  {
    id v5 = v4;
    if (v3) {
      [v4 showStatusBar];
    }
    else {
      [v4 hideStatusBar];
    }
    v4 = v5;
  }
}

- (id)_rootStatusBarViewController
{
  BOOL v3 = +[CBSceneManager sceneIdentifier:2];
  v4 = [(CBSceneManager *)self windowDict];
  id v5 = [v4 objectForKeyedSubscript:v3];

  id v6 = [v5 rootViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v8 = [v5 rootViewController];
  }
  else
  {
    int64_t v9 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CBSceneManager: CBRootStatusBarViewController is nil", v11, 2u);
    }

    int v8 = 0;
  }

  return v8;
}

- (void)_removeAllScenes
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CBSceneManager: _removeAllScenes", buf, 2u);
  }

  v4 = [(CBSceneManager *)self windowDict];
  id v5 = [v4 copy];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DAA0;
  block[3] = &unk_1000794E0;
  id v9 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  id v7 = [(CBSceneManager *)self windowDict];
  [v7 removeAllObjects];
}

+ (id)sceneIdentifier:(unint64_t)a3
{
  if (a3 == 2)
  {
    BOOL v3 = @"checkerboard-diagnostics-statusbar";
  }
  else if (a3 == 1)
  {
    v4 = +[FBSceneManager keyboardScene];
    BOOL v3 = [v4 identifier];
  }
  else if (a3)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = @"checkerboard-diagnostics-viewcontroller";
  }

  return v3;
}

+ (double)windowLevel:(unint64_t)a3
{
  double result = UIWindowLevelStatusBar;
  if (!a3) {
    double result = UIWindowLevelStatusBar + 1.0;
  }
  if (a3 == 1) {
    double result = UIWindowLevelStatusBar + 2.0;
  }
  if (a3 == 2) {
    return UIWindowLevelStatusBar + 3.0;
  }
  return result;
}

+ (id)rootViewController:(unint64_t)a3
{
  if (!a3)
  {
    v4 = &off_100078D10;
LABEL_5:
    id v5 = objc_alloc_init(*v4);
    return v5;
  }
  if (a3 == 2)
  {
    v4 = &off_100078CF0;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (UIEdgeInsets)_additionalSafeAreaInsets
{
  v2 = +[UIScreen mainScreen];
  [v2 _peripheryInsets];
  double v4 = v3;

  id v5 = +[UIApplication sharedApplication];
  id v6 = [v5 windows];
  id v7 = [v6 firstObject];
  int v8 = [v7 windowScene];
  id v9 = [v8 statusBarManager];
  [v9 statusBarFrame];
  double v11 = v10;

  double v12 = 0.0;
  if (v4 <= 0.0) {
    double v12 = v11;
  }
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (NSMutableDictionary)windowDict
{
  return self->_windowDict;
}

- (void)setWindowDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end