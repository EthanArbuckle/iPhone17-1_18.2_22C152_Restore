@interface CBOpeningViewController
+ (id)_welcomeImageForSymbol:(id)a3;
+ (id)openingViewControllerForBootIntent;
- (BOOL)showingDeviceInformation;
- (UIButton)infoButton;
- (UIButton)languageButton;
- (UIView)deviceInformationView;
- (id)remoteSetupAuthController;
- (id)remoteSetupConfiguringController;
- (id)remoteSetupManager;
- (id)remoteSetupQRCodeScanner;
- (id)remoteSetupQRCodeScannerController;
- (void)_setupLanguageButton;
- (void)_setupOnboardingButtons;
- (void)_setupVersionFooter;
- (void)dealloc;
- (void)didTappedExitButton;
- (void)didTappedLanguageSelectorButton;
- (void)didTappedStartDiagnosticsButton;
- (void)setDeviceInformationView:(id)a3;
- (void)setInfoButton:(id)a3;
- (void)setLanguageButton:(id)a3;
- (void)setRemoteSetupAuthController:(id)a3;
- (void)setRemoteSetupConfiguringController:(id)a3;
- (void)setRemoteSetupManager:(id)a3;
- (void)setRemoteSetupQRCodeScanner:(id)a3;
- (void)setRemoteSetupQRCodeScannerController:(id)a3;
- (void)setShowingDeviceInformation:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CBOpeningViewController

+ (id)openingViewControllerForBootIntent
{
  v3 = +[CBBootIntentManager sharedInstance];
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"DIAGNOSTICS_DESCRIPTION" value:&stru_10007A9F8 table:0];

  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"DIAGNOSTICS" value:&stru_10007A9F8 table:0];

  if ([v3 currentBootIntentReason] == (id)1)
  {
    v8 = +[UIDevice currentDevice];
    id v9 = [v8 userInterfaceIdiom];

    v10 = +[NSBundle mainBundle];
    uint64_t v11 = [v10 localizedStringForKey:@"SELF_SERVICE_REPAIR" value:&stru_10007A9F8 table:0];

    v12 = @"SELF_SERVICE_REPAIR_DESCRIPTION_IPHONE";
    if (v9 == (id)1) {
      v12 = @"SELF_SERVICE_REPAIR_DESCRIPTION_IPAD";
    }
    v13 = v12;
    v14 = +[NSBundle mainBundle];
    uint64_t v15 = [v14 localizedStringForKey:v13 value:&stru_10007A9F8 table:0];

    CFStringRef v16 = @"screwdriver.fill";
    v5 = (void *)v15;
    v7 = (void *)v11;
  }
  else
  {
    CFStringRef v16 = @"diagnostics.fill";
  }
  v17 = [a1 _welcomeImageForSymbol:v16];
  if (!v17)
  {
    v17 = +[UIImage imageNamed:@"Diagnostics"];
  }
  v18 = [[CBOpeningViewController alloc] initWithTitle:v7 detailText:v5 icon:v17];

  return v18;
}

+ (id)_welcomeImageForSymbol:(id)a3
{
  id v3 = a3;
  v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  id v6 = [objc_alloc((Class)IFSymbol) initWithSymbolName:v3 bundleURL:0];
  v7 = objc_opt_new();
  id v8 = [objc_alloc((Class)IFColor) initWithSystemColor:11];
  id v17 = v8;
  id v9 = +[NSArray arrayWithObjects:&v17 count:1];
  [v7 setSymbolColors:v9];

  id v10 = [objc_alloc((Class)IFColor) initWithSystemColor:7];
  id v16 = v10;
  uint64_t v11 = +[NSArray arrayWithObjects:&v16 count:1];
  [v7 setEnclosureColors:v11];

  [v7 setRenderingMode:3];
  double v12 = 85.0;
  if (v5 == (id)1) {
    double v12 = 60.0;
  }
  [v7 setSize:v12, v12];
  v13 = [v6 imageForGraphicSymbolDescriptor:v7];
  v14 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", [v13 CGImage]);

  return v14;
}

- (BOOL)showingDeviceInformation
{
  return self->_showingDeviceInformation;
}

- (void)setShowingDeviceInformation:(BOOL)a3
{
  self->_showingDeviceInformation = a3;
}

- (UIButton)infoButton
{
  return self->_infoButton;
}

- (void)setInfoButton:(id)a3
{
}

- (UIView)deviceInformationView
{
  return self->_deviceInformationView;
}

