@interface BuddyCloudConfigDisclosureViewController
+ (id)cloudConfigSkipKey;
- (BFFLinkLabelFooterView)aboutRemoteManagementContentView;
- (BuddyCloudConfigAboutConfigurationContainerController)aboutConfigurationContainerController;
- (BuddyCloudConfigController)configController;
- (BuddyCloudConfigDisclosureViewController)init;
- (BuddyEnrollmentCoordinator)enrollmentCoordinator;
- (BuddyNetworkProvider)networkProvider;
- (MCProfileConnection)managedConfiguration;
- (NSError)lastRetrievalError;
- (NSLayoutConstraint)contentViewHeightConstraint;
- (OBBoldTrayButton)enrollButton;
- (UINavigationController)aboutController;
- (id)_machineInfo;
- (id)_remoteManagementText;
- (void)_initializeViews;
- (void)_leaveRemoteManagementAndErase;
- (void)_presentEraseAlertWithTitle:(id)a3 message:(id)a4 eraseHandler:(id)a5;
- (void)_retrieveEnterpriseConfiguration;
- (void)_retrieveEnterpriseConfigurationForManagementVersion1;
- (void)_retrieveEnterpriseConfigurationForManagementVersion2;
- (void)_retrieveEnterpriseConfigurationFromWebURL:(id)a3 withAnchorCerts:(id)a4;
- (void)_setupForCloudConfigurationState;
- (void)_showEraseDeviceAlert;
- (void)_storeProfileDataAndCompleteDisclosure:(id)a3;
- (void)controllerDone;
- (void)loadView;
- (void)recievedProfile:(id)a3;
- (void)setAboutConfigurationContainerController:(id)a3;
- (void)setAboutController:(id)a3;
- (void)setAboutRemoteManagementContentView:(id)a3;
- (void)setConfigController:(id)a3;
- (void)setContentViewHeightConstraint:(id)a3;
- (void)setEnrollButton:(id)a3;
- (void)setEnrollmentCoordinator:(id)a3;
- (void)setLastRetrievalError:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)showAboutConfiguration;
- (void)showLeaveRemoteManagementAlert;
- (void)showRetrievalError:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)webAuthCanceled:(id)a3;
@end

@implementation BuddyCloudConfigDisclosureViewController

+ (id)cloudConfigSkipKey
{
  return 0;
}

