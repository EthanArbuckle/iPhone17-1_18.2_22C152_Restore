@interface AAUICustodianSetupFlowController
- (AAUICustodianSetupFlowController)initWithAccountManager:(id)a3;
- (AAUICustodianSetupFlowController)initWithAccountManager:(id)a3 navigationController:(id)a4;
- (AAUICustodianSetupFlowController)initWithAccountManager:(id)a3 navigationController:(id)a4 isADPUpsellFlow:(BOOL)a5 cdpContext:(id)a6;
- (AAUICustodianSetupFlowControllerDelegate)delegate;
- (BOOL)forceInlinePresentation;
- (BOOL)isWalrusEnabled;
- (BOOL)preValidate;
- (NSString)telemetryFlowID;
- (UINavigationController)navigationController;
- (UIViewController)presentedViewController;
- (id)_setupContactSelectorVCWithViewModel:(id)a3;
- (void)_beginAddRecoveryContactFlow;
- (void)_cancelCustodianInvite;
- (void)_continueAddRecoveryContactFlow;
- (void)_dismissCFUIfNeeded;
- (void)_dismissWithCancel;
- (void)_dismissWithError:(id)a3;
- (void)_displayAlertForNotReachableContact:(id)a3;
- (void)_displayCustodianAddNotAllowedAlert;
- (void)_displayRatchetGenericErrorAlert;
- (void)_fetchSuggestedContacts;
- (void)_hideActivityIndicator;
- (void)_inviteContact:(id)a3;
- (void)_loadRemoteUIPresenterRequest:(id)a3;
- (void)_postAdpUpsellCFUCustodianFirstTimeSetupEvent;
- (void)_removeRecoveryKeyAndDismissCFUIfNeeded;
- (void)_sendEscapeOfferSelectedEvent:(id)a3;
- (void)_sendTelemetryEventWithEscapeOffers:(id)a3 offers:(id)a4;
- (void)_showActivityIndicator;
- (void)_showAlertWithTitle:(id)a3 message:(id)a4;
- (void)_showChooseContact;
- (void)_showChooseContactWithCancel;
- (void)_showDataRecoveryServiceEnableUI;
- (void)_showDataRecoveryServiceEnableUIWithPresenter:(id)a3 modal:(BOOL)a4;
- (void)_showDeviceUpgradeUI;
- (void)_showFirstTimeSetup;
- (void)_showSuggestedContactSelector:(id)a3;
- (void)_startInviteMessageFlow;
- (void)_validateAccountWithCompletion:(id)a3;
- (void)_verifyAndInviteContact:(id)a3;
- (void)_verifyCDPWithCompletion:(id)a3;
- (void)accountContactSelector:(id)a3 didSelectContact:(id)a4;
- (void)accountContactSelectorDismiss:(id)a3;
- (void)accountContactSelectorShowOtherContacts:(id)a3;
- (void)chooseContactController:(id)a3 didSelectContact:(id)a4;
- (void)inviteMessageFlowDidFinish:(id)a3;
- (void)remoteUIDidDismiss:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceInlinePresentation:(BOOL)a3;
- (void)setIsWalrusEnabled:(BOOL)a3;
- (void)setNavigationController:(id)a3;
- (void)setPreValidate:(BOOL)a3;
- (void)setPresentedViewController:(id)a3;
- (void)setTelemetryFlowID:(id)a3;
- (void)start;
- (void)startAddingDataRecoveryService:(id)a3;
- (void)startWithoutFirstTimeSetup;
@end

@implementation AAUICustodianSetupFlowController

- (AAUICustodianSetupFlowController)initWithAccountManager:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(AAUICustodianSetupFlowController *)self initWithAccountManager:v4 navigationController:v5];

  return v6;
}

- (AAUICustodianSetupFlowController)initWithAccountManager:(id)a3 navigationController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Instantiating AAUICustodianSetupFlowController with nil cdpContext", v11, 2u);
  }

  v9 = [(AAUICustodianSetupFlowController *)self initWithAccountManager:v7 navigationController:v6 isADPUpsellFlow:0 cdpContext:0];
  return v9;
}

- (AAUICustodianSetupFlowController)initWithAccountManager:(id)a3 navigationController:(id)a4 isADPUpsellFlow:(BOOL)a5 cdpContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AAUICustodianSetupFlowController;
  v14 = [(AAUICustodianSetupFlowController *)&v22 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_navigationController, a4);
    objc_storeStrong((id *)&v15->_accountManager, a3);
    uint64_t v16 = objc_opt_new();
    custodianController = v15->_custodianController;
    v15->_custodianController = (AACustodianController *)v16;

    v15->_isADPUpsellFlow = a5;
    objc_storeStrong((id *)&v15->_cdpContext, a6);
    id v18 = objc_alloc_init(MEMORY[0x263F29198]);
    v19 = [[AAUIDTOHelper alloc] initWithDTOController:v18];
    dtoHelper = v15->_dtoHelper;
    v15->_dtoHelper = v19;
  }
  return v15;
}

- (void)start
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Initiating Custodian setup flow...", v4, 2u);
  }

  [(AAUICustodianSetupFlowController *)self _showFirstTimeSetup];
}

