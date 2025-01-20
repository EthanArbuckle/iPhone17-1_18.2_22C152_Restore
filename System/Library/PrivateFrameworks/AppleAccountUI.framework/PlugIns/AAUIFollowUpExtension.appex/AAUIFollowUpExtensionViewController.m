@interface AAUIFollowUpExtensionViewController
- (AAUIFollowUpExtensionViewController)init;
- (BOOL)_BOOLeanForKey:(id)a3 inFollowUpItem:(id)a4;
- (BOOL)_shouldContinueRecoveryKeyMismatchRepair;
- (id)_followUpController;
- (id)accountsForAccountManager:(id)a3;
- (id)followUpUniqueIdentifier;
- (void)_beginCustodianAccountRecoveryFlowWithInfo:(id)a3 sessionID:(id)a4 altDSID:(id)a5 completion:(id)a6;
- (void)_beginRecoveryContactGenerationFlowForWalrusUser:(BOOL)a3;
- (void)_beginRecoveryKeyGenerationFlow;
- (void)_beginRecoveryKeyGenerationFlowOnClient;
- (void)_beginTurnOffRecoveryKeyFlow;
- (void)_beginTurnOffRecoveryKeyFlowOnClient;
- (void)_beginVerifyRecoveryKeyFlow;
- (void)_continueDismissingRenewCredentialsFollowUpForCDP;
- (void)_continueDismissingRenewCredentialsFollowUpForCDPEDP;
- (void)_continueRecoveryContactGenerationFlowForWalrusUser:(BOOL)a3;
- (void)_continueSettingupCustodianForFollowUpItem:(id)a3;
- (void)_dismissRecoveryKeyMismatchCFU;
- (void)_dismissRecoveryKeyMismatchRepairCFU;
- (void)_displayCustodianAddNotAllowedAlert;
- (void)_displayRatchetGenericErrorAlert;
- (void)_embargoEndHandlerForFollowUpItem:(id)a3;
- (void)_embargoEndHandlerForFollowUpItem:(id)a3 completion:(id)a4;
- (void)_presentRecoveryFactorOptionsSheetForFollowUpItem:(id)a3;
- (void)_presentSignInController;
- (void)_presentWalrusRecoveryFactorOptionsSheetForFollowUpItem:(id)a3;
- (void)_processRecoveryFactorsMissingFollowUpAction:(id)a3 selectedAction:(id)a4;
- (void)_recoveryKeyMismatchForFollowUpItem:(id)a3 selectedAction:(id)a4;
- (void)_renewCredentialsForFollowUpItem:(id)a3;
- (void)_renewCredentialsForFollowUpItem:(id)a3 completion:(id)a4;
- (void)_reviewCustodiansForFollowUpItem:(id)a3;
- (void)_setupCustodianForFollowUpItem:(id)a3;
- (void)_showAccountRecoveryScreen:(id)a3;
- (void)_showBeneficiariesForFollowUpItem:(id)a3;
- (void)_showBeneficiaryInvitationUIForFollowUpItem:(id)a3;
- (void)_showCustodianInvitationUIForFollowUpItem:(id)a3;
- (void)_showGenericTermsUI;
- (void)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6 completion:(id)a7;
- (void)custodianSetupFlowControllerDidFinish:(id)a3;
- (void)custodianSetupFlowControllerRecoveryContactInviteSent;
- (void)finishProcessing;
- (void)followUpPerformUpdateWithCompletionHandler:(id)a3;
- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4;
- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4 serverInfo:(id)a5;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)remoteUIRequestComplete:(id)a3 error:(id)a4;
- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5;
- (void)signInControllerDidCancel:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AAUIFollowUpExtensionViewController

