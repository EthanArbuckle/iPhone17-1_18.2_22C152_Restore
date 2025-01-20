@interface NPKPassbookBridgeSettingsController
+ (BOOL)shouldShowUpdateRequired;
- (BOOL)_handleProvisioningPreflightFinishedWithSuccess:(BOOL)a3 displayableError:(id)a4;
- (BOOL)_shouldPresentOrPushViewController;
- (BOOL)isPresentingViewController;
- (BOOL)performingBackgroundPreflight;
- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5;
- (BOOL)shouldNavigateToTermsAndConditions;
- (BOOL)showUpdateRequired;
- (BOOL)suppressMirrorOption;
- (BOOL)suppressSendToNotificationCenterOption;
- (Class)tableViewClass;
- (NPKBridgePendingTransactionHandler)pendingTransactionHandler;
- (NPKPassbookBridgeSettingsController)init;
- (NPKPassbookPaymentSetupDelegate)paymentSetupDelegate;
- (NPKStockholmProvisioningController)provisioningController;
- (PKGroupsController)groupsController;
- (PKPassbookSettingsController)settingsController;
- (id)applicationBundleIdentifier;
- (id)localizedMirroringDetailFooter;
- (id)localizedPaneTitle;
- (id)presentingViewControllerForPendingTransactionHandler:(id)a3;
- (id)specifiers;
- (unint64_t)backgroundPreflightingTaskIdentifier;
- (void)_endPreflightBackgroundTaskIfNecessary;
- (void)_handleApplicationDidBecomeActiveNotification:(id)a3;
- (void)_handleCompanionPassesChanged:(id)a3;
- (void)_handleDatabaseChanged:(id)a3;
- (void)_handleDefaultCardChanged:(id)a3;
- (void)_handleDidEnterBackgroundNotification:(id)a3;
- (void)_handlePaymentPassDetailAppearedNotification:(id)a3;
- (void)_handlePeerPaymentWebServiceChanged:(id)a3;
- (void)_handlePreferencesChanged:(id)a3;
- (void)_handleWillEnterForegroundNotification:(id)a3;
- (void)_launchBridgeInForegroundWithCompletion:(id)a3;
- (void)_promptUserAboutGymKitConflictWithPass:(id)a3 visibleViewController:(id)a4 completion:(id)a5;
- (void)_settingsController:(id)a3 requestsDetailViewControllerForPass:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_setupPendingTransactionHandlerForPassWithUniqueID:(id)a3;
- (void)_startPreflightBackgroundTaskIfNecessary;
- (void)allowEnableExpressGymKitWithVisibleViewController:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)pendingTransactionHandlerDidComplete:(id)a3;
- (void)requestDismissingPresentedViewControllerWithSettingsController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)requestResetToRootWithSettingsController:(id)a3 animated:(BOOL)a4;
- (void)setBackgroundPreflightingTaskIdentifier:(unint64_t)a3;
- (void)setGroupsController:(id)a3;
- (void)setPaymentSetupDelegate:(id)a3;
- (void)setPendingTransactionHandler:(id)a3;
- (void)setPerformingBackgroundPreflight:(BOOL)a3;
- (void)setProvisioningController:(id)a3;
- (void)setSettingsController:(id)a3;
- (void)setShouldNavigateToTermsAndConditions:(BOOL)a3;
- (void)setShowUpdateRequired:(BOOL)a3;
- (void)settingsController:(id)a3 requestShowPeerPaymentAssociatedAccountsFlowWithController:(id)a4 withPresentationContext:(id)a5;
- (void)settingsController:(id)a3 requestsAddCardPreflightWithCompletion:(id)a4;
- (void)settingsController:(id)a3 requestsAddLocalCardPreflightWithCompletion:(id)a4;
- (void)settingsController:(id)a3 requestsAuthenticationChallengeForAppleAccountInformation:(id)a4 completion:(id)a5;
- (void)settingsController:(id)a3 requestsDetailViewControllerForPass:(id)a4 animated:(BOOL)a5;
- (void)settingsController:(id)a3 requestsPresentAuthorizationFlowWithRedirectURL:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)settingsController:(id)a3 requestsPresentInboxMessage:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)settingsController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)settingsController:(id)a3 requestsPushViewController:(id)a4 animated:(BOOL)a5;
- (void)settingsController:(id)a3 requestsPushViewControllers:(id)a4 animated:(BOOL)a5;
- (void)settingsController:(id)a3 requestsReloadSpecifier:(id)a4;
- (void)settingsControllerRequestsPresentPrivacyWithPresenter:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NPKPassbookBridgeSettingsController

+ (BOOL)shouldShowUpdateRequired
{
  id v2 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanopassbook"];
  unsigned int v3 = [v2 BOOLForKey:@"InFailForward"];
  v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Show update required: %d", (uint8_t *)v8, 8u);
    }
  }
  return v3;
}

