@interface CBWindowManager
+ (id)sharedInstance;
- (BOOL)_hasLaunchedDiagnosticsProcess;
- (CBRecordingIndicatorManager)rootWindowRecordingIndicatorManager;
- (CBWindow)backgroundWindow;
- (CBWindowManager)init;
- (NSArray)layers;
- (double)_maxLevelForLayer:(unint64_t)a3;
- (id)_presentVC:(id)a3 onLayer:(unint64_t)a4 backgroundTunnel:(BOOL)a5 statusBarVisible:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8;
- (id)createRepresentationWithIdentifier:(id)a3;
- (id)presentViewController:(id)a3 onLayer:(unint64_t)a4 backgroundTunnel:(BOOL)a5 statusBarVisible:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8;
- (void)_adjustBackgroundWindowLevel;
- (void)_rekeyWindows;
- (void)setBackgroundWindow:(id)a3;
- (void)setLayers:(id)a3;
- (void)windowDidAppear:(id)a3;
- (void)windowDidDismiss:(id)a3;
- (void)windowWillAppear:(id)a3;
- (void)windowWillDismiss:(id)a3;
@end

@implementation CBWindowManager

+ (id)sharedInstance
{
  if (qword_10008FEB8 != -1) {
    dispatch_once(&qword_10008FEB8, &stru_10007A308);
  }
  v2 = (void *)qword_10008FEB0;

  return v2;
}

- (CBWindowManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)CBWindowManager;
  v2 = [(CBWindowManager *)&v20 init];
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = +[UIColor blackColor];
    v5 = [v3 view];
    [v5 setBackgroundColor:v4];

    v6 = objc_alloc_init(CBWindow);
    backgroundWindow = v2->_backgroundWindow;
    v2->_backgroundWindow = v6;

    [(CBWindow *)v2->_backgroundWindow setWindowLevel:-5000.0];
    [(CBWindow *)v2->_backgroundWindow setRootViewController:v3];
    v8 = [(CBWindow *)v2->_backgroundWindow rootViewController];
    [(CBWindow *)v2->_backgroundWindow setPresentedView:v8];

    [(CBWindow *)v2->_backgroundWindow makeKeyAndVisible];
    v9 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating recording indicator manager for root window", v19, 2u);
    }

    v10 = [CBRecordingIndicatorManager alloc];
    v11 = [(CBWindow *)v2->_backgroundWindow windowScene];
    v12 = [(CBRecordingIndicatorManager *)v10 initWithWindowScene:v11];
    rootWindowRecordingIndicatorManager = v2->_rootWindowRecordingIndicatorManager;
    v2->_rootWindowRecordingIndicatorManager = v12;

    v14 = +[NSMutableArray arrayWithCapacity:3];
    for (uint64_t i = 0; i != 3; ++i)
    {
      v16 = +[NSMutableArray array];
      [(NSArray *)v14 insertObject:v16 atIndex:i];
    }
    layers = v2->_layers;
    v2->_layers = v14;
  }
  return v2;
}

- (id)createRepresentationWithIdentifier:(id)a3
{
  v4 = +[CBWindowRepresentation windowRepresentationForIdentifier:a3];
  [(CBWindowManager *)self _maxLevelForLayer:1];
  [v4 setWindowLevel:v5 + 10.0];
  [v4 setBackgroundTunnel:1];
  [v4 setWindowManager:self];
  [v4 setWindowManagerLayer:1];

  return v4;
}

- (id)presentViewController:(id)a3 onLayer:(unint64_t)a4 backgroundTunnel:(BOOL)a5 statusBarVisible:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a8;
  if ([(CBWindowManager *)self _hasLaunchedDiagnosticsProcess])
  {
    v16 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CBSceneManager: present viewController %@ to be on top of the Diagnostics app", (uint8_t *)&v20, 0xCu);
    }

    v17 = +[CBSceneManager sharedInstance];
    v18 = [v17 presentViewController:v14 completion:v15];
  }
  else
  {
    v18 = [(CBWindowManager *)self _presentVC:v14 onLayer:a4 backgroundTunnel:v11 statusBarVisible:v10 animated:v9 completion:v15];
  }

  return v18;
}

- (id)_presentVC:(id)a3 onLayer:(unint64_t)a4 backgroundTunnel:(BOOL)a5 statusBarVisible:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v14 = a8;
  id v15 = a3;
  v16 = [[CBWindow alloc] initWithBackgroundTunnel:v10];
  [(CBWindow *)v16 setWindowManager:self];
  [(CBWindow *)v16 setWindowManagerLayer:a4];
  [(CBWindowManager *)self _maxLevelForLayer:a4];
  [(CBWindow *)v16 setWindowLevel:v17 + 10.0];
  v18 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    [(CBWindow *)v16 windowLevel];
    *(_DWORD *)buf = 134217984;
    uint64_t v32 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Set window level to: %f", buf, 0xCu);
  }

  [(CBWindow *)v16 setPresentViewControllerWithStatusBarShown:v9];
  [(CBWindow *)v16 setPresentedView:v15];
  [v15 setModalPresentationStyle:0];
  int v20 = objc_alloc_init(CBWindowRootViewController);
  [(CBWindowRootViewController *)v20 setWindow:v16];
  [(CBWindow *)v16 setRootViewController:v20];
  id v21 = +[UIColor clearColor];
  [(CBWindow *)v16 setBackgroundColor:v21];

  v22 = [(CBWindow *)v16 windowManager];
  [v22 windowWillAppear:v16];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10002E47C;
  v28[3] = &unk_10007A0D8;
  v23 = v16;
  v29 = v23;
  id v30 = v14;
  id v24 = v14;
  [(CBWindowRootViewController *)v20 presentViewController:v15 animated:v8 completion:v28];

  v25 = v30;
  v26 = v23;

  return v26;
}

