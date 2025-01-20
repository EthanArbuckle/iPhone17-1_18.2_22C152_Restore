@interface PassbookSettingsListController
- (BOOL)isPresentingViewController;
- (BOOL)shouldReloadSpecifiersOnResume;
- (Class)tableViewClass;
- (PassbookSettingsListController)init;
- (id)_appleCardUpsellAlertWithAccount:(id)a3;
- (id)_passDetailsViewControllerForPass:(id)a3;
- (id)_presentPassDetailsViewControllerForPass:(id)a3 presentationStyle:(int64_t)a4 animated:(BOOL)a5;
- (id)paymentPassWithUniqueIdentifier:(id)a3;
- (id)peerPaymentPass;
- (id)specifiers;
- (void)_checkManateeCapabilityForFeatureApplication:(id)a3 completion:(id)a4;
- (void)_presentAccountUserInvitation:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_presentManateeUpgradeForFeatureApplication:(id)a3 completion:(id)a4;
- (void)_refreshPasses;
- (void)dealloc;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)openDailyCashForDateComponents:(id)a3 feature:(unint64_t)a4;
- (void)openDailyCashForDateComponents:(id)a3 onPass:(id)a4;
- (void)openExpressTransitSettingsForPassUniqueIdentifier:(id)a3;
- (void)openPaymentSetupWithMode:(int64_t)a3 referrerIdentifier:(id)a4 allowedFeatureIdentifiers:(id)a5;
- (void)openPeerPaymentSetupWithCurrencyAmount:(id)a3 state:(unint64_t)a4 senderAddress:(id)a5;
- (void)openTransactionDefaultsEmailSettings;
- (void)presentAccountForFeature:(unint64_t)a3 destination:(unint64_t)a4 fundingSourceIdentifier:(id)a5 animated:(BOOL)a6;
- (void)presentAccountUserDetailsWithPass:(id)a3 presentationStyle:(int64_t)a4 forAccountUserAltDSID:(id)a5 animated:(BOOL)a6;
- (void)presentAccountUserInvitationForPass:(id)a3 presentationStyle:(int64_t)a4 withStatementIdentifier:(id)a5 animated:(BOOL)a6;
- (void)presentAppleCardUpsellAlertForAccount:(id)a3;
- (void)presentAuthorizationFlowAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentAuthorizationFlowWithRedirectURL:(id)a3 completion:(id)a4 animated:(BOOL)a5;
- (void)presentAuthorizationViewControllerWithPaymentPass:(id)a3 session:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)presentBankConnectManagementForInstitution:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)presentCreditPaymentPassNumbersViewControllerForPass:(id)a3 presentationStyle:(int64_t)a4 animated:(BOOL)a5;
- (void)presentImportSafariCardConsentAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentInstallmentPlansDetailsViewControllerForPass:(id)a3 presentationStyle:(int64_t)a4 forFeature:(unint64_t)a5 animated:(BOOL)a6;
- (void)presentPassDetailsViewControllerForPass:(id)a3 presentationStyle:(int64_t)a4 presentingView:(int64_t)a5 animated:(BOOL)a6;
- (void)presentPayLaterFinancingPlan:(id)a3 payLaterPass:(id)a4;
- (void)presentPeerPaymentRecurringPaymentWithPass:(id)a3 presentationStyle:(int64_t)a4 recurringPaymentIdentifier:(id)a5 animated:(BOOL)a6;
- (void)presentPeerPaymentTransferToBankWithPass:(id)a3;
- (void)presentStatementDetailsViewControllerForPass:(id)a3 presentationStyle:(int64_t)a4 withIdentifier:(id)a5 animated:(BOOL)a6;
- (void)presentTransactionDetailsForTransaction:(id)a3 transactionSourceType:(unint64_t)a4;
- (void)requestDismissingPresentedViewControllerWithSettingsController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)requestResetToRootWithSettingsController:(id)a3 animated:(BOOL)a4;
- (void)settingsController:(id)a3 requestShowPeerPaymentAssociatedAccountsFlowWithController:(id)a4 withPresentationContext:(id)a5;
- (void)settingsController:(id)a3 requestsAddCardPreflightWithCompletion:(id)a4;
- (void)settingsController:(id)a3 requestsAuthenticationChallengeForAppleAccountInformation:(id)a4 completion:(id)a5;
- (void)settingsController:(id)a3 requestsDetailViewControllerForPass:(id)a4 animated:(BOOL)a5;
- (void)settingsController:(id)a3 requestsForcedPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)settingsController:(id)a3 requestsPresentAuthorizationFlowWithRedirectURL:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)settingsController:(id)a3 requestsPresentInboxMessage:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)settingsController:(id)a3 requestsPresentSecurityRepairFlowWithSecurityCapabilities:(unint64_t)a4 completion:(id)a5;
- (void)settingsController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)settingsController:(id)a3 requestsPushViewController:(id)a4 animated:(BOOL)a5;
- (void)settingsController:(id)a3 requestsReloadSpecifier:(id)a4;
- (void)settingsControllerRequestsPresentPrivacyWithPresenter:(id)a3;
- (void)settingsControllerRequestsReloadSpecifiers:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation PassbookSettingsListController

