@interface DSSafetyCheckWelcomeController
- (CGRect)_fitFrame:(CGRect)a3 toView:(id)a4;
- (DSPlatterTableView)banner;
- (LARatchetState)ratchetState;
- (NSDictionary)unpresentedResourceDictionary;
- (SCSharingReminderPeerService)daemonConnection;
- (UIWindow)obfuscationWindow;
- (id)specifiers;
- (void)_presentDTOBanner;
- (void)_removeDTOBanner;
- (void)dealloc;
- (void)didEnterForeground:(id)a3;
- (void)didTapLearnMoreLink:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)quickExit;
- (void)ratchetStateDidChange:(id)a3;
- (void)setBanner:(id)a3;
- (void)setDaemonConnection:(id)a3;
- (void)setObfuscationWindow:(id)a3;
- (void)setRatchetState:(id)a3;
- (void)setUnpresentedResourceDictionary:(id)a3;
- (void)startEmergencyResetFlow;
- (void)startManageSharingFlow;
- (void)updateSharingReminders;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willEnterBackground:(id)a3;
@end

@implementation DSSafetyCheckWelcomeController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)DSSafetyCheckWelcomeController;
  [(DSSafetyCheckWelcomeController *)&v9 viewDidLoad];
  v3 = [(DSSafetyCheckWelcomeController *)self navigationItem];
  id v4 = objc_alloc((Class)UIBarButtonItem);
  v5 = DSUILocStringForKey();
  id v6 = [v4 initWithTitle:v5 style:0 target:self action:"quickExit"];
  [v3 setRightBarButtonItem:v6];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"willEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];

  v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"didEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)DSSafetyCheckWelcomeController;
  [(DSSafetyCheckWelcomeController *)&v5 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = objc_opt_new();
    v18 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v18];
    id v6 = +[PSSpecifier preferenceSpecifierNamed:&stru_C660 target:self set:0 get:0 detail:0 cell:4 edit:0];
    Class v7 = NSClassFromString(@"DigitalSeparationSettings.DSSafetyCheckPlacardCell");
    uint64_t v8 = PSCellClassKey;
    [v6 setObject:v7 forKeyedSubscript:PSCellClassKey];
    objc_super v9 = +[NSValue valueWithNonretainedObject:self];
    [v6 setObject:v9 forKeyedSubscript:@"DSSafetyCheckWelcomeCellDelegateKey"];

    [v6 setIdentifier:@"SAFETY_CHECK_PLACARD"];
    [v5 addObject:v6];
    v10 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v10];
    v11 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
    [v11 setObject:objc_opt_class() forKeyedSubscript:v8];
    v12 = +[NSValue valueWithNonretainedObject:self];
    [v11 setObject:v12 forKeyedSubscript:@"DSSafetyCheckWelcomeCellDelegateKey"];

    [v11 setIdentifier:@"EMERGENCYRESET"];
    [v11 setButtonAction:"startEmergencyResetFlow"];
    [v5 addObject:v11];
    v13 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v13];
    v14 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
    [v14 setObject:objc_opt_class() forKeyedSubscript:v8];
    v15 = +[NSValue valueWithNonretainedObject:self];
    [v14 setObject:v15 forKeyedSubscript:@"DSSafetyCheckWelcomeCellDelegateKey"];

    [v14 setIdentifier:@"MANAGESHARING"];
    [v14 setButtonAction:"startManageSharingFlow"];
    [v5 addObject:v14];
    v16 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)willEnterBackground:(id)a3
{
  if (!self->_obfuscationWindow)
  {
    id v4 = [(DSSafetyCheckWelcomeController *)self view];
    objc_super v5 = [v4 window];
    id v6 = +[DSObfuscationWindow showDSObfuscationWindowForApplicationWindow:v5];
    obfuscationWindow = self->_obfuscationWindow;
    self->_obfuscationWindow = v6;

    unpresentedResourceDictionary = self->_unpresentedResourceDictionary;
    self->_unpresentedResourceDictionary = 0;
  }
}

- (void)didEnterForeground:(id)a3
{
  obfuscationWindow = self->_obfuscationWindow;
  if (obfuscationWindow)
  {
    [(UIWindow *)obfuscationWindow setHidden:1];
    objc_super v5 = self->_obfuscationWindow;
    self->_obfuscationWindow = 0;
  }
}

