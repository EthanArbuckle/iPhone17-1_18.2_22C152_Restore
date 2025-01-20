@interface CDPUIEDPRecoveryTokenFlowCoordinator
- (BOOL)_canOfferRPD;
- (BOOL)_fullDataAccessRestored;
- (BOOL)enteredAfterFailedCDPRecovery;
- (CDPContext)cdpContext;
- (CDPRPDLedger)rpdLedger;
- (CDPRemoteDeviceSecretValidator)validator;
- (CDPUIEDPRecoveryTokenFlowCoordinator)initWithValidator:(id)a3 rpdLedger:(id)a4 cdpContext:(id)a5 showCancel:(BOOL)a6 delegate:(id)a7;
- (CDPUIEDPRecoveryTokenFlowCoordinatorDelegate)delegate;
- (UIViewController)firstViewController;
- (void)_accessDataLaterSelectedFromSender:(id)a3;
- (void)_backButtonInvoked;
- (void)_canOfferRPD;
- (void)_cancelButtonInvoked;
- (void)_presentDontHaveKeyAlertOnViewController:(id)a3;
- (void)_presentRecoveryFailedAlertOnViewController:(id)a3 title:(id)a4 message:(id)a5;
- (void)_rpdSelectedFromSender:(id)a3;
- (void)_showSuccessScreen;
- (void)recoveryTokenEntryViewController:(id)a3 didRequestValidationForToken:(id)a4;
- (void)recoveryTokenEntryViewControllerDidAppear:(id)a3;
- (void)recoveryTokenIntroViewDidAppear;
- (void)recoveryTokenIntroViewDidSelectContinue;
- (void)recoveryTokenIntroViewDidSelectDontHaveKey;
- (void)setEnteredAfterFailedCDPRecovery:(BOOL)a3;
@end

@implementation CDPUIEDPRecoveryTokenFlowCoordinator

- (CDPUIEDPRecoveryTokenFlowCoordinator)initWithValidator:(id)a3 rpdLedger:(id)a4 cdpContext:(id)a5 showCancel:(BOOL)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CDPUIEDPRecoveryTokenFlowCoordinator;
  v17 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_validator, a3);
    objc_storeStrong((id *)&v18->_rpdLedger, a4);
    objc_storeStrong((id *)&v18->_cdpContext, a5);
    v18->_isHSA2Enabled = [v15 isHSA2Account];
    objc_storeWeak((id *)&v18->_delegate, v16);
    v18->_showCancel = a6;
    uint64_t v19 = +[CDPStateSwiftUIProvider makeSwiftUIViewForEDPTokenIntroScreenWithDelegate:v18 isHSA2Enabled:v18->_isHSA2Enabled];
    firstViewController = v18->_firstViewController;
    v18->_firstViewController = (UIViewController *)v19;

    v21 = [MEMORY[0x263F34370] sharedInstance];
    [v21 fetchConfig];
  }
  return v18;
}

- (void)recoveryTokenIntroViewDidAppear
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2187CF000, v0, v1, "Could not insert recovery token into RPD ledger because the ledger was nil.", v2, v3, v4, v5, v6);
}

void __71__CDPUIEDPRecoveryTokenFlowCoordinator_recoveryTokenIntroViewDidAppear__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _backButtonInvoked];
}

- (void)recoveryTokenIntroViewDidSelectContinue
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self cdpContext];
  +[CDPUIEDPRecoveryTokenFlowEventReporter sendIntroViewEscapeOfferSelectedEventForOffer:*MEMORY[0x263F34868] context:v3];

  uint64_t v4 = objc_alloc_init(CDPUIEDPRecoveryTokenEntryViewModel);
  uint64_t v5 = [[CDPUIEDPRecoveryTokeniOSEntryViewController alloc] initWithViewModel:v4 delegate:self];
  uint8_t v6 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self firstViewController];
  v7 = [v6 navigationController];

  v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v15 = v5;
    __int16 v16 = 2112;
    v17 = v4;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_2187CF000, v8, OS_LOG_TYPE_DEFAULT, "User selected Continue on recovery token intro screen. Pushing entry view controller %@ with view model %@ on nav controller %@", buf, 0x20u);
  }

  [v7 pushViewController:v5 animated:1];
  objc_initWeak((id *)buf, self);
  v9 = (void *)MEMORY[0x263F823D0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__CDPUIEDPRecoveryTokenFlowCoordinator_recoveryTokenIntroViewDidSelectContinue__block_invoke;
  v12[3] = &unk_26433DA10;
  objc_copyWeak(&v13, (id *)buf);
  v10 = [v9 actionWithHandler:v12];
  v11 = [(OBBaseWelcomeController *)v5 navigationItem];
  [v11 setBackAction:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __79__CDPUIEDPRecoveryTokenFlowCoordinator_recoveryTokenIntroViewDidSelectContinue__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _backButtonInvoked];
}

