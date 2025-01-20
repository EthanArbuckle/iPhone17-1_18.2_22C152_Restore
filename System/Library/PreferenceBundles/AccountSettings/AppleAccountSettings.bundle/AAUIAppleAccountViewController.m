@interface AAUIAppleAccountViewController
+ (BOOL)_isSplitView;
- (AAUIAppleAccountViewController)init;
- (BOOL)_activeFaceTimeCall;
- (BOOL)_hasActiveSpecifier;
- (BOOL)_isBeneficiaryAccount;
- (BOOL)_isDemoAccount;
- (BOOL)_isEnabledForAccount:(id)a3;
- (BOOL)_isPasswordRequiredToValidateAppleAccount:(id)a3;
- (BOOL)_isRestoringFromiCloud;
- (BOOL)_isSingleIdentity;
- (BOOL)_setupForNetworkActivity;
- (BOOL)_shouldShowDeleteAccountButton;
- (BOOL)_shouldShowStoreSettings;
- (BOOL)operationsHelper:(id)a3 shouldRemoveAccount:(id)a4;
- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5;
- (BOOL)shouldShowRecoveryContactUpsellTip;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (id)_RUITableViewSectionForDevice:(id)a3 inPage:(id)a4 delegate:(id)a5;
- (id)_accountAutoVerifier;
- (id)_accountForService:(id)a3 matchingAltDSID:(id)a4 DSID:(id)a5;
- (id)_accountStore;
- (id)_activeAccount;
- (id)_appleAccount;
- (id)_authController;
- (id)_backupStatusString;
- (id)_cloudSpecifierForAccount:(id)a3;
- (id)_deviceSpecificLocalizedStringKey:(id)a3;
- (id)_familySpecifierProvider;
- (id)_fmipStatusString;
- (id)_gameCenterAccount;
- (id)_grandSlamAccount;
- (id)_grandSlamSigner;
- (id)_identityCardViewController;
- (id)_loadRemoteRequest:(id)a3 withIdentifier:(id)a4 preparation:(id)a5 completion:(id)a6;
- (id)_messageForError:(id)a3 account:(id)a4;
- (id)_passcodeValueFromPage:(id)a3 withFieldIdentifier:(id)a4;
- (id)_paymentSpecifierProvider;
- (id)_personNameComponents;
- (id)_personNameComponentsForAccountCollection:(id)a3;
- (id)_profilePictureStore;
- (id)_recoveryContactUpsellViewController;
- (id)_shouldRestrictSignoutMessage;
- (id)_siwaSpecifierForAccount:(id)a3;
- (id)_specifiersForAccountGroup;
- (id)_specifiersForDevicesGroup;
- (id)_specifiersForFamily;
- (id)_specifiersForFollowupGroup;
- (id)_specifiersForServicesGroup;
- (id)_specifiersForSignoutGroup;
- (id)_specifiersForStore;
- (id)_storeAccount;
- (id)_storeSpecifier;
- (id)_storeSpecifierForAccount:(id)a3;
- (id)_storeSpecifierProvider;
- (id)_titleForError:(id)a3 account:(id)a4;
- (id)_valueForCloudSpecifier:(id)a3;
- (id)_valueForPaymentSpecifier:(id)a3;
- (id)_valueForServiceSpecifier:(id)a3;
- (id)accountsForAccountManager:(id)a3;
- (id)followUpUniqueIdentifier;
- (id)remoteUIController:(id)a3 createPageWithName:(id)a4 attributes:(id)a5;
- (id)specifierForID:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (unint64_t)_reloadOptionsForChangesFromAccounts:(id)a3 toAccounts:(id)a4;
- (void)_accountEmailBecameVerified;
- (void)_addHeadersToRequest:(id)a3;
- (void)_attemptSignInForServiceType:(id)a3;
- (void)_attemptUpdateAuthControllerWithActionableResponse:(id)a3;
- (void)_autoVerifyAccount;
- (void)_beginObservingCallStatusChanges;
- (void)_beginObservingEmailVerificationStatus;
- (void)_beginObservingProfilePictureStoreDidChangeNotification;
- (void)_beginObservingiCloudRestoreStatus;
- (void)_beginValidationForAccount:(id)a3;
- (void)_cancelButtonForRemoteObjectModelWasTapped:(id)a3;
- (void)_checkNetworkReachabilityAndValidateAccount;
- (void)_cleanupFromNetworkActivity;
- (void)_clearCachedSpecifierValues;
- (void)_cloudSpecifierWasTapped:(id)a3;
- (void)_contactSpecifierWasTapped:(id)a3;
- (void)_deleteButtonTapped:(id)a3;
- (void)_deviceLocatorStateDidChange:(id)a3;
- (void)_didFinishSecondaryAuthentication;
- (void)_enableAllProvisionedDataclasses;
- (void)_forgetSpecifiers;
- (void)_generateLoginCode;
- (void)_getServerUILoadDelegateWithCompletion:(id)a3;
- (void)_handleAccountAutoVerificationCompletionWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_handleAccountBeneficiaryURL:(id)a3;
- (void)_handleAccountRecoveryURL:(id)a3;
- (void)_handleAccountRegistrationCompletionWithResult:(BOOL)a3 error:(id)a4;
- (void)_handleAccountRevalidationCompletionWithValidatedAccount:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_handleAuthActionURL:(id)a3;
- (void)_handleAuthkitFollowUpServerUI:(id)a3;
- (void)_handleCDPActionURL:(id)a3;
- (void)_handleChangePasswordActionURL:(id)a3;
- (void)_handleEDPTokenPane;
- (void)_handleOONAddressVettingActionURL:(id)a3;
- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5;
- (void)_handlePaymentMethodSummaryResponse:(id)a3;
- (void)_handleSecondaryAuthenticationResponse:(id)a3 baseURL:(id)a4 completion:(id)a5;
- (void)_handleUpgradeSecurityLevelActionURL:(id)a3;
- (void)_handleiForgotActionURL:(id)a3;
- (void)_imageControlTapped;
- (void)_issueFindMyiPhonePromptWithTitle:(id)a3 andMessage:(id)a4;
- (void)_layoutIdentityCardHeader;
- (void)_layoutTableHeaderView;
- (void)_loadCloudKitSettingsBundleIfNeeded;
- (void)_loadCloudStorageSummary;
- (void)_loadPaymentMethodSummary;
- (void)_loadRemoteRequest:(id)a3 withIdentifier:(id)a4 specifier:(id)a5;
- (void)_paymentSpecifierWasTapped:(id)a3;
- (void)_performNetworkValidation;
- (void)_postCDPRepairFollowUp;
- (void)_presentFirstAlertIfNecessary;
- (void)_presentValidationErrorAlert:(id)a3 account:(id)a4;
- (void)_profilePictureStoreDidChange:(id)a3;
- (void)_promptForAccountSignOutAppleAccount:(id)a3 storeAccount:(id)a4 completion:(id)a5;
- (void)_promptUserToEnableFindMyiPhoneIfPossible;
- (void)_pushSecondaryAuthenticationRemoteUI:(id)a3 baseURL:(id)a4 withCompletion:(id)a5;
- (void)_reachabilityChanged:(BOOL)a3;
- (void)_refreshAppleIDSettingsTokensWithCompletion:(id)a3;
- (void)_registerAccount;
- (void)_reloadSignoutGroupSpecifiersForName:(id)a3;
- (void)_requestSecondaryAuthenticationIfNecessaryWithGSToken:(id)a3 completion:(id)a4;
- (void)_retryRequest:(id)a3 inRemoteUIController:(id)a4 completion:(id)a5;
- (void)_revalidateAccount;
- (void)_securitySpecifierWasTapped:(id)a3;
- (void)_setupAppleAccountHeader;
- (void)_setupIdentityCardHeader;
- (void)_setupNavigationBarButtons;
- (void)_showAccountDetailsUnavailableAlert;
- (void)_showAlertWithTitle:(id)a3 message:(id)a4;
- (void)_showEDPTokenPaneWithToken:(id)a3 onViewController:(id)a4;
- (void)_showGenericTermsUI;
- (void)_showTermsAndConditionsButtonTapped:(id)a3;
- (void)_siwaSpecifierWasTapped:(id)a3;
- (void)_startMonitoringReachability;
- (void)_startObservingAccountStoreChanges;
- (void)_startObservingDeviceLocatorStateChanges;
- (void)_startObservingPresentCustodianSetupNotification;
- (void)_startObservingQuotaChangeNotifications;
- (void)_startObservingRCUpsellTipDismissedNotification;
- (void)_startSpinnerInSpecifier:(id)a3;
- (void)_stopMonitoringReachability;
- (void)_stopObservingAccountStoreChanges;
- (void)_stopObservingCallStatusChanges;
- (void)_stopObservingDeviceLocatorStateChanges;
- (void)_stopObservingEmailVerificationStatus;
- (void)_stopObservingPresentCustodianSetupNotification;
- (void)_stopObservingProfilePictureStoreDidChangeNotification;
- (void)_stopObservingQuotaChangeNotifications;
- (void)_stopObservingRCUpsellTipDismissedNotification;
- (void)_stopObservingiCloudRestoreStatus;
- (void)_stopSpinnerInActiveSpecifier;
- (void)_storeSpecifierWasTapped:(id)a3;
- (void)_subscriptionsSpecifierWasTapped:(id)a3;
- (void)_updateAccountTermsInformation;
- (void)_updateLocalAccountInformationFromClientInfo:(id)a3;
- (void)custodianSetupFlowControllerDidFinish:(id)a3;
- (void)custodianSetupFlowControllerRecoveryContactInviteSent;
- (void)dealloc;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)endUpdates;
- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4;
- (void)handleURL:(id)a3;
- (void)headerViewDidTapImageControl:(id)a3;
- (void)insertSpecifier:(id)a3 afterSpecifierNamed:(id)a4 animated:(BOOL)a5;
- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6;
- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4;
- (void)presentCustodianSetupFlow:(id)a3;
- (void)refreshDetailTextForTableCellWithTag:(int64_t)a3;
- (void)reloadSpecifierForProvider:(id)a3 identifier:(id)a4;
- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5;
- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4;
- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4;
- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)remoteUIControllerDidDismiss:(id)a3;
- (void)setAccountWasPromoted:(BOOL)a3;
- (void)setShouldAttemptToEnableDataclasses:(BOOL)a3;
- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5;
- (void)signInControllerDidCancel:(id)a3;
- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4;
- (void)specifierProvider:(id)a3 loadRequest:(id)a4 withIdentifier:(id)a5 specifier:(id)a6;
- (void)specifierProvider:(id)a3 showViewController:(id)a4;
- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation AAUIAppleAccountViewController

- (void)dealloc
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "AAUIAppleAccountViewController dealloc", buf, 2u);
  }

  [(AAUIAppleAccountViewController *)self _stopObservingiCloudRestoreStatus];
  [(NSMutableDictionary *)self->_objectModelDecorators removeAllObjects];
  [(AAUIAppleAccountViewController *)self _stopObservingDeviceLocatorStateChanges];
  [(AAUIAppleAccountViewController *)self _stopObservingEmailVerificationStatus];
  [(AAUIAppleAccountViewController *)self _stopObservingAccountStoreChanges];
  [(AAUIAppleAccountViewController *)self _stopObservingProfilePictureStoreDidChangeNotification];
  [(AAUIAppleAccountViewController *)self _stopMonitoringReachability];
  [(AAUIAppleAccountViewController *)self _stopObservingPresentCustodianSetupNotification];
  [(AAUIAppleAccountViewController *)self _stopObservingRCUpsellTipDismissedNotification];
  [(AAUIAppleAccountViewController *)self _stopObservingQuotaChangeNotifications];
  [(AAUIAppleAccountViewController *)self _stopObservingCallStatusChanges];
  [(NSOperationQueue *)self->_networkActivityQueue cancelAllOperations];
  v4.receiver = self;
  v4.super_class = (Class)AAUIAppleAccountViewController;
  [(AAUIAppleAccountViewController *)&v4 dealloc];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSOperationQueue *)self->_networkActivityQueue cancelAllOperations];
  v5.receiver = self;
  v5.super_class = (Class)AAUIAppleAccountViewController;
  [(AAUIAppleAccountViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AAUIAppleAccountViewController;
  [(AAUIAppleAccountViewController *)&v4 viewWillAppear:a3];
  if (+[AAUIAppleAccountViewController _isSplitView]) {
    [(AAUIAppleAccountViewController *)self _loadCloudStorageSummary];
  }
  [(AAUIAppleAccountViewController *)self _setupIdentityCardHeader];
}

- (void)willMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIAppleAccountViewController;
  [(AAUIAppleAccountViewController *)&v6 willMoveToParentViewController:a3];
  objc_super v4 = [(AAUIRemoteUIController *)self->_activeRemoteUIController loader];
  [v4 cancel];

  [(AAUIRemoteUIController *)self->_activeRemoteUIController setNavigationController:0];
  activeRemoteUIController = self->_activeRemoteUIController;
  self->_activeRemoteUIController = 0;
}

- (id)_deviceSpecificLocalizedStringKey:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:v3];

  objc_super v6 = [v4 localizedStringForKey:v5 value:&stru_76890 table:@"Localizable"];

  return v6;
}

- (AAUIAppleAccountViewController)init
{
  v23.receiver = self;
  v23.super_class = (Class)AAUIAppleAccountViewController;
  v2 = [(AAUIAppleAccountViewController *)&v23 init];
  id v3 = v2;
  if (v2)
  {
    v2->_allowAccountRevalidation = 1;
    v2->_iCloudRestoreToken = -1;
    objc_super v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    objectModelDecorators = v3->_objectModelDecorators;
    v3->_objectModelDecorators = v4;

    v3->_emailVerificationToken = -1;
    objc_super v6 = (NSLock *)objc_alloc_init((Class)NSLock);
    accountValidationLock = v3->_accountValidationLock;
    v3->_accountValidationLock = v6;

    [(NSLock *)v3->_accountValidationLock setName:@"AAAccountValidationLock"];
    v8 = +[ACAccountStore defaultStore];
    v9 = (AIDAServiceOwnerProtocol *)[objc_alloc((Class)AIDAServiceOwnersManager) initWithAccountStore:v8];
    serviceOwnersManager = v3->_serviceOwnersManager;
    v3->_serviceOwnersManager = v9;

    v11 = (AIDAAccountManager *)[objc_alloc((Class)AIDAAccountManager) initWithAccountStore:v8];
    accountManager = v3->_accountManager;
    v3->_accountManager = v11;

    [(AIDAAccountManager *)v3->_accountManager setDelegate:v3];
    uint64_t v13 = +[AAUIDeviceLocatorService sharedInstance];
    deviceLocatorService = v3->_deviceLocatorService;
    v3->_deviceLocatorService = (AAUIDeviceLocatorService *)v13;

    [(AAUIAppleAccountViewController *)v3 _startObservingDeviceLocatorStateChanges];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.appleaccountsettings.accountwork", v15);
    accountWorkQueue = v3->_accountWorkQueue;
    v3->_accountWorkQueue = (OS_dispatch_queue *)v16;

    v18 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    networkActivityQueue = v3->_networkActivityQueue;
    v3->_networkActivityQueue = v18;

    v20 = v3->_networkActivityQueue;
    v21 = dispatch_get_global_queue(33, 0);
    [(NSOperationQueue *)v20 setUnderlyingQueue:v21];

    [(AAUIAppleAccountViewController *)v3 _beginObservingiCloudRestoreStatus];
    [(AAUIAppleAccountViewController *)v3 _beginObservingEmailVerificationStatus];
    [(AAUIAppleAccountViewController *)v3 _startObservingAccountStoreChanges];
    [(AAUIAppleAccountViewController *)v3 _startMonitoringReachability];
    if ([(AAUIAppleAccountViewController *)v3 shouldShowRecoveryContactUpsellTip])
    {
      [(AAUIAppleAccountViewController *)v3 _startObservingPresentCustodianSetupNotification];
      [(AAUIAppleAccountViewController *)v3 _startObservingRCUpsellTipDismissedNotification];
    }
    [(AAUIAppleAccountViewController *)v3 _beginObservingCallStatusChanges];
    v3->_shouldIgnoreQuotaCache = 1;
    [(AAUIAppleAccountViewController *)v3 _startObservingQuotaChangeNotifications];
  }
  return v3;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AAUIAppleAccountViewController;
  [(AAUIAppleAccountViewController *)&v3 viewDidLoad];
  [(AAUIAppleAccountViewController *)self _setupNavigationBarButtons];
}

- (BOOL)shouldShowRecoveryContactUpsellTip
{
  if (!+[AAUIFeatureFlags isRecoveryContactUpsellTipEnabled])return 0; {
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.appleaccount"];
  }
  objc_super v3 = [v2 valueForKey:@"RecoveryContactUpsellTipAction"];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)_setupNavigationBarButtons
{
  id v10 = [(AAUIAppleAccountViewController *)self navigationItem];
  if (([(AAUIAppleAccountViewController *)self isPresentedAsModalSheet] & 1) == 0) {
    [v10 setRightBarButtonItem:0];
  }
  [(AAUIAppleAccountViewController *)self setCancelButton:0];
  [v10 setLeftBarButtonItem:0];
  [v10 setHidesBackButton:0];
  objc_super v3 = [(AAUIAppleAccountViewController *)self _appleAccount];
  if (objc_msgSend(v3, "aa_isManagedAppleID") && objc_msgSend(v3, "aa_isRemotelyManaged"))
  {
    BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
    objc_super v5 = @"APPLEID_TITLE_MANAGED";
    if (([@"APPLEID_TITLE_MANAGED" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      int v6 = 0;
    }
    else
    {
      objc_super v5 = [@"APPLEID_TITLE_MANAGED" stringByAppendingString:@"_REBRAND"];
      int v6 = 1;
    }
    v9 = [v4 localizedStringForKey:v5 value:&stru_76890 table:@"Localizable"];
    [v10 setTitle:v9];

    if (!v6) {
      goto LABEL_14;
    }
LABEL_13:

    goto LABEL_14;
  }
  BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v5 = @"APPLEID_TITLE";
  if (([@"APPLEID_TITLE" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    char v7 = 0;
  }
  else
  {
    objc_super v5 = [@"APPLEID_TITLE" stringByAppendingString:@"_REBRAND"];
    char v7 = 1;
  }
  v8 = [v4 localizedStringForKey:v5 value:&stru_76890 table:@"Localizable"];
  [v10 setTitle:v8];

  if (v7) {
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_setupAppleAccountHeader
{
  objc_super v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_4A6C0();
  }

  uint64_t v4 = [(AAUIAppleAccountViewController *)self _appleAccount];
  uint64_t v5 = [(AAUIAppleAccountViewController *)self _storeAccount];
  int v6 = (void *)v5;
  if (v4 | v5)
  {
    if (v4) {
      v9 = (void *)v4;
    }
    else {
      v9 = (void *)v5;
    }
    id v10 = v9;
    v11 = [(AAUIAppleAccountViewController *)self _profilePictureStore];
    v8 = [v11 profilePictureForAccountOwner];

    v12 = objc_msgSend(v10, "aa_formattedUsername");

    uint64_t v13 = -[AAUIAppleAccountHeaderView initWithLabelInsets:]([AAUIAppleAccountHeaderView alloc], "initWithLabelInsets:", 3.0, 24.8013158, 3.0, 24.8013158);
    accountHeaderView = self->_accountHeaderView;
    self->_accountHeaderView = v13;

    [(AAUIAppleAccountHeaderView *)self->_accountHeaderView setDelegate:self];
    v15 = [(AAUIAppleAccountHeaderView *)self->_accountHeaderView imageControl];
    [v15 setEnabled:v4 != 0];

    dispatch_queue_t v16 = [(AAUIAppleAccountHeaderView *)self->_accountHeaderView imageControl];
    v17 = [v16 imageView];
    [v17 setImage:v8];

    v18 = [(AAUIAppleAccountHeaderView *)self->_accountHeaderView accountHeaderLabel];
    v19 = [(AAUIAppleAccountViewController *)self _personNameComponents];
    v20 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v19 style:2 options:0];
    [v18 setText:v20];

    v21 = [(AAUIAppleAccountHeaderView *)self->_accountHeaderView accountHeaderSublabel];
    [v21 setText:v12];

    v22 = [(AAUIAppleAccountViewController *)self table];
    [v22 setTableHeaderView:self->_accountHeaderView];

    [(AAUIAppleAccountViewController *)self _layoutTableHeaderView];
  }
  else
  {
    char v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_4A68C();
    }

    v8 = [(AAUIAppleAccountViewController *)self table];
    [v8 setTableHeaderView:0];
  }
}

- (id)_recoveryContactUpsellViewController
{
  recoveryContactUpsellController = self->_recoveryContactUpsellController;
  if (!recoveryContactUpsellController)
  {
    uint64_t v4 = +[AAUIRecoveryContactUpsellFactory createRecoveryContactUpsellTipView];
    uint64_t v5 = self->_recoveryContactUpsellController;
    self->_recoveryContactUpsellController = v4;

    recoveryContactUpsellController = self->_recoveryContactUpsellController;
  }

  return recoveryContactUpsellController;
}

- (id)_identityCardViewController
{
  identityCardViewController = self->_identityCardViewController;
  if (!identityCardViewController)
  {
    if (self->_meCard)
    {
      uint64_t v4 = [(AAUIAppleAccountViewController *)self _activeAccount];
      uint64_t v5 = +[AAUIIdentityViewFactory createAppleAccountHeaderViewFromContact:self->_meCard account:v4 showAccountDetails:1 showEditButton:0];
      int v6 = self->_identityCardViewController;
      self->_identityCardViewController = v5;

      identityCardViewController = self->_identityCardViewController;
    }
    else
    {
      identityCardViewController = 0;
    }
  }

  return identityCardViewController;
}

- (void)_setupIdentityCardHeader
{
  objc_super v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_4A6F4();
  }

  objc_initWeak(&location, self);
  uint64_t v4 = [(AAUIAppleAccountViewController *)self _profilePictureStore];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_30C14;
  v5[3] = &unk_75FA8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [v4 meCardWithVisualIdentity:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AAUIAppleAccountViewController;
  [(AAUIAppleAccountViewController *)&v3 viewWillLayoutSubviews];
  [(AAUIAppleAccountViewController *)self _layoutIdentityCardHeader];
}

- (void)_layoutTableHeaderView
{
  objc_super v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_4A7F8();
  }

  uint64_t v4 = [(AAUIAppleAccountViewController *)self table];
  uint64_t v5 = [v4 tableHeaderView];

  objc_msgSend(v5, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  double v7 = v6;
  v8 = [(AAUIAppleAccountViewController *)self table];
  v9 = [v8 tableHeaderView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v5, "setFrame:", v11, v13, v15, v7);
  +[UIView setAnimationsEnabled:0];
  dispatch_queue_t v16 = [(AAUIAppleAccountViewController *)self table];
  [v16 beginUpdates];

  v17 = [(AAUIAppleAccountViewController *)self table];
  [v17 endUpdates];

  +[UIView setAnimationsEnabled:1];
}

- (void)_layoutIdentityCardHeader
{
  objc_super v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_4A82C();
  }

  uint64_t v4 = [(AAUIAppleAccountViewController *)self table];
  uint64_t v5 = [v4 tableHeaderView];

  [v5 setNeedsLayout];
  [v5 layoutIfNeeded];
  [v5 intrinsicContentSize];
  double v7 = v6;
  v8 = [(AAUIAppleAccountViewController *)self table];
  [v8 setSectionHeaderHeight:UITableViewAutomaticDimension];

  v9 = [(AAUIAppleAccountViewController *)self table];
  [v9 setEstimatedSectionHeaderHeight:v7];

  double v10 = [(AAUIAppleAccountViewController *)self table];
  double v11 = [v10 tableHeaderView];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  if (v19 != v7) {
    objc_msgSend(v5, "setFrame:", v13, v15, v17, v7);
  }
  v20 = [(AAUIAppleAccountViewController *)self table];
  [v20 layoutSubviews];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AAUIAppleAccountViewController;
  id v7 = a4;
  -[AAUIAppleAccountViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_31228;
  v8[3] = &unk_76010;
  v8[4] = self;
  [v7 animateAlongsideTransition:&stru_75FE8 completion:v8];
}

+ (BOOL)_isSplitView
{
  id v2 = +[UIDevice currentDevice];
  if ([v2 userInterfaceIdiom] == (char *)&dword_0 + 1)
  {
    char v3 = 1;
  }
  else
  {
    uint64_t v4 = +[UIDevice currentDevice];
    char v3 = [v4 userInterfaceIdiom] == (char *)&dword_4 + 2;
  }
  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AAUIAppleAccountViewController;
  [(AAUIAppleAccountViewController *)&v10 viewDidAppear:a3];
  uint64_t v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = +[NSNumber numberWithInt:!self->_appearedBefore];
    *(_DWORD *)buf = 138412290;
    double v12 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AAUIAppleAccountViewController appeared, first time: %@", buf, 0xCu);
  }
  if (!self->_appearedBefore)
  {
    if (self->_shouldAttemptToEnableDataclasses
      && ([(AAUIAppleAccountViewController *)self _appleAccount],
          double v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = objc_msgSend(v6, "aa_isPrimaryEmailVerified"),
          v6,
          v7))
    {
      [(AAUIAppleAccountViewController *)self _enableAllProvisionedDataclasses];
    }
    else
    {
      v8 = [(AAUIAppleAccountViewController *)self accountOperationsHelper];
      unsigned __int8 v9 = [v8 isRemovingAccount];

      if ((v9 & 1) == 0)
      {
        [(AAUIAppleAccountViewController *)self _presentFirstAlertIfNecessary];
        [(AAUIAppleAccountViewController *)self _checkNetworkReachabilityAndValidateAccount];
      }
    }
  }
  self->_appearedBefore = 1;
}

- (id)_accountStore
{
  return [(AIDAAccountManager *)self->_accountManager accountStore];
}

- (id)_appleAccount
{
  id v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  char v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v3;
}

- (id)_storeAccount
{
  id v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  char v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeStore];

  return v3;
}

- (id)_gameCenterAccount
{
  id v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  char v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeGameCenter];

  return v3;
}

