@interface CARSplashScreenViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (NSXPCConnection)connection;
- (void)_dismissAnimated:(BOOL)a3;
- (void)_setupXPCConnectionWithEndpoint:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismissAlertAnimated:(BOOL)a3;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setConnection:(id)a3;
- (void)viewDidLoad;
@end

@implementation CARSplashScreenViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v65.receiver = self;
  v65.super_class = (Class)CARSplashScreenViewController;
  [(CARSplashScreenViewController *)&v65 viewDidLoad];
  v3 = +[UIImage imageNamed:@"CarPlayIcon"];
  v64 = [v3 imageWithRenderingMode:2];

  id v4 = objc_alloc_init((Class)UIImageView);
  [v4 setContentMode:1];
  [v4 setImage:v64];
  v5 = +[UIColor systemWhiteColor];
  [v4 setTintColor:v5];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(CARSplashScreenViewController *)self view];
  [v6 addSubview:v4];

  v63 = +[UIFont systemFontOfSize:48.0 weight:UIFontWeightLight];
  id v7 = objc_alloc_init((Class)UILabel);
  [v7 setFont:v63];
  [v7 setNumberOfLines:0];
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"SPLASH_SCREEN_CARPLAY" value:&stru_100008420 table:@"CarPlaySplashScreen"];
  [v7 setText:v9];

  [v7 setTextAlignment:1];
  v10 = +[UIColor systemWhiteColor];
  [v7 setTextColor:v10];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = [(CARSplashScreenViewController *)self view];
  [v11 addSubview:v7];

  id v12 = objc_alloc_init((Class)UILayoutGuide);
  v13 = [(CARSplashScreenViewController *)self view];
  [v13 addLayoutGuide:v12];

  v61 = [v12 heightAnchor];
  v62 = [(CARSplashScreenViewController *)self view];
  v60 = [v62 heightAnchor];
  v59 = [v61 constraintEqualToAnchor:v60 multiplier:0.39];
  v66[0] = v59;
  v57 = [v12 topAnchor];
  v58 = [(CARSplashScreenViewController *)self view];
  v56 = [v58 topAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v66[1] = v55;
  v52 = [v12 leftAnchor];
  v53 = [(CARSplashScreenViewController *)self view];
  v51 = [v53 leftAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v66[2] = v50;
  v54 = v12;
  v48 = [v12 rightAnchor];
  v49 = [(CARSplashScreenViewController *)self view];
  v47 = [v49 rightAnchor];
  v45 = [v48 constraintEqualToAnchor:v47];
  v66[3] = v45;
  v44 = [v4 topAnchor];
  v43 = [v12 bottomAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v66[4] = v42;
  v41 = [v4 widthAnchor];
  v40 = [v41 constraintEqualToConstant:100.0];
  v66[5] = v40;
  v39 = [v4 heightAnchor];
  v37 = [v39 constraintEqualToConstant:100.0];
  v66[6] = v37;
  v46 = v4;
  v35 = [v4 centerXAnchor];
  v36 = [(CARSplashScreenViewController *)self view];
  v34 = [v36 centerXAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v66[7] = v33;
  v32 = [v7 firstBaselineAnchor];
  v31 = [v4 bottomAnchor];
  v30 = [v32 constraintEqualToAnchor:v31 constant:62.0];
  v66[8] = v30;
  v28 = [v7 centerXAnchor];
  v29 = [(CARSplashScreenViewController *)self view];
  v27 = [v29 centerXAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v66[9] = v26;
  v14 = v7;
  v38 = v7;
  v25 = [v7 leftAnchor];
  v15 = [(CARSplashScreenViewController *)self view];
  v16 = [v15 layoutMarginsGuide];
  v17 = [v16 leftAnchor];
  v18 = [v25 constraintEqualToAnchor:v17];
  v66[10] = v18;
  v19 = [v14 rightAnchor];
  v20 = [(CARSplashScreenViewController *)self view];
  v21 = [v20 layoutMarginsGuide];
  v22 = [v21 rightAnchor];
  v23 = [v19 constraintEqualToAnchor:v22];
  v66[11] = v23;
  v24 = +[NSArray arrayWithObjects:v66 count:12];
  +[NSLayoutConstraint activateConstraints:v24];
}

- (void)_setupXPCConnectionWithEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSXPCListenerEndpoint);
  [v5 _setEndpoint:v4];
  id v6 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v5];
  id v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DBSplashScreenDismissalService];
  [v6 setExportedInterface:v7];
  [v6 setExportedObject:self];
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004C80;
  v12[3] = &unk_100008250;
  objc_copyWeak(&v13, &location);
  [v6 setInterruptionHandler:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004CC4;
  v10[3] = &unk_100008250;
  objc_copyWeak(&v11, &location);
  [v6 setInvalidationHandler:v10];
  v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DBSplashScreenDismissalServer];
  [v6 setRemoteObjectInterface:v8];
  [v6 resume];
  v9 = [v6 remoteObjectProxy];
  [v9 connect];

  [(CARSplashScreenViewController *)self setConnection:v6];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_dismissAnimated:(BOOL)a3
{
  id v4 = sub_100004284();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dismissing alert", buf, 2u);
  }

  [(CARSplashScreenViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_100008290];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004E34;
  v6[3] = &unk_1000082B8;
  v6[4] = self;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v7;
  [(CARSplashScreenViewController *)self synchronizeAnimationsInActions:v6];
}

- (void)dismissAlertAnimated:(BOOL)a3
{
  id v5 = sub_100004284();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismiss call from connection", buf, 2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005090;
  v6[3] = &unk_100008308;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v9 = (void (**)(void))a4;
  id v6 = a3;
  BOOL v7 = [(CARSplashScreenViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_100008328];
  v8 = [v6 xpcEndpoint];

  [(CARSplashScreenViewController *)self _setupXPCConnectionWithEndpoint:v8];
  [v7 setAllowsMenuButtonDismissal:0];
  [v7 setDesiredHardwareButtonEvents:16];
  if (v9) {
    v9[2]();
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(void))a4;
  id v6 = [(CARSplashScreenViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_100008348];
  BOOL v7 = [(CARSplashScreenViewController *)self view];
  [v7 setAlpha:0.0];

  +[BSUIAnimationFactory factoryWithDuration:0.25];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000530C;
  v10[3] = &unk_100008370;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v11;
  [(CARSplashScreenViewController *)self synchronizeAnimationsInActions:v10];
  if (v5) {
    v5[2](v5);
  }
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004284();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling button actions", buf, 2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000054E0;
  v6[3] = &unk_1000083C0;
  v6[4] = self;
  [v4 enumerateObjectsUsingBlock:v6];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end