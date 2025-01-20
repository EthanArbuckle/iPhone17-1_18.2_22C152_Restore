@interface IUIInputSourceViewController
- (BOOL)_canShowWhileLocked;
- (IUIRTIInputSource)textInputSource;
- (IUISessionCoordinator)sessionCoordinator;
- (void)setSessionCoordinator:(id)a3;
- (void)viewDidLoad;
@end

@implementation IUIInputSourceViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)IUIInputSourceViewController;
  [(IUIInputSourceViewController *)&v19 viewDidLoad];
  v3 = [(IUIInputSourceViewController *)self sessionCoordinator];
  [v3 reloadInputSource];

  v4 = sub_1000029D8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InputUI view did load", v18, 2u);
  }

  if (qword_1000293F8 != -1) {
    dispatch_once(&qword_1000293F8, &stru_10001C828);
  }
  v5 = +[TIPreferencesController sharedPreferencesController];
  v6 = [v5 valueForPreferenceKey:@"InputUIWindowDebug"];

  LODWORD(v5) = [v6 BOOLValue];
  if (v5)
  {
    v7 = +[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.3];
    v8 = [(IUIInputSourceViewController *)self view];
    [v8 setBackgroundColor:v7];

    v9 = [(IUIInputSourceViewController *)self view];
    [v9 setUserInteractionEnabled:0];

    id v10 = +[UIColor greenColor];
    id v11 = [v10 CGColor];
    v12 = [(IUIInputSourceViewController *)self view];
    v13 = [v12 layer];
    [v13 setBorderColor:v11];

    v14 = [(IUIInputSourceViewController *)self view];
    v15 = [v14 layer];
    [v15 setBorderWidth:5.0];

    v16 = [(IUIInputSourceViewController *)self view];
    v17 = [v16 layer];
    [v17 setAllowsHitTesting:0];
  }
}

- (IUIRTIInputSource)textInputSource
{
  v2 = [(IUIInputSourceViewController *)self sessionCoordinator];
  v3 = [v2 textInputSource];

  return (IUIRTIInputSource *)v3;
}

- (IUISessionCoordinator)sessionCoordinator
{
  return self->_sessionCoordinator;
}

- (void)setSessionCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end