- (void)startWithoutFirstTimeSetup
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Skipping first time setup. No need to do DTO check. Showing Add Recovery Contact flow.", v4, 2u);
  }

  [(AAUICustodianSetupFlowController *)self _continueAddRecoveryContactFlow];
}

- (void)startAddingDataRecoveryService:(id)a3
{
  id v4 = a3;
  v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Initating data recovery service enable UI", v6, 2u);
  }

  [(AAUICustodianSetupFlowController *)self _showDataRecoveryServiceEnableUIWithPresenter:v4 modal:[(AAUICustodianSetupFlowController *)self forceInlinePresentation] ^ 1];
}

- (void)chooseContactController:(id)a3 didSelectContact:(id)a4
{
}

- (void)accountContactSelector:(id)a3 didSelectContact:(id)a4
{
}

- (void)accountContactSelectorDismiss:(id)a3
{
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F28F30] code:-7003 userInfo:0];
  [(AAUICustodianSetupFlowController *)self _dismissWithError:v4];
}

- (void)accountContactSelectorShowOtherContacts:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__AAUICustodianSetupFlowController_accountContactSelectorShowOtherContacts___block_invoke;
  block[3] = &unk_263F92168;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __76__AAUICustodianSetupFlowController_accountContactSelectorShowOtherContacts___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showChooseContact];
}

- (void)_startInviteMessageFlow
{
  int v3 = [(AALocalContactInfo *)self->_invitedContact isFamilyMember];
  if (v3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  id v5 = objc_alloc(MEMORY[0x263F25900]);
  id v6 = [(AALocalContactInfo *)self->_invitedContact handle];
  id v17 = (id)[v5 initWithType:v4 recipientHandle:v6];

  id v7 = [[AAUIOBTrustedContactInviteMessageModel alloc] initWithModel:v17];
  v8 = [AAUIOBInvitationSentViewModel alloc];
  v9 = [(AALocalContactInfo *)self->_invitedContact handle];
  v10 = [(AAUIOBInvitationSentViewModel *)v8 initWithType:v3 ^ 1u recipientHandle:v9];

  id v11 = (void *)[objc_alloc(MEMORY[0x263F257F0]) initWithLocalContact:self->_invitedContact custodianID:self->_custodianshipID];
  id v12 = [AAUIInviteMessageFlowController alloc];
  id v13 = [(AAUICustodianSetupFlowController *)self navController];
  LOBYTE(v16) = v3;
  v14 = [(AAUIInviteMessageFlowController *)v12 initWithContext:v11 flow:0 navigationController:v13 defaultMessageViewModel:v7 messageSentViewModel:v10 isADPUpsellFlow:self->_isADPUpsellFlow isFamilyMember:v16 cdpContext:self->_cdpContext];
  inviteFlowController = self->_inviteFlowController;
  self->_inviteFlowController = v14;

  [(AAUIInviteMessageFlowController *)self->_inviteFlowController setDelegate:self];
  [(AAUIInviteMessageFlowController *)self->_inviteFlowController setTelemetryFlowID:self->_telemetryFlowID];
  [(AAUIInviteMessageFlowController *)self->_inviteFlowController setAccountManager:self->_accountManager];
  [(AAUIInviteMessageFlowController *)self->_inviteFlowController start];
}

- (void)_loadRemoteUIPresenterRequest:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setURL:v4];

  [(AAUIGrandSlamRemoteUIPresenter *)self->_remoteUIPresenter setDelegate:self];
  [(AAUIGrandSlamRemoteUIPresenter *)self->_remoteUIPresenter loadRequest:v5];
}

- (void)remoteUIDidDismiss:(id)a3
{
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F342B0] code:-5307 userInfo:0];
  [(AAUICustodianSetupFlowController *)self _dismissWithError:v4];
}

- (void)_sendTelemetryEventWithEscapeOffers:(id)a3 offers:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(AIDAAccountManager *)self->_accountManager accounts];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  if (v8)
  {
    v9 = (void *)MEMORY[0x263F202A8];
    v10 = objc_msgSend(v8, "aida_alternateDSID");
    id v11 = [(AAUICustodianSetupFlowController *)self telemetryFlowID];
    id v12 = [v9 analyticsEventWithName:v15 altDSID:v10 flowID:v11];

    id v13 = objc_msgSend(v6, "aaf_arrayAsCommaSeperatedString");
    [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x263F345E8]];

    v14 = [MEMORY[0x263F25780] reporter];
    [v14 sendEvent:v12];
  }
}

- (void)_sendEscapeOfferSelectedEvent:(id)a3
{
  id v12 = a3;
  id v4 = [(AIDAAccountManager *)self->_accountManager accounts];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263F202A8];
    uint64_t v7 = *MEMORY[0x263F25A98];
    v8 = objc_msgSend(v5, "aida_alternateDSID");
    v9 = [(AAUICustodianSetupFlowController *)self telemetryFlowID];
    v10 = [v6 analyticsEventWithName:v7 altDSID:v8 flowID:v9];

    [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x263F345F8]];
    id v11 = [MEMORY[0x263F25780] reporter];
    [v11 sendEvent:v10];
  }
}