- (BuddyCloudConfigDisclosureViewController)init
{
  SEL v19 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"REMOTE_MANAGEMENT_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  v5 = +[UIImage systemImageNamed:@"gear"];
  id location = 0;
  v18.receiver = self;
  v18.super_class = (Class)BuddyCloudConfigDisclosureViewController;
  id location = [(BuddyCloudConfigDisclosureViewController *)&v18 initWithTitle:v4 detailText:0 icon:v5];
  objc_storeStrong(&location, location);

  if (location)
  {
    id v6 = [location headerView];
    LODWORD(v7) = 1045220557;
    [v6 setTitleHyphenationFactor:v7];

    id v8 = [objc_alloc((Class)BFFLinkLabelFooterView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v9 = (void *)*((void *)location + 10);
    *((void *)location + 10) = v8;

    id v10 = +[OBBoldTrayButton boldButton];
    v11 = (void *)*((void *)location + 11);
    *((void *)location + 11) = v10;

    v12 = (void *)*((void *)location + 11);
    v13 = +[NSBundle mainBundle];
    id v14 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"REMOTE_MANAGEMENT_ENROLL_BUTTON_TITLE"];
    v15 = [(NSBundle *)v13 localizedStringForKey:v14 value:&stru_1002B4E18 table:@"Localizable"];
    [v12 setTitle:v15 forState:0];

    [*((id *)location + 11) addTarget:location action:"controllerDone" forControlEvents:64];
  }
  v16 = (BuddyCloudConfigDisclosureViewController *)location;
  objc_storeStrong(&location, 0);
  return v16;
}

- (void)_setupForCloudConfigurationState
{
  v99 = self;
  v98[1] = (id)a2;
  v98[0] = [(BuddyCloudConfigDisclosureViewController *)self managedConfiguration];
  v2 = [(BuddyCloudConfigDisclosureViewController *)v99 configController];
  unsigned int v3 = [(BuddyCloudConfigController *)v2 cloudConfigState];

  switch(v3)
  {
    case 0u:
      [(BuddyCloudConfigDisclosureViewController *)v99 _initializeViews];
      id v4 = [(BuddyCloudConfigDisclosureViewController *)v99 buttonTray];
      v5 = [(BuddyCloudConfigDisclosureViewController *)v99 enrollButton];
      [v4 addButton:v5];

      +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v99 identifier:@"Disclosure"];
      id v6 = +[BuddyCloudConfigManager sharedManager];
      LOBYTE(v5) = [v6 hasCloudConfiguration];

      if (v5)
      {
        id v7 = +[BuddyCloudConfigManager sharedManager];
        id v97 = [v7 cloudConfigurationDetails];

        if (v97)
        {
          v91 = _NSConcreteStackBlock;
          int v92 = -1073741824;
          int v93 = 0;
          v94 = sub_1001D59E0;
          v95 = &unk_1002B0FF0;
          v96 = v99;
          [v98[0] storeCloudConfigurationDetails:v97 completion:&v91];
          objc_storeStrong((id *)&v96, 0);
        }
        else
        {
          id location = (id)_BYLoggingFacility();
          char v89 = 16;
          if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
          {
            id v8 = location;
            os_log_type_t v9 = v89;
            sub_10004B24C(buf);
            _os_log_error_impl((void *)&_mh_execute_header, v8, v9, "BuddyCloudConfigManager returned hasCloudConfiguration = true, but cloudConfigurationDetails were nil! resetting...", buf, 2u);
          }
          objc_storeStrong(&location, 0);
          id v10 = +[BuddyCloudConfigManager sharedManager];
          [v10 setHasPreviouslyRetrievedMDMv1EnrollmentProfile:0];

          v11 = [(BuddyCloudConfigDisclosureViewController *)v99 configController];
          [(BuddyCloudConfigController *)v11 setCloudConfigState:2];

          [(BuddyCloudConfigDisclosureViewController *)v99 _setupForCloudConfigurationState];
        }
        objc_storeStrong(&v97, 0);
      }
      else
      {
        v12 = [(BuddyCloudConfigDisclosureViewController *)v99 configController];
        [(BuddyCloudConfigController *)v12 setCloudConfigState:1];

        v82 = _NSConcreteStackBlock;
        int v83 = -1073741824;
        int v84 = 0;
        v85 = sub_1001D5C04;
        v86 = &unk_1002B0FF0;
        v87 = v99;
        [v98[0] retrieveAndStoreCloudConfigurationDetailsCompletionBlock:&v82];
        objc_storeStrong((id *)&v87, 0);
      }
      break;
    case 2u:
      +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:@"Disclosure"];
      [(BuddyCloudConfigDisclosureViewController *)v99 _initializeViews];
      id v13 = [(BuddyCloudConfigDisclosureViewController *)v99 headerView];
      id v14 = +[NSBundle mainBundle];
      id v15 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"CLOUD_CONFIG_ERROR_FAILED_RETRIEVE_INITIAL_CONFIG"];
      v16 = [(NSBundle *)v14 localizedStringForKey:v15 value:&stru_1002B4E18 table:@"Localizable"];
      v17 = [(BuddyCloudConfigDisclosureViewController *)v99 lastRetrievalError];
      objc_super v18 = [(NSError *)v17 localizedDescription];
      SEL v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v18);
      [v13 setDetailText:v19];

      break;
    case 3u:
      id v81 = [v98[0] cloudConfigurationDetails];
      if (v81)
      {
        [(BuddyCloudConfigDisclosureViewController *)v99 _initializeViews];
        +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:@"Disclosure"];
        id v80 = [v98[0] deviceOrganizationName];
        id v29 = [(BuddyCloudConfigDisclosureViewController *)v99 headerView];
        v30 = +[NSBundle mainBundle];
        id v31 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"CLOUD_CONFIG_DESCRIPTION"];
        v32 = [(NSBundle *)v30 localizedStringForKey:v31 value:&stru_1002B4E18 table:@"Localizable"];
        v33 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v32, v80);
        [v29 setDetailText:v33];

        id v34 = [v98[0] isSupervised];
        v35 = [(BuddyCloudConfigDisclosureViewController *)v99 aboutConfigurationContainerController];
        [(BuddyCloudConfigAboutConfigurationContainerController *)v35 setIsSupervised:v34];

        id v36 = [v81 objectForKeyedSubscript:kMCCCOrganizationSupportPhoneKey];
        v37 = [(BuddyCloudConfigDisclosureViewController *)v99 aboutConfigurationContainerController];
        [(BuddyCloudConfigAboutConfigurationContainerController *)v37 setOrganizationSupportPhone:v36];

        id v38 = [v81 objectForKeyedSubscript:kCCOrganizationSupportEmailKey];
        v39 = [(BuddyCloudConfigDisclosureViewController *)v99 aboutConfigurationContainerController];
        [(BuddyCloudConfigAboutConfigurationContainerController *)v39 setOrganizationSupportEmail:v38];

        v40 = [(BuddyCloudConfigDisclosureViewController *)v99 aboutConfigurationContainerController];
        [(BuddyCloudConfigAboutConfigurationContainerController *)v40 setOrganizationName:v80];

        id v41 = [v98[0] deviceDepartmentName];
        v42 = [(BuddyCloudConfigDisclosureViewController *)v99 aboutConfigurationContainerController];
        [(BuddyCloudConfigAboutConfigurationContainerController *)v42 setOrganizationDepartment:v41];

        id v43 = [v98[0] deviceOrganizationAddress];
        v44 = [(BuddyCloudConfigDisclosureViewController *)v99 aboutConfigurationContainerController];
        [(BuddyCloudConfigAboutConfigurationContainerController *)v44 setOrganizationAddress:v43];

        id v45 = [v98[0] deviceOrganizationAddressLine1];
        v46 = [(BuddyCloudConfigDisclosureViewController *)v99 aboutConfigurationContainerController];
        [(BuddyCloudConfigAboutConfigurationContainerController *)v46 setOrganizationAddressLine1:v45];

        id v47 = [v98[0] deviceOrganizationAddressLine2];
        v48 = [(BuddyCloudConfigDisclosureViewController *)v99 aboutConfigurationContainerController];
        [(BuddyCloudConfigAboutConfigurationContainerController *)v48 setOrganizationAddressLine2:v47];

        id v49 = [v98[0] deviceOrganizationCity];
        v50 = [(BuddyCloudConfigDisclosureViewController *)v99 aboutConfigurationContainerController];
        [(BuddyCloudConfigAboutConfigurationContainerController *)v50 setOrganizationCity:v49];

        id v51 = [v98[0] deviceOrganizationRegion];
        v52 = [(BuddyCloudConfigDisclosureViewController *)v99 aboutConfigurationContainerController];
        [(BuddyCloudConfigAboutConfigurationContainerController *)v52 setOrganizationRegion:v51];

        id v53 = [v98[0] deviceOrganizationZipCode];
        v54 = [(BuddyCloudConfigDisclosureViewController *)v99 aboutConfigurationContainerController];
        [(BuddyCloudConfigAboutConfigurationContainerController *)v54 setOrganizationZipCode:v53];

        id v55 = [v98[0] deviceOrganizationCountry];
        v56 = [(BuddyCloudConfigDisclosureViewController *)v99 aboutConfigurationContainerController];
        [(BuddyCloudConfigAboutConfigurationContainerController *)v56 setOrganizationCountry:v55];

        v57 = [(BuddyCloudConfigDisclosureViewController *)v99 aboutRemoteManagementContentView];
        id v58 = [(BuddyCloudConfigDisclosureViewController *)v99 _remoteManagementText];
        [(BFFLinkLabelFooterView *)v57 setAttributedSubtitleText:v58];

        objc_initWeak(&from, v99);
        v59 = [(BuddyCloudConfigDisclosureViewController *)v99 aboutRemoteManagementContentView];
        v60 = +[NSBundle mainBundle];
        v61 = [(NSBundle *)v60 localizedStringForKey:@"REMOTE_MANAGEMENT_ABOUT" value:&stru_1002B4E18 table:@"Localizable"];
        v73 = _NSConcreteStackBlock;
        int v74 = -1073741824;
        int v75 = 0;
        v76 = sub_1001D5DB0;
        v77 = &unk_1002B0CA8;
        objc_copyWeak(&v78, &from);
        [(BFFLinkLabelFooterView *)v59 addLinkWithTitle:v61 handler:&v73];

        id v62 = [(BuddyCloudConfigDisclosureViewController *)v99 buttonTray];
        v63 = [(BuddyCloudConfigDisclosureViewController *)v99 enrollButton];
        [v62 addButton:v63];

        if ([v98[0] isProvisionallyEnrolled])
        {
          v64 = v99;
          v65 = +[NSBundle mainBundle];
          id v66 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"REMOTE_MANAGEMENT_LEAVE"];
          v67 = [(NSBundle *)v65 localizedStringForKey:v66 value:&stru_1002B4E18 table:@"Localizable"];
          [(BuddyWelcomeController *)v64 addLinkButton:v67 action:"showLeaveRemoteManagementAlert"];
        }
        id v68 = [(BuddyCloudConfigDisclosureViewController *)v99 view];
        [v68 setNeedsLayout];

        objc_destroyWeak(&v78);
        objc_destroyWeak(&from);
        objc_storeStrong(&v80, 0);
      }
      else
      {
        v69 = [(BuddyCloudConfigDisclosureViewController *)v99 lastRetrievalError];

        if (v69)
        {
          v70 = [(BuddyCloudConfigDisclosureViewController *)v99 configController];
          [(BuddyCloudConfigController *)v70 setCloudConfigState:0];

          [(BuddyCloudConfigDisclosureViewController *)v99 _setupForCloudConfigurationState];
        }
        else
        {
          v71 = [(BuddyCloudConfigDisclosureViewController *)v99 configController];
          [(BuddyCloudConfigController *)v71 cloudConfigDidFinishFromViewController:v99 wasApplied:0];
        }
      }
      objc_storeStrong(&v81, 0);
      break;
    case 5u:
      +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:@"Disclosure"];
      [(BuddyCloudConfigDisclosureViewController *)v99 _initializeViews];
      id v20 = [(BuddyCloudConfigDisclosureViewController *)v99 headerView];
      v21 = +[NSBundle mainBundle];
      id v22 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"CLOUD_CONFIG_ERROR_FAILED_RETRIEVE_ENTERPRISE_CONFIG"];
      v23 = [(NSBundle *)v21 localizedStringForKey:v22 value:&stru_1002B4E18 table:@"Localizable"];
      id v24 = [v98[0] cloudConfigurationDetails];
      id v25 = [v24 objectForKeyedSubscript:kMCCCOrganizationNameKey];
      v26 = [(BuddyCloudConfigDisclosureViewController *)v99 lastRetrievalError];
      v27 = [(NSError *)v26 localizedDescription];
      v28 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v23, v25, v27);
      [v20 setDetailText:v28];

      break;
    default:
      break;
  }
  id v72 = [(BuddyCloudConfigDisclosureViewController *)v99 view];
  [v72 setNeedsLayout];

  objc_storeStrong(v98, 0);
}