- (AAUIFollowUpExtensionViewController)init
{
  v12.receiver = self;
  v12.super_class = (Class)AAUIFollowUpExtensionViewController;
  v2 = [(AAUIFollowUpExtensionViewController *)&v12 init];
  if (v2)
  {
    v3 = +[ACAccountStore defaultStore];
    v4 = (AIDAServiceOwnerProtocol *)[objc_alloc((Class)AIDAServiceOwnersManager) initWithAccountStore:v3];
    serviceOwnersManager = v2->_serviceOwnersManager;
    v2->_serviceOwnersManager = v4;

    v6 = (AIDAAccountManager *)[objc_alloc((Class)AIDAAccountManager) initWithAccountStore:v3];
    accountManager = v2->_accountManager;
    v2->_accountManager = v6;

    [(AIDAAccountManager *)v2->_accountManager setDelegate:v2];
    [(AAUIFollowUpExtensionViewController *)v2 _setupActivityIndicator];
    id v8 = objc_alloc_init((Class)AKBiometricRatchetController);
    v9 = (AAUIDTOHelper *)[objc_alloc((Class)AAUIDTOHelper) initWithDTOController:v8];
    dtoHelper = v2->dtoHelper;
    v2->dtoHelper = v9;
  }
  return v2;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)AAUIFollowUpExtensionViewController;
  [(AAUIFollowUpExtensionViewController *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  v43.receiver = self;
  v43.super_class = (Class)AAUIFollowUpExtensionViewController;
  [(AAUIFollowUpExtensionViewController *)&v43 viewDidAppear:a3];
  v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
    *(_DWORD *)buf = 138412290;
    v45 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Processing followup for %@", buf, 0xCu);
  }
  v6 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
  unsigned int v7 = [v6 isEqualToString:AAFollowUpIdentifierStartUsing];

  if (v7)
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to show sign in controller", buf, 2u);
    }

    [(AAUIFollowUpExtensionViewController *)self _presentSignInController];
    return;
  }
  v9 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
  unsigned int v10 = [v9 isEqualToString:AAFollowUpIdentifierVerifyTerms];

  if (v10)
  {
    v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to show terms UI", buf, 2u);
    }

    [(AAUIFollowUpExtensionViewController *)self _showGenericTermsUI];
    return;
  }
  objc_super v12 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
  unsigned int v13 = [v12 isEqualToString:AAFollowUpIdentifierRenewCredentials];

  if (v13)
  {
    v14 = _AAUILogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Attempting to renew credentials from follow up", buf, 2u);
    }

    [(AAUIFollowUpExtensionViewController *)self _renewCredentialsForFollowUpItem:self->_followUpItem];
    return;
  }
  v15 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
  unsigned int v16 = [v15 isEqualToString:@"com.apple.AAFollowUpIdentifier.custodianReview"];

  if (v16)
  {
    v17 = _AAUILogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Attempting to open Recovery Contact Review sheet from follow up", buf, 2u);
    }

    [(AAUIFollowUpExtensionViewController *)self _reviewCustodiansForFollowUpItem:self->_followUpItem];
    return;
  }
  v18 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
  unsigned int v19 = [v18 isEqualToString:AAFollowUpIdentifierCustodianEmbargo];

  if (v19)
  {
    v20 = _AAUILogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Starting embargo end process from follow up", buf, 2u);
    }

    [(AAUIFollowUpExtensionViewController *)self _embargoEndHandlerForFollowUpItem:self->_followUpItem];
    return;
  }
  v21 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
  unsigned int v22 = [v21 hasPrefix:AAFollowUpIdentifierCustodianInvitationReminder];

  if (v22)
  {
    v23 = _AAUILogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Attempting to show Custodian Invitation from follow up", buf, 2u);
    }

    [(AAUIFollowUpExtensionViewController *)self _showCustodianInvitationUIForFollowUpItem:self->_followUpItem];
    return;
  }
  v24 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
  unsigned int v25 = [v24 isEqualToString:AAFollowUpIdentifierCustodianRemoved];

  if (v25)
  {
    v26 = _AAUILogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Attempting to show Custodian Setup flow", buf, 2u);
    }

    [(AAUIFollowUpExtensionViewController *)self _setupCustodianForFollowUpItem:self->_followUpItem];
    return;
  }
  v27 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
  if ([v27 isEqualToString:AAFollowUpIdentifierCustodianWalrusNoLiveness])
  {

LABEL_34:
    v30 = _AAUILogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Attempting to show Account Recovery UI", buf, 2u);
    }

    [(AAUIFollowUpExtensionViewController *)self _showAccountRecoveryScreen:self->_followUpItem];
    return;
  }
  v28 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
  unsigned int v29 = [v28 isEqualToString:@"com.apple.AAFollowUpIdentifier.adpUserMissingHealthyCustodian"];

  if (v29) {
    goto LABEL_34;
  }
  v31 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
  if ([v31 isEqualToString:AAFollowUpIdentifierCustodianWalrusRemoved])
  {

LABEL_40:
    [(AAUIFollowUpExtensionViewController *)self _processRecoveryFactorsMissingFollowUpAction:self->_followUpItem selectedAction:self->_followUpAction];
    return;
  }
  v32 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
  unsigned int v33 = [v32 isEqualToString:AAFollowUpIdentifierWalrusUserRecoveryFactorsMissing];

  if (v33) {
    goto LABEL_40;
  }
  v34 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
  unsigned int v35 = [v34 hasPrefix:@"com.apple.AAFollowUpIdentifier.beneficiaryInvitationReminder"];

  if (v35)
  {
    v36 = _AAUILogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "LCInvite: Attempting to show Beneficiary Invitation from follow up", buf, 2u);
    }

    [(AAUIFollowUpExtensionViewController *)self _showBeneficiaryInvitationUIForFollowUpItem:self->_followUpItem];
  }
  else
  {
    v37 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
    if ([v37 isEqualToString:AAFollowUpIdentifierBeneficiaryRemoved])
    {
    }
    else
    {
      v38 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
      unsigned int v39 = [v38 containsString:AAFollowUpIdentifierBeneficiaryIneligible];

      if (!v39)
      {
        v41 = [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
        unsigned int v42 = [v41 isEqualToString:AAFollowUpIdentifierRecoveryKeyMismatch];

        if (v42) {
          [(AAUIFollowUpExtensionViewController *)self _recoveryKeyMismatchForFollowUpItem:self->_followUpItem selectedAction:self->_followUpAction];
        }
        else {
          [(AAUIFollowUpExtensionViewController *)self finishProcessing];
        }
        return;
      }
    }
    v40 = _AAUILogSystem();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Attempting to show Beneficiary List", buf, 2u);
    }

    [(AAUIFollowUpExtensionViewController *)self _showBeneficiariesForFollowUpItem:self->_followUpItem];
  }
}