- (PassbookSettingsListController)init
{
  v13.receiver = self;
  v13.super_class = (Class)PassbookSettingsListController;
  v2 = [(PassbookSettingsListController *)&v13 init];
  if (v2)
  {
    v3 = (PKPassbookSettingsDefaultBehavior *)objc_alloc_init((Class)PKPassbookSettingsDefaultBehavior);
    defaultBehavior = v2->_defaultBehavior;
    v2->_defaultBehavior = v3;

    v5 = (PKPassbookSettingsController *)[objc_alloc((Class)PKPassbookSettingsController) initWithDelegate:v2 dataSource:v2->_defaultBehavior context:0];
    settingsController = v2->_settingsController;
    v2->_settingsController = v5;

    v7 = (PKSettingsDeepLinkController *)[objc_alloc((Class)PKSettingsDeepLinkController) initWithDataSource:v2 delegate:v2];
    deepLinkController = v2->_deepLinkController;
    v2->_deepLinkController = v7;

    v2->_showUpdateRequired = +[PKSecureElement isInFailForward];
    uint64_t v9 = +[PKAccountService sharedInstance];
    accountService = v2->_accountService;
    v2->_accountService = (PKAccountService *)v9;

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"_refreshPasses" name:PKPassLibraryDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  [(PKPassbookSettingsController *)self->_settingsController setDelegate:0];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PassbookSettingsListController;
  [(PassbookSettingsListController *)&v4 dealloc];
}

- (void)willMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PassbookSettingsListController;
  [(PassbookSettingsListController *)&v4 willMoveToParentViewController:a3];
  if (self->_startedReporting)
  {
    self->_startedReporting = 0;
    +[PKAnalyticsReporter endSubjectReporting:PKAnalyticsSubjectWallet];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PassbookSettingsListController;
  [(PassbookSettingsListController *)&v4 viewWillAppear:a3];
  self->_isVisible = 1;
  if (!self->_startedReporting)
  {
    self->_startedReporting = 1;
    +[PKAnalyticsReporter beginSubjectReporting:PKAnalyticsSubjectWallet];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PassbookSettingsListController;
  [(PassbookSettingsListController *)&v4 viewWillDisappear:a3];
  self->_isVisible = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PassbookSettingsListController;
  [(PassbookSettingsListController *)&v11 viewDidAppear:a3];
  [(PKPassbookSettingsController *)self->_settingsController viewDidAppear];
  objc_super v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Wallet"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  v6 = +[NSLocale currentLocale];
  v7 = PKPassKitBundle();
  v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"WALLET_&_APPLE_PAY" table:@"WalletSettings_Localizable" locale:v6 bundleURL:v8];

  id v12 = v9;
  v10 = +[NSArray arrayWithObjects:&v12 count:1];
  [(PassbookSettingsListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.wallet" title:v9 localizedNavigationComponents:v10 deepLink:v4];
}

- (Class)tableViewClass
{
  id v2 = (id)objc_opt_class();

  return (Class)v2;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)PassbookSettingsListController;
  [(PassbookSettingsListController *)&v8 handleURL:v6 withCompletion:v7];
  if (!self->_showUpdateRequired)
  {
    [(PKPassbookSettingsController *)self->_settingsController willHandleURL];
    [(PKSettingsDeepLinkController *)self->_deepLinkController handleDeepLinkResourceDictionary:v6 withCompletion:v7];
  }
}

- (id)_appleCardUpsellAlertWithAccount:(id)a3
{
  id v4 = [a3 feature];
  id v5 = PKLocalizedFeatureString();
  id v6 = PKLocalizedFeatureString();
  id v7 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  objc_super v8 = PKLocalizedPaymentString(@"ADD_CARD");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_438C;
  v13[3] = &unk_10518;
  v13[4] = self;
  v13[5] = v4;
  id v9 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v13];

  v10 = PKLocalizedString(@"CANCEL");
  objc_super v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];

  PKApplyDefaultIconToAlertController();
  [v7 addAction:v9];
  [v7 addAction:v11];

  return v7;
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = *(void **)&self->PSListController_opaque[v2];
    *(void *)&self->PSListController_opaque[v2] = v5;

    v3 = *(void **)&self->PSListController_opaque[v2];
    if (!self->_showUpdateRequired)
    {
      id v7 = [(PKPassbookSettingsController *)self->_settingsController specifiers];
      uint64_t v8 = [v3 arrayByAddingObjectsFromArray:v7];
      id v9 = *(void **)&self->PSListController_opaque[v2];
      *(void *)&self->PSListController_opaque[v2] = v8;

      v3 = *(void **)&self->PSListController_opaque[v2];
    }
  }

  return v3;
}

