@interface BuddyAppleIDChoiceController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (AASetupAssistantConfigResponse)urlConfiguration;
- (BFFFlowItemDelegate)delegate;
- (BOOL)allowBack;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)didShowWifiAlert;
- (BOOL)shouldAllowStartOver;
- (BOOL)shouldShowWifiIfCancellingSkipAlert;
- (BYAnalyticsManager)analyticsManager;
- (BYFlowSkipController)flowSkipController;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BYPreferencesController)buddyPreferences;
- (BYRunState)runState;
- (BuddyAppleIDChoiceController)init;
- (BuddyAppleIDController)appleIDController;
- (BuddyCombinedTermsProvider)combinedTermsProvider;
- (BuddyNetworkProvider)networkProvider;
- (NSArray)itemDescriptions;
- (NSArray)itemIcons;
- (ProximitySetupController)proximitySetupController;
- (UIStackView)serviceHeaderView;
- (UITableViewCell)createNewCell;
- (UITableViewCell)forgotCell;
- (UITableViewCell)skipCell;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)showModalWiFiSettingsBlock;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4;
- (void)_createServiceHeader;
- (void)_reallySkip;
- (void)_skipPressed:(id)a3;
- (void)appleIDController:(id)a3 failedWithError:(id)a4;
- (void)appleIDControllerFinished:(id)a3;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAllowBack:(BOOL)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setAppleIDController:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setCombinedTermsProvider:(id)a3;
- (void)setCreateNewCell:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidShowWifiAlert:(BOOL)a3;
- (void)setFlowSkipController:(id)a3;
- (void)setForgotCell:(id)a3;
- (void)setItemDescriptions:(id)a3;
- (void)setItemIcons:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRunState:(id)a3;
- (void)setServiceHeaderView:(id)a3;
- (void)setShouldShowWifiIfCancellingSkipAlert:(BOOL)a3;
- (void)setShowModalWiFiSettingsBlock:(id)a3;
- (void)setSkipCell:(id)a3;
- (void)setUrlConfiguration:(id)a3;
- (void)startOver;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyAppleIDChoiceController

- (BuddyAppleIDChoiceController)init
{
  SEL v8 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"APPLEID_TITLE_LABEL" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyAppleIDChoiceController;
  id location = [(BuddyAppleIDChoiceController *)&v7 initWithTitle:v4 detailText:0 icon:0 adoptTableViewScrollView:1];
  objc_storeStrong(&location, location);

  v5 = (BuddyAppleIDChoiceController *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)viewDidLoad
{
  objc_super v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyAppleIDChoiceController;
  [(BuddyAppleIDChoiceController *)&v5 viewDidLoad];
  id v2 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(BuddyAppleIDChoiceController *)v7 setTableView:v2];

  v3 = v7;
  id v4 = [(BuddyAppleIDChoiceController *)v7 tableView];
  [v4 setDataSource:v3];

  [(BuddyAppleIDChoiceController *)v7 _createServiceHeader];
}