- (id)_activeAccount
{
  char v3 = [(AAUIAppleAccountViewController *)self _appleAccount];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(AAUIAppleAccountViewController *)self _storeAccount];
  }
  double v6 = v5;

  return v6;
}

- (BOOL)_shouldShowStoreSettings
{
  char v3 = [(AAUIAppleAccountViewController *)self _appleAccount];
  if (v3)
  {
  }
  else
  {
    double v6 = [(AAUIAppleAccountViewController *)self _storeAccount];

    if (v6) {
      return 1;
    }
  }
  uint64_t v4 = [(AAUIAppleAccountViewController *)self _appleAccount];
  if ((objc_msgSend(v4, "aa_isManagedAppleID") & 1) != 0
    || [(AAUIAppleAccountViewController *)self _isBeneficiaryAccount])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    unsigned int v7 = [(AAUIAppleAccountViewController *)self _appleAccount];
    unsigned __int8 v5 = objc_msgSend(v7, "aa_isAccountClass:", AAAccountClassPrimary);
  }
  return v5;
}

- (BOOL)_isBeneficiaryAccount
{
  id v2 = [(AAUIAppleAccountViewController *)self _appleAccount];
  char v3 = objc_msgSend(v2, "aa_altDSID");

  if (v3)
  {
    uint64_t v4 = +[AKAccountManager sharedInstance];
    unsigned __int8 v5 = [v4 authKitAccountWithAltDSID:v3];

    double v6 = +[AKAccountManager sharedInstance];
    unsigned __int8 v7 = [v6 isBeneficiaryForAccount:v5];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)_isDemoAccount
{
  id v2 = [(AAUIAppleAccountViewController *)self _appleAccount];
  char v3 = objc_msgSend(v2, "aa_altDSID");

  if (v3)
  {
    uint64_t v4 = +[AKAccountManager sharedInstance];
    unsigned __int8 v5 = [v4 authKitAccountWithAltDSID:v3];

    double v6 = +[AKAccountManager sharedInstance];
    unsigned __int8 v7 = [v6 demoAccountForAccount:v5];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)_grandSlamAccount
{
  p_grandSlamAccountOnceToken = &self->_grandSlamAccountOnceToken;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_318B0;
  block[3] = &unk_756F8;
  block[4] = self;
  if (*p_grandSlamAccountOnceToken != -1) {
    dispatch_once(p_grandSlamAccountOnceToken, block);
  }
  return self->_grandSlamAccount;
}

- (id)_grandSlamSigner
{
  grandSlamSigner = self->_grandSlamSigner;
  if (!grandSlamSigner)
  {
    id v4 = objc_alloc((Class)AAGrandSlamSigner);
    unsigned __int8 v5 = [(AAUIAppleAccountViewController *)self _accountStore];
    double v6 = [(AAUIAppleAccountViewController *)self _grandSlamAccount];
    unsigned __int8 v7 = (AAGrandSlamSigner *)[v4 initWithAccountStore:v5 grandSlamAccount:v6 appTokenID:AAGrandSlamAppTokenIDiCloudSettings];
    v8 = self->_grandSlamSigner;
    self->_grandSlamSigner = v7;

    grandSlamSigner = self->_grandSlamSigner;
  }

  return grandSlamSigner;
}

- (BOOL)_isSingleIdentity
{
  char v3 = [(AAUIAppleAccountViewController *)self _appleAccount];
  uint64_t v4 = [(AAUIAppleAccountViewController *)self _storeAccount];
  unsigned __int8 v5 = (void *)v4;
  unsigned __int8 v6 = 1;
  if (v3 && v4)
  {
    uint64_t v7 = AIDAServiceTypeCloud;
    v8 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager altDSIDForAccount:v3 service:AIDAServiceTypeCloud];
    uint64_t v9 = AIDAServiceTypeStore;
    objc_super v10 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager altDSIDForAccount:v5 service:AIDAServiceTypeStore];
    if ([v8 length] && objc_msgSend(v10, "length"))
    {
      unsigned __int8 v6 = [v8 isEqualToString:v10];
    }
    else
    {
      double v11 = _AAUILogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_4A860();
      }

      double v12 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager DSIDForAccount:v3 service:v7];
      double v13 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager DSIDForAccount:v5 service:v9];
      unsigned __int8 v6 = [v12 isEqualToString:v13];
    }
  }

  return v6;
}

- (id)_personNameComponentsForAccountCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AIDAServiceTypeCloud;
  unsigned __int8 v6 = [v4 objectForKeyedSubscript:AIDAServiceTypeCloud];
  if (v6)
  {
    uint64_t v7 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager nameComponentsForAccount:v6 service:v5];
  }
  else
  {
    uint64_t v8 = AIDAServiceTypeStore;
    uint64_t v9 = [v4 objectForKeyedSubscript:AIDAServiceTypeStore];
    if (v9)
    {
      uint64_t v7 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager nameComponentsForAccount:v9 service:v8];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (id)_personNameComponents
{
  char v3 = [(AIDAAccountManager *)self->_accountManager accounts];
  id v4 = [(AAUIAppleAccountViewController *)self _personNameComponentsForAccountCollection:v3];

  return v4;
}

- (id)_profilePictureStore
{
  profilePictureStore = self->_profilePictureStore;
  if (!profilePictureStore)
  {
    id v4 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v10 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Loading Profile Picture Store", v10, 2u);
    }

    [(AAUIAppleAccountViewController *)self _stopObservingProfilePictureStoreDidChangeNotification];
    id v5 = objc_alloc((Class)AAUIProfilePictureStore);
    unsigned __int8 v6 = [(AAUIAppleAccountViewController *)self _grandSlamSigner];
    uint64_t v7 = (AAUIProfilePictureStore *)[v5 initWithGrandSlamSigner:v6];
    uint64_t v8 = self->_profilePictureStore;
    self->_profilePictureStore = v7;

    [(AAUIProfilePictureStore *)self->_profilePictureStore setPictureDiameter:80.0];
    [(AAUIAppleAccountViewController *)self _beginObservingProfilePictureStoreDidChangeNotification];
    profilePictureStore = self->_profilePictureStore;
  }

  return profilePictureStore;
}

- (void)setAccountWasPromoted:(BOOL)a3
{
  self->_accountWasPromoted = a3;
}

- (void)setShouldAttemptToEnableDataclasses:(BOOL)a3
{
  self->_shouldAttemptToEnableDataclasses = 1;
}

- (id)specifierForID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AAUIAppleAccountViewController;
  id v5 = [(AAUIAppleAccountViewController *)&v8 specifierForID:v4];
  if (!v5)
  {
    if ([v4 isEqualToString:@"SIWA_SERVICE"])
    {
      v7.receiver = self;
      v7.super_class = (Class)AAUIAppleAccountViewController;
      id v5 = [(AAUIAppleAccountViewController *)&v7 specifierForID:@"PASSWORD_AND_SECURITY"];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (*(void *)&self->ACUIAccountConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers]) {
    goto LABEL_26;
  }
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AAUIAppleAccountViewController is loading specifiers.", (uint8_t *)&buf, 2u);
  }

  id v5 = [*(id *)&self->ACUIAccountConfigurationViewController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  unsigned __int8 v6 = [v5 objectForKeyedSubscript:@"topLevel"];
  self->_topLevelSettings = [v6 BOOLValue];

  id v7 = objc_alloc_init((Class)NSMutableArray);
  objc_super v8 = [(AAUIAppleAccountViewController *)self _specifiersForFollowupGroup];
  [v7 addObjectsFromArray:v8];

  dmcReauthSpecifierProvider = self->_dmcReauthSpecifierProvider;
  if (!dmcReauthSpecifierProvider)
  {
    objc_super v10 = (AAUISpecifierProvider *)[objc_alloc((Class)DMCReauthSpecifierProvider) initWithAccountManager:self->_accountManager presenter:self];
    double v11 = self->_dmcReauthSpecifierProvider;
    self->_dmcReauthSpecifierProvider = v10;

    [(AAUISpecifierProvider *)self->_dmcReauthSpecifierProvider setDelegate:self];
    dmcReauthSpecifierProvider = self->_dmcReauthSpecifierProvider;
  }
  double v12 = [(AAUISpecifierProvider *)dmcReauthSpecifierProvider specifiers];
  [v7 addObjectsFromArray:v12];

  if (![(AAUIAppleAccountViewController *)self _isBeneficiaryAccount])
  {
    double v13 = [(AAUIAppleAccountViewController *)self _specifiersForAccountGroup];
    [v7 addObjectsFromArray:v13];
  }
  mdmDetailsSpecifierProvider = self->_mdmDetailsSpecifierProvider;
  if (!mdmDetailsSpecifierProvider)
  {
    double v15 = (AAUISpecifierProvider *)[objc_alloc((Class)DMCMDMDetailsSpecifierProvider) initWithAccountManager:self->_accountManager];
    double v16 = self->_mdmDetailsSpecifierProvider;
    self->_mdmDetailsSpecifierProvider = v15;

    [(AAUISpecifierProvider *)self->_mdmDetailsSpecifierProvider setDelegate:self];
    mdmDetailsSpecifierProvider = self->_mdmDetailsSpecifierProvider;
  }
  double v17 = [(AAUISpecifierProvider *)mdmDetailsSpecifierProvider specifiers];
  [v7 addObjectsFromArray:v17];

  double v18 = [(AAUIAppleAccountViewController *)self _specifiersForServicesGroup];
  [v7 addObjectsFromArray:v18];

  if (![(AAUIAppleAccountViewController *)self _isBeneficiaryAccount])
  {
    double v19 = [(AAUIAppleAccountViewController *)self _specifiersForDevicesGroup];
    [v7 addObjectsFromArray:v19];
  }
  if (_os_feature_enabled_impl()
    && ![(AAUIAppleAccountViewController *)self _isDemoAccount]
    && ![(AAUIAppleAccountViewController *)self _isBeneficiaryAccount])
  {
    v20 = [(AAUIAppleAccountViewController *)self _appleAccount];
    if (!objc_msgSend(v20, "aa_isAccountClass:", AAAccountClassPrimary))
    {
LABEL_22:

      goto LABEL_23;
    }
    v21 = [(AAUIAppleAccountViewController *)self _appleAccount];
    unsigned __int8 v22 = objc_msgSend(v21, "aa_isManagedAppleID");

    if ((v22 & 1) == 0)
    {
      tuiOptInSpecifierProvider = self->_tuiOptInSpecifierProvider;
      if (!tuiOptInSpecifierProvider)
      {
        uint64_t v39 = 0;
        v40 = &v39;
        uint64_t v41 = 0x2050000000;
        v24 = (void *)qword_90020;
        uint64_t v42 = qword_90020;
        if (!qword_90020)
        {
          *(void *)&long long buf = _NSConcreteStackBlock;
          *((void *)&buf + 1) = 3221225472;
          v44 = sub_4696C;
          v45 = &unk_75298;
          v46 = &v39;
          sub_4696C((uint64_t)&buf);
          v24 = (void *)v40[3];
        }
        v25 = v24;
        _Block_object_dispose(&v39, 8);
        id v26 = [v25 alloc];
        v27 = (AAUISpecifierProvider *)objc_msgSend(v26, "initWithAccountManager:", self->_accountManager, v39);
        v28 = self->_tuiOptInSpecifierProvider;
        self->_tuiOptInSpecifierProvider = v27;

        [(AAUISpecifierProvider *)self->_tuiOptInSpecifierProvider setDelegate:self];
        tuiOptInSpecifierProvider = self->_tuiOptInSpecifierProvider;
      }
      v20 = [(AAUISpecifierProvider *)tuiOptInSpecifierProvider specifiers];
      [v7 addObjectsFromArray:v20];
      goto LABEL_22;
    }
  }
LABEL_23:
  managedAccountsSpecifierProvider = self->_managedAccountsSpecifierProvider;
  if (!managedAccountsSpecifierProvider)
  {
    v30 = (AAUISpecifierProvider *)[objc_alloc((Class)DMCManagedAccountsSpecifierProvider) initWithAccountManager:self->_accountManager];
    v31 = self->_managedAccountsSpecifierProvider;
    self->_managedAccountsSpecifierProvider = v30;

    [(AAUISpecifierProvider *)self->_managedAccountsSpecifierProvider setDelegate:self];
    managedAccountsSpecifierProvider = self->_managedAccountsSpecifierProvider;
  }
  v32 = [(AAUISpecifierProvider *)managedAccountsSpecifierProvider specifiers];
  [v7 addObjectsFromArray:v32];

  v33 = [(AAUIAppleAccountViewController *)self _specifiersForSignoutGroup];
  [v7 addObjectsFromArray:v33];

  v34 = *(void **)&self->ACUIAccountConfigurationViewController_opaque[v3];
  *(void *)&self->ACUIAccountConfigurationViewController_opaque[v3] = v7;

LABEL_26:
  v35 = _AAUILogSystem();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = *(void *)&self->ACUIAccountConfigurationViewController_opaque[v3];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v36;
    _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "AAUIAppleAccountViewController specifiers: returning %@", (uint8_t *)&buf, 0xCu);
  }

  v37 = *(void **)&self->ACUIAccountConfigurationViewController_opaque[v3];

  return v37;
}

- (void)_forgetSpecifiers
{
  userInfoForSpecifiers = self->_userInfoForSpecifiers;
  self->_userInfoForSpecifiers = 0;

  followupGroupSpecifiers = self->_followupGroupSpecifiers;
  self->_followupGroupSpecifiers = 0;

  accountGroupSpecifiers = self->_accountGroupSpecifiers;
  self->_accountGroupSpecifiers = 0;

  servicesGroupSpecifiers = self->_servicesGroupSpecifiers;
  self->_servicesGroupSpecifiers = 0;

  storeSpecifier = self->_storeSpecifier;
  self->_storeSpecifier = 0;

  [(AAUIDeviceSpecifierProvider *)self->_deviceSpecifierProvider setSpecifiers:0];
  signoutGroupSpecifiers = self->_signoutGroupSpecifiers;
  self->_signoutGroupSpecifiers = 0;

  [(AAUISpecifierProvider *)self->_familySpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_dmcReauthSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_mdmDetailsSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_mdmSignoutSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_managedAccountsSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_paymentSpecifierProvider setSpecifiers:0];
  fmfSpecifierProvider = self->_fmfSpecifierProvider;

  [(AAUISpecifierProvider *)fmfSpecifierProvider setSpecifiers:0];
}

- (void)_clearCachedSpecifierValues
{
  [(AAUIDeviceSpecifierProvider *)self->_deviceSpecifierProvider refreshDeviceList];
  [(AAUISpecifierProvider *)self->_familySpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_dmcReauthSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_mdmDetailsSpecifierProvider setSpecifiers:0];
  [(AAUISpecifierProvider *)self->_mdmSignoutSpecifierProvider setSpecifiers:0];
  managedAccountsSpecifierProvider = self->_managedAccountsSpecifierProvider;
  self->_managedAccountsSpecifierProvider = 0;

  [(AAUISpecifierProvider *)self->_paymentSpecifierProvider setSpecifiers:0];
  fmfSpecifierProvider = self->_fmfSpecifierProvider;

  [(AAUISpecifierProvider *)fmfSpecifierProvider setSpecifiers:0];
}

- (id)_specifiersForFollowupGroup
{
  followupGroupSpecifiers = self->_followupGroupSpecifiers;
  self->_followupGroupSpecifiers = 0;

  id v4 = [(AAUIAppleAccountViewController *)self _appleAccount];
  unsigned int v5 = objc_msgSend(v4, "aa_isAccountClass:", AAAccountClassPrimary);

  if (v5)
  {
    followUpController = self->_followUpController;
    if (!followUpController)
    {
      id v7 = (FLPreferencesController *)objc_alloc_init((Class)FLPreferencesController);
      objc_super v8 = self->_followUpController;
      self->_followUpController = v7;

      [(FLPreferencesController *)self->_followUpController setListViewController:self];
      objc_initWeak(&location, self);
      uint64_t v9 = self->_followUpController;
      double v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      double v19 = sub_328E0;
      v20 = &unk_75770;
      objc_copyWeak(&v21, &location);
      [(FLPreferencesController *)v9 setItemChangeObserver:&v17];
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
      followUpController = self->_followUpController;
    }
    objc_super v10 = [(FLPreferencesController *)followUpController spyglassSpecifiers];
    if ([v10 count])
    {
      double v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      double v12 = self->_followupGroupSpecifiers;
      self->_followupGroupSpecifiers = v11;

      double v13 = self->_followupGroupSpecifiers;
      double v14 = +[PSSpecifier groupSpecifierWithID:@"FOLLOWUP_GROUP"];
      [(NSMutableArray *)v13 addObject:v14];

      [(NSMutableArray *)self->_followupGroupSpecifiers addObjectsFromArray:v10];
    }
  }
  double v15 = self->_followupGroupSpecifiers;

  return v15;
}

- (id)_specifiersForAccountGroup
{
  if (!self->_accountGroupSpecifiers)
  {
    uint64_t v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    accountGroupSpecifiers = self->_accountGroupSpecifiers;
    self->_accountGroupSpecifiers = v3;

    if ([(AAUIAppleAccountViewController *)self shouldShowRecoveryContactUpsellTip])
    {
      unsigned int v5 = +[PSSpecifier groupSpecifierWithID:@"PERSONAL_INFORMATION_GROUP"];
      [(NSMutableArray *)self->_accountGroupSpecifiers addObject:v5];
      unsigned __int8 v6 = [(AAUIAppleAccountViewController *)self _appleAccount];
      id v7 = objc_msgSend(v6, "aa_isManagedAppleID");

      objc_super v8 = +[AAUISpyglassSpecifierFactory specifierForPersonalInformationWithAppleIDType:v7];
      contactSpecifier = self->_contactSpecifier;
      self->_contactSpecifier = v8;

      objc_storeWeak((id *)((char *)self->_contactSpecifier + OBJC_IVAR___PSSpecifier_target), self);
      [(PSSpecifier *)self->_contactSpecifier setControllerLoadAction:"_contactSpecifierWasTapped:"];
      [(NSMutableArray *)self->_accountGroupSpecifiers addObject:self->_contactSpecifier];
      objc_super v10 = self->_accountGroupSpecifiers;
      double v11 = +[PSSpecifier groupSpecifierWithID:@"ACCOUNT_GROUP"];
      [(NSMutableArray *)v10 addObject:v11];
    }
    else
    {
      double v12 = self->_accountGroupSpecifiers;
      double v13 = +[PSSpecifier groupSpecifierWithID:@"ACCOUNT_GROUP"];
      [(NSMutableArray *)v12 addObject:v13];

      double v14 = [(AAUIAppleAccountViewController *)self _appleAccount];
      id v15 = objc_msgSend(v14, "aa_isManagedAppleID");

      double v16 = +[AAUISpyglassSpecifierFactory specifierForPersonalInformationWithAppleIDType:v15];
      double v17 = self->_contactSpecifier;
      self->_contactSpecifier = v16;

      objc_storeWeak((id *)((char *)self->_contactSpecifier + OBJC_IVAR___PSSpecifier_target), self);
      [(PSSpecifier *)self->_contactSpecifier setControllerLoadAction:"_contactSpecifierWasTapped:"];
      [(NSMutableArray *)self->_accountGroupSpecifiers addObject:self->_contactSpecifier];
    }
    uint64_t v18 = +[AAUISpyglassSpecifierFactory specifierForSignInAndSecurity];
    securitySpecifier = self->_securitySpecifier;
    self->_securitySpecifier = v18;

    objc_storeWeak((id *)((char *)self->_securitySpecifier + OBJC_IVAR___PSSpecifier_target), self);
    [(PSSpecifier *)self->_securitySpecifier setControllerLoadAction:"_securitySpecifierWasTapped:"];
    [(NSMutableArray *)self->_accountGroupSpecifiers addObject:self->_securitySpecifier];
    if ([(AAUIAppleAccountViewController *)self _shouldShowStoreSettings])
    {
      v20 = [(AAUIAppleAccountViewController *)self _paymentSpecifierProvider];
      id v21 = v20;
      if (v20)
      {
        unsigned __int8 v22 = [v20 specifiers];
        objc_super v23 = [v22 firstObject];
        paymentSpecifier = self->_paymentSpecifier;
        self->_paymentSpecifier = v23;
      }
      +[AAUISpyglassSpecifierFactory specifierForPaymentAndShipping:self->_paymentSpecifier isPaymentSpecifierProviderNil:v21 == 0];
      v25 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      id v26 = self->_paymentSpecifier;
      self->_paymentSpecifier = v25;

      if (!v21)
      {
        objc_storeWeak((id *)((char *)self->_paymentSpecifier + OBJC_IVAR___PSSpecifier_target), self);
        [(PSSpecifier *)self->_paymentSpecifier setControllerLoadAction:"_paymentSpecifierWasTapped:"];
        *(void *)((char *)self->_paymentSpecifier + OBJC_IVAR___PSSpecifier_getter) = "_valueForPaymentSpecifier:";
      }
      [(NSMutableArray *)self->_accountGroupSpecifiers addObject:self->_paymentSpecifier];
    }
    if ([(AAUIAppleAccountViewController *)self _shouldShowStoreSettings])
    {
      v27 = (AAUISpecifierProvider *)[objc_alloc((Class)AMSUIManageSubsriptionSpecifierProvider) initWithAccountManager:self->_accountManager];
      manageSubscriptionSpecifier = self->_manageSubscriptionSpecifier;
      self->_manageSubscriptionSpecifier = v27;

      [(AAUISpecifierProvider *)self->_manageSubscriptionSpecifier setDelegate:self];
      v29 = [(AAUISpecifierProvider *)self->_manageSubscriptionSpecifier specifiers];
      v30 = +[AAUISpyglassSpecifierFactory specifierForSubscriptions:v29];

      [(NSMutableArray *)self->_accountGroupSpecifiers addObjectsFromArray:v30];
    }
  }
  uint64_t v31 = [(AAUIAppleAccountViewController *)self _appleAccount];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(AAUIAppleAccountViewController *)self _appleAccount];
    unsigned __int8 v34 = objc_msgSend(v33, "aa_isPrimaryEmailVerified");

    if ((v34 & 1) == 0)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v35 = self->_accountGroupSpecifiers;
      id v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v47;
        uint64_t v39 = PSEnabledKey;
        do
        {
          for (i = 0; i != v37; i = (char *)i + 1)
          {
            if (*(void *)v47 != v38) {
              objc_enumerationMutation(v35);
            }
            objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * i), "setProperty:forKey:", &__kCFBooleanFalse, v39, (void)v46);
          }
          id v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v46 objects:v50 count:16];
        }
        while (v37);
      }
    }
  }
  uint64_t v41 = +[AKNetworkObserver sharedNetworkObserver];
  unsigned __int8 v42 = [v41 isNetworkReachable];

  if ((v42 & 1) == 0)
  {
    uint64_t v43 = PSEnabledKey;
    [(PSSpecifier *)self->_contactSpecifier setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    [(PSSpecifier *)self->_paymentSpecifier setProperty:&__kCFBooleanFalse forKey:v43];
  }
  v44 = self->_accountGroupSpecifiers;

  return v44;
}