- (void)_refreshPasses
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4544;
  block[3] = &unk_104D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)presentPassDetailsViewControllerForPass:(id)a3 presentationStyle:(int64_t)a4 presentingView:(int64_t)a5 animated:(BOOL)a6
{
  id v7 = [(PassbookSettingsListController *)self _presentPassDetailsViewControllerForPass:a3 presentationStyle:a4 animated:a6];
  id v8 = v7;
  switch(a5)
  {
    case 1:
      [v7 presentCardNumbers];
      goto LABEL_19;
    case 2:
      [v7 presentTermsAndConditions];
      goto LABEL_19;
    case 3:
      [v7 presentTermsAcceptance];
      goto LABEL_19;
    case 4:
      [v7 presentTopUp];
      goto LABEL_19;
    case 5:
      [v7 presentIdentityVerification];
      goto LABEL_19;
    case 6:
      [v7 presentSchedulePayments];
      goto LABEL_19;
    case 7:
      [v7 presentBalanceDetails];
      goto LABEL_19;
    case 8:
      [v7 presentBankAccounts];
      goto LABEL_19;
    case 9:
      [v7 presentBillPayment];
      goto LABEL_19;
    case 10:
      [v7 presentShareAccount];
      goto LABEL_19;
    case 11:
      [v7 presentMakeDefaultAtApple];
      goto LABEL_19;
    case 12:
      [v7 presentOrderPhysicalCard];
      goto LABEL_19;
    case 13:
      [v7 presentActivatePhysicalCard];
      goto LABEL_19;
    case 14:
      [v7 presentTrackPhysicalCard];
      goto LABEL_19;
    case 15:
      [v7 presentISO18013Details];
      goto LABEL_19;
    case 16:
      [v7 presentAutoReload];
      goto LABEL_19;
    case 17:
      [v7 presentReplacePhysicalCard];
LABEL_19:
      id v7 = v8;
      break;
    default:
      break;
  }
}