- (void)didMoveToParentViewController:(id)a3
{
  SEL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyAppleIDChoiceController *)v6 appleIDController];
  id v4 = [(BuddyAppleIDChoiceController *)v6 navigationController];
  [(BuddyAppleIDController *)v3 setNavigationController:v4];

  objc_storeStrong(location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v41 = self;
  SEL v40 = a2;
  BOOL v39 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BuddyAppleIDChoiceController;
  [(BuddyAppleIDChoiceController *)&v38 viewDidAppear:a3];
  id v3 = [(BuddyAppleIDChoiceController *)v41 tableView];
  id v37 = [v3 indexPathForSelectedRow];

  if (v37)
  {
    id v4 = [(BuddyAppleIDChoiceController *)v41 tableView];
    [v4 deselectRowAtIndexPath:v37 animated:1];
  }
  id v5 = +[LSApplicationWorkspace defaultWorkspace];
  [v5 enumerateBundlesOfType:1 block:&stru_1002B2DD0];

  SEL v6 = [(BuddyAppleIDChoiceController *)v41 networkProvider];
  char v35 = 0;
  unsigned __int8 v7 = 0;
  if (![(BuddyNetworkProvider *)v6 networkReachable])
  {
    unsigned __int8 v7 = 0;
    if (![(BuddyAppleIDChoiceController *)v41 didShowWifiAlert])
    {
      id v36 = [(BuddyAppleIDChoiceController *)v41 networkProvider];
      char v35 = 1;
      unsigned __int8 v7 = [v36 supportsWiFi];
    }
  }
  if (v35) {

  }
  if (v7)
  {
    [(BuddyAppleIDChoiceController *)v41 setDidShowWifiAlert:1];
    SEL v8 = +[NSBundle mainBundle];
    v9 = [(NSBundle *)v8 localizedStringForKey:@"APPLEID_NO_NETWORK_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
    v10 = +[NSBundle mainBundle];
    id v11 = (id)SFLocalizableWAPIStringKeyForKey();
    v12 = [(NSBundle *)v10 localizedStringForKey:v11 value:&stru_1002B4E18 table:@"Localizable"];
    id location = +[UIAlertController alertControllerWithTitle:v9 message:v12 preferredStyle:1];

    id v13 = location;
    v14 = +[NSBundle mainBundle];
    id v15 = (id)SFLocalizableWAPIStringKeyForKey();
    v16 = [(NSBundle *)v14 localizedStringForKey:v15 value:&stru_1002B4E18 table:@"Localizable"];
    v28 = _NSConcreteStackBlock;
    int v29 = -1073741824;
    int v30 = 0;
    v31 = sub_1000F4374;
    v32 = &unk_1002B1040;
    v33 = v41;
    v17 = +[UIAlertAction actionWithTitle:v16 style:0 handler:&v28];
    [v13 addAction:v17];

    id v18 = location;
    v19 = +[NSBundle mainBundle];
    v20 = [(NSBundle *)v19 localizedStringForKey:@"CONTINUE" value:&stru_1002B4E18 table:@"Localizable"];
    v22 = _NSConcreteStackBlock;
    int v23 = -1073741824;
    int v24 = 0;
    v25 = sub_1000F43E8;
    v26 = &unk_1002B1040;
    v27 = v41;
    v21 = +[UIAlertAction actionWithTitle:v20 style:0 handler:&v22];
    [v18 addAction:v21];

    [(BuddyAppleIDChoiceController *)v41 presentViewController:location animated:1 completion:0];
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong((id *)&v33, 0);
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v37, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  SEL v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  id v3 = [(BuddyAppleIDChoiceController *)self tableView];
  [v3 selectRowAtIndexPath:0 animated:0 scrollPosition:0];

  [(BuddyAppleIDChoiceController *)v8 setAllowBack:1];
  id v4 = [(BuddyAppleIDChoiceController *)v8 paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v4 clearActionForFeature:14];

  v5.receiver = v8;
  v5.super_class = (Class)BuddyAppleIDChoiceController;
  [(BuddyAppleIDChoiceController *)&v5 viewWillAppear:v6];
}

- (void)dealloc
{
  objc_super v5 = self;
  SEL v4 = a2;
  id v2 = [(BuddyAppleIDChoiceController *)self appleIDController];
  [(BuddyAppleIDController *)v2 setDelegate:0];

  v3.receiver = v5;
  v3.super_class = (Class)BuddyAppleIDChoiceController;
  [(BuddyAppleIDChoiceController *)&v3 dealloc];
}

- (void)_createServiceHeader
{
  id v72 = self;
  SEL v71 = a2;
  v64 = _NSConcreteStackBlock;
  int v65 = -1073741824;
  int v66 = 0;
  v67 = sub_1000F510C;
  v68 = &unk_1002B2DF8;
  v69 = self;
  id v70 = objc_retainBlock(&v64);
  id v60 = (id)(*((uint64_t (**)(id, const __CFString *))v70 + 2))(v70, @"iCloud");
  v58 = +[UIImage imageNamed:](UIImage, "imageNamed:");
  v74[0] = v58;
  id v56 = (id)(*((uint64_t (**)(id, const __CFString *))v70 + 2))(v70, @"App_Store");
  v54 = +[UIImage imageNamed:](UIImage, "imageNamed:");
  v74[1] = v54;
  id v52 = (id)(*((uint64_t (**)(id, const __CFString *))v70 + 2))(v70, @"iMovies");
  id v2 = +[UIImage imageNamed:](UIImage, "imageNamed:");
  v74[2] = v2;
  id v3 = (id)(*((uint64_t (**)(id, const __CFString *))v70 + 2))(v70, @"Photos");
  SEL v4 = +[UIImage imageNamed:v3];
  v74[3] = v4;
  id v5 = (id)(*((uint64_t (**)(id, const __CFString *))v70 + 2))(v70, @"Messages");
  BOOL v6 = +[UIImage imageNamed:v5];
  v74[4] = v6;
  id v7 = (id)(*((uint64_t (**)(id, const __CFString *))v70 + 2))(v70, @"Facetime");
  SEL v8 = +[UIImage imageNamed:v7];
  v74[5] = v8;
  id v9 = (id)(*((uint64_t (**)(id, const __CFString *))v70 + 2))(v70, @"Books");
  v10 = +[UIImage imageNamed:v9];
  v74[6] = v10;
  id v11 = +[NSArray arrayWithObjects:v74 count:7];
  [v72 setItemIcons:v11];

  v61 = +[NSBundle mainBundle];
  v59 = [(NSBundle *)v61 localizedStringForKey:@"APPLEID_WHAT_IS_ICLOUD" value:&stru_1002B4E18 table:@"Localizable"];
  v73[0] = v59;
  v57 = +[NSBundle mainBundle];
  v55 = [(NSBundle *)v57 localizedStringForKey:@"APPLEID_WHAT_IS_APP_STORE" value:&stru_1002B4E18 table:@"Localizable"];
  v73[1] = v55;
  v53 = +[NSBundle mainBundle];
  v12 = [(NSBundle *)v53 localizedStringForKey:@"APPLEID_WHAT_IS_ITUNES_STORE" value:&stru_1002B4E18 table:@"Localizable"];
  v73[2] = v12;
  id v13 = +[NSBundle mainBundle];
  v14 = [(NSBundle *)v13 localizedStringForKey:@"APPLEID_WHAT_IS_PHOTOS" value:&stru_1002B4E18 table:@"Localizable"];
  v73[3] = v14;
  id v15 = +[NSBundle mainBundle];
  v16 = [(NSBundle *)v15 localizedStringForKey:@"APPLEID_WHAT_IS_MESSAGES" value:&stru_1002B4E18 table:@"Localizable"];
  v73[4] = v16;
  v17 = +[NSBundle mainBundle];
  id v18 = [(NSBundle *)v17 localizedStringForKey:@"APPLEID_WHAT_IS_FACETIME" value:&stru_1002B4E18 table:@"Localizable"];
  v73[5] = v18;
  v19 = +[NSBundle mainBundle];
  v20 = [(NSBundle *)v19 localizedStringForKey:@"APPLEID_WHAT_IS_IBOOKS" value:&stru_1002B4E18 table:@"Localizable"];
  v73[6] = v20;
  v21 = +[NSArray arrayWithObjects:v73 count:7];
  [v72 setItemDescriptions:v21];

  id v22 = [v72 itemIcons];
  id v23 = [v22 count];
  id v24 = [v72 itemDescriptions];
  BOOL v25 = v23 != [v24 count];

  if (v25)
  {
    v26 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v26 handleFailureInMethod:v71 object:v72 file:@"BuddyAppleIDChoiceController.m" lineNumber:170 description:@"items count not the same!"];
  }
  id v27 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v72 setServiceHeaderView:v27];

  id v28 = [v72 serviceHeaderView];
  [v28 setAxis:1];

  id v29 = [v72 serviceHeaderView];
  [v29 setDistribution:0];

  id v30 = [v72 serviceHeaderView];
  [v30 setAlignment:0];

  id v63 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v63 setNumberOfLines:0];
  v31 = +[NSBundle mainBundle];
  v32 = [(NSBundle *)v31 localizedStringForKey:@"APPLEID_WHAT_IS" value:&stru_1002B4E18 table:@"Localizable"];
  [v63 setText:v32];

  v33 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle3];
  v34 = [(UIFontDescriptor *)v33 fontDescriptorWithSymbolicTraits:2];
  char v35 = +[UIFont fontWithDescriptor:v34 size:0.0];
  [v63 setFont:v35];

  id v36 = +[UIColor labelColor];
  [v63 setTextColor:v36];

  id location = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [location setNumberOfLines:0];
  id v37 = +[NSBundle mainBundle];
  objc_super v38 = [(NSBundle *)v37 localizedStringForKey:@"APPLEID_WHAT_IS_DETAIL" value:&stru_1002B4E18 table:@"Localizable"];
  [location setText:v38];

  BOOL v39 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
  SEL v40 = +[UIFont fontWithDescriptor:v39 size:0.0];
  [location setFont:v40];

  v41 = +[UIColor labelColor];
  [location setTextColor:v41];

  id v42 = [v72 serviceHeaderView];
  [v42 addArrangedSubview:v63];

  id v43 = [v72 serviceHeaderView];
  [v43 setCustomSpacing:v63 afterView:10.0];

  id v44 = [v72 serviceHeaderView];
  [v44 addArrangedSubview:location];

  id v45 = [v72 serviceHeaderView];
  char v46 = BFFIsiPad();
  double v47 = 39.0;
  if ((v46 & 1) == 0) {
    double v47 = 30.0;
  }
  [v45 setCustomSpacing:location afterView:v47];

  id v48 = [v72 serviceHeaderView];
  v49 = objc_opt_new();
  [v48 addArrangedSubview:v49];

  LODWORD(v50) = 1148846080;
  [v63 setContentCompressionResistancePriority:1 forAxis:v50];
  LODWORD(v51) = 1148846080;
  [location setContentCompressionResistancePriority:1 forAxis:v51];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(&v70, 0);
  objc_storeStrong((id *)&v69, 0);
}