- (void)recoveryTokenIntroViewDidSelectDontHaveKey
{
  uint64_t v3 = *MEMORY[0x263F34960];
  uint64_t v4 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self cdpContext];
  +[CDPUIEDPRecoveryTokenFlowEventReporter sendIntroViewEscapeOfferSelectedEventForOffer:v3 context:v4];

  id v5 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self firstViewController];
  [(CDPUIEDPRecoveryTokenFlowCoordinator *)self _presentDontHaveKeyAlertOnViewController:v5];
}

- (void)recoveryTokenEntryViewControllerDidAppear:(id)a3
{
  id v3 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self cdpContext];
  +[CDPUIEDPRecoveryTokenFlowEventReporter sendTokenEntryViewAppearedEventWithContext:v3];
}

- (void)recoveryTokenEntryViewController:(id)a3 didRequestValidationForToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F34868];
  v9 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self cdpContext];
  +[CDPUIEDPRecoveryTokenFlowEventReporter sendTokenEntryEscapeOfferSelectedEventForOffer:v8 context:v9];

  [v6 beginWaitingForValidation];
  objc_initWeak(&location, self);
  v10 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self validator];
  v11 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self cdpContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __102__CDPUIEDPRecoveryTokenFlowCoordinator_recoveryTokenEntryViewController_didRequestValidationForToken___block_invoke;
  v13[3] = &unk_26433D620;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  id v14 = v12;
  [v10 validateEDPRecoveryToken:v7 withContext:v11 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __102__CDPUIEDPRecoveryTokenFlowCoordinator_recoveryTokenEntryViewController_didRequestValidationForToken___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __102__CDPUIEDPRecoveryTokenFlowCoordinator_recoveryTokenEntryViewController_didRequestValidationForToken___block_invoke_2;
  v9[3] = &unk_26433DA38;
  id v7 = *(id *)(a1 + 32);
  char v13 = a2;
  id v10 = v7;
  id v11 = WeakRetained;
  id v12 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __102__CDPUIEDPRecoveryTokenFlowCoordinator_recoveryTokenEntryViewController_didRequestValidationForToken___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) endWaitingForValidation];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = _CDPLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2187CF000, v2, OS_LOG_TYPE_DEFAULT, "Recovery token was valid! Showing success screen", buf, 2u);
    }

    [*(id *)(a1 + 40) _showSuccessScreen];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "cdp_isCDPErrorWithCode:", -7207);
    CDPLocalizedStringInTable();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = CDPLocalizedStringInTable();
    [*(id *)(a1 + 40) _presentRecoveryFailedAlertOnViewController:*(void *)(a1 + 32) title:v4 message:v3];
  }
}

- (void)_showSuccessScreen
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2187CF000, v0, v1, "Something went wrong while presenting the success screen. A navigation controller should have been available.", v2, v3, v4, v5, v6);
}

void __58__CDPUIEDPRecoveryTokenFlowCoordinator__showSuccessScreen__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__CDPUIEDPRecoveryTokenFlowCoordinator__showSuccessScreen__block_invoke_cold_1();
  }

  uint64_t v3 = [WeakRetained delegate];
  [v3 recoveryTokenFlowCoordinatorDidSuccessfullyFinish:WeakRetained];
}

uint64_t __58__CDPUIEDPRecoveryTokenFlowCoordinator__showSuccessScreen__block_invoke_45(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_fullDataAccessRestored
{
  uint64_t v3 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self cdpContext];
  int v4 = [v3 isHSA2Account];

  if (v4) {
    return ![(CDPUIEDPRecoveryTokenFlowCoordinator *)self enteredAfterFailedCDPRecovery];
  }
  else {
    return 1;
  }
}

- (void)_presentRecoveryFailedAlertOnViewController:(id)a3 title:(id)a4 message:(id)a5
{
  id v11 = a3;
  id v7 = [MEMORY[0x263F82418] alertControllerWithTitle:a4 message:a5 preferredStyle:1];
  id v8 = (void *)MEMORY[0x263F82400];
  v9 = CDPLocalizedString();
  id v10 = [v8 actionWithTitle:v9 style:1 handler:0];

  [v7 addAction:v10];
  [v11 presentViewController:v7 animated:1 completion:0];
}