- (void)finishProcessing
{
  v3 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002C9C;
  block[3] = &unk_1000103F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_presentSignInController
{
  id v3 = objc_alloc_init((Class)AAUISignInController);
  [v3 setDelegate:self];
  v4 = +[UIDevice currentDevice];
  unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [v3 setModalPresentationStyle:2];
    [v3 setModalTransitionStyle:0];
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002DCC;
  v7[3] = &unk_100010420;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  [v6 prepareInViewController:self completion:v7];
}

- (void)_presentRecoveryFactorOptionsSheetForFollowUpItem:(id)a3
{
  unsigned int v26 = [(AAUIFollowUpExtensionViewController *)self _BOOLeanForKey:@"hasRecoveryContact" inFollowUpItem:a3];
  v4 = +[UIDevice currentDevice];
  unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

  BOOL v6 = (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  unsigned int v7 = +[NSBundle bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  id v8 = v7;
  if (v26) {
    CFStringRef v9 = @"RECOVERY_KEY_REPAIR_SHEET_INFORMATIVE_HAS_RECOVERY_CONTACT";
  }
  else {
    CFStringRef v9 = @"RECOVERY_KEY_REPAIR_SHEET_INFORMATIVE_NO_RECOVERY_CONTACT";
  }
  unsigned int v10 = [v7 localizedStringForKey:v9 value:&stru_1000109D8 table:@"Localizable"];

  v11 = +[NSBundle bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  objc_super v12 = [v11 localizedStringForKey:@"RECOVERY_KEY_REPAIR_SHEET_OTHER_OPTIONS_TITLE" value:&stru_1000109D8 table:@"Localizable"];
  unsigned int v13 = +[UIAlertController alertWithTitle:v12 message:v10];

  [v13 setPreferredStyle:v6];
  v14 = +[NSBundle bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  v15 = [v14 localizedStringForKey:@"RECOVERY_KEY_REPAIR_SHEET_CREATE_RK_ACTION" value:&stru_1000109D8 table:@"Localizable"];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000032A0;
  v30[3] = &unk_100010448;
  v30[4] = self;
  unsigned int v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v30];

  [v13 addAction:v16];
  if ((v26 & 1) == 0)
  {
    v17 = +[NSBundle bundleWithIdentifier:@"com.apple.AppleAccountUI"];
    v18 = [v17 localizedStringForKey:@"RECOVERY_KEY_REPAIR_SHEET_REPLACE_WITH_RC_ACTION" value:&stru_1000109D8 table:@"Localizable"];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000032A8;
    v29[3] = &unk_100010448;
    v29[4] = self;
    unsigned int v19 = +[UIAlertAction actionWithTitle:v18 style:0 handler:v29];

    [v13 addAction:v19];
  }
  v20 = +[NSBundle bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  v21 = [v20 localizedStringForKey:@"RECOVERY_KEY_REPAIR_SHEET_TURN_OFF_RK_ACTION" value:&stru_1000109D8 table:@"Localizable"];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000032B4;
  v28[3] = &unk_100010448;
  v28[4] = self;
  unsigned int v22 = +[UIAlertAction actionWithTitle:v21 style:2 handler:v28];
  [v13 addAction:v22];

  v23 = +[NSBundle bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  v24 = [v23 localizedStringForKey:@"CANCEL" value:&stru_1000109D8 table:@"Localizable"];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000032BC;
  v27[3] = &unk_100010448;
  v27[4] = self;
  unsigned int v25 = +[UIAlertAction actionWithTitle:v24 style:1 handler:v27];
  [v13 addAction:v25];

  [(AAUIFollowUpExtensionViewController *)self presentViewController:v13 animated:1 completion:0];
}

- (void)_presentWalrusRecoveryFactorOptionsSheetForFollowUpItem:(id)a3
{
  v4 = +[UIDevice currentDevice];
  unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

  BOOL v6 = +[NSBundle bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  unsigned int v7 = [v6 localizedStringForKey:@"RECOVERY_KEY_REPAIR_ADP_SHEET_TITLE" value:&stru_1000109D8 table:@"Localizable"];
  id v8 = +[NSBundle bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  CFStringRef v9 = [v8 localizedStringForKey:@"RECOVERY_KEY_REPAIR_ADP_SHEET_INFORMATIVE" value:&stru_1000109D8 table:@"Localizable"];
  unsigned int v10 = +[UIAlertController alertWithTitle:v7 message:v9];

  [v10 setPreferredStyle:(v5 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  v11 = +[NSBundle bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  objc_super v12 = [v11 localizedStringForKey:@"RECOVERY_KEY_REPAIR_ADP_SHEET_CREATE_RK_ACTION" value:&stru_1000109D8 table:@"Localizable"];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100003630;
  v22[3] = &unk_100010448;
  v22[4] = self;
  unsigned int v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v22];

  [v10 addAction:v13];
  v14 = +[NSBundle bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  v15 = [v14 localizedStringForKey:@"RECOVERY_KEY_REPAIR_ADP_SHEET_ADD_RC_ACTION" value:&stru_1000109D8 table:@"Localizable"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100003638;
  v21[3] = &unk_100010448;
  v21[4] = self;
  unsigned int v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v21];

  [v10 addAction:v16];
  v17 = +[NSBundle bundleWithIdentifier:@"com.apple.AppleAccountUI"];
  v18 = [v17 localizedStringForKey:@"CANCEL" value:&stru_1000109D8 table:@"Localizable"];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100003644;
  v20[3] = &unk_100010448;
  v20[4] = self;
  unsigned int v19 = +[UIAlertAction actionWithTitle:v18 style:1 handler:v20];
  [v10 addAction:v19];

  [(AAUIFollowUpExtensionViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (BOOL)_BOOLeanForKey:(id)a3 inFollowUpItem:(id)a4
{
  id v5 = a3;
  BOOL v6 = [a4 userInfo];
  unsigned int v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:v5];
    unsigned __int8 v9 = [v8 BOOLValue];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)_beginVerifyRecoveryKeyFlow
{
  id v3 = (AAUIRecoveryFactorController *)[objc_alloc((Class)AAUIRecoveryFactorController) initWithAccountManager:self->_accountManager presentingViewController:self];
  recoveryFactorController = self->_recoveryFactorController;
  self->_recoveryFactorController = v3;

  objc_initWeak(&location, self);
  id v5 = self->_recoveryFactorController;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000037BC;
  v6[3] = &unk_100010470;
  objc_copyWeak(&v7, &location);
  [(AAUIRecoveryFactorController *)v5 validateRecoveryKeyWithCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_beginTurnOffRecoveryKeyFlow
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invoke RK turning off remote UI flow", buf, 2u);
  }

  v4 = +[AKURLBag sharedBag];
  id v5 = [v4 urlAtKey:@"disableDataRecoveryKey"];

  if (v5)
  {
    BOOL v6 = +[NSURLRequest requestWithURL:v5];
    id v7 = (AAUIGrandSlamRemoteUIPresenter *)[objc_alloc((Class)AAUIGrandSlamRemoteUIPresenter) initWithAccountManager:self->_accountManager presenter:self];
    remoteUIPresenter = self->_remoteUIPresenter;
    self->_remoteUIPresenter = v7;

    [(AAUIGrandSlamRemoteUIPresenter *)self->_remoteUIPresenter setDelegate:self];
    [(AAUIGrandSlamRemoteUIPresenter *)self->_remoteUIPresenter loadRequest:v6 completion:&stru_1000104B0];
  }
  else
  {
    unsigned __int8 v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unable to load RK turning off UI. We're missing the URL from the URL bag. Falling back to client side impl", v10, 2u);
    }

    [(AAUIFollowUpExtensionViewController *)self _beginTurnOffRecoveryKeyFlowOnClient];
  }
}

- (void)_beginTurnOffRecoveryKeyFlowOnClient
{
  id v3 = (AAUIRecoveryFactorController *)[objc_alloc((Class)AAUIRecoveryFactorController) initWithAccountManager:self->_accountManager presentingViewController:self];
  recoveryFactorController = self->_recoveryFactorController;
  self->_recoveryFactorController = v3;

  objc_initWeak(&location, self);
  id v5 = self->_recoveryFactorController;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003BDC;
  v6[3] = &unk_100010470;
  objc_copyWeak(&v7, &location);
  [(AAUIRecoveryFactorController *)v5 authenticateAndDeleteRecoveryKeyFromAllSystemsWithCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_dismissRecoveryKeyMismatchCFU
{
  objc_initWeak(&location, self);
  id v3 = [(AAUIFollowUpExtensionViewController *)self _followUpController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003DA4;
  v4[3] = &unk_100010470;
  objc_copyWeak(&v5, &location);
  [v3 dismissFollowUpWithIdentifier:@"com.apple.AAFollowUpIdentifier.RecoveryKeyMismatch" completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_showGenericTermsUI
{
  id v3 = [(FLFollowUpItem *)self->_followUpItem userInfo];
  v4 = [v3 objectForKeyedSubscript:AIDAAccountPropertyAltDSID];

  if ([v4 length])
  {
    id v5 = +[ACAccountStore defaultStore];
    BOOL v6 = objc_msgSend(v5, "aa_appleAccountWithAltDSID:", v4);
    id v7 = (AAUIGenericTermsRemoteUI *)[objc_alloc((Class)AAUIGenericTermsRemoteUI) initWithAccount:v6 inStore:v5];
    genericTermsRemoteUI = self->_genericTermsRemoteUI;
    self->_genericTermsRemoteUI = v7;

    unsigned __int8 v9 = [(FLFollowUpItem *)self->_followUpItem userInfo];
    unsigned int v10 = [v9 objectForKeyedSubscript:AAFollowUpUserInfoTermsServerProvidedContext];
    [(AAUIGenericTermsRemoteUI *)self->_genericTermsRemoteUI setAdditionalHeaders:v10];

    [(AAUIGenericTermsRemoteUI *)self->_genericTermsRemoteUI setDelegate:self];
    [(AAUIGenericTermsRemoteUI *)self->_genericTermsRemoteUI presentFromViewController:self modal:1];
  }
  else
  {
    v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000976C();
    }

    [(AAUIFollowUpExtensionViewController *)self finishProcessing];
  }
}

- (void)_renewCredentialsForFollowUpItem:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100003FEC;
  v3[3] = &unk_1000104D8;
  v3[4] = self;
  [(AAUIFollowUpExtensionViewController *)self _renewCredentialsForFollowUpItem:a3 completion:v3];
}

- (void)_continueDismissingRenewCredentialsFollowUpForCDPEDP
{
  id v3 = objc_alloc_init((Class)CDPFollowUpController);
  v4 = +[CDPFollowUpContext contextForCDPEDPStateRepair];
  id v11 = 0;
  [v3 clearFollowUpWithContext:v4 error:&v11];
  id v5 = v11;

  BOOL v6 = [(AAUIFollowUpExtensionViewController *)self _followUpController];
  id v10 = 0;
  [v6 dismissFollowUpWithIdentifier:AAFollowUpIdentifierRenewCredentials error:&v10];
  id v7 = v10;

  if (v5)
  {
    id v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100009808();
    }
  }
  if (v7)
  {
    unsigned __int8 v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000097A0();
    }
  }
  [(AAUIFollowUpExtensionViewController *)self finishProcessing];
}

- (void)_continueDismissingRenewCredentialsFollowUpForCDP
{
  id v3 = [(AAUIFollowUpExtensionViewController *)self _followUpController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004344;
  v4[3] = &unk_100010500;
  void v4[4] = self;
  [v3 dismissFollowUpWithIdentifier:AAFollowUpIdentifierRenewCredentials completion:v4];
}

- (void)_reviewCustodiansForFollowUpItem:(id)a3
{
  v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Navigating to Account Recovery pane", v7, 2u);
  }

  id v5 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&aaaction=accountRecovery"];
  BOOL v6 = +[LSApplicationWorkspace defaultWorkspace];
  [v6 openSensitiveURL:v5 withOptions:0];

  [(AAUIFollowUpExtensionViewController *)self finishProcessing];
}

- (void)_renewCredentialsForFollowUpItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 userInfo];
  unsigned __int8 v9 = [v8 objectForKeyedSubscript:AAFollowUpUserInfoAccountIdentifier];

  if ([v9 length])
  {
    id v10 = +[ACAccountStore defaultStore];
    id v11 = [v10 accountWithIdentifier:v9 error:0];
    if (v11)
    {
      objc_super v12 = [v6 userInfo];
      unsigned int v25 = [v12 objectForKeyedSubscript:AAFollowUpUserInfoClientName];

      unsigned int v13 = [v6 userInfo];
      v14 = [v13 objectForKeyedSubscript:AAFollowUpUserInfoProxiedDeviceData];

      if (v14)
      {
        v15 = +[AKDevice deviceWithSerializedData:v14];
      }
      else
      {
        v15 = 0;
      }
      id v18 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
      [v18 setAuthenticationType:0];
      unsigned int v19 = objc_msgSend(v11, "aa_altDSID");
      [v18 setAltDSID:v19];

      v20 = [v6 userInfo];
      [v18 setClientInfo:v20];

      v21 = [v11 normalizedDSID];
      [v18 setDSID:v21];

      [v18 setIsUsernameEditable:0];
      [v18 setPresentingViewController:self];
      [v18 setServiceType:1];
      unsigned int v22 = [v11 username];
      [v18 setUsername:v22];

      [v18 _setProxiedAppName:v25];
      [v18 setProxiedDevice:v15];
      [v18 setShouldOfferSecurityUpgrade:1];
      [v18 setEnablePasscodeAuth:0];
      uint64_t v32 = 0;
      unsigned int v33 = &v32;
      uint64_t v34 = 0x3032000000;
      unsigned int v35 = sub_1000048F8;
      v36 = sub_100004908;
      id v37 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
      [(id)v33[5] setDelegate:self];
      v23 = (void *)v33[5];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100004910;
      v26[3] = &unk_100010578;
      v31 = &v32;
      v26[4] = self;
      id v27 = v6;
      id v28 = v11;
      id v30 = v7;
      id v24 = v15;
      id v29 = v24;
      [v23 authenticateWithContext:v18 completion:v26];

      _Block_object_dispose(&v32, 8);
    }
    else
    {
      v17 = _AAUILogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000098A4();
      }

      (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    }
  }
  else
  {
    unsigned int v16 = _AAUILogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100009870();
    }

    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

- (void)_recoveryKeyMismatchForFollowUpItem:(id)a3 selectedAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AAUIFollowUpExtensionViewController *)self _shouldContinueRecoveryKeyMismatchRepair])
  {
    BOOL v8 = [(AAUIFollowUpExtensionViewController *)self _BOOLeanForKey:@"hasWalrusEnabled" inFollowUpItem:v6];
    unsigned __int8 v9 = [v7 userInfo];
    id v10 = [v9 objectForKeyedSubscript:@"type"];

    if ([v10 isEqualToString:@"recoveryKeyMismatchOtherOption"])
    {
      if (v8) {
        [(AAUIFollowUpExtensionViewController *)self _presentWalrusRecoveryFactorOptionsSheetForFollowUpItem:v6];
      }
      else {
        [(AAUIFollowUpExtensionViewController *)self _presentRecoveryFactorOptionsSheetForFollowUpItem:v6];
      }
    }
    else if ([v10 isEqualToString:@"verifyRecoveryKey"])
    {
      [(AAUIFollowUpExtensionViewController *)self _beginVerifyRecoveryKeyFlow];
    }
    else if ([v10 isEqualToString:@"addRecoveryContact"])
    {
      [(AAUIFollowUpExtensionViewController *)self _beginRecoveryContactGenerationFlowForWalrusUser:v8];
    }
    else if ([v10 isEqualToString:@"addRecoveryKey"])
    {
      [(AAUIFollowUpExtensionViewController *)self _beginRecoveryKeyGenerationFlow];
    }
    else
    {
      id v11 = _AAUILogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unrecognized action type sent to AAUIFollowUpExtensionViewController for handling", v12, 2u);
      }

      [(AAUIFollowUpExtensionViewController *)self finishProcessing];
    }
  }
  else
  {
    [(AAUIFollowUpExtensionViewController *)self _dismissRecoveryKeyMismatchRepairCFU];
    [(AAUIFollowUpExtensionViewController *)self finishProcessing];
  }
}

- (BOOL)_shouldContinueRecoveryKeyMismatchRepair
{
  objc_super v2 = +[AAUICDPHelper helperWithPresenter:self];
  id v3 = [v2 cdpStateControllerForPrimaryAccount];
  id v15 = 0;
  unsigned int v4 = [v3 shouldPerformRepairWithOptionForceFetch:1 error:&v15];
  id v5 = v15;
  if (v4)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "not proceeding with recoveryKeyMismatchRepair with Error: %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  id v14 = 0;
  [v3 verifyRecoveryKeyObservingSystemsHaveMatchingStateWithError:&v14];
  id v7 = v14;
  id v6 = v7;
  if (!v7)
  {
    unsigned __int8 v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "not proceeding with recoveryKeyMismatchRepair because no mismatch exists";
      id v11 = v9;
      uint32_t v12 = 2;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
LABEL_12:

LABEL_13:
    BOOL v8 = 0;
    goto LABEL_14;
  }
  if ([v7 code] != (id)-5317)
  {
    unsigned __int8 v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      id v10 = "not proceeding with recoveryKeyMismatchRepair with error: %@";
      id v11 = v9;
      uint32_t v12 = 12;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  BOOL v8 = 1;
LABEL_14:

  return v8;
}

- (void)_embargoEndHandlerForFollowUpItem:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000051F8;
  v3[3] = &unk_1000104D8;
  v3[4] = self;
  [(AAUIFollowUpExtensionViewController *)self _embargoEndHandlerForFollowUpItem:a3 completion:v3];
}

- (void)_embargoEndHandlerForFollowUpItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 userInfo];
  unsigned __int8 v9 = [v8 objectForKeyedSubscript:AAFollowUpUserInfoAltDSID];

  if ([v9 length])
  {
    id v10 = [v6 userInfo];
    id v11 = [v10 objectForKeyedSubscript:AAFollowUpUserInfoCustodianSessionID];

    if ([v11 length])
    {
      id v12 = objc_alloc_init((Class)AACustodianController);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000055F8;
      v15[3] = &unk_1000105A0;
      id v18 = v7;
      v15[4] = self;
      id v16 = v11;
      id v17 = v9;
      [v12 fetchCustodianPasswordResetInformationWithSessionID:v16 completion:v15];
    }
    else
    {
      id v14 = _AAUILogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100009A14();
      }

      (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    }
  }
  else
  {
    unsigned int v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000099E0();
    }

    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

- (void)_beginCustodianAccountRecoveryFlowWithInfo:(id)a3 sessionID:(id)a4 altDSID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  [v14 setAuthenticationType:2];
  [v14 setAltDSID:v12];
  id v15 = [v10 ownerAppleID];
  [v14 setUsername:v15];

  id v16 = [v10 custodianRecoveryToken];
  [v14 setCustodianRecoveryToken:v16];

  [v14 setIsUsernameEditable:0];
  [v14 setPresentingViewController:self];
  [v14 setServiceType:1];
  [v14 setNeedsCredentialRecovery:1];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  unsigned int v25 = sub_1000048F8;
  unsigned int v26 = sub_100004908;
  id v27 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  id v17 = (void *)v23[5];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000058D8;
  v19[3] = &unk_100010618;
  v21 = &v22;
  v19[4] = self;
  id v18 = v13;
  id v20 = v18;
  [v17 authenticateWithContext:v14 completion:v19];

  _Block_object_dispose(&v22, 8);
}

- (void)_showCustodianInvitationUIForFollowUpItem:(id)a3
{
  unsigned int v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:AAFollowUpTrustedContactInvitationURL];
  id v6 = +[NSURL URLWithString:v5];

  id v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [v6 absoluteString];
    *(_DWORD *)buf = 138412290;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Showing Custodian invitation with URL - %@", buf, 0xCu);
  }
  unsigned __int8 v9 = +[LSApplicationWorkspace defaultWorkspace];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005DCC;
  v10[3] = &unk_100010640;
  v10[4] = self;
  [v9 openURL:v6 configuration:0 completionHandler:v10];
}

- (void)_setupCustodianForFollowUpItem:(id)a3
{
  id v4 = a3;
  id v5 = [(AIDAAccountManager *)self->_accountManager accounts];
  id v6 = [v5 objectForKeyedSubscript:AIDAServiceTypeCloud];

  if (v6)
  {
    dtoHelper = self->dtoHelper;
    BOOL v8 = objc_msgSend(v6, "aa_altDSID");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100005F08;
    v10[3] = &unk_100010690;
    v10[4] = self;
    id v11 = v4;
    [(AAUIDTOHelper *)dtoHelper shouldGateUsingRatchetForAltDSID:v8 completion:v10];
  }
  else
  {
    unsigned __int8 v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100009B18();
    }
  }
}

- (void)_continueSettingupCustodianForFollowUpItem:(id)a3
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Showing Custodian Setup flow UI...", buf, 2u);
  }

  id v5 = (AAUICustodianSetupFlowController *)[objc_alloc((Class)AAUICustodianSetupFlowController) initWithAccountManager:self->_accountManager];
  custodianSetupFlowController = self->_custodianSetupFlowController;
  self->_custodianSetupFlowController = v5;

  [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController setDelegate:self];
  id v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Already checked DTO, no need to go through the first time setup!", v9, 2u);
  }

  [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController startWithoutFirstTimeSetup];
  BOOL v8 = [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController navigationController];
  [(AAUIFollowUpExtensionViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)_showAccountRecoveryScreen:(id)a3
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Showing Account Recovery UI...", v6, 2u);
  }

  id v4 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&aaaction=accountRecovery"];
  id v5 = +[LSApplicationWorkspace defaultWorkspace];
  [v5 openSensitiveURL:v4 withOptions:0];
}