- (id)_specifiersForServicesGroup
{
  servicesGroupSpecifiers = self->_servicesGroupSpecifiers;
  if (!servicesGroupSpecifiers)
  {
    id v4 = [(AAUIAppleAccountViewController *)self _appleAccount];
    v53 = [(AAUIAppleAccountViewController *)self _storeAccount];
    unsigned __int8 v5 = [(AAUIAppleAccountViewController *)self _isSingleIdentity];
    unsigned __int8 v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v7 = self->_servicesGroupSpecifiers;
    self->_servicesGroupSpecifiers = v6;

    objc_super v8 = +[PSSpecifier groupSpecifierWithID:@"GROUP_SERVICES"];
    servicesGroupSpecifier = self->_servicesGroupSpecifier;
    self->_servicesGroupSpecifier = v8;

    [(NSMutableArray *)self->_servicesGroupSpecifiers addObject:self->_servicesGroupSpecifier];
    objc_super v10 = [(AAUIAppleAccountViewController *)self _cloudSpecifierForAccount:v4];
    [(NSMutableArray *)self->_servicesGroupSpecifiers addObject:v10];
    double v11 = [(AAUIAppleAccountViewController *)self _appleAccount];
    double v12 = +[NSNumber numberWithBool:[(AAUIAppleAccountViewController *)self _isEnabledForAccount:v11]];
    uint64_t v13 = PSEnabledKey;
    [v10 setProperty:v12 forKey:PSEnabledKey];

    if (![(AAUIAppleAccountViewController *)self _isBeneficiaryAccount])
    {
      double v14 = [(AAUIAppleAccountViewController *)self _appleAccount];
      unsigned int v15 = objc_msgSend(v14, "aa_isAccountClass:", AAAccountClassPrimary);

      if (v15)
      {
        double v16 = [(AAUIAppleAccountViewController *)self _appleAccount];
        unsigned int v17 = objc_msgSend(v16, "aa_isFamilyEligible");

        if (v17)
        {
          uint64_t v18 = self->_servicesGroupSpecifiers;
          double v19 = [(AAUIAppleAccountViewController *)self _specifiersForFamily];
          [(NSMutableArray *)v18 addObjectsFromArray:v19];
        }
        fmfSpecifierProvider = self->_fmfSpecifierProvider;
        if (!fmfSpecifierProvider)
        {
          id v21 = (AAUISpecifierProvider *)[objc_alloc((Class)FMFSpecifierProvider) initWithAccountManager:self->_accountManager];
          unsigned __int8 v22 = self->_fmfSpecifierProvider;
          self->_fmfSpecifierProvider = v21;

          [(AAUISpecifierProvider *)self->_fmfSpecifierProvider setDelegate:self];
          fmfSpecifierProvider = self->_fmfSpecifierProvider;
        }
        objc_super v23 = self->_servicesGroupSpecifiers;
        v24 = [(AAUISpecifierProvider *)fmfSpecifierProvider specifiers];
        [(NSMutableArray *)v23 addObjectsFromArray:v24];
      }
    }
    v25 = v53;
    if ([(AAUIAppleAccountViewController *)self _shouldShowStoreSettings])
    {
      id v26 = [(AAUIAppleAccountViewController *)self _specifiersForStore];
      v27 = [v26 firstObject];

      if (!v27)
      {
        v27 = [(AAUIAppleAccountViewController *)self _storeSpecifierForAccount:v53];
        if ((v5 & 1) == 0)
        {
          [v27 setProperty:objc_opt_class() forKey:PSCellClassKey];
          v28 = [UIApp preferredContentSizeCategory];
          BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v28);
          double v30 = UITableViewAutomaticDimension;
          if (!IsAccessibilityCategory) {
            double v30 = 58.0;
          }
          uint64_t v31 = +[NSNumber numberWithDouble:v30];
          [v27 setProperty:v31 forKey:PSTableCellHeightKey];

          v32 = objc_msgSend(v53, "aa_formattedUsername");
          [v27 setProperty:v32 forKey:PSTableCellSubtitleTextKey];
        }
      }
      if ((+[AADeviceInfo isMultiUserMode] & 1) == 0
        && v27)
      {
        [(NSMutableArray *)self->_servicesGroupSpecifiers addObject:v27];
      }
      v33 = [(AAUIAppleAccountViewController *)self _storeAccount];
      unsigned __int8 v34 = +[NSNumber numberWithBool:[(AAUIAppleAccountViewController *)self _isEnabledForAccount:v33]];
      [v27 setProperty:v34 forKey:v13];
    }
    v35 = +[AKAccountManager sharedInstance];
    id v36 = objc_msgSend(v4, "aa_altDSID");
    id v37 = [v35 authKitAccountWithAltDSID:v36];

    if (v37)
    {
      unint64_t v38 = (unint64_t)[v35 securityLevelForAccount:v37];
      if (([v35 userUnderAgeForAccount:v37] & 1) != 0
        || (v38 & 0xFFFFFFFFFFFFFFFELL) != 4)
      {
        uint64_t v41 = _AAUILogSystem();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "Primary AuthKit account is not eligible for SIWA", buf, 2u);
        }
      }
      else
      {
        uint64_t v39 = self->_servicesGroupSpecifiers;
        v40 = [(AAUIAppleAccountViewController *)self _siwaSpecifierForAccount:v4];
        [(NSMutableArray *)v39 addObject:v40];
      }
    }
    uint64_t v42 = [(AAUIAppleAccountViewController *)self _appleAccount];
    if (v42)
    {
      uint64_t v43 = (void *)v42;
      v44 = [(AAUIAppleAccountViewController *)self _appleAccount];
      unsigned __int8 v45 = objc_msgSend(v44, "aa_isPrimaryEmailVerified");

      if ((v45 & 1) == 0)
      {
        v52 = v4;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v46 = self->_servicesGroupSpecifiers;
        id v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v54 objects:v59 count:16];
        if (v47)
        {
          id v48 = v47;
          uint64_t v49 = *(void *)v55;
          do
          {
            for (i = 0; i != v48; i = (char *)i + 1)
            {
              if (*(void *)v55 != v49) {
                objc_enumerationMutation(v46);
              }
              objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * i), "setProperty:forKey:", &__kCFBooleanFalse, v13, v52);
            }
            id v48 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v54 objects:v59 count:16];
          }
          while (v48);
        }

        id v4 = v52;
        v25 = v53;
      }
    }

    servicesGroupSpecifiers = self->_servicesGroupSpecifiers;
  }

  return servicesGroupSpecifiers;
}

- (id)_specifiersForDevicesGroup
{
  deviceSpecifierProvider = self->_deviceSpecifierProvider;
  if (!deviceSpecifierProvider)
  {
    id v4 = [[AAUIDeviceSpecifierProvider alloc] initWithAccountManager:self->_accountManager];
    unsigned __int8 v5 = self->_deviceSpecifierProvider;
    self->_deviceSpecifierProvider = v4;

    [(AAUIDeviceSpecifierProvider *)self->_deviceSpecifierProvider setDelegate:self];
    deviceSpecifierProvider = self->_deviceSpecifierProvider;
  }
  unsigned __int8 v6 = [(AAUIDeviceSpecifierProvider *)deviceSpecifierProvider specifiers];
  id v7 = +[AKNetworkObserver sharedNetworkObserver];
  unsigned __int8 v8 = [v7 isNetworkReachable];

  if ((v8 & 1) == 0)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      uint64_t v13 = PSEnabledKey;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "setProperty:forKey:", &__kCFBooleanFalse, v13, (void)v16);
        }
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }

  return v6;
}

- (id)_valueForServiceSpecifier:(id)a3
{
  uint64_t v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"account"];

  if (v4)
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    unsigned __int8 v6 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned __int8 v5 = [v6 localizedStringForKey:@"SET_UP" value:&stru_76890 table:@"Localizable"];
  }

  return v5;
}

- (id)_valueForCloudSpecifier:(id)a3
{
  id v4 = [a3 userInfo];
  unsigned __int8 v5 = [v4 objectForKeyedSubscript:@"account"];

  if (v5)
  {
    if (self->_totalStorageString)
    {
      unsigned __int8 v6 = +[NSString stringWithFormat:@"%@", self->_totalStorageString];
    }
    else
    {
      [(AAUIAppleAccountViewController *)self _loadCloudStorageSummary];
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned __int8 v6 = [v7 localizedStringForKey:@"SET_UP" value:&stru_76890 table:@"Localizable"];
  }

  return v6;
}

- (void)_loadCloudStorageSummary
{
  uint64_t v3 = [(AAUIAppleAccountViewController *)self _appleAccount];
  if (!v3)
  {
    id v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_4A8D8();
    }
    goto LABEL_7;
  }
  if (self->_isStorageSummaryRequestInProgress)
  {
    id v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Storage summary request is already in progress. Bailing.", buf, 2u);
    }
LABEL_7:

    goto LABEL_14;
  }
  self->_isStorageSummaryRequestInProgress = 1;
  if (_os_feature_enabled_impl())
  {
    *(void *)long long buf = 0;
    id v11 = buf;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = sub_33A58;
    double v14 = sub_33A68;
    id v15 = [objc_alloc((Class)ICSHomeDataController) initWithAccount:v3];
    unsigned __int8 v5 = (void *)*((void *)v11 + 5);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_33A70;
    v9[3] = &unk_76038;
    v9[4] = self;
    v9[5] = buf;
    [v5 fetchCloudStorage:0 completion:v9];
  }
  else
  {
    unsigned __int8 v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_4A90C();
    }

    *(void *)long long buf = 0;
    id v11 = buf;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = sub_33A58;
    double v14 = sub_33A68;
    id v15 = [objc_alloc((Class)ICQCloudStorageDataController) initWithAccount:v3];
    [*((id *)v11 + 5) setShouldIgnoreCache:self->_shouldIgnoreQuotaCache];
    id v7 = (void *)*((void *)v11 + 5);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_33BD8;
    v8[3] = &unk_76060;
    v8[4] = self;
    void v8[5] = buf;
    [v7 fetchStorageSummaryWithCompletion:v8];
  }
  _Block_object_dispose(buf, 8);

LABEL_14:
}

- (id)_cloudSpecifierForAccount:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v6 = [v5 localizedStringForKey:@"APPLEID_SERVICES_ICLOUD_CELL_TITLE" value:&stru_76890 table:@"Localizable"];
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:"_valueForCloudSpecifier:" detail:0 cell:2 edit:0];

  [v7 setControllerLoadAction:"_cloudSpecifierWasTapped:"];
  [v7 setIdentifier:@"ICLOUD_SERVICE"];
  unsigned __int8 v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"APPLEID_SERVICES_ICLOUD_CELL_TITLE" value:&stru_76890 table:@"Localizable"];
  [v7 setProperty:v9 forKey:PSTitleKey];

  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:PSLazyIconLoading];
  [v7 setObject:@"com.apple.application-icon.icloud" forKeyedSubscript:PSIconUTTypeIdentifierKey];
  if (v4)
  {
    v12[0] = @"account";
    v12[1] = @"topLevel";
    v13[0] = v4;
    v13[1] = &__kCFBooleanFalse;
    id v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    [v7 setUserInfo:v10];
  }

  return v7;
}

- (id)_paymentSpecifierProvider
{
  paymentSpecifierProvider = self->_paymentSpecifierProvider;
  if (!paymentSpecifierProvider)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2050000000;
    id v4 = (void *)qword_90030;
    uint64_t v14 = qword_90030;
    if (!qword_90030)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_46B24;
      v10[3] = &unk_75298;
      v10[4] = &v11;
      sub_46B24((uint64_t)v10);
      id v4 = (void *)v12[3];
    }
    unsigned __int8 v5 = v4;
    _Block_object_dispose(&v11, 8);
    id v6 = [[v5 alloc] initWithAccountManager:self->_accountManager];
    [v6 setDelegate:self];
    id v7 = [(AAUIAppleAccountViewController *)self _valueForPaymentSpecifier:self->_paymentSpecifier];
    if (v7) {
      [v6 setPaymentSummaryDescription:v7];
    }
    unsigned __int8 v8 = self->_paymentSpecifierProvider;
    self->_paymentSpecifierProvider = (AAUISpecifierProvider *)v6;

    paymentSpecifierProvider = self->_paymentSpecifierProvider;
  }

  return paymentSpecifierProvider;
}

- (id)_storeSpecifierForAccount:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"APPLEID_SERVICES_STORE_CELL_TITLE" value:&stru_76890 table:@"Localizable"];
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:"_valueForServiceSpecifier:" detail:0 cell:2 edit:0];

  [v7 setControllerLoadAction:"_storeSpecifierWasTapped:"];
  [v7 setIdentifier:@"STORE_SERVICE"];
  unsigned __int8 v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"APPLEID_SERVICES_STORE_CELL_TITLE" value:&stru_76890 table:@"Localizable"];
  [v7 setProperty:v9 forKey:PSTitleKey];

  [v7 setProperty:&__kCFBooleanTrue forKey:PSBundleIsControllerKey];
  [v7 setProperty:@"MobileStoreSettings" forKey:PSBundlePathKey];
  id v10 = PSBundlePathForPreferenceBundle();
  [v7 setProperty:v10 forKey:PSLazilyLoadedBundleKey];

  [v7 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
  [v7 setProperty:@"com.apple.AppStore" forKey:PSLazyIconAppID];
  if (v4)
  {
    v13[0] = @"account";
    v13[1] = @"topLevel";
    v14[0] = v4;
    v14[1] = &__kCFBooleanFalse;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v7 setUserInfo:v11];
  }

  return v7;
}

- (id)_siwaSpecifierForAccount:(id)a3
{
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v5 = +[UIImage imageNamed:@"signInWithAppleIcon" inBundle:v4];

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"APPLEID_SERVICES_SIWA_CELL_TITLE" value:&stru_76890 table:@"Localizable"];
  unsigned __int8 v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:2 edit:0];

  [v8 setControllerLoadAction:"_siwaSpecifierWasTapped:"];
  [v8 setIdentifier:@"SIWA_SERVICE"];
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"APPLEID_SERVICES_SIWA_CELL_TITLE" value:&stru_76890 table:@"Localizable"];
  [v8 setProperty:v10 forKey:PSTitleKey];

  [v8 setProperty:v5 forKey:PSIconImageKey];

  return v8;
}

- (BOOL)_shouldShowDeleteAccountButton
{
  if (+[AADeviceInfo isMultiUserMode]) {
    return 0;
  }
  id v4 = [(AAUIAppleAccountViewController *)self _appleAccount];
  unsigned __int8 v5 = objc_msgSend(v4, "aa_isUnremovableRemotelyManagedAccount");

  return v5 ^ 1;
}

- (id)_shouldRestrictSignoutMessage
{
  uint64_t v3 = [(AAUIAppleAccountViewController *)self _appleAccount];
  unsigned int v4 = objc_msgSend(v3, "aa_isAccountClass:", AAAccountClassPrimary);

  if (!v4)
  {
LABEL_12:
    id v9 = 0;
    goto LABEL_13;
  }
  if (+[AADeviceInfo aas_hasiCloudSignOutRestriction])
  {
    unsigned __int8 v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = v5;
    CFStringRef v7 = @"SIGNOUT_RESTRICTED_FOOTER";
LABEL_4:
    uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_76890 table:@"Localizable"];
LABEL_5:
    id v9 = (void *)v8;

    goto LABEL_13;
  }
  if (![(AAUIAppleAccountViewController *)self _isRestoringFromiCloud])
  {
    if ([(AAUIAppleAccountViewController *)self _activeFaceTimeCall])
    {
      unsigned __int8 v5 = +[NSBundle bundleForClass:objc_opt_class()];
      id v6 = v5;
      CFStringRef v7 = @"SIGNOUT_FACETIME_IN_PROGRESS_FOOTER";
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  if (([@"DELETE_ACCOUNT_RESTORE_WARNING" containsString:@"REBRAND"] & 1) == 0
    && (_os_feature_enabled_impl() & 1) != 0)
  {
    id v6 = [@"DELETE_ACCOUNT_RESTORE_WARNING" stringByAppendingString:@"_REBRAND"];
    uint64_t v8 = [(AAUIAppleAccountViewController *)self _deviceSpecificLocalizedStringKey:v6];
    goto LABEL_5;
  }
  id v9 = [(AAUIAppleAccountViewController *)self _deviceSpecificLocalizedStringKey:@"DELETE_ACCOUNT_RESTORE_WARNING"];
LABEL_13:

  return v9;
}

- (id)_specifiersForSignoutGroup
{
  if (![(AAUIAppleAccountViewController *)self _shouldShowDeleteAccountButton])
  {
    uint64_t v12 = 0;
    goto LABEL_26;
  }
  signoutGroupSpecifiers = self->_signoutGroupSpecifiers;
  if (!signoutGroupSpecifiers)
  {
    unsigned int v4 = [(AAUIAppleAccountViewController *)self _appleAccount];
    unsigned int v5 = objc_msgSend(v4, "aa_isRemotelyManaged");

    if (v5)
    {
      mdmSignoutSpecifierProvider = self->_mdmSignoutSpecifierProvider;
      if (!mdmSignoutSpecifierProvider)
      {
        CFStringRef v7 = (AAUISpecifierProvider *)[objc_alloc((Class)DMCMDMSignoutSpecifierProvider) initWithAccountManager:self->_accountManager];
        uint64_t v8 = self->_mdmSignoutSpecifierProvider;
        self->_mdmSignoutSpecifierProvider = v7;

        [(AAUISpecifierProvider *)self->_mdmSignoutSpecifierProvider setDelegate:self];
        mdmSignoutSpecifierProvider = self->_mdmSignoutSpecifierProvider;
      }
      id v9 = [(AAUISpecifierProvider *)mdmSignoutSpecifierProvider specifiers];
      id v10 = (NSMutableArray *)[v9 mutableCopy];
      uint64_t v11 = self->_signoutGroupSpecifiers;
      self->_signoutGroupSpecifiers = v10;

      goto LABEL_24;
    }
    uint64_t v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v14 = self->_signoutGroupSpecifiers;
    self->_signoutGroupSpecifiers = v13;

    id v9 = +[PSSpecifier groupSpecifierWithID:@"GROUP_SIGNOUT"];
    [(NSMutableArray *)self->_signoutGroupSpecifiers addObject:v9];
    id v15 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v16 = [v15 localizedStringForKey:@"APPLEID_SIGNOUT_CELL_TITLE" value:&stru_76890 table:@"Localizable"];
    long long v17 = +[PSSpecifier deleteButtonSpecifierWithName:v16 target:self action:"_deleteButtonTapped:"];

    [v17 setProperty:@"AAUIDeleteButtonSpecifierID" forKey:PSIDKey];
    [(NSMutableArray *)self->_signoutGroupSpecifiers addObject:v17];
    long long v18 = [(AAUIAppleAccountViewController *)self _shouldRestrictSignoutMessage];
    long long v19 = _AAUILogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = [(AAUIAppleAccountViewController *)self _isRestoringFromiCloud];
      CFStringRef v21 = @"NO";
      if (v20) {
        CFStringRef v21 = @"YES";
      }
      int v32 = 138412290;
      CFStringRef v33 = v21;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Restoring backup: %@", (uint8_t *)&v32, 0xCu);
    }

    unsigned __int8 v22 = [(AAUIAppleAccountViewController *)self _appleAccount];
    unsigned int v23 = objc_msgSend(v22, "aa_isAccountClass:", AAAccountClassPrimary);

    v24 = +[AKNetworkObserver sharedNetworkObserver];
    unsigned int v25 = [v24 isNetworkReachable];
    char v26 = v25;
    if (v23)
    {
      if (v25
        && ([(AAUIDeviceLocatorService *)self->_deviceLocatorService isChangingState] & 1) == 0
        && ![(AAUIAppleAccountViewController *)self _isRestoringFromiCloud]
        && !v18
        && !+[AADeviceInfo isMultiUserMode])
      {
        unsigned int v31 = [(AAUIAppleAccountViewController *)self _activeFaceTimeCall];

        if (!v31) {
          goto LABEL_23;
        }
        uint64_t v27 = PSEnabledKey;
        v29 = &__kCFBooleanFalse;
        v28 = v17;
        goto LABEL_22;
      }
    }
    else
    {

      if (v26) {
        goto LABEL_23;
      }
    }
    [v17 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    if (v18)
    {
      uint64_t v27 = PSFooterTextGroupKey;
      v28 = v9;
      v29 = v18;
LABEL_22:
      [v28 setProperty:v29 forKey:v27];
    }
LABEL_23:

LABEL_24:
    signoutGroupSpecifiers = self->_signoutGroupSpecifiers;
  }
  uint64_t v12 = signoutGroupSpecifiers;
LABEL_26:

  return v12;
}

- (void)_reloadSignoutGroupSpecifiersForName:(id)a3
{
  id v4 = a3;
  unsigned int v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Reloading sign out specifiers for %@", (uint8_t *)&v7, 0xCu);
  }

  signoutGroupSpecifiers = self->_signoutGroupSpecifiers;
  self->_signoutGroupSpecifiers = 0;

  [(AAUIAppleAccountViewController *)self reloadSpecifiers];
}

- (BOOL)_activeFaceTimeCall
{
  id v2 = +[TUCallCenter sharedInstance];
  unsigned __int8 v3 = [v2 anyCallPassesTest:&stru_760A0];

  return v3;
}

- (void)_beginObservingCallStatusChanges
{
  objc_initWeak(&location, self);
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  id v4 = +[NSOperationQueue mainQueue];
  uint64_t v5 = TUCallCenterCallStatusChangedNotification;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_34E08;
  v15[3] = &unk_75640;
  objc_copyWeak(&v16, &location);
  id v6 = [v3 addObserverForName:v5 object:0 queue:v4 usingBlock:v15];
  id callStatusNotificationObserver = self->_callStatusNotificationObserver;
  self->_id callStatusNotificationObserver = v6;

  id v8 = +[NSNotificationCenter defaultCenter];
  id v9 = +[NSOperationQueue mainQueue];
  uint64_t v10 = TUCallCenterVideoCallStatusChangedNotification;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  void v13[2] = sub_34E80;
  v13[3] = &unk_75640;
  objc_copyWeak(&v14, &location);
  uint64_t v11 = [v8 addObserverForName:v10 object:0 queue:v9 usingBlock:v13];
  id videoCallStatusNotificationObserver = self->_videoCallStatusNotificationObserver;
  self->_id videoCallStatusNotificationObserver = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_stopObservingCallStatusChanges
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self->_callStatusNotificationObserver name:TUCallCenterCallStatusChangedNotification object:0];
  [v3 removeObserver:self->_videoCallStatusNotificationObserver name:TUCallCenterVideoCallStatusChangedNotification object:0];
}

- (void)_contactSpecifierWasTapped:(id)a3
{
  if (a3) {
    -[AAUIAppleAccountViewController _startSpinnerInSpecifier:](self, "_startSpinnerInSpecifier:");
  }
  id v4 = objc_alloc((Class)AAPersonalInfoUIRequest);
  uint64_t v5 = [(AAUIAppleAccountViewController *)self _grandSlamAccount];
  id v6 = [(AAUIAppleAccountViewController *)self _accountStore];
  id v7 = [v4 initWithGrandSlamAccount:v5 accountStore:v6];

  id v8 = [v7 urlRequest];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_350A8;
  v11[3] = &unk_760C8;
  v11[4] = self;
  id v9 = [(AAUIAppleAccountViewController *)self _loadRemoteRequest:v8 withIdentifier:@"_AAUIRemotePageIdentifierPersonalInfo" preparation:v11 completion:0];
  activeRemoteUIController = self->_activeRemoteUIController;
  self->_activeRemoteUIController = v9;
}

- (void)_securitySpecifierWasTapped:(id)a3
{
  [(AAUIAppleAccountViewController *)self _startSpinnerInSpecifier:a3];
  id v4 = dispatch_get_global_queue(33, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_351F8;
  block[3] = &unk_756F8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    id v9 = [v8 identifier];
    unsigned int v10 = [v9 isEqualToString:@"_AAUIRemotePageIdentifierSecurity"];

    if (v10)
    {
      uint64_t v11 = _AAUILogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Presenting modal for security controller: %@", (uint8_t *)&v12, 0xCu);
      }

      [(AAUIServerUIHookHandler *)self->_serverHookHandler setPresentingControllerOverride:v7];
    }
  }
}

- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [v6 identifier];
    unsigned int v8 = [v7 isEqualToString:@"_AAUIRemotePageIdentifierSecurity"];

    if (v8)
    {
      id v9 = _AAUILogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v24 = v6;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Dismissing modal for security controller: %@", buf, 0xCu);
      }

      [(AAUIServerUIHookHandler *)self->_serverHookHandler setPresentingControllerOverride:0];
    }
    if (self->_didCompleteHSA2)
    {
      self->_didCompleteHSA2 = 0;
      unsigned int v10 = +[AAUICDPHelper helperWithPresenter:self];
      uint64_t v11 = [v10 cdpStateControllerForPrimaryAccount];
      newPassword = self->_newPassword;
      uint64_t v13 = [v11 context];
      [(id)v13 setPassword:newPassword];

      id v14 = [v11 context];
      LOBYTE(v13) = objc_opt_respondsToSelector();

      if (v13)
      {
        id v15 = _AAUILogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          sub_4AA3C();
        }

        id v16 = [v11 context];
        [v16 setNewPassword:self->_newPassword oldPassword:self->_oldPassword];
      }
      long long v17 = [v11 context];
      [v17 setType:13];

      currentObjectModel = self->_currentObjectModel;
      long long v19 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v20 = [v19 localizedStringForKey:@"STINGRAY_TITLE_VERIFYING" value:&stru_76890 table:@"Localizable"];
      [(RUIObjectModel *)currentObjectModel startNavigationBarSpinnerWithTitle:v20];

      CFStringRef v21 = _AAUILogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_4A9A8(v11, v21);
      }

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_3593C;
      v22[3] = &unk_756A8;
      v22[4] = self;
      [v11 repairCloudDataProtectionStateWithCompletion:v22];
    }
  }
}