- (NPKPassbookBridgeSettingsController)init
{
  v32.receiver = self;
  v32.super_class = (Class)NPKPassbookBridgeSettingsController;
  id v2 = [(NPKPassbookBridgeSettingsController *)&v32 init];
  if (v2)
  {
    unsigned int v3 = +[NPKPassbookPaymentSetupDelegate sharedSetupDelegate];
    [(NPKPassbookBridgeSettingsController *)v2 setPaymentSetupDelegate:v3];

    v4 = [(NPKPassbookBridgeSettingsController *)v2 paymentSetupDelegate];
    BOOL v5 = [v4 companionAgentConnection];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_handleDatabaseChanged:" name:NPKCompanionAgentConnectionPaymentPassesChanged object:v5];
    [v6 addObserver:v2 selector:"_handleDefaultCardChanged:" name:NPKCompanionAgentConnectionDefaultCardChanged object:v5];
    v7 = +[PKPassLibrary sharedInstance];
    [v6 addObserver:v2 selector:"_handleCompanionPassesChanged:" name:PKPassLibraryDidChangeNotification object:v7];

    [v6 addObserver:v2 selector:"_handlePreferencesChanged:" name:PKPreferencesDidChangeNotification object:0];
    v8 = NPKNotificationForSyncedSettingsChange();
    [v6 addObserver:v2 selector:"_handlePreferencesChanged:" name:v8 object:0];

    [v6 addObserver:v2 selector:"_handlePeerPaymentWebServiceChanged:" name:NPKSharedPeerPaymentWebServiceDidChangeNotification object:0];
    [v6 addObserver:v2 selector:"_handlePaymentPassDetailAppearedNotification:" name:PKPaymentPassDetailVCDidAppearNotification object:0];
    [v6 addObserver:v2 selector:"_handleWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
    [v6 addObserver:v2 selector:"_handleDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];
    [v6 addObserver:v2 selector:"_handleApplicationDidBecomeActiveNotification:" name:UIApplicationDidBecomeActiveNotification object:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_57A4;
    block[3] = &unk_2C6A8;
    v9 = v2;
    v31 = v9;
    if (qword_35DA8 != -1) {
      dispatch_once(&qword_35DA8, block);
    }
    v10 = +[NPKPassbookPaymentSetupDelegate sharedSetupDelegate];
    [(NPKPassbookBridgeSettingsController *)v9 setPaymentSetupDelegate:v10];

    v11 = [(NPKPassbookBridgeSettingsController *)v9 paymentSetupDelegate];
    [v11 loadWebService];

    v12 = [NPKStockholmProvisioningController alloc];
    v13 = [(NPKPassbookBridgeSettingsController *)v9 paymentSetupDelegate];
    v14 = [(NPKStockholmProvisioningController *)v12 initWithPaymentSetupDelegate:v13];
    [(NPKPassbookBridgeSettingsController *)v9 setProvisioningController:v14];

    v15 = pk_Payment_log();
    LODWORD(v13) = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      v16 = pk_Payment_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [(NPKPassbookBridgeSettingsController *)v9 paymentSetupDelegate];
        v18 = [(NPKPassbookBridgeSettingsController *)v9 provisioningController];
        *(_DWORD *)buf = 138412546;
        v34 = v17;
        __int16 v35 = 2112;
        v36 = v18;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Notice: Payment setup delegate: %@, provisioning controller: %@", buf, 0x16u);
      }
    }
    id v19 = objc_alloc((Class)PKPassbookSettingsController);
    v20 = [(NPKPassbookBridgeSettingsController *)v9 provisioningController];
    id v21 = [v19 initWithDelegate:v9 dataSource:v20 context:1];
    [(NPKPassbookBridgeSettingsController *)v9 setSettingsController:v21];

    v22 = [(NPKPassbookBridgeSettingsController *)v9 provisioningController];
    [v22 updateRegionSupportIfNecessary];

    [(NPKPassbookBridgeSettingsController *)v9 setBackgroundPreflightingTaskIdentifier:UIBackgroundTaskInvalid];
    -[NPKPassbookBridgeSettingsController setShowUpdateRequired:](v9, "setShowUpdateRequired:", [(id)objc_opt_class() shouldShowUpdateRequired]);
    id v23 = objc_alloc_init((Class)PKPassLibrary);
    v24 = [v23 _remoteLibrary];

    id v25 = [objc_alloc((Class)PKGroupsController) initWithPassLibrary:v24];
    [(NPKPassbookBridgeSettingsController *)v9 setGroupsController:v25];

    v26 = [(NPKPassbookBridgeSettingsController *)v9 groupsController];
    [v26 loadGroupsWithCompletion:&stru_2C6E8];

    v27 = +[UIApplication sharedApplication];
    v28 = (char *)[v27 applicationState];

    if (v28 != (unsigned char *)&dword_0 + 2) {
      +[PKAnalyticsReporter beginSubjectReporting:PKAnalyticsSubjectBridge];
    }
  }
  return v2;
}

- (void)dealloc
{
  +[PKAnalyticsReporter endSubjectReporting:PKAnalyticsSubjectBridge];
  unsigned int v3 = [(NPKPassbookBridgeSettingsController *)self settingsController];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)NPKPassbookBridgeSettingsController;
  [(NPKPassbookBridgeSettingsController *)&v4 dealloc];
}

- (id)localizedPaneTitle
{
  id v2 = [(NPKPassbookBridgeSettingsController *)self provisioningController];
  unsigned int v3 = [v2 isRegistrationSupported];

  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v5 = v4;
  if (v3) {
    CFStringRef v6 = @"PASSBOOK_PANE_TITLE";
  }
  else {
    CFStringRef v6 = @"PASSBOOK_PANE_TITLE_NO_PAYMENTS";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings"];

  return v7;
}

- (id)applicationBundleIdentifier
{
  return @"com.apple.Passbook";
}

- (BOOL)suppressMirrorOption
{
  return (NPKPairedOrPairingDeviceIsTinker() & 1) != 0 || PKPassbookIsCurrentlyAvailable() == 0;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    if ([(NPKPassbookBridgeSettingsController *)self showUpdateRequired])
    {
      uint64_t v4 = +[NSArray array];
      BOOL v5 = *(void **)&self->BPSNotificationAppController_opaque[v3];
      *(void *)&self->BPSNotificationAppController_opaque[v3] = v4;
    }
    else
    {
      v31.receiver = self;
      v31.super_class = (Class)NPKPassbookBridgeSettingsController;
      CFStringRef v6 = [(NPKPassbookBridgeSettingsController *)&v31 specifiers];
      v7 = v6;
      if (v6)
      {
        id v8 = v6;
      }
      else
      {
        id v8 = +[NSArray array];
      }
      v9 = v8;

      v10 = +[NSArray array];
      unsigned int v11 = [(NPKPassbookBridgeSettingsController *)self suppressMirrorOption];
      if (v11) {
        CFStringRef v12 = @"CUSTOM_RADIO_GROUP_ID";
      }
      else {
        CFStringRef v12 = @"MIRROR_RADIO_GROUP_ID";
      }
      v13 = [v9 specifierForID:v12];
      if (v11 && [(NPKPassbookBridgeSettingsController *)self mirrorSettings])
      {
        char v14 = objc_opt_respondsToSelector();
        v15 = pk_General_log();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

        if (v14)
        {
          if (v16)
          {
            v17 = pk_General_log();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v30 = 0;
              _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Notice: Should not mirror notification settings, making sure is disabled", v30, 2u);
            }
          }
          [(NPKPassbookBridgeSettingsController *)self setMirrorSettings:0];
        }
        else if (v16)
        {
          v18 = pk_General_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v30 = 0;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Warning: Should not mirror notification settings, but we can't disable it", v30, 2u);
          }
        }
      }
      if (![(NPKPassbookBridgeSettingsController *)self settingsMode])
      {
        id v19 = +[NSBundle bundleForClass:objc_opt_class()];
        v20 = [v19 localizedStringForKey:@"NOTIFICATIONS_GROUP_HEADER" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings"];
        [v13 setName:v20];

        id v21 = [(NPKPassbookBridgeSettingsController *)self settingsController];
        v22 = [v21 specifiers];
        id v23 = v22;
        if (v22)
        {
          id v24 = v22;
        }
        else
        {
          id v24 = +[NSArray array];
        }
        id v25 = v24;

        v10 = v25;
      }
      uint64_t v26 = [v10 arrayByAddingObjectsFromArray:v9];

      v27 = *(void **)&self->BPSNotificationAppController_opaque[v3];
      *(void *)&self->BPSNotificationAppController_opaque[v3] = v26;
    }
  }
  v28 = *(void **)&self->BPSNotificationAppController_opaque[v3];

  return v28;
}