- (void)windowWillAppear:(id)a3
{
  id v3 = a3;
  [v3 setHidden:0];
}

- (void)windowDidAppear:(id)a3
{
  objc_initWeak(&location, a3);
  v4 = [(CBWindowManager *)self layers];
  id v5 = objc_loadWeakRetained(&location);
  v6 = [v4 objectAtIndex:[v5 windowManagerLayer]];
  id v7 = objc_loadWeakRetained(&location);
  [v6 addObject:v7];

  [(CBWindowManager *)self _adjustBackgroundWindowLevel];
  [(CBWindowManager *)self _rekeyWindows];
  objc_destroyWeak(&location);
}

- (void)windowWillDismiss:(id)a3
{
  id v7 = a3;
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v5 = [(CBWindowManager *)self layers];
    v6 = [v5 objectAtIndex:i];

    [v6 removeObject:v7];
  }
  [(CBWindowManager *)self _adjustBackgroundWindowLevel];
  [(CBWindowManager *)self _rekeyWindows];
}

- (void)windowDidDismiss:(id)a3
{
  id v3 = a3;
  [v3 setHidden:1];
}

- (BOOL)_hasLaunchedDiagnosticsProcess
{
  v2 = +[FBProcessManager sharedInstance];
  id v3 = [v2 applicationProcessesForBundleIdentifier:@"com.apple.Diagnostics"];

  v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 description];
    int v8 = 138412546;
    BOOL v9 = v5;
    __int16 v10 = 2048;
    id v11 = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Number of Diagnostics processes (%@): %lu", (uint8_t *)&v8, 0x16u);
  }
  BOOL v6 = [v3 count] != 0;

  return v6;
}

- (void)_rekeyWindows
{
  uint64_t v3 = 2;
  while (1)
  {
    v4 = [(CBWindowManager *)self layers];
    id v5 = [v4 objectAtIndex:v3];

    if ([v5 count]) {
      break;
    }

    if (!--v3) {
      return;
    }
  }
  BOOL v6 = [v5 lastObject];
  id v7 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    BOOL v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Making %@ the key window.", (uint8_t *)&v8, 0xCu);
  }

  [v6 makeKeyWindow];
}

- (double)_maxLevelForLayer:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 2) {
      v4 = &UIWindowLevelAlert;
    }
    else {
      v4 = &UIWindowLevelNormal;
    }
    double v5 = *v4;
  }
  else
  {
    double v5 = -4990.0;
  }
  BOOL v6 = [(CBWindowManager *)self layers];
  id v7 = [v6 objectAtIndex:a3];

  if ([v7 count])
  {
    unint64_t v8 = 0;
    do
    {
      BOOL v9 = [v7 objectAtIndex:v8];
      [v9 windowLevel];
      if (v5 < v10)
      {
        [v9 windowLevel];
        double v5 = v11;
      }

      ++v8;
    }
    while (v8 < (unint64_t)[v7 count]);
  }

  return v5;
}

- (void)_adjustBackgroundWindowLevel
{
  uint64_t v4 = 0;
  double v5 = 0.0;
  *(void *)&long long v2 = 138412546;
  long long v18 = v2;
  do
  {
    BOOL v6 = [(CBWindowManager *)self layers];
    id v7 = [v6 objectAtIndex:v4];

    if ([v7 count])
    {
      unint64_t v8 = 0;
      do
      {
        BOOL v9 = [v7 objectAtIndex:v8];
        if ([v9 backgroundTunnel])
        {
          double v10 = CheckerBoardLogHandleForCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            [v9 windowLevel];
            *(_DWORD *)buf = v18;
            double v20 = *(double *)&v9;
            __int16 v21 = 2048;
            uint64_t v22 = v11;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Examining %@ for background leveling: %f", buf, 0x16u);
          }

          [v9 windowLevel];
          double v5 = v12 + -1.0;
        }

        ++v8;
      }
      while (v8 < (unint64_t)[v7 count]);
    }

    ++v4;
  }
  while (v4 != 3);
  v13 = [(CBWindowManager *)self backgroundWindow];
  [v13 windowLevel];
  double v15 = v14;

  if (v15 != v5)
  {
    v16 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Setting background to level %f.", buf, 0xCu);
    }

    double v17 = [(CBWindowManager *)self backgroundWindow];
    [v17 setWindowLevel:v5];
  }
}

- (CBRecordingIndicatorManager)rootWindowRecordingIndicatorManager
{
  return self->_rootWindowRecordingIndicatorManager;
}

- (CBWindow)backgroundWindow
{
  return self->_backgroundWindow;
}

- (void)setBackgroundWindow:(id)a3
{
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)setLayers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_backgroundWindow, 0);

  objc_storeStrong((id *)&self->_rootWindowRecordingIndicatorManager, 0);
}

@end