- (void)_skipPressed:(id)a3
{
  id v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v41 = (id)_BYLoggingFacility();
  os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v41;
    os_log_type_t v4 = v40;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "User specified skip Apple ID setup", buf, 2u);
  }
  objc_storeStrong(&v41, 0);
  id v5 = [(BuddyAppleIDChoiceController *)v43 networkProvider];
  unsigned __int8 v6 = [(BuddyNetworkProvider *)v5 networkReachable];

  if (v6)
  {
    id v38 = @"NO_ACCOUNT_SKIP_APPLEID_ALERT_BODY_STOCKHOLM";
    id v7 = +[SSAccountStore defaultStore];
    id v8 = [v7 activeAccount];
    id v9 = [v8 accountName];
    id v10 = [v9 length];

    if (v10) {
      objc_storeStrong(&v38, @"HAS_STORE_ACCOUNT_SKIP_APPLEID_ALERT_BODY_STOCKHOLM");
    }
    id v11 = +[NSBundle mainBundle];
    id v37 = [(NSBundle *)v11 localizedStringForKey:v38 value:&stru_1002B4E18 table:@"Localizable"];

    v12 = +[NSBundle mainBundle];
    id v13 = [(NSBundle *)v12 localizedStringForKey:@"NO_ACCOUNT_SKIP_APPLEID_ALERT_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
    id v36 = +[UIAlertController alertControllerWithTitle:v13 message:v37 preferredStyle:1];

    id v14 = v36;
    id v15 = +[NSBundle mainBundle];
    v16 = [(NSBundle *)v15 localizedStringForKey:@"DONT_USE" value:&stru_1002B4E18 table:@"Localizable"];
    id v30 = _NSConcreteStackBlock;
    int v31 = -1073741824;
    int v32 = 0;
    v33 = sub_1000F56E8;
    v34 = &unk_1002B1040;
    char v35 = v43;
    v17 = +[UIAlertAction actionWithTitle:v16 style:0 handler:&v30];
    [v14 addAction:v17];

    id v18 = v36;
    v19 = +[NSBundle mainBundle];
    v20 = [(NSBundle *)v19 localizedStringForKey:@"DONT_SKIP_APPLEID" value:&stru_1002B4E18 table:@"Localizable"];
    id v24 = _NSConcreteStackBlock;
    int v25 = -1073741824;
    int v26 = 0;
    id v27 = sub_1000F57C4;
    id v28 = &unk_1002B1040;
    id v29 = v43;
    v21 = +[UIAlertAction actionWithTitle:v20 style:1 handler:&v24];
    [v18 addAction:v21];

    [(BuddyAppleIDChoiceController *)v43 presentViewController:v36 animated:1 completion:0];
    id v22 = [(BuddyAppleIDChoiceController *)v43 combinedTermsProvider];
    [(BuddyCombinedTermsProvider *)v22 prefetchTerms];

    objc_storeStrong((id *)&v29, 0);
    objc_storeStrong((id *)&v35, 0);
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
  }
  else
  {
    id v23 = [(BuddyAppleIDChoiceController *)v43 delegate];
    [(BFFFlowItemDelegate *)v23 flowItemDone:v43];
  }
  objc_storeStrong(location, 0);
}