- (id)_loadRemoteRequest:(id)a3 withIdentifier:(id)a4 preparation:(id)a5 completion:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (void (**)(id, id))a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = [(AAUIAppleAccountViewController *)self _activeAccount];
  id v15 = [objc_alloc((Class)AAUIRemoteUIController) initWithIdentifier:v13 account:v14];

  [v15 setDelegate:self];
  id v16 = [(AAUIAppleAccountViewController *)self navigationController];
  [v15 setNavigationController:v16];

  if (v11) {
    v11[2](v11, v15);
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_35BD8;
  v23[3] = &unk_76140;
  id v26 = v12;
  id v17 = v15;
  id v24 = v17;
  id v25 = v10;
  id v18 = v10;
  id v19 = v12;
  [(AAUIAppleAccountViewController *)self _getServerUILoadDelegateWithCompletion:v23];
  unsigned int v20 = v25;
  id v21 = v17;

  return v21;
}

- (void)_loadRemoteRequest:(id)a3 withIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  [(AAUIAppleAccountViewController *)self _startSpinnerInSpecifier:a5];
  id v10 = [(AAUIAppleAccountViewController *)self _loadRemoteRequest:v9 withIdentifier:v8 preparation:0 completion:0];

  activeRemoteUIController = self->_activeRemoteUIController;
  self->_activeRemoteUIController = v10;
}

- (void)_paymentSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "html payment and shipping page (on by default)", buf, 2u);
  }

  id v6 = +[NSURL URLWithString:SKAccountPagePaymentsShippingURLString];
  id v7 = [objc_alloc((Class)SKAccountPageViewController) initWithAccountURL:v6];
  char v8 = objc_opt_respondsToSelector();
  p_super = _AAUILogSystem();
  BOOL v10 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      cachedResourceDictionary = self->_cachedResourceDictionary;
      *(_DWORD *)long long buf = 138412290;
      id v17 = cachedResourceDictionary;
      _os_log_impl(&dword_0, p_super, OS_LOG_TYPE_DEFAULT, "Passing cached resource dictionary %@", buf, 0xCu);
    }

    [v7 setClientData:self->_cachedResourceDictionary];
    p_super = &self->_cachedResourceDictionary->super;
    self->_cachedResourceDictionary = 0;
  }
  else if (v10)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, p_super, OS_LOG_TYPE_DEFAULT, "SKAccountPageViewController does not respond to setClientData:", buf, 2u);
  }

  id v12 = [(AAUIAppleAccountViewController *)self _grandSlamAccount];
  [v7 setAccount:v12];

  [(AAUIAppleAccountViewController *)self _startSpinnerInSpecifier:v4];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_36130;
  v14[3] = &unk_75130;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [v13 loadWithCompletionBlock:v14];
}

- (void)_cloudSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  [(AAUIAppleAccountViewController *)self _startSpinnerInSpecifier:v4];
  id v5 = [(AAUIAppleAccountViewController *)self _appleAccount];

  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      [v4 setObject:self->_accountManager forKeyedSubscript:@"icloudAccountManager"];
      [v4 setControllerLoadAction:0];
      id v6 = [(AAUIAppleAccountViewController *)self _appleAccount];
      if (objc_msgSend(v6, "aa_isAccountClass:", AAAccountClassPrimary))
      {
      }
      else
      {
        char v8 = [(AAUIAppleAccountViewController *)self _appleAccount];
        unsigned int v9 = objc_msgSend(v8, "aa_isManagedAppleID");

        if (!v9)
        {
          id v10 = +[ICSViewBuilder iCloudHomeViewControllerClassLegacy];
          goto LABEL_12;
        }
      }
      id v10 = (id)objc_opt_class();
LABEL_12:
      [v4 setDetailControllerClass:v10];
      goto LABEL_13;
    }
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
    }

    [v4 setObject:self->_accountManager forKeyedSubscript:@"icloudAccountManager"];
    [v4 setDetailControllerClass:objc_opt_class()];
    [v4 setControllerLoadAction:0];
  }
  else
  {
    [(AAUIAppleAccountViewController *)self _attemptSignInForServiceType:AIDAServiceTypeCloud];
  }
LABEL_13:
  [(AAUIAppleAccountViewController *)self _stopSpinnerInActiveSpecifier];
}

- (void)_attemptSignInForServiceType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)AAUISignInController);
  [v5 setDelegate:self];
  id v13 = v4;
  id v6 = +[NSArray arrayWithObjects:&v13 count:1];
  [v5 setServiceTypes:v6];

  [v5 _setShouldForceOperation:1];
  if (PSIsiPad())
  {
    [v5 setModalPresentationStyle:2];
    [v5 setModalTransitionStyle:0];
  }
  id v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v12 = v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Preflighting sign in controller for service: %{public}@", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_364CC;
  v9[3] = &unk_756D0;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v8 prepareInViewController:self completion:v9];
}

- (void)_storeSpecifierWasTapped:(id)a3
{
  id v17 = (char *)a3;
  [(AAUIAppleAccountViewController *)self _startSpinnerInSpecifier:v17];
  id v4 = [(AAUIAppleAccountViewController *)self _storeAccount];

  if (!v4)
  {
    [(AAUIAppleAccountViewController *)self _attemptSignInForServiceType:AIDAServiceTypeStore];
    goto LABEL_17;
  }
  uint64_t v5 = PSLazilyLoadedBundleKey;
  id v6 = [v17 propertyForKey:PSLazilyLoadedBundleKey];
  if (v6)
  {
    id v7 = +[NSBundle bundleWithPath:v6];
    id v8 = [v17 propertyForKey:PSBundleOverridePrincipalClassKey];
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      id v10 = [v17 propertyForKey:PSDetailControllerClassKey];
      if (v10)
      {
        uint64_t v11 = v10;
        Class v12 = NSClassFromString(v10);
        if (v12)
        {
          Class v13 = v12;

LABEL_11:
          id v14 = v17;
          *(void *)&v17[OBJC_IVAR___PSSpecifier_detailControllerClass] = v13;
          if (!*(void *)&v17[OBJC_IVAR___PSSpecifier_editPaneClass])
          {
            id v15 = [v17 propertyForKey:PSEditPaneClassKey];
            id v16 = [v7 classNamed:v15];
            *(void *)&v17[OBJC_IVAR___PSSpecifier_editPaneClass] = v16;

            id v14 = v17;
          }
          [v14 setControllerLoadAction:0];
          [v17 removePropertyForKey:v5];
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(*(id *)&v17[OBJC_IVAR___PSSpecifier_detailControllerClass], "validateSpecifier:");
          }
          [(AAUIAppleAccountViewController *)self _stopSpinnerInActiveSpecifier];

          goto LABEL_16;
        }
        [v7 load];
        Class v13 = NSClassFromString(v11);

        if (v13) {
          goto LABEL_11;
        }
      }
    }
    Class v13 = (Class)[v7 principalClass];
    goto LABEL_11;
  }
  [v17 setControllerLoadAction:0];
LABEL_16:

LABEL_17:
}

- (void)_siwaSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AASignInWithAppleManagementUIRequest);
  id v6 = [(AAUIAppleAccountViewController *)self _grandSlamAccount];
  id v7 = [(AAUIAppleAccountViewController *)self accountStore];
  id v9 = [v5 initWithGrandSlamAccount:v6 accountStore:v7];

  id v8 = [v9 urlRequest];
  [(AAUIAppleAccountViewController *)self _loadRemoteRequest:v8 withIdentifier:@"_AAUIRemotePageIdentifierSIWAManagement" specifier:v4];

  [(AAUIRemoteUIController *)self->_activeRemoteUIController registerSIWASharingTipView];
}

- (void)_deleteButtonTapped:(id)a3
{
  id v36 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v37 = _os_activity_create(&dword_0, "appleaccount/sign-out", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DETACHED);
  os_activity_scope_enter(v37, &state);
  objc_initWeak(&location, self);
  [(AAUIAppleAccountViewController *)self _stopObservingAccountStoreChanges];
  uint64_t v56 = 0;
  long long v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = sub_33A58;
  v60 = sub_33A68;
  id v61 = [objc_alloc((Class)AAUISignOutFlowControllerDelegate) initWithPresentingViewController:self];
  [(id)v57[5] setAccountManager:self->_accountManager];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_3740C;
  v54[3] = &unk_76190;
  objc_copyWeak(&v55, &location);
  v54[4] = &v56;
  id v4 = objc_retainBlock(v54);
  id v5 = [(AAUIAppleAccountViewController *)self _appleAccount];
  id v6 = [(AAUIAppleAccountViewController *)self _storeAccount];
  id v7 = objc_alloc_init((Class)AIDAMutableServiceContext);
  [v7 setViewController:self];
  uint64_t v8 = AIDAServiceTypeCloud;
  uint64_t v9 = v57[5];
  uint64_t v65 = AIDAServiceTypeCloud;
  uint64_t v66 = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
  [v7 setSignOutContexts:v10];

  if (v5 && v6)
  {
    objc_initWeak(from, self);
    uint64_t v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "User signed in to iCloud & Store, prompting for clarification...", buf, 2u);
    }

    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_376C4;
    v47[3] = &unk_76230;
    objc_copyWeak(&v52, from);
    id v48 = v7;
    v51 = v4;
    id v49 = v6;
    id v50 = v5;
    [(AAUIAppleAccountViewController *)self _promptForAccountSignOutAppleAccount:v50 storeAccount:v49 completion:v47];

    objc_destroyWeak(&v52);
    objc_destroyWeak(from);
  }
  else if (v5)
  {
    Class v12 = [(AAUIAppleAccountViewController *)self _appleAccount];
    unsigned __int8 v13 = objc_msgSend(v12, "aa_isAccountClass:", AAAccountClassPrimary);

    if (v13)
    {
      id v14 = _AAUILogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(from[0]) = 138412290;
        *(id *)((char *)from + 4) = v5;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Signing out user from iCloud service for account %@", (uint8_t *)from, 0xCu);
      }

      objc_initWeak(from, self);
      serviceOwnersManager = self->_serviceOwnersManager;
      id v16 = [v7 copy];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_381B8;
      v40[3] = &unk_76280;
      objc_copyWeak(&v44, from);
      uint64_t v43 = v4;
      id v41 = v5;
      id v42 = v7;
      [(AIDAServiceOwnerProtocol *)serviceOwnersManager signOutService:v8 withContext:v16 completion:v40];

      objc_destroyWeak(&v44);
      objc_destroyWeak(from);
    }
    else
    {
      id v21 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned __int8 v22 = [v21 localizedStringForKey:@"DELETE_ACCOUNT" value:&stru_76890 table:@"Localizable"];
      unsigned int v23 = +[NSBundle bundleForClass:objc_opt_class()];
      id v24 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DELETE_ACCOUNT_WARNING_FORMAT"];
      id v25 = [v23 localizedStringForKey:v24 value:&stru_76890 table:@"Localizable"];
      v35 = +[UIAlertController alertWithTitle:v22 message:v25];

      id v26 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v27 = [v26 localizedStringForKey:@"DELETE_ACCOUNT" value:&stru_76890 table:@"Localizable"];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_38164;
      v45[3] = &unk_76258;
      v45[4] = self;
      id v46 = v5;
      v28 = +[UIAlertAction actionWithTitle:v27 style:2 handler:v45];

      v29 = +[NSBundle bundleForClass:objc_opt_class()];
      double v30 = [v29 localizedStringForKey:@"CANCEL" value:&stru_76890 table:@"Localizable"];
      unsigned int v31 = +[UIAlertAction actionWithTitle:v30 style:1 handler:0];

      [v35 addAction:v28];
      [v35 addAction:v31];
      int v32 = [(AAUIAppleAccountViewController *)self navigationController];
      [v32 presentViewController:v35 animated:1 completion:0];
    }
  }
  else if (v6)
  {
    id v17 = _AAUILogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(from[0]) = 138412290;
      *(id *)((char *)from + 4) = 0;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Signing out user from iTunes service for account %@", (uint8_t *)from, 0xCu);
    }

    id v18 = self->_serviceOwnersManager;
    id v19 = [v7 copy];
    uint64_t v20 = AIDAServiceTypeStore;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_384D0;
    v38[3] = &unk_75838;
    uint64_t v39 = v4;
    [(AIDAServiceOwnerProtocol *)v18 signOutService:v20 withContext:v19 completion:v38];
  }
  else
  {
    CFStringRef v33 = _AAUILogSystem();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(from[0]) = 0;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "User attempted to sign out but isn't signed in!", (uint8_t *)from, 2u);
    }

    unsigned __int8 v34 = +[NSError aa_errorWithCode:-1];
    ((void (*)(void *, void, void *))v4[2])(v4, 0, v34);
  }
  objc_destroyWeak(&v55);
  _Block_object_dispose(&v56, 8);

  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);
}

- (void)_promptForAccountSignOutAppleAccount:(id)a3 storeAccount:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, uint64_t))a5;
  uint64_t v11 = AIDAServiceTypeCloud;
  Class v12 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager altDSIDForAccount:v8 service:AIDAServiceTypeCloud];
  uint64_t v13 = AIDAServiceTypeStore;
  id v14 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager altDSIDForAccount:v9 service:AIDAServiceTypeStore];
  if ([v12 isEqualToString:v14])
  {
    id v15 = _AAUILogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Apple account and store account have matching altDSIDs!", buf, 2u);
    }

    v10[2](v10, 1, 1);
  }
  else
  {
    id v16 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager DSIDForAccount:v8 service:v11];
    id v17 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager DSIDForAccount:v9 service:v13];
    if ([v16 isEqualToString:v17])
    {
      id v18 = _AAUILogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Apple account and store account have matching DSIDs!", buf, 2u);
      }

      v10[2](v10, 1, 1);
    }
    else
    {
      PSIsiPad();
      +[NSBundle bundleForClass:objc_opt_class()];
      id v19 = v38 = v16;
      [v19 localizedStringForKey:@"MULTIPLE_SERVICES_MESSAGE" value:&stru_76890 table:@"Localizable"];
      v20 = id v37 = v17;
      uint64_t v39 = +[UIAlertController alertWithTitle:v20 message:0];

      id v21 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned __int8 v22 = [v21 localizedStringForKey:@"MULTIPLE_SERVICES_SIGN_OUT_BOTH" value:&stru_76890 table:@"Localizable"];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_38BB8;
      v46[3] = &unk_762A8;
      unsigned int v23 = v10;
      id v47 = v23;
      id v24 = +[UIAlertAction actionWithTitle:v22 style:2 handler:v46];
      [v39 addAction:v24];

      id v25 = +[NSBundle bundleForClass:objc_opt_class()];
      id v26 = [v25 localizedStringForKey:@"MULTIPLE_SERVICES_SIGN_OUT_CLOUD" value:&stru_76890 table:@"Localizable"];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_38C3C;
      v44[3] = &unk_762A8;
      uint64_t v27 = v23;
      unsigned __int8 v45 = v27;
      v28 = +[UIAlertAction actionWithTitle:v26 style:2 handler:v44];
      [v39 addAction:v28];

      v29 = +[NSBundle bundleForClass:objc_opt_class()];
      double v30 = [v29 localizedStringForKey:@"MULTIPLE_SERVICES_SIGN_OUT_STORE" value:&stru_76890 table:@"Localizable"];
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_38CC0;
      v42[3] = &unk_762A8;
      unsigned int v31 = v27;
      uint64_t v43 = v31;
      int v32 = +[UIAlertAction actionWithTitle:v30 style:2 handler:v42];
      [v39 addAction:v32];

      CFStringRef v33 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned __int8 v34 = [v33 localizedStringForKey:@"MULTIPLE_SERVICES_CANCEL" value:&stru_76890 table:@"Localizable"];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_38D44;
      v40[3] = &unk_762A8;
      v35 = v31;
      id v16 = v38;
      id v41 = v35;
      id v36 = +[UIAlertAction actionWithTitle:v34 style:1 handler:v40];
      [v39 addAction:v36];

      id v17 = v37;
      [(AAUIAppleAccountViewController *)self presentViewController:v39 animated:1 completion:0];
    }
  }
}

- (void)_subscriptionsSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_0, "appleaccountui/load-subscription-page", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Subscription Specifier tapped", buf, 2u);
  }

  id v7 = +[NSURL URLWithString:SKAccountPageManageSubscriptionsURLString];
  id v8 = [objc_alloc((Class)SKAccountPageViewController) initWithAccountURL:v7];
  [(AAUIAppleAccountViewController *)self _startSpinnerInSpecifier:v4];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_38F58;
  v10[3] = &unk_75130;
  v10[4] = self;
  id v9 = v8;
  id v11 = v9;
  [v9 loadWithCompletionBlock:v10];

  os_activity_scope_leave(&state);
}

- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_39048;
  v5[3] = &unk_756F8;
  v5[4] = self;
  -[AAUIAppleAccountViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5, a5);
}

- (void)signInControllerDidCancel:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_390C0;
  v3[3] = &unk_756F8;
  v3[4] = self;
  [(AAUIAppleAccountViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

- (void)_startSpinnerInSpecifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    p_activelyLoadingSpecifier = &self->_activelyLoadingSpecifier;
    if (!*p_activelyLoadingSpecifier)
    {
      if (objc_msgSend(v5, "aaui_startSpinner")) {
        objc_storeStrong((id *)p_activelyLoadingSpecifier, a3);
      }
    }
  }

  _objc_release_x1();
}

- (void)_stopSpinnerInActiveSpecifier
{
  activelyLoadingSpecifier = self->_activelyLoadingSpecifier;
  if (activelyLoadingSpecifier)
  {
    [(PSSpecifier *)activelyLoadingSpecifier aaui_stopSpinner];
    id v4 = self->_activelyLoadingSpecifier;
    self->_activelyLoadingSpecifier = 0;
  }
}

- (BOOL)_hasActiveSpecifier
{
  return self->_activelyLoadingSpecifier != 0;
}

- (void)endUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)AAUIAppleAccountViewController;
  [(AAUIAppleAccountViewController *)&v3 endUpdates];
  [(AAUIAppleAccountViewController *)self handlePendingURL];
}

- (id)_valueForPaymentSpecifier:(id)a3
{
  paymentSpecifierValue = self->_paymentSpecifierValue;
  if (!paymentSpecifierValue)
  {
    [(AAUIAppleAccountViewController *)self _loadPaymentMethodSummary];
    paymentSpecifierValue = self->_paymentSpecifierValue;
  }

  return paymentSpecifierValue;
}

- (void)_loadPaymentMethodSummary
{
  if (!self->_didAttemptToFetchPaymentMethodSummary)
  {
    self->_didAttemptToFetchPaymentMethodSummary = 1;
    objc_super v3 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_392F8;
    block[3] = &unk_756F8;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

- (void)_handlePaymentMethodSummaryResponse:(id)a3
{
  id v4 = a3;
  id v5 = [v4 error];

  if (v5)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 error];
      int v12 = 138412290;
      uint64_t v13 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Failed to fetch payment method summary with error: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if ([v4 numberOfCards])
  {
    id v8 = [v4 description];
    paymentSpecifierValue = self->_paymentSpecifierValue;
    self->_paymentSpecifierValue = v8;

    id v10 = [(AAUIAppleAccountViewController *)self _paymentSpecifierProvider];
    id v11 = v10;
    if (v10) {
      [v10 setPaymentSummaryDescription:self->_paymentSpecifierValue];
    }
    else {
      [(AAUIAppleAccountViewController *)self reloadSpecifier:self->_paymentSpecifier];
    }
  }
}

- (id)_specifiersForFamily
{
  id v2 = [(AAUIAppleAccountViewController *)self _familySpecifierProvider];
  objc_super v3 = [v2 specifiers];

  return v3;
}

- (id)_familySpecifierProvider
{
  familySpecifierProvider = self->_familySpecifierProvider;
  if (!familySpecifierProvider)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)qword_90040;
    uint64_t v13 = qword_90040;
    if (!qword_90040)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_46C98;
      v9[3] = &unk_75298;
      v9[4] = &v10;
      sub_46C98((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    id v6 = (AAUISpecifierProvider *)[[v5 alloc] initWithAccountManager:self->_accountManager presenter:self];
    id v7 = self->_familySpecifierProvider;
    self->_familySpecifierProvider = v6;

    [(AAUISpecifierProvider *)self->_familySpecifierProvider setDelegate:self];
    familySpecifierProvider = self->_familySpecifierProvider;
  }

  return familySpecifierProvider;
}

- (id)_specifiersForStore
{
  objc_super v3 = [(AAUIAppleAccountViewController *)self _storeSpecifier];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(AAUIAppleAccountViewController *)self _storeSpecifier];
    id v5 = [v4 specifiers];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_storeSpecifierProvider
{
  id v2 = [(AAUIAppleAccountViewController *)self _storeSpecifier];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___AAUISpecifierProvider]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_storeSpecifier
{
  if (!self->_storeSpecifier)
  {
    id v3 = NSClassFromString(@"SKAccountPageSpecifierProvider");
    id v4 = [(AAUIAppleAccountViewController *)self _storeAccount];

    if (v4)
    {
      if (v3)
      {
        id v5 = (AAUISpecifierProvider *)[[v3 alloc] initWithAccountManager:self->_accountManager];
        storeSpecifier = self->_storeSpecifier;
        self->_storeSpecifier = v5;

        [(AAUISpecifierProvider *)self->_storeSpecifier setDelegate:self];
      }
    }
  }
  id v7 = self->_storeSpecifier;

  return v7;
}

- (void)custodianSetupFlowControllerDidFinish:(id)a3
{
}

- (id)followUpUniqueIdentifier
{
  return 0;
}

- (void)custodianSetupFlowControllerRecoveryContactInviteSent
{
  id v2 = _AALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_4AC08();
  }
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(AKAppleIDServerResourceLoadDelegate *)self->_serverUILoadDelegate processResponse:v10];
  id v11 = +[NSSet setWithObjects:@"fmip1", @"prefs", @"itms", 0];
  uint64_t v12 = [v9 URL];
  uint64_t v13 = [v12 scheme];
  unsigned int v14 = [v11 containsObject:v13];

  if (v14)
  {
    id v15 = +[LSApplicationWorkspace defaultWorkspace];
    id v16 = [v9 URL];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_39D7C;
    v27[3] = &unk_76320;
    id v28 = v9;
    [v15 openURL:v16 configuration:0 completionHandler:v27];

LABEL_5:
    BOOL v20 = 0;
    goto LABEL_17;
  }
  id v17 = [v9 URL];
  id v18 = [v17 absoluteString];
  unsigned int v19 = [v18 isEqualToString:@"code:generate"];

  if (v19)
  {
    [(AAUIAppleAccountViewController *)self _generateLoginCode];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(AAUIAppleAccountViewController *)self _attemptUpdateAuthControllerWithActionableResponse:v10];
  }
  [(AAUIAppleAccountViewController *)self _addHeadersToRequest:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = [v8 redirectResponse];
    unsigned __int8 v22 = v21;
    if (v21)
    {
      unsigned int v23 = [v21 allHeaderFields];
      id v24 = [v23 objectForKey:@"X-Apple-2SV-Authenticate"];

      if (v24) {
        objc_storeStrong((id *)&self->_secondaryToken, v24);
      }
    }
  }
  secondaryToken = self->_secondaryToken;
  if (secondaryToken) {
    [v9 setValue:secondaryToken forHTTPHeaderField:@"X-Apple-2SV-Authenticate"];
  }
  BOOL v20 = 1;
LABEL_17:

  return v20;
}

- (void)_generateLoginCode
{
  id v3 = objc_alloc_init((Class)AAUITwoFactorCodeHook);
  [v3 generateLoginCodeWithPresenter:self completion:0];
}

- (id)remoteUIController:(id)a3 createPageWithName:(id)a4 attributes:(id)a5
{
  id v5 = objc_alloc_init((Class)AAUIRemotePage);
  [v5 setHidesBottomBarWhenPushed:1];

  return v5;
}

- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(AAUIAppleAccountViewController *)self _handleObjectModelChangeForController:v7 objectModel:v6 isModal:0];
  }
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(AAUIAppleAccountViewController *)self _handleObjectModelChangeForController:v9 objectModel:v8 isModal:v5];
  }
}

- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v9 identifier];
    *(_DWORD *)long long buf = 138412290;
    v71 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Handling an object model: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&self->_currentObjectModel, a4);
  uint64_t v12 = [v9 defaultPages];
  uint64_t v13 = [v12 firstObject];
  unsigned int v14 = [v13 navigationItem];

  id v15 = [v14 leftBarButtonItems];
  LODWORD(v13) = [v15 count] == 0;

  if (v13)
  {
    unsigned int v31 = [v8 identifier];
    unsigned int v32 = [v31 isEqualToString:@"_AAUIRemotePageIdentifierSecondaryAuth"];

    if (v32)
    {
      if (!self->_hasShownSecondaryAuthFirstPage)
      {
        id v33 = objc_alloc((Class)UIBarButtonItem);
        unsigned __int8 v34 = +[NSBundle bundleForClass:objc_opt_class()];
        v35 = [v34 localizedStringForKey:@"CANCEL" value:&stru_76890 table:@"Localizable"];
        id v36 = [v33 initWithTitle:v35 style:0 target:self action:"_cancelSecondaryAuthenticationWasTapped:"];
        [v14 setLeftBarButtonItem:v36];

        self->_hasShownSecondaryAuthFirstPage = 1;
      }
    }
    else if (v5)
    {
      id v37 = objc_alloc((Class)UIBarButtonItem);
      unint64_t v38 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v39 = [v38 localizedStringForKey:@"CANCEL" value:&stru_76890 table:@"Localizable"];
      id v40 = [v37 initWithTitle:v39 style:0 target:self action:"_cancelButtonForRemoteObjectModelWasTapped:"];
      [v14 setLeftBarButtonItem:v40];
    }
  }
  else
  {
    objc_initWeak((id *)buf, v8);
    v64 = _NSConcreteStackBlock;
    uint64_t v65 = 3221225472;
    uint64_t v66 = sub_3A77C;
    v67 = &unk_76348;
    objc_copyWeak(&v68, (id *)buf);
    BOOL v69 = v5;
    [v8 setHandlerForButtonName:AKActionButtonKey handler:&v64];
    objc_destroyWeak(&v68);
    objc_destroyWeak((id *)buf);
  }
  id v16 = objc_msgSend(v8, "identifier", v64, v65, v66, v67);
  unsigned int v17 = [v16 isEqualToString:@"_AAUIRemotePageIdentifierSecurity"];

  if (v17) {
    [(AAUIServerUIHookHandler *)self->_serverHookHandler processObjectModel:v9 isModal:v5];
  }
  id v18 = [v8 identifier];
  unsigned int v19 = [v18 isEqualToString:@"_AAUIRemotePageIdentifierPersonalInfo"];

  if (v19)
  {
    if (!self->_serverHookHandler)
    {
      BOOL v20 = objc_opt_new();
      id v21 = [v20 hooksFor:3 accountManager:self->_accountManager];
      unsigned __int8 v22 = (AAUIServerUIHookHandler *)[objc_alloc((Class)AAUIServerUIHookHandler) initWithRemoteUIController:v8 hooks:v21];
      serverHookHandler = self->_serverHookHandler;
      self->_serverHookHandler = v22;
    }
    id v24 = _AAUILogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Processing object model for Personal Info page.", buf, 2u);
    }

    [(AAUIServerUIHookHandler *)self->_serverHookHandler processObjectModel:v9 isModal:v5];
  }
  id v25 = [v8 identifier];
  unsigned int v26 = [v25 isEqualToString:@"_AAUIRemotePageIdentifierPaymentInfo"];

  if (v26)
  {
    uint64_t v27 = [v9 clientInfo];
    id v28 = [v27 objectForKey:@"paymentSummary"];

    if (v28)
    {
      [(AARequester *)self->_paymentMethodSummaryRequester cancel];
      self->_didAttemptToFetchPaymentMethodSummary = 1;
      objc_storeStrong((id *)&self->_paymentSpecifierValue, v28);
      v29 = [(AAUIAppleAccountViewController *)self _paymentSpecifierProvider];
      double v30 = v29;
      if (v29) {
        [v29 setPaymentSummaryDescription:self->_paymentSpecifierValue];
      }
      else {
        [(AAUIAppleAccountViewController *)self reloadSpecifier:self->_paymentSpecifier];
      }
    }
  }
  id v41 = [v9 clientInfo];
  id v42 = [v41 objectForKeyedSubscript:@"showDeviceHeaderNatively"];
  unsigned int v43 = [v42 BOOLValue];

  if (v43)
  {
    id v44 = _AAUILogSystem();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v44, OS_LOG_TYPE_DEFAULT, "Adding FMIP Header to Device Info RUI", buf, 2u);
    }

    unsigned __int8 v45 = [v9 defaultPages];
    id v46 = [v45 firstObject];

    id v47 = [(AAUIDeviceSpecifierProvider *)self->_deviceSpecifierProvider deviceRecentlyTapped];
    id v48 = [v9 clientInfo];
    [v47 updateWithRUIClientInfo:v48];

    id v49 = [AAUIFMIPHeaderDeviceInfoPageSurrogate alloc];
    id v50 = [(AAUIAppleAccountViewController *)self _appleAccount];
    v51 = [(AAUIFMIPHeaderDeviceInfoPageSurrogate *)v49 initWithPage:v46 device:v47 appleAccount:v50];
    deviceSurrogate = self->_deviceSurrogate;
    self->_deviceSurrogate = v51;

    [(AAUIFMIPHeaderDeviceInfoPageSurrogate *)self->_deviceSurrogate setDelegate:self->_deviceSpecifierProvider];
    if (([v47 showFMIPRow] & 1) != 0
      || [v47 showBackupRow]
      && ([(AAUIAppleAccountViewController *)self _appleAccount],
          uint64_t v56 = objc_claimAutoreleasedReturnValue(),
          unsigned int v57 = objc_msgSend(v56, "aa_isPrimaryAccount"),
          v56,
          v57))
    {
      v53 = [(AAUIAppleAccountViewController *)self _RUITableViewSectionForDevice:v47 inPage:v46 delegate:self->_deviceSurrogate];
      long long v54 = [v46 tableViewOM];
      id v55 = [v54 sections];
      [v55 insertObject:v53 atIndex:0];
    }
  }
  uint64_t v58 = [v9 defaultPages];
  v59 = [v58 firstObject];

  if (+[AAPreferences isSpyglass2023Enabled]
    && +[AAUIRUITableViewSectionInjector shouldInject:AAUIRUITableInjectionTypeGDPR inPage:v59])
  {
    v60 = +[AAUIRUITableViewSectionInjectorFactory tableViewSectionInjectorForGPPRWithPage:v59];
    objectModelDecorators = self->_objectModelDecorators;
    v62 = [v9 sourceURL];
    [(NSMutableDictionary *)objectModelDecorators setObject:v60 forKey:v62];
  }
  v63 = [v9 clientInfo];
  [(AAUIAppleAccountViewController *)self _updateLocalAccountInformationFromClientInfo:v63];
}

- (void)_updateLocalAccountInformationFromClientInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 allKeys];
  id v6 = +[NSSet setWithArray:v5];

  id v7 = +[NSSet setWithObjects:@"firstName", @"middleName", @"lastName", @"accountName", @"primaryEmailAddress", 0];
  if ([v6 intersectsSet:v7])
  {
    unsigned int v17 = self;
    id v8 = [(AAUIAppleAccountViewController *)self _appleAccount];
    id v9 = [v8 copy];

    [v9 reload];
    id v10 = sub_3AAE0(v4, @"firstName");
    if ([v10 length]) {
      objc_msgSend(v9, "aa_setFirstName:", v10);
    }
    id v11 = sub_3AAE0(v4, @"middleName");
    if ([v11 length]) {
      objc_msgSend(v9, "aa_setMiddleName:", v11);
    }
    uint64_t v12 = sub_3AAE0(v4, @"lastName");
    if ([v12 length]) {
      objc_msgSend(v9, "aa_setLastName:", v12);
    }
    uint64_t v13 = sub_3AAE0(v4, @"accountName");
    if ([v13 length]) {
      objc_msgSend(v9, "_aa_setAppleID:", v13);
    }
    unsigned int v14 = sub_3AAE0(v4, @"primaryEmailAddress");
    if ([v14 length]) {
      objc_msgSend(v9, "_aa_setPrimaryEmail:", v14);
    }
    if ([v9 isDirty])
    {
      id v15 = _AAUILogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Server returned updated contact information, updating account...", buf, 2u);
      }

      id v16 = [(AAUIAppleAccountViewController *)v17 _accountStore];
      [v16 saveVerifiedAccount:v9 withCompletionHandler:&stru_76388];
    }
  }
}

- (id)_RUITableViewSectionForDevice:(id)a3 inPage:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc((Class)RUITableViewSection);
  id v12 = objc_alloc_init((Class)NSDictionary);
  uint64_t v13 = [v10 tableViewOM];

  id v14 = [v11 initWithAttributes:v12 parent:v13];
  if ([v8 showFMIPRow])
  {
    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    id v16 = [objc_alloc((Class)RUITableViewRow) initWithAttributes:v15 parent:v14];
    [v15 setValue:@"fmipRow" forKey:@"name"];
    unsigned int v17 = objc_msgSend(v8, "aaui_localizedDeviceLocatorLabel");
    [v15 setValue:v17 forKey:@"label"];

    [v15 setValue:@"labelColor" forKey:@"labelColor"];
    if ([v8 currentDevice])
    {
      [v16 setDelegate:v9];
      id v18 = [(AAUIAppleAccountViewController *)self _fmipStatusString];
      [v15 setValue:v18 forKey:@"detailLabel"];
      [v15 setValue:@"disclosure" forKey:@"accessory"];
      [v15 setValue:@"link" forKey:@"class"];
      CFStringRef v19 = @"true";
      CFStringRef v20 = @"value";
      id v21 = v15;
    }
    else
    {
      [v15 setValue:@"label" forKey:@"class"];
      unsigned int v22 = [v8 fmipEnabled];
      unsigned int v23 = +[NSBundle bundleForClass:objc_opt_class()];
      id v24 = v23;
      if (v22) {
        CFStringRef v25 = @"ON";
      }
      else {
        CFStringRef v25 = @"OFF";
      }
      id v18 = [v23 localizedStringForKey:v25 value:&stru_76890 table:@"Localizable"];

      CFStringRef v20 = @"detailLabel";
      id v21 = v15;
      CFStringRef v19 = v18;
    }
    [v21 setValue:v19 forKey:v20];

    [v15 setValue:@"secondaryLabelColor" forKey:@"detailLabelColor"];
    [v16 setAttributes:v15];
    unsigned int v26 = [v16 tableCell];
    [v26 setTag:1001];

    uint64_t v27 = +[NSBundle bundleForClass:objc_opt_class()];
    id v28 = +[UIImage imageNamed:@"fmip.png" inBundle:v27];

    [v16 setImage:v28];
    if ([v8 currentDevice]
      && +[AADeviceInfo locationServicesRestricted])
    {
      v29 = [v16 tableCell];
      [v29 setEnabled:0];

      double v30 = [v16 tableCell];
      unsigned int v31 = [v30 textLabel];
      [v31 setAlpha:0.5];

      unsigned int v32 = [v16 tableCell];
      id v33 = [v32 imageView];
      [v33 setAlpha:0.5];
    }
    [v14 addRow:v16];
  }
  if ([v8 showBackupRow])
  {
    unsigned __int8 v34 = [(AAUIAppleAccountViewController *)self _appleAccount];
    unsigned int v35 = objc_msgSend(v34, "aa_isPrimaryAccount");

    if (v35)
    {
      id v36 = objc_alloc_init((Class)NSMutableDictionary);
      id v37 = objc_alloc_init((Class)RUITableViewRow);
      [v36 setValue:@"backupRow" forKey:@"name"];
      unint64_t v38 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v39 = [v38 localizedStringForKey:@"BACKUP_CELL_LABEL" value:&stru_76890 table:@"Localizable"];
      [v36 setValue:v39 forKey:@"label"];

      [v36 setValue:@"labelColor" forKey:@"labelColor"];
      [v36 setValue:@"secondaryLabelColor" forKey:@"detailLabelColor"];
      if ([v8 currentDevice])
      {
        [v36 setValue:@"disclosure" forKey:@"accessory"];
        [v36 setValue:@"link" forKey:@"class"];
        [v36 setValue:@"true" forKey:@"value"];
        [v37 setDelegate:v9];
        id v40 = [(AAUIAppleAccountViewController *)self _backupStatusString];
        [v36 setValue:v40 forKey:@"detailLabel"];
      }
      else
      {
        [v36 setValue:@"label" forKey:@"class"];
        [v36 setValue:@"-" forKey:@"detailLabel"];
      }
      [v37 setAttributes:v36];
      id v41 = [v37 tableCell];
      [v41 setTag:1002];

      id v42 = +[PKIconImageCache settingsIconCache];
      unsigned int v43 = [v42 imageForKey:PKiCloudBackupIconKey];

      [v37 setImage:v43];
      [v14 addRow:v37];
    }
  }

  return v14;
}

- (id)_fmipStatusString
{
  id v2 = +[AAUIDeviceLocatorService sharedInstance];
  unsigned int v3 = [v2 isEnabled];

  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v5 = v4;
  if (v3) {
    CFStringRef v6 = @"ON";
  }
  else {
    CFStringRef v6 = @"OFF";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_76890 table:@"Localizable"];

  return v7;
}

- (id)_backupStatusString
{
  id v2 = [(AAUIAppleAccountViewController *)self _appleAccount];
  unsigned int v3 = [v2 isEnabledForDataclass:kAccountDataclassBackup];

  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v5 = v4;
  if (v3) {
    CFStringRef v6 = @"ON";
  }
  else {
    CFStringRef v6 = @"OFF";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_76890 table:@"Localizable"];

  return v7;
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v8 = (AAUIServerUIHookHandler *)a3;
  id v9 = (AAUIServerUIHookHandler *)a4;
  id v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v11 = *a5;
    int v29 = 138412802;
    double v30 = v8;
    __int16 v31 = 2112;
    unsigned int v32 = v9;
    __int16 v33 = 2048;
    unint64_t v34 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "AAUIAppleAccountViewController (%@) did receieve objectModel (%@) with actionSignal (%lu)", (uint8_t *)&v29, 0x20u);
  }

  id v12 = [(AAUIServerUIHookHandler *)v9 clientInfo];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = [v12 objectForKey:AAUIClientInfoActionKey];
    if ([v14 isEqualToString:@"update:trustedDevicesSummary"])
    {
      id v15 = _AAUILogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Server request client to update trusted devices list", (uint8_t *)&v29, 2u);
      }

      [(AAUIDeviceSpecifierProvider *)self->_deviceSpecifierProvider refreshDeviceList];
    }
  }
  if (!*a5)
  {
    id v16 = [(AAUIServerUIHookHandler *)v9 allPages];
    id v17 = [v16 count];

    if (!v17)
    {
      id v18 = _AAUILogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        serverHookHandler = self->_serverHookHandler;
        int v29 = 138412546;
        double v30 = v9;
        __int16 v31 = 2112;
        unsigned int v32 = serverHookHandler;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "AAUIAppleAccountViewController: Undefined action signal and no page, not displaying modally! Processing objectModel (%@) with handler (%@)", (uint8_t *)&v29, 0x16u);
      }

      CFStringRef v20 = self->_serverHookHandler;
      if (!v20)
      {
        id v21 = _AAUILogSystem();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29) = 0;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "_serverHookHandler is nil", (uint8_t *)&v29, 2u);
        }

        unsigned int v22 = objc_opt_new();
        unsigned int v23 = [v22 hooksFor:1 accountManager:self->_accountManager];
        id v24 = (AAUIServerUIHookHandler *)[objc_alloc((Class)AAUIServerUIHookHandler) initWithRemoteUIController:v8 hooks:v23];
        CFStringRef v25 = self->_serverHookHandler;
        self->_serverHookHandler = v24;

        unsigned int v26 = _AAUILogSystem();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = self->_serverHookHandler;
          activeRemoteUIController = self->_activeRemoteUIController;
          int v29 = 138412546;
          double v30 = v27;
          __int16 v31 = 2112;
          unsigned int v32 = activeRemoteUIController;
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "_serverHookHandler is %@, remoteController: %@", (uint8_t *)&v29, 0x16u);
        }

        CFStringRef v20 = self->_serverHookHandler;
      }
      [(AAUIServerUIHookHandler *)v20 processObjectModel:v9 isModal:0];
    }
  }
}

- (void)_postCDPRepairFollowUp
{
  id v2 = objc_alloc_init((Class)CDPFollowUpController);
  unsigned int v3 = +[CDPFollowUpContext contextForStateRepair];
  [v3 setRepairType:2];
  uint64_t v6 = 0;
  [v2 postFollowUpWithContext:v3 error:&v6];
  if (v6)
  {
    id v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Failed to post CDP repair follow up", v5, 2u);
    }
  }
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(AAUIServerUIHookHandler *)self->_serverHookHandler processServerResponse:v7];
  [(AKAppleIDServerResourceLoadDelegate *)self->_serverUILoadDelegate processResponse:v7];
  [(AAUIAppleAccountViewController *)self _attemptUpdateAuthControllerWithActionableResponse:v7];
  id v8 = [v7 allHeaderFields];
  id obj = [v8 objectForKey:@"X-Apple-2SV-Authenticate"];

  if (obj) {
    objc_storeStrong((id *)&self->_secondaryToken, obj);
  }
  if ([v7 statusCode] == (char *)&stru_158.reloff + 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v6 currentRequest];
    }
    else
    {
      id v9 = 0;
    }
    id v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Got a 401 response from BuddyML request.", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_3BE44;
    v38[3] = &unk_75B08;
    objc_copyWeak(&v41, (id *)buf);
    id v11 = v9;
    id v39 = v11;
    id v40 = v6;
    [(AAUIAppleAccountViewController *)self _refreshAppleIDSettingsTokensWithCompletion:v38];

    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);
  }
  else if ([v7 statusCode] == stru_B8.segname)
  {
    [(AAUIAppleAccountViewController *)self _stopSpinnerInActiveSpecifier];
  }
  else
  {
    id v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 statusCode]);
      *(_DWORD *)long long buf = 138412290;
      unsigned int v43 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "unexpected HTTP response for BuddyML request: %@", buf, 0xCu);
    }
    id v14 = +[NSBundle bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"ICLOUD_UNREACHABLE_TITLE" value:&stru_76890 table:@"Localizable"];
    id v16 = +[NSBundle bundleForClass:objc_opt_class()];
    id v17 = [v16 localizedStringForKey:@"OK" value:&stru_76890 table:@"Localizable"];
    id v18 = +[UIAlertController alertWithTitle:v15 message:0 buttonTitle:v17 actionHandler:0];

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_3BF8C;
    v37[3] = &unk_756F8;
    v37[4] = self;
    [(AAUIAppleAccountViewController *)self presentViewController:v18 animated:1 completion:v37];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v6;
    CFStringRef v20 = [v19 identifier];
    unsigned int v21 = [v20 isEqualToString:@"_AAUIRemotePageIdentifierSecurity"];

    if (v21)
    {
      unsigned int v22 = [(AKAppleIDServerResourceLoadDelegate *)self->_serverUILoadDelegate isResponseFinalForHSA2ServerFlow:v7];
      self->_didCompleteHSA2 = v22;
      if (v22)
      {
        unsigned int v23 = _AAUILogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Completed HSA2 flow", buf, 2u);
        }
      }
    }
  }
  id v24 = [(RUIObjectModel *)self->_currentObjectModel clientInfo];
  CFStringRef v25 = [v24 objectForKey:@"currentPasswordRowId"];

  if (v25)
  {
    unsigned int v26 = _AAUILogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Detected old password identifier, attempting to harvest...", buf, 2u);
    }

    uint64_t v27 = [(RUIObjectModel *)self->_currentObjectModel displayedPages];
    id v28 = [v27 firstObject];
    int v29 = [(AAUIAppleAccountViewController *)self _passcodeValueFromPage:v28 withFieldIdentifier:v25];

    if (v29) {
      objc_storeStrong((id *)&self->_oldPassword, v29);
    }
  }
  double v30 = [(RUIObjectModel *)self->_currentObjectModel clientInfo];
  __int16 v31 = [v30 objectForKey:@"newPasswordRowId"];

  if (v31)
  {
    unsigned int v32 = _AAUILogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "Detected new password identifier, attempting to harvest...", buf, 2u);
    }

    __int16 v33 = +[NSMutableDictionary dictionary];
    [(RUIObjectModel *)self->_currentObjectModel populatePostbackDictionary:v33];
    unint64_t v34 = [v33 objectForKey:v31];
    if (v34)
    {
      unsigned int v35 = _AAUILogSystem();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        unsigned int v43 = v31;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "Harvested a new password with identifier: %@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_newPassword, v34);
    }
  }
}

- (id)_passcodeValueFromPage:(id)a3 withFieldIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [a3 passcodeViewOM];
  if (v6)
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v6 attributes];
      id v9 = [v8 objectForKeyedSubscript:@"id"];
      int v16 = 138412290;
      id v17 = v9;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Found a passcode OM with ID: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  id v10 = [v6 attributes];
  id v11 = [v10 objectForKeyedSubscript:@"id"];
  unsigned int v12 = [v11 isEqual:v5];

  if (v12)
  {
    uint64_t v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Harvesting passcode with for identifier: %@", (uint8_t *)&v16, 0xCu);
    }

    id v14 = [v6 submittedPIN];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)_retryRequest:(id)a3 inRemoteUIController:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = _AAUILogSystem();
  id v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = [v7 URL];
      *(_DWORD *)long long buf = 138477827;
      int v16 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Retrying request to %{private}@...", buf, 0xCu);
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    void v13[2] = sub_3C2E0;
    v13[3] = &unk_75838;
    id v14 = v9;
    [v8 loadRequest:v7 completion:v13];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_4ACD4();
    }

    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v6 identifier];
    unsigned int v5 = [v4 isEqualToString:@"_AAUIRemotePageIdentifierSecondaryAuth"];

    if (v5) {
      [(AAUIAppleAccountViewController *)self _didFinishSecondaryAuthentication];
    }
    [(NSMutableDictionary *)self->_objectModelDecorators removeAllObjects];
  }

  _objc_release_x1();
}

- (void)_cancelButtonForRemoteObjectModelWasTapped:(id)a3
{
  id v3 = [(AAUIRemoteUIController *)self->_activeRemoteUIController dismissObjectModelsAnimated:1 completion:0];
}

- (void)_addHeadersToRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Appending headers to page request %@...", (uint8_t *)&v11, 0xCu);
  }

  id v6 = [(AAUIAppleAccountViewController *)self _grandSlamAccount];
  id v7 = [(AAUIAppleAccountViewController *)self _accountStore];
  id v8 = [v7 credentialForAccount:v6 serviceID:AAGrandSlamAppTokenIDAppleIDSettings];

  id v9 = [v8 token];
  [(AKAppleIDServerResourceLoadDelegate *)self->_serverUILoadDelegate setServiceToken:v9];
  [(AKAppleIDServerResourceLoadDelegate *)self->_serverUILoadDelegate signRequest:v4];
  id v10 = objc_msgSend(v6, "aida_dsid");
  objc_msgSend(v4, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v10);
}

- (id)_authController
{
  authController = self->_authController;
  if (!authController)
  {
    id v4 = (AKAppleIDAuthenticationController *)objc_alloc_init((Class)AKAppleIDAuthenticationController);
    unsigned int v5 = self->_authController;
    self->_authController = v4;

    authController = self->_authController;
  }

  return authController;
}

- (void)_getServerUILoadDelegateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, AKAppleIDServerResourceLoadDelegate *, void))a3;
  serverUILoadDelegate = self->_serverUILoadDelegate;
  id v6 = _AAUILogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (serverUILoadDelegate)
  {
    if (v7)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AKAppleIDServerResourceLoadDelegate cache available", buf, 2u);
    }

    if (v4) {
      v4[2](v4, self->_serverUILoadDelegate, 0);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Starting to fetch AKAppleIDServerResourceLoadDelegate", buf, 2u);
    }

    id v8 = [(AAUIAppleAccountViewController *)self _grandSlamAccount];
    id v9 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
    id v10 = objc_msgSend(v8, "aida_alternateDSID");
    [v9 setAltDSID:v10];

    [v9 setAnticipateEscrowAttempt:1];
    int v11 = [(AAUIAppleAccountViewController *)self _authController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    void v12[2] = sub_3C82C;
    v12[3] = &unk_763D8;
    v12[4] = self;
    uint64_t v13 = v4;
    [v11 getServerUILoadDelegateWithContext:v9 completion:v12];
  }
}