- (void)_initializeViews
{
  v2 = [(BuddyCloudConfigDisclosureViewController *)self aboutRemoteManagementContentView];
  [(BFFLinkLabelFooterView *)v2 setLabelText:0];

  unsigned int v3 = [(BuddyCloudConfigDisclosureViewController *)self aboutRemoteManagementContentView];
  [(BFFLinkLabelFooterView *)v3 setAttributedSubtitleText:0];

  id v4 = [(BuddyCloudConfigDisclosureViewController *)self aboutRemoteManagementContentView];
  [(BFFLinkLabelFooterView *)v4 removeAllLinks];

  id v5 = [(BuddyCloudConfigDisclosureViewController *)self buttonTray];
  [v5 removeAllButtons];
}

- (void)_presentEraseAlertWithTitle:(id)a3 message:(id)a4 eraseHandler:(id)a5
{
  objc_super v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  id v14 = +[UIAlertController alertControllerWithTitle:location[0] message:v16 preferredStyle:1];
  id v7 = +[NSBundle mainBundle];
  id v8 = [(NSBundle *)v7 localizedStringForKey:@"ERASE" value:&stru_1002B4E18 table:@"Localizable"];
  id v13 = +[UIAlertAction actionWithTitle:v8 style:2 handler:v15];

  [v14 addAction:v13];
  os_log_type_t v9 = +[NSBundle mainBundle];
  id v10 = [(NSBundle *)v9 localizedStringForKey:@"CANCEL" value:&stru_1002B4E18 table:@"Localizable"];
  v12 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];

  [v14 addAction:v12];
  id v11 = [(BuddyCloudConfigDisclosureViewController *)v18 navigationController];
  [v11 presentViewController:v14 animated:1 completion:0];

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)showLeaveRemoteManagementAlert
{
  id val = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v2 = val;
  unsigned int v3 = +[NSBundle mainBundle];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"REMOTE_MANAGEMENT_LEAVE"];
  id v5 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];
  id v6 = +[NSBundle mainBundle];
  id v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"REMOTE_MANAGEMENT_LEAVE_REMOTE_MANAGEMENT_ALERT_BODY"];
  id v8 = [(NSBundle *)v6 localizedStringForKey:v7 value:&stru_1002B4E18 table:@"Localizable"];
  os_log_type_t v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  v12 = sub_1001D62F4;
  id v13 = &unk_1002B13E0;
  objc_copyWeak(v14, location);
  [v2 _presentEraseAlertWithTitle:v5 message:v8 eraseHandler:&v9];

  objc_destroyWeak(v14);
  objc_destroyWeak(location);
}