- (void)setDeviceInformationView:(id)a3
{
}

- (id)remoteSetupManager
{
  return self->_remoteSetupManager;
}

- (void)setRemoteSetupManager:(id)a3
{
}

- (id)remoteSetupAuthController
{
  return self->_remoteSetupAuthController;
}

- (void)setRemoteSetupAuthController:(id)a3
{
}

- (id)remoteSetupConfiguringController
{
  return self->_remoteSetupConfiguringController;
}

- (void)setRemoteSetupConfiguringController:(id)a3
{
}

- (id)remoteSetupQRCodeScannerController
{
  return self->_remoteSetupQRCodeScannerController;
}

- (void)setRemoteSetupQRCodeScannerController:(id)a3
{
}

- (id)remoteSetupQRCodeScanner
{
  return self->_remoteSetupQRCodeScanner;
}

- (void)setRemoteSetupQRCodeScanner:(id)a3
{
}

- (void)viewDidLoad
{
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Welcome Screen pane loaded", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)CBOpeningViewController;
  [(CBOpeningViewController *)&v4 viewDidLoad];
  [(CBOpeningViewController *)self setModalPresentationStyle:2];
  [(CBOpeningViewController *)self _setupVersionFooter];
  [(CBOpeningViewController *)self _setupOnboardingButtons];
  [(CBOpeningViewController *)self setShowingDeviceInformation:0];
  [(CBOpeningViewController *)self setupInfoButton];
  [(CBOpeningViewController *)self _setupLanguageButton];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CBOpeningViewController;
  [(CBOpeningViewController *)&v3 viewDidAppear:a3];
}

- (void)viewDidLayoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)CBOpeningViewController;
  [(CBOpeningViewController *)&v40 viewDidLayoutSubviews];
  id v3 = [UIApp userInterfaceLayoutDirection];
  objc_super v4 = [(CBOpeningViewController *)self infoButton];

  if (v4)
  {
    id v5 = [(CBOpeningViewController *)self view];
    id v6 = [(CBOpeningViewController *)self infoButton];
    [v5 bringSubviewToFront:v6];

    v7 = [(CBOpeningViewController *)self view];
    if (v3 == (id)1) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = 8;
    }
    id v9 = [(CBOpeningViewController *)self infoButton];
    [v9 bounds];
    [v7 _rectTuckedInBoundingPathCorner:v8 withSize:v10 cornerRadii:v11 minimumPadding:0.0, 0.0, 0.0, 0.0];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    v20 = [(CBOpeningViewController *)self infoButton];
    v41.origin.x = v13;
    v41.origin.y = v15;
    v41.size.width = v17;
    v41.size.height = v19;
    double MidX = CGRectGetMidX(v41);
    v42.origin.x = v13;
    v42.origin.y = v15;
    v42.size.width = v17;
    v42.size.height = v19;
    [v20 setCenter:MidX, CGRectGetMidY(v42)];
  }
  v22 = [(CBOpeningViewController *)self languageButton];

  if (v22)
  {
    v23 = [(CBOpeningViewController *)self view];
    v24 = [(CBOpeningViewController *)self languageButton];
    [v23 bringSubviewToFront:v24];

    v25 = [(CBOpeningViewController *)self view];
    if (v3 == (id)1) {
      uint64_t v26 = 8;
    }
    else {
      uint64_t v26 = 4;
    }
    v27 = [(CBOpeningViewController *)self languageButton];
    [v27 bounds];
    [v25 _rectTuckedInBoundingPathCorner:v26 withSize:v28 cornerRadii:v29 minimumPadding:0.0, 0.0, 0.0, 0.0];
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;

    v38 = [(CBOpeningViewController *)self languageButton];
    v43.origin.x = v31;
    v43.origin.y = v33;
    v43.size.width = v35;
    v43.size.height = v37;
    double v39 = CGRectGetMidX(v43);
    v44.origin.x = v31;
    v44.origin.y = v33;
    v44.size.width = v35;
    v44.size.height = v37;
    [v38 setPosition:v39, CGRectGetMidY(v44)];
  }
}

- (void)dealloc
{
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dealloc was called in Opening View Controller", buf, 2u);
  }

  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)CBOpeningViewController;
  [(CBOpeningViewController *)&v5 dealloc];
}

- (void)_setupVersionFooter
{
  id v10 = +[UIDevice currentDevice];
  id v3 = (void *)MGCopyAnswer();
  objc_super v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 localizedStringForKey:@"OS_VERSION" value:&stru_10007A9F8 table:0];
  id v6 = [v10 systemName];
  v7 = [v10 systemVersion];
  uint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6, v7, v3);

  id v9 = [(CBOpeningViewController *)self buttonTray];
  [v9 setCaptionText:v8 style:1];
}

