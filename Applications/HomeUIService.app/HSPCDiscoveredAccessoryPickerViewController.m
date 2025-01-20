@interface HSPCDiscoveredAccessoryPickerViewController
- (BOOL)shouldIgnoreFutureAccessorySelection;
- (HSPCDiscoveredAccessoryPickerViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (UIActivityIndicatorView)spinnerView;
- (UIViewController)contentVC;
- (id)commitConfiguration;
- (id)onAccessoryNotListedButton;
- (void)_launchAirportUtility;
- (void)_launchAppStore;
- (void)_presentSoftwareUpdateAlertForAirportExpress;
- (void)configureNextViewController:(id)a3;
- (void)didSelectDiscoveredAccessory:(id)a3;
- (void)didUpdateNumberOfDiscoveredAccessories:(unint64_t)a3;
- (void)setConfig:(id)a3;
- (void)setContentVC:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setShouldIgnoreFutureAccessorySelection:(BOOL)a3;
- (void)setSpinnerView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HSPCDiscoveredAccessoryPickerViewController

- (HSPCDiscoveredAccessoryPickerViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [HSDiscoveredAccessoryPickerViewController alloc];
  v10 = [v7 accessoryBrowser];
  v11 = [v7 entitlementContext];
  v12 = [v7 setupAccessoryDescription];
  v13 = [v7 matterDeviceSetupRequest];
  v14 = [(HSDiscoveredAccessoryPickerViewController *)v9 initWithAccessoryBrowsingManager:v10 entitlementContext:v11 setupAccessoryDescription:v12 matterDeviceSetupRequest:v13];

  v24.receiver = self;
  v24.super_class = (Class)HSPCDiscoveredAccessoryPickerViewController;
  v15 = [(HSPCDiscoveredAccessoryPickerViewController *)&v24 initWithContentView:0];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_coordinator, a3);
    objc_storeStrong((id *)&v16->_config, a4);
    if (([v8 isSetupInitiatedByOtherMatterEcosystem] & 1) != 0
      || ([v7 home], v17 = objc_claimAutoreleasedReturnValue(), v17, !v17))
    {
      v18 = HULocalizedString();
      [(HSPCDiscoveredAccessoryPickerViewController *)v16 setTitle:v18];
    }
    else
    {
      v18 = [v7 home];
      v19 = [v18 name];
      v20 = HULocalizedStringWithFormat();
      -[HSPCDiscoveredAccessoryPickerViewController setTitle:](v16, "setTitle:", v20, v19);
    }
    v21 = sub_100060C64(@"HSSetupCodeSubtitlePickAccessory");
    [(HSPCDiscoveredAccessoryPickerViewController *)v16 setSubtitle:v21];

    [(HSDiscoveredAccessoryPickerViewController *)v14 setDiscoveredAccessoryPickerViewControllerDelegate:v16];
    objc_storeStrong((id *)&v16->_contentVC, v14);
    id v22 = [(HSPCDiscoveredAccessoryPickerViewController *)v16 addProminentButtonWithTitleKey:@"HSDiscoveredAccessoryGridNotListedButton" target:v16 futureSelector:"onAccessoryNotListedButton"];
  }

  return v16;
}

- (id)onAccessoryNotListedButton
{
  v3 = [(HSPCDiscoveredAccessoryPickerViewController *)self coordinator];
  v4 = [v3 didReceiveDiscoveredAccessory:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002EF40;
  v7[3] = &unk_1000A9628;
  v7[4] = self;
  v5 = [v4 flatMap:v7];

  return v5;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000B0280];
}

- (void)configureNextViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v6 = v3;
  if (objc_opt_isKindOfClass()) {
    v4 = v6;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  [v5 setPage:0];
}