- (id)localizedMirroringDetailFooter
{
  uint64_t v3 = +[NSBundle mainBundle];
  if ([(NPKPassbookBridgeSettingsController *)self showAlerts]) {
    CFStringRef v4 = @"SHOW_ALERTS_FOOTER";
  }
  else {
    CFStringRef v4 = @"DONT_SHOW_ALERTS_FOOTER";
  }
  BOOL v5 = [v3 localizedStringForKey:v4 value:&stru_2D2E8 table:@"Settings"];

  return v5;
}

- (Class)tableViewClass
{
  if ([(NPKPassbookBridgeSettingsController *)self showUpdateRequired])
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NPKPassbookBridgeSettingsController;
    uint64_t v3 = [(NPKPassbookBridgeSettingsController *)&v5 tableViewClass];
  }

  return v3;
}

- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Notice: prepare handling URL: %@ with specifier: %@@", (uint8_t *)&v12, 0x16u);
    }
  }
  return 1;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v81 = a4;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    BOOL v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_retainBlock(v81);
      *(_DWORD *)buf = 138412546;
      id v91 = v6;
      __int16 v92 = 2112;
      id v93 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Notice: handling URL: %@ withCompletion: %@", buf, 0x16u);
    }
  }
  unsigned int v11 = [(NPKPassbookBridgeSettingsController *)self settingsController];
  [v11 willHandleURL];

  v83 = [v6 objectForKeyedSubscript:@"action"];
  if ([v83 isEqualToString:@"ADD_CARD"])
  {
    int v12 = [v6 objectForKeyedSubscript:@"passTypeIdentifier"];
    uint64_t v13 = [v6 objectForKeyedSubscript:@"passSerialNumber"];
    __int16 v14 = (void *)v13;
    id v15 = 0;
    if (v12 && v13)
    {
      id v15 = PKGeneratePassUniqueID();
    }
    BOOL v16 = pk_Payment_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      v18 = pk_Payment_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v91 = v12;
        __int16 v92 = 2112;
        id v93 = v14;
        __int16 v94 = 2112;
        v95 = v15;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Notice: type ID %@ serial number %@ unique ID %@", buf, 0x20u);
      }
    }
    id v19 = +[UIApplication sharedApplication];
    v20 = (char *)[v19 applicationState];
    if (v15
      && ([(NPKPassbookBridgeSettingsController *)self paymentSetupDelegate],
          id v21 = objc_claimAutoreleasedReturnValue(),
          unsigned int v22 = [v21 hasPaymentPassWithUniqueID:v15],
          v21,
          v22))
    {
      BOOL v23 = v20 != (unsigned char *)&dword_0 + 2;
      id v24 = [(NPKPassbookBridgeSettingsController *)self paymentSetupDelegate];
      id v25 = [v24 passWithUniqueID:v15];
      uint64_t v26 = [v25 paymentPass];

      v27 = [(NPKPassbookBridgeSettingsController *)self settingsController];
      [(NPKPassbookBridgeSettingsController *)self settingsController:v27 requestsDetailViewControllerForPass:v26 animated:v23];

      if (v82) {
        v82[2]();
      }
    }
    else
    {
      if (v20 == (unsigned char *)&dword_0 + 2)
      {
        [(NPKPassbookBridgeSettingsController *)self _startPreflightBackgroundTaskIfNecessary];
        [(NPKPassbookBridgeSettingsController *)self setPerformingBackgroundPreflight:1];
      }
      v36 = [(NPKPassbookBridgeSettingsController *)self settingsController];
      v37 = v36;
      if (v15)
      {
        [v36 refreshPasses];

        objc_initWeak((id *)buf, self);
        v38 = [(NPKPassbookBridgeSettingsController *)self settingsController];
        v87[0] = _NSConcreteStackBlock;
        v87[1] = 3221225472;
        v87[2] = sub_6BBC;
        v87[3] = &unk_2C710;
        objc_copyWeak(&v89, (id *)buf);
        v88 = v82;
        [v38 addCardTappedForPaymentPassWithUniqueID:v15 withCompletion:v87];

        objc_destroyWeak(&v89);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        [v36 addCardTapped];

        if (v82) {
          v82[2]();
        }
      }
    }

    goto LABEL_37;
  }
  if ([v83 isEqualToString:@"ACCEPT_PP_TC"])
  {
    v28 = [(NPKPassbookBridgeSettingsController *)self paymentSetupDelegate];
    v29 = [v28 peerPaymentPassUniqueID];

    v30 = [(NPKPassbookBridgeSettingsController *)self paymentSetupDelegate];
    objc_super v31 = [v30 passWithUniqueID:v29];
    objc_super v32 = [v31 paymentPass];

    if (v32)
    {
      v33 = +[UIApplication sharedApplication];
      BOOL v34 = [v33 applicationState] != (char *)&dword_0 + 2;

      [(NPKPassbookBridgeSettingsController *)self setShouldNavigateToTermsAndConditions:1];
      __int16 v35 = [(NPKPassbookBridgeSettingsController *)self settingsController];
      [(NPKPassbookBridgeSettingsController *)self settingsController:v35 requestsDetailViewControllerForPass:v32 animated:v34];
    }
    if (v82) {
      v82[2]();
    }

    goto LABEL_37;
  }
  if ([v83 isEqualToString:@"ACCOUNT_PASS_REPROVISION"])
  {
    v39 = pk_Payment_log();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);

    if (v40)
    {
      v41 = pk_Payment_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "Notice: (account-pass-provisioning) handling account pass reprovision", buf, 2u);
      }
    }
    v42 = +[NSNotificationCenter defaultCenter];
    [v42 postNotificationName:@"PKRestartAccountPassProvisioningRequested" object:0];

    goto LABEL_37;
  }
  if ([v83 isEqualToString:@"DETAILS"])
  {
    v43 = pk_Payment_log();
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);

    if (v44)
    {
      v45 = pk_Payment_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, "Notice: Handling pass details presentation request", buf, 2u);
      }
    }
    v46 = [v6 objectForKeyedSubscript:@"passTypeIdentifier"];
    uint64_t v47 = [v6 objectForKeyedSubscript:@"passSerialNumber"];
    v48 = (void *)v47;
    if (v46 && v47 && (PKGeneratePassUniqueID(), (v49 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v50 = [(NPKPassbookBridgeSettingsController *)self paymentSetupDelegate];
      unsigned int v51 = [v50 hasPaymentPassWithUniqueID:v49];

      if (v51)
      {
        v52 = +[UIApplication sharedApplication];
        BOOL v53 = [v52 applicationState] != (char *)&dword_0 + 2;

        v54 = [(NPKPassbookBridgeSettingsController *)self paymentSetupDelegate];
        v55 = [v54 passWithUniqueID:v49];
        v56 = [v55 paymentPass];

        v57 = [(NPKPassbookBridgeSettingsController *)self settingsController];
        [(NPKPassbookBridgeSettingsController *)self settingsController:v57 requestsDetailViewControllerForPass:v56 animated:v53];
      }
      else
      {
        v74 = pk_Payment_log();
        BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);

        if (!v75) {
          goto LABEL_71;
        }
        v56 = pk_Payment_log();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v91 = v49;
          _os_log_impl(&dword_0, v56, OS_LOG_TYPE_DEFAULT, "Notice: Unable to complete pass details presentation request for %@ as no matching pass was found.", buf, 0xCu);
        }
      }
    }
    else
    {
      v70 = pk_Payment_log();
      BOOL v71 = os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT);

      if (!v71)
      {
        v49 = 0;
        goto LABEL_71;
      }
      v56 = pk_Payment_log();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v56, OS_LOG_TYPE_DEFAULT, "Notice: Skipped handling pass details presentation request because there is no valid passUniqueID.", buf, 2u);
      }
      v49 = 0;
    }