- (void)presentInstallmentPlansDetailsViewControllerForPass:(id)a3 presentationStyle:(int64_t)a4 forFeature:(unint64_t)a5 animated:(BOOL)a6
{
  -[PassbookSettingsListController _presentPassDetailsViewControllerForPass:presentationStyle:animated:](self, "_presentPassDetailsViewControllerForPass:presentationStyle:animated:", a3, 2, 0, a6);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 presentInstallmentPlansForFeature:2];
}

- (void)presentCreditPaymentPassNumbersViewControllerForPass:(id)a3 presentationStyle:(int64_t)a4 animated:(BOOL)a5
{
  id v5 = [(PassbookSettingsListController *)self _presentPassDetailsViewControllerForPass:a3 presentationStyle:2 animated:0];
  [v5 presentCardNumbers];
}

- (void)presentStatementDetailsViewControllerForPass:(id)a3 presentationStyle:(int64_t)a4 withIdentifier:(id)a5 animated:(BOOL)a6
{
  id v8 = a5;
  id v9 = [(PassbookSettingsListController *)self _presentPassDetailsViewControllerForPass:a3 presentationStyle:2 animated:0];
  [v9 showStatementDetailsWithIdentifier:v8];
}

- (void)presentAccountUserDetailsWithPass:(id)a3 presentationStyle:(int64_t)a4 forAccountUserAltDSID:(id)a5 animated:(BOOL)a6
{
  id v8 = a5;
  id v9 = [(PassbookSettingsListController *)self _presentPassDetailsViewControllerForPass:a3 presentationStyle:2 animated:0];
  [v9 presentAccountUserDetailsForAccountUserAltDSID:v8];
}

- (void)presentAccountUserInvitationForPass:(id)a3 presentationStyle:(int64_t)a4 withStatementIdentifier:(id)a5 animated:(BOOL)a6
{
  id v8 = a5;
  id v9 = [(PassbookSettingsListController *)self _presentPassDetailsViewControllerForPass:a3 presentationStyle:2 animated:0];
  [v9 presentAccountUserInvitationWithIdentifier:v8];
}

- (void)presentPayLaterFinancingPlan:(id)a3 payLaterPass:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a3;
    id v7 = [(PassbookSettingsListController *)self _presentPassDetailsViewControllerForPass:a4 presentationStyle:2 animated:0];
    [v7 presentFinancingPlan:v6];
  }
}

- (void)openPaymentSetupWithMode:(int64_t)a3 referrerIdentifier:(id)a4 allowedFeatureIdentifiers:(id)a5
{
}

- (void)openPeerPaymentSetupWithCurrencyAmount:(id)a3 state:(unint64_t)a4 senderAddress:(id)a5
{
}

- (void)openDailyCashForDateComponents:(id)a3 onPass:(id)a4
{
  id v8 = a3;
  id v6 = [(PassbookSettingsListController *)self _passDetailsViewControllerForPass:a4];
  if (v6)
  {
    id v7 = [(PassbookSettingsListController *)self navigationController];
    [v7 pushViewController:v6 animated:1];

    [v6 presentDailyCashForDateComponents:v8];
  }
}

- (void)openDailyCashForDateComponents:(id)a3 feature:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 5)
  {
    objc_initWeak(location, self);
    accountService = self->_accountService;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_4B70;
    v9[3] = &unk_10568;
    objc_copyWeak(&v11, location);
    id v10 = v6;
    [(PKAccountService *)accountService defaultAccountForFeature:5 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Attempted to present daily cash for an unsupported feature", (uint8_t *)location, 2u);
    }
  }
}

- (void)openExpressTransitSettingsForPassUniqueIdentifier:(id)a3
{
}