- (id)followUpUniqueIdentifier
{
  return [(FLFollowUpItem *)self->_followUpItem uniqueIdentifier];
}

- (void)custodianSetupFlowControllerDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Custodian Setup did finish. Dismissing the Custodian Removed CFU...", buf, 2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006560;
  v6[3] = &unk_1000103F8;
  void v6[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v6];
}

- (void)custodianSetupFlowControllerRecoveryContactInviteSent
{
  id v3 = (AAUIRecoveryFactorController *)[objc_alloc((Class)AAUIRecoveryFactorController) initWithAccountManager:self->_accountManager presentingViewController:self];
  recoveryFactorController = self->_recoveryFactorController;
  self->_recoveryFactorController = v3;

  id v5 = self->_recoveryFactorController;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006618;
  v6[3] = &unk_100010500;
  void v6[4] = self;
  [(AAUIRecoveryFactorController *)v5 deleteRecoveryKeyFromAllSystems:v6];
}

- (void)_dismissRecoveryKeyMismatchRepairCFU
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006728;
  v3[3] = &unk_1000106D8;
  id v4 = @"com.apple.AAFollowUpIdentifier.RecoveryKeyMismatch";
  id v5 = objc_alloc_init((Class)AAFollowUpController);
  id v2 = v5;
  [v2 pendingFollowUpWithIdentifier:@"com.apple.AAFollowUpIdentifier.RecoveryKeyMismatch" completion:v3];
}