LABEL_71:
    if (v82) {
      v82[2]();
    }

    goto LABEL_37;
  }
  if (![v83 isEqualToString:@"HANDLE_PENDING_TRANSACTION"])
  {
    v84.receiver = self;
    v84.super_class = (Class)NPKPassbookBridgeSettingsController;
    [(NPKPassbookBridgeSettingsController *)&v84 handleURL:v6 withCompletion:v82];
    goto LABEL_37;
  }
  v58 = pk_Payment_log();
  BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);

  if (v59)
  {
    v60 = pk_Payment_log();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v60, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodeEvent] Handling pending transaction authentication pass.", buf, 2u);
    }
  }
  v61 = [v6 objectForKeyedSubscript:@"passTypeIdentifier"];
  uint64_t v62 = [v6 objectForKeyedSubscript:@"passSerialNumber"];
  v63 = (void *)v62;
  if (v61 && v62 && (PKGeneratePassUniqueID(), (id v64 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v65 = [(NPKPassbookBridgeSettingsController *)self pendingTransactionHandler];
    BOOL v66 = v65 == 0;

    if (v66)
    {
      v76 = +[UIApplication sharedApplication];
      BOOL v77 = [v76 applicationState] != (char *)&dword_0 + 2;

      v78 = [(NPKPassbookBridgeSettingsController *)self paymentSetupDelegate];
      v79 = [v78 passWithUniqueID:v64];
      v69 = [v79 paymentPass];

      v80 = [(NPKPassbookBridgeSettingsController *)self settingsController];
      v85[0] = _NSConcreteStackBlock;
      v85[1] = 3221225472;
      v85[2] = sub_6C3C;
      v85[3] = &unk_2C738;
      v85[4] = self;
      id v64 = v64;
      id v86 = v64;
      [(NPKPassbookBridgeSettingsController *)self _settingsController:v80 requestsDetailViewControllerForPass:v69 animated:v77 completion:v85];

LABEL_79:
      goto LABEL_80;
    }
    v67 = pk_Payment_log();
    BOOL v68 = os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT);

    if (v68)
    {
      v69 = pk_Payment_log();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v69, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodeEvent] Skipped handling pending transaction because there is an on-going session.", buf, 2u);
      }
      goto LABEL_79;
    }
  }
  else
  {
    v72 = pk_Payment_log();
    BOOL v73 = os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);

    if (v73)
    {
      v69 = pk_Payment_log();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v69, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodeEvent] Skipped handling pending transaction because there is no valid passUniqueID.", buf, 2u);
      }
      id v64 = 0;
      goto LABEL_79;
    }
    id v64 = 0;
  }
LABEL_80:
  if (v82) {
    v82[2]();
  }

LABEL_37:
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 0;
}

- (void)_handlePaymentPassDetailAppearedNotification:(id)a3
{
  if ([(NPKPassbookBridgeSettingsController *)self shouldNavigateToTermsAndConditions])
  {
    CFStringRef v4 = [(NPKPassbookBridgeSettingsController *)self navigationController];
    id v5 = [v4 topViewController];

    if (objc_opt_respondsToSelector()) {
      [v5 presentTermsAndConditions];
    }
    [(NPKPassbookBridgeSettingsController *)self setShouldNavigateToTermsAndConditions:0];
  }
}

- (void)_handleDatabaseChanged:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [v4 name];
      int v11 = 138412290;
      int v12 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Notice: Database changed, refreshing passes... (notification name = %@)", (uint8_t *)&v11, 0xCu);
    }
  }
  BOOL v9 = [(NPKPassbookBridgeSettingsController *)self settingsController];
  [v9 refreshPasses];

  id v10 = +[NSNotificationCenter defaultCenter];
  [v10 postNotificationName:PKPassLibraryDidChangeNotification object:0];
}