- (void)_showFirstTimeSetup
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Not adding an action to the secondary button because it is ADP upsell flow.", v2, v3, v4, v5, v6);
}

- (void)_postAdpUpsellCFUCustodianFirstTimeSetupEvent
{
  uint64_t v3 = (void *)MEMORY[0x263F202A8];
  uint64_t v4 = [(CDPContext *)self->_cdpContext altDSID];
  uint64_t v5 = [(CDPContext *)self->_cdpContext telemetryFlowID];
  id v7 = [v3 analyticsEventWithName:@"com.apple.appleaccount.custodianFirstTimeSetup" altDSID:v4 flowID:v5];

  uint8_t v6 = [MEMORY[0x263F25780] reporter];
  [v6 sendEvent:v7];
}

- (void)_beginAddRecoveryContactFlow
{
  uint64_t v3 = [(AIDAAccountManager *)self->_accountManager accounts];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  if (v4)
  {
    dtoHelper = self->_dtoHelper;
    uint8_t v6 = objc_msgSend(v4, "aa_altDSID");
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__AAUICustodianSetupFlowController__beginAddRecoveryContactFlow__block_invoke;
    v8[3] = &unk_263F92968;
    v8[4] = self;
    [(AAUIDTOHelper *)dtoHelper shouldGateUsingRatchetForAltDSID:v6 completion:v8];
  }
  else
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AAUIRecoveryFactorController startAddingRecoveryContact]();
    }
  }
}

void __64__AAUICustodianSetupFlowController__beginAddRecoveryContactFlow__block_invoke(uint64_t a1, int a2)
{
  if (!a2)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __64__AAUICustodianSetupFlowController__beginAddRecoveryContactFlow__block_invoke_60;
    v13[3] = &unk_263F92168;
    v13[4] = *(void *)(a1 + 32);
    id v11 = MEMORY[0x263EF83A0];
    id v12 = v13;
LABEL_10:
    dispatch_async(v11, v12);
    return;
  }
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_cold_2();
  }

  if (![*(id *)(*(void *)(a1 + 32) + 96) isDTOGatingEnabled])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__AAUICustodianSetupFlowController__beginAddRecoveryContactFlow__block_invoke_2;
    block[3] = &unk_263F92168;
    block[4] = *(void *)(a1 + 32);
    id v11 = MEMORY[0x263EF83A0];
    id v12 = block;
    goto LABEL_10;
  }
  uint64_t v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_cold_1();
  }

  uint64_t v5 = *(void **)(a1 + 32);
  uint8_t v6 = (void *)v5[12];
  id v7 = [v5 navigationController];
  v8 = [v6 makeRatchetContextWithPresentationContext:v7 DTOContextType:1];

  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 96);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__AAUICustodianSetupFlowController__beginAddRecoveryContactFlow__block_invoke_57;
  v15[3] = &unk_263F929D0;
  v15[4] = v9;
  [v10 shouldAllowOpForContext:v8 completion:v15];
}

void __64__AAUICustodianSetupFlowController__beginAddRecoveryContactFlow__block_invoke_57(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint8_t v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_35_cold_1(a2, (uint64_t)v5, v6);
  }

  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__AAUICustodianSetupFlowController__beginAddRecoveryContactFlow__block_invoke_58;
    block[3] = &unk_263F92168;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __64__AAUICustodianSetupFlowController__beginAddRecoveryContactFlow__block_invoke_58(uint64_t a1)
{
  return [*(id *)(a1 + 32) _continueAddRecoveryContactFlow];
}

uint64_t __64__AAUICustodianSetupFlowController__beginAddRecoveryContactFlow__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_2_cold_1();
  }

  return [*(id *)(a1 + 32) _continueAddRecoveryContactFlow];
}

uint64_t __64__AAUICustodianSetupFlowController__beginAddRecoveryContactFlow__block_invoke_60(uint64_t a1)
{
  uint64_t v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_39_cold_1();
  }

  return [*(id *)(a1 + 32) _displayCustodianAddNotAllowedAlert];
}

- (void)_continueAddRecoveryContactFlow
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Continue adding recovery contact flow", v2, v3, v4, v5, v6);
}

void __67__AAUICustodianSetupFlowController__continueAddRecoveryContactFlow__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (objc_msgSend(v5, "ak_isIncompatibleDevicesError"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _showDeviceUpgradeUI];
  }
  else if (objc_msgSend(v5, "ak_isUserCancelError"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _dismissWithError:v5];
  }
  else if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _fetchSuggestedContacts];
  }
  else
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __67__AAUICustodianSetupFlowController__continueAddRecoveryContactFlow__block_invoke_cold_1();
    }

    id v8 = objc_loadWeakRetained((id *)(a1 + 32));
    id WeakRetained = v8;
    if (v8)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__AAUICustodianSetupFlowController__continueAddRecoveryContactFlow__block_invoke_62;
      block[3] = &unk_263F92168;
      block[4] = v8;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __67__AAUICustodianSetupFlowController__continueAddRecoveryContactFlow__block_invoke_62(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 24) primaryButton];
  [v1 setEnabled:1];
}