- (void)_showEraseDeviceAlert
{
  id val = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v2 = val;
  unsigned int v3 = +[NSBundle mainBundle];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"REMOTE_MANAGEMENT_ERASE_ALERT_TITLE"];
  id v5 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];
  id v6 = +[NSBundle mainBundle];
  id v7 = [(NSBundle *)v6 localizedStringForKey:@"REMOTE_MANAGEMENT_ERASE_ALERT_BODY" value:&stru_1002B4E18 table:@"Localizable"];
  id v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  int v11 = sub_1001D6608;
  v12 = &unk_1002B13E0;
  objc_copyWeak(v13, location);
  [v2 _presentEraseAlertWithTitle:v5 message:v7 eraseHandler:&v8];

  objc_destroyWeak(v13);
  objc_destroyWeak(location);
}

- (void)showRetrievalError:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyCloudConfigDisclosureViewController *)v5 setLastRetrievalError:location[0]];
  unsigned int v3 = [(BuddyCloudConfigDisclosureViewController *)v5 configController];
  [(BuddyCloudConfigController *)v3 setCloudConfigState:5];

  [(BuddyCloudConfigDisclosureViewController *)v5 _setupForCloudConfigurationState];
  objc_storeStrong(location, 0);
}

- (void)_leaveRemoteManagementAndErase
{
  int v10 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v2 = [(BuddyCloudConfigDisclosureViewController *)v10 managedConfiguration];
  unsigned int v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_1001D68BC;
  id v7 = &unk_1002B4470;
  objc_copyWeak(v8, location);
  [(MCProfileConnection *)v2 unenrollWithCompletionBlock:&v3];

  objc_destroyWeak(v8);
  objc_destroyWeak(location);
}