- (void)_handleDefaultCardChanged:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Refreshing default card...", v8, 2u);
    }
  }
  id v7 = [(NPKPassbookBridgeSettingsController *)self settingsController];
  [v7 refreshDefaultCard];
}

- (void)_handleCompanionPassesChanged:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass library changed, refreshing passes", buf, 2u);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6FB4;
  block[3] = &unk_2C6A8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_handlePreferencesChanged:(id)a3
{
  id v4 = [(NPKPassbookBridgeSettingsController *)self paymentSetupDelegate];
  unsigned int v5 = [v4 isSettingsControllerReloadNecessary];

  BOOL v6 = [(NPKPassbookBridgeSettingsController *)self provisioningController];
  unsigned int v7 = [v6 isSettingsControllerReloadNecessary];

  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109376;
      v11[1] = v5;
      __int16 v12 = 1024;
      unsigned int v13 = v7;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Notice: Preferences changed… delegate wants refresh %d, provisioning controller wants refresh %d", (uint8_t *)v11, 0xEu);
    }
  }
  if ((v5 | v7) == 1) {
    [(NPKPassbookBridgeSettingsController *)self reloadSpecifiers];
  }
}

- (void)_handlePeerPaymentWebServiceChanged:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Peer payment web service changed; refreshing status",
        v8,
        2u);
    }
  }
  unsigned int v7 = [(NPKPassbookBridgeSettingsController *)self settingsController];
  [v7 refreshPeerPaymentStatus];
}

- (void)_handleWillEnterForegroundNotification:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Got will enter foreground notification; reloading passes",
        buf,
        2u);
    }
  }
  unsigned int v7 = [(NPKPassbookBridgeSettingsController *)self paymentSetupDelegate];
  BOOL v8 = [v7 companionAgentConnection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_72EC;
  v9[3] = &unk_2C6A8;
  v9[4] = self;
  [v8 reloadPaymentPassesWithCompletion:v9];

  +[PKAnalyticsReporter beginSubjectReporting:PKAnalyticsSubjectBridge];
}

- (void)_handleDidEnterBackgroundNotification:(id)a3
{
  uint64_t v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Notice: Got did enter background notification", v6, 2u);
    }
  }
  +[PKAnalyticsReporter endSubjectReporting:PKAnalyticsSubjectBridge];
}

- (void)_handleApplicationDidBecomeActiveNotification:(id)a3
{
  BOOL v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Got application did become active notification", v8, 2u);
    }
  }
  unsigned int v7 = [(NPKPassbookBridgeSettingsController *)self settingsController];
  [v7 applicationDidBecomeActive];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    unsigned int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Notice: Wallet and Apple Pay settings controller will appear", buf, 2u);
    }
  }
  [(NPKPassbookBridgeSettingsController *)self reloadSpecifiers];
  BOOL v8 = [(NPKPassbookBridgeSettingsController *)self table];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = [(NPKPassbookBridgeSettingsController *)self table];
    [v10 setContext:4];
  }
  v11.receiver = self;
  v11.super_class = (Class)NPKPassbookBridgeSettingsController;
  [(NPKPassbookBridgeSettingsController *)&v11 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPKPassbookBridgeSettingsController;
  [(NPKPassbookBridgeSettingsController *)&v5 viewDidAppear:a3];
  BOOL v4 = [(NPKPassbookBridgeSettingsController *)self settingsController];
  [v4 viewDidAppear];
}

- (void)settingsController:(id)a3 requestsAddCardPreflightWithCompletion:(id)a4
{
  id v5 = a4;
  [(NPKPassbookBridgeSettingsController *)self _startPreflightBackgroundTaskIfNecessary];
  id v6 = [(NPKPassbookBridgeSettingsController *)self provisioningController];
  [v6 preflightWithCompletion:v5];
}

- (void)settingsController:(id)a3 requestsAddLocalCardPreflightWithCompletion:(id)a4
{
  id v5 = a4;
  [(NPKPassbookBridgeSettingsController *)self _startPreflightBackgroundTaskIfNecessary];
  id v6 = [(NPKPassbookBridgeSettingsController *)self provisioningController];
  [v6 preflightForLocalPassWithCompletion:v5];
}

- (void)settingsController:(id)a3 requestsReloadSpecifier:(id)a4
{
}

- (BOOL)isPresentingViewController
{
  id v2 = [(NPKPassbookBridgeSettingsController *)self presentedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)settingsController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  LODWORD(v7) = a5;
  id v9 = a4;
  id v10 = (void (**)(void))a6;
  objc_super v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    unsigned int v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v9;
      __int16 v31 = 1024;
      int v32 = v7;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Notice: Bridge settings controller requested to present view controller %@ animated %d", buf, 0x12u);
    }
  }
  unsigned int v14 = [(NPKPassbookBridgeSettingsController *)self _shouldPresentOrPushViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v9;
    BOOL v16 = [v15 title];
    BOOL v17 = [v15 message];
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    id v19 = v18;
    if (v16) {
      [v18 setObject:v16 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];
    }
    if (v17) {
      [v19 setObject:v17 forKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
    }
    v20 = +[NSError errorWithDomain:PKDisplayableErrorDomain code:0 userInfo:v19];
    char v21 = v14 & ~[(NPKPassbookBridgeSettingsController *)self _handleProvisioningPreflightFinishedWithSuccess:0 displayableError:v20];

    if ((v21 & 1) == 0) {
      goto LABEL_11;
    }
  }
  else if (!v14)
  {
LABEL_11:
    [(NPKPassbookBridgeSettingsController *)self _handleProvisioningPreflightFinishedWithSuccess:0 displayableError:0];
    if (v10) {
      v10[2](v10);
    }
    goto LABEL_18;
  }
  unsigned int v22 = +[UIApplication sharedApplication];
  BOOL v23 = (char *)[v22 applicationState];

  if (v23 == (unsigned char *)&dword_0 + 2) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v7;
  }
  id v24 = [(NPKPassbookBridgeSettingsController *)self splitViewController];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_7A3C;
  v25[3] = &unk_2C760;
  id v26 = v9;
  v27 = self;
  v28 = v10;
  [v24 presentViewController:v26 animated:v7 completion:v25];