- (void)_attemptUpdateAuthControllerWithActionableResponse:(id)a3
{
  id v4 = a3;
  if ([(AKAppleIDServerResourceLoadDelegate *)self->_serverUILoadDelegate isResponseActionable:v4])
  {
    unsigned int v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Final Apple ID settings UI server response! Informing AuthKit...", buf, 2u);
    }

    id v6 = [(AAUIAppleAccountViewController *)self _grandSlamAccount];
    id v7 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
    id v8 = objc_msgSend(v6, "aida_alternateDSID");
    [v7 setAltDSID:v8];

    [v7 setAnticipateEscrowAttempt:1];
    id v9 = [v6 username];
    [v7 setUsername:v9];

    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    int v11 = [(AAUIAppleAccountViewController *)self _authController];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    void v13[2] = sub_3CBA4;
    v13[3] = &unk_756A8;
    dispatch_semaphore_t v14 = v10;
    id v12 = v10;
    [v11 updateStateWithExternalAuthenticationResponse:v4 forContext:v7 completion:v13];

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)_imageControlTapped
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "User opted to edit profile picture...", buf, 2u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_3CD7C;
  v5[3] = &unk_76400;
  v5[4] = self;
  id v4 = +[AAUIImagePickerAlertController alertControllerWithSelectionHandler:v5];
  [(AAUIAppleAccountViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_beginObservingProfilePictureStoreDidChangeNotification
{
  objc_initWeak(&location, self);
  id v3 = +[NSNotificationCenter defaultCenter];
  id v4 = +[NSOperationQueue mainQueue];
  uint64_t v5 = AAUIProfilePictureStoreDidChangeNotification;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3CF68;
  v8[3] = &unk_75640;
  objc_copyWeak(&v9, &location);
  id v6 = [v3 addObserverForName:v5 object:0 queue:v4 usingBlock:v8];
  profilePictureStoreDidChangeObserver = self->_profilePictureStoreDidChangeObserver;
  self->_profilePictureStoreDidChangeObserver = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_profilePictureStoreDidChange:(id)a3
{
  id v4 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AAUIAppleAccountViewController updating profile photo", v9, 2u);
  }

  uint64_t v5 = [(AAUIAppleAccountViewController *)self _profilePictureStore];
  id v6 = [v5 profilePictureForAccountOwner];

  [(AAUIAppleAccountViewController *)self _setupIdentityCardHeader];
  id v7 = [(AAUIAppleAccountHeaderView *)self->_accountHeaderView imageControl];
  id v8 = [v7 imageView];
  [v8 setImage:v6];
}

- (void)_stopObservingProfilePictureStoreDidChangeNotification
{
  if (self->_profilePictureStoreDidChangeObserver)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_profilePictureStoreDidChangeObserver];

    profilePictureStoreDidChangeObserver = self->_profilePictureStoreDidChangeObserver;
    self->_profilePictureStoreDidChangeObserver = 0;
  }
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v5 = a4;
  [(AAUIAppleAccountViewController *)self dismissViewControllerAnimated:1 completion:&stru_76420];
  id v6 = [v5 firstObject];

  id v7 = +[NSData dataWithContentsOfURL:v6 options:0 error:0];

  if (v7)
  {
    id v8 = objc_msgSend(objc_alloc((Class)UIImagePickerController), "_initWithSourceImageData:cropRect:", v7, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v9 = [v8 _properties];
    dispatch_semaphore_t v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];

    v12[0] = UIImagePickerControllerAllowsEditing;
    v12[1] = _UIImagePickerControllerUseTelephonyUI;
    v13[0] = &__kCFBooleanTrue;
    v13[1] = &__kCFBooleanTrue;
    void v12[2] = _UIImagePickerControllerAllowAnySuperview;
    v12[3] = _UIImagePickerControllerForceNativeScreenScale;
    void v13[2] = &__kCFBooleanTrue;
    v13[3] = &__kCFBooleanTrue;
    v12[4] = _UIImagePickerController1XCroppedImage;
    void v13[4] = &__kCFBooleanTrue;
    int v11 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];
    [v10 addEntriesFromDictionary:v11];

    [v8 _setProperties:v10];
    [v8 setDelegate:self];
    [(AAUIAppleAccountViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "User cancelled document picker view controller.", v5, 2u);
  }

  [(AAUIAppleAccountViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_refreshAppleIDSettingsTokensWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AAUIAppleAccountViewController *)self _grandSlamAccount];

  if (v5)
  {
    v18[0] = &__kCFBooleanTrue;
    v17[0] = kACRenewCredentialsShouldForceKey;
    v17[1] = kACRenewCredentialsServicesKey;
    uint64_t v16 = AAGrandSlamAppTokenIDAppleIDSettings;
    id v6 = +[NSArray arrayWithObjects:&v16 count:1];
    v18[1] = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

    id v8 = [(AAUIAppleAccountViewController *)self _accountStore];
    id v9 = [(AAUIAppleAccountViewController *)self _grandSlamAccount];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    void v14[2] = sub_3D5DC;
    v14[3] = &unk_76470;
    v14[4] = self;
    id v15 = v4;
    [v8 renewCredentialsForAccount:v9 options:v7 completion:v14];
  }
  else
  {
    dispatch_semaphore_t v10 = +[NSBundle bundleForClass:objc_opt_class()];
    int v11 = [v10 localizedStringForKey:@"SERVER_NO_CREDENTIALS_TITLE" value:&stru_76890 table:@"Localizable"];
    id v12 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"SERVER_NO_CREDENTIALS_MESSAGE" value:&stru_76890 table:@"Localizable"];
    [(AAUIAppleAccountViewController *)self _showAlertWithTitle:v11 message:v13];

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)_requestSecondaryAuthenticationIfNecessaryWithGSToken:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AAUIAppleAccountViewController *)self _grandSlamAccount];
  id v9 = objc_alloc((Class)AASecondaryAuthenticationRequest);
  dispatch_semaphore_t v10 = objc_msgSend(v8, "aida_alternateDSID");
  id v11 = [v9 initWithDSID:v10 primaryToken:v7];

  id v12 = [v11 urlRequest];
  uint64_t v13 = [v12 URL];

  dispatch_semaphore_t v14 = +[NSURL URLWithString:@"/" relativeToURL:v13];
  id v15 = [v14 absoluteURL];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  void v18[2] = sub_3DBC8;
  v18[3] = &unk_764C0;
  v18[4] = self;
  id v19 = v15;
  id v20 = v6;
  id v16 = v6;
  id v17 = v15;
  [v11 performRequestWithHandler:v18];
}

- (void)_handleSecondaryAuthenticationResponse:(id)a3 baseURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_semaphore_t v10 = (void (**)(void))a5;
  id v11 = _AAUILogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    id v14 = [v8 statusCode];
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Secondary Auth response code: %lu", (uint8_t *)&v13, 0xCu);
  }

  if ([v8 statusCode] == (char *)&stru_158.reloff + 3)
  {
    id v12 = [v8 buddyML];
    [(AAUIAppleAccountViewController *)self _pushSecondaryAuthenticationRemoteUI:v12 baseURL:v9 withCompletion:v10];
  }
  else
  {
    v10[2](v10);
  }
}

- (void)_pushSecondaryAuthenticationRemoteUI:(id)a3 baseURL:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_retainBlock(a5);
  id secondaryAuthCompletion = self->_secondaryAuthCompletion;
  self->_id secondaryAuthCompletion = v10;

  id v12 = objc_alloc_init((Class)PSSetupController);
  [v12 setParentController:self];
  [v12 setModalPresentationStyle:2];
  id v13 = [objc_alloc((Class)AAUIRemoteUIController) initWithIdentifier:@"_AAUIRemotePageIdentifierSecondaryAuth"];
  [v13 setDelegate:self];
  [v13 setNavigationController:v12];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_3DF24;
  v15[3] = &unk_756A8;
  id v16 = v13;
  id v14 = v13;
  [v14 setLoadCompletion:v15];
  [v14 loadData:v9 baseURL:v8];

  [(AAUIAppleAccountViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)_didFinishSecondaryAuthentication
{
  id secondaryAuthCompletion = (void (**)(id, SEL))self->_secondaryAuthCompletion;
  if (secondaryAuthCompletion)
  {
    secondaryAuthCompletion[2](secondaryAuthCompletion, a2);
    id v4 = self->_secondaryAuthCompletion;
    self->_id secondaryAuthCompletion = 0;
  }
  self->_hasShownSecondaryAuthFirstPage = 0;
}

- (void)_showAccountDetailsUnavailableAlert
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"ACCOUNT_DETAILS_UNAVAILABLE_TITLE" value:&stru_76890 table:@"Localizable"];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"ACCOUNT_DETAILS_UNAVAILABLE_MESSAGE" value:&stru_76890 table:@"Localizable"];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_76890 table:@"Localizable"];
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"GET_VERIFICATION_CODE_BUTTON" value:&stru_76890 table:@"Localizable"];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  void v12[2] = sub_3E1FC;
  v12[3] = &unk_764E8;
  v12[4] = self;
  id v11 = +[UIAlertController alertWithTitle:v4 message:v6 cancelButtonTitle:v8 defaultButtonTitle:v10 actionHandler:v12];

  [(AAUIAppleAccountViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)_showAlertWithTitle:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"OK" value:&stru_76890 table:@"Localizable"];
  id v10 = +[UIAlertController alertWithTitle:v7 message:v6 buttonTitle:v9];

  [(AAUIAppleAccountViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)_presentFirstAlertIfNecessary
{
  id v22 = [(AAUIAppleAccountViewController *)self _appleAccount];
  id v3 = objc_msgSend(v22, "aa_accountFirstDisplayAlert");
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"identifier"];
    id v6 = [v5 stringValue];

    CFStringRef v7 = (const __CFString *)AAPrefsDomain;
    id v8 = (void *)CFPreferencesCopyAppValue(@"AAMobileMeAccountAlerts", AAPrefsDomain);
    if (!v8) {
      goto LABEL_5;
    }
    id v9 = [v22 identifier];
    id v10 = [v8 objectForKey:v9];

    if (!v10
      || ([v10 objectForKey:v6],
          id v11 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v12 = [v11 BOOLValue],
          v11,
          v10,
          (v12 & 1) == 0))
    {
LABEL_5:
      id v13 = [v4 objectForKeyedSubscript:@"title"];
      id v14 = [v4 objectForKeyedSubscript:@"message"];
      [(AAUIAppleAccountViewController *)self _showAlertWithTitle:v13 message:v14];

      id v15 = [v8 mutableCopy];
      if (!v15) {
        id v15 = objc_alloc_init((Class)NSMutableDictionary);
      }
      id v16 = [v22 identifier];
      id v17 = [v15 objectForKey:v16];
      id v18 = [v17 mutableCopy];

      if (!v18) {
        id v18 = objc_alloc_init((Class)NSMutableDictionary);
      }
      id v19 = [v4 objectForKeyedSubscript:@"identifier"];
      id v20 = [v19 stringValue];

      if (v20) {
        [v18 setValue:&__kCFBooleanTrue forKey:v20];
      }
      unsigned int v21 = [v22 identifier];
      [v15 setObject:v18 forKey:v21];

      CFPreferencesSetAppValue(@"AAMobileMeAccountAlerts", v15, v7);
      CFPreferencesSynchronize(v7, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    }
  }
}

- (unint64_t)_reloadOptionsForChangesFromAccounts:(id)a3 toAccounts:(id)a4
{
  uint64_t v6 = AIDAServiceTypeCloud;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 objectForKeyedSubscript:v6];
  uint64_t v10 = AIDAServiceTypeStore;
  id v11 = [v8 objectForKeyedSubscript:AIDAServiceTypeStore];
  uint64_t v12 = [(AAUIAppleAccountViewController *)self _personNameComponentsForAccountCollection:v8];

  id v13 = [v7 objectForKeyedSubscript:v6];
  id v14 = [v7 objectForKeyedSubscript:v10];
  v64 = [(AAUIAppleAccountViewController *)self _personNameComponentsForAccountCollection:v7];

  if (v9
    && (objc_msgSend(v9, "aa_isPrimaryEmailVerified") & 1) == 0
    && objc_msgSend(v13, "aa_isPrimaryEmailVerified"))
  {
    id v15 = _AAUILogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "_reloadOptionsForChangesFromAccounts:toAccounts: Apple Account primary email address became verified.", buf, 2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3EB70;
    block[3] = &unk_756F8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  uint64_t v16 = [v9 username];
  uint64_t v65 = v13;
  uint64_t v17 = [v13 username];
  if (v16 | v17 && ![(id)v16 isEqual:v17])
  {
    unsigned __int8 v20 = 0;
    unint64_t v21 = (unint64_t)v64;
  }
  else
  {
    uint64_t v18 = [v11 username];
    uint64_t v19 = [v14 username];
    if (v18 | v19) {
      unsigned __int8 v20 = [(id)v18 isEqual:v19];
    }
    else {
      unsigned __int8 v20 = 1;
    }
    unint64_t v21 = (unint64_t)v64;
  }
  if (v12 | v21) {
    unsigned __int8 v22 = [(id)v12 isEqual:v21];
  }
  else {
    unsigned __int8 v22 = 1;
  }
  id v61 = v14;
  if (v11 || !v14)
  {
    if (v11) {
      BOOL v24 = v14 == 0;
    }
    else {
      BOOL v24 = 0;
    }
    int v23 = v24;
  }
  else
  {
    int v23 = 1;
  }
  v62 = v11;
  v60 = (void *)v12;
  if (v9 || !v65)
  {
    if (v9) {
      BOOL v26 = v65 == 0;
    }
    else {
      BOOL v26 = 0;
    }
    int v25 = v26;
  }
  else
  {
    int v25 = 1;
  }
  unsigned __int8 v57 = v22;
  char v58 = v20 & v22;
  unsigned __int8 v59 = v20;
  unsigned int v27 = objc_msgSend(v65, "aa_needsToVerifyTerms");
  unsigned int v28 = objc_msgSend(v9, "aa_needsToVerifyTerms");
  int v29 = objc_msgSend(v65, "aa_suspensionInfo");
  unsigned int v30 = [v29 isiCloudSuspended];
  __int16 v31 = objc_msgSend(v9, "aa_suspensionInfo");
  unsigned int v32 = v9;
  unsigned int v33 = [v31 isiCloudSuspended];

  unint64_t v34 = objc_msgSend(v65, "aa_suspensionInfo");
  unsigned int v35 = [v34 isFamilySuspended];
  v63 = v32;
  id v36 = objc_msgSend(v32, "aa_suspensionInfo");
  unsigned int v37 = [v36 isFamilySuspended];

  int v38 = 1;
  if (((v23 | v25) & 1) == 0 && ((v27 ^ v28) & 1) == 0) {
    int v38 = v30 ^ v33 | v35 ^ v37;
  }
  uint64_t v39 = kAccountDataclassBackup;
  id v40 = v63;
  unsigned int v41 = [v63 isEnabledForDataclass:kAccountDataclassBackup];
  unsigned int v42 = [v65 isEnabledForDataclass:v39];
  if (v58)
  {
    unint64_t v43 = 0;
    goto LABEL_48;
  }
  if ((v59 & 1) == 0)
  {
    id v44 = _AAUILogSystem();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      v53 = [v63 username];
      long long v54 = [v65 username];
      id v55 = [v62 username];
      uint64_t v56 = [v61 username];
      *(_DWORD *)long long buf = 138413058;
      id v68 = v53;
      __int16 v69 = 2112;
      v70 = v54;
      __int16 v71 = 2112;
      v72 = v55;
      __int16 v73 = 2112;
      v74 = v56;
      _os_log_debug_impl(&dword_0, v44, OS_LOG_TYPE_DEBUG, "AAUI Username change: AppleAccount: %@/%@ (old/new)  StoreAccount: %@/%@ (old/new)", buf, 0x2Au);

      id v40 = v63;
    }
    goto LABEL_46;
  }
  if ((v57 & 1) == 0)
  {
    id v44 = _AAUILogSystem();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
      sub_4AD08();
    }
LABEL_46:
  }
  unint64_t v43 = 1;
LABEL_48:
  int v45 = v41 ^ v42;
  if (!v38)
  {
    id v47 = v62;
    id v48 = v60;
    id v49 = v65;
    if (!v45) {
      goto LABEL_57;
    }
    goto LABEL_54;
  }
  id v46 = _AAUILogSystem();
  id v47 = v62;
  id v48 = v60;
  id v49 = v65;
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v46, OS_LOG_TYPE_DEFAULT, "Account authentication state changed. Will reload specifiers.", buf, 2u);
  }

  v43 |= 2uLL;
  if (v45)
  {
LABEL_54:
    id v50 = _AAUILogSystem();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v50, OS_LOG_TYPE_DEFAULT, "Account backup dataclass changed", buf, 2u);
    }

    v43 |= 4uLL;
  }
LABEL_57:
  if (v40 && !v49)
  {
    v51 = _AAUILogSystem();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v51, OS_LOG_TYPE_DEFAULT, "AppleAccount signed out", buf, 2u);
    }

    v43 |= 8uLL;
  }

  return v43;
}

- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Operations helper will save account: %@", buf, 0xCu);
  }

  if (self->_shouldAttemptToEnableDataclasses) {
    self->_shouldAttemptToEnableDataclasses = 0;
  }
  [(AAUIAppleAccountViewController *)self _stopObservingAccountStoreChanges];
  v9.receiver = self;
  v9.super_class = (Class)AAUIAppleAccountViewController;
  [(AAUIAppleAccountViewController *)&v9 operationsHelper:v7 willSaveAccount:v6];
}

- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = _AAUILogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v14 = @"NO";
    if (v6) {
      CFStringRef v14 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    CFStringRef v17 = v14;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Operations helper did save account with success? %@, error: %@", buf, 0x16u);
  }

  v15.receiver = self;
  v15.super_class = (Class)AAUIAppleAccountViewController;
  [(AAUIAppleAccountViewController *)&v15 operationsHelper:v12 didSaveAccount:v11 withSuccess:v6 error:v10];

  [(AAUIAppleAccountViewController *)self _startObservingAccountStoreChanges];
}

- (BOOL)operationsHelper:(id)a3 shouldRemoveAccount:(id)a4
{
  return objc_msgSend(a4, "aa_isUnremovableRemotelyManagedAccount", a3) ^ 1;
}

- (void)_issueFindMyiPhonePromptWithTitle:(id)a3 andMessage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v9 = [v8 localizedStringForKey:@"OK" value:&stru_76890 table:@"Localizable"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_3F05C;
  v11[3] = &unk_756F8;
  v11[4] = self;
  id v10 = +[UIAlertController alertWithTitle:v7 message:v6 buttonTitle:v9 actionHandler:v11];

  [(AAUIAppleAccountViewController *)self presentViewController:v10 animated:0 completion:0];
}

- (void)_promptUserToEnableFindMyiPhoneIfPossible
{
  id v3 = [(AAUIAppleAccountViewController *)self _appleAccount];
  if (objc_msgSend(v3, "aa_isPrimaryEmailVerified")
    && [v3 isProvisionedForDataclass:kAccountDataclassDeviceLocator]
    && objc_msgSend(v3, "aa_isPrimaryAccount"))
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DEVICE_LOCATOR_TITLE"];
    id v6 = [v4 localizedStringForKey:v5 value:&stru_76890 table:@"Localizable"];

    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = @"ENABLE_DEVICE_LOCATOR_MESSAGE";
    if (([@"ENABLE_DEVICE_LOCATOR_MESSAGE" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      int v9 = 0;
    }
    else
    {
      id v8 = [@"ENABLE_DEVICE_LOCATOR_MESSAGE" stringByAppendingString:@"_REBRAND"];
      int v9 = 1;
    }
    id v10 = +[UIDevice modelSpecificLocalizedStringKeyForKey:v8];
    id v11 = [v7 localizedStringForKey:v10 value:&stru_76890 table:@"Localizable"];

    if (v9) {
    id v12 = +[NRPairedDeviceRegistry sharedInstance];
    }
    id v13 = [v12 getActivePairedDevice];

    id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"02168E84-5DD8-4B19-9204-A79F04B33A32"];
    unsigned int v15 = [v13 supportsCapability:v14];

    if (v15)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_3F380;
      v16[3] = &unk_76510;
      v16[4] = self;
      id v17 = v6;
      +[AAUIDeviceLocatorConfirmationUtilities checkIfWatchHasAppleIDAccount:v16];
    }
    else
    {
      [(AAUIAppleAccountViewController *)self _issueFindMyiPhonePromptWithTitle:v6 andMessage:v11];
    }
  }
}

- (void)_startObservingDeviceLocatorStateChanges
{
  if (!self->_deviceLocatorStateDidChangeObserver)
  {
    objc_initWeak(&location, self);
    id v3 = +[NSNotificationCenter defaultCenter];
    uint64_t v4 = AAUIDeviceLocatorStateDidChangeNotification;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_3F65C;
    v7[3] = &unk_75640;
    objc_copyWeak(&v8, &location);
    id v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v7];
    deviceLocatorStateDidChangeObserver = self->_deviceLocatorStateDidChangeObserver;
    self->_deviceLocatorStateDidChangeObserver = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_stopObservingDeviceLocatorStateChanges
{
  if (self->_deviceLocatorStateDidChangeObserver)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_deviceLocatorStateDidChangeObserver];

    deviceLocatorStateDidChangeObserver = self->_deviceLocatorStateDidChangeObserver;
    self->_deviceLocatorStateDidChangeObserver = 0;
  }
}

- (void)_deviceLocatorStateDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3F7EC;
  block[3] = &unk_756F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)refreshDetailTextForTableCellWithTag:(int64_t)a3
{
  -[AAUIFMIPHeaderDeviceInfoPageSurrogate cellWithTag:](self->_deviceSurrogate, "cellWithTag:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == 1002)
  {
    uint64_t v5 = [(AAUIAppleAccountViewController *)self _backupStatusString];
    goto LABEL_5;
  }
  if (a3 == 1001)
  {
    uint64_t v5 = [(AAUIAppleAccountViewController *)self _fmipStatusString];
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:
  id v7 = [v8 detailTextLabel];
  [v7 setText:v6];
}

- (void)_startObservingPresentCustodianSetupNotification
{
  objc_initWeak(&location, self);
  if (!self->_presentAddRecoveryContactNotificationObserver)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_3FAE0;
    v6[3] = &unk_75640;
    objc_copyWeak(&v7, &location);
    uint64_t v4 = [v3 addObserverForName:@"AAUIPresentCustodianSetupNotification" object:0 queue:0 usingBlock:v6];
    presentAddRecoveryContactNotificationObserver = self->_presentAddRecoveryContactNotificationObserver;
    self->_presentAddRecoveryContactNotificationObserver = v4;

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

- (void)_stopObservingPresentCustodianSetupNotification
{
  if (self->_presentAddRecoveryContactNotificationObserver)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_presentAddRecoveryContactNotificationObserver];

    presentAddRecoveryContactNotificationObserver = self->_presentAddRecoveryContactNotificationObserver;
    self->_presentAddRecoveryContactNotificationObserver = 0;
  }
}

- (void)_startObservingRCUpsellTipDismissedNotification
{
  objc_initWeak(&location, self);
  if (!self->_rcUpsellTipDismissedNotificationObserver)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_3FCF8;
    v6[3] = &unk_75640;
    objc_copyWeak(&v7, &location);
    uint64_t v4 = [v3 addObserverForName:@"AAUIRecoveryContactUpsellTipDismissed" object:0 queue:0 usingBlock:v6];
    rcUpsellTipDismissedNotificationObserver = self->_rcUpsellTipDismissedNotificationObserver;
    self->_rcUpsellTipDismissedNotificationObserver = v4;

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

- (void)_stopObservingRCUpsellTipDismissedNotification
{
  if (self->_rcUpsellTipDismissedNotificationObserver)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_rcUpsellTipDismissedNotificationObserver];

    rcUpsellTipDismissedNotificationObserver = self->_rcUpsellTipDismissedNotificationObserver;
    self->_rcUpsellTipDismissedNotificationObserver = 0;
  }
}

- (void)presentCustodianSetupFlow:(id)a3
{
  uint64_t v4 = (AAUICustodianSetupFlowController *)[objc_alloc((Class)AAUICustodianSetupFlowController) initWithAccountManager:self->_accountManager];
  custodianSetupFlowController = self->_custodianSetupFlowController;
  self->_custodianSetupFlowController = v4;

  [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController setDelegate:self];
  [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController start];
  id v6 = [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController navigationController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3FEC0;
  v7[3] = &unk_756F8;
  void v7[4] = self;
  [(AAUIAppleAccountViewController *)self presentViewController:v6 animated:1 completion:v7];
}

- (void)_beginObservingEmailVerificationStatus
{
  p_emailVerificationToken = &self->_emailVerificationToken;
  if (self->_emailVerificationToken == -1)
  {
    objc_initWeak(&location, self);
    id v3 = (const char *)[AKEmailVerificationCompletedNotificationKey UTF8String];
    id v4 = &_dispatch_main_q;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_40014;
    v5[3] = &unk_75720;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch(v3, p_emailVerificationToken, (dispatch_queue_t)&_dispatch_main_q, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_stopObservingEmailVerificationStatus
{
  self->_emailVerificationToken = -1;
}

- (void)_beginObservingiCloudRestoreStatus
{
  p_iCloudRestoreToken = &self->_iCloudRestoreToken;
  if (self->_iCloudRestoreToken == -1)
  {
    objc_initWeak(&location, self);
    id v3 = (const char *)[kMBManagerRestoreStateChangedNotification UTF8String];
    id v4 = &_dispatch_main_q;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_401B4;
    v5[3] = &unk_75720;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch(v3, p_iCloudRestoreToken, (dispatch_queue_t)&_dispatch_main_q, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (BOOL)_isRestoringFromiCloud
{
  uint64_t state64 = 0;
  notify_get_state(self->_iCloudRestoreToken, &state64);
  return state64 - 1 < 2;
}

- (void)_stopObservingiCloudRestoreStatus
{
  self->_iCloudRestoreToken = -1;
}

- (BOOL)_setupForNetworkActivity
{
  BOOL v3 = [(NSLock *)self->_accountValidationLock tryLock];
  if (v3)
  {
    self->_performingUpdate = 1;
    id v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Enabling task completion", buf, 2u);
    }

    [(AAUIAppleAccountViewController *)self setTaskCompletionAssertionEnabled:1];
    uint64_t v5 = +[UIApplication sharedApplication];
    [v5 setNetworkActivityIndicatorVisible:1];
  }
  else
  {
    uint64_t v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Failed to grab validation lock.", v7, 2u);
    }
  }

  return v3;
}

- (void)_cleanupFromNetworkActivity
{
  self->_performingUpdate = 0;
  BOOL v3 = self->_accountValidationLock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_404B0;
  block[3] = &unk_756F8;
  id v4 = v3;
  int v9 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  uint64_t v5 = +[UIApplication sharedApplication];
  [v5 setNetworkActivityIndicatorVisible:0];

  [(AAUIAppleAccountViewController *)self setTaskCompletionAssertionEnabled:0];
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v7 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Disabling task completion", (uint8_t *)&v7, 2u);
  }
}

- (void)_checkNetworkReachabilityAndValidateAccount
{
  BOOL v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Attempting to revalidate account", buf, 2u);
  }

  id v4 = +[AKNetworkObserver sharedNetworkObserver];
  unsigned int v5 = [v4 isNetworkReachable];

  BOOL performedUpdate = self->_performedUpdate;
  __int16 v7 = _AAUILogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (performedUpdate)
  {
    if (v8)
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Revaidation already complete, skipping", v9, 2u);
    }
  }
  else if (v5)
  {
    if (v8)
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Performing network revalidation of account", v11, 2u);
    }

    [(AAUIAppleAccountViewController *)self _performNetworkValidation];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "We are offline, starting to wait for reachability...", v10, 2u);
    }

    self->_monitoringReachability = 1;
  }
}