- (void)_displayCustodianAddNotAllowedAlert
{
  id v4 = [(AAUIDTOHelper *)self->_dtoHelper makeCustodianAddOpNotAllowedAlert];
  uint64_t v3 = [(AAUICustodianSetupFlowController *)self navigationController];
  [v3 presentViewController:v4 animated:1 completion:0];
}

- (void)_displayRatchetGenericErrorAlert
{
  id v4 = [(AAUIDTOHelper *)self->_dtoHelper makeGenericRatchetFailedAlert];
  uint64_t v3 = [(AAUICustodianSetupFlowController *)self navigationController];
  [v3 presentViewController:v4 animated:1 completion:0];
}

- (void)_showDataRecoveryServiceEnableUI
{
}

- (void)_showDataRecoveryServiceEnableUIWithPresenter:(id)a3 modal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [MEMORY[0x263F29270] sharedBag];
  id v8 = [v7 urlAtKey:*MEMORY[0x263F290C0]];

  if (v8)
  {
    [(AAUICustodianSetupFlowController *)self _showActivityIndicator];
    uint64_t v9 = [[AAUIGrandSlamRemoteUIPresenter alloc] initWithAccountManager:self->_accountManager hookType:2 presenter:v6];
    remoteUIPresenter = self->_remoteUIPresenter;
    self->_remoteUIPresenter = v9;

    [(AAUIGrandSlamRemoteUIPresenter *)self->_remoteUIPresenter setModalInPresentation:v4];
    [(AAUIGrandSlamRemoteUIPresenter *)self->_remoteUIPresenter setShowCancelInModalPresentation:1];
    [(AAUICustodianSetupFlowController *)self _loadRemoteUIPresenterRequest:v8];
  }
  else
  {
    id v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "Unable to load data recovery service enable remote UI. We're missing the URL from the URL bag.", v13, 2u);
    }

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25658] code:-7000 userInfo:0];
    [(AAUICustodianSetupFlowController *)self _dismissWithError:v12];
  }
}

- (void)_validateAccountWithCompletion:(id)a3
{
  id v4 = a3;
  accountManager = self->_accountManager;
  if (!accountManager)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AAUICustodianSetupFlowController _validateAccountWithCompletion:]();
    }

    accountManager = self->_accountManager;
  }
  id v7 = [(AIDAAccountManager *)accountManager accounts];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x263F202A8];
    uint64_t v10 = *MEMORY[0x263F25A60];
    id v11 = objc_msgSend(v8, "aida_alternateDSID");
    id v12 = [(AAUICustodianSetupFlowController *)self telemetryFlowID];
    id v13 = [v9 analyticsEventWithName:v10 altDSID:v11 flowID:v12];

    objc_initWeak(&location, self);
    v14 = objc_opt_new();
    id v15 = [(AAUICustodianSetupFlowController *)self navigationController];
    uint64_t v16 = [v15 presentingViewController];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __67__AAUICustodianSetupFlowController__validateAccountWithCompletion___block_invoke;
    v19[3] = &unk_263F943E8;
    objc_copyWeak(&v22, &location);
    v19[4] = self;
    id v17 = v13;
    id v20 = v17;
    id v21 = v4;
    objc_msgSend(v14, "aaui_custodianAuthForAccount:presentingViewController:completion:", v8, v16, v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    id v18 = _AAUILogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[AAUICustodianSetupFlowController _validateAccountWithCompletion:]();
    }

    objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -4404);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v17);
  }
}

void __67__AAUICustodianSetupFlowController__validateAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (!v6 || v7)
  {
    [*(id *)(a1 + 32) _hideActivityIndicator];
    id v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __82__AAUIMyCustodianActionHandler__continueDoingDestructiveAction_specifier_account___block_invoke_cold_1();
    }

    [*(id *)(a1 + 40) populateUnderlyingErrorsStartingWithRootError:v7];
    [*(id *)(a1 + 40) setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F20330]];
    id v13 = [MEMORY[0x263F25780] reporter];
    [v13 sendEvent:*(void *)(a1 + 40)];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Authentication successful, continue setup...", v14, 2u);
    }

    [*(id *)(a1 + 40) setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F20330]];
    uint64_t v10 = [MEMORY[0x263F25780] reporter];
    [v10 sendEvent:*(void *)(a1 + 40)];

    objc_storeStrong(WeakRetained + 4, a2);
    id v11 = objc_loadWeakRetained((id *)(a1 + 56));
    [v11 _verifyCDPWithCompletion:*(void *)(a1 + 48)];
  }
}

- (void)_verifyCDPWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[AAUID2DEncryptionFlowContext alloc] initWithType:2];
  id v6 = [AAUIManateeStateValidator alloc];
  id v7 = [(AAUICustodianSetupFlowController *)self navigationController];
  id v8 = [(AAUIManateeStateValidator *)v6 initWithFlowContext:v5 withPresentingViewController:v7];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__AAUICustodianSetupFlowController__verifyCDPWithCompletion___block_invoke;
  v11[3] = &unk_263F93178;
  id v12 = v8;
  id v13 = v4;
  id v9 = v4;
  uint64_t v10 = v8;
  [(AAUIManateeStateValidator *)v10 verifyAndRepairManateeWithCompletion:v11];
}