LABEL_18:
}

- (void)settingsController:(id)a3 requestsPushViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Notice: Received request to push view controller %@", (uint8_t *)&v15, 0xCu);
    }
  }
  if ([(NPKPassbookBridgeSettingsController *)self _shouldPresentOrPushViewController])
  {
    objc_super v11 = [(NPKPassbookBridgeSettingsController *)self navigationController];
    [v11 pushViewController:v7 animated:v5];

    BOOL v12 = +[UIApplication sharedApplication];
    if ([v12 applicationState] == (char *)&dword_0 + 2) {
      [(NPKPassbookBridgeSettingsController *)self _launchBridgeInForegroundWithCompletion:0];
    }
LABEL_11:

    goto LABEL_12;
  }
  unsigned int v13 = pk_Payment_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    BOOL v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Notice: Ignoring request to push view controller because we are not the top view controller", (uint8_t *)&v15, 2u);
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (void)requestDismissingPresentedViewControllerWithSettingsController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    BOOL v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        CFStringRef v13 = @"YES";
      }
      else {
        CFStringRef v13 = @"NO";
      }
      id v14 = objc_retainBlock(v9);
      int v15 = 138412802;
      id v16 = v8;
      __int16 v17 = 2112;
      CFStringRef v18 = v13;
      __int16 v19 = 2112;
      id v20 = v14;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Notice: Received request to dismiss presented view controller with settings controller: %@ animated: %@ completion: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  [(NPKPassbookBridgeSettingsController *)self dismissViewControllerAnimated:v6 completion:v9];
}

- (void)requestResetToRootWithSettingsController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = @"NO";
      if (v4) {
        CFStringRef v10 = @"YES";
      }
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      CFStringRef v16 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Notice: Received request to reset to navigation root: %@ animated: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  BOOL v11 = [(NPKPassbookBridgeSettingsController *)self navigationController];
  id v12 = [v11 popToViewController:self animated:v4];
}

- (void)settingsController:(id)a3 requestsDetailViewControllerForPass:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_7F84;
  v9[3] = &unk_2C738;
  id v10 = a4;
  BOOL v11 = self;
  id v8 = v10;
  [(NPKPassbookBridgeSettingsController *)self _settingsController:a3 requestsDetailViewControllerForPass:v8 animated:v5 completion:v9];
}

- (void)_settingsController:(id)a3 requestsDetailViewControllerForPass:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(void))a6;
  if (v11
    && [(NPKPassbookBridgeSettingsController *)self _shouldPresentOrPushViewController])
  {
    id v44 = v10;
    int v13 = [(NPKPassbookBridgeSettingsController *)self groupsController];
    id v43 = v11;
    id v14 = [v11 uniqueID];
    id v15 = [v13 groupIndexForPassUniqueID:v14];

    v42 = v12;
    BOOL v41 = v7;
    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v45 = 0;
    }
    else
    {
      id v20 = [(NPKPassbookBridgeSettingsController *)self groupsController];
      v45 = [v20 groupAtIndex:v15];
    }
    id v21 = objc_alloc((Class)PKPaymentPassDetailViewController);
    unsigned int v22 = [(NPKPassbookBridgeSettingsController *)self groupsController];
    BOOL v23 = [(NPKPassbookBridgeSettingsController *)self paymentSetupDelegate];
    id v24 = [v23 webService];
    id v25 = [(NPKPassbookBridgeSettingsController *)self paymentSetupDelegate];
    id v26 = [v25 peerPaymentWebService];
    v27 = [(NPKPassbookBridgeSettingsController *)self paymentSetupDelegate];
    v28 = [(NPKPassbookBridgeSettingsController *)self provisioningController];
    id v11 = v43;
    id v29 = [v21 initWithPass:v43 group:v45 groupsController:v22 webService:v24 peerPaymentWebService:v26 style:2 passLibraryDataProvider:v27 paymentServiceDataProvider:v28];

    id v30 = [(NPKPassbookBridgeSettingsController *)self paymentSetupDelegate];
    [v29 setDeleteOverrider:v30];

    __int16 v31 = +[PSListController appearance];
    int v32 = [v31 textColor];
    [v29 setPrimaryTextColor:v32];

    v33 = +[PSListController appearance];
    BOOL v34 = [v33 altTextColor];
    [v29 setDetailTextColor:v34];

    __int16 v35 = +[PSListController appearance];
    v36 = [v35 buttonTextColor];
    [v29 setLinkTextColor:v36];

    v37 = +[UIColor systemRedColor];
    [v29 setWarningTextColor:v37];

    v38 = +[PSListController appearance];
    v39 = [v38 cellHighlightColor];
    [v29 setHighlightColor:v39];

    +[CATransaction begin];
    BOOL v40 = [(NPKPassbookBridgeSettingsController *)self settingsController];
    [(NPKPassbookBridgeSettingsController *)self settingsController:v40 requestsPushViewController:v29 animated:v41];

    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_84DC;
    v46[3] = &unk_2C788;
    id v12 = v42;
    uint64_t v47 = v42;
    +[CATransaction setCompletionBlock:v46];
    +[CATransaction commit];

    id v10 = v44;
  }
  else
  {
    CFStringRef v16 = pk_Payment_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      CFStringRef v18 = pk_Payment_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = [v11 uniqueID];
        *(_DWORD *)buf = 138412290;
        v49 = v19;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Notice: Unable to push pass detail view controller for pass: %@", buf, 0xCu);
      }
    }
    if (v12) {
      v12[2](v12);
    }
  }
}

