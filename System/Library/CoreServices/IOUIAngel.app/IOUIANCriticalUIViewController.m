@interface IOUIANCriticalUIViewController
+ (id)_createBackdropView;
- (BOOL)_canShowWhileLocked;
- (BOOL)debugViews;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (IOUIANCriticalUIView)criticalUIView;
- (IOUIANCriticalUIViewController)init;
- (IOUIANCriticalUIViewControllerDelegate)delegate;
- (UIViewController)emergencyCallHostVC;
- (_UIBackdropView)backdropView;
- (void)dismissEmergencyDialer;
- (void)emergencyCallHostViewControllerDidRequestDismiss:(id)a3;
- (void)emergencyCallHostViewControllerDidTerminate:(id)a3 withError:(id)a4;
- (void)handleButtonAction:(id)a3;
- (void)presentEmergencyDialer;
- (void)setBackdropView:(id)a3;
- (void)setCriticalUIView:(id)a3;
- (void)setDebugViews:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEmergencyCallHostVC:(id)a3;
- (void)setHeaderText:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageWithSystemImageNamed:(id)a3 andConfiguration:(id)a4;
- (void)setMessageText:(id)a3;
- (void)viewDidLoad;
@end

@implementation IOUIANCriticalUIViewController

- (IOUIANCriticalUIViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)IOUIANCriticalUIViewController;
  v2 = [(IOUIANCriticalUIViewController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[IOUIANCriticalUIViewController _createBackdropView];
    backdropView = v2->_backdropView;
    v2->_backdropView = (_UIBackdropView *)v3;

    uint64_t v5 = objc_opt_new();
    criticalUIView = v2->_criticalUIView;
    v2->_criticalUIView = (IOUIANCriticalUIView *)v5;

    [(IOUIANCriticalUIView *)v2->_criticalUIView setDelegate:v2];
    [(IOUIANCriticalUIView *)v2->_criticalUIView setButtonTitle:@"Emergency"];
  }
  return v2;
}

- (void)setImage:(id)a3
{
  id v6 = a3;
  v4 = [(IOUIANCriticalUIViewController *)self criticalUIView];

  if (v4)
  {
    uint64_t v5 = [(IOUIANCriticalUIViewController *)self criticalUIView];
    [v5 setImage:v6];
  }
}

- (void)setImageWithSystemImageNamed:(id)a3 andConfiguration:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(IOUIANCriticalUIViewController *)self criticalUIView];

  if (v7)
  {
    objc_super v8 = [(IOUIANCriticalUIViewController *)self criticalUIView];
    [v8 setImageWithSystemImageNamed:v9 andConfiguration:v6];
  }
}

- (void)setHeaderText:(id)a3
{
  id v6 = a3;
  v4 = [(IOUIANCriticalUIViewController *)self criticalUIView];

  if (v4)
  {
    uint64_t v5 = [(IOUIANCriticalUIViewController *)self criticalUIView];
    [v5 setHeaderText:v6];
  }
}