- (void)_presentDontHaveKeyAlertOnViewController:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22 = CDPLocalizedStringInTable();
  v21 = CDPLocalizedStringInTable();
  uint64_t v20 = CDPLocalizedStringInTable();
  uint64_t v17 = CDPLocalizedStringInTable();
  uint64_t v19 = CDPLocalizedString();
  BOOL v5 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self _canOfferRPD];
  objc_initWeak(&location, self);
  uint8_t v6 = [MEMORY[0x263F82418] alertControllerWithTitle:v22 message:v21 preferredStyle:1];
  id v7 = (void *)MEMORY[0x263F82400];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __81__CDPUIEDPRecoveryTokenFlowCoordinator__presentDontHaveKeyAlertOnViewController___block_invoke;
  v26[3] = &unk_26433DA80;
  objc_copyWeak(&v28, &location);
  id v8 = v4;
  id v27 = v8;
  v9 = [v7 actionWithTitle:v20 style:0 handler:v26];
  [v6 addAction:v9];
  if (v5)
  {
    id v10 = (void *)MEMORY[0x263F82400];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __81__CDPUIEDPRecoveryTokenFlowCoordinator__presentDontHaveKeyAlertOnViewController___block_invoke_2;
    v23[3] = &unk_26433DA80;
    objc_copyWeak(&v25, &location);
    id v24 = v8;
    id v11 = [v10 actionWithTitle:v17 style:0 handler:v23];
    [v6 addAction:v11];

    objc_destroyWeak(&v25);
  }
  id v12 = objc_msgSend(MEMORY[0x263F82400], "actionWithTitle:style:handler:", v19, 1, 0, v17);
  [v6 addAction:v12];
  char v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v6 actions];
    *(_DWORD *)buf = 138412802;
    v31 = v6;
    __int16 v32 = 2112;
    id v33 = v8;
    __int16 v34 = 2112;
    v35 = v14;
    _os_log_impl(&dword_2187CF000, v13, OS_LOG_TYPE_DEFAULT, "Presenting Don't Have Key alert %@ on view controller %@ with actions %@", buf, 0x20u);
  }
  id v15 = v8;
  [v15 presentViewController:v6 animated:1 completion:0];
  __int16 v16 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self cdpContext];
  +[CDPUIEDPRecoveryTokenFlowEventReporter sendDontHaveKeyAlertPresentedEventIncludingRPD:v5 context:v16];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __81__CDPUIEDPRecoveryTokenFlowCoordinator__presentDontHaveKeyAlertOnViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _accessDataLaterSelectedFromSender:*(void *)(a1 + 32)];
}

void __81__CDPUIEDPRecoveryTokenFlowCoordinator__presentDontHaveKeyAlertOnViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _rpdSelectedFromSender:*(void *)(a1 + 32)];
}

- (void)_cancelButtonInvoked
{
  uint64_t v3 = *MEMORY[0x263F34858];
  id v4 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self cdpContext];
  +[CDPUIEDPRecoveryTokenFlowEventReporter sendIntroViewEscapeOfferSelectedEventForOffer:v3 context:v4];

  id v5 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self delegate];
  [v5 recoveryTokenFlowCoordinatorDidSelectCancel:self];
}

- (void)_backButtonInvoked
{
  uint64_t v3 = *MEMORY[0x263F34850];
  id v4 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self cdpContext];
  +[CDPUIEDPRecoveryTokenFlowEventReporter sendIntroViewEscapeOfferSelectedEventForOffer:v3 context:v4];

  id v7 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self firstViewController];
  id v5 = [v7 navigationController];
  id v6 = (id)[v5 popViewControllerAnimated:1];
}

- (BOOL)_canOfferRPD
{
  uint64_t v3 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self rpdLedger];

  if (v3)
  {
    id v4 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self rpdLedger];
    char v5 = [v4 canOfferRPD];

    return v5;
  }
  else
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[CDPUIEDPRecoveryTokenFlowCoordinator _canOfferRPD]();
    }

    return 0;
  }
}

- (void)_accessDataLaterSelectedFromSender:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_2187CF000, v5, OS_LOG_TYPE_DEFAULT, "User chose to access data later from recovery token screen %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self delegate];
  [v6 recoveryTokenFlowCoordinatorDidSelectAccessDataLater:self];
}

- (void)_rpdSelectedFromSender:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_2187CF000, v5, OS_LOG_TYPE_DEFAULT, "User chose to begin RPD flow from recovery token screen %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(CDPUIEDPRecoveryTokenFlowCoordinator *)self delegate];
  [v6 recoveryTokenFlowCoordinatorDidSelectResetProtectedData:self];
}

- (BOOL)enteredAfterFailedCDPRecovery
{
  return self->_enteredAfterFailedCDPRecovery;
}

- (void)setEnteredAfterFailedCDPRecovery:(BOOL)a3
{
  self->_enteredAfterFailedCDPRecovery = a3;
}

- (UIViewController)firstViewController
{
  return self->_firstViewController;
}

- (CDPRemoteDeviceSecretValidator)validator
{
  return self->_validator;
}

- (CDPRPDLedger)rpdLedger
{
  return self->_rpdLedger;
}

- (CDPContext)cdpContext
{
  return self->_cdpContext;
}

- (CDPUIEDPRecoveryTokenFlowCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CDPUIEDPRecoveryTokenFlowCoordinatorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_rpdLedger, 0);
  objc_storeStrong((id *)&self->_validator, 0);

  objc_storeStrong((id *)&self->_firstViewController, 0);
}

void __58__CDPUIEDPRecoveryTokenFlowCoordinator__showSuccessScreen__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_2187CF000, v0, OS_LOG_TYPE_DEBUG, "User selected final button in recovery token flow.", v1, 2u);
}

- (void)_canOfferRPD
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2187CF000, v0, v1, "Could not determine if RPD should be offered in recovery token don't have key alert because ledger was nil. Will not offer RPD.", v2, v3, v4, v5, v6);
}

@end