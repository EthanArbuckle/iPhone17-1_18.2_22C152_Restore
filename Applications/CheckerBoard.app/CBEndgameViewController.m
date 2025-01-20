@interface CBEndgameViewController
- (void)showDiagnostics;
- (void)viewDidLoad;
@end

@implementation CBEndgameViewController

- (void)viewDidLoad
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Diagnostics pane loaded", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)CBEndgameViewController;
  [(CBEndgameViewController *)&v5 viewDidLoad];
  v4 = [(CBEndgameViewController *)self navigationItem];
  [v4 setHidesBackButton:1];

  [(CBEndgameViewController *)self showDiagnostics];
}

- (void)showDiagnostics
{
  v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Launching Diagnostics.", v5, 2u);
  }

  v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"CBEndGameViewControllerLaunchingDiagnosticsNotification" object:0];

  v4 = +[CBAppManager sharedInstance];
  [v4 launchAppWithBundleID:@"com.apple.Diagnostics" suspended:0 native:1 completion:&stru_100079DF8];
}

@end