- (void)setMessageText:(id)a3
{
  id v6 = a3;
  v4 = [(IOUIANCriticalUIViewController *)self criticalUIView];

  if (v4)
  {
    uint64_t v5 = [(IOUIANCriticalUIViewController *)self criticalUIView];
    [v5 setMessageText:v6];
  }
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)IOUIANCriticalUIViewController;
  [(IOUIANCriticalUIViewController *)&v33 viewDidLoad];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IOUIANCriticalUIViewController viewDidLoad...", buf, 2u);
  }
  if (![(IOUIANCriticalUIViewController *)self debugViews])
  {
    uint64_t v3 = [(IOUIANCriticalUIViewController *)self view];
    v4 = [(IOUIANCriticalUIViewController *)self backdropView];
    [v3 insertSubview:v4 atIndex:0];
  }
  uint64_t v5 = [(IOUIANCriticalUIViewController *)self view];
  id v6 = [(IOUIANCriticalUIViewController *)self criticalUIView];
  [v5 addSubview:v6];

  v7 = [(IOUIANCriticalUIViewController *)self criticalUIView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v31 = [(IOUIANCriticalUIViewController *)self criticalUIView];
  v29 = [v31 bottomAnchor];
  v30 = [(IOUIANCriticalUIViewController *)self view];
  v28 = [v30 safeAreaLayoutGuide];
  v27 = [v28 bottomAnchor];
  v26 = [v29 constraintEqualToAnchor:v27];
  v34[0] = v26;
  v25 = [(IOUIANCriticalUIViewController *)self criticalUIView];
  v23 = [v25 centerYAnchor];
  v24 = [(IOUIANCriticalUIViewController *)self view];
  v22 = [v24 centerYAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v34[1] = v21;
  v20 = [(IOUIANCriticalUIViewController *)self criticalUIView];
  v18 = [v20 leadingAnchor];
  v19 = [(IOUIANCriticalUIViewController *)self view];
  objc_super v8 = [v19 readableContentGuide];
  id v9 = [v8 leadingAnchor];
  v10 = [v18 constraintEqualToAnchor:v9];
  v34[2] = v10;
  v11 = [(IOUIANCriticalUIViewController *)self criticalUIView];
  v12 = [v11 trailingAnchor];
  v13 = [(IOUIANCriticalUIViewController *)self view];
  v14 = [v13 readableContentGuide];
  v15 = [v14 trailingAnchor];
  v16 = [v12 constraintEqualToAnchor:v15];
  v34[3] = v16;
  v17 = +[NSArray arrayWithObjects:v34 count:4];
  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)setDebugViews:(BOOL)a3
{
  BOOL v3 = a3;
  self->_debugViews = a3;
  if (a3)
  {
    uint64_t v5 = +[UIColor greenColor];
    id v6 = [(IOUIANCriticalUIViewController *)self view];
    [v6 setBackgroundColor:v5];

    v7 = [(IOUIANCriticalUIViewController *)self backdropView];
    [v7 removeFromSuperview];
  }
  else
  {
    objc_super v8 = [(IOUIANCriticalUIViewController *)self view];
    [v8 setBackgroundColor:0];

    v7 = [(IOUIANCriticalUIViewController *)self view];
    id v9 = [(IOUIANCriticalUIViewController *)self backdropView];
    [v7 insertSubview:v9 atIndex:0];
  }
  id v10 = [(IOUIANCriticalUIViewController *)self criticalUIView];
  [v10 setDebugViews:v3];
}

+ (id)_createBackdropView
{
  v2 = +[UIColor colorWithRed:0.02 green:0.02 blue:0.02 alpha:0.85];
  BOOL v3 = +[_UIBackdropViewSettings settingsForPrivateStyle:-2];
  [v3 setBackdropVisible:1];
  id v4 = [objc_alloc((Class)_UIBackdropView) initWithSettings:v3];
  uint64_t v5 = [v4 inputSettings];
  [v5 setBlurRadius:5.0];

  id v6 = [v2 colorWithAlphaComponent:1.0];
  v7 = [v4 inputSettings];
  [v7 setColorTint:v6];

  [v2 alphaComponent];
  double v9 = v8;
  id v10 = [v4 inputSettings];
  [v10 setColorTintAlpha:v9];

  return v4;
}

- (void)handleButtonAction:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Button action handler fired! (view: %@)", (uint8_t *)&v5, 0xCu);
  }
  [(IOUIANCriticalUIViewController *)self presentEmergencyDialer];
}

- (void)presentEmergencyDialer
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Presenting emergency call dialer...", buf, 2u);
  }
  BOOL v3 = [(IOUIANCriticalUIViewController *)self emergencyCallHostVC];

  if (!v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100004A68;
    v4[3] = &unk_10000C528;
    v4[4] = self;
    +[IOUIANCriticalUIEmergencyCallHostViewController requestEmergencyCallControllerWithCompletion:v4];
  }
}

- (void)dismissEmergencyDialer
{
  BOOL v3 = [(IOUIANCriticalUIViewController *)self emergencyCallHostVC];

  if (v3)
  {
    id v4 = [(IOUIANCriticalUIViewController *)self emergencyCallHostVC];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100004CF4;
    v5[3] = &unk_10000C500;
    v5[4] = self;
    [v4 dismissViewControllerAnimated:1 completion:v5];

    [(IOUIANCriticalUIViewController *)self setEmergencyCallHostVC:0];
  }
}

- (void)emergencyCallHostViewControllerDidRequestDismiss:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "emergencyCallHostViewControllerDidRequestDismiss! (emergencyCallHostViewController: %@)", (uint8_t *)&v5, 0xCu);
  }
  [(IOUIANCriticalUIViewController *)self dismissEmergencyDialer];
}

- (void)emergencyCallHostViewControllerDidTerminate:(id)a3 withError:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = a3;
    __int16 v9 = 2112;
    id v10 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "emergencyCallHostViewControllerDidTerminate! (emergencyCallHostViewController: %@, error: %@)", (uint8_t *)&v7, 0x16u);
  }
  [(IOUIANCriticalUIViewController *)self dismissEmergencyDialer];
}

- (IOUIANCriticalUIViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IOUIANCriticalUIViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)debugViews
{
  return self->_debugViews;
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (IOUIANCriticalUIView)criticalUIView
{
  return self->_criticalUIView;
}

- (void)setCriticalUIView:(id)a3
{
}

- (UIViewController)emergencyCallHostVC
{
  return self->_emergencyCallHostVC;
}

- (void)setEmergencyCallHostVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emergencyCallHostVC, 0);
  objc_storeStrong((id *)&self->_criticalUIView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end