uint64_t __61__AAUICustodianSetupFlowController__verifyCDPWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_showDeviceUpgradeUI
{
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Show device upgrade UI...", buf, 2u);
  }

  id v4 = [MEMORY[0x263F29270] sharedBag];
  id v5 = [v4 urlAtKey:*MEMORY[0x263F290C8]];

  if (v5)
  {
    id v6 = [[AAUIGrandSlamRemoteUIPresenter alloc] initWithAccountManager:self->_accountManager presenter:self->_firstTimeSetupVC];
    remoteUIPresenter = self->_remoteUIPresenter;
    self->_remoteUIPresenter = v6;

    [(AAUICustodianSetupFlowController *)self _loadRemoteUIPresenterRequest:v5];
  }
  else
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Unable to load device upgrade remote UI. We're missing the URL from the URL bag.", v10, 2u);
    }

    id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25658] code:-7000 userInfo:0];
    [(AAUICustodianSetupFlowController *)self _dismissWithError:v9];
  }
}

- (void)_fetchSuggestedContacts
{
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Fetching suggested contacts...", buf, 2u);
  }

  id v4 = objc_opt_new();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__AAUICustodianSetupFlowController__fetchSuggestedContacts__block_invoke;
  v5[3] = &unk_263F94410;
  v5[4] = self;
  [v4 fetchSuggestedCustodiansWithImagesOfSize:v5 andCompletion:16.0];
}

void __59__AAUICustodianSetupFlowController__fetchSuggestedContacts__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__AAUICustodianSetupFlowController__fetchSuggestedContacts__block_invoke_2;
  v5[3] = &unk_263F926B8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __59__AAUICustodianSetupFlowController__fetchSuggestedContacts__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) navigationController];
  objc_msgSend(v2, "aaui_hideActivityIndicator");

  uint64_t v3 = [*(id *)(a1 + 40) count];
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 _showSuggestedContactSelector:v5];
  }
  else
  {
    return [v4 _showChooseContactWithCancel];
  }
}

- (void)_showSuggestedContactSelector:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Showing suggested contacts...", (uint8_t *)buf, 2u);
  }

  id v6 = [[AAUIOBContactSelectorViewModel alloc] initWithFlow:0];
  [(AAUIOBContactSelectorViewModel *)v6 setSuggestedContacts:v4];
  id v7 = [(AAUICustodianSetupFlowController *)self _setupContactSelectorVCWithViewModel:v6];
  objc_initWeak(buf, self);
  id v8 = (void *)MEMORY[0x263F823D0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__AAUICustodianSetupFlowController__showSuggestedContactSelector___block_invoke;
  v13[3] = &unk_263F94438;
  objc_copyWeak(&v14, buf);
  id v9 = [v8 actionWithHandler:v13];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 primaryAction:v9];
  id v11 = [v7 navigationItem];
  [v11 setLeftBarButtonItem:v10];

  id v12 = [(AAUICustodianSetupFlowController *)self navigationController];
  [v12 pushViewController:v7 animated:1];

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

void __66__AAUICustodianSetupFlowController__showSuggestedContactSelector___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F342B0] code:-5307 userInfo:0];
  [WeakRetained _dismissWithError:v1];
}

- (id)_setupContactSelectorVCWithViewModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[AAUIAccountContactSelectorViewController alloc] initWithViewModel:v4];

  [(AAUIOBTableWelcomeController *)v5 setDelegate:self];
  return v5;
}

- (void)_showChooseContact
{
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Showing choose contacts...", v8, 2u);
  }

  id v4 = [[AAUIChooseContactController alloc] initWithAccountManager:self->_accountManager];
  chooseContactController = self->_chooseContactController;
  self->_chooseContactController = v4;

  [(AAUIChooseContactController *)self->_chooseContactController setDelegate:self];
  [(AAUIChooseContactController *)self->_chooseContactController setTelemetryFlowID:self->_telemetryFlowID];
  id v6 = [(AAUIChooseContactController *)self->_chooseContactController chooseContactViewController];
  id v7 = [(AAUICustodianSetupFlowController *)self navigationController];
  [v7 showViewController:v6 sender:0];
}

- (void)_showChooseContactWithCancel
{
  v17[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Showing choose contacts...", (uint8_t *)&buf, 2u);
  }

  id v4 = [[AAUIChooseContactController alloc] initWithAccountManager:self->_accountManager];
  chooseContactController = self->_chooseContactController;
  self->_chooseContactController = v4;

  [(AAUIChooseContactController *)self->_chooseContactController setDelegate:self];
  [(AAUIChooseContactController *)self->_chooseContactController setTelemetryFlowID:self->_telemetryFlowID];
  id v6 = [(AAUIChooseContactController *)self->_chooseContactController chooseContactViewController];
  objc_initWeak(&buf, self);
  id v7 = (void *)MEMORY[0x263F823D0];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__AAUICustodianSetupFlowController__showChooseContactWithCancel__block_invoke;
  v14[3] = &unk_263F94438;
  objc_copyWeak(&v15, &buf);
  id v8 = [v7 actionWithHandler:v14];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 primaryAction:v8];
  uint64_t v10 = [v6 navigationItem];
  [v10 setLeftBarButtonItem:v9];

  uint64_t v11 = *MEMORY[0x263F25BF8];
  v17[0] = *MEMORY[0x263F25BE8];
  v17[1] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  [(AAUICustodianSetupFlowController *)self _sendTelemetryEventWithEscapeOffers:*MEMORY[0x263F25A48] offers:v12];

  id v13 = [(AAUICustodianSetupFlowController *)self navigationController];
  [v13 showViewController:v6 sender:0];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&buf);
}