- (void)_setupOnboardingButtons
{
  id v3 = +[NSBundle mainBundle];
  id v16 = [v3 localizedStringForKey:@"START_DIAGNOSTICS" value:&stru_10007A9F8 table:0];

  objc_super v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 localizedStringForKey:@"EXIT_DIAGNOSTICS" value:&stru_10007A9F8 table:0];

  id v6 = +[CBBootIntentManager sharedInstance];
  id v7 = [v6 currentBootIntentReason];

  if (v7 == (id)1)
  {
    uint64_t v8 = +[NSBundle mainBundle];
    uint64_t v9 = [v8 localizedStringForKey:@"EXIT_SELF_SERVICE_REPAIR" value:&stru_10007A9F8 table:0];

    objc_super v5 = (void *)v9;
  }
  id v10 = +[OBBoldTrayButton boldButton];
  [v10 setTitle:v16 forState:0];
  [v10 addTarget:self action:"didTappedStartDiagnosticsButton" forControlEvents:64];
  double v11 = [(CBOpeningViewController *)self buttonTray];
  [v11 addButton:v10];

  double v12 = +[OBLinkTrayButton linkButton];
  CGFloat v13 = +[NSBundle mainBundle];
  double v14 = [v13 localizedStringForKey:v5 value:&stru_10007A9F8 table:0];
  [v12 setTitle:v14 forState:0];

  [v12 addTarget:self action:"didTappedExitButton" forControlEvents:64];
  CGFloat v15 = [(CBOpeningViewController *)self buttonTray];
  [v15 addButton:v12];
}

- (void)didTappedStartDiagnosticsButton
{
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Start Diagnostics] button tapped", v6, 2u);
  }

  objc_super v4 = [[CBNetworkViewController alloc] initWithSetupPresentationTheme:1];
  objc_super v5 = [(CBOpeningViewController *)self navigationController];
  [v5 pushViewController:v4 animated:1];
}

- (void)didTappedExitButton
{
  id v2 = +[CBAlertManager sharedInstance];
  [v2 showExitConfirmationWithCompletion:0 response:&stru_100079868];
}

- (void)_setupLanguageButton
{
  id v3 = +[UIButtonConfiguration plainButtonConfiguration];
  objc_super v4 = +[UIImage imageNamed:@"LanguageGlyph"];
  [v3 setImage:v4];

  objc_super v5 = [v3 background];
  [v5 setCornerRadius:0.0];

  [v3 setContentInsets:24.0, 6.0, 6.0, 24.0];
  objc_initWeak(&location, self);
  double v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  CGFloat v13 = sub_1000104A4;
  double v14 = &unk_100079890;
  objc_copyWeak(&v15, &location);
  id v6 = +[UIAction actionWithHandler:&v11];
  id v7 = +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v3, v6, v11, v12, v13, v14);
  [(CBOpeningViewController *)self setLanguageButton:v7];

  uint64_t v8 = [(CBOpeningViewController *)self view];
  uint64_t v9 = [(CBOpeningViewController *)self languageButton];
  [v8 addSubview:v9];

  id v10 = [(CBOpeningViewController *)self languageButton];
  [v10 sizeToFit];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)didTappedLanguageSelectorButton
{
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Language Selector] button tapped", v7, 2u);
  }

  objc_super v4 = objc_alloc_init(CBLanguageSelectorViewController);
  objc_super v5 = +[CBLocationController sharedLocationController];
  id v6 = [v5 languageComposite];
  [(CBLanguageSelectorViewController *)v4 setLanguageComposite:v6];

  [(CBOpeningViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (UIButton)languageButton
{
  return self->_languageButton;
}

- (void)setLanguageButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageButton, 0);
  objc_storeStrong((id *)&self->_remoteSetupQRCodeScanner, 0);
  objc_storeStrong((id *)&self->_remoteSetupQRCodeScannerController, 0);
  objc_storeStrong((id *)&self->_remoteSetupConfiguringController, 0);
  objc_storeStrong((id *)&self->_remoteSetupAuthController, 0);
  objc_storeStrong((id *)&self->_remoteSetupManager, 0);
  objc_storeStrong((id *)&self->_deviceInformationView, 0);

  objc_storeStrong((id *)&self->_infoButton, 0);
}

@end