- (void)presentImportSafariCardConsentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_4F7C;
  v18[3] = &unk_10590;
  objc_copyWeak(&v19, &location);
  id v7 = objc_retainBlock(v18);
  if (PKSafariCredentialProvisioningConsented() == 1)
  {
    ((void (*)(void *))v7[2])(v7);
    if (v6) {
      v6[2](v6, 1);
    }
  }
  id v8 = objc_alloc((Class)PKVirtualCardPrivacyExplanationViewController);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_4FD8;
  v16[3] = &unk_105B8;
  id v9 = v7;
  id v17 = v9;
  id v10 = [v8 initWithContext:0 referralSource:0 resultCallback:v16];
  id v11 = [objc_alloc((Class)PKNavigationController) initWithRootViewController:v10];
  [v11 setNavigationBarHidden:1];
  [v11 setModalPresentationStyle:2];
  id v12 = [(PassbookSettingsListController *)self navigationController];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_4FF0;
  v14[3] = &unk_105E0;
  objc_super v13 = v6;
  v15 = v13;
  [v12 presentViewController:v11 animated:v4 completion:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)presentBankConnectManagementForInstitution:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
}

- (void)presentAuthorizationFlowWithRedirectURL:(id)a3 completion:(id)a4 animated:(BOOL)a5
{
}

- (void)presentAppleCardUpsellAlertForAccount:(id)a3
{
  id v3 = [(PassbookSettingsListController *)self _appleCardUpsellAlertWithAccount:a3];
}

- (void)presentTransactionDetailsForTransaction:(id)a3 transactionSourceType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)PKPaymentService);
  switch(a4)
  {
    case 0uLL:
      id v8 = [v6 identifier];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_54A4;
      v30[3] = &unk_10630;
      v30[4] = self;
      id v31 = v6;
      [v7 passUniqueIdentifierForTransactionWithIdentifier:v8 completion:v30];

      break;
    case 1uLL:
      v14 = [v6 accountIdentifier];
      v15 = +[PKPeerPaymentService sharedInstance];
      v16 = [v15 account];

      id v17 = [v16 peerPaymentAccountWithIdentifier:v14];
      v18 = v17;
      if (v17)
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_5608;
        v26[3] = &unk_10680;
        v27 = v17;
        v28 = self;
        id v29 = v6;
        [v7 familyMembersWithCompletion:v26];

        id v19 = v27;
      }
      else
      {
        id v19 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v6;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Cannot find a peer payment account for transaction %@", (uint8_t *)location, 0xCu);
        }
      }

      break;
    case 2uLL:
      id v9 = [v6 accountIdentifier];
      id v10 = [v6 altDSID];
      if (v10)
      {
        accountService = self->_accountService;
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_5A10;
        v24[3] = &unk_106A8;
        v24[4] = self;
        id v25 = v6;
        [(PKAccountService *)accountService accountWithIdentifier:v9 completion:v24];
      }
      else
      {
        v20 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v6;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "There is no altDSID defined for account user on tranasction %@", (uint8_t *)location, 0xCu);
        }
      }
      break;
    case 3uLL:
      id v12 = [v6 accountIdentifier];
      objc_initWeak(location, self);
      objc_super v13 = self->_accountService;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_5B88;
      v21[3] = &unk_10568;
      objc_copyWeak(&v23, location);
      id v22 = v6;
      [(PKAccountService *)v13 accountWithIdentifier:v12 completion:v21];

      objc_destroyWeak(&v23);
      objc_destroyWeak(location);

      break;
    default:
      break;
  }
}

- (void)presentPeerPaymentRecurringPaymentWithPass:(id)a3 presentationStyle:(int64_t)a4 recurringPaymentIdentifier:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v15 = a5;
  id v10 = a3;
  id v11 = [(PassbookSettingsListController *)self _presentPassDetailsViewControllerForPass:v10 presentationStyle:a4 animated:v6];
  id v12 = [v10 secureElementPass];

  objc_super v13 = [v12 devicePrimaryPaymentApplication];
  v14 = (char *)[v13 state];

  if (v14 != (unsigned char *)&dword_4 + 3) {
    [v11 presentRecurringPaymentsWithIdentifier:v15];
  }
}

- (void)presentPeerPaymentTransferToBankWithPass:(id)a3
{
  id v5 = [(PassbookSettingsListController *)self _passDetailsViewControllerForPass:a3];
  if (v5)
  {
    BOOL v4 = [(PassbookSettingsListController *)self navigationController];
    [v4 pushViewController:v5 animated:0];

    [v5 presentTransferToBank];
  }
}