void __64__AAUICustodianSetupFlowController__showChooseContactWithCancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F342B0] code:-5307 userInfo:0];
  [WeakRetained _dismissWithError:v1];
}

- (void)_verifyAndInviteContact:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 handle];
    *(_DWORD *)id buf = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Verifying %@ is reachable.", buf, 0xCu);
  }
  [(AAUICustodianSetupFlowController *)self _showActivityIndicator];
  id v7 = objc_alloc(MEMORY[0x263F258D0]);
  id v8 = [v4 handle];
  id v9 = (void *)[v7 initWithHandle:v8];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__AAUICustodianSetupFlowController__verifyAndInviteContact___block_invoke;
  v11[3] = &unk_263F94460;
  void v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v9 isRegisteredToiMessageWithCompletion:v11];
}

uint64_t __60__AAUICustodianSetupFlowController__verifyAndInviteContact___block_invoke(uint64_t a1, int a2)
{
  id v4 = _AAUILogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "The contact is reachable-able.", buf, 2u);
    }

    return [*(id *)(a1 + 32) _inviteContact:*(void *)(a1 + 40)];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "The contact with is not iMessage-able.", v7, 2u);
    }

    return [*(id *)(a1 + 32) _displayAlertForNotReachableContact:*(void *)(a1 + 40)];
  }
}

- (void)_displayAlertForNotReachableContact:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__AAUICustodianSetupFlowController__displayAlertForNotReachableContact___block_invoke;
  v6[3] = &unk_263F93D48;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __72__AAUICustodianSetupFlowController__displayAlertForNotReachableContact___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = NSString;
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"CANNOT_ADD_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
  id v6 = [*(id *)(a1 + 40) displayName];
  id v7 = objc_msgSend(v3, "stringWithFormat:", v5, v6);

  id v8 = (void *)MEMORY[0x263F82418];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"CANNOT_ADD_BODY" value:&stru_26BD39CD8 table:@"Localizable"];
  uint64_t v11 = [v8 alertWithTitle:v7 message:v10];

  id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];

  id v14 = (void *)MEMORY[0x263F82400];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__AAUICustodianSetupFlowController__displayAlertForNotReachableContact___block_invoke_2;
  void v17[3] = &unk_263F927A8;
  id v18 = WeakRetained;
  uint64_t v15 = (id *)WeakRetained;
  uint64_t v16 = [v14 actionWithTitle:v13 style:0 handler:v17];
  [v11 addAction:v16];

  [v15[14] presentViewController:v11 animated:1 completion:0];
}

uint64_t __72__AAUICustodianSetupFlowController__displayAlertForNotReachableContact___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "aaui_hideActivityIndicator");
}

- (void)_inviteContact:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 handle];
    *(_DWORD *)id buf = 138412290;
    id v17 = v7;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Inviting %@...", buf, 0xCu);
  }
  id v8 = objc_alloc(MEMORY[0x263F25800]);
  id v9 = [v5 handle];
  id v10 = (void *)[v8 initWithHandle:v9 authResults:self->_authResults];

  objc_storeStrong((id *)&self->_invitedContact, a3);
  objc_initWeak((id *)buf, self);
  custodianController = self->_custodianController;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__AAUICustodianSetupFlowController__inviteContact___block_invoke;
  v13[3] = &unk_263F94488;
  void v13[4] = self;
  id v12 = v5;
  id v14 = v12;
  objc_copyWeak(&v15, (id *)buf);
  [(AACustodianController *)custodianController setupCustodianshipWithContext:v10 completion:v13];
  objc_destroyWeak(&v15);

  objc_destroyWeak((id *)buf);
}

void __51__AAUICustodianSetupFlowController__inviteContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = _AAUILogSystem();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_cold_1();
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_96;
    block[3] = &unk_263F92758;
    block[4] = *(void *)(a1 + 32);
    id v14 = v7;
    id v15 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Custodian setup succeeded. Will display message composer.", buf, 2u);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a2);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_101;
    v10[3] = &unk_263F92AB8;
    objc_copyWeak(&v11, (id *)(a1 + 48));
    dispatch_async(MEMORY[0x263EF83A0], v10);
    objc_destroyWeak(&v11);
  }
}