- (void)_performNetworkValidation
{
  BOOL v3 = [(AAUIAppleAccountViewController *)self _appleAccount];
  id v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "aa_needsRegistration")
      && (objc_msgSend(v4, "aa_isSyncedAccount") & 1) == 0)
    {
      id v6 = _AAUILogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v7 = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "The account has no dataclass properties and needs to be registered", v7, 2u);
      }

      [(AAUIAppleAccountViewController *)self _registerAccount];
    }
    else
    {
      [(AAUIAppleAccountViewController *)self _revalidateAccount];
    }
  }
  else
  {
    unsigned int v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Not signed in to an iCloud account, unable to perform network validation", buf, 2u);
    }
  }
}

- (void)_startMonitoringReachability
{
  id v3 = +[AKNetworkObserver sharedNetworkObserver];
  [v3 addNetworkReachableObserver:self selector:"_reachabilityChanged:"];
}

- (void)_stopMonitoringReachability
{
  id v3 = +[AKNetworkObserver sharedNetworkObserver];
  [v3 removeNetworkReachableObserver:self];
}

- (void)_reachabilityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v8 = 138412290;
    CFStringRef v9 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Network reachability changed to: %@", (uint8_t *)&v8, 0xCu);
  }

  if (self->_monitoringReachability && v3)
  {
    [(AAUIAppleAccountViewController *)self _performNetworkValidation];
    self->_monitoringReachability = 0;
  }
  [(AAUIAppleAccountViewController *)self _forgetSpecifiers];
  [(AAUIAppleAccountViewController *)self reloadSpecifiers];
}

- (void)_registerAccount
{
  [(AAUIAppleAccountViewController *)self _setupForNetworkActivity];
  BOOL v3 = [(AAUIAppleAccountViewController *)self _accountStore];
  id v4 = [(AAUIAppleAccountViewController *)self _appleAccount];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_409BC;
  v5[3] = &unk_756A8;
  void v5[4] = self;
  objc_msgSend(v3, "aa_registerAppleAccount:withCompletion:", v4, v5);
}

- (void)_handleAccountRegistrationCompletionWithResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  __int16 v7 = v6;
  self->_BOOL performedUpdate = 1;
  if (v4)
  {
    int v8 = [(AAUIAppleAccountViewController *)self _accountStore];
    CFStringRef v9 = [(AAUIAppleAccountViewController *)self _appleAccount];
    [v8 saveAccount:v9 withCompletionHandler:&stru_76530];

    [(AAUIAppleAccountViewController *)self _cleanupFromNetworkActivity];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_40BEC;
    block[3] = &unk_756F8;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_40C30;
    v10[3] = &unk_75130;
    v10[4] = self;
    id v11 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
  else
  {
    [(AAUIAppleAccountViewController *)self _cleanupFromNetworkActivity];
  }
}

- (void)_revalidateAccount
{
  BOOL v3 = [(AAUIAppleAccountViewController *)self _appleAccount];
  if (!v3)
  {
    unsigned int v5 = _AAUILogSystem();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_WORD *)long long buf = 0;
    int v8 = "User not signed in to AppleAccount, will not perform revalidation";
LABEL_14:
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
    goto LABEL_17;
  }
  BOOL allowAccountRevalidation = self->_allowAccountRevalidation;
  unsigned int v5 = _AAUILogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!allowAccountRevalidation)
  {
    if (!v6) {
      goto LABEL_17;
    }
    *(_WORD *)long long buf = 0;
    int v8 = "Hold off account revalidation, we're probably displaying a dialog";
    goto LABEL_14;
  }
  if (v6)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Revalidating Account", buf, 2u);
  }

  if (![(AAUIAppleAccountViewController *)self _setupForNetworkActivity])
  {
    unsigned int v5 = _AAUILogSystem();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_WORD *)long long buf = 0;
    int v8 = "Network setup failed, aborting update";
    goto LABEL_14;
  }
  if (objc_msgSend(v3, "aa_isPrimaryEmailVerified"))
  {
    intptr_t v7 = -32768;
  }
  else
  {
    CFStringRef v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"VERIFYING" value:&stru_76890 table:@"Localizable"];
    [(AAUIAppleAccountViewController *)self startValidationWithPrompt:v10 userInteraction:1];

    intptr_t v7 = 2;
  }
  id v11 = [v3 copy];
  id v12 = dispatch_get_global_queue(v7, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_40FAC;
  block[3] = &unk_75520;
  void block[4] = self;
  id v14 = v3;
  id v15 = v11;
  unsigned int v5 = v11;
  dispatch_async(v12, block);

LABEL_17:
}

- (BOOL)_isPasswordRequiredToValidateAppleAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_msgSend(v3, "aa_authToken");
  if (v4)
  {
  }
  else
  {
    unsigned int v5 = objc_msgSend(v3, "aa_password");

    if (!v5)
    {
      BOOL v6 = _AAUILogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        id v10 = "No iCloud auth token and no password. Need to do password auth.";
        id v11 = v16;
        goto LABEL_16;
      }
LABEL_17:
      BOOL v9 = 1;
      goto LABEL_18;
    }
  }
  if (CFPreferencesGetAppBooleanValue(@"AAUISuppressFire", @"com.apple.Preferences", 0) == 1)
  {
    BOOL v6 = _AAUILogSystem();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:
      BOOL v9 = 0;
LABEL_18:

      goto LABEL_19;
    }
    *(_WORD *)long long buf = 0;
    intptr_t v7 = "AAUISuppressFire is on. Will not check for Lilac Mode.";
    int v8 = buf;
LABEL_7:
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    goto LABEL_8;
  }
  if (([v3 isAuthenticated] & 1) == 0)
  {
    BOOL v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      id v10 = "Account is marked as unauthenticated. Need to do password auth.";
      id v11 = (uint8_t *)&v14;
LABEL_16:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if ((objc_msgSend(v3, "aa_isPrimaryEmailVerified") & 1) == 0)
  {
    BOOL v6 = _AAUILogSystem();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    __int16 v13 = 0;
    intptr_t v7 = "iCloud account is still unverified. Skipping Lilac Mode check.";
    int v8 = (uint8_t *)&v13;
    goto LABEL_7;
  }
  BOOL v9 = 0;
LABEL_19:

  return v9;
}

- (void)_beginValidationForAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(AAUIAppleAccountViewController *)self _accountStore];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_413D4;
  v7[3] = &unk_756D0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "aa_updatePropertiesForAppleAccount:completion:", v6, v7);
}

- (void)_handleAccountRevalidationCompletionWithValidatedAccount:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(AAUIAppleAccountViewController *)self _appleAccount];
  unsigned int v11 = objc_msgSend(v10, "aa_serviceUnavailable");
  unsigned int v12 = objc_msgSend(v8, "aa_serviceUnavailable");
  unsigned int v13 = objc_msgSend(v10, "aa_isPrimaryEmailVerified");
  unsigned int v14 = objc_msgSend(v8, "aa_isPrimaryEmailVerified");
  if (v9 || !v6)
  {
    if (!v9 || v6)
    {
      unsigned int v28 = _AAUILogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "validation operations canceled", buf, 2u);
      }

      self->_BOOL performedUpdate = 1;
    }
    else
    {
      self->_BOOL performedUpdate = 1;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_41B18;
      block[3] = &unk_75598;
      void block[4] = self;
      id v38 = v9;
      id v39 = v10;
      id v40 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    goto LABEL_36;
  }
  unsigned int v15 = v14;
  unsigned int v36 = v13;
  unsigned int v34 = v12;
  unsigned int v35 = v11;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v16 = [v8 provisionedDataclasses];
  id v17 = [v16 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v45;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v45 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        id v22 = [v10 isEnabledForDataclass:v21];
        if (v22 != [v8 isEnabledForDataclass:v21]) {
          [v8 setEnabled:v22 forDataclass:v21];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v18);
  }

  if (v36 | v15 ^ 1) == 1 && ((v35 ^ 1 | v34))
  {
    if ((v15 & 1) == 0)
    {
      [(AAUIAppleAccountViewController *)self _autoVerifyAccount];
      char v23 = 0;
      goto LABEL_35;
    }
  }
  else
  {
    BOOL v24 = _AAUILogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Account became verified", buf, 2u);
    }

    int v25 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v26 = @"APPLEID_TITLE";
    if (([@"APPLEID_TITLE" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      int v27 = 0;
    }
    else
    {
      BOOL v26 = [@"APPLEID_TITLE" stringByAppendingString:@"_REBRAND"];
      int v27 = 1;
    }
    int v29 = [v25 localizedStringForKey:v26 value:&stru_76890 table:@"Localizable"];
    unsigned int v30 = +[UIDevice currentDevice];
    unint64_t v31 = (unint64_t)[v30 userInterfaceIdiom];

    BOOL v32 = (v31 & 0xFFFFFFFFFFFFFFFBLL) == 1 && !self->_topLevelSettings;
    [(AAUIAppleAccountViewController *)self stopValidationWithPrompt:v29 showButtons:v32];

    if (v27) {
    [(AAUIAppleAccountViewController *)self _accountEmailBecameVerified];
    }
  }
  char v23 = 1;
LABEL_35:
  id v9 = 0;
  self->_BOOL performedUpdate = 1;
  [(AAUIAppleAccountViewController *)self _presentFirstAlertIfNecessary];
  unsigned int v33 = dispatch_get_global_queue(0, 0);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_41A48;
  v41[3] = &unk_75130;
  v41[4] = self;
  id v42 = v8;
  dispatch_async(v33, v41);

  if (v23) {
LABEL_36:
  }
    [(AAUIAppleAccountViewController *)self _cleanupFromNetworkActivity];
}

- (void)_accountEmailBecameVerified
{
  [(AAUIAppleAccountViewController *)self _enableAllProvisionedDataclasses];
  [(AAUIAppleAccountViewController *)self _forgetSpecifiers];

  [(AAUIAppleAccountViewController *)self reloadSpecifiers];
}

- (void)_enableAllProvisionedDataclasses
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Attempting to enable all provisioned dataclasses", buf, 2u);
  }

  id v4 = [(AAUIAppleAccountViewController *)self _appleAccount];
  unsigned int v5 = v4;
  if (v4)
  {
    *(void *)long long buf = 0;
    id v17 = buf;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    accountWorkQueue = self->_accountWorkQueue;
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    unsigned int v12 = sub_41E8C;
    unsigned int v13 = &unk_765A8;
    id v7 = v4;
    id v14 = v7;
    unsigned int v15 = buf;
    dispatch_sync(accountWorkQueue, &v10);
    if (v17[24])
    {
      [(AAUIAppleAccountViewController *)self _stopObservingAccountStoreChanges];
      id v8 = [(AAUIAppleAccountViewController *)self accountOperationsHelper];
      [v8 saveAccount:v7 requireVerification:0];
    }
    else if (!self->_accountWasPromoted)
    {
      [(AAUIAppleAccountViewController *)self _promptUserToEnableFindMyiPhoneIfPossible];
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "User not signed in to an AppleAccount, will not enable all provisioned dataclasses", buf, 2u);
    }
  }
}

- (BOOL)_isEnabledForAccount:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    LOBYTE(v8) = 1;
    goto LABEL_9;
  }
  unsigned int v5 = [v3 accountType];
  BOOL v6 = [v5 identifier];
  unsigned int v7 = [v6 isEqualToString:ACAccountTypeIdentifierAppleAccount];

  if (!v7)
  {
    id v9 = [v4 accountType];
    id v8 = [v9 identifier];
    [v8 isEqualToString:ACAccountTypeIdentifieriTunesStore];

    LOBYTE(v8) = 1;
LABEL_8:

    goto LABEL_9;
  }
  if ((objc_msgSend(v4, "aa_needsToVerifyTerms") & 1) == 0)
  {
    id v9 = objc_msgSend(v4, "aa_suspensionInfo");
    LODWORD(v8) = [v9 isiCloudSuspended] ^ 1;
    goto LABEL_8;
  }
  LOBYTE(v8) = 0;
LABEL_9:

  return (char)v8;
}

- (void)_showTermsAndConditionsButtonTapped:(id)a3
{
}

- (void)_showGenericTermsUI
{
  if (!self->_isPresentingUpdateSheet)
  {
    BOOL topLevelSettings = 1;
    self->_isPresentingUpdateSheet = 1;
    id v4 = +[UIDevice currentDevice];
    unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      BOOL topLevelSettings = self->_topLevelSettings;
    }
    id v6 = objc_alloc((Class)AAUIGenericTermsRemoteUI);
    unsigned int v7 = [(AAUIAppleAccountViewController *)self _appleAccount];
    id v8 = [(AAUIAppleAccountViewController *)self _accountStore];
    id v9 = (AAUIGenericTermsRemoteUI *)[v6 initWithAccount:v7 inStore:v8];
    genericTermsRemoteUI = self->_genericTermsRemoteUI;
    self->_genericTermsRemoteUI = v9;

    [(AAUIGenericTermsRemoteUI *)self->_genericTermsRemoteUI setDelegate:self];
    uint64_t v11 = self->_genericTermsRemoteUI;
    [(AAUIGenericTermsRemoteUI *)v11 presentFromViewController:self modal:topLevelSettings];
  }
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  self->_isPresentingUpdateSheet = 0;
  genericTermsRemoteUI = self->_genericTermsRemoteUI;
  self->_genericTermsRemoteUI = 0;

  if (v4)
  {
    [(AAUIAppleAccountViewController *)self _revalidateAccount];
  }
  else
  {
    unsigned int v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(AAUIAppleAccountViewController *)self _appleAccount];
      unsigned int v9 = objc_msgSend(v8, "aa_needsToVerifyTerms");
      CFStringRef v10 = @"NO";
      if (v9) {
        CFStringRef v10 = @"YES";
      }
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v14 = v10;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Terms have not been agreed to, are we in gray mode like we should? %@, let's save.", buf, 0xCu);
    }
    [(AAUIAppleAccountViewController *)self _forgetSpecifiers];
    [(AAUIAppleAccountViewController *)self reloadSpecifiers];
    uint64_t v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_423B0;
    block[3] = &unk_756F8;
    void block[4] = self;
    dispatch_async(v11, block);
  }
}

- (void)_updateAccountTermsInformation
{
}

- (id)_accountAutoVerifier
{
  accountVerifier = self->_accountVerifier;
  if (!accountVerifier)
  {
    id v4 = objc_alloc((Class)AAAutoAccountVerifier);
    unint64_t v5 = [(AAUIAppleAccountViewController *)self _appleAccount];
    id v6 = (AAAutoAccountVerifier *)[v4 initWithAccount:v5];
    unsigned int v7 = self->_accountVerifier;
    self->_accountVerifier = v6;

    accountVerifier = self->_accountVerifier;
  }

  return accountVerifier;
}

- (void)_autoVerifyAccount
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Auto-verifying account", buf, 2u);
  }

  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unint64_t v5 = [v4 localizedStringForKey:@"VERIFYING" value:&stru_76890 table:@"Localizable"];
  [(AAUIAppleAccountViewController *)self startValidationWithPrompt:v5 userInteraction:1];

  id v6 = [(AAUIAppleAccountViewController *)self _accountAutoVerifier];
  [v6 sendVerificationEmail];

  unsigned int v7 = [(AAUIAppleAccountViewController *)self _accountAutoVerifier];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_426DC;
  v8[3] = &unk_756A8;
  void v8[4] = self;
  [v7 verifyWithHandler:v8];
}

- (void)_handleAccountAutoVerificationCompletionWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    unsigned int v7 = [(AAUIAppleAccountViewController *)self _accountStore];
    id v8 = [(AAUIAppleAccountViewController *)self _appleAccount];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    void v17[2] = sub_42978;
    v17[3] = &unk_756A8;
    v17[4] = self;
    [v7 aa_updatePropertiesForAppleAccount:v8 completion:v17];
LABEL_5:

    goto LABEL_6;
  }
  unsigned int v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 localizedDescription];
    *(_DWORD *)long long buf = 138412290;
    char v19 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Verification failed: %@", buf, 0xCu);
    goto LABEL_5;
  }
LABEL_6:

  unsigned int v9 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v10 = @"APPLEID_TITLE";
  if (([@"APPLEID_TITLE" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v11 = 0;
  }
  else
  {
    CFStringRef v10 = [@"APPLEID_TITLE" stringByAppendingString:@"_REBRAND"];
    int v11 = 1;
  }
  unsigned int v12 = [v9 localizedStringForKey:v10 value:&stru_76890 table:@"Localizable"];
  unsigned int v13 = +[UIDevice currentDevice];
  unint64_t v14 = (unint64_t)[v13 userInterfaceIdiom];

  BOOL v15 = (v14 & 0xFFFFFFFFFFFFFFFBLL) == 1 && !self->_topLevelSettings;
  [(AAUIAppleAccountViewController *)self stopValidationWithPrompt:v12 showButtons:v15];

  if (v11) {
  uint64_t v16 = [(AAUIAppleAccountViewController *)self navigationItem];
  }
  [v16 setLeftBarButtonItem:0];

  [(AAUIAppleAccountViewController *)self _cleanupFromNetworkActivity];
}

- (void)_presentValidationErrorAlert:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 userInfo];
  unsigned int v9 = [v6 userInfo];
  CFStringRef v10 = [v9 objectForKey:kAAProtocolErrorResponseDictionaryKey];

  if (v10)
  {
    int v11 = [v10 objectForKey:kAAProtocolErrorMessageKey];
    unsigned int v12 = [v10 objectForKey:kAAProtocolErrorTitleKey];
    unsigned int v13 = [v10 objectForKey:kAAProtocolErrorCancelButtonTitleKey];
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    unsigned int v13 = 0;
    unsigned int v12 = 0;
    int v11 = 0;
    if (v8)
    {
LABEL_3:
      unint64_t v14 = [v8 objectForKey:kAAProtocolErrorKey];
      if (v12) {
        goto LABEL_4;
      }
LABEL_13:
      unsigned int v12 = [(AAUIAppleAccountViewController *)self _titleForError:v6 account:v7];
      if (v11) {
        goto LABEL_5;
      }
      goto LABEL_14;
    }
  }
  unint64_t v14 = 0;
  if (!v12) {
    goto LABEL_13;
  }
LABEL_4:
  if (v11) {
    goto LABEL_5;
  }
LABEL_14:
  int v11 = [(AAUIAppleAccountViewController *)self _messageForError:v6 account:v7];
LABEL_5:
  if ([v6 code] == (char *)&stru_158.reloff + 1)
  {
    BOOL v15 = [(AAUIAppleAccountViewController *)self _accountStore];
    uint64_t v16 = [(AAUIAppleAccountViewController *)self _appleAccount];
    id v17 = self;
    uint64_t v18 = v12;
    char v19 = v11;
    unsigned __int8 v20 = v13;
    uint64_t v21 = v14;
    id v22 = v8;
    id v23 = v7;
    BOOL v24 = (void *)v16;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_42D98;
    v30[3] = &unk_765F0;
    v30[4] = v17;
    [v15 renewCredentialsForAccount:v16 completion:v30];

    id v7 = v23;
    id v8 = v22;
    unint64_t v14 = v21;
    unsigned int v13 = v20;
    int v11 = v19;
    unsigned int v12 = v18;
  }
  else
  {
    if (!v13)
    {
      id v25 = v7;
      BOOL v26 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v13 = [v26 localizedStringForKey:@"OK" value:&stru_76890 table:@"Localizable"];

      id v7 = v25;
    }
    if ([v14 isEqualToString:kAAProtocolErrorMobileMeAccountMissingInfo]) {
      unsigned __int8 v27 = 1;
    }
    else {
      unsigned __int8 v27 = [v14 isEqualToString:kAAProtocolErrorMobileMeTermsOfServiceUpdate];
    }
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_42E24;
    v28[3] = &unk_760F0;
    unsigned __int8 v29 = v27;
    v28[4] = self;
    BOOL v15 = +[UIAlertController alertWithTitle:v12 message:v11 buttonTitle:v13 actionHandler:v28];
    [(AAUIAppleAccountViewController *)self presentViewController:v15 animated:1 completion:0];
  }
}

- (id)_messageForError:(id)a3 account:(id)a4
{
  id v4 = a3;
  unint64_t v5 = [v4 userInfo];
  id v6 = v5;
  if (v5
    && (uint64_t v7 = kAAProtocolErrorKey,
        [v5 objectForKey:kAAProtocolErrorKey],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    unsigned int v9 = [v6 objectForKey:v7];
    CFStringRef v10 = +[NSBundle bundleForClass:objc_opt_class()];
    int v11 = [v10 localizedStringForKey:v9 value:&stru_76890 table:@"Localizable"];
  }
  else
  {
    int v11 = [v4 localizedDescription];
  }

  return v11;
}

- (id)_titleForError:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 userInfo];
  id v8 = v7;
  if (v7
    && (uint64_t v9 = kAAProtocolErrorKey,
        [v7 objectForKey:kAAProtocolErrorKey],
        CFStringRef v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    int v11 = [v8 objectForKey:v9];
  }
  else
  {
    int v11 = 0;
  }
  unsigned int v12 = (char *)[v5 code];
  if (v12 == (unsigned char *)&stru_158.reloff + 3)
  {
    if (!v11) {
      goto LABEL_12;
    }
    if (![v11 isEqualToString:kAAProtocolErrorMobileMeAccountDisabled])
    {
      BOOL v15 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v18 = [v11 stringByAppendingString:@"_TITLE"];
      unsigned int v13 = [v15 localizedStringForKey:v18 value:&stru_76890 table:@"Localizable"];

      goto LABEL_15;
    }
LABEL_11:
    unsigned int v13 = objc_msgSend(v6, "aa_displayName");
    goto LABEL_16;
  }
  if (v12 == (unsigned char *)&stru_158.reloff + 2)
  {
    unint64_t v14 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v15 = v14;
    CFStringRef v16 = @"MOBILEME_PAID_ACCOUNT_LAPSED_TITLE";
    goto LABEL_14;
  }
  if (v12 == (unsigned char *)&stru_158.reloff + 1) {
    goto LABEL_11;
  }
LABEL_12:
  unint64_t v14 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v15 = v14;
  CFStringRef v16 = @"VERIFICATION_FAILED_TITLE";
LABEL_14:
  unsigned int v13 = [v14 localizedStringForKey:v16 value:&stru_76890 table:@"Localizable"];
LABEL_15:

LABEL_16:

  return v13;
}