- (void)presentAccountForFeature:(unint64_t)a3 destination:(unint64_t)a4 fundingSourceIdentifier:(id)a5 animated:(BOOL)a6
{
  id v9 = a5;
  if (a3 == 5)
  {
    *(void *)buf = 0;
    id v25 = buf;
    uint64_t v26 = 0x3032000000;
    v27 = sub_6158;
    v28 = sub_6168;
    id v29 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = sub_6158;
    v22[4] = sub_6168;
    id v23 = 0;
    id v10 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_6170;
    v21[3] = &unk_106F8;
    v21[5] = buf;
    v21[6] = 5;
    void v21[4] = self;
    [v10 addOperation:v21];
    if ([v9 length])
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_62D0;
      v17[3] = &unk_10748;
      v17[4] = self;
      id v18 = v9;
      id v19 = buf;
      v20 = v22;
      [v10 addOperation:v17];
    }
    objc_initWeak(&location, self);
    id v11 = +[NSNull null];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_6440;
    v14[3] = &unk_10798;
    objc_copyWeak(v15, &location);
    v15[1] = (id)a4;
    void v14[4] = buf;
    v14[5] = v22;
    id v12 = [v10 evaluateWithInput:v11 completion:v14];

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_super v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Attempted to present an unsupported feature", buf, 2u);
    }
  }
}

- (id)_presentPassDetailsViewControllerForPass:(id)a3 presentationStyle:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = [(PassbookSettingsListController *)self _passDetailsViewControllerForPass:a3];
  if (v8)
  {
    if ((unint64_t)a4 >= 2)
    {
      if (a4 != 2)
      {
LABEL_7:
        id v10 = v8;
        goto LABEL_8;
      }
      id v9 = [(PassbookSettingsListController *)self navigationController];
      [v9 pushViewController:v8 animated:v5];
    }
    else
    {
      id v9 = [(PassbookSettingsListController *)self navigationController];
      [v9 presentViewController:v8 animated:v5 completion:0];
    }

    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- (id)_passDetailsViewControllerForPass:(id)a3
{
  if (a3)
  {
    settingsController = self->_settingsController;
    id v5 = a3;
    BOOL v6 = [(PKPassbookSettingsController *)settingsController rendererStateForPaymentPass:v5];
    id v7 = objc_alloc((Class)PKPaymentPassDetailViewController);
    id v8 = +[PKPaymentWebService sharedService];
    id v9 = [(PKPassbookSettingsDefaultBehavior *)self->_defaultBehavior peerPaymentDataSource];
    id v10 = [v9 peerPaymentWebService];
    id v11 = [(PKPassbookSettingsDefaultBehavior *)self->_defaultBehavior passLibraryDataProvider];
    id v12 = [(PKPassbookSettingsDefaultBehavior *)self->_defaultBehavior paymentDataProvider];
    id v13 = [v7 initWithPass:v5 group:0 groupsController:0 webService:v8 peerPaymentWebService:v10 style:1 passLibraryDataProvider:v11 paymentServiceDataProvider:v12 rendererState:v6 context:0];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)paymentPassWithUniqueIdentifier:(id)a3
{
  return [(PKPassbookSettingsController *)self->_settingsController passWithUniqueIdentifier:a3];
}

- (id)peerPaymentPass
{
  id v3 = [(PKPassbookSettingsDefaultBehavior *)self->_defaultBehavior peerPaymentDataSource];
  BOOL v4 = [v3 peerPaymentWebService];
  id v5 = [v4 peerPaymentService];
  BOOL v6 = [v5 account];
  id v7 = [v6 associatedPassUniqueID];

  id v8 = [(PKPassbookSettingsController *)self->_settingsController passWithUniqueIdentifier:v7];

  return v8;
}

- (void)settingsController:(id)a3 requestsAddCardPreflightWithCompletion:(id)a4
{
  id v4 = a4;
  id v5 = +[PKPaymentWebService sharedService];
  id v6 = [objc_alloc((Class)PKPaymentProvisioningController) initWithWebService:v5];
  [v6 setAllowProductsInUnsupportedRegion:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_6954;
  v9[3] = &unk_107C0;
  id v10 = v6;
  id v11 = v4;
  id v7 = v6;
  id v8 = v4;
  [v7 preflightWithCompletion:v9];
}

- (void)settingsController:(id)a3 requestsReloadSpecifier:(id)a4
{
}

- (void)settingsControllerRequestsReloadSpecifiers:(id)a3
{
}

- (void)settingsController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  if (self->_isVisible) {
    [(PassbookSettingsListController *)self presentViewController:a4 animated:a5 completion:a6];
  }
}

- (void)settingsController:(id)a3 requestsForcedPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
}

- (BOOL)isPresentingViewController
{
  uint64_t v2 = [(PassbookSettingsListController *)self presentedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)settingsController:(id)a3 requestsPushViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(PassbookSettingsListController *)self navigationController];
  [v8 pushViewController:v7 animated:v5];
}