void __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_96(id *a1)
{
  objc_msgSend(*((id *)a1[4] + 14), "aaui_hideActivityIndicator");
  uint64_t v2 = [MEMORY[0x263F259B0] setupCustodianErrorTitle];
  uint64_t v3 = [MEMORY[0x263F259B0] setupCustodianErrorMessage];
  id v4 = a1 + 5;
  uint64_t v5 = [a1[5] localizedDescription];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [*v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:@"ec"];
    uint64_t v9 = [v8 integerValue];

    if (v9 == -27412)
    {
      id v10 = _AAUILogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_96_cold_3();
      }

      uint64_t v11 = [*v4 localizedDescription];

      uint64_t v12 = [MEMORY[0x263F259B0] custodianCountMaxLimitReachedErrorTitle];

      uint64_t v3 = (void *)v11;
      uint64_t v2 = (void *)v12;
      goto LABEL_19;
    }
  }
  id v13 = [*v4 domain];
  uint64_t v14 = *MEMORY[0x263F25638];
  if ([v13 isEqualToString:*MEMORY[0x263F25638]])
  {
    uint64_t v15 = [*v4 code];

    if (v15 == -7020)
    {
      uint64_t v16 = _AAUILogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_96_cold_1();
      }

      uint64_t v17 = [MEMORY[0x263F259B0] selfCannotBeCustodianErrorTitle];

      uint64_t v18 = [MEMORY[0x263F259B0] selfCannotBeCustodianErrorMessage];

LABEL_17:
      uint64_t v3 = (void *)v18;
      uint64_t v2 = (void *)v17;
      goto LABEL_19;
    }
  }
  else
  {
  }
  v19 = [*v4 domain];
  if (![v19 isEqualToString:v14])
  {

    goto LABEL_19;
  }
  uint64_t v20 = [*v4 code];

  if (v20 == -7014)
  {
    id v21 = _AAUILogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_96_cold_2();
    }

    uint64_t v17 = [MEMORY[0x263F259B0] cannotAddAnExistingCustodianErrorTitle];

    id v22 = NSString;
    v23 = [MEMORY[0x263F259B0] cannotAddAnExistingCustodianErrorMessageFormat];
    v24 = [a1[6] handle];
    uint64_t v18 = objc_msgSend(v22, "stringWithFormat:", v23, v24);

    goto LABEL_17;
  }
LABEL_19:
  [a1[4] _showAlertWithTitle:v2 message:v3];
}

void __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_101(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained navigationController];
  objc_msgSend(v3, "aaui_hideActivityIndicator");

  id v4 = objc_loadWeakRetained(v1);
  [v4 _startInviteMessageFlow];

  id v5 = objc_loadWeakRetained(v1);
  [v5 _dismissCFUIfNeeded];
}

- (void)_showAlertWithTitle:(id)a3 message:(id)a4
{
  id v9 = [MEMORY[0x263F82418] alertWithTitle:a3 message:a4];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];

  id v7 = [MEMORY[0x263F82400] actionWithTitle:v6 style:0 handler:0];
  [v9 addAction:v7];

  id v8 = [(AAUICustodianSetupFlowController *)self navigationController];
  [v8 presentViewController:v9 animated:1 completion:0];
}

- (void)_cancelCustodianInvite
{
  objc_initWeak(&location, self);
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "Custodian invitation was cancelled, revoking custodianship...", buf, 2u);
  }

  [(AAUICustodianSetupFlowController *)self _showActivityIndicator];
  custodianController = self->_custodianController;
  custodianshipID = self->_custodianshipID;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__AAUICustodianSetupFlowController__cancelCustodianInvite__block_invoke;
  v6[3] = &unk_263F93CA8;
  objc_copyWeak(&v7, &location);
  [(AACustodianController *)custodianController removeCustodian:custodianshipID completion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __58__AAUICustodianSetupFlowController__cancelCustodianInvite__block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __58__AAUICustodianSetupFlowController__cancelCustodianInvite__block_invoke_cold_1();
    }

    id v7 = objc_loadWeakRetained(v4);
    [v7 _sendEscapeOfferSelectedEvent:*MEMORY[0x263F25BF8]];

    [WeakRetained _hideActivityIndicator];
    uint64_t v11 = *MEMORY[0x263F08608];
    v12[0] = v3;
    id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  else
  {
    id v9 = objc_loadWeakRetained(v4);
    [v9 _sendEscapeOfferSelectedEvent:*MEMORY[0x263F25BF8]];

    [WeakRetained _hideActivityIndicator];
    id v8 = 0;
  }
  id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F342B0] code:-5307 userInfo:v8];
  [WeakRetained _dismissWithError:v10];
}

- (void)_dismissWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing setup flow controller with error=%@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__AAUICustodianSetupFlowController__dismissWithError___block_invoke;
  v7[3] = &unk_263F926B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __54__AAUICustodianSetupFlowController__dismissWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  id v4 = [*(id *)(a1 + 32) delegate];
  id v8 = v4;
  if (v3)
  {
    [v4 custodianSetupFlowControllerDidFinish:*(void *)(a1 + 32) withError:*(void *)(a1 + 40)];
  }
  else
  {
    char v5 = objc_opt_respondsToSelector();

    id v6 = *(void **)(a1 + 32);
    if (v5)
    {
      id v8 = [v6 delegate];
      id v7 = [*(id *)(a1 + 32) navigationController];
      [v8 custodianSetupFlowControllerDidFinish:v7];
    }
    else
    {
      id v8 = [v6 navigationController];
      [v8 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)_dismissWithCancel
{
  id v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F342B0] code:-5307 userInfo:0];
  [(AAUICustodianSetupFlowController *)self _dismissWithError:v3];
}