- (void)_beginRecoveryContactGenerationFlowForWalrusUser:(BOOL)a3
{
  id v5 = [(AIDAAccountManager *)self->_accountManager accounts];
  id v6 = [v5 objectForKeyedSubscript:AIDAServiceTypeCloud];

  if (v6)
  {
    dtoHelper = self->dtoHelper;
    BOOL v8 = objc_msgSend(v6, "aa_altDSID");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100006928;
    v10[3] = &unk_100010750;
    v10[4] = self;
    BOOL v11 = a3;
    [(AAUIDTOHelper *)dtoHelper shouldGateUsingRatchetForAltDSID:v8 completion:v10];
  }
  else
  {
    unsigned __int8 v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100009B18();
    }
  }
}

- (void)_displayCustodianAddNotAllowedAlert
{
  id v3 = [(AAUIDTOHelper *)self->dtoHelper makeCustodianAddOpNotAllowedAlert];
  [(AAUIFollowUpExtensionViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)_displayRatchetGenericErrorAlert
{
  id v4 = [(AAUIDTOHelper *)self->dtoHelper makeGenericRatchetFailedAlert];
  id v3 = [(AAUIFollowUpExtensionViewController *)self presentingViewController];
  [v3 presentViewController:v4 animated:1 completion:0];
}

- (void)_continueRecoveryContactGenerationFlowForWalrusUser:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Showing custodian setup flow UI...", buf, 2u);
  }

  id v6 = (AAUICustodianSetupFlowController *)[objc_alloc((Class)AAUICustodianSetupFlowController) initWithAccountManager:self->_accountManager];
  custodianSetupFlowController = self->_custodianSetupFlowController;
  self->_custodianSetupFlowController = v6;

  [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController setDelegate:self];
  [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController setIsWalrusEnabled:v3];
  BOOL v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Already checked DTO, no need to go through the first time setup!", v10, 2u);
  }

  [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController startWithoutFirstTimeSetup];
  unsigned __int8 v9 = [(AAUICustodianSetupFlowController *)self->_custodianSetupFlowController navigationController];
  [(AAUIFollowUpExtensionViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)_processRecoveryFactorsMissingFollowUpAction:(id)a3 selectedAction:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [v6 userInfo];
  BOOL v8 = [v7 objectForKeyedSubscript:@"type"];
  unsigned int v9 = [v8 isEqualToString:@"addRecoveryKey"];

  if (v9)
  {
    [(AAUIFollowUpExtensionViewController *)self _beginRecoveryKeyGenerationFlow];
  }
  else
  {
    id v10 = [v6 userInfo];
    BOOL v11 = [v10 objectForKeyedSubscript:@"type"];
    unsigned int v12 = [v11 isEqualToString:@"addRecoveryContact"];

    if (v12) {
      [(AAUIFollowUpExtensionViewController *)self _beginRecoveryContactGenerationFlowForWalrusUser:[(AAUIFollowUpExtensionViewController *)self _BOOLeanForKey:@"hasWalrusEnabled" inFollowUpItem:v13]];
    }
  }
}