- (void)settingsController:(id)a3 requestsDetailViewControllerForPass:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = [(PassbookSettingsListController *)self _passDetailsViewControllerForPass:a4];
  if (v8)
  {
    id v7 = [(PassbookSettingsListController *)self navigationController];
    [v7 pushViewController:v8 animated:v5];
  }
}

- (void)settingsControllerRequestsPresentPrivacyWithPresenter:(id)a3
{
  id v4 = a3;
  [v4 setPresentingViewController:self];
  if (-[PassbookSettingsListController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))[v4 setModalPresentationStyle:2]; {
  [v4 present];
  }
}

- (void)settingsController:(id)a3 requestsPresentSecurityRepairFlowWithSecurityCapabilities:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v11 = [objc_alloc((Class)PKSecurityCapabilitiesController) initWithRequirements:a4 feature:1 context:3];
  id v8 = [(PassbookSettingsListController *)self navigationController];
  if (v8)
  {
    id v9 = [(PassbookSettingsListController *)self navigationController];
  }
  else
  {
    id v9 = self;
  }
  id v10 = v9;

  [v11 presentSecurityRepairFlowWithPresentingViewController:v10 completion:v7];
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
  v14[2] = sub_6DDC;
  v14[3] = &unk_10838;
  void v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [v12 authenticateWithContext:v9 completion:v14];
}

- (void)requestDismissingPresentedViewControllerWithSettingsController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)requestResetToRootWithSettingsController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(PassbookSettingsListController *)self navigationController];
  id v6 = [v7 popToViewController:self animated:v4];
}

- (void)settingsController:(id)a3 requestShowPeerPaymentAssociatedAccountsFlowWithController:(id)a4 withPresentationContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(PassbookSettingsListController *)self navigationController];
  [v8 presentAssociatedAccountsFlowWithPresentationContext:v7 fromNavigationController:v9];
}

- (void)settingsController:(id)a3 requestsPresentAuthorizationFlowWithRedirectURL:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_7274;
  v10[3] = &unk_10860;
  id v11 = a4;
  id v12 = a6;
  id v8 = v12;
  id v9 = v11;
  [(PassbookSettingsListController *)self presentAuthorizationFlowAnimated:1 completion:v10];
}