- (BOOL)_shouldPresentOrPushViewController
{
  BOOL v3 = [(NPKPassbookBridgeSettingsController *)self navigationController];
  BOOL v4 = [v3 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [v4 childViewControllers];
    unsigned __int8 v6 = [v5 containsObject:self];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)settingsControllerRequestsPresentPrivacyWithPresenter:(id)a3
{
  id v5 = a3;
  if ([(NPKPassbookBridgeSettingsController *)self _shouldPresentOrPushViewController])
  {
    BOOL v4 = [(NPKPassbookBridgeSettingsController *)self splitViewController];
    [v5 setPresentingViewController:v4];

    [v5 present];
  }
}

- (void)settingsController:(id)a3 requestsAuthenticationChallengeForAppleAccountInformation:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  [v9 setPresentingViewController:self];
  id v10 = [v8 appleID];
  [v9 setUsername:v10];

  id v11 = [v8 aaAlternateDSID];

  [v9 setAltDSID:v11];
  [v9 setIsUsernameEditable:0];
  [v9 setShouldPromptForPasswordOnly:1];
  [v9 setAuthenticationType:2];
  id v12 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_8750;
  v14[3] = &unk_2C7D8;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [v12 authenticateWithContext:v9 completion:v14];
}

- (void)settingsController:(id)a3 requestsPushViewControllers:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a4;
  if ([v10 count])
  {
    id v7 = [(NPKPassbookBridgeSettingsController *)self navigationController];
    id v8 = [v7 viewControllers];
    id v9 = [v8 mutableCopy];

    [v9 addObjectsFromArray:v10];
    [v7 setViewControllers:v9 animated:v5];
  }
}

- (void)settingsController:(id)a3 requestShowPeerPaymentAssociatedAccountsFlowWithController:(id)a4 withPresentationContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(NPKPassbookBridgeSettingsController *)self navigationController];
  [v8 presentAssociatedAccountsFlowWithPresentationContext:v7 fromNavigationController:v9];
}

- (void)settingsController:(id)a3 requestsPresentInboxMessage:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  if (a6) {
    (*((void (**)(id))a6 + 2))(a6);
  }
}

- (void)settingsController:(id)a3 requestsPresentAuthorizationFlowWithRedirectURL:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  unsigned __int8 v6 = (void (**)(void))a6;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Warning: Unhandled call to settingsController:requestsPresentInboxMessage:animated:completion:", v10, 2u);
    }
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)_startPreflightBackgroundTaskIfNecessary
{
  if ([(NPKPassbookBridgeSettingsController *)self backgroundPreflightingTaskIdentifier] == UIBackgroundTaskInvalid)
  {
    +[UIApplication sharedApplication];
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_8D40;
    v9[3] = &unk_2C800;
    void v9[4] = self;
    id v11 = &v12;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v3;
    id v4 = [v3 beginBackgroundTaskWithName:@"Apple Pay preflight" expirationHandler:v9];
    v13[3] = (uint64_t)v4;
    [(NPKPassbookBridgeSettingsController *)self setBackgroundPreflightingTaskIdentifier:v4];
    BOOL v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = v13[3];
        *(_DWORD *)buf = 134217984;
        uint64_t v17 = v8;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Notice: Began preflight background task: %lu", buf, 0xCu);
      }
    }
    _Block_object_dispose(&v12, 8);
  }
}

- (void)_endPreflightBackgroundTaskIfNecessary
{
  unint64_t v3 = [(NPKPassbookBridgeSettingsController *)self backgroundPreflightingTaskIdentifier];
  if (v3 != UIBackgroundTaskInvalid)
  {
    unint64_t v4 = v3;
    BOOL v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134217984;
        unint64_t v10 = v4;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Notice: Ending preflight background task: %lu", (uint8_t *)&v9, 0xCu);
      }
    }
    uint64_t v8 = +[UIApplication sharedApplication];
    [v8 endBackgroundTask:v4];

    [(NPKPassbookBridgeSettingsController *)self setBackgroundPreflightingTaskIdentifier:UIBackgroundTaskInvalid];
  }
}

- (BOOL)_handleProvisioningPreflightFinishedWithSuccess:(BOOL)a3 displayableError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(NPKPassbookBridgeSettingsController *)self performingBackgroundPreflight];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_904C;
  v18[3] = &unk_2C828;
  v18[4] = self;
  uint64_t v8 = objc_retainBlock(v18);
  if ([(NPKPassbookBridgeSettingsController *)self performingBackgroundPreflight] && v4)
  {
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_91D4;
    uint64_t v14 = &unk_2C850;
    char v17 = 1;
    id v15 = v6;
    CFStringRef v16 = v8;
    [(NPKPassbookBridgeSettingsController *)self _launchBridgeInForegroundWithCompletion:&v11];

    if (!v7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  ((void (*)(void *, BOOL, id))v8[2])(v8, v4, v6);
  if (v7)
  {
LABEL_6:
    int v9 = +[UIApplication sharedApplication];
    LOBYTE(v7) = [v9 applicationState] == (char *)&dword_0 + 2;
  }
LABEL_7:

  return v7;
}

- (void)_launchBridgeInForegroundWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Bringing Bridge to the foreground", buf, 2u);
    }
  }
  BOOL v7 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  uint64_t v8 = +[NSBundle mainBundle];
  int v9 = [v8 bundleIdentifier];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  _DWORD v11[2] = sub_93BC;
  v11[3] = &unk_2C878;
  id v12 = v3;
  id v10 = v3;
  [v7 openApplication:v9 withOptions:0 completion:v11];
}