- (void)_dismissCFUIfNeeded
{
  id v2 = objc_alloc_init(MEMORY[0x263F25868]);
  uint64_t v3 = *MEMORY[0x263F25670];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke;
  v5[3] = &unk_263F944B0;
  id v6 = v2;
  id v4 = v2;
  [v4 pendingFollowUpWithIdentifier:v3 completion:v5];
}

void __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = _AAUILogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v5) {
      __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke_cold_2();
    }

    [*(id *)(a1 + 32) dismissFollowUpWithIdentifier:*MEMORY[0x263F25670] completion:&__block_literal_global_21];
  }
  else
  {
    if (v5) {
      __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke_cold_1();
    }
  }
}

void __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke_110(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke_110_cold_1();
    }
  }
}

- (void)_removeRecoveryKeyAndDismissCFUIfNeeded
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    id v6 = [v5 followUpUniqueIdentifier];
    int v7 = [v6 isEqualToString:@"com.apple.AAFollowUpIdentifier.RecoveryKeyMismatch"];

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 custodianSetupFlowControllerRecoveryContactInviteSent];
    }
  }
}

- (void)_showActivityIndicator
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__AAUICustodianSetupFlowController__showActivityIndicator__block_invoke;
  block[3] = &unk_263F92168;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__AAUICustodianSetupFlowController__showActivityIndicator__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) navigationController];
  objc_msgSend(v1, "aaui_showActivityIndicator");
}

- (void)_hideActivityIndicator
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__AAUICustodianSetupFlowController__hideActivityIndicator__block_invoke;
  block[3] = &unk_263F92168;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__AAUICustodianSetupFlowController__hideActivityIndicator__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) navigationController];
  objc_msgSend(v1, "aaui_hideActivityIndicator");
}

- (void)inviteMessageFlowDidFinish:(id)a3
{
  [(AAUICustodianSetupFlowController *)self _removeRecoveryKeyAndDismissCFUIfNeeded];
  [(AAUICustodianSetupFlowController *)self _dismissWithError:0];
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (BOOL)isWalrusEnabled
{
  return self->_isWalrusEnabled;
}

- (void)setIsWalrusEnabled:(BOOL)a3
{
  self->_isWalrusEnabled = a3;
}

- (BOOL)forceInlinePresentation
{
  return self->_forceInlinePresentation;
}

- (void)setForceInlinePresentation:(BOOL)a3
{
  self->_forceInlinePresentation = a3;
}

- (AAUICustodianSetupFlowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUICustodianSetupFlowControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
}

- (UIViewController)presentedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentedViewController:(id)a3
{
}

- (BOOL)preValidate
{
  return self->_preValidate;
}

- (void)setPreValidate:(BOOL)a3
{
  self->_preValidate = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedViewController);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_dtoHelper, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_chooseContactController, 0);
  objc_storeStrong((id *)&self->_inviteFlowController, 0);
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_custodianshipID, 0);
  objc_storeStrong((id *)&self->_invitedContact, 0);
  objc_storeStrong((id *)&self->_authResults, 0);
  objc_storeStrong((id *)&self->_firstTimeSetupVC, 0);
  objc_storeStrong((id *)&self->_custodianController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __67__AAUICustodianSetupFlowController__continueAddRecoveryContactFlow__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Unhandled error %@. Re-enabling primary button on main queue", v2, v3, v4, v5, v6);
}

- (void)_validateAccountWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Failed to get a cloud account from the accounts manager %@", v2, v3, v4, v5, v6);
}

- (void)_validateAccountWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_209754000, v0, OS_LOG_TYPE_ERROR, "Account manager is nil. We will not be able to get an account", v1, 2u);
}

void __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Custodian setup failed: %@", v2, v3, v4, v5, v6);
}

void __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_96_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Can't add self. %@", v2, v3, v4, v5, v6);
}

void __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_96_cold_2()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Can't add existing custodian again %@", v2, v3, v4, v5, v6);
}

void __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_96_cold_3()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Max Custodian Limit reached. Showing localized error message in alert from server error: %@", v2, v3, v4, v5, v6);
}

void __58__AAUICustodianSetupFlowController__cancelCustodianInvite__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Custodianship revoke failed: %@", v2, v3, v4, v5, v6);
}

void __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(&dword_209754000, v0, OS_LOG_TYPE_DEBUG, "No previous %@ CFU exists. Nothing to dismiss", v1, 0xCu);
}

void __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(&dword_209754000, v0, OS_LOG_TYPE_DEBUG, "CFU %@ exists. Dismissing...", v1, 0xCu);
}

void __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke_110_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Error occurred while dismissing the followup - %@", v2, v3, v4, v5, v6);
}

@end