- (void)_reallySkip
{
  id v2 = +[BuddyAccountTools sharedBuddyAccountTools];
  [v2 primaryAccountIsChildAccount:0];

  id v3 = +[BuddyAccountTools sharedBuddyAccountTools];
  [v3 getConfigurationInfoWithCompletion:0];

  os_log_type_t v4 = [(BuddyAppleIDChoiceController *)self flowSkipController];
  [(BYFlowSkipController *)v4 didSkipFlow:BYFlowSkipIdentifierAppleID];

  id v5 = [(BuddyAppleIDChoiceController *)self paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v5 recordActionWithValue:&__kCFBooleanFalse forFeature:14];

  unsigned __int8 v6 = [(BuddyAppleIDChoiceController *)self delegate];
  [(BFFFlowItemDelegate *)v6 flowItemDone:self];
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupAppleID;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [BuddyAppleIDController alloc];
  os_log_type_t v4 = [(BuddyAppleIDChoiceController *)v22 passcodeCacheManager];
  id v5 = [(BuddyAppleIDChoiceController *)v22 analyticsManager];
  unsigned __int8 v6 = [(BuddyAppleIDChoiceController *)v22 runState];
  id v7 = +[BuddyFeatureFlags currentFlags];
  id v8 = [(BuddyAppleIDController *)v3 initWithAccount:0 passcodeCacheManager:v4 analyticsManager:v5 runState:v6 featureFlags:v7];
  [(BuddyAppleIDChoiceController *)v22 setAppleIDController:v8];

  [(BuddyAppleIDController *)v22->_appleIDController setDelegate:v22];
  id v9 = [(BuddyAppleIDChoiceController *)v22 delegate];
  [(BuddyAppleIDController *)v22->_appleIDController setFlowItemDelegate:v9];

  id v10 = [(BuddyAppleIDChoiceController *)v22 proximitySetupController];
  unsigned __int8 v11 = [(ProximitySetupController *)v10 hasConnection];
  [(BuddyAppleIDController *)v22->_appleIDController setHasProximityConnection:v11 & 1];

  v12 = [(BuddyAppleIDChoiceController *)v22 networkProvider];
  LOBYTE(v8) = [(BuddyNetworkProvider *)v12 networkReachable];

  if (v8)
  {
    id v13 = +[BuddyAppleIDConfigurationManager sharedManager];
    id v14 = _NSConcreteStackBlock;
    int v15 = -1073741824;
    int v16 = 0;
    v17 = sub_1000F5CFC;
    id v18 = &unk_1002B2E20;
    v19 = v22;
    id v20 = location[0];
    [v13 getURLConfigurationWithHandler:&v14];

    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v19, 0);
  }
  else if (location[0])
  {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  }
  objc_storeStrong(location, 0);
}