- (void)allowEnableExpressGymKitWithVisibleViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = self;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassbookBridgeSettingsController: requested allow enable GymKit with view controller: %@", buf, 0xCu);
    }
  }
  if (v6 && v7)
  {
    id v11 = [(NPKPassbookBridgeSettingsController *)self provisioningController];
    id v12 = [v11 expressPassConfigurations];

    id v13 = pk_Payment_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      id v15 = pk_Payment_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v16 = (NPKPassbookBridgeSettingsController *)[v12 count];
        *(_DWORD *)buf = 134217984;
        v38 = v16;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassbookBridgeSettingsController: found %lu express passes.", buf, 0xCu);
      }
    }
    if ([v12 count] == (char *)&dword_0 + 1)
    {
      char v17 = [v12 anyObject];
      CFStringRef v18 = [v17 passInformation];
      unsigned __int8 v19 = objc_msgSend(v18, "npk_hasImmediateAutomaticSelectionCriterion");

      if (v19)
      {
        if (v17)
        {
          id v20 = [v17 passUniqueIdentifier];
          id v21 = [(NPKPassbookBridgeSettingsController *)self provisioningController];
          unsigned int v22 = [v21 passLibraryDataProvider];
          BOOL v23 = [v22 passWithUniqueID:v20];

          id v24 = pk_Payment_log();
          BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

          if (v23)
          {
            if (v25)
            {
              id v26 = pk_Payment_log();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v38 = v20;
                _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassbookBridgeSettingsController: found one pass with unique ID %@ that conflicts with GymKit", buf, 0xCu);
              }
            }
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472;
            v33[2] = sub_993C;
            v33[3] = &unk_2C8C8;
            v33[4] = self;
            BOOL v34 = v20;
            id v35 = v6;
            id v36 = v7;
            [(NPKPassbookBridgeSettingsController *)self _promptUserAboutGymKitConflictWithPass:v23 visibleViewController:v35 completion:v33];
          }
          else
          {
            if (v25)
            {
              int v32 = pk_Payment_log();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v38 = v20;
                _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "Warning: NPKPassbookBridgeSettingsController: have express pass information for a conflicting pass with unique ID %@, but no pass on the device", buf, 0xCu);
              }
            }
            (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
          }

LABEL_29:
          goto LABEL_30;
        }
      }
      else
      {
      }
    }
    id v29 = pk_Payment_log();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

    if (v30)
    {
      __int16 v31 = pk_Payment_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassbookBridgeSettingsController: no passes that conflict with GymKit", buf, 2u);
      }
    }
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
    goto LABEL_29;
  }
  v27 = pk_Payment_log();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

  if (v28)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassbookBridgeSettingsController: missing completion block or view controller", buf, 2u);
    }
    goto LABEL_29;
  }
LABEL_30:
}

- (void)_promptUserAboutGymKitConflictWithPass:(id)a3 visibleViewController:(id)a4 completion:(id)a5
{
  id v30 = a5;
  id v31 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 uniqueID];
  BOOL v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = v8;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassbookBridgeSettingsController: prompting user about disabling express mode for conflicting pass with unique ID %@", buf, 0xCu);
    }
  }
  v27 = (void *)v8;
  id v12 = +[NSBundle bundleForClass:objc_opt_class()];
  id v29 = [v12 localizedStringForKey:@"EXPRESS_GYMKIT_CONFLICT_TITLE" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];

  id v13 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v14 = [v13 localizedStringForKey:@"EXPRESS_GYMKIT_CONFLICT_MESSAGE" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];
  id v15 = [v7 localizedDescription];

  BOOL v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);

  CFStringRef v16 = +[UIAlertController alertControllerWithTitle:v29 message:v28 preferredStyle:1];
  char v17 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v18 = [v17 localizedStringForKey:@"EXPRESS_GYMKIT_CONFLICT_ERROR_ACKNOWLEDGE_BUTTON_TITLE" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_9F68;
  v35[3] = &unk_2C8F0;
  id v19 = v27;
  id v36 = v19;
  id v20 = v30;
  id v37 = v20;
  id v21 = +[UIAlertAction actionWithTitle:v18 style:1 handler:v35];
  [v16 addAction:v21];

  unsigned int v22 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v23 = [v22 localizedStringForKey:@"EXPRESS_GYMKIT_CONFLICT_ERROR_CANCEL_BUTTON_TITLE" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_A04C;
  v32[3] = &unk_2C8F0;
  id v33 = v19;
  id v34 = v20;
  id v24 = v20;
  id v25 = v19;
  id v26 = +[UIAlertAction actionWithTitle:v23 style:0 handler:v32];
  [v16 addAction:v26];

  [v31 presentViewController:v16 animated:1 completion:0];
}

- (void)_setupPendingTransactionHandlerForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [NPKBridgePendingTransactionHandler alloc];
  id v6 = [(NPKPassbookBridgeSettingsController *)self paymentSetupDelegate];
  id v7 = [v6 companionAgentConnection];
  uint64_t v8 = [(NPKBridgePendingTransactionHandler *)v5 initWithPassUniqueID:v4 companionAgentConnection:v7];

  [(NPKBridgePendingTransactionHandler *)v8 setDelegate:self];
  [(NPKPassbookBridgeSettingsController *)self setPendingTransactionHandler:v8];
}

- (id)presentingViewControllerForPendingTransactionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKPassbookBridgeSettingsController *)self pendingTransactionHandler];

  if (v5 == v4)
  {
    id v6 = [(NPKPassbookBridgeSettingsController *)self pkui_frontMostViewController];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)pendingTransactionHandlerDidComplete:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKPassbookBridgeSettingsController *)self pendingTransactionHandler];

  if (v5 == v4)
  {
    [(NPKPassbookBridgeSettingsController *)self setPendingTransactionHandler:0];
  }
}

- (NPKStockholmProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
}

- (NPKPassbookPaymentSetupDelegate)paymentSetupDelegate
{
  return self->_paymentSetupDelegate;
}

- (void)setPaymentSetupDelegate:(id)a3
{
}

- (PKPassbookSettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
}

- (PKGroupsController)groupsController
{
  return self->_groupsController;
}

- (void)setGroupsController:(id)a3
{
}

- (unint64_t)backgroundPreflightingTaskIdentifier
{
  return self->_backgroundPreflightingTaskIdentifier;
}

- (void)setBackgroundPreflightingTaskIdentifier:(unint64_t)a3
{
  self->_backgroundPreflightingTaskIdentifier = a3;
}

- (BOOL)performingBackgroundPreflight
{
  return self->_performingBackgroundPreflight;
}

- (void)setPerformingBackgroundPreflight:(BOOL)a3
{
  self->_performingBackgroundPreflight = a3;
}

- (BOOL)shouldNavigateToTermsAndConditions
{
  return self->_shouldNavigateToTermsAndConditions;
}

- (void)setShouldNavigateToTermsAndConditions:(BOOL)a3
{
  self->_shouldNavigateToTermsAndConditions = a3;
}

- (BOOL)showUpdateRequired
{
  return self->_showUpdateRequired;
}

- (void)setShowUpdateRequired:(BOOL)a3
{
  self->_showUpdateRequired = a3;
}

- (NPKBridgePendingTransactionHandler)pendingTransactionHandler
{
  return self->_pendingTransactionHandler;
}

- (void)setPendingTransactionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTransactionHandler, 0);
  objc_storeStrong((id *)&self->_groupsController, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_paymentSetupDelegate, 0);

  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end