- (void)handleURL:(id)a3
{
  id v4 = a3;
  self->_loadedViaURL = 1;
  id v5 = [v4 objectForKeyedSubscript:@"aaaction"];
  id v6 = [v4 objectForKeyedSubscript:@"path"];
  uint64_t v7 = (NSDictionary *)[v4 copy];
  cachedResourceDictionary = self->_cachedResourceDictionary;
  self->_cachedResourceDictionary = v7;

  uint64_t v9 = _AAUILogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    char v19 = v5;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "AAUIAppleAccountViewController handleURL action - %@", buf, 0xCu);
  }

  if ([v5 isEqual:@"auth"])
  {
    [(AAUIAppleAccountViewController *)self _handleAuthActionURL:v4];
    goto LABEL_36;
  }
  if ([v5 isEqual:@"resetPassword"])
  {
    [(AAUIAppleAccountViewController *)self _handleiForgotActionURL:v4];
    goto LABEL_36;
  }
  if ([v5 isEqual:@"changePassword"])
  {
    [(AAUIAppleAccountViewController *)self _handleChangePasswordActionURL:v4];
    goto LABEL_36;
  }
  if ([v5 isEqual:@"CDP"])
  {
    [(AAUIAppleAccountViewController *)self _handleCDPActionURL:v4];
    goto LABEL_36;
  }
  if ([v5 isEqual:@"accountRecovery"])
  {
    [(AAUIAppleAccountViewController *)self _handleAccountRecoveryURL:v4];
    goto LABEL_36;
  }
  if ([v5 isEqual:@"edpRecoveryTokenWindow"])
  {
    [(AAUIAppleAccountViewController *)self _handleEDPTokenPane];
    goto LABEL_36;
  }
  if ([v5 isEqual:@"accountBeneficiary"])
  {
    [(AAUIAppleAccountViewController *)self _handleAccountBeneficiaryURL:v4];
    goto LABEL_36;
  }
  if ([v5 isEqual:@"accountContactDetails"])
  {
    [(AAUIAppleAccountViewController *)self _contactSpecifierWasTapped:0];
    goto LABEL_36;
  }
  if ([v5 isEqualToString:@"IDMSUrl"])
  {
    [(AAUIAppleAccountViewController *)self _handleAuthkitFollowUpServerUI:v4];
    goto LABEL_36;
  }
  if ([v5 isEqual:@"oonAddressVetting"])
  {
    [(AAUIAppleAccountViewController *)self _handleOONAddressVettingActionURL:v4];
    goto LABEL_36;
  }
  if ([v5 isEqual:@"upgradeSecurityLevel"])
  {
    [(AAUIAppleAccountViewController *)self _handleUpgradeSecurityLevelActionURL:v4];
    goto LABEL_36;
  }
  CFStringRef v10 = [(AAUIAppleAccountViewController *)self _familySpecifierProvider];
  unsigned int v11 = [v10 handleURL:v4];

  if (v11)
  {
    unsigned int v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      char v19 = v5;
      unsigned int v13 = "AAUIAppleAccountViewController Family specifier provider handled: %@";
LABEL_34:
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
      goto LABEL_35;
    }
    goto LABEL_35;
  }
  if ([(AAUISpecifierProvider *)self->_dmcReauthSpecifierProvider handleURL:v4])
  {
    unsigned int v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      char v19 = v5;
      unsigned int v13 = "AAUIAppleAccountViewController DMC Reauth specifier provider handled: %@";
      goto LABEL_34;
    }
LABEL_35:

    goto LABEL_36;
  }
  unint64_t v14 = [(AAUIAppleAccountViewController *)self _storeSpecifierProvider];
  unsigned int v15 = [v14 handleURL:v4];

  if (v15)
  {
    unsigned int v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      char v19 = v5;
      unsigned int v13 = "SKAccountPageSpecifierProvider specifier provider handled: %@";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (self->_tuiOptInSpecifierProvider
    && (objc_opt_respondsToSelector() & 1) != 0
    && [(AAUISpecifierProvider *)self->_tuiOptInSpecifierProvider handleURL:v4])
  {
    unsigned int v12 = _AAUILogSystem();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)long long buf = 138412290;
    char v19 = v5;
    unsigned int v13 = "TUIOptInSpecifierProvider specifier provider handled: %@";
    goto LABEL_34;
  }
  CFStringRef v16 = _AAUILogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    char v19 = v5;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Unknown action (%@) sent to AAUIAppleAccountViewController. %@", buf, 0x16u);
  }

  v17.receiver = self;
  v17.super_class = (Class)AAUIAppleAccountViewController;
  [(AAUIAppleAccountViewController *)&v17 handleURL:v4];
LABEL_36:
}

- (void)_handleUpgradeSecurityLevelActionURL:(id)a3
{
  id v4 = [a3 objectForKey:AKClientBundleIDKey];
  id v5 = objc_alloc((Class)CDPStateController);
  id v6 = +[CDPAccount sharedInstance];
  uint64_t v7 = [v6 contextForPrimaryAccount];
  id v8 = [v5 initWithContext:v7];

  if (([v8 isManateeAvailable:0] & 1) == 0)
  {
    id v10 = [objc_alloc((Class)AAUISpinnerViewController) initWithNibName:0 bundle:0];
    id v11 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v10];
    id v12 = objc_alloc((Class)CDPUIDeviceToDeviceEncryptionFlowContext);
    unsigned int v13 = +[CDPAccount sharedInstance];
    unint64_t v14 = [v13 primaryAccountAltDSID];
    id v15 = [v12 initWithAltDSID:v14];

    [v15 setSecurityUpgradeContext:AKSecurityUpgradeContextKeychainSync];
    [v15 setDeviceToDeviceEncryptionUpgradeUIStyle:1];
    [v15 setDeviceToDeviceEncryptionUpgradeType:0];
    [v15 setPresentingViewController:v11];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_43884;
    v19[3] = &unk_75598;
    id v20 = [objc_alloc((Class)CDPUIDeviceToDeviceEncryptionHelper) initWithContext:v15];
    id v21 = v11;
    id v22 = self;
    id v23 = v4;
    id v16 = v11;
    id v17 = v20;
    [(AAUIAppleAccountViewController *)self presentViewController:v16 animated:1 completion:v19];

    goto LABEL_7;
  }
  uint64_t v9 = _AAUILogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "_handleUpgradeSecurityLevelActionURL called when Manatee is already available", v18, 2u);
  }

  if (v4)
  {
    id v10 = +[LSApplicationWorkspace defaultWorkspace];
    [v10 openApplicationWithBundleID:v4];
LABEL_7:
  }
}

- (void)_handleAuthkitFollowUpServerUI:(id)a3
{
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_4AEB8();
  }

  id v6 = [v4 objectForKeyedSubscript:@"urlKey"];
  if (v6)
  {
    uint64_t v7 = objc_alloc_init((Class)AKExtensionlessFollowUpHelperContext);
    id v8 = [(AAUIAppleAccountViewController *)self _appleAccount];
    uint64_t v9 = objc_msgSend(v8, "aa_altDSID");
    [v7 setAltDSID:v9];

    [v7 setPresentingViewController:self];
    id v10 = [v4 objectForKeyedSubscript:@"id"];
    [v7 setUniqueItemIdentifier:v10];

    [v7 setUrlKey:v6];
    id v11 = objc_alloc_init((Class)AKAppleIDFollowUpServerUIPresenter);
    if (objc_opt_respondsToSelector())
    {
      id v12 = _AAUILogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_4AE84();
      }

      [v11 presentServerUIWithContext:v7 withCompletion:&stru_76610];
    }
  }
  else
  {
    uint64_t v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_4AE50();
    }
  }
}

- (void)_handleCDPActionURL:(id)a3
{
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Received a CDP URL action. Redirecting to CDP", buf, 2u);
  }

  id v6 = +[AAUICDPHelper helperWithPresenter:self];
  uint64_t v7 = +[PSNavBarSpinnerManager sharedSpinnerManager];
  id v8 = [(AAUIAppleAccountViewController *)self navigationItem];
  [v7 startAnimatingInNavItem:v8 forIdentifier:@"cdpAction" hideBackButton:1];

  uint64_t v9 = [(AAUIAppleAccountViewController *)self view];
  [v9 setUserInteractionEnabled:0];

  id v10 = [v6 cdpStateControllerForPrimaryAccount];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_43DB0;
  v11[3] = &unk_756A8;
  v11[4] = self;
  [v10 handleURLActionWithInfo:v4 completion:v11];
}

- (void)_handleiForgotActionURL:(id)a3
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Received an iForgot redirect action. Will call to akd now...", v10, 2u);
  }

  id v5 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  [v5 setNeedsCredentialRecovery:1];
  [v5 setPresentingViewController:self];
  id v6 = [(AAUIAppleAccountViewController *)self _appleAccount];
  uint64_t v7 = [v6 username];
  [v5 setUsername:v7];

  [v5 setTriggeredByNotification:1];
  id v8 = (AKAppleIDAuthenticationController *)objc_alloc_init((Class)AKAppleIDAuthenticationController);
  authController = self->_authController;
  self->_authController = v8;

  [(AKAppleIDAuthenticationController *)self->_authController authenticateWithContext:v5 completion:&stru_76650];
}

- (void)_handleChangePasswordActionURL:(id)a3
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Received a change password redirect action. Will call to akd now...", v10, 2u);
  }

  id v5 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  [v5 setNeedsPasswordChange:1];
  [v5 setPresentingViewController:self];
  id v6 = [(AAUIAppleAccountViewController *)self _appleAccount];
  uint64_t v7 = [v6 username];
  [v5 setUsername:v7];

  id v8 = (AKAppleIDAuthenticationController *)objc_alloc_init((Class)AKAppleIDAuthenticationController);
  authController = self->_authController;
  self->_authController = v8;

  [(AKAppleIDAuthenticationController *)self->_authController authenticateWithContext:v5 completion:&stru_76670];
}

- (void)_handleAuthActionURL:(id)a3
{
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Received an authentication redirect. Will call to akd now...", v10, 2u);
  }

  id v6 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  uint64_t v7 = [v4 objectForKeyedSubscript:@"u"];

  [v6 setUsername:v7];
  [v6 setPresentingViewController:self];
  id v8 = (AKAppleIDAuthenticationController *)objc_alloc_init((Class)AKAppleIDAuthenticationController);
  authController = self->_authController;
  self->_authController = v8;

  [(AKAppleIDAuthenticationController *)self->_authController authenticateWithContext:v6 completion:&stru_76690];
}

- (void)_handleAccountRecoveryURL:(id)a3
{
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Handling URL to show account recovery settings....", v9, 2u);
  }

  id v6 = [v4 objectForKey:@"highlight"];

  if (v6)
  {
    uint64_t v7 = [v4 objectForKey:@"highlight"];
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_4AF20();
    }

    +[AAUISettingsHelper showAccountRecoveryFromViewController:self accountManager:self->_accountManager highlightRowIdentifier:v7];
  }
  else
  {
    +[AAUISettingsHelper showAccountRecoveryFromViewController:self accountManager:self->_accountManager];
  }
}

- (void)_handleEDPTokenPane
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Handling URL to show edp recovery token settings....", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v4 = objc_alloc((Class)CDPStateController);
  id v5 = +[AAUICDPHelper cdpContextForPrimaryAccount];
  id v6 = [v4 initWithContext:v5];

  objc_initWeak(&location, v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_445E8;
  v7[3] = &unk_76708;
  objc_copyWeak(&v8, buf);
  objc_copyWeak(&v9, &location);
  [v6 fetchEDPTokenWithCompletion:v7];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  objc_destroyWeak(buf);
}

- (void)_showEDPTokenPaneWithToken:(id)a3 onViewController:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_449B4;
  v7[3] = &unk_75130;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)_handleAccountBeneficiaryURL:(id)a3
{
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Handling URL to show account beneficiary settings.", (uint8_t *)buf, 2u);
  }

  id v6 = [objc_alloc((Class)AAUID2DEncryptionFlowContext) initWithType:3];
  id v7 = [objc_alloc((Class)AAUIManateeStateValidator) initWithFlowContext:v6 withPresentingViewController:self];
  id v8 = +[AAUILegacyContactsViewFactory createViewModelWithAccountManager:self->_accountManager];
  objc_initWeak(buf, v8);

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_44C0C;
  v11[3] = &unk_76730;
  id v9 = v7;
  id v12 = v9;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, buf);
  id v10 = v4;
  id v13 = v10;
  unint64_t v14 = self;
  [v9 verifyAndRepairManateeWithCompletion:v11];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
  objc_destroyWeak(buf);
}

- (void)_handleOONAddressVettingActionURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"potentialMatches"];
  id v6 = [v4 objectForKeyedSubscript:@"sharedItem"];
  id v7 = [v4 objectForKeyedSubscript:@"shareURL"];
  if (v5)
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v31 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Found matches in URL dictionary: %@", buf, 0xCu);
    }

    id v9 = [(__CFString *)v5 componentsSeparatedByString:@","];
    id v10 = [v9 mutableCopy];

    if ([v10 count])
    {
      unint64_t v11 = 0;
      do
      {
        id v12 = [v10 objectAtIndexedSubscript:v11];
        id v13 = [v12 componentsSeparatedByString:@":"];
        [v10 setObject:v13 atIndexedSubscript:v11];

        ++v11;
      }
      while (v11 < (unint64_t)[v10 count]);
    }
    [(AAUIAppleAccountViewController *)self _loadCloudKitSettingsBundleIfNeeded];
    Class v14 = NSClassFromString(@"CKVettingAddressSelectionController");
    if (v14)
    {
      if (v6 && v7)
      {
        id v15 = v14;
        uint64_t v16 = +[NSURL URLWithString:v7];
        id v17 = v16;
        if (!v16)
        {
          unsigned int v28 = _AAUILogSystem();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            CFStringRef v31 = v7;
            _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "Invalid URL from rawShareURL: %@", buf, 0xCu);
          }
          goto LABEL_24;
        }
        v34[0] = v10;
        v34[1] = v6;
        v34[2] = v16;
        uint64_t v18 = +[NSArray arrayWithObjects:v34 count:3];
        id v19 = objc_alloc_init(v15);
        unsigned __int8 v29 = v18;
        uint64_t v20 = v18;
        id v21 = v19;
        [v19 performSelector:"setParameters:" withObject:v20];
        if (v21)
        {
          id v22 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v21];
          [v22 setDelegate:self];
          id v23 = +[UIDevice currentDevice];
          -[NSObject setModalPresentationStyle:](v22, "setModalPresentationStyle:", 2 * ([v23 userInterfaceIdiom] != 0));

          BOOL v24 = [(AAUIAppleAccountViewController *)self navigationController];
          [v24 presentViewController:v22 animated:1 completion:0];
        }
        else
        {
          id v22 = _AAUILogSystem();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412546;
            CFStringRef v31 = @"CKVettingAddressSelectionController";
            __int16 v32 = 2112;
            unsigned int v28 = v29;
            unsigned int v33 = v29;
            _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Unable to instantiate class named %@ using params %@", buf, 0x16u);
LABEL_23:

LABEL_24:
            goto LABEL_25;
          }
        }
        unsigned int v28 = v29;
        goto LABEL_23;
      }
      id v17 = _AAUILogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        id v25 = "Unexpectedly found sharedItem or rawShareURL to be null.";
        BOOL v26 = v17;
        uint32_t v27 = 2;
        goto LABEL_17;
      }
    }
    else
    {
      id v17 = _AAUILogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v31 = @"CKVettingAddressSelectionController";
        id v25 = "Unable to load class named %@, is CloudKit.bundle in place?";
        BOOL v26 = v17;
        uint32_t v27 = 12;
LABEL_17:
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      }
    }
LABEL_25:
  }
}

- (void)_loadCloudKitSettingsBundleIfNeeded
{
  id v2 = UISystemRootDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"System/Library/PreferenceBundles/AccountSettings"];

  id v4 = [v3 stringByAppendingPathComponent:@"CloudKitSettings.bundle"];
  id v5 = +[NSBundle bundleWithPath:v4];
  if (([v5 isLoaded] & 1) == 0)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "CloudKit settings bundle not loaded. Loading...", v7, 2u);
    }

    [v5 load];
  }
}

- (id)accountsForAccountManager:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [(AAUIAppleAccountViewController *)self specifier];
  id v6 = [v5 userInfo];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [(AAUIAppleAccountViewController *)self specifier];
    id v9 = [v8 userInfo];

    id v10 = [v9 objectForKey:ACUIAccountKey];

    if (v10)
    {
      unint64_t v11 = [(AAUIAppleAccountViewController *)self accountStore];
      id v12 = objc_msgSend(v10, "aa_altDSID");
      id v13 = objc_msgSend(v11, "aa_appleAccountWithAltDSID:", v12);
      [v4 setObject:v13 forKeyedSubscript:AIDAServiceTypeCloud];
LABEL_12:

      goto LABEL_13;
    }
  }
  uint64_t v14 = AIDAServiceTypeCloud;
  id v10 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager accountForService:AIDAServiceTypeCloud];
  if (v10) {
    [v4 setObject:v10 forKeyedSubscript:v14];
  }
  uint64_t v15 = AIDAServiceTypeStore;
  unint64_t v11 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager accountForService:AIDAServiceTypeStore];
  if (v11) {
    [v4 setObject:v11 forKeyedSubscript:v15];
  }
  if (v10)
  {
    id v12 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager altDSIDForAccount:v10 service:v14];
    id v13 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager DSIDForAccount:v10 service:v14];
    uint64_t v16 = AIDAServiceTypeGameCenter;
    id v17 = [(AAUIAppleAccountViewController *)self _accountForService:AIDAServiceTypeGameCenter matchingAltDSID:v12 DSID:v13];
    if (v17) {
      [v4 setObject:v17 forKeyedSubscript:v16];
    }

    goto LABEL_12;
  }
LABEL_13:

  id v18 = [v4 copy];

  return v18;
}

- (id)_accountForService:(id)a3 matchingAltDSID:(id)a4 DSID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager accountForService:v8];
  if (v11)
  {
    id v12 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager altDSIDForAccount:v11 service:v8];
    if ([v12 isEqualToString:v9])
    {
      id v13 = v11;
    }
    else
    {
      uint64_t v14 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager DSIDForAccount:v11 service:v8];
      if ([v14 isEqualToString:v10]) {
        id v13 = v11;
      }
      else {
        id v13 = 0;
      }
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)headerViewDidTapImageControl:(id)a3
{
}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  id v7 = (AAUISpecifierProvider *)a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || self->_storeSpecifier == v7)
  {
    [(AAUIAppleAccountViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    [(AAUIAppleAccountViewController *)self showViewController:v6 sender:v7];
  }
}

- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ([(AAUIAppleAccountViewController *)self _hasActiveSpecifier])
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_4B210();
    }
  }
  else
  {
    [(AAUIAppleAccountViewController *)self _startSpinnerInSpecifier:v7];
  }
}

- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ([(AAUIAppleAccountViewController *)self _hasActiveSpecifier])
  {
    [(AAUIAppleAccountViewController *)self _stopSpinnerInActiveSpecifier];
  }
  else
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_4B278();
    }
  }
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (AAUISpecifierProvider *)a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    uint64_t v14 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Reloading specifiers for provider %@", (uint8_t *)&v13, 0xCu);
  }

  if (self->_familySpecifierProvider == v8)
  {
    servicesGroupSpecifiers = self->_servicesGroupSpecifiers;
    self->_servicesGroupSpecifiers = 0;
  }
  if ([v9 count])
  {
    id v12 = [(AAUISpecifierProvider *)v8 specifiers];
    [(AAUIAppleAccountViewController *)self replaceContiguousSpecifiers:v9 withSpecifiers:v12 animated:v5];
  }
  else
  {
    [(AAUIAppleAccountViewController *)self reloadSpecifiers];
  }
}

- (void)insertSpecifier:(id)a3 afterSpecifierNamed:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v9 = _AAUILogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(AAUIAppleAccountViewController *)self specifierForID:v8];
    int v16 = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Inserting new specifier %@ after %@", (uint8_t *)&v16, 0x16u);
  }
  if ([*(id *)&self->ACUIAccountConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers] containsObject:v7])
  {
    unint64_t v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      id v12 = "Did not insert new specifier because it's already present";
      int v13 = v11;
      uint32_t v14 = 2;
LABEL_8:
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);
    }
  }
  else
  {
    uint64_t v15 = [(AAUIAppleAccountViewController *)self specifierForID:v8];
    [(AAUIAppleAccountViewController *)self insertSpecifier:v7 afterSpecifier:v15 animated:1];

    unint64_t v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v7;
      id v12 = "Inserted new specifier %@";
      int v13 = v11;
      uint32_t v14 = 12;
      goto LABEL_8;
    }
  }
}

- (void)reloadSpecifierForProvider:(id)a3 identifier:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Reloading specifier with ID: %@", (uint8_t *)&v7, 0xCu);
  }

  [(AAUIAppleAccountViewController *)self reloadSpecifierID:v5];
}

- (void)specifierProvider:(id)a3 loadRequest:(id)a4 withIdentifier:(id)a5 specifier:(id)a6
{
}

- (void)_startObservingAccountStoreChanges
{
  objc_initWeak(&location, self);
  accountManager = self->_accountManager;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_45D80;
  v4[3] = &unk_75B80;
  objc_copyWeak(&v5, &location);
  [(AIDAAccountManager *)accountManager addAccountChangeObserver:self handler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_stopObservingAccountStoreChanges
{
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  unsigned int v6 = [(AAUIAppleAccountViewController *)self shouldShowRecoveryContactUpsellTip];
  int v7 = 0;
  if (a4 == 1 && v6)
  {
    id v8 = [(AAUIAppleAccountViewController *)self _recoveryContactUpsellViewController];
    int v7 = [v8 view];
  }

  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AAUIAppleAccountViewController *)self _hasActiveSpecifier])
  {
    BOOL v8 = 0;
  }
  else if (objc_msgSend(-[AAUIAppleAccountViewController superclass](self, "superclass"), "instancesRespondToSelector:", "tableView:shouldHighlightRowAtIndexPath:"))
  {
    v10.receiver = self;
    v10.super_class = (Class)AAUIAppleAccountViewController;
    BOOL v8 = [(AAUIAppleAccountViewController *)&v10 tableView:v6 shouldHighlightRowAtIndexPath:v7];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)_startObservingQuotaChangeNotifications
{
  if (!self->_quotaChangeNotificationObserver)
  {
    objc_initWeak(&location, self);
    id v3 = +[NSNotificationCenter defaultCenter];
    id v4 = +[NSOperationQueue mainQueue];
    uint64_t v5 = ICQQuotaDidChangeNotification;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_462AC;
    v8[3] = &unk_75640;
    objc_copyWeak(&v9, &location);
    id v6 = [v3 addObserverForName:v5 object:0 queue:v4 usingBlock:v8];
    id quotaChangeNotificationObserver = self->_quotaChangeNotificationObserver;
    self->_id quotaChangeNotificationObserver = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_stopObservingQuotaChangeNotifications
{
  if (self->_quotaChangeNotificationObserver)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_quotaChangeNotificationObserver];

    id quotaChangeNotificationObserver = self->_quotaChangeNotificationObserver;
    self->_id quotaChangeNotificationObserver = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_quotaChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_totalStorageString, 0);
  objc_storeStrong(&self->_videoCallStatusNotificationObserver, 0);
  objc_storeStrong(&self->_callStatusNotificationObserver, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_accountWorkQueue, 0);
  objc_storeStrong((id *)&self->_networkActivityQueue, 0);
  objc_storeStrong((id *)&self->_custodianSetupFlowController, 0);
  objc_storeStrong((id *)&self->_objectModelDecorators, 0);
  objc_storeStrong((id *)&self->_cachedResourceDictionary, 0);
  objc_storeStrong((id *)&self->_genericTermsRemoteUI, 0);
  objc_storeStrong((id *)&self->_identityCardViewController, 0);
  objc_storeStrong((id *)&self->_meCard, 0);
  objc_storeStrong((id *)&self->_rcUpsellTipDismissedNotificationObserver, 0);
  objc_storeStrong((id *)&self->_presentAddRecoveryContactNotificationObserver, 0);
  objc_storeStrong((id *)&self->_recoveryContactUpsellController, 0);
  objc_storeStrong((id *)&self->_cachediCloudQuotaResponse, 0);
  objc_storeStrong((id *)&self->_deviceSurrogate, 0);
  objc_storeStrong(&self->_deviceLocatorOperationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_deviceLocatorStateDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_deviceLocatorService, 0);
  objc_storeStrong((id *)&self->_accountVerifier, 0);
  objc_storeStrong((id *)&self->_accountValidationLock, 0);
  objc_storeStrong((id *)&self->_secondaryToken, 0);
  objc_storeStrong((id *)&self->_userInfoForSpecifiers, 0);
  objc_storeStrong((id *)&self->_accountHeaderView, 0);
  objc_storeStrong((id *)&self->_profilePictureStoreDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_profilePictureStore, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_paymentMethodSummaryRequester, 0);
  objc_storeStrong((id *)&self->_currentObjectModel, 0);
  objc_storeStrong((id *)&self->_serverHookHandler, 0);
  objc_storeStrong((id *)&self->_serverUILoadDelegate, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_activeRemoteUIController, 0);
  objc_storeStrong((id *)&self->_activelyLoadingSpecifier, 0);
  objc_destroyWeak((id *)&self->_newPasswordRow);
  objc_destroyWeak((id *)&self->_oldPasswordRow);
  objc_storeStrong((id *)&self->_newPassword, 0);
  objc_storeStrong((id *)&self->_oldPassword, 0);
  objc_storeStrong(&self->_secondaryAuthCompletion, 0);
  objc_storeStrong((id *)&self->_storeSpecifier, 0);
  objc_storeStrong((id *)&self->_manageSubscriptionSpecifier, 0);
  objc_storeStrong((id *)&self->_paymentSpecifierValue, 0);
  objc_storeStrong((id *)&self->_paymentSpecifier, 0);
  objc_storeStrong((id *)&self->_securitySpecifier, 0);
  objc_storeStrong((id *)&self->_contactSpecifier, 0);
  objc_storeStrong((id *)&self->_fmfSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_tuiOptInSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_paymentSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_managedAccountsSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_mdmSignoutSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_mdmDetailsSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_dmcReauthSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_familySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_deviceSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_signoutGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_servicesGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_servicesGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_accountGroupSpecifiers, 0);

  objc_storeStrong((id *)&self->_followupGroupSpecifiers, 0);
}

@end