- (id)_remoteManagementText
{
  v21[2] = self;
  v21[1] = (id)a2;
  id v2 = [(BuddyCloudConfigDisclosureViewController *)self managedConfiguration];
  id v3 = [(MCProfileConnection *)v2 cloudConfigurationDetails];
  v21[0] = [v3 objectForKeyedSubscript:kMCCCOrganizationNameKey];

  id v20 = (id)objc_opt_new();
  id v19 = +[BuddyAppleIDTableHeaderView defaultDetailTextAttributes];
  id v18 = +[BuddyAppleIDTableHeaderView defaultTitleTextAttributes];
  id location = [objc_alloc((Class)NSAttributedString) initWithString:@"\n" attributes:v19];
  id v4 = objc_alloc((Class)NSAttributedString);
  char v15 = 0;
  char v13 = 0;
  if (!v21[0])
  {
    id v16 = +[NSBundle mainBundle];
    char v15 = 1;
    id v14 = [(NSBundle *)v16 localizedStringForKey:@"UNKNOWN" value:&stru_1002B4E18 table:@"Localizable"];
    char v13 = 1;
  }
  id v5 = [v4 initWithString:attributes:];
  [v20 appendAttributedString:v5];

  if (v13) {
  if (v15)
  }

  [v20 appendAttributedString:location];
  [v20 appendAttributedString:location];
  id v6 = objc_alloc((Class)NSMutableAttributedString);
  id v7 = +[NSBundle mainBundle];
  id v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"REMOTE_MANAGEMENT_WHAT_DETAIL"];
  int v9 = [(NSBundle *)v7 localizedStringForKey:v8 value:&stru_1002B4E18 table:@"Localizable"];
  id v10 = [v6 initWithString:v9 attributes:v19];
  [v20 appendAttributedString:v10];

  [v20 appendAttributedString:location];
  id v11 = v20;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(v21, 0);
  return v11;
}