- (void)presentAuthorizationFlowAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = objc_alloc_init(off_15A80());
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_73E0;
  v9[3] = &unk_108B0;
  id v8 = v6;
  id v10 = v8;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  [v7 authorizationSessionWithCompletion:v9];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)presentAuthorizationViewControllerWithPaymentPass:(id)a3 session:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_6158;
  v42 = sub_6168;
  id v43 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_78F4;
  v32[3] = &unk_108D8;
  objc_copyWeak(&v36, &location);
  id v13 = v12;
  id v35 = v13;
  id v14 = v10;
  id v33 = v14;
  id v15 = v11;
  id v34 = v15;
  BOOL v37 = v7;
  v16 = objc_retainBlock(v32);
  uint64_t v17 = [(objc_class *)off_15A88() makeAuthorizationViewControllerForAuthorizationSession:v15 completion:v16];
  id v18 = (void *)v39[5];
  v39[5] = v17;

  id v19 = [(PassbookSettingsListController *)self navigationController];
  v20 = objc_msgSend(v19, "pkui_frontMostViewController");

  [(PassbookSettingsListController *)self navigationController];
  if (v20) {
    v21 = {;
  }
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_79DC;
    v28[3] = &unk_10928;
    v28[4] = self;
    v30 = &v38;
    BOOL v31 = v7;
    id v29 = v13;
    [v21 dismissViewControllerAnimated:0 completion:v28];

    id v22 = v29;
  }
  else {
    id v23 = {;
  }
    uint64_t v24 = v39[5];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_7ABC;
    v25[3] = &unk_10900;
    id v26 = v13;
    v27 = &v38;
    [v23 presentViewController:v24 animated:v7 completion:v25];

    id v22 = v26;
  }

  objc_destroyWeak(&v36);
  _Block_object_dispose(&v38, 8);

  objc_destroyWeak(&location);
}

- (void)settingsController:(id)a3 requestsPresentInboxMessage:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v11 = a4;
  id v9 = a6;
  if (![v11 type])
  {
    id v10 = [v11 accountUserInvitation];
    [(PassbookSettingsListController *)self _presentAccountUserInvitation:v10 animated:v7 completion:v9];
  }
}

- (void)_presentAccountUserInvitation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_7CB8;
  v17[3] = &unk_109C8;
  v17[4] = self;
  id v10 = v8;
  BOOL v20 = a4;
  id v18 = v10;
  id v19 = v9;
  id v11 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_80C8;
  v14[3] = &unk_109F0;
  id v15 = v10;
  v16 = objc_retainBlock(v17);
  void v14[4] = self;
  id v12 = v10;
  id v13 = v16;
  [(PassbookSettingsListController *)self _checkManateeCapabilityForFeatureApplication:v12 completion:v14];
}

- (void)_checkManateeCapabilityForFeatureApplication:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    id v8 = objc_alloc((Class)PKSecurityCapabilitiesController);
    id v9 = [v7 feature];

    id v10 = (PKSecurityCapabilitiesController *)[v8 initWithRequirements:8 feature:v9 context:3];
    securityCapabilitiesController = self->_securityCapabilitiesController;
    self->_securityCapabilitiesController = v10;

    id v12 = self->_securityCapabilitiesController;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_83C4;
    v13[3] = &unk_10A40;
    id v14 = v6;
    [(PKSecurityCapabilitiesController *)v12 isEnabledForSecuirtyRequirementsWithCompletion:v13];
  }
}

- (void)_presentManateeUpgradeForFeatureApplication:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v7)
  {
    id v8 = (PKSecurityCapabilitiesController *)objc_msgSend(objc_alloc((Class)PKSecurityCapabilitiesController), "initWithRequirements:feature:context:", 8, objc_msgSend(v6, "feature"), 3);
    securityCapabilitiesController = self->_securityCapabilitiesController;
    self->_securityCapabilitiesController = v8;

    id v10 = [(PassbookSettingsListController *)self navigationController];
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Presenting hsa2 flow for account user invitation", buf, 2u);
    }

    id v12 = self->_securityCapabilitiesController;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_85EC;
    v13[3] = &unk_10A90;
    void v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    [(PKSecurityCapabilitiesController *)v12 presentSecurityRepairFlowWithPresentingViewController:v10 completion:v13];
  }
}

- (void)openTransactionDefaultsEmailSettings
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_securityCapabilitiesController, 0);
  objc_storeStrong((id *)&self->_applyController, 0);
  objc_storeStrong((id *)&self->_deepLinkController, 0);
  objc_storeStrong((id *)&self->_associatedAccountsController, 0);
  objc_storeStrong((id *)&self->_defaultBehavior, 0);

  objc_storeStrong((id *)&self->_settingsController, 0);
}

@end