- (void)viewDidLoad
{
  v60.receiver = self;
  v60.super_class = (Class)HSPCDiscoveredAccessoryPickerViewController;
  [(HSPCDiscoveredAccessoryPickerViewController *)&v60 viewDidLoad];
  id v3 = [(HSPCDiscoveredAccessoryPickerViewController *)self contentVC];
  [(HSPCDiscoveredAccessoryPickerViewController *)self addChildViewController:v3];

  v4 = [(HSPCDiscoveredAccessoryPickerViewController *)self contentView];
  id v5 = [(HSPCDiscoveredAccessoryPickerViewController *)self contentVC];
  id v6 = [v5 view];
  [v4 addSubview:v6];

  id v7 = [(HSPCDiscoveredAccessoryPickerViewController *)self contentVC];
  [v7 didMoveToParentViewController:self];

  id v57 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  id v8 = [(HSPCDiscoveredAccessoryPickerViewController *)self contentView];
  [v8 addSubview:v57];

  [v57 startAnimating];
  [(HSPCDiscoveredAccessoryPickerViewController *)self setSpinnerView:v57];
  v9 = [(HSPCDiscoveredAccessoryPickerViewController *)self contentView];
  v10 = [v9 mainContentGuide];

  v11 = [(HSPCDiscoveredAccessoryPickerViewController *)self contentVC];
  v12 = [v11 view];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v55 = [(HSPCDiscoveredAccessoryPickerViewController *)self contentVC];
  v53 = [v55 view];
  v51 = [v53 leftAnchor];
  v49 = [v10 leftAnchor];
  v47 = [v51 constraintEqualToAnchor:v49];
  v62[0] = v47;
  v45 = [(HSPCDiscoveredAccessoryPickerViewController *)self contentVC];
  v43 = [v45 view];
  v42 = [v43 topAnchor];
  v40 = [v10 topAnchor];
  v39 = [v42 constraintEqualToAnchor:v40];
  v62[1] = v39;
  v38 = [(HSPCDiscoveredAccessoryPickerViewController *)self contentVC];
  v37 = [v38 view];
  v13 = [v37 rightAnchor];
  v58 = v10;
  v14 = [v10 rightAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v62[2] = v15;
  v16 = [(HSPCDiscoveredAccessoryPickerViewController *)self contentVC];
  v17 = [v16 view];
  v18 = [v17 bottomAnchor];
  v19 = [v10 bottomAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  v62[3] = v20;
  v21 = +[NSArray arrayWithObjects:v62 count:4];
  +[NSLayoutConstraint activateConstraints:v21];

  id v22 = [(HSPCDiscoveredAccessoryPickerViewController *)self spinnerView];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  v56 = [(HSPCDiscoveredAccessoryPickerViewController *)self spinnerView];
  v54 = [v56 centerXAnchor];
  v52 = [v58 centerXAnchor];
  v50 = [v54 constraintEqualToAnchor:v52];
  v61[0] = v50;
  v48 = [(HSPCDiscoveredAccessoryPickerViewController *)self spinnerView];
  v46 = [v48 centerYAnchor];
  v44 = [v58 centerYAnchor];
  v41 = [v46 constraintEqualToAnchor:v44];
  v61[1] = v41;
  v23 = [(HSPCDiscoveredAccessoryPickerViewController *)self spinnerView];
  objc_super v24 = [v23 topAnchor];
  v25 = [v58 topAnchor];
  v26 = [v24 constraintGreaterThanOrEqualToAnchor:v25];
  v61[2] = v26;
  v27 = [(HSPCDiscoveredAccessoryPickerViewController *)self spinnerView];
  v28 = [v27 bottomAnchor];
  v29 = [v58 bottomAnchor];
  v30 = [v28 constraintLessThanOrEqualToAnchor:v29];
  v61[3] = v30;
  v31 = +[NSArray arrayWithObjects:v61 count:4];
  +[NSLayoutConstraint activateConstraints:v31];

  objc_opt_class();
  v32 = [(HSPCDiscoveredAccessoryPickerViewController *)self contentVC];
  if (objc_opt_isKindOfClass()) {
    v33 = v32;
  }
  else {
    v33 = 0;
  }
  id v34 = v33;

  v35 = [v34 hu_preloadContent];

  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10002F624;
  v59[3] = &unk_1000AA2E8;
  v59[4] = self;
  id v36 = [v35 addCompletionBlock:v59];
}

- (void)didSelectDiscoveredAccessory:(id)a3
{
  id v4 = a3;
  if (![(HSPCDiscoveredAccessoryPickerViewController *)self shouldIgnoreFutureAccessorySelection])
  {
    [(HSPCDiscoveredAccessoryPickerViewController *)self setShouldIgnoreFutureAccessorySelection:1];
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "didSelectDiscoveredAccessory, discoveredAccessory %@", buf, 0xCu);
    }

    id v6 = [v4 sharingDevice];

    if (v6)
    {
      id v7 = [(HSPCDiscoveredAccessoryPickerViewController *)self coordinator];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10002F950;
      v25[3] = &unk_1000A9600;
      id v26 = v4;
      v27 = self;
      id v8 = +[NAFuture futureWithBlock:v25];
      [v7 dismissProxCardFlowAfterExecuting:v8];
    }
    else
    {
      if (![v4 requiresSoftwareUpdate]) {
        goto LABEL_10;
      }
      v9 = [v4 accessory];
      v10 = [v9 category];
      v11 = [v10 categoryType];
      unsigned int v12 = [v11 isEqualToString:HMAccessoryCategoryTypeAirPort];

      if (v12)
      {
        [(HSPCDiscoveredAccessoryPickerViewController *)self _presentSoftwareUpdateAlertForAirportExpress];
      }
      else
      {
LABEL_10:
        v13 = [v4 accessory];
        v14 = [v13 category];
        v15 = [v14 categoryType];
        unsigned int v16 = [v15 isEqualToString:HMAccessoryCategoryTypeWiFiRouter];

        v17 = [(HSPCDiscoveredAccessoryPickerViewController *)self coordinator];
        v18 = v17;
        if (v16)
        {
          v19 = [v17 setupAccessoryDescription];

          [v19 hf_updateWithDiscoveredAccessory:v4];
          v20 = [(HSPCDiscoveredAccessoryPickerViewController *)self navigationController];
          v21 = [[HSPCSetupNetworkRouterAppPunchoutViewController alloc] initWithPopupDelegate:0 setupAccessoryDescription:v19];
          [v20 pushViewController:v21 animated:1];
        }
        else
        {
          id v22 = [v17 didReceiveDiscoveredAccessory:v4];
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_10002FB90;
          v24[3] = &unk_1000AA2E8;
          v24[4] = self;
          id v23 = [v22 addCompletionBlock:v24];
        }
      }
    }
  }
}