- (void)loadView
{
  id v38 = self;
  SEL v37 = a2;
  v36.receiver = self;
  v36.super_class = (Class)BuddyCloudConfigDisclosureViewController;
  [(BuddyCloudConfigDisclosureViewController *)&v36 loadView];
  id v2 = [(BuddyCloudConfigDisclosureViewController *)v38 aboutRemoteManagementContentView];
  [(BFFLinkLabelFooterView *)v2 margins];
  double v34 = v3;
  double v35 = v4;

  id v5 = [(BuddyCloudConfigDisclosureViewController *)v38 aboutRemoteManagementContentView];
  -[BFFLinkLabelFooterView setMargins:](v5, "setMargins:", v34, 0.0, v35, 0.0);

  id v6 = [(BuddyCloudConfigDisclosureViewController *)v38 aboutRemoteManagementContentView];
  [(BFFLinkLabelFooterView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v7 = [(BuddyCloudConfigDisclosureViewController *)v38 contentView];
  id v8 = [(BuddyCloudConfigDisclosureViewController *)v38 aboutRemoteManagementContentView];
  [v7 addSubview:v8];

  id v9 = [(BuddyCloudConfigDisclosureViewController *)v38 contentView];
  id v10 = [v9 heightAnchor];
  id v11 = [v10 constraintEqualToConstant:0.0];
  [(BuddyCloudConfigDisclosureViewController *)v38 setContentViewHeightConstraint:v11];

  v33 = [(BuddyCloudConfigDisclosureViewController *)v38 contentViewHeightConstraint];
  v39[0] = v33;
  id v32 = [(BuddyCloudConfigDisclosureViewController *)v38 contentView];
  id v30 = [v32 topAnchor];
  id v31 = [(BuddyCloudConfigDisclosureViewController *)v38 aboutRemoteManagementContentView];
  id v29 = [(BFFLinkLabelFooterView *)v31 topAnchor];
  id v28 = [v30 constraintEqualToAnchor:];
  v39[1] = v28;
  id v27 = [(BuddyCloudConfigDisclosureViewController *)v38 contentView];
  id v25 = [v27 leadingAnchor];
  v26 = [(BuddyCloudConfigDisclosureViewController *)v38 aboutRemoteManagementContentView];
  id v24 = [(BFFLinkLabelFooterView *)v26 leadingAnchor];
  id v23 = [v25 constraintEqualToAnchor:];
  v39[2] = v23;
  id v22 = [(BuddyCloudConfigDisclosureViewController *)v38 contentView];
  id v12 = [v22 trailingAnchor];
  char v13 = [(BuddyCloudConfigDisclosureViewController *)v38 aboutRemoteManagementContentView];
  id v14 = [(BFFLinkLabelFooterView *)v13 trailingAnchor];
  id v15 = [v12 constraintEqualToAnchor:v14];
  v39[3] = v15;
  id v16 = [(BuddyCloudConfigDisclosureViewController *)v38 contentView];
  id v17 = [v16 bottomAnchor];
  id v18 = [(BuddyCloudConfigDisclosureViewController *)v38 aboutRemoteManagementContentView];
  id v19 = [(BFFLinkLabelFooterView *)v18 bottomAnchor];
  id v20 = [v17 constraintEqualToAnchor:v19];
  v39[4] = v20;
  v21 = +[NSArray arrayWithObjects:v39 count:5];
  +[NSLayoutConstraint activateConstraints:v21];
}

- (void)viewWillAppear:(BOOL)a3
{
  id v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BuddyCloudConfigDisclosureViewController;
  [(BuddyCloudConfigDisclosureViewController *)&v8 viewWillAppear:a3];
  if ([(BuddyCloudConfigDisclosureViewController *)v11 isBeingPresented])
  {
    double v3 = [(BuddyCloudConfigDisclosureViewController *)v11 lastRetrievalError];

    if (v3)
    {
      double v4 = [(BuddyCloudConfigDisclosureViewController *)v11 configController];
      [(BuddyCloudConfigController *)v4 setCloudConfigState:5];
    }
    else
    {
      id v5 = +[BuddyCloudConfigManager sharedManager];
      unsigned __int8 v6 = [v5 hasPreviouslyRetrievedMDMv1EnrollmentProfile];

      id v7 = [(BuddyCloudConfigDisclosureViewController *)v11 configController];
      if (v6) {
        [(BuddyCloudConfigController *)v7 setCloudConfigState:3];
      }
      else {
        [(BuddyCloudConfigController *)v7 setCloudConfigState:0];
      }
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  unsigned __int8 v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)BuddyCloudConfigDisclosureViewController;
  [(BuddyCloudConfigDisclosureViewController *)&v3 viewWillDisappear:a3];
  [(BuddyCloudConfigDisclosureViewController *)v6 setLastRetrievalError:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  SEL v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BuddyCloudConfigDisclosureViewController;
  [(BuddyCloudConfigDisclosureViewController *)&v7 viewDidAppear:a3];
  id v3 = [(BuddyCloudConfigDisclosureViewController *)v10 navigationController];
  BOOL v4 = [(BuddyCloudConfigDisclosureViewController *)v10 configController];
  [(BuddyCloudConfigController *)v4 setNavController:v3];

  SEL v5 = [(BuddyCloudConfigDisclosureViewController *)v10 configController];
  [(BuddyCloudConfigController *)v5 removeControllersToRemove];

  id v6 = [(BuddyCloudConfigDisclosureViewController *)v10 view];
  [v6 setNeedsLayout];

  [(BuddyCloudConfigDisclosureViewController *)v10 _setupForCloudConfigurationState];
}

- (void)viewDidLayoutSubviews
{
  id v20 = self;
  SEL v19 = a2;
  v18.receiver = self;
  v18.super_class = (Class)BuddyCloudConfigDisclosureViewController;
  [(BuddyCloudConfigDisclosureViewController *)&v18 viewDidLayoutSubviews];
  id v2 = [(BuddyCloudConfigDisclosureViewController *)v20 aboutRemoteManagementContentView];
  id v3 = [(BuddyCloudConfigDisclosureViewController *)v20 contentView];
  [v3 bounds];
  uint64_t v15 = v4;
  uint64_t v14 = v5;
  uint64_t v17 = v6;
  uint64_t v16 = v7;
  sub_1001D3718();
  -[BFFLinkLabelFooterView sizeThatFits:](v2, "sizeThatFits:", v8, v9);
  double v11 = v10;
  char v13 = [(BuddyCloudConfigDisclosureViewController *)v20 contentViewHeightConstraint];
  [(NSLayoutConstraint *)v13 setConstant:v11];
}

- (void)setConfigController:(id)a3
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_configController, location[0]);
  objc_storeStrong(location, 0);
}

- (void)_retrieveEnterpriseConfiguration
{
  char v13 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = oslog[0];
    os_log_type_t v3 = v11;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Retrieving enterprise configuration...", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  id v4 = +[MDMCloudConfiguration sharedConfiguration];
  id location = [v4 mdmVersionProtocol];

  id v5 = +[MDMCloudConfiguration sharedConfiguration];
  id v6 = [v5 enrollmentServerInfo];

  if (v6)
  {
    [(BuddyCloudConfigDisclosureViewController *)v13 _retrieveEnterpriseConfigurationForManagementVersion2];
  }
  else if ([location integerValue] == (id)1)
  {
    [(BuddyCloudConfigDisclosureViewController *)v13 _retrieveEnterpriseConfigurationForManagementVersion1];
  }
  else
  {
    os_log_t v8 = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_10004BB7C((uint64_t)v14, (uint64_t)location);
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unknown management protocol version %{public}@ in enterprise configuration.", v14, 0xCu);
    }
    objc_storeStrong((id *)&v8, 0);
    uint64_t v7 = [(BuddyCloudConfigDisclosureViewController *)v13 configController];
    [(BuddyCloudConfigController *)v7 setCloudConfigState:5];

    [(BuddyCloudConfigDisclosureViewController *)v13 _setupForCloudConfigurationState];
  }
  objc_storeStrong(&location, 0);
}

- (void)_retrieveEnterpriseConfigurationForManagementVersion1
{
  id v25 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility();
  os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = location[0];
    os_log_type_t v3 = v23;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Retrieving enterprise configuration for management protocol version 1...", buf, 2u);
  }
  objc_storeStrong(location, 0);
  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v25 identifier:@"Disclosure"];
  id v21 = [(BuddyCloudConfigDisclosureViewController *)v25 managedConfiguration];
  id v20 = [v21 cloudConfigurationDetails];
  id v4 = [v20 objectForKeyedSubscript:kMCCCConfigurationWebURLKey];
  id v19 = +[NSURL URLWithString:v4];

  id obj = [v20 objectForKeyedSubscript:kMCCCAnchorCertificatesKey];
  id v17 = sub_1001D808C(obj);
  if (v19)
  {
    [(BuddyCloudConfigDisclosureViewController *)v25 _retrieveEnterpriseConfigurationFromWebURL:v19 withAnchorCerts:v17];
    int v16 = 1;
  }
  else
  {
    id v5 = [v20 objectForKeyedSubscript:kMCCCConfigurationURLKey];
    id v15 = +[NSURL URLWithString:v5];

    id v6 = [(BuddyCloudConfigDisclosureViewController *)v25 managedConfiguration];
    uint64_t v26 = kMDMCanRequestSoftwareUpdateKey;
    uint64_t v7 = +[NSNumber numberWithBool:1];
    id v27 = v7;
    os_log_t v8 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    double v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    uint64_t v12 = sub_1001D82C8;
    char v13 = &unk_1002B49D0;
    uint64_t v14 = v25;
    [(MCProfileConnection *)v6 retrieveCloudConfigurationFromURL:v15 username:0 password:0 anchorCertificates:v17 additionalMachineInfo:v8 completionBlock:&v10];

    id v9 = +[BuddyCloudConfigManager sharedManager];
    [v9 setHasPreviouslyRetrievedMDMv1EnrollmentProfile:1];

    objc_storeStrong((id *)&v14, 0);
    objc_storeStrong(&v15, 0);
    int v16 = 0;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
}