- (void)quickExit
{
  v2 = [(DSSafetyCheckWelcomeController *)self view];
  uint64_t v3 = [v2 window];
  id v7 = [v3 windowScene];

  id v4 = [v7 _FBSScene];
  id v5 = [objc_alloc((Class)UIDestroySceneAction) initWithPreferredAnimationType:1 callbackQueue:&_dispatch_main_q completion:&stru_C440];
  id v6 = +[NSSet setWithObject:v5];
  [v4 sendActions:v6];
}

- (void)didTapLearnMoreLink:(id)a3
{
  AnalyticsSendEventLazy();
  DSUIFeatureTable();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = DSUILocStringForKeyInTable();
  +[DSSafetyCheck showlearnMoreForPresentingViewController:self withURL:v4];
}

- (void)startEmergencyResetFlow
{
  uint64_t v3 = [(DSSafetyCheckWelcomeController *)self unpresentedResourceDictionary];

  if (v3)
  {
    uint64_t v4 = [(DSSafetyCheckWelcomeController *)self unpresentedResourceDictionary];
    id v5 = [(id)v4 objectForKeyedSubscript:@"path"];
    id v6 = +[NSString stringWithFormat:@"EMERGENCY_RESET/%@", v5];

    CFStringRef v8 = @"path";
    objc_super v9 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    LOBYTE(v4) = +[DSSafetyCheck startWithPresentingViewController:self withURL:v7];

    if (v4)
    {
      NSLog(@"Presenting resource dictionary with path: %@", v6);

      return;
    }
    NSLog(@"Can't form presentation for path %@, sending user through standard E.R. entrypoint", v6);
    [(DSSafetyCheckWelcomeController *)self setUnpresentedResourceDictionary:0];
  }
  +[DSSafetyCheck startEmergencyResetWithPresentingViewController:self];
}

- (void)startManageSharingFlow
{
  uint64_t v3 = [(DSSafetyCheckWelcomeController *)self unpresentedResourceDictionary];

  if (v3)
  {
    uint64_t v4 = [(DSSafetyCheckWelcomeController *)self unpresentedResourceDictionary];
    id v5 = [(id)v4 objectForKeyedSubscript:@"path"];
    id v6 = +[NSString stringWithFormat:@"MANAGE_SHARING/%@", v5];

    CFStringRef v8 = @"path";
    objc_super v9 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    LOBYTE(v4) = +[DSSafetyCheck startWithPresentingViewController:self withURL:v7];

    if (v4)
    {
      NSLog(@"Presenting for resource dictionary with path: %@", v6);

      return;
    }
    NSLog(@"Can't form presentation for path %@, sending user through standard entrypoint", v6);
    [(DSSafetyCheckWelcomeController *)self setUnpresentedResourceDictionary:0];
  }
  +[DSSafetyCheck startManageSharingWithPresentingViewController:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v5 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = [(DSSafetyCheckWelcomeController *)self presentedViewController];
  [v5 removeObserver:v4 name:UIApplicationWillEnterForegroundNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DSSafetyCheckWelcomeController;
  [(DSSafetyCheckWelcomeController *)&v7 viewWillAppear:a3];
  uint64_t v4 = [(DSSafetyCheckWelcomeController *)self daemonConnection];

  if (!v4) {
    [(DSSafetyCheckWelcomeController *)self updateSharingReminders];
  }
  if (+[DSUtilities shouldShowBioRatchetFlow])
  {
    id v5 = +[LARatchetManager sharedInstance];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_5EB0;
    v6[3] = &unk_C4A8;
    v6[4] = self;
    [v5 stateWithCompletion:v6];
  }
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)DSSafetyCheckWelcomeController;
  [(DSSafetyCheckWelcomeController *)&v8 viewWillLayoutSubviews];
  if (+[DSUtilities shouldShowBioRatchetFlow])
  {
    uint64_t v3 = [(DSSafetyCheckWelcomeController *)self ratchetState];
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      id v5 = [(DSSafetyCheckWelcomeController *)self ratchetState];
      if ([v5 rawValue])
      {
        id v6 = [(DSSafetyCheckWelcomeController *)self ratchetState];
        objc_super v7 = (char *)[v6 rawValue];

        if (v7 != (unsigned char *)&dword_0 + 1) {
          return;
        }
      }
      else
      {
      }
      [(DSSafetyCheckWelcomeController *)self _presentDTOBanner];
    }
  }
}