- (void)_beginRecoveryKeyGenerationFlow
{
  BOOL v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invoke RK generation remote UI flow", buf, 2u);
  }

  id v4 = +[AKURLBag sharedBag];
  id v5 = [v4 urlAtKey:@"enableDataRecoveryKey"];

  if (v5)
  {
    id v6 = +[NSURLRequest requestWithURL:v5];
    id v7 = (AAUIGrandSlamRemoteUIPresenter *)[objc_alloc((Class)AAUIGrandSlamRemoteUIPresenter) initWithAccountManager:self->_accountManager presenter:self];
    remoteUIPresenter = self->_remoteUIPresenter;
    self->_remoteUIPresenter = v7;

    [(AAUIGrandSlamRemoteUIPresenter *)self->_remoteUIPresenter setDelegate:self];
    [(AAUIGrandSlamRemoteUIPresenter *)self->_remoteUIPresenter loadRequest:v6 completion:&stru_100010770];
  }
  else
  {
    unsigned int v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unable to load RK generation UI. We're missing the URL from the URL bag. Falling back to client side impl", v10, 2u);
    }

    [(AAUIFollowUpExtensionViewController *)self _beginRecoveryKeyGenerationFlowOnClient];
  }
}

- (void)_beginRecoveryKeyGenerationFlowOnClient
{
  BOOL v3 = (AAUIRecoveryFactorController *)[objc_alloc((Class)AAUIRecoveryFactorController) initWithAccountManager:self->_accountManager presentingViewController:self];
  recoveryFactorController = self->_recoveryFactorController;
  self->_recoveryFactorController = v3;

  id v5 = self->_recoveryFactorController;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000072C0;
  v6[3] = &unk_100010500;
  void v6[4] = self;
  [(AAUIRecoveryFactorController *)v5 authenticateAndGenerateNewRecoveryKeyWithCompletion:v6];
}