- (void)didUpdateNumberOfDiscoveredAccessories:(unint64_t)a3
{
  id v4 = [(HSPCDiscoveredAccessoryPickerViewController *)self spinnerView];
  id v5 = v4;
  if (a3) {
    [v4 stopAnimating];
  }
  else {
    [v4 startAnimating];
  }
}

- (void)_presentSoftwareUpdateAlertForAirportExpress
{
  id v3 = +[LSApplicationProxy applicationProxyForIdentifier:@"com.apple.airport.mobileairportutility"];
  id v4 = [v3 appState];
  unsigned int v5 = [v4 isInstalled];

  if (v5) {
    id v6 = @"HSTroubleshootingTipOpenAirPortUtilityTitle";
  }
  else {
    id v6 = @"HSTroubleshootingTipInstallAirPortUtilityTitle";
  }
  if (v5) {
    id v7 = @"HSTroubleshootingTipOpenAirPortUtilityDescription";
  }
  else {
    id v7 = @"HSTroubleshootingTipInstallAirPortUtilityDescription";
  }
  if (v5) {
    id v8 = @"HSTroubleshootingTipOpenAirPortUtilityAction";
  }
  else {
    id v8 = @"HSTroubleshootingTipInstallAirPortUtilityAction";
  }
  v9 = sub_100060C64(v6);
  v10 = sub_100060C64(v7);
  v11 = sub_100060C64(v8);
  unsigned int v12 = +[UIAlertController alertControllerWithTitle:v9 message:v10 preferredStyle:1];
  if (v5)
  {
    v13 = (void ***)v20;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v14 = sub_10002FE68;
  }
  else
  {
    v13 = &v18;
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v14 = sub_10002FE70;
  }
  v13[2] = (void **)v14;
  v13[3] = (void **)&unk_1000A94A8;
  v13[4] = (void **)self;
  v15 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, v18, v19);
  [v12 addAction:v15];

  unsigned int v16 = HULocalizedString();
  v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:&stru_1000AA328];
  [v12 addAction:v17];

  [(HSPCDiscoveredAccessoryPickerViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)_launchAirportUtility
{
  id v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 openApplicationWithBundleID:@"com.apple.airport.mobileairportutility"];
}

- (void)_launchAppStore
{
  id v2 = +[AMSLookup bagSubProfile];
  id v3 = +[AMSLookup bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  id v5 = objc_alloc((Class)AMSLookup);
  id v6 = [v5 initWithBag:v4 caller:HFHomeDomain keyProfile:AMSLookupKeyProfileLockup];
  CFStringRef v9 = @"com.apple.airport.mobileairportutility";
  id v7 = +[NSArray arrayWithObjects:&v9 count:1];
  id v8 = [v6 performLookupWithBundleIdentifiers:v7 itemIdentifiers:0];

  [v8 addFinishBlock:&stru_1000AA368];
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfig:(id)a3
{
}

- (UIViewController)contentVC
{
  return self->_contentVC;
}

- (void)setContentVC:(id)a3
{
}

- (UIActivityIndicatorView)spinnerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spinnerView);

  return (UIActivityIndicatorView *)WeakRetained;
}

- (void)setSpinnerView:(id)a3
{
}

- (BOOL)shouldIgnoreFutureAccessorySelection
{
  return self->_shouldIgnoreFutureAccessorySelection;
}

- (void)setShouldIgnoreFutureAccessorySelection:(BOOL)a3
{
  self->_shouldIgnoreFutureAccessorySelection = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_spinnerView);
  objc_storeStrong((id *)&self->_contentVC, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end