- (void)startOver
{
  self->_didShowWifiAlert = 0;
}

- (BOOL)shouldAllowStartOver
{
  id v2 = [(BuddyAppleIDChoiceController *)self appleIDController];
  char v3 = ![(BuddyAppleIDController *)v2 shouldAllowStartOver];

  return (v3 & 1) == 0;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return [(BuddyAppleIDChoiceController *)self allowBack];
}

- (void)setDelegate:(id)a3
{
  unsigned __int8 v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v6->_delegate, location[0]);
  id v3 = location[0];
  os_log_type_t v4 = [(BuddyAppleIDChoiceController *)v6 appleIDController];
  [(BuddyAppleIDController *)v4 setFlowItemDelegate:v3];

  objc_storeStrong(location, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v6 = 0;
  if (a4)
  {
    if (a4 == 1) {
      int64_t v6 = 1;
    }
  }
  else
  {
    int64_t v6 = 3;
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v53 = 0;
  objc_storeStrong(&v53, a4);
  id v52 = [v53 row];
  id v5 = [v53 section];
  if (v5)
  {
    if (v5 == (id)1)
    {
      uint64_t v49 = 1;
      id v34 = +[BYDevice currentDevice];
      id v35 = [v34 type];

      if (v35 == (id)1) {
        uint64_t v49 = 2;
      }
      id v48 = [location[0] dequeueReusableCellWithIdentifier:@"CELL"];
      if (!v48)
      {
        id v48 = [[BuddyAppleIDTableCell alloc] initWithStyle:0 reuseIdentifier:@"CELL" columnCount:v49];

        id v36 = +[UIColor clearColor];
        [v48 setBackgroundColor:v36];

        for (unint64_t i = 0; ; ++i)
        {
          unint64_t v37 = i;
          if (v37 >= [(NSArray *)v55->_itemIcons count]) {
            break;
          }
          id v46 = [(NSArray *)v55->_itemIcons objectAtIndexedSubscript:i];
          id v45 = [(NSArray *)v55->_itemDescriptions objectAtIndexedSubscript:i];
          id v38 = [v48 addService:v46 description:v45];
          objc_storeStrong(&v45, 0);
          objc_storeStrong(&v46, 0);
        }
        if (v49 == 2 && ([(NSArray *)v55->_itemIcons count] & 1) != 0)
        {
          id v44 = 0;
          id v44 = (char *)[(NSArray *)v55->_itemIcons count] - 1;
          id v43 = [(NSArray *)v55->_itemIcons objectAtIndexedSubscript:v44];
          id v42 = [(NSArray *)v55->_itemDescriptions objectAtIndexedSubscript:v44];
          id v41 = [v48 addService:v43 description:v42];
          [v41 setAlpha:0.0];
          objc_storeStrong(&v41, 0);
          objc_storeStrong(&v42, 0);
          objc_storeStrong(&v43, 0);
        }
      }
      id v56 = v48;
      int v50 = 1;
      objc_storeStrong(&v48, 0);
    }
    else
    {
      int v50 = 0;
    }
  }
  else
  {
    id v51 = 0;
    if (v52)
    {
      if (v52 == (id)1)
      {
        int v15 = [(BuddyAppleIDChoiceController *)v55 createNewCell];
        BOOL v16 = v15 == 0;

        if (v16)
        {
          v17 = [[BuddySetupTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
          [(BuddyAppleIDChoiceController *)v55 setCreateNewCell:v17];

          id v18 = +[NSBundle mainBundle];
          v19 = [(NSBundle *)v18 localizedStringForKey:@"CREATE_NEW_APPLEID" value:&stru_1002B4E18 table:@"Localizable"];
          id v20 = [(BuddyAppleIDChoiceController *)v55 createNewCell];
          v21 = [(UITableViewCell *)v20 textLabel];
          [(UILabel *)v21 setText:v19];
        }
        id v22 = [(BuddyAppleIDChoiceController *)v55 createNewCell];
        id v23 = v51;
        id v51 = v22;
      }
      else if (v52 == (id)2)
      {
        id v24 = [(BuddyAppleIDChoiceController *)v55 skipCell];
        BOOL v25 = v24 == 0;

        if (v25)
        {
          int v26 = [[BuddySetupTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
          [(BuddyAppleIDChoiceController *)v55 setSkipCell:v26];

          id v27 = +[NSBundle mainBundle];
          id v28 = [(NSBundle *)v27 localizedStringForKey:@"SKIP_ENTER_APPLEID" value:&stru_1002B4E18 table:@"Localizable"];
          id v29 = [(BuddyAppleIDChoiceController *)v55 skipCell];
          id v30 = [(UITableViewCell *)v29 textLabel];
          [(UILabel *)v30 setText:v28];
        }
        int v31 = [(BuddyAppleIDChoiceController *)v55 skipCell];
        id v32 = v51;
        id v51 = v31;
      }
    }
    else
    {
      int64_t v6 = [(BuddyAppleIDChoiceController *)v55 forgotCell];
      BOOL v7 = v6 == 0;

      if (v7)
      {
        id v8 = [[BuddySetupTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
        [(BuddyAppleIDChoiceController *)v55 setForgotCell:v8];

        id v9 = +[NSBundle mainBundle];
        id v10 = [(NSBundle *)v9 localizedStringForKey:@"FORGOT_PASSWORD" value:&stru_1002B4E18 table:@"Localizable"];
        unsigned __int8 v11 = [(BuddyAppleIDChoiceController *)v55 forgotCell];
        v12 = [(UITableViewCell *)v11 textLabel];
        [(UILabel *)v12 setText:v10];
      }
      id v13 = [(BuddyAppleIDChoiceController *)v55 forgotCell];
      id v14 = v51;
      id v51 = v13;
    }
    v33 = +[UIColor secondarySystemBackgroundColor];
    [v51 setBackgroundColor:v33];

    id v56 = v51;
    int v50 = 1;
    objc_storeStrong(&v51, 0);
  }
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);
  BOOL v39 = v56;

  return v39;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  if ([v8 section] == (id)1)
  {
    [v9 setSeparatorStyle:0];
  }
  else
  {
    [v9 setSeparatorStyle:1];
    [v9 _setShouldHaveFullLengthTopSeparator:0];
    [v9 _setShouldHaveFullLengthBottomSeparator:0];
  }
  if ([v8 section] == (id)1)
  {
    id v7 = [v9 layer];
    [v7 setMasksToBounds:0];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  double v10 = 0.0;
  id v5 = [v11 section];
  if (v5)
  {
    if (v5 == (id)1) {
      double v10 = UITableViewAutomaticDimension;
    }
  }
  else
  {
    double v10 = 60.0;
    id v6 = [(BuddyAppleIDChoiceController *)v13 tableView:location[0] cellForRowAtIndexPath:v11];
    [v6 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
    double v8 = v7;

    if (v8 > 60.0) {
      double v10 = UITableViewAutomaticDimension;
    }
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  int v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  if ([v29 section])
  {
    int v28 = 1;
  }
  else
  {
    id v5 = [v29 row];
    if (v5)
    {
      if (v5 == (id)1)
      {
        BOOL v16 = [(BuddyAppleIDChoiceController *)v31 urlConfiguration];
        unsigned __int8 v17 = [(AASetupAssistantConfigResponse *)v16 setupAssistantServerEnabled];

        if (v17)
        {
          id v18 = [(BuddyAppleIDChoiceController *)v31 appleIDController];
          [(BuddyAppleIDController *)v18 showCreateAppleID];
        }
        else
        {
          v19 = +[NSBundle mainBundle];
          id v20 = [(NSBundle *)v19 localizedStringForKey:@"CANT_CREATE_APPLEID_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
          v21 = +[NSBundle mainBundle];
          id v22 = [(NSBundle *)v21 localizedStringForKey:@"CANT_CREATE_APPLEID" value:&stru_1002B4E18 table:@"Localizable"];
          id v26 = +[UIAlertController alertControllerWithTitle:v20 message:v22 preferredStyle:1];

          id v23 = +[NSBundle mainBundle];
          id v24 = [(NSBundle *)v23 localizedStringForKey:@"OK" value:&stru_1002B4E18 table:@"Localizable"];
          BOOL v25 = +[UIAlertAction actionWithTitle:v24 style:0 handler:0];
          [v26 addAction:v25];

          [(BuddyAppleIDChoiceController *)v31 presentViewController:v26 animated:1 completion:0];
          objc_storeStrong(&v26, 0);
        }
      }
      else if (v5 == (id)2)
      {
        [(BuddyAppleIDChoiceController *)v31 _skipPressed:0];
        [location[0] deselectRowAtIndexPath:v29 animated:1];
      }
    }
    else
    {
      id v6 = [(BuddyAppleIDChoiceController *)v31 urlConfiguration];
      unsigned __int8 v7 = [(AASetupAssistantConfigResponse *)v6 setupAssistantServerEnabled];

      if (v7)
      {
        double v8 = [(BuddyAppleIDChoiceController *)v31 appleIDController];
        [(BuddyAppleIDController *)v8 showCredentialRecovery];
      }
      else
      {
        id v9 = +[NSBundle mainBundle];
        double v10 = [(NSBundle *)v9 localizedStringForKey:@"CANT_LOGIN_APPLEID_GENERIC_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
        id v11 = +[NSBundle mainBundle];
        v12 = [(NSBundle *)v11 localizedStringForKey:@"CANT_LOGIN_APPLEID_UNKNOWN_ERROR" value:&stru_1002B4E18 table:@"Localizable"];
        id v27 = +[UIAlertController alertControllerWithTitle:v10 message:v12 preferredStyle:1];

        id v13 = +[NSBundle mainBundle];
        id v14 = [(NSBundle *)v13 localizedStringForKey:@"OK" value:&stru_1002B4E18 table:@"Localizable"];
        int v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:0];
        [v27 addAction:v15];

        [(BuddyAppleIDChoiceController *)v31 presentViewController:v27 animated:1 completion:0];
        objc_storeStrong(&v27, 0);
      }
    }
    int v28 = 0;
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9[1] = (id)a4;
  v9[0] = 0;
  if (a4 == 1)
  {
    id v5 = [(BuddyAppleIDChoiceController *)v11 serviceHeaderView];
    id v6 = v9[0];
    v9[0] = v5;
  }
  id v7 = v9[0];
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v12 = 0.0;
  if (a4 == 1)
  {
    id v5 = [(BuddyAppleIDChoiceController *)v14 serviceHeaderView];
    [location[0] bounds];
    [location[0] layoutMargins];
    [location[0] layoutMargins];
    sub_1000F6FA4();
    LODWORD(v6) = 1148846080;
    LODWORD(v7) = 1112014848;
    -[UIStackView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8, v9, v6, v7);
    double v12 = v10;
  }
  objc_storeStrong(location, 0);
  return v12;
}

- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 4;
}

- (void)appleIDControllerFinished:(id)a3
{
  double v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyAppleIDChoiceController *)v7 setAllowBack:0];
  id v3 = [(BuddyAppleIDChoiceController *)v7 buddyPreferences];
  [(BYPreferencesController *)v3 setObject:&__kCFBooleanTrue forKey:@"AppleIDPB10Presented"];

  os_log_type_t v4 = [(BuddyAppleIDChoiceController *)v7 paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v4 recordActionWithValue:&__kCFBooleanTrue forFeature:14];

  id v5 = [(BuddyAppleIDChoiceController *)v7 delegate];
  [(BFFFlowItemDelegate *)v5 flowItemDone:v7];

  objc_storeStrong(location, 0);
}

- (void)appleIDController:(id)a3 failedWithError:(id)a4
{
  double v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v5 = [(BuddyAppleIDChoiceController *)v9 navigationController];
  id v6 = [v5 popToViewController:v9 animated:1];

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (id)showModalWiFiSettingsBlock
{
  return self->_showModalWiFiSettingsBlock;
}

- (void)setShowModalWiFiSettingsBlock:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (BuddyCombinedTermsProvider)combinedTermsProvider
{
  return self->_combinedTermsProvider;
}

- (void)setCombinedTermsProvider:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
}

- (UITableViewCell)forgotCell
{
  return self->_forgotCell;
}

- (void)setForgotCell:(id)a3
{
}

- (UITableViewCell)createNewCell
{
  return self->_createNewCell;
}

- (void)setCreateNewCell:(id)a3
{
}

- (UITableViewCell)skipCell
{
  return self->_skipCell;
}

- (void)setSkipCell:(id)a3
{
}

- (NSArray)itemIcons
{
  return self->_itemIcons;
}

- (void)setItemIcons:(id)a3
{
}

- (NSArray)itemDescriptions
{
  return self->_itemDescriptions;
}

- (void)setItemDescriptions:(id)a3
{
}

- (UIStackView)serviceHeaderView
{
  return self->_serviceHeaderView;
}

- (void)setServiceHeaderView:(id)a3
{
}

- (BuddyAppleIDController)appleIDController
{
  return self->_appleIDController;
}

- (void)setAppleIDController:(id)a3
{
}

- (BOOL)allowBack
{
  return self->_allowBack;
}

- (void)setAllowBack:(BOOL)a3
{
  self->_allowBack = a3;
}

- (BOOL)didShowWifiAlert
{
  return self->_didShowWifiAlert;
}

- (void)setDidShowWifiAlert:(BOOL)a3
{
  self->_didShowWifiAlert = a3;
}

- (BOOL)shouldShowWifiIfCancellingSkipAlert
{
  return self->_shouldShowWifiIfCancellingSkipAlert;
}

- (void)setShouldShowWifiIfCancellingSkipAlert:(BOOL)a3
{
  self->_shouldShowWifiIfCancellingSkipAlert = a3;
}

- (AASetupAssistantConfigResponse)urlConfiguration
{
  return self->_urlConfiguration;
}

- (void)setUrlConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end