- (void)_showBeneficiaryInvitationUIForFollowUpItem:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:AAFollowUpTrustedContactInvitationURL];
  id v6 = +[NSURL URLWithString:v5];

  id v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [v6 absoluteString];
    *(_DWORD *)buf = 138412290;
    unsigned int v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Showing Beneficiary invitation with URL - %@", buf, 0xCu);
  }
  unsigned int v9 = +[LSApplicationWorkspace defaultWorkspace];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000758C;
  v10[3] = &unk_100010640;
  v10[4] = self;
  [v9 openURL:v6 configuration:0 completionHandler:v10];
}

- (void)_showBeneficiariesForFollowUpItem:(id)a3
{
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Navigating to trusted contacts settings", buf, 2u);
  }

  id v5 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&aaaction=accountBeneficiary"];
  id v6 = +[LSApplicationWorkspace defaultWorkspace];
  [v6 openSensitiveURL:v5 withOptions:0];

  id v7 = [(AAUIFollowUpExtensionViewController *)self _followUpController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000076BC;
  v8[3] = &unk_100010500;
  v8[4] = self;
  [v7 dismissFollowUpWithIdentifier:AAFollowUpIdentifierBeneficiaryRemoved completion:v8];
}

- (id)_followUpController
{
  followUpController = self->_followUpController;
  if (!followUpController)
  {
    id v4 = (AAFollowUpController *)objc_alloc_init((Class)AAFollowUpController);
    id v5 = self->_followUpController;
    self->_followUpController = v4;

    followUpController = self->_followUpController;
  }
  return followUpController;
}

- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  BOOL v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    if (v5) {
      CFStringRef v9 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    CFStringRef v13 = v9;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sign in controller completed with success: %{public}@, error: %{public}@.", buf, 0x16u);
  }

  if (v5)
  {
    id v10 = [(AAUIFollowUpExtensionViewController *)self _followUpController];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000791C;
    v11[3] = &unk_100010500;
    v11[4] = self;
    [v10 dismissFollowUpWithIdentifier:AAFollowUpIdentifierStartUsing completion:v11];
  }
  else
  {
    [(AAUIFollowUpExtensionViewController *)self finishProcessing];
  }
}

- (void)signInControllerDidCancel:(id)a3
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sign in controller canceled.", v5, 2u);
  }

  [(AAUIFollowUpExtensionViewController *)self finishProcessing];
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  BOOL v11 = (void (**)(id, uint64_t))a5;
  unsigned int v12 = _AAUILogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v27 = v9;
    __int16 v28 = 2113;
    id v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Processing follow up item: %{private}@, for selected action: %{private}@", buf, 0x16u);
  }

  CFStringRef v13 = [v10 identifier];
  unsigned int v14 = [v13 isEqualToString:AAFollowUpActionDismiss];

  if (v14)
  {
    id v15 = [v9 uniqueIdentifier];
    if ([v15 isEqualToString:AAFollowUpIdentifierCustodianWalrusRemoved])
    {
LABEL_7:

LABEL_8:
      id v17 = _AAUILogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Action is dismiss but this is a persisting CFU, not clearing it.", buf, 2u);
      }

      v11[2](v11, 1);
      goto LABEL_14;
    }
    id v16 = [v9 uniqueIdentifier];
    if ([v16 isEqualToString:AAFollowUpIdentifierWalrusUserRecoveryFactorsMissing])
    {

      goto LABEL_7;
    }
    unsigned int v19 = [v9 uniqueIdentifier];
    unsigned __int8 v20 = [v19 isEqualToString:@"com.apple.AAFollowUpIdentifier.adpUserMissingHealthyCustodian"];

    if (v20) {
      goto LABEL_8;
    }
    v21 = _AAUILogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Action is dismiss, marking the follow up as handled.", buf, 2u);
    }

    uint64_t v22 = [(AAUIFollowUpExtensionViewController *)self _followUpController];
    v23 = [v9 uniqueIdentifier];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100007CE8;
    v24[3] = &unk_100010798;
    unsigned int v25 = v11;
    [v22 dismissFollowUpWithIdentifier:v23 completion:v24];
  }
  else
  {
    objc_storeStrong((id *)&self->_followUpItem, a3);
    objc_storeStrong((id *)&self->_followUpAction, a4);
    id v18 = _AAUILogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Action could not be handled silently, asking for UI...", buf, 2u);
    }

    v11[2](v11, 0);
  }
LABEL_14:
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4 serverInfo:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v6) {
      CFStringRef v11 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v35 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "AAUIFollowUpExtension generic terms callback with success: %@", buf, 0xCu);
  }

  if (v6)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100007FB8;
    v31[3] = &unk_100010668;
    id v12 = v8;
    id v32 = v12;
    unsigned int v33 = self;
    CFStringRef v13 = objc_retainBlock(v31);
    unsigned int v14 = [v12 account];
    if (v14)
    {
      v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472;
      unsigned int v25 = sub_1000084C4;
      unsigned int v26 = &unk_1000107E8;
      id v27 = self;
      id v15 = v12;
      id v28 = v15;
      id v16 = v14;
      id v29 = v16;
      id v30 = v13;
      id v17 = objc_retainBlock(&v23);
      id v18 = objc_msgSend(v15, "accountStore", v23, v24, v25, v26, v27);
      char v19 = objc_opt_respondsToSelector();

      unsigned __int8 v20 = [v15 accountStore];
      v21 = v20;
      if (v19) {
        objc_msgSend(v20, "aa_updatePropertiesForAppleAccount:options:serverInfo:completion:", v16, 0, v9, v17);
      }
      else {
        objc_msgSend(v20, "aa_updatePropertiesForAppleAccount:completion:", v16, v17);
      }
    }
    else
    {
      uint64_t v22 = _AAUILogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100009EB0();
      }

      ((void (*)(void *))v13[2])(v13);
    }
  }
  else
  {
    [(AAUIFollowUpExtensionViewController *)self finishProcessing];
  }
}