- (void)_retrieveEnterpriseConfigurationForManagementVersion2
{
  id v17 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = oslog[0];
    os_log_type_t v3 = v15;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Retrieving enterprise configuration for management protocol version 2...", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v17 identifier:@"Disclosure"];
  id v4 = [(BuddyCloudConfigDisclosureViewController *)v17 enrollmentCoordinator];
  id v5 = v17;
  id v6 = [(BuddyCloudConfigDisclosureViewController *)v17 navigationController];
  os_log_t v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  uint64_t v11 = sub_1001D8954;
  uint64_t v12 = &unk_1002B49F8;
  char v13 = v17;
  [(BuddyEnrollmentCoordinator *)v4 retrieveProfileDataWithBaseViewController:v5 navigationController:v6 completionHandler:&v8];

  id v7 = +[BuddyCloudConfigManager sharedManager];
  [v7 setHasPreviouslyRetrievedMDMv1EnrollmentProfile:1];

  objc_storeStrong((id *)&v13, 0);
}

- (void)_retrieveEnterpriseConfigurationFromWebURL:(id)a3 withAnchorCerts:(id)a4
{
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = (id)objc_opt_new();
  [v8 setModalInPresentation:1];
  [v8 setWebURL:location[0]];
  [v8 setDelegate:v11];
  id v5 = [(BuddyCloudConfigDisclosureViewController *)v11 _machineInfo];
  [v8 setMachineInfo:v5];

  [v8 setAnchorCerts:v9];
  id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v8];
  -[BuddyCloudConfigDisclosureViewController presentModalViewController:withTransition:](v11, "presentModalViewController:withTransition:", v6, 8, v6);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_storeProfileDataAndCompleteDisclosure:(id)a3
{
  uint64_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_type_t v3 = [(BuddyCloudConfigDisclosureViewController *)v12 managedConfiguration];
  id v4 = location[0];
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_1001D911C;
  id v9 = &unk_1002B0FF0;
  int v10 = v12;
  [(MCProfileConnection *)v3 storeProfileData:v4 completion:&v5];

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (id)_machineInfo
{
  id v2 = [(BuddyCloudConfigDisclosureViewController *)self managedConfiguration];
  uint64_t v7 = kMDMCanRequestSoftwareUpdateKey;
  os_log_type_t v3 = +[NSNumber numberWithBool:1];
  id v8 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v5 = [(MCProfileConnection *)v2 getMachineInfoWithAdditionalInfo:v4];

  return v5;
}

- (void)webAuthCanceled:(id)a3
{
  char v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyCloudConfigDisclosureViewController *)v13 dismissModalViewControllerWithTransition:9];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = 0;
    char v7 = 0;
    if (_BYIsInternalInstall())
    {
      os_log_type_t v3 = (NSString *)location[0];
    }
    else if (location[0])
    {
      id v10 = [location[0] domain];
      char v9 = 1;
      os_log_type_t v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v10, [location[0] code]);
      id v8 = v3;
      char v7 = 1;
    }
    else
    {
      os_log_type_t v3 = 0;
    }
    sub_10004BB7C((uint64_t)buf, (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Web Auth Canceled with error: %{public}@", buf, 0xCu);
    if (v7) {

    }
    if (v9) {
  }
    }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyCloudConfigDisclosureViewController *)v13 setLastRetrievalError:location[0]];
  id v4 = [(BuddyCloudConfigDisclosureViewController *)v13 configController];
  [(BuddyCloudConfigController *)v4 setCloudConfigState:5];

  if (sub_1001D2104(location[0]))
  {
    id v5 = [(BuddyCloudConfigDisclosureViewController *)v13 configController];
    [(BuddyCloudConfigController *)v5 transitionToSoftwareUpdateControllerFromController:v13 lastError:location[0]];
  }
  else
  {
    id v6 = [(BuddyCloudConfigDisclosureViewController *)v13 view];
    [v6 setNeedsLayout];

    [(BuddyCloudConfigDisclosureViewController *)v13 _setupForCloudConfigurationState];
  }
  objc_storeStrong(location, 0);
}