- (void)_presentDTOBanner
{
  banner = self->_banner;
  if (!banner)
  {
    uint64_t v4 = +[DSPlatterTableView bannerWithPresentingViewController:self];
    id v5 = self->_banner;
    self->_banner = v4;

    banner = self->_banner;
  }
  id v6 = [(DSSafetyCheckWelcomeController *)self table];
  [v6 setTableHeaderView:banner];

  objc_super v7 = [(DSPlatterTableView *)self->_banner widthAnchor];
  objc_super v8 = [(DSSafetyCheckWelcomeController *)self table];
  objc_super v9 = [v8 widthAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  v11 = [(DSSafetyCheckWelcomeController *)self table];
  v12 = [v11 tableHeaderView];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(DSSafetyCheckWelcomeController *)self banner];
  -[DSSafetyCheckWelcomeController _fitFrame:toView:](self, "_fitFrame:toView:", v21, v14, v16, v18, v20);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v30 = [(DSSafetyCheckWelcomeController *)self table];
  v31 = [v30 tableHeaderView];
  objc_msgSend(v31, "setFrame:", v23, v25, v27, v29);

  id v50 = [(DSSafetyCheckWelcomeController *)self table];
  [v50 frame];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  v40 = [(DSSafetyCheckWelcomeController *)self table];
  -[DSSafetyCheckWelcomeController _fitFrame:toView:](self, "_fitFrame:toView:", v40, v33, v35, v37, v39);
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  v49 = [(DSSafetyCheckWelcomeController *)self table];
  objc_msgSend(v49, "setFrame:", v42, v44, v46, v48);
}

- (CGRect)_fitFrame:(CGRect)a3 toView:(id)a4
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_msgSend(a4, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  if (v8 == height) {
    double v9 = height;
  }
  else {
    double v9 = v8;
  }
  double v10 = x;
  double v11 = y;
  double v12 = width;
  result.size.double height = v9;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (void)_removeDTOBanner
{
  [(DSSafetyCheckWelcomeController *)self setBanner:0];
  uint64_t v3 = [(DSSafetyCheckWelcomeController *)self table];
  [v3 setTableHeaderView:0];

  [(DSSafetyCheckWelcomeController *)self viewWillLayoutSubviews];
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(void))a4;
  v8.receiver = self;
  v8.super_class = (Class)DSSafetyCheckWelcomeController;
  [(DSSafetyCheckWelcomeController *)&v8 handleURL:v6 withCompletion:&stru_C4E8];
  [(DSSafetyCheckWelcomeController *)self setUnpresentedResourceDictionary:0];
  if ((+[DSSafetyCheck startWithPresentingViewController:self withURL:v6] & 1) == 0)
  {
    NSLog(@"Not presenting flow for resource dictionary %@", v6);
    [(DSSafetyCheckWelcomeController *)self setUnpresentedResourceDictionary:v6];
  }
  if (v7) {
    v7[2](v7);
  }
}

- (void)updateSharingReminders
{
  id v3 = [objc_alloc((Class)SCSharingReminderPeerService) initConnection];
  [(DSSafetyCheckWelcomeController *)self setDaemonConnection:v3];

  objc_initWeak(&location, self);
  uint64_t v4 = [(DSSafetyCheckWelcomeController *)self daemonConnection];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_644C;
  v5[3] = &unk_C510;
  objc_copyWeak(&v6, &location);
  [v4 userOpenedSafetyCheckWithCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)ratchetStateDidChange:(id)a3
{
  id v4 = a3;
  [(DSSafetyCheckWelcomeController *)self setRatchetState:v4];
  if ([v4 rawValue] && objc_msgSend(v4, "rawValue") != (char *)&dword_0 + 1) {
    [(DSSafetyCheckWelcomeController *)self _removeDTOBanner];
  }
  else {
    [(DSSafetyCheckWelcomeController *)self _presentDTOBanner];
  }
}

- (UIWindow)obfuscationWindow
{
  return self->_obfuscationWindow;
}

- (void)setObfuscationWindow:(id)a3
{
}

- (SCSharingReminderPeerService)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
}

- (NSDictionary)unpresentedResourceDictionary
{
  return self->_unpresentedResourceDictionary;
}

- (void)setUnpresentedResourceDictionary:(id)a3
{
}

- (DSPlatterTableView)banner
{
  return self->_banner;
}

- (void)setBanner:(id)a3
{
}

- (LARatchetState)ratchetState
{
  return self->_ratchetState;
}

- (void)setRatchetState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratchetState, 0);
  objc_storeStrong((id *)&self->_banner, 0);
  objc_storeStrong((id *)&self->_unpresentedResourceDictionary, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);

  objc_storeStrong((id *)&self->_obfuscationWindow, 0);
}

@end