- (void)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6 completion:(id)a7
{
  id v10 = a4;
  id v11 = a6;
  id v12 = (void (**)(id, void))a7;
  if (a5)
  {
    CFStringRef v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000A01C();
    }

    v12[2](v12, 0);
  }
  else
  {
    unsigned int v14 = [v10 objectForKeyedSubscript:AKAuthenticationPasswordKey];
    if ([v14 length])
    {
      id v15 = [v10 objectForKeyedSubscript:AKAuthenticationUsernameKey];
      if ([v15 length] && objc_msgSend(v14, "length"))
      {
        id v16 = _AAUILogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Attempt UCRT healing with credentials.", buf, 2u);
        }

        v42[0] = kFMDOptionsActivationLockUsername;
        v42[1] = kFMDOptionsActivationLockPET;
        v43[0] = v15;
        v43[1] = v14;
        id v17 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
        id v18 = +[FMDFMIPManager sharedInstance];
        [v18 attemptUCRTHealing:v17 completion:&stru_100010808];
      }
      char v19 = [v10 objectForKeyedSubscript:AKAuthenticationRawPasswordKey];
      if (![v19 length])
      {
        unsigned __int8 v20 = _AAUILogSystem();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Missing raw password", buf, 2u);
        }
      }
      v21 = [v11 clientInfo];
      uint64_t v22 = [v21 objectForKeyedSubscript:AAFollowUpUserInfoAccountIdentifier];

      if ([v22 length])
      {
        v23 = +[ACAccountStore defaultStore];
        uint64_t v24 = [v23 accountWithIdentifier:v22 error:0];
        if (v24)
        {
          unsigned int v25 = [v11 proxiedDevice];

          if (v25)
          {
            [v24 setAuthenticated:0];
            unsigned int v26 = [v24 credential];
            [v26 setPassword:v19];

            id v27 = _AAUILogSystem();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Sending credentials to remote device", buf, 2u);
            }

            [v23 notifyRemoteDevicesOfUpdatedCredentials:v24];
            v12[2](v12, 1);
          }
          else
          {
            v31 = _AAUILogSystem();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              v41 = v24;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Updating PET on account %{private}@...", buf, 0xCu);
            }

            objc_msgSend(v24, "aa_setPassword:", v14);
            objc_msgSend(v24, "_aa_setRawPassword:", v19);
            id v32 = _AAUILogSystem();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Calling out to verify credentials, will save if successful...", buf, 2u);
            }

            uint64_t v38 = kACVerifyCredentialsShouldSaveKey;
            unsigned int v39 = &__kCFBooleanTrue;
            unsigned int v33 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
            v34[0] = _NSConcreteStackBlock;
            v34[1] = 3221225472;
            v34[2] = sub_100008D60;
            v34[3] = &unk_100010830;
            id v35 = v23;
            id v37 = v12;
            id v36 = v24;
            [v35 verifyCredentialsForAccount:v36 options:v33 completion:v34];
          }
        }
        else
        {
          id v30 = _AAUILogSystem();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_100009FB4();
          }

          v12[2](v12, 0);
        }
      }
      else
      {
        id v29 = _AAUILogSystem();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_100009F80();
        }

        v12[2](v12, 0);
      }
    }
    else
    {
      id v28 = _AAUILogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100009F4C();
      }

      v12[2](v12, 0);
    }
  }
}

- (void)followUpPerformUpdateWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000A1DC();
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000091F0;
  v31[3] = &unk_100010858;
  id v23 = v3;
  id v32 = v23;
  uint64_t v22 = objc_retainBlock(v31);
  id v30 = 0;
  id v24 = objc_alloc_init((Class)FLFollowUpController);
  BOOL v5 = [v24 pendingFollowUpItems:&v30];
  id v6 = v30;
  if (v6)
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000A174();
    }
  }
  unint64_t v21 = (unint64_t)v6;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v9)
  {
    id v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v8);
        }
        unsigned int v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v15 = [v14 uniqueIdentifier];
        unsigned int v16 = [v15 isEqualToString:AAFollowUpIdentifierRenewCredentials];

        if (v16)
        {
          id v17 = [v14 userInfo];
          if (+[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:v17])
          {
            id v18 = (id)v11;
          }
          else
          {
            uint64_t v37 = AAFollowUpIdentifierRenewCredentials;
            char v19 = +[NSArray arrayWithObjects:&v37 count:1];
            id v25 = (id)v11;
            [v24 clearPendingFollowUpItemsWithUniqueIdentifiers:v19 error:&v25];
            id v18 = v25;

            if (v18)
            {
              unsigned __int8 v20 = _AAUILogSystem();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v34 = v14;
                __int16 v35 = 2112;
                id v36 = v18;
                _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "AAUIFollowUpExtensionCleanup: failed to clear followup item %@ with error %@", buf, 0x16u);
              }
            }
          }

          unint64_t v11 = (unint64_t)v18;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
  }

  ((void (*)(void *, BOOL))v22[2])(v22, (v21 | v11) == 0);
}

- (id)accountsForAccountManager:(id)a3
{
  id v4 = objc_opt_new();
  uint64_t v5 = AIDAServiceTypeCloud;
  id v6 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager accountForService:AIDAServiceTypeCloud];
  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:v5];
  }
  id v7 = [v4 copy];

  return v7;
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "remoteUI request %@ completed with error: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  if (v7) {
    [(AAUIFollowUpExtensionViewController *)self finishProcessing];
  }
  else {
    [(AAUIFollowUpExtensionViewController *)self _dismissRecoveryKeyMismatchCFU];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dtoHelper, 0);
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_custodianSetupFlowController, 0);
  objc_storeStrong((id *)&self->_recoveryFactorController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_genericTermsRemoteUI, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_followUpAction, 0);
  objc_storeStrong((id *)&self->_followUpItem, 0);
}

@end