- (void)recievedProfile:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_type_t v3 = oslog;
    os_log_type_t v4 = v14;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Starting web controller dismissal!", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v5 = v17;
  char v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  char v9 = sub_1001D990C;
  id v10 = &unk_1002B12F0;
  uint64_t v11 = v17;
  id v12 = location[0];
  [(BuddyCloudConfigDisclosureViewController *)v5 dismissViewControllerWithTransition:9 completion:&v7];
  id v6 = +[BuddyCloudConfigManager sharedManager];
  [v6 setHasPreviouslyRetrievedMDMv1EnrollmentProfile:1];

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)controllerDone
{
  id v2 = [(BuddyCloudConfigDisclosureViewController *)self configController];
  unsigned int v3 = [(BuddyCloudConfigController *)v2 cloudConfigState];

  if (v3 == 3)
  {
    os_log_type_t v4 = [(BuddyCloudConfigDisclosureViewController *)self configController];
    [(BuddyCloudConfigController *)v4 setCloudConfigState:4];

    [(BuddyCloudConfigDisclosureViewController *)self _retrieveEnterpriseConfiguration];
  }
}

- (BuddyCloudConfigAboutConfigurationContainerController)aboutConfigurationContainerController
{
  if (!self->_aboutConfigurationContainerController)
  {
    id v2 = -[BuddyCloudConfigAboutConfigurationContainerController initWithNibName:bundle:]([BuddyCloudConfigAboutConfigurationContainerController alloc], "initWithNibName:bundle:", 0, 0, a2);
    aboutConfigurationContainerController = self->_aboutConfigurationContainerController;
    self->_aboutConfigurationContainerController = v2;
  }
  os_log_type_t v4 = self->_aboutConfigurationContainerController;

  return v4;
}

- (UINavigationController)aboutController
{
  if (!self->_aboutController)
  {
    id v2 = objc_alloc((Class)UINavigationController);
    unsigned int v3 = [(BuddyCloudConfigDisclosureViewController *)self aboutConfigurationContainerController];
    os_log_type_t v4 = (UINavigationController *)[v2 initWithRootViewController:v3];
    aboutController = self->_aboutController;
    self->_aboutController = v4;

    if (BFFIsiPad()) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 0;
    }
    [(UINavigationController *)self->_aboutController setModalPresentationStyle:v6];
  }
  char v7 = self->_aboutController;

  return v7;
}

- (void)showAboutConfiguration
{
  id v2 = [(BuddyCloudConfigDisclosureViewController *)self navigationController];
  unsigned int v3 = [(BuddyCloudConfigDisclosureViewController *)self aboutController];
  [v2 presentViewController:v3 animated:1 completion:0];
}

- (BuddyEnrollmentCoordinator)enrollmentCoordinator
{
  return self->enrollmentCoordinator;
}

- (void)setEnrollmentCoordinator:(id)a3
{
}

- (BuddyCloudConfigController)configController
{
  return self->_configController;
}

- (NSError)lastRetrievalError
{
  return self->_lastRetrievalError;
}

- (void)setLastRetrievalError:(id)a3
{
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (void)setAboutController:(id)a3
{
}

- (void)setAboutConfigurationContainerController:(id)a3
{
}

- (NSLayoutConstraint)contentViewHeightConstraint
{
  return self->_contentViewHeightConstraint;
}

- (void)setContentViewHeightConstraint:(id)a3
{
}

- (BFFLinkLabelFooterView)aboutRemoteManagementContentView
{
  return self->_aboutRemoteManagementContentView;
}

- (void)setAboutRemoteManagementContentView:(id)a3
{
}

- (OBBoldTrayButton)enrollButton
{
  return self->_enrollButton;
}

- (void)setEnrollButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end